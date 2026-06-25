package com.itextpdf.kernel.pdf.canvas.wmf;

import androidx.camera.video.AudioStats;
import com.google.android.material.internal.ViewUtils;
import com.itextpdf.io.font.FontProgram;
import com.itextpdf.io.image.ImageData;
import com.itextpdf.io.image.ImageDataFactory;
import com.itextpdf.io.image.ImageType;
import com.itextpdf.kernel.colors.Color;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.geom.Point;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import com.itextpdf.kernel.pdf.xobject.PdfImageXObject;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;
import kotlin.UByte;
/* loaded from: classes12.dex */
public class MetaDo {
    public static final int META_ANIMATEPALETTE = 1078;
    public static final int META_ARC = 2071;
    public static final int META_BITBLT = 2338;
    public static final int META_CHORD = 2096;
    public static final int META_CREATEBRUSHINDIRECT = 764;
    public static final int META_CREATEFONTINDIRECT = 763;
    public static final int META_CREATEPALETTE = 247;
    public static final int META_CREATEPATTERNBRUSH = 505;
    public static final int META_CREATEPENINDIRECT = 762;
    public static final int META_CREATEREGION = 1791;
    public static final int META_DELETEOBJECT = 496;
    public static final int META_DIBBITBLT = 2368;
    public static final int META_DIBCREATEPATTERNBRUSH = 322;
    public static final int META_DIBSTRETCHBLT = 2881;
    public static final int META_ELLIPSE = 1048;
    public static final int META_ESCAPE = 1574;
    public static final int META_EXCLUDECLIPRECT = 1045;
    public static final int META_EXTFLOODFILL = 1352;
    public static final int META_EXTTEXTOUT = 2610;
    public static final int META_FILLREGION = 552;
    public static final int META_FLOODFILL = 1049;
    public static final int META_FRAMEREGION = 1065;
    public static final int META_INTERSECTCLIPRECT = 1046;
    public static final int META_INVERTREGION = 298;
    public static final int META_LINETO = 531;
    public static final int META_MOVETO = 532;
    public static final int META_OFFSETCLIPRGN = 544;
    public static final int META_OFFSETVIEWPORTORG = 529;
    public static final int META_OFFSETWINDOWORG = 527;
    public static final int META_PAINTREGION = 299;
    public static final int META_PATBLT = 1565;
    public static final int META_PIE = 2074;
    public static final int META_POLYGON = 804;
    public static final int META_POLYLINE = 805;
    public static final int META_POLYPOLYGON = 1336;
    public static final int META_REALIZEPALETTE = 53;
    public static final int META_RECTANGLE = 1051;
    public static final int META_RESIZEPALETTE = 313;
    public static final int META_RESTOREDC = 295;
    public static final int META_ROUNDRECT = 1564;
    public static final int META_SAVEDC = 30;
    public static final int META_SCALEVIEWPORTEXT = 1042;
    public static final int META_SCALEWINDOWEXT = 1040;
    public static final int META_SELECTCLIPREGION = 300;
    public static final int META_SELECTOBJECT = 301;
    public static final int META_SELECTPALETTE = 564;
    public static final int META_SETBKCOLOR = 513;
    public static final int META_SETBKMODE = 258;
    public static final int META_SETDIBTODEV = 3379;
    public static final int META_SETMAPMODE = 259;
    public static final int META_SETMAPPERFLAGS = 561;
    public static final int META_SETPALENTRIES = 55;
    public static final int META_SETPIXEL = 1055;
    public static final int META_SETPOLYFILLMODE = 262;
    public static final int META_SETRELABS = 261;
    public static final int META_SETROP2 = 260;
    public static final int META_SETSTRETCHBLTMODE = 263;
    public static final int META_SETTEXTALIGN = 302;
    public static final int META_SETTEXTCHAREXTRA = 264;
    public static final int META_SETTEXTCOLOR = 521;
    public static final int META_SETTEXTJUSTIFICATION = 522;
    public static final int META_SETVIEWPORTEXT = 526;
    public static final int META_SETVIEWPORTORG = 525;
    public static final int META_SETWINDOWEXT = 524;
    public static final int META_SETWINDOWORG = 523;
    public static final int META_STRETCHBLT = 2851;
    public static final int META_STRETCHDIB = 3907;
    public static final int META_TEXTOUT = 1313;
    int bottom;
    public PdfCanvas cb;
    public InputMeta in;
    int inch;
    int left;
    int right;
    MetaState state = new MetaState();
    int top;

    public MetaDo(InputStream in, PdfCanvas cb) {
        this.cb = cb;
        this.in = new InputMeta(in);
    }

    public void readAll() throws IOException {
        int lenMarker;
        int tsize;
        String s;
        float arc2;
        char c;
        int y2;
        int y22;
        int x2;
        int y1;
        String s2;
        PdfImageXObject imageXObject;
        float width;
        float height;
        if (this.in.readInt() != -1698247209) {
            throw new PdfException(KernelExceptionMessageConstant.NOT_A_PLACEABLE_WINDOWS_METAFILE);
        }
        this.in.readWord();
        this.left = this.in.readShort();
        this.top = this.in.readShort();
        this.right = this.in.readShort();
        this.bottom = this.in.readShort();
        this.inch = this.in.readWord();
        this.state.setScalingX(((this.right - this.left) / this.inch) * 72.0f);
        this.state.setScalingY(((this.bottom - this.top) / this.inch) * 72.0f);
        this.state.setOffsetWx(this.left);
        this.state.setOffsetWy(this.top);
        this.state.setExtentWx(this.right - this.left);
        this.state.setExtentWy(this.bottom - this.top);
        this.in.readInt();
        this.in.readWord();
        this.in.skip(18);
        this.cb.setLineCapStyle(1);
        this.cb.setLineJoinStyle(1);
        while (true) {
            int lenMarker2 = this.in.getLength();
            int tsize2 = this.in.readInt();
            if (tsize2 < 3) {
                this.state.cleanup(this.cb);
                return;
            }
            int function = this.in.readWord();
            switch (function) {
                case 0:
                    lenMarker = lenMarker2;
                    tsize = tsize2;
                    break;
                case 30:
                    lenMarker = lenMarker2;
                    tsize = tsize2;
                    this.state.saveState(this.cb);
                    break;
                case META_CREATEPALETTE /* 247 */:
                case 322:
                case META_CREATEREGION /* 1791 */:
                    lenMarker = lenMarker2;
                    tsize = tsize2;
                    this.state.addMetaObject(new MetaObject());
                    break;
                case 258:
                    lenMarker = lenMarker2;
                    tsize = tsize2;
                    this.state.setBackgroundMode(this.in.readWord());
                    break;
                case 262:
                    lenMarker = lenMarker2;
                    tsize = tsize2;
                    this.state.setPolyFillMode(this.in.readWord());
                    break;
                case META_RESTOREDC /* 295 */:
                    lenMarker = lenMarker2;
                    tsize = tsize2;
                    int idx = this.in.readShort();
                    this.state.restoreState(idx, this.cb);
                    break;
                case 301:
                    lenMarker = lenMarker2;
                    tsize = tsize2;
                    int idx2 = this.in.readWord();
                    this.state.selectMetaObject(idx2, this.cb);
                    break;
                case 302:
                    lenMarker = lenMarker2;
                    tsize = tsize2;
                    this.state.setTextAlign(this.in.readWord());
                    break;
                case META_DELETEOBJECT /* 496 */:
                    lenMarker = lenMarker2;
                    tsize = tsize2;
                    int idx3 = this.in.readWord();
                    this.state.deleteMetaObject(idx3);
                    break;
                case 513:
                    lenMarker = lenMarker2;
                    tsize = tsize2;
                    this.state.setCurrentBackgroundColor(this.in.readColor());
                    break;
                case 521:
                    lenMarker = lenMarker2;
                    tsize = tsize2;
                    this.state.setCurrentTextColor(this.in.readColor());
                    break;
                case META_SETWINDOWORG /* 523 */:
                    lenMarker = lenMarker2;
                    tsize = tsize2;
                    this.state.setOffsetWy(this.in.readShort());
                    this.state.setOffsetWx(this.in.readShort());
                    break;
                case META_SETWINDOWEXT /* 524 */:
                    lenMarker = lenMarker2;
                    tsize = tsize2;
                    this.state.setExtentWy(this.in.readShort());
                    this.state.setExtentWx(this.in.readShort());
                    break;
                case 531:
                    lenMarker = lenMarker2;
                    tsize = tsize2;
                    int y = this.in.readShort();
                    int x = this.in.readShort();
                    Point p = this.state.getCurrentPoint();
                    this.cb.moveTo(this.state.transformX((int) p.getX()), this.state.transformY((int) p.getY()));
                    this.cb.lineTo(this.state.transformX(x), this.state.transformY(y));
                    this.cb.stroke();
                    this.state.setCurrentPoint(new Point(x, y));
                    break;
                case 532:
                    lenMarker = lenMarker2;
                    tsize = tsize2;
                    this.state.setCurrentPoint(new Point(this.in.readShort(), this.in.readShort()));
                    break;
                case META_CREATEPENINDIRECT /* 762 */:
                    lenMarker = lenMarker2;
                    tsize = tsize2;
                    MetaPen pen = new MetaPen();
                    pen.init(this.in);
                    this.state.addMetaObject(pen);
                    break;
                case META_CREATEFONTINDIRECT /* 763 */:
                    lenMarker = lenMarker2;
                    tsize = tsize2;
                    MetaFont font = new MetaFont();
                    font.init(this.in);
                    this.state.addMetaObject(font);
                    break;
                case META_CREATEBRUSHINDIRECT /* 764 */:
                    lenMarker = lenMarker2;
                    tsize = tsize2;
                    MetaBrush brush = new MetaBrush();
                    brush.init(this.in);
                    this.state.addMetaObject(brush);
                    break;
                case META_POLYGON /* 804 */:
                    lenMarker = lenMarker2;
                    tsize = tsize2;
                    if (isNullStrokeFill(false)) {
                        break;
                    } else {
                        int len = this.in.readWord();
                        int sx = this.in.readShort();
                        int sy = this.in.readShort();
                        this.cb.moveTo(this.state.transformX(sx), this.state.transformY(sy));
                        for (int k = 1; k < len; k++) {
                            this.cb.lineTo(this.state.transformX(this.in.readShort()), this.state.transformY(this.in.readShort()));
                        }
                        this.cb.lineTo(this.state.transformX(sx), this.state.transformY(sy));
                        strokeAndFill();
                        break;
                    }
                case META_POLYLINE /* 805 */:
                    lenMarker = lenMarker2;
                    tsize = tsize2;
                    this.state.setLineJoinPolygon(this.cb);
                    int len2 = this.in.readWord();
                    this.cb.moveTo(this.state.transformX(this.in.readShort()), this.state.transformY(this.in.readShort()));
                    for (int k2 = 1; k2 < len2; k2++) {
                        this.cb.lineTo(this.state.transformX(this.in.readShort()), this.state.transformY(this.in.readShort()));
                    }
                    this.cb.stroke();
                    break;
                case META_INTERSECTCLIPRECT /* 1046 */:
                    lenMarker = lenMarker2;
                    tsize = tsize2;
                    float b = this.state.transformY(this.in.readShort());
                    float r = this.state.transformX(this.in.readShort());
                    float t = this.state.transformY(this.in.readShort());
                    float l = this.state.transformX(this.in.readShort());
                    this.cb.rectangle(l, b, r - l, t - b);
                    this.cb.eoClip();
                    this.cb.endPath();
                    break;
                case META_ELLIPSE /* 1048 */:
                    lenMarker = lenMarker2;
                    tsize = tsize2;
                    if (isNullStrokeFill(this.state.getLineNeutral())) {
                        break;
                    } else {
                        int b2 = this.in.readShort();
                        int r2 = this.in.readShort();
                        int t2 = this.in.readShort();
                        this.cb.arc(this.state.transformX(this.in.readShort()), this.state.transformY(b2), this.state.transformX(r2), this.state.transformY(t2), AudioStats.AUDIO_AMPLITUDE_NONE, 360.0d);
                        strokeAndFill();
                        break;
                    }
                case META_RECTANGLE /* 1051 */:
                    lenMarker = lenMarker2;
                    if (!isNullStrokeFill(true)) {
                        float b3 = this.state.transformY(this.in.readShort());
                        float r3 = this.state.transformX(this.in.readShort());
                        float t3 = this.state.transformY(this.in.readShort());
                        float l2 = this.state.transformX(this.in.readShort());
                        tsize = tsize2;
                        this.cb.rectangle(l2, b3, r3 - l2, t3 - b3);
                        strokeAndFill();
                        break;
                    } else {
                        tsize = tsize2;
                        break;
                    }
                case META_SETPIXEL /* 1055 */:
                    lenMarker = lenMarker2;
                    Color color = this.in.readColor();
                    int y3 = this.in.readShort();
                    int x3 = this.in.readShort();
                    this.cb.saveState();
                    this.cb.setFillColor(color);
                    this.cb.rectangle(this.state.transformX(x3), this.state.transformY(y3), 0.20000000298023224d, 0.20000000298023224d);
                    this.cb.fill();
                    this.cb.restoreState();
                    tsize = tsize2;
                    break;
                case META_TEXTOUT /* 1313 */:
                    lenMarker = lenMarker2;
                    int count = this.in.readWord();
                    byte[] text = new byte[count];
                    int k3 = 0;
                    while (k3 < count) {
                        byte c2 = (byte) this.in.readByte();
                        if (c2 != 0) {
                            text[k3] = c2;
                            k3++;
                        }
                    }
                    try {
                        String s3 = new String(text, 0, k3, "Cp1252");
                        s = s3;
                    } catch (UnsupportedEncodingException e) {
                        s = new String(text, 0, k3);
                    }
                    this.in.skip(((count + 1) & 65534) - k3);
                    outputText(this.in.readShort(), this.in.readShort(), 0, 0, 0, 0, 0, s);
                    tsize = tsize2;
                    break;
                case META_POLYPOLYGON /* 1336 */:
                    lenMarker = lenMarker2;
                    if (isNullStrokeFill(false)) {
                        tsize = tsize2;
                        break;
                    } else {
                        int numPoly = this.in.readWord();
                        int[] lens = new int[numPoly];
                        for (int k4 = 0; k4 < lens.length; k4++) {
                            lens[k4] = this.in.readWord();
                        }
                        int j = 0;
                        while (j < lens.length) {
                            int len3 = lens[j];
                            int sx2 = this.in.readShort();
                            int sy2 = this.in.readShort();
                            this.cb.moveTo(this.state.transformX(sx2), this.state.transformY(sy2));
                            int k5 = 1;
                            while (k5 < len3) {
                                this.cb.lineTo(this.state.transformX(this.in.readShort()), this.state.transformY(this.in.readShort()));
                                k5++;
                                lens = lens;
                                j = j;
                            }
                            this.cb.lineTo(this.state.transformX(sx2), this.state.transformY(sy2));
                            j++;
                            lens = lens;
                        }
                        strokeAndFill();
                        tsize = tsize2;
                        break;
                    }
                case META_ROUNDRECT /* 1564 */:
                    lenMarker = lenMarker2;
                    if (!isNullStrokeFill(true)) {
                        float h = this.state.transformY(0) - this.state.transformY(this.in.readShort());
                        float w = this.state.transformX(this.in.readShort()) - this.state.transformX(0);
                        float b4 = this.state.transformY(this.in.readShort());
                        float r4 = this.state.transformX(this.in.readShort());
                        float t4 = this.state.transformY(this.in.readShort());
                        float l3 = this.state.transformX(this.in.readShort());
                        float h2 = t4 - b4;
                        this.cb.roundRectangle(l3, b4, r4 - l3, h2, (h + w) / 4.0f);
                        strokeAndFill();
                        tsize = tsize2;
                        break;
                    } else {
                        tsize = tsize2;
                        break;
                    }
                case META_ARC /* 2071 */:
                    lenMarker = lenMarker2;
                    if (!isNullStrokeFill(this.state.getLineNeutral())) {
                        float yend = this.state.transformY(this.in.readShort());
                        float xend = this.state.transformX(this.in.readShort());
                        float ystart = this.state.transformY(this.in.readShort());
                        float xstart = this.state.transformX(this.in.readShort());
                        float b5 = this.state.transformY(this.in.readShort());
                        float r5 = this.state.transformX(this.in.readShort());
                        float t5 = this.state.transformY(this.in.readShort());
                        float l4 = this.state.transformX(this.in.readShort());
                        float cx = (r5 + l4) / 2.0f;
                        float cy = (t5 + b5) / 2.0f;
                        float arc1 = getArc(cx, cy, xstart, ystart);
                        float arc22 = getArc(cx, cy, xend, yend) - arc1;
                        if (arc22 <= 0.0f) {
                            arc22 += 360.0f;
                        }
                        this.cb.arc(l4, b5, r5, t5, arc1, arc22);
                        this.cb.stroke();
                        tsize = tsize2;
                        break;
                    } else {
                        tsize = tsize2;
                        break;
                    }
                case META_PIE /* 2074 */:
                    lenMarker = lenMarker2;
                    if (!isNullStrokeFill(this.state.getLineNeutral())) {
                        float yend2 = this.state.transformY(this.in.readShort());
                        float xend2 = this.state.transformX(this.in.readShort());
                        float ystart2 = this.state.transformY(this.in.readShort());
                        float xstart2 = this.state.transformX(this.in.readShort());
                        float b6 = this.state.transformY(this.in.readShort());
                        float r6 = this.state.transformX(this.in.readShort());
                        float t6 = this.state.transformY(this.in.readShort());
                        float l5 = this.state.transformX(this.in.readShort());
                        float cx2 = (r6 + l5) / 2.0f;
                        float cy2 = (t6 + b6) / 2.0f;
                        float arc12 = getArc(cx2, cy2, xstart2, ystart2);
                        float arc23 = getArc(cx2, cy2, xend2, yend2) - arc12;
                        if (arc23 <= 0.0f) {
                            arc23 += 360.0f;
                        }
                        List<double[]> ar = PdfCanvas.bezierArc(l5, b6, r6, t6, arc12, arc23);
                        if (ar.size() == 0) {
                            tsize = tsize2;
                            break;
                        } else {
                            double[] pt = ar.get(0);
                            this.cb.moveTo(cx2, cy2);
                            this.cb.lineTo(pt[0], pt[1]);
                            for (int k6 = 0; k6 < ar.size(); k6++) {
                                double[] pt2 = ar.get(k6);
                                this.cb.curveTo(pt2[2], pt2[3], pt2[4], pt2[5], pt2[6], pt2[7]);
                            }
                            this.cb.lineTo(cx2, cy2);
                            strokeAndFill();
                            tsize = tsize2;
                            break;
                        }
                    } else {
                        tsize = tsize2;
                        break;
                    }
                case META_CHORD /* 2096 */:
                    lenMarker = lenMarker2;
                    if (!isNullStrokeFill(this.state.getLineNeutral())) {
                        float yend3 = this.state.transformY(this.in.readShort());
                        float xend3 = this.state.transformX(this.in.readShort());
                        float ystart3 = this.state.transformY(this.in.readShort());
                        float xstart3 = this.state.transformX(this.in.readShort());
                        float b7 = this.state.transformY(this.in.readShort());
                        float r7 = this.state.transformX(this.in.readShort());
                        float t7 = this.state.transformY(this.in.readShort());
                        float l6 = this.state.transformX(this.in.readShort());
                        float cx3 = (r7 + l6) / 2.0f;
                        float cy3 = (t7 + b7) / 2.0f;
                        float arc13 = getArc(cx3, cy3, xstart3, ystart3);
                        float arc24 = getArc(cx3, cy3, xend3, yend3) - arc13;
                        if (arc24 > 0.0f) {
                            arc2 = arc24;
                            c = 2;
                        } else {
                            arc2 = arc24 + 360.0f;
                            c = 2;
                        }
                        List<double[]> ar2 = PdfCanvas.bezierArc(l6, b7, r7, t7, arc13, arc2);
                        if (ar2.size() == 0) {
                            tsize = tsize2;
                            break;
                        } else {
                            double[] pt3 = ar2.get(0);
                            float cx4 = (float) pt3[0];
                            float cy4 = (float) pt3[1];
                            this.cb.moveTo(cx4, cy4);
                            for (int k7 = 0; k7 < ar2.size(); k7++) {
                                double[] pt4 = ar2.get(k7);
                                this.cb.curveTo(pt4[c], pt4[3], pt4[4], pt4[5], pt4[6], pt4[7]);
                            }
                            this.cb.lineTo(cx4, cy4);
                            strokeAndFill();
                            tsize = tsize2;
                            break;
                        }
                    } else {
                        tsize = tsize2;
                        break;
                    }
                case META_EXTTEXTOUT /* 2610 */:
                    lenMarker = lenMarker2;
                    int y4 = this.in.readShort();
                    int x4 = this.in.readShort();
                    int count2 = this.in.readWord();
                    int flag = this.in.readWord();
                    if ((flag & 6) == 0) {
                        y2 = 0;
                        y22 = 0;
                        x2 = 0;
                        y1 = 0;
                    } else {
                        int x1 = this.in.readShort();
                        int y12 = this.in.readShort();
                        int x22 = this.in.readShort();
                        int y23 = this.in.readShort();
                        y2 = y23;
                        y22 = x22;
                        x2 = y12;
                        y1 = x1;
                    }
                    byte[] text2 = new byte[count2];
                    int k8 = 0;
                    while (k8 < count2) {
                        byte c3 = (byte) this.in.readByte();
                        if (c3 != 0) {
                            text2[k8] = c3;
                            k8++;
                        }
                    }
                    try {
                        s2 = new String(text2, 0, k8, "Cp1252");
                    } catch (UnsupportedEncodingException e2) {
                        s2 = new String(text2, 0, k8);
                    }
                    int x12 = y1;
                    int x13 = x2;
                    int y13 = y22;
                    int x23 = y2;
                    outputText(x4, y4, flag, x12, x13, y13, x23, s2);
                    tsize = tsize2;
                    break;
                case META_DIBSTRETCHBLT /* 2881 */:
                case META_STRETCHDIB /* 3907 */:
                    this.in.readInt();
                    if (function == 3907) {
                        this.in.readWord();
                    }
                    int srcHeight = this.in.readShort();
                    int srcWidth = this.in.readShort();
                    int ySrc = this.in.readShort();
                    int xSrc = this.in.readShort();
                    float destHeight = this.state.transformY(this.in.readShort()) - this.state.transformY(0);
                    float destWidth = this.state.transformX(this.in.readShort()) - this.state.transformX(0);
                    float yDest = this.state.transformY(this.in.readShort());
                    float xDest = this.state.transformX(this.in.readShort());
                    byte[] b8 = new byte[(tsize2 * 2) - (this.in.getLength() - lenMarker2)];
                    for (int k9 = 0; k9 < b8.length; k9++) {
                        b8[k9] = (byte) this.in.readByte();
                    }
                    try {
                        this.cb.saveState();
                        lenMarker = lenMarker2;
                        try {
                            this.cb.rectangle(xDest, yDest, destWidth, destHeight);
                            this.cb.clip();
                            this.cb.endPath();
                            ImageData bmpImage = ImageDataFactory.createBmp(b8, true);
                            imageXObject = new PdfImageXObject(bmpImage);
                            width = (bmpImage.getWidth() * destWidth) / srcWidth;
                            height = ((-destHeight) * bmpImage.getHeight()) / srcHeight;
                            try {
                            } catch (Exception e3) {
                            }
                        } catch (Exception e4) {
                        }
                        try {
                            this.cb.addXObjectFittedIntoRectangle(imageXObject, new Rectangle(xDest - ((xSrc * destWidth) / srcWidth), (yDest + ((ySrc * destHeight) / srcHeight)) - height, width, height));
                            this.cb.restoreState();
                            tsize = tsize2;
                        } catch (Exception e5) {
                            tsize = tsize2;
                            this.in.skip((tsize * 2) - (this.in.getLength() - lenMarker));
                        }
                    } catch (Exception e6) {
                        lenMarker = lenMarker2;
                    }
                default:
                    lenMarker = lenMarker2;
                    tsize = tsize2;
                    break;
            }
            this.in.skip((tsize * 2) - (this.in.getLength() - lenMarker));
        }
    }

    public void outputText(int x, int y, int flag, int x1, int y1, int x2, int y2, String text) throws IOException {
        float tx;
        float ty;
        float f;
        MetaFont font = this.state.getCurrentFont();
        float refX = this.state.transformX(x);
        float refY = this.state.transformY(y);
        float angle = this.state.transformAngle(font.getAngle());
        float sin = (float) Math.sin(angle);
        float cos = (float) Math.cos(angle);
        float fontSize = font.getFontSize(this.state);
        FontProgram fp = font.getFont();
        int align = this.state.getTextAlign();
        int normalizedWidth = 0;
        byte[] bytes = font.encoding.convertToBytes(text);
        int length = bytes.length;
        int i = 0;
        while (i < length) {
            int i2 = i;
            byte b = bytes[i2];
            normalizedWidth += fp.getWidth(b & UByte.MAX_VALUE);
            i = i2 + 1;
        }
        float textWidth = FontProgram.convertTextSpaceToGlyphSpace(fontSize) * normalizedWidth;
        float descender = fp.getFontMetrics().getTypoDescender();
        float ury = fp.getFontMetrics().getBbox()[3];
        this.cb.saveState();
        this.cb.concatMatrix(cos, sin, -sin, cos, refX, refY);
        if ((align & 6) == 6) {
            tx = (-textWidth) / 2.0f;
        } else if ((align & 2) != 2) {
            tx = 0.0f;
        } else {
            tx = -textWidth;
        }
        if ((align & 24) == 24) {
            ty = 0.0f;
        } else if ((align & 8) == 8) {
            ty = -descender;
        } else {
            ty = -ury;
        }
        if (this.state.getBackgroundMode() == 2) {
            Color textColor = this.state.getCurrentBackgroundColor();
            this.cb.setFillColor(textColor);
            this.cb.rectangle(tx, ty + descender, textWidth, ury - descender);
            this.cb.fill();
        }
        Color textColor2 = this.state.getCurrentTextColor();
        this.cb.setFillColor(textColor2);
        this.cb.beginText();
        this.cb.setFontAndSize(PdfFontFactory.createFont(this.state.getCurrentFont().getFont(), "Cp1252", PdfFontFactory.EmbeddingStrategy.PREFER_EMBEDDED), fontSize);
        this.cb.setTextMatrix(tx, ty);
        this.cb.showText(text);
        this.cb.endText();
        if (!font.isUnderline()) {
            f = 15.0f;
        } else {
            f = 15.0f;
            this.cb.rectangle(tx, ty - (fontSize / 4.0f), textWidth, fontSize / 15.0f);
            this.cb.fill();
        }
        if (font.isStrikeout()) {
            this.cb.rectangle(tx, (fontSize / 3.0f) + ty, textWidth, fontSize / f);
            this.cb.fill();
        }
        this.cb.restoreState();
    }

    public boolean isNullStrokeFill(boolean isRectangle) {
        MetaPen pen = this.state.getCurrentPen();
        MetaBrush brush = this.state.getCurrentBrush();
        boolean result = true;
        boolean noPen = pen.getStyle() == 5;
        int style = brush.getStyle();
        boolean isBrush = style == 0 || (style == 2 && this.state.getBackgroundMode() == 2);
        if (!noPen || isBrush) {
            result = false;
        }
        if (!noPen) {
            MetaState metaState = this.state;
            if (isRectangle) {
                metaState.setLineJoinRectangle(this.cb);
            } else {
                metaState.setLineJoinPolygon(this.cb);
            }
        }
        return result;
    }

    public void strokeAndFill() {
        MetaPen pen = this.state.getCurrentPen();
        MetaBrush brush = this.state.getCurrentBrush();
        int penStyle = pen.getStyle();
        int brushStyle = brush.getStyle();
        if (penStyle == 5) {
            this.cb.closePath();
            int polyFillMode = this.state.getPolyFillMode();
            PdfCanvas pdfCanvas = this.cb;
            if (polyFillMode == 1) {
                pdfCanvas.eoFill();
                return;
            } else {
                pdfCanvas.fill();
                return;
            }
        }
        boolean isBrush = brushStyle == 0 || (brushStyle == 2 && this.state.getBackgroundMode() == 2);
        if (isBrush) {
            int polyFillMode2 = this.state.getPolyFillMode();
            PdfCanvas pdfCanvas2 = this.cb;
            if (polyFillMode2 == 1) {
                pdfCanvas2.closePathEoFillStroke();
                return;
            } else {
                pdfCanvas2.closePathFillStroke();
                return;
            }
        }
        this.cb.closePathStroke();
    }

    static float getArc(float xCenter, float yCenter, float xDot, float yDot) {
        double s = Math.atan2(yDot - yCenter, xDot - xCenter);
        if (s < AudioStats.AUDIO_AMPLITUDE_NONE) {
            s += 6.283185307179586d;
        }
        return (float) ((s / 3.141592653589793d) * 180.0d);
    }

    public static byte[] wrapBMP(ImageData image) throws IOException {
        byte[] data;
        if (image.getOriginalType() != ImageType.BMP) {
            throw new PdfException(KernelExceptionMessageConstant.ONLY_BMP_CAN_BE_WRAPPED_IN_WMF);
        }
        if (image.getData() == null) {
            InputStream imgIn = image.getUrl().openStream();
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            while (true) {
                int b = imgIn.read();
                if (b == -1) {
                    break;
                }
                out.write(b);
            }
            imgIn.close();
            data = out.toByteArray();
        } else {
            data = image.getData();
        }
        int sizeBmpWords = ((data.length - 14) + 1) >>> 1;
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        writeWord(os, 1);
        writeWord(os, 9);
        writeWord(os, ViewUtils.EDGE_TO_EDGE_FLAGS);
        writeDWord(os, sizeBmpWords + 36 + 3);
        writeWord(os, 1);
        writeDWord(os, sizeBmpWords + 14);
        writeWord(os, 0);
        writeDWord(os, 4);
        writeWord(os, 259);
        writeWord(os, 8);
        writeDWord(os, 5);
        writeWord(os, META_SETWINDOWORG);
        writeWord(os, 0);
        writeWord(os, 0);
        writeDWord(os, 5);
        writeWord(os, META_SETWINDOWEXT);
        writeWord(os, (int) image.getHeight());
        writeWord(os, (int) image.getWidth());
        writeDWord(os, sizeBmpWords + 13);
        writeWord(os, META_DIBSTRETCHBLT);
        writeDWord(os, 13369376);
        writeWord(os, (int) image.getHeight());
        writeWord(os, (int) image.getWidth());
        writeWord(os, 0);
        writeWord(os, 0);
        writeWord(os, (int) image.getHeight());
        writeWord(os, (int) image.getWidth());
        writeWord(os, 0);
        writeWord(os, 0);
        os.write(data, 14, data.length - 14);
        if ((data.length & 1) == 1) {
            os.write(0);
        }
        writeDWord(os, 3);
        writeWord(os, 0);
        os.close();
        return os.toByteArray();
    }

    public static void writeWord(OutputStream os, int v) throws IOException {
        os.write(v & 255);
        os.write((v >>> 8) & 255);
    }

    public static void writeDWord(OutputStream os, int v) throws IOException {
        writeWord(os, v & 65535);
        writeWord(os, 65535 & (v >>> 16));
    }
}
