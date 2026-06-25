package androidx.camera.camera2.internal;

import androidx.camera.core.impl.UseCaseConfigFactory;
/* loaded from: classes.dex */
public class TemplateTypeUtil {
    private TemplateTypeUtil() {
    }

    public static int getSessionConfigTemplateType(UseCaseConfigFactory.CaptureType captureType, int captureMode) {
        switch (captureType) {
            case IMAGE_CAPTURE:
                return captureMode == 2 ? 5 : 1;
            case VIDEO_CAPTURE:
            case STREAM_SHARING:
                return 3;
            default:
                return 1;
        }
    }

    public static int getCaptureConfigTemplateType(UseCaseConfigFactory.CaptureType captureType, int captureMode) {
        switch (captureType) {
            case IMAGE_CAPTURE:
                if (captureMode != 2) {
                    return 2;
                }
                return 5;
            case VIDEO_CAPTURE:
            case STREAM_SHARING:
                return 3;
            default:
                return 1;
        }
    }
}
