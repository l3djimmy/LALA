package androidx.collection;

import java.lang.reflect.Array;
/* loaded from: classes.dex */
class ArraySetJvmUtil {
    private ArraySetJvmUtil() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static <T> T[] resizeForToArray(T[] destination, int size) {
        if (destination.length < size) {
            return (T[]) ((Object[]) Array.newInstance(destination.getClass().getComponentType(), size));
        }
        if (destination.length > size) {
            destination[size] = null;
        }
        return destination;
    }
}
