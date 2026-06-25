package androidx.compose.ui.text.platform.extensions;

import android.graphics.Typeface;
import android.text.Spannable;
import android.text.style.AbsoluteSizeSpan;
import android.text.style.BackgroundColorSpan;
import android.text.style.ForegroundColorSpan;
import android.text.style.LeadingMarginSpan;
import android.text.style.MetricAffectingSpan;
import android.text.style.RelativeSizeSpan;
import android.text.style.ScaleXSpan;
import androidx.compose.ui.graphics.Brush;
import androidx.compose.ui.graphics.ColorKt;
import androidx.compose.ui.graphics.ShaderBrush;
import androidx.compose.ui.graphics.Shadow;
import androidx.compose.ui.graphics.SolidColor;
import androidx.compose.ui.graphics.drawscope.DrawStyle;
import androidx.compose.ui.text.AnnotatedString;
import androidx.compose.ui.text.AnnotatedStringKt;
import androidx.compose.ui.text.Bullet;
import androidx.compose.ui.text.PlatformSpanStyle;
import androidx.compose.ui.text.SpanStyle;
import androidx.compose.ui.text.TextStyle;
import androidx.compose.ui.text.android.style.BaselineShiftSpan;
import androidx.compose.ui.text.android.style.FontFeatureSpan;
import androidx.compose.ui.text.android.style.LetterSpacingSpanEm;
import androidx.compose.ui.text.android.style.LetterSpacingSpanPx;
import androidx.compose.ui.text.android.style.LineHeightSpan;
import androidx.compose.ui.text.android.style.LineHeightStyleSpan;
import androidx.compose.ui.text.android.style.ShadowSpan;
import androidx.compose.ui.text.android.style.SkewXSpan;
import androidx.compose.ui.text.android.style.TextDecorationSpan;
import androidx.compose.ui.text.android.style.TypefaceSpan;
import androidx.compose.ui.text.font.FontFamily;
import androidx.compose.ui.text.font.FontStyle;
import androidx.compose.ui.text.font.FontSynthesis;
import androidx.compose.ui.text.font.FontWeight;
import androidx.compose.ui.text.intl.LocaleList;
import androidx.compose.ui.text.platform.style.CustomBulletSpan;
import androidx.compose.ui.text.platform.style.DrawStyleSpan;
import androidx.compose.ui.text.platform.style.ShaderBrushSpan;
import androidx.compose.ui.text.style.BaselineShift;
import androidx.compose.ui.text.style.LineHeightStyle;
import androidx.compose.ui.text.style.TextDecoration;
import androidx.compose.ui.text.style.TextGeometricTransform;
import androidx.compose.ui.text.style.TextIndent;
import androidx.compose.ui.unit.Density;
import androidx.compose.ui.unit.TextUnit;
import androidx.compose.ui.unit.TextUnitKt;
import androidx.compose.ui.unit.TextUnitType;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.ArraysKt;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.functions.Function4;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;
import kotlin.text.StringsKt;
/* compiled from: SpannableExtensions.android.kt */
@Metadata(d1 = {"\u0000Ø\u0001\n\u0000\n\u0002\u0010\u000b\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0007\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0002\u001a$\u0010\u0005\u001a\u0004\u0018\u00010\u00062\u0006\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\nH\u0002ø\u0001\u0000¢\u0006\u0004\b\u000b\u0010\f\u001aF\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u00022\u0012\u0010\u0010\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00020\u00120\u00112\u001e\u0010\u0013\u001a\u001a\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u0015\u0012\u0004\u0012\u00020\u0015\u0012\u0004\u0012\u00020\u000e0\u0014H\u0000\u001a\u0010\u0010\u0016\u001a\u00020\u00012\u0006\u0010\t\u001a\u00020\nH\u0002\u001a*\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\b2\u0006\u0010\u001a\u001a\u00020\u00182\u0006\u0010\t\u001a\u00020\nH\u0002ø\u0001\u0000¢\u0006\u0004\b\u001b\u0010\u001c\u001a*\u0010\u001d\u001a\u00020\u00182\u0006\u0010\u001e\u001a\u00020\b2\u0006\u0010\u001a\u001a\u00020\u00182\u0006\u0010\t\u001a\u00020\nH\u0002ø\u0001\u0000¢\u0006\u0004\b\u001f\u0010\u001c\u001a\f\u0010 \u001a\u00020\u0001*\u00020!H\u0002\u001a\u0016\u0010\"\u001a\u00020\u0002*\u0004\u0018\u00010\u00022\u0006\u0010#\u001a\u00020\u0002H\u0002\u001a.\u0010$\u001a\u00020\u000e*\u00020%2\u0006\u0010&\u001a\u00020'2\u0006\u0010(\u001a\u00020\u00152\u0006\u0010)\u001a\u00020\u0015H\u0000ø\u0001\u0000¢\u0006\u0004\b*\u0010+\u001a.\u0010,\u001a\u00020\u000e*\u00020%2\b\u0010-\u001a\u0004\u0018\u00010.2\u0006\u0010(\u001a\u00020\u00152\u0006\u0010)\u001a\u00020\u0015H\u0002ø\u0001\u0000¢\u0006\u0002\b/\u001a.\u00100\u001a\u00020\u000e*\u00020%2\b\u00101\u001a\u0004\u0018\u0001022\u0006\u00103\u001a\u00020\u00182\u0006\u0010(\u001a\u00020\u00152\u0006\u0010)\u001a\u00020\u0015H\u0002\u001a<\u00104\u001a\u00020\u000e*\u00020%2\u0014\u00105\u001a\u0010\u0012\f\u0012\n\u0012\u0006\b\u0001\u0012\u0002060\u00120\u00112\u0006\u0010\u001a\u001a\u00020\u00182\u0006\u0010\t\u001a\u00020\n2\b\u00107\u001a\u0004\u0018\u000108H\u0000\u001a.\u00109\u001a\u00020\u000e*\u00020%2\u0006\u0010&\u001a\u00020'2\u0006\u0010(\u001a\u00020\u00152\u0006\u0010)\u001a\u00020\u0015H\u0000ø\u0001\u0000¢\u0006\u0004\b:\u0010+\u001a&\u0010;\u001a\u00020\u000e*\u00020%2\b\u0010<\u001a\u0004\u0018\u00010=2\u0006\u0010(\u001a\u00020\u00152\u0006\u0010)\u001a\u00020\u0015H\u0002\u001aR\u0010>\u001a\u00020\u000e*\u00020%2\u0006\u0010?\u001a\u00020!2\u0014\u00105\u001a\u0010\u0012\f\u0012\n\u0012\u0006\b\u0001\u0012\u0002060\u00120\u00112&\u0010@\u001a\"\u0012\u0006\u0012\u0004\u0018\u00010B\u0012\u0004\u0012\u00020C\u0012\u0004\u0012\u00020D\u0012\u0004\u0012\u00020E\u0012\u0004\u0012\u00020F0AH\u0002\u001a&\u0010G\u001a\u00020\u000e*\u00020%2\b\u0010H\u001a\u0004\u0018\u00010I2\u0006\u0010(\u001a\u00020\u00152\u0006\u0010)\u001a\u00020\u0015H\u0002\u001a6\u0010J\u001a\u00020\u000e*\u00020%2\u0006\u0010K\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\n2\u0006\u0010(\u001a\u00020\u00152\u0006\u0010)\u001a\u00020\u0015H\u0000ø\u0001\u0000¢\u0006\u0004\bL\u0010M\u001a&\u0010N\u001a\u00020\u000e*\u00020%2\b\u0010O\u001a\u0004\u0018\u00010P2\u0006\u0010(\u001a\u00020\u00152\u0006\u0010)\u001a\u00020\u0015H\u0002\u001a.\u0010Q\u001a\u00020\u000e*\u00020%2\u0006\u0010\u001e\u001a\u00020\b2\u0006\u0010\u001a\u001a\u00020\u00182\u0006\u0010\t\u001a\u00020\nH\u0000ø\u0001\u0000¢\u0006\u0004\bR\u0010S\u001a6\u0010Q\u001a\u00020\u000e*\u00020%2\u0006\u0010\u001e\u001a\u00020\b2\u0006\u0010\u001a\u001a\u00020\u00182\u0006\u0010\t\u001a\u00020\n2\u0006\u0010T\u001a\u00020UH\u0000ø\u0001\u0000¢\u0006\u0004\bV\u0010W\u001a&\u0010X\u001a\u00020\u000e*\u00020%2\b\u0010Y\u001a\u0004\u0018\u00010Z2\u0006\u0010(\u001a\u00020\u00152\u0006\u0010)\u001a\u00020\u0015H\u0000\u001a&\u0010[\u001a\u00020\u000e*\u00020%2\b\u0010\\\u001a\u0004\u0018\u00010]2\u0006\u0010(\u001a\u00020\u00152\u0006\u0010)\u001a\u00020\u0015H\u0002\u001a$\u0010^\u001a\u00020\u000e*\u00020%2\u0006\u0010_\u001a\u00020`2\u0006\u0010(\u001a\u00020\u00152\u0006\u0010)\u001a\u00020\u0015H\u0000\u001a,\u0010a\u001a\u00020\u000e*\u00020%2\u0006\u0010b\u001a\u00020\u00022\u0006\u0010(\u001a\u00020\u00152\u0006\u0010)\u001a\u00020\u00152\u0006\u0010\t\u001a\u00020\nH\u0002\u001aZ\u0010c\u001a\u00020\u000e*\u00020%2\u0006\u0010?\u001a\u00020!2\u0014\u00105\u001a\u0010\u0012\f\u0012\n\u0012\u0006\b\u0001\u0012\u0002060\u00120\u00112\u0006\u0010\t\u001a\u00020\n2&\u0010@\u001a\"\u0012\u0006\u0012\u0004\u0018\u00010B\u0012\u0004\u0012\u00020C\u0012\u0004\u0012\u00020D\u0012\u0004\u0012\u00020E\u0012\u0004\u0012\u00020F0AH\u0000\u001a&\u0010d\u001a\u00020\u000e*\u00020%2\b\u0010e\u001a\u0004\u0018\u00010f2\u0006\u0010(\u001a\u00020\u00152\u0006\u0010)\u001a\u00020\u0015H\u0000\u001a&\u0010g\u001a\u00020\u000e*\u00020%2\b\u00107\u001a\u0004\u0018\u0001082\u0006\u0010\u001a\u001a\u00020\u00182\u0006\u0010\t\u001a\u00020\nH\u0000\"\u0018\u0010\u0000\u001a\u00020\u0001*\u00020\u00028BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u0003\u0010\u0004\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006h"}, d2 = {"needsLetterSpacingSpan", "", "Landroidx/compose/ui/text/SpanStyle;", "getNeedsLetterSpacingSpan", "(Landroidx/compose/ui/text/SpanStyle;)Z", "createLetterSpacingSpan", "Landroid/text/style/MetricAffectingSpan;", "letterSpacing", "Landroidx/compose/ui/unit/TextUnit;", "density", "Landroidx/compose/ui/unit/Density;", "createLetterSpacingSpan-eAf_CNQ", "(JLandroidx/compose/ui/unit/Density;)Landroid/text/style/MetricAffectingSpan;", "flattenFontStylesAndApply", "", "contextFontSpanStyle", "spanStyles", "", "Landroidx/compose/ui/text/AnnotatedString$Range;", "block", "Lkotlin/Function3;", "", "isNonLinearFontScalingActive", "resolveBulletTextUnitToPx", "", "size", "contextFontSize", "resolveBulletTextUnitToPx-o2QH7mI", "(JFLandroidx/compose/ui/unit/Density;)F", "resolveLineHeightInPx", "lineHeight", "resolveLineHeightInPx-o2QH7mI", "hasFontAttributes", "Landroidx/compose/ui/text/TextStyle;", "merge", "spanStyle", "setBackground", "Landroid/text/Spannable;", TypedValues.Custom.S_COLOR, "Landroidx/compose/ui/graphics/Color;", "start", "end", "setBackground-RPmYEkk", "(Landroid/text/Spannable;JII)V", "setBaselineShift", "baselineShift", "Landroidx/compose/ui/text/style/BaselineShift;", "setBaselineShift-0ocSgnM", "setBrush", "brush", "Landroidx/compose/ui/graphics/Brush;", "alpha", "setBulletSpans", "annotations", "Landroidx/compose/ui/text/AnnotatedString$Annotation;", "textIndent", "Landroidx/compose/ui/text/style/TextIndent;", "setColor", "setColor-RPmYEkk", "setDrawStyle", "drawStyle", "Landroidx/compose/ui/graphics/drawscope/DrawStyle;", "setFontAttributes", "contextTextStyle", "resolveTypeface", "Lkotlin/Function4;", "Landroidx/compose/ui/text/font/FontFamily;", "Landroidx/compose/ui/text/font/FontWeight;", "Landroidx/compose/ui/text/font/FontStyle;", "Landroidx/compose/ui/text/font/FontSynthesis;", "Landroid/graphics/Typeface;", "setFontFeatureSettings", "fontFeatureSettings", "", "setFontSize", "fontSize", "setFontSize-KmRG4DE", "(Landroid/text/Spannable;JLandroidx/compose/ui/unit/Density;II)V", "setGeometricTransform", "textGeometricTransform", "Landroidx/compose/ui/text/style/TextGeometricTransform;", "setLineHeight", "setLineHeight-r9BaKPg", "(Landroid/text/Spannable;JFLandroidx/compose/ui/unit/Density;)V", "lineHeightStyle", "Landroidx/compose/ui/text/style/LineHeightStyle;", "setLineHeight-KmRG4DE", "(Landroid/text/Spannable;JFLandroidx/compose/ui/unit/Density;Landroidx/compose/ui/text/style/LineHeightStyle;)V", "setLocaleList", "localeList", "Landroidx/compose/ui/text/intl/LocaleList;", "setShadow", "shadow", "Landroidx/compose/ui/graphics/Shadow;", "setSpan", "span", "", "setSpanStyle", "style", "setSpanStyles", "setTextDecoration", "textDecoration", "Landroidx/compose/ui/text/style/TextDecoration;", "setTextIndent", "ui-text_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class SpannableExtensions_androidKt {
    public static final void setSpan(Spannable $this$setSpan, Object span, int start, int end) {
        $this$setSpan.setSpan(span, start, end, 33);
    }

    public static final void setTextIndent(Spannable $this$setTextIndent, TextIndent textIndent, float contextFontSize, Density density) {
        float firstLine;
        if (textIndent != null) {
            if (!TextUnit.m7064equalsimpl0(textIndent.m6781getFirstLineXSAIIZE(), TextUnitKt.getSp(0)) || !TextUnit.m7064equalsimpl0(textIndent.m6782getRestLineXSAIIZE(), TextUnitKt.getSp(0))) {
                long $this$isUnspecified$iv = textIndent.m6781getFirstLineXSAIIZE();
                if (!(TextUnit.m7065getRawTypeimpl($this$isUnspecified$iv) == 0)) {
                    long $this$isUnspecified$iv2 = textIndent.m6782getRestLineXSAIIZE();
                    if (!(TextUnit.m7065getRawTypeimpl($this$isUnspecified$iv2) == 0)) {
                        long m7066getTypeUIouoOA = TextUnit.m7066getTypeUIouoOA(textIndent.m6781getFirstLineXSAIIZE());
                        float restLine = 0.0f;
                        if (TextUnitType.m7095equalsimpl0(m7066getTypeUIouoOA, TextUnitType.Companion.m7100getSpUIouoOA())) {
                            firstLine = density.mo643toPxR2X_6o(textIndent.m6781getFirstLineXSAIIZE());
                        } else {
                            firstLine = TextUnitType.m7095equalsimpl0(m7066getTypeUIouoOA, TextUnitType.Companion.m7099getEmUIouoOA()) ? TextUnit.m7067getValueimpl(textIndent.m6781getFirstLineXSAIIZE()) * contextFontSize : 0.0f;
                        }
                        long m7066getTypeUIouoOA2 = TextUnit.m7066getTypeUIouoOA(textIndent.m6782getRestLineXSAIIZE());
                        if (TextUnitType.m7095equalsimpl0(m7066getTypeUIouoOA2, TextUnitType.Companion.m7100getSpUIouoOA())) {
                            restLine = density.mo643toPxR2X_6o(textIndent.m6782getRestLineXSAIIZE());
                        } else if (TextUnitType.m7095equalsimpl0(m7066getTypeUIouoOA2, TextUnitType.Companion.m7099getEmUIouoOA())) {
                            restLine = TextUnit.m7067getValueimpl(textIndent.m6782getRestLineXSAIIZE()) * contextFontSize;
                        }
                        setSpan($this$setTextIndent, new LeadingMarginSpan.Standard((int) Math.ceil(firstLine), (int) Math.ceil(restLine)), 0, $this$setTextIndent.length());
                    }
                }
            }
        }
    }

    public static final void setBulletSpans(Spannable $this$setBulletSpans, List<? extends AnnotatedString.Range<? extends AnnotatedString.Annotation>> list, float contextFontSize, Density density, TextIndent textIndent) {
        float textIndentPx;
        Density density2 = density;
        float f = 0.0f;
        if (textIndent != null) {
            long m7066getTypeUIouoOA = TextUnit.m7066getTypeUIouoOA(textIndent.m6781getFirstLineXSAIIZE());
            if (TextUnitType.m7095equalsimpl0(m7066getTypeUIouoOA, TextUnitType.Companion.m7100getSpUIouoOA())) {
                f = density.mo643toPxR2X_6o(textIndent.m6781getFirstLineXSAIIZE());
            } else if (TextUnitType.m7095equalsimpl0(m7066getTypeUIouoOA, TextUnitType.Companion.m7099getEmUIouoOA())) {
                f = TextUnit.m7067getValueimpl(textIndent.m6781getFirstLineXSAIIZE()) * contextFontSize;
            }
            textIndentPx = f;
        } else {
            textIndentPx = 0.0f;
        }
        int size = list.size();
        int index$iv = 0;
        while (index$iv < size) {
            AnnotatedString.Range item$iv = list.get(index$iv);
            AnnotatedString.Range it = item$iv;
            AnnotatedString.Annotation item = it.getItem();
            Bullet bullet = item instanceof Bullet ? (Bullet) item : null;
            if (bullet != null) {
                Bullet bullet2 = bullet;
                float bulletSize = m6614resolveBulletTextUnitToPxo2QH7mI(bullet2.m6175getSizeXSAIIZE(), contextFontSize, density2);
                float gapWidthPx = m6614resolveBulletTextUnitToPxo2QH7mI(bullet2.m6174getPaddingXSAIIZE(), contextFontSize, density2);
                if (!Float.isNaN(bulletSize) && !Float.isNaN(gapWidthPx)) {
                    setSpan($this$setBulletSpans, new CustomBulletSpan(bullet2.getShape(), bulletSize, bulletSize, gapWidthPx, bullet2.getBrush(), bullet2.getAlpha(), bullet2.getDrawStyle(), density2, textIndentPx), it.getStart(), it.getEnd());
                }
            }
            index$iv++;
            density2 = density;
        }
    }

    /* renamed from: resolveBulletTextUnitToPx-o2QH7mI  reason: not valid java name */
    private static final float m6614resolveBulletTextUnitToPxo2QH7mI(long size, float contextFontSize, Density density) {
        if (TextUnit.m7064equalsimpl0(size, TextUnit.Companion.m7078getUnspecifiedXSAIIZE())) {
            return contextFontSize;
        }
        long m7066getTypeUIouoOA = TextUnit.m7066getTypeUIouoOA(size);
        if (TextUnitType.m7095equalsimpl0(m7066getTypeUIouoOA, TextUnitType.Companion.m7100getSpUIouoOA())) {
            return density.mo643toPxR2X_6o(size);
        }
        if (TextUnitType.m7095equalsimpl0(m7066getTypeUIouoOA, TextUnitType.Companion.m7099getEmUIouoOA())) {
            return TextUnit.m7067getValueimpl(size) * contextFontSize;
        }
        return Float.NaN;
    }

    /* renamed from: setLineHeight-KmRG4DE  reason: not valid java name */
    public static final void m6620setLineHeightKmRG4DE(Spannable $this$setLineHeight_u2dKmRG4DE, long lineHeight, float contextFontSize, Density density, LineHeightStyle lineHeightStyle) {
        float resolvedLineHeight = m6615resolveLineHeightInPxo2QH7mI(lineHeight, contextFontSize, density);
        if (!Float.isNaN(resolvedLineHeight)) {
            int endIndex = (($this$setLineHeight_u2dKmRG4DE.length() == 0) || StringsKt.last($this$setLineHeight_u2dKmRG4DE) == '\n') ? $this$setLineHeight_u2dKmRG4DE.length() + 1 : $this$setLineHeight_u2dKmRG4DE.length();
            setSpan($this$setLineHeight_u2dKmRG4DE, new LineHeightStyleSpan(resolvedLineHeight, 0, endIndex, LineHeightStyle.Trim.m6742isTrimFirstLineTopimpl$ui_text_release(lineHeightStyle.m6716getTrimEVpEnUU()), LineHeightStyle.Trim.m6743isTrimLastLineBottomimpl$ui_text_release(lineHeightStyle.m6716getTrimEVpEnUU()), lineHeightStyle.m6714getAlignmentPIaL0Z0(), LineHeightStyle.Mode.m6731equalsimpl0(lineHeightStyle.m6715getModelzQqcRY(), LineHeightStyle.Mode.Companion.m6736getMinimumlzQqcRY())), 0, $this$setLineHeight_u2dKmRG4DE.length());
        }
    }

    /* renamed from: setLineHeight-r9BaKPg  reason: not valid java name */
    public static final void m6621setLineHeightr9BaKPg(Spannable $this$setLineHeight_u2dr9BaKPg, long lineHeight, float contextFontSize, Density density) {
        float resolvedLineHeight = m6615resolveLineHeightInPxo2QH7mI(lineHeight, contextFontSize, density);
        if (!Float.isNaN(resolvedLineHeight)) {
            setSpan($this$setLineHeight_u2dr9BaKPg, new LineHeightSpan(resolvedLineHeight), 0, $this$setLineHeight_u2dr9BaKPg.length());
        }
    }

    /* renamed from: resolveLineHeightInPx-o2QH7mI  reason: not valid java name */
    private static final float m6615resolveLineHeightInPxo2QH7mI(long lineHeight, float contextFontSize, Density density) {
        long m7066getTypeUIouoOA = TextUnit.m7066getTypeUIouoOA(lineHeight);
        if (TextUnitType.m7095equalsimpl0(m7066getTypeUIouoOA, TextUnitType.Companion.m7100getSpUIouoOA())) {
            if (!isNonLinearFontScalingActive(density)) {
                return density.mo643toPxR2X_6o(lineHeight);
            }
            long fontSizeSp = density.mo647toSpkPz2Gy4(contextFontSize);
            float lineHeightMultiplier = TextUnit.m7067getValueimpl(lineHeight) / TextUnit.m7067getValueimpl(fontSizeSp);
            return lineHeightMultiplier * contextFontSize;
        } else if (TextUnitType.m7095equalsimpl0(m7066getTypeUIouoOA, TextUnitType.Companion.m7099getEmUIouoOA())) {
            return TextUnit.m7067getValueimpl(lineHeight) * contextFontSize;
        } else {
            return Float.NaN;
        }
    }

    private static final boolean isNonLinearFontScalingActive(Density density) {
        return ((double) density.getFontScale()) > 1.05d;
    }

    public static final void setSpanStyles(Spannable $this$setSpanStyles, TextStyle contextTextStyle, List<? extends AnnotatedString.Range<? extends AnnotatedString.Annotation>> list, Density density, Function4<? super FontFamily, ? super FontWeight, ? super FontStyle, ? super FontSynthesis, ? extends Typeface> function4) {
        MetricAffectingSpan it;
        setFontAttributes($this$setSpanStyles, contextTextStyle, list, function4);
        boolean hasLetterSpacing = false;
        int size = list.size();
        for (int i = 0; i < size; i++) {
            AnnotatedString.Range annotationRange = list.get(i);
            if (annotationRange.getItem() instanceof SpanStyle) {
                int start = annotationRange.getStart();
                int end = annotationRange.getEnd();
                if (start >= 0 && start < $this$setSpanStyles.length() && end > start && end <= $this$setSpanStyles.length()) {
                    setSpanStyle($this$setSpanStyles, (SpanStyle) annotationRange.getItem(), start, end, density);
                    if (getNeedsLetterSpacingSpan((SpanStyle) annotationRange.getItem())) {
                        hasLetterSpacing = true;
                    }
                }
            }
        }
        if (hasLetterSpacing) {
            int size2 = list.size();
            for (int i2 = 0; i2 < size2; i2++) {
                AnnotatedString.Range spanStyleRange = list.get(i2);
                AnnotatedString.Annotation style = spanStyleRange.getItem();
                if (style instanceof SpanStyle) {
                    int start2 = spanStyleRange.getStart();
                    int end2 = spanStyleRange.getEnd();
                    if (start2 >= 0 && start2 < $this$setSpanStyles.length() && end2 > start2 && end2 <= $this$setSpanStyles.length() && (it = m6613createLetterSpacingSpaneAf_CNQ(((SpanStyle) style).m6284getLetterSpacingXSAIIZE(), density)) != null) {
                        setSpan($this$setSpanStyles, it, start2, end2);
                    }
                }
            }
        }
    }

    private static final void setSpanStyle(Spannable $this$setSpanStyle, SpanStyle style, int start, int end, Density density) {
        m6617setBaselineShift0ocSgnM($this$setSpanStyle, style.m6279getBaselineShift5SSeXJ0(), start, end);
        m6618setColorRPmYEkk($this$setSpanStyle, style.m6280getColor0d7_KjU(), start, end);
        setBrush($this$setSpanStyle, style.getBrush(), style.getAlpha(), start, end);
        setTextDecoration($this$setSpanStyle, style.getTextDecoration(), start, end);
        m6619setFontSizeKmRG4DE($this$setSpanStyle, style.m6281getFontSizeXSAIIZE(), density, start, end);
        setFontFeatureSettings($this$setSpanStyle, style.getFontFeatureSettings(), start, end);
        setGeometricTransform($this$setSpanStyle, style.getTextGeometricTransform(), start, end);
        setLocaleList($this$setSpanStyle, style.getLocaleList(), start, end);
        m6616setBackgroundRPmYEkk($this$setSpanStyle, style.m6278getBackground0d7_KjU(), start, end);
        setShadow($this$setSpanStyle, style.getShadow(), start, end);
        setDrawStyle($this$setSpanStyle, style.getDrawStyle(), start, end);
    }

    private static final void setFontAttributes(final Spannable $this$setFontAttributes, TextStyle contextTextStyle, List<? extends AnnotatedString.Range<? extends AnnotatedString.Annotation>> list, final Function4<? super FontFamily, ? super FontWeight, ? super FontStyle, ? super FontSynthesis, ? extends Typeface> function4) {
        List target$iv = new ArrayList(list.size());
        int size = list.size();
        for (int index$iv$iv = 0; index$iv$iv < size; index$iv$iv++) {
            AnnotatedString.Range item$iv$iv = list.get(index$iv$iv);
            AnnotatedString.Range it = item$iv$iv;
            if ((it.getItem() instanceof SpanStyle) && (TextPaintExtensions_androidKt.hasFontAttributes((SpanStyle) it.getItem()) || ((SpanStyle) it.getItem()).m6283getFontSynthesisZQGJjVo() != null)) {
                AnnotatedString.Range it2 = item$iv$iv;
                Intrinsics.checkNotNull(it2, "null cannot be cast to non-null type androidx.compose.ui.text.AnnotatedString.Range<androidx.compose.ui.text.SpanStyle>");
                target$iv.add(it2);
            }
        }
        List fontRelatedSpanStyles = target$iv;
        SpanStyle contextFontSpanStyle = hasFontAttributes(contextTextStyle) ? new SpanStyle(0L, 0L, contextTextStyle.getFontWeight(), contextTextStyle.m6371getFontStyle4Lr2A7w(), contextTextStyle.m6372getFontSynthesisZQGJjVo(), contextTextStyle.getFontFamily(), (String) null, 0L, (BaselineShift) null, (TextGeometricTransform) null, (LocaleList) null, 0L, (TextDecoration) null, (Shadow) null, (PlatformSpanStyle) null, (DrawStyle) null, 65475, (DefaultConstructorMarker) null) : null;
        flattenFontStylesAndApply(contextFontSpanStyle, fontRelatedSpanStyles, new Function3<SpanStyle, Integer, Integer, Unit>() { // from class: androidx.compose.ui.text.platform.extensions.SpannableExtensions_androidKt$setFontAttributes$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            /* JADX WARN: Multi-variable type inference failed */
            {
                super(3);
            }

            @Override // kotlin.jvm.functions.Function3
            public /* bridge */ /* synthetic */ Unit invoke(SpanStyle spanStyle, Integer num, Integer num2) {
                invoke(spanStyle, num.intValue(), num2.intValue());
                return Unit.INSTANCE;
            }

            public final void invoke(SpanStyle spanStyle, int start, int end) {
                Spannable spannable = $this$setFontAttributes;
                Function4<FontFamily, FontWeight, FontStyle, FontSynthesis, Typeface> function42 = function4;
                FontFamily fontFamily = spanStyle.getFontFamily();
                FontWeight fontWeight = spanStyle.getFontWeight();
                if (fontWeight == null) {
                    fontWeight = FontWeight.Companion.getNormal();
                }
                FontStyle m6282getFontStyle4Lr2A7w = spanStyle.m6282getFontStyle4Lr2A7w();
                FontStyle m6447boximpl = FontStyle.m6447boximpl(m6282getFontStyle4Lr2A7w != null ? m6282getFontStyle4Lr2A7w.m6453unboximpl() : FontStyle.Companion.m6457getNormal_LCdwA());
                FontSynthesis m6283getFontSynthesisZQGJjVo = spanStyle.m6283getFontSynthesisZQGJjVo();
                spannable.setSpan(new TypefaceSpan(function42.invoke(fontFamily, fontWeight, m6447boximpl, FontSynthesis.m6458boximpl(m6283getFontSynthesisZQGJjVo != null ? m6283getFontSynthesisZQGJjVo.m6466unboximpl() : FontSynthesis.Companion.m6467getAllGVVA2EU()))), start, end, 33);
            }
        });
    }

    public static final void flattenFontStylesAndApply(SpanStyle contextFontSpanStyle, List<AnnotatedString.Range<SpanStyle>> list, Function3<? super SpanStyle, ? super Integer, ? super Integer, Unit> function3) {
        int spanCount;
        int i = 0;
        if (list.size() > 1) {
            int spanCount2 = list.size();
            int[] transitionOffsets = new int[spanCount2 * 2];
            int size = list.size();
            for (int index$iv = 0; index$iv < size; index$iv++) {
                AnnotatedString.Range item$iv = list.get(index$iv);
                AnnotatedString.Range spanStyle = item$iv;
                int idx = index$iv;
                transitionOffsets[idx] = spanStyle.getStart();
                transitionOffsets[idx + spanCount2] = spanStyle.getEnd();
            }
            ArraysKt.sort(transitionOffsets);
            int lastTransitionOffsets = ArraysKt.first(transitionOffsets);
            int length = transitionOffsets.length;
            while (i < length) {
                int transitionOffset = transitionOffsets[i];
                if (transitionOffset == lastTransitionOffsets) {
                    spanCount = spanCount2;
                } else {
                    SpanStyle spanStyle2 = contextFontSpanStyle;
                    int index$iv2 = 0;
                    int size2 = list.size();
                    while (index$iv2 < size2) {
                        AnnotatedString.Range item$iv2 = list.get(index$iv2);
                        AnnotatedString.Range spanStyle3 = item$iv2;
                        int spanCount3 = spanCount2;
                        if (spanStyle3.getStart() != spanStyle3.getEnd() && AnnotatedStringKt.intersect(lastTransitionOffsets, transitionOffset, spanStyle3.getStart(), spanStyle3.getEnd())) {
                            spanStyle2 = merge(spanStyle2, spanStyle3.getItem());
                        }
                        index$iv2++;
                        spanCount2 = spanCount3;
                    }
                    spanCount = spanCount2;
                    if (spanStyle2 != null) {
                        SpanStyle it = spanStyle2;
                        function3.invoke(it, Integer.valueOf(lastTransitionOffsets), Integer.valueOf(transitionOffset));
                    }
                    lastTransitionOffsets = transitionOffset;
                }
                i++;
                spanCount2 = spanCount;
            }
        } else if (!list.isEmpty()) {
            function3.invoke(merge(contextFontSpanStyle, list.get(0).getItem()), Integer.valueOf(list.get(0).getStart()), Integer.valueOf(list.get(0).getEnd()));
        }
    }

    /* renamed from: createLetterSpacingSpan-eAf_CNQ  reason: not valid java name */
    private static final MetricAffectingSpan m6613createLetterSpacingSpaneAf_CNQ(long letterSpacing, Density density) {
        long m7066getTypeUIouoOA = TextUnit.m7066getTypeUIouoOA(letterSpacing);
        if (TextUnitType.m7095equalsimpl0(m7066getTypeUIouoOA, TextUnitType.Companion.m7100getSpUIouoOA())) {
            return new LetterSpacingSpanPx(density.mo643toPxR2X_6o(letterSpacing));
        }
        if (TextUnitType.m7095equalsimpl0(m7066getTypeUIouoOA, TextUnitType.Companion.m7099getEmUIouoOA())) {
            return new LetterSpacingSpanEm(TextUnit.m7067getValueimpl(letterSpacing));
        }
        return null;
    }

    private static final boolean getNeedsLetterSpacingSpan(SpanStyle $this$needsLetterSpacingSpan) {
        return TextUnitType.m7095equalsimpl0(TextUnit.m7066getTypeUIouoOA($this$needsLetterSpacingSpan.m6284getLetterSpacingXSAIIZE()), TextUnitType.Companion.m7100getSpUIouoOA()) || TextUnitType.m7095equalsimpl0(TextUnit.m7066getTypeUIouoOA($this$needsLetterSpacingSpan.m6284getLetterSpacingXSAIIZE()), TextUnitType.Companion.m7099getEmUIouoOA());
    }

    private static final void setShadow(Spannable $this$setShadow, Shadow shadow, int start, int end) {
        if (shadow != null) {
            int m4343toArgb8_81llA = ColorKt.m4343toArgb8_81llA(shadow.m4614getColor0d7_KjU());
            long arg0$iv = shadow.m4615getOffsetF1C5BW0();
            int bits$iv$iv$iv = (int) (arg0$iv >> 32);
            float intBitsToFloat = Float.intBitsToFloat(bits$iv$iv$iv);
            long arg0$iv2 = shadow.m4615getOffsetF1C5BW0();
            int bits$iv$iv$iv2 = (int) (4294967295L & arg0$iv2);
            setSpan($this$setShadow, new ShadowSpan(m4343toArgb8_81llA, intBitsToFloat, Float.intBitsToFloat(bits$iv$iv$iv2), TextPaintExtensions_androidKt.correctBlurRadius(shadow.getBlurRadius())), start, end);
        }
    }

    private static final void setDrawStyle(Spannable $this$setDrawStyle, DrawStyle drawStyle, int start, int end) {
        if (drawStyle != null) {
            setSpan($this$setDrawStyle, new DrawStyleSpan(drawStyle), start, end);
        }
    }

    /* renamed from: setBackground-RPmYEkk  reason: not valid java name */
    public static final void m6616setBackgroundRPmYEkk(Spannable $this$setBackground_u2dRPmYEkk, long color, int start, int end) {
        if (color != 16) {
            setSpan($this$setBackground_u2dRPmYEkk, new BackgroundColorSpan(ColorKt.m4343toArgb8_81llA(color)), start, end);
        }
    }

    public static final void setLocaleList(Spannable $this$setLocaleList, LocaleList localeList, int start, int end) {
        if (localeList != null) {
            setSpan($this$setLocaleList, LocaleListHelperMethods.INSTANCE.localeSpan(localeList), start, end);
        }
    }

    private static final void setGeometricTransform(Spannable $this$setGeometricTransform, TextGeometricTransform textGeometricTransform, int start, int end) {
        if (textGeometricTransform != null) {
            setSpan($this$setGeometricTransform, new ScaleXSpan(textGeometricTransform.getScaleX()), start, end);
            setSpan($this$setGeometricTransform, new SkewXSpan(textGeometricTransform.getSkewX()), start, end);
        }
    }

    private static final void setFontFeatureSettings(Spannable $this$setFontFeatureSettings, String fontFeatureSettings, int start, int end) {
        if (fontFeatureSettings != null) {
            setSpan($this$setFontFeatureSettings, new FontFeatureSpan(fontFeatureSettings), start, end);
        }
    }

    /* renamed from: setFontSize-KmRG4DE  reason: not valid java name */
    public static final void m6619setFontSizeKmRG4DE(Spannable $this$setFontSize_u2dKmRG4DE, long fontSize, Density density, int start, int end) {
        long m7066getTypeUIouoOA = TextUnit.m7066getTypeUIouoOA(fontSize);
        if (TextUnitType.m7095equalsimpl0(m7066getTypeUIouoOA, TextUnitType.Companion.m7100getSpUIouoOA())) {
            setSpan($this$setFontSize_u2dKmRG4DE, new AbsoluteSizeSpan(MathKt.roundToInt(density.mo643toPxR2X_6o(fontSize)), false), start, end);
        } else if (TextUnitType.m7095equalsimpl0(m7066getTypeUIouoOA, TextUnitType.Companion.m7099getEmUIouoOA())) {
            setSpan($this$setFontSize_u2dKmRG4DE, new RelativeSizeSpan(TextUnit.m7067getValueimpl(fontSize)), start, end);
        }
    }

    public static final void setTextDecoration(Spannable $this$setTextDecoration, TextDecoration textDecoration, int start, int end) {
        if (textDecoration != null) {
            TextDecorationSpan textDecorationSpan = new TextDecorationSpan(textDecoration.contains(TextDecoration.Companion.getUnderline()), textDecoration.contains(TextDecoration.Companion.getLineThrough()));
            setSpan($this$setTextDecoration, textDecorationSpan, start, end);
        }
    }

    /* renamed from: setColor-RPmYEkk  reason: not valid java name */
    public static final void m6618setColorRPmYEkk(Spannable $this$setColor_u2dRPmYEkk, long color, int start, int end) {
        if (color != 16) {
            setSpan($this$setColor_u2dRPmYEkk, new ForegroundColorSpan(ColorKt.m4343toArgb8_81llA(color)), start, end);
        }
    }

    /* renamed from: setBaselineShift-0ocSgnM  reason: not valid java name */
    private static final void m6617setBaselineShift0ocSgnM(Spannable $this$setBaselineShift_u2d0ocSgnM, BaselineShift baselineShift, int start, int end) {
        if (baselineShift != null) {
            float it = baselineShift.m6635unboximpl();
            setSpan($this$setBaselineShift_u2d0ocSgnM, new BaselineShiftSpan(it), start, end);
        }
    }

    private static final void setBrush(Spannable $this$setBrush, Brush brush, float alpha, int start, int end) {
        if (brush != null) {
            if (brush instanceof SolidColor) {
                m6618setColorRPmYEkk($this$setBrush, ((SolidColor) brush).m4624getValue0d7_KjU(), start, end);
            } else if (brush instanceof ShaderBrush) {
                setSpan($this$setBrush, new ShaderBrushSpan((ShaderBrush) brush, alpha), start, end);
            }
        }
    }

    private static final boolean hasFontAttributes(TextStyle $this$hasFontAttributes) {
        return TextPaintExtensions_androidKt.hasFontAttributes($this$hasFontAttributes.toSpanStyle()) || $this$hasFontAttributes.m6372getFontSynthesisZQGJjVo() != null;
    }

    private static final SpanStyle merge(SpanStyle $this$merge, SpanStyle spanStyle) {
        return $this$merge == null ? spanStyle : $this$merge.merge(spanStyle);
    }
}
