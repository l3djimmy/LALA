package com.hardlineforge.lala.ui.screens

import android.Manifest
import android.annotation.SuppressLint
import android.content.Context
import android.widget.Toast
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
import androidx.lifecycle.Lifecycle
import androidx.navigation.NavHostController
import com.hardlineforge.lala.data.Photo
import com.hardlineforge.lala.data.Video
import com.hardlineforge.lala.ui.viewmodel.LalaViewModel
import com.hardlineforge.lala.util.DebugLog
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.suspendCancellableCoroutine
import kotlinx.coroutines.withContext
import java.io.File
import java.time.Instant
import java.util.UUID
import java.util.concurrent.Executors
import kotlin.coroutines.resume

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

    fun granted(permission: String) =
        ContextCompat.checkSelfPermission(context, permission) ==
            android.content.pm.PackageManager.PERMISSION_GRANTED

    var hasCameraPermission by remember { mutableStateOf(granted(Manifest.permission.CAMERA)) }
    var hasAudioPermission by remember { mutableStateOf(granted(Manifest.permission.RECORD_AUDIO)) }
    val permissionLauncher = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.RequestMultiplePermissions()
    ) { results ->
        DebugLog.log("Camera", "permission results: $results")
        hasCameraPermission = results[Manifest.permission.CAMERA] ?: hasCameraPermission
        hasAudioPermission = results[Manifest.permission.RECORD_AUDIO] ?: hasAudioPermission
    }

    var lensFacing by remember { mutableStateOf(CameraSelector.LENS_FACING_BACK) }
    var mode by remember { mutableStateOf(CaptureMode.PHOTO) }
    var isRecording by remember { mutableStateOf(false) }
    var isFinalizing by remember { mutableStateOf(false) }
    var recording by remember { mutableStateOf<Recording?>(null) }

    var imageCapture by remember { mutableStateOf<ImageCapture?>(null) }
    var videoCapture by remember { mutableStateOf<VideoCapture<*>?>(null) }
    val executor = remember { Executors.newSingleThreadExecutor() }

    val previewView = remember { PreviewView(context) }

    // If the user backs out mid-recording, stop it so the file still finalizes and
    // attaches to the entry (the finalize callback guards against popping twice).
    DisposableEffect(Unit) {
        onDispose {
            recording?.let {
                DebugLog.log("Camera", "screen disposed while recording — stopping so the video still finalizes")
                it.stop()
            }
        }
    }

    LaunchedEffect(hasCameraPermission, lensFacing, mode) {
        if (!hasCameraPermission) {
            permissionLauncher.launch(
                arrayOf(Manifest.permission.CAMERA, Manifest.permission.RECORD_AUDIO)
            )
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
                DebugLog.log("Camera", "bound PHOTO use case (lens=$lensFacing)")
            } else {
                val recorder = androidx.camera.video.Recorder.Builder()
                    .setExecutor(ContextCompat.getMainExecutor(context))
                    .build()
                val vidCap = VideoCapture.withOutput(recorder)
                provider.bindToLifecycle(lifecycleOwner, selector, preview, vidCap)
                videoCapture = vidCap
                imageCapture = null
                DebugLog.log("Camera", "bound VIDEO use case (lens=$lensFacing)")
            }
        } catch (e: Exception) {
            DebugLog.error("Camera", "failed to bind camera (lens=$lensFacing, mode=$mode)", e)
            Toast.makeText(context, "Camera unavailable: ${e.message}", Toast.LENGTH_LONG).show()
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
                        var isCapturing by remember { mutableStateOf(false) }
                        IconButton(
                            enabled = !isCapturing && !isFinalizing,
                            onClick = {
                            if (mode == CaptureMode.PHOTO) {
                                if (isCapturing) return@IconButton
                                if (!lifecycleOwner.lifecycle.currentState.isAtLeast(Lifecycle.State.RESUMED)) {
                                    DebugLog.log("Camera", "capture ignored: lifecycle=${lifecycleOwner.lifecycle.currentState}")
                                    return@IconButton
                                }
                                isCapturing = true
                                scope.launch {
                                    val ok = capturePhoto(context, imageCapture, executor, entryId, vm)
                                    if (ok) {
                                        // Deliberately leave isCapturing=true: we're navigating away,
                                        // and re-enabling would let a second tap race the unbinding camera.
                                        Toast.makeText(context, "Photo saved", Toast.LENGTH_SHORT).show()
                                        navController.popBackStack()
                                    } else {
                                        isCapturing = false
                                        Toast.makeText(context, "Failed to capture photo", Toast.LENGTH_SHORT).show()
                                    }
                                }
                            } else {
                                if (!isRecording) {
                                    val rec = startRecording(context, videoCapture, entryId, vm, hasAudioPermission) { success ->
                                        // Finalize is async — this fires ~1s+ after stop. Only now is the
                                        // video registered, so only now do we leave the screen.
                                        isFinalizing = false
                                        isRecording = false
                                        Toast.makeText(
                                            context,
                                            if (success) "Video saved" else "Video failed to save",
                                            Toast.LENGTH_SHORT
                                        ).show()
                                        if (navController.currentDestination?.route?.startsWith("camera_capture") == true) {
                                            navController.popBackStack()
                                        }
                                    }
                                    DebugLog.log("Camera", "startRecording -> ${if (rec != null) "started" else "FAILED (videoCapture=${videoCapture != null})"}")
                                    if (rec != null) {
                                        recording = rec
                                        isRecording = true
                                    } else {
                                        Toast.makeText(context, "Failed to start recording", Toast.LENGTH_SHORT).show()
                                    }
                                } else if (!isFinalizing) {
                                    DebugLog.log("Camera", "stopping recording, awaiting finalize")
                                    isFinalizing = true
                                    recording?.stop()
                                    recording = null
                                }
                            }
                        }) {
                            if (isFinalizing) {
                                CircularProgressIndicator(
                                    modifier = Modifier.size(28.dp),
                                    strokeWidth = 3.dp,
                                    color = MaterialTheme.colorScheme.onPrimary
                                )
                            } else if (mode == CaptureMode.PHOTO) {
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

private suspend fun capturePhoto(
    context: Context,
    imageCapture: ImageCapture?,
    executor: java.util.concurrent.ExecutorService,
    entryId: String,
    vm: LalaViewModel
): Boolean {
    val ic = imageCapture
    if (ic == null) {
        DebugLog.log("Camera", "capturePhoto: imageCapture is null (camera never bound?)")
        return false
    }
    val dir = File(context.filesDir, "photos/$entryId").apply { mkdirs() }
    val file = File(dir, "${UUID.randomUUID()}.jpg")
    val opts = ImageCapture.OutputFileOptions.Builder(file).build()

    val success = suspendCancellableCoroutine<Boolean> { cont ->
        ic.takePicture(opts, executor,
            object : ImageCapture.OnImageSavedCallback {
                override fun onError(exc: ImageCaptureException) {
                    DebugLog.error("Camera", "takePicture failed (code=${exc.imageCaptureError})", exc)
                    if (cont.isActive) cont.resume(false)
                }
                override fun onImageSaved(output: ImageCapture.OutputFileResults) {
                    DebugLog.log("Camera", "photo saved: ${file.absolutePath} (${file.length()} bytes, entryId=$entryId)")
                    if (cont.isActive) cont.resume(true)
                }
            }
        )
    }

    if (success) {
        vm.addPhoto(
            Photo(
                entryId = entryId,
                uri = file.absolutePath,
                timestamp = Instant.now()
            )
        )
    }
    return success
}

@Suppress("UNCHECKED_CAST")
@SuppressLint("MissingPermission") // audio only enabled after RECORD_AUDIO is granted
private fun startRecording(
    context: Context,
    videoCapture: VideoCapture<*>?,
    entryId: String,
    vm: LalaViewModel,
    audioEnabled: Boolean,
    onFinalized: (success: Boolean) -> Unit
): Recording? {
    val vc = videoCapture ?: return null
    val dir = File(context.filesDir, "videos/$entryId").apply { mkdirs() }
    val file = File(dir, "${UUID.randomUUID()}.mp4")
    val opts = FileOutputOptions.Builder(file).build()

    val recorder = (vc as VideoCapture<androidx.camera.video.Recorder>).output
    DebugLog.log("Camera", "starting recording (audio=${audioEnabled})")
    return recorder.prepareRecording(context, opts)
        .apply { if (audioEnabled) withAudioEnabled() }
        .start(ContextCompat.getMainExecutor(context)) { event ->
            when (event) {
                is VideoRecordEvent.Start ->
                    DebugLog.log("Camera", "video recording started: ${file.absolutePath}")
                is VideoRecordEvent.Finalize -> {
                    if (!event.hasError()) {
                        val seconds = (event.recordingStats.recordedDurationNanos / 1_000_000_000)
                            .toInt().coerceAtLeast(1)
                        DebugLog.log("Camera", "video finalized: ${seconds}s, ${file.length()} bytes (entryId=$entryId)")
                        vm.addVideo(
                            Video(
                                entryId = entryId,
                                uri = file.absolutePath,
                                durationSeconds = seconds,
                                timestamp = Instant.now()
                            )
                        )
                        onFinalized(true)
                    } else {
                        DebugLog.log("Camera", "video finalize ERROR code=${event.error}: ${event.cause?.message}")
                        onFinalized(false)
                    }
                }
            }
        }
}
