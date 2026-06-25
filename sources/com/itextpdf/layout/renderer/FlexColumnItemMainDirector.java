package com.itextpdf.layout.renderer;

import java.util.ArrayList;
import java.util.List;
/* loaded from: classes12.dex */
abstract class FlexColumnItemMainDirector implements IFlexItemMainDirector {
    @Override // com.itextpdf.layout.renderer.IFlexItemMainDirector
    public abstract <T> void applyDirectionForLine(List<T> list);

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
}
