package androidx.compose.foundation.text.input;

import androidx.compose.foundation.text.input.internal.ToCharArray_androidKt;
import androidx.compose.ui.text.AnnotatedString;
import androidx.compose.ui.text.TextRange;
import androidx.compose.ui.text.TextRangeKt;
import java.util.List;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.StringsKt;
/* compiled from: TextFieldCharSequence.kt */
@Metadata(d1 = {"\u0000d\n\u0002\u0018\u0002\n\u0002\u0010\r\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\b\n\u0002\b\b\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\f\n\u0002\b\u0007\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0019\n\u0002\b\u0004\n\u0002\u0010\u000e\n\u0000\b\u0000\u0018\u00002\u00020\u0001BY\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0001\u0012\b\b\u0002\u0010\u0003\u001a\u00020\u0004\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u0012\u0016\b\u0002\u0010\u0006\u001a\u0010\u0012\u0004\u0012\u00020\b\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u0007\u0012\u001a\b\u0002\u0010\t\u001a\u0014\u0012\u000e\u0012\f\u0012\u0004\u0012\u00020\f0\u000bj\u0002`\r\u0018\u00010\n¢\u0006\u0002\u0010\u000eJ\u000e\u0010\u001e\u001a\u00020\u001f2\u0006\u0010 \u001a\u00020\u0001J\u0013\u0010!\u001a\u00020\u001f2\b\u0010 \u001a\u0004\u0018\u00010\"H\u0096\u0002J\u0011\u0010#\u001a\u00020$2\u0006\u0010%\u001a\u00020\u0016H\u0096\u0002J\b\u0010&\u001a\u00020\u0016H\u0016J\u0006\u0010'\u001a\u00020\u001fJ\u0018\u0010(\u001a\u00020\u00012\u0006\u0010)\u001a\u00020\u00162\u0006\u0010*\u001a\u00020\u0016H\u0016J&\u0010+\u001a\u00020,2\u0006\u0010-\u001a\u00020.2\u0006\u0010/\u001a\u00020\u00162\u0006\u00100\u001a\u00020\u00162\u0006\u00101\u001a\u00020\u0016J\b\u00102\u001a\u000203H\u0016R#\u0010\t\u001a\u0014\u0012\u000e\u0012\f\u0012\u0004\u0012\u00020\f0\u000bj\u0002`\r\u0018\u00010\n¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u001f\u0010\u0006\u001a\u0010\u0012\u0004\u0012\u00020\b\u0012\u0004\u0012\u00020\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014R\u0014\u0010\u0015\u001a\u00020\u00168VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u0017\u0010\u0018R\u0019\u0010\u0003\u001a\u00020\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\n\n\u0002\u0010\u001b\u001a\u0004\b\u0019\u0010\u001aR\u0011\u0010\u0002\u001a\u00020\u0001¢\u0006\b\n\u0000\u001a\u0004\b\u001c\u0010\u001d\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u00064"}, d2 = {"Landroidx/compose/foundation/text/input/TextFieldCharSequence;", "", "text", "selection", "Landroidx/compose/ui/text/TextRange;", "composition", "highlight", "Lkotlin/Pair;", "Landroidx/compose/foundation/text/input/TextHighlightType;", "composingAnnotations", "", "Landroidx/compose/ui/text/AnnotatedString$Range;", "Landroidx/compose/ui/text/AnnotatedString$Annotation;", "Landroidx/compose/foundation/text/input/PlacedAnnotation;", "(Ljava/lang/CharSequence;JLandroidx/compose/ui/text/TextRange;Lkotlin/Pair;Ljava/util/List;Lkotlin/jvm/internal/DefaultConstructorMarker;)V", "getComposingAnnotations", "()Ljava/util/List;", "getComposition-MzsxiRA", "()Landroidx/compose/ui/text/TextRange;", "getHighlight", "()Lkotlin/Pair;", "length", "", "getLength", "()I", "getSelection-d9O1mEE", "()J", "J", "getText", "()Ljava/lang/CharSequence;", "contentEquals", "", "other", "equals", "", "get", "", "index", "hashCode", "shouldShowSelection", "subSequence", "startIndex", "endIndex", "toCharArray", "", "destination", "", "destinationOffset", "sourceStartIndex", "sourceEndIndex", "toString", "", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class TextFieldCharSequence implements CharSequence {
    public static final int $stable = 8;
    private final List<AnnotatedString.Range<AnnotatedString.Annotation>> composingAnnotations;
    private final TextRange composition;
    private final Pair<TextHighlightType, TextRange> highlight;
    private final long selection;
    private final CharSequence text;

    public /* synthetic */ TextFieldCharSequence(CharSequence charSequence, long j, TextRange textRange, Pair pair, List list, DefaultConstructorMarker defaultConstructorMarker) {
        this(charSequence, j, textRange, pair, list);
    }

    private TextFieldCharSequence(CharSequence text, long selection, TextRange composition, Pair<TextHighlightType, TextRange> pair, List<AnnotatedString.Range<AnnotatedString.Annotation>> list) {
        this.composingAnnotations = list;
        this.text = text instanceof TextFieldCharSequence ? ((TextFieldCharSequence) text).text : text;
        this.selection = TextRangeKt.m6345coerceIn8ffj60Q(selection, 0, text.length());
        this.composition = composition != null ? TextRange.m6327boximpl(TextRangeKt.m6345coerceIn8ffj60Q(composition.m6343unboximpl(), 0, text.length())) : null;
        this.highlight = pair != null ? Pair.copy$default(pair, null, TextRange.m6327boximpl(TextRangeKt.m6345coerceIn8ffj60Q(pair.getSecond().m6343unboximpl(), 0, text.length())), 1, null) : null;
    }

    public /* synthetic */ TextFieldCharSequence(CharSequence charSequence, long j, TextRange textRange, Pair pair, List list, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this((i & 1) != 0 ? "" : charSequence, (i & 2) != 0 ? TextRange.Companion.m6344getZerod9O1mEE() : j, (i & 4) != 0 ? null : textRange, (i & 8) != 0 ? null : pair, (i & 16) == 0 ? list : null, null);
    }

    @Override // java.lang.CharSequence
    public final /* bridge */ char charAt(int index) {
        return get(index);
    }

    @Override // java.lang.CharSequence
    public final /* bridge */ int length() {
        return getLength();
    }

    public final List<AnnotatedString.Range<AnnotatedString.Annotation>> getComposingAnnotations() {
        return this.composingAnnotations;
    }

    public int getLength() {
        return this.text.length();
    }

    public final CharSequence getText() {
        return this.text;
    }

    /* renamed from: getSelection-d9O1mEE  reason: not valid java name */
    public final long m1456getSelectiond9O1mEE() {
        return this.selection;
    }

    /* renamed from: getComposition-MzsxiRA  reason: not valid java name */
    public final TextRange m1455getCompositionMzsxiRA() {
        return this.composition;
    }

    public final Pair<TextHighlightType, TextRange> getHighlight() {
        return this.highlight;
    }

    public char get(int index) {
        return this.text.charAt(index);
    }

    @Override // java.lang.CharSequence
    public CharSequence subSequence(int startIndex, int endIndex) {
        return this.text.subSequence(startIndex, endIndex);
    }

    @Override // java.lang.CharSequence
    public String toString() {
        return this.text.toString();
    }

    public final boolean contentEquals(CharSequence other) {
        return StringsKt.contentEquals(this.text, other);
    }

    public final void toCharArray(char[] destination, int destinationOffset, int sourceStartIndex, int sourceEndIndex) {
        ToCharArray_androidKt.toCharArray(this.text, destination, destinationOffset, sourceStartIndex, sourceEndIndex);
    }

    public final boolean shouldShowSelection() {
        return this.highlight == null;
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (other == null || getClass() != other.getClass()) {
            return false;
        }
        TextFieldCharSequence textFieldCharSequence = (TextFieldCharSequence) other;
        if (TextRange.m6332equalsimpl0(this.selection, ((TextFieldCharSequence) other).selection) && Intrinsics.areEqual(this.composition, ((TextFieldCharSequence) other).composition) && Intrinsics.areEqual(this.highlight, ((TextFieldCharSequence) other).highlight) && Intrinsics.areEqual(this.composingAnnotations, ((TextFieldCharSequence) other).composingAnnotations) && contentEquals(((TextFieldCharSequence) other).text)) {
            return true;
        }
        return false;
    }

    public int hashCode() {
        int result = this.text.hashCode();
        int result2 = ((result * 31) + TextRange.m6340hashCodeimpl(this.selection)) * 31;
        TextRange textRange = this.composition;
        int result3 = (result2 + (textRange != null ? TextRange.m6340hashCodeimpl(textRange.m6343unboximpl()) : 0)) * 31;
        Pair<TextHighlightType, TextRange> pair = this.highlight;
        int result4 = (result3 + (pair != null ? pair.hashCode() : 0)) * 31;
        List<AnnotatedString.Range<AnnotatedString.Annotation>> list = this.composingAnnotations;
        return result4 + (list != null ? list.hashCode() : 0);
    }
}
