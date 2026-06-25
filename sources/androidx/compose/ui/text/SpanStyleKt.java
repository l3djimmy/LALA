package androidx.compose.ui.text;

import androidx.compose.ui.graphics.Color;
import androidx.compose.ui.graphics.ColorKt;
import androidx.compose.ui.graphics.Shadow;
import androidx.compose.ui.graphics.ShadowKt;
import androidx.compose.ui.graphics.drawscope.DrawStyle;
import androidx.compose.ui.graphics.drawscope.Fill;
import androidx.compose.ui.text.font.FontFamily;
import androidx.compose.ui.text.font.FontStyle;
import androidx.compose.ui.text.font.FontSynthesis;
import androidx.compose.ui.text.font.FontWeight;
import androidx.compose.ui.text.font.FontWeightKt;
import androidx.compose.ui.text.font.SystemFontFamily;
import androidx.compose.ui.text.intl.LocaleList;
import androidx.compose.ui.text.style.BaselineShift;
import androidx.compose.ui.text.style.BaselineShiftKt;
import androidx.compose.ui.text.style.TextDecoration;
import androidx.compose.ui.text.style.TextDrawStyleKt;
import androidx.compose.ui.text.style.TextForegroundStyle;
import androidx.compose.ui.text.style.TextGeometricTransform;
import androidx.compose.ui.text.style.TextGeometricTransformKt;
import androidx.compose.ui.unit.TextUnit;
import androidx.compose.ui.unit.TextUnitKt;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.exifinterface.media.ExifInterface;
import kotlin.Metadata;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.DefaultConstructorMarker;
/* compiled from: SpanStyle.kt */
@Metadata(d1 = {"\u0000\u0082\u0001\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0007\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\u001a\u001e\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\f\u001a\u00020\n2\u0006\u0010\r\u001a\u00020\u000e\u001a+\u0010\u000f\u001a\u0002H\u0010\"\u0004\b\u0000\u0010\u00102\u0006\u0010\u0011\u001a\u0002H\u00102\u0006\u0010\u0012\u001a\u0002H\u00102\u0006\u0010\r\u001a\u00020\u000eH\u0000¢\u0006\u0002\u0010\u0013\u001a&\u0010\u0014\u001a\u0004\u0018\u00010\u00152\b\u0010\u000b\u001a\u0004\u0018\u00010\u00152\b\u0010\f\u001a\u0004\u0018\u00010\u00152\u0006\u0010\r\u001a\u00020\u000eH\u0002\u001a*\u0010\u0016\u001a\u00020\u00072\u0006\u0010\u0011\u001a\u00020\u00072\u0006\u0010\u0012\u001a\u00020\u00072\u0006\u0010\u0017\u001a\u00020\u000eH\u0000ø\u0001\u0000¢\u0006\u0004\b\u0018\u0010\u0019\u001a\u0010\u0010\u001a\u001a\u00020\n2\u0006\u0010\u001b\u001a\u00020\nH\u0000\u001aÀ\u0001\u0010\u001c\u001a\u00020\n*\u00020\n2\u0006\u0010\u001d\u001a\u00020\u00012\b\u0010\u001e\u001a\u0004\u0018\u00010\u001f2\u0006\u0010 \u001a\u00020\u000e2\u0006\u0010!\u001a\u00020\u00072\b\u0010\"\u001a\u0004\u0018\u00010#2\b\u0010$\u001a\u0004\u0018\u00010%2\b\u0010&\u001a\u0004\u0018\u00010'2\b\u0010(\u001a\u0004\u0018\u00010)2\b\u0010*\u001a\u0004\u0018\u00010+2\u0006\u0010,\u001a\u00020\u00072\b\u0010-\u001a\u0004\u0018\u00010.2\b\u0010/\u001a\u0004\u0018\u0001002\b\u00101\u001a\u0004\u0018\u0001022\u0006\u00103\u001a\u00020\u00012\b\u00104\u001a\u0004\u0018\u0001052\b\u00106\u001a\u0004\u0018\u0001072\b\u00108\u001a\u0004\u0018\u00010\u00152\b\u00109\u001a\u0004\u0018\u00010:H\u0000ø\u0001\u0000¢\u0006\u0004\b;\u0010<\u001a\u0018\u0010=\u001a\u0004\u0018\u00010\u0015*\u00020\n2\b\u0010>\u001a\u0004\u0018\u00010\u0015H\u0002\"\u0010\u0010\u0000\u001a\u00020\u0001X\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u0002\"\u0010\u0010\u0003\u001a\u00020\u0001X\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u0002\"\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000\"\u0010\u0010\u0006\u001a\u00020\u0007X\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u0002\"\u0010\u0010\b\u001a\u00020\u0007X\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u0002\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006?"}, d2 = {"DefaultBackgroundColor", "Landroidx/compose/ui/graphics/Color;", "J", "DefaultColor", "DefaultColorForegroundStyle", "Landroidx/compose/ui/text/style/TextForegroundStyle;", "DefaultFontSize", "Landroidx/compose/ui/unit/TextUnit;", "DefaultLetterSpacing", "lerp", "Landroidx/compose/ui/text/SpanStyle;", "start", "stop", "fraction", "", "lerpDiscrete", ExifInterface.GPS_DIRECTION_TRUE, "a", "b", "(Ljava/lang/Object;Ljava/lang/Object;F)Ljava/lang/Object;", "lerpPlatformStyle", "Landroidx/compose/ui/text/PlatformSpanStyle;", "lerpTextUnitInheritable", "t", "lerpTextUnitInheritable-C3pnCVY", "(JJF)J", "resolveSpanStyleDefaults", "style", "fastMerge", TypedValues.Custom.S_COLOR, "brush", "Landroidx/compose/ui/graphics/Brush;", "alpha", "fontSize", "fontWeight", "Landroidx/compose/ui/text/font/FontWeight;", "fontStyle", "Landroidx/compose/ui/text/font/FontStyle;", "fontSynthesis", "Landroidx/compose/ui/text/font/FontSynthesis;", "fontFamily", "Landroidx/compose/ui/text/font/FontFamily;", "fontFeatureSettings", "", "letterSpacing", "baselineShift", "Landroidx/compose/ui/text/style/BaselineShift;", "textGeometricTransform", "Landroidx/compose/ui/text/style/TextGeometricTransform;", "localeList", "Landroidx/compose/ui/text/intl/LocaleList;", "background", "textDecoration", "Landroidx/compose/ui/text/style/TextDecoration;", "shadow", "Landroidx/compose/ui/graphics/Shadow;", "platformStyle", "drawStyle", "Landroidx/compose/ui/graphics/drawscope/DrawStyle;", "fastMerge-dSHsh3o", "(Landroidx/compose/ui/text/SpanStyle;JLandroidx/compose/ui/graphics/Brush;FJLandroidx/compose/ui/text/font/FontWeight;Landroidx/compose/ui/text/font/FontStyle;Landroidx/compose/ui/text/font/FontSynthesis;Landroidx/compose/ui/text/font/FontFamily;Ljava/lang/String;JLandroidx/compose/ui/text/style/BaselineShift;Landroidx/compose/ui/text/style/TextGeometricTransform;Landroidx/compose/ui/text/intl/LocaleList;JLandroidx/compose/ui/text/style/TextDecoration;Landroidx/compose/ui/graphics/Shadow;Landroidx/compose/ui/text/PlatformSpanStyle;Landroidx/compose/ui/graphics/drawscope/DrawStyle;)Landroidx/compose/ui/text/SpanStyle;", "mergePlatformStyle", "other", "ui-text_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class SpanStyleKt {
    private static final long DefaultFontSize = TextUnitKt.getSp(14);
    private static final long DefaultLetterSpacing = TextUnitKt.getSp(0);
    private static final long DefaultBackgroundColor = Color.Companion.m4324getTransparent0d7_KjU();
    private static final long DefaultColor = Color.Companion.m4315getBlack0d7_KjU();
    private static final TextForegroundStyle DefaultColorForegroundStyle = TextForegroundStyle.Companion.m6778from8_81llA(DefaultColor);

    /* renamed from: lerpTextUnitInheritable-C3pnCVY  reason: not valid java name */
    public static final long m6286lerpTextUnitInheritableC3pnCVY(long a, long b, float t) {
        if (!(TextUnit.m7065getRawTypeimpl(a) == 0)) {
            if (!(TextUnit.m7065getRawTypeimpl(b) == 0)) {
                return TextUnitKt.m7087lerpC3pnCVY(a, b, t);
            }
        }
        return ((TextUnit) lerpDiscrete(TextUnit.m7057boximpl(a), TextUnit.m7057boximpl(b), t)).m7076unboximpl();
    }

    public static final <T> T lerpDiscrete(T t, T t2, float fraction) {
        return ((double) fraction) < 0.5d ? t : t2;
    }

    public static final SpanStyle lerp(SpanStyle start, SpanStyle stop, float fraction) {
        TextForegroundStyle lerp = TextDrawStyleKt.lerp(start.getTextForegroundStyle$ui_text_release(), stop.getTextForegroundStyle$ui_text_release(), fraction);
        FontFamily fontFamily = (FontFamily) lerpDiscrete(start.getFontFamily(), stop.getFontFamily(), fraction);
        long m6286lerpTextUnitInheritableC3pnCVY = m6286lerpTextUnitInheritableC3pnCVY(start.m6281getFontSizeXSAIIZE(), stop.m6281getFontSizeXSAIIZE(), fraction);
        FontWeight fontWeight = start.getFontWeight();
        if (fontWeight == null) {
            fontWeight = FontWeight.Companion.getNormal();
        }
        FontWeight fontWeight2 = stop.getFontWeight();
        if (fontWeight2 == null) {
            fontWeight2 = FontWeight.Companion.getNormal();
        }
        FontWeight lerp2 = FontWeightKt.lerp(fontWeight, fontWeight2, fraction);
        FontStyle fontStyle = (FontStyle) lerpDiscrete(start.m6282getFontStyle4Lr2A7w(), stop.m6282getFontStyle4Lr2A7w(), fraction);
        FontSynthesis fontSynthesis = (FontSynthesis) lerpDiscrete(start.m6283getFontSynthesisZQGJjVo(), stop.m6283getFontSynthesisZQGJjVo(), fraction);
        String str = (String) lerpDiscrete(start.getFontFeatureSettings(), stop.getFontFeatureSettings(), fraction);
        long m6286lerpTextUnitInheritableC3pnCVY2 = m6286lerpTextUnitInheritableC3pnCVY(start.m6284getLetterSpacingXSAIIZE(), stop.m6284getLetterSpacingXSAIIZE(), fraction);
        BaselineShift m6279getBaselineShift5SSeXJ0 = start.m6279getBaselineShift5SSeXJ0();
        float m6635unboximpl = m6279getBaselineShift5SSeXJ0 != null ? m6279getBaselineShift5SSeXJ0.m6635unboximpl() : BaselineShift.m6630constructorimpl(0.0f);
        BaselineShift m6279getBaselineShift5SSeXJ02 = stop.m6279getBaselineShift5SSeXJ0();
        float m6642lerpjWV1Mfo = BaselineShiftKt.m6642lerpjWV1Mfo(m6635unboximpl, m6279getBaselineShift5SSeXJ02 != null ? m6279getBaselineShift5SSeXJ02.m6635unboximpl() : BaselineShift.m6630constructorimpl(0.0f), fraction);
        TextGeometricTransform textGeometricTransform = start.getTextGeometricTransform();
        if (textGeometricTransform == null) {
            textGeometricTransform = TextGeometricTransform.Companion.getNone$ui_text_release();
        }
        TextGeometricTransform textGeometricTransform2 = stop.getTextGeometricTransform();
        if (textGeometricTransform2 == null) {
            textGeometricTransform2 = TextGeometricTransform.Companion.getNone$ui_text_release();
        }
        TextGeometricTransform lerp3 = TextGeometricTransformKt.lerp(textGeometricTransform, textGeometricTransform2, fraction);
        LocaleList localeList = (LocaleList) lerpDiscrete(start.getLocaleList(), stop.getLocaleList(), fraction);
        long m4340lerpjxsXWHM = ColorKt.m4340lerpjxsXWHM(start.m6278getBackground0d7_KjU(), stop.m6278getBackground0d7_KjU(), fraction);
        TextDecoration textDecoration = (TextDecoration) lerpDiscrete(start.getTextDecoration(), stop.getTextDecoration(), fraction);
        Shadow shadow = start.getShadow();
        if (shadow == null) {
            shadow = new Shadow(0L, 0L, 0.0f, 7, null);
        }
        Shadow shadow2 = stop.getShadow();
        if (shadow2 == null) {
            shadow2 = new Shadow(0L, 0L, 0.0f, 7, null);
        }
        return new SpanStyle(lerp, m6286lerpTextUnitInheritableC3pnCVY, lerp2, fontStyle, fontSynthesis, fontFamily, str, m6286lerpTextUnitInheritableC3pnCVY2, BaselineShift.m6629boximpl(m6642lerpjWV1Mfo), lerp3, localeList, m4340lerpjxsXWHM, textDecoration, ShadowKt.lerp(shadow, shadow2, fraction), lerpPlatformStyle(start.getPlatformStyle(), stop.getPlatformStyle(), fraction), (DrawStyle) lerpDiscrete(start.getDrawStyle(), stop.getDrawStyle(), fraction), (DefaultConstructorMarker) null);
    }

    private static final PlatformSpanStyle lerpPlatformStyle(PlatformSpanStyle start, PlatformSpanStyle stop, float fraction) {
        if (start == null && stop == null) {
            return null;
        }
        PlatformSpanStyle startNonNull = start == null ? PlatformSpanStyle.Companion.getDefault() : start;
        PlatformSpanStyle stopNonNull = stop == null ? PlatformSpanStyle.Companion.getDefault() : stop;
        return AndroidTextStyle_androidKt.lerp(startNonNull, stopNonNull, fraction);
    }

    public static final SpanStyle resolveSpanStyleDefaults(SpanStyle style) {
        long m6284getLetterSpacingXSAIIZE;
        TextForegroundStyle takeOrElse = style.getTextForegroundStyle$ui_text_release().takeOrElse(new Function0<TextForegroundStyle>() { // from class: androidx.compose.ui.text.SpanStyleKt$resolveSpanStyleDefaults$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // kotlin.jvm.functions.Function0
            public final TextForegroundStyle invoke() {
                TextForegroundStyle textForegroundStyle;
                textForegroundStyle = SpanStyleKt.DefaultColorForegroundStyle;
                return textForegroundStyle;
            }
        });
        long $this$isUnspecified$iv = style.m6281getFontSizeXSAIIZE();
        long m6281getFontSizeXSAIIZE = (TextUnit.m7065getRawTypeimpl($this$isUnspecified$iv) > 0L ? 1 : (TextUnit.m7065getRawTypeimpl($this$isUnspecified$iv) == 0L ? 0 : -1)) == 0 ? DefaultFontSize : style.m6281getFontSizeXSAIIZE();
        FontWeight fontWeight = style.getFontWeight();
        if (fontWeight == null) {
            fontWeight = FontWeight.Companion.getNormal();
        }
        FontStyle m6282getFontStyle4Lr2A7w = style.m6282getFontStyle4Lr2A7w();
        FontStyle m6447boximpl = FontStyle.m6447boximpl(m6282getFontStyle4Lr2A7w != null ? m6282getFontStyle4Lr2A7w.m6453unboximpl() : FontStyle.Companion.m6457getNormal_LCdwA());
        FontSynthesis m6283getFontSynthesisZQGJjVo = style.m6283getFontSynthesisZQGJjVo();
        FontSynthesis m6458boximpl = FontSynthesis.m6458boximpl(m6283getFontSynthesisZQGJjVo != null ? m6283getFontSynthesisZQGJjVo.m6466unboximpl() : FontSynthesis.Companion.m6467getAllGVVA2EU());
        SystemFontFamily fontFamily = style.getFontFamily();
        if (fontFamily == null) {
            fontFamily = FontFamily.Companion.getDefault();
        }
        String fontFeatureSettings = style.getFontFeatureSettings();
        if (fontFeatureSettings == null) {
            fontFeatureSettings = "";
        }
        long $this$isUnspecified$iv2 = style.m6284getLetterSpacingXSAIIZE();
        if (TextUnit.m7065getRawTypeimpl($this$isUnspecified$iv2) == 0) {
            m6284getLetterSpacingXSAIIZE = DefaultLetterSpacing;
        } else {
            m6284getLetterSpacingXSAIIZE = style.m6284getLetterSpacingXSAIIZE();
        }
        BaselineShift m6279getBaselineShift5SSeXJ0 = style.m6279getBaselineShift5SSeXJ0();
        BaselineShift m6629boximpl = BaselineShift.m6629boximpl(m6279getBaselineShift5SSeXJ0 != null ? m6279getBaselineShift5SSeXJ0.m6635unboximpl() : BaselineShift.Companion.m6639getNoney9eOQZs());
        TextGeometricTransform textGeometricTransform = style.getTextGeometricTransform();
        if (textGeometricTransform == null) {
            textGeometricTransform = TextGeometricTransform.Companion.getNone$ui_text_release();
        }
        TextGeometricTransform textGeometricTransform2 = textGeometricTransform;
        LocaleList localeList = style.getLocaleList();
        if (localeList == null) {
            localeList = LocaleList.Companion.getCurrent();
        }
        LocaleList localeList2 = localeList;
        long $this$takeOrElse_u2dDxMtmZc$iv = style.m6278getBackground0d7_KjU();
        if (!($this$takeOrElse_u2dDxMtmZc$iv != 16)) {
            $this$takeOrElse_u2dDxMtmZc$iv = DefaultBackgroundColor;
        }
        TextDecoration textDecoration = style.getTextDecoration();
        if (textDecoration == null) {
            textDecoration = TextDecoration.Companion.getNone();
        }
        TextDecoration textDecoration2 = textDecoration;
        Shadow shadow = style.getShadow();
        if (shadow == null) {
            shadow = Shadow.Companion.getNone();
        }
        Shadow shadow2 = shadow;
        PlatformSpanStyle platformStyle = style.getPlatformStyle();
        Fill drawStyle = style.getDrawStyle();
        if (drawStyle == null) {
            drawStyle = Fill.INSTANCE;
        }
        return new SpanStyle(takeOrElse, m6281getFontSizeXSAIIZE, fontWeight, m6447boximpl, m6458boximpl, fontFamily, fontFeatureSettings, m6284getLetterSpacingXSAIIZE, m6629boximpl, textGeometricTransform2, localeList2, $this$takeOrElse_u2dDxMtmZc$iv, textDecoration2, shadow2, platformStyle, drawStyle, (DefaultConstructorMarker) null);
    }

    /* JADX WARN: Code restructure failed: missing block: B:102:0x01cb, code lost:
        r14 = r68;
     */
    /* JADX WARN: Code restructure failed: missing block: B:103:0x01d5, code lost:
        if (kotlin.jvm.internal.Intrinsics.areEqual(r14, r48.getShadow()) == false) goto L144;
     */
    /* JADX WARN: Code restructure failed: missing block: B:105:0x01d8, code lost:
        r6 = r69;
     */
    /* JADX WARN: Code restructure failed: missing block: B:109:0x01e9, code lost:
        if (kotlin.jvm.internal.Intrinsics.areEqual(r6, r48.getPlatformStyle()) != false) goto L148;
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:0x00f5, code lost:
        if (kotlin.jvm.internal.Intrinsics.areEqual(r67, r48.getTextDecoration()) == false) goto L104;
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x00f8, code lost:
        r15 = r63;
        r14 = r68;
        r6 = r69;
     */
    /* JADX WARN: Removed duplicated region for block: B:121:0x020b A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:122:0x020c  */
    /* renamed from: fastMerge-dSHsh3o  reason: not valid java name */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final androidx.compose.ui.text.SpanStyle m6285fastMergedSHsh3o(androidx.compose.ui.text.SpanStyle r48, long r49, androidx.compose.ui.graphics.Brush r51, float r52, long r53, androidx.compose.ui.text.font.FontWeight r55, androidx.compose.ui.text.font.FontStyle r56, androidx.compose.ui.text.font.FontSynthesis r57, androidx.compose.ui.text.font.FontFamily r58, java.lang.String r59, long r60, androidx.compose.ui.text.style.BaselineShift r62, androidx.compose.ui.text.style.TextGeometricTransform r63, androidx.compose.ui.text.intl.LocaleList r64, long r65, androidx.compose.ui.text.style.TextDecoration r67, androidx.compose.ui.graphics.Shadow r68, androidx.compose.ui.text.PlatformSpanStyle r69, androidx.compose.ui.graphics.drawscope.DrawStyle r70) {
        /*
            Method dump skipped, instructions count: 786
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.ui.text.SpanStyleKt.m6285fastMergedSHsh3o(androidx.compose.ui.text.SpanStyle, long, androidx.compose.ui.graphics.Brush, float, long, androidx.compose.ui.text.font.FontWeight, androidx.compose.ui.text.font.FontStyle, androidx.compose.ui.text.font.FontSynthesis, androidx.compose.ui.text.font.FontFamily, java.lang.String, long, androidx.compose.ui.text.style.BaselineShift, androidx.compose.ui.text.style.TextGeometricTransform, androidx.compose.ui.text.intl.LocaleList, long, androidx.compose.ui.text.style.TextDecoration, androidx.compose.ui.graphics.Shadow, androidx.compose.ui.text.PlatformSpanStyle, androidx.compose.ui.graphics.drawscope.DrawStyle):androidx.compose.ui.text.SpanStyle");
    }

    private static final PlatformSpanStyle mergePlatformStyle(SpanStyle $this$mergePlatformStyle, PlatformSpanStyle other) {
        return $this$mergePlatformStyle.getPlatformStyle() == null ? other : other == null ? $this$mergePlatformStyle.getPlatformStyle() : $this$mergePlatformStyle.getPlatformStyle().merge(other);
    }
}
