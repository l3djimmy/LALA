package androidx.camera.core.internal.utils;

import android.util.Size;
import androidx.camera.core.impl.utils.CompareSizesByArea;
import com.itextpdf.io.codec.TIFFConstants;
import java.util.Collections;
import java.util.List;
/* loaded from: classes.dex */
public final class SizeUtil {
    public static final Size RESOLUTION_ZERO = new Size(0, 0);
    public static final Size RESOLUTION_QVGA = new Size(TIFFConstants.TIFFTAG_COLORMAP, 240);
    public static final Size RESOLUTION_VGA = new Size(640, 480);
    public static final Size RESOLUTION_480P = new Size(720, 480);
    public static final Size RESOLUTION_720P = new Size(1280, 720);
    public static final Size RESOLUTION_1080P = new Size(1920, 1080);
    public static final Size RESOLUTION_1440P = new Size(1920, 1440);

    private SizeUtil() {
    }

    public static int getArea(Size size) {
        return size.getWidth() * size.getHeight();
    }

    public static boolean isSmallerByArea(Size sourceSize, Size targetSize) {
        return getArea(sourceSize) < getArea(targetSize);
    }

    public static boolean isLongerInAnyEdge(Size sourceSize, Size targetSize) {
        return sourceSize.getWidth() > targetSize.getWidth() || sourceSize.getHeight() > targetSize.getHeight();
    }

    public static Size getMaxSize(List<Size> sizeList) {
        if (sizeList.isEmpty()) {
            return null;
        }
        return (Size) Collections.max(sizeList, new CompareSizesByArea());
    }
}
