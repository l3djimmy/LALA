package com.itextpdf.layout.properties;

import java.util.Objects;
/* loaded from: classes12.dex */
public class BackgroundPosition {
    private static final double EPS = 9.999999747378752E-5d;
    private static final int FULL_VALUE = 100;
    private static final int HALF_VALUE = 50;
    private UnitValue xShift = new UnitValue(1, 0.0f);
    private UnitValue yShift = new UnitValue(1, 0.0f);
    private PositionX positionX = PositionX.LEFT;
    private PositionY positionY = PositionY.TOP;

    /* loaded from: classes12.dex */
    public enum PositionX {
        LEFT,
        RIGHT,
        CENTER
    }

    /* loaded from: classes12.dex */
    public enum PositionY {
        TOP,
        BOTTOM,
        CENTER
    }

    public void calculatePositionValues(float fullWidth, float fullHeight, UnitValue outXValue, UnitValue outYValue) {
        int posMultiplier = parsePositionXToUnitValueAndReturnMultiplier(outXValue);
        if (posMultiplier == 0 && this.xShift != null && Math.abs(this.xShift.getValue()) > EPS) {
            outXValue.setValue(0.0f);
        } else {
            outXValue.setValue(calculateValue(outXValue, fullWidth) + (calculateValue(this.xShift, fullWidth) * posMultiplier));
        }
        outXValue.setUnitType(1);
        int posMultiplier2 = parsePositionYToUnitValueAndReturnMultiplier(outYValue);
        if (posMultiplier2 == 0 && this.yShift != null && Math.abs(this.yShift.getValue()) > EPS) {
            outYValue.setValue(0.0f);
        } else {
            outYValue.setValue(calculateValue(outYValue, fullHeight) + (calculateValue(this.yShift, fullHeight) * posMultiplier2));
        }
        outYValue.setUnitType(1);
    }

    public PositionX getPositionX() {
        return this.positionX;
    }

    public BackgroundPosition setPositionX(PositionX xPosition) {
        this.positionX = xPosition;
        return this;
    }

    public PositionY getPositionY() {
        return this.positionY;
    }

    public BackgroundPosition setPositionY(PositionY yPosition) {
        this.positionY = yPosition;
        return this;
    }

    public UnitValue getXShift() {
        return this.xShift;
    }

    public BackgroundPosition setXShift(UnitValue xShift) {
        this.xShift = xShift;
        return this;
    }

    public UnitValue getYShift() {
        return this.yShift;
    }

    public BackgroundPosition setYShift(UnitValue yShift) {
        this.yShift = yShift;
        return this;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        BackgroundPosition position = (BackgroundPosition) o;
        if (Objects.equals(this.positionX, position.positionX) && Objects.equals(this.positionY, position.positionY) && Objects.equals(this.xShift, position.xShift) && Objects.equals(this.yShift, position.yShift)) {
            return true;
        }
        return false;
    }

    public int hashCode() {
        return Objects.hash(Integer.valueOf(this.positionX.ordinal()), Integer.valueOf(this.positionY.ordinal()), this.xShift, this.yShift);
    }

    private int parsePositionXToUnitValueAndReturnMultiplier(UnitValue outValue) {
        outValue.setUnitType(2);
        switch (this.positionX) {
            case LEFT:
                outValue.setValue(0.0f);
                return 1;
            case RIGHT:
                outValue.setValue(100.0f);
                return -1;
            case CENTER:
                outValue.setValue(50.0f);
                return 0;
            default:
                return 0;
        }
    }

    private int parsePositionYToUnitValueAndReturnMultiplier(UnitValue outValue) {
        outValue.setUnitType(2);
        switch (this.positionY) {
            case TOP:
                outValue.setValue(0.0f);
                return 1;
            case BOTTOM:
                outValue.setValue(100.0f);
                return -1;
            case CENTER:
                outValue.setValue(50.0f);
                return 0;
            default:
                return 0;
        }
    }

    private static float calculateValue(UnitValue value, float fullValue) {
        if (value == null) {
            return 0.0f;
        }
        return value.isPercentValue() ? (value.getValue() / 100.0f) * fullValue : value.getValue();
    }
}
