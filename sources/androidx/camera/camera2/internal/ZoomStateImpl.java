package androidx.camera.camera2.internal;

import androidx.camera.core.ZoomState;
import androidx.core.math.MathUtils;
/* loaded from: classes.dex */
class ZoomStateImpl implements ZoomState {
    private float mLinearZoom;
    private final float mMaxZoomRatio;
    private final float mMinZoomRatio;
    private float mZoomRatio;

    /* JADX INFO: Access modifiers changed from: package-private */
    public ZoomStateImpl(float maxZoomRatio, float minZoomRatio) {
        this.mMaxZoomRatio = maxZoomRatio;
        this.mMinZoomRatio = minZoomRatio;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setZoomRatio(float zoomRatio) throws IllegalArgumentException {
        if (zoomRatio > this.mMaxZoomRatio || zoomRatio < this.mMinZoomRatio) {
            String outOfRangeDesc = "Requested zoomRatio " + zoomRatio + " is not within valid range [" + this.mMinZoomRatio + " , " + this.mMaxZoomRatio + "]";
            throw new IllegalArgumentException(outOfRangeDesc);
        }
        this.mZoomRatio = zoomRatio;
        this.mLinearZoom = getPercentageByRatio(this.mZoomRatio);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setLinearZoom(float linearZoom) throws IllegalArgumentException {
        if (linearZoom > 1.0f || linearZoom < 0.0f) {
            String outOfRangeDesc = "Requested linearZoom " + linearZoom + " is not within valid range [0..1]";
            throw new IllegalArgumentException(outOfRangeDesc);
        }
        this.mLinearZoom = linearZoom;
        this.mZoomRatio = getRatioByPercentage(this.mLinearZoom);
    }

    @Override // androidx.camera.core.ZoomState
    public float getZoomRatio() {
        return this.mZoomRatio;
    }

    @Override // androidx.camera.core.ZoomState
    public float getMaxZoomRatio() {
        return this.mMaxZoomRatio;
    }

    @Override // androidx.camera.core.ZoomState
    public float getMinZoomRatio() {
        return this.mMinZoomRatio;
    }

    @Override // androidx.camera.core.ZoomState
    public float getLinearZoom() {
        return this.mLinearZoom;
    }

    private float getRatioByPercentage(float percentage) {
        if (percentage == 1.0f) {
            return this.mMaxZoomRatio;
        }
        if (percentage == 0.0f) {
            return this.mMinZoomRatio;
        }
        double cropWidthInMaxZoom = 1.0f / this.mMaxZoomRatio;
        double cropWidthInMinZoom = 1.0f / this.mMinZoomRatio;
        double cropWidth = ((cropWidthInMaxZoom - cropWidthInMinZoom) * percentage) + cropWidthInMinZoom;
        double ratio = 1.0d / cropWidth;
        return (float) MathUtils.clamp(ratio, this.mMinZoomRatio, this.mMaxZoomRatio);
    }

    private float getPercentageByRatio(float ratio) {
        if (this.mMaxZoomRatio == this.mMinZoomRatio) {
            return 0.0f;
        }
        if (ratio == this.mMaxZoomRatio) {
            return 1.0f;
        }
        if (ratio == this.mMinZoomRatio) {
            return 0.0f;
        }
        float cropWidth = 1.0f / ratio;
        float cropWidthInMaxZoom = 1.0f / this.mMaxZoomRatio;
        float cropWidthInMinZoom = 1.0f / this.mMinZoomRatio;
        return (cropWidth - cropWidthInMinZoom) / (cropWidthInMaxZoom - cropWidthInMinZoom);
    }
}
