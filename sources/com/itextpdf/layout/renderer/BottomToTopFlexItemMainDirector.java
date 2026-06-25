package com.itextpdf.layout.renderer;

import com.itextpdf.layout.properties.JustifyContent;
import com.itextpdf.layout.renderer.FlexUtil;
import java.util.Collections;
import java.util.List;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes12.dex */
public class BottomToTopFlexItemMainDirector extends FlexColumnItemMainDirector {
    @Override // com.itextpdf.layout.renderer.FlexColumnItemMainDirector, com.itextpdf.layout.renderer.IFlexItemMainDirector
    public <T> void applyDirectionForLine(List<T> renderers) {
        Collections.reverse(renderers);
    }

    @Override // com.itextpdf.layout.renderer.IFlexItemMainDirector
    public void applyJustifyContent(List<FlexUtil.FlexItemCalculationInfo> line, JustifyContent justifyContent, float freeSpace) {
        switch (justifyContent) {
            case NORMAL:
            case END:
            case SELF_END:
            case STRETCH:
            case SELF_START:
            case START:
            case FLEX_START:
                line.get(line.size() - 1).yShift = freeSpace;
                return;
            case CENTER:
                line.get(line.size() - 1).yShift = freeSpace / 2.0f;
                return;
            default:
                return;
        }
    }
}
