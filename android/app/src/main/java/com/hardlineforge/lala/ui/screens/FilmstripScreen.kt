package com.hardlineforge.lala.ui.screens

import android.graphics.BitmapFactory
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
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
import java.io.File
import kotlinx.coroutines.Dispatchers
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
