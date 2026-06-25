package androidx.camera.core.internal.compat;

import android.media.ImageWriter;
import android.view.Surface;
/* loaded from: classes.dex */
final class ImageWriterCompatApi29Impl {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static ImageWriter newInstance(Surface surface, int maxImages, int format) {
        return ImageWriter.newInstance(surface, maxImages, format);
    }

    private ImageWriterCompatApi29Impl() {
    }
}
