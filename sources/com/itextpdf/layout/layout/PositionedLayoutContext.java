package com.itextpdf.layout.layout;
/* loaded from: classes12.dex */
public class PositionedLayoutContext extends LayoutContext {
    private LayoutArea parentOccupiedArea;

    public PositionedLayoutContext(LayoutArea area, LayoutArea parentOccupiedArea) {
        super(area);
        this.parentOccupiedArea = parentOccupiedArea;
    }

    public LayoutArea getParentOccupiedArea() {
        return this.parentOccupiedArea;
    }
}
