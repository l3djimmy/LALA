package com.itextpdf.layout.renderer;
/* loaded from: classes12.dex */
class TableBorderDescriptor {
    private int borderIndex;
    private float crossCoordinate;
    private float mainCoordinateStart;
    private float[] mainCoordinateWidths;

    public TableBorderDescriptor(int borderIndex, float mainCoordinateStart, float crossCoordinate, float[] mainCoordinateWidths) {
        this.borderIndex = borderIndex;
        this.mainCoordinateStart = mainCoordinateStart;
        this.crossCoordinate = crossCoordinate;
        this.mainCoordinateWidths = mainCoordinateWidths;
    }

    public int getBorderIndex() {
        return this.borderIndex;
    }

    public float getMainCoordinateStart() {
        return this.mainCoordinateStart;
    }

    public float getCrossCoordinate() {
        return this.crossCoordinate;
    }

    public float[] getMainCoordinateWidths() {
        return this.mainCoordinateWidths;
    }
}
