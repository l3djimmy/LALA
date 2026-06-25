package com.itextpdf.layout.properties;
/* loaded from: classes12.dex */
public class LineHeight {
    private static final int FIXED = 1;
    private static final int MULTIPLIED = 2;
    private static final int NORMAL = 4;
    private int type;
    private float value;

    private LineHeight(int type, float value) {
        this.type = type;
        this.value = value;
    }

    public float getValue() {
        return this.value;
    }

    public static LineHeight createFixedValue(float value) {
        return new LineHeight(1, value);
    }

    public static LineHeight createMultipliedValue(float value) {
        return new LineHeight(2, value);
    }

    public static LineHeight createNormalValue() {
        return new LineHeight(4, 0.0f);
    }

    public boolean isFixedValue() {
        return this.type == 1;
    }

    public boolean isMultipliedValue() {
        return this.type == 2;
    }

    public boolean isNormalValue() {
        return this.type == 4;
    }
}
