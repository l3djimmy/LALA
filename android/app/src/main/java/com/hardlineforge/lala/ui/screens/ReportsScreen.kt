package com.hardlineforge.lala.ui.screens

import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.DateRange
import androidx.compose.material.icons.filled.PictureAsPdf
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavHostController
import com.hardlineforge.lala.ui.viewmodel.LalaViewModel
import java.time.Instant
import java.time.LocalDate
import java.time.ZoneId

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ReportsScreen(navController: NavHostController, vm: LalaViewModel = hiltViewModel()) {
    var startDate by remember { mutableStateOf(LocalDate.now().minusMonths(1)) }
    var endDate by remember { mutableStateOf(LocalDate.now()) }
    var showStartPicker by remember { mutableStateOf(false) }
    var showEndPicker by remember { mutableStateOf(false) }
    var includePhotos by remember { mutableStateOf(true) }
    var includeFrames by remember { mutableStateOf(true) }
    var frameRate by remember { mutableStateOf(2) } // 1, 2, 5, 10

    Column(modifier = Modifier.fillMaxSize().padding(20.dp), verticalArrangement = Arrangement.spacedBy(16.dp)) {
        Text("Generate Report", style = MaterialTheme.typography.headlineMedium)

        // Date range
        Text("Date Range", style = MaterialTheme.typography.labelLarge)
        Row(horizontalArrangement = Arrangement.spacedBy(12.dp)) {
            OutlinedButton(onClick = { showStartPicker = true }, modifier = Modifier.weight(1f), shape = MaterialTheme.shapes.medium) {
                Text(startDate.toString())
            }
            OutlinedButton(onClick = { showEndPicker = true }, modifier = Modifier.weight(1f), shape = MaterialTheme.shapes.medium) {
                Text(endDate.toString())
            }
        }

        // Options
        Text("Options", style = MaterialTheme.typography.labelLarge)
        Row(verticalAlignment = Alignment.CenterVertically) {
            Checkbox(checked = includePhotos, onCheckedChange = { includePhotos = it })
            Text("Include photos")
        }
        Row(verticalAlignment = Alignment.CenterVertically) {
            Checkbox(checked = includeFrames, onCheckedChange = { includeFrames = it })
            Text("Include video filmstrip")
        }
        if (includeFrames) {
            Text("Frames per second", style = MaterialTheme.typography.labelMedium)
            SingleChoiceSegmentedButtonRow {
                listOf(1, 2, 5, 10).forEach { fps ->
                    SegmentedButton(
                        selected = frameRate == fps,
                        onClick = { frameRate = fps },
                        shape = MaterialTheme.shapes.medium
                    ) { Text("$fps fps") }
                }
            }
        }

        Spacer(modifier = Modifier.weight(1f))

        Button(
            onClick = {
                val start = startDate.atStartOfDay(ZoneId.systemDefault()).toInstant()
                val end = endDate.plusDays(1).atStartOfDay(ZoneId.systemDefault()).toInstant()
                // Trigger PDF generation via ViewModel then navigate
                navController.navigate("pdf_preview")
            },
            modifier = Modifier.fillMaxWidth(),
            shape = MaterialTheme.shapes.medium
        ) {
            Icon(imageVector = Icons.Default.PictureAsPdf, contentDescription = null)
            Spacer(modifier = Modifier.width(8.dp))
            Text("Generate PDF Report")
        }
    }
}
