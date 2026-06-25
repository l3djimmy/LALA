package androidx.compose.foundation.text.input;

import androidx.compose.foundation.internal.InlineClassHelperKt;
import androidx.compose.foundation.text.input.internal.ChangeTracker;
import androidx.compose.foundation.text.input.internal.OffsetMappingCalculator;
import androidx.compose.foundation.text.input.internal.PartialGapBuffer;
import androidx.compose.runtime.collection.MutableVector;
import androidx.compose.ui.text.AnnotatedString;
import androidx.compose.ui.text.TextRange;
import androidx.compose.ui.text.TextRangeKt;
import com.itextpdf.kernel.xmp.PdfConst;
import java.util.List;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.ranges.RangesKt;
/* compiled from: TextFieldBuffer.kt */
@Metadata(d1 = {"\u0000\u0092\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\b\n\u0002\b\u0006\n\u0002\u0010\r\n\u0002\b\f\n\u0002\u0010\f\n\u0002\b\u0007\n\u0002\u0010\u0002\n\u0002\b\u0019\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0007\u0018\u00002\u00060\u0001j\u0002`\u0002:\u0001sB1\b\u0000\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u0012\b\b\u0002\u0010\u0007\u001a\u00020\u0004\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\u0002\u0010\nJ\u0014\u0010@\u001a\u00060\u0001j\u0002`\u00022\u0006\u0010A\u001a\u00020BH\u0016J\u0016\u0010@\u001a\u00060\u0001j\u0002`\u00022\b\u0010C\u001a\u0004\u0018\u000105H\u0016J&\u0010@\u001a\u00060\u0001j\u0002`\u00022\b\u0010C\u001a\u0004\u0018\u0001052\u0006\u0010D\u001a\u00020.2\u0006\u0010E\u001a\u00020.H\u0016J\u0006\u0010F\u001a\u000205J\u000e\u0010G\u001a\u00020B2\u0006\u0010H\u001a\u00020.J\b\u0010I\u001a\u00020JH\u0002J\r\u0010K\u001a\u00020JH\u0000¢\u0006\u0002\bLJ\r\u0010M\u001a\u00020JH\u0000¢\u0006\u0002\bNJ\r\u0010O\u001a\u00020&H\u0000¢\u0006\u0002\bPJ \u0010Q\u001a\u00020J2\u0006\u0010R\u001a\u00020.2\u0006\u0010S\u001a\u00020.2\u0006\u0010T\u001a\u00020.H\u0002J\u000e\u0010U\u001a\u00020J2\u0006\u0010H\u001a\u00020.J\u000e\u0010V\u001a\u00020J2\u0006\u0010H\u001a\u00020.J\u001e\u0010W\u001a\u00020J2\u0006\u0010D\u001a\u00020.2\u0006\u0010E\u001a\u00020.2\u0006\u0010C\u001a\u000205J9\u0010W\u001a\u00020J2\u0006\u0010D\u001a\u00020.2\u0006\u0010E\u001a\u00020.2\u0006\u0010C\u001a\u0002052\b\b\u0002\u0010X\u001a\u00020.2\b\b\u0002\u0010Y\u001a\u00020.H\u0000¢\u0006\u0002\bZJ \u0010[\u001a\u00020J2\u0006\u0010H\u001a\u00020.2\u0006\u0010\\\u001a\u00020&2\u0006\u0010]\u001a\u00020&H\u0002J\u001a\u0010^\u001a\u00020J2\u0006\u0010_\u001a\u00020\u001fH\u0002ø\u0001\u0000¢\u0006\u0004\b`\u0010=J\u0006\u0010a\u001a\u00020JJ9\u0010b\u001a\u00020J2\u0006\u0010D\u001a\u00020.2\u0006\u0010E\u001a\u00020.2\u001a\b\u0002\u0010c\u001a\u0014\u0012\u000e\u0012\f\u0012\u0004\u0012\u00020\u001a0\u0019j\u0002`e\u0018\u00010dH\u0000¢\u0006\u0002\bfJ*\u0010g\u001a\u00020J2\u0006\u0010h\u001a\u00020)2\u0006\u0010D\u001a\u00020.2\u0006\u0010E\u001a\u00020.H\u0000ø\u0001\u0000¢\u0006\u0004\bi\u0010jJ\u0015\u0010k\u001a\u00020J2\u0006\u0010l\u001a\u000205H\u0000¢\u0006\u0002\bmJ\b\u0010n\u001a\u00020oH\u0016JD\u0010p\u001a\u00020\u00042\b\b\u0002\u0010:\u001a\u00020\u001f2\n\b\u0002\u0010 \u001a\u0004\u0018\u00010\u001f2\u001a\b\u0002\u0010\u001b\u001a\u0014\u0012\u000e\u0012\f\u0012\u0004\u0012\u00020\u001a0\u0019j\u0002`e\u0018\u00010dH\u0000ø\u0001\u0000¢\u0006\u0004\bq\u0010rR\u0010\u0010\u000b\u001a\u0004\u0018\u00010\u0006X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\f\u001a\u00020\rX\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u000e\u001a\u00020\u00068@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b\u000f\u0010\u0010R\u001a\u0010\u0011\u001a\u00020\u00128FX\u0087\u0004¢\u0006\f\u0012\u0004\b\u0013\u0010\u0014\u001a\u0004\b\u0015\u0010\u0016R:\u0010\u001b\u001a\u0010\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u001a0\u0019\u0018\u00010\u00182\u0014\u0010\u0017\u001a\u0010\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u001a0\u0019\u0018\u00010\u0018@BX\u0080\u000e¢\u0006\b\n\u0000\u001a\u0004\b\u001c\u0010\u001dR.\u0010 \u001a\u0004\u0018\u00010\u001f2\b\u0010\u001e\u001a\u0004\u0018\u00010\u001f@BX\u0080\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u000e\n\u0000\u001a\u0004\b!\u0010\"\"\u0004\b#\u0010$R\u0011\u0010%\u001a\u00020&8G¢\u0006\u0006\u001a\u0004\b%\u0010'R:\u0010*\u001a\u0010\u0012\u0004\u0012\u00020)\u0012\u0004\u0012\u00020\u001f\u0018\u00010(2\u0014\u0010\u0017\u001a\u0010\u0012\u0004\u0012\u00020)\u0012\u0004\u0012\u00020\u001f\u0018\u00010(@BX\u0080\u000e¢\u0006\b\n\u0000\u001a\u0004\b+\u0010,R\u0011\u0010-\u001a\u00020.8F¢\u0006\u0006\u001a\u0004\b/\u00100R\u0010\u0010\b\u001a\u0004\u0018\u00010\tX\u0082\u0004¢\u0006\u0002\n\u0000R\u0017\u00101\u001a\u00020\u001f8Fø\u0001\u0000ø\u0001\u0001¢\u0006\u0006\u001a\u0004\b2\u00103R\u0011\u00104\u001a\u0002058F¢\u0006\u0006\u001a\u0004\b6\u00107R\u0014\u0010\u0007\u001a\u00020\u0004X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b8\u00109R*\u0010:\u001a\u00020\u001f2\u0006\u0010\u001e\u001a\u00020\u001f8F@FX\u0086\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\f\u001a\u0004\b;\u00103\"\u0004\b<\u0010=R\u0016\u0010>\u001a\u00020\u001fX\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010?\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006t"}, d2 = {"Landroidx/compose/foundation/text/input/TextFieldBuffer;", "Ljava/lang/Appendable;", "Lkotlin/text/Appendable;", "initialValue", "Landroidx/compose/foundation/text/input/TextFieldCharSequence;", "initialChanges", "Landroidx/compose/foundation/text/input/internal/ChangeTracker;", "originalValue", "offsetMappingCalculator", "Landroidx/compose/foundation/text/input/internal/OffsetMappingCalculator;", "(Landroidx/compose/foundation/text/input/TextFieldCharSequence;Landroidx/compose/foundation/text/input/internal/ChangeTracker;Landroidx/compose/foundation/text/input/TextFieldCharSequence;Landroidx/compose/foundation/text/input/internal/OffsetMappingCalculator;)V", "backingChangeTracker", "buffer", "Landroidx/compose/foundation/text/input/internal/PartialGapBuffer;", "changeTracker", "getChangeTracker$foundation_release", "()Landroidx/compose/foundation/text/input/internal/ChangeTracker;", "changes", "Landroidx/compose/foundation/text/input/TextFieldBuffer$ChangeList;", "getChanges$annotations", "()V", "getChanges", "()Landroidx/compose/foundation/text/input/TextFieldBuffer$ChangeList;", "<set-?>", "Landroidx/compose/runtime/collection/MutableVector;", "Landroidx/compose/ui/text/AnnotatedString$Range;", "Landroidx/compose/ui/text/AnnotatedString$Annotation;", "composingAnnotations", "getComposingAnnotations$foundation_release", "()Landroidx/compose/runtime/collection/MutableVector;", "value", "Landroidx/compose/ui/text/TextRange;", "composition", "getComposition-MzsxiRA$foundation_release", "()Landroidx/compose/ui/text/TextRange;", "setComposition-OEnZFl4", "(Landroidx/compose/ui/text/TextRange;)V", "hasSelection", "", "()Z", "Lkotlin/Pair;", "Landroidx/compose/foundation/text/input/TextHighlightType;", "highlight", "getHighlight$foundation_release", "()Lkotlin/Pair;", "length", "", "getLength", "()I", "originalSelection", "getOriginalSelection-d9O1mEE", "()J", "originalText", "", "getOriginalText", "()Ljava/lang/CharSequence;", "getOriginalValue$foundation_release", "()Landroidx/compose/foundation/text/input/TextFieldCharSequence;", "selection", "getSelection-d9O1mEE", "setSelection-5zc-tL8", "(J)V", "selectionInChars", "J", "append", "char", "", "text", "start", "end", "asCharSequence", "charAt", "index", "clearChangeList", "", "clearHighlight", "clearHighlight$foundation_release", "commitComposition", "commitComposition$foundation_release", "hasComposition", "hasComposition$foundation_release", "onTextWillChange", "replaceStart", "replaceEnd", "newLength", "placeCursorAfterCharAt", "placeCursorBeforeCharAt", "replace", "textStart", "textEnd", "replace$foundation_release", "requireValidIndex", "startExclusive", "endExclusive", "requireValidRange", "range", "requireValidRange-5zc-tL8", "revertAllChanges", "setComposition", "annotations", "", "Landroidx/compose/foundation/text/input/PlacedAnnotation;", "setComposition$foundation_release", "setHighlight", PdfConst.Type, "setHighlight-K7f2yys$foundation_release", "(III)V", "setTextIfChanged", "newText", "setTextIfChanged$foundation_release", "toString", "", "toTextFieldCharSequence", "toTextFieldCharSequence-I88jaVs$foundation_release", "(JLandroidx/compose/ui/text/TextRange;Ljava/util/List;)Landroidx/compose/foundation/text/input/TextFieldCharSequence;", "ChangeList", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class TextFieldBuffer implements Appendable {
    public static final int $stable = 8;
    private ChangeTracker backingChangeTracker;
    private final PartialGapBuffer buffer;
    private MutableVector<AnnotatedString.Range<AnnotatedString.Annotation>> composingAnnotations;
    private TextRange composition;
    private Pair<TextHighlightType, TextRange> highlight;
    private final OffsetMappingCalculator offsetMappingCalculator;
    private final TextFieldCharSequence originalValue;
    private long selectionInChars;

    /* compiled from: TextFieldBuffer.kt */
    @Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0006\bf\u0018\u00002\u00020\u0001J\u001d\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\u0003H&ø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\b\t\u0010\nJ\u001d\u0010\u000b\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\u0003H&ø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\b\f\u0010\nR\u0012\u0010\u0002\u001a\u00020\u0003X¦\u0004¢\u0006\u0006\u001a\u0004\b\u0004\u0010\u0005ø\u0001\u0002\u0082\u0002\u0011\n\u0002\b!\n\u0005\b¡\u001e0\u0001\n\u0004\b!0\u0001¨\u0006\rÀ\u0006\u0001"}, d2 = {"Landroidx/compose/foundation/text/input/TextFieldBuffer$ChangeList;", "", "changeCount", "", "getChangeCount", "()I", "getOriginalRange", "Landroidx/compose/ui/text/TextRange;", "changeIndex", "getOriginalRange--jx7JFs", "(I)J", "getRange", "getRange--jx7JFs", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes.dex */
    public interface ChangeList {
        int getChangeCount();

        /* renamed from: getOriginalRange--jx7JFs  reason: not valid java name */
        long mo1452getOriginalRangejx7JFs(int i);

        /* renamed from: getRange--jx7JFs  reason: not valid java name */
        long mo1453getRangejx7JFs(int i);
    }

    public static /* synthetic */ void getChanges$annotations() {
    }

    public TextFieldBuffer(final TextFieldCharSequence initialValue, ChangeTracker initialChanges, TextFieldCharSequence originalValue, OffsetMappingCalculator offsetMappingCalculator) {
        this.originalValue = originalValue;
        this.offsetMappingCalculator = offsetMappingCalculator;
        this.buffer = new PartialGapBuffer(initialValue);
        MutableVector<AnnotatedString.Range<AnnotatedString.Annotation>> mutableVector = null;
        this.backingChangeTracker = initialChanges != null ? new ChangeTracker(initialChanges) : null;
        this.selectionInChars = initialValue.m1456getSelectiond9O1mEE();
        this.composition = initialValue.m1455getCompositionMzsxiRA();
        List<AnnotatedString.Range<AnnotatedString.Annotation>> composingAnnotations = initialValue.getComposingAnnotations();
        if (!(composingAnnotations == null || composingAnnotations.isEmpty())) {
            int size$iv = initialValue.getComposingAnnotations().size();
            Function1 init$iv = new Function1<Integer, AnnotatedString.Range<AnnotatedString.Annotation>>() { // from class: androidx.compose.foundation.text.input.TextFieldBuffer$composingAnnotations$1
                /* JADX INFO: Access modifiers changed from: package-private */
                {
                    super(1);
                }

                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ AnnotatedString.Range<AnnotatedString.Annotation> invoke(Integer num) {
                    return invoke(num.intValue());
                }

                public final AnnotatedString.Range<AnnotatedString.Annotation> invoke(int it) {
                    return TextFieldCharSequence.this.getComposingAnnotations().get(it);
                }
            };
            Object[] arr$iv = new AnnotatedString.Range[size$iv];
            for (int i = 0; i < size$iv; i++) {
                arr$iv[i] = init$iv.invoke(Integer.valueOf(i));
            }
            mutableVector = new MutableVector<>(arr$iv, size$iv);
        }
        this.composingAnnotations = mutableVector;
    }

    public /* synthetic */ TextFieldBuffer(TextFieldCharSequence textFieldCharSequence, ChangeTracker changeTracker, TextFieldCharSequence textFieldCharSequence2, OffsetMappingCalculator offsetMappingCalculator, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this(textFieldCharSequence, (i & 2) != 0 ? null : changeTracker, (i & 4) != 0 ? textFieldCharSequence : textFieldCharSequence2, (i & 8) != 0 ? null : offsetMappingCalculator);
    }

    public final TextFieldCharSequence getOriginalValue$foundation_release() {
        return this.originalValue;
    }

    public final ChangeTracker getChangeTracker$foundation_release() {
        ChangeTracker changeTracker = this.backingChangeTracker;
        if (changeTracker == null) {
            ChangeTracker it = new ChangeTracker(null, 1, null);
            this.backingChangeTracker = it;
            return it;
        }
        return changeTracker;
    }

    public final int getLength() {
        return this.buffer.length();
    }

    public final CharSequence getOriginalText() {
        return this.originalValue.getText();
    }

    /* renamed from: getOriginalSelection-d9O1mEE  reason: not valid java name */
    public final long m1447getOriginalSelectiond9O1mEE() {
        return this.originalValue.m1456getSelectiond9O1mEE();
    }

    public final ChangeList getChanges() {
        return getChangeTracker$foundation_release();
    }

    public final boolean hasSelection() {
        return !TextRange.m6333getCollapsedimpl(m1448getSelectiond9O1mEE());
    }

    /* renamed from: getSelection-d9O1mEE  reason: not valid java name */
    public final long m1448getSelectiond9O1mEE() {
        return this.selectionInChars;
    }

    /* renamed from: setSelection-5zc-tL8  reason: not valid java name */
    public final void m1450setSelection5zctL8(long value) {
        m1443requireValidRange5zctL8(value);
        this.selectionInChars = value;
        this.highlight = null;
    }

    /* renamed from: getComposition-MzsxiRA$foundation_release  reason: not valid java name */
    public final TextRange m1446getCompositionMzsxiRA$foundation_release() {
        return this.composition;
    }

    /* renamed from: setComposition-OEnZFl4  reason: not valid java name */
    private final void m1444setCompositionOEnZFl4(TextRange value) {
        if (value == null || TextRange.m6333getCollapsedimpl(value.m6343unboximpl())) {
            this.composition = null;
            MutableVector<AnnotatedString.Range<AnnotatedString.Annotation>> mutableVector = this.composingAnnotations;
            if (mutableVector != null) {
                mutableVector.clear();
                return;
            }
            return;
        }
        this.composition = value;
    }

    public final MutableVector<AnnotatedString.Range<AnnotatedString.Annotation>> getComposingAnnotations$foundation_release() {
        return this.composingAnnotations;
    }

    public final boolean hasComposition$foundation_release() {
        return this.composition != null;
    }

    public final void commitComposition$foundation_release() {
        m1444setCompositionOEnZFl4(null);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ void setComposition$foundation_release$default(TextFieldBuffer textFieldBuffer, int i, int i2, List list, int i3, Object obj) {
        if ((i3 & 4) != 0) {
            list = null;
        }
        textFieldBuffer.setComposition$foundation_release(i, i2, list);
    }

    public final void setComposition$foundation_release(int start, int end, List<AnnotatedString.Range<AnnotatedString.Annotation>> list) {
        List $this$fastForEach$iv;
        if (start < 0 || start > this.buffer.length()) {
            throw new IndexOutOfBoundsException("start (" + start + ") offset is outside of text region " + this.buffer.length());
        }
        if (end < 0 || end > this.buffer.length()) {
            throw new IndexOutOfBoundsException("end (" + end + ") offset is outside of text region " + this.buffer.length());
        }
        if (start < end) {
            m1444setCompositionOEnZFl4(TextRange.m6327boximpl(TextRangeKt.TextRange(start, end)));
            MutableVector<AnnotatedString.Range<AnnotatedString.Annotation>> mutableVector = this.composingAnnotations;
            if (mutableVector != null) {
                mutableVector.clear();
            }
            List<AnnotatedString.Range<AnnotatedString.Annotation>> list2 = list;
            if (!(list2 == null || list2.isEmpty())) {
                if (this.composingAnnotations == null) {
                    this.composingAnnotations = new MutableVector<>(new AnnotatedString.Range[16], 0);
                }
                List $this$fastForEach$iv2 = list;
                int index$iv = 0;
                int size = $this$fastForEach$iv2.size();
                while (index$iv < size) {
                    AnnotatedString.Range item$iv = $this$fastForEach$iv2.get(index$iv);
                    AnnotatedString.Range it = item$iv;
                    MutableVector<AnnotatedString.Range<AnnotatedString.Annotation>> mutableVector2 = this.composingAnnotations;
                    if (mutableVector2 != null) {
                        $this$fastForEach$iv = $this$fastForEach$iv2;
                        mutableVector2.add(AnnotatedString.Range.copy$default(it, null, it.getStart() + start, it.getEnd() + start, null, 9, null));
                    } else {
                        $this$fastForEach$iv = $this$fastForEach$iv2;
                    }
                    index$iv++;
                    $this$fastForEach$iv2 = $this$fastForEach$iv;
                }
                return;
            }
            return;
        }
        throw new IllegalArgumentException("Do not set reversed or empty range: " + start + " > " + end);
    }

    public final Pair<TextHighlightType, TextRange> getHighlight$foundation_release() {
        return this.highlight;
    }

    /* renamed from: setHighlight-K7f2yys$foundation_release  reason: not valid java name */
    public final void m1449setHighlightK7f2yys$foundation_release(int type, int start, int end) {
        if (start >= end) {
            throw new IllegalArgumentException("Do not set reversed or empty range: " + start + " > " + end);
        }
        int clampedStart = RangesKt.coerceIn(start, 0, getLength());
        int clampedEnd = RangesKt.coerceIn(end, 0, getLength());
        this.highlight = new Pair<>(TextHighlightType.m1462boximpl(type), TextRange.m6327boximpl(TextRangeKt.TextRange(clampedStart, clampedEnd)));
    }

    public final void clearHighlight$foundation_release() {
        this.highlight = null;
    }

    public final void replace(int start, int end, CharSequence text) {
        replace$foundation_release(start, end, text, 0, text.length());
    }

    public static /* synthetic */ void replace$foundation_release$default(TextFieldBuffer textFieldBuffer, int i, int i2, CharSequence charSequence, int i3, int i4, int i5, Object obj) {
        int i6;
        int i7;
        if ((i5 & 8) == 0) {
            i6 = i3;
        } else {
            i6 = 0;
        }
        if ((i5 & 16) == 0) {
            i7 = i4;
        } else {
            i7 = charSequence.length();
        }
        textFieldBuffer.replace$foundation_release(i, i2, charSequence, i6, i7);
    }

    public final void replace$foundation_release(int start, int end, CharSequence text, int textStart, int textEnd) {
        boolean value$iv = start <= end;
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalArgumentException("Expected start=" + start + " <= end=" + end);
        }
        boolean value$iv2 = textStart <= textEnd;
        if (!value$iv2) {
            InlineClassHelperKt.throwIllegalArgumentException("Expected textStart=" + textStart + " <= textEnd=" + textEnd);
        }
        onTextWillChange(start, end, textEnd - textStart);
        this.buffer.replace(start, end, text, textStart, textEnd);
        commitComposition$foundation_release();
        clearHighlight$foundation_release();
    }

    /* JADX WARN: Code restructure failed: missing block: B:27:0x0059, code lost:
        if (r4 < r5) goto L36;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:?, code lost:
        return;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void setTextIfChanged$foundation_release(java.lang.CharSequence r14) {
        /*
            r13 = this;
            androidx.compose.foundation.text.input.internal.PartialGapBuffer r0 = r13.buffer
            java.lang.CharSequence r0 = (java.lang.CharSequence) r0
            r1 = 0
            r2 = 0
            int r3 = r0.length()
            r4 = 0
            int r5 = r14.length()
            int r6 = r0.length()
            r7 = 0
            r8 = 1
            if (r6 <= 0) goto L19
            r6 = r8
            goto L1a
        L19:
            r6 = r7
        L1a:
            if (r6 == 0) goto L57
            int r6 = r14.length()
            if (r6 <= 0) goto L23
            r7 = r8
        L23:
            if (r7 == 0) goto L57
            r6 = 0
            r7 = 0
        L27:
            if (r6 != 0) goto L39
            char r8 = r0.charAt(r2)
            char r9 = r14.charAt(r4)
            if (r8 != r9) goto L38
            int r2 = r2 + 1
            int r4 = r4 + 1
            goto L39
        L38:
            r6 = 1
        L39:
            if (r7 != 0) goto L4f
            int r8 = r3 + (-1)
            char r8 = r0.charAt(r8)
            int r9 = r5 + (-1)
            char r9 = r14.charAt(r9)
            if (r8 != r9) goto L4e
            int r3 = r3 + (-1)
            int r5 = r5 + (-1)
            goto L4f
        L4e:
            r7 = 1
        L4f:
            if (r2 >= r3) goto L57
            if (r4 >= r5) goto L57
            if (r6 == 0) goto L27
            if (r7 == 0) goto L27
        L57:
            if (r2 < r3) goto L5d
            if (r4 < r5) goto L5d
            r10 = r14
            goto L6b
        L5d:
            r6 = r2
            r9 = r3
            r8 = r6
            r11 = r4
            r12 = r5
            r6 = 0
            r7 = r13
            r10 = r14
            r7.replace$foundation_release(r8, r9, r10, r11, r12)
        L6b:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.text.input.TextFieldBuffer.setTextIfChanged$foundation_release(java.lang.CharSequence):void");
    }

    @Override // java.lang.Appendable
    public Appendable append(CharSequence text) {
        TextFieldBuffer $this$append_u24lambda_u246 = this;
        if (text != null) {
            $this$append_u24lambda_u246.onTextWillChange($this$append_u24lambda_u246.getLength(), $this$append_u24lambda_u246.getLength(), text.length());
            PartialGapBuffer.replace$default($this$append_u24lambda_u246.buffer, $this$append_u24lambda_u246.buffer.length(), $this$append_u24lambda_u246.buffer.length(), text, 0, 0, 24, null);
        }
        return this;
    }

    @Override // java.lang.Appendable
    public Appendable append(CharSequence text, int start, int end) {
        TextFieldBuffer $this$append_u24lambda_u247 = this;
        if (text != null) {
            $this$append_u24lambda_u247.onTextWillChange($this$append_u24lambda_u247.getLength(), $this$append_u24lambda_u247.getLength(), end - start);
            PartialGapBuffer.replace$default($this$append_u24lambda_u247.buffer, $this$append_u24lambda_u247.buffer.length(), $this$append_u24lambda_u247.buffer.length(), text.subSequence(start, end), 0, 0, 24, null);
        }
        return this;
    }

    @Override // java.lang.Appendable
    public Appendable append(char c) {
        TextFieldBuffer $this$append_u24lambda_u248 = this;
        $this$append_u24lambda_u248.onTextWillChange($this$append_u24lambda_u248.getLength(), $this$append_u24lambda_u248.getLength(), 1);
        PartialGapBuffer.replace$default($this$append_u24lambda_u248.buffer, $this$append_u24lambda_u248.buffer.length(), $this$append_u24lambda_u248.buffer.length(), String.valueOf(c), 0, 0, 24, null);
        return this;
    }

    private final void onTextWillChange(int replaceStart, int replaceEnd, int newLength) {
        getChangeTracker$foundation_release().trackChange(replaceStart, replaceEnd, newLength);
        OffsetMappingCalculator offsetMappingCalculator = this.offsetMappingCalculator;
        if (offsetMappingCalculator != null) {
            offsetMappingCalculator.recordEditOperation(replaceStart, replaceEnd, newLength);
        }
        this.selectionInChars = TextFieldBufferKt.m1454adjustTextRangevJH6DeI(m1448getSelectiond9O1mEE(), replaceStart, replaceEnd, newLength);
    }

    public final char charAt(int index) {
        return this.buffer.charAt(index);
    }

    public String toString() {
        return this.buffer.toString();
    }

    public final CharSequence asCharSequence() {
        return this.buffer;
    }

    private final void clearChangeList() {
        getChangeTracker$foundation_release().clearChanges();
    }

    public final void revertAllChanges() {
        replace(0, getLength(), this.originalValue.toString());
        m1450setSelection5zctL8(this.originalValue.m1456getSelectiond9O1mEE());
        clearChangeList();
    }

    public final void placeCursorBeforeCharAt(int index) {
        requireValidIndex(index, true, false);
        this.selectionInChars = TextRangeKt.TextRange(index);
    }

    public final void placeCursorAfterCharAt(int index) {
        requireValidIndex(index, false, true);
        this.selectionInChars = TextRangeKt.TextRange(RangesKt.coerceAtMost(index + 1, getLength()));
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x0026, code lost:
        if (r1 == false) goto L16;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* renamed from: toTextFieldCharSequence-I88jaVs$foundation_release$default  reason: not valid java name */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static /* synthetic */ androidx.compose.foundation.text.input.TextFieldCharSequence m1445toTextFieldCharSequenceI88jaVs$foundation_release$default(androidx.compose.foundation.text.input.TextFieldBuffer r2, long r3, androidx.compose.ui.text.TextRange r5, java.util.List r6, int r7, java.lang.Object r8) {
        /*
            r8 = r7 & 1
            if (r8 == 0) goto L8
            long r3 = r2.m1448getSelectiond9O1mEE()
        L8:
            r8 = r7 & 2
            if (r8 == 0) goto Le
            androidx.compose.ui.text.TextRange r5 = r2.composition
        Le:
            r7 = r7 & 4
            if (r7 == 0) goto L2a
            androidx.compose.runtime.collection.MutableVector<androidx.compose.ui.text.AnnotatedString$Range<androidx.compose.ui.text.AnnotatedString$Annotation>> r6 = r2.composingAnnotations
            r7 = 0
            if (r6 == 0) goto L29
            java.util.List r6 = r6.asMutableList()
            if (r6 == 0) goto L29
            r8 = r6
            r0 = 0
            r1 = r8
            java.util.Collection r1 = (java.util.Collection) r1
            boolean r1 = r1.isEmpty()
            if (r1 != 0) goto L29
            goto L2a
        L29:
            r6 = r7
        L2a:
            androidx.compose.foundation.text.input.TextFieldCharSequence r2 = r2.m1451toTextFieldCharSequenceI88jaVs$foundation_release(r3, r5, r6)
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.text.input.TextFieldBuffer.m1445toTextFieldCharSequenceI88jaVs$foundation_release$default(androidx.compose.foundation.text.input.TextFieldBuffer, long, androidx.compose.ui.text.TextRange, java.util.List, int, java.lang.Object):androidx.compose.foundation.text.input.TextFieldCharSequence");
    }

    /* renamed from: toTextFieldCharSequence-I88jaVs$foundation_release  reason: not valid java name */
    public final TextFieldCharSequence m1451toTextFieldCharSequenceI88jaVs$foundation_release(long selection, TextRange composition, List<AnnotatedString.Range<AnnotatedString.Annotation>> list) {
        return new TextFieldCharSequence(this.buffer.toString(), selection, composition, null, list, 8, null);
    }

    private final void requireValidIndex(int index, boolean startExclusive, boolean endExclusive) {
        boolean value$iv = false;
        int start = startExclusive ? 0 : -1;
        int end = getLength();
        if (!endExclusive) {
            end++;
        }
        if (start <= index && index < end) {
            value$iv = true;
        }
        if (value$iv) {
            return;
        }
        InlineClassHelperKt.throwIllegalArgumentException("Expected " + index + " to be in [" + start + ", " + end + ')');
    }

    /* renamed from: requireValidRange-5zc-tL8  reason: not valid java name */
    private final void m1443requireValidRange5zctL8(long range) {
        long validRange = TextRangeKt.TextRange(0, getLength());
        boolean value$iv = TextRange.m6329contains5zctL8(validRange, range);
        if (value$iv) {
            return;
        }
        InlineClassHelperKt.throwIllegalArgumentException("Expected " + ((Object) TextRange.m6342toStringimpl(range)) + " to be in " + ((Object) TextRange.m6342toStringimpl(validRange)));
    }
}
