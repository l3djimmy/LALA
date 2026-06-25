package com.hardlineforge.lala.pdf;

import android.content.Context;
import com.hardlineforge.lala.data.LogEntry;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.IBlockElement;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.properties.TextAlignment;
import dagger.hilt.android.qualifiers.ApplicationContext;
import java.io.File;
import java.time.Instant;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.List;
import javax.inject.Inject;
import javax.inject.Singleton;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: PdfGenerator.kt */
@Singleton
@Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001B\u0013\b\u0007\u0012\b\b\u0001\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u001c\u0010\u0006\u001a\u00020\u00072\f\u0010\b\u001a\b\u0012\u0004\u0012\u00020\n0\t2\u0006\u0010\u000b\u001a\u00020\u0007R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\f"}, d2 = {"Lcom/hardlineforge/lala/pdf/PdfGenerator;", "", "context", "Landroid/content/Context;", "<init>", "(Landroid/content/Context;)V", "generate", "Ljava/io/File;", "entries", "", "Lcom/hardlineforge/lala/data/LogEntry;", "file", "app_debug"}, k = 1, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes7.dex */
public final class PdfGenerator {
    public static final int $stable = 8;
    private final Context context;

    @Inject
    public PdfGenerator(@ApplicationContext Context context) {
        Intrinsics.checkNotNullParameter(context, "context");
        this.context = context;
    }

    public final File generate(List<LogEntry> entries, File file) {
        Intrinsics.checkNotNullParameter(entries, "entries");
        Intrinsics.checkNotNullParameter(file, "file");
        PdfWriter writer = new PdfWriter(file);
        PdfDocument pdfDoc = new PdfDocument(writer);
        Document document = new Document(pdfDoc, PageSize.LETTER);
        document.add((IBlockElement) ((Paragraph) ((Paragraph) new Paragraph("LALA — LOCAL AREA LOG REPORT").setTextAlignment(TextAlignment.CENTER)).setFontSize(18.0f)).setBold());
        document.add((IBlockElement) ((Paragraph) new Paragraph("Generated: " + Instant.now()).setTextAlignment(TextAlignment.CENTER)).setFontSize(10.0f));
        document.add((IBlockElement) new Paragraph("\n"));
        if (entries.isEmpty()) {
            document.add((IBlockElement) new Paragraph("No entries to report."));
        } else {
            for (LogEntry logEntry : entries) {
                String format = logEntry.getTimestamp().atZone(ZoneId.of(logEntry.getTimezone())).format(DateTimeFormatter.ofPattern("MMMM d, yyyy  h:mm a z"));
                document.add((IBlockElement) new Paragraph("────────────────────────────────────────").setFontSize(8.0f));
                document.add((IBlockElement) new Paragraph("Entry: " + logEntry.getCategory()).setBold());
                document.add((IBlockElement) new Paragraph("Date/Time: " + format));
                String locationName = logEntry.getLocationName();
                if (locationName != null) {
                    document.add((IBlockElement) new Paragraph("Location: " + locationName));
                }
                if (logEntry.getGpsLat() != null && logEntry.getGpsLon() != null) {
                    String format2 = String.format("GPS: %.6f, %.6f", Arrays.copyOf(new Object[]{logEntry.getGpsLat(), logEntry.getGpsLon()}, 2));
                    Intrinsics.checkNotNullExpressionValue(format2, "format(...)");
                    document.add((IBlockElement) new Paragraph(format2));
                }
                document.add((IBlockElement) new Paragraph("Comment:").setItalic());
                document.add((IBlockElement) new Paragraph(logEntry.getComment()));
                document.add((IBlockElement) new Paragraph("\n"));
            }
        }
        document.close();
        return file;
    }
}
