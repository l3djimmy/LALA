package androidx.camera.camera2.internal.compat.quirk;

import android.os.Build;
import android.util.Range;
import android.util.Size;
import androidx.camera.core.impl.Quirk;
import androidx.camera.core.impl.SurfaceConfig;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
/* loaded from: classes.dex */
public class ExtraCroppingQuirk implements Quirk {
    private static final Map<String, Range<Integer>> SAMSUNG_DISTORTION_MODELS_TO_API_LEVEL_MAP = new HashMap();

    static {
        SAMSUNG_DISTORTION_MODELS_TO_API_LEVEL_MAP.put("SM-T580", null);
        SAMSUNG_DISTORTION_MODELS_TO_API_LEVEL_MAP.put("SM-J710MN", new Range<>(21, 26));
        SAMSUNG_DISTORTION_MODELS_TO_API_LEVEL_MAP.put("SM-A320FL", null);
        SAMSUNG_DISTORTION_MODELS_TO_API_LEVEL_MAP.put("SM-G570M", null);
        SAMSUNG_DISTORTION_MODELS_TO_API_LEVEL_MAP.put("SM-G610F", null);
        SAMSUNG_DISTORTION_MODELS_TO_API_LEVEL_MAP.put("SM-G610M", new Range<>(21, 26));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean load() {
        return isSamsungDistortion();
    }

    public Size getVerifiedResolution(SurfaceConfig.ConfigType configType) {
        if (isSamsungDistortion()) {
            switch (configType) {
                case PRIV:
                    return new Size(1920, 1080);
                case YUV:
                    return new Size(1280, 720);
                case JPEG:
                    return new Size(3264, 1836);
                default:
                    return null;
            }
        }
        return null;
    }

    private static boolean isSamsungDistortion() {
        boolean isDeviceModelContained = "samsung".equalsIgnoreCase(Build.BRAND) && SAMSUNG_DISTORTION_MODELS_TO_API_LEVEL_MAP.containsKey(Build.MODEL.toUpperCase(Locale.US));
        if (isDeviceModelContained) {
            Range<Integer> apiLevelRange = SAMSUNG_DISTORTION_MODELS_TO_API_LEVEL_MAP.get(Build.MODEL.toUpperCase(Locale.US));
            if (apiLevelRange == null) {
                return true;
            }
            return apiLevelRange.contains((Range<Integer>) Integer.valueOf(Build.VERSION.SDK_INT));
        }
        return false;
    }
}
