package com.itextpdf.kernel.colors.gradients;

import androidx.camera.video.AudioStats;
import com.itextpdf.kernel.geom.AffineTransform;
import com.itextpdf.kernel.geom.Point;
import com.itextpdf.kernel.geom.Rectangle;
/* loaded from: classes12.dex */
public class StrategyBasedLinearGradientBuilder extends AbstractLinearGradientBuilder {
    private double rotateVectorAngle = AudioStats.AUDIO_AMPLITUDE_NONE;
    private GradientStrategy gradientStrategy = GradientStrategy.TO_BOTTOM;
    private boolean isCentralRotationAngleStrategy = false;

    /* loaded from: classes12.dex */
    public enum GradientStrategy {
        TO_BOTTOM,
        TO_BOTTOM_LEFT,
        TO_BOTTOM_RIGHT,
        TO_LEFT,
        TO_RIGHT,
        TO_TOP,
        TO_TOP_LEFT,
        TO_TOP_RIGHT
    }

    public StrategyBasedLinearGradientBuilder setGradientDirectionAsCentralRotationAngle(double radians) {
        this.rotateVectorAngle = radians;
        this.isCentralRotationAngleStrategy = true;
        return this;
    }

    public StrategyBasedLinearGradientBuilder setGradientDirectionAsStrategy(GradientStrategy gradientStrategy) {
        this.gradientStrategy = gradientStrategy != null ? gradientStrategy : GradientStrategy.TO_BOTTOM;
        this.isCentralRotationAngleStrategy = false;
        return this;
    }

    public double getRotateVectorAngle() {
        return this.rotateVectorAngle;
    }

    public GradientStrategy getGradientStrategy() {
        return this.gradientStrategy;
    }

    public boolean isCentralRotationAngleStrategy() {
        return this.isCentralRotationAngleStrategy;
    }

    @Override // com.itextpdf.kernel.colors.gradients.AbstractLinearGradientBuilder
    protected Point[] getGradientVector(Rectangle targetBoundingBox, AffineTransform contextTransform) {
        if (targetBoundingBox == null) {
            return null;
        }
        if (this.isCentralRotationAngleStrategy) {
            return buildCentralRotationCoordinates(targetBoundingBox, this.rotateVectorAngle);
        }
        return buildCoordinatesWithGradientStrategy(targetBoundingBox, this.gradientStrategy);
    }

    private static Point[] buildCoordinatesWithGradientStrategy(Rectangle targetBoundingBox, GradientStrategy gradientStrategy) {
        double xCenter = targetBoundingBox.getX() + (targetBoundingBox.getWidth() / 2.0f);
        double yCenter = targetBoundingBox.getY() + (targetBoundingBox.getHeight() / 2.0f);
        switch (gradientStrategy) {
            case TO_TOP:
                return createCoordinates(xCenter, targetBoundingBox.getBottom(), xCenter, targetBoundingBox.getTop());
            case TO_LEFT:
                return createCoordinates(targetBoundingBox.getRight(), yCenter, targetBoundingBox.getLeft(), yCenter);
            case TO_RIGHT:
                return createCoordinates(targetBoundingBox.getLeft(), yCenter, targetBoundingBox.getRight(), yCenter);
            case TO_TOP_LEFT:
                return buildToCornerCoordinates(targetBoundingBox, new Point(targetBoundingBox.getRight(), targetBoundingBox.getTop()));
            case TO_TOP_RIGHT:
                return buildToCornerCoordinates(targetBoundingBox, new Point(targetBoundingBox.getRight(), targetBoundingBox.getBottom()));
            case TO_BOTTOM_RIGHT:
                return buildToCornerCoordinates(targetBoundingBox, new Point(targetBoundingBox.getLeft(), targetBoundingBox.getBottom()));
            case TO_BOTTOM_LEFT:
                return buildToCornerCoordinates(targetBoundingBox, new Point(targetBoundingBox.getLeft(), targetBoundingBox.getTop()));
            default:
                return createCoordinates(xCenter, targetBoundingBox.getTop(), xCenter, targetBoundingBox.getBottom());
        }
    }

    private static Point[] buildCentralRotationCoordinates(Rectangle targetBoundingBox, double angle) {
        double xCenter = targetBoundingBox.getX() + (targetBoundingBox.getWidth() / 2.0f);
        AffineTransform rotateInstance = AffineTransform.getRotateInstance(angle, xCenter, targetBoundingBox.getY() + (targetBoundingBox.getHeight() / 2.0f));
        return buildCoordinates(targetBoundingBox, rotateInstance);
    }

    private static Point[] buildToCornerCoordinates(Rectangle targetBoundingBox, Point gradientCenterLineRightCorner) {
        AffineTransform transform = buildToCornerTransform(new Point(targetBoundingBox.getX() + (targetBoundingBox.getWidth() / 2.0f), targetBoundingBox.getY() + (targetBoundingBox.getHeight() / 2.0f)), gradientCenterLineRightCorner);
        return buildCoordinates(targetBoundingBox, transform);
    }

    private static AffineTransform buildToCornerTransform(Point center, Point gradientCenterLineRightCorner) {
        double sin;
        double cos;
        double scale = 1.0d / center.distance(gradientCenterLineRightCorner);
        double sin2 = (gradientCenterLineRightCorner.getY() - center.getY()) * scale;
        double cos2 = (gradientCenterLineRightCorner.getX() - center.getX()) * scale;
        if (Math.abs(cos2) < 1.0E-10d) {
            sin = sin2 > AudioStats.AUDIO_AMPLITUDE_NONE ? 1.0d : -1.0d;
            cos = 0.0d;
        } else if (Math.abs(sin2) >= 1.0E-10d) {
            sin = sin2;
            cos = cos2;
        } else {
            sin = 0.0d;
            cos = cos2 > AudioStats.AUDIO_AMPLITUDE_NONE ? 1.0d : -1.0d;
        }
        double m02 = (center.getX() * (1.0d - cos)) + (center.getY() * sin);
        double m12 = (center.getY() * (1.0d - cos)) - (center.getX() * sin);
        return new AffineTransform(cos, sin, -sin, cos, m02, m12);
    }

    private static Point[] buildCoordinates(Rectangle targetBoundingBox, AffineTransform transformation) {
        double xCenter = targetBoundingBox.getX() + (targetBoundingBox.getWidth() / 2.0f);
        Point start = transformation.transform(new Point(xCenter, targetBoundingBox.getBottom()), null);
        Point end = transformation.transform(new Point(xCenter, targetBoundingBox.getTop()), null);
        Point[] baseVector = {start, end};
        double[] targetDomain = evaluateCoveringDomain(baseVector, targetBoundingBox);
        return createCoordinatesForNewDomain(targetDomain, baseVector);
    }

    private static Point[] createCoordinates(double x1, double y1, double x2, double y2) {
        return new Point[]{new Point(x1, y1), new Point(x2, y2)};
    }
}
