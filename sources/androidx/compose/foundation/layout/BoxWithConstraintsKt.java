package androidx.compose.foundation.layout;

import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.compose.runtime.ScopeUpdateScope;
import androidx.compose.runtime.internal.ComposableLambdaKt;
import androidx.compose.ui.Alignment;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.layout.MeasurePolicy;
import androidx.compose.ui.layout.MeasureResult;
import androidx.compose.ui.layout.SubcomposeLayoutKt;
import androidx.compose.ui.layout.SubcomposeMeasureScope;
import androidx.compose.ui.unit.Constraints;
import java.util.List;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
/* compiled from: BoxWithConstraints.kt */
@Metadata(d1 = {"\u00002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u001aN\u0010\u0000\u001a\u00020\u00012\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072!\u0010\b\u001a\u001d\u0012\u0004\u0012\u00020\n\u0012\u0004\u0012\u00020\u00010\t¢\u0006\u0002\b\u000b¢\u0006\u0002\b\f¢\u0006\u0002\b\rH\u0007¢\u0006\u0002\u0010\u000e¨\u0006\u000f"}, d2 = {"BoxWithConstraints", "", "modifier", "Landroidx/compose/ui/Modifier;", "contentAlignment", "Landroidx/compose/ui/Alignment;", "propagateMinConstraints", "", "content", "Lkotlin/Function1;", "Landroidx/compose/foundation/layout/BoxWithConstraintsScope;", "Landroidx/compose/runtime/Composable;", "Landroidx/compose/ui/UiComposable;", "Lkotlin/ExtensionFunctionType;", "(Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;ZLkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;II)V", "foundation-layout_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class BoxWithConstraintsKt {
    public static final void BoxWithConstraints(Modifier modifier, Alignment contentAlignment, boolean propagateMinConstraints, final Function3<? super BoxWithConstraintsScope, ? super Composer, ? super Integer, Unit> function3, Composer $composer, final int $changed, final int i) {
        Object obj;
        Object obj2;
        boolean propagateMinConstraints2;
        final Modifier.Companion modifier2;
        final Alignment contentAlignment2;
        final boolean propagateMinConstraints3;
        Composer $composer2 = $composer.startRestartGroup(1781813501);
        ComposerKt.sourceInformation($composer2, "C(BoxWithConstraints)P(2,1,3)63@3274L218,63@3247L245:BoxWithConstraints.kt#2w3rfo");
        int $dirty = $changed;
        int i2 = i & 1;
        if (i2 != 0) {
            $dirty |= 6;
            obj = modifier;
        } else if (($changed & 6) == 0) {
            obj = modifier;
            $dirty |= $composer2.changed(obj) ? 4 : 2;
        } else {
            obj = modifier;
        }
        int i3 = i & 2;
        if (i3 != 0) {
            $dirty |= 48;
            obj2 = contentAlignment;
        } else if (($changed & 48) == 0) {
            obj2 = contentAlignment;
            $dirty |= $composer2.changed(obj2) ? 32 : 16;
        } else {
            obj2 = contentAlignment;
        }
        int i4 = i & 4;
        if (i4 != 0) {
            $dirty |= 384;
            propagateMinConstraints2 = propagateMinConstraints;
        } else if (($changed & 384) == 0) {
            propagateMinConstraints2 = propagateMinConstraints;
            $dirty |= $composer2.changed(propagateMinConstraints2) ? 256 : 128;
        } else {
            propagateMinConstraints2 = propagateMinConstraints;
        }
        if ((i & 8) != 0) {
            $dirty |= 3072;
        } else if (($changed & 3072) == 0) {
            $dirty |= $composer2.changedInstance(function3) ? 2048 : 1024;
        }
        int $dirty2 = $dirty;
        if ($composer2.shouldExecute(($dirty2 & 1171) != 1170, $dirty2 & 1)) {
            if (i2 != 0) {
                modifier2 = Modifier.Companion;
            } else {
                modifier2 = obj;
            }
            if (i3 == 0) {
                contentAlignment2 = obj2;
            } else {
                contentAlignment2 = Alignment.Companion.getTopStart();
            }
            if (i4 != 0) {
                propagateMinConstraints2 = false;
            }
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(1781813501, $dirty2, -1, "androidx.compose.foundation.layout.BoxWithConstraints (BoxWithConstraints.kt:61)");
            }
            final MeasurePolicy measurePolicy = BoxKt.maybeCachedBoxMeasurePolicy(contentAlignment2, propagateMinConstraints2);
            ComposerKt.sourceInformationMarkerStart($composer2, 2066126665, "CC(remember):BoxWithConstraints.kt#9igjgp");
            boolean invalid$iv = $composer2.changed(measurePolicy) | (($dirty2 & 7168) == 2048);
            Object it$iv = $composer2.rememberedValue();
            if (invalid$iv || it$iv == Composer.Companion.getEmpty()) {
                Object value$iv = (Function2) new Function2<SubcomposeMeasureScope, Constraints, MeasureResult>() { // from class: androidx.compose.foundation.layout.BoxWithConstraintsKt$BoxWithConstraints$1$1
                    /* JADX INFO: Access modifiers changed from: package-private */
                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                    /* JADX WARN: Multi-variable type inference failed */
                    {
                        super(2);
                    }

                    @Override // kotlin.jvm.functions.Function2
                    public /* bridge */ /* synthetic */ MeasureResult invoke(SubcomposeMeasureScope subcomposeMeasureScope, Constraints constraints) {
                        return m897invoke0kLqBqw(subcomposeMeasureScope, constraints.m6832unboximpl());
                    }

                    /* renamed from: invoke-0kLqBqw  reason: not valid java name */
                    public final MeasureResult m897invoke0kLqBqw(SubcomposeMeasureScope $this$SubcomposeLayout, long constraints) {
                        final BoxWithConstraintsScopeImpl scope = new BoxWithConstraintsScopeImpl($this$SubcomposeLayout, constraints, null);
                        Unit unit = Unit.INSTANCE;
                        final Function3<BoxWithConstraintsScope, Composer, Integer, Unit> function32 = function3;
                        List measurables = $this$SubcomposeLayout.subcompose(unit, ComposableLambdaKt.composableLambdaInstance(-1945019079, true, new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.layout.BoxWithConstraintsKt$BoxWithConstraints$1$1$measurables$1
                            /* JADX INFO: Access modifiers changed from: package-private */
                            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                            /* JADX WARN: Multi-variable type inference failed */
                            {
                                super(2);
                            }

                            @Override // kotlin.jvm.functions.Function2
                            public /* bridge */ /* synthetic */ Unit invoke(Composer composer, Integer num) {
                                invoke(composer, num.intValue());
                                return Unit.INSTANCE;
                            }

                            public final void invoke(Composer $composer3, int $changed2) {
                                ComposerKt.sourceInformation($composer3, "C65@3409L9:BoxWithConstraints.kt#2w3rfo");
                                if (!$composer3.shouldExecute(($changed2 & 3) != 2, $changed2 & 1)) {
                                    $composer3.skipToGroupEnd();
                                    return;
                                }
                                if (ComposerKt.isTraceInProgress()) {
                                    ComposerKt.traceEventStart(-1945019079, $changed2, -1, "androidx.compose.foundation.layout.BoxWithConstraints.<anonymous>.<anonymous>.<anonymous> (BoxWithConstraints.kt:65)");
                                }
                                function32.invoke(scope, $composer3, 0);
                                if (ComposerKt.isTraceInProgress()) {
                                    ComposerKt.traceEventEnd();
                                }
                            }
                        }));
                        MeasurePolicy $this$invoke_0kLqBqw_u24lambda_u240 = MeasurePolicy.this;
                        return $this$invoke_0kLqBqw_u24lambda_u240.mo300measure3p2s80s($this$SubcomposeLayout, measurables, constraints);
                    }
                };
                $composer2.updateRememberedValue(value$iv);
                it$iv = value$iv;
            }
            ComposerKt.sourceInformationMarkerEnd($composer2);
            SubcomposeLayoutKt.SubcomposeLayout(modifier2, (Function2) it$iv, $composer2, $dirty2 & 14, 0);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            propagateMinConstraints3 = propagateMinConstraints2;
        } else {
            $composer2.skipToGroupEnd();
            modifier2 = obj;
            contentAlignment2 = obj2;
            propagateMinConstraints3 = propagateMinConstraints2;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.layout.BoxWithConstraintsKt$BoxWithConstraints$2
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                /* JADX WARN: Multi-variable type inference failed */
                {
                    super(2);
                }

                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(Composer composer, Integer num) {
                    invoke(composer, num.intValue());
                    return Unit.INSTANCE;
                }

                public final void invoke(Composer composer, int i5) {
                    BoxWithConstraintsKt.BoxWithConstraints(Modifier.this, contentAlignment2, propagateMinConstraints3, function3, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), i);
                }
            });
        }
    }
}
