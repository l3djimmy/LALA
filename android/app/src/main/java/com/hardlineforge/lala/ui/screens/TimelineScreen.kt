package com.hardlineforge.lala.ui.screens

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Add
import androidx.compose.material.icons.outlined.LocationOn
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavHostController
import com.hardlineforge.lala.data.LogEntry
import com.hardlineforge.lala.ui.theme.categoryColor
import com.hardlineforge.lala.ui.viewmodel.LalaViewModel
import java.time.format.DateTimeFormatter
import java.time.ZoneId

@Composable
fun TimelineScreen(navController: NavHostController, vm: LalaViewModel = hiltViewModel()) {
    val entries by vm.allEntries.collectAsState()
    var selectedCategory by remember { mutableStateOf<String?>(null) }

    val filtered = if (selectedCategory == null) entries
    else entries.filter { it.category == selectedCategory }

    Scaffold(
        floatingActionButton = {
            ExtendedFloatingActionButton(
                onClick = { navController.navigate("new_entry") },
                icon = { Icon(Icons.Default.Add, null) },
                text = { Text("Log") }
            )
        }
    ) { padding ->
        LazyColumn(
            modifier = Modifier.padding(padding),
            contentPadding = PaddingValues(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            // Date grouped headers
            val grouped = filtered.groupBy {
                it.timestamp.atZone(java.time.ZoneId.systemDefault()).toLocalDate()
            }

            grouped.forEach { (date, dayEntries) ->
                item {
                    Text(
                        text = date.format(DateTimeFormatter.ofPattern("MMMM d, yyyy")),
                        style = MaterialTheme.typography.titleLarge,
                        color = MaterialTheme.colorScheme.primary,
                        modifier = Modifier.padding(top = 8.dp, bottom = 4.dp)
                    )
                }
                items(dayEntries, key = { it.id }) { entry ->
                    TimelineCard(entry, navController, vm)
                }
            }
        }
    }
}

@Composable
private fun TimelineCard(entry: LogEntry, navController: NavHostController, vm: LalaViewModel) {
    val formatter = DateTimeFormatter.ofPattern("h:mm a")
    val localTime = entry.timestamp.atZone(java.time.ZoneId.systemDefault()).format(formatter)

    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable { navController.navigate("entry_detail/${entry.id}") },
        shape = MaterialTheme.shapes.large,
        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surface)
    ) {
        Row(modifier = Modifier.padding(16.dp), verticalAlignment = Alignment.Top) {
            // Category color dot
            Box(
                modifier = Modifier
                    .size(12.dp)
                    .clip(CircleShape)
                    .background(categoryColor(entry.category))
                    .padding(top = 4.dp)
            )
            Spacer(modifier = Modifier.width(12.dp))
            Column(modifier = Modifier.weight(1f)) {
                Row(verticalAlignment = Alignment.CenterVertically) {
                    Text(
                        text = localTime,
                        style = MaterialTheme.typography.labelMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Surface(
                        shape = MaterialTheme.shapes.small,
                        color = categoryColor(entry.category).copy(alpha = 0.12f)
                    ) {
                        Text(
                            text = entry.category,
                            style = MaterialTheme.typography.labelSmall,
                            color = categoryColor(entry.category),
                            modifier = Modifier.padding(horizontal = 8.dp, vertical = 2.dp)
                        )
                    }
                }
                Spacer(modifier = Modifier.height(4.dp))
                Text(
                    text = entry.comment,
                    style = MaterialTheme.typography.bodyMedium,
                    maxLines = 3,
                    overflow = TextOverflow.Ellipsis
                )
                if (!entry.locationName.isNullOrBlank()) {
                    Spacer(modifier = Modifier.height(4.dp))
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        Icon(
                            Icons.Outlined.LocationOn,
                            contentDescription = null,
                            modifier = Modifier.size(14.dp),
                            tint = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                        Spacer(modifier = Modifier.width(4.dp))
                        Text(
                            text = entry.locationName,
                            style = MaterialTheme.typography.labelMedium,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }
            }
        }
    }
}
