package androidx.compose.material3;

import android.content.Context;
import android.os.Build;
import androidx.compose.ui.graphics.Color;
import androidx.compose.ui.graphics.ColorKt;
import androidx.compose.ui.graphics.colorspace.ColorSpaces;
import androidx.core.math.MathUtils;
import kotlin.Metadata;
import kotlin.math.MathKt;
/* compiled from: DynamicTonalPalette.android.kt */
@Metadata(d1 = {"\u0000,\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0004\u001a\u0010\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\u0002\u001a\u0010\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0007\u001a\u0010\u0010\b\u001a\u00020\u00052\u0006\u0010\t\u001a\u00020\nH\u0001\u001a\u0010\u0010\u000b\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0001\u001a\u0010\u0010\f\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0007\u001a\u0010\u0010\r\u001a\u00020\u00052\u0006\u0010\t\u001a\u00020\nH\u0001\u001a\u0010\u0010\u000e\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0001\u001a\u0010\u0010\u000f\u001a\u00020\n2\u0006\u0010\u0006\u001a\u00020\u0007H\u0001\u001a\u0010\u0010\u0010\u001a\u00020\u00032\u0006\u0010\u0011\u001a\u00020\u0003H\u0002\u001a \u0010\u0012\u001a\u00020\u0013*\u00020\u00132\b\b\u0001\u0010\u0014\u001a\u00020\u0003H\u0000ø\u0001\u0000¢\u0006\u0004\b\u0015\u0010\u0016\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006\u0017"}, d2 = {"delinearized", "", "rgbComponent", "", "dynamicDarkColorScheme", "Landroidx/compose/material3/ColorScheme;", "context", "Landroid/content/Context;", "dynamicDarkColorScheme31", "tonalPalette", "Landroidx/compose/material3/TonalPalette;", "dynamicDarkColorScheme34", "dynamicLightColorScheme", "dynamicLightColorScheme31", "dynamicLightColorScheme34", "dynamicTonalPalette", "labInvf", "ft", "setLuminance", "Landroidx/compose/ui/graphics/Color;", "newLuminance", "setLuminance-DxMtmZc", "(JF)J", "material3_release"}, k = 2, mv = {1, 8, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class DynamicTonalPaletteKt {
    public static final TonalPalette dynamicTonalPalette(Context context) {
        return new TonalPalette(ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170461), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170462), m2128setLuminanceDxMtmZc(ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170469), 98.0f), m2128setLuminanceDxMtmZc(ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170469), 96.0f), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170463), m2128setLuminanceDxMtmZc(ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170469), 94.0f), m2128setLuminanceDxMtmZc(ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170469), 92.0f), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170464), m2128setLuminanceDxMtmZc(ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170469), 87.0f), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170465), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170466), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170467), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170468), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170469), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170470), m2128setLuminanceDxMtmZc(ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170469), 24.0f), m2128setLuminanceDxMtmZc(ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170469), 22.0f), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170471), m2128setLuminanceDxMtmZc(ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170469), 17.0f), m2128setLuminanceDxMtmZc(ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170469), 12.0f), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170472), m2128setLuminanceDxMtmZc(ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170469), 6.0f), m2128setLuminanceDxMtmZc(ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170469), 4.0f), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170473), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170474), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170475), m2128setLuminanceDxMtmZc(ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170482), 98.0f), m2128setLuminanceDxMtmZc(ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170482), 96.0f), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170476), m2128setLuminanceDxMtmZc(ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170482), 94.0f), m2128setLuminanceDxMtmZc(ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170482), 92.0f), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170477), m2128setLuminanceDxMtmZc(ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170482), 87.0f), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170478), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170479), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170480), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170481), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170482), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170483), m2128setLuminanceDxMtmZc(ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170482), 24.0f), m2128setLuminanceDxMtmZc(ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170482), 22.0f), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170484), m2128setLuminanceDxMtmZc(ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170482), 17.0f), m2128setLuminanceDxMtmZc(ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170482), 12.0f), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170485), m2128setLuminanceDxMtmZc(ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170482), 6.0f), m2128setLuminanceDxMtmZc(ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170482), 4.0f), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170486), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170487), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170488), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170489), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170490), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170491), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170492), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170493), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170494), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170495), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170496), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170497), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170498), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170499), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170500), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170501), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170502), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170503), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170504), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170505), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170506), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170507), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170508), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170509), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170510), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170511), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170512), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170513), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170514), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170515), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170516), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170517), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170518), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170519), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170520), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170521), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170522), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170523), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170524), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170525), null);
    }

    public static final ColorScheme dynamicLightColorScheme(Context context) {
        if (Build.VERSION.SDK_INT >= 34) {
            return dynamicLightColorScheme34(context);
        }
        TonalPalette tonalPalette = dynamicTonalPalette(context);
        return dynamicLightColorScheme31(tonalPalette);
    }

    public static final ColorScheme dynamicDarkColorScheme(Context context) {
        if (Build.VERSION.SDK_INT >= 34) {
            return dynamicDarkColorScheme34(context);
        }
        TonalPalette tonalPalette = dynamicTonalPalette(context);
        return dynamicDarkColorScheme31(tonalPalette);
    }

    /* renamed from: setLuminance-DxMtmZc  reason: not valid java name */
    public static final long m2128setLuminanceDxMtmZc(long $this$setLuminance_u2dDxMtmZc, float newLuminance) {
        if ((((double) newLuminance) < 1.0E-4d) | (((double) newLuminance) > 99.9999d)) {
            float y = 100.0f * labInvf((16.0f + newLuminance) / 116.0f);
            int component = delinearized(y);
            return ColorKt.Color$default(component, component, component, 0, 8, null);
        }
        long sLAB = Color.m4286convertvNxB06k($this$setLuminance_u2dDxMtmZc, ColorSpaces.INSTANCE.getCieLab());
        return Color.m4286convertvNxB06k(ColorKt.Color$default(newLuminance, Color.m4294getGreenimpl(sLAB), Color.m4292getBlueimpl(sLAB), 0.0f, ColorSpaces.INSTANCE.getCieLab(), 8, null), ColorSpaces.INSTANCE.getSrgb());
    }

    private static final float labInvf(float ft) {
        float ft3 = ft * ft * ft;
        if (ft3 <= 0.008856452f) {
            return ((116.0f * ft) - 16.0f) / 903.2963f;
        }
        return ft3;
    }

    private static final int delinearized(float rgbComponent) {
        double delinearized;
        float normalized = rgbComponent / 100.0f;
        if (normalized <= 0.0031308d) {
            delinearized = normalized * 12.92d;
        } else {
            delinearized = (Math.pow(normalized, 0.4166666666666667d) * 1.055d) - 0.055d;
        }
        return MathUtils.clamp(MathKt.roundToInt(255.0d * delinearized), 0, 255);
    }

    public static final ColorScheme dynamicLightColorScheme31(TonalPalette tonalPalette) {
        long m2856getPrimary400d7_KjU = tonalPalette.m2856getPrimary400d7_KjU();
        long m2853getPrimary1000d7_KjU = tonalPalette.m2853getPrimary1000d7_KjU();
        long m2861getPrimary900d7_KjU = tonalPalette.m2861getPrimary900d7_KjU();
        long m2852getPrimary100d7_KjU = tonalPalette.m2852getPrimary100d7_KjU();
        long m2860getPrimary800d7_KjU = tonalPalette.m2860getPrimary800d7_KjU();
        long m2869getSecondary400d7_KjU = tonalPalette.m2869getSecondary400d7_KjU();
        long m2866getSecondary1000d7_KjU = tonalPalette.m2866getSecondary1000d7_KjU();
        long m2874getSecondary900d7_KjU = tonalPalette.m2874getSecondary900d7_KjU();
        long m2865getSecondary100d7_KjU = tonalPalette.m2865getSecondary100d7_KjU();
        long m2882getTertiary400d7_KjU = tonalPalette.m2882getTertiary400d7_KjU();
        long m2879getTertiary1000d7_KjU = tonalPalette.m2879getTertiary1000d7_KjU();
        long m2887getTertiary900d7_KjU = tonalPalette.m2887getTertiary900d7_KjU();
        long m2878getTertiary100d7_KjU = tonalPalette.m2878getTertiary100d7_KjU();
        long m2849getNeutralVariant980d7_KjU = tonalPalette.m2849getNeutralVariant980d7_KjU();
        long m2828getNeutralVariant100d7_KjU = tonalPalette.m2828getNeutralVariant100d7_KjU();
        long m2849getNeutralVariant980d7_KjU2 = tonalPalette.m2849getNeutralVariant980d7_KjU();
        long m2828getNeutralVariant100d7_KjU2 = tonalPalette.m2828getNeutralVariant100d7_KjU();
        long m2844getNeutralVariant900d7_KjU = tonalPalette.m2844getNeutralVariant900d7_KjU();
        long m2835getNeutralVariant300d7_KjU = tonalPalette.m2835getNeutralVariant300d7_KjU();
        long m2832getNeutralVariant200d7_KjU = tonalPalette.m2832getNeutralVariant200d7_KjU();
        long m2847getNeutralVariant950d7_KjU = tonalPalette.m2847getNeutralVariant950d7_KjU();
        long m2838getNeutralVariant500d7_KjU = tonalPalette.m2838getNeutralVariant500d7_KjU();
        long m2842getNeutralVariant800d7_KjU = tonalPalette.m2842getNeutralVariant800d7_KjU();
        long m2827getNeutralVariant00d7_KjU = tonalPalette.m2827getNeutralVariant00d7_KjU();
        long m2849getNeutralVariant980d7_KjU3 = tonalPalette.m2849getNeutralVariant980d7_KjU();
        long m2843getNeutralVariant870d7_KjU = tonalPalette.m2843getNeutralVariant870d7_KjU();
        return ColorSchemeKt.m1985lightColorSchemeCXl9yA$default(m2856getPrimary400d7_KjU, m2853getPrimary1000d7_KjU, m2861getPrimary900d7_KjU, m2852getPrimary100d7_KjU, m2860getPrimary800d7_KjU, m2869getSecondary400d7_KjU, m2866getSecondary1000d7_KjU, m2874getSecondary900d7_KjU, m2865getSecondary100d7_KjU, m2882getTertiary400d7_KjU, m2879getTertiary1000d7_KjU, m2887getTertiary900d7_KjU, m2878getTertiary100d7_KjU, m2849getNeutralVariant980d7_KjU, m2828getNeutralVariant100d7_KjU, m2849getNeutralVariant980d7_KjU2, m2828getNeutralVariant100d7_KjU2, m2844getNeutralVariant900d7_KjU, m2835getNeutralVariant300d7_KjU, tonalPalette.m2856getPrimary400d7_KjU(), m2832getNeutralVariant200d7_KjU, m2847getNeutralVariant950d7_KjU, 0L, 0L, 0L, 0L, m2838getNeutralVariant500d7_KjU, m2842getNeutralVariant800d7_KjU, m2827getNeutralVariant00d7_KjU, m2849getNeutralVariant980d7_KjU3, tonalPalette.m2846getNeutralVariant940d7_KjU(), tonalPalette.m2845getNeutralVariant920d7_KjU(), tonalPalette.m2844getNeutralVariant900d7_KjU(), tonalPalette.m2848getNeutralVariant960d7_KjU(), tonalPalette.m2829getNeutralVariant1000d7_KjU(), m2843getNeutralVariant870d7_KjU, 62914560, 0, null);
    }

    public static final ColorScheme dynamicLightColorScheme34(Context context) {
        long m1936getColorWaAFU9c = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170528);
        long m1936getColorWaAFU9c2 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170529);
        long m1936getColorWaAFU9c3 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170526);
        long m1936getColorWaAFU9c4 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170527);
        long m1936getColorWaAFU9c5 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170571);
        long m1936getColorWaAFU9c6 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170532);
        long m1936getColorWaAFU9c7 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170533);
        long m1936getColorWaAFU9c8 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170530);
        long m1936getColorWaAFU9c9 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170531);
        long m1936getColorWaAFU9c10 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170536);
        long m1936getColorWaAFU9c11 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170537);
        long m1936getColorWaAFU9c12 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170534);
        long m1936getColorWaAFU9c13 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170535);
        long m1936getColorWaAFU9c14 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170538);
        long m1936getColorWaAFU9c15 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170539);
        long m1936getColorWaAFU9c16 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170540);
        long m1936getColorWaAFU9c17 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170541);
        long m1936getColorWaAFU9c18 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170549);
        long m1936getColorWaAFU9c19 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170550);
        long m1936getColorWaAFU9c20 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170583);
        long m1936getColorWaAFU9c21 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170584);
        long m1936getColorWaAFU9c22 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170551);
        long m1936getColorWaAFU9c23 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170624);
        long m1936getColorWaAFU9c24 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170547);
        long m1936getColorWaAFU9c25 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170548);
        return ColorSchemeKt.m1985lightColorSchemeCXl9yA$default(m1936getColorWaAFU9c, m1936getColorWaAFU9c2, m1936getColorWaAFU9c3, m1936getColorWaAFU9c4, m1936getColorWaAFU9c5, m1936getColorWaAFU9c6, m1936getColorWaAFU9c7, m1936getColorWaAFU9c8, m1936getColorWaAFU9c9, m1936getColorWaAFU9c10, m1936getColorWaAFU9c11, m1936getColorWaAFU9c12, m1936getColorWaAFU9c13, m1936getColorWaAFU9c14, m1936getColorWaAFU9c15, m1936getColorWaAFU9c16, m1936getColorWaAFU9c17, m1936getColorWaAFU9c18, m1936getColorWaAFU9c19, ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170528), m1936getColorWaAFU9c20, m1936getColorWaAFU9c21, 0L, 0L, 0L, 0L, m1936getColorWaAFU9c22, m1936getColorWaAFU9c23, 0L, m1936getColorWaAFU9c24, ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170544), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170545), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170546), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170542), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170543), m1936getColorWaAFU9c25, 331350016, 0, null);
    }

    public static final ColorScheme dynamicDarkColorScheme31(TonalPalette tonalPalette) {
        long m2860getPrimary800d7_KjU = tonalPalette.m2860getPrimary800d7_KjU();
        long m2854getPrimary200d7_KjU = tonalPalette.m2854getPrimary200d7_KjU();
        long m2855getPrimary300d7_KjU = tonalPalette.m2855getPrimary300d7_KjU();
        long m2861getPrimary900d7_KjU = tonalPalette.m2861getPrimary900d7_KjU();
        long m2856getPrimary400d7_KjU = tonalPalette.m2856getPrimary400d7_KjU();
        long m2873getSecondary800d7_KjU = tonalPalette.m2873getSecondary800d7_KjU();
        long m2867getSecondary200d7_KjU = tonalPalette.m2867getSecondary200d7_KjU();
        long m2868getSecondary300d7_KjU = tonalPalette.m2868getSecondary300d7_KjU();
        long m2874getSecondary900d7_KjU = tonalPalette.m2874getSecondary900d7_KjU();
        long m2886getTertiary800d7_KjU = tonalPalette.m2886getTertiary800d7_KjU();
        long m2880getTertiary200d7_KjU = tonalPalette.m2880getTertiary200d7_KjU();
        long m2881getTertiary300d7_KjU = tonalPalette.m2881getTertiary300d7_KjU();
        long m2887getTertiary900d7_KjU = tonalPalette.m2887getTertiary900d7_KjU();
        long m2839getNeutralVariant60d7_KjU = tonalPalette.m2839getNeutralVariant60d7_KjU();
        long m2844getNeutralVariant900d7_KjU = tonalPalette.m2844getNeutralVariant900d7_KjU();
        long m2839getNeutralVariant60d7_KjU2 = tonalPalette.m2839getNeutralVariant60d7_KjU();
        long m2844getNeutralVariant900d7_KjU2 = tonalPalette.m2844getNeutralVariant900d7_KjU();
        long m2835getNeutralVariant300d7_KjU = tonalPalette.m2835getNeutralVariant300d7_KjU();
        long m2842getNeutralVariant800d7_KjU = tonalPalette.m2842getNeutralVariant800d7_KjU();
        long m2844getNeutralVariant900d7_KjU3 = tonalPalette.m2844getNeutralVariant900d7_KjU();
        long m2832getNeutralVariant200d7_KjU = tonalPalette.m2832getNeutralVariant200d7_KjU();
        long m2840getNeutralVariant600d7_KjU = tonalPalette.m2840getNeutralVariant600d7_KjU();
        long m2835getNeutralVariant300d7_KjU2 = tonalPalette.m2835getNeutralVariant300d7_KjU();
        long m2827getNeutralVariant00d7_KjU = tonalPalette.m2827getNeutralVariant00d7_KjU();
        long m2834getNeutralVariant240d7_KjU = tonalPalette.m2834getNeutralVariant240d7_KjU();
        long m2839getNeutralVariant60d7_KjU3 = tonalPalette.m2839getNeutralVariant60d7_KjU();
        return ColorSchemeKt.m1981darkColorSchemeCXl9yA$default(m2860getPrimary800d7_KjU, m2854getPrimary200d7_KjU, m2855getPrimary300d7_KjU, m2861getPrimary900d7_KjU, m2856getPrimary400d7_KjU, m2873getSecondary800d7_KjU, m2867getSecondary200d7_KjU, m2868getSecondary300d7_KjU, m2874getSecondary900d7_KjU, m2886getTertiary800d7_KjU, m2880getTertiary200d7_KjU, m2881getTertiary300d7_KjU, m2887getTertiary900d7_KjU, m2839getNeutralVariant60d7_KjU, m2844getNeutralVariant900d7_KjU, m2839getNeutralVariant60d7_KjU2, m2844getNeutralVariant900d7_KjU2, m2835getNeutralVariant300d7_KjU, m2842getNeutralVariant800d7_KjU, tonalPalette.m2860getPrimary800d7_KjU(), m2844getNeutralVariant900d7_KjU3, m2832getNeutralVariant200d7_KjU, 0L, 0L, 0L, 0L, m2840getNeutralVariant600d7_KjU, m2835getNeutralVariant300d7_KjU2, m2827getNeutralVariant00d7_KjU, m2834getNeutralVariant240d7_KjU, tonalPalette.m2830getNeutralVariant120d7_KjU(), tonalPalette.m2831getNeutralVariant170d7_KjU(), tonalPalette.m2833getNeutralVariant220d7_KjU(), tonalPalette.m2828getNeutralVariant100d7_KjU(), tonalPalette.m2836getNeutralVariant40d7_KjU(), m2839getNeutralVariant60d7_KjU3, 62914560, 0, null);
    }

    public static final ColorScheme dynamicDarkColorScheme34(Context context) {
        long m1936getColorWaAFU9c = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170571);
        long m1936getColorWaAFU9c2 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170572);
        long m1936getColorWaAFU9c3 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170569);
        long m1936getColorWaAFU9c4 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170570);
        long m1936getColorWaAFU9c5 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170528);
        long m1936getColorWaAFU9c6 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170575);
        long m1936getColorWaAFU9c7 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170576);
        long m1936getColorWaAFU9c8 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170573);
        long m1936getColorWaAFU9c9 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170574);
        long m1936getColorWaAFU9c10 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170579);
        long m1936getColorWaAFU9c11 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170580);
        long m1936getColorWaAFU9c12 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170577);
        long m1936getColorWaAFU9c13 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170578);
        long m1936getColorWaAFU9c14 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170581);
        long m1936getColorWaAFU9c15 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170582);
        long m1936getColorWaAFU9c16 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170583);
        long m1936getColorWaAFU9c17 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170584);
        long m1936getColorWaAFU9c18 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170592);
        long m1936getColorWaAFU9c19 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170593);
        long m1936getColorWaAFU9c20 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170540);
        long m1936getColorWaAFU9c21 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170541);
        long m1936getColorWaAFU9c22 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170594);
        long m1936getColorWaAFU9c23 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170625);
        long m1936getColorWaAFU9c24 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170590);
        long m1936getColorWaAFU9c25 = ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170591);
        return ColorSchemeKt.m1981darkColorSchemeCXl9yA$default(m1936getColorWaAFU9c, m1936getColorWaAFU9c2, m1936getColorWaAFU9c3, m1936getColorWaAFU9c4, m1936getColorWaAFU9c5, m1936getColorWaAFU9c6, m1936getColorWaAFU9c7, m1936getColorWaAFU9c8, m1936getColorWaAFU9c9, m1936getColorWaAFU9c10, m1936getColorWaAFU9c11, m1936getColorWaAFU9c12, m1936getColorWaAFU9c13, m1936getColorWaAFU9c14, m1936getColorWaAFU9c15, m1936getColorWaAFU9c16, m1936getColorWaAFU9c17, m1936getColorWaAFU9c18, m1936getColorWaAFU9c19, ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170571), m1936getColorWaAFU9c20, m1936getColorWaAFU9c21, 0L, 0L, 0L, 0L, m1936getColorWaAFU9c22, m1936getColorWaAFU9c23, 0L, m1936getColorWaAFU9c24, ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170587), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170588), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170589), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170585), ColorResourceHelper.INSTANCE.m1936getColorWaAFU9c(context, 17170586), m1936getColorWaAFU9c25, 331350016, 0, null);
    }
}
