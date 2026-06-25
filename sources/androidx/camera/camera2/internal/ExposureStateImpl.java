package androidx.camera.camera2.internal;

import android.hardware.camera2.CameraCharacteristics;
import android.util.Range;
import android.util.Rational;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.core.ExposureState;
/* loaded from: classes.dex */
class ExposureStateImpl implements ExposureState {
    private final CameraCharacteristicsCompat mCameraCharacteristics;
    private int mExposureCompensation;
    private final Object mLock = new Object();

    /* JADX INFO: Access modifiers changed from: package-private */
    public ExposureStateImpl(CameraCharacteristicsCompat characteristics, int exposureCompensation) {
        this.mCameraCharacteristics = characteristics;
        this.mExposureCompensation = exposureCompensation;
    }

    @Override // androidx.camera.core.ExposureState
    public int getExposureCompensationIndex() {
        int i;
        synchronized (this.mLock) {
            i = this.mExposureCompensation;
        }
        return i;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setExposureCompensationIndex(int value) {
        synchronized (this.mLock) {
            this.mExposureCompensation = value;
        }
    }

    @Override // androidx.camera.core.ExposureState
    public Range<Integer> getExposureCompensationRange() {
        return (Range) this.mCameraCharacteristics.get(CameraCharacteristics.CONTROL_AE_COMPENSATION_RANGE);
    }

    @Override // androidx.camera.core.ExposureState
    public Rational getExposureCompensationStep() {
        if (!isExposureCompensationSupported()) {
            return Rational.ZERO;
        }
        return (Rational) this.mCameraCharacteristics.get(CameraCharacteristics.CONTROL_AE_COMPENSATION_STEP);
    }

    @Override // androidx.camera.core.ExposureState
    public boolean isExposureCompensationSupported() {
        Range<Integer> compensationRange = (Range) this.mCameraCharacteristics.get(CameraCharacteristics.CONTROL_AE_COMPENSATION_RANGE);
        return (compensationRange == null || compensationRange.getLower().intValue() == 0 || compensationRange.getUpper().intValue() == 0) ? false : true;
    }
}
