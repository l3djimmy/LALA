package androidx.compose.ui.text;

import androidx.compose.ui.text.style.Hyphens;
import androidx.compose.ui.text.style.LineBreak;
import androidx.compose.ui.text.style.LineHeightStyle;
import androidx.compose.ui.text.style.TextAlign;
import androidx.compose.ui.text.style.TextDirection;
import androidx.compose.ui.text.style.TextIndent;
import androidx.compose.ui.text.style.TextIndentKt;
import androidx.compose.ui.text.style.TextMotion;
import androidx.compose.ui.unit.LayoutDirection;
import androidx.compose.ui.unit.TextUnit;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
/* compiled from: ParagraphStyle.kt */
@Metadata(d1 = {"\u0000X\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0007\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\u001a \u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\bH\u0007\u001a&\u0010\t\u001a\u0004\u0018\u00010\n2\b\u0010\u0005\u001a\u0004\u0018\u00010\n2\b\u0010\u0006\u001a\u0004\u0018\u00010\n2\u0006\u0010\u0007\u001a\u00020\bH\u0002\u001a\u0018\u0010\u000b\u001a\u00020\u00042\u0006\u0010\f\u001a\u00020\u00042\u0006\u0010\r\u001a\u00020\u000eH\u0000\u001af\u0010\u000f\u001a\u00020\u0004*\u00020\u00042\u0006\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u00012\b\u0010\u0015\u001a\u0004\u0018\u00010\u00162\b\u0010\u0017\u001a\u0004\u0018\u00010\n2\b\u0010\u0018\u001a\u0004\u0018\u00010\u00192\u0006\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\u001c\u001a\u00020\u001d2\b\u0010\u001e\u001a\u0004\u0018\u00010\u001fH\u0000ø\u0001\u0000¢\u0006\u0004\b \u0010!\u001a\u0018\u0010\"\u001a\u0004\u0018\u00010\n*\u00020\u00042\b\u0010#\u001a\u0004\u0018\u00010\nH\u0002\"\u0010\u0010\u0000\u001a\u00020\u0001X\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u0002\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006$"}, d2 = {"DefaultLineHeight", "Landroidx/compose/ui/unit/TextUnit;", "J", "lerp", "Landroidx/compose/ui/text/ParagraphStyle;", "start", "stop", "fraction", "", "lerpPlatformStyle", "Landroidx/compose/ui/text/PlatformParagraphStyle;", "resolveParagraphStyleDefaults", "style", "direction", "Landroidx/compose/ui/unit/LayoutDirection;", "fastMerge", "textAlign", "Landroidx/compose/ui/text/style/TextAlign;", "textDirection", "Landroidx/compose/ui/text/style/TextDirection;", "lineHeight", "textIndent", "Landroidx/compose/ui/text/style/TextIndent;", "platformStyle", "lineHeightStyle", "Landroidx/compose/ui/text/style/LineHeightStyle;", "lineBreak", "Landroidx/compose/ui/text/style/LineBreak;", "hyphens", "Landroidx/compose/ui/text/style/Hyphens;", "textMotion", "Landroidx/compose/ui/text/style/TextMotion;", "fastMerge-j5T8yCg", "(Landroidx/compose/ui/text/ParagraphStyle;IIJLandroidx/compose/ui/text/style/TextIndent;Landroidx/compose/ui/text/PlatformParagraphStyle;Landroidx/compose/ui/text/style/LineHeightStyle;IILandroidx/compose/ui/text/style/TextMotion;)Landroidx/compose/ui/text/ParagraphStyle;", "mergePlatformStyle", "other", "ui-text_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class ParagraphStyleKt {
    private static final long DefaultLineHeight = TextUnit.Companion.m7078getUnspecifiedXSAIIZE();

    public static final ParagraphStyle lerp(ParagraphStyle start, ParagraphStyle stop, float fraction) {
        int m6756unboximpl = ((TextAlign) SpanStyleKt.lerpDiscrete(TextAlign.m6750boximpl(start.m6234getTextAligne0LSkKk()), TextAlign.m6750boximpl(stop.m6234getTextAligne0LSkKk()), fraction)).m6756unboximpl();
        int m6770unboximpl = ((TextDirection) SpanStyleKt.lerpDiscrete(TextDirection.m6764boximpl(start.m6236getTextDirections_7Xco()), TextDirection.m6764boximpl(stop.m6236getTextDirections_7Xco()), fraction)).m6770unboximpl();
        long m6286lerpTextUnitInheritableC3pnCVY = SpanStyleKt.m6286lerpTextUnitInheritableC3pnCVY(start.m6232getLineHeightXSAIIZE(), stop.m6232getLineHeightXSAIIZE(), fraction);
        TextIndent textIndent = start.getTextIndent();
        if (textIndent == null) {
            textIndent = TextIndent.Companion.getNone();
        }
        TextIndent textIndent2 = stop.getTextIndent();
        if (textIndent2 == null) {
            textIndent2 = TextIndent.Companion.getNone();
        }
        return new ParagraphStyle(m6756unboximpl, m6770unboximpl, m6286lerpTextUnitInheritableC3pnCVY, TextIndentKt.lerp(textIndent, textIndent2, fraction), lerpPlatformStyle(start.getPlatformStyle(), stop.getPlatformStyle(), fraction), (LineHeightStyle) SpanStyleKt.lerpDiscrete(start.getLineHeightStyle(), stop.getLineHeightStyle(), fraction), ((LineBreak) SpanStyleKt.lerpDiscrete(LineBreak.m6658boximpl(start.m6231getLineBreakrAG3T2k()), LineBreak.m6658boximpl(stop.m6231getLineBreakrAG3T2k()), fraction)).m6670unboximpl(), ((Hyphens) SpanStyleKt.lerpDiscrete(Hyphens.m6648boximpl(start.m6229getHyphensvmbZdU8()), Hyphens.m6648boximpl(stop.m6229getHyphensvmbZdU8()), fraction)).m6654unboximpl(), (TextMotion) SpanStyleKt.lerpDiscrete(start.getTextMotion(), stop.getTextMotion(), fraction), (DefaultConstructorMarker) null);
    }

    private static final PlatformParagraphStyle lerpPlatformStyle(PlatformParagraphStyle start, PlatformParagraphStyle stop, float fraction) {
        if (start == null && stop == null) {
            return null;
        }
        PlatformParagraphStyle startNonNull = start == null ? PlatformParagraphStyle.Companion.getDefault() : start;
        PlatformParagraphStyle stopNonNull = stop == null ? PlatformParagraphStyle.Companion.getDefault() : stop;
        return AndroidTextStyle_androidKt.lerp(startNonNull, stopNonNull, fraction);
    }

    public static final ParagraphStyle resolveParagraphStyleDefaults(ParagraphStyle style, LayoutDirection direction) {
        int m6762getStarte0LSkKk = TextAlign.m6753equalsimpl0(style.m6234getTextAligne0LSkKk(), TextAlign.Companion.m6763getUnspecifiede0LSkKk()) ? TextAlign.Companion.m6762getStarte0LSkKk() : style.m6234getTextAligne0LSkKk();
        int m6385resolveTextDirectionIhaHGbI = TextStyleKt.m6385resolveTextDirectionIhaHGbI(direction, style.m6236getTextDirections_7Xco());
        long $this$isUnspecified$iv = style.m6232getLineHeightXSAIIZE();
        long m6232getLineHeightXSAIIZE = (TextUnit.m7065getRawTypeimpl($this$isUnspecified$iv) > 0L ? 1 : (TextUnit.m7065getRawTypeimpl($this$isUnspecified$iv) == 0L ? 0 : -1)) == 0 ? DefaultLineHeight : style.m6232getLineHeightXSAIIZE();
        TextIndent textIndent = style.getTextIndent();
        if (textIndent == null) {
            textIndent = TextIndent.Companion.getNone();
        }
        PlatformParagraphStyle platformStyle = style.getPlatformStyle();
        LineHeightStyle lineHeightStyle = style.getLineHeightStyle();
        int m6677getSimplerAG3T2k = LineBreak.m6664equalsimpl0(style.m6231getLineBreakrAG3T2k(), LineBreak.Companion.m6678getUnspecifiedrAG3T2k()) ? LineBreak.Companion.m6677getSimplerAG3T2k() : style.m6231getLineBreakrAG3T2k();
        int m6656getNonevmbZdU8 = Hyphens.m6651equalsimpl0(style.m6229getHyphensvmbZdU8(), Hyphens.Companion.m6657getUnspecifiedvmbZdU8()) ? Hyphens.Companion.m6656getNonevmbZdU8() : style.m6229getHyphensvmbZdU8();
        TextMotion textMotion = style.getTextMotion();
        if (textMotion == null) {
            textMotion = TextMotion.Companion.getStatic();
        }
        return new ParagraphStyle(m6762getStarte0LSkKk, m6385resolveTextDirectionIhaHGbI, m6232getLineHeightXSAIIZE, textIndent, platformStyle, lineHeightStyle, m6677getSimplerAG3T2k, m6656getNonevmbZdU8, textMotion, (DefaultConstructorMarker) null);
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x0056, code lost:
        if (androidx.compose.ui.unit.TextUnit.m7064equalsimpl0(r10, r26.m6232getLineHeightXSAIIZE()) != false) goto L50;
     */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00d5 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00d6  */
    /* renamed from: fastMerge-j5T8yCg  reason: not valid java name */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final androidx.compose.ui.text.ParagraphStyle m6237fastMergej5T8yCg(androidx.compose.ui.text.ParagraphStyle r26, int r27, int r28, long r29, androidx.compose.ui.text.style.TextIndent r31, androidx.compose.ui.text.PlatformParagraphStyle r32, androidx.compose.ui.text.style.LineHeightStyle r33, int r34, int r35, androidx.compose.ui.text.style.TextMotion r36) {
        /*
            Method dump skipped, instructions count: 376
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.ui.text.ParagraphStyleKt.m6237fastMergej5T8yCg(androidx.compose.ui.text.ParagraphStyle, int, int, long, androidx.compose.ui.text.style.TextIndent, androidx.compose.ui.text.PlatformParagraphStyle, androidx.compose.ui.text.style.LineHeightStyle, int, int, androidx.compose.ui.text.style.TextMotion):androidx.compose.ui.text.ParagraphStyle");
    }

    private static final PlatformParagraphStyle mergePlatformStyle(ParagraphStyle $this$mergePlatformStyle, PlatformParagraphStyle other) {
        return $this$mergePlatformStyle.getPlatformStyle() == null ? other : other == null ? $this$mergePlatformStyle.getPlatformStyle() : $this$mergePlatformStyle.getPlatformStyle().merge(other);
    }
}
