package com.hardlineforge.lala.pdf

import android.content.Context
import com.hardlineforge.lala.data.LogEntry
import com.itextpdf.kernel.geom.PageSize
import com.itextpdf.kernel.pdf.PdfDocument
import com.itextpdf.kernel.pdf.PdfWriter
import com.itextpdf.layout.Document
import com.itextpdf.layout.element.Paragraph
import com.itextpdf.layout.properties.TextAlignment
import dagger.hilt.android.qualifiers.ApplicationContext
import java.io.File
import java.time.ZoneId
import java.time.format.DateTimeFormatter
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class PdfGenerator @Inject constructor(
    @ApplicationContext private val context: Context
) {
    fun generate(entries: List<LogEntry>, file: File): File {
    fun generate(entries: List<LogEntry>, file: File): File {
        val writer = PdfWriter(file)
        val pdfDoc = PdfDocument(writer)
        val document = Document(pdfDoc, PageSize.LETTER)

        document.add(
            Paragraph("LALA — LOCAL AREA LOG REPORT")
                .setTextAlignment(TextAlignment.CENTER)
                .setFontSize(18f)
                .setBold()
        )
        document.add(
            Paragraph("Generated: ${java.time.Instant.now()}")
                .setTextAlignment(TextAlignment.CENTER)
                .setFontSize(10f)
        )
        document.add(Paragraph("
"))

        if (entries.isEmpty()) {
            document.add(Paragraph("No entries to report."))
        } else {
            entries.forEach { entry ->
                val fmt = DateTimeFormatter.ofPattern("MMMM d, yyyy  h:mm a z")
                val ts = entry.timestamp.atZone(ZoneId.of(entry.timezone)).format(fmt)

                document.add(Paragraph("────────────────────────────────────────").setFontSize(8f))
                document.add(Paragraph("Entry: ${entry.category}").setBold())
                document.add(Paragraph("Date/Time: $ts"))
                entry.locationName?.let { document.add(Paragraph("Location: $it")) }
                if (entry.gpsLat != null && entry.gpsLon != null) {
                    document.add(Paragraph("GPS: %.6f, %.6f".format(entry.gpsLat, entry.gpsLon)))
                }
                document.add(Paragraph("Comment:").setItalic())
                document.add(Paragraph(entry.comment))
                document.add(Paragraph("
"))
            }
        }

        document.close()
        return file
    }
}
