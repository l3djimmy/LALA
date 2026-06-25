package com.itextpdf.layout.renderer;

import com.itextpdf.layout.properties.JustifyContent;
import com.itextpdf.layout.renderer.FlexUtil;
import java.util.List;
/* loaded from: classes12.dex */
interface IFlexItemMainDirector {
    List<IRenderer> applyDirection(List<List<FlexItemInfo>> list);

    <T> void applyDirectionForLine(List<T> list);

    void applyJustifyContent(List<FlexUtil.FlexItemCalculationInfo> list, JustifyContent justifyContent, float f);
}
