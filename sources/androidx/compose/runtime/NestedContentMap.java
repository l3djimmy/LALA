package androidx.compose.runtime;

import androidx.collection.MutableObjectList;
import androidx.collection.MutableScatterMap;
import androidx.collection.ObjectList;
import androidx.compose.runtime.collection.MultiValueMap;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: Recomposer.kt */
@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0002\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002J\u001e\u0010\n\u001a\u00020\u000b2\u000e\u0010\f\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u00062\u0006\u0010\r\u001a\u00020\tJ\u0006\u0010\u000e\u001a\u00020\u000bJ\u0019\u0010\u000f\u001a\u00020\u00102\u000e\u0010\u0011\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0006H\u0086\u0002J\u0018\u0010\u0012\u001a\u0004\u0018\u00010\t2\u000e\u0010\u0011\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0006J\u000e\u0010\u0013\u001a\u00020\u000b2\u0006\u0010\u0014\u001a\u00020\u0005R*\u0010\u0003\u001a\u0016\u0012\u0004\u0012\u00020\u0005\u0012\f\u0012\n\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u00060\u0004X\u0082\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u0007R*\u0010\b\u001a\u0016\u0012\f\u0012\n\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0006\u0012\u0004\u0012\u00020\t0\u0004X\u0082\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u0007\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006\u0015"}, d2 = {"Landroidx/compose/runtime/NestedContentMap;", "", "()V", "containerMap", "Landroidx/compose/runtime/collection/MultiValueMap;", "Landroidx/compose/runtime/MovableContentStateReference;", "Landroidx/compose/runtime/MovableContent;", "Landroidx/collection/MutableScatterMap;", "contentMap", "Landroidx/compose/runtime/NestedMovableContent;", "add", "", "content", "nestedContent", "clear", "contains", "", "key", "removeLast", "usedContainer", TypedValues.Custom.S_REFERENCE, "runtime_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class NestedContentMap {
    private final MutableScatterMap<Object, Object> contentMap = MultiValueMap.m3810constructorimpl$default(null, 1, null);
    private final MutableScatterMap<Object, Object> containerMap = MultiValueMap.m3810constructorimpl$default(null, 1, null);

    public final void add(MovableContent<Object> movableContent, NestedMovableContent nestedContent) {
        MultiValueMap.m3806addimpl(this.contentMap, movableContent, nestedContent);
        MultiValueMap.m3806addimpl(this.containerMap, nestedContent.getContainer(), movableContent);
    }

    public final void clear() {
        MultiValueMap.m3808clearimpl(this.contentMap);
        MultiValueMap.m3808clearimpl(this.containerMap);
    }

    public final NestedMovableContent removeLast(MovableContent<Object> movableContent) {
        Object m3820removeLastimpl = MultiValueMap.m3820removeLastimpl(this.contentMap, movableContent);
        NestedMovableContent nestedMovableContent = (NestedMovableContent) m3820removeLastimpl;
        if (MultiValueMap.m3817isEmptyimpl(this.contentMap)) {
            MultiValueMap.m3808clearimpl(this.containerMap);
        }
        return (NestedMovableContent) m3820removeLastimpl;
    }

    public final boolean contains(MovableContent<Object> movableContent) {
        return MultiValueMap.m3811containsimpl(this.contentMap, movableContent);
    }

    public final void usedContainer(final MovableContentStateReference reference) {
        MutableScatterMap arg0$iv = this.containerMap;
        boolean z = false;
        Object it$iv = arg0$iv.get(reference);
        if (it$iv == null) {
            return;
        }
        if (!(it$iv instanceof MutableObjectList)) {
            Intrinsics.checkNotNull(it$iv, "null cannot be cast to non-null type V of androidx.compose.runtime.collection.MultiValueMap");
            MovableContent value = (MovableContent) it$iv;
            MultiValueMap.m3821removeValueIfimpl(this.contentMap, value, new Function1<NestedMovableContent, Boolean>() { // from class: androidx.compose.runtime.NestedContentMap$usedContainer$1$1
                /* JADX INFO: Access modifiers changed from: package-private */
                {
                    super(1);
                }

                @Override // kotlin.jvm.functions.Function1
                public final Boolean invoke(NestedMovableContent it) {
                    return Boolean.valueOf(Intrinsics.areEqual(it.getContainer(), MovableContentStateReference.this));
                }
            });
            return;
        }
        ObjectList this_$iv$iv = (ObjectList) it$iv;
        Object[] content$iv$iv = this_$iv$iv.content;
        int i$iv$iv = 0;
        int i = this_$iv$iv._size;
        while (i$iv$iv < i) {
            Object value$iv = content$iv$iv[i$iv$iv];
            Intrinsics.checkNotNull(value$iv, "null cannot be cast to non-null type V of androidx.compose.runtime.collection.MultiValueMap");
            MovableContent value2 = (MovableContent) value$iv;
            MultiValueMap.m3821removeValueIfimpl(this.contentMap, value2, new Function1<NestedMovableContent, Boolean>() { // from class: androidx.compose.runtime.NestedContentMap$usedContainer$1$1
                /* JADX INFO: Access modifiers changed from: package-private */
                {
                    super(1);
                }

                @Override // kotlin.jvm.functions.Function1
                public final Boolean invoke(NestedMovableContent it) {
                    return Boolean.valueOf(Intrinsics.areEqual(it.getContainer(), MovableContentStateReference.this));
                }
            });
            i$iv$iv++;
            arg0$iv = arg0$iv;
            z = z;
        }
    }
}
