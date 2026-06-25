package androidx.camera.core.impl;

import androidx.camera.core.impl.SurfaceConfig;
/* loaded from: classes.dex */
final class AutoValue_SurfaceConfig extends SurfaceConfig {
    private final SurfaceConfig.ConfigSize configSize;
    private final SurfaceConfig.ConfigType configType;
    private final long streamUseCase;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_SurfaceConfig(SurfaceConfig.ConfigType configType, SurfaceConfig.ConfigSize configSize, long streamUseCase) {
        if (configType == null) {
            throw new NullPointerException("Null configType");
        }
        this.configType = configType;
        if (configSize == null) {
            throw new NullPointerException("Null configSize");
        }
        this.configSize = configSize;
        this.streamUseCase = streamUseCase;
    }

    @Override // androidx.camera.core.impl.SurfaceConfig
    public SurfaceConfig.ConfigType getConfigType() {
        return this.configType;
    }

    @Override // androidx.camera.core.impl.SurfaceConfig
    public SurfaceConfig.ConfigSize getConfigSize() {
        return this.configSize;
    }

    @Override // androidx.camera.core.impl.SurfaceConfig
    public long getStreamUseCase() {
        return this.streamUseCase;
    }

    public String toString() {
        return "SurfaceConfig{configType=" + this.configType + ", configSize=" + this.configSize + ", streamUseCase=" + this.streamUseCase + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof SurfaceConfig) {
            SurfaceConfig that = (SurfaceConfig) o;
            return this.configType.equals(that.getConfigType()) && this.configSize.equals(that.getConfigSize()) && this.streamUseCase == that.getStreamUseCase();
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((h$ ^ this.configType.hashCode()) * 1000003) ^ this.configSize.hashCode()) * 1000003) ^ ((int) ((this.streamUseCase >>> 32) ^ this.streamUseCase));
    }
}
