package androidx.compose.runtime.snapshots;

import androidx.autofill.HintConstants;
import androidx.compose.runtime.external.kotlinx.collections.immutable.ExtensionsKt;
import androidx.compose.runtime.external.kotlinx.collections.immutable.PersistentList;
import androidx.exifinterface.media.ExifInterface;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;
/* compiled from: SnapshotStateList.kt */
@Metadata(d1 = {"\u00000\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0001\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0000\u001a=\u0010\u0002\u001a\b\u0012\u0004\u0012\u0002H\u00040\u0003\"\u0004\b\u0000\u0010\u00042\u0006\u0010\u0005\u001a\u00020\u00062!\u0010\u0007\u001a\u001d\u0012\u0013\u0012\u00110\u0006¢\u0006\f\b\t\u0012\b\b\n\u0012\u0004\b\b(\u000b\u0012\u0004\u0012\u0002H\u00040\b\u001a\b\u0010\f\u001a\u00020\rH\u0002\u001a\b\u0010\u000e\u001a\u00020\rH\u0002\u001a\u0018\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u000b\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0006H\u0002\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0011"}, d2 = {"sync", "", "SnapshotStateList", "Landroidx/compose/runtime/snapshots/SnapshotStateList;", ExifInterface.GPS_DIRECTION_TRUE, "size", "", "init", "Lkotlin/Function1;", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "index", "invalidIteratorSet", "", "modificationError", "validateRange", "", "runtime_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class SnapshotStateListKt {
    private static final Object sync = new Object();

    public static final <T> SnapshotStateList<T> SnapshotStateList(int size, Function1<? super Integer, ? extends T> function1) {
        if (size == 0) {
            return new SnapshotStateList<>();
        }
        PersistentList.Builder builder = ExtensionsKt.persistentListOf().builder();
        for (int i = 0; i < size; i++) {
            builder.add(function1.invoke(Integer.valueOf(i)));
        }
        return new SnapshotStateList<>(builder.build());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Void modificationError() {
        throw new IllegalStateException("Cannot modify a state list through an iterator".toString());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void validateRange(int index, int size) {
        boolean z = false;
        if (index >= 0 && index < size) {
            z = true;
        }
        if (!z) {
            throw new IndexOutOfBoundsException("index (" + index + ") is out of bound of [0, " + size + ')');
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Void invalidIteratorSet() {
        throw new IllegalStateException("Cannot call set before the first call to next() or previous() or immediately after a call to add() or remove()".toString());
    }
}
