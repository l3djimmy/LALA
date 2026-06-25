package androidx.compose.foundation.text.input.internal;

import android.view.inputmethod.EditorInfo;
import androidx.compose.foundation.text.handwriting.StylusHandwriting_androidKt;
import androidx.compose.ui.text.TextRange;
import androidx.compose.ui.text.input.ImeAction;
import androidx.compose.ui.text.input.ImeOptions;
import androidx.compose.ui.text.input.KeyboardCapitalization;
import androidx.compose.ui.text.input.KeyboardType;
import androidx.compose.ui.text.input.PlatformImeOptions;
import androidx.core.view.inputmethod.EditorInfoCompat;
import com.itextpdf.layout.properties.Property;
import kotlin.Metadata;
/* compiled from: EditorInfo.android.kt */
@Metadata(d1 = {"\u00008\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\r\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0011\n\u0002\u0010\u000e\n\u0002\b\u0003\u001a\u0018\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0003H\u0002\u001a@\u0010\u0005\u001a\u00020\u0006*\u00020\u00072\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\r2\u0010\b\u0002\u0010\u000e\u001a\n\u0012\u0004\u0012\u00020\u0010\u0018\u00010\u000fH\u0000ø\u0001\u0000¢\u0006\u0004\b\u0011\u0010\u0012\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006\u0013"}, d2 = {"hasFlag", "", "bits", "", "flag", "update", "", "Landroid/view/inputmethod/EditorInfo;", "text", "", "selection", "Landroidx/compose/ui/text/TextRange;", "imeOptions", "Landroidx/compose/ui/text/input/ImeOptions;", "contentMimeTypes", "", "", "update-pLxbY9I", "(Landroid/view/inputmethod/EditorInfo;Ljava/lang/CharSequence;JLandroidx/compose/ui/text/input/ImeOptions;[Ljava/lang/String;)V", "foundation_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class EditorInfo_androidKt {
    /* renamed from: update-pLxbY9I$default  reason: not valid java name */
    public static /* synthetic */ void m1497updatepLxbY9I$default(EditorInfo editorInfo, CharSequence charSequence, long j, ImeOptions imeOptions, String[] strArr, int i, Object obj) {
        String[] strArr2;
        if ((i & 8) == 0) {
            strArr2 = strArr;
        } else {
            strArr2 = null;
        }
        m1496updatepLxbY9I(editorInfo, charSequence, j, imeOptions, strArr2);
    }

    /* renamed from: update-pLxbY9I  reason: not valid java name */
    public static final void m1496updatepLxbY9I(EditorInfo $this$update_u2dpLxbY9I, CharSequence text, long selection, ImeOptions imeOptions, String[] contentMimeTypes) {
        String it;
        int m6534getImeActioneUduSuo = imeOptions.m6534getImeActioneUduSuo();
        int i = 3;
        int i2 = 6;
        if (ImeAction.m6505equalsimpl0(m6534getImeActioneUduSuo, ImeAction.Companion.m6518getDefaulteUduSuo())) {
            if (!imeOptions.getSingleLine()) {
                i2 = 0;
            }
        } else if (ImeAction.m6505equalsimpl0(m6534getImeActioneUduSuo, ImeAction.Companion.m6522getNoneeUduSuo())) {
            i2 = 1;
        } else if (ImeAction.m6505equalsimpl0(m6534getImeActioneUduSuo, ImeAction.Companion.m6520getGoeUduSuo())) {
            i2 = 2;
        } else if (ImeAction.m6505equalsimpl0(m6534getImeActioneUduSuo, ImeAction.Companion.m6521getNexteUduSuo())) {
            i2 = 5;
        } else if (ImeAction.m6505equalsimpl0(m6534getImeActioneUduSuo, ImeAction.Companion.m6523getPreviouseUduSuo())) {
            i2 = 7;
        } else if (ImeAction.m6505equalsimpl0(m6534getImeActioneUduSuo, ImeAction.Companion.m6524getSearcheUduSuo())) {
            i2 = 3;
        } else if (ImeAction.m6505equalsimpl0(m6534getImeActioneUduSuo, ImeAction.Companion.m6525getSendeUduSuo())) {
            i2 = 4;
        } else if (!ImeAction.m6505equalsimpl0(m6534getImeActioneUduSuo, ImeAction.Companion.m6519getDoneeUduSuo())) {
            throw new IllegalStateException("invalid ImeAction".toString());
        }
        $this$update_u2dpLxbY9I.imeOptions = i2;
        PlatformImeOptions platformImeOptions = imeOptions.getPlatformImeOptions();
        if (platformImeOptions != null && (it = platformImeOptions.getPrivateImeOptions()) != null) {
            $this$update_u2dpLxbY9I.privateImeOptions = it;
        }
        LocaleListHelper.INSTANCE.setHintLocales($this$update_u2dpLxbY9I, imeOptions.getHintLocales());
        int m6535getKeyboardTypePjHm6EE = imeOptions.m6535getKeyboardTypePjHm6EE();
        if (KeyboardType.m6558equalsimpl0(m6535getKeyboardTypePjHm6EE, KeyboardType.Companion.m6579getTextPjHm6EE())) {
            i = 1;
        } else if (KeyboardType.m6558equalsimpl0(m6535getKeyboardTypePjHm6EE, KeyboardType.Companion.m6572getAsciiPjHm6EE())) {
            $this$update_u2dpLxbY9I.imeOptions |= Integer.MIN_VALUE;
            i = 1;
        } else if (KeyboardType.m6558equalsimpl0(m6535getKeyboardTypePjHm6EE, KeyboardType.Companion.m6575getNumberPjHm6EE())) {
            i = 2;
        } else if (!KeyboardType.m6558equalsimpl0(m6535getKeyboardTypePjHm6EE, KeyboardType.Companion.m6578getPhonePjHm6EE())) {
            if (KeyboardType.m6558equalsimpl0(m6535getKeyboardTypePjHm6EE, KeyboardType.Companion.m6581getUriPjHm6EE())) {
                i = 17;
            } else if (KeyboardType.m6558equalsimpl0(m6535getKeyboardTypePjHm6EE, KeyboardType.Companion.m6574getEmailPjHm6EE())) {
                i = 33;
            } else if (KeyboardType.m6558equalsimpl0(m6535getKeyboardTypePjHm6EE, KeyboardType.Companion.m6577getPasswordPjHm6EE())) {
                i = Property.ALIGN_SELF;
            } else if (KeyboardType.m6558equalsimpl0(m6535getKeyboardTypePjHm6EE, KeyboardType.Companion.m6576getNumberPasswordPjHm6EE())) {
                i = 18;
            } else if (KeyboardType.m6558equalsimpl0(m6535getKeyboardTypePjHm6EE, KeyboardType.Companion.m6573getDecimalPjHm6EE())) {
                i = 8194;
            } else {
                throw new IllegalStateException("Invalid Keyboard Type".toString());
            }
        }
        $this$update_u2dpLxbY9I.inputType = i;
        if (!imeOptions.getSingleLine() && hasFlag($this$update_u2dpLxbY9I.inputType, 1)) {
            $this$update_u2dpLxbY9I.inputType |= 131072;
            if (ImeAction.m6505equalsimpl0(imeOptions.m6534getImeActioneUduSuo(), ImeAction.Companion.m6518getDefaulteUduSuo())) {
                $this$update_u2dpLxbY9I.imeOptions |= 1073741824;
            }
        }
        if (hasFlag($this$update_u2dpLxbY9I.inputType, 1)) {
            int m6533getCapitalizationIUNYP9k = imeOptions.m6533getCapitalizationIUNYP9k();
            if (KeyboardCapitalization.m6541equalsimpl0(m6533getCapitalizationIUNYP9k, KeyboardCapitalization.Companion.m6550getCharactersIUNYP9k())) {
                $this$update_u2dpLxbY9I.inputType |= 4096;
            } else if (KeyboardCapitalization.m6541equalsimpl0(m6533getCapitalizationIUNYP9k, KeyboardCapitalization.Companion.m6554getWordsIUNYP9k())) {
                $this$update_u2dpLxbY9I.inputType |= 8192;
            } else if (KeyboardCapitalization.m6541equalsimpl0(m6533getCapitalizationIUNYP9k, KeyboardCapitalization.Companion.m6552getSentencesIUNYP9k())) {
                $this$update_u2dpLxbY9I.inputType |= 16384;
            }
            if (imeOptions.getAutoCorrect()) {
                $this$update_u2dpLxbY9I.inputType |= 32768;
            }
        }
        $this$update_u2dpLxbY9I.initialSelStart = TextRange.m6339getStartimpl(selection);
        $this$update_u2dpLxbY9I.initialSelEnd = TextRange.m6334getEndimpl(selection);
        EditorInfoCompat.setInitialSurroundingText($this$update_u2dpLxbY9I, text);
        if (contentMimeTypes != null) {
            EditorInfoCompat.setContentMimeTypes($this$update_u2dpLxbY9I, contentMimeTypes);
        }
        $this$update_u2dpLxbY9I.imeOptions |= 33554432;
        if (StylusHandwriting_androidKt.isStylusHandwritingSupported() && !KeyboardType.m6558equalsimpl0(imeOptions.m6535getKeyboardTypePjHm6EE(), KeyboardType.Companion.m6577getPasswordPjHm6EE()) && !KeyboardType.m6558equalsimpl0(imeOptions.m6535getKeyboardTypePjHm6EE(), KeyboardType.Companion.m6576getNumberPasswordPjHm6EE())) {
            EditorInfoCompat.setStylusHandwritingEnabled($this$update_u2dpLxbY9I, true);
            EditorInfoApi34.INSTANCE.setHandwritingGestures($this$update_u2dpLxbY9I);
            return;
        }
        EditorInfoCompat.setStylusHandwritingEnabled($this$update_u2dpLxbY9I, false);
    }

    private static final boolean hasFlag(int bits, int flag) {
        return (bits & flag) == flag;
    }
}
