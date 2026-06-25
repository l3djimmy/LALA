package com.itextpdf.layout.renderer;

import com.itextpdf.layout.properties.JustifyContent;
import com.itextpdf.layout.renderer.FlexUtil;
import java.util.List;
/* loaded from: classes12.dex */
class TopToBottomFlexItemMainDirector extends FlexColumnItemMainDirector {
    @Override // com.itextpdf.layout.renderer.FlexColumnItemMainDirector, com.itextpdf.layout.renderer.IFlexItemMainDirector
    public <T> void applyDirectionForLine(List<T> renderers) {
    }

    @Override // com.itextpdf.layout.renderer.IFlexItemMainDirector
    public void applyJustifyContent(List<FlexUtil.FlexItemCalculationInfo> line, JustifyContent justifyContent, float freeSpace) {
        switch (justifyContent) {
            case END:
            case SELF_END:
            case FLEX_END:
                line.get(0).yShift = freeSpace;
                return;
            case CENTER:
                line.get(0).yShift = freeSpace / 2.0f;
                return;
            default:
                return;
        }
    }
}
