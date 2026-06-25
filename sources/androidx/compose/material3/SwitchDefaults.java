package androidx.compose.material3;

import androidx.compose.material3.tokens.SwitchTokens;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.ui.graphics.Color;
import androidx.compose.ui.graphics.ColorKt;
import androidx.compose.ui.unit.Dp;
import kotlin.Metadata;
/* compiled from: Switch.kt */
@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0012\bÇ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\r\u0010\r\u001a\u00020\tH\u0007¢\u0006\u0002\u0010\u000eJ²\u0001\u0010\r\u001a\u00020\t2\b\b\u0002\u0010\u000f\u001a\u00020\u00102\b\b\u0002\u0010\u0011\u001a\u00020\u00102\b\b\u0002\u0010\u0012\u001a\u00020\u00102\b\b\u0002\u0010\u0013\u001a\u00020\u00102\b\b\u0002\u0010\u0014\u001a\u00020\u00102\b\b\u0002\u0010\u0015\u001a\u00020\u00102\b\b\u0002\u0010\u0016\u001a\u00020\u00102\b\b\u0002\u0010\u0017\u001a\u00020\u00102\b\b\u0002\u0010\u0018\u001a\u00020\u00102\b\b\u0002\u0010\u0019\u001a\u00020\u00102\b\b\u0002\u0010\u001a\u001a\u00020\u00102\b\b\u0002\u0010\u001b\u001a\u00020\u00102\b\b\u0002\u0010\u001c\u001a\u00020\u00102\b\b\u0002\u0010\u001d\u001a\u00020\u00102\b\b\u0002\u0010\u001e\u001a\u00020\u00102\b\b\u0002\u0010\u001f\u001a\u00020\u0010H\u0007ø\u0001\u0000¢\u0006\u0004\b \u0010!R\u0019\u0010\u0003\u001a\u00020\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\n\n\u0002\u0010\u0007\u001a\u0004\b\u0005\u0010\u0006R\u0018\u0010\b\u001a\u00020\t*\u00020\n8@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b\u000b\u0010\f\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006\""}, d2 = {"Landroidx/compose/material3/SwitchDefaults;", "", "()V", "IconSize", "Landroidx/compose/ui/unit/Dp;", "getIconSize-D9Ej5fM", "()F", "F", "defaultSwitchColors", "Landroidx/compose/material3/SwitchColors;", "Landroidx/compose/material3/ColorScheme;", "getDefaultSwitchColors$material3_release", "(Landroidx/compose/material3/ColorScheme;)Landroidx/compose/material3/SwitchColors;", "colors", "(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/SwitchColors;", "checkedThumbColor", "Landroidx/compose/ui/graphics/Color;", "checkedTrackColor", "checkedBorderColor", "checkedIconColor", "uncheckedThumbColor", "uncheckedTrackColor", "uncheckedBorderColor", "uncheckedIconColor", "disabledCheckedThumbColor", "disabledCheckedTrackColor", "disabledCheckedBorderColor", "disabledCheckedIconColor", "disabledUncheckedThumbColor", "disabledUncheckedTrackColor", "disabledUncheckedBorderColor", "disabledUncheckedIconColor", "colors-V1nXRL4", "(JJJJJJJJJJJJJJJJLandroidx/compose/runtime/Composer;III)Landroidx/compose/material3/SwitchColors;", "material3_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class SwitchDefaults {
    public static final int $stable = 0;
    public static final SwitchDefaults INSTANCE = new SwitchDefaults();
    private static final float IconSize = Dp.m6873constructorimpl(16);

    private SwitchDefaults() {
    }

    public final SwitchColors colors(Composer $composer, int $changed) {
        ComposerKt.sourceInformationMarkerStart($composer, 435552781, "C(colors)299@11393L11:Switch.kt#uh7d8r");
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(435552781, $changed, -1, "androidx.compose.material3.SwitchDefaults.colors (Switch.kt:299)");
        }
        SwitchColors defaultSwitchColors$material3_release = getDefaultSwitchColors$material3_release(MaterialTheme.INSTANCE.getColorScheme($composer, 6));
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        ComposerKt.sourceInformationMarkerEnd($composer);
        return defaultSwitchColors$material3_release;
    }

    /* renamed from: colors-V1nXRL4  reason: not valid java name */
    public final SwitchColors m2625colorsV1nXRL4(long checkedThumbColor, long checkedTrackColor, long checkedBorderColor, long checkedIconColor, long uncheckedThumbColor, long uncheckedTrackColor, long uncheckedBorderColor, long uncheckedIconColor, long disabledCheckedThumbColor, long disabledCheckedTrackColor, long disabledCheckedBorderColor, long disabledCheckedIconColor, long disabledUncheckedThumbColor, long disabledUncheckedTrackColor, long disabledUncheckedBorderColor, long disabledUncheckedIconColor, Composer $composer, int $changed, int $changed1, int i) {
        long disabledCheckedThumbColor2;
        long disabledCheckedTrackColor2;
        long disabledCheckedIconColor2;
        long disabledUncheckedThumbColor2;
        long disabledUncheckedTrackColor2;
        long disabledUncheckedBorderColor2;
        long disabledUncheckedIconColor2;
        long m4287copywmQWz5c;
        long m4287copywmQWz5c2;
        long m4287copywmQWz5c3;
        long m4287copywmQWz5c4;
        long m4287copywmQWz5c5;
        long m4287copywmQWz5c6;
        long m4287copywmQWz5c7;
        ComposerKt.sourceInformationMarkerStart($composer, 1937926421, "C(colors)P(2:c#ui.graphics.Color,3:c#ui.graphics.Color,0:c#ui.graphics.Color,1:c#ui.graphics.Color,14:c#ui.graphics.Color,15:c#ui.graphics.Color,12:c#ui.graphics.Color,13:c#ui.graphics.Color,6:c#ui.graphics.Color,7:c#ui.graphics.Color,4:c#ui.graphics.Color,5:c#ui.graphics.Color,10:c#ui.graphics.Color,11:c#ui.graphics.Color,8:c#ui.graphics.Color,9:c#ui.graphics.Color)324@13145L5,325@13219L5,327@13346L5,328@13425L5,329@13503L5,330@13594L5,331@13670L5,333@13773L5,335@13898L11,337@14015L5,339@14131L11,342@14309L5,344@14432L11,346@14554L5,348@14681L11,350@14802L5,352@14918L11,354@15047L5,356@15163L11,358@15282L5,360@15407L11:Switch.kt#uh7d8r");
        long checkedThumbColor2 = (i & 1) != 0 ? ColorSchemeKt.getValue(SwitchTokens.INSTANCE.getSelectedHandleColor(), $composer, 6) : checkedThumbColor;
        long checkedTrackColor2 = (i & 2) != 0 ? ColorSchemeKt.getValue(SwitchTokens.INSTANCE.getSelectedTrackColor(), $composer, 6) : checkedTrackColor;
        long checkedBorderColor2 = (i & 4) != 0 ? Color.Companion.m4324getTransparent0d7_KjU() : checkedBorderColor;
        long checkedIconColor2 = (i & 8) != 0 ? ColorSchemeKt.getValue(SwitchTokens.INSTANCE.getSelectedIconColor(), $composer, 6) : checkedIconColor;
        long uncheckedThumbColor2 = (i & 16) != 0 ? ColorSchemeKt.getValue(SwitchTokens.INSTANCE.getUnselectedHandleColor(), $composer, 6) : uncheckedThumbColor;
        long uncheckedTrackColor2 = (i & 32) != 0 ? ColorSchemeKt.getValue(SwitchTokens.INSTANCE.getUnselectedTrackColor(), $composer, 6) : uncheckedTrackColor;
        long uncheckedBorderColor2 = (i & 64) != 0 ? ColorSchemeKt.getValue(SwitchTokens.INSTANCE.getUnselectedFocusTrackOutlineColor(), $composer, 6) : uncheckedBorderColor;
        long uncheckedIconColor2 = (i & 128) != 0 ? ColorSchemeKt.getValue(SwitchTokens.INSTANCE.getUnselectedIconColor(), $composer, 6) : uncheckedIconColor;
        if ((i & 256) != 0) {
            m4287copywmQWz5c7 = Color.m4287copywmQWz5c(r5, (r12 & 1) != 0 ? Color.m4291getAlphaimpl(r5) : SwitchTokens.INSTANCE.getDisabledSelectedHandleOpacity(), (r12 & 2) != 0 ? Color.m4295getRedimpl(r5) : 0.0f, (r12 & 4) != 0 ? Color.m4294getGreenimpl(r5) : 0.0f, (r12 & 8) != 0 ? Color.m4292getBlueimpl(ColorSchemeKt.getValue(SwitchTokens.INSTANCE.getDisabledSelectedHandleColor(), $composer, 6)) : 0.0f);
            disabledCheckedThumbColor2 = ColorKt.m4334compositeOverOWjLjI(m4287copywmQWz5c7, MaterialTheme.INSTANCE.getColorScheme($composer, 6).m1965getSurface0d7_KjU());
        } else {
            disabledCheckedThumbColor2 = disabledCheckedThumbColor;
        }
        if ((i & 512) != 0) {
            m4287copywmQWz5c6 = Color.m4287copywmQWz5c(r2, (r12 & 1) != 0 ? Color.m4291getAlphaimpl(r2) : SwitchTokens.INSTANCE.getDisabledTrackOpacity(), (r12 & 2) != 0 ? Color.m4295getRedimpl(r2) : 0.0f, (r12 & 4) != 0 ? Color.m4294getGreenimpl(r2) : 0.0f, (r12 & 8) != 0 ? Color.m4292getBlueimpl(ColorSchemeKt.getValue(SwitchTokens.INSTANCE.getDisabledSelectedTrackColor(), $composer, 6)) : 0.0f);
            disabledCheckedTrackColor2 = ColorKt.m4334compositeOverOWjLjI(m4287copywmQWz5c6, MaterialTheme.INSTANCE.getColorScheme($composer, 6).m1965getSurface0d7_KjU());
        } else {
            disabledCheckedTrackColor2 = disabledCheckedTrackColor;
        }
        long disabledCheckedBorderColor2 = (i & 1024) != 0 ? Color.Companion.m4324getTransparent0d7_KjU() : disabledCheckedBorderColor;
        if ((i & 2048) != 0) {
            m4287copywmQWz5c5 = Color.m4287copywmQWz5c(r2, (r12 & 1) != 0 ? Color.m4291getAlphaimpl(r2) : SwitchTokens.INSTANCE.getDisabledSelectedIconOpacity(), (r12 & 2) != 0 ? Color.m4295getRedimpl(r2) : 0.0f, (r12 & 4) != 0 ? Color.m4294getGreenimpl(r2) : 0.0f, (r12 & 8) != 0 ? Color.m4292getBlueimpl(ColorSchemeKt.getValue(SwitchTokens.INSTANCE.getDisabledSelectedIconColor(), $composer, 6)) : 0.0f);
            disabledCheckedIconColor2 = ColorKt.m4334compositeOverOWjLjI(m4287copywmQWz5c5, MaterialTheme.INSTANCE.getColorScheme($composer, 6).m1965getSurface0d7_KjU());
        } else {
            disabledCheckedIconColor2 = disabledCheckedIconColor;
        }
        if ((i & 4096) != 0) {
            m4287copywmQWz5c4 = Color.m4287copywmQWz5c(r2, (r12 & 1) != 0 ? Color.m4291getAlphaimpl(r2) : SwitchTokens.INSTANCE.getDisabledUnselectedHandleOpacity(), (r12 & 2) != 0 ? Color.m4295getRedimpl(r2) : 0.0f, (r12 & 4) != 0 ? Color.m4294getGreenimpl(r2) : 0.0f, (r12 & 8) != 0 ? Color.m4292getBlueimpl(ColorSchemeKt.getValue(SwitchTokens.INSTANCE.getDisabledUnselectedHandleColor(), $composer, 6)) : 0.0f);
            disabledUncheckedThumbColor2 = ColorKt.m4334compositeOverOWjLjI(m4287copywmQWz5c4, MaterialTheme.INSTANCE.getColorScheme($composer, 6).m1965getSurface0d7_KjU());
        } else {
            disabledUncheckedThumbColor2 = disabledUncheckedThumbColor;
        }
        if ((i & 8192) != 0) {
            m4287copywmQWz5c3 = Color.m4287copywmQWz5c(r2, (r12 & 1) != 0 ? Color.m4291getAlphaimpl(r2) : SwitchTokens.INSTANCE.getDisabledTrackOpacity(), (r12 & 2) != 0 ? Color.m4295getRedimpl(r2) : 0.0f, (r12 & 4) != 0 ? Color.m4294getGreenimpl(r2) : 0.0f, (r12 & 8) != 0 ? Color.m4292getBlueimpl(ColorSchemeKt.getValue(SwitchTokens.INSTANCE.getDisabledUnselectedTrackColor(), $composer, 6)) : 0.0f);
            disabledUncheckedTrackColor2 = ColorKt.m4334compositeOverOWjLjI(m4287copywmQWz5c3, MaterialTheme.INSTANCE.getColorScheme($composer, 6).m1965getSurface0d7_KjU());
        } else {
            disabledUncheckedTrackColor2 = disabledUncheckedTrackColor;
        }
        if ((i & 16384) != 0) {
            m4287copywmQWz5c2 = Color.m4287copywmQWz5c(r2, (r12 & 1) != 0 ? Color.m4291getAlphaimpl(r2) : SwitchTokens.INSTANCE.getDisabledTrackOpacity(), (r12 & 2) != 0 ? Color.m4295getRedimpl(r2) : 0.0f, (r12 & 4) != 0 ? Color.m4294getGreenimpl(r2) : 0.0f, (r12 & 8) != 0 ? Color.m4292getBlueimpl(ColorSchemeKt.getValue(SwitchTokens.INSTANCE.getDisabledUnselectedTrackOutlineColor(), $composer, 6)) : 0.0f);
            disabledUncheckedBorderColor2 = ColorKt.m4334compositeOverOWjLjI(m4287copywmQWz5c2, MaterialTheme.INSTANCE.getColorScheme($composer, 6).m1965getSurface0d7_KjU());
        } else {
            disabledUncheckedBorderColor2 = disabledUncheckedBorderColor;
        }
        if ((i & 32768) != 0) {
            m4287copywmQWz5c = Color.m4287copywmQWz5c(r1, (r12 & 1) != 0 ? Color.m4291getAlphaimpl(r1) : SwitchTokens.INSTANCE.getDisabledUnselectedIconOpacity(), (r12 & 2) != 0 ? Color.m4295getRedimpl(r1) : 0.0f, (r12 & 4) != 0 ? Color.m4294getGreenimpl(r1) : 0.0f, (r12 & 8) != 0 ? Color.m4292getBlueimpl(ColorSchemeKt.getValue(SwitchTokens.INSTANCE.getDisabledUnselectedIconColor(), $composer, 6)) : 0.0f);
            disabledUncheckedIconColor2 = ColorKt.m4334compositeOverOWjLjI(m4287copywmQWz5c, MaterialTheme.INSTANCE.getColorScheme($composer, 6).m1965getSurface0d7_KjU());
        } else {
            disabledUncheckedIconColor2 = disabledUncheckedIconColor;
        }
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(1937926421, $changed, $changed1, "androidx.compose.material3.SwitchDefaults.colors (Switch.kt:362)");
        }
        SwitchColors switchColors = new SwitchColors(checkedThumbColor2, checkedTrackColor2, checkedBorderColor2, checkedIconColor2, uncheckedThumbColor2, uncheckedTrackColor2, uncheckedBorderColor2, uncheckedIconColor2, disabledCheckedThumbColor2, disabledCheckedTrackColor2, disabledCheckedBorderColor2, disabledCheckedIconColor2, disabledUncheckedThumbColor2, disabledUncheckedTrackColor2, disabledUncheckedBorderColor2, disabledUncheckedIconColor2, null);
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        ComposerKt.sourceInformationMarkerEnd($composer);
        return switchColors;
    }

    public final SwitchColors getDefaultSwitchColors$material3_release(ColorScheme $this$defaultSwitchColors) {
        long m4287copywmQWz5c;
        long m4287copywmQWz5c2;
        long m4287copywmQWz5c3;
        long m4287copywmQWz5c4;
        long m4287copywmQWz5c5;
        long m4287copywmQWz5c6;
        long m4287copywmQWz5c7;
        SwitchColors it = $this$defaultSwitchColors.getDefaultSwitchColorsCached$material3_release();
        if (it == null) {
            long fromToken = ColorSchemeKt.fromToken($this$defaultSwitchColors, SwitchTokens.INSTANCE.getSelectedHandleColor());
            long fromToken2 = ColorSchemeKt.fromToken($this$defaultSwitchColors, SwitchTokens.INSTANCE.getSelectedTrackColor());
            long m4324getTransparent0d7_KjU = Color.Companion.m4324getTransparent0d7_KjU();
            long fromToken3 = ColorSchemeKt.fromToken($this$defaultSwitchColors, SwitchTokens.INSTANCE.getSelectedIconColor());
            long fromToken4 = ColorSchemeKt.fromToken($this$defaultSwitchColors, SwitchTokens.INSTANCE.getUnselectedHandleColor());
            long fromToken5 = ColorSchemeKt.fromToken($this$defaultSwitchColors, SwitchTokens.INSTANCE.getUnselectedTrackColor());
            long fromToken6 = ColorSchemeKt.fromToken($this$defaultSwitchColors, SwitchTokens.INSTANCE.getUnselectedFocusTrackOutlineColor());
            long fromToken7 = ColorSchemeKt.fromToken($this$defaultSwitchColors, SwitchTokens.INSTANCE.getUnselectedIconColor());
            m4287copywmQWz5c = Color.m4287copywmQWz5c(r19, (r12 & 1) != 0 ? Color.m4291getAlphaimpl(r19) : SwitchTokens.INSTANCE.getDisabledSelectedHandleOpacity(), (r12 & 2) != 0 ? Color.m4295getRedimpl(r19) : 0.0f, (r12 & 4) != 0 ? Color.m4294getGreenimpl(r19) : 0.0f, (r12 & 8) != 0 ? Color.m4292getBlueimpl(ColorSchemeKt.fromToken($this$defaultSwitchColors, SwitchTokens.INSTANCE.getDisabledSelectedHandleColor())) : 0.0f);
            long m4334compositeOverOWjLjI = ColorKt.m4334compositeOverOWjLjI(m4287copywmQWz5c, $this$defaultSwitchColors.m1965getSurface0d7_KjU());
            m4287copywmQWz5c2 = Color.m4287copywmQWz5c(r28, (r12 & 1) != 0 ? Color.m4291getAlphaimpl(r28) : SwitchTokens.INSTANCE.getDisabledTrackOpacity(), (r12 & 2) != 0 ? Color.m4295getRedimpl(r28) : 0.0f, (r12 & 4) != 0 ? Color.m4294getGreenimpl(r28) : 0.0f, (r12 & 8) != 0 ? Color.m4292getBlueimpl(ColorSchemeKt.fromToken($this$defaultSwitchColors, SwitchTokens.INSTANCE.getDisabledSelectedTrackColor())) : 0.0f);
            long m4334compositeOverOWjLjI2 = ColorKt.m4334compositeOverOWjLjI(m4287copywmQWz5c2, $this$defaultSwitchColors.m1965getSurface0d7_KjU());
            long m4324getTransparent0d7_KjU2 = Color.Companion.m4324getTransparent0d7_KjU();
            m4287copywmQWz5c3 = Color.m4287copywmQWz5c(r28, (r12 & 1) != 0 ? Color.m4291getAlphaimpl(r28) : SwitchTokens.INSTANCE.getDisabledSelectedIconOpacity(), (r12 & 2) != 0 ? Color.m4295getRedimpl(r28) : 0.0f, (r12 & 4) != 0 ? Color.m4294getGreenimpl(r28) : 0.0f, (r12 & 8) != 0 ? Color.m4292getBlueimpl(ColorSchemeKt.fromToken($this$defaultSwitchColors, SwitchTokens.INSTANCE.getDisabledSelectedIconColor())) : 0.0f);
            long m4334compositeOverOWjLjI3 = ColorKt.m4334compositeOverOWjLjI(m4287copywmQWz5c3, $this$defaultSwitchColors.m1965getSurface0d7_KjU());
            m4287copywmQWz5c4 = Color.m4287copywmQWz5c(r28, (r12 & 1) != 0 ? Color.m4291getAlphaimpl(r28) : SwitchTokens.INSTANCE.getDisabledUnselectedHandleOpacity(), (r12 & 2) != 0 ? Color.m4295getRedimpl(r28) : 0.0f, (r12 & 4) != 0 ? Color.m4294getGreenimpl(r28) : 0.0f, (r12 & 8) != 0 ? Color.m4292getBlueimpl(ColorSchemeKt.fromToken($this$defaultSwitchColors, SwitchTokens.INSTANCE.getDisabledUnselectedHandleColor())) : 0.0f);
            long m4334compositeOverOWjLjI4 = ColorKt.m4334compositeOverOWjLjI(m4287copywmQWz5c4, $this$defaultSwitchColors.m1965getSurface0d7_KjU());
            m4287copywmQWz5c5 = Color.m4287copywmQWz5c(r30, (r12 & 1) != 0 ? Color.m4291getAlphaimpl(r30) : SwitchTokens.INSTANCE.getDisabledTrackOpacity(), (r12 & 2) != 0 ? Color.m4295getRedimpl(r30) : 0.0f, (r12 & 4) != 0 ? Color.m4294getGreenimpl(r30) : 0.0f, (r12 & 8) != 0 ? Color.m4292getBlueimpl(ColorSchemeKt.fromToken($this$defaultSwitchColors, SwitchTokens.INSTANCE.getDisabledUnselectedTrackColor())) : 0.0f);
            long m4334compositeOverOWjLjI5 = ColorKt.m4334compositeOverOWjLjI(m4287copywmQWz5c5, $this$defaultSwitchColors.m1965getSurface0d7_KjU());
            m4287copywmQWz5c6 = Color.m4287copywmQWz5c(r32, (r12 & 1) != 0 ? Color.m4291getAlphaimpl(r32) : SwitchTokens.INSTANCE.getDisabledTrackOpacity(), (r12 & 2) != 0 ? Color.m4295getRedimpl(r32) : 0.0f, (r12 & 4) != 0 ? Color.m4294getGreenimpl(r32) : 0.0f, (r12 & 8) != 0 ? Color.m4292getBlueimpl(ColorSchemeKt.fromToken($this$defaultSwitchColors, SwitchTokens.INSTANCE.getDisabledUnselectedTrackOutlineColor())) : 0.0f);
            long m4334compositeOverOWjLjI6 = ColorKt.m4334compositeOverOWjLjI(m4287copywmQWz5c6, $this$defaultSwitchColors.m1965getSurface0d7_KjU());
            m4287copywmQWz5c7 = Color.m4287copywmQWz5c(r34, (r12 & 1) != 0 ? Color.m4291getAlphaimpl(r34) : SwitchTokens.INSTANCE.getDisabledUnselectedIconOpacity(), (r12 & 2) != 0 ? Color.m4295getRedimpl(r34) : 0.0f, (r12 & 4) != 0 ? Color.m4294getGreenimpl(r34) : 0.0f, (r12 & 8) != 0 ? Color.m4292getBlueimpl(ColorSchemeKt.fromToken($this$defaultSwitchColors, SwitchTokens.INSTANCE.getDisabledUnselectedIconColor())) : 0.0f);
            SwitchColors it2 = new SwitchColors(fromToken, fromToken2, m4324getTransparent0d7_KjU, fromToken3, fromToken4, fromToken5, fromToken6, fromToken7, m4334compositeOverOWjLjI, m4334compositeOverOWjLjI2, m4324getTransparent0d7_KjU2, m4334compositeOverOWjLjI3, m4334compositeOverOWjLjI4, m4334compositeOverOWjLjI5, m4334compositeOverOWjLjI6, ColorKt.m4334compositeOverOWjLjI(m4287copywmQWz5c7, $this$defaultSwitchColors.m1965getSurface0d7_KjU()), null);
            $this$defaultSwitchColors.setDefaultSwitchColorsCached$material3_release(it2);
            return it2;
        }
        return it;
    }

    /* renamed from: getIconSize-D9Ej5fM  reason: not valid java name */
    public final float m2626getIconSizeD9Ej5fM() {
        return IconSize;
    }
}
