package com.hardlineforge.lala.pdf

import android.content.Context
import com.hardlineforge.lala.data.LogEntry
import com.hardlineforge.lala.data.LogRepository
import com.hardlineforge.lala.data.UserPreferences
import com.hardlineforge.lala.util.DebugLog
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.launch
import java.io.File
import java.time.Instant
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Runs PDF exports on the app-lifetime scope so they keep going (with live progress)
 * through screen rotation and navigation. State is a singleton StateFlow the preview
 * screen re-attaches to whenever it (re)composes.
 */
@Singleton
class ExportManager @Inject constructor(
    @ApplicationContext private val context: Context,
    private val repo: LogRepository,
    private val pdfGenerator: PdfGenerator,
    private val userPreferences: UserPreferences,
    private val appScope: CoroutineScope
) {
    sealed interface State {
        data object Idle : State
        data class Running(val done: Int, val total: Int, val mode: ExportMode) : State
        data class Done(val file: File, val mode: ExportMode, val sizeBytes: Long) : State
        data class Failed(val message: String) : State
    }

    companion object {
        /** Warn before embedding more than this much video into a Digital PDF. */
        const val DIGITAL_SIZE_CAP_BYTES: Long = 200L * 1024 * 1024
    }

    private val _state = MutableStateFlow<State>(State.Idle)
    val state: StateFlow<State> = _state.asStateFlow()

    fun reset() {
        if (_state.value !is State.Running) _state.value = State.Idle
    }

    /** Resolves the entries an export covers: a single entry, a date range, or everything. */
    suspend fun entriesFor(entryId: String?, startMs: Long?, endMs: Long?): List<LogEntry> = when {
        entryId != null -> listOfNotNull(repo.getEntryById(entryId))
        startMs != null && endMs != null ->
            repo.getEntriesByDateRange(Instant.ofEpochMilli(startMs), Instant.ofEpochMilli(endMs)).first()
        else -> repo.getAllEntries().first()
    }

    /** Total on-disk bytes of all videos in [entries] — the Digital-mode embed cost. */
    suspend fun totalVideoBytes(entries: List<LogEntry>): Long =
        entries.sumOf { entry ->
            repo.getVideos(entry.id).sumOf { File(it.uri).length().coerceAtLeast(0L) }
        }

    fun start(mode: ExportMode, entryId: String?, startMs: Long?, endMs: Long?) {
        if (_state.value is State.Running) return
        _state.value = State.Running(0, 1, mode)
        appScope.launch {
            try {
                val entries = entriesFor(entryId, startMs, endMs)
                val isPremium = userPreferences.isPremium.first()
                val dir = File(context.cacheDir, "exports").apply { mkdirs() }
                // Keep the cache tidy: exports are regenerated on demand.
                dir.listFiles()?.filter { it.name.endsWith(".pdf") }?.forEach { it.delete() }
                val file = File(dir, "Lala_Report_${System.currentTimeMillis()}_${mode.name.lowercase()}.pdf")

                DebugLog.log("Export", "starting ${mode.name} export: ${entries.size} entr(ies)")
                _state.value = State.Running(0, entries.size.coerceAtLeast(1), mode)
                pdfGenerator.generate(entries, file, isPremium, mode) { done, total ->
                    _state.value = State.Running(done, total, mode)
                }
                DebugLog.log("Export", "${mode.name} export done: ${file.absolutePath} (${file.length()} bytes)")
                _state.value = State.Done(file, mode, file.length())
            } catch (e: Exception) {
                DebugLog.error("Export", "${mode.name} export failed", e)
                _state.value = State.Failed(e.message ?: "Export failed")
            }
        }
    }
}
