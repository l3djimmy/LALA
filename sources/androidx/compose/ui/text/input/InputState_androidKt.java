package androidx.compose.ui.text.input;

import android.view.inputmethod.ExtractedText;
import androidx.compose.ui.text.TextRange;
import kotlin.Metadata;
import kotlin.text.StringsKt;
/* compiled from: InputState.android.kt */
@Metadata(d1 = {"\u0000\f\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u001a\f\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u0000¨\u0006\u0003"}, d2 = {"toExtractedText", "Landroid/view/inputmethod/ExtractedText;", "Landroidx/compose/ui/text/input/TextFieldValue;", "ui_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class InputState_androidKt {
    public static final ExtractedText toExtractedText(TextFieldValue $this$toExtractedText) {
        ExtractedText res = new ExtractedText();
        res.text = $this$toExtractedText.getText();
        res.startOffset = 0;
        res.partialEndOffset = $this$toExtractedText.getText().length();
        res.partialStartOffset = -1;
        res.selectionStart = TextRange.m6337getMinimpl($this$toExtractedText.m6587getSelectiond9O1mEE());
        res.selectionEnd = TextRange.m6336getMaximpl($this$toExtractedText.m6587getSelectiond9O1mEE());
        res.flags = !StringsKt.contains$default((CharSequence) $this$toExtractedText.getText(), '\n', false, 2, (Object) null) ? 1 : 0;
        return res;
    }
}
