package com.hardlineforge.lala.ui.screens

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.CalendarMonth
import androidx.compose.material.icons.filled.Map
import androidx.compose.material.icons.filled.PhotoLibrary
import androidx.compose.material.icons.filled.PictureAsPdf
import androidx.compose.material.icons.filled.Settings
import androidx.compose.material3.HorizontalDivider
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.NavigationDrawerItem
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.navigation.NavHostController

@Composable
fun DrawerContent(navController: NavHostController, onNavigate: () -> Unit) {
    Column(modifier = Modifier.padding(horizontal = 16.dp)) {
        Spacer(modifier = Modifier.height(48.dp))
        Text(
            text = "LALA",
            style = MaterialTheme.typography.displayMedium,
            color = MaterialTheme.colorScheme.primary
        )
        Text(
            text = "Local Area Log",
            style = MaterialTheme.typography.bodyMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
        Spacer(modifier = Modifier.height(24.dp))
        HorizontalDivider()
        Spacer(modifier = Modifier.height(8.dp))

        NavigationDrawerItem(
            label = { Text("Timeline") },
            icon = { Icon(Icons.Filled.CalendarMonth, contentDescription = null) },
            selected = false,
            onClick = {
                navController.navigate("timeline") { popUpTo("timeline") { inclusive = true } }
                onNavigate()
            }
        )
        NavigationDrawerItem(
            label = { Text("Map View") },
            icon = { Icon(Icons.Filled.Map, contentDescription = null) },
            selected = false,
            onClick = {
                navController.navigate("map_view")
                onNavigate()
            }
        )
        NavigationDrawerItem(
            label = { Text("Media Gallery") },
            icon = { Icon(Icons.Filled.PhotoLibrary, contentDescription = null) },
            selected = false,
            onClick = {
                navController.navigate("media_gallery")
                onNavigate()
            }
        )
        NavigationDrawerItem(
            label = { Text("Reports") },
            icon = { Icon(Icons.Filled.PictureAsPdf, contentDescription = null) },
            selected = false,
            onClick = {
                navController.navigate("reports")
                onNavigate()
            }
        )
        NavigationDrawerItem(
            label = { Text("Settings") },
            icon = { Icon(Icons.Filled.Settings, contentDescription = null) },
            selected = false,
            onClick = {
                navController.navigate("settings")
                onNavigate()
            }
        )
    }
}
