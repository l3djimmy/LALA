package androidx.camera.camera2.internal;

import androidx.camera.core.SafeCloseImageReaderProxy;
import com.android.tools.r8.annotations.LambdaMethod;
import com.android.tools.r8.annotations.SynthesizedClassV2;
/* compiled from: D8$$SyntheticClass */
@LambdaMethod(holder = "Landroidx/camera/core/SafeCloseImageReaderProxy;", method = "safeClose", proto = "()V")
@SynthesizedClassV2(apiLevel = -2, kind = 19, versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1")
/* loaded from: classes.dex */
public final /* synthetic */ class ZslControlImpl$$ExternalSyntheticLambda0 implements Runnable {
    public final /* synthetic */ SafeCloseImageReaderProxy f$0;

    public /* synthetic */ ZslControlImpl$$ExternalSyntheticLambda0(SafeCloseImageReaderProxy safeCloseImageReaderProxy) {
        this.f$0 = safeCloseImageReaderProxy;
    }

    @Override // java.lang.Runnable
    public final void run() {
        ZslControlImpl.$r8$lambda$TUxZVHRXbKIIvwcobeYpqdAnw2s(this.f$0);
    }
}
