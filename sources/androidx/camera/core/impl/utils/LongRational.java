package androidx.camera.core.impl.utils;

import com.google.android.gms.location.DeviceOrientationRequest;
/* loaded from: classes.dex */
final class LongRational {
    private final long mDenominator;
    private final long mNumerator;

    /* JADX INFO: Access modifiers changed from: package-private */
    public LongRational(long nominator, long denominator) {
        this.mNumerator = nominator;
        this.mDenominator = denominator;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public LongRational(double value) {
        this((long) (10000.0d * value), DeviceOrientationRequest.OUTPUT_PERIOD_MEDIUM);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public long getNumerator() {
        return this.mNumerator;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public long getDenominator() {
        return this.mDenominator;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public double toDouble() {
        return this.mNumerator / this.mDenominator;
    }

    public String toString() {
        return this.mNumerator + "/" + this.mDenominator;
    }
}
