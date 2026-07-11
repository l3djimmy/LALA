package com.hardlineforge.lala.ui.screens

import android.Manifest
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.foundation.layout.*
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
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.ui.text.input.KeyboardCapitalization
import androidx.compose.ui.unit.dp
import androidx.core.content.ContextCompat
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavHostController
import com.hardlineforge.lala.data.LogEntry
import com.hardlineforge.lala.ui.viewmodel.LalaViewModel
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

    // Stable across recompositions so photos/videos captured before the first Save
    // attach to the same LogEntry id that ends up persisted.
    val stableEntryId = remember { entryId ?: java.util.UUID.randomUUID().toString() }

    // Fields
    var timestamp by remember { mutableStateOf(LocalDateTime.now()) }
    var timezone by remember { mutableStateOf(ZoneId.systemDefault().id) }
    var gpsLat by remember { mutableStateOf<Double?>(null) }
    var gpsLon by remember { mutableStateOf<Double?>(null) }
    var category by remember { mutableStateOf(defaultCats.first()) }
    var locationName by remember { mutableStateOf("") }
    var comment by remember { mutableStateOf("") }
    var tags by remember { mutableStateOf("") }
    var showCategoryPicker by remember { mutableStateOf(false) }
    var showDatePicker by remember { mutableStateOf(false) }
    var showTimePicker by remember { mutableStateOf(false) }
    var showEditNoteDialog by remember { mutableStateOf(false) }
    var editNote by remember { mutableStateOf("") }
    var gpsLoading by remember { mutableStateOf(false) }

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
        loc?.let {
            gpsLat = it.latitude
            gpsLon = it.longitude
            if (locationName.isBlank()) {
                locationName = "%.5f, %.5f".format(it.latitude, it.longitude)
            }
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

    LaunchedEffect(entryId) {
        if (!isNew && entryId != null) {
            vm.loadEntry(entryId)
        }
    }

    LaunchedEffect(existing) {
        existing?.let { e ->
            timestamp = e.timestamp.atZone(ZoneId.of(e.timezone)).toLocalDateTime()
            timezone = e.timezone
            gpsLat = e.gpsLat
            gpsLon = e.gpsLon
            category = e.category
            locationName = e.locationName ?: ""
            comment = e.comment
            tags = e.tags
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
                },
                actions = {
                    IconButton(onClick = {
                        if (comment.isBlank()) return@IconButton

                        val instant = timestamp.atZone(ZoneId.of(timezone)).toInstant()
                        val newEntry = LogEntry(
                            id = stableEntryId,
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
                    }) {
                        Icon(Icons.Default.Check, "Save")
                    }
                }
            )
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
                leadingIcon = { Icon(imageVector = Icons.Default.Mic, contentDescription = null) },
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
            val openCamera: () -> Unit = {
                if (isNew) {
                    // Photos/videos have a FK on entryId, so a draft row must exist before capturing.
                    val instant = timestamp.atZone(ZoneId.of(timezone)).toInstant()
                    vm.saveEntry(
                        LogEntry(
                            id = stableEntryId,
                            timestamp = instant,
                            timezone = timezone,
                            gpsLat = gpsLat,
                            gpsLon = gpsLon,
                            category = category,
                            locationName = locationName.ifBlank { null },
                            comment = comment.trim(),
                            tags = tags.trim(),
                            createdAt = Instant.now(),
                            updatedAt = Instant.now()
                        ),
                        isNew = true
                    )
                }
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
