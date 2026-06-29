package com.hardlineforge.lala.ui.screens

import android.Manifest
import android.content.Context
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.camera.core.CameraSelector
import androidx.camera.core.ImageCapture
import androidx.camera.core.ImageCaptureException
import androidx.camera.core.Preview as CamPreview
import androidx.camera.lifecycle.ProcessCameraProvider
import androidx.camera.video.FileOutputOptions
import androidx.camera.video.Recording
import androidx.camera.video.VideoRecordEvent
import androidx.camera.video.VideoCapture
import androidx.camera.view.PreviewView
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Cameraswitch
import androidx.compose.material.icons.filled.Close
import androidx.compose.material.icons.filled.PhotoCamera
import androidx.compose.material.icons.filled.Stop
import androidx.compose.material.icons.filled.Videocam
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.platform.LocalLifecycleOwner
import androidx.compose.ui.unit.dp
import androidx.compose.ui.viewinterop.AndroidView
import androidx.core.content.ContextCompat
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavHostController
import com.hardlineforge.lala.data.Photo
import com.hardlineforge.lala.data.Video
import com.hardlineforge.lala.ui.viewmodel.LalaViewModel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.io.File
import java.time.Instant
import java.util.UUID
import java.util.concurrent.Executors

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun CameraCaptureScreen(
    navController: NavHostController,
    entryId: String,
    vm: LalaViewModel = hiltViewModel()
) {
    val context = LocalContext.current
    val lifecycleOwner = LocalLifecycleOwner.current
    val scope = rememberCoroutineScope()

    var hasCameraPermission by remember {
        mutableStateOf(
            ContextCompat.checkSelfPermission(context, Manifest.permission.CAMERA) ==
                android.content.pm.PackageManager.PERMISSION_GRANTED
        )
    }
    val permissionLauncher = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.RequestPermission()
    ) { granted -> hasCameraPermission = granted }

    var lensFacing by remember { mutableStateOf(CameraSelector.LENS_FACING_BACK) }
    var mode by remember { mutableStateOf(CaptureMode.PHOTO) }
    var isRecording by remember { mutableStateOf(false) }
    var recording by remember { mutableStateOf<Recording?>(null) }

    var imageCapture by remember { mutableStateOf<ImageCapture?>(null) }
    var videoCapture by remember { mutableStateOf<VideoCapture<*>?>(null) }
    val executor = remember { Executors.newSingleThreadExecutor() }

    val previewView = remember { PreviewView(context) }

    LaunchedEffect(hasCameraPermission, lensFacing, mode) {
        if (!hasCameraPermission) {
            permissionLauncher.launch(Manifest.permission.CAMERA)
            return@LaunchedEffect
        }

        val future = ProcessCameraProvider.getInstance(context)
        try {
            val provider = withContext(Dispatchers.IO) { future.get() }
            val preview = CamPreview.Builder().build().also { p ->
                p.setSurfaceProvider(previewView.surfaceProvider)
            }
            val selector = CameraSelector.Builder()
                .requireLensFacing(lensFacing)
                .build()

            provider.unbindAll()

            if (mode == CaptureMode.PHOTO) {
                val imgCap = ImageCapture.Builder()
                    .setCaptureMode(ImageCapture.CAPTURE_MODE_MINIMIZE_LATENCY)
                    .build()
                provider.bindToLifecycle(lifecycleOwner, selector, preview, imgCap)
                imageCapture = imgCap
                videoCapture = null
            } else {
                val recorder = androidx.camera.video.Recorder.Builder()
                    .setExecutor(ContextCompat.getMainExecutor(context))
                    .build()
                val vidCap = VideoCapture.withOutput(recorder)
                provider.bindToLifecycle(lifecycleOwner, selector, preview, vidCap)
                videoCapture = vidCap
                imageCapture = null
            }
        } catch (_: Exception) {
            // Ignore camera bind errors on emulator / no-camera devices
        }
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text(if (mode == CaptureMode.PHOTO) "Take Photo" else "Record Video") },
                navigationIcon = {
                    IconButton(onClick = { navController.popBackStack() }) {
                        Icon(imageVector = Icons.Default.Close, contentDescription = "Close")
                    }
                }
            )
        }
    ) { padding ->
        Column(
            modifier = Modifier
                .padding(padding)
                .fillMaxSize()
        ) {
            if (hasCameraPermission) {
                Box(modifier = Modifier.weight(1f)) {
                    AndroidView(
                        factory = { previewView },
                        modifier = Modifier.fillMaxSize()
                    )
                }

                // Controls
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(16.dp),
                    horizontalArrangement = Arrangement.SpaceEvenly,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    // Mode toggle
                    Box(
                        modifier = Modifier
                            .size(56.dp)
                            .clip(CircleShape)
                            .background(MaterialTheme.colorScheme.surface.copy(alpha = 0.7f))
                            .clickable { mode = if (mode == CaptureMode.PHOTO) CaptureMode.VIDEO else CaptureMode.PHOTO }
                    ) {
                        Text(
                            if (mode == CaptureMode.PHOTO) "Photo" else "Video",
                            modifier = Modifier.align(Alignment.Center),
                            style = MaterialTheme.typography.labelMedium
                        )
                    }

                    // Flip camera
                    IconButton(
                        onClick = {
                            lensFacing = if (lensFacing == CameraSelector.LENS_FACING_BACK)
                                CameraSelector.LENS_FACING_FRONT else CameraSelector.LENS_FACING_BACK
                        },
                        modifier = Modifier
                            .size(56.dp)
                            .clip(CircleShape)
                            .background(MaterialTheme.colorScheme.surface.copy(alpha = 0.7f))
                    ) {
                        Icon(imageVector = Icons.Default.Cameraswitch, contentDescription = "Flip", tint = MaterialTheme.colorScheme.onSurface)
                    }

                    // Shutter
                    Box(
                        modifier = Modifier
                            .size(80.dp)
                            .clip(CircleShape)
                            .background(
                                if (isRecording) MaterialTheme.colorScheme.error
                                else MaterialTheme.colorScheme.primary
                            )
                            .padding(4.dp),
                        contentAlignment = Alignment.Center
                    ) {
                        IconButton(onClick = {
                            if (mode == CaptureMode.PHOTO) {
                                scope.launch {
                                    val ok = capturePhoto(context, imageCapture, executor, entryId, vm)
                                    if (ok) navController.popBackStack()
                                }
                            } else {
                                if (!isRecording) {
                                    val rec = startRecording(context, videoCapture, entryId, vm)
                                    if (rec != null) {
                                        recording = rec
                                        isRecording = true
                                    }
                                } else {
                                    recording?.close()
                                    recording = null
                                    isRecording = false
                                    navController.popBackStack()
                                }
                            }
                        }) {
                            if (mode == CaptureMode.PHOTO) {
                                Icon(
                                    imageVector = Icons.Default.PhotoCamera,
                                    contentDescription = "Take Photo",
                                    tint = MaterialTheme.colorScheme.onPrimary
                                )
                            } else {
                                Icon(
                                    imageVector = if (isRecording) Icons.Default.Stop else Icons.Default.Videocam,
                                    contentDescription = if (isRecording) "Stop" else "Record",
                                    tint = MaterialTheme.colorScheme.onPrimary
                                )
                            }
                        }
                    }
                }
            } else {
                Box(
                    modifier = Modifier
                        .fillMaxSize()
                        .background(MaterialTheme.colorScheme.scrim.copy(alpha = 0.6f)),
                    contentAlignment = Alignment.Center
                ) {
                    Text("Camera permission required", color = MaterialTheme.colorScheme.onError)
                }
            }
        }
    }
}

private enum class CaptureMode { PHOTO, VIDEO }

private fun capturePhoto(
    context: Context,
    imageCapture: ImageCapture?,
    executor: java.util.concurrent.ExecutorService,
    entryId: String,
    vm: LalaViewModel
): Boolean {
    val ic = imageCapture ?: return false
    val dir = File(context.filesDir, "photos/$entryId").apply { mkdirs() }
    val file = File(dir, "${UUID.randomUUID()}.jpg")
    val opts = ImageCapture.OutputFileOptions.Builder(file).build()
    var success = false

    ic.takePicture(opts, executor,
        object : ImageCapture.OnImageSavedCallback {
            override fun onError(exc: ImageCaptureException) {
                success = false
            }
            override fun onImageSaved(output: ImageCapture.OutputFileResults) {
                vm.addPhoto(
                    Photo(
                        entryId = entryId,
                        uri = file.absolutePath,
                        timestamp = Instant.now()
                    )
                )
                success = true
            }
        }
    )
    return success
}

@Suppress("UNCHECKED_CAST")
private fun startRecording(
    context: Context,
    videoCapture: VideoCapture<*>?,
    entryId: String,
    vm: LalaViewModel
): Recording? {
    val vc = videoCapture ?: return null
    val dir = File(context.filesDir, "videos/$entryId").apply { mkdirs() }
    val file = File(dir, "${UUID.randomUUID()}.mp4")
    val opts = FileOutputOptions.Builder(file).build()

    val recorder = (vc as VideoCapture<androidx.camera.video.Recorder>).output
    return recorder.prepareRecording(context, opts)
        .start(ContextCompat.getMainExecutor(context)) { event ->
            when (event) {
                is VideoRecordEvent.Finalize -> {
                    if (!event.hasError()) {
                        val seconds = (event.recordingStats.recordedDurationNanos / 1_000_000_000)
                            .toInt().coerceAtLeast(1)
                        vm.addVideo(
                            Video(
                                entryId = entryId,
                                uri = file.absolutePath,
                                durationSeconds = seconds,
                                timestamp = Instant.now()
                            )
                        )
                    }
                }
            }
        }
}
