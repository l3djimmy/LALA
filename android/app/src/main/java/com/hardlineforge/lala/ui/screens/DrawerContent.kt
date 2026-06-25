package com.hardlineforge.lala.ui.screens

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Divider
import androidx.compose.material3.HorizontalDivider
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.NavigationDrawerItem
import androidx.compose.material3.Text
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.outlined.CalendarMonth
import androidx.compose.material.icons.outlined.Map
import androidx.compose.material.icons.outlined.PhotoLibrary
import androidx.compose.material.icons.outlined.PictureAsPdf
import androidx.compose.material.icons.outlined.Settings
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
            icon = { Icon(Icons.Outlined.CalendarMonth, contentDescription = null) },
            selected = false,
            onClick = {
                navController.navigate("timeline") { popUpTo("timeline") { inclusive = true } }
                onNavigate()
            }
        )
        NavigationDrawerItem(
            label = { Text("Map View") },
            icon = { Icon(Icons.Outlined.Map, contentDescription = null) },
            selected = false,
            onClick = {
                navController.navigate("map_view")
                onNavigate()
            }
        )
        NavigationDrawerItem(
            label = { Text("Media Gallery") },
            icon = { Icon(Icons.Outlined.PhotoLibrary, contentDescription = null) },
            selected = false,
            onClick = {
                navController.navigate("media_gallery")
                onNavigate()
            }
        )
        NavigationDrawerItem(
            label = { Text("Reports") },
            icon = { Icon(Icons.Outlined.PictureAsPdf, contentDescription = null) },
            selected = false,
            onClick = {
                navController.navigate("reports")
                onNavigate()
            }
        )
        NavigationDrawerItem(
            label = { Text("Settings") },
            icon = { Icon(Icons.Outlined.Settings, contentDescription = null) },
            selected = false,
            onClick = {
                navController.navigate("settings")
                onNavigate()
            }
        )
    }
}
