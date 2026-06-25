package androidx.compose.ui.text;

import androidx.autofill.HintConstants;
import androidx.compose.runtime.saveable.Saver;
import androidx.compose.runtime.saveable.SaverKt;
import androidx.compose.runtime.saveable.SaverScope;
import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.graphics.Color;
import androidx.compose.ui.graphics.ColorKt;
import androidx.compose.ui.graphics.Shadow;
import androidx.compose.ui.text.AnnotatedString;
import androidx.compose.ui.text.LinkAnnotation;
import androidx.compose.ui.text.TextRange;
import androidx.compose.ui.text.font.FontWeight;
import androidx.compose.ui.text.intl.Locale;
import androidx.compose.ui.text.intl.LocaleList;
import androidx.compose.ui.text.style.BaselineShift;
import androidx.compose.ui.text.style.Hyphens;
import androidx.compose.ui.text.style.LineBreak;
import androidx.compose.ui.text.style.LineHeightStyle;
import androidx.compose.ui.text.style.TextAlign;
import androidx.compose.ui.text.style.TextDecoration;
import androidx.compose.ui.text.style.TextDirection;
import androidx.compose.ui.text.style.TextGeometricTransform;
import androidx.compose.ui.text.style.TextIndent;
import androidx.compose.ui.text.style.TextMotion;
import androidx.compose.ui.unit.TextUnit;
import androidx.compose.ui.unit.TextUnitKt;
import androidx.compose.ui.unit.TextUnitType;
import androidx.exifinterface.media.ExifInterface;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: Savers.kt */
@Metadata(d1 = {"\u0000\u0092\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\b\u001ay\u0010U\u001a\u000e\u0012\u0004\u0012\u0002HV\u0012\u0004\u0012\u0002HW0\u0011\"\u0004\b\u0000\u0010V\"\b\b\u0001\u0010W*\u00020\u00032.\u0010X\u001a*\u0012\u0004\u0012\u00020Z\u0012\u0013\u0012\u0011HV¢\u0006\f\b[\u0012\b\b\\\u0012\u0004\b\b(]\u0012\u0006\u0012\u0004\u0018\u0001HW0Y¢\u0006\u0002\b^2#\u0010_\u001a\u001f\u0012\u0013\u0012\u0011HW¢\u0006\f\b[\u0012\b\b\\\u0012\u0004\b\b(]\u0012\u0006\u0012\u0004\u0018\u0001HV0`H\u0002\u001aL\u0010_\u001a\u0004\u0018\u0001Ha\"\u0014\b\u0000\u0010b*\u000e\u0012\u0004\u0012\u0002HV\u0012\u0004\u0012\u0002HW0\u0001\"\u0004\b\u0001\u0010V\"\u0004\b\u0002\u0010W\"\u0006\b\u0003\u0010a\u0018\u00012\b\u0010]\u001a\u0004\u0018\u0001HW2\u0006\u0010c\u001a\u0002HbH\u0080\b¢\u0006\u0002\u0010d\u001a\"\u0010_\u001a\u0004\u0018\u0001Ha\"\u0006\b\u0000\u0010a\u0018\u00012\b\u0010]\u001a\u0004\u0018\u00010\u0003H\u0080\b¢\u0006\u0002\u0010e\u001aI\u0010X\u001a\u00020\u0003\"\u0014\b\u0000\u0010b*\u000e\u0012\u0004\u0012\u0002HV\u0012\u0004\u0012\u0002HW0\u0001\"\u0004\b\u0001\u0010V\"\u0004\b\u0002\u0010W2\b\u0010]\u001a\u0004\u0018\u0001HV2\u0006\u0010c\u001a\u0002Hb2\u0006\u0010f\u001a\u00020ZH\u0000¢\u0006\u0002\u0010g\u001a\u001f\u0010X\u001a\u0004\u0018\u0001Hb\"\u0004\b\u0000\u0010b2\b\u0010]\u001a\u0004\u0018\u0001HbH\u0000¢\u0006\u0002\u0010e\" \u0010\u0000\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0004\u0010\u0005\"(\u0010\u0006\u001a\u001c\u0012\u0012\u0012\u0010\u0012\f\u0012\n\u0012\u0006\b\u0001\u0012\u00020\u00030\b0\u0007\u0012\u0004\u0012\u00020\u00030\u0001X\u0082\u0004¢\u0006\u0002\n\u0000\"(\u0010\t\u001a\u0016\u0012\f\u0012\n\u0012\u0006\b\u0001\u0012\u00020\u00030\b\u0012\u0004\u0012\u00020\u00030\u0001X\u0082\u0004¢\u0006\b\n\u0000\u0012\u0004\b\n\u0010\u000b\"\u001a\u0010\f\u001a\u000e\u0012\u0004\u0012\u00020\r\u0012\u0004\u0012\u00020\u00030\u0001X\u0082\u0004¢\u0006\u0002\n\u0000\"\u001a\u0010\u000e\u001a\u000e\u0012\u0004\u0012\u00020\u000f\u0012\u0004\u0012\u00020\u00030\u0001X\u0082\u0004¢\u0006\u0002\n\u0000\"\u001a\u0010\u0010\u001a\u000e\u0012\u0004\u0012\u00020\u0012\u0012\u0004\u0012\u00020\u00030\u0011X\u0082\u0004¢\u0006\u0002\n\u0000\"\u001a\u0010\u0013\u001a\u000e\u0012\u0004\u0012\u00020\u0014\u0012\u0004\u0012\u00020\u00030\u0001X\u0082\u0004¢\u0006\u0002\n\u0000\"\u001a\u0010\u0015\u001a\u000e\u0012\u0004\u0012\u00020\u0016\u0012\u0004\u0012\u00020\u00030\u0001X\u0082\u0004¢\u0006\u0002\n\u0000\"\u001a\u0010\u0017\u001a\u000e\u0012\u0004\u0012\u00020\u0018\u0012\u0004\u0012\u00020\u00030\u0001X\u0082\u0004¢\u0006\u0002\n\u0000\"\u001a\u0010\u0019\u001a\u000e\u0012\u0004\u0012\u00020\u001a\u0012\u0004\u0012\u00020\u00030\u0001X\u0082\u0004¢\u0006\u0002\n\u0000\"\u001a\u0010\u001b\u001a\u000e\u0012\u0004\u0012\u00020\u001c\u0012\u0004\u0012\u00020\u00030\u0001X\u0082\u0004¢\u0006\u0002\n\u0000\"\u001a\u0010\u001d\u001a\u000e\u0012\u0004\u0012\u00020\u001e\u0012\u0004\u0012\u00020\u00030\u0011X\u0082\u0004¢\u0006\u0002\n\u0000\" \u0010\u001f\u001a\u000e\u0012\u0004\u0012\u00020 \u0012\u0004\u0012\u00020\u00030\u0001X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b!\u0010\u0005\"\u001a\u0010\"\u001a\u000e\u0012\u0004\u0012\u00020#\u0012\u0004\u0012\u00020\u00030\u0001X\u0082\u0004¢\u0006\u0002\n\u0000\" \u0010$\u001a\u000e\u0012\u0004\u0012\u00020%\u0012\u0004\u0012\u00020\u00030\u0001X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b&\u0010\u0005\"\u001a\u0010'\u001a\u000e\u0012\u0004\u0012\u00020(\u0012\u0004\u0012\u00020\u00030\u0001X\u0082\u0004¢\u0006\u0002\n\u0000\"\u001a\u0010)\u001a\u000e\u0012\u0004\u0012\u00020*\u0012\u0004\u0012\u00020\u00030\u0001X\u0082\u0004¢\u0006\u0002\n\u0000\"\u001a\u0010+\u001a\u000e\u0012\u0004\u0012\u00020,\u0012\u0004\u0012\u00020\u00030\u0001X\u0082\u0004¢\u0006\u0002\n\u0000\" \u0010-\u001a\u000e\u0012\u0004\u0012\u00020.\u0012\u0004\u0012\u00020\u00030\u0001X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b/\u0010\u0005\"\u001a\u00100\u001a\u000e\u0012\u0004\u0012\u000201\u0012\u0004\u0012\u00020\u00030\u0001X\u0082\u0004¢\u0006\u0002\n\u0000\"\u001a\u00102\u001a\u000e\u0012\u0004\u0012\u000203\u0012\u0004\u0012\u00020\u00030\u0011X\u0082\u0004¢\u0006\u0002\n\u0000\" \u00104\u001a\u000e\u0012\u0004\u0012\u000205\u0012\u0004\u0012\u00020\u00030\u0001X\u0082\u0004¢\u0006\b\n\u0000\u0012\u0004\b6\u0010\u000b\"\u001a\u00107\u001a\u000e\u0012\u0004\u0012\u000208\u0012\u0004\u0012\u00020\u00030\u0001X\u0082\u0004¢\u0006\u0002\n\u0000\"$\u00109\u001a\u000e\u0012\u0004\u0012\u00020\u001e\u0012\u0004\u0012\u00020\u00030\u0001*\u00020:8@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b;\u0010<\"$\u00109\u001a\u000e\u0012\u0004\u0012\u00020\u0012\u0012\u0004\u0012\u00020\u00030\u0001*\u00020=8@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b;\u0010>\"$\u00109\u001a\u000e\u0012\u0004\u0012\u00020#\u0012\u0004\u0012\u00020\u00030\u0001*\u00020?8@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b;\u0010@\"$\u00109\u001a\u000e\u0012\u0004\u0012\u000201\u0012\u0004\u0012\u00020\u00030\u0001*\u00020A8@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b;\u0010B\"$\u00109\u001a\u000e\u0012\u0004\u0012\u00020\u0014\u0012\u0004\u0012\u00020\u00030\u0001*\u00020C8@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b;\u0010D\"$\u00109\u001a\u000e\u0012\u0004\u0012\u00020\u001c\u0012\u0004\u0012\u00020\u00030\u0001*\u00020E8@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b;\u0010F\"$\u00109\u001a\u000e\u0012\u0004\u0012\u00020\u001a\u0012\u0004\u0012\u00020\u00030\u0001*\u00020G8@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b;\u0010H\"$\u00109\u001a\u000e\u0012\u0004\u0012\u00020\r\u0012\u0004\u0012\u00020\u00030\u0001*\u00020I8@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b;\u0010J\"$\u00109\u001a\u000e\u0012\u0004\u0012\u00020\u0016\u0012\u0004\u0012\u00020\u00030\u0001*\u00020K8@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b;\u0010L\"$\u00109\u001a\u000e\u0012\u0004\u0012\u00020(\u0012\u0004\u0012\u00020\u00030\u0001*\u00020M8@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b;\u0010N\"$\u00109\u001a\u000e\u0012\u0004\u0012\u00020*\u0012\u0004\u0012\u00020\u00030\u0001*\u00020O8@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b;\u0010P\"$\u00109\u001a\u000e\u0012\u0004\u0012\u00020,\u0012\u0004\u0012\u00020\u00030\u0001*\u00020Q8@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b;\u0010R\"$\u00109\u001a\u000e\u0012\u0004\u0012\u000203\u0012\u0004\u0012\u00020\u00030\u0001*\u00020S8@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b;\u0010T¨\u0006h"}, d2 = {"AnnotatedStringSaver", "Landroidx/compose/runtime/saveable/Saver;", "Landroidx/compose/ui/text/AnnotatedString;", "", "getAnnotatedStringSaver", "()Landroidx/compose/runtime/saveable/Saver;", "AnnotationRangeListSaver", "", "Landroidx/compose/ui/text/AnnotatedString$Range;", "AnnotationRangeSaver", "getAnnotationRangeSaver$annotations", "()V", "BaselineShiftSaver", "Landroidx/compose/ui/text/style/BaselineShift;", "ClickableSaver", "Landroidx/compose/ui/text/LinkAnnotation$Clickable;", "ColorSaver", "Landroidx/compose/ui/text/NonNullValueClassSaver;", "Landroidx/compose/ui/graphics/Color;", "FontWeightSaver", "Landroidx/compose/ui/text/font/FontWeight;", "LineHeightStyleSaver", "Landroidx/compose/ui/text/style/LineHeightStyle;", "LinkSaver", "Landroidx/compose/ui/text/LinkAnnotation$Url;", "LocaleListSaver", "Landroidx/compose/ui/text/intl/LocaleList;", "LocaleSaver", "Landroidx/compose/ui/text/intl/Locale;", "OffsetSaver", "Landroidx/compose/ui/geometry/Offset;", "ParagraphStyleSaver", "Landroidx/compose/ui/text/ParagraphStyle;", "getParagraphStyleSaver", "ShadowSaver", "Landroidx/compose/ui/graphics/Shadow;", "SpanStyleSaver", "Landroidx/compose/ui/text/SpanStyle;", "getSpanStyleSaver", "TextDecorationSaver", "Landroidx/compose/ui/text/style/TextDecoration;", "TextGeometricTransformSaver", "Landroidx/compose/ui/text/style/TextGeometricTransform;", "TextIndentSaver", "Landroidx/compose/ui/text/style/TextIndent;", "TextLinkStylesSaver", "Landroidx/compose/ui/text/TextLinkStyles;", "getTextLinkStylesSaver", "TextRangeSaver", "Landroidx/compose/ui/text/TextRange;", "TextUnitSaver", "Landroidx/compose/ui/unit/TextUnit;", "UrlAnnotationSaver", "Landroidx/compose/ui/text/UrlAnnotation;", "getUrlAnnotationSaver$annotations", "VerbatimTtsAnnotationSaver", "Landroidx/compose/ui/text/VerbatimTtsAnnotation;", "Saver", "Landroidx/compose/ui/geometry/Offset$Companion;", "getSaver", "(Landroidx/compose/ui/geometry/Offset$Companion;)Landroidx/compose/runtime/saveable/Saver;", "Landroidx/compose/ui/graphics/Color$Companion;", "(Landroidx/compose/ui/graphics/Color$Companion;)Landroidx/compose/runtime/saveable/Saver;", "Landroidx/compose/ui/graphics/Shadow$Companion;", "(Landroidx/compose/ui/graphics/Shadow$Companion;)Landroidx/compose/runtime/saveable/Saver;", "Landroidx/compose/ui/text/TextRange$Companion;", "(Landroidx/compose/ui/text/TextRange$Companion;)Landroidx/compose/runtime/saveable/Saver;", "Landroidx/compose/ui/text/font/FontWeight$Companion;", "(Landroidx/compose/ui/text/font/FontWeight$Companion;)Landroidx/compose/runtime/saveable/Saver;", "Landroidx/compose/ui/text/intl/Locale$Companion;", "(Landroidx/compose/ui/text/intl/Locale$Companion;)Landroidx/compose/runtime/saveable/Saver;", "Landroidx/compose/ui/text/intl/LocaleList$Companion;", "(Landroidx/compose/ui/text/intl/LocaleList$Companion;)Landroidx/compose/runtime/saveable/Saver;", "Landroidx/compose/ui/text/style/BaselineShift$Companion;", "(Landroidx/compose/ui/text/style/BaselineShift$Companion;)Landroidx/compose/runtime/saveable/Saver;", "Landroidx/compose/ui/text/style/LineHeightStyle$Companion;", "(Landroidx/compose/ui/text/style/LineHeightStyle$Companion;)Landroidx/compose/runtime/saveable/Saver;", "Landroidx/compose/ui/text/style/TextDecoration$Companion;", "(Landroidx/compose/ui/text/style/TextDecoration$Companion;)Landroidx/compose/runtime/saveable/Saver;", "Landroidx/compose/ui/text/style/TextGeometricTransform$Companion;", "(Landroidx/compose/ui/text/style/TextGeometricTransform$Companion;)Landroidx/compose/runtime/saveable/Saver;", "Landroidx/compose/ui/text/style/TextIndent$Companion;", "(Landroidx/compose/ui/text/style/TextIndent$Companion;)Landroidx/compose/runtime/saveable/Saver;", "Landroidx/compose/ui/unit/TextUnit$Companion;", "(Landroidx/compose/ui/unit/TextUnit$Companion;)Landroidx/compose/runtime/saveable/Saver;", "NonNullValueClassSaver", "Original", "Saveable", "save", "Lkotlin/Function2;", "Landroidx/compose/runtime/saveable/SaverScope;", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "value", "Lkotlin/ExtensionFunctionType;", "restore", "Lkotlin/Function1;", "Result", ExifInterface.GPS_DIRECTION_TRUE, "saver", "(Ljava/lang/Object;Landroidx/compose/runtime/saveable/Saver;)Ljava/lang/Object;", "(Ljava/lang/Object;)Ljava/lang/Object;", "scope", "(Ljava/lang/Object;Landroidx/compose/runtime/saveable/Saver;Landroidx/compose/runtime/saveable/SaverScope;)Ljava/lang/Object;", "ui-text_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class SaversKt {
    private static final Saver<AnnotatedString, Object> AnnotatedStringSaver = SaverKt.Saver(new Function2<SaverScope, AnnotatedString, Object>() { // from class: androidx.compose.ui.text.SaversKt$AnnotatedStringSaver$1
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(SaverScope $this$Saver, AnnotatedString it) {
            Saver saver;
            Object save = SaversKt.save(it.getText());
            List<AnnotatedString.Range<? extends AnnotatedString.Annotation>> annotations$ui_text_release = it.getAnnotations$ui_text_release();
            saver = SaversKt.AnnotationRangeListSaver;
            return CollectionsKt.arrayListOf(save, SaversKt.save(annotations$ui_text_release, saver, $this$Saver));
        }
    }, new Function1<Object, AnnotatedString>() { // from class: androidx.compose.ui.text.SaversKt$AnnotatedStringSaver$2
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // kotlin.jvm.functions.Function1
        public final AnnotatedString invoke(Object it) {
            Saver saver$iv;
            List annotationsOrNull;
            Intrinsics.checkNotNull(it, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>");
            List list = (List) it;
            Object value$iv = list.get(1);
            saver$iv = SaversKt.AnnotationRangeListSaver;
            if (!Intrinsics.areEqual(value$iv, (Object) false) || (saver$iv instanceof NonNullValueClassSaver)) {
                annotationsOrNull = value$iv != null ? (List) saver$iv.restore(value$iv) : null;
            } else {
                annotationsOrNull = null;
            }
            Object value$iv2 = list.get(0);
            String str = value$iv2 != null ? (String) value$iv2 : null;
            Intrinsics.checkNotNull(str);
            return new AnnotatedString(annotationsOrNull, str);
        }
    });
    private static final Saver<List<AnnotatedString.Range<? extends Object>>, Object> AnnotationRangeListSaver = SaverKt.Saver(new Function2<SaverScope, List<? extends AnnotatedString.Range<? extends Object>>, Object>() { // from class: androidx.compose.ui.text.SaversKt$AnnotationRangeListSaver$1
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(SaverScope $this$Saver, List<? extends AnnotatedString.Range<? extends Object>> list) {
            Saver saver;
            List target$iv = new ArrayList(list.size());
            int size = list.size();
            for (int index$iv$iv = 0; index$iv$iv < size; index$iv$iv++) {
                AnnotatedString.Range item$iv$iv = list.get(index$iv$iv);
                AnnotatedString.Range range = item$iv$iv;
                saver = SaversKt.AnnotationRangeSaver;
                target$iv.add(SaversKt.save(range, saver, $this$Saver));
            }
            List $this$fastMap$iv = target$iv;
            return $this$fastMap$iv;
        }
    }, new Function1<Object, List<? extends AnnotatedString.Range<? extends Object>>>() { // from class: androidx.compose.ui.text.SaversKt$AnnotationRangeListSaver$2
        @Override // kotlin.jvm.functions.Function1
        public final List<? extends AnnotatedString.Range<? extends Object>> invoke(Object it) {
            Saver saver$iv;
            Intrinsics.checkNotNull(it, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any>");
            List list = (List) it;
            ArrayList target$iv = new ArrayList(list.size());
            int size = list.size();
            for (int index$iv$iv = 0; index$iv$iv < size; index$iv$iv++) {
                Object item$iv$iv = list.get(index$iv$iv);
                ArrayList arrayList = target$iv;
                saver$iv = SaversKt.AnnotationRangeSaver;
                AnnotatedString.Range range = null;
                if ((!Intrinsics.areEqual(item$iv$iv, (Object) false) || (saver$iv instanceof NonNullValueClassSaver)) && item$iv$iv != null) {
                    Object it$iv = saver$iv.restore(item$iv$iv);
                    range = (AnnotatedString.Range) it$iv;
                }
                Intrinsics.checkNotNull(range);
                AnnotatedString.Range range2 = range;
                arrayList.add(range2);
            }
            return target$iv;
        }
    });
    private static final Saver<AnnotatedString.Range<? extends Object>, Object> AnnotationRangeSaver = SaverKt.Saver(new Function2<SaverScope, AnnotatedString.Range<? extends Object>, Object>() { // from class: androidx.compose.ui.text.SaversKt$AnnotationRangeSaver$1

        /* compiled from: Savers.kt */
        @Metadata(k = 3, mv = {1, 9, 0}, xi = 48)
        /* loaded from: classes11.dex */
        public /* synthetic */ class WhenMappings {
            public static final /* synthetic */ int[] $EnumSwitchMapping$0;

            static {
                int[] iArr = new int[AnnotationType.values().length];
                try {
                    iArr[AnnotationType.Paragraph.ordinal()] = 1;
                } catch (NoSuchFieldError e) {
                }
                try {
                    iArr[AnnotationType.Span.ordinal()] = 2;
                } catch (NoSuchFieldError e2) {
                }
                try {
                    iArr[AnnotationType.VerbatimTts.ordinal()] = 3;
                } catch (NoSuchFieldError e3) {
                }
                try {
                    iArr[AnnotationType.Url.ordinal()] = 4;
                } catch (NoSuchFieldError e4) {
                }
                try {
                    iArr[AnnotationType.Link.ordinal()] = 5;
                } catch (NoSuchFieldError e5) {
                }
                try {
                    iArr[AnnotationType.Clickable.ordinal()] = 6;
                } catch (NoSuchFieldError e6) {
                }
                try {
                    iArr[AnnotationType.String.ordinal()] = 7;
                } catch (NoSuchFieldError e7) {
                }
                $EnumSwitchMapping$0 = iArr;
            }
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(SaverScope $this$Saver, AnnotatedString.Range<? extends Object> range) {
            AnnotationType marker;
            Object item;
            Saver saver;
            Saver saver2;
            Saver saver3;
            Saver saver4;
            Object item2 = range.getItem();
            if (item2 instanceof ParagraphStyle) {
                marker = AnnotationType.Paragraph;
            } else if (item2 instanceof SpanStyle) {
                marker = AnnotationType.Span;
            } else if (item2 instanceof VerbatimTtsAnnotation) {
                marker = AnnotationType.VerbatimTts;
            } else if (item2 instanceof UrlAnnotation) {
                marker = AnnotationType.Url;
            } else if (item2 instanceof LinkAnnotation.Url) {
                marker = AnnotationType.Link;
            } else if (item2 instanceof LinkAnnotation.Clickable) {
                marker = AnnotationType.Clickable;
            } else if (!(item2 instanceof StringAnnotation)) {
                throw new UnsupportedOperationException();
            } else {
                marker = AnnotationType.String;
            }
            switch (WhenMappings.$EnumSwitchMapping$0[marker.ordinal()]) {
                case 1:
                    Object item3 = range.getItem();
                    Intrinsics.checkNotNull(item3, "null cannot be cast to non-null type androidx.compose.ui.text.ParagraphStyle");
                    item = SaversKt.save((ParagraphStyle) item3, SaversKt.getParagraphStyleSaver(), $this$Saver);
                    break;
                case 2:
                    Object item4 = range.getItem();
                    Intrinsics.checkNotNull(item4, "null cannot be cast to non-null type androidx.compose.ui.text.SpanStyle");
                    item = SaversKt.save((SpanStyle) item4, SaversKt.getSpanStyleSaver(), $this$Saver);
                    break;
                case 3:
                    Object item5 = range.getItem();
                    Intrinsics.checkNotNull(item5, "null cannot be cast to non-null type androidx.compose.ui.text.VerbatimTtsAnnotation");
                    saver = SaversKt.VerbatimTtsAnnotationSaver;
                    item = SaversKt.save((VerbatimTtsAnnotation) item5, saver, $this$Saver);
                    break;
                case 4:
                    Object item6 = range.getItem();
                    Intrinsics.checkNotNull(item6, "null cannot be cast to non-null type androidx.compose.ui.text.UrlAnnotation");
                    saver2 = SaversKt.UrlAnnotationSaver;
                    item = SaversKt.save((UrlAnnotation) item6, saver2, $this$Saver);
                    break;
                case 5:
                    Object item7 = range.getItem();
                    Intrinsics.checkNotNull(item7, "null cannot be cast to non-null type androidx.compose.ui.text.LinkAnnotation.Url");
                    saver3 = SaversKt.LinkSaver;
                    item = SaversKt.save((LinkAnnotation.Url) item7, saver3, $this$Saver);
                    break;
                case 6:
                    Object item8 = range.getItem();
                    Intrinsics.checkNotNull(item8, "null cannot be cast to non-null type androidx.compose.ui.text.LinkAnnotation.Clickable");
                    saver4 = SaversKt.ClickableSaver;
                    item = SaversKt.save((LinkAnnotation.Clickable) item8, saver4, $this$Saver);
                    break;
                case 7:
                    Object item9 = range.getItem();
                    Intrinsics.checkNotNull(item9, "null cannot be cast to non-null type androidx.compose.ui.text.StringAnnotation");
                    item = SaversKt.save(((StringAnnotation) item9).m6293unboximpl());
                    break;
                default:
                    throw new NoWhenBranchMatchedException();
            }
            return CollectionsKt.arrayListOf(SaversKt.save(marker), item, SaversKt.save(Integer.valueOf(range.getStart())), SaversKt.save(Integer.valueOf(range.getEnd())), SaversKt.save(range.getTag()));
        }
    }, new Function1<Object, AnnotatedString.Range<? extends Object>>() { // from class: androidx.compose.ui.text.SaversKt$AnnotationRangeSaver$2

        /* compiled from: Savers.kt */
        @Metadata(k = 3, mv = {1, 9, 0}, xi = 48)
        /* loaded from: classes11.dex */
        public /* synthetic */ class WhenMappings {
            public static final /* synthetic */ int[] $EnumSwitchMapping$0;

            static {
                int[] iArr = new int[AnnotationType.values().length];
                try {
                    iArr[AnnotationType.Paragraph.ordinal()] = 1;
                } catch (NoSuchFieldError e) {
                }
                try {
                    iArr[AnnotationType.Span.ordinal()] = 2;
                } catch (NoSuchFieldError e2) {
                }
                try {
                    iArr[AnnotationType.VerbatimTts.ordinal()] = 3;
                } catch (NoSuchFieldError e3) {
                }
                try {
                    iArr[AnnotationType.Url.ordinal()] = 4;
                } catch (NoSuchFieldError e4) {
                }
                try {
                    iArr[AnnotationType.Link.ordinal()] = 5;
                } catch (NoSuchFieldError e5) {
                }
                try {
                    iArr[AnnotationType.Clickable.ordinal()] = 6;
                } catch (NoSuchFieldError e6) {
                }
                try {
                    iArr[AnnotationType.String.ordinal()] = 7;
                } catch (NoSuchFieldError e7) {
                }
                $EnumSwitchMapping$0 = iArr;
            }
        }

        /* JADX WARN: Can't rename method to resolve collision */
        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r10v11, types: [androidx.compose.ui.text.UrlAnnotation] */
        /* JADX WARN: Type inference failed for: r10v14, types: [androidx.compose.ui.text.LinkAnnotation$Url] */
        /* JADX WARN: Type inference failed for: r10v17, types: [androidx.compose.ui.text.LinkAnnotation$Clickable] */
        /* JADX WARN: Type inference failed for: r10v2, types: [androidx.compose.ui.text.ParagraphStyle] */
        /* JADX WARN: Type inference failed for: r10v5, types: [androidx.compose.ui.text.SpanStyle] */
        /* JADX WARN: Type inference failed for: r10v8, types: [androidx.compose.ui.text.VerbatimTtsAnnotation] */
        @Override // kotlin.jvm.functions.Function1
        public final AnnotatedString.Range<? extends Object> invoke(Object it) {
            Object it$iv;
            Object it$iv2;
            String tag;
            Saver saver$iv;
            Saver saver$iv2;
            Saver saver$iv3;
            Saver saver$iv4;
            Intrinsics.checkNotNull(it, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any>");
            List list = (List) it;
            Object value$iv = list.get(0);
            String item = null;
            AnnotationType marker = value$iv != null ? (AnnotationType) value$iv : null;
            Intrinsics.checkNotNull(marker);
            Object value$iv2 = list.get(2);
            if (value$iv2 == null) {
                it$iv = null;
            } else {
                it$iv = (Integer) value$iv2;
            }
            Intrinsics.checkNotNull(it$iv);
            int start = ((Number) it$iv).intValue();
            Object value$iv3 = list.get(3);
            if (value$iv3 == null) {
                it$iv2 = null;
            } else {
                it$iv2 = (Integer) value$iv3;
            }
            Intrinsics.checkNotNull(it$iv2);
            int end = ((Number) it$iv2).intValue();
            Object value$iv4 = list.get(4);
            if (value$iv4 == null) {
                tag = null;
            } else {
                tag = (String) value$iv4;
            }
            Intrinsics.checkNotNull(tag);
            switch (WhenMappings.$EnumSwitchMapping$0[marker.ordinal()]) {
                case 1:
                    Object value$iv5 = list.get(1);
                    Saver saver$iv5 = SaversKt.getParagraphStyleSaver();
                    if ((!Intrinsics.areEqual(value$iv5, (Object) false) || (saver$iv5 instanceof NonNullValueClassSaver)) && value$iv5 != null) {
                        item = saver$iv5.restore(value$iv5);
                    }
                    Intrinsics.checkNotNull(item);
                    return new AnnotatedString.Range<>(item, start, end, tag);
                case 2:
                    Object value$iv6 = list.get(1);
                    Saver saver$iv6 = SaversKt.getSpanStyleSaver();
                    if ((!Intrinsics.areEqual(value$iv6, (Object) false) || (saver$iv6 instanceof NonNullValueClassSaver)) && value$iv6 != null) {
                        item = saver$iv6.restore(value$iv6);
                    }
                    Intrinsics.checkNotNull(item);
                    return new AnnotatedString.Range<>(item, start, end, tag);
                case 3:
                    Object value$iv7 = list.get(1);
                    saver$iv = SaversKt.VerbatimTtsAnnotationSaver;
                    if ((!Intrinsics.areEqual(value$iv7, (Object) false) || (saver$iv instanceof NonNullValueClassSaver)) && value$iv7 != null) {
                        item = (VerbatimTtsAnnotation) saver$iv.restore(value$iv7);
                    }
                    Intrinsics.checkNotNull(item);
                    return new AnnotatedString.Range<>(item, start, end, tag);
                case 4:
                    Object value$iv8 = list.get(1);
                    saver$iv2 = SaversKt.UrlAnnotationSaver;
                    if ((!Intrinsics.areEqual(value$iv8, (Object) false) || (saver$iv2 instanceof NonNullValueClassSaver)) && value$iv8 != null) {
                        item = (UrlAnnotation) saver$iv2.restore(value$iv8);
                    }
                    Intrinsics.checkNotNull(item);
                    return new AnnotatedString.Range<>(item, start, end, tag);
                case 5:
                    Object value$iv9 = list.get(1);
                    saver$iv3 = SaversKt.LinkSaver;
                    if ((!Intrinsics.areEqual(value$iv9, (Object) false) || (saver$iv3 instanceof NonNullValueClassSaver)) && value$iv9 != null) {
                        item = (LinkAnnotation.Url) saver$iv3.restore(value$iv9);
                    }
                    Intrinsics.checkNotNull(item);
                    return new AnnotatedString.Range<>(item, start, end, tag);
                case 6:
                    Object value$iv10 = list.get(1);
                    saver$iv4 = SaversKt.ClickableSaver;
                    if ((!Intrinsics.areEqual(value$iv10, (Object) false) || (saver$iv4 instanceof NonNullValueClassSaver)) && value$iv10 != null) {
                        item = (LinkAnnotation.Clickable) saver$iv4.restore(value$iv10);
                    }
                    Intrinsics.checkNotNull(item);
                    return new AnnotatedString.Range<>(item, start, end, tag);
                case 7:
                    Object value$iv11 = list.get(1);
                    if (value$iv11 != null) {
                        item = (String) value$iv11;
                    }
                    Intrinsics.checkNotNull(item);
                    return new AnnotatedString.Range<>(StringAnnotation.m6287boximpl(StringAnnotation.m6288constructorimpl(item)), start, end, tag);
                default:
                    throw new NoWhenBranchMatchedException();
            }
        }
    });
    private static final Saver<VerbatimTtsAnnotation, Object> VerbatimTtsAnnotationSaver = SaverKt.Saver(new Function2<SaverScope, VerbatimTtsAnnotation, Object>() { // from class: androidx.compose.ui.text.SaversKt$VerbatimTtsAnnotationSaver$1
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(SaverScope $this$Saver, VerbatimTtsAnnotation it) {
            return SaversKt.save(it.getVerbatim());
        }
    }, new Function1<Object, VerbatimTtsAnnotation>() { // from class: androidx.compose.ui.text.SaversKt$VerbatimTtsAnnotationSaver$2
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // kotlin.jvm.functions.Function1
        public final VerbatimTtsAnnotation invoke(Object it) {
            String str = it != null ? (String) it : null;
            Intrinsics.checkNotNull(str);
            return new VerbatimTtsAnnotation(str);
        }
    });
    private static final Saver<UrlAnnotation, Object> UrlAnnotationSaver = SaverKt.Saver(new Function2<SaverScope, UrlAnnotation, Object>() { // from class: androidx.compose.ui.text.SaversKt$UrlAnnotationSaver$1
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(SaverScope $this$Saver, UrlAnnotation it) {
            return SaversKt.save(it.getUrl());
        }
    }, new Function1<Object, UrlAnnotation>() { // from class: androidx.compose.ui.text.SaversKt$UrlAnnotationSaver$2
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // kotlin.jvm.functions.Function1
        public final UrlAnnotation invoke(Object it) {
            String str = it != null ? (String) it : null;
            Intrinsics.checkNotNull(str);
            return new UrlAnnotation(str);
        }
    });
    private static final Saver<LinkAnnotation.Url, Object> LinkSaver = SaverKt.Saver(new Function2<SaverScope, LinkAnnotation.Url, Object>() { // from class: androidx.compose.ui.text.SaversKt$LinkSaver$1
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(SaverScope $this$Saver, LinkAnnotation.Url it) {
            return CollectionsKt.arrayListOf(SaversKt.save(it.getUrl()), SaversKt.save(it.getStyles(), SaversKt.getTextLinkStylesSaver(), $this$Saver));
        }
    }, new Function1<Object, LinkAnnotation.Url>() { // from class: androidx.compose.ui.text.SaversKt$LinkSaver$2
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // kotlin.jvm.functions.Function1
        public final LinkAnnotation.Url invoke(Object it) {
            TextLinkStyles stylesOrNull;
            Intrinsics.checkNotNull(it, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>");
            List list = (List) it;
            Object value$iv = list.get(0);
            String str = value$iv != null ? (String) value$iv : null;
            Intrinsics.checkNotNull(str);
            String url = str;
            Object value$iv2 = list.get(1);
            Saver saver$iv = SaversKt.getTextLinkStylesSaver();
            if (Intrinsics.areEqual(value$iv2, (Object) false) && !(saver$iv instanceof NonNullValueClassSaver)) {
                stylesOrNull = null;
            } else {
                stylesOrNull = value$iv2 != null ? saver$iv.restore(value$iv2) : null;
            }
            return new LinkAnnotation.Url(url, stylesOrNull, null, 4, null);
        }
    });
    private static final Saver<LinkAnnotation.Clickable, Object> ClickableSaver = SaverKt.Saver(new Function2<SaverScope, LinkAnnotation.Clickable, Object>() { // from class: androidx.compose.ui.text.SaversKt$ClickableSaver$1
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(SaverScope $this$Saver, LinkAnnotation.Clickable it) {
            return CollectionsKt.arrayListOf(SaversKt.save(it.getTag()), SaversKt.save(it.getStyles(), SaversKt.getTextLinkStylesSaver(), $this$Saver));
        }
    }, new Function1<Object, LinkAnnotation.Clickable>() { // from class: androidx.compose.ui.text.SaversKt$ClickableSaver$2
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // kotlin.jvm.functions.Function1
        public final LinkAnnotation.Clickable invoke(Object it) {
            TextLinkStyles stylesOrNull;
            Intrinsics.checkNotNull(it, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>");
            List list = (List) it;
            Object value$iv = list.get(0);
            String tag = value$iv != null ? (String) value$iv : null;
            Intrinsics.checkNotNull(tag);
            Object value$iv2 = list.get(1);
            Saver saver$iv = SaversKt.getTextLinkStylesSaver();
            if (Intrinsics.areEqual(value$iv2, (Object) false) && !(saver$iv instanceof NonNullValueClassSaver)) {
                stylesOrNull = null;
            } else {
                stylesOrNull = value$iv2 != null ? saver$iv.restore(value$iv2) : null;
            }
            return new LinkAnnotation.Clickable(tag, stylesOrNull, null);
        }
    });
    private static final Saver<ParagraphStyle, Object> ParagraphStyleSaver = SaverKt.Saver(new Function2<SaverScope, ParagraphStyle, Object>() { // from class: androidx.compose.ui.text.SaversKt$ParagraphStyleSaver$1
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(SaverScope $this$Saver, ParagraphStyle it) {
            return CollectionsKt.arrayListOf(SaversKt.save(TextAlign.m6750boximpl(it.m6234getTextAligne0LSkKk())), SaversKt.save(TextDirection.m6764boximpl(it.m6236getTextDirections_7Xco())), SaversKt.save(TextUnit.m7057boximpl(it.m6232getLineHeightXSAIIZE()), SaversKt.getSaver(TextUnit.Companion), $this$Saver), SaversKt.save(it.getTextIndent(), SaversKt.getSaver(TextIndent.Companion), $this$Saver), SaversKt.save(it.getPlatformStyle(), Savers_androidKt.getSaver(PlatformParagraphStyle.Companion), $this$Saver), SaversKt.save(it.getLineHeightStyle(), SaversKt.getSaver(LineHeightStyle.Companion), $this$Saver), SaversKt.save(LineBreak.m6658boximpl(it.m6231getLineBreakrAG3T2k()), Savers_androidKt.getSaver(LineBreak.Companion), $this$Saver), SaversKt.save(Hyphens.m6648boximpl(it.m6229getHyphensvmbZdU8())), SaversKt.save(it.getTextMotion(), Savers_androidKt.getSaver(TextMotion.Companion), $this$Saver));
        }
    }, new Function1<Object, ParagraphStyle>() { // from class: androidx.compose.ui.text.SaversKt$ParagraphStyleSaver$2
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // kotlin.jvm.functions.Function1
        public final ParagraphStyle invoke(Object it) {
            TextUnit restore;
            TextIndent restore2;
            PlatformParagraphStyle restore3;
            LineHeightStyle restore4;
            LineBreak restore5;
            TextMotion restore6;
            Intrinsics.checkNotNull(it, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>");
            List list = (List) it;
            Object value$iv = list.get(0);
            TextAlign textAlign = value$iv != null ? (TextAlign) value$iv : null;
            Intrinsics.checkNotNull(textAlign);
            int m6756unboximpl = textAlign.m6756unboximpl();
            Object value$iv2 = list.get(1);
            TextDirection textDirection = value$iv2 != null ? (TextDirection) value$iv2 : null;
            Intrinsics.checkNotNull(textDirection);
            int m6770unboximpl = textDirection.m6770unboximpl();
            Object value$iv3 = list.get(2);
            Saver saver$iv = SaversKt.getSaver(TextUnit.Companion);
            if (!Intrinsics.areEqual(value$iv3, (Object) false) || (saver$iv instanceof NonNullValueClassSaver)) {
                restore = value$iv3 != null ? saver$iv.restore(value$iv3) : null;
            } else {
                restore = null;
            }
            Intrinsics.checkNotNull(restore);
            long m7076unboximpl = restore.m7076unboximpl();
            Object value$iv4 = list.get(3);
            Saver saver$iv2 = SaversKt.getSaver(TextIndent.Companion);
            if (!Intrinsics.areEqual(value$iv4, (Object) false) || (saver$iv2 instanceof NonNullValueClassSaver)) {
                restore2 = value$iv4 != null ? saver$iv2.restore(value$iv4) : null;
            } else {
                restore2 = null;
            }
            Object value$iv5 = list.get(4);
            Saver saver$iv3 = Savers_androidKt.getSaver(PlatformParagraphStyle.Companion);
            if (!Intrinsics.areEqual(value$iv5, (Object) false) || (saver$iv3 instanceof NonNullValueClassSaver)) {
                restore3 = value$iv5 != null ? saver$iv3.restore(value$iv5) : null;
            } else {
                restore3 = null;
            }
            Object value$iv6 = list.get(5);
            Saver saver$iv4 = SaversKt.getSaver(LineHeightStyle.Companion);
            if (!Intrinsics.areEqual(value$iv6, (Object) false) || (saver$iv4 instanceof NonNullValueClassSaver)) {
                restore4 = value$iv6 != null ? saver$iv4.restore(value$iv6) : null;
            } else {
                restore4 = null;
            }
            Object value$iv7 = list.get(6);
            Saver saver$iv5 = Savers_androidKt.getSaver(LineBreak.Companion);
            if (!Intrinsics.areEqual(value$iv7, (Object) false) || (saver$iv5 instanceof NonNullValueClassSaver)) {
                restore5 = value$iv7 != null ? saver$iv5.restore(value$iv7) : null;
            } else {
                restore5 = null;
            }
            Intrinsics.checkNotNull(restore5);
            int m6670unboximpl = restore5.m6670unboximpl();
            Object value$iv8 = list.get(7);
            Hyphens hyphens = value$iv8 != null ? (Hyphens) value$iv8 : null;
            Intrinsics.checkNotNull(hyphens);
            int m6654unboximpl = hyphens.m6654unboximpl();
            Object value$iv9 = list.get(8);
            Saver saver$iv6 = Savers_androidKt.getSaver(TextMotion.Companion);
            if (!Intrinsics.areEqual(value$iv9, (Object) false) || (saver$iv6 instanceof NonNullValueClassSaver)) {
                restore6 = value$iv9 != null ? saver$iv6.restore(value$iv9) : null;
            } else {
                restore6 = null;
            }
            return new ParagraphStyle(m6756unboximpl, m6770unboximpl, m7076unboximpl, restore2, restore3, restore4, m6670unboximpl, m6654unboximpl, restore6, (DefaultConstructorMarker) null);
        }
    });
    private static final Saver<SpanStyle, Object> SpanStyleSaver = SaverKt.Saver(new Function2<SaverScope, SpanStyle, Object>() { // from class: androidx.compose.ui.text.SaversKt$SpanStyleSaver$1
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(SaverScope $this$Saver, SpanStyle it) {
            return CollectionsKt.arrayListOf(SaversKt.save(Color.m4279boximpl(it.m6280getColor0d7_KjU()), SaversKt.getSaver(Color.Companion), $this$Saver), SaversKt.save(TextUnit.m7057boximpl(it.m6281getFontSizeXSAIIZE()), SaversKt.getSaver(TextUnit.Companion), $this$Saver), SaversKt.save(it.getFontWeight(), SaversKt.getSaver(FontWeight.Companion), $this$Saver), SaversKt.save(it.m6282getFontStyle4Lr2A7w()), SaversKt.save(it.m6283getFontSynthesisZQGJjVo()), SaversKt.save(-1), SaversKt.save(it.getFontFeatureSettings()), SaversKt.save(TextUnit.m7057boximpl(it.m6284getLetterSpacingXSAIIZE()), SaversKt.getSaver(TextUnit.Companion), $this$Saver), SaversKt.save(it.m6279getBaselineShift5SSeXJ0(), SaversKt.getSaver(BaselineShift.Companion), $this$Saver), SaversKt.save(it.getTextGeometricTransform(), SaversKt.getSaver(TextGeometricTransform.Companion), $this$Saver), SaversKt.save(it.getLocaleList(), SaversKt.getSaver(LocaleList.Companion), $this$Saver), SaversKt.save(Color.m4279boximpl(it.m6278getBackground0d7_KjU()), SaversKt.getSaver(Color.Companion), $this$Saver), SaversKt.save(it.getTextDecoration(), SaversKt.getSaver(TextDecoration.Companion), $this$Saver), SaversKt.save(it.getShadow(), SaversKt.getSaver(Shadow.Companion), $this$Saver));
        }
    }, new Function1<Object, SpanStyle>() { // from class: androidx.compose.ui.text.SaversKt$SpanStyleSaver$2
        /* JADX WARN: Can't rename method to resolve collision */
        /* JADX WARN: Removed duplicated region for block: B:57:0x0135  */
        /* JADX WARN: Removed duplicated region for block: B:60:0x013d  */
        /* JADX WARN: Removed duplicated region for block: B:62:0x0141  */
        /* JADX WARN: Removed duplicated region for block: B:63:0x0153  */
        /* JADX WARN: Removed duplicated region for block: B:66:0x0167  */
        /* JADX WARN: Removed duplicated region for block: B:69:0x016f  */
        /* JADX WARN: Removed duplicated region for block: B:71:0x0173  */
        /* JADX WARN: Removed duplicated region for block: B:72:0x0185  */
        /* JADX WARN: Removed duplicated region for block: B:75:0x0199  */
        /* JADX WARN: Removed duplicated region for block: B:78:0x01a1  */
        /* JADX WARN: Removed duplicated region for block: B:80:0x01a5  */
        /* JADX WARN: Removed duplicated region for block: B:81:0x01b7  */
        /* JADX WARN: Removed duplicated region for block: B:84:0x01d3  */
        /* JADX WARN: Removed duplicated region for block: B:87:0x01db  */
        /* JADX WARN: Removed duplicated region for block: B:89:0x01df  */
        /* JADX WARN: Removed duplicated region for block: B:90:0x01f0  */
        /* JADX WARN: Removed duplicated region for block: B:93:0x0204  */
        /* JADX WARN: Removed duplicated region for block: B:97:0x020e  */
        /* JADX WARN: Removed duplicated region for block: B:98:0x0221  */
        @Override // kotlin.jvm.functions.Function1
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public final androidx.compose.ui.text.SpanStyle invoke(java.lang.Object r28) {
            /*
                Method dump skipped, instructions count: 581
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: androidx.compose.ui.text.SaversKt$SpanStyleSaver$2.invoke(java.lang.Object):androidx.compose.ui.text.SpanStyle");
        }
    });
    private static final Saver<TextLinkStyles, Object> TextLinkStylesSaver = SaverKt.Saver(new Function2<SaverScope, TextLinkStyles, Object>() { // from class: androidx.compose.ui.text.SaversKt$TextLinkStylesSaver$1
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(SaverScope $this$Saver, TextLinkStyles it) {
            return CollectionsKt.arrayListOf(SaversKt.save(it.getStyle(), SaversKt.getSpanStyleSaver(), $this$Saver), SaversKt.save(it.getFocusedStyle(), SaversKt.getSpanStyleSaver(), $this$Saver), SaversKt.save(it.getHoveredStyle(), SaversKt.getSpanStyleSaver(), $this$Saver), SaversKt.save(it.getPressedStyle(), SaversKt.getSpanStyleSaver(), $this$Saver));
        }
    }, new Function1<Object, TextLinkStyles>() { // from class: androidx.compose.ui.text.SaversKt$TextLinkStylesSaver$2
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // kotlin.jvm.functions.Function1
        public final TextLinkStyles invoke(Object it) {
            SpanStyle styleOrNull;
            SpanStyle focusedStyleOrNull;
            SpanStyle hoveredStyleOrNull;
            Intrinsics.checkNotNull(it, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>");
            List list = (List) it;
            Object value$iv = list.get(0);
            Saver saver$iv = SaversKt.getSpanStyleSaver();
            SpanStyle pressedStyleOrNull = null;
            if (!Intrinsics.areEqual(value$iv, (Object) false) || (saver$iv instanceof NonNullValueClassSaver)) {
                styleOrNull = value$iv != null ? saver$iv.restore(value$iv) : null;
            } else {
                styleOrNull = null;
            }
            Object value$iv2 = list.get(1);
            Saver saver$iv2 = SaversKt.getSpanStyleSaver();
            if (!Intrinsics.areEqual(value$iv2, (Object) false) || (saver$iv2 instanceof NonNullValueClassSaver)) {
                focusedStyleOrNull = value$iv2 != null ? saver$iv2.restore(value$iv2) : null;
            } else {
                focusedStyleOrNull = null;
            }
            Object value$iv3 = list.get(2);
            Saver saver$iv3 = SaversKt.getSpanStyleSaver();
            if (!Intrinsics.areEqual(value$iv3, (Object) false) || (saver$iv3 instanceof NonNullValueClassSaver)) {
                hoveredStyleOrNull = value$iv3 != null ? saver$iv3.restore(value$iv3) : null;
            } else {
                hoveredStyleOrNull = null;
            }
            Object value$iv4 = list.get(3);
            Saver saver$iv4 = SaversKt.getSpanStyleSaver();
            if ((!Intrinsics.areEqual(value$iv4, (Object) false) || (saver$iv4 instanceof NonNullValueClassSaver)) && value$iv4 != null) {
                pressedStyleOrNull = saver$iv4.restore(value$iv4);
            }
            return new TextLinkStyles(styleOrNull, focusedStyleOrNull, hoveredStyleOrNull, pressedStyleOrNull);
        }
    });
    private static final Saver<TextDecoration, Object> TextDecorationSaver = SaverKt.Saver(new Function2<SaverScope, TextDecoration, Object>() { // from class: androidx.compose.ui.text.SaversKt$TextDecorationSaver$1
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(SaverScope $this$Saver, TextDecoration it) {
            return Integer.valueOf(it.getMask());
        }
    }, new Function1<Object, TextDecoration>() { // from class: androidx.compose.ui.text.SaversKt$TextDecorationSaver$2
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // kotlin.jvm.functions.Function1
        public final TextDecoration invoke(Object it) {
            Intrinsics.checkNotNull(it, "null cannot be cast to non-null type kotlin.Int");
            return new TextDecoration(((Integer) it).intValue());
        }
    });
    private static final Saver<TextGeometricTransform, Object> TextGeometricTransformSaver = SaverKt.Saver(new Function2<SaverScope, TextGeometricTransform, Object>() { // from class: androidx.compose.ui.text.SaversKt$TextGeometricTransformSaver$1
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(SaverScope $this$Saver, TextGeometricTransform it) {
            return CollectionsKt.arrayListOf(Float.valueOf(it.getScaleX()), Float.valueOf(it.getSkewX()));
        }
    }, new Function1<Object, TextGeometricTransform>() { // from class: androidx.compose.ui.text.SaversKt$TextGeometricTransformSaver$2
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // kotlin.jvm.functions.Function1
        public final TextGeometricTransform invoke(Object it) {
            Intrinsics.checkNotNull(it, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Float>");
            List list = (List) it;
            return new TextGeometricTransform(((Number) list.get(0)).floatValue(), ((Number) list.get(1)).floatValue());
        }
    });
    private static final Saver<TextIndent, Object> TextIndentSaver = SaverKt.Saver(new Function2<SaverScope, TextIndent, Object>() { // from class: androidx.compose.ui.text.SaversKt$TextIndentSaver$1
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(SaverScope $this$Saver, TextIndent it) {
            return CollectionsKt.arrayListOf(SaversKt.save(TextUnit.m7057boximpl(it.m6781getFirstLineXSAIIZE()), SaversKt.getSaver(TextUnit.Companion), $this$Saver), SaversKt.save(TextUnit.m7057boximpl(it.m6782getRestLineXSAIIZE()), SaversKt.getSaver(TextUnit.Companion), $this$Saver));
        }
    }, new Function1<Object, TextIndent>() { // from class: androidx.compose.ui.text.SaversKt$TextIndentSaver$2
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // kotlin.jvm.functions.Function1
        public final TextIndent invoke(Object it) {
            TextUnit restore;
            Intrinsics.checkNotNull(it, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any>");
            List list = (List) it;
            Object value$iv = list.get(0);
            Saver saver$iv = SaversKt.getSaver(TextUnit.Companion);
            TextUnit textUnit = null;
            if (!Intrinsics.areEqual(value$iv, (Object) false) || (saver$iv instanceof NonNullValueClassSaver)) {
                restore = value$iv != null ? saver$iv.restore(value$iv) : null;
            } else {
                restore = null;
            }
            Intrinsics.checkNotNull(restore);
            long m7076unboximpl = restore.m7076unboximpl();
            Object value$iv2 = list.get(1);
            Saver saver$iv2 = SaversKt.getSaver(TextUnit.Companion);
            if ((!Intrinsics.areEqual(value$iv2, (Object) false) || (saver$iv2 instanceof NonNullValueClassSaver)) && value$iv2 != null) {
                textUnit = saver$iv2.restore(value$iv2);
            }
            Intrinsics.checkNotNull(textUnit);
            return new TextIndent(m7076unboximpl, textUnit.m7076unboximpl(), null);
        }
    });
    private static final Saver<FontWeight, Object> FontWeightSaver = SaverKt.Saver(new Function2<SaverScope, FontWeight, Object>() { // from class: androidx.compose.ui.text.SaversKt$FontWeightSaver$1
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(SaverScope $this$Saver, FontWeight it) {
            return Integer.valueOf(it.getWeight());
        }
    }, new Function1<Object, FontWeight>() { // from class: androidx.compose.ui.text.SaversKt$FontWeightSaver$2
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // kotlin.jvm.functions.Function1
        public final FontWeight invoke(Object it) {
            Intrinsics.checkNotNull(it, "null cannot be cast to non-null type kotlin.Int");
            return new FontWeight(((Integer) it).intValue());
        }
    });
    private static final Saver<BaselineShift, Object> BaselineShiftSaver = SaverKt.Saver(new Function2<SaverScope, BaselineShift, Object>() { // from class: androidx.compose.ui.text.SaversKt$BaselineShiftSaver$1
        @Override // kotlin.jvm.functions.Function2
        public /* bridge */ /* synthetic */ Object invoke(SaverScope saverScope, BaselineShift baselineShift) {
            return m6258invoke8a2Sb4w(saverScope, baselineShift.m6635unboximpl());
        }

        /* renamed from: invoke-8a2Sb4w  reason: not valid java name */
        public final Object m6258invoke8a2Sb4w(SaverScope $this$Saver, float it) {
            return Float.valueOf(it);
        }
    }, new Function1<Object, BaselineShift>() { // from class: androidx.compose.ui.text.SaversKt$BaselineShiftSaver$2
        @Override // kotlin.jvm.functions.Function1
        /* renamed from: invoke-jTk7eUs  reason: not valid java name */
        public final BaselineShift invoke(Object it) {
            Intrinsics.checkNotNull(it, "null cannot be cast to non-null type kotlin.Float");
            return BaselineShift.m6629boximpl(BaselineShift.m6630constructorimpl(((Float) it).floatValue()));
        }
    });
    private static final Saver<TextRange, Object> TextRangeSaver = SaverKt.Saver(new Function2<SaverScope, TextRange, Object>() { // from class: androidx.compose.ui.text.SaversKt$TextRangeSaver$1
        @Override // kotlin.jvm.functions.Function2
        public /* bridge */ /* synthetic */ Object invoke(SaverScope saverScope, TextRange textRange) {
            return m6264invokeFDrldGo(saverScope, textRange.m6343unboximpl());
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* renamed from: invoke-FDrldGo  reason: not valid java name */
        public final Object m6264invokeFDrldGo(SaverScope $this$Saver, long it) {
            return CollectionsKt.arrayListOf(SaversKt.save(Integer.valueOf(TextRange.m6339getStartimpl(it))), SaversKt.save(Integer.valueOf(TextRange.m6334getEndimpl(it))));
        }
    }, new Function1<Object, TextRange>() { // from class: androidx.compose.ui.text.SaversKt$TextRangeSaver$2
        @Override // kotlin.jvm.functions.Function1
        /* renamed from: invoke-VqIyPBM  reason: not valid java name */
        public final TextRange invoke(Object it) {
            Intrinsics.checkNotNull(it, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any>");
            List list = (List) it;
            Object value$iv = list.get(0);
            Object it$iv = value$iv != null ? (Integer) value$iv : null;
            Intrinsics.checkNotNull(it$iv);
            int intValue = ((Number) it$iv).intValue();
            Object value$iv2 = list.get(1);
            Object it$iv2 = value$iv2 != null ? (Integer) value$iv2 : null;
            Intrinsics.checkNotNull(it$iv2);
            return TextRange.m6327boximpl(TextRangeKt.TextRange(intValue, ((Number) it$iv2).intValue()));
        }
    });
    private static final Saver<Shadow, Object> ShadowSaver = SaverKt.Saver(new Function2<SaverScope, Shadow, Object>() { // from class: androidx.compose.ui.text.SaversKt$ShadowSaver$1
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(SaverScope $this$Saver, Shadow it) {
            return CollectionsKt.arrayListOf(SaversKt.save(Color.m4279boximpl(it.m4614getColor0d7_KjU()), SaversKt.getSaver(Color.Companion), $this$Saver), SaversKt.save(Offset.m4037boximpl(it.m4615getOffsetF1C5BW0()), SaversKt.getSaver(Offset.Companion), $this$Saver), SaversKt.save(Float.valueOf(it.getBlurRadius())));
        }
    }, new Function1<Object, Shadow>() { // from class: androidx.compose.ui.text.SaversKt$ShadowSaver$2
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // kotlin.jvm.functions.Function1
        public final Shadow invoke(Object it) {
            Color restore;
            Offset restore2;
            Intrinsics.checkNotNull(it, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any>");
            List list = (List) it;
            Object value$iv = list.get(0);
            Saver saver$iv = SaversKt.getSaver(Color.Companion);
            if (!Intrinsics.areEqual(value$iv, (Object) false) || (saver$iv instanceof NonNullValueClassSaver)) {
                restore = value$iv != null ? saver$iv.restore(value$iv) : null;
            } else {
                restore = null;
            }
            Intrinsics.checkNotNull(restore);
            long m4299unboximpl = restore.m4299unboximpl();
            Object value$iv2 = list.get(1);
            Saver saver$iv2 = SaversKt.getSaver(Offset.Companion);
            if (!Intrinsics.areEqual(value$iv2, (Object) false) || (saver$iv2 instanceof NonNullValueClassSaver)) {
                restore2 = value$iv2 != null ? saver$iv2.restore(value$iv2) : null;
            } else {
                restore2 = null;
            }
            Intrinsics.checkNotNull(restore2);
            long m4058unboximpl = restore2.m4058unboximpl();
            Object value$iv3 = list.get(2);
            Object it$iv = value$iv3 != null ? (Float) value$iv3 : null;
            Intrinsics.checkNotNull(it$iv);
            return new Shadow(m4299unboximpl, m4058unboximpl, ((Number) it$iv).floatValue(), null);
        }
    });
    private static final NonNullValueClassSaver<Color, Object> ColorSaver = NonNullValueClassSaver(new Function2<SaverScope, Color, Object>() { // from class: androidx.compose.ui.text.SaversKt$ColorSaver$1
        @Override // kotlin.jvm.functions.Function2
        public /* bridge */ /* synthetic */ Object invoke(SaverScope saverScope, Color color) {
            return m6260invoke4WTKRHQ(saverScope, color.m4299unboximpl());
        }

        /* renamed from: invoke-4WTKRHQ  reason: not valid java name */
        public final Object m6260invoke4WTKRHQ(SaverScope $this$NonNullValueClassSaver, long it) {
            if (it == 16) {
                return false;
            }
            return Integer.valueOf(ColorKt.m4343toArgb8_81llA(it));
        }
    }, new Function1<Object, Color>() { // from class: androidx.compose.ui.text.SaversKt$ColorSaver$2
        @Override // kotlin.jvm.functions.Function1
        /* renamed from: invoke-ijrfgN4  reason: not valid java name */
        public final Color invoke(Object it) {
            if (Intrinsics.areEqual(it, (Object) false)) {
                return Color.m4279boximpl(Color.Companion.m4325getUnspecified0d7_KjU());
            }
            Intrinsics.checkNotNull(it, "null cannot be cast to non-null type kotlin.Int");
            return Color.m4279boximpl(ColorKt.Color(((Integer) it).intValue()));
        }
    });
    private static final NonNullValueClassSaver<TextUnit, Object> TextUnitSaver = NonNullValueClassSaver(new Function2<SaverScope, TextUnit, Object>() { // from class: androidx.compose.ui.text.SaversKt$TextUnitSaver$1
        @Override // kotlin.jvm.functions.Function2
        public /* bridge */ /* synthetic */ Object invoke(SaverScope saverScope, TextUnit textUnit) {
            return m6266invokempE4wyQ(saverScope, textUnit.m7076unboximpl());
        }

        /* renamed from: invoke-mpE4wyQ  reason: not valid java name */
        public final Object m6266invokempE4wyQ(SaverScope $this$NonNullValueClassSaver, long it) {
            if (TextUnit.m7064equalsimpl0(it, TextUnit.Companion.m7078getUnspecifiedXSAIIZE())) {
                return (Serializable) false;
            }
            return CollectionsKt.arrayListOf(SaversKt.save(Float.valueOf(TextUnit.m7067getValueimpl(it))), SaversKt.save(TextUnitType.m7092boximpl(TextUnit.m7066getTypeUIouoOA(it))));
        }
    }, new Function1<Object, TextUnit>() { // from class: androidx.compose.ui.text.SaversKt$TextUnitSaver$2
        @Override // kotlin.jvm.functions.Function1
        /* renamed from: invoke-XNhUCwk  reason: not valid java name */
        public final TextUnit invoke(Object it) {
            if (Intrinsics.areEqual(it, (Object) false)) {
                return TextUnit.m7057boximpl(TextUnit.Companion.m7078getUnspecifiedXSAIIZE());
            }
            Intrinsics.checkNotNull(it, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any>");
            List list = (List) it;
            Object value$iv = list.get(0);
            Object it$iv = value$iv != null ? (Float) value$iv : null;
            Intrinsics.checkNotNull(it$iv);
            float floatValue = ((Number) it$iv).floatValue();
            Object value$iv2 = list.get(1);
            TextUnitType textUnitType = value$iv2 != null ? (TextUnitType) value$iv2 : null;
            Intrinsics.checkNotNull(textUnitType);
            return TextUnit.m7057boximpl(TextUnitKt.m7079TextUnitanM5pPY(floatValue, textUnitType.m7098unboximpl()));
        }
    });
    private static final NonNullValueClassSaver<Offset, Object> OffsetSaver = NonNullValueClassSaver(new Function2<SaverScope, Offset, Object>() { // from class: androidx.compose.ui.text.SaversKt$OffsetSaver$1
        @Override // kotlin.jvm.functions.Function2
        public /* bridge */ /* synthetic */ Object invoke(SaverScope saverScope, Offset offset) {
            return m6262invokeUv8p0NA(saverScope, offset.m4058unboximpl());
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* renamed from: invoke-Uv8p0NA  reason: not valid java name */
        public final Object m6262invokeUv8p0NA(SaverScope $this$NonNullValueClassSaver, long it) {
            if (Offset.m4045equalsimpl0(it, Offset.Companion.m4063getUnspecifiedF1C5BW0())) {
                return (Serializable) false;
            }
            int bits$iv$iv$iv = (int) (it >> 32);
            int bits$iv$iv$iv2 = (int) (4294967295L & it);
            return CollectionsKt.arrayListOf(SaversKt.save(Float.valueOf(Float.intBitsToFloat(bits$iv$iv$iv))), SaversKt.save(Float.valueOf(Float.intBitsToFloat(bits$iv$iv$iv2))));
        }
    }, new Function1<Object, Offset>() { // from class: androidx.compose.ui.text.SaversKt$OffsetSaver$2
        @Override // kotlin.jvm.functions.Function1
        /* renamed from: invoke-x-9fifI  reason: not valid java name */
        public final Offset invoke(Object it) {
            if (Intrinsics.areEqual(it, (Object) false)) {
                return Offset.m4037boximpl(Offset.Companion.m4063getUnspecifiedF1C5BW0());
            }
            Intrinsics.checkNotNull(it, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any?>");
            List list = (List) it;
            Object value$iv = list.get(0);
            Object it$iv = value$iv != null ? (Float) value$iv : null;
            Intrinsics.checkNotNull(it$iv);
            float x$iv = ((Number) it$iv).floatValue();
            Object value$iv2 = list.get(1);
            Object it$iv2 = value$iv2 != null ? (Float) value$iv2 : null;
            Intrinsics.checkNotNull(it$iv2);
            float y$iv = ((Number) it$iv2).floatValue();
            long v1$iv$iv = Float.floatToRawIntBits(x$iv);
            long v2$iv$iv = Float.floatToRawIntBits(y$iv);
            return Offset.m4037boximpl(Offset.m4040constructorimpl((v1$iv$iv << 32) | (4294967295L & v2$iv$iv)));
        }
    });
    private static final Saver<LocaleList, Object> LocaleListSaver = SaverKt.Saver(new Function2<SaverScope, LocaleList, Object>() { // from class: androidx.compose.ui.text.SaversKt$LocaleListSaver$1
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(SaverScope $this$Saver, LocaleList it) {
            List $this$fastMap$iv = it.getLocaleList();
            List target$iv = new ArrayList($this$fastMap$iv.size());
            int size = $this$fastMap$iv.size();
            for (int index$iv$iv = 0; index$iv$iv < size; index$iv$iv++) {
                Object item$iv$iv = $this$fastMap$iv.get(index$iv$iv);
                Locale locale = (Locale) item$iv$iv;
                target$iv.add(SaversKt.save(locale, SaversKt.getSaver(Locale.Companion), $this$Saver));
            }
            return target$iv;
        }
    }, new Function1<Object, LocaleList>() { // from class: androidx.compose.ui.text.SaversKt$LocaleListSaver$2
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // kotlin.jvm.functions.Function1
        public final LocaleList invoke(Object it) {
            Locale locale;
            Intrinsics.checkNotNull(it, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any>");
            List list = (List) it;
            ArrayList target$iv = new ArrayList(list.size());
            int size = list.size();
            for (int index$iv$iv = 0; index$iv$iv < size; index$iv$iv++) {
                Object item$iv$iv = list.get(index$iv$iv);
                ArrayList arrayList = target$iv;
                Saver saver$iv = SaversKt.getSaver(Locale.Companion);
                if (Intrinsics.areEqual(item$iv$iv, (Object) false) && !(saver$iv instanceof NonNullValueClassSaver)) {
                    locale = null;
                } else if (item$iv$iv != null) {
                    Object it$iv = saver$iv.restore(item$iv$iv);
                    locale = (Locale) it$iv;
                } else {
                    locale = null;
                }
                Intrinsics.checkNotNull(locale);
                arrayList.add(locale);
            }
            return new LocaleList(target$iv);
        }
    });
    private static final Saver<Locale, Object> LocaleSaver = SaverKt.Saver(new Function2<SaverScope, Locale, Object>() { // from class: androidx.compose.ui.text.SaversKt$LocaleSaver$1
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(SaverScope $this$Saver, Locale it) {
            return it.toLanguageTag();
        }
    }, new Function1<Object, Locale>() { // from class: androidx.compose.ui.text.SaversKt$LocaleSaver$2
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // kotlin.jvm.functions.Function1
        public final Locale invoke(Object it) {
            Intrinsics.checkNotNull(it, "null cannot be cast to non-null type kotlin.String");
            return new Locale((String) it);
        }
    });
    private static final Saver<LineHeightStyle, Object> LineHeightStyleSaver = SaverKt.Saver(new Function2<SaverScope, LineHeightStyle, Object>() { // from class: androidx.compose.ui.text.SaversKt$LineHeightStyleSaver$1
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(SaverScope $this$Saver, LineHeightStyle it) {
            return CollectionsKt.arrayListOf(SaversKt.save(LineHeightStyle.Alignment.m6717boximpl(it.m6714getAlignmentPIaL0Z0())), SaversKt.save(LineHeightStyle.Trim.m6737boximpl(it.m6716getTrimEVpEnUU())), SaversKt.save(LineHeightStyle.Mode.m6728boximpl(it.m6715getModelzQqcRY())));
        }
    }, new Function1<Object, LineHeightStyle>() { // from class: androidx.compose.ui.text.SaversKt$LineHeightStyleSaver$2
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // kotlin.jvm.functions.Function1
        public final LineHeightStyle invoke(Object it) {
            LineHeightStyle.Trim trim;
            LineHeightStyle.Mode mode;
            Intrinsics.checkNotNull(it, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any>");
            List list = (List) it;
            Object value$iv = list.get(0);
            LineHeightStyle.Alignment alignment = value$iv != null ? (LineHeightStyle.Alignment) value$iv : null;
            Intrinsics.checkNotNull(alignment);
            float m6723unboximpl = alignment.m6723unboximpl();
            Object value$iv2 = list.get(1);
            if (value$iv2 == null) {
                trim = null;
            } else {
                trim = (LineHeightStyle.Trim) value$iv2;
            }
            Intrinsics.checkNotNull(trim);
            int m6745unboximpl = trim.m6745unboximpl();
            Object value$iv3 = list.get(2);
            if (value$iv3 == null) {
                mode = null;
            } else {
                mode = (LineHeightStyle.Mode) value$iv3;
            }
            Intrinsics.checkNotNull(mode);
            return new LineHeightStyle(m6723unboximpl, m6745unboximpl, mode.m6734unboximpl(), null);
        }
    });

    private static /* synthetic */ void getAnnotationRangeSaver$annotations() {
    }

    private static /* synthetic */ void getUrlAnnotationSaver$annotations() {
    }

    public static final <T extends Saver<Original, Saveable>, Original, Saveable> Object save(Original original, T t, SaverScope scope) {
        Object save;
        if (original == null || (save = t.save(scope, original)) == null) {
            return false;
        }
        return save;
    }

    public static final /* synthetic */ <T extends Saver<Original, Saveable>, Original, Saveable, Result> Result restore(Saveable saveable, T t) {
        if ((!Intrinsics.areEqual((Object) saveable, (Object) false) || (t instanceof NonNullValueClassSaver)) && saveable != null) {
            T $this$restore_u24lambda_u243_u24lambda_u242 = t;
            Result result = (Result) $this$restore_u24lambda_u243_u24lambda_u242.restore(saveable);
            Intrinsics.reifiedOperationMarker(1, "Result");
            return result;
        }
        return null;
    }

    private static final <Original, Saveable> NonNullValueClassSaver<Original, Saveable> NonNullValueClassSaver(final Function2<? super SaverScope, ? super Original, ? extends Saveable> function2, final Function1<? super Saveable, ? extends Original> function1) {
        return new NonNullValueClassSaver<Original, Saveable>() { // from class: androidx.compose.ui.text.SaversKt$NonNullValueClassSaver$1
            @Override // androidx.compose.runtime.saveable.Saver
            public Saveable save(SaverScope $this$save, Original original) {
                return function2.invoke($this$save, original);
            }

            @Override // androidx.compose.runtime.saveable.Saver
            public Original restore(Saveable saveable) {
                return function1.invoke(saveable);
            }
        };
    }

    public static final <T> T save(T t) {
        return t;
    }

    public static final /* synthetic */ <Result> Result restore(Object value) {
        if (value != null) {
            Intrinsics.reifiedOperationMarker(1, "Result");
            Object it = value;
            return (Result) it;
        }
        return null;
    }

    public static final Saver<AnnotatedString, Object> getAnnotatedStringSaver() {
        return AnnotatedStringSaver;
    }

    public static final Saver<ParagraphStyle, Object> getParagraphStyleSaver() {
        return ParagraphStyleSaver;
    }

    public static final Saver<SpanStyle, Object> getSpanStyleSaver() {
        return SpanStyleSaver;
    }

    public static final Saver<TextLinkStyles, Object> getTextLinkStylesSaver() {
        return TextLinkStylesSaver;
    }

    public static final Saver<TextDecoration, Object> getSaver(TextDecoration.Companion $this$Saver) {
        return TextDecorationSaver;
    }

    public static final Saver<TextGeometricTransform, Object> getSaver(TextGeometricTransform.Companion $this$Saver) {
        return TextGeometricTransformSaver;
    }

    public static final Saver<TextIndent, Object> getSaver(TextIndent.Companion $this$Saver) {
        return TextIndentSaver;
    }

    public static final Saver<FontWeight, Object> getSaver(FontWeight.Companion $this$Saver) {
        return FontWeightSaver;
    }

    public static final Saver<BaselineShift, Object> getSaver(BaselineShift.Companion $this$Saver) {
        return BaselineShiftSaver;
    }

    public static final Saver<TextRange, Object> getSaver(TextRange.Companion $this$Saver) {
        return TextRangeSaver;
    }

    public static final Saver<Shadow, Object> getSaver(Shadow.Companion $this$Saver) {
        return ShadowSaver;
    }

    public static final Saver<Color, Object> getSaver(Color.Companion $this$Saver) {
        return ColorSaver;
    }

    public static final Saver<TextUnit, Object> getSaver(TextUnit.Companion $this$Saver) {
        return TextUnitSaver;
    }

    public static final Saver<Offset, Object> getSaver(Offset.Companion $this$Saver) {
        return OffsetSaver;
    }

    public static final Saver<LocaleList, Object> getSaver(LocaleList.Companion $this$Saver) {
        return LocaleListSaver;
    }

    public static final Saver<Locale, Object> getSaver(Locale.Companion $this$Saver) {
        return LocaleSaver;
    }

    public static final Saver<LineHeightStyle, Object> getSaver(LineHeightStyle.Companion $this$Saver) {
        return LineHeightStyleSaver;
    }
}
