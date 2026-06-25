package androidx.camera.core.impl;

import android.util.Size;
import androidx.camera.core.internal.utils.SizeUtil;
/* loaded from: classes.dex */
public abstract class SurfaceConfig {
    public static final long DEFAULT_STREAM_USE_CASE_VALUE = 0;

    /* loaded from: classes.dex */
    public enum ConfigType {
        PRIV,
        YUV,
        JPEG,
        RAW
    }

    public abstract ConfigSize getConfigSize();

    public abstract ConfigType getConfigType();

    public abstract long getStreamUseCase();

    public static SurfaceConfig create(ConfigType type, ConfigSize size) {
        return new AutoValue_SurfaceConfig(type, size, 0L);
    }

    public static SurfaceConfig create(ConfigType type, ConfigSize size, long streamUseCase) {
        return new AutoValue_SurfaceConfig(type, size, streamUseCase);
    }

    public final boolean isSupported(SurfaceConfig surfaceConfig) {
        ConfigType configType = surfaceConfig.getConfigType();
        ConfigSize configSize = surfaceConfig.getConfigSize();
        if (configSize.getId() > getConfigSize().getId() || configType != getConfigType()) {
            return false;
        }
        return true;
    }

    public static ConfigType getConfigType(int imageFormat) {
        if (imageFormat == 35) {
            return ConfigType.YUV;
        }
        if (imageFormat == 256) {
            return ConfigType.JPEG;
        }
        if (imageFormat == 32) {
            return ConfigType.RAW;
        }
        return ConfigType.PRIV;
    }

    public static SurfaceConfig transformSurfaceConfig(int cameraMode, int imageFormat, Size size, SurfaceSizeDefinition surfaceSizeDefinition) {
        ConfigType configType = getConfigType(imageFormat);
        ConfigSize configSize = ConfigSize.NOT_SUPPORT;
        int sizeArea = SizeUtil.getArea(size);
        if (cameraMode == 1) {
            if (sizeArea <= SizeUtil.getArea(surfaceSizeDefinition.getS720pSize(imageFormat))) {
                configSize = ConfigSize.s720p;
            } else if (sizeArea <= SizeUtil.getArea(surfaceSizeDefinition.getS1440pSize(imageFormat))) {
                configSize = ConfigSize.s1440p;
            }
        } else if (sizeArea <= SizeUtil.getArea(surfaceSizeDefinition.getAnalysisSize())) {
            configSize = ConfigSize.VGA;
        } else if (sizeArea <= SizeUtil.getArea(surfaceSizeDefinition.getPreviewSize())) {
            configSize = ConfigSize.PREVIEW;
        } else if (sizeArea <= SizeUtil.getArea(surfaceSizeDefinition.getRecordSize())) {
            configSize = ConfigSize.RECORD;
        } else if (sizeArea <= SizeUtil.getArea(surfaceSizeDefinition.getMaximumSize(imageFormat))) {
            configSize = ConfigSize.MAXIMUM;
        } else {
            Size ultraMaximumSize = surfaceSizeDefinition.getUltraMaximumSize(imageFormat);
            if (ultraMaximumSize != null && sizeArea <= SizeUtil.getArea(ultraMaximumSize)) {
                configSize = ConfigSize.ULTRA_MAXIMUM;
            }
        }
        return create(configType, configSize);
    }

    /* loaded from: classes.dex */
    public enum ConfigSize {
        VGA(0),
        s720p(1),
        PREVIEW(2),
        s1440p(3),
        RECORD(4),
        MAXIMUM(5),
        ULTRA_MAXIMUM(6),
        NOT_SUPPORT(7);
        
        final int mId;

        ConfigSize(int id) {
            this.mId = id;
        }

        int getId() {
            return this.mId;
        }
    }
}
