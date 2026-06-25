package com.hardlineforge.lala.ui.screens

import android.Manifest
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

    val hasLocPerm = remember {
        ContextCompat.checkSelfPermission(context, Manifest.permission.ACCESS_FINE_LOCATION) ==
            android.content.pm.PackageManager.PERMISSION_GRANTED
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
                            id = entry?.id ?: java.util.UUID.randomUUID().toString(),
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
                            if (!hasLocPerm) return@IconButton
                            gpsLoading = true
                            scope.launch {
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
                        }) {
                            Icon(Icons.Default.MyLocation, "Get GPS")
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
                leadingIcon = { Icon(Icons.Default.Mic, null) },
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

            Divider(modifier = Modifier.padding(vertical = 8.dp))

            // Media attachments
            Text("Media", style = MaterialTheme.typography.titleMedium)
            val id = entry?.id ?: entryId ?: java.util.UUID.randomUUID().toString()
            Row(horizontalArrangement = Arrangement.spacedBy(12.dp)) {
                OutlinedButton(
                    onClick = { navController.navigate("camera_capture/$id") },
                    shape = MaterialTheme.shapes.medium
                ) {
                    Icon(Icons.Default.CameraAlt, null)
                    Spacer(modifier = Modifier.width(4.dp))
                    Text("Photo")
                }
                OutlinedButton(
                    onClick = { navController.navigate("camera_capture/$id") },
                    shape = MaterialTheme.shapes.medium
                ) {
                    Icon(Icons.Default.Videocam, null)
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
