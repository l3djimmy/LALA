package androidx.compose.ui.text;

import androidx.autofill.HintConstants;
import androidx.compose.ui.text.AnnotatedString;
import androidx.compose.ui.text.internal.InlineClassHelperKt;
import androidx.compose.ui.text.intl.LocaleList;
import androidx.compose.ui.text.style.LineHeightStyle;
import androidx.compose.ui.text.style.TextIndent;
import androidx.compose.ui.text.style.TextMotion;
import androidx.compose.ui.unit.TextUnit;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.exifinterface.media.ExifInterface;
import java.util.ArrayList;
import java.util.List;
import kotlin.Deprecated;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.ReplaceWith;
import kotlin.Unit;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.RangesKt;
/* compiled from: AnnotatedString.kt */
@Metadata(d1 = {"\u0000\u008e\u0001\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\b\n\u0002\b\u0010\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0006\u001a\u0016\u0010\u0002\u001a\u00020\u00012\u0006\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u0006\u001a\"\u0010\u0002\u001a\u00020\u00012\u0006\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\b2\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u001a\"\u0010\t\u001a\u00020\u00012\u0017\u0010\n\u001a\u0013\u0012\u0004\u0012\u00020\f\u0012\u0004\u0012\u00020\r0\u000b¢\u0006\u0002\b\u000eH\u0086\b\u001a@\u0010\u000f\u001a\u0012\u0012\f\u0012\n\u0012\u0006\b\u0001\u0012\u00020\u00120\u0011\u0018\u00010\u00102\u0012\u0010\u0013\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\b0\u00110\u00102\u0012\u0010\u0014\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00060\u00110\u0010H\u0002\u001a(\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u00182\u0006\u0010\u001a\u001a\u00020\u00182\u0006\u0010\u001b\u001a\u00020\u0018H\u0000\u001a\b\u0010\u001c\u001a\u00020\u0001H\u0000\u001aD\u0010\u001d\u001a\u0010\u0012\n\u0012\b\u0012\u0004\u0012\u0002H\u001e0\u0011\u0018\u00010\u0010\"\u0004\b\u0000\u0010\u001e2\u0016\u0010\u001f\u001a\u0012\u0012\f\u0012\n\u0012\u0006\b\u0001\u0012\u0002H\u001e0\u0011\u0018\u00010\u00102\u0006\u0010 \u001a\u00020\u00182\u0006\u0010!\u001a\u00020\u0018H\u0002\u001a(\u0010\"\u001a\u00020\u00162\u0006\u0010#\u001a\u00020\u00182\u0006\u0010$\u001a\u00020\u00182\u0006\u0010%\u001a\u00020\u00182\u0006\u0010&\u001a\u00020\u0018H\u0000\u001a\u0014\u0010'\u001a\u00020\u0001*\u00020\u00012\b\b\u0002\u0010(\u001a\u00020)\u001a\u0014\u0010*\u001a\u00020\u0001*\u00020\u00012\b\b\u0002\u0010(\u001a\u00020)\u001aD\u0010+\u001a\u0012\u0012\f\u0012\n\u0012\u0006\b\u0001\u0012\u00020\u00120\u0011\u0018\u00010\u0010*\u00020\u00012\u0006\u0010 \u001a\u00020\u00182\u0006\u0010!\u001a\u00020\u00182\u0016\b\u0002\u0010,\u001a\u0010\u0012\u0004\u0012\u00020\u0012\u0012\u0004\u0012\u00020\u0016\u0018\u00010\u000bH\u0002\u001a*\u0010-\u001a\u0010\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00060\u0011\u0018\u00010\u0010*\u00020\u00012\u0006\u0010 \u001a\u00020\u00182\u0006\u0010!\u001a\u00020\u0018H\u0002\u001aa\u0010.\u001a\b\u0012\u0004\u0012\u0002H\u001e0\u0010\"\u0004\b\u0000\u0010\u001e*\u00020\u00012\u0006\u0010/\u001a\u00020\u00062>\b\u0004\u00100\u001a8\u0012\u0013\u0012\u00110\u0001¢\u0006\f\b2\u0012\b\b3\u0012\u0004\b\b(4\u0012\u0019\u0012\u0017\u0012\u0004\u0012\u00020\u00060\u0011¢\u0006\f\b2\u0012\b\b3\u0012\u0004\b\b(\u0005\u0012\u0004\u0012\u0002H\u001e01H\u0080\b\u001a \u00105\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00060\u00110\u0010*\u00020\u00012\u0006\u0010/\u001a\u00020\u0006H\u0000\u001a\u001c\u00106\u001a\u00020\u0001*\u00020\u00012\u0006\u0010 \u001a\u00020\u00182\u0006\u0010!\u001a\u00020\u0018H\u0002\u001a\u0014\u00107\u001a\u00020\u0001*\u00020\u00012\b\b\u0002\u0010(\u001a\u00020)\u001a\u0014\u00108\u001a\u00020\u0001*\u00020\u00012\b\b\u0002\u0010(\u001a\u00020)\u001a?\u00109\u001a\u0002H:\"\b\b\u0000\u0010:*\u00020;*\u00020\f2\u0006\u0010<\u001a\u00020=2\u0019\b\u0004\u00100\u001a\u0013\u0012\u0004\u0012\u00020\f\u0012\u0004\u0012\u0002H:0\u000b¢\u0006\u0002\b\u000eH\u0086\b¢\u0006\u0002\u0010>\u001a?\u00109\u001a\u0002H:\"\b\b\u0000\u0010:*\u00020;*\u00020\f2\u0006\u0010?\u001a\u00020@2\u0019\b\u0004\u00100\u001a\u0013\u0012\u0004\u0012\u00020\f\u0012\u0004\u0012\u0002H:0\u000b¢\u0006\u0002\b\u000eH\u0087\b¢\u0006\u0002\u0010A\u001aG\u00109\u001a\u0002H:\"\b\b\u0000\u0010:*\u00020;*\u00020\f2\u0006\u0010B\u001a\u00020\u00042\u0006\u0010C\u001a\u00020\u00042\u0019\b\u0004\u00100\u001a\u0013\u0012\u0004\u0012\u00020\f\u0012\u0004\u0012\u0002H:0\u000b¢\u0006\u0002\b\u000eH\u0086\b¢\u0006\u0002\u0010D\u001a@\u0010E\u001a\u0002H:\"\b\b\u0000\u0010:*\u00020;*\u00020F2\n\b\u0002\u0010G\u001a\u0004\u0018\u00010H2\u0017\u00100\u001a\u0013\u0012\u0004\u0012\u00020\f\u0012\u0004\u0012\u0002H:0\u000b¢\u0006\u0002\b\u000eH\u0000¢\u0006\u0002\u0010I\u001a=\u0010J\u001a\u0002H:\"\b\b\u0000\u0010:*\u00020;*\u00020\f2\u0006\u0010K\u001a\u00020L2\u0017\u00100\u001a\u0013\u0012\u0004\u0012\u00020\f\u0012\u0004\u0012\u0002H:0\u000b¢\u0006\u0002\b\u000eH\u0086\b¢\u0006\u0002\u0010M\u001a?\u0010N\u001a\u0002H:\"\b\b\u0000\u0010:*\u00020;*\u00020\f2\u0006\u0010O\u001a\u00020\u00062\u0019\b\u0004\u00100\u001a\u0013\u0012\u0004\u0012\u00020\f\u0012\u0004\u0012\u0002H:0\u000b¢\u0006\u0002\b\u000eH\u0086\b¢\u0006\u0002\u0010P\u001a=\u0010N\u001a\u0002H:\"\b\b\u0000\u0010:*\u00020;*\u00020\f2\u0006\u0010O\u001a\u00020\b2\u0017\u00100\u001a\u0013\u0012\u0004\u0012\u00020\f\u0012\u0004\u0012\u0002H:0\u000b¢\u0006\u0002\b\u000eH\u0086\b¢\u0006\u0002\u0010Q\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006R"}, d2 = {"EmptyAnnotatedString", "Landroidx/compose/ui/text/AnnotatedString;", "AnnotatedString", "text", "", "paragraphStyle", "Landroidx/compose/ui/text/ParagraphStyle;", "spanStyle", "Landroidx/compose/ui/text/SpanStyle;", "buildAnnotatedString", "builder", "Lkotlin/Function1;", "Landroidx/compose/ui/text/AnnotatedString$Builder;", "", "Lkotlin/ExtensionFunctionType;", "constructAnnotationsFromSpansAndParagraphs", "", "Landroidx/compose/ui/text/AnnotatedString$Range;", "Landroidx/compose/ui/text/AnnotatedString$Annotation;", "spanStyles", "paragraphStyles", "contains", "", "baseStart", "", "baseEnd", "targetStart", "targetEnd", "emptyAnnotatedString", "filterRanges", ExifInterface.GPS_DIRECTION_TRUE, "ranges", "start", "end", "intersect", "lStart", "lEnd", "rStart", "rEnd", "capitalize", "localeList", "Landroidx/compose/ui/text/intl/LocaleList;", "decapitalize", "getLocalAnnotations", "predicate", "getLocalParagraphStyles", "mapEachParagraphStyle", "defaultParagraphStyle", "block", "Lkotlin/Function2;", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "annotatedString", "normalizedParagraphStyles", "substringWithoutParagraphStyles", "toLowerCase", "toUpperCase", "withAnnotation", "R", "", "ttsAnnotation", "Landroidx/compose/ui/text/TtsAnnotation;", "(Landroidx/compose/ui/text/AnnotatedString$Builder;Landroidx/compose/ui/text/TtsAnnotation;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;", "urlAnnotation", "Landroidx/compose/ui/text/UrlAnnotation;", "(Landroidx/compose/ui/text/AnnotatedString$Builder;Landroidx/compose/ui/text/UrlAnnotation;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;", "tag", "annotation", "(Landroidx/compose/ui/text/AnnotatedString$Builder;Ljava/lang/String;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;", "withBulletListItem", "Landroidx/compose/ui/text/AnnotatedString$Builder$BulletScope;", "bullet", "Landroidx/compose/ui/text/Bullet;", "(Landroidx/compose/ui/text/AnnotatedString$Builder$BulletScope;Landroidx/compose/ui/text/Bullet;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;", "withLink", "link", "Landroidx/compose/ui/text/LinkAnnotation;", "(Landroidx/compose/ui/text/AnnotatedString$Builder;Landroidx/compose/ui/text/LinkAnnotation;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;", "withStyle", "style", "(Landroidx/compose/ui/text/AnnotatedString$Builder;Landroidx/compose/ui/text/ParagraphStyle;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;", "(Landroidx/compose/ui/text/AnnotatedString$Builder;Landroidx/compose/ui/text/SpanStyle;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;", "ui-text_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class AnnotatedStringKt {
    private static final AnnotatedString EmptyAnnotatedString = new AnnotatedString("", null, 2, null);

    public static final List<AnnotatedString.Range<? extends AnnotatedString.Annotation>> constructAnnotationsFromSpansAndParagraphs(List<AnnotatedString.Range<SpanStyle>> list, List<AnnotatedString.Range<ParagraphStyle>> list2) {
        if (list.isEmpty() && list2.isEmpty()) {
            return null;
        }
        if (list2.isEmpty()) {
            return list;
        }
        if (list.isEmpty()) {
            return list2;
        }
        ArrayList array = new ArrayList(list.size() + list2.size());
        int size = list.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            AnnotatedString.Range item$iv = list.get(index$iv);
            AnnotatedString.Range it = item$iv;
            array.add(it);
        }
        int size2 = list2.size();
        for (int index$iv2 = 0; index$iv2 < size2; index$iv2++) {
            AnnotatedString.Range item$iv2 = list2.get(index$iv2);
            AnnotatedString.Range it2 = item$iv2;
            array.add(it2);
        }
        return array;
    }

    /* JADX WARN: Code restructure failed: missing block: B:85:0x0016, code lost:
        if (r1 == null) goto L79;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.util.List<androidx.compose.ui.text.AnnotatedString.Range<androidx.compose.ui.text.ParagraphStyle>> normalizedParagraphStyles(androidx.compose.ui.text.AnnotatedString r18, androidx.compose.ui.text.ParagraphStyle r19) {
        /*
            Method dump skipped, instructions count: 520
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.ui.text.AnnotatedStringKt.normalizedParagraphStyles(androidx.compose.ui.text.AnnotatedString, androidx.compose.ui.text.ParagraphStyle):java.util.List");
    }

    private static final List<AnnotatedString.Range<ParagraphStyle>> getLocalParagraphStyles(AnnotatedString $this$getLocalParagraphStyles, int start, int end) {
        List paragraphStyles;
        List paragraphStyles2;
        int $i$f$fastFilteredMap;
        ArrayList target$iv;
        if (start == end || (paragraphStyles = $this$getLocalParagraphStyles.getParagraphStylesOrNull$ui_text_release()) == null) {
            return null;
        }
        if (start != 0 || end < $this$getLocalParagraphStyles.getText().length()) {
            List $this$fastFilteredMap$iv = paragraphStyles;
            int $i$f$fastFilteredMap2 = 0;
            ArrayList target$iv2 = new ArrayList($this$fastFilteredMap$iv.size());
            int index$iv$iv = 0;
            int size = $this$fastFilteredMap$iv.size();
            while (index$iv$iv < size) {
                Object item$iv$iv = $this$fastFilteredMap$iv.get(index$iv$iv);
                AnnotatedString.Range it = (AnnotatedString.Range) item$iv$iv;
                List $this$fastFilteredMap$iv2 = $this$fastFilteredMap$iv;
                if (intersect(start, end, it.getStart(), it.getEnd())) {
                    ArrayList arrayList = target$iv2;
                    AnnotatedString.Range it2 = (AnnotatedString.Range) item$iv$iv;
                    paragraphStyles2 = paragraphStyles;
                    ParagraphStyle item = it2.getItem();
                    int $this$fastCoerceIn$iv = it2.getStart();
                    $i$f$fastFilteredMap = $i$f$fastFilteredMap2;
                    int $this$fastCoerceAtMost$iv$iv = $this$fastCoerceIn$iv < start ? start : $this$fastCoerceIn$iv;
                    if ($this$fastCoerceAtMost$iv$iv > end) {
                        $this$fastCoerceAtMost$iv$iv = end;
                    }
                    int i = $this$fastCoerceAtMost$iv$iv - start;
                    int $this$fastCoerceIn$iv2 = it2.getEnd();
                    target$iv = target$iv2;
                    int $this$fastCoerceAtMost$iv$iv2 = $this$fastCoerceIn$iv2 < start ? start : $this$fastCoerceIn$iv2;
                    if ($this$fastCoerceAtMost$iv$iv2 > end) {
                        $this$fastCoerceAtMost$iv$iv2 = end;
                    }
                    arrayList.add(new AnnotatedString.Range(item, i, $this$fastCoerceAtMost$iv$iv2 - start));
                } else {
                    paragraphStyles2 = paragraphStyles;
                    $i$f$fastFilteredMap = $i$f$fastFilteredMap2;
                    target$iv = target$iv2;
                }
                index$iv$iv++;
                $this$fastFilteredMap$iv = $this$fastFilteredMap$iv2;
                paragraphStyles = paragraphStyles2;
                $i$f$fastFilteredMap2 = $i$f$fastFilteredMap;
                target$iv2 = target$iv;
            }
            return target$iv2;
        }
        return paragraphStyles;
    }

    public static /* synthetic */ List getLocalAnnotations$default(AnnotatedString annotatedString, int i, int i2, Function1 function1, int i3, Object obj) {
        if ((i3 & 4) != 0) {
            function1 = null;
        }
        return getLocalAnnotations(annotatedString, i, i2, function1);
    }

    private static final List<AnnotatedString.Range<? extends AnnotatedString.Annotation>> getLocalAnnotations(AnnotatedString $this$getLocalAnnotations, int start, int end, Function1<? super AnnotatedString.Annotation, Boolean> function1) {
        List annotations;
        List $this$fastFilteredMap$iv;
        boolean z;
        List annotations2;
        int $i$f$fastFilteredMap;
        int i = start;
        Function1<? super AnnotatedString.Annotation, Boolean> function12 = function1;
        if (i == end || (annotations = $this$getLocalAnnotations.getAnnotations$ui_text_release()) == null) {
            return null;
        }
        if (i == 0 && end >= $this$getLocalAnnotations.getText().length()) {
            if (function12 == null) {
                return annotations;
            }
            List $this$fastFilter$iv = annotations;
            ArrayList target$iv = new ArrayList($this$fastFilter$iv.size());
            int index$iv$iv = 0;
            int size = $this$fastFilter$iv.size();
            while (index$iv$iv < size) {
                AnnotatedString.Range<? extends AnnotatedString.Annotation> it = $this$fastFilter$iv.get(index$iv$iv);
                List $this$fastFilter$iv2 = $this$fastFilter$iv;
                if (function12.invoke(it.getItem()).booleanValue()) {
                    target$iv.add(it);
                }
                index$iv$iv++;
                $this$fastFilter$iv = $this$fastFilter$iv2;
            }
            return target$iv;
        }
        List $this$fastFilteredMap$iv2 = annotations;
        int $i$f$fastFilteredMap2 = 0;
        ArrayList target$iv2 = new ArrayList($this$fastFilteredMap$iv2.size());
        int index$iv$iv2 = 0;
        int size2 = $this$fastFilteredMap$iv2.size();
        while (index$iv$iv2 < size2) {
            Object item$iv$iv = $this$fastFilteredMap$iv2.get(index$iv$iv2);
            AnnotatedString.Range it2 = (AnnotatedString.Range) item$iv$iv;
            boolean z2 = true;
            if (function12 != null) {
                $this$fastFilteredMap$iv = $this$fastFilteredMap$iv2;
                z = function12.invoke(it2.getItem()).booleanValue();
            } else {
                $this$fastFilteredMap$iv = $this$fastFilteredMap$iv2;
                z = true;
            }
            if ((z && intersect(i, end, it2.getStart(), it2.getEnd())) ? false : false) {
                AnnotatedString.Range it3 = (AnnotatedString.Range) item$iv$iv;
                String tag = it3.getTag();
                AnnotatedString.Annotation item = it3.getItem();
                annotations2 = annotations;
                $i$f$fastFilteredMap = $i$f$fastFilteredMap2;
                int $i$f$fastFilteredMap3 = it3.getEnd();
                target$iv2.add(new AnnotatedString.Range(item, RangesKt.coerceIn(it3.getStart(), i, end) - i, RangesKt.coerceIn($i$f$fastFilteredMap3, i, end) - i, tag));
            } else {
                annotations2 = annotations;
                $i$f$fastFilteredMap = $i$f$fastFilteredMap2;
            }
            index$iv$iv2++;
            i = start;
            function12 = function1;
            annotations = annotations2;
            $this$fastFilteredMap$iv2 = $this$fastFilteredMap$iv;
            $i$f$fastFilteredMap2 = $i$f$fastFilteredMap;
        }
        return target$iv2;
    }

    public static final AnnotatedString substringWithoutParagraphStyles(AnnotatedString $this$substringWithoutParagraphStyles, int start, int end) {
        String str;
        if (start != end) {
            str = $this$substringWithoutParagraphStyles.getText().substring(start, end);
            Intrinsics.checkNotNullExpressionValue(str, "substring(...)");
        } else {
            str = "";
        }
        List<AnnotatedString.Range<? extends AnnotatedString.Annotation>> localAnnotations = getLocalAnnotations($this$substringWithoutParagraphStyles, start, end, new Function1<AnnotatedString.Annotation, Boolean>() { // from class: androidx.compose.ui.text.AnnotatedStringKt$substringWithoutParagraphStyles$1
            @Override // kotlin.jvm.functions.Function1
            public final Boolean invoke(AnnotatedString.Annotation it) {
                return Boolean.valueOf(!(it instanceof ParagraphStyle));
            }
        });
        if (localAnnotations == null) {
            localAnnotations = CollectionsKt.emptyList();
        }
        return new AnnotatedString(str, localAnnotations);
    }

    public static final <T> List<T> mapEachParagraphStyle(AnnotatedString $this$mapEachParagraphStyle, ParagraphStyle defaultParagraphStyle, Function2<? super AnnotatedString, ? super AnnotatedString.Range<ParagraphStyle>, ? extends T> function2) {
        int $i$f$mapEachParagraphStyle = 0;
        List $this$fastMap$iv = normalizedParagraphStyles($this$mapEachParagraphStyle, defaultParagraphStyle);
        List target$iv = new ArrayList($this$fastMap$iv.size());
        int index$iv$iv = 0;
        int size = $this$fastMap$iv.size();
        while (index$iv$iv < size) {
            Object item$iv$iv = $this$fastMap$iv.get(index$iv$iv);
            AnnotatedString.Range paragraphStyleRange = (AnnotatedString.Range) item$iv$iv;
            AnnotatedString annotatedString = substringWithoutParagraphStyles($this$mapEachParagraphStyle, paragraphStyleRange.getStart(), paragraphStyleRange.getEnd());
            target$iv.add(function2.invoke(annotatedString, paragraphStyleRange));
            index$iv$iv++;
            $i$f$mapEachParagraphStyle = $i$f$mapEachParagraphStyle;
        }
        return target$iv;
    }

    public static /* synthetic */ AnnotatedString toUpperCase$default(AnnotatedString annotatedString, LocaleList localeList, int i, Object obj) {
        if ((i & 1) != 0) {
            localeList = LocaleList.Companion.getCurrent();
        }
        return toUpperCase(annotatedString, localeList);
    }

    public static final AnnotatedString toUpperCase(AnnotatedString $this$toUpperCase, final LocaleList localeList) {
        return JvmAnnotatedString_jvmKt.transform($this$toUpperCase, new Function3<String, Integer, Integer, String>() { // from class: androidx.compose.ui.text.AnnotatedStringKt$toUpperCase$1
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(3);
            }

            @Override // kotlin.jvm.functions.Function3
            public /* bridge */ /* synthetic */ String invoke(String str, Integer num, Integer num2) {
                return invoke(str, num.intValue(), num2.intValue());
            }

            public final String invoke(String str, int start, int end) {
                String substring = str.substring(start, end);
                Intrinsics.checkNotNullExpressionValue(substring, "substring(...)");
                return StringKt.toUpperCase(substring, LocaleList.this);
            }
        });
    }

    public static /* synthetic */ AnnotatedString toLowerCase$default(AnnotatedString annotatedString, LocaleList localeList, int i, Object obj) {
        if ((i & 1) != 0) {
            localeList = LocaleList.Companion.getCurrent();
        }
        return toLowerCase(annotatedString, localeList);
    }

    public static final AnnotatedString toLowerCase(AnnotatedString $this$toLowerCase, final LocaleList localeList) {
        return JvmAnnotatedString_jvmKt.transform($this$toLowerCase, new Function3<String, Integer, Integer, String>() { // from class: androidx.compose.ui.text.AnnotatedStringKt$toLowerCase$1
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(3);
            }

            @Override // kotlin.jvm.functions.Function3
            public /* bridge */ /* synthetic */ String invoke(String str, Integer num, Integer num2) {
                return invoke(str, num.intValue(), num2.intValue());
            }

            public final String invoke(String str, int start, int end) {
                String substring = str.substring(start, end);
                Intrinsics.checkNotNullExpressionValue(substring, "substring(...)");
                return StringKt.toLowerCase(substring, LocaleList.this);
            }
        });
    }

    public static /* synthetic */ AnnotatedString capitalize$default(AnnotatedString annotatedString, LocaleList localeList, int i, Object obj) {
        if ((i & 1) != 0) {
            localeList = LocaleList.Companion.getCurrent();
        }
        return capitalize(annotatedString, localeList);
    }

    public static final AnnotatedString capitalize(AnnotatedString $this$capitalize, final LocaleList localeList) {
        return JvmAnnotatedString_jvmKt.transform($this$capitalize, new Function3<String, Integer, Integer, String>() { // from class: androidx.compose.ui.text.AnnotatedStringKt$capitalize$1
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(3);
            }

            @Override // kotlin.jvm.functions.Function3
            public /* bridge */ /* synthetic */ String invoke(String str, Integer num, Integer num2) {
                return invoke(str, num.intValue(), num2.intValue());
            }

            public final String invoke(String str, int start, int end) {
                if (start == 0) {
                    String substring = str.substring(start, end);
                    Intrinsics.checkNotNullExpressionValue(substring, "substring(...)");
                    return StringKt.capitalize(substring, LocaleList.this);
                }
                String substring2 = str.substring(start, end);
                Intrinsics.checkNotNullExpressionValue(substring2, "substring(...)");
                return substring2;
            }
        });
    }

    public static /* synthetic */ AnnotatedString decapitalize$default(AnnotatedString annotatedString, LocaleList localeList, int i, Object obj) {
        if ((i & 1) != 0) {
            localeList = LocaleList.Companion.getCurrent();
        }
        return decapitalize(annotatedString, localeList);
    }

    public static final AnnotatedString decapitalize(AnnotatedString $this$decapitalize, final LocaleList localeList) {
        return JvmAnnotatedString_jvmKt.transform($this$decapitalize, new Function3<String, Integer, Integer, String>() { // from class: androidx.compose.ui.text.AnnotatedStringKt$decapitalize$1
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(3);
            }

            @Override // kotlin.jvm.functions.Function3
            public /* bridge */ /* synthetic */ String invoke(String str, Integer num, Integer num2) {
                return invoke(str, num.intValue(), num2.intValue());
            }

            public final String invoke(String str, int start, int end) {
                if (start == 0) {
                    String substring = str.substring(start, end);
                    Intrinsics.checkNotNullExpressionValue(substring, "substring(...)");
                    return StringKt.decapitalize(substring, LocaleList.this);
                }
                String substring2 = str.substring(start, end);
                Intrinsics.checkNotNullExpressionValue(substring2, "substring(...)");
                return substring2;
            }
        });
    }

    public static final <R> R withStyle(AnnotatedString.Builder $this$withStyle, SpanStyle style, Function1<? super AnnotatedString.Builder, ? extends R> function1) {
        int index = $this$withStyle.pushStyle(style);
        try {
            return function1.invoke($this$withStyle);
        } finally {
            $this$withStyle.pop(index);
        }
    }

    public static final <R> R withStyle(AnnotatedString.Builder $this$withStyle, ParagraphStyle style, Function1<? super AnnotatedString.Builder, ? extends R> function1) {
        int index = $this$withStyle.pushStyle(style);
        try {
            return function1.invoke($this$withStyle);
        } finally {
            $this$withStyle.pop(index);
        }
    }

    public static final <R> R withAnnotation(AnnotatedString.Builder $this$withAnnotation, String tag, String annotation, Function1<? super AnnotatedString.Builder, ? extends R> function1) {
        int index = $this$withAnnotation.pushStringAnnotation(tag, annotation);
        try {
            return function1.invoke($this$withAnnotation);
        } finally {
            $this$withAnnotation.pop(index);
        }
    }

    public static final <R> R withAnnotation(AnnotatedString.Builder $this$withAnnotation, TtsAnnotation ttsAnnotation, Function1<? super AnnotatedString.Builder, ? extends R> function1) {
        int index = $this$withAnnotation.pushTtsAnnotation(ttsAnnotation);
        try {
            return function1.invoke($this$withAnnotation);
        } finally {
            $this$withAnnotation.pop(index);
        }
    }

    @Deprecated(message = "Use LinkAnnotation API for links instead", replaceWith = @ReplaceWith(expression = "withLink(, block)", imports = {}))
    public static final <R> R withAnnotation(AnnotatedString.Builder $this$withAnnotation, UrlAnnotation urlAnnotation, Function1<? super AnnotatedString.Builder, ? extends R> function1) {
        int index = $this$withAnnotation.pushUrlAnnotation(urlAnnotation);
        try {
            return function1.invoke($this$withAnnotation);
        } finally {
            $this$withAnnotation.pop(index);
        }
    }

    public static final <R> R withLink(AnnotatedString.Builder $this$withLink, LinkAnnotation link, Function1<? super AnnotatedString.Builder, ? extends R> function1) {
        int index = $this$withLink.pushLink(link);
        try {
            return function1.invoke($this$withLink);
        } finally {
            $this$withLink.pop(index);
        }
    }

    public static /* synthetic */ Object withBulletListItem$default(AnnotatedString.Builder.BulletScope bulletScope, Bullet bullet, Function1 function1, int i, Object obj) {
        if ((i & 1) != 0) {
            bullet = null;
        }
        return withBulletListItem(bulletScope, bullet, function1);
    }

    public static final <R> R withBulletListItem(AnnotatedString.Builder.BulletScope $this$withBulletListItem, Bullet bullet, Function1<? super AnnotatedString.Builder, ? extends R> function1) {
        Bullet bullet2;
        Pair lastItemInStack = (Pair) CollectionsKt.lastOrNull((List<? extends Object>) $this$withBulletListItem.getBulletListSettingStack$ui_text_release());
        long itemIndentation = lastItemInStack != null ? ((TextUnit) lastItemInStack.getFirst()).m7076unboximpl() : BulletKt.getDefaultBulletIndentation();
        if (bullet != null) {
            bullet2 = bullet;
        } else if (lastItemInStack == null || (bullet2 = (Bullet) lastItemInStack.getSecond()) == null) {
            bullet2 = BulletKt.getDefaultBullet();
        }
        Bullet itemBullet = bullet2;
        int parIndex = $this$withBulletListItem.getBuilder$ui_text_release().pushStyle(new ParagraphStyle(0, 0, 0L, new TextIndent(itemIndentation, itemIndentation, null), (PlatformParagraphStyle) null, (LineHeightStyle) null, 0, 0, (TextMotion) null, (int) TypedValues.PositionType.TYPE_PERCENT_WIDTH, (DefaultConstructorMarker) null));
        int bulletIndex = $this$withBulletListItem.getBuilder$ui_text_release().pushBullet$ui_text_release(itemBullet);
        try {
            try {
                R invoke = function1.invoke($this$withBulletListItem.getBuilder$ui_text_release());
                $this$withBulletListItem.getBuilder$ui_text_release().pop(bulletIndex);
                $this$withBulletListItem.getBuilder$ui_text_release().pop(parIndex);
                return invoke;
            } catch (Throwable th) {
                th = th;
                $this$withBulletListItem.getBuilder$ui_text_release().pop(bulletIndex);
                $this$withBulletListItem.getBuilder$ui_text_release().pop(parIndex);
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
        }
    }

    public static final <T> List<AnnotatedString.Range<T>> filterRanges(List<? extends AnnotatedString.Range<? extends T>> list, int start, int end) {
        List $this$fastFilteredMap$iv;
        int i = start;
        int i2 = end;
        boolean value$iv = i <= i2;
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalArgumentException("start (" + i + ") should be less than or equal to end (" + i2 + ')');
        }
        if (list == null) {
            return null;
        }
        List nonNullRange = list;
        List $this$fastFilteredMap$iv2 = nonNullRange;
        ArrayList target$iv = new ArrayList($this$fastFilteredMap$iv2.size());
        int index$iv$iv = 0;
        int size = $this$fastFilteredMap$iv2.size();
        while (index$iv$iv < size) {
            Object item$iv$iv = $this$fastFilteredMap$iv2.get(index$iv$iv);
            AnnotatedString.Range it = (AnnotatedString.Range) item$iv$iv;
            List nonNullRange2 = nonNullRange;
            if (intersect(i, i2, it.getStart(), it.getEnd())) {
                AnnotatedString.Range it2 = (AnnotatedString.Range) item$iv$iv;
                $this$fastFilteredMap$iv = $this$fastFilteredMap$iv2;
                target$iv.add(new AnnotatedString.Range(it2.getItem(), Math.max(i, it2.getStart()) - i, Math.min(i2, it2.getEnd()) - start, it2.getTag()));
            } else {
                $this$fastFilteredMap$iv = $this$fastFilteredMap$iv2;
            }
            index$iv$iv++;
            i = start;
            i2 = end;
            nonNullRange = nonNullRange2;
            $this$fastFilteredMap$iv2 = $this$fastFilteredMap$iv;
        }
        ArrayList arrayList = target$iv;
        return arrayList.isEmpty() ? null : arrayList;
    }

    public static /* synthetic */ AnnotatedString AnnotatedString$default(String str, SpanStyle spanStyle, ParagraphStyle paragraphStyle, int i, Object obj) {
        if ((i & 4) != 0) {
            paragraphStyle = null;
        }
        return AnnotatedString(str, spanStyle, paragraphStyle);
    }

    public static final AnnotatedString AnnotatedString(String text, SpanStyle spanStyle, ParagraphStyle paragraphStyle) {
        return new AnnotatedString(text, CollectionsKt.listOf(new AnnotatedString.Range(spanStyle, 0, text.length())), paragraphStyle == null ? CollectionsKt.emptyList() : CollectionsKt.listOf(new AnnotatedString.Range(paragraphStyle, 0, text.length())));
    }

    public static final AnnotatedString AnnotatedString(String text, ParagraphStyle paragraphStyle) {
        return new AnnotatedString(text, CollectionsKt.emptyList(), CollectionsKt.listOf(new AnnotatedString.Range(paragraphStyle, 0, text.length())));
    }

    public static final AnnotatedString buildAnnotatedString(Function1<? super AnnotatedString.Builder, Unit> function1) {
        AnnotatedString.Builder builder = new AnnotatedString.Builder(0, 1, null);
        function1.invoke(builder);
        return builder.toAnnotatedString();
    }

    public static final boolean contains(int baseStart, int baseEnd, int targetStart, int targetEnd) {
        boolean z;
        boolean z2;
        if (baseStart > targetStart || targetEnd > baseEnd) {
            return false;
        }
        if (baseEnd == targetEnd) {
            if (targetStart != targetEnd) {
                z = false;
            } else {
                z = true;
            }
            if (baseStart != baseEnd) {
                z2 = false;
            } else {
                z2 = true;
            }
            if (z != z2) {
                return false;
            }
        }
        return true;
    }

    public static final boolean intersect(int lStart, int lEnd, int rStart, int rEnd) {
        return ((rStart < lEnd) & (lStart < rEnd)) | (((lStart == lEnd) | (rStart == rEnd)) & (lStart == rStart));
    }

    public static final AnnotatedString emptyAnnotatedString() {
        return EmptyAnnotatedString;
    }
}
