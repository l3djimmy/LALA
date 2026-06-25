package androidx.compose.foundation.text.input;

import androidx.compose.foundation.text.input.TextFieldState;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.collection.MutableVector;
import androidx.compose.runtime.saveable.RememberSaveableKt;
import androidx.compose.runtime.saveable.Saver;
import androidx.compose.ui.graphics.Shadow;
import androidx.compose.ui.graphics.drawscope.DrawStyle;
import androidx.compose.ui.text.AnnotatedString;
import androidx.compose.ui.text.PlatformSpanStyle;
import androidx.compose.ui.text.SpanStyle;
import androidx.compose.ui.text.TextRange;
import androidx.compose.ui.text.TextRangeKt;
import androidx.compose.ui.text.font.FontFamily;
import androidx.compose.ui.text.font.FontStyle;
import androidx.compose.ui.text.font.FontSynthesis;
import androidx.compose.ui.text.font.FontWeight;
import androidx.compose.ui.text.intl.LocaleList;
import androidx.compose.ui.text.style.BaselineShift;
import androidx.compose.ui.text.style.TextDecoration;
import androidx.compose.ui.text.style.TextGeometricTransform;
import com.itextpdf.layout.properties.Property;
import java.util.List;
import kotlin.Metadata;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.DefaultConstructorMarker;
/* compiled from: TextFieldState.kt */
@Metadata(d1 = {"\u0000>\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0010\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\u001aD\u0010\u0000\u001a\u0012\u0012\u000e\u0012\f\u0012\u0004\u0012\u00020\u00030\u0002j\u0002`\u00040\u00012\b\u0010\u0005\u001a\u0004\u0018\u00010\u00062\u0018\u0010\u0007\u001a\u0014\u0012\u000e\u0012\f\u0012\u0004\u0012\u00020\u00030\u0002j\u0002`\u0004\u0018\u00010\bH\u0002ø\u0001\u0000¢\u0006\u0002\b\t\u001a&\u0010\n\u001a\u00020\u000b2\b\b\u0002\u0010\f\u001a\u00020\r2\b\b\u0002\u0010\u000e\u001a\u00020\u0006H\u0007ø\u0001\u0000¢\u0006\u0004\b\u000f\u0010\u0010\u001a\n\u0010\u0011\u001a\u00020\u0012*\u00020\u000b\u001a\u0012\u0010\u0013\u001a\u00020\u0012*\u00020\u000b2\u0006\u0010\u0014\u001a\u00020\r\u001a\u0012\u0010\u0015\u001a\u00020\u0012*\u00020\u000b2\u0006\u0010\u0014\u001a\u00020\r\u001a\n\u0010\u0016\u001a\u00020\u0017*\u00020\u000b\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006\u0018"}, d2 = {"finalizeComposingAnnotations", "", "Landroidx/compose/ui/text/AnnotatedString$Range;", "Landroidx/compose/ui/text/AnnotatedString$Annotation;", "Landroidx/compose/foundation/text/input/PlacedAnnotation;", "composition", "Landroidx/compose/ui/text/TextRange;", "annotationList", "Landroidx/compose/runtime/collection/MutableVector;", "finalizeComposingAnnotations-itr0ztk", "rememberTextFieldState", "Landroidx/compose/foundation/text/input/TextFieldState;", "initialText", "", "initialSelection", "rememberTextFieldState-Le-punE", "(Ljava/lang/String;JLandroidx/compose/runtime/Composer;II)Landroidx/compose/foundation/text/input/TextFieldState;", "clearText", "", "setTextAndPlaceCursorAtEnd", "text", "setTextAndSelectAll", "toTextFieldBuffer", "Landroidx/compose/foundation/text/input/TextFieldBuffer;", "foundation_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class TextFieldStateKt {
    /* renamed from: rememberTextFieldState-Le-punE */
    public static final TextFieldState m1461rememberTextFieldStateLepunE(final String initialText, final long initialSelection, Composer $composer, int $changed, int i) {
        ComposerKt.sourceInformationMarkerStart($composer, 1125389485, "C(rememberTextFieldState)P(1,0:c#ui.text.TextRange)644@28644L49,644@28597L96:TextFieldState.kt#hp9ohv");
        if ((i & 1) != 0) {
            initialText = "";
        }
        if ((i & 2) != 0) {
            initialSelection = TextRangeKt.TextRange(initialText.length());
        }
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(1125389485, $changed, -1, "androidx.compose.foundation.text.input.rememberTextFieldState (TextFieldState.kt:644)");
        }
        Object[] objArr = new Object[0];
        TextFieldState.Saver saver = TextFieldState.Saver.INSTANCE;
        ComposerKt.sourceInformationMarkerStart($composer, 975867757, "CC(remember):TextFieldState.kt#9igjgp");
        boolean invalid$iv = (((($changed & Property.BORDER_BOTTOM_RIGHT_RADIUS) ^ 48) > 32 && $composer.changed(initialSelection)) || ($changed & 48) == 32) | (((($changed & 14) ^ 6) > 4 && $composer.changed(initialText)) || ($changed & 6) == 4);
        Object it$iv = $composer.rememberedValue();
        if (invalid$iv || it$iv == Composer.Companion.getEmpty()) {
            Object value$iv = (Function0) new Function0<TextFieldState>() { // from class: androidx.compose.foundation.text.input.TextFieldStateKt$rememberTextFieldState$1$1
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(0);
                }

                /* JADX WARN: Can't rename method to resolve collision */
                @Override // kotlin.jvm.functions.Function0
                public final TextFieldState invoke() {
                    return new TextFieldState(initialText, initialSelection, (DefaultConstructorMarker) null);
                }
            };
            $composer.updateRememberedValue(value$iv);
            it$iv = value$iv;
        }
        ComposerKt.sourceInformationMarkerEnd($composer);
        TextFieldState textFieldState = (TextFieldState) RememberSaveableKt.m3846rememberSaveable(objArr, (Saver<Object, ? extends Object>) saver, (String) null, (Function0<? extends Object>) it$iv, $composer, 48, 4);
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        ComposerKt.sourceInformationMarkerEnd($composer);
        return textFieldState;
    }

    public static final void setTextAndPlaceCursorAtEnd(TextFieldState $this$setTextAndPlaceCursorAtEnd, String text) {
        TextFieldBuffer mutableValue$iv = $this$setTextAndPlaceCursorAtEnd.startEdit();
        try {
            mutableValue$iv.replace(0, mutableValue$iv.getLength(), text);
            TextFieldBufferKt.placeCursorAtEnd(mutableValue$iv);
            $this$setTextAndPlaceCursorAtEnd.commitEdit(mutableValue$iv);
        } finally {
            $this$setTextAndPlaceCursorAtEnd.finishEditing();
        }
    }

    public static final void setTextAndSelectAll(TextFieldState $this$setTextAndSelectAll, String text) {
        TextFieldBuffer mutableValue$iv = $this$setTextAndSelectAll.startEdit();
        try {
            mutableValue$iv.replace(0, mutableValue$iv.getLength(), text);
            TextFieldBufferKt.selectAll(mutableValue$iv);
            $this$setTextAndSelectAll.commitEdit(mutableValue$iv);
        } finally {
            $this$setTextAndSelectAll.finishEditing();
        }
    }

    public static final void clearText(TextFieldState $this$clearText) {
        TextFieldBuffer mutableValue$iv = $this$clearText.startEdit();
        try {
            TextFieldBufferKt.delete(mutableValue$iv, 0, mutableValue$iv.getLength());
            TextFieldBufferKt.placeCursorAtEnd(mutableValue$iv);
            $this$clearText.commitEdit(mutableValue$iv);
        } finally {
            $this$clearText.finishEditing();
        }
    }

    /* renamed from: finalizeComposingAnnotations-itr0ztk */
    public static final List<AnnotatedString.Range<AnnotatedString.Annotation>> m1460finalizeComposingAnnotationsitr0ztk(TextRange composition, MutableVector<AnnotatedString.Range<AnnotatedString.Annotation>> mutableVector) {
        if (mutableVector != null) {
            if (mutableVector.getSize() != 0) {
                return CollectionsKt.toList(mutableVector.asMutableList());
            }
        }
        if (composition != null && !TextRange.m6333getCollapsedimpl(composition.m6343unboximpl())) {
            return CollectionsKt.listOf(new AnnotatedString.Range(new SpanStyle(0L, 0L, (FontWeight) null, (FontStyle) null, (FontSynthesis) null, (FontFamily) null, (String) null, 0L, (BaselineShift) null, (TextGeometricTransform) null, (LocaleList) null, 0L, TextDecoration.Companion.getUnderline(), (Shadow) null, (PlatformSpanStyle) null, (DrawStyle) null, 61439, (DefaultConstructorMarker) null), TextRange.m6337getMinimpl(composition.m6343unboximpl()), TextRange.m6336getMaximpl(composition.m6343unboximpl())));
        }
        return CollectionsKt.emptyList();
    }

    public static final TextFieldBuffer toTextFieldBuffer(TextFieldState $this$toTextFieldBuffer) {
        return new TextFieldBuffer($this$toTextFieldBuffer.getValue$foundation_release(), null, null, null, 14, null);
    }
}
