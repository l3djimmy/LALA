package com.hardlineforge.lala.media

import android.content.Context
import android.media.MediaCodec
import android.media.MediaExtractor
import android.media.MediaFormat
import android.media.MediaMetadataRetriever
import android.net.Uri
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.io.File
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class VideoFrameExtractor @Inject constructor(
    @ApplicationContext private val context: Context
) {
    /**
     * Extracts frames from a video at the specified FPS and saves them as JPEG files.
     *
     * @param videoUri URI of the source video
     * @param outputDir Directory to save extracted frames
     * @param fps Frames per second: 1, 2, 5, or 10
     * @return List of saved frame file paths
     */
    suspend fun extractFrames(
        videoUri: Uri,
        outputDir: File,
        fps: Int
    ): List<FrameResult> = withContext(Dispatchers.IO) {
        val retriever = MediaMetadataRetriever()
        retriever.setDataSource(context, videoUri)

        val durationUs = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION)
            ?.toLongOrNull()?.times(1000) ?: 0L

        if (durationUs <= 0) {
            retriever.release()
            return@withContext emptyList()
        }

        val intervalUs = 1_000_000L / fps.coerceIn(1, 30)
        val frames = mutableListOf<FrameResult>()

        var timeUs = 0L
        var frameNumber = 0
        outputDir.mkdirs()

        while (timeUs <= durationUs) {
            val bitmap = retriever.getFrameAtTime(timeUs, MediaMetadataRetriever.OPTION_CLOSEST)
            if (bitmap != null) {
                val file = File(outputDir, "frame_${String.format("%04d", frameNumber)}.jpg")
                file.outputStream().use { out ->
                    bitmap.compress(android.graphics.Bitmap.CompressFormat.JPEG, 85, out)
                }
                bitmap.recycle()
                frames.add(FrameResult(
                    frameNumber = frameNumber,
                    timeOffsetMs = (timeUs / 1000).toInt(),
                    filePath = file.absolutePath
                ))
            }
            timeUs += intervalUs
            frameNumber++
        }

        retriever.release()
        frames
    }

    data class FrameResult(
        val frameNumber: Int,
        val timeOffsetMs: Int,
        val filePath: String
    )
}
