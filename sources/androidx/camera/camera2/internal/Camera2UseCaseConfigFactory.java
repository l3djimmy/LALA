package androidx.camera.camera2.internal;

import android.content.Context;
import android.util.Size;
import androidx.camera.core.impl.CaptureConfig;
import androidx.camera.core.impl.Config;
import androidx.camera.core.impl.ImageOutputConfig;
import androidx.camera.core.impl.MutableOptionsBundle;
import androidx.camera.core.impl.OptionsBundle;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.camera.core.impl.UseCaseConfigFactory;
/* loaded from: classes.dex */
public final class Camera2UseCaseConfigFactory implements UseCaseConfigFactory {
    final DisplayInfoManager mDisplayInfoManager;

    public Camera2UseCaseConfigFactory(Context context) {
        this.mDisplayInfoManager = DisplayInfoManager.getInstance(context);
    }

    @Override // androidx.camera.core.impl.UseCaseConfigFactory
    public Config getConfig(UseCaseConfigFactory.CaptureType captureType, int captureMode) {
        MutableOptionsBundle mutableConfig = MutableOptionsBundle.create();
        SessionConfig.Builder sessionBuilder = new SessionConfig.Builder();
        sessionBuilder.setTemplateType(TemplateTypeUtil.getSessionConfigTemplateType(captureType, captureMode));
        mutableConfig.insertOption(UseCaseConfig.OPTION_DEFAULT_SESSION_CONFIG, sessionBuilder.build());
        mutableConfig.insertOption(UseCaseConfig.OPTION_SESSION_CONFIG_UNPACKER, Camera2SessionOptionUnpacker.INSTANCE);
        CaptureConfig.Builder captureBuilder = new CaptureConfig.Builder();
        captureBuilder.setTemplateType(TemplateTypeUtil.getCaptureConfigTemplateType(captureType, captureMode));
        mutableConfig.insertOption(UseCaseConfig.OPTION_DEFAULT_CAPTURE_CONFIG, captureBuilder.build());
        mutableConfig.insertOption(UseCaseConfig.OPTION_CAPTURE_CONFIG_UNPACKER, captureType == UseCaseConfigFactory.CaptureType.IMAGE_CAPTURE ? ImageCaptureOptionUnpacker.INSTANCE : Camera2CaptureOptionUnpacker.INSTANCE);
        if (captureType == UseCaseConfigFactory.CaptureType.PREVIEW) {
            Size previewSize = this.mDisplayInfoManager.getPreviewSize();
            mutableConfig.insertOption(ImageOutputConfig.OPTION_MAX_RESOLUTION, previewSize);
        }
        int targetRotation = this.mDisplayInfoManager.getMaxSizeDisplay(true).getRotation();
        mutableConfig.insertOption(ImageOutputConfig.OPTION_TARGET_ROTATION, Integer.valueOf(targetRotation));
        if (captureType == UseCaseConfigFactory.CaptureType.VIDEO_CAPTURE || captureType == UseCaseConfigFactory.CaptureType.STREAM_SHARING) {
            mutableConfig.insertOption(UseCaseConfig.OPTION_ZSL_DISABLED, true);
        }
        return OptionsBundle.from(mutableConfig);
    }
}
