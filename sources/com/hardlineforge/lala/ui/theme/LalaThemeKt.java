package com.hardlineforge.lala.ui.theme;

import androidx.compose.foundation.shape.RoundedCornerShapeKt;
import androidx.compose.material3.ColorScheme;
import androidx.compose.material3.ColorSchemeKt;
import androidx.compose.material3.MaterialThemeKt;
import androidx.compose.material3.Shapes;
import androidx.compose.material3.Typography;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.compose.runtime.ScopeUpdateScope;
import androidx.compose.ui.graphics.Color;
import androidx.compose.ui.graphics.ColorKt;
import androidx.compose.ui.graphics.Shadow;
import androidx.compose.ui.graphics.drawscope.DrawStyle;
import androidx.compose.ui.text.PlatformTextStyle;
import androidx.compose.ui.text.TextStyle;
import androidx.compose.ui.text.font.FontFamily;
import androidx.compose.ui.text.font.FontStyle;
import androidx.compose.ui.text.font.FontSynthesis;
import androidx.compose.ui.text.font.FontWeight;
import androidx.compose.ui.text.font.SystemFontFamily;
import androidx.compose.ui.text.intl.LocaleList;
import androidx.compose.ui.text.style.BaselineShift;
import androidx.compose.ui.text.style.LineHeightStyle;
import androidx.compose.ui.text.style.TextDecoration;
import androidx.compose.ui.text.style.TextGeometricTransform;
import androidx.compose.ui.text.style.TextIndent;
import androidx.compose.ui.text.style.TextMotion;
import androidx.compose.ui.unit.Dp;
import androidx.compose.ui.unit.TextUnitKt;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: LalaTheme.kt */
@Metadata(d1 = {"\u00002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u001a*\u0010\u000e\u001a\u00020\u000f2\b\b\u0002\u0010\u0010\u001a\u00020\u00112\u0011\u0010\u0012\u001a\r\u0012\u0004\u0012\u00020\u000f0\u0013¢\u0006\u0002\b\u0014H\u0007¢\u0006\u0002\u0010\u0015\"\u0011\u0010\u0000\u001a\u00020\u0001¢\u0006\b\n\u0000\u001a\u0004\b\u0002\u0010\u0003\"\u0011\u0010\u0004\u001a\u00020\u0001¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0003\"\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\t\"\u0011\u0010\n\u001a\u00020\u000b¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0016"}, d2 = {"LalaLight", "Landroidx/compose/material3/ColorScheme;", "getLalaLight", "()Landroidx/compose/material3/ColorScheme;", "LalaDark", "getLalaDark", "LalaTypography", "Landroidx/compose/material3/Typography;", "getLalaTypography", "()Landroidx/compose/material3/Typography;", "LalaShapes", "Landroidx/compose/material3/Shapes;", "getLalaShapes", "()Landroidx/compose/material3/Shapes;", "LalaTheme", "", "darkTheme", "", "content", "Lkotlin/Function0;", "Landroidx/compose/runtime/Composable;", "(ZLkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;II)V", "app_debug"}, k = 2, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes6.dex */
public final class LalaThemeKt {
    private static final ColorScheme LalaDark;
    private static final ColorScheme LalaLight;
    private static final Shapes LalaShapes;
    private static final Typography LalaTypography;

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit LalaTheme$lambda$0(boolean z, Function2 function2, int i, int i2, Composer composer, int i3) {
        LalaTheme(z, function2, composer, RecomposeScopeImplKt.updateChangedFlags(i | 1), i2);
        return Unit.INSTANCE;
    }

    static {
        long Color = ColorKt.Color(4278221567L);
        long m4326getWhite0d7_KjU = Color.Companion.m4326getWhite0d7_KjU();
        long Color2 = ColorKt.Color(4283979478L);
        long Color3 = ColorKt.Color(4281648985L);
        long Color4 = ColorKt.Color(4294111991L);
        long Color5 = ColorKt.Color(4280032286L);
        LalaLight = ColorSchemeKt.m1985lightColorSchemeCXl9yA$default(Color, m4326getWhite0d7_KjU, 0L, 0L, 0L, Color2, 0L, 0L, 0L, Color3, 0L, 0L, 0L, ColorKt.Color(4294967295L), ColorKt.Color(4280032286L), Color4, Color5, ColorKt.Color(4293256682L), ColorKt.Color(4282006076L), 0L, 0L, 0L, ColorKt.Color(4294916912L), 0L, 0L, 0L, ColorKt.Color(4291282892L), 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, -71819812, 15, null);
        long Color6 = ColorKt.Color(4278879487L);
        long m4326getWhite0d7_KjU2 = Color.Companion.m4326getWhite0d7_KjU();
        long Color7 = ColorKt.Color(4284374246L);
        long Color8 = ColorKt.Color(4281389400L);
        long Color9 = ColorKt.Color(4280032286L);
        long Color10 = ColorKt.Color(4294967295L);
        LalaDark = ColorSchemeKt.m1981darkColorSchemeCXl9yA$default(Color6, m4326getWhite0d7_KjU2, 0L, 0L, 0L, Color7, 0L, 0L, 0L, Color8, 0L, 0L, 0L, ColorKt.Color(4278190080L), ColorKt.Color(4294967295L), Color9, Color10, ColorKt.Color(4281084974L), ColorKt.Color(4287532691L), 0L, 0L, 0L, ColorKt.Color(4294919482L), 0L, 0L, 0L, ColorKt.Color(4282927178L), 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, -71819812, 15, null);
        SystemFontFamily systemFontFamily = FontFamily.Companion.getDefault();
        TextStyle textStyle = new TextStyle(0L, TextUnitKt.getSp(32), FontWeight.Companion.getSemiBold(), (FontStyle) null, (FontSynthesis) null, systemFontFamily, (String) null, TextUnitKt.getSp(-0.5d), (BaselineShift) null, (TextGeometricTransform) null, (LocaleList) null, 0L, (TextDecoration) null, (Shadow) null, (DrawStyle) null, 0, 0, 0L, (TextIndent) null, (PlatformTextStyle) null, (LineHeightStyle) null, 0, 0, (TextMotion) null, 16777049, (DefaultConstructorMarker) null);
        SystemFontFamily systemFontFamily2 = FontFamily.Companion.getDefault();
        TextStyle textStyle2 = new TextStyle(0L, TextUnitKt.getSp(26), FontWeight.Companion.getSemiBold(), (FontStyle) null, (FontSynthesis) null, systemFontFamily2, (String) null, TextUnitKt.getSp(-0.5d), (BaselineShift) null, (TextGeometricTransform) null, (LocaleList) null, 0L, (TextDecoration) null, (Shadow) null, (DrawStyle) null, 0, 0, 0L, (TextIndent) null, (PlatformTextStyle) null, (LineHeightStyle) null, 0, 0, (TextMotion) null, 16777049, (DefaultConstructorMarker) null);
        SystemFontFamily systemFontFamily3 = FontFamily.Companion.getDefault();
        TextStyle textStyle3 = new TextStyle(0L, TextUnitKt.getSp(20), FontWeight.Companion.getSemiBold(), (FontStyle) null, (FontSynthesis) null, systemFontFamily3, (String) null, 0L, (BaselineShift) null, (TextGeometricTransform) null, (LocaleList) null, 0L, (TextDecoration) null, (Shadow) null, (DrawStyle) null, 0, 0, 0L, (TextIndent) null, (PlatformTextStyle) null, (LineHeightStyle) null, 0, 0, (TextMotion) null, 16777177, (DefaultConstructorMarker) null);
        SystemFontFamily systemFontFamily4 = FontFamily.Companion.getDefault();
        TextStyle textStyle4 = new TextStyle(0L, TextUnitKt.getSp(18), FontWeight.Companion.getSemiBold(), (FontStyle) null, (FontSynthesis) null, systemFontFamily4, (String) null, 0L, (BaselineShift) null, (TextGeometricTransform) null, (LocaleList) null, 0L, (TextDecoration) null, (Shadow) null, (DrawStyle) null, 0, 0, 0L, (TextIndent) null, (PlatformTextStyle) null, (LineHeightStyle) null, 0, 0, (TextMotion) null, 16777177, (DefaultConstructorMarker) null);
        SystemFontFamily systemFontFamily5 = FontFamily.Companion.getDefault();
        TextStyle textStyle5 = new TextStyle(0L, TextUnitKt.getSp(18), FontWeight.Companion.getMedium(), (FontStyle) null, (FontSynthesis) null, systemFontFamily5, (String) null, 0L, (BaselineShift) null, (TextGeometricTransform) null, (LocaleList) null, 0L, (TextDecoration) null, (Shadow) null, (DrawStyle) null, 0, 0, 0L, (TextIndent) null, (PlatformTextStyle) null, (LineHeightStyle) null, 0, 0, (TextMotion) null, 16777177, (DefaultConstructorMarker) null);
        SystemFontFamily systemFontFamily6 = FontFamily.Companion.getDefault();
        TextStyle textStyle6 = new TextStyle(0L, TextUnitKt.getSp(16), FontWeight.Companion.getMedium(), (FontStyle) null, (FontSynthesis) null, systemFontFamily6, (String) null, 0L, (BaselineShift) null, (TextGeometricTransform) null, (LocaleList) null, 0L, (TextDecoration) null, (Shadow) null, (DrawStyle) null, 0, 0, 0L, (TextIndent) null, (PlatformTextStyle) null, (LineHeightStyle) null, 0, 0, (TextMotion) null, 16777177, (DefaultConstructorMarker) null);
        SystemFontFamily systemFontFamily7 = FontFamily.Companion.getDefault();
        TextStyle textStyle7 = new TextStyle(0L, TextUnitKt.getSp(16), FontWeight.Companion.getNormal(), (FontStyle) null, (FontSynthesis) null, systemFontFamily7, (String) null, 0L, (BaselineShift) null, (TextGeometricTransform) null, (LocaleList) null, 0L, (TextDecoration) null, (Shadow) null, (DrawStyle) null, 0, 0, TextUnitKt.getSp(22), (TextIndent) null, (PlatformTextStyle) null, (LineHeightStyle) null, 0, 0, (TextMotion) null, 16646105, (DefaultConstructorMarker) null);
        SystemFontFamily systemFontFamily8 = FontFamily.Companion.getDefault();
        TextStyle textStyle8 = new TextStyle(0L, TextUnitKt.getSp(14), FontWeight.Companion.getNormal(), (FontStyle) null, (FontSynthesis) null, systemFontFamily8, (String) null, 0L, (BaselineShift) null, (TextGeometricTransform) null, (LocaleList) null, 0L, (TextDecoration) null, (Shadow) null, (DrawStyle) null, 0, 0, TextUnitKt.getSp(20), (TextIndent) null, (PlatformTextStyle) null, (LineHeightStyle) null, 0, 0, (TextMotion) null, 16646105, (DefaultConstructorMarker) null);
        SystemFontFamily systemFontFamily9 = FontFamily.Companion.getDefault();
        TextStyle textStyle9 = new TextStyle(0L, TextUnitKt.getSp(14), FontWeight.Companion.getMedium(), (FontStyle) null, (FontSynthesis) null, systemFontFamily9, (String) null, 0L, (BaselineShift) null, (TextGeometricTransform) null, (LocaleList) null, 0L, (TextDecoration) null, (Shadow) null, (DrawStyle) null, 0, 0, 0L, (TextIndent) null, (PlatformTextStyle) null, (LineHeightStyle) null, 0, 0, (TextMotion) null, 16777177, (DefaultConstructorMarker) null);
        SystemFontFamily systemFontFamily10 = FontFamily.Companion.getDefault();
        TextStyle textStyle10 = new TextStyle(0L, TextUnitKt.getSp(12), FontWeight.Companion.getMedium(), (FontStyle) null, (FontSynthesis) null, systemFontFamily10, (String) null, 0L, (BaselineShift) null, (TextGeometricTransform) null, (LocaleList) null, 0L, (TextDecoration) null, (Shadow) null, (DrawStyle) null, 0, 0, 0L, (TextIndent) null, (PlatformTextStyle) null, (LineHeightStyle) null, 0, 0, (TextMotion) null, 16777177, (DefaultConstructorMarker) null);
        SystemFontFamily systemFontFamily11 = FontFamily.Companion.getDefault();
        LalaTypography = new Typography(textStyle, textStyle2, null, textStyle3, textStyle4, null, textStyle5, textStyle6, null, textStyle7, textStyle8, null, textStyle9, textStyle10, new TextStyle(0L, TextUnitKt.getSp(10), FontWeight.Companion.getMedium(), (FontStyle) null, (FontSynthesis) null, systemFontFamily11, (String) null, 0L, (BaselineShift) null, (TextGeometricTransform) null, (LocaleList) null, 0L, (TextDecoration) null, (Shadow) null, (DrawStyle) null, 0, 0, 0L, (TextIndent) null, (PlatformTextStyle) null, (LineHeightStyle) null, 0, 0, (TextMotion) null, 16777177, (DefaultConstructorMarker) null), 2340, null);
        LalaShapes = new Shapes(null, RoundedCornerShapeKt.m1286RoundedCornerShape0680j_4(Dp.m6873constructorimpl(8)), RoundedCornerShapeKt.m1286RoundedCornerShape0680j_4(Dp.m6873constructorimpl(12)), RoundedCornerShapeKt.m1286RoundedCornerShape0680j_4(Dp.m6873constructorimpl(16)), null, 17, null);
    }

    public static final ColorScheme getLalaLight() {
        return LalaLight;
    }

    public static final ColorScheme getLalaDark() {
        return LalaDark;
    }

    public static final Typography getLalaTypography() {
        return LalaTypography;
    }

    public static final Shapes getLalaShapes() {
        return LalaShapes;
    }

    public static final void LalaTheme(final boolean darkTheme, Function2<? super Composer, ? super Integer, Unit> content, Composer $composer, final int $changed, final int i) {
        final Function2 content2;
        Intrinsics.checkNotNullParameter(content, "content");
        Composer $composer2 = $composer.startRestartGroup(65261575);
        ComposerKt.sourceInformation($composer2, "C(LalaTheme)P(1)68@3146L174:LalaTheme.kt#ha6g5c");
        int $dirty = $changed;
        int i2 = i & 1;
        if (i2 != 0) {
            $dirty |= 6;
        } else if (($changed & 6) == 0) {
            $dirty |= $composer2.changed(darkTheme) ? 4 : 2;
        }
        if (($changed & 48) == 0) {
            $dirty |= $composer2.changedInstance(content) ? 32 : 16;
        }
        if (!$composer2.shouldExecute(($dirty & 19) != 18, $dirty & 1)) {
            content2 = content;
            $composer2.skipToGroupEnd();
        } else {
            if (i2 != 0) {
                darkTheme = false;
            }
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(65261575, $dirty, -1, "com.hardlineforge.lala.ui.theme.LalaTheme (LalaTheme.kt:67)");
            }
            content2 = content;
            MaterialThemeKt.MaterialTheme(darkTheme ? LalaDark : LalaLight, LalaShapes, LalaTypography, content2, $composer2, (($dirty << 6) & 7168) | 432, 0);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2() { // from class: com.hardlineforge.lala.ui.theme.LalaThemeKt$$ExternalSyntheticLambda0
                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(Object obj, Object obj2) {
                    return LalaThemeKt.LalaTheme$lambda$0(darkTheme, content2, $changed, i, (Composer) obj, ((Integer) obj2).intValue());
                }
            });
        }
    }
}
