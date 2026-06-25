package androidx.camera.core;

import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: classes.dex */
final class SingleCloseImageProxy extends ForwardingImageProxy {
    private final AtomicBoolean mClosed;

    /* JADX INFO: Access modifiers changed from: package-private */
    public SingleCloseImageProxy(ImageProxy image) {
        super(image);
        this.mClosed = new AtomicBoolean(false);
    }

    @Override // androidx.camera.core.ForwardingImageProxy, androidx.camera.core.ImageProxy, java.lang.AutoCloseable
    public void close() {
        if (!this.mClosed.getAndSet(true)) {
            super.close();
        }
    }
}
