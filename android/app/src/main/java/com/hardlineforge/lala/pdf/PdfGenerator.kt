package com.hardlineforge.lala.pdf

import android.content.Context
import com.hardlineforge.lala.data.LogEntry
import com.hardlineforge.lala.data.LogRepository
import com.itextpdf.io.image.ImageDataFactory
import com.itextpdf.kernel.colors.ColorConstants
import com.itextpdf.kernel.colors.DeviceGray
import com.itextpdf.kernel.events.Event
import com.itextpdf.kernel.events.IEventHandler
import com.itextpdf.kernel.events.PdfDocumentEvent
import com.itextpdf.kernel.font.PdfFontFactory
import com.itextpdf.kernel.geom.PageSize
import com.itextpdf.kernel.pdf.PdfDocument
import com.itextpdf.kernel.pdf.PdfWriter
import com.itextpdf.kernel.pdf.canvas.PdfCanvas
import com.itextpdf.kernel.pdf.extgstate.PdfExtGState
import com.itextpdf.layout.Document
import com.itextpdf.layout.borders.Border
import com.itextpdf.layout.element.Cell
import com.itextpdf.layout.element.Image
import com.itextpdf.layout.element.Paragraph
import com.itextpdf.layout.element.Table
import com.itextpdf.layout.properties.TextAlignment
import com.itextpdf.layout.properties.UnitValue
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.io.File
import java.time.ZoneId
import java.time.format.DateTimeFormatter
import javax.inject.Inject
import javax.inject.Singleton

private const val MAX_THUMBS_PER_STRIP = 8

@Singleton
class PdfGenerator @Inject constructor(
    @ApplicationContext private val context: Context,
    private val repo: LogRepository
) {
    /**
     * Builds the case log PDF report, embedding photos and video filmstrip frames per entry.
     * When [isPremium] is false, a diagonal "FREE VERSION" watermark is stamped on every page.
     */
    suspend fun generate(entries: List<LogEntry>, file: File, isPremium: Boolean): File =
        withContext(Dispatchers.IO) {
            val writer = PdfWriter(file)
            val pdfDoc = PdfDocument(writer)
            if (!isPremium) {
                pdfDoc.addEventHandler(PdfDocumentEvent.END_PAGE, WatermarkEventHandler())
            }
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
            if (!isPremium) {
                document.add(
                    Paragraph("Free version — upgrade to Premium in Settings to remove this watermark.")
                        .setTextAlignment(TextAlignment.CENTER)
                        .setFontSize(9f)
                        .setFontColor(ColorConstants.RED)
                )
            }
            document.add(Paragraph("\n"))

            if (entries.isEmpty()) {
                document.add(Paragraph("No entries to report."))
            } else {
                entries.forEach { entry -> addEntry(document, entry) }
            }

            document.close()
            file
        }

    private suspend fun addEntry(document: Document, entry: LogEntry) {
        val fmt = DateTimeFormatter.ofPattern("MMMM d, yyyy  h:mm a z")
        val ts = entry.timestamp.atZone(ZoneId.of(entry.timezone)).format(fmt)

        document.add(Paragraph("────────────────────────────────────────").setFontSize(8f))
        if (entry.title.isNotBlank()) {
            document.add(Paragraph(entry.title).setBold().setFontSize(13f))
        }
        document.add(Paragraph("Entry: ${entry.category}").setBold())
        document.add(Paragraph("Date/Time: $ts"))
        entry.locationName?.let { document.add(Paragraph("Location: $it")) }
        if (entry.gpsLat != null && entry.gpsLon != null) {
            document.add(Paragraph("GPS: %.6f, %.6f".format(entry.gpsLat, entry.gpsLon)))
        }
        document.add(Paragraph("Comment:").setItalic())
        document.add(Paragraph(entry.comment))

        val photos = repo.getPhotos(entry.id)
        if (photos.isNotEmpty()) {
            document.add(Paragraph("Photos:").setBold().setFontSize(10f))
            addImageStrip(document, photos.map { it.uri })
        }

        repo.getVideos(entry.id).forEach { video ->
            val frames = repo.getVideoFrames(video.id).sortedBy { it.frameNumber }
            if (frames.isNotEmpty()) {
                document.add(Paragraph("Video Filmstrip (${frames.size} frames):").setBold().setFontSize(10f))
                addImageStrip(document, frames.map { it.uri })
            }
        }

        document.add(Paragraph("\n"))
    }

    private fun addImageStrip(document: Document, paths: List<String>) {
        val shown = paths.take(MAX_THUMBS_PER_STRIP)
        val table = Table(UnitValue.createPercentArray(shown.size.coerceAtLeast(1))).useAllAvailableWidth()
        shown.forEach { path ->
            val cell = Cell().setBorder(Border.NO_BORDER).setPadding(2f)
            val file = File(path)
            if (file.exists()) {
                try {
                    val img = Image(ImageDataFactory.create(file.absolutePath)).setAutoScale(true)
                    cell.add(img)
                } catch (_: Exception) {
                    cell.add(Paragraph("[unreadable]").setFontSize(6f))
                }
            } else {
                cell.add(Paragraph("[missing]").setFontSize(6f))
            }
            table.addCell(cell)
        }
        if (paths.size > MAX_THUMBS_PER_STRIP) {
            document.add(table)
            document.add(Paragraph("+ ${paths.size - MAX_THUMBS_PER_STRIP} more frame(s) not shown").setFontSize(7f).setItalic())
        } else {
            document.add(table)
        }
    }
}

private class WatermarkEventHandler : IEventHandler {
    override fun handleEvent(event: Event) {
        val docEvent = event as PdfDocumentEvent
        val pdfDoc = docEvent.document
        val page = docEvent.page
        val pageSize = page.pageSizeWithRotation
        val canvas = PdfCanvas(page.newContentStreamBefore(), page.resources, pdfDoc)

        val text = "LALA — FREE VERSION"
        val angleRad = Math.toRadians(45.0)
        val a = Math.cos(angleRad).toFloat()
        val b = Math.sin(angleRad).toFloat()
        val c = -b
        val d = a
        val originX = (pageSize.width / 2 - 190f)
        val originY = (pageSize.height / 2 - 40f)

        canvas.saveState()
        canvas.setExtGState(PdfExtGState().setFillOpacity(0.18f))
        canvas.setFillColor(DeviceGray(0.4f))
        canvas.beginText()
        canvas.setFontAndSize(PdfFontFactory.createFont(), 46f)
        canvas.setTextMatrix(a, b, c, d, originX, originY)
        canvas.showText(text)
        canvas.endText()
        canvas.restoreState()
    }
}
