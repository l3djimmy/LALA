package com.hardlineforge.lala.pdf

import android.content.Context
import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.Paint
import android.graphics.Path
import android.media.MediaMetadataRetriever
import com.hardlineforge.lala.data.LogEntry
import com.hardlineforge.lala.data.LogRepository
import com.hardlineforge.lala.data.Video
import com.hardlineforge.lala.util.DebugLog
import com.itextpdf.io.image.ImageDataFactory
import com.itextpdf.kernel.colors.ColorConstants
import com.itextpdf.kernel.colors.DeviceGray
import com.itextpdf.kernel.events.Event
import com.itextpdf.kernel.events.IEventHandler
import com.itextpdf.kernel.events.PdfDocumentEvent
import com.itextpdf.kernel.font.PdfFontFactory
import com.itextpdf.kernel.geom.PageSize
import com.itextpdf.kernel.geom.Rectangle
import com.itextpdf.kernel.pdf.PdfDocument
import com.itextpdf.kernel.pdf.PdfName
import com.itextpdf.kernel.pdf.PdfWriter
import com.itextpdf.kernel.pdf.annot.PdfAnnotation
import com.itextpdf.kernel.pdf.annot.PdfFileAttachmentAnnotation
import com.itextpdf.kernel.pdf.canvas.PdfCanvas
import com.itextpdf.kernel.pdf.extgstate.PdfExtGState
import com.itextpdf.kernel.pdf.filespec.PdfFileSpec
import com.itextpdf.layout.Document
import com.itextpdf.layout.borders.Border
import com.itextpdf.layout.element.AreaBreak
import com.itextpdf.layout.element.Cell
import com.itextpdf.layout.element.Image
import com.itextpdf.layout.element.Paragraph
import com.itextpdf.layout.element.Table
import com.itextpdf.layout.properties.TextAlignment
import com.itextpdf.layout.properties.UnitValue
import com.itextpdf.layout.renderer.DrawContext
import com.itextpdf.layout.renderer.IRenderer
import com.itextpdf.layout.renderer.ImageRenderer
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.io.ByteArrayOutputStream
import java.io.File
import java.io.FileInputStream
import java.io.InputStream
import java.time.Instant
import java.time.ZoneId
import java.time.format.DateTimeFormatter
import javax.inject.Inject
import javax.inject.Singleton

/** How each video is represented in the exported PDF. */
enum class ExportMode {
    /** Paper-friendly: videos rendered as extracted-frame filmstrips, nothing embedded. */
    PRINT,

    /** Screen-friendly: original video files embedded byte-for-byte as PDF file attachments. */
    DIGITAL
}

private const val MAX_THUMBS_PER_STRIP = 8
private const val PRINT_FILMSTRIP_FRAMES = 6
private const val FILMSTRIP_FRAME_HEIGHT_PX = 160
private const val DIGITAL_THUMB_WIDTH_PX = 480

private data class AttachedVideo(
    val fileName: String,
    val sizeBytes: Long,
    val durationSeconds: Int,
    val timestamp: Instant,
    val gpsLat: Double?,
    val gpsLon: Double?
)

@Singleton
class PdfGenerator @Inject constructor(
    @ApplicationContext private val context: Context,
    private val repo: LogRepository
) {
    /**
     * Builds the case log PDF report. Photos always render inline. Videos render according
     * to [mode]: PRINT lays out an evenly-spaced frame filmstrip per video; DIGITAL embeds
     * the original, unmodified video files as PDF attachments (EmbeddedFiles name tree)
     * behind a single representative thumbnail, plus an "Attached Media" summary page.
     * When [isPremium] is false, a diagonal "FREE VERSION" watermark is stamped on every page.
     */
    suspend fun generate(
        entries: List<LogEntry>,
        file: File,
        isPremium: Boolean,
        mode: ExportMode = ExportMode.PRINT,
        onProgress: (done: Int, total: Int) -> Unit = { _, _ -> }
    ): File = withContext(Dispatchers.IO) {
        // Embedded video content is streamed from these during document.close(), so they
        // must stay open until the document is fully written.
        val openStreams = mutableListOf<InputStream>()
        val attachments = mutableListOf<AttachedVideo>()
        val usedNames = mutableSetOf<String>()

        val writer = PdfWriter(file)
        val pdfDoc = PdfDocument(writer)
        if (!isPremium) {
            pdfDoc.addEventHandler(PdfDocumentEvent.END_PAGE, WatermarkEventHandler())
        }
        // Margins ≥0.66in are safe for both US Letter and A4 printers.
        val document = Document(pdfDoc, PageSize.LETTER)
        document.setMargins(48f, 48f, 48f, 48f)

        try {
            document.add(
                Paragraph("LALA — LOCAL AREA LOG REPORT")
                    .setTextAlignment(TextAlignment.CENTER)
                    .setFontSize(18f)
                    .setBold()
            )
            document.add(
                Paragraph("Generated: ${Instant.now()}")
                    .setTextAlignment(TextAlignment.CENTER)
                    .setFontSize(10f)
            )
            document.add(
                Paragraph(
                    if (mode == ExportMode.PRINT)
                        "Print edition — videos shown as frame filmstrips."
                    else
                        "Digital edition — original video files are embedded in this PDF (see Attached Media)."
                )
                    .setTextAlignment(TextAlignment.CENTER)
                    .setFontSize(9f)
                    .setItalic()
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
                entries.forEachIndexed { index, entry ->
                    addEntry(document, pdfDoc, entry, mode, attachments, usedNames, openStreams)
                    onProgress(index + 1, entries.size)
                }
            }

            if (mode == ExportMode.DIGITAL && attachments.isNotEmpty()) {
                addAttachmentSummary(document, attachments)
            }
        } finally {
            runCatching { document.close() }
            openStreams.forEach { runCatching { it.close() } }
        }
        file
    }

    private suspend fun addEntry(
        document: Document,
        pdfDoc: PdfDocument,
        entry: LogEntry,
        mode: ExportMode,
        attachments: MutableList<AttachedVideo>,
        usedNames: MutableSet<String>,
        openStreams: MutableList<InputStream>
    ) {
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

        repo.getVideos(entry.id).forEachIndexed { index, video ->
            when (mode) {
                ExportMode.PRINT -> addPrintVideo(document, entry, video, index)
                ExportMode.DIGITAL -> addDigitalVideo(
                    document, pdfDoc, entry, video, index, attachments, usedNames, openStreams
                )
            }
        }

        document.add(Paragraph("\n"))
    }

    // ---------------------------------------------------------------- PRINT mode

    private fun addPrintVideo(document: Document, entry: LogEntry, video: Video, index: Int) {
        val vFile = File(video.uri)
        if (!vFile.exists() || vFile.length() == 0L) {
            DebugLog.log("Export", "print: video missing for entry ${entry.id}: ${video.uri}")
            document.add(missingVideoPlaceholder(index))
            return
        }
        val frames = extractEvenFrames(vFile.absolutePath, PRINT_FILMSTRIP_FRAMES)
        if (frames.isEmpty()) {
            DebugLog.log("Export", "print: no frames extracted from ${video.uri}")
            document.add(missingVideoPlaceholder(index, "frames could not be read"))
            return
        }
        document.add(Paragraph("Video ${index + 1} — filmstrip:").setBold().setFontSize(10f))
        val table = Table(UnitValue.createPercentArray(frames.size)).useAllAvailableWidth()
        frames.forEach { bytes ->
            val cell = Cell().setBorder(Border.NO_BORDER).setPadding(2f)
            try {
                cell.add(Image(ImageDataFactory.create(bytes)).setAutoScale(true))
            } catch (_: Exception) {
                cell.add(Paragraph("[frame]").setFontSize(6f))
            }
            table.addCell(cell)
        }
        document.add(table)
        document.add(videoCaption(entry, video, fileName = null))
    }

    // -------------------------------------------------------------- DIGITAL mode

    private fun addDigitalVideo(
        document: Document,
        pdfDoc: PdfDocument,
        entry: LogEntry,
        video: Video,
        index: Int,
        attachments: MutableList<AttachedVideo>,
        usedNames: MutableSet<String>,
        openStreams: MutableList<InputStream>
    ) {
        val vFile = File(video.uri)
        if (!vFile.exists() || vFile.length() == 0L) {
            DebugLog.log("Export", "digital: video missing for entry ${entry.id}: ${video.uri}")
            document.add(missingVideoPlaceholder(index))
            return
        }

        val stampFmt = DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss").withZone(ZoneId.systemDefault())
        val fileName = uniqueName(usedNames, sanitizeFileName("video_${stampFmt.format(video.timestamp)}_${index + 1}.mp4"))

        // Poster frame — never blank: fall back to a generic video placeholder image.
        val thumb = videoThumbnailWithPlayOverlay(vFile.absolutePath)
        val poster: ByteArray
        if (thumb != null) {
            poster = thumb
            DebugLog.log("Export", "poster thumbnail extracted for $fileName")
        } else {
            poster = genericVideoPoster()
            DebugLog.log("Export", "poster fallback used for $fileName (thumbnail extraction failed)")
        }

        try {
            // The InputStream overload streams the file into the PDF at write time —
            // the original bytes are stored unmodified (extraction is byte-identical).
            val stream = FileInputStream(vFile)
            openStreams.add(stream)
            val spec = PdfFileSpec.createEmbeddedFileSpec(
                pdfDoc,
                stream,
                "Lala video — ${entry.title.ifBlank { entry.category }}",
                fileName,
                PdfName("video/mp4"),
                null,
                null
            )
            // Document-level EmbeddedFiles entry: shows in the attachments panel.
            pdfDoc.addFileAttachment(fileName, spec)
            DebugLog.log("Export", "attachment written: $fileName (${vFile.length()} bytes)")

            // Poster with a FileAttachment (paperclip) annotation anchored to it, referencing
            // the SAME file spec — the video is stored once. Viewers with annotation support
            // (Acrobat desktop/mobile and others) let users open the video straight from the page.
            val posterImage = Image(ImageDataFactory.create(poster))
                .setAutoScale(true)
                .setMaxWidth(UnitValue.createPercentValue(70f))
            posterImage.setNextRenderer(
                AttachmentPosterRenderer(
                    posterImage,
                    spec,
                    "Open attachment to play: $fileName (${mmss(video.durationSeconds)})"
                )
            )
            document.add(posterImage)

            attachments.add(
                AttachedVideo(
                    fileName = fileName,
                    sizeBytes = vFile.length(),
                    durationSeconds = video.durationSeconds,
                    timestamp = video.timestamp,
                    gpsLat = video.gpsLat ?: entry.gpsLat,
                    gpsLon = video.gpsLon ?: entry.gpsLon
                )
            )
            document.add(videoCaption(entry, video, fileName))
        } catch (e: Exception) {
            DebugLog.error("Export", "failed to embed ${video.uri}", e)
            document.add(
                Paragraph("Video ${index + 1}: could not be attached (${e.message}).")
                    .setFontSize(9f)
                    .setItalic()
                    .setFontColor(ColorConstants.RED)
            )
        }
    }

    private fun addAttachmentSummary(document: Document, attachments: List<AttachedVideo>) {
        val fmt = DateTimeFormatter.ofPattern("MMM d, yyyy h:mm a").withZone(ZoneId.systemDefault())
        document.add(AreaBreak())
        document.add(Paragraph("Attached Media").setBold().setFontSize(14f))
        document.add(
            Paragraph(
                "The original video files below are embedded in this PDF, unmodified. " +
                    "Open your PDF viewer's attachments panel (Adobe Acrobat, Foxit, and most " +
                    "desktop viewers) to view or save them."
            ).setFontSize(9f)
        )
        document.add(Paragraph("\n").setFontSize(4f))
        val table = Table(UnitValue.createPercentArray(floatArrayOf(30f, 12f, 12f, 26f, 20f)))
            .useAllAvailableWidth()
            .setFontSize(8f)
        listOf("File", "Size", "Duration", "Recorded", "GPS").forEach {
            table.addHeaderCell(Cell().add(Paragraph(it).setBold()))
        }
        attachments.forEach { a ->
            table.addCell(a.fileName)
            table.addCell(sizeLabel(a.sizeBytes))
            table.addCell(mmss(a.durationSeconds))
            table.addCell(fmt.format(a.timestamp))
            table.addCell(
                if (a.gpsLat != null && a.gpsLon != null) "%.5f, %.5f".format(a.gpsLat, a.gpsLon)
                else "—"
            )
        }
        document.add(table)
    }

    // ------------------------------------------------------------------ helpers

    private fun videoCaption(entry: LogEntry, video: Video, fileName: String?): Paragraph {
        val fmt = DateTimeFormatter.ofPattern("MMM d, yyyy h:mm a").withZone(ZoneId.systemDefault())
        val gpsLat = video.gpsLat ?: entry.gpsLat
        val gpsLon = video.gpsLon ?: entry.gpsLon
        val gps = if (gpsLat != null && gpsLon != null) "%.5f, %.5f".format(gpsLat, gpsLon) else "unknown"
        val text = if (fileName != null) {
            "Video attached — open the paperclip/attachment in your PDF viewer to play " +
                "(duration ${mmss(video.durationSeconds)}). " +
                "Filename: $fileName, Recorded: ${fmt.format(video.timestamp)}, Location: $gps"
        } else {
            "Duration: ${mmss(video.durationSeconds)} · Recorded: ${fmt.format(video.timestamp)} · Location: $gps"
        }
        return Paragraph(text).setFontSize(8f).setItalic()
    }

    private fun missingVideoPlaceholder(index: Int, reason: String = "file missing or unreadable") =
        Paragraph("Video ${index + 1}: $reason — not included in this report.")
            .setFontSize(9f)
            .setItalic()
            .setFontColor(ColorConstants.RED)

    /** Extracts [count] evenly spaced frames (frame centers of equal time slices) as JPEGs. */
    private fun extractEvenFrames(path: String, count: Int): List<ByteArray> {
        val retriever = MediaMetadataRetriever()
        return try {
            retriever.setDataSource(path)
            val durMs = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION)
                ?.toLongOrNull() ?: 0L
            if (durMs <= 0) return emptyList()
            (0 until count).mapNotNull { i ->
                val timeUs = (durMs * 1000L * (2 * i + 1)) / (2L * count)
                retriever.getFrameAtTime(timeUs, MediaMetadataRetriever.OPTION_CLOSEST_SYNC)
                    ?.let { toJpeg(scaleToHeight(it, FILMSTRIP_FRAME_HEIGHT_PX), 80) }
            }
        } catch (e: Exception) {
            DebugLog.error("Export", "frame extraction failed for $path", e)
            emptyList()
        } finally {
            runCatching { retriever.release() }
        }
    }

    /** One representative frame (~10% in) with a translucent play-button overlay. */
    private fun videoThumbnailWithPlayOverlay(path: String): ByteArray? {
        val retriever = MediaMetadataRetriever()
        return try {
            retriever.setDataSource(path)
            val durMs = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION)
                ?.toLongOrNull() ?: 0L
            val frame = retriever.getFrameAtTime(
                durMs * 100L, // 10% in, microseconds
                MediaMetadataRetriever.OPTION_CLOSEST_SYNC
            ) ?: return null

            val scale = DIGITAL_THUMB_WIDTH_PX.toFloat() / frame.width
            val w = DIGITAL_THUMB_WIDTH_PX
            val h = (frame.height * scale).toInt().coerceAtLeast(1)
            val bmp = Bitmap.createScaledBitmap(frame, w, h, true)
                .copy(Bitmap.Config.ARGB_8888, true)
            drawPlayOverlay(Canvas(bmp), w, h)
            toJpeg(bmp, 85)
        } catch (e: Exception) {
            DebugLog.error("Export", "thumbnail failed for $path", e)
            null
        } finally {
            runCatching { retriever.release() }
        }
    }

    /** Generic dark poster with a play icon, for when frame extraction fails — never a blank region. */
    private fun genericVideoPoster(): ByteArray {
        val w = DIGITAL_THUMB_WIDTH_PX
        val h = w * 9 / 16
        val bmp = Bitmap.createBitmap(w, h, Bitmap.Config.ARGB_8888)
        val canvas = Canvas(bmp)
        canvas.drawColor(android.graphics.Color.rgb(40, 40, 46))
        drawPlayOverlay(canvas, w, h)
        val textPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
            color = android.graphics.Color.argb(200, 255, 255, 255)
            textSize = h / 12f
            textAlign = Paint.Align.CENTER
        }
        canvas.drawText("VIDEO — preview unavailable", w / 2f, h * 0.88f, textPaint)
        return toJpeg(bmp, 85)
    }

    private fun drawPlayOverlay(canvas: Canvas, w: Int, h: Int) {
        val cx = w / 2f
        val cy = h / 2f
        val r = minOf(w, h) / 5f
        canvas.drawCircle(cx, cy, r, Paint(Paint.ANTI_ALIAS_FLAG).apply {
            color = android.graphics.Color.argb(150, 0, 0, 0)
        })
        val tri = Path().apply {
            moveTo(cx - r * 0.35f, cy - r * 0.55f)
            lineTo(cx - r * 0.35f, cy + r * 0.55f)
            lineTo(cx + r * 0.62f, cy)
            close()
        }
        canvas.drawPath(tri, Paint(Paint.ANTI_ALIAS_FLAG).apply {
            color = android.graphics.Color.WHITE
        })
    }

    private fun scaleToHeight(src: Bitmap, height: Int): Bitmap {
        val scale = height.toFloat() / src.height
        val w = (src.width * scale).toInt().coerceAtLeast(1)
        return Bitmap.createScaledBitmap(src, w, height, true)
    }

    private fun toJpeg(bmp: Bitmap, quality: Int): ByteArray =
        ByteArrayOutputStream().use { out ->
            bmp.compress(Bitmap.CompressFormat.JPEG, quality, out)
            out.toByteArray()
        }

    private fun sanitizeFileName(name: String): String =
        name.replace(Regex("[^A-Za-z0-9._-]"), "_")

    private fun uniqueName(used: MutableSet<String>, name: String): String {
        val dot = name.lastIndexOf('.')
        val base = if (dot > 0) name.substring(0, dot) else name
        val ext = if (dot > 0) name.substring(dot) else ""
        var candidate = name
        var n = 2
        while (!used.add(candidate)) {
            candidate = "${base}_$n$ext"
            n++
        }
        return candidate
    }

    private fun mmss(sec: Int): String = "%d:%02d".format(sec / 60, sec % 60)

    private fun sizeLabel(bytes: Long): String = when {
        bytes >= 1_048_576 -> "%.1f MB".format(bytes / 1_048_576.0)
        bytes >= 1024 -> "%.0f KB".format(bytes / 1024.0)
        else -> "$bytes B"
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

/**
 * Draws the poster image normally, then anchors a FileAttachment (paperclip) annotation
 * to the image's top-right corner, referencing the already-embedded file spec — so the
 * video bytes are stored once and reachable both from the page and the attachments panel.
 */
private class AttachmentPosterRenderer(
    image: Image,
    private val spec: PdfFileSpec,
    private val note: String
) : ImageRenderer(image) {

    override fun draw(drawContext: DrawContext) {
        super.draw(drawContext)
        try {
            val bbox = occupiedArea.bBox
            val rect = Rectangle(bbox.right - 24f, bbox.top - 28f, 20f, 26f)
            val annotation = PdfFileAttachmentAnnotation(rect, spec).apply {
                contents = com.itextpdf.kernel.pdf.PdfString(note)
                put(PdfName.Name, PdfName("Paperclip"))
                setFlags(PdfAnnotation.PRINT)
            }
            drawContext.document.getPage(occupiedArea.pageNumber).addAnnotation(annotation)
            DebugLog.log("Export", "attachment annotation added (page ${occupiedArea.pageNumber})")
        } catch (e: Exception) {
            DebugLog.error("Export", "failed to add attachment annotation", e)
        }
    }

    override fun getNextRenderer(): IRenderer =
        AttachmentPosterRenderer(modelElement as Image, spec, note)
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
