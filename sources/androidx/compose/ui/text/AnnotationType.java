package androidx.compose.ui.text;

import com.itextpdf.kernel.pdf.tagging.StandardRoles;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
/* compiled from: Savers.kt */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\t\b\u0082\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002j\u0002\b\u0003j\u0002\b\u0004j\u0002\b\u0005j\u0002\b\u0006j\u0002\b\u0007j\u0002\b\bj\u0002\b\t¨\u0006\n"}, d2 = {"Landroidx/compose/ui/text/AnnotationType;", "", "(Ljava/lang/String;I)V", "Paragraph", StandardRoles.SPAN, "VerbatimTts", "Url", StandardRoles.LINK, "Clickable", "String", "ui-text_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
enum AnnotationType {
    Paragraph,
    Span,
    VerbatimTts,
    Url,
    Link,
    Clickable,
    String;
    
    private static final /* synthetic */ EnumEntries $ENTRIES = EnumEntriesKt.enumEntries($VALUES);

    public static EnumEntries<AnnotationType> getEntries() {
        return $ENTRIES;
    }
}
