package androidx.compose.foundation.contextmenu;

import androidx.compose.ui.unit.IntOffset;
import androidx.compose.ui.unit.IntRect;
import androidx.compose.ui.unit.LayoutDirection;
import androidx.compose.ui.window.PopupPositionProvider;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
/* compiled from: ContextMenuPopupPositionProvider.android.kt */
@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0000\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J2\u0010\u0006\u001a\u00020\u00032\u0006\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\nH\u0016ø\u0001\u0000¢\u0006\u0004\b\u000e\u0010\u000fR\u0016\u0010\u0002\u001a\u00020\u0003X\u0082\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u0005\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006\u0010"}, d2 = {"Landroidx/compose/foundation/contextmenu/ContextMenuPopupPositionProvider;", "Landroidx/compose/ui/window/PopupPositionProvider;", "localPosition", "Landroidx/compose/ui/unit/IntOffset;", "(JLkotlin/jvm/internal/DefaultConstructorMarker;)V", "J", "calculatePosition", "anchorBounds", "Landroidx/compose/ui/unit/IntRect;", "windowSize", "Landroidx/compose/ui/unit/IntSize;", "layoutDirection", "Landroidx/compose/ui/unit/LayoutDirection;", "popupContentSize", "calculatePosition-llwVHH4", "(Landroidx/compose/ui/unit/IntRect;JLandroidx/compose/ui/unit/LayoutDirection;J)J", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class ContextMenuPopupPositionProvider implements PopupPositionProvider {
    public static final int $stable = 0;
    private final long localPosition;

    public /* synthetic */ ContextMenuPopupPositionProvider(long j, DefaultConstructorMarker defaultConstructorMarker) {
        this(j);
    }

    private ContextMenuPopupPositionProvider(long localPosition) {
        this.localPosition = localPosition;
    }

    @Override // androidx.compose.ui.window.PopupPositionProvider
    /* renamed from: calculatePosition-llwVHH4  reason: not valid java name */
    public long mo613calculatePositionllwVHH4(IntRect anchorBounds, long windowSize, LayoutDirection layoutDirection, long popupContentSize) {
        int x$iv = ContextMenuPopupPositionProvider_androidKt.alignPopupAxis(anchorBounds.getLeft() + IntOffset.m7001getXimpl(this.localPosition), (int) (popupContentSize >> 32), (int) (windowSize >> 32), layoutDirection == LayoutDirection.Ltr);
        int $i$f$unpackInt2 = (int) (popupContentSize & 4294967295L);
        int $i$f$unpackInt22 = (int) (windowSize & 4294967295L);
        int y$iv = ContextMenuPopupPositionProvider_androidKt.alignPopupAxis$default(anchorBounds.getTop() + IntOffset.m7002getYimpl(this.localPosition), $i$f$unpackInt2, $i$f$unpackInt22, false, 8, null);
        return IntOffset.m6995constructorimpl((x$iv << 32) | (y$iv & 4294967295L));
    }
}
