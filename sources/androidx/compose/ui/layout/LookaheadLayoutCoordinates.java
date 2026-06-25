package androidx.compose.ui.layout;

import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.geometry.Rect;
import androidx.compose.ui.internal.InlineClassHelperKt;
import androidx.compose.ui.node.LookaheadDelegate;
import androidx.compose.ui.node.NodeCoordinator;
import androidx.compose.ui.unit.IntOffset;
import androidx.compose.ui.unit.IntOffsetKt;
import androidx.compose.ui.unit.IntSize;
import java.util.Set;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: LookaheadLayoutCoordinates.kt */
@Metadata(d1 = {"\u0000\\\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0015\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\b\u0000\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\u0011\u0010!\u001a\u00020\"2\u0006\u0010#\u001a\u00020\u001bH\u0096\u0002J\u0018\u0010$\u001a\u00020%2\u0006\u0010&\u001a\u00020\u00012\u0006\u0010'\u001a\u00020\nH\u0016J\"\u0010(\u001a\u00020\u00112\u0006\u0010&\u001a\u00020\u00012\u0006\u0010)\u001a\u00020\u0011H\u0016ø\u0001\u0000¢\u0006\u0004\b*\u0010+J*\u0010(\u001a\u00020\u00112\u0006\u0010&\u001a\u00020\u00012\u0006\u0010)\u001a\u00020\u00112\u0006\u0010,\u001a\u00020\nH\u0016ø\u0001\u0000¢\u0006\u0004\b-\u0010.J\u001a\u0010/\u001a\u00020\u00112\u0006\u00100\u001a\u00020\u0011H\u0016ø\u0001\u0000¢\u0006\u0004\b1\u00102J\u001a\u00103\u001a\u00020\u00112\u0006\u00100\u001a\u00020\u0011H\u0016ø\u0001\u0000¢\u0006\u0004\b4\u00102J\u001a\u00105\u001a\u00020\u00112\u0006\u00100\u001a\u00020\u0011H\u0016ø\u0001\u0000¢\u0006\u0004\b6\u00102J\u001a\u00107\u001a\u00020\u00112\u0006\u00108\u001a\u00020\u0011H\u0016ø\u0001\u0000¢\u0006\u0004\b9\u00102J\"\u0010:\u001a\u00020;2\u0006\u0010&\u001a\u00020\u00012\u0006\u0010<\u001a\u00020=H\u0016ø\u0001\u0000¢\u0006\u0004\b>\u0010?J\u001a\u0010@\u001a\u00020;2\u0006\u0010<\u001a\u00020=H\u0016ø\u0001\u0000¢\u0006\u0004\bA\u0010BJ\u001a\u0010C\u001a\u00020\u00112\u0006\u0010D\u001a\u00020\u0011H\u0016ø\u0001\u0000¢\u0006\u0004\bE\u00102R\u0011\u0010\u0005\u001a\u00020\u00068F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u0014\u0010\t\u001a\u00020\n8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u000b\u0010\fR\u0014\u0010\r\u001a\u00020\n8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\r\u0010\fR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u001a\u0010\u0010\u001a\u00020\u00118BX\u0082\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0006\u001a\u0004\b\u0012\u0010\u0013R\u0016\u0010\u0014\u001a\u0004\u0018\u00010\u00018VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u0015\u0010\u0016R\u0016\u0010\u0017\u001a\u0004\u0018\u00010\u00018VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u0018\u0010\u0016R\u001a\u0010\u0019\u001a\b\u0012\u0004\u0012\u00020\u001b0\u001a8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u001c\u0010\u001dR\u001a\u0010\u001e\u001a\u00020\u001f8VX\u0096\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0006\u001a\u0004\b \u0010\u0013\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006F"}, d2 = {"Landroidx/compose/ui/layout/LookaheadLayoutCoordinates;", "Landroidx/compose/ui/layout/LayoutCoordinates;", "lookaheadDelegate", "Landroidx/compose/ui/node/LookaheadDelegate;", "(Landroidx/compose/ui/node/LookaheadDelegate;)V", "coordinator", "Landroidx/compose/ui/node/NodeCoordinator;", "getCoordinator", "()Landroidx/compose/ui/node/NodeCoordinator;", "introducesMotionFrameOfReference", "", "getIntroducesMotionFrameOfReference", "()Z", "isAttached", "getLookaheadDelegate", "()Landroidx/compose/ui/node/LookaheadDelegate;", "lookaheadOffset", "Landroidx/compose/ui/geometry/Offset;", "getLookaheadOffset-F1C5BW0", "()J", "parentCoordinates", "getParentCoordinates", "()Landroidx/compose/ui/layout/LayoutCoordinates;", "parentLayoutCoordinates", "getParentLayoutCoordinates", "providedAlignmentLines", "", "Landroidx/compose/ui/layout/AlignmentLine;", "getProvidedAlignmentLines", "()Ljava/util/Set;", "size", "Landroidx/compose/ui/unit/IntSize;", "getSize-YbymL2g", "get", "", "alignmentLine", "localBoundingBoxOf", "Landroidx/compose/ui/geometry/Rect;", "sourceCoordinates", "clipBounds", "localPositionOf", "relativeToSource", "localPositionOf-R5De75A", "(Landroidx/compose/ui/layout/LayoutCoordinates;J)J", "includeMotionFrameOfReference", "localPositionOf-S_NoaFU", "(Landroidx/compose/ui/layout/LayoutCoordinates;JZ)J", "localToRoot", "relativeToLocal", "localToRoot-MK-Hz9U", "(J)J", "localToScreen", "localToScreen-MK-Hz9U", "localToWindow", "localToWindow-MK-Hz9U", "screenToLocal", "relativeToScreen", "screenToLocal-MK-Hz9U", "transformFrom", "", "matrix", "Landroidx/compose/ui/graphics/Matrix;", "transformFrom-EL8BTi8", "(Landroidx/compose/ui/layout/LayoutCoordinates;[F)V", "transformToScreen", "transformToScreen-58bKbWc", "([F)V", "windowToLocal", "relativeToWindow", "windowToLocal-MK-Hz9U", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class LookaheadLayoutCoordinates implements LayoutCoordinates {
    public static final int $stable = 0;
    private final LookaheadDelegate lookaheadDelegate;

    public LookaheadLayoutCoordinates(LookaheadDelegate lookaheadDelegate) {
        this.lookaheadDelegate = lookaheadDelegate;
    }

    public final LookaheadDelegate getLookaheadDelegate() {
        return this.lookaheadDelegate;
    }

    public final NodeCoordinator getCoordinator() {
        return this.lookaheadDelegate.getCoordinator();
    }

    @Override // androidx.compose.ui.layout.LayoutCoordinates
    /* renamed from: getSize-YbymL2g */
    public long mo5645getSizeYbymL2g() {
        LookaheadDelegate it = this.lookaheadDelegate;
        int width$iv = it.getWidth();
        int height$iv = it.getHeight();
        return IntSize.m7039constructorimpl((width$iv << 32) | (height$iv & 4294967295L));
    }

    @Override // androidx.compose.ui.layout.LayoutCoordinates
    public Set<AlignmentLine> getProvidedAlignmentLines() {
        return getCoordinator().getProvidedAlignmentLines();
    }

    @Override // androidx.compose.ui.layout.LayoutCoordinates
    public LayoutCoordinates getParentLayoutCoordinates() {
        LookaheadDelegate lookaheadDelegate;
        boolean value$iv = isAttached();
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalStateException(NodeCoordinator.ExpectAttachedLayoutCoordinates);
        }
        NodeCoordinator it = getCoordinator().getLayoutNode().getOuterCoordinator$ui_release().getWrappedBy$ui_release();
        if (it == null || (lookaheadDelegate = it.getLookaheadDelegate()) == null) {
            return null;
        }
        return lookaheadDelegate.getCoordinates();
    }

    @Override // androidx.compose.ui.layout.LayoutCoordinates
    public LayoutCoordinates getParentCoordinates() {
        LookaheadDelegate lookaheadDelegate;
        boolean value$iv = isAttached();
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalStateException(NodeCoordinator.ExpectAttachedLayoutCoordinates);
        }
        NodeCoordinator wrappedBy$ui_release = getCoordinator().getWrappedBy$ui_release();
        if (wrappedBy$ui_release == null || (lookaheadDelegate = wrappedBy$ui_release.getLookaheadDelegate()) == null) {
            return null;
        }
        return lookaheadDelegate.getCoordinates();
    }

    @Override // androidx.compose.ui.layout.LayoutCoordinates
    public boolean isAttached() {
        return getCoordinator().isAttached();
    }

    @Override // androidx.compose.ui.layout.LayoutCoordinates
    public boolean getIntroducesMotionFrameOfReference() {
        return this.lookaheadDelegate.isPlacedUnderMotionFrameOfReference();
    }

    /* renamed from: getLookaheadOffset-F1C5BW0  reason: not valid java name */
    private final long m5664getLookaheadOffsetF1C5BW0() {
        LookaheadDelegate it = LookaheadLayoutCoordinatesKt.getRootLookaheadDelegate(this.lookaheadDelegate);
        return Offset.m4052minusMKHz9U(mo5646localPositionOfR5De75A(it.getCoordinates(), Offset.Companion.m4064getZeroF1C5BW0()), getCoordinator().mo5646localPositionOfR5De75A(it.getCoordinator(), Offset.Companion.m4064getZeroF1C5BW0()));
    }

    @Override // androidx.compose.ui.layout.LayoutCoordinates
    /* renamed from: screenToLocal-MK-Hz9U */
    public long mo5651screenToLocalMKHz9U(long relativeToScreen) {
        return Offset.m4053plusMKHz9U(getCoordinator().mo5651screenToLocalMKHz9U(relativeToScreen), m5664getLookaheadOffsetF1C5BW0());
    }

    @Override // androidx.compose.ui.layout.LayoutCoordinates
    /* renamed from: localToScreen-MK-Hz9U */
    public long mo5649localToScreenMKHz9U(long relativeToLocal) {
        return getCoordinator().mo5649localToScreenMKHz9U(Offset.m4053plusMKHz9U(relativeToLocal, m5664getLookaheadOffsetF1C5BW0()));
    }

    @Override // androidx.compose.ui.layout.LayoutCoordinates
    /* renamed from: windowToLocal-MK-Hz9U */
    public long mo5654windowToLocalMKHz9U(long relativeToWindow) {
        return Offset.m4053plusMKHz9U(getCoordinator().mo5654windowToLocalMKHz9U(relativeToWindow), m5664getLookaheadOffsetF1C5BW0());
    }

    @Override // androidx.compose.ui.layout.LayoutCoordinates
    /* renamed from: localToWindow-MK-Hz9U */
    public long mo5650localToWindowMKHz9U(long relativeToLocal) {
        return getCoordinator().mo5650localToWindowMKHz9U(Offset.m4053plusMKHz9U(relativeToLocal, m5664getLookaheadOffsetF1C5BW0()));
    }

    @Override // androidx.compose.ui.layout.LayoutCoordinates
    /* renamed from: localToRoot-MK-Hz9U */
    public long mo5648localToRootMKHz9U(long relativeToLocal) {
        return getCoordinator().mo5648localToRootMKHz9U(Offset.m4053plusMKHz9U(relativeToLocal, m5664getLookaheadOffsetF1C5BW0()));
    }

    @Override // androidx.compose.ui.layout.LayoutCoordinates
    /* renamed from: localPositionOf-R5De75A */
    public long mo5646localPositionOfR5De75A(LayoutCoordinates sourceCoordinates, long relativeToSource) {
        return mo5647localPositionOfS_NoaFU(sourceCoordinates, relativeToSource, true);
    }

    @Override // androidx.compose.ui.layout.LayoutCoordinates
    /* renamed from: localPositionOf-S_NoaFU */
    public long mo5647localPositionOfS_NoaFU(LayoutCoordinates sourceCoordinates, long relativeToSource, boolean includeMotionFrameOfReference) {
        if (!(sourceCoordinates instanceof LookaheadLayoutCoordinates)) {
            LookaheadDelegate rootDelegate = LookaheadLayoutCoordinatesKt.getRootLookaheadDelegate(this.lookaheadDelegate);
            long mo5647localPositionOfS_NoaFU = mo5647localPositionOfS_NoaFU(rootDelegate.getLookaheadLayoutCoordinates(), relativeToSource, includeMotionFrameOfReference);
            long $this$toOffset_u2d_u2dgyyYBs$iv = rootDelegate.mo5832getPositionnOccac();
            float x$iv$iv = IntOffset.m7001getXimpl($this$toOffset_u2d_u2dgyyYBs$iv);
            float y$iv$iv = IntOffset.m7002getYimpl($this$toOffset_u2d_u2dgyyYBs$iv);
            long v1$iv$iv$iv = Float.floatToRawIntBits(x$iv$iv);
            long v1$iv$iv$iv2 = Float.floatToRawIntBits(y$iv$iv);
            long v2$iv$iv$iv = (v1$iv$iv$iv << 32) | (v1$iv$iv$iv2 & 4294967295L);
            long localLookaheadPos = Offset.m4052minusMKHz9U(mo5647localPositionOfS_NoaFU, Offset.m4040constructorimpl(v2$iv$iv$iv));
            LayoutCoordinates rootDelegateCoordinates = rootDelegate.getCoordinator().getParentCoordinates();
            if (rootDelegateCoordinates == null) {
                rootDelegateCoordinates = rootDelegate.getCoordinator().getCoordinates();
            }
            long localPos = rootDelegateCoordinates.mo5647localPositionOfS_NoaFU(sourceCoordinates, Offset.Companion.m4064getZeroF1C5BW0(), includeMotionFrameOfReference);
            return Offset.m4053plusMKHz9U(localLookaheadPos, localPos);
        }
        LookaheadDelegate source = ((LookaheadLayoutCoordinates) sourceCoordinates).lookaheadDelegate;
        source.getCoordinator().onCoordinatesUsed$ui_release();
        NodeCoordinator commonAncestor = getCoordinator().findCommonAncestor$ui_release(source.getCoordinator());
        LookaheadDelegate ancestor = commonAncestor.getLookaheadDelegate();
        if (ancestor != null) {
            long sourceInCommonAncestor = IntOffset.m7005plusqkQi6aY(source.m5839positionIniSbpLlY$ui_release(ancestor, !includeMotionFrameOfReference), IntOffsetKt.m7018roundk4lQ0M(relativeToSource));
            long lookaheadPosInAncestor = this.lookaheadDelegate.m5839positionIniSbpLlY$ui_release(ancestor, !includeMotionFrameOfReference);
            long $this$toOffset_u2d_u2dgyyYBs$iv2 = IntOffset.m7004minusqkQi6aY(sourceInCommonAncestor, lookaheadPosInAncestor);
            float x$iv$iv2 = IntOffset.m7001getXimpl($this$toOffset_u2d_u2dgyyYBs$iv2);
            float y$iv$iv2 = IntOffset.m7002getYimpl($this$toOffset_u2d_u2dgyyYBs$iv2);
            long v1$iv$iv$iv3 = Float.floatToRawIntBits(x$iv$iv2);
            long v1$iv$iv$iv4 = Float.floatToRawIntBits(y$iv$iv2);
            long v2$iv$iv$iv2 = (v1$iv$iv$iv3 << 32) | (v1$iv$iv$iv4 & 4294967295L);
            return Offset.m4040constructorimpl(v2$iv$iv$iv2);
        }
        LookaheadDelegate sourceRoot = LookaheadLayoutCoordinatesKt.getRootLookaheadDelegate(source);
        long sourcePosition = IntOffset.m7005plusqkQi6aY(IntOffset.m7005plusqkQi6aY(source.m5839positionIniSbpLlY$ui_release(sourceRoot, !includeMotionFrameOfReference), sourceRoot.mo5832getPositionnOccac()), IntOffsetKt.m7018roundk4lQ0M(relativeToSource));
        LookaheadDelegate rootDelegate2 = LookaheadLayoutCoordinatesKt.getRootLookaheadDelegate(this.lookaheadDelegate);
        long lookaheadPosition = IntOffset.m7005plusqkQi6aY(this.lookaheadDelegate.m5839positionIniSbpLlY$ui_release(rootDelegate2, !includeMotionFrameOfReference), rootDelegate2.mo5832getPositionnOccac());
        long $this$toOffset_u2d_u2dgyyYBs$iv3 = IntOffset.m7004minusqkQi6aY(sourcePosition, lookaheadPosition);
        float x$iv$iv3 = IntOffset.m7001getXimpl($this$toOffset_u2d_u2dgyyYBs$iv3);
        float y$iv$iv3 = IntOffset.m7002getYimpl($this$toOffset_u2d_u2dgyyYBs$iv3);
        long v1$iv$iv$iv5 = Float.floatToRawIntBits(x$iv$iv3);
        long v2$iv$iv$iv3 = Float.floatToRawIntBits(y$iv$iv3);
        long relativePosition = Offset.m4040constructorimpl((v1$iv$iv$iv5 << 32) | (v2$iv$iv$iv3 & 4294967295L));
        NodeCoordinator wrappedBy$ui_release = rootDelegate2.getCoordinator().getWrappedBy$ui_release();
        Intrinsics.checkNotNull(wrappedBy$ui_release);
        NodeCoordinator wrappedBy$ui_release2 = sourceRoot.getCoordinator().getWrappedBy$ui_release();
        Intrinsics.checkNotNull(wrappedBy$ui_release2);
        return wrappedBy$ui_release.mo5647localPositionOfS_NoaFU(wrappedBy$ui_release2, relativePosition, includeMotionFrameOfReference);
    }

    @Override // androidx.compose.ui.layout.LayoutCoordinates
    public Rect localBoundingBoxOf(LayoutCoordinates sourceCoordinates, boolean clipBounds) {
        return getCoordinator().localBoundingBoxOf(sourceCoordinates, clipBounds);
    }

    @Override // androidx.compose.ui.layout.LayoutCoordinates
    /* renamed from: transformFrom-EL8BTi8 */
    public void mo5652transformFromEL8BTi8(LayoutCoordinates sourceCoordinates, float[] matrix) {
        getCoordinator().mo5652transformFromEL8BTi8(sourceCoordinates, matrix);
    }

    @Override // androidx.compose.ui.layout.LayoutCoordinates
    /* renamed from: transformToScreen-58bKbWc */
    public void mo5653transformToScreen58bKbWc(float[] matrix) {
        getCoordinator().mo5653transformToScreen58bKbWc(matrix);
    }

    @Override // androidx.compose.ui.layout.LayoutCoordinates
    public int get(AlignmentLine alignmentLine) {
        return this.lookaheadDelegate.get(alignmentLine);
    }
}
