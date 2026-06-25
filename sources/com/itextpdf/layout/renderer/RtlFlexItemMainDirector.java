package com.itextpdf.layout.renderer;

import com.itextpdf.layout.properties.JustifyContent;
import com.itextpdf.layout.renderer.FlexUtil;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes12.dex */
public class RtlFlexItemMainDirector implements IFlexItemMainDirector {
    @Override // com.itextpdf.layout.renderer.IFlexItemMainDirector
    public List<IRenderer> applyDirection(List<List<FlexItemInfo>> lines) {
        List<IRenderer> renderers = new ArrayList<>();
        for (List<FlexItemInfo> line : lines) {
            applyDirectionForLine(line);
            for (FlexItemInfo itemInfo : line) {
                renderers.add(itemInfo.getRenderer());
            }
        }
        return renderers;
    }

    @Override // com.itextpdf.layout.renderer.IFlexItemMainDirector
    public <T> void applyDirectionForLine(List<T> renderers) {
        Collections.reverse(renderers);
    }

    @Override // com.itextpdf.layout.renderer.IFlexItemMainDirector
    public void applyJustifyContent(List<FlexUtil.FlexItemCalculationInfo> line, JustifyContent justifyContent, float freeSpace) {
        switch (justifyContent) {
            case RIGHT:
            case END:
            case SELF_END:
            case FLEX_START:
                line.get(line.size() - 1).xShift = freeSpace;
                return;
            case CENTER:
                line.get(line.size() - 1).xShift = freeSpace / 2.0f;
                return;
            default:
                return;
        }
    }
}
