package androidx.camera.camera2.internal.compat;

import android.graphics.SurfaceTexture;
import android.hardware.camera2.params.StreamConfigurationMap;
import android.util.Size;
import androidx.camera.camera2.internal.compat.StreamConfigurationMapCompat;
/* loaded from: classes.dex */
class StreamConfigurationMapCompatBaseImpl implements StreamConfigurationMapCompat.StreamConfigurationMapCompatImpl {
    final StreamConfigurationMap mStreamConfigurationMap;

    /* JADX INFO: Access modifiers changed from: package-private */
    public StreamConfigurationMapCompatBaseImpl(StreamConfigurationMap map) {
        this.mStreamConfigurationMap = map;
    }

    @Override // androidx.camera.camera2.internal.compat.StreamConfigurationMapCompat.StreamConfigurationMapCompatImpl
    public Size[] getOutputSizes(int format) {
        StreamConfigurationMap streamConfigurationMap = this.mStreamConfigurationMap;
        if (format == 34) {
            Size[] sizes = streamConfigurationMap.getOutputSizes(SurfaceTexture.class);
            return sizes;
        }
        Size[] sizes2 = streamConfigurationMap.getOutputSizes(format);
        return sizes2;
    }

    @Override // androidx.camera.camera2.internal.compat.StreamConfigurationMapCompat.StreamConfigurationMapCompatImpl
    public <T> Size[] getOutputSizes(Class<T> klass) {
        return this.mStreamConfigurationMap.getOutputSizes(klass);
    }

    @Override // androidx.camera.camera2.internal.compat.StreamConfigurationMapCompat.StreamConfigurationMapCompatImpl
    public Size[] getHighResolutionOutputSizes(int format) {
        return Api23Impl.getHighResolutionOutputSizes(this.mStreamConfigurationMap, format);
    }

    @Override // androidx.camera.camera2.internal.compat.StreamConfigurationMapCompat.StreamConfigurationMapCompatImpl
    public StreamConfigurationMap unwrap() {
        return this.mStreamConfigurationMap;
    }

    /* loaded from: classes.dex */
    static class Api23Impl {
        private Api23Impl() {
        }

        static Size[] getHighResolutionOutputSizes(StreamConfigurationMap streamConfigurationMap, int format) {
            return streamConfigurationMap.getHighResolutionOutputSizes(format);
        }
    }
}
