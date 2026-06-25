package androidx.camera.camera2.internal.compat.workaround;

import androidx.camera.camera2.internal.compat.quirk.DeviceQuirks;
import androidx.camera.camera2.internal.compat.quirk.StillCaptureFlashStopRepeatingQuirk;
/* loaded from: classes.dex */
public class StillCaptureFlow {
    private final boolean mShouldStopRepeatingBeforeStillCapture;

    public StillCaptureFlow() {
        StillCaptureFlashStopRepeatingQuirk quirk = (StillCaptureFlashStopRepeatingQuirk) DeviceQuirks.get(StillCaptureFlashStopRepeatingQuirk.class);
        this.mShouldStopRepeatingBeforeStillCapture = quirk != null;
    }

    /* JADX WARN: Removed duplicated region for block: B:9:0x0012  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean shouldStopRepeatingBeforeCapture(java.util.List<android.hardware.camera2.CaptureRequest> r6, boolean r7) {
        /*
            r5 = this;
            boolean r0 = r5.mShouldStopRepeatingBeforeStillCapture
            r1 = 0
            if (r0 == 0) goto L2f
            if (r7 != 0) goto L8
            goto L2f
        L8:
            java.util.Iterator r0 = r6.iterator()
        Lc:
            boolean r2 = r0.hasNext()
            if (r2 == 0) goto L2e
            java.lang.Object r2 = r0.next()
            android.hardware.camera2.CaptureRequest r2 = (android.hardware.camera2.CaptureRequest) r2
            android.hardware.camera2.CaptureRequest$Key r3 = android.hardware.camera2.CaptureRequest.CONTROL_AE_MODE
            java.lang.Object r3 = r2.get(r3)
            java.lang.Integer r3 = (java.lang.Integer) r3
            int r3 = r3.intValue()
            r4 = 2
            if (r3 == r4) goto L2c
            r4 = 3
            if (r3 != r4) goto L2b
            goto L2c
        L2b:
            goto Lc
        L2c:
            r0 = 1
            return r0
        L2e:
            return r1
        L2f:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.camera.camera2.internal.compat.workaround.StillCaptureFlow.shouldStopRepeatingBeforeCapture(java.util.List, boolean):boolean");
    }
}
