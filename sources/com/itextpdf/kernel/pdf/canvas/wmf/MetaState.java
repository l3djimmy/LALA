package com.itextpdf.kernel.pdf.canvas.wmf;

import com.itextpdf.kernel.colors.Color;
import com.itextpdf.kernel.colors.ColorConstants;
import com.itextpdf.kernel.geom.Point;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import java.util.ArrayList;
import java.util.List;
import java.util.Stack;
/* loaded from: classes12.dex */
public class MetaState {
    public static final int ALTERNATE = 1;
    public static final int OPAQUE = 2;
    public static final int TA_BASELINE = 24;
    public static final int TA_BOTTOM = 8;
    public static final int TA_CENTER = 6;
    public static final int TA_LEFT = 0;
    public static final int TA_NOUPDATECP = 0;
    public static final int TA_RIGHT = 2;
    public static final int TA_TOP = 0;
    public static final int TA_UPDATECP = 1;
    public static final int TRANSPARENT = 1;
    public static final int WINDING = 2;
    public List<MetaObject> MetaObjects;
    public int backgroundMode;
    public Color currentBackgroundColor;
    public MetaBrush currentBrush;
    public MetaFont currentFont;
    public MetaPen currentPen;
    public Point currentPoint;
    public Color currentTextColor;
    public int extentWx;
    public int extentWy;
    public int lineJoin;
    public int offsetWx;
    public int offsetWy;
    public int polyFillMode;
    public Stack<MetaState> savedStates;
    public float scalingX;
    public float scalingY;
    public int textAlign;

    public MetaState() {
        this.currentBackgroundColor = ColorConstants.WHITE;
        this.currentTextColor = ColorConstants.BLACK;
        this.backgroundMode = 2;
        this.polyFillMode = 1;
        this.lineJoin = 1;
        this.savedStates = new Stack<>();
        this.MetaObjects = new ArrayList();
        this.currentPoint = new Point(0, 0);
        this.currentPen = new MetaPen();
        this.currentBrush = new MetaBrush();
        this.currentFont = new MetaFont();
    }

    public MetaState(MetaState state) {
        this.currentBackgroundColor = ColorConstants.WHITE;
        this.currentTextColor = ColorConstants.BLACK;
        this.backgroundMode = 2;
        this.polyFillMode = 1;
        this.lineJoin = 1;
        setMetaState(state);
    }

    public void setMetaState(MetaState state) {
        this.savedStates = state.savedStates;
        this.MetaObjects = state.MetaObjects;
        this.currentPoint = state.currentPoint;
        this.currentPen = state.currentPen;
        this.currentBrush = state.currentBrush;
        this.currentFont = state.currentFont;
        this.currentBackgroundColor = state.currentBackgroundColor;
        this.currentTextColor = state.currentTextColor;
        this.backgroundMode = state.backgroundMode;
        this.polyFillMode = state.polyFillMode;
        this.textAlign = state.textAlign;
        this.lineJoin = state.lineJoin;
        this.offsetWx = state.offsetWx;
        this.offsetWy = state.offsetWy;
        this.extentWx = state.extentWx;
        this.extentWy = state.extentWy;
        this.scalingX = state.scalingX;
        this.scalingY = state.scalingY;
    }

    public void addMetaObject(MetaObject object) {
        int k = 0;
        while (true) {
            int size = this.MetaObjects.size();
            List<MetaObject> list = this.MetaObjects;
            if (k < size) {
                if (list.get(k) != null) {
                    k++;
                } else {
                    this.MetaObjects.set(k, object);
                    return;
                }
            } else {
                list.add(object);
                return;
            }
        }
    }

    public void selectMetaObject(int index, PdfCanvas cb) {
        MetaObject obj = this.MetaObjects.get(index);
        if (obj == null) {
            return;
        }
        switch (obj.getType()) {
            case 1:
                this.currentPen = (MetaPen) obj;
                int style = this.currentPen.getStyle();
                if (style != 5) {
                    Color color = this.currentPen.getColor();
                    cb.setStrokeColor(color);
                    cb.setLineWidth(Math.abs((this.currentPen.getPenWidth() * this.scalingX) / this.extentWx));
                    switch (style) {
                        case 1:
                            cb.setLineDash(18.0f, 6.0f, 0.0f);
                            return;
                        case 2:
                            cb.setLineDash(3.0f, 0.0f);
                            return;
                        case 3:
                            cb.writeLiteral("[9 6 3 6]0 d\n");
                            return;
                        case 4:
                            cb.writeLiteral("[9 3 3 3 3 3]0 d\n");
                            return;
                        default:
                            cb.setLineDash(0.0f);
                            return;
                    }
                }
                return;
            case 2:
                this.currentBrush = (MetaBrush) obj;
                int style2 = this.currentBrush.getStyle();
                if (style2 == 0) {
                    Color color2 = this.currentBrush.getColor();
                    cb.setFillColor(color2);
                    return;
                } else if (style2 == 2) {
                    Color color3 = this.currentBackgroundColor;
                    cb.setFillColor(color3);
                    return;
                } else {
                    return;
                }
            case 3:
                this.currentFont = (MetaFont) obj;
                return;
            default:
                return;
        }
    }

    public void deleteMetaObject(int index) {
        this.MetaObjects.set(index, null);
    }

    public void saveState(PdfCanvas cb) {
        cb.saveState();
        MetaState state = new MetaState(this);
        this.savedStates.push(state);
    }

    public void restoreState(int index, PdfCanvas cb) {
        int pops;
        Stack<MetaState> stack = this.savedStates;
        if (index < 0) {
            pops = Math.min(-index, stack.size());
        } else {
            int pops2 = stack.size();
            pops = Math.max(pops2 - index, 0);
        }
        if (pops == 0) {
            return;
        }
        MetaState state = null;
        while (true) {
            int pops3 = pops - 1;
            if (pops != 0) {
                cb.restoreState();
                MetaState state2 = this.savedStates.pop();
                state = state2;
                pops = pops3;
            } else {
                setMetaState(state);
                return;
            }
        }
    }

    public void cleanup(PdfCanvas cb) {
        int k = this.savedStates.size();
        while (true) {
            int k2 = k - 1;
            if (k > 0) {
                cb.restoreState();
                k = k2;
            } else {
                return;
            }
        }
    }

    public float transformX(int x) {
        return ((x - this.offsetWx) * this.scalingX) / this.extentWx;
    }

    public float transformY(int y) {
        return (1.0f - ((y - this.offsetWy) / this.extentWy)) * this.scalingY;
    }

    public void setScalingX(float scalingX) {
        this.scalingX = scalingX;
    }

    public void setScalingY(float scalingY) {
        this.scalingY = scalingY;
    }

    public void setOffsetWx(int offsetWx) {
        this.offsetWx = offsetWx;
    }

    public void setOffsetWy(int offsetWy) {
        this.offsetWy = offsetWy;
    }

    public void setExtentWx(int extentWx) {
        this.extentWx = extentWx;
    }

    public void setExtentWy(int extentWy) {
        this.extentWy = extentWy;
    }

    public float transformAngle(float angle) {
        float ta = this.scalingY < 0.0f ? -angle : angle;
        return (float) (this.scalingX < 0.0f ? 3.141592653589793d - ta : ta);
    }

    public void setCurrentPoint(Point p) {
        this.currentPoint = p;
    }

    public Point getCurrentPoint() {
        return this.currentPoint;
    }

    public MetaBrush getCurrentBrush() {
        return this.currentBrush;
    }

    public MetaPen getCurrentPen() {
        return this.currentPen;
    }

    public MetaFont getCurrentFont() {
        return this.currentFont;
    }

    public Color getCurrentBackgroundColor() {
        return this.currentBackgroundColor;
    }

    public void setCurrentBackgroundColor(Color currentBackgroundColor) {
        this.currentBackgroundColor = currentBackgroundColor;
    }

    public Color getCurrentTextColor() {
        return this.currentTextColor;
    }

    public void setCurrentTextColor(Color currentTextColor) {
        this.currentTextColor = currentTextColor;
    }

    public int getBackgroundMode() {
        return this.backgroundMode;
    }

    public void setBackgroundMode(int backgroundMode) {
        this.backgroundMode = backgroundMode;
    }

    public int getTextAlign() {
        return this.textAlign;
    }

    public void setTextAlign(int textAlign) {
        this.textAlign = textAlign;
    }

    public int getPolyFillMode() {
        return this.polyFillMode;
    }

    public void setPolyFillMode(int polyFillMode) {
        this.polyFillMode = polyFillMode;
    }

    public void setLineJoinRectangle(PdfCanvas cb) {
        if (this.lineJoin != 0) {
            this.lineJoin = 0;
            cb.setLineJoinStyle(0);
        }
    }

    public void setLineJoinPolygon(PdfCanvas cb) {
        if (this.lineJoin == 0) {
            this.lineJoin = 1;
            cb.setLineJoinStyle(1);
        }
    }

    public boolean getLineNeutral() {
        return this.lineJoin == 0;
    }
}
