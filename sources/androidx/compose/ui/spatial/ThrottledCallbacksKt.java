package androidx.compose.ui.spatial;

import androidx.compose.ui.geometry.Rect;
import androidx.compose.ui.layout.LayoutCoordinates;
import androidx.compose.ui.node.DelegatableNode;
import androidx.compose.ui.node.DelegatableNodeKt;
import androidx.compose.ui.node.LayoutNode;
import androidx.compose.ui.node.NodeCoordinator;
import androidx.compose.ui.node.NodeKind;
import androidx.compose.ui.unit.IntOffsetKt;
import kotlin.Metadata;
/* compiled from: ThrottledCallbacks.kt */
@Metadata(d1 = {"\u0000&\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\u001aF\u0010\u0000\u001a\u0004\u0018\u00010\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\b2\b\u0010\n\u001a\u0004\u0018\u00010\u000bH\u0000ø\u0001\u0000¢\u0006\u0004\b\f\u0010\r\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006\u000e"}, d2 = {"rectInfoFor", "Landroidx/compose/ui/spatial/RelativeLayoutBounds;", "node", "Landroidx/compose/ui/node/DelegatableNode;", "topLeft", "", "bottomRight", "windowOffset", "Landroidx/compose/ui/unit/IntOffset;", "screenOffset", "viewToWindowMatrix", "Landroidx/compose/ui/graphics/Matrix;", "rectInfoFor-Q-MZNJw", "(Landroidx/compose/ui/node/DelegatableNode;JJJJ[F)Landroidx/compose/ui/spatial/RelativeLayoutBounds;", "ui_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class ThrottledCallbacksKt {
    /* renamed from: rectInfoFor-Q-MZNJw  reason: not valid java name */
    public static final RelativeLayoutBounds m6146rectInfoForQMZNJw(DelegatableNode node, long topLeft, long bottomRight, long windowOffset, long screenOffset, float[] viewToWindowMatrix) {
        NodeCoordinator coordinator = DelegatableNodeKt.m5759requireCoordinator64DMado(node, NodeKind.m5898constructorimpl(2));
        LayoutNode layoutNode = DelegatableNodeKt.requireLayoutNode(node);
        if (layoutNode.isPlaced()) {
            boolean needsTransform = layoutNode.getOuterCoordinator$ui_release() != coordinator;
            if (!needsTransform) {
                return new RelativeLayoutBounds(topLeft, bottomRight, windowOffset, screenOffset, viewToWindowMatrix, node, null);
            }
            Rect transformed = LayoutCoordinates.localBoundingBoxOf$default(layoutNode.getOuterCoordinator$ui_release().getCoordinates(), coordinator, false, 2, null);
            return new RelativeLayoutBounds(IntOffsetKt.m7018roundk4lQ0M(transformed.m4083getTopLeftF1C5BW0()), IntOffsetKt.m7018roundk4lQ0M(transformed.m4077getBottomRightF1C5BW0()), windowOffset, screenOffset, viewToWindowMatrix, node, null);
        }
        return null;
    }
}
