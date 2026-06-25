package androidx.compose.foundation.text.input.internal;

import androidx.compose.foundation.text.input.InputTransformation;
import androidx.compose.foundation.text.input.OutputTransformation;
import androidx.compose.foundation.text.input.TextFieldBuffer;
import androidx.compose.foundation.text.input.TextFieldBufferKt;
import androidx.compose.foundation.text.input.TextFieldCharSequence;
import androidx.compose.foundation.text.input.TextFieldState;
import androidx.compose.foundation.text.input.internal.TransformedTextFieldState;
import androidx.compose.foundation.text.input.internal.undo.TextFieldEditUndoBehavior;
import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.SnapshotStateKt;
import androidx.compose.runtime.SnapshotStateKt__SnapshotStateKt;
import androidx.compose.runtime.State;
import androidx.compose.ui.text.TextRange;
import androidx.compose.ui.text.TextRangeKt;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import com.itextpdf.kernel.xmp.PdfConst;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Unit;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: TransformedTextFieldState.kt */
@Metadata(d1 = {"\u0000\u0098\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0010\u0001\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0011\n\u0002\u0010\r\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0010\u000e\n\u0002\b\u0006\b\u0001\u0018\u0000 ^2\u00020\u0001:\u0002^_B1\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\u0002\u0010\nJ\u0006\u0010 \u001a\u00020!J\u0006\u0010\"\u001a\u00020!J\u0016\u0010#\u001a\u00020$2\u0006\u0010%\u001a\u00020&H\u0086@¢\u0006\u0002\u0010'J\u0006\u0010(\u001a\u00020!J,\u0010)\u001a\u00020!2\b\b\u0002\u0010*\u001a\u00020+2\u0017\u0010,\u001a\u0013\u0012\u0004\u0012\u00020.\u0012\u0004\u0012\u00020!0-¢\u0006\u0002\b/H\u0086\bJ\u0013\u00100\u001a\u00020+2\b\u00101\u001a\u0004\u0018\u00010\u0001H\u0096\u0002J\b\u00102\u001a\u000203H\u0016J \u00104\u001a\u00020!2\u0006\u00105\u001a\u0002062\u0006\u00107\u001a\u000208ø\u0001\u0000¢\u0006\u0004\b9\u0010:J\u0018\u0010;\u001a\u0002082\u0006\u0010<\u001a\u000208ø\u0001\u0000¢\u0006\u0004\b=\u0010>J\u001b\u0010;\u001a\u0002082\u0006\u0010?\u001a\u000203ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\b@\u0010AJ\u0018\u0010B\u001a\u0002082\u0006\u0010<\u001a\u000208ø\u0001\u0000¢\u0006\u0004\bC\u0010>J\u001b\u0010B\u001a\u0002082\u0006\u0010?\u001a\u000203ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\bD\u0010AJ\u000e\u0010E\u001a\u00020!2\u0006\u0010F\u001a\u000203J\u0006\u0010G\u001a\u00020!J\u000e\u0010H\u001a\u00020!2\u0006\u0010I\u001a\u00020JJ,\u0010K\u001a\u00020!2\u0006\u0010I\u001a\u00020J2\b\b\u0002\u0010L\u001a\u00020+2\b\b\u0002\u0010M\u001a\u00020N2\b\b\u0002\u0010*\u001a\u00020+J4\u0010O\u001a\u00020!2\u0006\u0010I\u001a\u00020J2\u0006\u0010<\u001a\u0002082\b\b\u0002\u0010M\u001a\u00020N2\b\b\u0002\u0010*\u001a\u00020+ø\u0001\u0000¢\u0006\u0004\bP\u0010QJ\u0006\u0010R\u001a\u00020!J\u0018\u0010S\u001a\u00020!2\u0006\u00107\u001a\u000208ø\u0001\u0000¢\u0006\u0004\bT\u0010UJ\u0018\u0010V\u001a\u00020!2\u0006\u0010W\u001a\u000208ø\u0001\u0000¢\u0006\u0004\bX\u0010UJ\b\u0010Y\u001a\u00020ZH\u0016J\u0006\u0010[\u001a\u00020!J\u0010\u0010\\\u001a\u00020!2\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005J\f\u0010]\u001a\u00020!*\u00020.H\u0002R\u0010\u0010\u0006\u001a\u0004\u0018\u00010\u0007X\u0082\u0004¢\u0006\u0002\n\u0000R\u0018\u0010\u000b\u001a\f\u0012\u0006\u0012\u0004\u0018\u00010\r\u0018\u00010\fX\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u0004\u001a\u0004\u0018\u00010\u0005X\u0082\u000e¢\u0006\u0002\n\u0000R\u0011\u0010\u000e\u001a\u00020\u000f8F¢\u0006\u0006\u001a\u0004\b\u0010\u0010\u0011R\u0010\u0010\b\u001a\u0004\u0018\u00010\tX\u0082\u0004¢\u0006\u0002\n\u0000R\u0018\u0010\u0012\u001a\f\u0012\u0006\u0012\u0004\u0018\u00010\r\u0018\u00010\fX\u0082\u0004¢\u0006\u0002\n\u0000R+\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0013\u001a\u00020\u00148F@FX\u0086\u008e\u0002¢\u0006\u0012\n\u0004\b\u001a\u0010\u001b\u001a\u0004\b\u0016\u0010\u0017\"\u0004\b\u0018\u0010\u0019R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u0011\u0010\u001c\u001a\u00020\u000f8F¢\u0006\u0006\u001a\u0004\b\u001d\u0010\u0011R\u0011\u0010\u001e\u001a\u00020\u000f8F¢\u0006\u0006\u001a\u0004\b\u001f\u0010\u0011\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006`"}, d2 = {"Landroidx/compose/foundation/text/input/internal/TransformedTextFieldState;", "", "textFieldState", "Landroidx/compose/foundation/text/input/TextFieldState;", "inputTransformation", "Landroidx/compose/foundation/text/input/InputTransformation;", "codepointTransformation", "Landroidx/compose/foundation/text/input/internal/CodepointTransformation;", "outputTransformation", "Landroidx/compose/foundation/text/input/OutputTransformation;", "(Landroidx/compose/foundation/text/input/TextFieldState;Landroidx/compose/foundation/text/input/InputTransformation;Landroidx/compose/foundation/text/input/internal/CodepointTransformation;Landroidx/compose/foundation/text/input/OutputTransformation;)V", "codepointTransformedText", "Landroidx/compose/runtime/State;", "Landroidx/compose/foundation/text/input/internal/TransformedTextFieldState$TransformedText;", "outputText", "Landroidx/compose/foundation/text/input/TextFieldCharSequence;", "getOutputText", "()Landroidx/compose/foundation/text/input/TextFieldCharSequence;", "outputTransformedText", "<set-?>", "Landroidx/compose/foundation/text/input/internal/SelectionWedgeAffinity;", "selectionWedgeAffinity", "getSelectionWedgeAffinity", "()Landroidx/compose/foundation/text/input/internal/SelectionWedgeAffinity;", "setSelectionWedgeAffinity", "(Landroidx/compose/foundation/text/input/internal/SelectionWedgeAffinity;)V", "selectionWedgeAffinity$delegate", "Landroidx/compose/runtime/MutableState;", "untransformedText", "getUntransformedText", "visualText", "getVisualText", "collapseSelectionToEnd", "", "collapseSelectionToMax", "collectImeNotifications", "", "notifyImeListener", "Landroidx/compose/foundation/text/input/TextFieldState$NotifyImeListener;", "(Landroidx/compose/foundation/text/input/TextFieldState$NotifyImeListener;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "deleteSelectedText", "editUntransformedTextAsUser", "restartImeIfContentChanges", "", "block", "Lkotlin/Function1;", "Landroidx/compose/foundation/text/input/TextFieldBuffer;", "Lkotlin/ExtensionFunctionType;", "equals", "other", "hashCode", "", "highlightCharsIn", PdfConst.Type, "Landroidx/compose/foundation/text/input/TextHighlightType;", "transformedRange", "Landroidx/compose/ui/text/TextRange;", "highlightCharsIn-7RAjNK8", "(IJ)V", "mapFromTransformed", "range", "mapFromTransformed-GEjPoXI", "(J)J", TypedValues.CycleType.S_WAVE_OFFSET, "mapFromTransformed--jx7JFs", "(I)J", "mapToTransformed", "mapToTransformed-GEjPoXI", "mapToTransformed--jx7JFs", "placeCursorBeforeCharAt", "transformedOffset", "redo", "replaceAll", "newText", "", "replaceSelectedText", "clearComposition", "undoBehavior", "Landroidx/compose/foundation/text/input/internal/undo/TextFieldEditUndoBehavior;", "replaceText", "replaceText-M8tDOmk", "(Ljava/lang/CharSequence;JLandroidx/compose/foundation/text/input/internal/undo/TextFieldEditUndoBehavior;Z)V", "selectAll", "selectCharsIn", "selectCharsIn-5zc-tL8", "(J)V", "selectUntransformedCharsIn", "untransformedRange", "selectUntransformedCharsIn-5zc-tL8", "toString", "", "undo", "update", "updateWedgeAffinity", "Companion", "TransformedText", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class TransformedTextFieldState {
    public static final int $stable = 0;
    private static final Companion Companion = new Companion(null);
    private final CodepointTransformation codepointTransformation;
    private final State<TransformedText> codepointTransformedText;
    private InputTransformation inputTransformation;
    private final OutputTransformation outputTransformation;
    private final State<TransformedText> outputTransformedText;
    private final MutableState selectionWedgeAffinity$delegate;
    private final TextFieldState textFieldState;

    public TransformedTextFieldState(TextFieldState textFieldState, InputTransformation inputTransformation, CodepointTransformation codepointTransformation, OutputTransformation outputTransformation) {
        MutableState mutableStateOf$default;
        this.textFieldState = textFieldState;
        this.inputTransformation = inputTransformation;
        this.codepointTransformation = codepointTransformation;
        this.outputTransformation = outputTransformation;
        final OutputTransformation transformation = this.outputTransformation;
        this.outputTransformedText = transformation != null ? SnapshotStateKt.derivedStateOf(new Function0<TransformedText>() { // from class: androidx.compose.foundation.text.input.internal.TransformedTextFieldState$outputTransformedText$1$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(0);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // kotlin.jvm.functions.Function0
            public final TransformedTextFieldState.TransformedText invoke() {
                return TransformedTextFieldState.Companion.calculateTransformedText(TransformedTextFieldState.this.textFieldState.getValue$foundation_release(), transformation, TransformedTextFieldState.this.getSelectionWedgeAffinity());
            }
        }) : null;
        final CodepointTransformation transformation2 = this.codepointTransformation;
        this.codepointTransformedText = transformation2 != null ? SnapshotStateKt.derivedStateOf(new Function0<TransformedText>() { // from class: androidx.compose.foundation.text.input.internal.TransformedTextFieldState$codepointTransformedText$1$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(0);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // kotlin.jvm.functions.Function0
            public final TransformedTextFieldState.TransformedText invoke() {
                State state;
                TextFieldCharSequence value$foundation_release;
                TransformedTextFieldState.TransformedText transformedText;
                TransformedTextFieldState.Companion companion = TransformedTextFieldState.Companion;
                state = TransformedTextFieldState.this.outputTransformedText;
                if (state == null || (transformedText = (TransformedTextFieldState.TransformedText) state.getValue()) == null || (value$foundation_release = transformedText.getText()) == null) {
                    value$foundation_release = TransformedTextFieldState.this.textFieldState.getValue$foundation_release();
                }
                return companion.calculateTransformedText(value$foundation_release, transformation2, TransformedTextFieldState.this.getSelectionWedgeAffinity());
            }
        }) : null;
        mutableStateOf$default = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(new SelectionWedgeAffinity(WedgeAffinity.Start), null, 2, null);
        this.selectionWedgeAffinity$delegate = mutableStateOf$default;
    }

    public /* synthetic */ TransformedTextFieldState(TextFieldState textFieldState, InputTransformation inputTransformation, CodepointTransformation codepointTransformation, OutputTransformation outputTransformation, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this(textFieldState, (i & 2) != 0 ? null : inputTransformation, (i & 4) != 0 ? null : codepointTransformation, (i & 8) != 0 ? null : outputTransformation);
    }

    public final TextFieldCharSequence getUntransformedText() {
        return this.textFieldState.getValue$foundation_release();
    }

    public final TextFieldCharSequence getOutputText() {
        TransformedText value;
        TextFieldCharSequence text;
        State<TransformedText> state = this.outputTransformedText;
        return (state == null || (value = state.getValue()) == null || (text = value.getText()) == null) ? getUntransformedText() : text;
    }

    public final TextFieldCharSequence getVisualText() {
        TransformedText value;
        TextFieldCharSequence text;
        State<TransformedText> state = this.codepointTransformedText;
        return (state == null || (value = state.getValue()) == null || (text = value.getText()) == null) ? getOutputText() : text;
    }

    public final SelectionWedgeAffinity getSelectionWedgeAffinity() {
        State $this$getValue$iv = this.selectionWedgeAffinity$delegate;
        return (SelectionWedgeAffinity) $this$getValue$iv.getValue();
    }

    public final void setSelectionWedgeAffinity(SelectionWedgeAffinity selectionWedgeAffinity) {
        MutableState $this$setValue$iv = this.selectionWedgeAffinity$delegate;
        $this$setValue$iv.setValue(selectionWedgeAffinity);
    }

    public final void update(InputTransformation inputTransformation) {
        this.inputTransformation = inputTransformation;
    }

    public final void placeCursorBeforeCharAt(int transformedOffset) {
        m1584selectCharsIn5zctL8(TextRangeKt.TextRange(transformedOffset));
    }

    /* renamed from: selectCharsIn-5zc-tL8  reason: not valid java name */
    public final void m1584selectCharsIn5zctL8(long transformedRange) {
        long untransformedRange = m1580mapFromTransformedGEjPoXI(transformedRange);
        m1585selectUntransformedCharsIn5zctL8(untransformedRange);
    }

    /* renamed from: selectUntransformedCharsIn-5zc-tL8  reason: not valid java name */
    public final void m1585selectUntransformedCharsIn5zctL8(long untransformedRange) {
        TextFieldState $this$iv = this.textFieldState;
        InputTransformation inputTransformation$iv = this.inputTransformation;
        TextFieldEditUndoBehavior undoBehavior$iv = TextFieldEditUndoBehavior.MergeIfPossible;
        $this$iv.getMainBuffer$foundation_release().getChangeTracker$foundation_release().clearChanges();
        TextFieldBuffer $this$selectUntransformedCharsIn_5zc_tL8_u24lambda_u242 = $this$iv.getMainBuffer$foundation_release();
        TextFieldBufferKt.setSelectionCoerced($this$selectUntransformedCharsIn_5zc_tL8_u24lambda_u242, TextRange.m6339getStartimpl(untransformedRange), TextRange.m6334getEndimpl(untransformedRange));
        TextFieldState.access$commitEditAsUser($this$iv, inputTransformation$iv, true, undoBehavior$iv);
    }

    /* renamed from: highlightCharsIn-7RAjNK8  reason: not valid java name */
    public final void m1578highlightCharsIn7RAjNK8(int type, long transformedRange) {
        long untransformedRange = m1580mapFromTransformedGEjPoXI(transformedRange);
        TextFieldState $this$iv = this.textFieldState;
        InputTransformation inputTransformation$iv = this.inputTransformation;
        TextFieldEditUndoBehavior undoBehavior$iv = TextFieldEditUndoBehavior.MergeIfPossible;
        $this$iv.getMainBuffer$foundation_release().getChangeTracker$foundation_release().clearChanges();
        TextFieldBuffer $this$highlightCharsIn_7RAjNK8_u24lambda_u243 = $this$iv.getMainBuffer$foundation_release();
        $this$highlightCharsIn_7RAjNK8_u24lambda_u243.m1449setHighlightK7f2yys$foundation_release(type, TextRange.m6339getStartimpl(untransformedRange), TextRange.m6334getEndimpl(untransformedRange));
        TextFieldState.access$commitEditAsUser($this$iv, inputTransformation$iv, true, undoBehavior$iv);
    }

    public final void replaceAll(CharSequence newText) {
        TextFieldState $this$iv = this.textFieldState;
        InputTransformation inputTransformation$iv = this.inputTransformation;
        TextFieldEditUndoBehavior undoBehavior$iv = TextFieldEditUndoBehavior.MergeIfPossible;
        $this$iv.getMainBuffer$foundation_release().getChangeTracker$foundation_release().clearChanges();
        TextFieldBuffer $this$replaceAll_u24lambda_u244 = $this$iv.getMainBuffer$foundation_release();
        TextFieldBufferKt.delete($this$replaceAll_u24lambda_u244, 0, $this$replaceAll_u24lambda_u244.getLength());
        $this$replaceAll_u24lambda_u244.append(newText.toString());
        updateWedgeAffinity($this$replaceAll_u24lambda_u244);
        TextFieldState.access$commitEditAsUser($this$iv, inputTransformation$iv, true, undoBehavior$iv);
    }

    public final void selectAll() {
        TextFieldState $this$iv = this.textFieldState;
        InputTransformation inputTransformation$iv = this.inputTransformation;
        TextFieldEditUndoBehavior undoBehavior$iv = TextFieldEditUndoBehavior.MergeIfPossible;
        $this$iv.getMainBuffer$foundation_release().getChangeTracker$foundation_release().clearChanges();
        TextFieldBuffer $this$selectAll_u24lambda_u245 = $this$iv.getMainBuffer$foundation_release();
        TextFieldBufferKt.setSelectionCoerced($this$selectAll_u24lambda_u245, 0, $this$selectAll_u24lambda_u245.getLength());
        TextFieldState.access$commitEditAsUser($this$iv, inputTransformation$iv, true, undoBehavior$iv);
    }

    public final void deleteSelectedText() {
        TextFieldState $this$iv = this.textFieldState;
        InputTransformation inputTransformation$iv = this.inputTransformation;
        TextFieldEditUndoBehavior undoBehavior$iv = TextFieldEditUndoBehavior.NeverMerge;
        $this$iv.getMainBuffer$foundation_release().getChangeTracker$foundation_release().clearChanges();
        TextFieldBuffer $this$deleteSelectedText_u24lambda_u246 = $this$iv.getMainBuffer$foundation_release();
        TextFieldBufferKt.delete($this$deleteSelectedText_u24lambda_u246, TextRange.m6337getMinimpl($this$deleteSelectedText_u24lambda_u246.m1448getSelectiond9O1mEE()), TextRange.m6336getMaximpl($this$deleteSelectedText_u24lambda_u246.m1448getSelectiond9O1mEE()));
        TextFieldBufferKt.setSelectionCoerced$default($this$deleteSelectedText_u24lambda_u246, TextRange.m6337getMinimpl($this$deleteSelectedText_u24lambda_u246.m1448getSelectiond9O1mEE()), 0, 2, null);
        updateWedgeAffinity($this$deleteSelectedText_u24lambda_u246);
        TextFieldState.access$commitEditAsUser($this$iv, inputTransformation$iv, true, undoBehavior$iv);
    }

    /* renamed from: replaceText-M8tDOmk$default  reason: not valid java name */
    public static /* synthetic */ void m1577replaceTextM8tDOmk$default(TransformedTextFieldState transformedTextFieldState, CharSequence charSequence, long j, TextFieldEditUndoBehavior textFieldEditUndoBehavior, boolean z, int i, Object obj) {
        TextFieldEditUndoBehavior textFieldEditUndoBehavior2;
        boolean z2;
        if ((i & 4) == 0) {
            textFieldEditUndoBehavior2 = textFieldEditUndoBehavior;
        } else {
            textFieldEditUndoBehavior2 = TextFieldEditUndoBehavior.MergeIfPossible;
        }
        if ((i & 8) == 0) {
            z2 = z;
        } else {
            z2 = true;
        }
        transformedTextFieldState.m1583replaceTextM8tDOmk(charSequence, j, textFieldEditUndoBehavior2, z2);
    }

    /* renamed from: replaceText-M8tDOmk  reason: not valid java name */
    public final void m1583replaceTextM8tDOmk(CharSequence newText, long range, TextFieldEditUndoBehavior undoBehavior, boolean restartImeIfContentChanges) {
        TextFieldState this_$iv = this.textFieldState;
        InputTransformation inputTransformation = this.inputTransformation;
        this_$iv.getMainBuffer$foundation_release().getChangeTracker$foundation_release().clearChanges();
        TextFieldBuffer $this$replaceText_M8tDOmk_u24lambda_u247 = this_$iv.getMainBuffer$foundation_release();
        long selection = m1580mapFromTransformedGEjPoXI(range);
        $this$replaceText_M8tDOmk_u24lambda_u247.replace(TextRange.m6337getMinimpl(selection), TextRange.m6336getMaximpl(selection), newText);
        int cursor = TextRange.m6337getMinimpl(selection) + newText.length();
        TextFieldBufferKt.setSelectionCoerced$default($this$replaceText_M8tDOmk_u24lambda_u247, cursor, 0, 2, null);
        updateWedgeAffinity($this$replaceText_M8tDOmk_u24lambda_u247);
        TextFieldState.access$commitEditAsUser(this_$iv, inputTransformation, restartImeIfContentChanges, undoBehavior);
    }

    public static /* synthetic */ void replaceSelectedText$default(TransformedTextFieldState transformedTextFieldState, CharSequence charSequence, boolean z, TextFieldEditUndoBehavior textFieldEditUndoBehavior, boolean z2, int i, Object obj) {
        if ((i & 2) != 0) {
            z = false;
        }
        if ((i & 4) != 0) {
            textFieldEditUndoBehavior = TextFieldEditUndoBehavior.MergeIfPossible;
        }
        if ((i & 8) != 0) {
            z2 = true;
        }
        transformedTextFieldState.replaceSelectedText(charSequence, z, textFieldEditUndoBehavior, z2);
    }

    public final void replaceSelectedText(CharSequence newText, boolean clearComposition, TextFieldEditUndoBehavior undoBehavior, boolean restartImeIfContentChanges) {
        TextFieldState this_$iv = this.textFieldState;
        InputTransformation inputTransformation$iv = this.inputTransformation;
        this_$iv.getMainBuffer$foundation_release().getChangeTracker$foundation_release().clearChanges();
        TextFieldBuffer $this$replaceSelectedText_u24lambda_u248 = this_$iv.getMainBuffer$foundation_release();
        if (clearComposition) {
            $this$replaceSelectedText_u24lambda_u248.commitComposition$foundation_release();
        }
        long selection = $this$replaceSelectedText_u24lambda_u248.m1448getSelectiond9O1mEE();
        $this$replaceSelectedText_u24lambda_u248.replace(TextRange.m6337getMinimpl(selection), TextRange.m6336getMaximpl(selection), newText);
        int cursor = TextRange.m6337getMinimpl(selection) + newText.length();
        TextFieldBufferKt.setSelectionCoerced$default($this$replaceSelectedText_u24lambda_u248, cursor, 0, 2, null);
        updateWedgeAffinity($this$replaceSelectedText_u24lambda_u248);
        TextFieldState.access$commitEditAsUser(this_$iv, inputTransformation$iv, restartImeIfContentChanges, undoBehavior);
    }

    public final void collapseSelectionToMax() {
        TextFieldState $this$iv = this.textFieldState;
        InputTransformation inputTransformation$iv = this.inputTransformation;
        TextFieldEditUndoBehavior undoBehavior$iv = TextFieldEditUndoBehavior.MergeIfPossible;
        $this$iv.getMainBuffer$foundation_release().getChangeTracker$foundation_release().clearChanges();
        TextFieldBuffer $this$collapseSelectionToMax_u24lambda_u249 = $this$iv.getMainBuffer$foundation_release();
        TextFieldBufferKt.setSelectionCoerced$default($this$collapseSelectionToMax_u24lambda_u249, TextRange.m6336getMaximpl($this$collapseSelectionToMax_u24lambda_u249.m1448getSelectiond9O1mEE()), 0, 2, null);
        TextFieldState.access$commitEditAsUser($this$iv, inputTransformation$iv, true, undoBehavior$iv);
    }

    public final void collapseSelectionToEnd() {
        TextFieldState $this$iv = this.textFieldState;
        InputTransformation inputTransformation$iv = this.inputTransformation;
        TextFieldEditUndoBehavior undoBehavior$iv = TextFieldEditUndoBehavior.MergeIfPossible;
        $this$iv.getMainBuffer$foundation_release().getChangeTracker$foundation_release().clearChanges();
        TextFieldBuffer $this$collapseSelectionToEnd_u24lambda_u2410 = $this$iv.getMainBuffer$foundation_release();
        TextFieldBufferKt.setSelectionCoerced$default($this$collapseSelectionToEnd_u24lambda_u2410, TextRange.m6334getEndimpl($this$collapseSelectionToEnd_u24lambda_u2410.m1448getSelectiond9O1mEE()), 0, 2, null);
        TextFieldState.access$commitEditAsUser($this$iv, inputTransformation$iv, true, undoBehavior$iv);
    }

    public final void undo() {
        this.textFieldState.getUndoState().undo();
    }

    public final void redo() {
        this.textFieldState.getUndoState().redo();
    }

    public static /* synthetic */ void editUntransformedTextAsUser$default(TransformedTextFieldState $this, boolean restartImeIfContentChanges, Function1 block, int i, Object obj) {
        if ((i & 1) != 0) {
            restartImeIfContentChanges = true;
        }
        TextFieldState $this$iv = $this.textFieldState;
        InputTransformation inputTransformation$iv = $this.inputTransformation;
        TextFieldEditUndoBehavior undoBehavior$iv = TextFieldEditUndoBehavior.MergeIfPossible;
        $this$iv.getMainBuffer$foundation_release().getChangeTracker$foundation_release().clearChanges();
        TextFieldBuffer $this$editUntransformedTextAsUser_u24lambda_u2411 = $this$iv.getMainBuffer$foundation_release();
        block.invoke($this$editUntransformedTextAsUser_u24lambda_u2411);
        $this.updateWedgeAffinity($this$editUntransformedTextAsUser_u24lambda_u2411);
        TextFieldState.access$commitEditAsUser($this$iv, inputTransformation$iv, restartImeIfContentChanges, undoBehavior$iv);
    }

    public final void editUntransformedTextAsUser(boolean restartImeIfContentChanges, Function1<? super TextFieldBuffer, Unit> function1) {
        TextFieldState $this$iv = this.textFieldState;
        InputTransformation inputTransformation$iv = this.inputTransformation;
        TextFieldEditUndoBehavior undoBehavior$iv = TextFieldEditUndoBehavior.MergeIfPossible;
        $this$iv.getMainBuffer$foundation_release().getChangeTracker$foundation_release().clearChanges();
        TextFieldBuffer $this$editUntransformedTextAsUser_u24lambda_u2411 = $this$iv.getMainBuffer$foundation_release();
        function1.invoke($this$editUntransformedTextAsUser_u24lambda_u2411);
        updateWedgeAffinity($this$editUntransformedTextAsUser_u24lambda_u2411);
        TextFieldState.access$commitEditAsUser($this$iv, inputTransformation$iv, restartImeIfContentChanges, undoBehavior$iv);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void updateWedgeAffinity(TextFieldBuffer $this$updateWedgeAffinity) {
        if ($this$updateWedgeAffinity.getChangeTracker$foundation_release().getChangeCount() > 0 && TextRange.m6333getCollapsedimpl($this$updateWedgeAffinity.m1448getSelectiond9O1mEE())) {
            setSelectionWedgeAffinity(new SelectionWedgeAffinity(WedgeAffinity.Start));
        }
    }

    /* renamed from: mapToTransformed--jx7JFs  reason: not valid java name */
    public final long m1581mapToTransformedjx7JFs(int offset) {
        TransformedText value;
        TransformedText value2;
        State<TransformedText> state = this.outputTransformedText;
        OffsetMappingCalculator visualMapping = null;
        OffsetMappingCalculator presentMapping = (state == null || (value2 = state.getValue()) == null) ? null : value2.getOffsetMapping();
        State<TransformedText> state2 = this.codepointTransformedText;
        if (state2 != null && (value = state2.getValue()) != null) {
            visualMapping = value.getOffsetMapping();
        }
        long intermediateRange = presentMapping != null ? presentMapping.m1530mapFromSourcejx7JFs(offset) : TextRangeKt.TextRange(offset);
        if (visualMapping == null) {
            return intermediateRange;
        }
        OffsetMappingCalculator it = visualMapping;
        return Companion.m1589mapToTransformedXGyztTk(intermediateRange, it, getSelectionWedgeAffinity());
    }

    /* renamed from: mapToTransformed-GEjPoXI  reason: not valid java name */
    public final long m1582mapToTransformedGEjPoXI(long range) {
        TransformedText value;
        TransformedText value2;
        State<TransformedText> state = this.outputTransformedText;
        OffsetMappingCalculator visualMapping = null;
        OffsetMappingCalculator presentMapping = (state == null || (value2 = state.getValue()) == null) ? null : value2.getOffsetMapping();
        State<TransformedText> state2 = this.codepointTransformedText;
        if (state2 != null && (value = state2.getValue()) != null) {
            visualMapping = value.getOffsetMapping();
        }
        if (presentMapping != null) {
            OffsetMappingCalculator it = presentMapping;
            range = Companion.m1590mapToTransformedXGyztTk$default(Companion, range, it, null, 4, null);
        }
        if (visualMapping == null) {
            return range;
        }
        OffsetMappingCalculator it2 = visualMapping;
        return Companion.m1589mapToTransformedXGyztTk(range, it2, getSelectionWedgeAffinity());
    }

    /* renamed from: mapFromTransformed--jx7JFs  reason: not valid java name */
    public final long m1579mapFromTransformedjx7JFs(int offset) {
        TransformedText value;
        TransformedText value2;
        State<TransformedText> state = this.outputTransformedText;
        OffsetMappingCalculator visualMapping = null;
        OffsetMappingCalculator presentMapping = (state == null || (value2 = state.getValue()) == null) ? null : value2.getOffsetMapping();
        State<TransformedText> state2 = this.codepointTransformedText;
        if (state2 != null && (value = state2.getValue()) != null) {
            visualMapping = value.getOffsetMapping();
        }
        long intermediateOffset = visualMapping != null ? visualMapping.m1529mapFromDestjx7JFs(offset) : TextRangeKt.TextRange(offset);
        if (presentMapping == null) {
            return intermediateOffset;
        }
        OffsetMappingCalculator it = presentMapping;
        return Companion.m1588mapFromTransformedxdX6G0(intermediateOffset, it);
    }

    /* renamed from: mapFromTransformed-GEjPoXI  reason: not valid java name */
    public final long m1580mapFromTransformedGEjPoXI(long range) {
        long intermediateRange;
        TransformedText value;
        TransformedText value2;
        State<TransformedText> state = this.outputTransformedText;
        OffsetMappingCalculator visualMapping = null;
        OffsetMappingCalculator presentMapping = (state == null || (value2 = state.getValue()) == null) ? null : value2.getOffsetMapping();
        State<TransformedText> state2 = this.codepointTransformedText;
        if (state2 != null && (value = state2.getValue()) != null) {
            visualMapping = value.getOffsetMapping();
        }
        if (visualMapping != null) {
            OffsetMappingCalculator it = visualMapping;
            intermediateRange = Companion.m1588mapFromTransformedxdX6G0(range, it);
        } else {
            intermediateRange = range;
        }
        if (presentMapping == null) {
            return intermediateRange;
        }
        OffsetMappingCalculator it2 = presentMapping;
        return Companion.m1588mapFromTransformedxdX6G0(intermediateRange, it2);
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0024  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x002d  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x003a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object collectImeNotifications(final androidx.compose.foundation.text.input.TextFieldState.NotifyImeListener r12, kotlin.coroutines.Continuation<?> r13) {
        /*
            r11 = this;
            boolean r0 = r13 instanceof androidx.compose.foundation.text.input.internal.TransformedTextFieldState$collectImeNotifications$1
            if (r0 == 0) goto L14
            r0 = r13
            androidx.compose.foundation.text.input.internal.TransformedTextFieldState$collectImeNotifications$1 r0 = (androidx.compose.foundation.text.input.internal.TransformedTextFieldState$collectImeNotifications$1) r0
            int r1 = r0.label
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r1 = r1 & r2
            if (r1 == 0) goto L14
            int r1 = r0.label
            int r1 = r1 - r2
            r0.label = r1
            goto L19
        L14:
            androidx.compose.foundation.text.input.internal.TransformedTextFieldState$collectImeNotifications$1 r0 = new androidx.compose.foundation.text.input.internal.TransformedTextFieldState$collectImeNotifications$1
            r0.<init>(r11, r13)
        L19:
            java.lang.Object r1 = r0.result
            java.lang.Object r2 = kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
            int r3 = r0.label
            switch(r3) {
                case 0: goto L3a;
                case 1: goto L2d;
                default: goto L24;
            }
        L24:
            java.lang.IllegalStateException r12 = new java.lang.IllegalStateException
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            r12.<init>(r0)
            throw r12
        L2d:
            r12 = 0
            java.lang.Object r2 = r0.L$1
            androidx.compose.foundation.text.input.TextFieldState$NotifyImeListener r2 = (androidx.compose.foundation.text.input.TextFieldState.NotifyImeListener) r2
            java.lang.Object r2 = r0.L$0
            androidx.compose.foundation.text.input.internal.TransformedTextFieldState r2 = (androidx.compose.foundation.text.input.internal.TransformedTextFieldState) r2
            kotlin.ResultKt.throwOnFailure(r1)
            goto L90
        L3a:
            kotlin.ResultKt.throwOnFailure(r1)
            r3 = r11
            androidx.compose.foundation.text.input.OutputTransformation r4 = r3.outputTransformation
            if (r4 == 0) goto L4a
        L43:
            androidx.compose.foundation.text.input.internal.TransformedTextFieldState$$ExternalSyntheticLambda0 r4 = new androidx.compose.foundation.text.input.internal.TransformedTextFieldState$$ExternalSyntheticLambda0
            r4.<init>()
            r12 = r4
            goto L4b
        L4a:
        L4b:
            r4 = 0
            r0.L$0 = r3
            r0.L$1 = r12
            r5 = 1
            r0.label = r5
            r6 = r0
            kotlin.coroutines.Continuation r6 = (kotlin.coroutines.Continuation) r6
            r7 = 0
            kotlinx.coroutines.CancellableContinuationImpl r8 = new kotlinx.coroutines.CancellableContinuationImpl
            kotlin.coroutines.Continuation r9 = kotlin.coroutines.intrinsics.IntrinsicsKt.intercepted(r6)
            r8.<init>(r9, r5)
            r8.initCancellability()
            r5 = r8
            kotlinx.coroutines.CancellableContinuation r5 = (kotlinx.coroutines.CancellableContinuation) r5
            r9 = 0
            androidx.compose.foundation.text.input.TextFieldState r10 = access$getTextFieldState$p(r3)
            r10.addNotifyImeListener$foundation_release(r12)
            androidx.compose.foundation.text.input.internal.TransformedTextFieldState$collectImeNotifications$2$1 r10 = new androidx.compose.foundation.text.input.internal.TransformedTextFieldState$collectImeNotifications$2$1
            r10.<init>()
            kotlin.jvm.functions.Function1 r10 = (kotlin.jvm.functions.Function1) r10
            r5.invokeOnCancellation(r10)
            java.lang.Object r12 = r8.getResult()
            java.lang.Object r3 = kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
            if (r12 != r3) goto L8c
            r3 = r0
            kotlin.coroutines.Continuation r3 = (kotlin.coroutines.Continuation) r3
            kotlin.coroutines.jvm.internal.DebugProbesKt.probeCoroutineSuspended(r3)
        L8c:
            if (r12 != r2) goto L8f
            return r2
        L8f:
            r12 = r4
        L90:
            kotlin.KotlinNothingValueException r12 = new kotlin.KotlinNothingValueException
            r12.<init>()
            throw r12
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.text.input.internal.TransformedTextFieldState.collectImeNotifications(androidx.compose.foundation.text.input.TextFieldState$NotifyImeListener, kotlin.coroutines.Continuation):java.lang.Object");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final void collectImeNotifications$lambda$18(TextFieldState.NotifyImeListener $notifyImeListener, TransformedTextFieldState this$0, TextFieldCharSequence oldValue, TextFieldCharSequence textFieldCharSequence, boolean restartIme) {
        TextFieldCharSequence textFieldCharSequence2;
        TransformedText calculateTransformedText = Companion.calculateTransformedText(oldValue, this$0.outputTransformation, this$0.getSelectionWedgeAffinity());
        if (calculateTransformedText == null || (textFieldCharSequence2 = calculateTransformedText.getText()) == null) {
            textFieldCharSequence2 = oldValue;
        }
        $notifyImeListener.onChange(textFieldCharSequence2, this$0.getVisualText(), restartIme);
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if ((other instanceof TransformedTextFieldState) && Intrinsics.areEqual(this.textFieldState, ((TransformedTextFieldState) other).textFieldState) && Intrinsics.areEqual(this.codepointTransformation, ((TransformedTextFieldState) other).codepointTransformation)) {
            return Intrinsics.areEqual(this.outputTransformation, ((TransformedTextFieldState) other).outputTransformation);
        }
        return false;
    }

    public int hashCode() {
        int result = this.textFieldState.hashCode();
        int i = result * 31;
        CodepointTransformation codepointTransformation = this.codepointTransformation;
        int result2 = i + (codepointTransformation != null ? codepointTransformation.hashCode() : 0);
        int result3 = result2 * 31;
        OutputTransformation outputTransformation = this.outputTransformation;
        return result3 + (outputTransformation != null ? outputTransformation.hashCode() : 0);
    }

    public String toString() {
        return "TransformedTextFieldState(textFieldState=" + this.textFieldState + ", outputTransformation=" + this.outputTransformation + ", outputTransformedText=" + this.outputTransformedText + ", codepointTransformation=" + this.codepointTransformation + ", codepointTransformedText=" + this.codepointTransformedText + ", outputText=\"" + ((Object) getOutputText()) + "\", visualText=\"" + ((Object) getVisualText()) + "\")";
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* compiled from: TransformedTextFieldState.kt */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0082\b\u0018\u00002\u00020\u0001B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0002\u0010\u0006J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\t\u0010\f\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\r\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000e\u001a\u00020\u000f2\b\u0010\u0010\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0011\u001a\u00020\u0012HÖ\u0001J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\n¨\u0006\u0015"}, d2 = {"Landroidx/compose/foundation/text/input/internal/TransformedTextFieldState$TransformedText;", "", "text", "Landroidx/compose/foundation/text/input/TextFieldCharSequence;", "offsetMapping", "Landroidx/compose/foundation/text/input/internal/OffsetMappingCalculator;", "(Landroidx/compose/foundation/text/input/TextFieldCharSequence;Landroidx/compose/foundation/text/input/internal/OffsetMappingCalculator;)V", "getOffsetMapping", "()Landroidx/compose/foundation/text/input/internal/OffsetMappingCalculator;", "getText", "()Landroidx/compose/foundation/text/input/TextFieldCharSequence;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes.dex */
    public static final class TransformedText {
        private final OffsetMappingCalculator offsetMapping;
        private final TextFieldCharSequence text;

        public static /* synthetic */ TransformedText copy$default(TransformedText transformedText, TextFieldCharSequence textFieldCharSequence, OffsetMappingCalculator offsetMappingCalculator, int i, Object obj) {
            if ((i & 1) != 0) {
                textFieldCharSequence = transformedText.text;
            }
            if ((i & 2) != 0) {
                offsetMappingCalculator = transformedText.offsetMapping;
            }
            return transformedText.copy(textFieldCharSequence, offsetMappingCalculator);
        }

        public final TextFieldCharSequence component1() {
            return this.text;
        }

        public final OffsetMappingCalculator component2() {
            return this.offsetMapping;
        }

        public final TransformedText copy(TextFieldCharSequence textFieldCharSequence, OffsetMappingCalculator offsetMappingCalculator) {
            return new TransformedText(textFieldCharSequence, offsetMappingCalculator);
        }

        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (obj instanceof TransformedText) {
                TransformedText transformedText = (TransformedText) obj;
                return Intrinsics.areEqual(this.text, transformedText.text) && Intrinsics.areEqual(this.offsetMapping, transformedText.offsetMapping);
            }
            return false;
        }

        public int hashCode() {
            return (this.text.hashCode() * 31) + this.offsetMapping.hashCode();
        }

        public String toString() {
            return "TransformedText(text=" + ((Object) this.text) + ", offsetMapping=" + this.offsetMapping + ')';
        }

        public TransformedText(TextFieldCharSequence text, OffsetMappingCalculator offsetMapping) {
            this.text = text;
            this.offsetMapping = offsetMapping;
        }

        public final TextFieldCharSequence getText() {
            return this.text;
        }

        public final OffsetMappingCalculator getOffsetMapping() {
            return this.offsetMapping;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* compiled from: TransformedTextFieldState.kt */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\b\u0082\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\"\u0010\u0003\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\nH\u0003J\"\u0010\u0003\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u000b\u001a\u00020\f2\u0006\u0010\t\u001a\u00020\nH\u0003J\"\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0010\u001a\u00020\u0011H\u0003ø\u0001\u0000¢\u0006\u0004\b\u0012\u0010\u0013J.\u0010\u0014\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0010\u001a\u00020\u00112\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\nH\u0003ø\u0001\u0000¢\u0006\u0004\b\u0016\u0010\u0017\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006\u0018"}, d2 = {"Landroidx/compose/foundation/text/input/internal/TransformedTextFieldState$Companion;", "", "()V", "calculateTransformedText", "Landroidx/compose/foundation/text/input/internal/TransformedTextFieldState$TransformedText;", "untransformedValue", "Landroidx/compose/foundation/text/input/TextFieldCharSequence;", "outputTransformation", "Landroidx/compose/foundation/text/input/OutputTransformation;", "wedgeAffinity", "Landroidx/compose/foundation/text/input/internal/SelectionWedgeAffinity;", "codepointTransformation", "Landroidx/compose/foundation/text/input/internal/CodepointTransformation;", "mapFromTransformed", "Landroidx/compose/ui/text/TextRange;", "range", "mapping", "Landroidx/compose/foundation/text/input/internal/OffsetMappingCalculator;", "mapFromTransformed-xdX6-G0", "(JLandroidx/compose/foundation/text/input/internal/OffsetMappingCalculator;)J", "mapToTransformed", "selectionWedgeAffinity", "mapToTransformed-XGyztTk", "(JLandroidx/compose/foundation/text/input/internal/OffsetMappingCalculator;Landroidx/compose/foundation/text/input/internal/SelectionWedgeAffinity;)J", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes.dex */
    public static final class Companion {

        /* compiled from: TransformedTextFieldState.kt */
        @Metadata(k = 3, mv = {1, 9, 0}, xi = 48)
        /* loaded from: classes.dex */
        public /* synthetic */ class WhenMappings {
            public static final /* synthetic */ int[] $EnumSwitchMapping$0;

            static {
                int[] iArr = new int[WedgeAffinity.values().length];
                try {
                    iArr[WedgeAffinity.Start.ordinal()] = 1;
                } catch (NoSuchFieldError e) {
                }
                try {
                    iArr[WedgeAffinity.End.ordinal()] = 2;
                } catch (NoSuchFieldError e2) {
                }
                $EnumSwitchMapping$0 = iArr;
            }
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        /* JADX INFO: Access modifiers changed from: private */
        @JvmStatic
        public final TransformedText calculateTransformedText(TextFieldCharSequence untransformedValue, OutputTransformation outputTransformation, SelectionWedgeAffinity wedgeAffinity) {
            OffsetMappingCalculator offsetMappingCalculator = new OffsetMappingCalculator();
            TextFieldBuffer buffer = new TextFieldBuffer(untransformedValue, null, null, offsetMappingCalculator, 6, null);
            outputTransformation.transformOutput(buffer);
            int changeCount = buffer.getChanges().getChangeCount();
            TextRange textRange = null;
            if (changeCount == 0) {
                return null;
            }
            long m1589mapToTransformedXGyztTk = m1589mapToTransformedXGyztTk(untransformedValue.m1456getSelectiond9O1mEE(), offsetMappingCalculator, wedgeAffinity);
            TextRange m1455getCompositionMzsxiRA = untransformedValue.m1455getCompositionMzsxiRA();
            if (m1455getCompositionMzsxiRA != null) {
                long it = m1455getCompositionMzsxiRA.m6343unboximpl();
                textRange = TextRange.m6327boximpl(TransformedTextFieldState.Companion.m1589mapToTransformedXGyztTk(it, offsetMappingCalculator, wedgeAffinity));
            }
            TextFieldCharSequence transformedTextWithSelection = TextFieldBuffer.m1445toTextFieldCharSequenceI88jaVs$foundation_release$default(buffer, m1589mapToTransformedXGyztTk, textRange, null, 4, null);
            return new TransformedText(transformedTextWithSelection, offsetMappingCalculator);
        }

        /* JADX INFO: Access modifiers changed from: private */
        @JvmStatic
        public final TransformedText calculateTransformedText(TextFieldCharSequence untransformedValue, CodepointTransformation codepointTransformation, SelectionWedgeAffinity wedgeAffinity) {
            OffsetMappingCalculator offsetMappingCalculator = new OffsetMappingCalculator();
            CharSequence transformedText = CodepointTransformationKt.toVisualText(untransformedValue, codepointTransformation, offsetMappingCalculator);
            TextRange textRange = null;
            if (transformedText == untransformedValue) {
                return null;
            }
            long m1589mapToTransformedXGyztTk = m1589mapToTransformedXGyztTk(untransformedValue.m1456getSelectiond9O1mEE(), offsetMappingCalculator, wedgeAffinity);
            TextRange m1455getCompositionMzsxiRA = untransformedValue.m1455getCompositionMzsxiRA();
            if (m1455getCompositionMzsxiRA != null) {
                long it = m1455getCompositionMzsxiRA.m6343unboximpl();
                textRange = TextRange.m6327boximpl(TransformedTextFieldState.Companion.m1589mapToTransformedXGyztTk(it, offsetMappingCalculator, wedgeAffinity));
            }
            TextFieldCharSequence transformedTextWithSelection = new TextFieldCharSequence(transformedText, m1589mapToTransformedXGyztTk, textRange, null, null, 24, null);
            return new TransformedText(transformedTextWithSelection, offsetMappingCalculator);
        }

        /* renamed from: mapToTransformed-XGyztTk$default  reason: not valid java name */
        static /* synthetic */ long m1590mapToTransformedXGyztTk$default(Companion companion, long j, OffsetMappingCalculator offsetMappingCalculator, SelectionWedgeAffinity selectionWedgeAffinity, int i, Object obj) {
            if ((i & 4) != 0) {
                selectionWedgeAffinity = null;
            }
            return companion.m1589mapToTransformedXGyztTk(j, offsetMappingCalculator, selectionWedgeAffinity);
        }

        /* JADX INFO: Access modifiers changed from: private */
        @JvmStatic
        /* renamed from: mapToTransformed-XGyztTk  reason: not valid java name */
        public final long m1589mapToTransformedXGyztTk(long range, OffsetMappingCalculator mapping, SelectionWedgeAffinity selectionWedgeAffinity) {
            long TextRange;
            long TextRange2;
            long transformedStart = mapping.m1530mapFromSourcejx7JFs(TextRange.m6339getStartimpl(range));
            long transformedEnd = TextRange.m6333getCollapsedimpl(range) ? transformedStart : mapping.m1530mapFromSourcejx7JFs(TextRange.m6334getEndimpl(range));
            WedgeAffinity endAffinity = null;
            WedgeAffinity startAffinity = selectionWedgeAffinity != null ? selectionWedgeAffinity.getStartAffinity() : null;
            if (TextRange.m6333getCollapsedimpl(range)) {
                endAffinity = startAffinity;
            } else if (selectionWedgeAffinity != null) {
                endAffinity = selectionWedgeAffinity.getEndAffinity();
            }
            if (startAffinity != null && !TextRange.m6333getCollapsedimpl(transformedStart)) {
                switch (WhenMappings.$EnumSwitchMapping$0[startAffinity.ordinal()]) {
                    case 1:
                        TextRange2 = TextRangeKt.TextRange(TextRange.m6339getStartimpl(transformedStart));
                        break;
                    case 2:
                        TextRange2 = TextRangeKt.TextRange(TextRange.m6334getEndimpl(transformedStart));
                        break;
                    default:
                        throw new NoWhenBranchMatchedException();
                }
                transformedStart = TextRange2;
            }
            if (endAffinity != null && !TextRange.m6333getCollapsedimpl(transformedEnd)) {
                switch (WhenMappings.$EnumSwitchMapping$0[endAffinity.ordinal()]) {
                    case 1:
                        TextRange = TextRangeKt.TextRange(TextRange.m6339getStartimpl(transformedEnd));
                        break;
                    case 2:
                        TextRange = TextRangeKt.TextRange(TextRange.m6334getEndimpl(transformedEnd));
                        break;
                    default:
                        throw new NoWhenBranchMatchedException();
                }
                transformedEnd = TextRange;
            }
            int transformedMin = Math.min(TextRange.m6337getMinimpl(transformedStart), TextRange.m6337getMinimpl(transformedEnd));
            int transformedMax = Math.max(TextRange.m6336getMaximpl(transformedStart), TextRange.m6336getMaximpl(transformedEnd));
            if (TextRange.m6338getReversedimpl(range)) {
                long transformedRange = TextRangeKt.TextRange(transformedMax, transformedMin);
                return transformedRange;
            }
            long transformedRange2 = TextRangeKt.TextRange(transformedMin, transformedMax);
            return transformedRange2;
        }

        /* JADX INFO: Access modifiers changed from: private */
        @JvmStatic
        /* renamed from: mapFromTransformed-xdX6-G0  reason: not valid java name */
        public final long m1588mapFromTransformedxdX6G0(long range, OffsetMappingCalculator mapping) {
            long untransformedStart = mapping.m1529mapFromDestjx7JFs(TextRange.m6339getStartimpl(range));
            long untransformedEnd = TextRange.m6333getCollapsedimpl(range) ? untransformedStart : mapping.m1529mapFromDestjx7JFs(TextRange.m6334getEndimpl(range));
            int untransformedMin = Math.min(TextRange.m6337getMinimpl(untransformedStart), TextRange.m6337getMinimpl(untransformedEnd));
            int untransformedMax = Math.max(TextRange.m6336getMaximpl(untransformedStart), TextRange.m6336getMaximpl(untransformedEnd));
            if (TextRange.m6338getReversedimpl(range)) {
                return TextRangeKt.TextRange(untransformedMax, untransformedMin);
            }
            return TextRangeKt.TextRange(untransformedMin, untransformedMax);
        }
    }

    @JvmStatic
    private static final TransformedText calculateTransformedText(TextFieldCharSequence untransformedValue, OutputTransformation outputTransformation, SelectionWedgeAffinity wedgeAffinity) {
        return Companion.calculateTransformedText(untransformedValue, outputTransformation, wedgeAffinity);
    }

    @JvmStatic
    private static final TransformedText calculateTransformedText(TextFieldCharSequence untransformedValue, CodepointTransformation codepointTransformation, SelectionWedgeAffinity wedgeAffinity) {
        return Companion.calculateTransformedText(untransformedValue, codepointTransformation, wedgeAffinity);
    }

    @JvmStatic
    /* renamed from: mapToTransformed-XGyztTk  reason: not valid java name */
    private static final long m1576mapToTransformedXGyztTk(long range, OffsetMappingCalculator mapping, SelectionWedgeAffinity selectionWedgeAffinity) {
        return Companion.m1589mapToTransformedXGyztTk(range, mapping, selectionWedgeAffinity);
    }

    @JvmStatic
    /* renamed from: mapFromTransformed-xdX6-G0  reason: not valid java name */
    private static final long m1575mapFromTransformedxdX6G0(long range, OffsetMappingCalculator mapping) {
        return Companion.m1588mapFromTransformedxdX6G0(range, mapping);
    }
}
