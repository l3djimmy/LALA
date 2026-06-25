package androidx.camera.core.processing;

import android.opengl.EGLSurface;
import androidx.camera.core.processing.OpenGlRenderer;
/* loaded from: classes.dex */
final class AutoValue_OpenGlRenderer_OutputSurface extends OpenGlRenderer.OutputSurface {
    private final EGLSurface eglSurface;
    private final int height;
    private final int width;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_OpenGlRenderer_OutputSurface(EGLSurface eglSurface, int width, int height) {
        if (eglSurface == null) {
            throw new NullPointerException("Null eglSurface");
        }
        this.eglSurface = eglSurface;
        this.width = width;
        this.height = height;
    }

    @Override // androidx.camera.core.processing.OpenGlRenderer.OutputSurface
    EGLSurface getEglSurface() {
        return this.eglSurface;
    }

    @Override // androidx.camera.core.processing.OpenGlRenderer.OutputSurface
    int getWidth() {
        return this.width;
    }

    @Override // androidx.camera.core.processing.OpenGlRenderer.OutputSurface
    int getHeight() {
        return this.height;
    }

    public String toString() {
        return "OutputSurface{eglSurface=" + this.eglSurface + ", width=" + this.width + ", height=" + this.height + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof OpenGlRenderer.OutputSurface) {
            OpenGlRenderer.OutputSurface that = (OpenGlRenderer.OutputSurface) o;
            return this.eglSurface.equals(that.getEglSurface()) && this.width == that.getWidth() && this.height == that.getHeight();
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((h$ ^ this.eglSurface.hashCode()) * 1000003) ^ this.width) * 1000003) ^ this.height;
    }
}
