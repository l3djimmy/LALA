package com.hardlineforge.lala

import android.app.Application
import android.preference.PreferenceManager
import android.util.Log
import com.hardlineforge.lala.data.LogRepository
import com.hardlineforge.lala.util.DebugLog
import dagger.hilt.android.HiltAndroidApp
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.launch
import org.osmdroid.config.Configuration
import java.io.File
import java.time.Instant
import javax.inject.Inject

@HiltAndroidApp
class LalaApplication : Application() {

    @Inject
    lateinit var repository: LogRepository

    private val appScope = CoroutineScope(SupervisorJob() + Dispatchers.IO)

    override fun onCreate() {
        super.onCreate()
        DebugLog.init(this)
        Configuration.getInstance().load(this, PreferenceManager.getDefaultSharedPreferences(this))
        Configuration.getInstance().userAgentValue = packageName
        Configuration.getInstance().osmdroidTileCache = cacheDir.resolve("osmdroid/tiles")
        installCrashLogger()

        appScope.launch {
            try {
                val recovered = repository.recoverOrphanedMedia()
                if (recovered > 0) {
                    DebugLog.log("Repair", "re-attached $recovered orphaned media item(s) to a 'Recovered media' entry")
                }
            } catch (e: Exception) {
                DebugLog.error("Repair", "orphaned media recovery failed", e)
            }
        }
    }

    /** Logs uncaught exceptions to files so they can be retrieved without adb, then re-throws to the default handler. */
    private fun installCrashLogger() {
        val previousHandler = Thread.getDefaultUncaughtExceptionHandler()
        Thread.setDefaultUncaughtExceptionHandler { thread, throwable ->
            try {
                DebugLog.error("FATAL", "uncaught exception on thread ${thread.name}", throwable)
                val logDir = File(filesDir, "logs").apply { mkdirs() }
                val logFile = File(logDir, "crash_log.txt")
                logFile.appendText(
                    "\n===== ${Instant.now()} =====\n${Log.getStackTraceString(throwable)}\n"
                )
            } catch (_: Exception) {
                // Best-effort only; never let logging itself block the crash handler.
            }
            previousHandler?.uncaughtException(thread, throwable)
        }
    }
}
