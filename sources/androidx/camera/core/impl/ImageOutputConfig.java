package androidx.camera.core.impl;

import android.util.Pair;
import android.util.Size;
import androidx.camera.core.AspectRatio;
import androidx.camera.core.impl.Config;
import androidx.camera.core.resolutionselector.ResolutionSelector;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Objects;
/* loaded from: classes.dex */
public interface ImageOutputConfig extends ReadableConfig {
    public static final int INVALID_ROTATION = -1;
    public static final int ROTATION_NOT_SPECIFIED = -1;
    public static final Config.Option<Integer> OPTION_TARGET_ASPECT_RATIO = Config.Option.create("camerax.core.imageOutput.targetAspectRatio", AspectRatio.class);
    public static final Config.Option<Integer> OPTION_TARGET_ROTATION = Config.Option.create("camerax.core.imageOutput.targetRotation", Integer.TYPE);
    public static final Config.Option<Integer> OPTION_APP_TARGET_ROTATION = Config.Option.create("camerax.core.imageOutput.appTargetRotation", Integer.TYPE);
    public static final Config.Option<Integer> OPTION_MIRROR_MODE = Config.Option.create("camerax.core.imageOutput.mirrorMode", Integer.TYPE);
    public static final Config.Option<Size> OPTION_TARGET_RESOLUTION = Config.Option.create("camerax.core.imageOutput.targetResolution", Size.class);
    public static final Config.Option<Size> OPTION_DEFAULT_RESOLUTION = Config.Option.create("camerax.core.imageOutput.defaultResolution", Size.class);
    public static final Config.Option<Size> OPTION_MAX_RESOLUTION = Config.Option.create("camerax.core.imageOutput.maxResolution", Size.class);
    public static final Config.Option<List<Pair<Integer, Size[]>>> OPTION_SUPPORTED_RESOLUTIONS = Config.Option.create("camerax.core.imageOutput.supportedResolutions", List.class);
    public static final Config.Option<ResolutionSelector> OPTION_RESOLUTION_SELECTOR = Config.Option.create("camerax.core.imageOutput.resolutionSelector", ResolutionSelector.class);
    public static final Config.Option<List<Size>> OPTION_CUSTOM_ORDERED_RESOLUTIONS = Config.Option.create("camerax.core.imageOutput.customOrderedResolutions", List.class);

    /* loaded from: classes.dex */
    public interface Builder<B> {
        B setCustomOrderedResolutions(List<Size> list);

        B setDefaultResolution(Size size);

        B setMaxResolution(Size size);

        B setMirrorMode(int i);

        B setResolutionSelector(ResolutionSelector resolutionSelector);

        B setSupportedResolutions(List<Pair<Integer, Size[]>> list);

        B setTargetAspectRatio(int i);

        B setTargetResolution(Size size);

        B setTargetRotation(int i);
    }

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: classes.dex */
    public @interface OptionalRotationValue {
    }

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: classes.dex */
    public @interface RotationDegreesValue {
    }

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: classes.dex */
    public @interface RotationValue {
    }

    default boolean hasTargetAspectRatio() {
        return containsOption(OPTION_TARGET_ASPECT_RATIO);
    }

    default int getTargetAspectRatio() {
        return ((Integer) retrieveOption(OPTION_TARGET_ASPECT_RATIO)).intValue();
    }

    default int getTargetRotation(int valueIfMissing) {
        return ((Integer) retrieveOption(OPTION_TARGET_ROTATION, Integer.valueOf(valueIfMissing))).intValue();
    }

    default int getAppTargetRotation(int valueIfMissing) {
        return ((Integer) retrieveOption(OPTION_APP_TARGET_ROTATION, Integer.valueOf(valueIfMissing))).intValue();
    }

    default int getTargetRotation() {
        return ((Integer) retrieveOption(OPTION_TARGET_ROTATION)).intValue();
    }

    default Size getTargetResolution(Size valueIfMissing) {
        return (Size) retrieveOption(OPTION_TARGET_RESOLUTION, valueIfMissing);
    }

    default int getMirrorMode(int valueIfMissing) {
        return ((Integer) retrieveOption(OPTION_MIRROR_MODE, Integer.valueOf(valueIfMissing))).intValue();
    }

    default Size getTargetResolution() {
        return (Size) retrieveOption(OPTION_TARGET_RESOLUTION);
    }

    default Size getDefaultResolution(Size valueIfMissing) {
        return (Size) retrieveOption(OPTION_DEFAULT_RESOLUTION, valueIfMissing);
    }

    default Size getDefaultResolution() {
        return (Size) retrieveOption(OPTION_DEFAULT_RESOLUTION);
    }

    default Size getMaxResolution(Size valueIfMissing) {
        return (Size) retrieveOption(OPTION_MAX_RESOLUTION, valueIfMissing);
    }

    default Size getMaxResolution() {
        return (Size) retrieveOption(OPTION_MAX_RESOLUTION);
    }

    default List<Pair<Integer, Size[]>> getSupportedResolutions(List<Pair<Integer, Size[]>> valueIfMissing) {
        return (List) retrieveOption(OPTION_SUPPORTED_RESOLUTIONS, valueIfMissing);
    }

    default ResolutionSelector getResolutionSelector(ResolutionSelector valueIfMissing) {
        return (ResolutionSelector) retrieveOption(OPTION_RESOLUTION_SELECTOR, valueIfMissing);
    }

    default ResolutionSelector getResolutionSelector() {
        return (ResolutionSelector) retrieveOption(OPTION_RESOLUTION_SELECTOR);
    }

    default List<Pair<Integer, Size[]>> getSupportedResolutions() {
        return (List) retrieveOption(OPTION_SUPPORTED_RESOLUTIONS);
    }

    default List<Size> getCustomOrderedResolutions(List<Size> valueIfMissing) {
        List<Size> list = (List) retrieveOption(OPTION_CUSTOM_ORDERED_RESOLUTIONS, valueIfMissing);
        if (list != null) {
            return new ArrayList(list);
        }
        return null;
    }

    default List<Size> getCustomOrderedResolutions() {
        return new ArrayList((Collection) Objects.requireNonNull((List) retrieveOption(OPTION_CUSTOM_ORDERED_RESOLUTIONS)));
    }

    static void validateConfig(ImageOutputConfig config) {
        boolean hasTargetAspectRatio = config.hasTargetAspectRatio();
        boolean hasTargetResolution = config.getTargetResolution(null) != null;
        if (hasTargetAspectRatio && hasTargetResolution) {
            throw new IllegalArgumentException("Cannot use both setTargetResolution and setTargetAspectRatio on the same config.");
        }
        ResolutionSelector resolutionSelector = config.getResolutionSelector(null);
        if (resolutionSelector != null) {
            if (hasTargetAspectRatio || hasTargetResolution) {
                throw new IllegalArgumentException("Cannot use setTargetResolution or setTargetAspectRatio with setResolutionSelector on the same config.");
            }
        }
    }
}
