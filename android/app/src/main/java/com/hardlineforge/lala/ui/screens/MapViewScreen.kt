package com.hardlineforge.lala.ui.screens

import androidx.compose.foundation.Canvas
import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.drawscope.Stroke
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.hardlineforge.lala.ui.viewmodel.LalaViewModel

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MapViewScreen(vm: LalaViewModel = hiltViewModel()) {
    val entries by vm.allEntries.collectAsState()
    val geotagged = entries.filter { it.gpsLat != null && it.gpsLon != null }
    val primaryColor = MaterialTheme.colorScheme.primary

    Scaffold(
        topBar = { 
            TopAppBar(
                title = { Text("Map View") }
            )
        }
    ) { innerPadding ->
        Box(modifier = Modifier.padding(innerPadding).fillMaxSize(), contentAlignment = Alignment.Center) {
            if (geotagged.isEmpty()) {
                Text("No geotagged entries yet.", style = MaterialTheme.typography.bodyLarge)
            } else {
                // Simple scatter plot of normalized GPS coords on a canvas
                val lats = geotagged.map { it.gpsLat!! }
                val lons = geotagged.map { it.gpsLon!! }
                val minLat = lats.minOrNull() ?: 0.0
                val maxLat = lats.maxOrNull() ?: 1.0
                val minLon = lons.minOrNull() ?: 0.0
                val maxLon = lons.maxOrNull() ?: 1.0
                val latRange = (maxLat - minLat).coerceAtLeast(0.0001)
                val lonRange = (maxLon - minLon).coerceAtLeast(0.0001)

                Canvas(modifier = Modifier.fillMaxSize().padding(24.dp)) {
                    val w = size.width
                    val h = size.height
                    drawRect(color = Color(0xFFF2F2F7), style = Stroke(width = 2f))
                    geotagged.forEach { e ->
                        val nx = ((e.gpsLon!! - minLon) / lonRange).toFloat() * w
                        val ny = h - (((e.gpsLat!! - minLat) / latRange).toFloat() * h)
                        drawCircle(color = primaryColor, radius = 6f, center = Offset(nx, ny))
                    }
                }
            }
        }
    }
}
