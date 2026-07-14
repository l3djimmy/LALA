package com.hardlineforge.lala.ui.screens

import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Paint
import android.widget.Toast
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.FileDownload
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.asImageBitmap
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavHostController
import com.hardlineforge.lala.data.VideoFrame
import com.hardlineforge.lala.ui.viewmodel.LalaViewModel
import com.hardlineforge.lala.util.MediaExporter
import java.io.File
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun FilmstripScreen(
    navController: NavHostController,
    videoId: String,
    vm: LalaViewModel = hiltViewModel()
) {
    val context = androidx.compose.ui.platform.LocalContext.current
    val scope = rememberCoroutineScope()

    var frames by remember { mutableStateOf(listOf<VideoFrame>()) }
    var isExtracting by remember { mutableStateOf(false) }
    var isExporting by remember { mutableStateOf(false) }
    var selectedFrame by remember { mutableStateOf<VideoFrame?>(null) }

    LaunchedEffect(videoId) {
        val existing = vm.getVideoFrames(videoId)
        if (existing.isNotEmpty()) {
            frames = existing
        } else {
            val video = vm.getVideoById(videoId)
            if (video != null) {
                isExtracting = true
                val outDir = File(context.filesDir, "frames/$videoId").apply { mkdirs() }
                val results = withContext(Dispatchers.IO) {
                    vm.frameExtractor.extractFrames(
                        android.net.Uri.fromFile(File(video.uri)),
                        outDir,
                        fps = 2
                    )
                }
                results.forEach { r ->
                    vm.addVideoFrame(
                        VideoFrame(
                            videoId = videoId,
                            frameNumber = r.frameNumber,
                            timeOffsetMs = r.timeOffsetMs,
                            uri = r.filePath
                        )
                    )
                }
                frames = vm.getVideoFrames(videoId)
                isExtracting = false
            }
        }
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Filmstrip") },
                navigationIcon = {
                    IconButton(onClick = { navController.popBackStack() }) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
                    }
                },
                actions = {
                    IconButton(
                        onClick = {
                            if (frames.isNotEmpty() && !isExporting) {
                                isExporting = true
                                scope.launch {
                                    val result = withContext(Dispatchers.IO) {
                                        exportFilmstrip(context, frames)
                                    }
                                    isExporting = false
                                    val message = if (result != null) {
                                        "Filmstrip saved to $result"
                                    } else {
                                        "Failed to export filmstrip"
                                    }
                                    Toast.makeText(context, message, Toast.LENGTH_LONG).show()
                                }
                            }
                        },
                        enabled = frames.isNotEmpty() && !isExporting
                    ) {
                        if (isExporting) {
                            CircularProgressIndicator(modifier = Modifier.size(20.dp), strokeWidth = 2.dp)
                        } else {
                            Icon(Icons.Filled.FileDownload, "Export filmstrip")
                        }
                    }
                }
            )
        }
    ) { padding ->
        Box(modifier = Modifier.fillMaxSize().padding(padding)) {
            if (isExtracting) {
                Column(
                    modifier = Modifier.align(Alignment.Center),
                    horizontalAlignment = Alignment.CenterHorizontally,
                    verticalArrangement = Arrangement.spacedBy(12.dp)
                ) {
                    CircularProgressIndicator()
                    Text("Extracting frames…", style = MaterialTheme.typography.bodyLarge)
                }
            } else if (frames.isEmpty()) {
                Text(
                    "No frames available",
                    modifier = Modifier.align(Alignment.Center),
                    style = MaterialTheme.typography.bodyLarge
                )
            } else {
                LazyRow(
                    modifier = Modifier.fillMaxSize(),
                    horizontalArrangement = Arrangement.spacedBy(4.dp),
                    contentPadding = PaddingValues(8.dp)
                ) {
                    items(frames, key = { it.id }) { frame ->
                        FrameThumbnail(
                            frame = frame,
                            onClick = { selectedFrame = frame }
                        )
                    }
                }
            }
        }
    }

    // Fullscreen frame viewer
    selectedFrame?.let { sf ->
        AlertDialog(
            onDismissRequest = { selectedFrame = null },
            title = { Text("Frame ${sf.frameNumber} — ${formatMs(sf.timeOffsetMs)}") },
            text = {
                val bmp = remember(sf.uri) {
                    BitmapFactory.decodeFile(sf.uri)?.asImageBitmap()
                }
                if (bmp != null) {
                    Image(
                        bitmap = bmp,
                        contentDescription = "Frame",
                        modifier = Modifier.fillMaxWidth().aspectRatio(16f / 9f),
                        contentScale = ContentScale.Fit
                    )
                } else {
                    Text("Failed to load frame")
                }
            },
            confirmButton = {
                TextButton(onClick = { selectedFrame = null }) { Text("Close") }
            }
        )
    }
}

@Composable
private fun FrameThumbnail(frame: VideoFrame, onClick: () -> Unit) {
    val bmp = remember(frame.uri) {
        BitmapFactory.decodeFile(frame.uri)?.asImageBitmap()
    }
    Column(
        horizontalAlignment = Alignment.CenterHorizontally,
        modifier = Modifier.width(120.dp)
    ) {
        Box(
            modifier = Modifier
                .size(width = 120.dp, height = 68.dp)
                .background(MaterialTheme.colorScheme.surfaceVariant)
                .clickable { onClick() }
        ) {
            if (bmp != null) {
                Image(
                    bitmap = bmp,
                    contentDescription = "Frame ${frame.frameNumber}",
                    modifier = Modifier.fillMaxSize(),
                    contentScale = ContentScale.Crop
                )
            }
        }
        Spacer(modifier = Modifier.height(4.dp))
        Text(
            formatMs(frame.timeOffsetMs),
            style = MaterialTheme.typography.labelSmall
        )
    }
}

private fun formatMs(ms: Int): String {
    val totalSeconds = ms / 1000
    val minutes = totalSeconds / 60
    val seconds = totalSeconds % 60
    return "%d:%02d".format(minutes, seconds)
}

/** Composites the extracted frames into one horizontal strip image, saves it to Downloads, and returns where it landed. */
private fun exportFilmstrip(context: android.content.Context, frames: List<VideoFrame>): String? {
    val frameHeight = 240
    val labelHeight = 40
    val spacing = 4
    val labelPaint = Paint().apply {
        color = Color.WHITE
        textSize = 22f
        textAlign = Paint.Align.CENTER
        isAntiAlias = true
    }

    val decoded = frames.mapNotNull { frame ->
        BitmapFactory.decodeFile(frame.uri)?.let { bmp ->
            val scale = frameHeight.toFloat() / bmp.height
            val scaledWidth = (bmp.width * scale).toInt().coerceAtLeast(1)
            val scaled = Bitmap.createScaledBitmap(bmp, scaledWidth, frameHeight, true)
            if (scaled !== bmp) bmp.recycle()
            Triple(scaled, scaledWidth, frame.timeOffsetMs)
        }
    }
    if (decoded.isEmpty()) return null

    val totalWidth = decoded.sumOf { it.second } + spacing * (decoded.size + 1)
    val strip = Bitmap.createBitmap(totalWidth, frameHeight + labelHeight, Bitmap.Config.ARGB_8888)
    val canvas = Canvas(strip)
    canvas.drawColor(Color.BLACK)

    var x = spacing
    decoded.forEach { (bmp, width, timeOffsetMs) ->
        canvas.drawBitmap(bmp, x.toFloat(), 0f, null)
        canvas.drawText(formatMs(timeOffsetMs), x + width / 2f, frameHeight + labelHeight - 12f, labelPaint)
        x += width + spacing
        bmp.recycle()
    }

    return try {
        val bytes = java.io.ByteArrayOutputStream().use { out ->
            strip.compress(Bitmap.CompressFormat.PNG, 100, out)
            out.toByteArray()
        }
        MediaExporter.saveToDownloads(
            context,
            "Lala_Filmstrip_${System.currentTimeMillis()}.png",
            "image/png",
            bytes
        )
    } catch (_: Exception) {
        null
    } finally {
        strip.recycle()
    }
}
