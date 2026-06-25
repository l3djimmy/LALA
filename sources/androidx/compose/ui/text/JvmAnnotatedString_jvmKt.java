package androidx.compose.ui.text;

import androidx.compose.ui.text.AnnotatedString;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.SortedSet;
import java.util.TreeSet;
import kotlin.Metadata;
import kotlin.TuplesKt;
import kotlin.collections.CollectionsKt;
import kotlin.collections.MapsKt;
import kotlin.collections.SetsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
/* compiled from: JvmAnnotatedString.jvm.kt */
@Metadata(d1 = {"\u0000*\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\u001a*\u0010\u0000\u001a\u00020\u00012\u0012\u0010\u0002\u001a\u000e\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u0004\u0018\u00010\u00032\f\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006H\u0002\u001a,\u0010\b\u001a\u00020\t*\u00020\t2\u001e\u0010\b\u001a\u001a\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\u000b0\nH\u0000¨\u0006\f"}, d2 = {"collectRangeTransitions", "", "ranges", "", "Landroidx/compose/ui/text/AnnotatedString$Range;", TypedValues.AttributesType.S_TARGET, "Ljava/util/SortedSet;", "", "transform", "Landroidx/compose/ui/text/AnnotatedString;", "Lkotlin/Function3;", "", "ui-text_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class JvmAnnotatedString_jvmKt {
    public static final AnnotatedString transform(final AnnotatedString $this$transform, final Function3<? super String, ? super Integer, ? super Integer, String> function3) {
        ArrayList newAnnotations;
        TreeSet transitions = SetsKt.sortedSetOf(0, Integer.valueOf($this$transform.getText().length()));
        collectRangeTransitions($this$transform.getAnnotations$ui_text_release(), transitions);
        final Ref.ObjectRef resultStr = new Ref.ObjectRef();
        resultStr.element = "";
        final Map offsetMap = MapsKt.mutableMapOf(TuplesKt.to(0, 0));
        CollectionsKt.windowed$default(transitions, 2, 0, false, new Function1<List<? extends Integer>, Integer>() { // from class: androidx.compose.ui.text.JvmAnnotatedString_jvmKt$transform$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            /* JADX WARN: Multi-variable type inference failed */
            {
                super(1);
            }

            /* JADX WARN: Type inference failed for: r2v3, types: [T, java.lang.String] */
            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final Integer invoke2(List<Integer> list) {
                int start = list.get(0).intValue();
                int end = list.get(1).intValue();
                resultStr.element += function3.invoke($this$transform.getText(), Integer.valueOf(start), Integer.valueOf(end));
                return offsetMap.put(Integer.valueOf(end), Integer.valueOf(resultStr.element.length()));
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Integer invoke(List<? extends Integer> list) {
                return invoke2((List<Integer>) list);
            }
        }, 6, null);
        List $this$fastMap$iv = $this$transform.getAnnotations$ui_text_release();
        if ($this$fastMap$iv != null) {
            boolean z = false;
            ArrayList target$iv = new ArrayList($this$fastMap$iv.size());
            int index$iv$iv = 0;
            int size = $this$fastMap$iv.size();
            while (index$iv$iv < size) {
                AnnotatedString.Range item$iv$iv = $this$fastMap$iv.get(index$iv$iv);
                AnnotatedString.Range it = item$iv$iv;
                List $this$fastMap$iv2 = $this$fastMap$iv;
                AnnotatedString.Annotation item = it.getItem();
                boolean z2 = z;
                Object obj = offsetMap.get(Integer.valueOf(it.getStart()));
                Intrinsics.checkNotNull(obj);
                int intValue = ((Number) obj).intValue();
                ArrayList target$iv2 = target$iv;
                Object obj2 = offsetMap.get(Integer.valueOf(it.getEnd()));
                Intrinsics.checkNotNull(obj2);
                target$iv.add(new AnnotatedString.Range(item, intValue, ((Number) obj2).intValue()));
                index$iv$iv++;
                transitions = transitions;
                $this$fastMap$iv = $this$fastMap$iv2;
                z = z2;
                target$iv = target$iv2;
            }
            newAnnotations = target$iv;
        } else {
            newAnnotations = null;
        }
        return new AnnotatedString(newAnnotations, (String) resultStr.element);
    }

    private static final void collectRangeTransitions(List<? extends AnnotatedString.Range<?>> list, SortedSet<Integer> sortedSet) {
        if (list == null) {
            return;
        }
        int size = list.size();
        for (int index$iv$iv = 0; index$iv$iv < size; index$iv$iv++) {
            AnnotatedString.Range item$iv$iv = list.get(index$iv$iv);
            AnnotatedString.Range range = item$iv$iv;
            sortedSet.add(Integer.valueOf(range.getStart()));
            sortedSet.add(Integer.valueOf(range.getEnd()));
        }
    }
}
