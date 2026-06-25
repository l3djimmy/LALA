package androidx.camera.core.impl.utils;

import androidx.camera.core.resolutionselector.ResolutionSelector;
/* loaded from: classes.dex */
public class ResolutionSelectorUtil {
    private ResolutionSelectorUtil() {
    }

    public static ResolutionSelector overrideResolutionSelectors(ResolutionSelector baseResolutionSelector, ResolutionSelector resolutionSelectorToOverride) {
        if (resolutionSelectorToOverride == null) {
            return baseResolutionSelector;
        }
        if (baseResolutionSelector == null) {
            return resolutionSelectorToOverride;
        }
        ResolutionSelector.Builder builder = ResolutionSelector.Builder.fromResolutionSelector(baseResolutionSelector);
        if (resolutionSelectorToOverride.getAspectRatioStrategy() != null) {
            builder.setAspectRatioStrategy(resolutionSelectorToOverride.getAspectRatioStrategy());
        }
        if (resolutionSelectorToOverride.getResolutionStrategy() != null) {
            builder.setResolutionStrategy(resolutionSelectorToOverride.getResolutionStrategy());
        }
        if (resolutionSelectorToOverride.getResolutionFilter() != null) {
            builder.setResolutionFilter(resolutionSelectorToOverride.getResolutionFilter());
        }
        if (resolutionSelectorToOverride.getAllowedResolutionMode() != 0) {
            builder.setAllowedResolutionMode(resolutionSelectorToOverride.getAllowedResolutionMode());
        }
        return builder.build();
    }
}
