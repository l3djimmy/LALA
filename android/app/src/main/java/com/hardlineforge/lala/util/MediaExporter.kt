package com.hardlineforge.lala.util

import android.content.ContentValues
import android.content.Context
import android.os.Build
import android.os.Environment
import android.provider.MediaStore
import java.io.File
import java.io.FileOutputStream

object MediaExporter {

    /**
     * Saves [bytes] into the device's Downloads location and returns a user-facing
     * description of where it landed, or null on failure.
     *
     * Raw writes to the public Downloads directory stopped working with scoped storage
     * (API 29), so newer devices go through MediaStore; older ones use the legacy path
     * with an app-private fallback.
     */
    /** Streaming variant of [saveToDownloads] for large files (no full in-memory copy). */
    fun saveFileToDownloads(context: Context, source: File, mimeType: String): String? {
        val fileName = source.name
        return try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                val values = ContentValues().apply {
                    put(MediaStore.MediaColumns.DISPLAY_NAME, fileName)
                    put(MediaStore.MediaColumns.MIME_TYPE, mimeType)
                    put(MediaStore.MediaColumns.RELATIVE_PATH, Environment.DIRECTORY_DOWNLOADS)
                }
                val uri = context.contentResolver.insert(MediaStore.Downloads.EXTERNAL_CONTENT_URI, values)
                    ?: return null
                context.contentResolver.openOutputStream(uri)?.use { out ->
                    source.inputStream().use { it.copyTo(out) }
                } ?: return null
                DebugLog.log("Export", "saved $fileName (${source.length()} bytes) via MediaStore -> Downloads")
                "Downloads/$fileName"
            } else {
                val downloads = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS)
                val target = if (downloads != null && (downloads.exists() || downloads.mkdirs()) && downloads.canWrite()) {
                    File(downloads, fileName)
                } else {
                    File(context.getExternalFilesDir(null), fileName)
                }
                FileOutputStream(target).use { out ->
                    source.inputStream().use { it.copyTo(out) }
                }
                DebugLog.log("Export", "saved $fileName (${source.length()} bytes) -> ${target.absolutePath}")
                target.absolutePath
            }
        } catch (e: Exception) {
            DebugLog.error("Export", "failed to save $fileName", e)
            null
        }
    }

    fun saveToDownloads(context: Context, fileName: String, mimeType: String, bytes: ByteArray): String? {
        return try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                val values = ContentValues().apply {
                    put(MediaStore.MediaColumns.DISPLAY_NAME, fileName)
                    put(MediaStore.MediaColumns.MIME_TYPE, mimeType)
                    put(MediaStore.MediaColumns.RELATIVE_PATH, Environment.DIRECTORY_DOWNLOADS)
                }
                val uri = context.contentResolver.insert(MediaStore.Downloads.EXTERNAL_CONTENT_URI, values)
                    ?: return null
                context.contentResolver.openOutputStream(uri)?.use { it.write(bytes) }
                    ?: return null
                DebugLog.log("Export", "saved $fileName (${bytes.size} bytes) via MediaStore -> Downloads")
                "Downloads/$fileName"
            } else {
                val downloads = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS)
                val target = if (downloads != null && (downloads.exists() || downloads.mkdirs()) && downloads.canWrite()) {
                    File(downloads, fileName)
                } else {
                    File(context.getExternalFilesDir(null), fileName)
                }
                FileOutputStream(target).use { it.write(bytes) }
                DebugLog.log("Export", "saved $fileName (${bytes.size} bytes) -> ${target.absolutePath}")
                target.absolutePath
            }
        } catch (e: Exception) {
            DebugLog.error("Export", "failed to save $fileName", e)
            null
        }
    }
}
