package com.hardlineforge.lala.ui.screens

import android.content.Intent
import android.widget.Toast
import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.Download
import androidx.compose.material.icons.filled.Share
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.core.content.FileProvider
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavHostController
import com.hardlineforge.lala.pdf.ExportManager
import com.hardlineforge.lala.pdf.ExportMode
import com.hardlineforge.lala.ui.viewmodel.LalaViewModel
import com.hardlineforge.lala.util.MediaExporter
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun PdfPreviewScreen(
    navController: NavHostController,
    initialMode: ExportMode,
    entryId: String?,
    startMs: Long?,
    endMs: Long?,
    vm: LalaViewModel = hiltViewModel()
) {
    val context = LocalContext.current
    val scope = rememberCoroutineScope()
    val exportManager = vm.exportManager
    val state by exportManager.state.collectAsState()
    val isPremium by vm.isPremium.collectAsState()

    var started by rememberSaveable { mutableStateOf(false) }
    var showCapDialog by rememberSaveable { mutableStateOf(false) }
    var capBytes by rememberSaveable { mutableStateOf(0L) }
    var isSaving by remember { mutableStateOf(false) }

    fun begin(mode: ExportMode) {
        started = true
        showCapDialog = false
        exportManager.reset()
        exportManager.start(mode, entryId, startMs, endMs)
    }

    LaunchedEffect(Unit) {
        if (!started) {
            if (initialMode == ExportMode.DIGITAL) {
                val entries = exportManager.entriesFor(entryId, startMs, endMs)
                val bytes = exportManager.totalVideoBytes(entries)
                if (bytes > ExportManager.DIGITAL_SIZE_CAP_BYTES) {
                    capBytes = bytes
                    showCapDialog = true
                } else {
                    begin(ExportMode.DIGITAL)
                }
            } else {
                begin(ExportMode.PRINT)
            }
        }
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Report Preview") },
                navigationIcon = {
                    IconButton(onClick = { navController.popBackStack() }) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
                    }
                }
            )
        }
    ) { paddingValues ->
        Column(modifier = Modifier.padding(paddingValues).fillMaxSize()) {
            if (!isPremium) {
                Surface(color = MaterialTheme.colorScheme.errorContainer) {
                    Row(
                        modifier = Modifier.fillMaxWidth().padding(horizontal = 16.dp, vertical = 8.dp),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text(
                            "Free version — reports include a watermark.",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onErrorContainer
                        )
                        TextButton(onClick = { navController.navigate("settings") }) { Text("Upgrade") }
                    }
                }
            }

            Box(modifier = Modifier.weight(1f).fillMaxWidth(), contentAlignment = Alignment.Center) {
                when (val s = state) {
                    is ExportManager.State.Running -> {
                        Column(
                            horizontalAlignment = Alignment.CenterHorizontally,
                            verticalArrangement = Arrangement.spacedBy(16.dp),
                            modifier = Modifier.padding(32.dp)
                        ) {
                            Text(modeTitle(s.mode), style = MaterialTheme.typography.titleMedium)
                            LinearProgressIndicator(
                                progress = { if (s.total > 0) s.done.toFloat() / s.total else 0f },
                                modifier = Modifier.fillMaxWidth()
                            )
                            Text(
                                "Generating entry ${s.done} of ${s.total}…",
                                style = MaterialTheme.typography.bodyMedium
                            )
                            Text(
                                "The export keeps running if you leave this screen.",
                                style = MaterialTheme.typography.labelSmall,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                    }
                    is ExportManager.State.Done -> {
                        Column(
                            horizontalAlignment = Alignment.CenterHorizontally,
                            verticalArrangement = Arrangement.spacedBy(12.dp),
                            modifier = Modifier.padding(32.dp)
                        ) {
                            Text(modeTitle(s.mode), style = MaterialTheme.typography.titleMedium)
                            Text(
                                "PDF ready — ${sizeLabel(s.sizeBytes)}",
                                style = MaterialTheme.typography.bodyLarge
                            )
                            Text(
                                if (s.mode == ExportMode.DIGITAL)
                                    "Original videos are embedded as attachments. Recipients open the attachments panel in their PDF viewer to play or save them."
                                else
                                    "Videos are rendered as printable filmstrips. No files are embedded.",
                                style = MaterialTheme.typography.bodySmall,
                                textAlign = TextAlign.Center,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                            Spacer(modifier = Modifier.height(8.dp))
                            Button(
                                onClick = {
                                    try {
                                        val uri = FileProvider.getUriForFile(
                                            context, "${context.packageName}.fileprovider", s.file
                                        )
                                        val intent = Intent(Intent.ACTION_SEND).apply {
                                            type = "application/pdf"
                                            putExtra(Intent.EXTRA_STREAM, uri)
                                            addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
                                        }
                                        context.startActivity(Intent.createChooser(intent, "Share PDF"))
                                    } catch (e: Exception) {
                                        Toast.makeText(context, "Failed to share: ${e.message}", Toast.LENGTH_LONG).show()
                                    }
                                },
                                modifier = Modifier.fillMaxWidth(),
                                shape = MaterialTheme.shapes.medium
                            ) {
                                Icon(Icons.Filled.Share, contentDescription = null)
                                Spacer(modifier = Modifier.width(8.dp))
                                Text("Share PDF")
                            }
                            OutlinedButton(
                                onClick = {
                                    if (isSaving) return@OutlinedButton
                                    isSaving = true
                                    scope.launch {
                                        val savedTo = withContext(Dispatchers.IO) {
                                            MediaExporter.saveFileToDownloads(context, s.file, "application/pdf")
                                        }
                                        isSaving = false
                                        Toast.makeText(
                                            context,
                                            if (savedTo != null) "PDF saved to $savedTo" else "Failed to save PDF",
                                            Toast.LENGTH_LONG
                                        ).show()
                                    }
                                },
                                enabled = !isSaving,
                                modifier = Modifier.fillMaxWidth(),
                                shape = MaterialTheme.shapes.medium
                            ) {
                                Icon(Icons.Filled.Download, contentDescription = null)
                                Spacer(modifier = Modifier.width(8.dp))
                                Text(if (isSaving) "Saving…" else "Save to Downloads")
                            }
                        }
                    }
                    is ExportManager.State.Failed -> {
                        Column(
                            horizontalAlignment = Alignment.CenterHorizontally,
                            verticalArrangement = Arrangement.spacedBy(12.dp),
                            modifier = Modifier.padding(32.dp)
                        ) {
                            Text("Export failed", style = MaterialTheme.typography.titleMedium)
                            Text(
                                s.message,
                                style = MaterialTheme.typography.bodyMedium,
                                textAlign = TextAlign.Center,
                                color = MaterialTheme.colorScheme.error
                            )
                            Button(onClick = { begin(initialMode) }, shape = MaterialTheme.shapes.medium) {
                                Text("Retry")
                            }
                        }
                    }
                    ExportManager.State.Idle -> {
                        if (!showCapDialog) CircularProgressIndicator()
                    }
                }
            }
        }
    }

    if (showCapDialog) {
        AlertDialog(
            onDismissRequest = {
                showCapDialog = false
                navController.popBackStack()
            },
            title = { Text("Large videos") },
            text = {
                Text(
                    "The videos in this export total ${sizeLabel(capBytes)}, which is over the " +
                        "${sizeLabel(ExportManager.DIGITAL_SIZE_CAP_BYTES)} recommended limit for embedding. " +
                        "Very large PDFs can be slow to share and may fail to open in some viewers.\n\n" +
                        "Embed the videos anyway, or switch to a Print PDF (filmstrips, no embedded files)?"
                )
            },
            confirmButton = {
                TextButton(onClick = { begin(ExportMode.DIGITAL) }) { Text("Embed anyway") }
            },
            dismissButton = {
                TextButton(onClick = { begin(ExportMode.PRINT) }) { Text("Switch to Print PDF") }
            }
        )
    }
}

private fun modeTitle(mode: ExportMode): String =
    if (mode == ExportMode.PRINT) "Print PDF — optimized for paper"
    else "Digital PDF — videos included"

private fun sizeLabel(bytes: Long): String = when {
    bytes >= 1_048_576 -> "%.1f MB".format(bytes / 1_048_576.0)
    bytes >= 1024 -> "%.0f KB".format(bytes / 1024.0)
    else -> "$bytes B"
}
