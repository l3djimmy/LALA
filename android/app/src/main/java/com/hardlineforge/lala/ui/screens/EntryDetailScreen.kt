package com.hardlineforge.lala.ui.screens

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.Delete
import androidx.compose.material.icons.filled.Edit
import androidx.compose.material.icons.outlined.LocationOn
import androidx.compose.material.icons.outlined.Schedule
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavHostController
import com.hardlineforge.lala.data.EditHistory
import com.hardlineforge.lala.ui.viewmodel.LalaViewModel
import java.time.ZoneId
import java.time.format.DateTimeFormatter

@Composable
fun EntryDetailScreen(
    navController: NavHostController,
    entryId: String,
    vm: LalaViewModel = hiltViewModel()
) {
    LaunchedEffect(entryId) { vm.loadEntry(entryId) }

    val entry by vm.selectedEntry.collectAsState()
    val photos by vm.photos.collectAsState()
    val videos by vm.videos.collectAsState()
    val history by vm.editHistory.collectAsState()
    var showDeleteConfirm by remember { mutableStateOf(false) }

    entry?.let { e ->
        val formatter = DateTimeFormatter.ofPattern("MMMM d, yyyy  h:mm a")
        val localTime = e.timestamp.atZone(ZoneId.of(e.timezone)).format(formatter)

        Scaffold(
            topBar = {
                TopAppBar(
                    title = { Text("Entry Detail") },
                    navigationIcon = {
                        IconButton(onClick = { navController.popBackStack() }) {
                            Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
                        }
                    },
                    actions = {
                        IconButton(onClick = {
                            navController.navigate("edit_entry/${e.id}")
                        }) {
                            Icon(Icons.Default.Edit, "Edit")
                        }
                        IconButton(onClick = { showDeleteConfirm = true }) {
                            Icon(Icons.Default.Delete, "Delete", tint = MaterialTheme.colorScheme.error)
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

                // Category chip
                Surface(
                    shape = MaterialTheme.shapes.small,
                    color = categoryColor(e.category).copy(alpha = 0.12f)
                ) {
                    Text(
                        text = e.category,
                        style = MaterialTheme.typography.labelMedium,
                        color = categoryColor(e.category),
                        modifier = Modifier.padding(horizontal = 12.dp, vertical = 4.dp)
                    )
                }

                // Timestamp
                Row(verticalAlignment = Alignment.CenterVertically) {
                    Icon(Icons.Outlined.Schedule, null, modifier = Modifier.size(16.dp))
                    Spacer(modifier = Modifier.width(6.dp))
                    Text(localTime, style = MaterialTheme.typography.bodyMedium)
                }

                // Location
                if (!e.locationName.isNullOrBlank()) {
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        Icon(Icons.Outlined.LocationOn, null, modifier = Modifier.size(16.dp))
                        Spacer(modifier = Modifier.width(6.dp))
                        Text(e.locationName, style = MaterialTheme.typography.bodyMedium)
                    }
                }

                // GPS
                if (e.gpsLat != null && e.gpsLon != null) {
                    Text(
                        text = "${e.gpsLat!!.format(6)}, ${e.gpsLon!!.format(6)}",
                        style = MaterialTheme.typography.labelSmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }

                Divider()

                // Comment
                Text("Comment", style = MaterialTheme.typography.labelLarge)
                Text(e.comment, style = MaterialTheme.typography.bodyLarge)

                // Edit history
                if (history.isNotEmpty()) {
                    Divider()
                    Text("Edit History", style = MaterialTheme.typography.labelLarge)
                    history.forEach { h ->
                        val histTime = h.editedAt.atZone(ZoneId.of(e.timezone))
                            .format(DateTimeFormatter.ofPattern("MMM d, h:mm a"))
                        Text(
                            "Edited: $histTime${h.note?.let { " — $it" } ?: ""}",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }

                // Tags
                if (e.tags.isNotBlank()) {
                    Divider()
                    Text("Tags", style = MaterialTheme.typography.labelLarge)
                    Row(horizontalArrangement = Arrangement.spacedBy(6.dp)) {
                        e.tags.split(",").filter { it.isNotBlank() }.forEach { tag ->
                            Surface(
                                shape = MaterialTheme.shapes.small,
                                color = MaterialTheme.colorScheme.surfaceVariant
                            ) {
                                Text(
                                    tag.trim(),
                                    modifier = Modifier.padding(horizontal = 8.dp, vertical = 2.dp),
                                    style = MaterialTheme.typography.labelSmall
                                )
                            }
                        }
                    }
                }

                // Photos
                if (photos.isNotEmpty()) {
                    Divider()
                    Text("Photos (${photos.size})", style = MaterialTheme.typography.labelLarge)
                    // Photo grid would go here
                }

                // Videos
                if (videos.isNotEmpty()) {
                    Divider()
                    Text("Videos (${videos.size})", style = MaterialTheme.typography.labelLarge)
                    // Video player + filmstrip button would go here
                }

                // Export button
                Spacer(modifier = Modifier.height(8.dp))
                Button(
                    onClick = { navController.navigate("pdf_preview") },
                    modifier = Modifier.fillMaxWidth(),
                    shape = MaterialTheme.shapes.medium
                ) {
                    Text("Export This Entry to PDF")
                }

                Spacer(modifier = Modifier.height(24.dp))
            }
        }
    }

    if (showDeleteConfirm) {
        AlertDialog(
            onDismissRequest = { showDeleteConfirm = false },
            title = { Text("Delete Entry?") },
            text = { Text("This cannot be undone.") },
            confirmButton = {
                TextButton(
                    onClick = {
                        entry?.let { vm.deleteEntry(it) }
                        showDeleteConfirm = false
                        navController.popBackStack()
                    }
                ) { Text("Delete", color = MaterialTheme.colorScheme.error) }
            },
            dismissButton = {
                TextButton(onClick = { showDeleteConfirm = false }) { Text("Cancel") }
            }
        )
    }
}

private fun Double.format(decimals: Int) = String.format("%.${decimals}f", this)
