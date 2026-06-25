package androidx.compose.ui.text.android;

import android.text.BoringLayout;
import android.text.Layout;
import android.text.TextDirectionHeuristic;
import android.text.TextPaint;
import java.text.BreakIterator;
import java.util.Comparator;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.PriorityQueue;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: LayoutIntrinsics.android.kt */
@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\r\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0007\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\u000e\b\u0000\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007¢\u0006\u0002\u0010\bJ\b\u0010\u001c\u001a\u00020\rH\u0002J\b\u0010\u001d\u001a\u00020\rH\u0002J\u001c\u0010\u001e\u001a\u00020\r2\b\b\u0002\u0010\u001f\u001a\u00020\u00072\b\b\u0002\u0010 \u001a\u00020\u0007H\u0002R\u0010\u0010\t\u001a\u0004\u0018\u00010\nX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\u000b\u001a\u0004\u0018\u00010\u0003X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\f\u001a\u00020\rX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\rX\u0082\u000e¢\u0006\u0002\n\u0000R\u0013\u0010\u000f\u001a\u0004\u0018\u00010\n8F¢\u0006\u0006\u001a\u0004\b\u0010\u0010\u0011R\u000e\u0010\u0012\u001a\u00020\u0013X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0014\u001a\u00020\u00038BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u0015\u0010\u0016R\u0011\u0010\u0017\u001a\u00020\r8F¢\u0006\u0006\u001a\u0004\b\u0018\u0010\u0019R\u0011\u0010\u001a\u001a\u00020\r8F¢\u0006\u0006\u001a\u0004\b\u001b\u0010\u0019R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006!"}, d2 = {"Landroidx/compose/ui/text/android/LayoutIntrinsics;", "", "charSequence", "", "textPaint", "Landroid/text/TextPaint;", "textDirectionHeuristic", "", "(Ljava/lang/CharSequence;Landroid/text/TextPaint;I)V", "_boringMetrics", "Landroid/text/BoringLayout$Metrics;", "_charSequenceForIntrinsicWidth", "_maxIntrinsicWidth", "", "_minIntrinsicWidth", "boringMetrics", "getBoringMetrics", "()Landroid/text/BoringLayout$Metrics;", "boringMetricsIsInit", "", "charSequenceForIntrinsicWidth", "getCharSequenceForIntrinsicWidth", "()Ljava/lang/CharSequence;", "maxIntrinsicWidth", "getMaxIntrinsicWidth", "()F", "minIntrinsicWidth", "getMinIntrinsicWidth", "computeMaxIntrinsicWidth", "computeMinIntrinsicWidth", "getDesiredWidth", "start", "end", "ui-text_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class LayoutIntrinsics {
    public static final int $stable = 8;
    private BoringLayout.Metrics _boringMetrics;
    private CharSequence _charSequenceForIntrinsicWidth;
    private float _maxIntrinsicWidth = Float.NaN;
    private float _minIntrinsicWidth = Float.NaN;
    private boolean boringMetricsIsInit;
    private final CharSequence charSequence;
    private final int textDirectionHeuristic;
    private final TextPaint textPaint;

    public LayoutIntrinsics(CharSequence charSequence, TextPaint textPaint, int textDirectionHeuristic) {
        this.charSequence = charSequence;
        this.textPaint = textPaint;
        this.textDirectionHeuristic = textDirectionHeuristic;
    }

    private final CharSequence getCharSequenceForIntrinsicWidth() {
        boolean z;
        CharSequence it;
        if (this._charSequenceForIntrinsicWidth == null) {
            z = LayoutIntrinsics_androidKt.stripNonMetricAffectingCharSpans;
            CharSequence charSequence = this.charSequence;
            if (z) {
                it = LayoutIntrinsics_androidKt.stripNonMetricAffectingCharacterStyleSpans(charSequence);
                this._charSequenceForIntrinsicWidth = it;
                return it;
            }
            return charSequence;
        }
        CharSequence charSequence2 = this._charSequenceForIntrinsicWidth;
        Intrinsics.checkNotNull(charSequence2);
        return charSequence2;
    }

    public final BoringLayout.Metrics getBoringMetrics() {
        if (!this.boringMetricsIsInit) {
            TextDirectionHeuristic frameworkTextDir = TextLayout_androidKt.getTextDirectionHeuristic(this.textDirectionHeuristic);
            this._boringMetrics = BoringLayoutFactory.INSTANCE.measure(this.charSequence, this.textPaint, frameworkTextDir);
            this.boringMetricsIsInit = true;
        }
        return this._boringMetrics;
    }

    public final float getMinIntrinsicWidth() {
        if (Float.isNaN(this._minIntrinsicWidth)) {
            this._minIntrinsicWidth = computeMinIntrinsicWidth();
        }
        return this._minIntrinsicWidth;
    }

    private final float computeMinIntrinsicWidth() {
        BreakIterator iterator = BreakIterator.getLineInstance(this.textPaint.getTextLocale());
        iterator.setText(new CharSequenceCharacterIterator(this.charSequence, 0, this.charSequence.length()));
        PriorityQueue longestWordCandidates = new PriorityQueue(10, new Comparator() { // from class: androidx.compose.ui.text.android.LayoutIntrinsics$$ExternalSyntheticLambda0
            @Override // java.util.Comparator
            public final int compare(Object obj, Object obj2) {
                return LayoutIntrinsics.computeMinIntrinsicWidth$lambda$1((Pair) obj, (Pair) obj2);
            }
        });
        int start = 0;
        for (int end = iterator.next(); end != -1; end = iterator.next()) {
            if (longestWordCandidates.size() < 10) {
                longestWordCandidates.add(new Pair(Integer.valueOf(start), Integer.valueOf(end)));
            } else {
                Pair minPair = (Pair) longestWordCandidates.peek();
                if (minPair != null && ((Number) minPair.getSecond()).intValue() - ((Number) minPair.getFirst()).intValue() < end - start) {
                    longestWordCandidates.poll();
                    longestWordCandidates.add(new Pair(Integer.valueOf(start), Integer.valueOf(end)));
                }
            }
            start = end;
        }
        if (longestWordCandidates.isEmpty()) {
            return 0.0f;
        }
        Iterator it = longestWordCandidates.iterator();
        if (it.hasNext()) {
            Pair pair = (Pair) it.next();
            int start2 = ((Number) pair.component1()).intValue();
            int end2 = ((Number) pair.component2()).intValue();
            float desiredWidth = getDesiredWidth(start2, end2);
            while (it.hasNext()) {
                Pair pair2 = (Pair) it.next();
                int start3 = ((Number) pair2.component1()).intValue();
                int end3 = ((Number) pair2.component2()).intValue();
                desiredWidth = Math.max(desiredWidth, getDesiredWidth(start3, end3));
            }
            return desiredWidth;
        }
        throw new NoSuchElementException();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final int computeMinIntrinsicWidth$lambda$1(Pair left, Pair right) {
        return (((Number) left.getSecond()).intValue() - ((Number) left.getFirst()).intValue()) - (((Number) right.getSecond()).intValue() - ((Number) right.getFirst()).intValue());
    }

    public final float getMaxIntrinsicWidth() {
        if (Float.isNaN(this._maxIntrinsicWidth)) {
            this._maxIntrinsicWidth = computeMaxIntrinsicWidth();
        }
        return this._maxIntrinsicWidth;
    }

    private final float computeMaxIntrinsicWidth() {
        boolean shouldIncreaseMaxIntrinsic;
        BoringLayout.Metrics boringMetrics = getBoringMetrics();
        float desiredWidth = boringMetrics != null ? boringMetrics.width : -1;
        if (desiredWidth < 0.0f) {
            desiredWidth = (float) Math.ceil(getDesiredWidth$default(this, 0, 0, 3, null));
        }
        shouldIncreaseMaxIntrinsic = LayoutIntrinsics_androidKt.shouldIncreaseMaxIntrinsic(desiredWidth, this.charSequence, this.textPaint);
        if (shouldIncreaseMaxIntrinsic) {
            return desiredWidth + 0.5f;
        }
        return desiredWidth;
    }

    static /* synthetic */ float getDesiredWidth$default(LayoutIntrinsics layoutIntrinsics, int i, int i2, int i3, Object obj) {
        if ((i3 & 1) != 0) {
            i = 0;
        }
        if ((i3 & 2) != 0) {
            i2 = layoutIntrinsics.getCharSequenceForIntrinsicWidth().length();
        }
        return layoutIntrinsics.getDesiredWidth(i, i2);
    }

    private final float getDesiredWidth(int start, int end) {
        return Layout.getDesiredWidth(getCharSequenceForIntrinsicWidth(), start, end, this.textPaint);
    }
}
