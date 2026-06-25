package androidx.compose.ui.text.android;

import android.text.SpannableString;
import android.text.Spanned;
import android.text.TextPaint;
import android.text.style.CharacterStyle;
import android.text.style.MetricAffectingSpan;
import androidx.compose.ui.text.android.style.LetterSpacingSpanEm;
import androidx.compose.ui.text.android.style.LetterSpacingSpanPx;
import kotlin.Metadata;
/* compiled from: LayoutIntrinsics.android.kt */
@Metadata(d1 = {"\u0000\u001e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\u0007\n\u0000\n\u0002\u0010\r\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\u001a \u0010\u0004\u001a\u00020\u00012\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\nH\u0002\u001a\u0010\u0010\u000b\u001a\u00020\b2\u0006\u0010\u0007\u001a\u00020\bH\u0002\"\u0014\u0010\u0000\u001a\u00020\u0001X\u0082D¢\u0006\b\n\u0000\u0012\u0004\b\u0002\u0010\u0003¨\u0006\f"}, d2 = {"stripNonMetricAffectingCharSpans", "", "getStripNonMetricAffectingCharSpans$annotations", "()V", "shouldIncreaseMaxIntrinsic", "desiredWidth", "", "charSequence", "", "textPaint", "Landroid/text/TextPaint;", "stripNonMetricAffectingCharacterStyleSpans", "ui-text_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class LayoutIntrinsics_androidKt {
    private static final boolean stripNonMetricAffectingCharSpans = true;

    private static /* synthetic */ void getStripNonMetricAffectingCharSpans$annotations() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final CharSequence stripNonMetricAffectingCharacterStyleSpans(CharSequence charSequence) {
        if (!(charSequence instanceof Spanned) || !SpannedExtensions_androidKt.hasSpan((Spanned) charSequence, CharacterStyle.class)) {
            return charSequence;
        }
        CharacterStyle[] spans = (CharacterStyle[]) ((Spanned) charSequence).getSpans(0, charSequence.length(), CharacterStyle.class);
        boolean z = true;
        if (spans != null) {
            if (!(spans.length == 0)) {
                z = false;
            }
        }
        if (z) {
            return charSequence;
        }
        SpannableString spannableString = null;
        for (CharacterStyle span : spans) {
            if (!(span instanceof MetricAffectingSpan)) {
                if (spannableString == null) {
                    spannableString = new SpannableString(charSequence);
                }
                spannableString.removeSpan(span);
            }
        }
        return spannableString != null ? spannableString : charSequence;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean shouldIncreaseMaxIntrinsic(float desiredWidth, CharSequence charSequence, TextPaint textPaint) {
        if (!(desiredWidth == 0.0f)) {
            if ((charSequence instanceof Spanned) && (SpannedExtensions_androidKt.hasSpan((Spanned) charSequence, LetterSpacingSpanPx.class) || SpannedExtensions_androidKt.hasSpan((Spanned) charSequence, LetterSpacingSpanEm.class))) {
                return true;
            }
            if (!(textPaint.getLetterSpacing() == 0.0f)) {
                return true;
            }
        }
        return false;
    }
}
