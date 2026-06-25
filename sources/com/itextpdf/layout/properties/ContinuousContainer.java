package com.itextpdf.layout.properties;

import com.itextpdf.layout.IPropertyContainer;
import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.renderer.AbstractRenderer;
import com.itextpdf.layout.renderer.IRenderer;
import java.util.HashMap;
/* loaded from: classes12.dex */
public final class ContinuousContainer {
    private static final int[] PROPERTIES_NEEDED_FOR_CONTINUOUS_CONTAINER = {43, 10, 47, 9};
    private final HashMap<Integer, Object> properties = new HashMap<>();

    private ContinuousContainer(IRenderer renderer) {
        int[] iArr;
        for (int property : PROPERTIES_NEEDED_FOR_CONTINUOUS_CONTAINER) {
            this.properties.put(Integer.valueOf(property), renderer.getProperty(property));
        }
    }

    public static void clearPropertiesFromOverFlowRenderer(IPropertyContainer overFlowRenderer) {
        if (overFlowRenderer != null && Boolean.TRUE.equals(overFlowRenderer.getProperty(Property.TREAT_AS_CONTINUOUS_CONTAINER))) {
            overFlowRenderer.setProperty(50, UnitValue.createPointValue(0.0f));
            overFlowRenderer.setProperty(46, UnitValue.createPointValue(0.0f));
            overFlowRenderer.setProperty(13, null);
        }
    }

    public static void setupContinuousContainerIfNeeded(AbstractRenderer blockRenderer) {
        if (Boolean.TRUE.equals(blockRenderer.getProperty(Property.TREAT_AS_CONTINUOUS_CONTAINER))) {
            if (!blockRenderer.hasProperty(Property.TREAT_AS_CONTINUOUS_CONTAINER_RESULT)) {
                ContinuousContainer continuousContainer = new ContinuousContainer(blockRenderer);
                blockRenderer.setProperty(Property.TREAT_AS_CONTINUOUS_CONTAINER_RESULT, continuousContainer);
            }
            clearPropertiesFromSplitRenderer(blockRenderer);
        }
    }

    private static void clearPropertiesFromSplitRenderer(AbstractRenderer blockRenderer) {
        if (blockRenderer == null) {
            return;
        }
        blockRenderer.setProperty(43, UnitValue.createPointValue(0.0f));
        blockRenderer.setProperty(10, null);
        blockRenderer.setProperty(47, UnitValue.createPointValue(0.0f));
    }

    public void reApplyProperties(AbstractRenderer blockRenderer) {
        int[] iArr;
        for (int property : PROPERTIES_NEEDED_FOR_CONTINUOUS_CONTAINER) {
            blockRenderer.setProperty(property, this.properties.get(Integer.valueOf(property)));
        }
        Border allBorders = (Border) this.properties.get(9);
        Border bottomBorder = (Border) this.properties.get(10);
        if (allBorders != null && bottomBorder == null) {
            blockRenderer.setProperty(10, allBorders);
        }
    }
}
