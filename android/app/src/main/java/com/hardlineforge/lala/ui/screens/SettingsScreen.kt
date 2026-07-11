package com.hardlineforge.lala.ui.screens

import android.content.Intent
import android.widget.Toast
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.unit.dp
import androidx.core.content.FileProvider
import androidx.hilt.navigation.compose.hiltViewModel
import com.hardlineforge.lala.ui.viewmodel.LalaViewModel
import java.io.File

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun SettingsScreen(vm: LalaViewModel = hiltViewModel()) {
    val darkMode by vm.darkMode.collectAsState()
    val fontSize by vm.fontSize.collectAsState() // small, default, large, xlarge
    val accentColor by vm.accentColor.collectAsState() // blue, green, purple, orange

    Column(
        modifier = Modifier.fillMaxSize().verticalScroll(rememberScrollState()).padding(20.dp),
        verticalArrangement = Arrangement.spacedBy(20.dp)
    ) {
        Text("Settings", style = MaterialTheme.typography.headlineMedium)

        // Subscription
        val isPremium by vm.isPremium.collectAsState()
        Text("Subscription", style = MaterialTheme.typography.titleMedium)
        Card {
            Column(modifier = Modifier.padding(16.dp), verticalArrangement = Arrangement.spacedBy(8.dp)) {
                Text(
                    if (isPremium) "Premium — no watermark on exported PDFs" else "Free tier — exported PDFs include a watermark",
                    style = MaterialTheme.typography.bodyMedium
                )
                Button(
                    onClick = { vm.setPremium(!isPremium) },
                    modifier = Modifier.fillMaxWidth(),
                    shape = MaterialTheme.shapes.medium
                ) {
                    Text(if (isPremium) "Switch to Free Tier" else "Upgrade to Premium")
                }
                Text(
                    "Placeholder toggle — real in-app purchases via Google Play Billing coming soon.",
                    style = MaterialTheme.typography.labelSmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }

        HorizontalDivider()

        // Appearance
        Text("Appearance", style = MaterialTheme.typography.titleMedium)
        Row(verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.SpaceBetween, modifier = Modifier.fillMaxWidth()) {
            Text("Dark Mode")
            Switch(checked = darkMode, onCheckedChange = { vm.setDarkMode(it) })
        }

        Text("Font Size", style = MaterialTheme.typography.labelLarge)
        SingleChoiceSegmentedButtonRow {
            listOf("small", "default", "large", "xlarge").forEach { size ->
                SegmentedButton(
                    selected = fontSize == size,
                    onClick = { vm.setFontSize(size) },
                    shape = MaterialTheme.shapes.medium
                ) { Text(size.replaceFirstChar { it.uppercase() }) }
            }
        }

        Text("Accent Color", style = MaterialTheme.typography.labelLarge)
        SingleChoiceSegmentedButtonRow {
            listOf("blue", "green", "purple", "orange").forEach { color ->
                SegmentedButton(
                    selected = accentColor == color,
                    onClick = { vm.setAccentColor(color) },
                    shape = MaterialTheme.shapes.medium
                ) { Text(color.replaceFirstChar { it.uppercase() }) }
            }
        }

        HorizontalDivider()

        // Data management
        Text("Data Management", style = MaterialTheme.typography.titleMedium)
        OutlinedButton(onClick = { /* import */ }, modifier = Modifier.fillMaxWidth(), shape = MaterialTheme.shapes.medium) {
            Text("Import Data")
        }
        OutlinedButton(onClick = { /* export all */ }, modifier = Modifier.fillMaxWidth(), shape = MaterialTheme.shapes.medium) {
            Text("Export All Data")
        }

        HorizontalDivider()

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

        HorizontalDivider()

        // Debug
        Text("Debug", style = MaterialTheme.typography.titleMedium)
        val context = LocalContext.current
        OutlinedButton(
            onClick = {
                val logFile = File(context.filesDir, "logs/crash_log.txt")
                if (!logFile.exists()) {
                    Toast.makeText(context, "No crash log yet", Toast.LENGTH_SHORT).show()
                    return@OutlinedButton
                }
                val uri = FileProvider.getUriForFile(context, "${context.packageName}.fileprovider", logFile)
                val intent = Intent(Intent.ACTION_SEND).apply {
                    type = "text/plain"
                    putExtra(Intent.EXTRA_STREAM, uri)
                    addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
                }
                context.startActivity(Intent.createChooser(intent, "Share crash log"))
            },
            modifier = Modifier.fillMaxWidth(),
            shape = MaterialTheme.shapes.medium
        ) {
            Text("Share Crash Log")
        }
    }
}
