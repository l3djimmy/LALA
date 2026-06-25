package androidx.compose.ui.layout;

import androidx.compose.ui.graphics.GraphicsLayerScope;
import androidx.compose.ui.graphics.layer.GraphicsLayer;
import androidx.compose.ui.node.MotionReferencePlacementDelegate;
import androidx.compose.ui.unit.Constraints;
import androidx.compose.ui.unit.IntOffset;
import androidx.compose.ui.unit.IntSize;
import androidx.compose.ui.unit.LayoutDirection;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.ranges.RangesKt;
/* compiled from: Placeable.kt */
@Metadata(d1 = {"\u0000R\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\b\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0010\u0007\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\b'\u0018\u00002\u00020\u0001:\u0001,B\u0005¢\u0006\u0002\u0010\u0002J\b\u0010\u001d\u001a\u00020\u001eH\u0002J=\u0010\u001f\u001a\u00020\u001e2\u0006\u0010 \u001a\u00020\u00042\u0006\u0010!\u001a\u00020\"2\u0019\u0010#\u001a\u0015\u0012\u0004\u0012\u00020%\u0012\u0004\u0012\u00020\u001e\u0018\u00010$¢\u0006\u0002\b&H$ø\u0001\u0000¢\u0006\u0004\b'\u0010(J*\u0010\u001f\u001a\u00020\u001e2\u0006\u0010 \u001a\u00020\u00042\u0006\u0010!\u001a\u00020\"2\u0006\u0010)\u001a\u00020*H\u0014ø\u0001\u0000¢\u0006\u0004\b'\u0010+R&\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0004@BX\u0084\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\n\n\u0002\u0010\b\u001a\u0004\b\u0006\u0010\u0007R\u001e\u0010\n\u001a\u00020\t2\u0006\u0010\u0003\u001a\u00020\t@BX\u0086\u000e¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0014\u0010\r\u001a\u00020\t8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u000e\u0010\fR,\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u000f\u001a\u00020\u0010@DX\u0084\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0010\n\u0002\u0010\b\u001a\u0004\b\u0012\u0010\u0007\"\u0004\b\u0013\u0010\u0014R\u0014\u0010\u0015\u001a\u00020\t8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u0016\u0010\fR,\u0010\u0018\u001a\u00020\u00172\u0006\u0010\u000f\u001a\u00020\u0017@DX\u0084\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0010\n\u0002\u0010\b\u001a\u0004\b\u0019\u0010\u0007\"\u0004\b\u001a\u0010\u0014R\u001e\u0010\u001b\u001a\u00020\t2\u0006\u0010\u0003\u001a\u00020\t@BX\u0086\u000e¢\u0006\b\n\u0000\u001a\u0004\b\u001c\u0010\f\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006-"}, d2 = {"Landroidx/compose/ui/layout/Placeable;", "Landroidx/compose/ui/layout/Measured;", "()V", "<set-?>", "Landroidx/compose/ui/unit/IntOffset;", "apparentToRealOffset", "getApparentToRealOffset-nOcc-ac", "()J", "J", "", "height", "getHeight", "()I", "measuredHeight", "getMeasuredHeight", "value", "Landroidx/compose/ui/unit/IntSize;", "measuredSize", "getMeasuredSize-YbymL2g", "setMeasuredSize-ozmzZPI", "(J)V", "measuredWidth", "getMeasuredWidth", "Landroidx/compose/ui/unit/Constraints;", "measurementConstraints", "getMeasurementConstraints-msEJaDk", "setMeasurementConstraints-BRTryo0", "width", "getWidth", "onMeasuredSizeChanged", "", "placeAt", "position", "zIndex", "", "layerBlock", "Lkotlin/Function1;", "Landroidx/compose/ui/graphics/GraphicsLayerScope;", "Lkotlin/ExtensionFunctionType;", "placeAt-f8xVGno", "(JFLkotlin/jvm/functions/Function1;)V", "layer", "Landroidx/compose/ui/graphics/layer/GraphicsLayer;", "(JFLandroidx/compose/ui/graphics/layer/GraphicsLayer;)V", "PlacementScope", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public abstract class Placeable implements Measured {
    public static final int $stable = 8;
    private int height;
    private int width;
    private long measuredSize = IntSize.m7039constructorimpl((0 << 32) | (0 & 4294967295L));
    private long measurementConstraints = PlaceableKt.access$getDefaultConstraints$p();
    private long apparentToRealOffset = IntOffset.Companion.m7012getZeronOccac();

    /* renamed from: placeAt-f8xVGno */
    public abstract void mo5638placeAtf8xVGno(long j, float f, Function1<? super GraphicsLayerScope, Unit> function1);

    public final int getWidth() {
        return this.width;
    }

    public final int getHeight() {
        return this.height;
    }

    @Override // androidx.compose.ui.layout.Measured
    public int getMeasuredWidth() {
        long arg0$iv = this.measuredSize;
        return (int) (arg0$iv >> 32);
    }

    @Override // androidx.compose.ui.layout.Measured
    public int getMeasuredHeight() {
        long arg0$iv = this.measuredSize;
        return (int) (4294967295L & arg0$iv);
    }

    /* renamed from: getMeasuredSize-YbymL2g */
    public final long m5696getMeasuredSizeYbymL2g() {
        return this.measuredSize;
    }

    /* renamed from: setMeasuredSize-ozmzZPI */
    public final void m5699setMeasuredSizeozmzZPI(long value) {
        if (!IntSize.m7042equalsimpl0(this.measuredSize, value)) {
            this.measuredSize = value;
            onMeasuredSizeChanged();
        }
    }

    private final void onMeasuredSizeChanged() {
        long arg0$iv = this.measuredSize;
        long arg0$iv2 = this.measurementConstraints;
        this.width = RangesKt.coerceIn((int) (arg0$iv >> 32), Constraints.m6828getMinWidthimpl(arg0$iv2), Constraints.m6826getMaxWidthimpl(this.measurementConstraints));
        long arg0$iv3 = this.measuredSize;
        long arg0$iv4 = this.measurementConstraints;
        this.height = RangesKt.coerceIn((int) (arg0$iv3 & 4294967295L), Constraints.m6827getMinHeightimpl(arg0$iv4), Constraints.m6825getMaxHeightimpl(this.measurementConstraints));
        int i = this.width;
        long arg0$iv5 = this.measuredSize;
        int x$iv = (i - ((int) (arg0$iv5 >> 32))) / 2;
        int i2 = this.height;
        long arg0$iv6 = this.measuredSize;
        int $i$f$unpackInt2 = (int) (arg0$iv6 & 4294967295L);
        int y$iv = (i2 - $i$f$unpackInt2) / 2;
        this.apparentToRealOffset = IntOffset.m6995constructorimpl((x$iv << 32) | (y$iv & 4294967295L));
    }

    /* renamed from: placeAt-f8xVGno */
    public void mo5698placeAtf8xVGno(long position, float zIndex, GraphicsLayer layer) {
        mo5638placeAtf8xVGno(position, zIndex, (Function1<? super GraphicsLayerScope, Unit>) null);
    }

    /* renamed from: getMeasurementConstraints-msEJaDk */
    public final long m5697getMeasurementConstraintsmsEJaDk() {
        return this.measurementConstraints;
    }

    /* renamed from: setMeasurementConstraints-BRTryo0 */
    public final void m5700setMeasurementConstraintsBRTryo0(long value) {
        if (!Constraints.m6819equalsimpl0(this.measurementConstraints, value)) {
            this.measurementConstraints = value;
            onMeasuredSizeChanged();
        }
    }

    /* renamed from: getApparentToRealOffset-nOcc-ac */
    public final long m5695getApparentToRealOffsetnOccac() {
        return this.apparentToRealOffset;
    }

    /* compiled from: Placeable.kt */
    @Metadata(d1 = {"\u0000f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0007\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u000b\b'\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002J\u001f\u0010\u0011\u001a\u00020\u00122\u0017\u0010\u0013\u001a\u0013\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00120\u0014¢\u0006\u0002\b\u0015J\u0014\u0010\u0016\u001a\u00020\u0017*\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u0017H\u0016J\f\u0010\u001a\u001a\u00020\u0012*\u00020\u001bH\u0002J&\u0010\u001c\u001a\u00020\u0012*\u00020\u001b2\u0006\u0010\u001d\u001a\u00020\u001e2\b\b\u0002\u0010\u001f\u001a\u00020\u0017ø\u0001\u0000¢\u0006\u0004\b \u0010!J$\u0010\u001c\u001a\u00020\u0012*\u00020\u001b2\u0006\u0010\"\u001a\u00020\u000e2\u0006\u0010#\u001a\u00020\u000e2\b\b\u0002\u0010\u001f\u001a\u00020\u0017JD\u0010$\u001a\u00020\u0012*\u00020\u001b2\u0006\u0010\u001d\u001a\u00020\u001e2\u0006\u0010\u001f\u001a\u00020\u00172\u001b\b\b\u0010%\u001a\u0015\u0012\u0004\u0012\u00020&\u0012\u0004\u0012\u00020\u0012\u0018\u00010\u0014¢\u0006\u0002\b\u0015H\u0080\bø\u0001\u0000¢\u0006\u0004\b'\u0010(J/\u0010$\u001a\u00020\u0012*\u00020\u001b2\u0006\u0010\u001d\u001a\u00020\u001e2\u0006\u0010\u001f\u001a\u00020\u00172\u0006\u0010)\u001a\u00020*H\u0080\bø\u0001\u0000¢\u0006\u0004\b'\u0010+JD\u0010,\u001a\u00020\u0012*\u00020\u001b2\u0006\u0010\u001d\u001a\u00020\u001e2\u0006\u0010\u001f\u001a\u00020\u00172\u001b\b\b\u0010%\u001a\u0015\u0012\u0004\u0012\u00020&\u0012\u0004\u0012\u00020\u0012\u0018\u00010\u0014¢\u0006\u0002\b\u0015H\u0080\bø\u0001\u0000¢\u0006\u0004\b-\u0010(J/\u0010,\u001a\u00020\u0012*\u00020\u001b2\u0006\u0010\u001d\u001a\u00020\u001e2\u0006\u0010\u001f\u001a\u00020\u00172\u0006\u0010)\u001a\u00020*H\u0080\bø\u0001\u0000¢\u0006\u0004\b-\u0010+J&\u0010.\u001a\u00020\u0012*\u00020\u001b2\u0006\u0010\u001d\u001a\u00020\u001e2\b\b\u0002\u0010\u001f\u001a\u00020\u0017ø\u0001\u0000¢\u0006\u0004\b/\u0010!J$\u0010.\u001a\u00020\u0012*\u00020\u001b2\u0006\u0010\"\u001a\u00020\u000e2\u0006\u0010#\u001a\u00020\u000e2\b\b\u0002\u0010\u001f\u001a\u00020\u0017J.\u00100\u001a\u00020\u0012*\u00020\u001b2\u0006\u0010\u001d\u001a\u00020\u001e2\u0006\u0010)\u001a\u00020*2\b\b\u0002\u0010\u001f\u001a\u00020\u0017ø\u0001\u0000¢\u0006\u0004\b1\u00102JA\u00100\u001a\u00020\u0012*\u00020\u001b2\u0006\u0010\u001d\u001a\u00020\u001e2\b\b\u0002\u0010\u001f\u001a\u00020\u00172\u0019\b\u0002\u0010%\u001a\u0013\u0012\u0004\u0012\u00020&\u0012\u0004\u0012\u00020\u00120\u0014¢\u0006\u0002\b\u0015ø\u0001\u0000¢\u0006\u0004\b1\u0010(J,\u00100\u001a\u00020\u0012*\u00020\u001b2\u0006\u0010\"\u001a\u00020\u000e2\u0006\u0010#\u001a\u00020\u000e2\u0006\u0010)\u001a\u00020*2\b\b\u0002\u0010\u001f\u001a\u00020\u0017J?\u00100\u001a\u00020\u0012*\u00020\u001b2\u0006\u0010\"\u001a\u00020\u000e2\u0006\u0010#\u001a\u00020\u000e2\b\b\u0002\u0010\u001f\u001a\u00020\u00172\u0019\b\u0002\u0010%\u001a\u0013\u0012\u0004\u0012\u00020&\u0012\u0004\u0012\u00020\u00120\u0014¢\u0006\u0002\b\u0015J.\u00103\u001a\u00020\u0012*\u00020\u001b2\u0006\u0010\u001d\u001a\u00020\u001e2\u0006\u0010)\u001a\u00020*2\b\b\u0002\u0010\u001f\u001a\u00020\u0017ø\u0001\u0000¢\u0006\u0004\b4\u00102JA\u00103\u001a\u00020\u0012*\u00020\u001b2\u0006\u0010\u001d\u001a\u00020\u001e2\b\b\u0002\u0010\u001f\u001a\u00020\u00172\u0019\b\u0002\u0010%\u001a\u0013\u0012\u0004\u0012\u00020&\u0012\u0004\u0012\u00020\u00120\u0014¢\u0006\u0002\b\u0015ø\u0001\u0000¢\u0006\u0004\b4\u0010(J,\u00103\u001a\u00020\u0012*\u00020\u001b2\u0006\u0010\"\u001a\u00020\u000e2\u0006\u0010#\u001a\u00020\u000e2\u0006\u0010)\u001a\u00020*2\b\b\u0002\u0010\u001f\u001a\u00020\u0017J?\u00103\u001a\u00020\u0012*\u00020\u001b2\u0006\u0010\"\u001a\u00020\u000e2\u0006\u0010#\u001a\u00020\u000e2\b\b\u0002\u0010\u001f\u001a\u00020\u00172\u0019\b\u0002\u0010%\u001a\u0013\u0012\u0004\u0012\u00020&\u0012\u0004\u0012\u00020\u00120\u0014¢\u0006\u0002\b\u0015R\u0016\u0010\u0003\u001a\u0004\u0018\u00010\u00048VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u0005\u0010\u0006R\u000e\u0010\u0007\u001a\u00020\bX\u0082\u000e¢\u0006\u0002\n\u0000R\u0012\u0010\t\u001a\u00020\nX¤\u0004¢\u0006\u0006\u001a\u0004\b\u000b\u0010\fR\u0012\u0010\r\u001a\u00020\u000eX¤\u0004¢\u0006\u0006\u001a\u0004\b\u000f\u0010\u0010\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u00065"}, d2 = {"Landroidx/compose/ui/layout/Placeable$PlacementScope;", "", "()V", "coordinates", "Landroidx/compose/ui/layout/LayoutCoordinates;", "getCoordinates", "()Landroidx/compose/ui/layout/LayoutCoordinates;", "motionFrameOfReferencePlacement", "", "parentLayoutDirection", "Landroidx/compose/ui/unit/LayoutDirection;", "getParentLayoutDirection", "()Landroidx/compose/ui/unit/LayoutDirection;", "parentWidth", "", "getParentWidth", "()I", "withMotionFrameOfReferencePlacement", "", "block", "Lkotlin/Function1;", "Lkotlin/ExtensionFunctionType;", "current", "", "Landroidx/compose/ui/layout/Ruler;", "defaultValue", "handleMotionFrameOfReferencePlacement", "Landroidx/compose/ui/layout/Placeable;", "place", "position", "Landroidx/compose/ui/unit/IntOffset;", "zIndex", "place-70tqf50", "(Landroidx/compose/ui/layout/Placeable;JF)V", "x", "y", "placeApparentToRealOffset", "layerBlock", "Landroidx/compose/ui/graphics/GraphicsLayerScope;", "placeApparentToRealOffset-aW-9-wM$ui_release", "(Landroidx/compose/ui/layout/Placeable;JFLkotlin/jvm/functions/Function1;)V", "layer", "Landroidx/compose/ui/graphics/layer/GraphicsLayer;", "(Landroidx/compose/ui/layout/Placeable;JFLandroidx/compose/ui/graphics/layer/GraphicsLayer;)V", "placeAutoMirrored", "placeAutoMirrored-aW-9-wM$ui_release", "placeRelative", "placeRelative-70tqf50", "placeRelativeWithLayer", "placeRelativeWithLayer-aW-9-wM", "(Landroidx/compose/ui/layout/Placeable;JLandroidx/compose/ui/graphics/layer/GraphicsLayer;F)V", "placeWithLayer", "placeWithLayer-aW-9-wM", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    @PlacementScopeMarker
    /* loaded from: classes11.dex */
    public static abstract class PlacementScope {
        public static final int $stable = 8;
        private boolean motionFrameOfReferencePlacement;

        public abstract LayoutDirection getParentLayoutDirection();

        public abstract int getParentWidth();

        public LayoutCoordinates getCoordinates() {
            return null;
        }

        public float current(Ruler $this$current, float defaultValue) {
            return defaultValue;
        }

        /* renamed from: placeRelative-70tqf50$default */
        public static /* synthetic */ void m5702placeRelative70tqf50$default(PlacementScope placementScope, Placeable placeable, long j, float f, int i, Object obj) {
            if (obj != null) {
                throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: placeRelative-70tqf50");
            }
            if ((i & 2) != 0) {
                f = 0.0f;
            }
            placementScope.m5712placeRelative70tqf50(placeable, j, f);
        }

        /* renamed from: placeRelative-70tqf50 */
        public final void m5712placeRelative70tqf50(Placeable $this$placeRelative_u2d70tqf50, long position, float zIndex) {
            if (getParentLayoutDirection() == LayoutDirection.Ltr || getParentWidth() == 0) {
                handleMotionFrameOfReferencePlacement($this$placeRelative_u2d70tqf50);
                $this$placeRelative_u2d70tqf50.mo5638placeAtf8xVGno(IntOffset.m7005plusqkQi6aY(position, $this$placeRelative_u2d70tqf50.apparentToRealOffset), zIndex, (Function1<? super GraphicsLayerScope, Unit>) null);
                return;
            }
            int x$iv$iv = (getParentWidth() - $this$placeRelative_u2d70tqf50.getWidth()) - IntOffset.m7001getXimpl(position);
            int y$iv$iv = IntOffset.m7002getYimpl(position);
            long position$iv$iv = IntOffset.m6995constructorimpl((x$iv$iv << 32) | (y$iv$iv & 4294967295L));
            handleMotionFrameOfReferencePlacement($this$placeRelative_u2d70tqf50);
            $this$placeRelative_u2d70tqf50.mo5638placeAtf8xVGno(IntOffset.m7005plusqkQi6aY(position$iv$iv, $this$placeRelative_u2d70tqf50.apparentToRealOffset), zIndex, (Function1<? super GraphicsLayerScope, Unit>) null);
        }

        public static /* synthetic */ void placeRelative$default(PlacementScope placementScope, Placeable placeable, int i, int i2, float f, int i3, Object obj) {
            if (obj != null) {
                throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: placeRelative");
            }
            if ((i3 & 4) != 0) {
                f = 0.0f;
            }
            placementScope.placeRelative(placeable, i, i2, f);
        }

        public final void placeRelative(Placeable $this$placeRelative, int x, int y, float zIndex) {
            long position$iv = IntOffset.m6995constructorimpl((x << 32) | (y & 4294967295L));
            if (getParentLayoutDirection() == LayoutDirection.Ltr || getParentWidth() == 0) {
                handleMotionFrameOfReferencePlacement($this$placeRelative);
                $this$placeRelative.mo5638placeAtf8xVGno(IntOffset.m7005plusqkQi6aY(position$iv, $this$placeRelative.apparentToRealOffset), zIndex, (Function1<? super GraphicsLayerScope, Unit>) null);
                return;
            }
            int x$iv$iv = (getParentWidth() - $this$placeRelative.getWidth()) - IntOffset.m7001getXimpl(position$iv);
            int y$iv$iv = IntOffset.m7002getYimpl(position$iv);
            long position$iv$iv = IntOffset.m6995constructorimpl((x$iv$iv << 32) | (y$iv$iv & 4294967295L));
            handleMotionFrameOfReferencePlacement($this$placeRelative);
            $this$placeRelative.mo5638placeAtf8xVGno(IntOffset.m7005plusqkQi6aY(position$iv$iv, $this$placeRelative.apparentToRealOffset), zIndex, (Function1<? super GraphicsLayerScope, Unit>) null);
        }

        public static /* synthetic */ void place$default(PlacementScope placementScope, Placeable placeable, int i, int i2, float f, int i3, Object obj) {
            if (obj != null) {
                throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: place");
            }
            if ((i3 & 4) != 0) {
                f = 0.0f;
            }
            placementScope.place(placeable, i, i2, f);
        }

        public final void place(Placeable $this$place, int x, int y, float zIndex) {
            long position$iv = IntOffset.m6995constructorimpl((x << 32) | (y & 4294967295L));
            handleMotionFrameOfReferencePlacement($this$place);
            $this$place.mo5638placeAtf8xVGno(IntOffset.m7005plusqkQi6aY(position$iv, $this$place.apparentToRealOffset), zIndex, (Function1<? super GraphicsLayerScope, Unit>) null);
        }

        /* renamed from: place-70tqf50$default */
        public static /* synthetic */ void m5701place70tqf50$default(PlacementScope placementScope, Placeable placeable, long j, float f, int i, Object obj) {
            if (obj != null) {
                throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: place-70tqf50");
            }
            if ((i & 2) != 0) {
                f = 0.0f;
            }
            placementScope.m5707place70tqf50(placeable, j, f);
        }

        /* renamed from: place-70tqf50 */
        public final void m5707place70tqf50(Placeable $this$place_u2d70tqf50, long position, float zIndex) {
            handleMotionFrameOfReferencePlacement($this$place_u2d70tqf50);
            $this$place_u2d70tqf50.mo5638placeAtf8xVGno(IntOffset.m7005plusqkQi6aY(position, $this$place_u2d70tqf50.apparentToRealOffset), zIndex, (Function1<? super GraphicsLayerScope, Unit>) null);
        }

        /* renamed from: placeRelativeWithLayer-aW-9-wM$default */
        public static /* synthetic */ void m5703placeRelativeWithLayeraW9wM$default(PlacementScope placementScope, Placeable placeable, long j, float f, Function1 function1, int i, Object obj) {
            float f2;
            Function1 function12;
            Function1 function13;
            if (obj != null) {
                throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: placeRelativeWithLayer-aW-9-wM");
            }
            if ((i & 2) == 0) {
                f2 = f;
            } else {
                f2 = 0.0f;
            }
            if ((i & 4) != 0) {
                function13 = PlaceableKt.DefaultLayerBlock;
                function12 = function13;
            } else {
                function12 = function1;
            }
            placementScope.m5713placeRelativeWithLayeraW9wM(placeable, j, f2, function12);
        }

        /* renamed from: placeRelativeWithLayer-aW-9-wM */
        public final void m5713placeRelativeWithLayeraW9wM(Placeable $this$placeRelativeWithLayer_u2daW_u2d9_u2dwM, long position, float zIndex, Function1<? super GraphicsLayerScope, Unit> function1) {
            if (getParentLayoutDirection() == LayoutDirection.Ltr || getParentWidth() == 0) {
                handleMotionFrameOfReferencePlacement($this$placeRelativeWithLayer_u2daW_u2d9_u2dwM);
                $this$placeRelativeWithLayer_u2daW_u2d9_u2dwM.mo5638placeAtf8xVGno(IntOffset.m7005plusqkQi6aY(position, $this$placeRelativeWithLayer_u2daW_u2d9_u2dwM.apparentToRealOffset), zIndex, function1);
                return;
            }
            int x$iv$iv = (getParentWidth() - $this$placeRelativeWithLayer_u2daW_u2d9_u2dwM.getWidth()) - IntOffset.m7001getXimpl(position);
            int y$iv$iv = IntOffset.m7002getYimpl(position);
            long position$iv$iv = IntOffset.m6995constructorimpl((x$iv$iv << 32) | (y$iv$iv & 4294967295L));
            handleMotionFrameOfReferencePlacement($this$placeRelativeWithLayer_u2daW_u2d9_u2dwM);
            $this$placeRelativeWithLayer_u2daW_u2d9_u2dwM.mo5638placeAtf8xVGno(IntOffset.m7005plusqkQi6aY(position$iv$iv, $this$placeRelativeWithLayer_u2daW_u2d9_u2dwM.apparentToRealOffset), zIndex, function1);
        }

        public static /* synthetic */ void placeRelativeWithLayer$default(PlacementScope placementScope, Placeable placeable, int i, int i2, float f, Function1 function1, int i3, Object obj) {
            float f2;
            Function1 function12;
            Function1 function13;
            if (obj != null) {
                throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: placeRelativeWithLayer");
            }
            if ((i3 & 4) == 0) {
                f2 = f;
            } else {
                f2 = 0.0f;
            }
            if ((i3 & 8) != 0) {
                function13 = PlaceableKt.DefaultLayerBlock;
                function12 = function13;
            } else {
                function12 = function1;
            }
            placementScope.placeRelativeWithLayer(placeable, i, i2, f2, function12);
        }

        public final void placeRelativeWithLayer(Placeable $this$placeRelativeWithLayer, int x, int y, float zIndex, Function1<? super GraphicsLayerScope, Unit> function1) {
            long position$iv = IntOffset.m6995constructorimpl((x << 32) | (y & 4294967295L));
            if (getParentLayoutDirection() == LayoutDirection.Ltr || getParentWidth() == 0) {
                handleMotionFrameOfReferencePlacement($this$placeRelativeWithLayer);
                $this$placeRelativeWithLayer.mo5638placeAtf8xVGno(IntOffset.m7005plusqkQi6aY(position$iv, $this$placeRelativeWithLayer.apparentToRealOffset), zIndex, function1);
                return;
            }
            int x$iv$iv = (getParentWidth() - $this$placeRelativeWithLayer.getWidth()) - IntOffset.m7001getXimpl(position$iv);
            int y$iv$iv = IntOffset.m7002getYimpl(position$iv);
            long position$iv$iv = IntOffset.m6995constructorimpl((x$iv$iv << 32) | (y$iv$iv & 4294967295L));
            handleMotionFrameOfReferencePlacement($this$placeRelativeWithLayer);
            $this$placeRelativeWithLayer.mo5638placeAtf8xVGno(IntOffset.m7005plusqkQi6aY(position$iv$iv, $this$placeRelativeWithLayer.apparentToRealOffset), zIndex, function1);
        }

        public static /* synthetic */ void placeWithLayer$default(PlacementScope placementScope, Placeable placeable, int i, int i2, float f, Function1 function1, int i3, Object obj) {
            float f2;
            Function1 function12;
            Function1 function13;
            if (obj != null) {
                throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: placeWithLayer");
            }
            if ((i3 & 4) == 0) {
                f2 = f;
            } else {
                f2 = 0.0f;
            }
            if ((i3 & 8) != 0) {
                function13 = PlaceableKt.DefaultLayerBlock;
                function12 = function13;
            } else {
                function12 = function1;
            }
            placementScope.placeWithLayer(placeable, i, i2, f2, function12);
        }

        public final void placeWithLayer(Placeable $this$placeWithLayer, int x, int y, float zIndex, Function1<? super GraphicsLayerScope, Unit> function1) {
            long position$iv = IntOffset.m6995constructorimpl((x << 32) | (y & 4294967295L));
            handleMotionFrameOfReferencePlacement($this$placeWithLayer);
            $this$placeWithLayer.mo5638placeAtf8xVGno(IntOffset.m7005plusqkQi6aY(position$iv, $this$placeWithLayer.apparentToRealOffset), zIndex, function1);
        }

        /* renamed from: placeWithLayer-aW-9-wM$default */
        public static /* synthetic */ void m5705placeWithLayeraW9wM$default(PlacementScope placementScope, Placeable placeable, long j, float f, Function1 function1, int i, Object obj) {
            float f2;
            Function1 function12;
            Function1 function13;
            if (obj != null) {
                throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: placeWithLayer-aW-9-wM");
            }
            if ((i & 2) == 0) {
                f2 = f;
            } else {
                f2 = 0.0f;
            }
            if ((i & 4) != 0) {
                function13 = PlaceableKt.DefaultLayerBlock;
                function12 = function13;
            } else {
                function12 = function1;
            }
            placementScope.m5715placeWithLayeraW9wM(placeable, j, f2, function12);
        }

        /* renamed from: placeWithLayer-aW-9-wM */
        public final void m5715placeWithLayeraW9wM(Placeable $this$placeWithLayer_u2daW_u2d9_u2dwM, long position, float zIndex, Function1<? super GraphicsLayerScope, Unit> function1) {
            handleMotionFrameOfReferencePlacement($this$placeWithLayer_u2daW_u2d9_u2dwM);
            $this$placeWithLayer_u2daW_u2d9_u2dwM.mo5638placeAtf8xVGno(IntOffset.m7005plusqkQi6aY(position, $this$placeWithLayer_u2daW_u2d9_u2dwM.apparentToRealOffset), zIndex, function1);
        }

        public static /* synthetic */ void placeWithLayer$default(PlacementScope placementScope, Placeable placeable, int i, int i2, GraphicsLayer graphicsLayer, float f, int i3, Object obj) {
            float f2;
            if (obj != null) {
                throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: placeWithLayer");
            }
            if ((i3 & 8) == 0) {
                f2 = f;
            } else {
                f2 = 0.0f;
            }
            placementScope.placeWithLayer(placeable, i, i2, graphicsLayer, f2);
        }

        public final void placeWithLayer(Placeable $this$placeWithLayer, int x, int y, GraphicsLayer layer, float zIndex) {
            long position$iv = IntOffset.m6995constructorimpl((x << 32) | (y & 4294967295L));
            handleMotionFrameOfReferencePlacement($this$placeWithLayer);
            $this$placeWithLayer.mo5698placeAtf8xVGno(IntOffset.m7005plusqkQi6aY(position$iv, $this$placeWithLayer.apparentToRealOffset), zIndex, layer);
        }

        /* renamed from: placeWithLayer-aW-9-wM$default */
        public static /* synthetic */ void m5706placeWithLayeraW9wM$default(PlacementScope placementScope, Placeable placeable, long j, GraphicsLayer graphicsLayer, float f, int i, Object obj) {
            float f2;
            if (obj != null) {
                throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: placeWithLayer-aW-9-wM");
            }
            if ((i & 4) == 0) {
                f2 = f;
            } else {
                f2 = 0.0f;
            }
            placementScope.m5716placeWithLayeraW9wM(placeable, j, graphicsLayer, f2);
        }

        /* renamed from: placeWithLayer-aW-9-wM */
        public final void m5716placeWithLayeraW9wM(Placeable $this$placeWithLayer_u2daW_u2d9_u2dwM, long position, GraphicsLayer layer, float zIndex) {
            handleMotionFrameOfReferencePlacement($this$placeWithLayer_u2daW_u2d9_u2dwM);
            $this$placeWithLayer_u2daW_u2d9_u2dwM.mo5698placeAtf8xVGno(IntOffset.m7005plusqkQi6aY(position, $this$placeWithLayer_u2daW_u2d9_u2dwM.apparentToRealOffset), zIndex, layer);
        }

        public static /* synthetic */ void placeRelativeWithLayer$default(PlacementScope placementScope, Placeable placeable, int i, int i2, GraphicsLayer graphicsLayer, float f, int i3, Object obj) {
            float f2;
            if (obj != null) {
                throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: placeRelativeWithLayer");
            }
            if ((i3 & 8) == 0) {
                f2 = f;
            } else {
                f2 = 0.0f;
            }
            placementScope.placeRelativeWithLayer(placeable, i, i2, graphicsLayer, f2);
        }

        public final void placeRelativeWithLayer(Placeable $this$placeRelativeWithLayer, int x, int y, GraphicsLayer layer, float zIndex) {
            long position$iv = IntOffset.m6995constructorimpl((x << 32) | (y & 4294967295L));
            if (getParentLayoutDirection() == LayoutDirection.Ltr || getParentWidth() == 0) {
                handleMotionFrameOfReferencePlacement($this$placeRelativeWithLayer);
                $this$placeRelativeWithLayer.mo5698placeAtf8xVGno(IntOffset.m7005plusqkQi6aY(position$iv, $this$placeRelativeWithLayer.apparentToRealOffset), zIndex, layer);
                return;
            }
            int x$iv$iv = (getParentWidth() - $this$placeRelativeWithLayer.getWidth()) - IntOffset.m7001getXimpl(position$iv);
            int y$iv$iv = IntOffset.m7002getYimpl(position$iv);
            long position$iv$iv = IntOffset.m6995constructorimpl((x$iv$iv << 32) | (y$iv$iv & 4294967295L));
            handleMotionFrameOfReferencePlacement($this$placeRelativeWithLayer);
            $this$placeRelativeWithLayer.mo5698placeAtf8xVGno(IntOffset.m7005plusqkQi6aY(position$iv$iv, $this$placeRelativeWithLayer.apparentToRealOffset), zIndex, layer);
        }

        /* renamed from: placeRelativeWithLayer-aW-9-wM$default */
        public static /* synthetic */ void m5704placeRelativeWithLayeraW9wM$default(PlacementScope placementScope, Placeable placeable, long j, GraphicsLayer graphicsLayer, float f, int i, Object obj) {
            float f2;
            if (obj != null) {
                throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: placeRelativeWithLayer-aW-9-wM");
            }
            if ((i & 4) == 0) {
                f2 = f;
            } else {
                f2 = 0.0f;
            }
            placementScope.m5714placeRelativeWithLayeraW9wM(placeable, j, graphicsLayer, f2);
        }

        /* renamed from: placeRelativeWithLayer-aW-9-wM */
        public final void m5714placeRelativeWithLayeraW9wM(Placeable $this$placeRelativeWithLayer_u2daW_u2d9_u2dwM, long position, GraphicsLayer layer, float zIndex) {
            if (getParentLayoutDirection() == LayoutDirection.Ltr || getParentWidth() == 0) {
                handleMotionFrameOfReferencePlacement($this$placeRelativeWithLayer_u2daW_u2d9_u2dwM);
                $this$placeRelativeWithLayer_u2daW_u2d9_u2dwM.mo5698placeAtf8xVGno(IntOffset.m7005plusqkQi6aY(position, $this$placeRelativeWithLayer_u2daW_u2d9_u2dwM.apparentToRealOffset), zIndex, layer);
                return;
            }
            int x$iv$iv = (getParentWidth() - $this$placeRelativeWithLayer_u2daW_u2d9_u2dwM.getWidth()) - IntOffset.m7001getXimpl(position);
            int y$iv$iv = IntOffset.m7002getYimpl(position);
            long position$iv$iv = IntOffset.m6995constructorimpl((x$iv$iv << 32) | (y$iv$iv & 4294967295L));
            handleMotionFrameOfReferencePlacement($this$placeRelativeWithLayer_u2daW_u2d9_u2dwM);
            $this$placeRelativeWithLayer_u2daW_u2d9_u2dwM.mo5698placeAtf8xVGno(IntOffset.m7005plusqkQi6aY(position$iv$iv, $this$placeRelativeWithLayer_u2daW_u2d9_u2dwM.apparentToRealOffset), zIndex, layer);
        }

        /* renamed from: placeAutoMirrored-aW-9-wM$ui_release */
        public final void m5711placeAutoMirroredaW9wM$ui_release(Placeable $this$placeAutoMirrored_u2daW_u2d9_u2dwM, long position, float zIndex, Function1<? super GraphicsLayerScope, Unit> function1) {
            if (getParentLayoutDirection() == LayoutDirection.Ltr || getParentWidth() == 0) {
                handleMotionFrameOfReferencePlacement($this$placeAutoMirrored_u2daW_u2d9_u2dwM);
                $this$placeAutoMirrored_u2daW_u2d9_u2dwM.mo5638placeAtf8xVGno(IntOffset.m7005plusqkQi6aY(position, $this$placeAutoMirrored_u2daW_u2d9_u2dwM.apparentToRealOffset), zIndex, function1);
                return;
            }
            int x$iv = (getParentWidth() - $this$placeAutoMirrored_u2daW_u2d9_u2dwM.getWidth()) - IntOffset.m7001getXimpl(position);
            int y$iv = IntOffset.m7002getYimpl(position);
            long position$iv = IntOffset.m6995constructorimpl((x$iv << 32) | (y$iv & 4294967295L));
            handleMotionFrameOfReferencePlacement($this$placeAutoMirrored_u2daW_u2d9_u2dwM);
            $this$placeAutoMirrored_u2daW_u2d9_u2dwM.mo5638placeAtf8xVGno(IntOffset.m7005plusqkQi6aY(position$iv, $this$placeAutoMirrored_u2daW_u2d9_u2dwM.apparentToRealOffset), zIndex, function1);
        }

        /* renamed from: placeAutoMirrored-aW-9-wM$ui_release */
        public final void m5710placeAutoMirroredaW9wM$ui_release(Placeable $this$placeAutoMirrored_u2daW_u2d9_u2dwM, long position, float zIndex, GraphicsLayer layer) {
            if (getParentLayoutDirection() == LayoutDirection.Ltr || getParentWidth() == 0) {
                handleMotionFrameOfReferencePlacement($this$placeAutoMirrored_u2daW_u2d9_u2dwM);
                $this$placeAutoMirrored_u2daW_u2d9_u2dwM.mo5698placeAtf8xVGno(IntOffset.m7005plusqkQi6aY(position, $this$placeAutoMirrored_u2daW_u2d9_u2dwM.apparentToRealOffset), zIndex, layer);
                return;
            }
            int x$iv = (getParentWidth() - $this$placeAutoMirrored_u2daW_u2d9_u2dwM.getWidth()) - IntOffset.m7001getXimpl(position);
            int y$iv = IntOffset.m7002getYimpl(position);
            long position$iv = IntOffset.m6995constructorimpl((x$iv << 32) | (y$iv & 4294967295L));
            handleMotionFrameOfReferencePlacement($this$placeAutoMirrored_u2daW_u2d9_u2dwM);
            $this$placeAutoMirrored_u2daW_u2d9_u2dwM.mo5698placeAtf8xVGno(IntOffset.m7005plusqkQi6aY(position$iv, $this$placeAutoMirrored_u2daW_u2d9_u2dwM.apparentToRealOffset), zIndex, layer);
        }

        /* renamed from: placeApparentToRealOffset-aW-9-wM$ui_release */
        public final void m5709placeApparentToRealOffsetaW9wM$ui_release(Placeable $this$placeApparentToRealOffset_u2daW_u2d9_u2dwM, long position, float zIndex, Function1<? super GraphicsLayerScope, Unit> function1) {
            handleMotionFrameOfReferencePlacement($this$placeApparentToRealOffset_u2daW_u2d9_u2dwM);
            $this$placeApparentToRealOffset_u2daW_u2d9_u2dwM.mo5638placeAtf8xVGno(IntOffset.m7005plusqkQi6aY(position, $this$placeApparentToRealOffset_u2daW_u2d9_u2dwM.apparentToRealOffset), zIndex, function1);
        }

        /* renamed from: placeApparentToRealOffset-aW-9-wM$ui_release */
        public final void m5708placeApparentToRealOffsetaW9wM$ui_release(Placeable $this$placeApparentToRealOffset_u2daW_u2d9_u2dwM, long position, float zIndex, GraphicsLayer layer) {
            handleMotionFrameOfReferencePlacement($this$placeApparentToRealOffset_u2daW_u2d9_u2dwM);
            $this$placeApparentToRealOffset_u2daW_u2d9_u2dwM.mo5698placeAtf8xVGno(IntOffset.m7005plusqkQi6aY(position, $this$placeApparentToRealOffset_u2daW_u2d9_u2dwM.apparentToRealOffset), zIndex, layer);
        }

        public final void withMotionFrameOfReferencePlacement(Function1<? super PlacementScope, Unit> function1) {
            this.motionFrameOfReferencePlacement = true;
            function1.invoke(this);
            this.motionFrameOfReferencePlacement = false;
        }

        public final void handleMotionFrameOfReferencePlacement(Placeable $this$handleMotionFrameOfReferencePlacement) {
            if ($this$handleMotionFrameOfReferencePlacement instanceof MotionReferencePlacementDelegate) {
                ((MotionReferencePlacementDelegate) $this$handleMotionFrameOfReferencePlacement).updatePlacedUnderMotionFrameOfReference(this.motionFrameOfReferencePlacement);
            }
        }
    }
}
