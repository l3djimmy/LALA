package androidx.compose.foundation.layout;

import androidx.compose.ui.Modifier;
import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.layout.IntrinsicMeasurable;
import androidx.compose.ui.layout.IntrinsicMeasureScope;
import androidx.compose.ui.layout.LayoutCoordinates;
import androidx.compose.ui.layout.LayoutCoordinatesKt;
import androidx.compose.ui.layout.Measurable;
import androidx.compose.ui.layout.MeasureResult;
import androidx.compose.ui.layout.MeasureScope;
import androidx.compose.ui.layout.Placeable;
import androidx.compose.ui.modifier.ModifierLocalMap;
import androidx.compose.ui.modifier.ModifierLocalModifierNode;
import androidx.compose.ui.modifier.ModifierLocalModifierNodeKt;
import androidx.compose.ui.node.GlobalPositionAwareModifierNode;
import androidx.compose.ui.node.LayoutModifierNode;
import androidx.compose.ui.node.LayoutModifierNodeKt;
import androidx.compose.ui.unit.Constraints;
import androidx.compose.ui.unit.IntOffset;
import androidx.compose.ui.unit.IntOffsetKt;
import kotlin.Metadata;
import kotlin.TuplesKt;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: WindowInsetsPadding.kt */
@Metadata(d1 = {"\u0000l\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0002\u0018\u00002\u00020\u00012\u00020\u00022\u00020\u00032\u00020\u0004B\u0005¢\u0006\u0002\u0010\u0005J\u0010\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001b\u001a\u00020\u001cH\u0016J\u001c\u0010\u001d\u001a\u00020\u001e*\u00020\u001f2\u0006\u0010 \u001a\u00020!2\u0006\u0010\"\u001a\u00020\u001eH\u0016J\u001c\u0010#\u001a\u00020\u001e*\u00020\u001f2\u0006\u0010 \u001a\u00020!2\u0006\u0010$\u001a\u00020\u001eH\u0016J&\u0010%\u001a\u00020&*\u00020'2\u0006\u0010 \u001a\u00020(2\u0006\u0010)\u001a\u00020*H\u0016ø\u0001\u0000¢\u0006\u0004\b+\u0010,J\u001c\u0010-\u001a\u00020\u001e*\u00020\u001f2\u0006\u0010 \u001a\u00020!2\u0006\u0010\"\u001a\u00020\u001eH\u0016J\u001c\u0010.\u001a\u00020\u001e*\u00020\u001f2\u0006\u0010 \u001a\u00020!2\u0006\u0010$\u001a\u00020\u001eH\u0016R\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\"\u0010\n\u001a\u00020\u000bX\u0086\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0010\n\u0002\u0010\u0010\u001a\u0004\b\f\u0010\r\"\u0004\b\u000e\u0010\u000fR\u0014\u0010\u0011\u001a\u00020\u0012X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014R\u0014\u0010\u0015\u001a\u00020\u00168VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u0017\u0010\u0018\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006/"}, d2 = {"Landroidx/compose/foundation/layout/RecalculateWindowInsetsModifierNode;", "Landroidx/compose/ui/Modifier$Node;", "Landroidx/compose/ui/modifier/ModifierLocalModifierNode;", "Landroidx/compose/ui/node/LayoutModifierNode;", "Landroidx/compose/ui/node/GlobalPositionAwareModifierNode;", "()V", "insets", "Landroidx/compose/foundation/layout/ValueInsets;", "getInsets", "()Landroidx/compose/foundation/layout/ValueInsets;", "oldPosition", "Landroidx/compose/ui/unit/IntOffset;", "getOldPosition-nOcc-ac", "()J", "setOldPosition--gyyYBs", "(J)V", "J", "providedValues", "Landroidx/compose/ui/modifier/ModifierLocalMap;", "getProvidedValues", "()Landroidx/compose/ui/modifier/ModifierLocalMap;", "shouldAutoInvalidate", "", "getShouldAutoInvalidate", "()Z", "onGloballyPositioned", "", "coordinates", "Landroidx/compose/ui/layout/LayoutCoordinates;", "maxIntrinsicHeight", "", "Landroidx/compose/ui/layout/IntrinsicMeasureScope;", "measurable", "Landroidx/compose/ui/layout/IntrinsicMeasurable;", "width", "maxIntrinsicWidth", "height", "measure", "Landroidx/compose/ui/layout/MeasureResult;", "Landroidx/compose/ui/layout/MeasureScope;", "Landroidx/compose/ui/layout/Measurable;", "constraints", "Landroidx/compose/ui/unit/Constraints;", "measure-3p2s80s", "(Landroidx/compose/ui/layout/MeasureScope;Landroidx/compose/ui/layout/Measurable;J)Landroidx/compose/ui/layout/MeasureResult;", "minIntrinsicHeight", "minIntrinsicWidth", "foundation-layout_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class RecalculateWindowInsetsModifierNode extends Modifier.Node implements ModifierLocalModifierNode, LayoutModifierNode, GlobalPositionAwareModifierNode {
    private final ValueInsets insets = new ValueInsets(new InsetsValues(0, 0, 0, 0), "reset");
    private long oldPosition = IntOffset.Companion.m7012getZeronOccac();
    private final ModifierLocalMap providedValues = ModifierLocalModifierNodeKt.modifierLocalMapOf(TuplesKt.to(WindowInsetsPaddingKt.getModifierLocalConsumedWindowInsets(), this.insets));

    public final ValueInsets getInsets() {
        return this.insets;
    }

    /* renamed from: getOldPosition-nOcc-ac  reason: not valid java name */
    public final long m1018getOldPositionnOccac() {
        return this.oldPosition;
    }

    /* renamed from: setOldPosition--gyyYBs  reason: not valid java name */
    public final void m1019setOldPositiongyyYBs(long j) {
        this.oldPosition = j;
    }

    @Override // androidx.compose.ui.modifier.ModifierLocalModifierNode
    public ModifierLocalMap getProvidedValues() {
        return this.providedValues;
    }

    @Override // androidx.compose.ui.Modifier.Node
    public boolean getShouldAutoInvalidate() {
        return false;
    }

    @Override // androidx.compose.ui.node.LayoutModifierNode
    /* renamed from: measure-3p2s80s */
    public MeasureResult mo328measure3p2s80s(MeasureScope $this$measure_u2d3p2s80s, final Measurable measurable, long constraints) {
        MeasureScope $this$measure_u2d3p2s80s2;
        if (!Constraints.m6824getHasFixedWidthimpl(constraints)) {
            $this$measure_u2d3p2s80s2 = $this$measure_u2d3p2s80s;
        } else if (Constraints.m6823getHasFixedHeightimpl(constraints)) {
            final int width = Constraints.m6826getMaxWidthimpl(constraints);
            final int height = Constraints.m6825getMaxHeightimpl(constraints);
            return MeasureScope.layout$default($this$measure_u2d3p2s80s, width, height, null, new Function1<Placeable.PlacementScope, Unit>() { // from class: androidx.compose.foundation.layout.RecalculateWindowInsetsModifierNode$measure$2
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(1);
                }

                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Unit invoke(Placeable.PlacementScope placementScope) {
                    invoke2(placementScope);
                    return Unit.INSTANCE;
                }

                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                public final void invoke2(Placeable.PlacementScope $this$layout) {
                    WindowInsets windowInsets;
                    LayoutCoordinates coordinates = $this$layout.getCoordinates();
                    if (coordinates != null) {
                        RecalculateWindowInsetsModifierNode.this.m1019setOldPositiongyyYBs(IntOffsetKt.m7018roundk4lQ0M(LayoutCoordinatesKt.positionInRoot(coordinates)));
                    }
                    if (coordinates == null) {
                        windowInsets = (WindowInsets) RecalculateWindowInsetsModifierNode.this.getCurrent(WindowInsetsPaddingKt.getModifierLocalConsumedWindowInsets());
                    } else {
                        long topLeft = LayoutCoordinatesKt.positionInRoot(coordinates);
                        long size = coordinates.mo5645getSizeYbymL2g();
                        float x$iv = (int) (size >> 32);
                        float y$iv = (int) (size & 4294967295L);
                        long v1$iv$iv = Float.floatToRawIntBits(x$iv);
                        long v2$iv$iv = Float.floatToRawIntBits(y$iv);
                        long bottomRight = coordinates.mo5648localToRootMKHz9U(Offset.m4040constructorimpl((v1$iv$iv << 32) | (v2$iv$iv & 4294967295L)));
                        LayoutCoordinates root = LayoutCoordinatesKt.findRootCoordinates(coordinates);
                        long rootSize = root.mo5645getSizeYbymL2g();
                        int bits$iv$iv$iv = (int) (topLeft >> 32);
                        float $this$fastRoundToInt$iv = Float.intBitsToFloat(bits$iv$iv$iv);
                        int $i$f$fastRoundToInt = Math.round($this$fastRoundToInt$iv);
                        int bits$iv$iv$iv2 = (int) (topLeft & 4294967295L);
                        float $this$fastRoundToInt$iv2 = Float.intBitsToFloat(bits$iv$iv$iv2);
                        int top = Math.round($this$fastRoundToInt$iv2);
                        int $i$f$unpackInt1 = (int) (rootSize >> 32);
                        int bits$iv$iv$iv3 = (int) (bottomRight >> 32);
                        float $this$fastRoundToInt$iv3 = Float.intBitsToFloat(bits$iv$iv$iv3);
                        int $i$f$fastRoundToInt2 = $i$f$unpackInt1 - Math.round($this$fastRoundToInt$iv3);
                        int bits$iv$iv$iv4 = (int) (bottomRight & 4294967295L);
                        float $this$fastRoundToInt$iv4 = Float.intBitsToFloat(bits$iv$iv$iv4);
                        int bottom = ((int) (rootSize & 4294967295L)) - Math.round($this$fastRoundToInt$iv4);
                        InsetsValues oldValues = RecalculateWindowInsetsModifierNode.this.getInsets().getValue$foundation_layout_release();
                        if (oldValues.getLeft() != $i$f$fastRoundToInt || oldValues.getTop() != top || oldValues.getRight() != $i$f$fastRoundToInt2 || oldValues.getBottom() != bottom) {
                            RecalculateWindowInsetsModifierNode.this.getInsets().setValue$foundation_layout_release(new InsetsValues($i$f$fastRoundToInt, top, $i$f$fastRoundToInt2, bottom));
                        }
                        windowInsets = RecalculateWindowInsetsModifierNode.this.getInsets();
                    }
                    RecalculateWindowInsetsModifierNode.this.provide(WindowInsetsPaddingKt.getModifierLocalConsumedWindowInsets(), windowInsets);
                    Placeable placeable = measurable.mo5637measureBRTryo0(Constraints.Companion.m6836fixedJhjzzOo(width, height));
                    Placeable.PlacementScope.place$default($this$layout, placeable, 0, 0, 0.0f, 4, null);
                }
            }, 4, null);
        } else {
            $this$measure_u2d3p2s80s2 = $this$measure_u2d3p2s80s;
        }
        provide(WindowInsetsPaddingKt.getModifierLocalConsumedWindowInsets(), getCurrent(WindowInsetsPaddingKt.getModifierLocalConsumedWindowInsets()));
        final Placeable placeable = measurable.mo5637measureBRTryo0(constraints);
        return MeasureScope.layout$default($this$measure_u2d3p2s80s2, placeable.getWidth(), placeable.getHeight(), null, new Function1<Placeable.PlacementScope, Unit>() { // from class: androidx.compose.foundation.layout.RecalculateWindowInsetsModifierNode$measure$1
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(Placeable.PlacementScope placementScope) {
                invoke2(placementScope);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(Placeable.PlacementScope $this$layout) {
                Placeable.PlacementScope.place$default($this$layout, Placeable.this, 0, 0, 0.0f, 4, null);
            }
        }, 4, null);
    }

    @Override // androidx.compose.ui.node.LayoutModifierNode
    public int minIntrinsicHeight(IntrinsicMeasureScope $this$minIntrinsicHeight, IntrinsicMeasurable measurable, int width) {
        return measurable.minIntrinsicHeight(width);
    }

    @Override // androidx.compose.ui.node.LayoutModifierNode
    public int minIntrinsicWidth(IntrinsicMeasureScope $this$minIntrinsicWidth, IntrinsicMeasurable measurable, int height) {
        return measurable.minIntrinsicWidth(height);
    }

    @Override // androidx.compose.ui.node.LayoutModifierNode
    public int maxIntrinsicHeight(IntrinsicMeasureScope $this$maxIntrinsicHeight, IntrinsicMeasurable measurable, int width) {
        return measurable.maxIntrinsicHeight(width);
    }

    @Override // androidx.compose.ui.node.LayoutModifierNode
    public int maxIntrinsicWidth(IntrinsicMeasureScope $this$maxIntrinsicWidth, IntrinsicMeasurable measurable, int height) {
        return measurable.maxIntrinsicWidth(height);
    }

    @Override // androidx.compose.ui.node.GlobalPositionAwareModifierNode
    public void onGloballyPositioned(LayoutCoordinates coordinates) {
        long newPosition = IntOffsetKt.m7018roundk4lQ0M(LayoutCoordinatesKt.positionInRoot(coordinates));
        boolean hasMoved = !IntOffset.m7000equalsimpl0(this.oldPosition, newPosition);
        this.oldPosition = newPosition;
        if (hasMoved) {
            LayoutModifierNodeKt.invalidatePlacement(this);
        }
    }
}
