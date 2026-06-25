package androidx.camera.view;

import android.graphics.Matrix;
import android.graphics.PointF;
import android.util.Size;
import androidx.camera.core.MeteringPointFactory;
import androidx.camera.core.impl.utils.Threads;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class PreviewViewMeteringPointFactory extends MeteringPointFactory {
    static final PointF INVALID_POINT = new PointF(2.0f, 2.0f);
    private Matrix mMatrix;
    private final PreviewTransformation mPreviewTransformation;

    /* JADX INFO: Access modifiers changed from: package-private */
    public PreviewViewMeteringPointFactory(PreviewTransformation previewTransformation) {
        this.mPreviewTransformation = previewTransformation;
    }

    @Override // androidx.camera.core.MeteringPointFactory
    protected PointF convertPoint(float x, float y) {
        float[] point = {x, y};
        synchronized (this) {
            if (this.mMatrix == null) {
                return INVALID_POINT;
            }
            this.mMatrix.mapPoints(point);
            return new PointF(point[0], point[1]);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void recalculate(Size previewViewSize, int layoutDirection) {
        Threads.checkMainThread();
        synchronized (this) {
            if (previewViewSize.getWidth() != 0 && previewViewSize.getHeight() != 0) {
                this.mMatrix = this.mPreviewTransformation.getPreviewViewToNormalizedSurfaceMatrix(previewViewSize, layoutDirection);
                return;
            }
            this.mMatrix = null;
        }
    }
}
