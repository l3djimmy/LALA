package androidx.compose.foundation.layout;

import androidx.compose.ui.Modifier;
import androidx.compose.ui.layout.AlignmentLine;
import androidx.compose.ui.layout.HorizontalAlignmentLine;
import androidx.compose.ui.layout.Measurable;
import androidx.compose.ui.layout.MeasureResult;
import androidx.compose.ui.layout.MeasureScope;
import androidx.compose.ui.layout.Placeable;
import androidx.compose.ui.platform.InspectableValueKt;
import androidx.compose.ui.platform.InspectorInfo;
import androidx.compose.ui.unit.Constraints;
import androidx.compose.ui.unit.Dp;
import androidx.compose.ui.unit.TextUnit;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.ranges.RangesKt;
/* compiled from: AlignmentLine.kt */
@Metadata(d1 = {"\u0000@\n\u0000\n\u0002\u0010\u000b\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\n\u001a>\u0010\u0005\u001a\u00020\u0006*\u00020\u00072\u0006\u0010\b\u001a\u00020\u00022\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000fH\u0002ø\u0001\u0000¢\u0006\u0004\b\u0010\u0010\u0011\u001a2\u0010\u0012\u001a\u00020\u0013*\u00020\u00132\u0006\u0010\b\u001a\u00020\u00022\b\b\u0002\u0010\t\u001a\u00020\n2\b\b\u0002\u0010\u000b\u001a\u00020\nH\u0007ø\u0001\u0000¢\u0006\u0004\b\u0014\u0010\u0015\u001a2\u0010\u0012\u001a\u00020\u0013*\u00020\u00132\u0006\u0010\b\u001a\u00020\u00022\b\b\u0002\u0010\t\u001a\u00020\u00162\b\b\u0002\u0010\u000b\u001a\u00020\u0016H\u0007ø\u0001\u0000¢\u0006\u0004\b\u0017\u0010\u0018\u001a*\u0010\u0019\u001a\u00020\u0013*\u00020\u00132\b\b\u0002\u0010\u001a\u001a\u00020\n2\b\b\u0002\u0010\u001b\u001a\u00020\nH\u0007ø\u0001\u0000¢\u0006\u0004\b\u001c\u0010\u001d\u001a*\u0010\u0019\u001a\u00020\u0013*\u00020\u00132\b\b\u0002\u0010\u001a\u001a\u00020\u00162\b\b\u0002\u0010\u001b\u001a\u00020\u0016H\u0007ø\u0001\u0000¢\u0006\u0004\b\u001e\u0010\u001f\"\u0018\u0010\u0000\u001a\u00020\u0001*\u00020\u00028BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u0003\u0010\u0004\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006 "}, d2 = {"horizontal", "", "Landroidx/compose/ui/layout/AlignmentLine;", "getHorizontal", "(Landroidx/compose/ui/layout/AlignmentLine;)Z", "alignmentLineOffsetMeasure", "Landroidx/compose/ui/layout/MeasureResult;", "Landroidx/compose/ui/layout/MeasureScope;", "alignmentLine", "before", "Landroidx/compose/ui/unit/Dp;", "after", "measurable", "Landroidx/compose/ui/layout/Measurable;", "constraints", "Landroidx/compose/ui/unit/Constraints;", "alignmentLineOffsetMeasure-tjqqzMA", "(Landroidx/compose/ui/layout/MeasureScope;Landroidx/compose/ui/layout/AlignmentLine;FFLandroidx/compose/ui/layout/Measurable;J)Landroidx/compose/ui/layout/MeasureResult;", "paddingFrom", "Landroidx/compose/ui/Modifier;", "paddingFrom-4j6BHR0", "(Landroidx/compose/ui/Modifier;Landroidx/compose/ui/layout/AlignmentLine;FF)Landroidx/compose/ui/Modifier;", "Landroidx/compose/ui/unit/TextUnit;", "paddingFrom-Y_r0B1c", "(Landroidx/compose/ui/Modifier;Landroidx/compose/ui/layout/AlignmentLine;JJ)Landroidx/compose/ui/Modifier;", "paddingFromBaseline", "top", "bottom", "paddingFromBaseline-VpY3zN4", "(Landroidx/compose/ui/Modifier;FF)Landroidx/compose/ui/Modifier;", "paddingFromBaseline-wCyjxdI", "(Landroidx/compose/ui/Modifier;JJ)Landroidx/compose/ui/Modifier;", "foundation-layout_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class AlignmentLineKt {
    /* renamed from: paddingFrom-4j6BHR0$default  reason: not valid java name */
    public static /* synthetic */ Modifier m845paddingFrom4j6BHR0$default(Modifier modifier, AlignmentLine alignmentLine, float f, float f2, int i, Object obj) {
        if ((i & 2) != 0) {
            f = Dp.Companion.m6893getUnspecifiedD9Ej5fM();
        }
        if ((i & 4) != 0) {
            f2 = Dp.Companion.m6893getUnspecifiedD9Ej5fM();
        }
        return m844paddingFrom4j6BHR0(modifier, alignmentLine, f, f2);
    }

    /* renamed from: paddingFrom-4j6BHR0  reason: not valid java name */
    public static final Modifier m844paddingFrom4j6BHR0(Modifier $this$paddingFrom_u2d4j6BHR0, final AlignmentLine alignmentLine, final float before, final float after) {
        return $this$paddingFrom_u2d4j6BHR0.then(new AlignmentLineOffsetDpElement(alignmentLine, before, after, InspectableValueKt.isDebugInspectorInfoEnabled() ? new Function1<InspectorInfo, Unit>() { // from class: androidx.compose.foundation.layout.AlignmentLineKt$paddingFrom-4j6BHR0$$inlined$debugInspectorInfo$1
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(InspectorInfo inspectorInfo) {
                invoke2(inspectorInfo);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(InspectorInfo $this$null) {
                $this$null.setName("paddingFrom");
                $this$null.getProperties().set("alignmentLine", AlignmentLine.this);
                $this$null.getProperties().set("before", Dp.m6871boximpl(before));
                $this$null.getProperties().set("after", Dp.m6871boximpl(after));
            }
        } : InspectableValueKt.getNoInspectorInfo(), null));
    }

    /* renamed from: paddingFrom-Y_r0B1c$default  reason: not valid java name */
    public static /* synthetic */ Modifier m847paddingFromY_r0B1c$default(Modifier modifier, AlignmentLine alignmentLine, long j, long j2, int i, Object obj) {
        long j3;
        long j4;
        if ((i & 2) == 0) {
            j3 = j;
        } else {
            j3 = TextUnit.Companion.m7078getUnspecifiedXSAIIZE();
        }
        if ((i & 4) == 0) {
            j4 = j2;
        } else {
            j4 = TextUnit.Companion.m7078getUnspecifiedXSAIIZE();
        }
        return m846paddingFromY_r0B1c(modifier, alignmentLine, j3, j4);
    }

    /* renamed from: paddingFrom-Y_r0B1c  reason: not valid java name */
    public static final Modifier m846paddingFromY_r0B1c(Modifier $this$paddingFrom_u2dY_r0B1c, AlignmentLine alignmentLine, final long before, long after) {
        final AlignmentLine alignmentLine2;
        long before2;
        final long after2;
        Function1<InspectorInfo, Unit> noInspectorInfo;
        if (InspectableValueKt.isDebugInspectorInfoEnabled()) {
            alignmentLine2 = alignmentLine;
            after2 = after;
            before2 = before;
            noInspectorInfo = new Function1<InspectorInfo, Unit>() { // from class: androidx.compose.foundation.layout.AlignmentLineKt$paddingFrom-Y_r0B1c$$inlined$debugInspectorInfo$1
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(1);
                }

                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Unit invoke(InspectorInfo inspectorInfo) {
                    invoke2(inspectorInfo);
                    return Unit.INSTANCE;
                }

                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                public final void invoke2(InspectorInfo $this$null) {
                    $this$null.setName("paddingFrom");
                    $this$null.getProperties().set("alignmentLine", AlignmentLine.this);
                    $this$null.getProperties().set("before", TextUnit.m7057boximpl(before));
                    $this$null.getProperties().set("after", TextUnit.m7057boximpl(after2));
                }
            };
        } else {
            alignmentLine2 = alignmentLine;
            before2 = before;
            after2 = after;
            noInspectorInfo = InspectableValueKt.getNoInspectorInfo();
        }
        return $this$paddingFrom_u2dY_r0B1c.then(new AlignmentLineOffsetTextUnitElement(alignmentLine2, before2, after2, noInspectorInfo, null));
    }

    /* renamed from: paddingFromBaseline-VpY3zN4$default  reason: not valid java name */
    public static /* synthetic */ Modifier m849paddingFromBaselineVpY3zN4$default(Modifier modifier, float f, float f2, int i, Object obj) {
        if ((i & 1) != 0) {
            f = Dp.Companion.m6893getUnspecifiedD9Ej5fM();
        }
        if ((i & 2) != 0) {
            f2 = Dp.Companion.m6893getUnspecifiedD9Ej5fM();
        }
        return m848paddingFromBaselineVpY3zN4(modifier, f, f2);
    }

    /* renamed from: paddingFromBaseline-VpY3zN4  reason: not valid java name */
    public static final Modifier m848paddingFromBaselineVpY3zN4(Modifier $this$paddingFromBaseline_u2dVpY3zN4, float top, float bottom) {
        return $this$paddingFromBaseline_u2dVpY3zN4.then(!Float.isNaN(top) ? m845paddingFrom4j6BHR0$default(Modifier.Companion, androidx.compose.ui.layout.AlignmentLineKt.getFirstBaseline(), top, 0.0f, 4, null) : Modifier.Companion).then(!Float.isNaN(bottom) ? m845paddingFrom4j6BHR0$default(Modifier.Companion, androidx.compose.ui.layout.AlignmentLineKt.getLastBaseline(), 0.0f, bottom, 2, null) : Modifier.Companion);
    }

    /* renamed from: paddingFromBaseline-wCyjxdI$default  reason: not valid java name */
    public static /* synthetic */ Modifier m851paddingFromBaselinewCyjxdI$default(Modifier modifier, long j, long j2, int i, Object obj) {
        if ((i & 1) != 0) {
            j = TextUnit.Companion.m7078getUnspecifiedXSAIIZE();
        }
        if ((i & 2) != 0) {
            j2 = TextUnit.Companion.m7078getUnspecifiedXSAIIZE();
        }
        return m850paddingFromBaselinewCyjxdI(modifier, j, j2);
    }

    /* renamed from: paddingFromBaseline-wCyjxdI  reason: not valid java name */
    public static final Modifier m850paddingFromBaselinewCyjxdI(Modifier $this$paddingFromBaseline_u2dwCyjxdI, long top, long bottom) {
        return $this$paddingFromBaseline_u2dwCyjxdI.then(!((TextUnit.m7065getRawTypeimpl(top) > 0L ? 1 : (TextUnit.m7065getRawTypeimpl(top) == 0L ? 0 : -1)) == 0) ? m847paddingFromY_r0B1c$default(Modifier.Companion, androidx.compose.ui.layout.AlignmentLineKt.getFirstBaseline(), top, 0L, 4, null) : Modifier.Companion).then(!(TextUnit.m7065getRawTypeimpl(bottom) == 0) ? m847paddingFromY_r0B1c$default(Modifier.Companion, androidx.compose.ui.layout.AlignmentLineKt.getLastBaseline(), 0L, bottom, 2, null) : Modifier.Companion);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: alignmentLineOffsetMeasure-tjqqzMA  reason: not valid java name */
    public static final MeasureResult m843alignmentLineOffsetMeasuretjqqzMA(MeasureScope $this$alignmentLineOffsetMeasure_u2dtjqqzMA, final AlignmentLine alignmentLine, float before, float after, Measurable measurable, long constraints) {
        final float f;
        int i;
        final int width;
        final int height;
        final Placeable placeable = measurable.mo5637measureBRTryo0(getHorizontal(alignmentLine) ? Constraints.m6815copyZbe2FdA(constraints, (r12 & 1) != 0 ? Constraints.m6828getMinWidthimpl(constraints) : 0, (r12 & 2) != 0 ? Constraints.m6826getMaxWidthimpl(constraints) : 0, (r12 & 4) != 0 ? Constraints.m6827getMinHeightimpl(constraints) : 0, (r12 & 8) != 0 ? Constraints.m6825getMaxHeightimpl(constraints) : 0) : Constraints.m6815copyZbe2FdA(constraints, (r12 & 1) != 0 ? Constraints.m6828getMinWidthimpl(constraints) : 0, (r12 & 2) != 0 ? Constraints.m6826getMaxWidthimpl(constraints) : 0, (r12 & 4) != 0 ? Constraints.m6827getMinHeightimpl(constraints) : 0, (r12 & 8) != 0 ? Constraints.m6825getMaxHeightimpl(constraints) : 0));
        int it = placeable.get(alignmentLine);
        if (it == Integer.MIN_VALUE) {
            it = 0;
        }
        int linePosition = it;
        int axis = getHorizontal(alignmentLine) ? placeable.getHeight() : placeable.getWidth();
        int axisMax = getHorizontal(alignmentLine) ? Constraints.m6825getMaxHeightimpl(constraints) : Constraints.m6826getMaxWidthimpl(constraints);
        if (Float.isNaN(before)) {
            f = before;
            i = 0;
        } else {
            f = before;
            i = $this$alignmentLineOffsetMeasure_u2dtjqqzMA.mo638roundToPx0680j_4(f);
        }
        final int paddingBefore = RangesKt.coerceIn(i - linePosition, 0, axisMax - axis);
        final int paddingAfter = RangesKt.coerceIn(((!Float.isNaN(after) ? $this$alignmentLineOffsetMeasure_u2dtjqqzMA.mo638roundToPx0680j_4(after) : 0) - axis) + linePosition, 0, (axisMax - axis) - paddingBefore);
        if (getHorizontal(alignmentLine)) {
            width = placeable.getWidth();
        } else {
            width = Math.max(placeable.getWidth() + paddingBefore + paddingAfter, Constraints.m6828getMinWidthimpl(constraints));
        }
        if (getHorizontal(alignmentLine)) {
            height = Math.max(placeable.getHeight() + paddingBefore + paddingAfter, Constraints.m6827getMinHeightimpl(constraints));
        } else {
            height = placeable.getHeight();
        }
        return MeasureScope.layout$default($this$alignmentLineOffsetMeasure_u2dtjqqzMA, width, height, null, new Function1<Placeable.PlacementScope, Unit>() { // from class: androidx.compose.foundation.layout.AlignmentLineKt$alignmentLineOffsetMeasure$1
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
                boolean horizontal;
                int width2;
                boolean horizontal2;
                int y;
                horizontal = AlignmentLineKt.getHorizontal(AlignmentLine.this);
                if (horizontal) {
                    width2 = 0;
                } else {
                    width2 = !Dp.m6878equalsimpl0(f, Dp.Companion.m6893getUnspecifiedD9Ej5fM()) ? paddingBefore : (width - paddingAfter) - placeable.getWidth();
                }
                int x = width2;
                horizontal2 = AlignmentLineKt.getHorizontal(AlignmentLine.this);
                if (horizontal2) {
                    y = !Dp.m6878equalsimpl0(f, Dp.Companion.m6893getUnspecifiedD9Ej5fM()) ? paddingBefore : (height - paddingAfter) - placeable.getHeight();
                } else {
                    y = 0;
                }
                Placeable.PlacementScope.placeRelative$default($this$layout, placeable, x, y, 0.0f, 4, null);
            }
        }, 4, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean getHorizontal(AlignmentLine $this$horizontal) {
        return $this$horizontal instanceof HorizontalAlignmentLine;
    }
}
