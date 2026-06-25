package androidx.camera.camera2.internal;

import android.hardware.camera2.CameraCharacteristics;
import android.os.Build;
import androidx.camera.camera2.impl.Camera2ImplConfig;
import androidx.camera.camera2.internal.SupportedSurfaceCombination;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.AttachedSurfaceInfo;
import androidx.camera.core.impl.Config;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.ImageCaptureConfig;
import androidx.camera.core.impl.MutableOptionsBundle;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.StreamSpec;
import androidx.camera.core.impl.SurfaceConfig;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.camera.core.impl.UseCaseConfigFactory;
import androidx.camera.core.streamsharing.StreamSharingConfig;
import androidx.core.util.Preconditions;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
/* loaded from: classes.dex */
public final class StreamUseCaseUtil {
    public static final Config.Option<Long> STREAM_USE_CASE_STREAM_SPEC_OPTION = Config.Option.create("camera2.streamSpec.streamUseCase", Long.TYPE);
    private static final Map<Long, Set<UseCaseConfigFactory.CaptureType>> STREAM_USE_CASE_TO_ELIGIBLE_CAPTURE_TYPES_MAP = new HashMap();
    private static final Map<Long, Set<UseCaseConfigFactory.CaptureType>> STREAM_USE_CASE_TO_ELIGIBLE_STREAM_SHARING_CHILDREN_TYPES_MAP = new HashMap();
    private static final String TAG = "Camera2CameraImpl";

    static {
        if (Build.VERSION.SDK_INT >= 33) {
            Set<UseCaseConfigFactory.CaptureType> captureTypes = new HashSet<>();
            captureTypes.add(UseCaseConfigFactory.CaptureType.PREVIEW);
            STREAM_USE_CASE_TO_ELIGIBLE_CAPTURE_TYPES_MAP.put(4L, captureTypes);
            Set<UseCaseConfigFactory.CaptureType> captureTypes2 = new HashSet<>();
            captureTypes2.add(UseCaseConfigFactory.CaptureType.PREVIEW);
            captureTypes2.add(UseCaseConfigFactory.CaptureType.IMAGE_ANALYSIS);
            STREAM_USE_CASE_TO_ELIGIBLE_CAPTURE_TYPES_MAP.put(1L, captureTypes2);
            Set<UseCaseConfigFactory.CaptureType> captureTypes3 = new HashSet<>();
            captureTypes3.add(UseCaseConfigFactory.CaptureType.IMAGE_CAPTURE);
            STREAM_USE_CASE_TO_ELIGIBLE_CAPTURE_TYPES_MAP.put(2L, captureTypes3);
            Set<UseCaseConfigFactory.CaptureType> captureTypes4 = new HashSet<>();
            captureTypes4.add(UseCaseConfigFactory.CaptureType.VIDEO_CAPTURE);
            STREAM_USE_CASE_TO_ELIGIBLE_CAPTURE_TYPES_MAP.put(3L, captureTypes4);
            Set<UseCaseConfigFactory.CaptureType> captureTypes5 = new HashSet<>();
            captureTypes5.add(UseCaseConfigFactory.CaptureType.PREVIEW);
            captureTypes5.add(UseCaseConfigFactory.CaptureType.IMAGE_CAPTURE);
            captureTypes5.add(UseCaseConfigFactory.CaptureType.VIDEO_CAPTURE);
            STREAM_USE_CASE_TO_ELIGIBLE_STREAM_SHARING_CHILDREN_TYPES_MAP.put(4L, captureTypes5);
            Set<UseCaseConfigFactory.CaptureType> captureTypes6 = new HashSet<>();
            captureTypes6.add(UseCaseConfigFactory.CaptureType.PREVIEW);
            captureTypes6.add(UseCaseConfigFactory.CaptureType.VIDEO_CAPTURE);
            STREAM_USE_CASE_TO_ELIGIBLE_STREAM_SHARING_CHILDREN_TYPES_MAP.put(3L, captureTypes6);
        }
    }

    private StreamUseCaseUtil() {
    }

    public static void populateSurfaceToStreamUseCaseMapping(Collection<SessionConfig> sessionConfigs, Collection<UseCaseConfig<?>> useCaseConfigs, Map<DeferrableSurface, Long> streamUseCaseMap) {
        int position = 0;
        boolean hasStreamUseCase = false;
        ArrayList<UseCaseConfig<?>> useCaseConfigArrayList = new ArrayList<>(useCaseConfigs);
        Iterator<SessionConfig> it = sessionConfigs.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            SessionConfig sessionConfig = it.next();
            if (sessionConfig.getImplementationOptions().containsOption(STREAM_USE_CASE_STREAM_SPEC_OPTION) && sessionConfig.getSurfaces().size() != 1) {
                Logger.e(TAG, String.format("SessionConfig has stream use case but also contains %d surfaces, abort populateSurfaceToStreamUseCaseMapping().", Integer.valueOf(sessionConfig.getSurfaces().size())));
                return;
            } else if (sessionConfig.getImplementationOptions().containsOption(STREAM_USE_CASE_STREAM_SPEC_OPTION)) {
                hasStreamUseCase = true;
                break;
            }
        }
        if (hasStreamUseCase) {
            for (SessionConfig sessionConfig2 : sessionConfigs) {
                if (useCaseConfigArrayList.get(position).getCaptureType() == UseCaseConfigFactory.CaptureType.METERING_REPEATING) {
                    streamUseCaseMap.put(sessionConfig2.getSurfaces().get(0), 1L);
                } else if (sessionConfig2.getImplementationOptions().containsOption(STREAM_USE_CASE_STREAM_SPEC_OPTION)) {
                    streamUseCaseMap.put(sessionConfig2.getSurfaces().get(0), (Long) sessionConfig2.getImplementationOptions().retrieveOption(STREAM_USE_CASE_STREAM_SPEC_OPTION));
                }
                position++;
            }
        }
    }

    public static Camera2ImplConfig getStreamSpecImplementationOptions(UseCaseConfig<?> useCaseConfig) {
        MutableOptionsBundle optionsBundle = MutableOptionsBundle.create();
        if (useCaseConfig.containsOption(Camera2ImplConfig.STREAM_USE_CASE_OPTION)) {
            optionsBundle.insertOption(Camera2ImplConfig.STREAM_USE_CASE_OPTION, (Long) useCaseConfig.retrieveOption(Camera2ImplConfig.STREAM_USE_CASE_OPTION));
        }
        if (useCaseConfig.containsOption(UseCaseConfig.OPTION_ZSL_DISABLED)) {
            optionsBundle.insertOption(UseCaseConfig.OPTION_ZSL_DISABLED, (Boolean) useCaseConfig.retrieveOption(UseCaseConfig.OPTION_ZSL_DISABLED));
        }
        if (useCaseConfig.containsOption(ImageCaptureConfig.OPTION_IMAGE_CAPTURE_MODE)) {
            optionsBundle.insertOption(ImageCaptureConfig.OPTION_IMAGE_CAPTURE_MODE, (Integer) useCaseConfig.retrieveOption(ImageCaptureConfig.OPTION_IMAGE_CAPTURE_MODE));
        }
        if (useCaseConfig.containsOption(UseCaseConfig.OPTION_INPUT_FORMAT)) {
            optionsBundle.insertOption(UseCaseConfig.OPTION_INPUT_FORMAT, (Integer) useCaseConfig.retrieveOption(UseCaseConfig.OPTION_INPUT_FORMAT));
        }
        return new Camera2ImplConfig(optionsBundle);
    }

    public static boolean isStreamUseCaseSupported(CameraCharacteristicsCompat characteristicsCompat) {
        long[] availableStreamUseCases;
        return (Build.VERSION.SDK_INT < 33 || (availableStreamUseCases = (long[]) characteristicsCompat.get(CameraCharacteristics.SCALER_AVAILABLE_STREAM_USE_CASES)) == null || availableStreamUseCases.length == 0) ? false : true;
    }

    public static boolean shouldUseStreamUseCase(SupportedSurfaceCombination.FeatureSettings featureSettings) {
        return featureSettings.getCameraMode() == 0 && featureSettings.getRequiredMaxBitDepth() == 8;
    }

    public static boolean populateStreamUseCaseStreamSpecOptionWithInteropOverride(CameraCharacteristicsCompat characteristicsCompat, List<AttachedSurfaceInfo> attachedSurfaces, Map<UseCaseConfig<?>, StreamSpec> suggestedStreamSpecMap, Map<AttachedSurfaceInfo, StreamSpec> attachedSurfaceStreamSpecMap) {
        if (Build.VERSION.SDK_INT < 33) {
            return false;
        }
        List<UseCaseConfig<?>> newUseCaseConfigs = new ArrayList<>(suggestedStreamSpecMap.keySet());
        for (AttachedSurfaceInfo attachedSurfaceInfo : attachedSurfaces) {
            Preconditions.checkNotNull(attachedSurfaceInfo.getImplementationOptions());
        }
        for (UseCaseConfig<?> useCaseConfig : newUseCaseConfigs) {
            Preconditions.checkNotNull(((StreamSpec) Preconditions.checkNotNull(suggestedStreamSpecMap.get(useCaseConfig))).getImplementationOptions());
        }
        long[] availableStreamUseCases = (long[]) characteristicsCompat.get(CameraCharacteristics.SCALER_AVAILABLE_STREAM_USE_CASES);
        if (availableStreamUseCases == null || availableStreamUseCases.length == 0) {
            return false;
        }
        Set<Long> availableStreamUseCaseSet = new HashSet<>();
        for (long j : availableStreamUseCases) {
            Long availableStreamUseCase = Long.valueOf(j);
            availableStreamUseCaseSet.add(availableStreamUseCase);
        }
        if (isValidCamera2InteropOverride(attachedSurfaces, newUseCaseConfigs, availableStreamUseCaseSet)) {
            for (AttachedSurfaceInfo attachedSurfaceInfo2 : attachedSurfaces) {
                Config oldImplementationOptions = attachedSurfaceInfo2.getImplementationOptions();
                Config newImplementationOptions = getUpdatedImplementationOptionsWithUseCaseStreamSpecOption(oldImplementationOptions, ((Long) oldImplementationOptions.retrieveOption(Camera2ImplConfig.STREAM_USE_CASE_OPTION)).longValue());
                if (newImplementationOptions != null) {
                    attachedSurfaceStreamSpecMap.put(attachedSurfaceInfo2, attachedSurfaceInfo2.toStreamSpec(newImplementationOptions));
                }
            }
            for (UseCaseConfig<?> newUseCaseConfig : newUseCaseConfigs) {
                StreamSpec oldStreamSpec = suggestedStreamSpecMap.get(newUseCaseConfig);
                Config oldImplementationOptions2 = oldStreamSpec.getImplementationOptions();
                Config newImplementationOptions2 = getUpdatedImplementationOptionsWithUseCaseStreamSpecOption(oldImplementationOptions2, ((Long) oldImplementationOptions2.retrieveOption(Camera2ImplConfig.STREAM_USE_CASE_OPTION)).longValue());
                if (newImplementationOptions2 != null) {
                    StreamSpec newStreamSpec = oldStreamSpec.toBuilder().setImplementationOptions(newImplementationOptions2).build();
                    suggestedStreamSpecMap.put(newUseCaseConfig, newStreamSpec);
                }
            }
            return true;
        }
        return false;
    }

    public static boolean areStreamUseCasesAvailableForSurfaceConfigs(CameraCharacteristicsCompat characteristicsCompat, List<SurfaceConfig> surfaceConfigs) {
        long[] availableStreamUseCases;
        if (Build.VERSION.SDK_INT < 33 || (availableStreamUseCases = (long[]) characteristicsCompat.get(CameraCharacteristics.SCALER_AVAILABLE_STREAM_USE_CASES)) == null || availableStreamUseCases.length == 0) {
            return false;
        }
        Set<Long> availableStreamUseCaseSet = new HashSet<>();
        for (long j : availableStreamUseCases) {
            Long availableStreamUseCase = Long.valueOf(j);
            availableStreamUseCaseSet.add(availableStreamUseCase);
        }
        for (SurfaceConfig surfaceConfig : surfaceConfigs) {
            if (!availableStreamUseCaseSet.contains(Long.valueOf(surfaceConfig.getStreamUseCase()))) {
                return false;
            }
        }
        return true;
    }

    private static boolean isEligibleCaptureType(UseCaseConfigFactory.CaptureType captureType, long streamUseCase, List<UseCaseConfigFactory.CaptureType> streamSharingTypes) {
        if (Build.VERSION.SDK_INT < 33) {
            return false;
        }
        if (captureType != UseCaseConfigFactory.CaptureType.STREAM_SHARING) {
            return STREAM_USE_CASE_TO_ELIGIBLE_CAPTURE_TYPES_MAP.containsKey(Long.valueOf(streamUseCase)) && STREAM_USE_CASE_TO_ELIGIBLE_CAPTURE_TYPES_MAP.get(Long.valueOf(streamUseCase)).contains(captureType);
        } else if (STREAM_USE_CASE_TO_ELIGIBLE_STREAM_SHARING_CHILDREN_TYPES_MAP.containsKey(Long.valueOf(streamUseCase))) {
            Set<UseCaseConfigFactory.CaptureType> captureTypes = STREAM_USE_CASE_TO_ELIGIBLE_STREAM_SHARING_CHILDREN_TYPES_MAP.get(Long.valueOf(streamUseCase));
            if (streamSharingTypes.size() != captureTypes.size()) {
                return false;
            }
            for (UseCaseConfigFactory.CaptureType childType : streamSharingTypes) {
                if (!captureTypes.contains(childType)) {
                    return false;
                }
            }
            return true;
        } else {
            return false;
        }
    }

    public static boolean areCaptureTypesEligible(Map<Integer, AttachedSurfaceInfo> surfaceConfigIndexAttachedSurfaceInfoMap, Map<Integer, UseCaseConfig<?>> surfaceConfigIndexUseCaseConfigMap, List<SurfaceConfig> surfaceConfigsWithStreamUseCase) {
        List<UseCaseConfigFactory.CaptureType> emptyList;
        UseCaseConfigFactory.CaptureType captureType;
        for (int i = 0; i < surfaceConfigsWithStreamUseCase.size(); i++) {
            long streamUseCase = surfaceConfigsWithStreamUseCase.get(i).getStreamUseCase();
            if (surfaceConfigIndexAttachedSurfaceInfoMap.containsKey(Integer.valueOf(i))) {
                AttachedSurfaceInfo attachedSurfaceInfo = surfaceConfigIndexAttachedSurfaceInfoMap.get(Integer.valueOf(i));
                if (attachedSurfaceInfo.getCaptureTypes().size() == 1) {
                    captureType = attachedSurfaceInfo.getCaptureTypes().get(0);
                } else {
                    captureType = UseCaseConfigFactory.CaptureType.STREAM_SHARING;
                }
                if (!isEligibleCaptureType(captureType, streamUseCase, attachedSurfaceInfo.getCaptureTypes())) {
                    return false;
                }
            } else if (surfaceConfigIndexUseCaseConfigMap.containsKey(Integer.valueOf(i))) {
                UseCaseConfig<?> newUseCaseConfig = surfaceConfigIndexUseCaseConfigMap.get(Integer.valueOf(i));
                UseCaseConfigFactory.CaptureType captureType2 = newUseCaseConfig.getCaptureType();
                if (newUseCaseConfig.getCaptureType() == UseCaseConfigFactory.CaptureType.STREAM_SHARING) {
                    emptyList = ((StreamSharingConfig) newUseCaseConfig).getCaptureTypes();
                } else {
                    emptyList = Collections.emptyList();
                }
                if (!isEligibleCaptureType(captureType2, streamUseCase, emptyList)) {
                    return false;
                }
            } else {
                throw new AssertionError("SurfaceConfig does not map to any use case");
            }
        }
        return true;
    }

    public static void populateStreamUseCaseStreamSpecOptionWithSupportedSurfaceConfigs(Map<UseCaseConfig<?>, StreamSpec> suggestedStreamSpecMap, Map<AttachedSurfaceInfo, StreamSpec> attachedSurfaceStreamSpecMap, Map<Integer, AttachedSurfaceInfo> surfaceConfigIndexAttachedSurfaceInfoMap, Map<Integer, UseCaseConfig<?>> surfaceConfigIndexUseCaseConfigMap, List<SurfaceConfig> surfaceConfigsWithStreamUseCase) {
        for (int i = 0; i < surfaceConfigsWithStreamUseCase.size(); i++) {
            long streamUseCase = surfaceConfigsWithStreamUseCase.get(i).getStreamUseCase();
            if (surfaceConfigIndexAttachedSurfaceInfoMap.containsKey(Integer.valueOf(i))) {
                AttachedSurfaceInfo attachedSurfaceInfo = surfaceConfigIndexAttachedSurfaceInfoMap.get(Integer.valueOf(i));
                Config oldImplementationOptions = attachedSurfaceInfo.getImplementationOptions();
                Config newImplementationOptions = getUpdatedImplementationOptionsWithUseCaseStreamSpecOption(oldImplementationOptions, streamUseCase);
                if (newImplementationOptions != null) {
                    attachedSurfaceStreamSpecMap.put(attachedSurfaceInfo, attachedSurfaceInfo.toStreamSpec(newImplementationOptions));
                }
            } else if (surfaceConfigIndexUseCaseConfigMap.containsKey(Integer.valueOf(i))) {
                UseCaseConfig<?> newUseCaseConfig = surfaceConfigIndexUseCaseConfigMap.get(Integer.valueOf(i));
                StreamSpec oldStreamSpec = suggestedStreamSpecMap.get(newUseCaseConfig);
                Config oldImplementationOptions2 = oldStreamSpec.getImplementationOptions();
                Config newImplementationOptions2 = getUpdatedImplementationOptionsWithUseCaseStreamSpecOption(oldImplementationOptions2, streamUseCase);
                if (newImplementationOptions2 != null) {
                    StreamSpec newStreamSpec = oldStreamSpec.toBuilder().setImplementationOptions(newImplementationOptions2).build();
                    suggestedStreamSpecMap.put(newUseCaseConfig, newStreamSpec);
                }
            } else {
                throw new AssertionError("SurfaceConfig does not map to any use case");
            }
        }
    }

    private static Config getUpdatedImplementationOptionsWithUseCaseStreamSpecOption(Config oldImplementationOptions, long streamUseCase) {
        if (oldImplementationOptions.containsOption(STREAM_USE_CASE_STREAM_SPEC_OPTION) && ((Long) oldImplementationOptions.retrieveOption(STREAM_USE_CASE_STREAM_SPEC_OPTION)).longValue() == streamUseCase) {
            return null;
        }
        MutableOptionsBundle optionsBundle = MutableOptionsBundle.from(oldImplementationOptions);
        optionsBundle.insertOption(STREAM_USE_CASE_STREAM_SPEC_OPTION, Long.valueOf(streamUseCase));
        return new Camera2ImplConfig(optionsBundle);
    }

    public static boolean containsZslUseCase(List<AttachedSurfaceInfo> attachedSurfaces, List<UseCaseConfig<?>> newUseCaseConfigs) {
        for (AttachedSurfaceInfo attachedSurfaceInfo : attachedSurfaces) {
            List<UseCaseConfigFactory.CaptureType> captureTypes = attachedSurfaceInfo.getCaptureTypes();
            UseCaseConfigFactory.CaptureType captureType = captureTypes.get(0);
            if (isZslUseCase(attachedSurfaceInfo.getImplementationOptions(), captureType)) {
                return true;
            }
        }
        for (UseCaseConfig<?> useCaseConfig : newUseCaseConfigs) {
            if (isZslUseCase(useCaseConfig, useCaseConfig.getCaptureType())) {
                return true;
            }
        }
        return false;
    }

    private static boolean isZslUseCase(Config config, UseCaseConfigFactory.CaptureType captureType) {
        if (!((Boolean) config.retrieveOption(UseCaseConfig.OPTION_ZSL_DISABLED, false)).booleanValue() && config.containsOption(ImageCaptureConfig.OPTION_IMAGE_CAPTURE_MODE)) {
            int captureMode = ((Integer) config.retrieveOption(ImageCaptureConfig.OPTION_IMAGE_CAPTURE_MODE)).intValue();
            return TemplateTypeUtil.getSessionConfigTemplateType(captureType, captureMode) == 5;
        }
        return false;
    }

    private static boolean areStreamUseCasesAvailable(Set<Long> availableStreamUseCasesSet, Set<Long> streamUseCases) {
        for (Long streamUseCase : streamUseCases) {
            if (!availableStreamUseCasesSet.contains(streamUseCase)) {
                return false;
            }
        }
        return true;
    }

    private static void throwInvalidCamera2InteropOverrideException() {
        throw new IllegalArgumentException("Either all use cases must have non-default stream use case assigned or none should have it");
    }

    private static boolean isValidCamera2InteropOverride(List<AttachedSurfaceInfo> attachedSurfaces, List<UseCaseConfig<?>> newUseCaseConfigs, Set<Long> availableStreamUseCases) {
        Set<Long> streamUseCases = new HashSet<>();
        boolean hasNonDefaultStreamUseCase = false;
        boolean hasDefaultOrNullStreamUseCase = false;
        Iterator<AttachedSurfaceInfo> it = attachedSurfaces.iterator();
        if (it.hasNext()) {
            AttachedSurfaceInfo attachedSurfaceInfo = it.next();
            if (!attachedSurfaceInfo.getImplementationOptions().containsOption(Camera2ImplConfig.STREAM_USE_CASE_OPTION)) {
                hasDefaultOrNullStreamUseCase = true;
            } else if (((Long) attachedSurfaceInfo.getImplementationOptions().retrieveOption(Camera2ImplConfig.STREAM_USE_CASE_OPTION)).longValue() == 0) {
                hasDefaultOrNullStreamUseCase = true;
            } else {
                hasNonDefaultStreamUseCase = true;
            }
        }
        for (UseCaseConfig<?> useCaseConfig : newUseCaseConfigs) {
            if (!useCaseConfig.containsOption(Camera2ImplConfig.STREAM_USE_CASE_OPTION)) {
                hasDefaultOrNullStreamUseCase = true;
                if (hasNonDefaultStreamUseCase) {
                    throwInvalidCamera2InteropOverrideException();
                }
            } else {
                long streamUseCaseOverride = ((Long) useCaseConfig.retrieveOption(Camera2ImplConfig.STREAM_USE_CASE_OPTION)).longValue();
                if (streamUseCaseOverride == 0) {
                    hasDefaultOrNullStreamUseCase = true;
                    if (hasNonDefaultStreamUseCase) {
                        throwInvalidCamera2InteropOverrideException();
                    }
                } else {
                    hasNonDefaultStreamUseCase = true;
                    if (hasDefaultOrNullStreamUseCase) {
                        throwInvalidCamera2InteropOverrideException();
                    }
                    streamUseCases.add(Long.valueOf(streamUseCaseOverride));
                }
            }
        }
        return !hasDefaultOrNullStreamUseCase && areStreamUseCasesAvailable(availableStreamUseCases, streamUseCases);
    }
}
