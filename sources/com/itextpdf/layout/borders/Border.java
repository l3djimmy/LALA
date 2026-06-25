package com.itextpdf.layout.borders;

import androidx.camera.video.AudioStats;
import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.colors.Color;
import com.itextpdf.kernel.colors.ColorConstants;
import com.itextpdf.kernel.geom.Point;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import com.itextpdf.layout.properties.TransparentColor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public abstract class Border {
    private static final int ARC_BOTTOM_DEGREE = 270;
    private static final int ARC_LEFT_DEGREE = 180;
    private static final int ARC_QUARTER_CLOCKWISE_EXTENT = -90;
    private static final int ARC_RIGHT_DEGREE = 0;
    private static final int ARC_TOP_DEGREE = 90;
    public static final int DASHED = 1;
    public static final int DASHED_FIXED = 9;
    public static final int DOTTED = 2;
    public static final int DOUBLE = 3;
    public static final Border NO_BORDER = null;
    public static final int ROUND_DOTS = 4;
    public static final int SOLID = 0;
    public static final int _3D_GROOVE = 5;
    public static final int _3D_INSET = 6;
    public static final int _3D_OUTSET = 7;
    public static final int _3D_RIDGE = 8;
    private int hash;
    protected TransparentColor transparentColor;
    protected int type;
    protected float width;

    /* loaded from: classes12.dex */
    public enum Side {
        NONE,
        TOP,
        RIGHT,
        BOTTOM,
        LEFT
    }

    public abstract void draw(PdfCanvas pdfCanvas, float f, float f2, float f3, float f4, Side side, float f5, float f6);

    public abstract void drawCellBorder(PdfCanvas pdfCanvas, float f, float f2, float f3, float f4, Side side);

    public abstract int getType();

    /* JADX INFO: Access modifiers changed from: protected */
    public Border(float width) {
        this(ColorConstants.BLACK, width);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Border(Color color, float width) {
        this.transparentColor = new TransparentColor(color);
        this.width = width;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Border(Color color, float width, float opacity) {
        this.transparentColor = new TransparentColor(color, opacity);
        this.width = width;
    }

    public void draw(PdfCanvas canvas, Rectangle rectangle) {
        float left = rectangle.getX();
        float bottom = rectangle.getY();
        float right = rectangle.getX() + rectangle.getWidth();
        float top = rectangle.getY() + rectangle.getHeight();
        draw(canvas, left, top, right, top, Side.TOP, this.width, this.width);
        draw(canvas, right, top, right, bottom, Side.RIGHT, this.width, this.width);
        draw(canvas, right, bottom, left, bottom, Side.BOTTOM, this.width, this.width);
        draw(canvas, left, bottom, left, top, Side.LEFT, this.width, this.width);
    }

    public void draw(PdfCanvas canvas, float x1, float y1, float x2, float y2, float borderRadius, Side defaultSide, float borderWidthBefore, float borderWidthAfter) {
        draw(canvas, x1, y1, x2, y2, borderRadius, borderRadius, borderRadius, borderRadius, defaultSide, borderWidthBefore, borderWidthAfter);
    }

    public void draw(PdfCanvas canvas, float x1, float y1, float x2, float y2, float horizontalRadius1, float verticalRadius1, float horizontalRadius2, float verticalRadius2, Side defaultSide, float borderWidthBefore, float borderWidthAfter) {
        Logger logger = LoggerFactory.getLogger(Border.class);
        logger.warn(MessageFormatUtil.format(IoLogMessageConstant.METHOD_IS_NOT_IMPLEMENTED_BY_DEFAULT_OTHER_METHOD_WILL_BE_USED, "Border#draw(PdfCanvas, float, float, float, float, float, float, float, float, Side, float, float", "Border#draw(PdfCanvas, float, float, float, float, Side, float, float)"));
        draw(canvas, x1, y1, x2, y2, defaultSide, borderWidthBefore, borderWidthAfter);
    }

    public Color getColor() {
        return this.transparentColor.getColor();
    }

    public float getOpacity() {
        return this.transparentColor.getOpacity();
    }

    public float getWidth() {
        return this.width;
    }

    public void setColor(Color color) {
        this.transparentColor = new TransparentColor(color, this.transparentColor.getOpacity());
    }

    public void setWidth(float width) {
        this.width = width;
    }

    public boolean equals(Object anObject) {
        if (this == anObject) {
            return true;
        }
        if (anObject instanceof Border) {
            Border anotherBorder = (Border) anObject;
            return anotherBorder.getType() == getType() && anotherBorder.getColor().equals(getColor()) && anotherBorder.getWidth() == getWidth() && anotherBorder.transparentColor.getOpacity() == this.transparentColor.getOpacity();
        }
        return false;
    }

    public int hashCode() {
        int h = this.hash;
        if (h == 0) {
            int h2 = (((((int) getWidth()) * 31) + getColor().hashCode()) * 31) + ((int) this.transparentColor.getOpacity());
            this.hash = h2;
            return h2;
        }
        return h;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Side getBorderSide(float x1, float y1, float x2, float y2, Side defaultSide) {
        boolean isLeft = false;
        boolean isRight = false;
        if (Math.abs(y2 - y1) > 5.0E-4f) {
            isLeft = y2 - y1 > 0.0f;
            isRight = y2 - y1 < 0.0f;
        }
        boolean isTop = false;
        boolean isBottom = false;
        if (Math.abs(x2 - x1) > 5.0E-4f) {
            isTop = x2 - x1 > 0.0f;
            isBottom = x2 - x1 < 0.0f;
        }
        if (isTop) {
            return isLeft ? Side.LEFT : Side.TOP;
        } else if (isRight) {
            return Side.RIGHT;
        } else {
            if (isBottom) {
                return Side.BOTTOM;
            }
            if (isLeft) {
                return Side.LEFT;
            }
            return defaultSide;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Point getIntersectionPoint(Point lineBeg, Point lineEnd, Point clipLineBeg, Point clipLineEnd) {
        double A1 = lineBeg.getY() - lineEnd.getY();
        double A2 = clipLineBeg.getY() - clipLineEnd.getY();
        double B1 = lineEnd.getX() - lineBeg.getX();
        double B2 = clipLineEnd.getX() - clipLineBeg.getX();
        double C1 = (lineBeg.getX() * lineEnd.getY()) - (lineBeg.getY() * lineEnd.getX());
        double C2 = (clipLineBeg.getX() * clipLineEnd.getY()) - (clipLineBeg.getY() * clipLineEnd.getX());
        double M = (B1 * A2) - (B2 * A1);
        return new Point(((B2 * C1) - (B1 * C2)) / M, ((C2 * A1) - (C1 * A2)) / M);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public float getDotsGap(double distance, float initialGap) {
        double gapsNum = Math.ceil(distance / initialGap);
        if (gapsNum == AudioStats.AUDIO_AMPLITUDE_NONE) {
            return initialGap;
        }
        return (float) (distance / gapsNum);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void drawDiscontinuousBorders(PdfCanvas canvas, Rectangle boundingRectangle, float[] horizontalRadii, float[] verticalRadii, Side defaultSide, float borderWidthBefore, float borderWidthAfter) {
        PdfCanvas pdfCanvas;
        double y3;
        PdfCanvas pdfCanvas2;
        double x3;
        double y32;
        PdfCanvas pdfCanvas3;
        PdfCanvas pdfCanvas4;
        double x32;
        double x1;
        double x12 = boundingRectangle.getX();
        double y1 = boundingRectangle.getY();
        double x2 = boundingRectangle.getRight();
        double y2 = boundingRectangle.getTop();
        double horizontalRadius1 = horizontalRadii[0];
        double horizontalRadius2 = horizontalRadii[1];
        double horizontalRadius22 = verticalRadii[0];
        double verticalRadius1 = verticalRadii[1];
        double verticalRadius2 = boundingRectangle.getX();
        double x0 = boundingRectangle.getY();
        double y0 = boundingRectangle.getRight();
        double x33 = boundingRectangle.getTop();
        double widthHalf = this.width / 2.0d;
        Side borderSide = getBorderSide((float) x12, (float) y1, (float) x2, (float) y2, defaultSide);
        switch (borderSide) {
            case TOP:
                double innerRadiusBefore = Math.max((double) AudioStats.AUDIO_AMPLITUDE_NONE, horizontalRadius1 - borderWidthBefore);
                double innerRadiusFirst = Math.max((double) AudioStats.AUDIO_AMPLITUDE_NONE, horizontalRadius22 - this.width);
                double innerRadiusSecond = Math.max((double) AudioStats.AUDIO_AMPLITUDE_NONE, verticalRadius1 - this.width);
                double innerRadiusAfter = Math.max((double) AudioStats.AUDIO_AMPLITUDE_NONE, horizontalRadius2 - borderWidthAfter);
                double x02 = verticalRadius2 - (borderWidthBefore / 2.0f);
                double y02 = x0 - innerRadiusFirst;
                double x34 = y0 + (borderWidthAfter / 2.0f);
                double y33 = x33 - innerRadiusSecond;
                Point clipPoint1 = getIntersectionPoint(new Point(x12 - borderWidthBefore, this.width + y1), new Point(x12, y1), new Point(x02, y02), new Point(x02 + 10.0d, y02));
                Point clipPoint2 = getIntersectionPoint(new Point(x2 + borderWidthAfter, y2 + this.width), new Point(x2, y2), new Point(x34, y33), new Point(x34 - 10.0d, y33));
                if (clipPoint1.x > clipPoint2.x) {
                    y3 = y33;
                    Point clipPoint = getIntersectionPoint(new Point(x12 - borderWidthBefore, this.width + y1), clipPoint1, clipPoint2, new Point(x2 + borderWidthAfter, y2 + this.width));
                    pdfCanvas = canvas;
                    pdfCanvas.moveTo(x12 - borderWidthBefore, this.width + y1).lineTo(clipPoint.x, clipPoint.y).lineTo(x2 + borderWidthAfter, y2 + this.width).lineTo(x12 - borderWidthBefore, this.width + y1);
                } else {
                    pdfCanvas = canvas;
                    y3 = y33;
                    pdfCanvas.moveTo(x12 - borderWidthBefore, this.width + y1).lineTo(clipPoint1.x, clipPoint1.y).lineTo(clipPoint2.x, clipPoint2.y).lineTo(x2 + borderWidthAfter, y2 + this.width).lineTo(x12 - borderWidthBefore, this.width + y1);
                }
                pdfCanvas.clip().endPath();
                canvas.arc(x02, y02 - innerRadiusFirst, x12 + innerRadiusBefore + innerRadiusBefore, y1 + widthHalf, 180.0d, -90.0d).arcContinuous((x2 - innerRadiusAfter) - innerRadiusAfter, y2 + widthHalf, x34, y3 - innerRadiusSecond, 90.0d, -90.0d);
                break;
            case RIGHT:
                double innerRadiusBefore2 = Math.max((double) AudioStats.AUDIO_AMPLITUDE_NONE, horizontalRadius22 - borderWidthBefore);
                double innerRadiusFirst2 = Math.max((double) AudioStats.AUDIO_AMPLITUDE_NONE, horizontalRadius1 - this.width);
                double innerRadiusSecond2 = Math.max((double) AudioStats.AUDIO_AMPLITUDE_NONE, horizontalRadius2 - this.width);
                double innerRadiusAfter2 = Math.max((double) AudioStats.AUDIO_AMPLITUDE_NONE, verticalRadius1 - borderWidthAfter);
                double x03 = verticalRadius2 - innerRadiusFirst2;
                double y03 = x0 + (borderWidthBefore / 2.0f);
                double x35 = y0 - innerRadiusSecond2;
                double y34 = x33 - (borderWidthAfter / 2.0f);
                Point clipPoint12 = getIntersectionPoint(new Point(this.width + x12, borderWidthBefore + y1), new Point(x12, y1), new Point(x03, y03), new Point(x03, y03 - 10.0d));
                Point clipPoint22 = getIntersectionPoint(new Point(x2 + this.width, y2 - borderWidthAfter), new Point(x2, y2), new Point(x35, y34), new Point(x35, y34 - 10.0d));
                if (clipPoint12.y < clipPoint22.y) {
                    x3 = x35;
                    Point clipPoint3 = getIntersectionPoint(new Point(x12 + this.width, borderWidthBefore + y1), clipPoint12, clipPoint22, new Point(x2 + this.width, y2 - borderWidthAfter));
                    pdfCanvas2 = canvas;
                    pdfCanvas2.moveTo(x12 + this.width, borderWidthBefore + y1).lineTo(clipPoint3.x, clipPoint3.y).lineTo(x2 + this.width, y2 - borderWidthAfter).lineTo(x12 + this.width, borderWidthBefore + y1).clip().endPath();
                } else {
                    pdfCanvas2 = canvas;
                    x3 = x35;
                    pdfCanvas2.moveTo(x12 + this.width, borderWidthBefore + y1).lineTo(clipPoint12.x, clipPoint12.y).lineTo(clipPoint22.x, clipPoint22.y).lineTo(x2 + this.width, y2 - borderWidthAfter).lineTo(x12 + this.width, borderWidthBefore + y1).clip().endPath();
                }
                pdfCanvas2.clip().endPath();
                canvas.arc(x03 - innerRadiusFirst2, y03, x12 + widthHalf, (y1 - innerRadiusBefore2) - innerRadiusBefore2, 90.0d, -90.0d).arcContinuous(x2 + widthHalf, y2 + innerRadiusAfter2 + innerRadiusAfter2, x3 - innerRadiusSecond2, y34, AudioStats.AUDIO_AMPLITUDE_NONE, -90.0d);
                break;
            case BOTTOM:
                double innerRadiusBefore3 = Math.max((double) AudioStats.AUDIO_AMPLITUDE_NONE, horizontalRadius1 - borderWidthBefore);
                double innerRadiusFirst3 = Math.max((double) AudioStats.AUDIO_AMPLITUDE_NONE, horizontalRadius22 - this.width);
                double innerRadiusSecond3 = Math.max((double) AudioStats.AUDIO_AMPLITUDE_NONE, verticalRadius1 - this.width);
                double innerRadiusAfter3 = Math.max((double) AudioStats.AUDIO_AMPLITUDE_NONE, horizontalRadius2 - borderWidthAfter);
                double x04 = verticalRadius2 + (borderWidthBefore / 2.0f);
                double y04 = x0 + innerRadiusFirst3;
                double x36 = y0 - (borderWidthAfter / 2.0f);
                double y35 = x33 + innerRadiusSecond3;
                Point clipPoint13 = getIntersectionPoint(new Point(x12 + borderWidthBefore, y1 - this.width), new Point(x12, y1), new Point(x04, y04), new Point(x04 - 10.0d, y04));
                Point clipPoint23 = getIntersectionPoint(new Point(x2 - borderWidthAfter, y2 - this.width), new Point(x2, y2), new Point(x36, y35), new Point(x36 + 10.0d, y35));
                if (clipPoint13.x < clipPoint23.x) {
                    y32 = y35;
                    Point clipPoint4 = getIntersectionPoint(new Point(x12 + borderWidthBefore, y1 - this.width), clipPoint13, clipPoint23, new Point(x2 - borderWidthAfter, y2 - this.width));
                    pdfCanvas3 = canvas;
                    pdfCanvas3.moveTo(x12 + borderWidthBefore, y1 - this.width).lineTo(clipPoint4.x, clipPoint4.y).lineTo(x2 - borderWidthAfter, y2 - this.width).lineTo(x12 + borderWidthBefore, y1 - this.width);
                } else {
                    y32 = y35;
                    pdfCanvas3 = canvas;
                    pdfCanvas3.moveTo(x12 + borderWidthBefore, y1 - this.width).lineTo(clipPoint13.x, clipPoint13.y).lineTo(clipPoint23.x, clipPoint23.y).lineTo(x2 - borderWidthAfter, y2 - this.width).lineTo(x12 + borderWidthBefore, y1 - this.width);
                }
                pdfCanvas3.clip().endPath();
                canvas.arc(x04, y04 + innerRadiusFirst3, (x12 - innerRadiusBefore3) - innerRadiusBefore3, y1 - widthHalf, AudioStats.AUDIO_AMPLITUDE_NONE, -90.0d).arcContinuous(x2 + innerRadiusAfter3 + innerRadiusAfter3, y2 - widthHalf, x36, y32 + innerRadiusSecond3, 270.0d, -90.0d);
                break;
            case LEFT:
                double innerRadiusBefore4 = Math.max((double) AudioStats.AUDIO_AMPLITUDE_NONE, horizontalRadius22 - borderWidthBefore);
                double innerRadiusFirst4 = Math.max((double) AudioStats.AUDIO_AMPLITUDE_NONE, horizontalRadius1 - this.width);
                double innerRadiusSecond4 = Math.max((double) AudioStats.AUDIO_AMPLITUDE_NONE, horizontalRadius2 - this.width);
                double innerRadiusAfter4 = Math.max((double) AudioStats.AUDIO_AMPLITUDE_NONE, verticalRadius1 - borderWidthAfter);
                double x05 = verticalRadius2 + innerRadiusFirst4;
                double y05 = x0 - (borderWidthBefore / 2.0f);
                double x22 = y0 + innerRadiusSecond4;
                double y36 = x33 + (borderWidthAfter / 2.0f);
                Point clipPoint14 = getIntersectionPoint(new Point(x12 - this.width, y1 - borderWidthBefore), new Point(x12, y1), new Point(x05, y05), new Point(x05, y05 + 10.0d));
                Point clipPoint24 = getIntersectionPoint(new Point(x2 - this.width, y2 + borderWidthAfter), new Point(x2, y2), new Point(x22, y36), new Point(x22, y36 + 10.0d));
                if (clipPoint14.y > clipPoint24.y) {
                    x32 = x22;
                    Point clipPoint5 = getIntersectionPoint(new Point(x12 - this.width, y1 - borderWidthBefore), clipPoint14, clipPoint24, new Point(x2 - this.width, y2 + borderWidthAfter));
                    pdfCanvas4 = canvas;
                    x1 = x12;
                    pdfCanvas4.moveTo(x12 - this.width, y1 - borderWidthBefore).lineTo(clipPoint5.x, clipPoint5.y).lineTo(x2 - this.width, y2 + borderWidthAfter).lineTo(x1 - this.width, y1 - borderWidthBefore);
                } else {
                    pdfCanvas4 = canvas;
                    x32 = x22;
                    x1 = x12;
                    pdfCanvas4.moveTo(x1 - this.width, y1 - borderWidthBefore).lineTo(clipPoint14.x, clipPoint14.y).lineTo(clipPoint24.x, clipPoint24.y).lineTo(x2 - this.width, y2 + borderWidthAfter).lineTo(x1 - this.width, y1 - borderWidthBefore);
                }
                pdfCanvas4.clip().endPath();
                canvas.arc(x05 + innerRadiusFirst4, y05, x1 - widthHalf, y1 + innerRadiusBefore4 + innerRadiusBefore4, 270.0d, -90.0d).arcContinuous(x2 - widthHalf, (y2 - innerRadiusAfter4) - innerRadiusAfter4, x32 + innerRadiusSecond4, y36, 180.0d, -90.0d);
                break;
        }
        canvas.stroke().restoreState();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public float[] getStartingPointsForBorderSide(float x1, float y1, float x2, float y2, Side defaultSide) {
        float widthHalf = this.width / 2.0f;
        Side borderSide = getBorderSide(x1, y1, x2, y2, defaultSide);
        switch (borderSide) {
            case TOP:
                y1 += widthHalf;
                y2 += widthHalf;
                break;
            case RIGHT:
                x1 += widthHalf;
                x2 += widthHalf;
                break;
            case BOTTOM:
                y1 -= widthHalf;
                y2 -= widthHalf;
                break;
            case LEFT:
                x1 -= widthHalf;
                x2 -= widthHalf;
                break;
        }
        return new float[]{x1, y1, x2, y2};
    }
}
