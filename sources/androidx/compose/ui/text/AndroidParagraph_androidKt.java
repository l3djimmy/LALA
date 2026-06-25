package androidx.compose.ui.text;

import android.os.Build;
import android.text.Spannable;
import android.text.SpannableString;
import androidx.compose.ui.text.android.SpannedExtensions_androidKt;
import androidx.compose.ui.text.android.TextLayout;
import androidx.compose.ui.text.android.style.IndentationFixSpan;
import androidx.compose.ui.text.platform.extensions.SpannableExtensions_androidKt;
import androidx.compose.ui.text.style.Hyphens;
import androidx.compose.ui.text.style.LineBreak;
import androidx.compose.ui.text.style.TextAlign;
import androidx.compose.ui.unit.TextUnit;
import androidx.compose.ui.unit.TextUnitKt;
import kotlin.Metadata;
/* compiled from: AndroidParagraph.android.kt */
@Metadata(d1 = {"\u0000T\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\r\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u001a\u0018\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0001H\u0002\u001a\u001a\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\bH\u0002ø\u0001\u0000¢\u0006\u0004\b\t\u0010\n\u001a\u001a\u0010\u000b\u001a\u00020\u00062\u0006\u0010\f\u001a\u00020\rH\u0002ø\u0001\u0000¢\u0006\u0004\b\u000e\u0010\n\u001a\u001a\u0010\u000f\u001a\u00020\u00062\u0006\u0010\u0010\u001a\u00020\u0011H\u0002ø\u0001\u0000¢\u0006\u0004\b\u0012\u0010\n\u001a\u001a\u0010\u0013\u001a\u00020\u00062\u0006\u0010\u0014\u001a\u00020\u0015H\u0002ø\u0001\u0000¢\u0006\u0004\b\u0016\u0010\n\u001a\u001a\u0010\u0017\u001a\u00020\u00062\u0006\u0010\u0018\u001a\u00020\u0019H\u0002ø\u0001\u0000¢\u0006\u0004\b\u001a\u0010\n\u001a\f\u0010\u001b\u001a\u00020\u001c*\u00020\u001cH\u0002\u001a\u0014\u0010\u001d\u001a\u00020\u0006*\u00020\u001e2\u0006\u0010\u001f\u001a\u00020\u0006H\u0002\u001a\u0016\u0010 \u001a\u00020\u0006*\u00020!H\u0002ø\u0001\u0000¢\u0006\u0004\b\"\u0010\n\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006#"}, d2 = {"shouldAttachIndentationFixSpan", "", "textStyle", "Landroidx/compose/ui/text/TextStyle;", "ellipsis", "toLayoutAlign", "", "align", "Landroidx/compose/ui/text/style/TextAlign;", "toLayoutAlign-aXe7zB0", "(I)I", "toLayoutBreakStrategy", "breakStrategy", "Landroidx/compose/ui/text/style/LineBreak$Strategy;", "toLayoutBreakStrategy-xImikfE", "toLayoutHyphenationFrequency", "hyphens", "Landroidx/compose/ui/text/style/Hyphens;", "toLayoutHyphenationFrequency--3fSNIE", "toLayoutLineBreakStyle", "lineBreakStrictness", "Landroidx/compose/ui/text/style/LineBreak$Strictness;", "toLayoutLineBreakStyle-hpcqdu8", "toLayoutLineBreakWordStyle", "lineBreakWordStyle", "Landroidx/compose/ui/text/style/LineBreak$WordBreak;", "toLayoutLineBreakWordStyle-wPN0Rpw", "attachIndentationFixSpan", "", "numberOfLinesThatFitMaxHeight", "Landroidx/compose/ui/text/android/TextLayout;", "maxHeight", "toLayoutTextGranularity", "Landroidx/compose/ui/text/TextGranularity;", "toLayoutTextGranularity-duNsdkg", "ui-text_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class AndroidParagraph_androidKt {
    public static final /* synthetic */ CharSequence access$attachIndentationFixSpan(CharSequence $receiver) {
        return attachIndentationFixSpan($receiver);
    }

    public static final /* synthetic */ int access$numberOfLinesThatFitMaxHeight(TextLayout $receiver, int maxHeight) {
        return numberOfLinesThatFitMaxHeight($receiver, maxHeight);
    }

    public static final /* synthetic */ boolean access$shouldAttachIndentationFixSpan(TextStyle textStyle, boolean ellipsis) {
        return shouldAttachIndentationFixSpan(textStyle, ellipsis);
    }

    /* renamed from: access$toLayoutAlign-aXe7zB0  reason: not valid java name */
    public static final /* synthetic */ int m6156access$toLayoutAlignaXe7zB0(int align) {
        return m6162toLayoutAlignaXe7zB0(align);
    }

    /* renamed from: access$toLayoutBreakStrategy-xImikfE  reason: not valid java name */
    public static final /* synthetic */ int m6157access$toLayoutBreakStrategyxImikfE(int breakStrategy) {
        return m6163toLayoutBreakStrategyxImikfE(breakStrategy);
    }

    /* renamed from: access$toLayoutHyphenationFrequency--3fSNIE  reason: not valid java name */
    public static final /* synthetic */ int m6158access$toLayoutHyphenationFrequency3fSNIE(int hyphens) {
        return m6164toLayoutHyphenationFrequency3fSNIE(hyphens);
    }

    /* renamed from: access$toLayoutLineBreakStyle-hpcqdu8  reason: not valid java name */
    public static final /* synthetic */ int m6159access$toLayoutLineBreakStylehpcqdu8(int lineBreakStrictness) {
        return m6165toLayoutLineBreakStylehpcqdu8(lineBreakStrictness);
    }

    /* renamed from: access$toLayoutLineBreakWordStyle-wPN0Rpw  reason: not valid java name */
    public static final /* synthetic */ int m6160access$toLayoutLineBreakWordStylewPN0Rpw(int lineBreakWordStyle) {
        return m6166toLayoutLineBreakWordStylewPN0Rpw(lineBreakWordStyle);
    }

    /* renamed from: access$toLayoutTextGranularity-duNsdkg  reason: not valid java name */
    public static final /* synthetic */ int m6161access$toLayoutTextGranularityduNsdkg(int $receiver) {
        return m6167toLayoutTextGranularityduNsdkg($receiver);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: toLayoutAlign-aXe7zB0  reason: not valid java name */
    public static final int m6162toLayoutAlignaXe7zB0(int align) {
        if (TextAlign.m6753equalsimpl0(align, TextAlign.Companion.m6760getLefte0LSkKk())) {
            return 3;
        }
        if (TextAlign.m6753equalsimpl0(align, TextAlign.Companion.m6761getRighte0LSkKk())) {
            return 4;
        }
        if (TextAlign.m6753equalsimpl0(align, TextAlign.Companion.m6757getCentere0LSkKk())) {
            return 2;
        }
        return (!TextAlign.m6753equalsimpl0(align, TextAlign.Companion.m6762getStarte0LSkKk()) && TextAlign.m6753equalsimpl0(align, TextAlign.Companion.m6758getEnde0LSkKk())) ? 1 : 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: toLayoutHyphenationFrequency--3fSNIE  reason: not valid java name */
    public static final int m6164toLayoutHyphenationFrequency3fSNIE(int hyphens) {
        if (!Hyphens.m6651equalsimpl0(hyphens, Hyphens.Companion.m6655getAutovmbZdU8())) {
            return Hyphens.m6651equalsimpl0(hyphens, Hyphens.Companion.m6656getNonevmbZdU8()) ? 0 : 0;
        } else if (Build.VERSION.SDK_INT <= 32) {
            return 2;
        } else {
            return 4;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: toLayoutBreakStrategy-xImikfE  reason: not valid java name */
    public static final int m6163toLayoutBreakStrategyxImikfE(int breakStrategy) {
        if (LineBreak.Strategy.m6682equalsimpl0(breakStrategy, LineBreak.Strategy.Companion.m6688getSimplefcGXIks())) {
            return 0;
        }
        if (LineBreak.Strategy.m6682equalsimpl0(breakStrategy, LineBreak.Strategy.Companion.m6687getHighQualityfcGXIks())) {
            return 1;
        }
        return LineBreak.Strategy.m6682equalsimpl0(breakStrategy, LineBreak.Strategy.Companion.m6686getBalancedfcGXIks()) ? 2 : 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: toLayoutLineBreakStyle-hpcqdu8  reason: not valid java name */
    public static final int m6165toLayoutLineBreakStylehpcqdu8(int lineBreakStrictness) {
        if (LineBreak.Strictness.m6693equalsimpl0(lineBreakStrictness, LineBreak.Strictness.Companion.m6697getDefaultusljTpc())) {
            return 0;
        }
        if (LineBreak.Strictness.m6693equalsimpl0(lineBreakStrictness, LineBreak.Strictness.Companion.m6698getLooseusljTpc())) {
            return 1;
        }
        if (LineBreak.Strictness.m6693equalsimpl0(lineBreakStrictness, LineBreak.Strictness.Companion.m6699getNormalusljTpc())) {
            return 2;
        }
        return LineBreak.Strictness.m6693equalsimpl0(lineBreakStrictness, LineBreak.Strictness.Companion.m6700getStrictusljTpc()) ? 3 : 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: toLayoutLineBreakWordStyle-wPN0Rpw  reason: not valid java name */
    public static final int m6166toLayoutLineBreakWordStylewPN0Rpw(int lineBreakWordStyle) {
        return (!LineBreak.WordBreak.m6705equalsimpl0(lineBreakWordStyle, LineBreak.WordBreak.Companion.m6709getDefaultjp8hJ3c()) && LineBreak.WordBreak.m6705equalsimpl0(lineBreakWordStyle, LineBreak.WordBreak.Companion.m6710getPhrasejp8hJ3c())) ? 1 : 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final int numberOfLinesThatFitMaxHeight(TextLayout $this$numberOfLinesThatFitMaxHeight, int maxHeight) {
        int lineCount = $this$numberOfLinesThatFitMaxHeight.getLineCount();
        for (int lineIndex = 0; lineIndex < lineCount; lineIndex++) {
            if ($this$numberOfLinesThatFitMaxHeight.getLineBottom(lineIndex) > maxHeight) {
                return lineIndex;
            }
        }
        int lineIndex2 = $this$numberOfLinesThatFitMaxHeight.getLineCount();
        return lineIndex2;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean shouldAttachIndentationFixSpan(TextStyle textStyle, boolean ellipsis) {
        return (!ellipsis || TextUnit.m7064equalsimpl0(textStyle.m6375getLetterSpacingXSAIIZE(), TextUnitKt.getSp(0)) || TextUnit.m7064equalsimpl0(textStyle.m6375getLetterSpacingXSAIIZE(), TextUnit.Companion.m7078getUnspecifiedXSAIIZE()) || TextAlign.m6753equalsimpl0(textStyle.m6380getTextAligne0LSkKk(), TextAlign.Companion.m6763getUnspecifiede0LSkKk()) || TextAlign.m6753equalsimpl0(textStyle.m6380getTextAligne0LSkKk(), TextAlign.Companion.m6762getStarte0LSkKk()) || TextAlign.m6753equalsimpl0(textStyle.m6380getTextAligne0LSkKk(), TextAlign.Companion.m6759getJustifye0LSkKk())) ? false : true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final CharSequence attachIndentationFixSpan(CharSequence $this$attachIndentationFixSpan) {
        if ($this$attachIndentationFixSpan.length() == 0) {
            return $this$attachIndentationFixSpan;
        }
        SpannableString spannable = $this$attachIndentationFixSpan instanceof Spannable ? (Spannable) $this$attachIndentationFixSpan : null;
        if (spannable == null) {
            spannable = new SpannableString($this$attachIndentationFixSpan);
        }
        if (!SpannedExtensions_androidKt.hasSpan(spannable, IndentationFixSpan.class)) {
            SpannableExtensions_androidKt.setSpan(spannable, new IndentationFixSpan(), spannable.length() - 1, spannable.length() - 1);
        }
        return spannable;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: toLayoutTextGranularity-duNsdkg  reason: not valid java name */
    public static final int m6167toLayoutTextGranularityduNsdkg(int $this$toLayoutTextGranularity_u2dduNsdkg) {
        return (!TextGranularity.m6297equalsimpl0($this$toLayoutTextGranularity_u2dduNsdkg, TextGranularity.Companion.m6301getCharacterDRrd7Zo()) && TextGranularity.m6297equalsimpl0($this$toLayoutTextGranularity_u2dduNsdkg, TextGranularity.Companion.m6302getWordDRrd7Zo())) ? 1 : 0;
    }
}
