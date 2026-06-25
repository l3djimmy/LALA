package androidx.compose.ui.text.input;

import android.view.Choreographer;
import android.view.inputmethod.EditorInfo;
import androidx.compose.ui.text.TextRange;
import androidx.core.view.inputmethod.EditorInfoCompat;
import androidx.emoji2.text.EmojiCompat;
import com.itextpdf.layout.properties.Property;
import java.util.concurrent.Executor;
import kotlin.Metadata;
/* compiled from: TextInputServiceAndroid.android.kt */
@Metadata(d1 = {"\u00008\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\u001a\u0018\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0005H\u0002\u001a\f\u0010\u0007\u001a\u00020\b*\u00020\tH\u0000\u001a\u001c\u0010\n\u001a\u00020\u000b*\u00020\f2\u0006\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u0010H\u0000\u001a\f\u0010\u0011\u001a\u00020\u000b*\u00020\fH\u0002\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082T¢\u0006\u0002\n\u0000¨\u0006\u0012"}, d2 = {"DEBUG_CLASS", "", "hasFlag", "", "bits", "", "flag", "asExecutor", "Ljava/util/concurrent/Executor;", "Landroid/view/Choreographer;", "update", "", "Landroid/view/inputmethod/EditorInfo;", "imeOptions", "Landroidx/compose/ui/text/input/ImeOptions;", "textFieldValue", "Landroidx/compose/ui/text/input/TextFieldValue;", "updateWithEmojiCompat", "ui_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class TextInputServiceAndroid_androidKt {
    private static final String DEBUG_CLASS = "TextInputServiceAndroid";

    /* JADX INFO: Access modifiers changed from: private */
    public static final void updateWithEmojiCompat(EditorInfo $this$updateWithEmojiCompat) {
        if (!EmojiCompat.isConfigured()) {
            return;
        }
        EmojiCompat.get().updateEditorInfo($this$updateWithEmojiCompat);
    }

    public static final void update(EditorInfo $this$update, ImeOptions imeOptions, TextFieldValue textFieldValue) {
        String it;
        int m6534getImeActioneUduSuo = imeOptions.m6534getImeActioneUduSuo();
        int i = 6;
        if (ImeAction.m6505equalsimpl0(m6534getImeActioneUduSuo, ImeAction.Companion.m6518getDefaulteUduSuo())) {
            if (!imeOptions.getSingleLine()) {
                i = 0;
            }
        } else if (ImeAction.m6505equalsimpl0(m6534getImeActioneUduSuo, ImeAction.Companion.m6522getNoneeUduSuo())) {
            i = 1;
        } else if (ImeAction.m6505equalsimpl0(m6534getImeActioneUduSuo, ImeAction.Companion.m6520getGoeUduSuo())) {
            i = 2;
        } else if (ImeAction.m6505equalsimpl0(m6534getImeActioneUduSuo, ImeAction.Companion.m6521getNexteUduSuo())) {
            i = 5;
        } else if (ImeAction.m6505equalsimpl0(m6534getImeActioneUduSuo, ImeAction.Companion.m6523getPreviouseUduSuo())) {
            i = 7;
        } else if (ImeAction.m6505equalsimpl0(m6534getImeActioneUduSuo, ImeAction.Companion.m6524getSearcheUduSuo())) {
            i = 3;
        } else if (ImeAction.m6505equalsimpl0(m6534getImeActioneUduSuo, ImeAction.Companion.m6525getSendeUduSuo())) {
            i = 4;
        } else if (!ImeAction.m6505equalsimpl0(m6534getImeActioneUduSuo, ImeAction.Companion.m6519getDoneeUduSuo())) {
            throw new IllegalStateException("invalid ImeAction".toString());
        }
        $this$update.imeOptions = i;
        PlatformImeOptions platformImeOptions = imeOptions.getPlatformImeOptions();
        if (platformImeOptions != null && (it = platformImeOptions.getPrivateImeOptions()) != null) {
            $this$update.privateImeOptions = it;
        }
        int m6535getKeyboardTypePjHm6EE = imeOptions.m6535getKeyboardTypePjHm6EE();
        if (KeyboardType.m6558equalsimpl0(m6535getKeyboardTypePjHm6EE, KeyboardType.Companion.m6579getTextPjHm6EE())) {
            $this$update.inputType = 1;
        } else if (KeyboardType.m6558equalsimpl0(m6535getKeyboardTypePjHm6EE, KeyboardType.Companion.m6572getAsciiPjHm6EE())) {
            $this$update.inputType = 1;
            $this$update.imeOptions |= Integer.MIN_VALUE;
        } else if (KeyboardType.m6558equalsimpl0(m6535getKeyboardTypePjHm6EE, KeyboardType.Companion.m6575getNumberPjHm6EE())) {
            $this$update.inputType = 2;
        } else if (KeyboardType.m6558equalsimpl0(m6535getKeyboardTypePjHm6EE, KeyboardType.Companion.m6578getPhonePjHm6EE())) {
            $this$update.inputType = 3;
        } else if (KeyboardType.m6558equalsimpl0(m6535getKeyboardTypePjHm6EE, KeyboardType.Companion.m6581getUriPjHm6EE())) {
            $this$update.inputType = 17;
        } else if (KeyboardType.m6558equalsimpl0(m6535getKeyboardTypePjHm6EE, KeyboardType.Companion.m6574getEmailPjHm6EE())) {
            $this$update.inputType = 33;
        } else if (KeyboardType.m6558equalsimpl0(m6535getKeyboardTypePjHm6EE, KeyboardType.Companion.m6577getPasswordPjHm6EE())) {
            $this$update.inputType = Property.ALIGN_SELF;
        } else if (KeyboardType.m6558equalsimpl0(m6535getKeyboardTypePjHm6EE, KeyboardType.Companion.m6576getNumberPasswordPjHm6EE())) {
            $this$update.inputType = 18;
        } else if (KeyboardType.m6558equalsimpl0(m6535getKeyboardTypePjHm6EE, KeyboardType.Companion.m6573getDecimalPjHm6EE())) {
            $this$update.inputType = 8194;
        } else {
            throw new IllegalStateException("Invalid Keyboard Type".toString());
        }
        if (!imeOptions.getSingleLine() && hasFlag($this$update.inputType, 1)) {
            $this$update.inputType |= 131072;
            if (ImeAction.m6505equalsimpl0(imeOptions.m6534getImeActioneUduSuo(), ImeAction.Companion.m6518getDefaulteUduSuo())) {
                $this$update.imeOptions |= 1073741824;
            }
        }
        if (hasFlag($this$update.inputType, 1)) {
            int m6533getCapitalizationIUNYP9k = imeOptions.m6533getCapitalizationIUNYP9k();
            if (KeyboardCapitalization.m6541equalsimpl0(m6533getCapitalizationIUNYP9k, KeyboardCapitalization.Companion.m6550getCharactersIUNYP9k())) {
                $this$update.inputType |= 4096;
            } else if (KeyboardCapitalization.m6541equalsimpl0(m6533getCapitalizationIUNYP9k, KeyboardCapitalization.Companion.m6554getWordsIUNYP9k())) {
                $this$update.inputType |= 8192;
            } else if (KeyboardCapitalization.m6541equalsimpl0(m6533getCapitalizationIUNYP9k, KeyboardCapitalization.Companion.m6552getSentencesIUNYP9k())) {
                $this$update.inputType |= 16384;
            }
            if (imeOptions.getAutoCorrect()) {
                $this$update.inputType |= 32768;
            }
        }
        $this$update.initialSelStart = TextRange.m6339getStartimpl(textFieldValue.m6587getSelectiond9O1mEE());
        $this$update.initialSelEnd = TextRange.m6334getEndimpl(textFieldValue.m6587getSelectiond9O1mEE());
        EditorInfoCompat.setInitialSurroundingText($this$update, textFieldValue.getText());
        $this$update.imeOptions |= 33554432;
    }

    public static final Executor asExecutor(final Choreographer $this$asExecutor) {
        return new Executor() { // from class: androidx.compose.ui.text.input.TextInputServiceAndroid_androidKt$$ExternalSyntheticLambda1
            @Override // java.util.concurrent.Executor
            public final void execute(Runnable runnable) {
                $this$asExecutor.postFrameCallback(new Choreographer.FrameCallback() { // from class: androidx.compose.ui.text.input.TextInputServiceAndroid_androidKt$$ExternalSyntheticLambda0
                    @Override // android.view.Choreographer.FrameCallback
                    public final void doFrame(long j) {
                        runnable.run();
                    }
                });
            }
        };
    }

    private static final boolean hasFlag(int bits, int flag) {
        return (bits & flag) == flag;
    }
}
