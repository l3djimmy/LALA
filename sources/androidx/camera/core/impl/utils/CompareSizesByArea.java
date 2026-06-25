package androidx.camera.core.impl.utils;

import android.util.Size;
import java.util.Comparator;
/* loaded from: classes.dex */
public final class CompareSizesByArea implements Comparator<Size> {
    private boolean mReverse;

    public CompareSizesByArea() {
        this(false);
    }

    public CompareSizesByArea(boolean reverse) {
        this.mReverse = false;
        this.mReverse = reverse;
    }

    @Override // java.util.Comparator
    public int compare(Size lhs, Size rhs) {
        int result = Long.signum((lhs.getWidth() * lhs.getHeight()) - (rhs.getWidth() * rhs.getHeight()));
        if (this.mReverse) {
            return result * (-1);
        }
        return result;
    }
}
