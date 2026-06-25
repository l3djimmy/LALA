package androidx.compose.foundation.text.input.internal;

import android.content.ClipData;
import android.graphics.Typeface;
import android.os.Bundle;
import android.text.Spanned;
import android.text.style.BackgroundColorSpan;
import android.text.style.ForegroundColorSpan;
import android.text.style.StrikethroughSpan;
import android.text.style.StyleSpan;
import android.text.style.TypefaceSpan;
import android.text.style.UnderlineSpan;
import android.view.inputmethod.ExtractedText;
import androidx.compose.foundation.content.PlatformTransferableContent;
import androidx.compose.foundation.content.TransferableContent;
import androidx.compose.foundation.text.input.TextFieldCharSequence;
import androidx.compose.ui.graphics.ColorKt;
import androidx.compose.ui.graphics.Shadow;
import androidx.compose.ui.graphics.drawscope.DrawStyle;
import androidx.compose.ui.platform.AndroidClipboardManager_androidKt;
import androidx.compose.ui.text.AnnotatedString;
import androidx.compose.ui.text.PlatformSpanStyle;
import androidx.compose.ui.text.SpanStyle;
import androidx.compose.ui.text.TextRange;
import androidx.compose.ui.text.font.AndroidTypeface_androidKt;
import androidx.compose.ui.text.font.FontFamily;
import androidx.compose.ui.text.font.FontStyle;
import androidx.compose.ui.text.font.FontSynthesis;
import androidx.compose.ui.text.font.FontWeight;
import androidx.compose.ui.text.font.GenericFontFamily;
import androidx.compose.ui.text.intl.LocaleList;
import androidx.compose.ui.text.style.BaselineShift;
import androidx.compose.ui.text.style.TextDecoration;
import androidx.compose.ui.text.style.TextGeometricTransform;
import androidx.core.view.inputmethod.InputContentInfoCompat;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.StringsKt;
/* compiled from: StatelessInputConnection.android.kt */
@Metadata(d1 = {"\u0000^\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u001a\u0014\u0010\b\u001a\u0004\u0018\u00010\t2\b\u0010\n\u001a\u0004\u0018\u00010\u0001H\u0002\u001a\u000e\u0010\u000b\u001a\u0004\u0018\u00010\f*\u00020\rH\u0002\u001a\u001e\u0010\u000e\u001a\u0014\u0012\u000e\u0012\f\u0012\u0004\u0012\u00020\f0\u0010j\u0002`\u0011\u0018\u00010\u000f*\u00020\u0012H\u0001\u001a\f\u0010\u0013\u001a\u00020\u0014*\u00020\u0015H\u0002\u001a\u000e\u0010\u0016\u001a\u0004\u0018\u00010\u0017*\u00020\u0018H\u0002\u001a\f\u0010\u0016\u001a\u00020\u0017*\u00020\u0019H\u0002\u001a\u0016\u0010\u001a\u001a\u00020\u001b*\u00020\u001c2\b\u0010\u001d\u001a\u0004\u0018\u00010\u001eH\u0000\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0002\u001a\u00020\u0001X\u0082T¢\u0006\u0002\n\u0000\"\u0016\u0010\u0003\u001a\u00020\u00048\u0000X\u0081T¢\u0006\b\n\u0000\u0012\u0004\b\u0005\u0010\u0006\"\u000e\u0010\u0007\u001a\u00020\u0001X\u0082T¢\u0006\u0002\n\u0000¨\u0006\u001f"}, d2 = {"DEBUG_CLASS", "", StatelessInputConnection_androidKt.EXTRA_INPUT_CONTENT_INFO, "SIC_DEBUG", "", "getSIC_DEBUG$annotations", "()V", "STATELESS_TAG", "optionalFontFamilyFromName", "Landroidx/compose/ui/text/font/FontFamily;", "familyName", "toAnnotation", "Landroidx/compose/ui/text/AnnotatedString$Annotation;", "", "toAnnotationList", "", "Landroidx/compose/ui/text/AnnotatedString$Range;", "Landroidx/compose/foundation/text/input/PlacedAnnotation;", "Landroid/text/Spanned;", "toExtractedText", "Landroid/view/inputmethod/ExtractedText;", "Landroidx/compose/foundation/text/input/TextFieldCharSequence;", "toSpanStyle", "Landroidx/compose/ui/text/SpanStyle;", "Landroid/text/style/StyleSpan;", "Landroid/text/style/TypefaceSpan;", "toTransferableContent", "Landroidx/compose/foundation/content/TransferableContent;", "Landroidx/core/view/inputmethod/InputContentInfoCompat;", "extras", "Landroid/os/Bundle;", "foundation_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class StatelessInputConnection_androidKt {
    private static final String DEBUG_CLASS = "StatelessInputConnection";
    private static final String EXTRA_INPUT_CONTENT_INFO = "EXTRA_INPUT_CONTENT_INFO";
    public static final boolean SIC_DEBUG = false;
    private static final String STATELESS_TAG = "StatelessIC";

    public static /* synthetic */ void getSIC_DEBUG$annotations() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final ExtractedText toExtractedText(TextFieldCharSequence $this$toExtractedText) {
        ExtractedText res = new ExtractedText();
        res.text = $this$toExtractedText;
        res.startOffset = 0;
        res.partialEndOffset = $this$toExtractedText.length();
        res.partialStartOffset = -1;
        res.selectionStart = TextRange.m6337getMinimpl($this$toExtractedText.m1456getSelectiond9O1mEE());
        res.selectionEnd = TextRange.m6336getMaximpl($this$toExtractedText.m1456getSelectiond9O1mEE());
        res.flags = !StringsKt.contains$default((CharSequence) $this$toExtractedText, '\n', false, 2, (Object) null) ? 1 : 0;
        return res;
    }

    public static final TransferableContent toTransferableContent(InputContentInfoCompat $this$toTransferableContent, Bundle extras) {
        ClipData clipData = new ClipData($this$toTransferableContent.getDescription(), new ClipData.Item($this$toTransferableContent.getContentUri()));
        return new TransferableContent(AndroidClipboardManager_androidKt.toClipEntry(clipData), AndroidClipboardManager_androidKt.toClipMetadata($this$toTransferableContent.getDescription()), TransferableContent.Source.Companion.m605getKeyboardkB6V9T0(), new PlatformTransferableContent($this$toTransferableContent.getLinkUri(), extras == null ? Bundle.EMPTY : extras), null);
    }

    public static final List<AnnotatedString.Range<AnnotatedString.Annotation>> toAnnotationList(Spanned $this$toAnnotationList) {
        ArrayList arrayList = null;
        Object[] spans = $this$toAnnotationList.getSpans(0, $this$toAnnotationList.length(), Object.class);
        for (Object element$iv : spans) {
            AnnotatedString.Annotation annotation = toAnnotation(element$iv);
            if (annotation != null) {
                if (arrayList == null) {
                    Object mutableAnnotationList = new ArrayList();
                    arrayList = (List) mutableAnnotationList;
                }
                arrayList.add(new AnnotatedString.Range<>(annotation, $this$toAnnotationList.getSpanStart(element$iv), $this$toAnnotationList.getSpanEnd(element$iv)));
            }
        }
        return arrayList;
    }

    private static final AnnotatedString.Annotation toAnnotation(Object $this$toAnnotation) {
        if ($this$toAnnotation instanceof BackgroundColorSpan) {
            return new SpanStyle(0L, 0L, (FontWeight) null, (FontStyle) null, (FontSynthesis) null, (FontFamily) null, (String) null, 0L, (BaselineShift) null, (TextGeometricTransform) null, (LocaleList) null, ColorKt.Color(((BackgroundColorSpan) $this$toAnnotation).getBackgroundColor()), (TextDecoration) null, (Shadow) null, (PlatformSpanStyle) null, (DrawStyle) null, 63487, (DefaultConstructorMarker) null);
        }
        if ($this$toAnnotation instanceof ForegroundColorSpan) {
            return new SpanStyle(ColorKt.Color(((ForegroundColorSpan) $this$toAnnotation).getForegroundColor()), 0L, (FontWeight) null, (FontStyle) null, (FontSynthesis) null, (FontFamily) null, (String) null, 0L, (BaselineShift) null, (TextGeometricTransform) null, (LocaleList) null, 0L, (TextDecoration) null, (Shadow) null, (PlatformSpanStyle) null, (DrawStyle) null, 65534, (DefaultConstructorMarker) null);
        }
        if ($this$toAnnotation instanceof StrikethroughSpan) {
            return new SpanStyle(0L, 0L, (FontWeight) null, (FontStyle) null, (FontSynthesis) null, (FontFamily) null, (String) null, 0L, (BaselineShift) null, (TextGeometricTransform) null, (LocaleList) null, 0L, TextDecoration.Companion.getLineThrough(), (Shadow) null, (PlatformSpanStyle) null, (DrawStyle) null, 61439, (DefaultConstructorMarker) null);
        }
        if ($this$toAnnotation instanceof StyleSpan) {
            return toSpanStyle((StyleSpan) $this$toAnnotation);
        }
        if ($this$toAnnotation instanceof TypefaceSpan) {
            return toSpanStyle((TypefaceSpan) $this$toAnnotation);
        }
        if ($this$toAnnotation instanceof UnderlineSpan) {
            return new SpanStyle(0L, 0L, (FontWeight) null, (FontStyle) null, (FontSynthesis) null, (FontFamily) null, (String) null, 0L, (BaselineShift) null, (TextGeometricTransform) null, (LocaleList) null, 0L, TextDecoration.Companion.getUnderline(), (Shadow) null, (PlatformSpanStyle) null, (DrawStyle) null, 61439, (DefaultConstructorMarker) null);
        }
        return null;
    }

    private static final SpanStyle toSpanStyle(StyleSpan $this$toSpanStyle) {
        switch ($this$toSpanStyle.getStyle()) {
            case 1:
                return new SpanStyle(0L, 0L, FontWeight.Companion.getBold(), (FontStyle) null, (FontSynthesis) null, (FontFamily) null, (String) null, 0L, (BaselineShift) null, (TextGeometricTransform) null, (LocaleList) null, 0L, (TextDecoration) null, (Shadow) null, (PlatformSpanStyle) null, (DrawStyle) null, 65531, (DefaultConstructorMarker) null);
            case 2:
                return new SpanStyle(0L, 0L, (FontWeight) null, FontStyle.m6447boximpl(FontStyle.Companion.m6456getItalic_LCdwA()), (FontSynthesis) null, (FontFamily) null, (String) null, 0L, (BaselineShift) null, (TextGeometricTransform) null, (LocaleList) null, 0L, (TextDecoration) null, (Shadow) null, (PlatformSpanStyle) null, (DrawStyle) null, 65527, (DefaultConstructorMarker) null);
            case 3:
                return new SpanStyle(0L, 0L, FontWeight.Companion.getBold(), FontStyle.m6447boximpl(FontStyle.Companion.m6456getItalic_LCdwA()), (FontSynthesis) null, (FontFamily) null, (String) null, 0L, (BaselineShift) null, (TextGeometricTransform) null, (LocaleList) null, 0L, (TextDecoration) null, (Shadow) null, (PlatformSpanStyle) null, (DrawStyle) null, 65523, (DefaultConstructorMarker) null);
            default:
                return null;
        }
    }

    private static final SpanStyle toSpanStyle(TypefaceSpan $this$toSpanStyle) {
        GenericFontFamily serif;
        String family = $this$toSpanStyle.getFamily();
        if (Intrinsics.areEqual(family, FontFamily.Companion.getCursive().getName())) {
            serif = FontFamily.Companion.getCursive();
        } else if (Intrinsics.areEqual(family, FontFamily.Companion.getMonospace().getName())) {
            serif = FontFamily.Companion.getMonospace();
        } else if (Intrinsics.areEqual(family, FontFamily.Companion.getSansSerif().getName())) {
            serif = FontFamily.Companion.getSansSerif();
        } else {
            serif = Intrinsics.areEqual(family, FontFamily.Companion.getSerif().getName()) ? FontFamily.Companion.getSerif() : optionalFontFamilyFromName($this$toSpanStyle.getFamily());
        }
        FontFamily fontFamily = serif;
        return new SpanStyle(0L, 0L, (FontWeight) null, (FontStyle) null, (FontSynthesis) null, fontFamily, (String) null, 0L, (BaselineShift) null, (TextGeometricTransform) null, (LocaleList) null, 0L, (TextDecoration) null, (Shadow) null, (PlatformSpanStyle) null, (DrawStyle) null, 65503, (DefaultConstructorMarker) null);
    }

    private static final FontFamily optionalFontFamilyFromName(String familyName) {
        String str = familyName;
        boolean z = true;
        if (str == null || str.length() == 0) {
            return null;
        }
        Typeface typeface = Typeface.create(familyName, 0);
        if (Intrinsics.areEqual(typeface, Typeface.DEFAULT) || Intrinsics.areEqual(typeface, Typeface.create(Typeface.DEFAULT, 0))) {
            z = false;
        }
        Typeface it = z ? typeface : null;
        if (it != null) {
            return AndroidTypeface_androidKt.FontFamily(it);
        }
        return null;
    }
}
