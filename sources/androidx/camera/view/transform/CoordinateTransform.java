package androidx.camera.view.transform;

import android.graphics.Matrix;
import android.graphics.PointF;
import android.graphics.RectF;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.utils.TransformUtils;
import androidx.core.util.Preconditions;
/* loaded from: classes.dex */
public final class CoordinateTransform {
    private static final String MISMATCH_MSG = "The source viewport (%s) does not match the target viewport (%s). Please make sure they are associated with the same Viewport.";
    private static final String TAG = "CoordinateTransform";
    private final Matrix mMatrix;

    public CoordinateTransform(OutputTransform source, OutputTransform target) {
        if (!TransformUtils.isAspectRatioMatchingWithRoundingError(source.getViewPortSize(), target.getViewPortSize())) {
            Logger.w(TAG, String.format(MISMATCH_MSG, source.getViewPortSize(), target.getViewPortSize()));
        }
        this.mMatrix = new Matrix();
        Preconditions.checkState(source.getMatrix().invert(this.mMatrix), "The source transform cannot be inverted");
        this.mMatrix.postConcat(target.getMatrix());
    }

    public void transform(Matrix outMatrix) {
        outMatrix.set(this.mMatrix);
    }

    public void mapPoints(float[] points) {
        this.mMatrix.mapPoints(points);
    }

    public void mapPoint(PointF point) {
        float[] pointArray = {point.x, point.y};
        this.mMatrix.mapPoints(pointArray);
        point.x = pointArray[0];
        point.y = pointArray[1];
    }

    public void mapRect(RectF rect) {
        this.mMatrix.mapRect(rect);
    }
}
