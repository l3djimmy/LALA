package androidx.compose.ui.text.input;

import androidx.compose.ui.text.AnnotatedString;
import androidx.compose.ui.text.AnnotatedStringKt;
import androidx.compose.ui.text.TextRange;
import androidx.compose.ui.text.TextRangeKt;
import java.util.List;
import kotlin.Metadata;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
/* compiled from: EditProcessor.kt */
@Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002J\u0014\u0010\f\u001a\u00020\b2\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u000f0\u000eJ \u0010\u0010\u001a\u00020\u00112\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u000f0\u000e2\b\u0010\u0012\u001a\u0004\u0018\u00010\u000fH\u0002J\u0018\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\b2\b\u0010\u0016\u001a\u0004\u0018\u00010\u0017J\u0006\u0010\u0018\u001a\u00020\bJ\f\u0010\u0019\u001a\u00020\u0011*\u00020\u000fH\u0002R\u001e\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0004@BX\u0080\u000e¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u001e\u0010\t\u001a\u00020\b2\u0006\u0010\u0003\u001a\u00020\b@BX\u0080\u000e¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u001a"}, d2 = {"Landroidx/compose/ui/text/input/EditProcessor;", "", "()V", "<set-?>", "Landroidx/compose/ui/text/input/EditingBuffer;", "mBuffer", "getMBuffer$ui_text_release", "()Landroidx/compose/ui/text/input/EditingBuffer;", "Landroidx/compose/ui/text/input/TextFieldValue;", "mBufferState", "getMBufferState$ui_text_release", "()Landroidx/compose/ui/text/input/TextFieldValue;", "apply", "editCommands", "", "Landroidx/compose/ui/text/input/EditCommand;", "generateBatchErrorMessage", "", "failedCommand", "reset", "", "value", "textInputSession", "Landroidx/compose/ui/text/input/TextInputSession;", "toTextFieldValue", "toStringForLog", "ui-text_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class EditProcessor {
    public static final int $stable = 8;
    private TextFieldValue mBufferState = new TextFieldValue(AnnotatedStringKt.emptyAnnotatedString(), TextRange.Companion.m6344getZerod9O1mEE(), (TextRange) null, (DefaultConstructorMarker) null);
    private EditingBuffer mBuffer = new EditingBuffer(this.mBufferState.getAnnotatedString(), this.mBufferState.m6587getSelectiond9O1mEE(), (DefaultConstructorMarker) null);

    public final TextFieldValue getMBufferState$ui_text_release() {
        return this.mBufferState;
    }

    public final EditingBuffer getMBuffer$ui_text_release() {
        return this.mBuffer;
    }

    public final void reset(TextFieldValue newValue, TextInputSession textInputSession) {
        boolean textChanged = false;
        boolean selectionChanged = false;
        boolean compositionChanged = !Intrinsics.areEqual(newValue.m6586getCompositionMzsxiRA(), this.mBuffer.m6499getCompositionMzsxiRA$ui_text_release());
        if (!Intrinsics.areEqual(this.mBufferState.getAnnotatedString().getText(), newValue.getAnnotatedString().getText())) {
            this.mBuffer = new EditingBuffer(newValue.getAnnotatedString(), newValue.m6587getSelectiond9O1mEE(), (DefaultConstructorMarker) null);
            textChanged = true;
        } else if (!TextRange.m6332equalsimpl0(this.mBufferState.m6587getSelectiond9O1mEE(), newValue.m6587getSelectiond9O1mEE())) {
            this.mBuffer.setSelection$ui_text_release(TextRange.m6337getMinimpl(newValue.m6587getSelectiond9O1mEE()), TextRange.m6336getMaximpl(newValue.m6587getSelectiond9O1mEE()));
            selectionChanged = true;
        }
        if (newValue.m6586getCompositionMzsxiRA() == null) {
            this.mBuffer.commitComposition$ui_text_release();
        } else if (!TextRange.m6333getCollapsedimpl(newValue.m6586getCompositionMzsxiRA().m6343unboximpl())) {
            this.mBuffer.setComposition$ui_text_release(TextRange.m6337getMinimpl(newValue.m6586getCompositionMzsxiRA().m6343unboximpl()), TextRange.m6336getMaximpl(newValue.m6586getCompositionMzsxiRA().m6343unboximpl()));
        }
        if (textChanged || (!selectionChanged && compositionChanged)) {
            this.mBuffer.commitComposition$ui_text_release();
            newValue = TextFieldValue.m6582copy3r_uNRQ$default(newValue, (AnnotatedString) null, 0L, (TextRange) null, 3, (Object) null);
        }
        TextFieldValue oldValue = this.mBufferState;
        this.mBufferState = newValue;
        if (textInputSession != null) {
            textInputSession.updateState(oldValue, newValue);
        }
    }

    public final TextFieldValue apply(List<? extends EditCommand> list) {
        EditCommand editCommand = null;
        try {
            int size = list.size();
            for (int index$iv = 0; index$iv < size; index$iv++) {
                Object item$iv = list.get(index$iv);
                EditCommand it = (EditCommand) item$iv;
                editCommand = it;
                it.applyTo(this.mBuffer);
            }
            AnnotatedString annotatedString$ui_text_release = this.mBuffer.toAnnotatedString$ui_text_release();
            long $this$apply_u24lambda_u242 = this.mBuffer.m6500getSelectiond9O1mEE$ui_text_release();
            TextRange m6327boximpl = TextRange.m6327boximpl($this$apply_u24lambda_u242);
            m6327boximpl.m6343unboximpl();
            if (TextRange.m6338getReversedimpl(this.mBufferState.m6587getSelectiond9O1mEE())) {
                m6327boximpl = null;
            }
            TextFieldValue newState = new TextFieldValue(annotatedString$ui_text_release, m6327boximpl != null ? m6327boximpl.m6343unboximpl() : TextRangeKt.TextRange(TextRange.m6336getMaximpl($this$apply_u24lambda_u242), TextRange.m6337getMinimpl($this$apply_u24lambda_u242)), this.mBuffer.m6499getCompositionMzsxiRA$ui_text_release(), (DefaultConstructorMarker) null);
            this.mBufferState = newState;
            return newState;
        } catch (Exception e) {
            throw new RuntimeException(generateBatchErrorMessage(list, editCommand), e);
        }
    }

    public final TextFieldValue toTextFieldValue() {
        return this.mBufferState;
    }

    private final String generateBatchErrorMessage(List<? extends EditCommand> list, final EditCommand failedCommand) {
        StringBuilder $this$generateBatchErrorMessage_u24lambda_u243 = new StringBuilder();
        StringBuilder append = $this$generateBatchErrorMessage_u24lambda_u243.append("Error while applying EditCommand batch to buffer (length=" + this.mBuffer.getLength$ui_text_release() + ", composition=" + this.mBuffer.m6499getCompositionMzsxiRA$ui_text_release() + ", selection=" + ((Object) TextRange.m6342toStringimpl(this.mBuffer.m6500getSelectiond9O1mEE$ui_text_release())) + "):");
        Intrinsics.checkNotNullExpressionValue(append, "append(...)");
        Intrinsics.checkNotNullExpressionValue(append.append('\n'), "append(...)");
        CollectionsKt.joinTo(list, $this$generateBatchErrorMessage_u24lambda_u243, (r14 & 2) != 0 ? ", " : "\n", (r14 & 4) != 0 ? "" : null, (r14 & 8) != 0 ? "" : null, (r14 & 16) != 0 ? -1 : 0, (r14 & 32) != 0 ? "..." : null, (r14 & 64) != 0 ? null : new Function1<EditCommand, CharSequence>() { // from class: androidx.compose.ui.text.input.EditProcessor$generateBatchErrorMessage$1$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public final CharSequence invoke(EditCommand it) {
                String stringForLog;
                String prefix = EditCommand.this == it ? " > " : "   ";
                StringBuilder append2 = new StringBuilder().append(prefix);
                stringForLog = this.toStringForLog(it);
                return append2.append(stringForLog).toString();
            }
        });
        String sb = $this$generateBatchErrorMessage_u24lambda_u243.toString();
        Intrinsics.checkNotNullExpressionValue(sb, "toString(...)");
        return sb;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final String toStringForLog(EditCommand $this$toStringForLog) {
        if ($this$toStringForLog instanceof CommitTextCommand) {
            return "CommitTextCommand(text.length=" + ((CommitTextCommand) $this$toStringForLog).getText().length() + ", newCursorPosition=" + ((CommitTextCommand) $this$toStringForLog).getNewCursorPosition() + ')';
        }
        if ($this$toStringForLog instanceof SetComposingTextCommand) {
            return "SetComposingTextCommand(text.length=" + ((SetComposingTextCommand) $this$toStringForLog).getText().length() + ", newCursorPosition=" + ((SetComposingTextCommand) $this$toStringForLog).getNewCursorPosition() + ')';
        }
        if (!($this$toStringForLog instanceof SetComposingRegionCommand) && !($this$toStringForLog instanceof DeleteSurroundingTextCommand) && !($this$toStringForLog instanceof DeleteSurroundingTextInCodePointsCommand) && !($this$toStringForLog instanceof SetSelectionCommand) && !($this$toStringForLog instanceof FinishComposingTextCommand) && !($this$toStringForLog instanceof BackspaceCommand) && !($this$toStringForLog instanceof MoveCursorCommand) && !($this$toStringForLog instanceof DeleteAllCommand)) {
            StringBuilder append = new StringBuilder().append("Unknown EditCommand: ");
            String simpleName = Reflection.getOrCreateKotlinClass($this$toStringForLog.getClass()).getSimpleName();
            if (simpleName == null) {
                simpleName = "{anonymous EditCommand}";
            }
            return append.append(simpleName).toString();
        }
        return $this$toStringForLog.toString();
    }
}
