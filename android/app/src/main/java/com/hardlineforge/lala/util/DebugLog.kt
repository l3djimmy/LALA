package com.hardlineforge.lala.util

import android.content.Context
import android.util.Log
import java.io.File
import java.time.Instant
import java.time.ZoneId
import java.time.format.DateTimeFormatter

/**
 * Lightweight always-on file logger so users can share what the app actually did
 * (or failed to do) without needing adb. Kept deliberately synchronous and
 * best-effort: logging must never crash or block the app in a noticeable way.
 */
object DebugLog {
    private const val MAX_SIZE_BYTES = 512 * 1024L
    private const val TRIM_TO_BYTES = 256 * 1024

    @Volatile
    private var logFile: File? = null

    private val timestampFmt = DateTimeFormatter.ofPattern("MM-dd HH:mm:ss.SSS")
        .withZone(ZoneId.systemDefault())

    fun init(context: Context) {
        val dir = File(context.filesDir, "logs").apply { mkdirs() }
        logFile = File(dir, "debug_log.txt")
        log("App", "===== app started =====")
    }

    fun file(): File? = logFile

    @Synchronized
    fun log(tag: String, message: String) {
        Log.d("LALA-$tag", message)
        val file = logFile ?: return
        try {
            if (file.exists() && file.length() > MAX_SIZE_BYTES) {
                val tail = file.readText().takeLast(TRIM_TO_BYTES)
                file.writeText("(older log trimmed)\n$tail")
            }
            file.appendText("${timestampFmt.format(Instant.now())} [$tag] $message\n")
        } catch (_: Exception) {
            // Never let logging break the app.
        }
    }

    fun error(tag: String, message: String, t: Throwable? = null) {
        val details = t?.let { "\n${Log.getStackTraceString(it)}" } ?: ""
        log(tag, "ERROR: $message$details")
    }

    @Synchronized
    fun clear() {
        try {
            logFile?.writeText("")
        } catch (_: Exception) {}
        log("App", "log cleared")
    }
}
