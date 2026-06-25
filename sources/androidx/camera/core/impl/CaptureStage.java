package androidx.camera.core.impl;

import androidx.camera.core.impl.CaptureConfig;
/* loaded from: classes.dex */
public interface CaptureStage {
    CaptureConfig getCaptureConfig();

    int getId();

    /* loaded from: classes.dex */
    public static final class DefaultCaptureStage implements CaptureStage {
        private final CaptureConfig mCaptureConfig;

        public DefaultCaptureStage() {
            CaptureConfig.Builder builder = new CaptureConfig.Builder();
            this.mCaptureConfig = builder.build();
        }

        @Override // androidx.camera.core.impl.CaptureStage
        public int getId() {
            return 0;
        }

        @Override // androidx.camera.core.impl.CaptureStage
        public CaptureConfig getCaptureConfig() {
            return this.mCaptureConfig;
        }
    }
}
