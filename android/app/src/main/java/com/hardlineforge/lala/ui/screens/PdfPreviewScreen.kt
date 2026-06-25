package com.hardlineforge.lala.ui.screens

import android.content.Context
import android.os.Environment
import android.widget.Toast
import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material3.*
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.compose.ui.Alignment
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.unit.dp
import androidx.navigation.NavHostController
import com.github.afreakyelf.pdfviewer.AndroidPdfViewer
import com.hardlineforge.lala.pdf.PdfGenerator
import java.io.File
import java.io.FileOutputStream

@Composable
fun PdfPreviewScreen(navController: NavHostController) {
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
        val context = LocalContext.current
n        var pdfBytes by remember { mutableStateOf<ByteArray?>(null) }
        var isSaving by remember { mutableStateOf(false) }
        var saveError by remember { mutableStateOf<String?>(null) }

        val viewModel: LogViewModel = viewModel()
        val entries by viewModel.logEntries.collectAsState()

        LaunchedEffect(entries) {
            if (entries.isNotEmpty()) {
                val file = File(context.cacheDir, "temp_report.pdf")
                pdfBytes = try {
                    PdfGenerator().generate(entries, file).readBytes()
                } catch (e: Exception) {
                    Toast.makeText(context, "Failed to generate PDF: ${e.message}", Toast.LENGTH_LONG).show()
                    null
                }
            }
        }

        Column(modifier = Modifier.padding(paddingValues).fillMaxSize()) {
            if (pdfBytes == null) {
                Box(modifier = Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
                    CircularProgressIndicator()
                }
            } else {
                AndroidPdfViewer(
                    modifier = Modifier.weight(1f),
                    pdfData = pdfBytes!!,
                    enableSwipe = true,
                    nightMode = false
                )
                Spacer(modifier = Modifier.height(16.dp))
                Button(
                    onClick = {
                        isSaving = true
                        saveError = null
                        try {
                            val downloadsDir = try {
                                Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS)
                            } catch (e: Exception) {
                                null
                            }
                            val file = if (downloadsDir != null && downloadsDir.exists()) {
                                File(downloadsDir, "LALA_Report_${System.currentTimeMillis()}.pdf")
                            } else {
                                File(context.getExternalFilesDir(null), "LALA_Report_${System.currentTimeMillis()}.pdf")
                            }
                            FileOutputStream(file).use { output ->
                                output.write(pdfBytes)
                            }
                            Toast.makeText(context, "PDF saved to ${file.absolutePath}", Toast.LENGTH_LONG).show()n                        } catch (e: Exception) {
                            saveError = e.localizedMessage ?: "Failed to save PDF"
                        } finally {
                            isSaving = false
                        }
                    },
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(horizontal = 16.dp),
                    enabled = !isSaving
                ) {
                    Text(if (isSaving) "Saving..." else "Save PDF")
                }
                if (saveError != null) {
                    Text(
                        text = saveError!!,
                        color = MaterialTheme.colorScheme.error,
                        modifier = Modifier.padding(16.dp)
                    )
                }
            }
        }
    }
}
