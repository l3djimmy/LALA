package androidx.camera.core;

import android.media.ImageReader;
import androidx.camera.core.impl.ImageReaderProxy;
/* loaded from: classes.dex */
public final class ImageReaderProxys {
    private ImageReaderProxys() {
    }

    public static ImageReaderProxy createIsolatedReader(int width, int height, int format, int maxImages) {
        ImageReader imageReader = ImageReader.newInstance(width, height, format, maxImages);
        return new AndroidImageReaderProxy(imageReader);
    }
}
