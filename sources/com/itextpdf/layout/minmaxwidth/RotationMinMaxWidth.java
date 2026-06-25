package com.itextpdf.layout.minmaxwidth;

import androidx.camera.video.AudioStats;
import com.itextpdf.kernel.geom.Rectangle;
/* loaded from: classes12.dex */
public class RotationMinMaxWidth extends MinMaxWidth {
    private double maxWidthHeight;
    private double maxWidthOrigin;
    private double minWidthHeight;
    private double minWidthOrigin;

    public RotationMinMaxWidth(double minWidth, double maxWidth, double minWidthOrigin, double maxWidthOrigin, double minWidthHeight, double maxWidthHeight) {
        super((float) minWidth, (float) maxWidth, 0.0f);
        this.maxWidthOrigin = maxWidthOrigin;
        this.minWidthOrigin = minWidthOrigin;
        this.minWidthHeight = minWidthHeight;
        this.maxWidthHeight = maxWidthHeight;
    }

    public double getMinWidthOrigin() {
        return this.minWidthOrigin;
    }

    public double getMaxWidthOrigin() {
        return this.maxWidthOrigin;
    }

    public double getMinWidthHeight() {
        return this.minWidthHeight;
    }

    public double getMaxWidthHeight() {
        return this.maxWidthHeight;
    }

    public static RotationMinMaxWidth calculate(double angle, double area, MinMaxWidth elementMinMaxWidth) {
        WidthFunction function = new WidthFunction(angle, area);
        return calculate(function, elementMinMaxWidth.getMinWidth(), elementMinMaxWidth.getMaxWidth());
    }

    public static RotationMinMaxWidth calculate(double angle, double area, MinMaxWidth elementMinMaxWidth, double availableWidth) {
        WidthFunction function = new WidthFunction(angle, area);
        WidthFunction.Interval validArguments = function.getValidOriginalWidths(availableWidth);
        if (validArguments == null) {
            return null;
        }
        double xMin = Math.max(elementMinMaxWidth.getMinWidth(), validArguments.getMin());
        double xMax = Math.min(elementMinMaxWidth.getMaxWidth(), validArguments.getMax());
        if (xMax < xMin) {
            double rotatedWidth = function.getRotatedWidth(xMin);
            double rotatedHeight = function.getRotatedHeight(xMin);
            return new RotationMinMaxWidth(rotatedWidth, rotatedWidth, xMin, xMin, rotatedHeight, rotatedHeight);
        }
        return calculate(function, xMin, xMax);
    }

    public static double calculateRotatedWidth(Rectangle area, double angle) {
        return (area.getWidth() * cos(angle)) + (area.getHeight() * sin(angle));
    }

    private static RotationMinMaxWidth calculate(WidthFunction func, double xMin, double xMax) {
        double maxWidthOrigin;
        double minWidthOrigin;
        double x0 = func.getWidthDerivativeZeroPoint();
        if (x0 < xMin) {
            maxWidthOrigin = xMax;
            minWidthOrigin = xMin;
        } else if (x0 > xMax) {
            maxWidthOrigin = xMin;
            minWidthOrigin = xMax;
        } else {
            maxWidthOrigin = func.getRotatedWidth(xMax) > func.getRotatedWidth(xMin) ? xMax : xMin;
            minWidthOrigin = x0;
        }
        return new RotationMinMaxWidth(func.getRotatedWidth(minWidthOrigin), func.getRotatedWidth(maxWidthOrigin), minWidthOrigin, maxWidthOrigin, func.getRotatedHeight(minWidthOrigin), func.getRotatedHeight(maxWidthOrigin));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static double sin(double angle) {
        return correctSinCos(Math.abs(Math.sin(angle)));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static double cos(double angle) {
        return correctSinCos(Math.abs(Math.cos(angle)));
    }

    private static double correctSinCos(double value) {
        if (MinMaxWidthUtils.isEqual(value, AudioStats.AUDIO_AMPLITUDE_NONE)) {
            return AudioStats.AUDIO_AMPLITUDE_NONE;
        }
        if (MinMaxWidthUtils.isEqual(value, 1.0d)) {
            return 1.0d;
        }
        return value;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class WidthFunction {
        private double area;
        private double cos;
        private double sin;

        public WidthFunction(double angle, double area) {
            this.sin = RotationMinMaxWidth.sin(angle);
            this.cos = RotationMinMaxWidth.cos(angle);
            this.area = area;
        }

        public double getRotatedWidth(double x) {
            return (this.cos * x) + ((this.area * this.sin) / x);
        }

        public double getRotatedHeight(double x) {
            return (this.sin * x) + ((this.area * this.cos) / x);
        }

        public Interval getValidOriginalWidths(double availableWidth) {
            double D;
            double minWidth;
            if (this.cos == AudioStats.AUDIO_AMPLITUDE_NONE) {
                D = (this.area * this.sin) / availableWidth;
                minWidth = MinMaxWidthUtils.getInfWidth();
            } else {
                double minWidth2 = this.sin;
                if (minWidth2 == AudioStats.AUDIO_AMPLITUDE_NONE) {
                    D = AudioStats.AUDIO_AMPLITUDE_NONE;
                    minWidth = availableWidth / this.cos;
                } else {
                    double minWidth3 = availableWidth * availableWidth;
                    double D2 = minWidth3 - (((this.area * 4.0d) * this.sin) * this.cos);
                    if (D2 < AudioStats.AUDIO_AMPLITUDE_NONE) {
                        return null;
                    }
                    double minWidth4 = (availableWidth - Math.sqrt(D2)) / (this.cos * 2.0d);
                    D = minWidth4;
                    minWidth = (Math.sqrt(D2) + availableWidth) / (this.cos * 2.0d);
                }
            }
            return new Interval(D, minWidth);
        }

        public double getWidthDerivativeZeroPoint() {
            return Math.sqrt((this.area * this.sin) / this.cos);
        }

        /* loaded from: classes12.dex */
        public static class Interval {
            private double max;
            private double min;

            public Interval(double min, double max) {
                this.min = min;
                this.max = max;
            }

            public double getMin() {
                return this.min;
            }

            public double getMax() {
                return this.max;
            }
        }
    }
}
