package com.hardlineforge.lala.ui.screens

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.hardlineforge.lala.ui.viewmodel.LalaViewModel

@Composable
fun SettingsScreen(vm: LalaViewModel = hiltViewModel()) {
    var darkMode by remember { mutableStateOf(false) }
    var fontSize by remember { mutableStateOf("default") } // small, default, large, xlarge
    var accentColor by remember { mutableStateOf("blue") } // blue, green, purple, orange

    Column(modifier = Modifier.fillMaxSize().padding(20.dp), verticalArrangement = Arrangement.spacedBy(20.dp)) {
        Text("Settings", style = MaterialTheme.typography.headlineMedium)

        // Appearance
        Text("Appearance", style = MaterialTheme.typography.titleMedium)
        Row(verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.SpaceBetween, modifier = Modifier.fillMaxWidth()) {
            Text("Dark Mode")
            Switch(checked = darkMode, onCheckedChange = { darkMode = it })
        }

        Text("Font Size", style = MaterialTheme.typography.labelLarge)
        SingleChoiceSegmentedButtonRow {
            listOf("small", "default", "large", "xlarge").forEach { size ->
                SegmentedButton(
                    selected = fontSize == size,
                    onClick = { fontSize = size },
                    shape = MaterialTheme.shapes.medium
                ) { Text(size.replaceFirstChar { it.uppercase() }) }
            }
        }

        Text("Accent Color", style = MaterialTheme.typography.labelLarge)
        SingleChoiceSegmentedButtonRow {
            listOf("blue", "green", "purple", "orange").forEach { color ->
                SegmentedButton(
                    selected = accentColor == color,
                    onClick = { accentColor = color },
                    shape = MaterialTheme.shapes.medium
                ) { Text(color.replaceFirstChar { it.uppercase() }) }
            }
        }

        Divider()

        // Data management
        Text("Data Management", style = MaterialTheme.typography.titleMedium)
        OutlinedButton(onClick = { /* import */ }, modifier = Modifier.fillMaxWidth(), shape = MaterialTheme.shapes.medium) {
            Text("Import Data")
        }
        OutlinedButton(onClick = { /* export all */ }, modifier = Modifier.fillMaxWidth(), shape = MaterialTheme.shapes.medium) {
            Text("Export All Data")
        }

        Divider()

        // Categories
        Text("Custom Categories", style = MaterialTheme.typography.titleMedium)
        val cats by vm.customCategories.collectAsState()
        cats.forEach { cat ->
            Row(modifier = Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.SpaceBetween, verticalAlignment = Alignment.CenterVertically) {
                Text(cat.name)
                TextButton(onClick = { vm.deleteCustomCategory(cat) }) { Text("Remove", color = MaterialTheme.colorScheme.error) }
            }
        }
        // Add new category input would go here
    }
}
