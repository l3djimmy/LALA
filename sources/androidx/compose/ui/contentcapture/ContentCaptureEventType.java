package androidx.compose.ui.contentcapture;

import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: AndroidContentCaptureManager.android.kt */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0004\b\u0082\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002j\u0002\b\u0003j\u0002\b\u0004¨\u0006\u0005"}, d2 = {"Landroidx/compose/ui/contentcapture/ContentCaptureEventType;", "", "(Ljava/lang/String;I)V", "VIEW_APPEAR", "VIEW_DISAPPEAR", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public enum ContentCaptureEventType {
    VIEW_APPEAR,
    VIEW_DISAPPEAR;
    
    private static final /* synthetic */ EnumEntries $ENTRIES = EnumEntriesKt.enumEntries($VALUES);

    public static EnumEntries<ContentCaptureEventType> getEntries() {
        return $ENTRIES;
    }
}
