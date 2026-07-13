package com.hardlineforge.lala.ui.screens

import android.Manifest
import android.app.Activity
import android.content.ActivityNotFoundException
import android.content.Intent
import android.graphics.BitmapFactory
import android.speech.RecognizerIntent
import android.widget.Toast
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.text.KeyboardActions
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.CameraAlt
import androidx.compose.material.icons.filled.Check
import androidx.compose.material.icons.filled.LocationOn
import androidx.compose.material.icons.filled.Mic
import androidx.compose.material.icons.filled.MyLocation
import androidx.compose.material.icons.filled.Videocam
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.runtime.saveable.Saver
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.asImageBitmap
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.ui.text.input.KeyboardCapitalization
import androidx.compose.ui.unit.dp
import androidx.core.content.ContextCompat
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavHostController
import com.hardlineforge.lala.data.LogEntry
import com.hardlineforge.lala.data.Photo
import com.hardlineforge.lala.ui.viewmodel.LalaViewModel
import com.hardlineforge.lala.util.DebugLog
import java.time.Instant
import java.time.LocalDateTime
import java.time.ZoneId
import java.time.format.DateTimeFormatter
import kotlinx.coroutines.flow.firstOrNull
import kotlinx.coroutines.launch

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AddEditScreen(
    navController: NavHostController,
    entryId: String?,
    vm: LalaViewModel = hiltViewModel()
) {
    val context = LocalContext.current
    val scope = rememberCoroutineScope()
    val existing by vm.selectedEntry.collectAsState()
    val customCats by vm.customCategories.collectAsState()
    val defaultCats = vm.getDefaultCategories()
    val allCategories = defaultCats + customCats.map { it.name }

    val isNew = entryId == null
    val entry = if (!isNew) existing else null

    // rememberSaveable (not remember): navigating to the camera removes this screen
    // from composition, and plain remember state is destroyed — a fresh UUID was being
    // generated on every return, orphaning captured photos under the abandoned id.
    val stableEntryId = rememberSaveable { entryId ?: java.util.UUID.randomUUID().toString() }

    // Fields — all saveable so in-progress input survives the camera round trip.
    var title by rememberSaveable { mutableStateOf("") }
    var timestamp by rememberSaveable(stateSaver = LocalDateTimeSaver) { mutableStateOf(LocalDateTime.now()) }
    var timezone by rememberSaveable { mutableStateOf(ZoneId.systemDefault().id) }
    var gpsLat by rememberSaveable { mutableStateOf<Double?>(null) }
    var gpsLon by rememberSaveable { mutableStateOf<Double?>(null) }
    var category by rememberSaveable { mutableStateOf(defaultCats.first()) }
    var locationName by rememberSaveable { mutableStateOf("") }
    var comment by rememberSaveable { mutableStateOf("") }
    var tags by rememberSaveable { mutableStateOf("") }
    var fieldsInitialized by rememberSaveable { mutableStateOf(false) }
    var showCategoryPicker by remember { mutableStateOf(false) }
    var showDatePicker by remember { mutableStateOf(false) }
    var showTimePicker by remember { mutableStateOf(false) }
    var showEditNoteDialog by remember { mutableStateOf(false) }
    var editNote by rememberSaveable { mutableStateOf("") }
    var gpsLoading by remember { mutableStateOf(false) }

    // Observed reactively (not queried once on resume): video finalization lands
    // asynchronously AFTER this screen resumes, so a one-shot query missed it.
    val attachedPhotos by remember(stableEntryId) { vm.observePhotos(stableEntryId) }
        .collectAsState(initial = emptyList())
    val attachedVideos by remember(stableEntryId) { vm.observeVideos(stableEntryId) }
        .collectAsState(initial = emptyList())
    LaunchedEffect(attachedPhotos.size, attachedVideos.size) {
        DebugLog.log("Entry", "media for $stableEntryId: ${attachedPhotos.size} photo(s), ${attachedVideos.size} video(s)")
    }

    var hasLocPerm by remember {
        mutableStateOf(
            ContextCompat.checkSelfPermission(context, Manifest.permission.ACCESS_FINE_LOCATION) ==
                android.content.pm.PackageManager.PERMISSION_GRANTED ||
            ContextCompat.checkSelfPermission(context, Manifest.permission.ACCESS_COARSE_LOCATION) ==
                android.content.pm.PackageManager.PERMISSION_GRANTED
        )
    }

    suspend fun captureAndFillLocation() {
        gpsLoading = true
        val loc = vm.captureLocation()
        if (loc != null) {
            DebugLog.log("GPS", "fix: %.5f, %.5f (accuracy=%.0fm)".format(loc.latitude, loc.longitude, loc.accuracy))
            gpsLat = loc.latitude
            gpsLon = loc.longitude
            if (locationName.isBlank()) {
                locationName = "%.5f, %.5f".format(loc.latitude, loc.longitude)
            }
        } else {
            DebugLog.log("GPS", "no fix returned (permission=$hasLocPerm)")
        }
        gpsLoading = false
    }

    val locationPermissionLauncher = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.RequestMultiplePermissions()
    ) { results ->
        hasLocPerm = results[Manifest.permission.ACCESS_FINE_LOCATION] == true ||
            results[Manifest.permission.ACCESS_COARSE_LOCATION] == true
        if (hasLocPerm) {
            scope.launch { captureAndFillLocation() }
        }
    }

    val speechLauncher = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.StartActivityForResult()
    ) { result ->
        if (result.resultCode == Activity.RESULT_OK) {
            val spoken = result.data
                ?.getStringArrayListExtra(RecognizerIntent.EXTRA_RESULTS)
                ?.firstOrNull()
            if (!spoken.isNullOrBlank()) {
                comment = if (comment.isBlank()) spoken else "$comment $spoken"
            }
        }
    }

    fun startVoiceInput() {
        val intent = Intent(RecognizerIntent.ACTION_RECOGNIZE_SPEECH).apply {
            putExtra(RecognizerIntent.EXTRA_LANGUAGE_MODEL, RecognizerIntent.LANGUAGE_MODEL_FREE_FORM)
            putExtra(RecognizerIntent.EXTRA_PROMPT, "Speak your comment")
        }
        try {
            speechLauncher.launch(intent)
        } catch (_: ActivityNotFoundException) {
            Toast.makeText(context, "Speech recognition isn't available on this device", Toast.LENGTH_SHORT).show()
        }
    }

    LaunchedEffect(entryId) {
        if (!isNew && entryId != null) {
            vm.loadEntry(entryId)
        }
    }

    LaunchedEffect(existing) {
        // Populate from the DB only once — on return from the camera the restored
        // (possibly unsaved) field values must not be overwritten.
        if (!fieldsInitialized) {
            existing?.let { e ->
                title = e.title
                timestamp = e.timestamp.atZone(ZoneId.of(e.timezone)).toLocalDateTime()
                timezone = e.timezone
                gpsLat = e.gpsLat
                gpsLon = e.gpsLon
                category = e.category
                locationName = e.locationName ?: ""
                comment = e.comment
                tags = e.tags
                fieldsInitialized = true
            }
        }
    }

    // Auto-tag GPS as soon as a brand-new entry is opened, instead of requiring a manual tap.
    LaunchedEffect(isNew) {
        if (isNew && gpsLat == null) {
            if (hasLocPerm) {
                captureAndFillLocation()
            } else {
                locationPermissionLauncher.launch(
                    arrayOf(Manifest.permission.ACCESS_FINE_LOCATION, Manifest.permission.ACCESS_COARSE_LOCATION)
                )
            }
        }
    }


    val saveEntry: () -> Unit = saveEntry@{
        if (comment.isBlank()) {
            Toast.makeText(context, "A comment is required before saving", Toast.LENGTH_SHORT).show()
            return@saveEntry
        }

        val instant = timestamp.atZone(ZoneId.of(timezone)).toInstant()
        val newEntry = LogEntry(
            id = stableEntryId,
            title = title.trim(),
            timestamp = instant,
            timezone = timezone,
            gpsLat = gpsLat,
            gpsLon = gpsLon,
            category = category,
            locationName = locationName.ifBlank { null },
            comment = comment.trim(),
            tags = tags.trim(),
            createdAt = entry?.createdAt ?: Instant.now(),
            updatedAt = Instant.now()
        )

        if (!isNew && (comment != (existing?.comment ?: ""))) {
            showEditNoteDialog = true
        } else {
            vm.saveEntry(newEntry, isNew)
            navController.popBackStack()
        }
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text(if (isNew) "New Log Entry" else "Edit Entry") },
                navigationIcon = {
                    IconButton(onClick = { navController.popBackStack() }) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
                    }
                }
            )
        },
        bottomBar = {
            Surface(shadowElevation = 8.dp) {
                Button(
                    onClick = saveEntry,
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(horizontal = 20.dp, vertical = 12.dp)
                        .heightIn(min = 52.dp),
                    shape = MaterialTheme.shapes.medium
                ) {
                    Icon(Icons.Default.Check, contentDescription = null)
                    Spacer(modifier = Modifier.width(8.dp))
                    Text("Save Entry", style = MaterialTheme.typography.titleMedium)
                }
            }
        }
    ) { padding ->
        Column(
            modifier = Modifier
                .padding(padding)
                .padding(horizontal = 20.dp)
                .verticalScroll(rememberScrollState()),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            Spacer(modifier = Modifier.height(8.dp))

            // Title
            OutlinedTextField(
                value = title,
                onValueChange = { title = it },
                label = { Text("Title") },
                placeholder = { Text(if (isNew) "New Log Entry" else "Edit Entry") },
                modifier = Modifier.fillMaxWidth(),
                shape = MaterialTheme.shapes.medium,
                keyboardOptions = KeyboardOptions(capitalization = KeyboardCapitalization.Sentences, imeAction = ImeAction.Next),
                singleLine = true
            )

            // Date / Time row
            Row(modifier = Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.spacedBy(12.dp)) {
                OutlinedButton(
                    onClick = { showDatePicker = true },
                    modifier = Modifier.weight(1f),
                    shape = MaterialTheme.shapes.medium
                ) {
                    Text(timestamp.format(DateTimeFormatter.ofPattern("MMM d, yyyy")))
                }
                OutlinedButton(
                    onClick = { showTimePicker = true },
                    modifier = Modifier.weight(1f),
                    shape = MaterialTheme.shapes.medium
                ) {
                    Text(timestamp.format(DateTimeFormatter.ofPattern("h:mm a")))
                }
            }

            // Category chip
            Text("Category", style = MaterialTheme.typography.labelLarge)
            FilterChip(
                selected = true,
                onClick = { showCategoryPicker = true },
                label = { Text(category) },
                shape = MaterialTheme.shapes.medium
            )

            // Location
            OutlinedTextField(
                value = locationName,
                onValueChange = { locationName = it },
                label = { Text("Location") },
                leadingIcon = { Icon(Icons.Default.LocationOn, null) },
                trailingIcon = {
                    if (gpsLoading) {
                        CircularProgressIndicator(modifier = Modifier.size(24.dp), strokeWidth = 2.dp)
                    } else {
                        IconButton(onClick = {
                            if (hasLocPerm) {
                                scope.launch { captureAndFillLocation() }
                            } else {
                                locationPermissionLauncher.launch(
                                    arrayOf(
                                        Manifest.permission.ACCESS_FINE_LOCATION,
                                        Manifest.permission.ACCESS_COARSE_LOCATION
                                    )
                                )
                            }
                        }) {
                            Icon(imageVector = Icons.Default.MyLocation, contentDescription = "Get GPS")
                        }
                    }
                },
                modifier = Modifier.fillMaxWidth(),
                shape = MaterialTheme.shapes.medium,
                keyboardOptions = KeyboardOptions(imeAction = ImeAction.Next),
                keyboardActions = KeyboardActions(onNext = { /* move focus */ }),
                singleLine = true
            )

            // Comment with voice button
            OutlinedTextField(
                value = comment,
                onValueChange = { comment = it },
                label = { Text("Comment *") },
                leadingIcon = {
                    IconButton(onClick = { startVoiceInput() }) {
                        Icon(imageVector = Icons.Default.Mic, contentDescription = "Voice input")
                    }
                },
                modifier = Modifier.fillMaxWidth().heightIn(min = 120.dp),
                shape = MaterialTheme.shapes.medium,
                keyboardOptions = KeyboardOptions(capitalization = KeyboardCapitalization.Sentences),
                maxLines = 8
            )

            // Tags
            OutlinedTextField(
                value = tags,
                onValueChange = { tags = it },
                label = { Text("Tags (comma separated)") },
                modifier = Modifier.fillMaxWidth(),
                shape = MaterialTheme.shapes.medium,
                singleLine = true
            )

            // Geotag display
            if (gpsLat != null && gpsLon != null) {
                Text(
                    text = "GPS: ${gpsLat!!.format(6)}, ${gpsLon!!.format(6)}",
                    style = MaterialTheme.typography.labelSmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }

            HorizontalDivider(modifier = Modifier.padding(vertical = 8.dp))

            // Media attachments
            Text("Media", style = MaterialTheme.typography.titleMedium)
            // stableEntryId keeps captured photos/videos matched to whatever id this
            // entry ends up saved under, without inserting a visible draft row early.
            val openCamera: () -> Unit = {
                navController.navigate("camera_capture/$stableEntryId")
            }
            Row(horizontalArrangement = Arrangement.spacedBy(12.dp)) {
                OutlinedButton(
                    onClick = openCamera,
                    shape = MaterialTheme.shapes.medium
                ) {
                    Icon(imageVector = Icons.Default.CameraAlt, contentDescription = null)
                    Spacer(modifier = Modifier.width(4.dp))
                    Text("Photo")
                }
                OutlinedButton(
                    onClick = openCamera,
                    shape = MaterialTheme.shapes.medium
                ) {
                    Icon(imageVector = Icons.Default.Videocam, contentDescription = null)
                    Spacer(modifier = Modifier.width(4.dp))
                    Text("Video")
                }
            }

            if (attachedPhotos.isNotEmpty() || attachedVideos.isNotEmpty()) {
                LazyRow(
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    modifier = Modifier.padding(top = 8.dp)
                ) {
                    items(attachedPhotos, key = { it.id }) { photo ->
                        val bmp = remember(photo.uri) {
                            BitmapFactory.decodeFile(photo.uri)?.asImageBitmap()
                        }
                        Box(
                            modifier = Modifier
                                .size(90.dp)
                                .background(MaterialTheme.colorScheme.surfaceVariant, MaterialTheme.shapes.small)
                        ) {
                            if (bmp != null) {
                                Image(
                                    bitmap = bmp,
                                    contentDescription = "Photo",
                                    modifier = Modifier.fillMaxSize(),
                                    contentScale = ContentScale.Crop
                                )
                            }
                        }
                    }
                    items(attachedVideos, key = { it.id }) { video ->
                        Box(
                            modifier = Modifier
                                .size(90.dp)
                                .background(MaterialTheme.colorScheme.surfaceVariant, MaterialTheme.shapes.small)
                                .clickable { navController.navigate("filmstrip/${video.id}") },
                            contentAlignment = Alignment.Center
                        ) {
                            Column(horizontalAlignment = Alignment.CenterHorizontally) {
                                Icon(
                                    imageVector = Icons.Default.Videocam,
                                    contentDescription = "Video",
                                    tint = MaterialTheme.colorScheme.primary
                                )
                                Text(
                                    "${video.durationSeconds}s",
                                    style = MaterialTheme.typography.labelSmall,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                            }
                        }
                    }
                }
            }

            Spacer(modifier = Modifier.height(24.dp))
        }
    }

    if (showCategoryPicker) {
        AlertDialog(
            onDismissRequest = { showCategoryPicker = false },
            title = { Text("Select Category") },
            text = {
                Column {
                    allCategories.forEach { cat ->
                        TextButton(
                            onClick = { category = cat; showCategoryPicker = false },
                            modifier = Modifier.fillMaxWidth()
                        ) {
                            Text(cat, modifier = Modifier.fillMaxWidth())
                        }
                    }
                }
            },
            confirmButton = {}
        )
    }

    if (showEditNoteDialog) {
        AlertDialog(
            onDismissRequest = { showEditNoteDialog = false },
            title = { Text("Edit Note (optional)") },
            text = {
                OutlinedTextField(
                    value = editNote,
                    onValueChange = { editNote = it },
                    label = { Text("Why was this edited?") },
                    modifier = Modifier.fillMaxWidth()
                )
            },
            confirmButton = {
                TextButton(onClick = {
                    val instant = timestamp.atZone(ZoneId.of(timezone)).toInstant()
                    val newEntry = LogEntry(
                        id = entry!!.id,
                        title = title.trim(),
                        timestamp = instant,
                        timezone = timezone,
                        gpsLat = gpsLat,
                        gpsLon = gpsLon,
                        category = category,
                        locationName = locationName.ifBlank { null },
                        comment = comment.trim(),
                        tags = tags.trim(),
                        createdAt = entry.createdAt,
                        updatedAt = Instant.now()
                    )
                    vm.saveEntry(newEntry, false, editNote.ifBlank { null })
                    showEditNoteDialog = false
                    navController.popBackStack()
                }) { Text("Save") }
            },
            dismissButton = {
                TextButton(onClick = { showEditNoteDialog = false }) { Text("Cancel") }
            }
        )
    }
}

private fun Double.format(decimals: Int) = String.format("%.${decimals}f", this)

private val LocalDateTimeSaver = Saver<LocalDateTime, String>(
    save = { it.toString() },
    restore = { LocalDateTime.parse(it) }
)
