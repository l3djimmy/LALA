package androidx.compose.material3;

import androidx.compose.animation.AnimatedVisibilityKt;
import androidx.compose.animation.AnimatedVisibilityScope;
import androidx.compose.animation.EnterExitTransitionKt;
import androidx.compose.animation.EnterTransition;
import androidx.compose.animation.ExitTransition;
import androidx.compose.animation.core.AnimationSpecKt;
import androidx.compose.foundation.interaction.InteractionSourceKt;
import androidx.compose.foundation.interaction.MutableInteractionSource;
import androidx.compose.foundation.layout.Arrangement;
import androidx.compose.foundation.layout.PaddingKt;
import androidx.compose.foundation.layout.RowKt;
import androidx.compose.foundation.layout.RowScope;
import androidx.compose.foundation.layout.RowScopeInstance;
import androidx.compose.foundation.layout.SizeKt;
import androidx.compose.material3.internal.ProvideContentColorTextStyleKt;
import androidx.compose.material3.tokens.ExtendedFabPrimaryTokens;
import androidx.compose.material3.tokens.FabPrimaryLargeTokens;
import androidx.compose.material3.tokens.FabPrimarySmallTokens;
import androidx.compose.material3.tokens.FabPrimaryTokens;
import androidx.compose.material3.tokens.MotionTokens;
import androidx.compose.runtime.Applier;
import androidx.compose.runtime.ComposablesKt;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.CompositionLocalMap;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.compose.runtime.ScopeUpdateScope;
import androidx.compose.runtime.Updater;
import androidx.compose.runtime.internal.ComposableLambdaKt;
import androidx.compose.ui.Alignment;
import androidx.compose.ui.ComposedModifierKt;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.graphics.Shape;
import androidx.compose.ui.layout.MeasurePolicy;
import androidx.compose.ui.node.ComposeUiNode;
import androidx.compose.ui.semantics.Role;
import androidx.compose.ui.semantics.SemanticsModifierKt;
import androidx.compose.ui.semantics.SemanticsPropertiesKt;
import androidx.compose.ui.semantics.SemanticsPropertyReceiver;
import androidx.compose.ui.text.TextStyle;
import androidx.compose.ui.unit.Dp;
import com.itextpdf.io.font.constants.FontWeights;
import com.itextpdf.kernel.pdf.canvas.wmf.MetaDo;
import com.itextpdf.kernel.xmp.options.PropertyOptions;
import com.itextpdf.layout.properties.Property;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: FloatingActionButton.kt */
@Metadata(d1 = {"\u0000`\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\n\u001a|\u0010\n\u001a\u00020\u000b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u000b0\r2\b\b\u0002\u0010\u000e\u001a\u00020\u000f2\b\b\u0002\u0010\u0010\u001a\u00020\u00112\b\b\u0002\u0010\u0012\u001a\u00020\u00132\b\b\u0002\u0010\u0014\u001a\u00020\u00132\b\b\u0002\u0010\u0015\u001a\u00020\u00162\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u00182\u001c\u0010\u0019\u001a\u0018\u0012\u0004\u0012\u00020\u001b\u0012\u0004\u0012\u00020\u000b0\u001a¢\u0006\u0002\b\u001c¢\u0006\u0002\b\u001dH\u0007ø\u0001\u0000¢\u0006\u0004\b\u001e\u0010\u001f\u001a\u008e\u0001\u0010\n\u001a\u00020\u000b2\u0011\u0010 \u001a\r\u0012\u0004\u0012\u00020\u000b0\r¢\u0006\u0002\b\u001c2\u0011\u0010!\u001a\r\u0012\u0004\u0012\u00020\u000b0\r¢\u0006\u0002\b\u001c2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u000b0\r2\b\b\u0002\u0010\u000e\u001a\u00020\u000f2\b\b\u0002\u0010\"\u001a\u00020#2\b\b\u0002\u0010\u0010\u001a\u00020\u00112\b\b\u0002\u0010\u0012\u001a\u00020\u00132\b\b\u0002\u0010\u0014\u001a\u00020\u00132\b\b\u0002\u0010\u0015\u001a\u00020\u00162\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u0018H\u0007ø\u0001\u0000¢\u0006\u0004\b$\u0010%\u001aq\u0010&\u001a\u00020\u000b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u000b0\r2\b\b\u0002\u0010\u000e\u001a\u00020\u000f2\b\b\u0002\u0010\u0010\u001a\u00020\u00112\b\b\u0002\u0010\u0012\u001a\u00020\u00132\b\b\u0002\u0010\u0014\u001a\u00020\u00132\b\b\u0002\u0010\u0015\u001a\u00020\u00162\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u00182\u0011\u0010\u0019\u001a\r\u0012\u0004\u0012\u00020\u000b0\r¢\u0006\u0002\b\u001cH\u0007ø\u0001\u0000¢\u0006\u0004\b'\u0010(\u001aq\u0010)\u001a\u00020\u000b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u000b0\r2\b\b\u0002\u0010\u000e\u001a\u00020\u000f2\b\b\u0002\u0010\u0010\u001a\u00020\u00112\b\b\u0002\u0010\u0012\u001a\u00020\u00132\b\b\u0002\u0010\u0014\u001a\u00020\u00132\b\b\u0002\u0010\u0015\u001a\u00020\u00162\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u00182\u0011\u0010\u0019\u001a\r\u0012\u0004\u0012\u00020\u000b0\r¢\u0006\u0002\b\u001cH\u0007ø\u0001\u0000¢\u0006\u0004\b*\u0010(\u001aq\u0010+\u001a\u00020\u000b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u000b0\r2\b\b\u0002\u0010\u000e\u001a\u00020\u000f2\b\b\u0002\u0010\u0010\u001a\u00020\u00112\b\b\u0002\u0010\u0012\u001a\u00020\u00132\b\b\u0002\u0010\u0014\u001a\u00020\u00132\b\b\u0002\u0010\u0015\u001a\u00020\u00162\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u00182\u0011\u0010\u0019\u001a\r\u0012\u0004\u0012\u00020\u000b0\r¢\u0006\u0002\b\u001cH\u0007ø\u0001\u0000¢\u0006\u0004\b,\u0010(\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082\u0004¢\u0006\u0002\n\u0000\"\u0010\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u0004\"\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u0004¢\u0006\u0002\n\u0000\"\u0010\u0010\u0007\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u0004\"\u0010\u0010\b\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u0004\"\u0010\u0010\t\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u0004\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006-"}, d2 = {"ExtendedFabCollapseAnimation", "Landroidx/compose/animation/ExitTransition;", "ExtendedFabEndIconPadding", "Landroidx/compose/ui/unit/Dp;", "F", "ExtendedFabExpandAnimation", "Landroidx/compose/animation/EnterTransition;", "ExtendedFabMinimumWidth", "ExtendedFabStartIconPadding", "ExtendedFabTextPadding", "ExtendedFloatingActionButton", "", "onClick", "Lkotlin/Function0;", "modifier", "Landroidx/compose/ui/Modifier;", "shape", "Landroidx/compose/ui/graphics/Shape;", "containerColor", "Landroidx/compose/ui/graphics/Color;", "contentColor", "elevation", "Landroidx/compose/material3/FloatingActionButtonElevation;", "interactionSource", "Landroidx/compose/foundation/interaction/MutableInteractionSource;", "content", "Lkotlin/Function1;", "Landroidx/compose/foundation/layout/RowScope;", "Landroidx/compose/runtime/Composable;", "Lkotlin/ExtensionFunctionType;", "ExtendedFloatingActionButton-X-z6DiA", "(Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/graphics/Shape;JJLandroidx/compose/material3/FloatingActionButtonElevation;Landroidx/compose/foundation/interaction/MutableInteractionSource;Lkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;II)V", "text", "icon", "expanded", "", "ExtendedFloatingActionButton-ElI5-7k", "(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;ZLandroidx/compose/ui/graphics/Shape;JJLandroidx/compose/material3/FloatingActionButtonElevation;Landroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/runtime/Composer;II)V", "FloatingActionButton", "FloatingActionButton-X-z6DiA", "(Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/graphics/Shape;JJLandroidx/compose/material3/FloatingActionButtonElevation;Landroidx/compose/foundation/interaction/MutableInteractionSource;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;II)V", "LargeFloatingActionButton", "LargeFloatingActionButton-X-z6DiA", "SmallFloatingActionButton", "SmallFloatingActionButton-X-z6DiA", "material3_release"}, k = 2, mv = {1, 8, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class FloatingActionButtonKt {
    private static final float ExtendedFabStartIconPadding = Dp.m6873constructorimpl(16);
    private static final float ExtendedFabEndIconPadding = Dp.m6873constructorimpl(12);
    private static final float ExtendedFabTextPadding = Dp.m6873constructorimpl(20);
    private static final float ExtendedFabMinimumWidth = Dp.m6873constructorimpl(80);
    private static final ExitTransition ExtendedFabCollapseAnimation = EnterExitTransitionKt.fadeOut$default(AnimationSpecKt.tween$default(100, 0, MotionTokens.INSTANCE.getEasingLinearCubicBezier(), 2, null), 0.0f, 2, null).plus(EnterExitTransitionKt.shrinkHorizontally$default(AnimationSpecKt.tween$default(FontWeights.MEDIUM, 0, MotionTokens.INSTANCE.getEasingEmphasizedCubicBezier(), 2, null), Alignment.Companion.getStart(), false, null, 12, null));
    private static final EnterTransition ExtendedFabExpandAnimation = EnterExitTransitionKt.fadeIn$default(AnimationSpecKt.tween(200, 100, MotionTokens.INSTANCE.getEasingLinearCubicBezier()), 0.0f, 2, null).plus(EnterExitTransitionKt.expandHorizontally$default(AnimationSpecKt.tween$default(FontWeights.MEDIUM, 0, MotionTokens.INSTANCE.getEasingEmphasizedCubicBezier(), 2, null), Alignment.Companion.getStart(), false, null, 12, null));

    /* renamed from: FloatingActionButton-X-z6DiA  reason: not valid java name */
    public static final void m2175FloatingActionButtonXz6DiA(final Function0<Unit> function0, Modifier modifier, Shape shape, long containerColor, long contentColor, FloatingActionButtonElevation elevation, MutableInteractionSource interactionSource, final Function2<? super Composer, ? super Integer, Unit> function2, Composer $composer, final int $changed, final int i) {
        Function0<Unit> function02;
        Object modifier2;
        Object obj;
        long j;
        final long contentColor2;
        FloatingActionButtonElevation elevation2;
        MutableInteractionSource interactionSource2;
        Shape shape2;
        int $dirty;
        long containerColor2;
        int $dirty2;
        long containerColor3;
        Shape shape3;
        long containerColor4;
        int i2;
        MutableInteractionSource interactionSource3;
        Composer $composer2;
        final Modifier modifier3;
        final FloatingActionButtonElevation elevation3;
        final Shape shape4;
        final long contentColor3;
        final MutableInteractionSource interactionSource4;
        final long containerColor5;
        Object value$iv;
        int i3;
        int i4;
        int i5;
        int i6;
        Composer $composer3 = $composer.startRestartGroup(-731723913);
        ComposerKt.sourceInformation($composer3, "C(FloatingActionButton)P(6,5,7,0:c#ui.graphics.Color,2:c#ui.graphics.Color,3,4)100@4948L5,101@5012L14,102@5054L31,103@5163L11,116@5678L54,118@5792L536,109@5399L929:FloatingActionButton.kt#uh7d8r");
        int $dirty3 = $changed;
        if ((i & 1) != 0) {
            $dirty3 |= 6;
            function02 = function0;
        } else if (($changed & 6) == 0) {
            function02 = function0;
            $dirty3 |= $composer3.changedInstance(function02) ? 4 : 2;
        } else {
            function02 = function0;
        }
        int i7 = i & 2;
        if (i7 != 0) {
            $dirty3 |= 48;
            modifier2 = modifier;
        } else if (($changed & 48) == 0) {
            modifier2 = modifier;
            $dirty3 |= $composer3.changed(modifier2) ? 32 : 16;
        } else {
            modifier2 = modifier;
        }
        if (($changed & 384) == 0) {
            if ((i & 4) == 0) {
                obj = shape;
                if ($composer3.changed(obj)) {
                    i6 = 256;
                    $dirty3 |= i6;
                }
            } else {
                obj = shape;
            }
            i6 = 128;
            $dirty3 |= i6;
        } else {
            obj = shape;
        }
        if (($changed & 3072) == 0) {
            if ((i & 8) == 0) {
                j = containerColor;
                if ($composer3.changed(j)) {
                    i5 = 2048;
                    $dirty3 |= i5;
                }
            } else {
                j = containerColor;
            }
            i5 = 1024;
            $dirty3 |= i5;
        } else {
            j = containerColor;
        }
        if (($changed & 24576) == 0) {
            if ((i & 16) == 0) {
                contentColor2 = contentColor;
                if ($composer3.changed(contentColor2)) {
                    i4 = 16384;
                    $dirty3 |= i4;
                }
            } else {
                contentColor2 = contentColor;
            }
            i4 = 8192;
            $dirty3 |= i4;
        } else {
            contentColor2 = contentColor;
        }
        if ((196608 & $changed) == 0) {
            if ((i & 32) == 0) {
                elevation2 = elevation;
                if ($composer3.changed(elevation2)) {
                    i3 = 131072;
                    $dirty3 |= i3;
                }
            } else {
                elevation2 = elevation;
            }
            i3 = 65536;
            $dirty3 |= i3;
        } else {
            elevation2 = elevation;
        }
        int i8 = i & 64;
        if (i8 != 0) {
            $dirty3 |= 1572864;
            interactionSource2 = interactionSource;
        } else if ((1572864 & $changed) == 0) {
            interactionSource2 = interactionSource;
            $dirty3 |= $composer3.changed(interactionSource2) ? 1048576 : 524288;
        } else {
            interactionSource2 = interactionSource;
        }
        if ((i & 128) != 0) {
            $dirty3 |= 12582912;
        } else if (($changed & 12582912) == 0) {
            $dirty3 |= $composer3.changedInstance(function2) ? 8388608 : 4194304;
        }
        if ((4793491 & $dirty3) == 4793490 && $composer3.getSkipping()) {
            $composer3.skipToGroupEnd();
            modifier3 = modifier2;
            shape4 = obj;
            $composer2 = $composer3;
            FloatingActionButtonElevation floatingActionButtonElevation = elevation2;
            interactionSource4 = interactionSource2;
            containerColor5 = j;
            elevation3 = floatingActionButtonElevation;
            contentColor3 = contentColor2;
        } else {
            $composer3.startDefaults();
            if (($changed & 1) == 0 || $composer3.getDefaultsInvalid()) {
                Modifier.Companion modifier4 = i7 != 0 ? Modifier.Companion : modifier2;
                if ((i & 4) != 0) {
                    $dirty3 &= -897;
                    shape2 = FloatingActionButtonDefaults.INSTANCE.getShape($composer3, 6);
                } else {
                    shape2 = obj;
                }
                if ((i & 8) != 0) {
                    $dirty = $dirty3 & (-7169);
                    containerColor2 = FloatingActionButtonDefaults.INSTANCE.getContainerColor($composer3, 6);
                } else {
                    $dirty = $dirty3;
                    containerColor2 = j;
                }
                if ((i & 16) != 0) {
                    contentColor2 = ColorSchemeKt.m1979contentColorForek8zF_U(containerColor2, $composer3, ($dirty >> 9) & 14);
                    $dirty2 = $dirty & (-57345);
                } else {
                    $dirty2 = $dirty;
                }
                if ((i & 32) != 0) {
                    containerColor3 = containerColor2;
                    $dirty2 &= -458753;
                    elevation2 = FloatingActionButtonDefaults.INSTANCE.m2167elevationxZ9QkE(0.0f, 0.0f, 0.0f, 0.0f, $composer3, 24576, 15);
                } else {
                    containerColor3 = containerColor2;
                }
                if (i8 != 0) {
                    modifier2 = modifier4;
                    interactionSource2 = null;
                    shape3 = shape2;
                    $dirty3 = $dirty2;
                    containerColor4 = containerColor3;
                    i2 = -731723913;
                } else {
                    interactionSource2 = interactionSource;
                    modifier2 = modifier4;
                    shape3 = shape2;
                    $dirty3 = $dirty2;
                    containerColor4 = containerColor3;
                    i2 = -731723913;
                }
            } else {
                $composer3.skipToGroupEnd();
                if ((i & 4) != 0) {
                    $dirty3 &= -897;
                }
                if ((i & 8) != 0) {
                    $dirty3 &= -7169;
                }
                if ((i & 16) != 0) {
                    $dirty3 &= -57345;
                }
                if ((i & 32) != 0) {
                    $dirty3 &= -458753;
                    shape3 = obj;
                    containerColor4 = j;
                    i2 = -731723913;
                } else {
                    shape3 = obj;
                    containerColor4 = j;
                    i2 = -731723913;
                }
            }
            $composer3.endDefaults();
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(i2, $dirty3, -1, "androidx.compose.material3.FloatingActionButton (FloatingActionButton.kt:106)");
            }
            $composer3.startReplaceGroup(519755085);
            ComposerKt.sourceInformation($composer3, "108@5355L39");
            if (interactionSource2 == null) {
                ComposerKt.sourceInformationMarkerStart($composer3, 519755736, "CC(remember):FloatingActionButton.kt#9igjgp");
                Object it$iv = $composer3.rememberedValue();
                if (it$iv == Composer.Companion.getEmpty()) {
                    value$iv = InteractionSourceKt.MutableInteractionSource();
                    $composer3.updateRememberedValue(value$iv);
                } else {
                    value$iv = it$iv;
                }
                ComposerKt.sourceInformationMarkerEnd($composer3);
                interactionSource3 = (MutableInteractionSource) value$iv;
            } else {
                interactionSource3 = interactionSource2;
            }
            $composer3.endReplaceGroup();
            long contentColor4 = contentColor2;
            $composer2 = $composer3;
            SurfaceKt.m2596Surfaceo_FOJdg(function02, SemanticsModifierKt.semantics$default(modifier2, false, new Function1<SemanticsPropertyReceiver, Unit>() { // from class: androidx.compose.material3.FloatingActionButtonKt$FloatingActionButton$1
                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Unit invoke(SemanticsPropertyReceiver semanticsPropertyReceiver) {
                    invoke2(semanticsPropertyReceiver);
                    return Unit.INSTANCE;
                }

                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                public final void invoke2(SemanticsPropertyReceiver $this$semantics) {
                    SemanticsPropertiesKt.m6122setRolekuIjeqM($this$semantics, Role.Companion.m6103getButtono7Vup1c());
                }
            }, 1, null), false, shape3, containerColor4, contentColor4, elevation2.m2170tonalElevationD9Ej5fM$material3_release(), elevation2.shadowElevation$material3_release(interactionSource3, $composer3, ($dirty3 >> 12) & Property.BORDER_BOTTOM_RIGHT_RADIUS).getValue().m6887unboximpl(), null, interactionSource3, ComposableLambdaKt.rememberComposableLambda(1249316354, true, new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.material3.FloatingActionButtonKt$FloatingActionButton$2
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

                public final void invoke(Composer $composer4, int $changed2) {
                    ComposerKt.sourceInformation($composer4, "C121@5936L5,122@5952L370,119@5802L520:FloatingActionButton.kt#uh7d8r");
                    if (($changed2 & 3) != 2 || !$composer4.getSkipping()) {
                        if (ComposerKt.isTraceInProgress()) {
                            ComposerKt.traceEventStart(1249316354, $changed2, -1, "androidx.compose.material3.FloatingActionButton.<anonymous> (FloatingActionButton.kt:119)");
                        }
                        long j2 = contentColor2;
                        TextStyle value = TypographyKt.getValue(ExtendedFabPrimaryTokens.INSTANCE.getLabelTextFont(), $composer4, 6);
                        final Function2<Composer, Integer, Unit> function22 = function2;
                        ProvideContentColorTextStyleKt.m2952ProvideContentColorTextStyle3JVO9M(j2, value, ComposableLambdaKt.rememberComposableLambda(-1771489750, true, new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.material3.FloatingActionButtonKt$FloatingActionButton$2.1
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

                            /* JADX WARN: Removed duplicated region for block: B:28:0x0164  */
                            /* JADX WARN: Removed duplicated region for block: B:31:? A[RETURN, SYNTHETIC] */
                            /*
                                Code decompiled incorrectly, please refer to instructions dump.
                                To view partially-correct add '--show-bad-code' argument
                            */
                            public final void invoke(androidx.compose.runtime.Composer r28, int r29) {
                                /*
                                    Method dump skipped, instructions count: 360
                                    To view this dump add '--comments-level debug' option
                                */
                                throw new UnsupportedOperationException("Method not decompiled: androidx.compose.material3.FloatingActionButtonKt$FloatingActionButton$2.AnonymousClass1.invoke(androidx.compose.runtime.Composer, int):void");
                            }
                        }, $composer4, 54), $composer4, 384);
                        if (ComposerKt.isTraceInProgress()) {
                            ComposerKt.traceEventEnd();
                            return;
                        }
                        return;
                    }
                    $composer4.skipToGroupEnd();
                }
            }, $composer3, 54), $composer2, ($dirty3 & 14) | (($dirty3 << 3) & 7168) | (($dirty3 << 3) & 57344) | (458752 & ($dirty3 << 3)), 6, MetaDo.META_SETROP2);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            modifier3 = modifier2;
            elevation3 = elevation2;
            shape4 = shape3;
            contentColor3 = contentColor4;
            interactionSource4 = interactionSource2;
            containerColor5 = containerColor4;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.material3.FloatingActionButtonKt$FloatingActionButton$3
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

                public final void invoke(Composer composer, int i9) {
                    FloatingActionButtonKt.m2175FloatingActionButtonXz6DiA(function0, modifier3, shape4, containerColor5, contentColor3, elevation3, interactionSource4, function2, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), i);
                }
            });
        }
    }

    /* renamed from: SmallFloatingActionButton-X-z6DiA  reason: not valid java name */
    public static final void m2177SmallFloatingActionButtonXz6DiA(final Function0<Unit> function0, Modifier modifier, Shape shape, long containerColor, long contentColor, FloatingActionButtonElevation elevation, MutableInteractionSource interactionSource, final Function2<? super Composer, ? super Integer, Unit> function2, Composer $composer, final int $changed, final int i) {
        Function0<Unit> function02;
        Modifier modifier2;
        Object obj;
        long j;
        long contentColor2;
        Object elevation2;
        Object obj2;
        Shape shape2;
        int $dirty;
        long containerColor2;
        int $dirty2;
        long containerColor3;
        Shape shape3;
        long containerColor4;
        int i2;
        MutableInteractionSource interactionSource2;
        long contentColor3;
        FloatingActionButtonElevation elevation3;
        Composer $composer2;
        final Modifier modifier3;
        final Shape shape4;
        final long containerColor5;
        final long contentColor4;
        final FloatingActionButtonElevation elevation4;
        final MutableInteractionSource interactionSource3;
        int i3;
        int i4;
        int i5;
        int i6;
        Composer $composer3 = $composer.startRestartGroup(1444748300);
        ComposerKt.sourceInformation($composer3, "C(SmallFloatingActionButton)P(6,5,7,0:c#ui.graphics.Color,2:c#ui.graphics.Color,3,4)170@8224L10,171@8293L14,172@8335L31,173@8444L11,177@8559L455:FloatingActionButton.kt#uh7d8r");
        int $dirty3 = $changed;
        if ((i & 1) != 0) {
            $dirty3 |= 6;
            function02 = function0;
        } else if (($changed & 6) == 0) {
            function02 = function0;
            $dirty3 |= $composer3.changedInstance(function02) ? 4 : 2;
        } else {
            function02 = function0;
        }
        int i7 = i & 2;
        if (i7 != 0) {
            $dirty3 |= 48;
            modifier2 = modifier;
        } else if (($changed & 48) == 0) {
            modifier2 = modifier;
            $dirty3 |= $composer3.changed(modifier2) ? 32 : 16;
        } else {
            modifier2 = modifier;
        }
        if (($changed & 384) == 0) {
            if ((i & 4) == 0) {
                obj = shape;
                if ($composer3.changed(obj)) {
                    i6 = 256;
                    $dirty3 |= i6;
                }
            } else {
                obj = shape;
            }
            i6 = 128;
            $dirty3 |= i6;
        } else {
            obj = shape;
        }
        if (($changed & 3072) == 0) {
            if ((i & 8) == 0) {
                j = containerColor;
                if ($composer3.changed(j)) {
                    i5 = 2048;
                    $dirty3 |= i5;
                }
            } else {
                j = containerColor;
            }
            i5 = 1024;
            $dirty3 |= i5;
        } else {
            j = containerColor;
        }
        if (($changed & 24576) == 0) {
            if ((i & 16) == 0) {
                contentColor2 = contentColor;
                if ($composer3.changed(contentColor2)) {
                    i4 = 16384;
                    $dirty3 |= i4;
                }
            } else {
                contentColor2 = contentColor;
            }
            i4 = 8192;
            $dirty3 |= i4;
        } else {
            contentColor2 = contentColor;
        }
        if ((196608 & $changed) == 0) {
            if ((i & 32) == 0) {
                elevation2 = elevation;
                if ($composer3.changed(elevation2)) {
                    i3 = 131072;
                    $dirty3 |= i3;
                }
            } else {
                elevation2 = elevation;
            }
            i3 = 65536;
            $dirty3 |= i3;
        } else {
            elevation2 = elevation;
        }
        int i8 = i & 64;
        if (i8 != 0) {
            $dirty3 |= 1572864;
            obj2 = interactionSource;
        } else if ((1572864 & $changed) == 0) {
            obj2 = interactionSource;
            $dirty3 |= $composer3.changed(obj2) ? 1048576 : 524288;
        } else {
            obj2 = interactionSource;
        }
        if ((i & 128) != 0) {
            $dirty3 |= 12582912;
        } else if (($changed & 12582912) == 0) {
            $dirty3 |= $composer3.changedInstance(function2) ? 8388608 : 4194304;
        }
        if (($dirty3 & 4793491) == 4793490 && $composer3.getSkipping()) {
            $composer3.skipToGroupEnd();
            modifier3 = modifier2;
            shape4 = obj;
            $composer2 = $composer3;
            long j2 = contentColor2;
            interactionSource3 = obj2;
            containerColor5 = j;
            contentColor4 = j2;
            elevation4 = elevation2;
        } else {
            $composer3.startDefaults();
            if (($changed & 1) == 0 || $composer3.getDefaultsInvalid()) {
                Modifier modifier4 = i7 != 0 ? Modifier.Companion : modifier2;
                if ((i & 4) != 0) {
                    $dirty3 &= -897;
                    shape2 = FloatingActionButtonDefaults.INSTANCE.getSmallShape($composer3, 6);
                } else {
                    shape2 = obj;
                }
                if ((i & 8) != 0) {
                    $dirty = $dirty3 & (-7169);
                    containerColor2 = FloatingActionButtonDefaults.INSTANCE.getContainerColor($composer3, 6);
                } else {
                    $dirty = $dirty3;
                    containerColor2 = j;
                }
                if ((i & 16) != 0) {
                    contentColor2 = ColorSchemeKt.m1979contentColorForek8zF_U(containerColor2, $composer3, ($dirty >> 9) & 14);
                    $dirty2 = $dirty & (-57345);
                } else {
                    $dirty2 = $dirty;
                }
                if ((i & 32) != 0) {
                    containerColor3 = containerColor2;
                    $dirty2 &= -458753;
                    elevation2 = FloatingActionButtonDefaults.INSTANCE.m2167elevationxZ9QkE(0.0f, 0.0f, 0.0f, 0.0f, $composer3, 24576, 15);
                } else {
                    containerColor3 = containerColor2;
                }
                if (i8 != 0) {
                    modifier2 = modifier4;
                    shape3 = shape2;
                    containerColor4 = containerColor3;
                    i2 = 1444748300;
                    interactionSource2 = null;
                    elevation3 = elevation2;
                    $dirty3 = $dirty2;
                    contentColor3 = contentColor2;
                } else {
                    modifier2 = modifier4;
                    shape3 = shape2;
                    $dirty3 = $dirty2;
                    containerColor4 = containerColor3;
                    i2 = 1444748300;
                    interactionSource2 = interactionSource;
                    contentColor3 = contentColor2;
                    elevation3 = elevation2;
                }
            } else {
                $composer3.skipToGroupEnd();
                if ((i & 4) != 0) {
                    $dirty3 &= -897;
                }
                if ((i & 8) != 0) {
                    $dirty3 &= -7169;
                }
                if ((i & 16) != 0) {
                    $dirty3 &= -57345;
                }
                if ((i & 32) != 0) {
                    $dirty3 &= -458753;
                    shape3 = obj;
                    interactionSource2 = obj2;
                    containerColor4 = j;
                    contentColor3 = contentColor2;
                    elevation3 = elevation2;
                    i2 = 1444748300;
                } else {
                    shape3 = obj;
                    interactionSource2 = obj2;
                    containerColor4 = j;
                    contentColor3 = contentColor2;
                    elevation3 = elevation2;
                    i2 = 1444748300;
                }
            }
            $composer3.endDefaults();
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(i2, $dirty3, -1, "androidx.compose.material3.SmallFloatingActionButton (FloatingActionButton.kt:176)");
            }
            $composer2 = $composer3;
            m2175FloatingActionButtonXz6DiA(function02, SizeKt.m1044sizeInqDBjuR0$default(modifier2, FabPrimarySmallTokens.INSTANCE.m3251getContainerWidthD9Ej5fM(), FabPrimarySmallTokens.INSTANCE.m3250getContainerHeightD9Ej5fM(), 0.0f, 0.0f, 12, null), shape3, containerColor4, contentColor3, elevation3, interactionSource2, function2, $composer2, ($dirty3 & 14) | ($dirty3 & 896) | ($dirty3 & 7168) | (57344 & $dirty3) | (458752 & $dirty3) | (3670016 & $dirty3) | (29360128 & $dirty3), 0);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            modifier3 = modifier2;
            shape4 = shape3;
            containerColor5 = containerColor4;
            contentColor4 = contentColor3;
            elevation4 = elevation3;
            interactionSource3 = interactionSource2;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.material3.FloatingActionButtonKt$SmallFloatingActionButton$1
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

                public final void invoke(Composer composer, int i9) {
                    FloatingActionButtonKt.m2177SmallFloatingActionButtonXz6DiA(function0, modifier3, shape4, containerColor5, contentColor4, elevation4, interactionSource3, function2, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), i);
                }
            });
        }
    }

    /* renamed from: LargeFloatingActionButton-X-z6DiA  reason: not valid java name */
    public static final void m2176LargeFloatingActionButtonXz6DiA(final Function0<Unit> function0, Modifier modifier, Shape shape, long containerColor, long contentColor, FloatingActionButtonElevation elevation, MutableInteractionSource interactionSource, final Function2<? super Composer, ? super Integer, Unit> function2, Composer $composer, final int $changed, final int i) {
        Function0<Unit> function02;
        Modifier modifier2;
        Object obj;
        long j;
        long contentColor2;
        Object elevation2;
        Object obj2;
        Shape shape2;
        int $dirty;
        long containerColor2;
        int $dirty2;
        long containerColor3;
        Shape shape3;
        long containerColor4;
        int i2;
        MutableInteractionSource interactionSource2;
        long contentColor3;
        FloatingActionButtonElevation elevation3;
        Composer $composer2;
        final Modifier modifier3;
        final Shape shape4;
        final long containerColor5;
        final long contentColor4;
        final FloatingActionButtonElevation elevation4;
        final MutableInteractionSource interactionSource3;
        int i3;
        int i4;
        int i5;
        int i6;
        Composer $composer3 = $composer.startRestartGroup(-1650866856);
        ComposerKt.sourceInformation($composer3, "C(LargeFloatingActionButton)P(6,5,7,0:c#ui.graphics.Color,2:c#ui.graphics.Color,3,4)226@10910L10,227@10979L14,228@11021L31,229@11130L11,233@11245L455:FloatingActionButton.kt#uh7d8r");
        int $dirty3 = $changed;
        if ((i & 1) != 0) {
            $dirty3 |= 6;
            function02 = function0;
        } else if (($changed & 6) == 0) {
            function02 = function0;
            $dirty3 |= $composer3.changedInstance(function02) ? 4 : 2;
        } else {
            function02 = function0;
        }
        int i7 = i & 2;
        if (i7 != 0) {
            $dirty3 |= 48;
            modifier2 = modifier;
        } else if (($changed & 48) == 0) {
            modifier2 = modifier;
            $dirty3 |= $composer3.changed(modifier2) ? 32 : 16;
        } else {
            modifier2 = modifier;
        }
        if (($changed & 384) == 0) {
            if ((i & 4) == 0) {
                obj = shape;
                if ($composer3.changed(obj)) {
                    i6 = 256;
                    $dirty3 |= i6;
                }
            } else {
                obj = shape;
            }
            i6 = 128;
            $dirty3 |= i6;
        } else {
            obj = shape;
        }
        if (($changed & 3072) == 0) {
            if ((i & 8) == 0) {
                j = containerColor;
                if ($composer3.changed(j)) {
                    i5 = 2048;
                    $dirty3 |= i5;
                }
            } else {
                j = containerColor;
            }
            i5 = 1024;
            $dirty3 |= i5;
        } else {
            j = containerColor;
        }
        if (($changed & 24576) == 0) {
            if ((i & 16) == 0) {
                contentColor2 = contentColor;
                if ($composer3.changed(contentColor2)) {
                    i4 = 16384;
                    $dirty3 |= i4;
                }
            } else {
                contentColor2 = contentColor;
            }
            i4 = 8192;
            $dirty3 |= i4;
        } else {
            contentColor2 = contentColor;
        }
        if ((196608 & $changed) == 0) {
            if ((i & 32) == 0) {
                elevation2 = elevation;
                if ($composer3.changed(elevation2)) {
                    i3 = 131072;
                    $dirty3 |= i3;
                }
            } else {
                elevation2 = elevation;
            }
            i3 = 65536;
            $dirty3 |= i3;
        } else {
            elevation2 = elevation;
        }
        int i8 = i & 64;
        if (i8 != 0) {
            $dirty3 |= 1572864;
            obj2 = interactionSource;
        } else if ((1572864 & $changed) == 0) {
            obj2 = interactionSource;
            $dirty3 |= $composer3.changed(obj2) ? 1048576 : 524288;
        } else {
            obj2 = interactionSource;
        }
        if ((i & 128) != 0) {
            $dirty3 |= 12582912;
        } else if (($changed & 12582912) == 0) {
            $dirty3 |= $composer3.changedInstance(function2) ? 8388608 : 4194304;
        }
        if (($dirty3 & 4793491) == 4793490 && $composer3.getSkipping()) {
            $composer3.skipToGroupEnd();
            modifier3 = modifier2;
            shape4 = obj;
            $composer2 = $composer3;
            long j2 = contentColor2;
            interactionSource3 = obj2;
            containerColor5 = j;
            contentColor4 = j2;
            elevation4 = elevation2;
        } else {
            $composer3.startDefaults();
            if (($changed & 1) == 0 || $composer3.getDefaultsInvalid()) {
                Modifier modifier4 = i7 != 0 ? Modifier.Companion : modifier2;
                if ((i & 4) != 0) {
                    $dirty3 &= -897;
                    shape2 = FloatingActionButtonDefaults.INSTANCE.getLargeShape($composer3, 6);
                } else {
                    shape2 = obj;
                }
                if ((i & 8) != 0) {
                    $dirty = $dirty3 & (-7169);
                    containerColor2 = FloatingActionButtonDefaults.INSTANCE.getContainerColor($composer3, 6);
                } else {
                    $dirty = $dirty3;
                    containerColor2 = j;
                }
                if ((i & 16) != 0) {
                    contentColor2 = ColorSchemeKt.m1979contentColorForek8zF_U(containerColor2, $composer3, ($dirty >> 9) & 14);
                    $dirty2 = $dirty & (-57345);
                } else {
                    $dirty2 = $dirty;
                }
                if ((i & 32) != 0) {
                    containerColor3 = containerColor2;
                    $dirty2 &= -458753;
                    elevation2 = FloatingActionButtonDefaults.INSTANCE.m2167elevationxZ9QkE(0.0f, 0.0f, 0.0f, 0.0f, $composer3, 24576, 15);
                } else {
                    containerColor3 = containerColor2;
                }
                if (i8 != 0) {
                    modifier2 = modifier4;
                    shape3 = shape2;
                    containerColor4 = containerColor3;
                    i2 = -1650866856;
                    interactionSource2 = null;
                    elevation3 = elevation2;
                    $dirty3 = $dirty2;
                    contentColor3 = contentColor2;
                } else {
                    modifier2 = modifier4;
                    shape3 = shape2;
                    $dirty3 = $dirty2;
                    containerColor4 = containerColor3;
                    i2 = -1650866856;
                    interactionSource2 = interactionSource;
                    contentColor3 = contentColor2;
                    elevation3 = elevation2;
                }
            } else {
                $composer3.skipToGroupEnd();
                if ((i & 4) != 0) {
                    $dirty3 &= -897;
                }
                if ((i & 8) != 0) {
                    $dirty3 &= -7169;
                }
                if ((i & 16) != 0) {
                    $dirty3 &= -57345;
                }
                if ((i & 32) != 0) {
                    $dirty3 &= -458753;
                    shape3 = obj;
                    interactionSource2 = obj2;
                    containerColor4 = j;
                    contentColor3 = contentColor2;
                    elevation3 = elevation2;
                    i2 = -1650866856;
                } else {
                    shape3 = obj;
                    interactionSource2 = obj2;
                    containerColor4 = j;
                    contentColor3 = contentColor2;
                    elevation3 = elevation2;
                    i2 = -1650866856;
                }
            }
            $composer3.endDefaults();
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(i2, $dirty3, -1, "androidx.compose.material3.LargeFloatingActionButton (FloatingActionButton.kt:232)");
            }
            $composer2 = $composer3;
            m2175FloatingActionButtonXz6DiA(function02, SizeKt.m1044sizeInqDBjuR0$default(modifier2, FabPrimaryLargeTokens.INSTANCE.m3240getContainerWidthD9Ej5fM(), FabPrimaryLargeTokens.INSTANCE.m3239getContainerHeightD9Ej5fM(), 0.0f, 0.0f, 12, null), shape3, containerColor4, contentColor3, elevation3, interactionSource2, function2, $composer2, ($dirty3 & 14) | ($dirty3 & 896) | ($dirty3 & 7168) | (57344 & $dirty3) | (458752 & $dirty3) | (3670016 & $dirty3) | (29360128 & $dirty3), 0);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            modifier3 = modifier2;
            shape4 = shape3;
            containerColor5 = containerColor4;
            contentColor4 = contentColor3;
            elevation4 = elevation3;
            interactionSource3 = interactionSource2;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.material3.FloatingActionButtonKt$LargeFloatingActionButton$1
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

                public final void invoke(Composer composer, int i9) {
                    FloatingActionButtonKt.m2176LargeFloatingActionButtonXz6DiA(function0, modifier3, shape4, containerColor5, contentColor4, elevation4, interactionSource3, function2, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), i);
                }
            });
        }
    }

    /* renamed from: ExtendedFloatingActionButton-X-z6DiA  reason: not valid java name */
    public static final void m2174ExtendedFloatingActionButtonXz6DiA(final Function0<Unit> function0, Modifier modifier, Shape shape, long containerColor, long contentColor, FloatingActionButtonElevation elevation, MutableInteractionSource interactionSource, final Function3<? super RowScope, ? super Composer, ? super Integer, Unit> function3, Composer $composer, final int $changed, final int i) {
        Function0<Unit> function02;
        Object obj;
        Object obj2;
        long j;
        long contentColor2;
        Object elevation2;
        Object obj3;
        Shape shape2;
        int $dirty;
        long containerColor2;
        int $dirty2;
        long containerColor3;
        Modifier modifier2;
        int i2;
        long contentColor3;
        Shape shape3;
        long containerColor4;
        int i3;
        MutableInteractionSource interactionSource2;
        FloatingActionButtonElevation elevation3;
        Composer $composer2;
        final Modifier modifier3;
        final Shape shape4;
        final long containerColor5;
        final long contentColor4;
        final FloatingActionButtonElevation elevation4;
        final MutableInteractionSource interactionSource3;
        int i4;
        int i5;
        int i6;
        int i7;
        Composer $composer3 = $composer.startRestartGroup(-326283107);
        ComposerKt.sourceInformation($composer3, "C(ExtendedFloatingActionButton)P(6,5,7,0:c#ui.graphics.Color,2:c#ui.graphics.Color,3,4)285@13734L16,286@13809L14,287@13851L31,288@13960L11,300@14347L335,292@14084L598:FloatingActionButton.kt#uh7d8r");
        int $dirty3 = $changed;
        if ((i & 1) != 0) {
            $dirty3 |= 6;
            function02 = function0;
        } else if (($changed & 6) == 0) {
            function02 = function0;
            $dirty3 |= $composer3.changedInstance(function02) ? 4 : 2;
        } else {
            function02 = function0;
        }
        int i8 = i & 2;
        if (i8 != 0) {
            $dirty3 |= 48;
            obj = modifier;
        } else if (($changed & 48) == 0) {
            obj = modifier;
            $dirty3 |= $composer3.changed(obj) ? 32 : 16;
        } else {
            obj = modifier;
        }
        if (($changed & 384) == 0) {
            if ((i & 4) == 0) {
                obj2 = shape;
                if ($composer3.changed(obj2)) {
                    i7 = 256;
                    $dirty3 |= i7;
                }
            } else {
                obj2 = shape;
            }
            i7 = 128;
            $dirty3 |= i7;
        } else {
            obj2 = shape;
        }
        if (($changed & 3072) == 0) {
            if ((i & 8) == 0) {
                j = containerColor;
                if ($composer3.changed(j)) {
                    i6 = 2048;
                    $dirty3 |= i6;
                }
            } else {
                j = containerColor;
            }
            i6 = 1024;
            $dirty3 |= i6;
        } else {
            j = containerColor;
        }
        if (($changed & 24576) == 0) {
            if ((i & 16) == 0) {
                contentColor2 = contentColor;
                if ($composer3.changed(contentColor2)) {
                    i5 = 16384;
                    $dirty3 |= i5;
                }
            } else {
                contentColor2 = contentColor;
            }
            i5 = 8192;
            $dirty3 |= i5;
        } else {
            contentColor2 = contentColor;
        }
        if ((196608 & $changed) == 0) {
            if ((i & 32) == 0) {
                elevation2 = elevation;
                if ($composer3.changed(elevation2)) {
                    i4 = 131072;
                    $dirty3 |= i4;
                }
            } else {
                elevation2 = elevation;
            }
            i4 = 65536;
            $dirty3 |= i4;
        } else {
            elevation2 = elevation;
        }
        int i9 = i & 64;
        if (i9 != 0) {
            $dirty3 |= 1572864;
            obj3 = interactionSource;
        } else if ((1572864 & $changed) == 0) {
            obj3 = interactionSource;
            $dirty3 |= $composer3.changed(obj3) ? 1048576 : 524288;
        } else {
            obj3 = interactionSource;
        }
        if ((i & 128) != 0) {
            $dirty3 |= 12582912;
        } else if (($changed & 12582912) == 0) {
            $dirty3 |= $composer3.changedInstance(function3) ? 8388608 : 4194304;
        }
        if ((4793491 & $dirty3) == 4793490 && $composer3.getSkipping()) {
            $composer3.skipToGroupEnd();
            modifier3 = obj;
            shape4 = obj2;
            $composer2 = $composer3;
            FloatingActionButtonElevation floatingActionButtonElevation = elevation2;
            interactionSource3 = obj3;
            containerColor5 = j;
            elevation4 = floatingActionButtonElevation;
            contentColor4 = contentColor2;
        } else {
            $composer3.startDefaults();
            if (($changed & 1) == 0 || $composer3.getDefaultsInvalid()) {
                Modifier modifier4 = i8 != 0 ? Modifier.Companion : obj;
                if ((i & 4) != 0) {
                    $dirty3 &= -897;
                    shape2 = FloatingActionButtonDefaults.INSTANCE.getExtendedFabShape($composer3, 6);
                } else {
                    shape2 = obj2;
                }
                if ((i & 8) != 0) {
                    $dirty = $dirty3 & (-7169);
                    containerColor2 = FloatingActionButtonDefaults.INSTANCE.getContainerColor($composer3, 6);
                } else {
                    $dirty = $dirty3;
                    containerColor2 = j;
                }
                if ((i & 16) != 0) {
                    contentColor2 = ColorSchemeKt.m1979contentColorForek8zF_U(containerColor2, $composer3, ($dirty >> 9) & 14);
                    $dirty2 = $dirty & (-57345);
                } else {
                    $dirty2 = $dirty;
                }
                if ((i & 32) != 0) {
                    containerColor3 = containerColor2;
                    $dirty2 &= -458753;
                    elevation2 = FloatingActionButtonDefaults.INSTANCE.m2167elevationxZ9QkE(0.0f, 0.0f, 0.0f, 0.0f, $composer3, 24576, 15);
                } else {
                    containerColor3 = containerColor2;
                }
                if (i9 != 0) {
                    long j2 = contentColor2;
                    modifier2 = modifier4;
                    i2 = 12582912;
                    contentColor3 = j2;
                    int i10 = $dirty2;
                    interactionSource2 = null;
                    $dirty3 = i10;
                    shape3 = shape2;
                    containerColor4 = containerColor3;
                    i3 = -326283107;
                    elevation3 = elevation2;
                } else {
                    long j3 = contentColor2;
                    modifier2 = modifier4;
                    i2 = 12582912;
                    contentColor3 = j3;
                    shape3 = shape2;
                    $dirty3 = $dirty2;
                    containerColor4 = containerColor3;
                    i3 = -326283107;
                    interactionSource2 = interactionSource;
                    elevation3 = elevation2;
                }
            } else {
                $composer3.skipToGroupEnd();
                if ((i & 4) != 0) {
                    $dirty3 &= -897;
                }
                if ((i & 8) != 0) {
                    $dirty3 &= -7169;
                }
                if ((i & 16) != 0) {
                    $dirty3 &= -57345;
                }
                if ((i & 32) != 0) {
                    $dirty3 &= -458753;
                    interactionSource2 = obj3;
                    containerColor4 = j;
                    elevation3 = elevation2;
                    i2 = 12582912;
                    i3 = -326283107;
                    contentColor3 = contentColor2;
                    modifier2 = obj;
                    shape3 = obj2;
                } else {
                    interactionSource2 = obj3;
                    containerColor4 = j;
                    elevation3 = elevation2;
                    i2 = 12582912;
                    i3 = -326283107;
                    contentColor3 = contentColor2;
                    modifier2 = obj;
                    shape3 = obj2;
                }
            }
            $composer3.endDefaults();
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(i3, $dirty3, -1, "androidx.compose.material3.ExtendedFloatingActionButton (FloatingActionButton.kt:291)");
            }
            $composer2 = $composer3;
            m2175FloatingActionButtonXz6DiA(function02, modifier2, shape3, containerColor4, contentColor3, elevation3, interactionSource2, ComposableLambdaKt.rememberComposableLambda(398457247, true, new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.material3.FloatingActionButtonKt$ExtendedFloatingActionButton$1
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

                /* JADX WARN: Removed duplicated region for block: B:28:0x015e  */
                /* JADX WARN: Removed duplicated region for block: B:31:? A[RETURN, SYNTHETIC] */
                /*
                    Code decompiled incorrectly, please refer to instructions dump.
                    To view partially-correct add '--show-bad-code' argument
                */
                public final void invoke(androidx.compose.runtime.Composer r25, int r26) {
                    /*
                        Method dump skipped, instructions count: 354
                        To view this dump add '--comments-level debug' option
                    */
                    throw new UnsupportedOperationException("Method not decompiled: androidx.compose.material3.FloatingActionButtonKt$ExtendedFloatingActionButton$1.invoke(androidx.compose.runtime.Composer, int):void");
                }
            }, $composer3, 54), $composer2, i2 | ($dirty3 & 14) | ($dirty3 & Property.BORDER_BOTTOM_RIGHT_RADIUS) | ($dirty3 & 896) | ($dirty3 & 7168) | (57344 & $dirty3) | (458752 & $dirty3) | (3670016 & $dirty3), 0);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            modifier3 = modifier2;
            shape4 = shape3;
            containerColor5 = containerColor4;
            contentColor4 = contentColor3;
            elevation4 = elevation3;
            interactionSource3 = interactionSource2;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.material3.FloatingActionButtonKt$ExtendedFloatingActionButton$2
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

                public final void invoke(Composer composer, int i11) {
                    FloatingActionButtonKt.m2174ExtendedFloatingActionButtonXz6DiA(function0, modifier3, shape4, containerColor5, contentColor4, elevation4, interactionSource3, function3, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), i);
                }
            });
        }
    }

    /* renamed from: ExtendedFloatingActionButton-ElI5-7k  reason: not valid java name */
    public static final void m2173ExtendedFloatingActionButtonElI57k(Function2<? super Composer, ? super Integer, Unit> function2, final Function2<? super Composer, ? super Integer, Unit> function22, final Function0<Unit> function0, Modifier modifier, boolean expanded, Shape shape, long containerColor, long contentColor, FloatingActionButtonElevation elevation, MutableInteractionSource interactionSource, Composer $composer, final int $changed, final int i) {
        Function0<Unit> function02;
        Modifier modifier2;
        final boolean expanded2;
        Object obj;
        long j;
        int i2;
        Object obj2;
        int i3;
        Object obj3;
        Shape shape2;
        long containerColor2;
        long contentColor2;
        int $dirty;
        long containerColor3;
        FloatingActionButtonElevation elevation2;
        Shape shape3;
        long contentColor3;
        long containerColor4;
        MutableInteractionSource interactionSource2;
        FloatingActionButtonElevation elevation3;
        final Function2<? super Composer, ? super Integer, Unit> function23;
        Composer $composer2;
        final boolean expanded3;
        final Modifier modifier3;
        final Shape shape4;
        final long containerColor5;
        final long contentColor4;
        final FloatingActionButtonElevation elevation4;
        final MutableInteractionSource interactionSource3;
        int $dirty2;
        int i4;
        int i5;
        int i6;
        int i7;
        Composer $composer3 = $composer.startRestartGroup(-1387401842);
        ComposerKt.sourceInformation($composer3, "C(ExtendedFloatingActionButton)P(9,4,7,6,3,8,0:c#ui.graphics.Color,1:c#ui.graphics.Color)359@17300L16,360@17375L14,361@17417L31,362@17526L11,373@17867L1053,365@17604L1316:FloatingActionButton.kt#uh7d8r");
        int $dirty3 = $changed;
        if ((i & 1) != 0) {
            $dirty3 |= 6;
        } else if (($changed & 6) == 0) {
            $dirty3 |= $composer3.changedInstance(function2) ? 4 : 2;
        }
        if ((i & 2) != 0) {
            $dirty3 |= 48;
        } else if (($changed & 48) == 0) {
            $dirty3 |= $composer3.changedInstance(function22) ? 32 : 16;
        }
        if ((i & 4) != 0) {
            $dirty3 |= 384;
            function02 = function0;
        } else if (($changed & 384) == 0) {
            function02 = function0;
            $dirty3 |= $composer3.changedInstance(function02) ? 256 : 128;
        } else {
            function02 = function0;
        }
        int i8 = i & 8;
        if (i8 != 0) {
            $dirty3 |= 3072;
            modifier2 = modifier;
        } else if (($changed & 3072) == 0) {
            modifier2 = modifier;
            $dirty3 |= $composer3.changed(modifier2) ? 2048 : 1024;
        } else {
            modifier2 = modifier;
        }
        int i9 = i & 16;
        if (i9 != 0) {
            $dirty3 |= 24576;
            expanded2 = expanded;
        } else if (($changed & 24576) == 0) {
            expanded2 = expanded;
            $dirty3 |= $composer3.changed(expanded2) ? 16384 : 8192;
        } else {
            expanded2 = expanded;
        }
        if ((196608 & $changed) == 0) {
            if ((i & 32) == 0) {
                obj = shape;
                if ($composer3.changed(obj)) {
                    i7 = 131072;
                    $dirty3 |= i7;
                }
            } else {
                obj = shape;
            }
            i7 = 65536;
            $dirty3 |= i7;
        } else {
            obj = shape;
        }
        if ((1572864 & $changed) == 0) {
            if ((i & 64) == 0) {
                j = containerColor;
                if ($composer3.changed(j)) {
                    i6 = 1048576;
                    $dirty3 |= i6;
                }
            } else {
                j = containerColor;
            }
            i6 = 524288;
            $dirty3 |= i6;
        } else {
            j = containerColor;
        }
        if (($changed & 12582912) == 0) {
            i2 = 12582912;
            if ((i & 128) == 0 && $composer3.changed(contentColor)) {
                i5 = 8388608;
                $dirty3 |= i5;
            }
            i5 = 4194304;
            $dirty3 |= i5;
        } else {
            i2 = 12582912;
        }
        if (($changed & 100663296) == 0) {
            if ((i & 256) == 0) {
                obj2 = elevation;
                if ($composer3.changed(obj2)) {
                    i4 = 67108864;
                    $dirty3 |= i4;
                }
            } else {
                obj2 = elevation;
            }
            i4 = 33554432;
            $dirty3 |= i4;
        } else {
            obj2 = elevation;
        }
        int i10 = i & 512;
        if (i10 != 0) {
            $dirty3 |= 805306368;
            i3 = i10;
            obj3 = interactionSource;
        } else if (($changed & 805306368) == 0) {
            i3 = i10;
            obj3 = interactionSource;
            $dirty3 |= $composer3.changed(obj3) ? PropertyOptions.DELETE_EXISTING : 268435456;
        } else {
            i3 = i10;
            obj3 = interactionSource;
        }
        if (($dirty3 & 306783379) == 306783378 && $composer3.getSkipping()) {
            $composer3.skipToGroupEnd();
            function23 = function2;
            $composer2 = $composer3;
            shape4 = obj;
            FloatingActionButtonElevation floatingActionButtonElevation = obj2;
            interactionSource3 = obj3;
            modifier3 = modifier2;
            expanded3 = expanded2;
            containerColor5 = j;
            elevation4 = floatingActionButtonElevation;
            contentColor4 = contentColor;
            $dirty2 = $dirty3;
        } else {
            $composer3.startDefaults();
            if (($changed & 1) == 0 || $composer3.getDefaultsInvalid()) {
                Modifier modifier4 = i8 != 0 ? Modifier.Companion : modifier2;
                boolean expanded4 = i9 != 0 ? true : expanded2;
                if ((i & 32) != 0) {
                    $dirty3 &= -458753;
                    shape2 = FloatingActionButtonDefaults.INSTANCE.getExtendedFabShape($composer3, 6);
                } else {
                    shape2 = obj;
                }
                if ((i & 64) != 0) {
                    containerColor2 = FloatingActionButtonDefaults.INSTANCE.getContainerColor($composer3, 6);
                    $dirty3 &= -3670017;
                } else {
                    containerColor2 = j;
                }
                if ((i & 128) != 0) {
                    contentColor2 = ColorSchemeKt.m1979contentColorForek8zF_U(containerColor2, $composer3, ($dirty3 >> 18) & 14);
                    $dirty = $dirty3 & (-29360129);
                } else {
                    contentColor2 = contentColor;
                    $dirty = $dirty3;
                }
                if ((i & 256) != 0) {
                    containerColor3 = containerColor2;
                    elevation2 = FloatingActionButtonDefaults.INSTANCE.m2167elevationxZ9QkE(0.0f, 0.0f, 0.0f, 0.0f, $composer3, 24576, 15);
                    $dirty &= -234881025;
                } else {
                    containerColor3 = containerColor2;
                    elevation2 = obj2;
                }
                if (i3 != 0) {
                    modifier2 = modifier4;
                    expanded2 = expanded4;
                    shape3 = shape2;
                    contentColor3 = contentColor2;
                    containerColor4 = containerColor3;
                    interactionSource2 = null;
                    elevation3 = elevation2;
                    $dirty3 = $dirty;
                } else {
                    modifier2 = modifier4;
                    expanded2 = expanded4;
                    shape3 = shape2;
                    contentColor3 = contentColor2;
                    containerColor4 = containerColor3;
                    interactionSource2 = interactionSource;
                    elevation3 = elevation2;
                    $dirty3 = $dirty;
                }
            } else {
                $composer3.skipToGroupEnd();
                if ((i & 32) != 0) {
                    $dirty3 &= -458753;
                }
                if ((i & 64) != 0) {
                    $dirty3 &= -3670017;
                }
                if ((i & 128) != 0) {
                    $dirty3 &= -29360129;
                }
                if ((i & 256) != 0) {
                    contentColor3 = contentColor;
                    $dirty3 &= -234881025;
                    interactionSource2 = obj3;
                    shape3 = obj;
                    containerColor4 = j;
                    elevation3 = obj2;
                } else {
                    contentColor3 = contentColor;
                    interactionSource2 = obj3;
                    shape3 = obj;
                    containerColor4 = j;
                    elevation3 = obj2;
                }
            }
            $composer3.endDefaults();
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-1387401842, $dirty3, -1, "androidx.compose.material3.ExtendedFloatingActionButton (FloatingActionButton.kt:364)");
            }
            function23 = function2;
            Modifier modifier5 = modifier2;
            $composer2 = $composer3;
            m2175FloatingActionButtonXz6DiA(function02, modifier5, shape3, containerColor4, contentColor3, elevation3, interactionSource2, ComposableLambdaKt.rememberComposableLambda(1172118032, true, new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.material3.FloatingActionButtonKt$ExtendedFloatingActionButton$3
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

                public final void invoke(Composer $composer4, int $changed2) {
                    float m6873constructorimpl;
                    float endPadding;
                    float m3262getContainerWidthD9Ej5fM;
                    EnterTransition enterTransition;
                    ExitTransition exitTransition;
                    float f;
                    float f2;
                    ComposerKt.sourceInformation($composer4, "C377@18029L885:FloatingActionButton.kt#uh7d8r");
                    if (($changed2 & 3) != 2 || !$composer4.getSkipping()) {
                        if (ComposerKt.isTraceInProgress()) {
                            ComposerKt.traceEventStart(1172118032, $changed2, -1, "androidx.compose.material3.ExtendedFloatingActionButton.<anonymous> (FloatingActionButton.kt:374)");
                        }
                        if (expanded2) {
                            m6873constructorimpl = FloatingActionButtonKt.ExtendedFabStartIconPadding;
                        } else {
                            m6873constructorimpl = Dp.m6873constructorimpl(0);
                        }
                        float startPadding = m6873constructorimpl;
                        if (expanded2) {
                            f2 = FloatingActionButtonKt.ExtendedFabTextPadding;
                            endPadding = f2;
                        } else {
                            endPadding = Dp.m6873constructorimpl(0);
                        }
                        Modifier.Companion companion = Modifier.Companion;
                        if (expanded2) {
                            f = FloatingActionButtonKt.ExtendedFabMinimumWidth;
                            m3262getContainerWidthD9Ej5fM = f;
                        } else {
                            m3262getContainerWidthD9Ej5fM = FabPrimaryTokens.INSTANCE.m3262getContainerWidthD9Ej5fM();
                        }
                        Modifier m997paddingqDBjuR0$default = PaddingKt.m997paddingqDBjuR0$default(SizeKt.m1044sizeInqDBjuR0$default(companion, m3262getContainerWidthD9Ej5fM, 0.0f, 0.0f, 0.0f, 14, null), startPadding, 0.0f, endPadding, 0.0f, 10, null);
                        Alignment.Vertical centerVertically = Alignment.Companion.getCenterVertically();
                        Arrangement.HorizontalOrVertical start = expanded2 ? Arrangement.INSTANCE.getStart() : Arrangement.INSTANCE.getCenter();
                        Function2<Composer, Integer, Unit> function24 = function22;
                        boolean z = expanded2;
                        final Function2<Composer, Integer, Unit> function25 = function23;
                        ComposerKt.sourceInformationMarkerStart($composer4, 693286680, "CC(Row)P(2,1,3)98@4939L58,99@5002L130:Row.kt#2w3rfo");
                        MeasurePolicy measurePolicy$iv = RowKt.rowMeasurePolicy(start, centerVertically, $composer4, ((384 >> 3) & 14) | ((384 >> 3) & Property.BORDER_BOTTOM_RIGHT_RADIUS));
                        int $changed$iv$iv = (384 << 3) & Property.BORDER_BOTTOM_RIGHT_RADIUS;
                        ComposerKt.sourceInformationMarkerStart($composer4, -1323940314, "CC(Layout)P(!1,2)78@3182L23,81@3333L411:Layout.kt#80mrfh");
                        int compositeKeyHash$iv$iv = ComposablesKt.getCurrentCompositeKeyHash($composer4, 0);
                        CompositionLocalMap localMap$iv$iv = $composer4.getCurrentCompositionLocalMap();
                        Modifier materialized$iv$iv = ComposedModifierKt.materializeModifier($composer4, m997paddingqDBjuR0$default);
                        Function0 factory$iv$iv$iv = ComposeUiNode.Companion.getConstructor();
                        int $changed$iv$iv$iv = (($changed$iv$iv << 6) & 896) | 6;
                        ComposerKt.sourceInformationMarkerStart($composer4, -692256719, "CC(ReusableComposeNode)P(1,2)376@14062L9:Composables.kt#9igjgp");
                        if (!($composer4.getApplier() instanceof Applier)) {
                            ComposablesKt.invalidApplier();
                        }
                        $composer4.startReusableNode();
                        if ($composer4.getInserting()) {
                            $composer4.createNode(factory$iv$iv$iv);
                        } else {
                            $composer4.useNode();
                        }
                        Composer $this$Layout_u24lambda_u240$iv$iv = Updater.m3731constructorimpl($composer4);
                        Updater.m3738setimpl($this$Layout_u24lambda_u240$iv$iv, measurePolicy$iv, ComposeUiNode.Companion.getSetMeasurePolicy());
                        Updater.m3738setimpl($this$Layout_u24lambda_u240$iv$iv, localMap$iv$iv, ComposeUiNode.Companion.getSetResolvedCompositionLocals());
                        Function2 block$iv$iv$iv = ComposeUiNode.Companion.getSetCompositeKeyHash();
                        if ($this$Layout_u24lambda_u240$iv$iv.getInserting() || !Intrinsics.areEqual($this$Layout_u24lambda_u240$iv$iv.rememberedValue(), Integer.valueOf(compositeKeyHash$iv$iv))) {
                            $this$Layout_u24lambda_u240$iv$iv.updateRememberedValue(Integer.valueOf(compositeKeyHash$iv$iv));
                            $this$Layout_u24lambda_u240$iv$iv.apply(Integer.valueOf(compositeKeyHash$iv$iv), block$iv$iv$iv);
                        }
                        Updater.m3738setimpl($this$Layout_u24lambda_u240$iv$iv, materialized$iv$iv, ComposeUiNode.Companion.getSetModifier());
                        int i11 = ($changed$iv$iv$iv >> 6) & 14;
                        ComposerKt.sourceInformationMarkerStart($composer4, -407918630, "C100@5047L9:Row.kt#2w3rfo");
                        RowScope $this$invoke_u24lambda_u240 = RowScopeInstance.INSTANCE;
                        ComposerKt.sourceInformationMarkerStart($composer4, 1618821151, "C388@18524L6,393@18718L186,389@18543L361:FloatingActionButton.kt#uh7d8r");
                        function24.invoke($composer4, 0);
                        enterTransition = FloatingActionButtonKt.ExtendedFabExpandAnimation;
                        exitTransition = FloatingActionButtonKt.ExtendedFabCollapseAnimation;
                        AnimatedVisibilityKt.AnimatedVisibility($this$invoke_u24lambda_u240, z, (Modifier) null, enterTransition, exitTransition, (String) null, ComposableLambdaKt.rememberComposableLambda(176242764, true, new Function3<AnimatedVisibilityScope, Composer, Integer, Unit>() { // from class: androidx.compose.material3.FloatingActionButtonKt$ExtendedFloatingActionButton$3$1$1
                            /* JADX INFO: Access modifiers changed from: package-private */
                            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                            /* JADX WARN: Multi-variable type inference failed */
                            {
                                super(3);
                            }

                            @Override // kotlin.jvm.functions.Function3
                            public /* bridge */ /* synthetic */ Unit invoke(AnimatedVisibilityScope animatedVisibilityScope, Composer composer, Integer num) {
                                invoke(animatedVisibilityScope, composer, num.intValue());
                                return Unit.INSTANCE;
                            }

                            /* JADX WARN: Removed duplicated region for block: B:23:0x0168  */
                            /* JADX WARN: Removed duplicated region for block: B:25:? A[RETURN, SYNTHETIC] */
                            /*
                                Code decompiled incorrectly, please refer to instructions dump.
                                To view partially-correct add '--show-bad-code' argument
                            */
                            public final void invoke(androidx.compose.animation.AnimatedVisibilityScope r28, androidx.compose.runtime.Composer r29, int r30) {
                                /*
                                    Method dump skipped, instructions count: 364
                                    To view this dump add '--comments-level debug' option
                                */
                                throw new UnsupportedOperationException("Method not decompiled: androidx.compose.material3.FloatingActionButtonKt$ExtendedFloatingActionButton$3$1$1.invoke(androidx.compose.animation.AnimatedVisibilityScope, androidx.compose.runtime.Composer, int):void");
                            }
                        }, $composer4, 54), $composer4, ((((384 >> 6) & Property.BORDER_BOTTOM_RIGHT_RADIUS) | 6) & 14) | 1600512, 18);
                        ComposerKt.sourceInformationMarkerEnd($composer4);
                        ComposerKt.sourceInformationMarkerEnd($composer4);
                        $composer4.endNode();
                        ComposerKt.sourceInformationMarkerEnd($composer4);
                        ComposerKt.sourceInformationMarkerEnd($composer4);
                        ComposerKt.sourceInformationMarkerEnd($composer4);
                        if (ComposerKt.isTraceInProgress()) {
                            ComposerKt.traceEventEnd();
                            return;
                        }
                        return;
                    }
                    $composer4.skipToGroupEnd();
                }
            }, $composer3, 54), $composer2, (($dirty3 >> 6) & 14) | i2 | (($dirty3 >> 6) & Property.BORDER_BOTTOM_RIGHT_RADIUS) | (($dirty3 >> 9) & 896) | (($dirty3 >> 9) & 7168) | (($dirty3 >> 9) & 57344) | (($dirty3 >> 9) & 458752) | (3670016 & ($dirty3 >> 9)), 0);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            expanded3 = expanded2;
            modifier3 = modifier5;
            shape4 = shape3;
            containerColor5 = containerColor4;
            contentColor4 = contentColor3;
            elevation4 = elevation3;
            interactionSource3 = interactionSource2;
            $dirty2 = $dirty3;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.material3.FloatingActionButtonKt$ExtendedFloatingActionButton$4
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

                public final void invoke(Composer composer, int i11) {
                    FloatingActionButtonKt.m2173ExtendedFloatingActionButtonElI57k(function23, function22, function0, modifier3, expanded3, shape4, containerColor5, contentColor4, elevation4, interactionSource3, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), i);
                }
            });
        }
    }
}
