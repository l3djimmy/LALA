package androidx.compose.ui.text;

import androidx.collection.IntListKt;
import androidx.collection.MutableIntList;
import androidx.compose.runtime.saveable.Saver;
import androidx.compose.ui.text.AnnotatedString;
import androidx.compose.ui.text.LinkAnnotation;
import androidx.compose.ui.text.internal.InlineClassHelperKt;
import androidx.compose.ui.text.style.LineHeightStyle;
import androidx.compose.ui.text.style.TextIndent;
import androidx.compose.ui.text.style.TextMotion;
import androidx.compose.ui.unit.TextUnit;
import androidx.compose.ui.unit.TextUnitKt;
import androidx.compose.ui.unit.TextUnitType;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.exifinterface.media.ExifInterface;
import com.google.android.gms.common.internal.ImagesContract;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Comparator;
import java.util.List;
import kotlin.Deprecated;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.ReplaceWith;
import kotlin.collections.CollectionsKt;
import kotlin.comparisons.ComparisonsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: AnnotatedString.kt */
@Metadata(d1 = {"\u0000p\n\u0002\u0018\u0002\n\u0002\u0010\r\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\b\n\u0002\b\u000b\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\f\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u000b\b\u0007\u0018\u0000 A2\u00020\u0001:\u0005?@ABCB;\b\u0016\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0014\b\u0002\u0010\u0004\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00070\u00060\u0005\u0012\u0014\b\u0002\u0010\b\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\t0\u00060\u0005¢\u0006\u0002\u0010\nB'\b\u0016\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0016\b\u0002\u0010\u000b\u001a\u0010\u0012\f\u0012\n\u0012\u0006\b\u0001\u0012\u00020\f0\u00060\u0005¢\u0006\u0002\u0010\rB'\b\u0000\u0012\u0016\u0010\u000b\u001a\u0012\u0012\f\u0012\n\u0012\u0006\b\u0001\u0012\u00020\f0\u0006\u0018\u00010\u0005\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u000eJ\u0013\u0010\u001d\u001a\u00020\u001e2\b\u0010\u001f\u001a\u0004\u0018\u00010 H\u0096\u0002J0\u0010!\u001a\u00020\u00002(\u0010\"\u001a$\u0012\f\u0012\n\u0012\u0006\b\u0001\u0012\u00020\f0\u0006\u0012\u0012\u0012\u0010\u0012\f\u0012\n\u0012\u0006\b\u0001\u0012\u00020\f0\u00060\u00050#J\u0011\u0010$\u001a\u00020%2\u0006\u0010&\u001a\u00020\u0012H\u0096\u0002J\"\u0010'\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020(0\u00060\u00052\u0006\u0010)\u001a\u00020\u00122\u0006\u0010*\u001a\u00020\u0012J\"\u0010+\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00030\u00060\u00052\u0006\u0010)\u001a\u00020\u00122\u0006\u0010*\u001a\u00020\u0012J*\u0010+\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00030\u00060\u00052\u0006\u0010,\u001a\u00020\u00032\u0006\u0010)\u001a\u00020\u00122\u0006\u0010*\u001a\u00020\u0012J\"\u0010-\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020.0\u00060\u00052\u0006\u0010)\u001a\u00020\u00122\u0006\u0010*\u001a\u00020\u0012J$\u0010/\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u0002000\u00060\u00052\u0006\u0010)\u001a\u00020\u00122\u0006\u0010*\u001a\u00020\u0012H\u0007J\u000e\u00101\u001a\u00020\u001e2\u0006\u0010\u001f\u001a\u00020\u0000J\u0016\u00102\u001a\u00020\u001e2\u0006\u0010)\u001a\u00020\u00122\u0006\u0010*\u001a\u00020\u0012J\u001e\u00103\u001a\u00020\u001e2\u0006\u0010,\u001a\u00020\u00032\u0006\u0010)\u001a\u00020\u00122\u0006\u0010*\u001a\u00020\u0012J\b\u00104\u001a\u00020\u0012H\u0016J*\u00105\u001a\u00020\u00002\"\u0010\"\u001a\u001e\u0012\f\u0012\n\u0012\u0006\b\u0001\u0012\u00020\f0\u0006\u0012\f\u0012\n\u0012\u0006\b\u0001\u0012\u00020\f0\u00060#J\u0011\u00106\u001a\u00020\u00002\u0006\u0010\u001f\u001a\u00020\u0000H\u0087\u0002J\u0018\u00107\u001a\u00020\u00002\u0006\u00108\u001a\u000209ø\u0001\u0000¢\u0006\u0004\b:\u0010;J\u0018\u00107\u001a\u00020\u00002\u0006\u0010<\u001a\u00020\u00122\u0006\u0010=\u001a\u00020\u0012H\u0016J\b\u0010>\u001a\u00020\u0003H\u0016R$\u0010\u000b\u001a\u0012\u0012\f\u0012\n\u0012\u0006\b\u0001\u0012\u00020\f0\u0006\u0018\u00010\u0005X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0014\u0010\u0011\u001a\u00020\u00128VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u0013\u0010\u0014R\u001d\u0010\b\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\t0\u00060\u00058F¢\u0006\u0006\u001a\u0004\b\u0015\u0010\u0010R\"\u0010\u0016\u001a\u0010\u0012\n\u0012\b\u0012\u0004\u0012\u00020\t0\u0006\u0018\u00010\u0005X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0010R\u001d\u0010\u0004\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00070\u00060\u00058F¢\u0006\u0006\u001a\u0004\b\u0018\u0010\u0010R\"\u0010\u0019\u001a\u0010\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00070\u0006\u0018\u00010\u0005X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u0010R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001b\u0010\u001c\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006D"}, d2 = {"Landroidx/compose/ui/text/AnnotatedString;", "", "text", "", "spanStyles", "", "Landroidx/compose/ui/text/AnnotatedString$Range;", "Landroidx/compose/ui/text/SpanStyle;", "paragraphStyles", "Landroidx/compose/ui/text/ParagraphStyle;", "(Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V", "annotations", "Landroidx/compose/ui/text/AnnotatedString$Annotation;", "(Ljava/lang/String;Ljava/util/List;)V", "(Ljava/util/List;Ljava/lang/String;)V", "getAnnotations$ui_text_release", "()Ljava/util/List;", "length", "", "getLength", "()I", "getParagraphStyles", "paragraphStylesOrNull", "getParagraphStylesOrNull$ui_text_release", "getSpanStyles", "spanStylesOrNull", "getSpanStylesOrNull$ui_text_release", "getText", "()Ljava/lang/String;", "equals", "", "other", "", "flatMapAnnotations", "transform", "Lkotlin/Function1;", "get", "", "index", "getLinkAnnotations", "Landroidx/compose/ui/text/LinkAnnotation;", "start", "end", "getStringAnnotations", "tag", "getTtsAnnotations", "Landroidx/compose/ui/text/TtsAnnotation;", "getUrlAnnotations", "Landroidx/compose/ui/text/UrlAnnotation;", "hasEqualAnnotations", "hasLinkAnnotations", "hasStringAnnotations", "hashCode", "mapAnnotations", "plus", "subSequence", "range", "Landroidx/compose/ui/text/TextRange;", "subSequence-5zc-tL8", "(J)Landroidx/compose/ui/text/AnnotatedString;", "startIndex", "endIndex", "toString", "Annotation", "Builder", "Companion", "ExhaustiveAnnotation", "Range", "ui-text_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class AnnotatedString implements CharSequence {
    public static final int $stable = 0;
    public static final Companion Companion = new Companion(null);
    private static final Saver<AnnotatedString, ?> Saver = SaversKt.getAnnotatedStringSaver();
    private final List<Range<? extends Annotation>> annotations;
    private final List<Range<ParagraphStyle>> paragraphStylesOrNull;
    private final List<Range<SpanStyle>> spanStylesOrNull;
    private final String text;

    /* compiled from: AnnotatedString.kt */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bv\u0018\u00002\u00020\u0001\u0082\u0001\b\u0002\u0003\u0004\u0005\u0006\u0007\b\tø\u0001\u0000\u0082\u0002\u0006\n\u0004\b!0\u0001¨\u0006\nÀ\u0006\u0001"}, d2 = {"Landroidx/compose/ui/text/AnnotatedString$Annotation;", "", "Landroidx/compose/ui/text/AnnotatedString$ExhaustiveAnnotation;", "Landroidx/compose/ui/text/Bullet;", "Landroidx/compose/ui/text/LinkAnnotation;", "Landroidx/compose/ui/text/ParagraphStyle;", "Landroidx/compose/ui/text/SpanStyle;", "Landroidx/compose/ui/text/StringAnnotation;", "Landroidx/compose/ui/text/TtsAnnotation;", "Landroidx/compose/ui/text/UrlAnnotation;", "ui-text_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public interface Annotation {
    }

    /* compiled from: AnnotatedString.kt */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0002\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002¨\u0006\u0003"}, d2 = {"Landroidx/compose/ui/text/AnnotatedString$ExhaustiveAnnotation;", "Landroidx/compose/ui/text/AnnotatedString$Annotation;", "()V", "ui-text_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    private static final class ExhaustiveAnnotation implements Annotation {
    }

    /* JADX WARN: Multi-variable type inference failed */
    public AnnotatedString(List<? extends Range<? extends Annotation>> list, String text) {
        List sorted;
        this.annotations = list;
        this.text = text;
        ArrayList arrayList = null;
        ArrayList arrayList2 = null;
        List $this$fastForEach$iv = this.annotations;
        if ($this$fastForEach$iv != null) {
            int size = $this$fastForEach$iv.size();
            for (int index$iv = 0; index$iv < size; index$iv++) {
                Object item$iv = $this$fastForEach$iv.get(index$iv);
                Range annotation = (Range) item$iv;
                if (annotation.getItem() instanceof SpanStyle) {
                    if (arrayList == null) {
                        Object spanStyles = new ArrayList();
                        arrayList = (List) spanStyles;
                    }
                    Intrinsics.checkNotNull(annotation, "null cannot be cast to non-null type androidx.compose.ui.text.AnnotatedString.Range<androidx.compose.ui.text.SpanStyle>");
                    arrayList.add(annotation);
                } else if (annotation.getItem() instanceof ParagraphStyle) {
                    if (arrayList2 == null) {
                        Object paragraphStyles = new ArrayList();
                        arrayList2 = (List) paragraphStyles;
                    }
                    Intrinsics.checkNotNull(annotation, "null cannot be cast to non-null type androidx.compose.ui.text.AnnotatedString.Range<androidx.compose.ui.text.ParagraphStyle>");
                    arrayList2.add(annotation);
                }
            }
        }
        this.spanStylesOrNull = arrayList;
        this.paragraphStylesOrNull = arrayList2;
        Iterable iterable = this.paragraphStylesOrNull;
        if (iterable == null) {
            sorted = null;
        } else {
            Iterable $this$sortedBy$iv = iterable;
            sorted = CollectionsKt.sortedWith($this$sortedBy$iv, new Comparator() { // from class: androidx.compose.ui.text.AnnotatedString$special$$inlined$sortedBy$1
                @Override // java.util.Comparator
                public final int compare(T t, T t2) {
                    AnnotatedString.Range it = (AnnotatedString.Range) t;
                    AnnotatedString.Range it2 = (AnnotatedString.Range) t2;
                    return ComparisonsKt.compareValues(Integer.valueOf(it.getStart()), Integer.valueOf(it2.getStart()));
                }
            });
        }
        List list2 = sorted;
        int i = 1;
        if (list2 == null || list2.isEmpty()) {
            return;
        }
        MutableIntList previousEnds = IntListKt.mutableIntListOf(((Range) CollectionsKt.first((List<? extends Object>) sorted)).getEnd());
        int i2 = 1;
        int size2 = sorted.size();
        while (i2 < size2) {
            Range current = (Range) sorted.get(i2);
            while (true) {
                MutableIntList this_$iv = previousEnds;
                if ((this_$iv._size != 0 ? i : 0) == 0) {
                    break;
                }
                int previousEnd = previousEnds.last();
                if (current.getStart() >= previousEnd) {
                    MutableIntList this_$iv2 = previousEnds;
                    previousEnds.removeAt(this_$iv2._size - i);
                } else if ((current.getEnd() <= previousEnd ? i : 0) == 0) {
                    InlineClassHelperKt.throwIllegalArgumentException("Paragraph overlap not allowed, end " + current.getEnd() + " should be less than or equal to " + previousEnd);
                }
            }
            previousEnds.add(current.getEnd());
            i2++;
            i = 1;
        }
    }

    @Override // java.lang.CharSequence
    public final /* bridge */ char charAt(int index) {
        return get(index);
    }

    @Override // java.lang.CharSequence
    public final /* bridge */ int length() {
        return getLength();
    }

    public final List<Range<? extends Annotation>> getAnnotations$ui_text_release() {
        return this.annotations;
    }

    public final String getText() {
        return this.text;
    }

    public final List<Range<SpanStyle>> getSpanStylesOrNull$ui_text_release() {
        return this.spanStylesOrNull;
    }

    public final List<Range<SpanStyle>> getSpanStyles() {
        List<Range<SpanStyle>> list = this.spanStylesOrNull;
        return list == null ? CollectionsKt.emptyList() : list;
    }

    public final List<Range<ParagraphStyle>> getParagraphStylesOrNull$ui_text_release() {
        return this.paragraphStylesOrNull;
    }

    public final List<Range<ParagraphStyle>> getParagraphStyles() {
        List<Range<ParagraphStyle>> list = this.paragraphStylesOrNull;
        return list == null ? CollectionsKt.emptyList() : list;
    }

    public /* synthetic */ AnnotatedString(String str, List list, List list2, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, (i & 2) != 0 ? CollectionsKt.emptyList() : list, (i & 4) != 0 ? CollectionsKt.emptyList() : list2);
    }

    public AnnotatedString(String text, List<Range<SpanStyle>> list, List<Range<ParagraphStyle>> list2) {
        this(AnnotatedStringKt.access$constructAnnotationsFromSpansAndParagraphs(list, list2), text);
    }

    public /* synthetic */ AnnotatedString(String str, List list, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, (i & 2) != 0 ? CollectionsKt.emptyList() : list);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public AnnotatedString(java.lang.String r3, java.util.List<? extends androidx.compose.ui.text.AnnotatedString.Range<? extends androidx.compose.ui.text.AnnotatedString.Annotation>> r4) {
        /*
            r2 = this;
            r0 = r4
            java.util.Collection r0 = (java.util.Collection) r0
            boolean r1 = r0.isEmpty()
            if (r1 == 0) goto Lc
            r0 = 0
            r0 = 0
        Lc:
            java.util.List r0 = (java.util.List) r0
            r2.<init>(r0, r3)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.ui.text.AnnotatedString.<init>(java.lang.String, java.util.List):void");
    }

    public int getLength() {
        return this.text.length();
    }

    public char get(int index) {
        return this.text.charAt(index);
    }

    @Override // java.lang.CharSequence
    public AnnotatedString subSequence(int startIndex, int endIndex) {
        boolean value$iv = startIndex <= endIndex;
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalArgumentException("start (" + startIndex + ") should be less or equal to end (" + endIndex + ')');
        }
        if (startIndex == 0 && endIndex == this.text.length()) {
            return this;
        }
        String text = this.text.substring(startIndex, endIndex);
        Intrinsics.checkNotNullExpressionValue(text, "substring(...)");
        return new AnnotatedString(AnnotatedStringKt.access$filterRanges(this.annotations, startIndex, endIndex), text);
    }

    /* renamed from: subSequence-5zc-tL8  reason: not valid java name */
    public final AnnotatedString m6168subSequence5zctL8(long range) {
        return subSequence(TextRange.m6337getMinimpl(range), TextRange.m6336getMaximpl(range));
    }

    public final AnnotatedString plus(AnnotatedString other) {
        Builder $this$plus_u24lambda_u245 = new Builder(this);
        $this$plus_u24lambda_u245.append(other);
        return $this$plus_u24lambda_u245.toAnnotatedString();
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x005d  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x006b A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.util.List<androidx.compose.ui.text.AnnotatedString.Range<java.lang.String>> getStringAnnotations(java.lang.String r18, int r19, int r20) {
        /*
            r17 = this;
            r0 = r17
            java.util.List<androidx.compose.ui.text.AnnotatedString$Range<? extends androidx.compose.ui.text.AnnotatedString$Annotation>> r1 = r0.annotations
            if (r1 == 0) goto L80
            r2 = 0
            java.util.ArrayList r3 = new java.util.ArrayList
            int r4 = r1.size()
            r3.<init>(r4)
            r4 = r1
            r5 = 0
            r6 = 0
            r7 = r4
            java.util.Collection r7 = (java.util.Collection) r7
            int r7 = r7.size()
        L1c:
            if (r6 >= r7) goto L73
            java.lang.Object r8 = r4.get(r6)
            r9 = r8
            r10 = 0
            r11 = r9
            androidx.compose.ui.text.AnnotatedString$Range r11 = (androidx.compose.ui.text.AnnotatedString.Range) r11
            r12 = 0
            java.lang.Object r13 = r11.getItem()
            boolean r13 = r13 instanceof androidx.compose.ui.text.StringAnnotation
            if (r13 == 0) goto L52
            java.lang.String r13 = r11.getTag()
            r14 = r18
            boolean r13 = kotlin.jvm.internal.Intrinsics.areEqual(r14, r13)
            if (r13 == 0) goto L54
            int r13 = r11.getStart()
            int r15 = r11.getEnd()
            r0 = r19
            r16 = r1
            r1 = r20
            boolean r13 = androidx.compose.ui.text.AnnotatedStringKt.intersect(r0, r1, r13, r15)
            if (r13 == 0) goto L5a
            r13 = 1
            goto L5b
        L52:
            r14 = r18
        L54:
            r0 = r19
            r16 = r1
            r1 = r20
        L5a:
            r13 = 0
        L5b:
            if (r13 == 0) goto L6b
            r11 = r3
            java.util.Collection r11 = (java.util.Collection) r11
            r12 = r9
            androidx.compose.ui.text.AnnotatedString$Range r12 = (androidx.compose.ui.text.AnnotatedString.Range) r12
            r13 = 0
            androidx.compose.ui.text.AnnotatedString$Range r12 = androidx.compose.ui.text.StringAnnotationKt.unbox(r12)
            r11.add(r12)
        L6b:
            int r6 = r6 + 1
            r0 = r17
            r1 = r16
            goto L1c
        L73:
            r14 = r18
            r0 = r19
            r16 = r1
            r1 = r20
            r2 = r3
            java.util.List r2 = (java.util.List) r2
            goto L8a
        L80:
            r14 = r18
            r0 = r19
            r1 = r20
            java.util.List r2 = kotlin.collections.CollectionsKt.emptyList()
        L8a:
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.ui.text.AnnotatedString.getStringAnnotations(java.lang.String, int, int):java.util.List");
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x0052 A[LOOP:0: B:5:0x0013->B:18:0x0052, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0050 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean hasStringAnnotations(java.lang.String r17, int r18, int r19) {
        /*
            r16 = this;
            r0 = r16
            java.util.List<androidx.compose.ui.text.AnnotatedString$Range<? extends androidx.compose.ui.text.AnnotatedString$Annotation>> r1 = r0.annotations
            if (r1 == 0) goto L61
            r3 = 0
            r4 = r1
            r5 = 0
            r6 = 0
            r7 = r4
            java.util.Collection r7 = (java.util.Collection) r7
            int r7 = r7.size()
        L13:
            if (r6 >= r7) goto L58
            java.lang.Object r8 = r4.get(r6)
            r9 = r8
            r10 = 0
            r11 = r9
            androidx.compose.ui.text.AnnotatedString$Range r11 = (androidx.compose.ui.text.AnnotatedString.Range) r11
            r12 = 0
            java.lang.Object r13 = r11.getItem()
            boolean r13 = r13 instanceof androidx.compose.ui.text.StringAnnotation
            if (r13 == 0) goto L47
            java.lang.String r13 = r11.getTag()
            r15 = r17
            boolean r13 = kotlin.jvm.internal.Intrinsics.areEqual(r15, r13)
            if (r13 == 0) goto L49
            int r13 = r11.getStart()
            int r2 = r11.getEnd()
            r14 = r18
            r0 = r19
            boolean r2 = androidx.compose.ui.text.AnnotatedStringKt.intersect(r14, r0, r13, r2)
            if (r2 == 0) goto L4d
            r2 = 1
            goto L4e
        L47:
            r15 = r17
        L49:
            r14 = r18
            r0 = r19
        L4d:
            r2 = 0
        L4e:
            if (r2 == 0) goto L52
            r2 = 1
            goto L60
        L52:
            int r6 = r6 + 1
            r0 = r16
            goto L13
        L58:
            r15 = r17
            r14 = r18
            r0 = r19
            r2 = 0
        L60:
            goto L68
        L61:
            r15 = r17
            r14 = r18
            r0 = r19
            r2 = 0
        L68:
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.ui.text.AnnotatedString.hasStringAnnotations(java.lang.String, int, int):boolean");
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x004b  */
    /* JADX WARN: Removed duplicated region for block: B:21:0x0059 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.util.List<androidx.compose.ui.text.AnnotatedString.Range<java.lang.String>> getStringAnnotations(int r17, int r18) {
        /*
            r16 = this;
            r0 = r16
            java.util.List<androidx.compose.ui.text.AnnotatedString$Range<? extends androidx.compose.ui.text.AnnotatedString$Annotation>> r1 = r0.annotations
            if (r1 == 0) goto L68
            r2 = 0
            java.util.ArrayList r3 = new java.util.ArrayList
            int r4 = r1.size()
            r3.<init>(r4)
            r4 = r1
            r5 = 0
            r6 = 0
            r7 = r4
            java.util.Collection r7 = (java.util.Collection) r7
            int r7 = r7.size()
        L1c:
            if (r6 >= r7) goto L5f
            java.lang.Object r8 = r4.get(r6)
            r9 = r8
            r10 = 0
            r11 = r9
            androidx.compose.ui.text.AnnotatedString$Range r11 = (androidx.compose.ui.text.AnnotatedString.Range) r11
            r12 = 0
            java.lang.Object r13 = r11.getItem()
            boolean r13 = r13 instanceof androidx.compose.ui.text.StringAnnotation
            if (r13 == 0) goto L44
            int r13 = r11.getStart()
            int r14 = r11.getEnd()
            r15 = r17
            r0 = r18
            boolean r13 = androidx.compose.ui.text.AnnotatedStringKt.intersect(r15, r0, r13, r14)
            if (r13 == 0) goto L48
            r13 = 1
            goto L49
        L44:
            r15 = r17
            r0 = r18
        L48:
            r13 = 0
        L49:
            if (r13 == 0) goto L59
            r11 = r3
            java.util.Collection r11 = (java.util.Collection) r11
            r12 = r9
            androidx.compose.ui.text.AnnotatedString$Range r12 = (androidx.compose.ui.text.AnnotatedString.Range) r12
            r13 = 0
            androidx.compose.ui.text.AnnotatedString$Range r12 = androidx.compose.ui.text.StringAnnotationKt.unbox(r12)
            r11.add(r12)
        L59:
            int r6 = r6 + 1
            r0 = r16
            goto L1c
        L5f:
            r15 = r17
            r0 = r18
            r1 = r3
            java.util.List r1 = (java.util.List) r1
            goto L70
        L68:
            r15 = r17
            r0 = r18
            java.util.List r1 = kotlin.collections.CollectionsKt.emptyList()
        L70:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.ui.text.AnnotatedString.getStringAnnotations(int, int):java.util.List");
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x004b  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0051 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.util.List<androidx.compose.ui.text.AnnotatedString.Range<androidx.compose.ui.text.TtsAnnotation>> getTtsAnnotations(int r17, int r18) {
        /*
            r16 = this;
            r0 = r16
            java.util.List<androidx.compose.ui.text.AnnotatedString$Range<? extends androidx.compose.ui.text.AnnotatedString$Annotation>> r1 = r0.annotations
            if (r1 == 0) goto L60
            r2 = 0
            java.util.ArrayList r3 = new java.util.ArrayList
            int r4 = r1.size()
            r3.<init>(r4)
            r4 = r1
            r5 = 0
            r6 = 0
            r7 = r4
            java.util.Collection r7 = (java.util.Collection) r7
            int r7 = r7.size()
        L1c:
            if (r6 >= r7) goto L57
            java.lang.Object r8 = r4.get(r6)
            r9 = r8
            r10 = 0
            r11 = r9
            androidx.compose.ui.text.AnnotatedString$Range r11 = (androidx.compose.ui.text.AnnotatedString.Range) r11
            r12 = 0
            java.lang.Object r13 = r11.getItem()
            boolean r13 = r13 instanceof androidx.compose.ui.text.TtsAnnotation
            if (r13 == 0) goto L44
            int r13 = r11.getStart()
            int r14 = r11.getEnd()
            r15 = r17
            r0 = r18
            boolean r13 = androidx.compose.ui.text.AnnotatedStringKt.intersect(r15, r0, r13, r14)
            if (r13 == 0) goto L48
            r13 = 1
            goto L49
        L44:
            r15 = r17
            r0 = r18
        L48:
            r13 = 0
        L49:
            if (r13 == 0) goto L51
            r11 = r3
            java.util.Collection r11 = (java.util.Collection) r11
            r11.add(r9)
        L51:
            int r6 = r6 + 1
            r0 = r16
            goto L1c
        L57:
            r15 = r17
            r0 = r18
            r1 = r3
            java.util.List r1 = (java.util.List) r1
            goto L68
        L60:
            r15 = r17
            r0 = r18
            java.util.List r1 = kotlin.collections.CollectionsKt.emptyList()
        L68:
            java.lang.String r2 = "null cannot be cast to non-null type kotlin.collections.List<androidx.compose.ui.text.AnnotatedString.Range<androidx.compose.ui.text.TtsAnnotation>>"
            kotlin.jvm.internal.Intrinsics.checkNotNull(r1, r2)
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.ui.text.AnnotatedString.getTtsAnnotations(int, int):java.util.List");
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x004b  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0051 A[SYNTHETIC] */
    @kotlin.Deprecated(message = "Use LinkAnnotation API instead", replaceWith = @kotlin.ReplaceWith(expression = "getLinkAnnotations(start, end)", imports = {}))
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.util.List<androidx.compose.ui.text.AnnotatedString.Range<androidx.compose.ui.text.UrlAnnotation>> getUrlAnnotations(int r17, int r18) {
        /*
            r16 = this;
            r0 = r16
            java.util.List<androidx.compose.ui.text.AnnotatedString$Range<? extends androidx.compose.ui.text.AnnotatedString$Annotation>> r1 = r0.annotations
            if (r1 == 0) goto L60
            r2 = 0
            java.util.ArrayList r3 = new java.util.ArrayList
            int r4 = r1.size()
            r3.<init>(r4)
            r4 = r1
            r5 = 0
            r6 = 0
            r7 = r4
            java.util.Collection r7 = (java.util.Collection) r7
            int r7 = r7.size()
        L1c:
            if (r6 >= r7) goto L57
            java.lang.Object r8 = r4.get(r6)
            r9 = r8
            r10 = 0
            r11 = r9
            androidx.compose.ui.text.AnnotatedString$Range r11 = (androidx.compose.ui.text.AnnotatedString.Range) r11
            r12 = 0
            java.lang.Object r13 = r11.getItem()
            boolean r13 = r13 instanceof androidx.compose.ui.text.UrlAnnotation
            if (r13 == 0) goto L44
            int r13 = r11.getStart()
            int r14 = r11.getEnd()
            r15 = r17
            r0 = r18
            boolean r13 = androidx.compose.ui.text.AnnotatedStringKt.intersect(r15, r0, r13, r14)
            if (r13 == 0) goto L48
            r13 = 1
            goto L49
        L44:
            r15 = r17
            r0 = r18
        L48:
            r13 = 0
        L49:
            if (r13 == 0) goto L51
            r11 = r3
            java.util.Collection r11 = (java.util.Collection) r11
            r11.add(r9)
        L51:
            int r6 = r6 + 1
            r0 = r16
            goto L1c
        L57:
            r15 = r17
            r0 = r18
            r1 = r3
            java.util.List r1 = (java.util.List) r1
            goto L68
        L60:
            r15 = r17
            r0 = r18
            java.util.List r1 = kotlin.collections.CollectionsKt.emptyList()
        L68:
            java.lang.String r2 = "null cannot be cast to non-null type kotlin.collections.List<androidx.compose.ui.text.AnnotatedString.Range<androidx.compose.ui.text.UrlAnnotation>>"
            kotlin.jvm.internal.Intrinsics.checkNotNull(r1, r2)
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.ui.text.AnnotatedString.getUrlAnnotations(int, int):java.util.List");
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x004b  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0051 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.util.List<androidx.compose.ui.text.AnnotatedString.Range<androidx.compose.ui.text.LinkAnnotation>> getLinkAnnotations(int r17, int r18) {
        /*
            r16 = this;
            r0 = r16
            java.util.List<androidx.compose.ui.text.AnnotatedString$Range<? extends androidx.compose.ui.text.AnnotatedString$Annotation>> r1 = r0.annotations
            if (r1 == 0) goto L60
            r2 = 0
            java.util.ArrayList r3 = new java.util.ArrayList
            int r4 = r1.size()
            r3.<init>(r4)
            r4 = r1
            r5 = 0
            r6 = 0
            r7 = r4
            java.util.Collection r7 = (java.util.Collection) r7
            int r7 = r7.size()
        L1c:
            if (r6 >= r7) goto L57
            java.lang.Object r8 = r4.get(r6)
            r9 = r8
            r10 = 0
            r11 = r9
            androidx.compose.ui.text.AnnotatedString$Range r11 = (androidx.compose.ui.text.AnnotatedString.Range) r11
            r12 = 0
            java.lang.Object r13 = r11.getItem()
            boolean r13 = r13 instanceof androidx.compose.ui.text.LinkAnnotation
            if (r13 == 0) goto L44
            int r13 = r11.getStart()
            int r14 = r11.getEnd()
            r15 = r17
            r0 = r18
            boolean r13 = androidx.compose.ui.text.AnnotatedStringKt.intersect(r15, r0, r13, r14)
            if (r13 == 0) goto L48
            r13 = 1
            goto L49
        L44:
            r15 = r17
            r0 = r18
        L48:
            r13 = 0
        L49:
            if (r13 == 0) goto L51
            r11 = r3
            java.util.Collection r11 = (java.util.Collection) r11
            r11.add(r9)
        L51:
            int r6 = r6 + 1
            r0 = r16
            goto L1c
        L57:
            r15 = r17
            r0 = r18
            r1 = r3
            java.util.List r1 = (java.util.List) r1
            goto L68
        L60:
            r15 = r17
            r0 = r18
            java.util.List r1 = kotlin.collections.CollectionsKt.emptyList()
        L68:
            java.lang.String r2 = "null cannot be cast to non-null type kotlin.collections.List<androidx.compose.ui.text.AnnotatedString.Range<androidx.compose.ui.text.LinkAnnotation>>"
            kotlin.jvm.internal.Intrinsics.checkNotNull(r1, r2)
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.ui.text.AnnotatedString.getLinkAnnotations(int, int):java.util.List");
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0045 A[LOOP:0: B:5:0x0013->B:15:0x0045, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:20:0x0042 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean hasLinkAnnotations(int r18, int r19) {
        /*
            r17 = this;
            r0 = r17
            java.util.List<androidx.compose.ui.text.AnnotatedString$Range<? extends androidx.compose.ui.text.AnnotatedString$Annotation>> r1 = r0.annotations
            if (r1 == 0) goto L51
            r3 = 0
            r4 = r1
            r5 = 0
            r6 = 0
            r7 = r4
            java.util.Collection r7 = (java.util.Collection) r7
            int r7 = r7.size()
        L13:
            if (r6 >= r7) goto L49
            java.lang.Object r8 = r4.get(r6)
            r9 = r8
            r10 = 0
            r11 = r9
            androidx.compose.ui.text.AnnotatedString$Range r11 = (androidx.compose.ui.text.AnnotatedString.Range) r11
            r12 = 0
            java.lang.Object r13 = r11.getItem()
            boolean r13 = r13 instanceof androidx.compose.ui.text.LinkAnnotation
            if (r13 == 0) goto L3b
            int r13 = r11.getStart()
            int r15 = r11.getEnd()
            r2 = r18
            r14 = r19
            boolean r13 = androidx.compose.ui.text.AnnotatedStringKt.intersect(r2, r14, r13, r15)
            if (r13 == 0) goto L3f
            r11 = 1
            goto L40
        L3b:
            r2 = r18
            r14 = r19
        L3f:
            r11 = 0
        L40:
            if (r11 == 0) goto L45
            r16 = 1
            goto L50
        L45:
            int r6 = r6 + 1
            goto L13
        L49:
            r2 = r18
            r14 = r19
            r16 = 0
        L50:
            goto L57
        L51:
            r2 = r18
            r14 = r19
            r16 = 0
        L57:
            return r16
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.ui.text.AnnotatedString.hasLinkAnnotations(int, int):boolean");
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof AnnotatedString) && Intrinsics.areEqual(this.text, ((AnnotatedString) other).text) && Intrinsics.areEqual(this.annotations, ((AnnotatedString) other).annotations);
    }

    public int hashCode() {
        int result = this.text.hashCode();
        int i = result * 31;
        List<Range<? extends Annotation>> list = this.annotations;
        int result2 = i + (list != null ? list.hashCode() : 0);
        return result2;
    }

    @Override // java.lang.CharSequence
    public String toString() {
        return this.text;
    }

    public final boolean hasEqualAnnotations(AnnotatedString other) {
        return Intrinsics.areEqual(this.annotations, other.annotations);
    }

    public final AnnotatedString mapAnnotations(Function1<? super Range<? extends Annotation>, ? extends Range<? extends Annotation>> function1) {
        Builder builder = new Builder(this);
        builder.mapAnnotations$ui_text_release(function1);
        return builder.toAnnotatedString();
    }

    public final AnnotatedString flatMapAnnotations(Function1<? super Range<? extends Annotation>, ? extends List<? extends Range<? extends Annotation>>> function1) {
        Builder builder = new Builder(this);
        builder.flatMapAnnotations$ui_text_release(function1);
        return builder.toAnnotatedString();
    }

    /* compiled from: AnnotatedString.kt */
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0087\b\u0018\u0000*\u0004\b\u0000\u0010\u00012\u00020\u0002B\u001f\b\u0016\u0012\u0006\u0010\u0003\u001a\u00028\u0000\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0002\u0010\u0007B%\u0012\u0006\u0010\u0003\u001a\u00028\u0000\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\b\u001a\u00020\t¢\u0006\u0002\u0010\nJ\u000e\u0010\u0013\u001a\u00028\u0000HÆ\u0003¢\u0006\u0002\u0010\u000eJ\t\u0010\u0014\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0015\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0016\u001a\u00020\tHÆ\u0003J<\u0010\u0017\u001a\b\u0012\u0004\u0012\u00028\u00000\u00002\b\b\u0002\u0010\u0003\u001a\u00028\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00052\b\b\u0002\u0010\b\u001a\u00020\tHÆ\u0001¢\u0006\u0002\u0010\u0018J\u0013\u0010\u0019\u001a\u00020\u001a2\b\u0010\u001b\u001a\u0004\u0018\u00010\u0002HÖ\u0003J\t\u0010\u001c\u001a\u00020\u0005HÖ\u0001J\t\u0010\u001d\u001a\u00020\tHÖ\u0001R\u0011\u0010\u0006\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0013\u0010\u0003\u001a\u00028\u0000¢\u0006\n\n\u0002\u0010\u000f\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\fR\u0011\u0010\b\u001a\u00020\t¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012¨\u0006\u001e"}, d2 = {"Landroidx/compose/ui/text/AnnotatedString$Range;", ExifInterface.GPS_DIRECTION_TRUE, "", "item", "start", "", "end", "(Ljava/lang/Object;II)V", "tag", "", "(Ljava/lang/Object;IILjava/lang/String;)V", "getEnd", "()I", "getItem", "()Ljava/lang/Object;", "Ljava/lang/Object;", "getStart", "getTag", "()Ljava/lang/String;", "component1", "component2", "component3", "component4", "copy", "(Ljava/lang/Object;IILjava/lang/String;)Landroidx/compose/ui/text/AnnotatedString$Range;", "equals", "", "other", "hashCode", "toString", "ui-text_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public static final class Range<T> {
        public static final int $stable = 0;
        private final int end;
        private final T item;
        private final int start;
        private final String tag;

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ Range copy$default(Range range, Object obj, int i, int i2, String str, int i3, Object obj2) {
            if ((i3 & 1) != 0) {
                obj = range.item;
            }
            if ((i3 & 2) != 0) {
                i = range.start;
            }
            if ((i3 & 4) != 0) {
                i2 = range.end;
            }
            if ((i3 & 8) != 0) {
                str = range.tag;
            }
            return range.copy(obj, i, i2, str);
        }

        public final T component1() {
            return this.item;
        }

        public final int component2() {
            return this.start;
        }

        public final int component3() {
            return this.end;
        }

        public final String component4() {
            return this.tag;
        }

        public final Range<T> copy(T t, int i, int i2, String str) {
            return new Range<>(t, i, i2, str);
        }

        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (obj instanceof Range) {
                Range range = (Range) obj;
                return Intrinsics.areEqual(this.item, range.item) && this.start == range.start && this.end == range.end && Intrinsics.areEqual(this.tag, range.tag);
            }
            return false;
        }

        public int hashCode() {
            return ((((((this.item == null ? 0 : this.item.hashCode()) * 31) + Integer.hashCode(this.start)) * 31) + Integer.hashCode(this.end)) * 31) + this.tag.hashCode();
        }

        public String toString() {
            return "Range(item=" + this.item + ", start=" + this.start + ", end=" + this.end + ", tag=" + this.tag + ')';
        }

        public Range(T t, int start, int end, String tag) {
            this.item = t;
            this.start = start;
            this.end = end;
            this.tag = tag;
            boolean value$iv = this.start <= this.end;
            if (value$iv) {
                return;
            }
            InlineClassHelperKt.throwIllegalArgumentException("Reversed range is not supported");
        }

        public final int getEnd() {
            return this.end;
        }

        public final T getItem() {
            return this.item;
        }

        public final int getStart() {
            return this.start;
        }

        public final String getTag() {
            return this.tag;
        }

        public Range(T t, int start, int end) {
            this(t, start, end, "");
        }
    }

    /* compiled from: AnnotatedString.kt */
    @Metadata(d1 = {"\u0000²\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\f\n\u0002\u0010\r\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0007\u0018\u00002\u00060\u0001j\u0002`\u0002:\u0002TUB\u000f\b\u0016\u0012\u0006\u0010\u0003\u001a\u00020\u0004¢\u0006\u0002\u0010\u0005B\u000f\b\u0016\u0012\u0006\u0010\u0003\u001a\u00020\u0006¢\u0006\u0002\u0010\u0007B\u000f\u0012\b\b\u0002\u0010\b\u001a\u00020\t¢\u0006\u0002\u0010\nJ2\u0010\u0018\u001a\u00020\u00192\u0006\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\u001e\u001a\u00020\t2\u0006\u0010\u001f\u001a\u00020\tH\u0000ø\u0001\u0000¢\u0006\u0004\b \u0010!J%\u0010\u0018\u001a\u00020\u00192\u0006\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\u001e\u001a\u00020\t2\u0006\u0010\u001f\u001a\u00020\tH\u0000¢\u0006\u0002\b\"J\u001e\u0010#\u001a\u00020\u00192\u0006\u0010$\u001a\u00020%2\u0006\u0010\u001e\u001a\u00020\t2\u0006\u0010\u001f\u001a\u00020\tJ\u001e\u0010#\u001a\u00020\u00192\u0006\u0010&\u001a\u00020'2\u0006\u0010\u001e\u001a\u00020\t2\u0006\u0010\u001f\u001a\u00020\tJ&\u0010(\u001a\u00020\u00192\u0006\u0010)\u001a\u00020\u00042\u0006\u0010*\u001a\u00020\u00042\u0006\u0010\u001e\u001a\u00020\t2\u0006\u0010\u001f\u001a\u00020\tJ\u001e\u0010+\u001a\u00020\u00192\u0006\u0010,\u001a\u00020-2\u0006\u0010\u001e\u001a\u00020\t2\u0006\u0010\u001f\u001a\u00020\tJ\u001e\u0010+\u001a\u00020\u00192\u0006\u0010,\u001a\u00020.2\u0006\u0010\u001e\u001a\u00020\t2\u0006\u0010\u001f\u001a\u00020\tJ\u001e\u0010/\u001a\u00020\u00192\u0006\u00100\u001a\u0002012\u0006\u0010\u001e\u001a\u00020\t2\u0006\u0010\u001f\u001a\u00020\tJ \u00102\u001a\u00020\u00192\u0006\u00103\u001a\u0002042\u0006\u0010\u001e\u001a\u00020\t2\u0006\u0010\u001f\u001a\u00020\tH\u0007J\u000e\u00105\u001a\u00020\u00192\u0006\u0010\u0003\u001a\u00020\u0006J\u001e\u00105\u001a\u00020\u00192\u0006\u0010\u0003\u001a\u00020\u00062\u0006\u0010\u001e\u001a\u00020\t2\u0006\u0010\u001f\u001a\u00020\tJ\u0010\u00105\u001a\u00020\u00002\u0006\u00106\u001a\u000207H\u0016J\u0012\u00105\u001a\u00020\u00002\b\u0010\u0003\u001a\u0004\u0018\u000108H\u0016J\"\u00105\u001a\u00020\u00002\b\u0010\u0003\u001a\u0004\u0018\u0001082\u0006\u0010\u001e\u001a\u00020\t2\u0006\u0010\u001f\u001a\u00020\tH\u0016J\u000e\u00105\u001a\u00020\u00192\u0006\u0010\u0003\u001a\u00020\u0004J\u0015\u00109\u001a\u00020\u00192\u0006\u00106\u001a\u000207H\u0007¢\u0006\u0002\b5J7\u0010:\u001a\u00020\u00192(\u0010;\u001a$\u0012\f\u0012\n\u0012\u0006\b\u0001\u0012\u00020\u000e0=\u0012\u0012\u0012\u0010\u0012\f\u0012\n\u0012\u0006\b\u0001\u0012\u00020\u000e0=0>0<H\u0000¢\u0006\u0002\b?J1\u0010@\u001a\u00020\u00192\"\u0010;\u001a\u001e\u0012\f\u0012\n\u0012\u0006\b\u0001\u0012\u00020\u000e0=\u0012\f\u0012\n\u0012\u0006\b\u0001\u0012\u00020\u000e0=0<H\u0000¢\u0006\u0002\bAJ\u0006\u0010B\u001a\u00020\u0019J\u000e\u0010B\u001a\u00020\u00192\u0006\u0010C\u001a\u00020\tJ\u0015\u0010D\u001a\u00020\t2\u0006\u0010\u001a\u001a\u00020\u001bH\u0000¢\u0006\u0002\bEJ\u000e\u0010F\u001a\u00020\t2\u0006\u0010G\u001a\u00020HJ\u0016\u0010I\u001a\u00020\t2\u0006\u0010)\u001a\u00020\u00042\u0006\u0010*\u001a\u00020\u0004J\u000e\u0010J\u001a\u00020\t2\u0006\u0010,\u001a\u00020-J\u000e\u0010J\u001a\u00020\t2\u0006\u0010,\u001a\u00020.J\u000e\u0010K\u001a\u00020\t2\u0006\u00100\u001a\u000201J\u0010\u0010L\u001a\u00020\t2\u0006\u00103\u001a\u000204H\u0007J\u0006\u0010M\u001a\u00020\u0006JI\u0010N\u001a\u0002HO\"\b\b\u0000\u0010O*\u00020\u00152\b\b\u0002\u0010\u001c\u001a\u00020\u001d2\b\b\u0002\u0010\u001a\u001a\u00020\u001b2\u0017\u0010P\u001a\u0013\u0012\u0004\u0012\u00020\u0010\u0012\u0004\u0012\u0002HO0<¢\u0006\u0002\bQH\u0000ø\u0001\u0000¢\u0006\u0004\bR\u0010SR\u001c\u0010\u000b\u001a\u0010\u0012\f\u0012\n\u0012\u0006\b\u0001\u0012\u00020\u000e0\r0\fX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0010X\u0082\u0004¢\u0006\u0002\n\u0000R\u0011\u0010\u0011\u001a\u00020\t8F¢\u0006\u0006\u001a\u0004\b\u0012\u0010\u0013R\u001c\u0010\u0014\u001a\u0010\u0012\f\u0012\n\u0012\u0006\b\u0001\u0012\u00020\u00150\r0\fX\u0082\u0004¢\u0006\u0002\n\u0000R\u0012\u0010\u0003\u001a\u00060\u0016j\u0002`\u0017X\u0082\u0004¢\u0006\u0002\n\u0000\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006V"}, d2 = {"Landroidx/compose/ui/text/AnnotatedString$Builder;", "Ljava/lang/Appendable;", "Lkotlin/text/Appendable;", "text", "", "(Ljava/lang/String;)V", "Landroidx/compose/ui/text/AnnotatedString;", "(Landroidx/compose/ui/text/AnnotatedString;)V", "capacity", "", "(I)V", "annotations", "", "Landroidx/compose/ui/text/AnnotatedString$Builder$MutableRange;", "Landroidx/compose/ui/text/AnnotatedString$Annotation;", "bulletScope", "Landroidx/compose/ui/text/AnnotatedString$Builder$BulletScope;", "length", "getLength", "()I", "styleStack", "", "Ljava/lang/StringBuilder;", "Lkotlin/text/StringBuilder;", "addBullet", "", "bullet", "Landroidx/compose/ui/text/Bullet;", "indentation", "Landroidx/compose/ui/unit/TextUnit;", "start", "end", "addBullet-r9BaKPg$ui_text_release", "(Landroidx/compose/ui/text/Bullet;JII)V", "addBullet$ui_text_release", "addLink", "clickable", "Landroidx/compose/ui/text/LinkAnnotation$Clickable;", ImagesContract.URL, "Landroidx/compose/ui/text/LinkAnnotation$Url;", "addStringAnnotation", "tag", "annotation", "addStyle", "style", "Landroidx/compose/ui/text/ParagraphStyle;", "Landroidx/compose/ui/text/SpanStyle;", "addTtsAnnotation", "ttsAnnotation", "Landroidx/compose/ui/text/TtsAnnotation;", "addUrlAnnotation", "urlAnnotation", "Landroidx/compose/ui/text/UrlAnnotation;", "append", "char", "", "", "deprecated_append_returning_void", "flatMapAnnotations", "transform", "Lkotlin/Function1;", "Landroidx/compose/ui/text/AnnotatedString$Range;", "", "flatMapAnnotations$ui_text_release", "mapAnnotations", "mapAnnotations$ui_text_release", "pop", "index", "pushBullet", "pushBullet$ui_text_release", "pushLink", "link", "Landroidx/compose/ui/text/LinkAnnotation;", "pushStringAnnotation", "pushStyle", "pushTtsAnnotation", "pushUrlAnnotation", "toAnnotatedString", "withBulletList", "R", "block", "Lkotlin/ExtensionFunctionType;", "withBulletList-o2QH7mI$ui_text_release", "(JLandroidx/compose/ui/text/Bullet;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;", "BulletScope", "MutableRange", "ui-text_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public static final class Builder implements Appendable {
        public static final int $stable = 8;
        private final List<MutableRange<? extends Annotation>> annotations;
        private final BulletScope bulletScope;
        private final List<MutableRange<? extends Object>> styleStack;
        private final StringBuilder text;

        public Builder() {
            this(0, 1, null);
        }

        public Builder(int capacity) {
            this.text = new StringBuilder(capacity);
            this.styleStack = new ArrayList();
            this.annotations = new ArrayList();
            this.bulletScope = new BulletScope(this);
        }

        public /* synthetic */ Builder(int i, int i2, DefaultConstructorMarker defaultConstructorMarker) {
            this((i2 & 1) != 0 ? 16 : i);
        }

        /* JADX INFO: Access modifiers changed from: private */
        /* compiled from: AnnotatedString.kt */
        @Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0012\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0082\b\u0018\u0000 %*\u0004\b\u0000\u0010\u00012\u00020\u0002:\u0001%B)\u0012\u0006\u0010\u0003\u001a\u00028\u0000\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0005\u0012\b\b\u0002\u0010\u0007\u001a\u00020\b¢\u0006\u0002\u0010\tJ\u000e\u0010\u0014\u001a\u00028\u0000HÆ\u0003¢\u0006\u0002\u0010\u000fJ\t\u0010\u0015\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0016\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0017\u001a\u00020\bHÆ\u0003J<\u0010\u0018\u001a\b\u0012\u0004\u0012\u00028\u00000\u00002\b\b\u0002\u0010\u0003\u001a\u00028\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00052\b\b\u0002\u0010\u0007\u001a\u00020\bHÆ\u0001¢\u0006\u0002\u0010\u0019J\u0013\u0010\u001a\u001a\u00020\u001b2\b\u0010\u001c\u001a\u0004\u0018\u00010\u0002HÖ\u0003J\t\u0010\u001d\u001a\u00020\u0005HÖ\u0001J0\u0010\u001e\u001a\b\u0012\u0004\u0012\u0002H 0\u001f\"\u0004\b\u0001\u0010 2\u0012\u0010!\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u0002H 0\"2\b\b\u0002\u0010#\u001a\u00020\u0005J\u0016\u0010\u001e\u001a\b\u0012\u0004\u0012\u00028\u00000\u001f2\b\b\u0002\u0010#\u001a\u00020\u0005J\t\u0010$\u001a\u00020\bHÖ\u0001R\u001a\u0010\u0006\u001a\u00020\u0005X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\n\u0010\u000b\"\u0004\b\f\u0010\rR\u0013\u0010\u0003\u001a\u00028\u0000¢\u0006\n\n\u0002\u0010\u0010\u001a\u0004\b\u000e\u0010\u000fR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u000bR\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013¨\u0006&"}, d2 = {"Landroidx/compose/ui/text/AnnotatedString$Builder$MutableRange;", ExifInterface.GPS_DIRECTION_TRUE, "", "item", "start", "", "end", "tag", "", "(Ljava/lang/Object;IILjava/lang/String;)V", "getEnd", "()I", "setEnd", "(I)V", "getItem", "()Ljava/lang/Object;", "Ljava/lang/Object;", "getStart", "getTag", "()Ljava/lang/String;", "component1", "component2", "component3", "component4", "copy", "(Ljava/lang/Object;IILjava/lang/String;)Landroidx/compose/ui/text/AnnotatedString$Builder$MutableRange;", "equals", "", "other", "hashCode", "toRange", "Landroidx/compose/ui/text/AnnotatedString$Range;", "R", "transform", "Lkotlin/Function1;", "defaultEnd", "toString", "Companion", "ui-text_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
        /* loaded from: classes11.dex */
        public static final class MutableRange<T> {
            public static final Companion Companion = new Companion(null);
            private int end;
            private final T item;
            private final int start;
            private final String tag;

            /* JADX WARN: Multi-variable type inference failed */
            public static /* synthetic */ MutableRange copy$default(MutableRange mutableRange, Object obj, int i, int i2, String str, int i3, Object obj2) {
                if ((i3 & 1) != 0) {
                    obj = mutableRange.item;
                }
                if ((i3 & 2) != 0) {
                    i = mutableRange.start;
                }
                if ((i3 & 4) != 0) {
                    i2 = mutableRange.end;
                }
                if ((i3 & 8) != 0) {
                    str = mutableRange.tag;
                }
                return mutableRange.copy(obj, i, i2, str);
            }

            public final T component1() {
                return this.item;
            }

            public final int component2() {
                return this.start;
            }

            public final int component3() {
                return this.end;
            }

            public final String component4() {
                return this.tag;
            }

            public final MutableRange<T> copy(T t, int i, int i2, String str) {
                return new MutableRange<>(t, i, i2, str);
            }

            public boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                if (obj instanceof MutableRange) {
                    MutableRange mutableRange = (MutableRange) obj;
                    return Intrinsics.areEqual(this.item, mutableRange.item) && this.start == mutableRange.start && this.end == mutableRange.end && Intrinsics.areEqual(this.tag, mutableRange.tag);
                }
                return false;
            }

            public int hashCode() {
                return ((((((this.item == null ? 0 : this.item.hashCode()) * 31) + Integer.hashCode(this.start)) * 31) + Integer.hashCode(this.end)) * 31) + this.tag.hashCode();
            }

            public String toString() {
                return "MutableRange(item=" + this.item + ", start=" + this.start + ", end=" + this.end + ", tag=" + this.tag + ')';
            }

            public MutableRange(T t, int start, int end, String tag) {
                this.item = t;
                this.start = start;
                this.end = end;
                this.tag = tag;
            }

            public /* synthetic */ MutableRange(Object obj, int i, int i2, String str, int i3, DefaultConstructorMarker defaultConstructorMarker) {
                this(obj, i, (i3 & 4) != 0 ? Integer.MIN_VALUE : i2, (i3 & 8) != 0 ? "" : str);
            }

            public final T getItem() {
                return this.item;
            }

            public final int getStart() {
                return this.start;
            }

            public final int getEnd() {
                return this.end;
            }

            public final void setEnd(int i) {
                this.end = i;
            }

            public final String getTag() {
                return this.tag;
            }

            public static /* synthetic */ Range toRange$default(MutableRange mutableRange, int i, int i2, Object obj) {
                if ((i2 & 1) != 0) {
                    i = Integer.MIN_VALUE;
                }
                return mutableRange.toRange(i);
            }

            public final Range<T> toRange(int defaultEnd) {
                int end = this.end == Integer.MIN_VALUE ? defaultEnd : this.end;
                boolean value$iv = end != Integer.MIN_VALUE;
                if (!value$iv) {
                    InlineClassHelperKt.throwIllegalStateException("Item.end should be set first");
                }
                return new Range<>(this.item, this.start, end, this.tag);
            }

            public static /* synthetic */ Range toRange$default(MutableRange mutableRange, Function1 function1, int i, int i2, Object obj) {
                if ((i2 & 2) != 0) {
                    i = Integer.MIN_VALUE;
                }
                return mutableRange.toRange(function1, i);
            }

            public final <R> Range<R> toRange(Function1<? super T, ? extends R> function1, int defaultEnd) {
                int end = this.end == Integer.MIN_VALUE ? defaultEnd : this.end;
                boolean value$iv = end != Integer.MIN_VALUE;
                if (!value$iv) {
                    InlineClassHelperKt.throwIllegalStateException("Item.end should be set first");
                }
                return new Range<>(function1.invoke((T) this.item), this.start, end, this.tag);
            }

            /* compiled from: AnnotatedString.kt */
            @Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J \u0010\u0003\u001a\b\u0012\u0004\u0012\u0002H\u00050\u0004\"\u0004\b\u0001\u0010\u00052\f\u0010\u0006\u001a\b\u0012\u0004\u0012\u0002H\u00050\u0007¨\u0006\b"}, d2 = {"Landroidx/compose/ui/text/AnnotatedString$Builder$MutableRange$Companion;", "", "()V", "fromRange", "Landroidx/compose/ui/text/AnnotatedString$Builder$MutableRange;", ExifInterface.GPS_DIRECTION_TRUE, "range", "Landroidx/compose/ui/text/AnnotatedString$Range;", "ui-text_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
            /* loaded from: classes11.dex */
            public static final class Companion {
                public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
                    this();
                }

                private Companion() {
                }

                public final <T> MutableRange<T> fromRange(Range<T> range) {
                    return new MutableRange<>(range.getItem(), range.getStart(), range.getEnd(), range.getTag());
                }
            }
        }

        public Builder(String text) {
            this(0, 1, null);
            append(text);
        }

        public Builder(AnnotatedString text) {
            this(0, 1, null);
            append(text);
        }

        public final int getLength() {
            return this.text.length();
        }

        public final void append(String text) {
            this.text.append(text);
        }

        @Override // java.lang.Appendable
        public Builder append(CharSequence text) {
            if (text instanceof AnnotatedString) {
                append((AnnotatedString) text);
            } else {
                this.text.append(text);
            }
            return this;
        }

        @Override // java.lang.Appendable
        public Builder append(CharSequence text, int start, int end) {
            if (text instanceof AnnotatedString) {
                append((AnnotatedString) text, start, end);
            } else {
                this.text.append(text, start, end);
            }
            return this;
        }

        @Override // java.lang.Appendable
        public Builder append(char c) {
            this.text.append(c);
            return this;
        }

        public final void append(AnnotatedString text) {
            int start = this.text.length();
            this.text.append(text.getText());
            List $this$fastForEach$iv = text.getAnnotations$ui_text_release();
            if ($this$fastForEach$iv == null) {
                return;
            }
            int size = $this$fastForEach$iv.size();
            for (int index$iv = 0; index$iv < size; index$iv++) {
                Object item$iv = $this$fastForEach$iv.get(index$iv);
                Range it = (Range) item$iv;
                this.annotations.add(new MutableRange<>(it.getItem(), it.getStart() + start, it.getEnd() + start, it.getTag()));
            }
        }

        public final void append(AnnotatedString text, int start, int end) {
            int insertionStart = this.text.length();
            this.text.append((CharSequence) text.getText(), start, end);
            List $this$fastForEach$iv = AnnotatedStringKt.getLocalAnnotations$default(text, start, end, null, 4, null);
            if ($this$fastForEach$iv == null) {
                return;
            }
            int size = $this$fastForEach$iv.size();
            for (int index$iv = 0; index$iv < size; index$iv++) {
                Object item$iv = $this$fastForEach$iv.get(index$iv);
                Range it = (Range) item$iv;
                this.annotations.add(new MutableRange<>(it.getItem(), it.getStart() + insertionStart, it.getEnd() + insertionStart, it.getTag()));
            }
        }

        public final void addStyle(SpanStyle style, int start, int end) {
            this.annotations.add(new MutableRange<>(style, start, end, null, 8, null));
        }

        public final void addStyle(ParagraphStyle style, int start, int end) {
            this.annotations.add(new MutableRange<>(style, start, end, null, 8, null));
        }

        public final void addStringAnnotation(String tag, String annotation, int start, int end) {
            this.annotations.add(new MutableRange<>(StringAnnotation.m6287boximpl(StringAnnotation.m6288constructorimpl(annotation)), start, end, tag));
        }

        public final void addTtsAnnotation(TtsAnnotation ttsAnnotation, int start, int end) {
            this.annotations.add(new MutableRange<>(ttsAnnotation, start, end, null, 8, null));
        }

        @Deprecated(message = "Use LinkAnnotation API for links instead", replaceWith = @ReplaceWith(expression = "addLink(, start, end)", imports = {}))
        public final void addUrlAnnotation(UrlAnnotation urlAnnotation, int start, int end) {
            this.annotations.add(new MutableRange<>(urlAnnotation, start, end, null, 8, null));
        }

        public final void addLink(LinkAnnotation.Url url, int start, int end) {
            this.annotations.add(new MutableRange<>(url, start, end, null, 8, null));
        }

        public final void addLink(LinkAnnotation.Clickable clickable, int start, int end) {
            this.annotations.add(new MutableRange<>(clickable, start, end, null, 8, null));
        }

        public final void addBullet$ui_text_release(Bullet bullet, int start, int end) {
            this.annotations.add(new MutableRange<>(bullet, start, end, null, 8, null));
        }

        /* renamed from: addBullet-r9BaKPg$ui_text_release  reason: not valid java name */
        public final void m6170addBulletr9BaKPg$ui_text_release(Bullet bullet, long indentation, int start, int end) {
            ParagraphStyle bulletParStyle = new ParagraphStyle(0, 0, 0L, new TextIndent(indentation, indentation, null), (PlatformParagraphStyle) null, (LineHeightStyle) null, 0, 0, (TextMotion) null, (int) TypedValues.PositionType.TYPE_PERCENT_WIDTH, (DefaultConstructorMarker) null);
            this.annotations.add(new MutableRange<>(bulletParStyle, start, end, null, 8, null));
            this.annotations.add(new MutableRange<>(bullet, start, end, null, 8, null));
        }

        public final int pushStyle(SpanStyle style) {
            MutableRange it = new MutableRange(style, this.text.length(), 0, null, 12, null);
            this.styleStack.add(it);
            this.annotations.add(it);
            return this.styleStack.size() - 1;
        }

        public final int pushStyle(ParagraphStyle style) {
            MutableRange it = new MutableRange(style, this.text.length(), 0, null, 12, null);
            this.styleStack.add(it);
            this.annotations.add(it);
            return this.styleStack.size() - 1;
        }

        public final int pushBullet$ui_text_release(Bullet bullet) {
            MutableRange it = new MutableRange(bullet, this.text.length(), 0, null, 12, null);
            this.styleStack.add(it);
            this.annotations.add(it);
            return this.styleStack.size() - 1;
        }

        /* compiled from: AnnotatedString.kt */
        @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0000\u0018\u00002\u00020\u0001B\u000f\b\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004R\u0014\u0010\u0002\u001a\u00020\u0003X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006R&\u0010\u0007\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\n\u0012\u0004\u0012\u00020\u000b0\t0\bX\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u000e"}, d2 = {"Landroidx/compose/ui/text/AnnotatedString$Builder$BulletScope;", "", "builder", "Landroidx/compose/ui/text/AnnotatedString$Builder;", "(Landroidx/compose/ui/text/AnnotatedString$Builder;)V", "getBuilder$ui_text_release", "()Landroidx/compose/ui/text/AnnotatedString$Builder;", "bulletListSettingStack", "", "Lkotlin/Pair;", "Landroidx/compose/ui/unit/TextUnit;", "Landroidx/compose/ui/text/Bullet;", "getBulletListSettingStack$ui_text_release", "()Ljava/util/List;", "ui-text_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
        /* loaded from: classes11.dex */
        public static final class BulletScope {
            public static final int $stable = 8;
            private final Builder builder;
            private final List<Pair<TextUnit, Bullet>> bulletListSettingStack = new ArrayList();

            public BulletScope(Builder builder) {
                this.builder = builder;
            }

            public final Builder getBuilder$ui_text_release() {
                return this.builder;
            }

            public final List<Pair<TextUnit, Bullet>> getBulletListSettingStack$ui_text_release() {
                return this.bulletListSettingStack;
            }
        }

        /* renamed from: withBulletList-o2QH7mI$ui_text_release$default  reason: not valid java name */
        public static /* synthetic */ Object m6169withBulletListo2QH7mI$ui_text_release$default(Builder builder, long j, Bullet bullet, Function1 function1, int i, Object obj) {
            if ((i & 1) != 0) {
                j = BulletKt.getDefaultBulletIndentation();
            }
            if ((i & 2) != 0) {
                bullet = BulletKt.getDefaultBullet();
            }
            return builder.m6171withBulletListo2QH7mI$ui_text_release(j, bullet, function1);
        }

        /* renamed from: withBulletList-o2QH7mI$ui_text_release  reason: not valid java name */
        public final <R> R m6171withBulletListo2QH7mI$ui_text_release(long indentation, Bullet bullet, Function1<? super BulletScope, ? extends R> function1) {
            long j;
            Pair pair = (Pair) CollectionsKt.lastOrNull((List<? extends Object>) this.bulletScope.getBulletListSettingStack$ui_text_release());
            if (pair != null) {
                long it = ((TextUnit) pair.getFirst()).m7076unboximpl();
                boolean value$iv = TextUnitType.m7095equalsimpl0(TextUnit.m7066getTypeUIouoOA(it), TextUnit.m7066getTypeUIouoOA(indentation));
                if (!value$iv) {
                    InlineClassHelperKt.throwIllegalStateException("Indentation unit types of nested bullet lists must match. Current " + ((Object) TextUnit.m7074toStringimpl(it)) + " and previous is " + ((Object) TextUnit.m7074toStringimpl(indentation)));
                }
                long m7066getTypeUIouoOA = TextUnit.m7066getTypeUIouoOA(indentation);
                j = TextUnitType.m7095equalsimpl0(m7066getTypeUIouoOA, TextUnitType.Companion.m7100getSpUIouoOA()) ? TextUnitKt.getSp(TextUnit.m7067getValueimpl(indentation) + TextUnit.m7067getValueimpl(it)) : TextUnitType.m7095equalsimpl0(m7066getTypeUIouoOA, TextUnitType.Companion.m7099getEmUIouoOA()) ? TextUnitKt.getEm(TextUnit.m7067getValueimpl(indentation) + TextUnit.m7067getValueimpl(it)) : indentation;
            } else {
                j = indentation;
            }
            long adjustedIndentation = j;
            int parIndex = pushStyle(new ParagraphStyle(0, 0, 0L, new TextIndent(adjustedIndentation, adjustedIndentation, null), (PlatformParagraphStyle) null, (LineHeightStyle) null, 0, 0, (TextMotion) null, (int) TypedValues.PositionType.TYPE_PERCENT_WIDTH, (DefaultConstructorMarker) null));
            this.bulletScope.getBulletListSettingStack$ui_text_release().add(new Pair<>(TextUnit.m7057boximpl(adjustedIndentation), bullet));
            try {
                try {
                    R invoke = function1.invoke(this.bulletScope);
                    if (!this.bulletScope.getBulletListSettingStack$ui_text_release().isEmpty()) {
                        this.bulletScope.getBulletListSettingStack$ui_text_release().remove(CollectionsKt.getLastIndex(this.bulletScope.getBulletListSettingStack$ui_text_release()));
                    }
                    pop(parIndex);
                    return invoke;
                } catch (Throwable th) {
                    th = th;
                    if (!this.bulletScope.getBulletListSettingStack$ui_text_release().isEmpty()) {
                        this.bulletScope.getBulletListSettingStack$ui_text_release().remove(CollectionsKt.getLastIndex(this.bulletScope.getBulletListSettingStack$ui_text_release()));
                    }
                    pop(parIndex);
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
            }
        }

        public final int pushStringAnnotation(String tag, String annotation) {
            MutableRange it = new MutableRange(StringAnnotation.m6287boximpl(StringAnnotation.m6288constructorimpl(annotation)), this.text.length(), 0, tag, 4, null);
            this.styleStack.add(it);
            this.annotations.add(it);
            return this.styleStack.size() - 1;
        }

        public final int pushTtsAnnotation(TtsAnnotation ttsAnnotation) {
            MutableRange it = new MutableRange(ttsAnnotation, this.text.length(), 0, null, 12, null);
            this.styleStack.add(it);
            this.annotations.add(it);
            return this.styleStack.size() - 1;
        }

        @Deprecated(message = "Use LinkAnnotation API for links instead", replaceWith = @ReplaceWith(expression = "pushLink(, start, end)", imports = {}))
        public final int pushUrlAnnotation(UrlAnnotation urlAnnotation) {
            MutableRange it = new MutableRange(urlAnnotation, this.text.length(), 0, null, 12, null);
            this.styleStack.add(it);
            this.annotations.add(it);
            return this.styleStack.size() - 1;
        }

        public final int pushLink(LinkAnnotation link) {
            MutableRange it = new MutableRange(link, this.text.length(), 0, null, 12, null);
            this.styleStack.add(it);
            this.annotations.add(it);
            return this.styleStack.size() - 1;
        }

        public final void pop() {
            boolean value$iv = !this.styleStack.isEmpty();
            if (!value$iv) {
                InlineClassHelperKt.throwIllegalStateException("Nothing to pop.");
            }
            MutableRange item = this.styleStack.remove(this.styleStack.size() - 1);
            item.setEnd(this.text.length());
        }

        public final void pop(int index) {
            boolean value$iv = index < this.styleStack.size();
            if (!value$iv) {
                InlineClassHelperKt.throwIllegalStateException(index + " should be less than " + this.styleStack.size());
            }
            while (this.styleStack.size() - 1 >= index) {
                pop();
            }
        }

        public final AnnotatedString toAnnotatedString() {
            String sb = this.text.toString();
            List $this$fastMap$iv = this.annotations;
            List target$iv = new ArrayList($this$fastMap$iv.size());
            int size = $this$fastMap$iv.size();
            for (int index$iv$iv = 0; index$iv$iv < size; index$iv$iv++) {
                Object item$iv$iv = $this$fastMap$iv.get(index$iv$iv);
                MutableRange it = (MutableRange) item$iv$iv;
                target$iv.add(it.toRange(this.text.length()));
            }
            return new AnnotatedString(sb, target$iv);
        }

        public final void mapAnnotations$ui_text_release(Function1<? super Range<? extends Annotation>, ? extends Range<? extends Annotation>> function1) {
            int size = this.annotations.size();
            for (int i = 0; i < size; i++) {
                Range newAnnotation = function1.invoke(MutableRange.toRange$default(this.annotations.get(i), 0, 1, null));
                this.annotations.set(i, MutableRange.Companion.fromRange(newAnnotation));
            }
        }

        public final void flatMapAnnotations$ui_text_release(Function1<? super Range<? extends Annotation>, ? extends List<? extends Range<? extends Annotation>>> function1) {
            List $this$fastFlatMap$iv = this.annotations;
            boolean z = false;
            List target$iv = new ArrayList($this$fastFlatMap$iv.size());
            int index$iv$iv = 0;
            int size = $this$fastFlatMap$iv.size();
            while (index$iv$iv < size) {
                Object item$iv$iv = $this$fastFlatMap$iv.get(index$iv$iv);
                MutableRange annotation = (MutableRange) item$iv$iv;
                List invoke = function1.invoke(MutableRange.toRange$default(annotation, 0, 1, null));
                List $this$fastFlatMap$iv2 = $this$fastFlatMap$iv;
                boolean z2 = z;
                int $i$f$fastFlatMap = invoke.size();
                Iterable target$iv2 = new ArrayList($i$f$fastFlatMap);
                List $this$fastForEach$iv$iv = invoke;
                int size2 = $this$fastForEach$iv$iv.size();
                ArrayList target$iv3 = target$iv;
                int index$iv$iv2 = 0;
                while (index$iv$iv2 < size2) {
                    Object item$iv$iv2 = $this$fastForEach$iv$iv.get(index$iv$iv2);
                    List $this$fastForEach$iv$iv2 = $this$fastForEach$iv$iv;
                    Range it = (Range) item$iv$iv2;
                    ((Collection) target$iv2).add(MutableRange.Companion.fromRange(it));
                    index$iv$iv2++;
                    size2 = size2;
                    $this$fastForEach$iv$iv = $this$fastForEach$iv$iv2;
                }
                Iterable list$iv = (List) target$iv2;
                CollectionsKt.addAll(target$iv3, list$iv);
                index$iv$iv++;
                $this$fastFlatMap$iv = $this$fastFlatMap$iv2;
                z = z2;
                target$iv = target$iv3;
            }
            List replacedAnnotations = target$iv;
            this.annotations.clear();
            this.annotations.addAll(replacedAnnotations);
        }
    }

    /* compiled from: AnnotatedString.kt */
    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002R\u001b\u0010\u0003\u001a\f\u0012\u0004\u0012\u00020\u0005\u0012\u0002\b\u00030\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\b"}, d2 = {"Landroidx/compose/ui/text/AnnotatedString$Companion;", "", "()V", "Saver", "Landroidx/compose/runtime/saveable/Saver;", "Landroidx/compose/ui/text/AnnotatedString;", "getSaver", "()Landroidx/compose/runtime/saveable/Saver;", "ui-text_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        public final Saver<AnnotatedString, ?> getSaver() {
            return AnnotatedString.Saver;
        }
    }
}
