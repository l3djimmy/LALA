package androidx.compose.foundation.text;

import androidx.compose.foundation.text.modifiers.TextAutoSizeLayoutScope;
import androidx.compose.ui.text.AnnotatedString;
import androidx.compose.ui.text.TextLayoutResult;
import androidx.compose.ui.text.style.TextOverflow;
import androidx.compose.ui.unit.TextUnit;
import androidx.compose.ui.unit.TextUnitKt;
import androidx.compose.ui.unit.TextUnitType;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
/* compiled from: TextAutoSize.kt */
@Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0002\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003¢\u0006\u0002\u0010\u0006J\u0013\u0010\f\u001a\u00020\t2\b\u0010\r\u001a\u0004\u0018\u00010\u000eH\u0096\u0002J\b\u0010\u000f\u001a\u00020\u0010H\u0016J&\u0010\u0011\u001a\u00020\u0003*\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u0016H\u0016ø\u0001\u0000¢\u0006\u0004\b\u0017\u0010\u0018R\u0016\u0010\u0004\u001a\u00020\u0003X\u0082\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u0007R\u0016\u0010\u0002\u001a\u00020\u0003X\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u0007R\u0016\u0010\u0005\u001a\u00020\u0003X\u0082\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u0007R\u0018\u0010\b\u001a\u00020\t*\u00020\n8BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\b\u0010\u000b\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006\u0019"}, d2 = {"Landroidx/compose/foundation/text/AutoSizeStepBased;", "Landroidx/compose/foundation/text/TextAutoSize;", "minFontSize", "Landroidx/compose/ui/unit/TextUnit;", "maxFontSize", "stepSize", "(JJJLkotlin/jvm/internal/DefaultConstructorMarker;)V", "J", "isLastLineEllipsized", "", "Landroidx/compose/ui/text/TextLayoutResult;", "(Landroidx/compose/ui/text/TextLayoutResult;)Z", "equals", "other", "", "hashCode", "", "getFontSize", "Landroidx/compose/foundation/text/modifiers/TextAutoSizeLayoutScope;", "constraints", "Landroidx/compose/ui/unit/Constraints;", "text", "Landroidx/compose/ui/text/AnnotatedString;", "getFontSize-Ci0_558", "(Landroidx/compose/foundation/text/modifiers/TextAutoSizeLayoutScope;JLandroidx/compose/ui/text/AnnotatedString;)J", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
final class AutoSizeStepBased implements TextAutoSize {
    private final long maxFontSize;
    private long minFontSize;
    private final long stepSize;

    public /* synthetic */ AutoSizeStepBased(long j, long j2, long j3, DefaultConstructorMarker defaultConstructorMarker) {
        this(j, j2, j3);
    }

    private AutoSizeStepBased(long minFontSize, long maxFontSize, long stepSize) {
        this.minFontSize = minFontSize;
        this.maxFontSize = maxFontSize;
        this.stepSize = stepSize;
        if (TextUnit.m7064equalsimpl0(this.minFontSize, TextUnit.Companion.m7078getUnspecifiedXSAIIZE())) {
            throw new IllegalArgumentException("AutoSize.StepBased: TextUnit.Unspecified is not a valid value for minFontSize. Try using other values e.g. 10.sp");
        }
        if (TextUnit.m7064equalsimpl0(this.maxFontSize, TextUnit.Companion.m7078getUnspecifiedXSAIIZE())) {
            throw new IllegalArgumentException("AutoSize.StepBased: TextUnit.Unspecified is not a valid value for maxFontSize. Try using other values e.g. 100.sp");
        }
        if (TextUnit.m7064equalsimpl0(this.stepSize, TextUnit.Companion.m7078getUnspecifiedXSAIIZE())) {
            throw new IllegalArgumentException("AutoSize.StepBased: TextUnit.Unspecified is not a valid value for stepSize. Try using other values e.g. 0.25.sp");
        }
        if (TextUnitType.m7095equalsimpl0(TextUnit.m7066getTypeUIouoOA(this.minFontSize), TextUnit.m7066getTypeUIouoOA(this.maxFontSize))) {
            long arg0$iv = this.minFontSize;
            long other$iv = this.maxFontSize;
            TextUnitKt.m7081checkArithmeticNB67dxo(arg0$iv, other$iv);
            if (Float.compare(TextUnit.m7067getValueimpl(arg0$iv), TextUnit.m7067getValueimpl(other$iv)) > 0) {
                this.minFontSize = this.maxFontSize;
            }
        }
        if (TextUnitType.m7095equalsimpl0(TextUnit.m7066getTypeUIouoOA(this.stepSize), TextUnitType.Companion.m7100getSpUIouoOA())) {
            long arg0$iv2 = this.stepSize;
            long other$iv2 = TextUnitKt.getSp(1.0E-4f);
            TextUnitKt.m7081checkArithmeticNB67dxo(arg0$iv2, other$iv2);
            if (Float.compare(TextUnit.m7067getValueimpl(arg0$iv2), TextUnit.m7067getValueimpl(other$iv2)) < 0) {
                throw new IllegalArgumentException("AutoSize.StepBased: stepSize must be greater than or equal to 0.0001f.sp");
            }
        }
        if (TextUnit.m7067getValueimpl(this.minFontSize) < 0.0f) {
            throw new IllegalArgumentException("AutoSize.StepBased: minFontSize must not be negative");
        }
        if (TextUnit.m7067getValueimpl(this.maxFontSize) >= 0.0f) {
            return;
        }
        throw new IllegalArgumentException("AutoSize.StepBased: maxFontSize must not be negative");
    }

    private final boolean isLastLineEllipsized(TextLayoutResult $this$isLastLineEllipsized) {
        if ($this$isLastLineEllipsized.getLineCount() > 0) {
            return $this$isLastLineEllipsized.isLineEllipsized($this$isLastLineEllipsized.getLineCount() - 1);
        }
        return false;
    }

    @Override // androidx.compose.foundation.text.TextAutoSize
    /* renamed from: getFontSize-Ci0_558  reason: not valid java name */
    public long mo1290getFontSizeCi0_558(TextAutoSizeLayoutScope $this$getFontSize_u2dCi0_558, long constraints, AnnotatedString text) {
        float stepSize = $this$getFontSize_u2dCi0_558.mo643toPxR2X_6o(this.stepSize);
        float smallest = $this$getFontSize_u2dCi0_558.mo643toPxR2X_6o(this.minFontSize);
        float largest = $this$getFontSize_u2dCi0_558.mo643toPxR2X_6o(this.maxFontSize);
        float min = smallest;
        float max = largest;
        float current = (smallest + largest) / 2.0f;
        while (true) {
            boolean didOverflow = false;
            if (max - min >= stepSize) {
                TextLayoutResult layoutResult = $this$getFontSize_u2dCi0_558.mo1679performLayout5ZSfY2I(constraints, text, $this$getFontSize_u2dCi0_558.mo647toSpkPz2Gy4(current));
                int m6306getOverflowgIe3tQ8 = layoutResult.getLayoutInput().m6306getOverflowgIe3tQ8();
                if (TextOverflow.m6799equalsimpl0(m6306getOverflowgIe3tQ8, TextOverflow.Companion.m6808getClipgIe3tQ8()) ? true : TextOverflow.m6799equalsimpl0(m6306getOverflowgIe3tQ8, TextOverflow.Companion.m6812getVisiblegIe3tQ8())) {
                    if (layoutResult.getDidOverflowWidth() || layoutResult.getDidOverflowHeight()) {
                        didOverflow = true;
                    }
                } else {
                    if (TextOverflow.m6799equalsimpl0(m6306getOverflowgIe3tQ8, TextOverflow.Companion.m6811getStartEllipsisgIe3tQ8()) ? true : TextOverflow.m6799equalsimpl0(m6306getOverflowgIe3tQ8, TextOverflow.Companion.m6810getMiddleEllipsisgIe3tQ8()) ? true : TextOverflow.m6799equalsimpl0(m6306getOverflowgIe3tQ8, TextOverflow.Companion.m6809getEllipsisgIe3tQ8())) {
                        int lineIndex = 0;
                        while (lineIndex < layoutResult.getLineCount() && !layoutResult.isLineEllipsized(lineIndex)) {
                            lineIndex++;
                        }
                        if (lineIndex > 0) {
                            didOverflow = true;
                        }
                    } else {
                        throw new IllegalArgumentException("TextOverflow type " + ((Object) TextOverflow.m6801toStringimpl(layoutResult.getLayoutInput().m6306getOverflowgIe3tQ8())) + " is not supported.");
                    }
                }
                if (didOverflow) {
                    max = current;
                } else {
                    float max2 = current;
                    min = max2;
                }
                current = (min + max) / 2.0f;
            } else {
                float current2 = (((float) Math.floor((min - smallest) / stepSize)) * stepSize) + smallest;
                if (current2 + stepSize <= largest) {
                    TextLayoutResult layoutResult2 = $this$getFontSize_u2dCi0_558.mo1679performLayout5ZSfY2I(constraints, text, $this$getFontSize_u2dCi0_558.mo647toSpkPz2Gy4(current2 + stepSize));
                    if (layoutResult2.getDidOverflowWidth() || layoutResult2.getDidOverflowHeight()) {
                        didOverflow = true;
                    }
                    if (!didOverflow) {
                        current2 += stepSize;
                    }
                }
                return $this$getFontSize_u2dCi0_558.mo647toSpkPz2Gy4(current2);
            }
        }
    }

    @Override // androidx.compose.foundation.text.TextAutoSize
    public boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (other != null && (other instanceof AutoSizeStepBased) && TextUnit.m7064equalsimpl0(((AutoSizeStepBased) other).minFontSize, this.minFontSize) && TextUnit.m7064equalsimpl0(((AutoSizeStepBased) other).maxFontSize, this.maxFontSize) && TextUnit.m7064equalsimpl0(((AutoSizeStepBased) other).stepSize, this.stepSize)) {
            return true;
        }
        return false;
    }

    @Override // androidx.compose.foundation.text.TextAutoSize
    public int hashCode() {
        int result = TextUnit.m7068hashCodeimpl(this.minFontSize);
        return (((result * 31) + TextUnit.m7068hashCodeimpl(this.maxFontSize)) * 31) + TextUnit.m7068hashCodeimpl(this.stepSize);
    }
}
