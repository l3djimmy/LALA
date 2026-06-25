package com.itextpdf.kernel.geom;

import androidx.camera.video.AudioStats;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfPage;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
/* loaded from: classes12.dex */
public class Rectangle implements Cloneable {
    static float EPS = 1.0E-4f;
    protected float height;
    protected float width;
    protected float x;
    protected float y;

    public Rectangle(float x, float y, float width, float height) {
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
    }

    public Rectangle(float width, float height) {
        this(0.0f, 0.0f, width, height);
    }

    public Rectangle(Rectangle rect) {
        this(rect.getX(), rect.getY(), rect.getWidth(), rect.getHeight());
    }

    public static Rectangle getCommonRectangle(Rectangle... rectangles) {
        float ury = -3.4028235E38f;
        float llx = Float.MAX_VALUE;
        float lly = Float.MAX_VALUE;
        float urx = -3.4028235E38f;
        for (Rectangle rectangle : rectangles) {
            if (rectangle != null) {
                Rectangle rec = rectangle.mo7327clone();
                if (rec.getY() < lly) {
                    lly = rec.getY();
                }
                if (rec.getX() < llx) {
                    llx = rec.getX();
                }
                if (rec.getY() + rec.getHeight() > ury) {
                    ury = rec.getY() + rec.getHeight();
                }
                if (rec.getX() + rec.getWidth() > urx) {
                    urx = rec.getX() + rec.getWidth();
                }
            }
        }
        return new Rectangle(llx, lly, urx - llx, ury - lly);
    }

    public static Rectangle getRectangleOnRotatedPage(Rectangle rect, PdfPage page) {
        int rotation = page.getRotation();
        if (rotation == 0) {
            return rect;
        }
        Rectangle pageSize = page.getPageSize();
        switch ((rotation / 90) % 4) {
            case 1:
                Rectangle resultRect = new Rectangle(pageSize.getWidth() - rect.getTop(), rect.getLeft(), rect.getHeight(), rect.getWidth());
                return resultRect;
            case 2:
                Rectangle resultRect2 = new Rectangle(pageSize.getWidth() - rect.getRight(), pageSize.getHeight() - rect.getTop(), rect.getWidth(), rect.getHeight());
                return resultRect2;
            case 3:
                Rectangle resultRect3 = new Rectangle(rect.getLeft(), pageSize.getHeight() - rect.getRight(), rect.getHeight(), rect.getWidth());
                return resultRect3;
            default:
                return rect;
        }
    }

    public static Rectangle calculateBBox(List<Point> points) {
        List<Double> xs = new ArrayList<>();
        List<Double> ys = new ArrayList<>();
        for (Point point : points) {
            xs.add(Double.valueOf(point.getX()));
            ys.add(Double.valueOf(point.getY()));
        }
        double left = ((Double) Collections.min(xs)).doubleValue();
        double bottom = ((Double) Collections.min(ys)).doubleValue();
        double right = ((Double) Collections.max(xs)).doubleValue();
        double top = ((Double) Collections.max(ys)).doubleValue();
        return new Rectangle((float) left, (float) bottom, (float) (right - left), (float) (top - bottom));
    }

    public Point[] toPointsArray() {
        return new Point[]{new Point(this.x, this.y), new Point(this.x + this.width, this.y), new Point(this.x + this.width, this.y + this.height), new Point(this.x, this.y + this.height)};
    }

    public Rectangle getIntersection(Rectangle rect) {
        float llx = Math.max(this.x, rect.x);
        float lly = Math.max(this.y, rect.y);
        float urx = Math.min(getRight(), rect.getRight());
        float ury = Math.min(getTop(), rect.getTop());
        float width = urx - llx;
        if (Math.abs(width) < EPS) {
            width = 0.0f;
        }
        float height = ury - lly;
        if (Math.abs(height) < EPS) {
            height = 0.0f;
        }
        if (Float.compare(width, 0.0f) < 0 || Float.compare(height, 0.0f) < 0) {
            return null;
        }
        if (Float.compare(width, 0.0f) < 0) {
            width = 0.0f;
        }
        if (Float.compare(height, 0.0f) < 0) {
            height = 0.0f;
        }
        Rectangle result = new Rectangle(llx, lly, width, height);
        return result;
    }

    public boolean contains(Rectangle rect) {
        float llx = getX();
        float lly = getY();
        float urx = getWidth() + llx;
        float ury = getHeight() + lly;
        float rllx = rect.getX();
        float rlly = rect.getY();
        float rurx = rect.getWidth() + rllx;
        float rury = rect.getHeight() + rlly;
        return llx - EPS <= rllx && lly - EPS <= rlly && rurx <= EPS + urx && rury <= EPS + ury;
    }

    public boolean overlaps(Rectangle rect) {
        return overlaps(rect, -EPS);
    }

    public boolean overlaps(Rectangle rect, float epsilon) {
        return getX() + getWidth() >= rect.getX() + epsilon && getX() + epsilon <= rect.getX() + rect.getWidth() && getY() + getHeight() >= rect.getY() + epsilon && getY() + epsilon <= rect.getY() + rect.getHeight();
    }

    public Rectangle setBbox(float llx, float lly, float urx, float ury) {
        if (llx > urx) {
            llx = urx;
            urx = llx;
        }
        if (lly > ury) {
            lly = ury;
            ury = lly;
        }
        this.x = llx;
        this.y = lly;
        this.width = urx - llx;
        this.height = ury - lly;
        return this;
    }

    public float getX() {
        return this.x;
    }

    public Rectangle setX(float x) {
        this.x = x;
        return this;
    }

    public float getY() {
        return this.y;
    }

    public Rectangle setY(float y) {
        this.y = y;
        return this;
    }

    public float getWidth() {
        return this.width;
    }

    public Rectangle setWidth(float width) {
        this.width = width;
        return this;
    }

    public float getHeight() {
        return this.height;
    }

    public Rectangle setHeight(float height) {
        this.height = height;
        return this;
    }

    public Rectangle increaseHeight(float extra) {
        this.height += extra;
        return this;
    }

    public Rectangle decreaseHeight(float extra) {
        this.height -= extra;
        return this;
    }

    public Rectangle increaseWidth(float extra) {
        this.width += extra;
        return this;
    }

    public Rectangle decreaseWidth(float extra) {
        this.width -= extra;
        return this;
    }

    public float getLeft() {
        return this.x;
    }

    public float getRight() {
        return this.x + this.width;
    }

    public float getTop() {
        return this.y + this.height;
    }

    public float getBottom() {
        return this.y;
    }

    public Rectangle moveDown(float move) {
        this.y -= move;
        return this;
    }

    public Rectangle moveUp(float move) {
        this.y += move;
        return this;
    }

    public Rectangle moveRight(float move) {
        this.x += move;
        return this;
    }

    public Rectangle moveLeft(float move) {
        this.x -= move;
        return this;
    }

    public Rectangle applyMargins(float topIndent, float rightIndent, float bottomIndent, float leftIndent, boolean reverse) {
        this.x += (reverse ? -1 : 1) * leftIndent;
        this.width -= (leftIndent + rightIndent) * (reverse ? -1 : 1);
        this.y += (reverse ? -1 : 1) * bottomIndent;
        this.height -= (topIndent + bottomIndent) * (reverse ? -1 : 1);
        return this;
    }

    public boolean intersectsLine(float x1, float y1, float x2, float y2) {
        double rx1 = getX();
        double ry1 = getY();
        double rx2 = getWidth() + rx1;
        double ry2 = getHeight() + ry1;
        if ((rx1 > x1 || x1 > rx2 || ry1 > y1 || y1 > ry2) && (rx1 > x2 || x2 > rx2 || ry1 > y2 || y2 > ry2)) {
            if (!linesIntersect(rx1, ry1, rx2, ry2, x1, y1, x2, y2) && !linesIntersect(rx2, ry1, rx1, ry2, x1, y1, x2, y2)) {
                return false;
            }
        }
        return true;
    }

    public String toString() {
        return "Rectangle: " + getWidth() + 'x' + getHeight();
    }

    @Override // 
    /* renamed from: clone */
    public Rectangle mo7327clone() {
        try {
            return (Rectangle) super.clone();
        } catch (CloneNotSupportedException e) {
            return null;
        }
    }

    public boolean equalsWithEpsilon(Rectangle that) {
        return equalsWithEpsilon(that, EPS);
    }

    public boolean equalsWithEpsilon(Rectangle that, float eps) {
        float dx = Math.abs(this.x - that.x);
        float dy = Math.abs(this.y - that.y);
        float dw = Math.abs(this.width - that.width);
        float dh = Math.abs(this.height - that.height);
        return dx < eps && dy < eps && dw < eps && dh < eps;
    }

    private static boolean linesIntersect(double x1, double y1, double x2, double y2, double x3, double y3, double x4, double y4) {
        double x22 = x2 - x1;
        double y22 = y2 - y1;
        double x32 = x3 - x1;
        double y32 = y3 - y1;
        double x42 = x4 - x1;
        double y42 = y4 - y1;
        double AvB = (x22 * y32) - (x32 * y22);
        double AvC = (x22 * y42) - (x42 * y22);
        if (AvB == AudioStats.AUDIO_AMPLITUDE_NONE && AvC == AudioStats.AUDIO_AMPLITUDE_NONE) {
            if (x22 != AudioStats.AUDIO_AMPLITUDE_NONE) {
                if (x42 * x32 > AudioStats.AUDIO_AMPLITUDE_NONE) {
                    if (x32 * x22 >= AudioStats.AUDIO_AMPLITUDE_NONE) {
                        if (x22 > AudioStats.AUDIO_AMPLITUDE_NONE) {
                            if (x32 <= x22 || x42 <= x22) {
                                return true;
                            }
                        } else if (x32 >= x22 || x42 >= x22) {
                            return true;
                        }
                    }
                    return false;
                }
                return true;
            } else if (y22 != AudioStats.AUDIO_AMPLITUDE_NONE) {
                if (y42 * y32 > AudioStats.AUDIO_AMPLITUDE_NONE) {
                    if (y32 * y22 >= AudioStats.AUDIO_AMPLITUDE_NONE) {
                        if (y22 > AudioStats.AUDIO_AMPLITUDE_NONE) {
                            if (y32 <= y22 || y42 <= y22) {
                                return true;
                            }
                        } else if (y32 >= y22 || y42 >= y22) {
                            return true;
                        }
                    }
                    return false;
                }
                return true;
            } else {
                return false;
            }
        }
        double BvC = (x32 * y42) - (x42 * y32);
        return AvB * AvC <= AudioStats.AUDIO_AMPLITUDE_NONE && ((AvB + BvC) - AvC) * BvC <= AudioStats.AUDIO_AMPLITUDE_NONE;
    }

    public static List<Rectangle> createBoundingRectanglesFromQuadPoint(PdfArray quadPoints) throws PdfException {
        List<Rectangle> boundingRectangles = new ArrayList<>();
        if (quadPoints.size() % 8 != 0) {
            throw new PdfException(KernelExceptionMessageConstant.QUAD_POINT_ARRAY_LENGTH_IS_NOT_A_MULTIPLE_OF_EIGHT);
        }
        for (int i = 0; i < quadPoints.size(); i += 8) {
            float[] quadPointEntry = Arrays.copyOfRange(quadPoints.toFloatArray(), i, i + 8);
            PdfArray quadPointEntryFA = new PdfArray(quadPointEntry);
            boundingRectangles.add(createBoundingRectangleFromQuadPoint(quadPointEntryFA));
        }
        return boundingRectangles;
    }

    public static Rectangle createBoundingRectangleFromQuadPoint(PdfArray quadPoints) throws PdfException {
        if (quadPoints.size() % 8 != 0) {
            throw new PdfException(KernelExceptionMessageConstant.QUAD_POINT_ARRAY_LENGTH_IS_NOT_A_MULTIPLE_OF_EIGHT);
        }
        float llx = Float.MAX_VALUE;
        float lly = Float.MAX_VALUE;
        float urx = -3.4028235E38f;
        float ury = -3.4028235E38f;
        for (int j = 0; j < 8; j += 2) {
            float x = quadPoints.getAsNumber(j).floatValue();
            float y = quadPoints.getAsNumber(j + 1).floatValue();
            if (x < llx) {
                llx = x;
            }
            if (x > urx) {
                urx = x;
            }
            if (y < lly) {
                lly = y;
            }
            if (y > ury) {
                ury = y;
            }
        }
        return new Rectangle(llx, lly, urx - llx, ury - lly);
    }
}
