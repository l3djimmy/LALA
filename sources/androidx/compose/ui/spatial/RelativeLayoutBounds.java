package androidx.compose.ui.spatial;

import androidx.compose.ui.geometry.InlineClassHelperKt;
import androidx.compose.ui.geometry.Rect;
import androidx.compose.ui.graphics.Matrix;
import androidx.compose.ui.node.DelegatableNode;
import androidx.compose.ui.node.DelegatableNodeKt;
import androidx.compose.ui.unit.IntOffset;
import androidx.compose.ui.unit.IntRect;
import androidx.compose.ui.unit.IntRectKt;
import java.util.List;
import kotlin.Metadata;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
/* compiled from: RelativeLayoutBounds.kt */
@Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\b\n\u0002\b\u000e\n\u0002\u0010 \n\u0000\b\u0007\u0018\u00002\u00020\u0001B9\b\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t\u0012\u0006\u0010\n\u001a\u00020\u000b¢\u0006\u0002\u0010\fJ\f\u0010$\u001a\b\u0012\u0004\u0012\u00020\u000e0%R\u000e\u0010\u0004\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u0011\u0010\r\u001a\u00020\u000e8F¢\u0006\u0006\u001a\u0004\b\u000f\u0010\u0010R\u0011\u0010\u0011\u001a\u00020\u000e8F¢\u0006\u0006\u001a\u0004\b\u0012\u0010\u0010R\u0011\u0010\u0013\u001a\u00020\u000e8F¢\u0006\u0006\u001a\u0004\b\u0014\u0010\u0010R\u0011\u0010\u0015\u001a\u00020\u00168F¢\u0006\u0006\u001a\u0004\b\u0017\u0010\u0018R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u0004¢\u0006\u0002\n\u0000R\u0017\u0010\u0019\u001a\u00020\u00068Fø\u0001\u0000ø\u0001\u0001¢\u0006\u0006\u001a\u0004\b\u001a\u0010\u001bR\u0017\u0010\u001c\u001a\u00020\u00068Fø\u0001\u0000ø\u0001\u0001¢\u0006\u0006\u001a\u0004\b\u001d\u0010\u001bR\u0017\u0010\u001e\u001a\u00020\u00068Fø\u0001\u0000ø\u0001\u0001¢\u0006\u0006\u001a\u0004\b\u001f\u0010\u001bR\u0016\u0010\u0007\u001a\u00020\u0006X\u0082\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010 R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u0018\u0010\b\u001a\u0004\u0018\u00010\tX\u0082\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010!R\u0011\u0010\"\u001a\u00020\u00168F¢\u0006\u0006\u001a\u0004\b#\u0010\u0018R\u0016\u0010\u0005\u001a\u00020\u0006X\u0082\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010 \u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006&"}, d2 = {"Landroidx/compose/ui/spatial/RelativeLayoutBounds;", "", "topLeft", "", "bottomRight", "windowOffset", "Landroidx/compose/ui/unit/IntOffset;", "screenOffset", "viewToWindowMatrix", "Landroidx/compose/ui/graphics/Matrix;", "node", "Landroidx/compose/ui/node/DelegatableNode;", "(JJJJ[FLandroidx/compose/ui/node/DelegatableNode;Lkotlin/jvm/internal/DefaultConstructorMarker;)V", "boundsInRoot", "Landroidx/compose/ui/unit/IntRect;", "getBoundsInRoot", "()Landroidx/compose/ui/unit/IntRect;", "boundsInScreen", "getBoundsInScreen", "boundsInWindow", "getBoundsInWindow", "height", "", "getHeight", "()I", "positionInRoot", "getPositionInRoot-nOcc-ac", "()J", "positionInScreen", "getPositionInScreen-nOcc-ac", "positionInWindow", "getPositionInWindow-nOcc-ac", "J", "[F", "width", "getWidth", "calculateOcclusions", "", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class RelativeLayoutBounds {
    public static final int $stable = 8;
    private final long bottomRight;
    private final DelegatableNode node;
    private final long screenOffset;
    private final long topLeft;
    private final float[] viewToWindowMatrix;
    private final long windowOffset;

    public /* synthetic */ RelativeLayoutBounds(long j, long j2, long j3, long j4, float[] fArr, DelegatableNode delegatableNode, DefaultConstructorMarker defaultConstructorMarker) {
        this(j, j2, j3, j4, fArr, delegatableNode);
    }

    private RelativeLayoutBounds(long topLeft, long bottomRight, long windowOffset, long screenOffset, float[] viewToWindowMatrix, DelegatableNode node) {
        this.topLeft = topLeft;
        this.bottomRight = bottomRight;
        this.windowOffset = windowOffset;
        this.screenOffset = screenOffset;
        this.viewToWindowMatrix = viewToWindowMatrix;
        this.node = node;
    }

    /* renamed from: getPositionInRoot-nOcc-ac  reason: not valid java name */
    public final long m6133getPositionInRootnOccac() {
        return IntOffset.m6995constructorimpl(this.topLeft);
    }

    /* renamed from: getPositionInWindow-nOcc-ac  reason: not valid java name */
    public final long m6135getPositionInWindownOccac() {
        int x = IntOffset.m7001getXimpl(this.screenOffset) - IntOffset.m7001getXimpl(this.windowOffset);
        int y = IntOffset.m7002getYimpl(this.screenOffset) - IntOffset.m7002getYimpl(this.windowOffset);
        long xy$iv = this.topLeft;
        int l = (int) (xy$iv >> 32);
        long xy$iv2 = this.topLeft;
        int t = (int) xy$iv2;
        int x$iv = l + x;
        int y$iv = t + y;
        return IntOffset.m6995constructorimpl((x$iv << 32) | (y$iv & 4294967295L));
    }

    /* renamed from: getPositionInScreen-nOcc-ac  reason: not valid java name */
    public final long m6134getPositionInScreennOccac() {
        int x = IntOffset.m7001getXimpl(this.screenOffset);
        int y = IntOffset.m7002getYimpl(this.screenOffset);
        long xy$iv = this.topLeft;
        int l = (int) (xy$iv >> 32);
        long xy$iv2 = this.topLeft;
        int t = (int) xy$iv2;
        int x$iv = l + x;
        int y$iv = t + y;
        return IntOffset.m6995constructorimpl((x$iv << 32) | (y$iv & 4294967295L));
    }

    public final int getWidth() {
        long xy$iv = this.topLeft;
        int l = (int) (xy$iv >> 32);
        long xy$iv2 = this.bottomRight;
        int r = (int) (xy$iv2 >> 32);
        return r - l;
    }

    public final int getHeight() {
        long xy$iv = this.topLeft;
        int t = (int) xy$iv;
        long xy$iv2 = this.bottomRight;
        int b = (int) xy$iv2;
        return b - t;
    }

    public final IntRect getBoundsInRoot() {
        long xy$iv = this.topLeft;
        int l = (int) (xy$iv >> 32);
        long xy$iv2 = this.topLeft;
        int t = (int) xy$iv2;
        long xy$iv3 = this.bottomRight;
        int $i$f$unpackX = (int) (xy$iv3 >> 32);
        long xy$iv4 = this.bottomRight;
        int b = (int) xy$iv4;
        return new IntRect(l, t, $i$f$unpackX, b);
    }

    public final IntRect getBoundsInWindow() {
        long xy$iv = this.topLeft;
        int l = (int) (xy$iv >> 32);
        long xy$iv2 = this.topLeft;
        int t = (int) xy$iv2;
        long xy$iv3 = this.bottomRight;
        int $i$f$unpackX = (int) (xy$iv3 >> 32);
        long xy$iv4 = this.bottomRight;
        int b = (int) xy$iv4;
        if (this.viewToWindowMatrix != null) {
            return IntRectKt.roundToIntRect(Matrix.m4526mapimpl(this.viewToWindowMatrix, new Rect(l, t, $i$f$unpackX, b)));
        }
        int x = IntOffset.m7001getXimpl(this.screenOffset) - IntOffset.m7001getXimpl(this.windowOffset);
        int y = IntOffset.m7002getYimpl(this.screenOffset) - IntOffset.m7002getYimpl(this.windowOffset);
        return new IntRect(l + x, t + y, $i$f$unpackX + x, b + y);
    }

    public final IntRect getBoundsInScreen() {
        if (this.viewToWindowMatrix != null) {
            IntRect windowRect = getBoundsInWindow();
            long offset = this.windowOffset;
            return new IntRect(windowRect.getLeft() + IntOffset.m7001getXimpl(offset), windowRect.getTop() + IntOffset.m7002getYimpl(offset), windowRect.getRight() + IntOffset.m7001getXimpl(offset), windowRect.getBottom() + IntOffset.m7002getYimpl(offset));
        }
        long xy$iv = this.topLeft;
        int l = (int) (xy$iv >> 32);
        long xy$iv2 = this.topLeft;
        int t = (int) xy$iv2;
        long xy$iv3 = this.bottomRight;
        int $i$f$unpackX = (int) (xy$iv3 >> 32);
        long xy$iv4 = this.bottomRight;
        int b = (int) xy$iv4;
        int x = IntOffset.m7001getXimpl(this.screenOffset);
        int y = IntOffset.m7002getYimpl(this.screenOffset);
        return new IntRect(l + x, t + y, $i$f$unpackX + x, b + y);
    }

    public final List<IntRect> calculateOcclusions() {
        int i$iv;
        boolean z;
        long[] items$iv;
        RectManager rectManager = DelegatableNodeKt.requireOwner(this.node).getRectManager();
        int id = DelegatableNodeKt.requireLayoutNode(this.node).getSemanticsId();
        RectList rectList = rectManager.getRects();
        int idIndex = rectList.indexOf(id);
        if (idIndex < 0) {
            return CollectionsKt.emptyList();
        }
        List $this$calculateOcclusions_u24lambda_u241 = CollectionsKt.createListBuilder();
        boolean z2 = false;
        RectList this_$iv = rectList;
        boolean z3 = false;
        long[] items$iv2 = this_$iv.items;
        int size$iv = this_$iv.itemsSize;
        long destTopLeft$iv = items$iv2[idIndex];
        long destBottomRight$iv = items$iv2[idIndex + 1];
        int i$iv2 = 0;
        while (true) {
            RectList rectList2 = rectList;
            if (i$iv2 < items$iv2.length - 2 && i$iv2 < size$iv) {
                if (i$iv2 == idIndex) {
                    i$iv2 += 3;
                    rectList = rectList2;
                } else {
                    int idIndex2 = idIndex;
                    long topLeft$iv = items$iv2[i$iv2 + 0];
                    boolean z4 = z2;
                    RectList this_$iv2 = this_$iv;
                    long bottomRight$iv = items$iv2[i$iv2 + 1];
                    long a$iv$iv = ((destBottomRight$iv - topLeft$iv) - InlineClassHelperKt.Uint64Low32) | ((bottomRight$iv - destTopLeft$iv) - InlineClassHelperKt.Uint64Low32);
                    if (!((a$iv$iv & (-9223372034707292160L)) == 0)) {
                        i$iv = i$iv2;
                        z = z3;
                        items$iv = items$iv2;
                    } else {
                        z = z3;
                        items$iv = items$iv2;
                        int l = (int) (topLeft$iv >> 32);
                        int $i$f$unpackY = (int) topLeft$iv;
                        int r = (int) (bottomRight$iv >> 32);
                        int $i$f$unpackY2 = (int) bottomRight$iv;
                        long meta$iv$iv = items$iv[i$iv2 + 2];
                        i$iv = i$iv2;
                        int i$iv3 = (int) meta$iv$iv;
                        int intersectingId = i$iv3 & RectListKt.Lower26Bits;
                        if (rectManager.isTargetDrawnFirst$ui_release(id, intersectingId)) {
                            $this$calculateOcclusions_u24lambda_u241.add(new IntRect(l, $i$f$unpackY, r, $i$f$unpackY2));
                        }
                    }
                    i$iv2 = i$iv + 3;
                    rectList = rectList2;
                    idIndex = idIndex2;
                    z2 = z4;
                    this_$iv = this_$iv2;
                    z3 = z;
                    items$iv2 = items$iv;
                }
            }
        }
        return CollectionsKt.build($this$calculateOcclusions_u24lambda_u241);
    }
}
