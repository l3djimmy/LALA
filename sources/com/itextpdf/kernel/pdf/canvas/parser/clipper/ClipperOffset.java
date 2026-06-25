package com.itextpdf.kernel.pdf.canvas.parser.clipper;

import androidx.camera.video.AudioStats;
import com.itextpdf.kernel.pdf.canvas.parser.clipper.IClipper;
import com.itextpdf.kernel.pdf.canvas.parser.clipper.Point;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes12.dex */
public class ClipperOffset {
    private static final double DEFAULT_ARC_TOLERANCE = 0.25d;
    private static final double TOLERANCE = 1.0E-20d;
    private static final double TWO_PI = 6.283185307179586d;
    private final double arcTolerance;
    private double cos;
    private double delta;
    private Path destPoly;
    private Paths destPolys;
    private double inA;
    private Point.LongPoint lowest;
    private double miterLim;
    private final double miterLimit;
    private final List<Point.DoublePoint> normals;
    private final PolyNode polyNodes;
    private double sin;
    private Path srcPoly;
    private double stepsPerRad;

    private static boolean nearZero(double val) {
        return val > -1.0E-20d && val < TOLERANCE;
    }

    public ClipperOffset() {
        this(2.0d, DEFAULT_ARC_TOLERANCE);
    }

    public ClipperOffset(double miterLimit) {
        this(miterLimit, DEFAULT_ARC_TOLERANCE);
    }

    public ClipperOffset(double miterLimit, double arcTolerance) {
        this.miterLimit = miterLimit;
        this.arcTolerance = arcTolerance;
        this.lowest = new Point.LongPoint();
        this.lowest.setX(-1L);
        this.polyNodes = new PolyNode();
        this.normals = new ArrayList();
    }

    public void addPath(Path path, IClipper.JoinType joinType, IClipper.EndType endType) {
        int highI = path.size() - 1;
        if (highI < 0) {
            return;
        }
        PolyNode newNode = new PolyNode();
        newNode.setJoinType(joinType);
        newNode.setEndType(endType);
        if (endType == IClipper.EndType.CLOSED_LINE || endType == IClipper.EndType.CLOSED_POLYGON) {
            while (highI > 0 && path.get(0).equals(path.get(highI))) {
                highI--;
            }
        }
        newNode.getPolygon().add(path.get(0));
        int j = 0;
        int k = 0;
        for (int i = 1; i <= highI; i++) {
            if (!newNode.getPolygon().get(j).equals(path.get(i))) {
                j++;
                newNode.getPolygon().add(path.get(i));
                if (path.get(i).getY() > newNode.getPolygon().get(k).getY() || (path.get(i).getY() == newNode.getPolygon().get(k).getY() && path.get(i).getX() < newNode.getPolygon().get(k).getX())) {
                    k = j;
                }
            }
        }
        if (endType == IClipper.EndType.CLOSED_POLYGON && j < 2) {
            return;
        }
        this.polyNodes.addChild(newNode);
        if (endType != IClipper.EndType.CLOSED_POLYGON) {
            return;
        }
        if (this.lowest.getX() < 0) {
            this.lowest = new Point.LongPoint(this.polyNodes.getChildCount() - 1, k);
            return;
        }
        Point.LongPoint ip = this.polyNodes.getChilds().get((int) this.lowest.getX()).getPolygon().get((int) this.lowest.getY());
        if (newNode.getPolygon().get(k).getY() > ip.getY() || (newNode.getPolygon().get(k).getY() == ip.getY() && newNode.getPolygon().get(k).getX() < ip.getX())) {
            this.lowest = new Point.LongPoint(this.polyNodes.getChildCount() - 1, k);
        }
    }

    public void addPaths(Paths paths, IClipper.JoinType joinType, IClipper.EndType endType) {
        Iterator<Path> it = paths.iterator();
        while (it.hasNext()) {
            Path p = it.next();
            addPath(p, joinType, endType);
        }
    }

    public void clear() {
        this.polyNodes.getChilds().clear();
        this.lowest.setX(-1L);
    }

    private void doMiter(int j, int k, double r) {
        double q = this.delta / r;
        this.destPoly.add(new Point.LongPoint(Math.round(this.srcPoly.get(j).getX() + ((this.normals.get(k).getX() + this.normals.get(j).getX()) * q)), Math.round(this.srcPoly.get(j).getY() + ((this.normals.get(k).getY() + this.normals.get(j).getY()) * q))));
    }

    private void doOffset(double delta) {
        double y;
        double y2;
        double y3;
        int i;
        List<Point.DoublePoint> list;
        List<Point.DoublePoint> list2;
        double d;
        double d2 = delta;
        this.destPolys = new Paths();
        this.delta = d2;
        if (nearZero(d2)) {
            for (int i2 = 0; i2 < this.polyNodes.getChildCount(); i2++) {
                PolyNode node = this.polyNodes.getChilds().get(i2);
                if (node.getEndType() == IClipper.EndType.CLOSED_POLYGON) {
                    this.destPolys.add(node.getPolygon());
                }
            }
            return;
        }
        if (this.miterLimit > 2.0d) {
            this.miterLim = 2.0d / (this.miterLimit * this.miterLimit);
        } else {
            this.miterLim = 0.5d;
        }
        double d3 = this.arcTolerance;
        double d4 = AudioStats.AUDIO_AMPLITUDE_NONE;
        if (d3 <= AudioStats.AUDIO_AMPLITUDE_NONE) {
            y = DEFAULT_ARC_TOLERANCE;
        } else {
            double y4 = this.arcTolerance;
            if (y4 > Math.abs(d2) * DEFAULT_ARC_TOLERANCE) {
                y = Math.abs(d2) * DEFAULT_ARC_TOLERANCE;
            } else {
                y = this.arcTolerance;
            }
        }
        double steps = 3.141592653589793d / Math.acos(1.0d - (y / Math.abs(d2)));
        this.sin = Math.sin(TWO_PI / steps);
        this.cos = Math.cos(TWO_PI / steps);
        this.stepsPerRad = steps / TWO_PI;
        if (d2 < AudioStats.AUDIO_AMPLITUDE_NONE) {
            this.sin = -this.sin;
        }
        int i3 = 0;
        while (i3 < this.polyNodes.getChildCount()) {
            PolyNode node2 = this.polyNodes.getChilds().get(i3);
            this.srcPoly = node2.getPolygon();
            int len = this.srcPoly.size();
            if (len != 0) {
                if (d2 <= d4) {
                    if (len < 3) {
                        y2 = y;
                        y3 = d4;
                        i = i3;
                    } else if (node2.getEndType() != IClipper.EndType.CLOSED_POLYGON) {
                        y2 = y;
                        y3 = d4;
                        i = i3;
                    }
                }
                this.destPoly = new Path();
                if (len == 1) {
                    if (node2.getJoinType() == IClipper.JoinType.ROUND) {
                        double X = 1.0d;
                        double Y = AudioStats.AUDIO_AMPLITUDE_NONE;
                        double d5 = d4;
                        int j = 1;
                        d = d5;
                        while (true) {
                            double X2 = X;
                            if (j > steps) {
                                break;
                            }
                            this.destPoly.add(new Point.LongPoint(Math.round(this.srcPoly.get(0).getX() + (X2 * d2)), Math.round(this.srcPoly.get(0).getY() + (Y * delta))));
                            X = (X2 * this.cos) - (this.sin * Y);
                            double X22 = this.cos;
                            Y = (this.sin * X2) + (X22 * Y);
                            j++;
                            d2 = delta;
                            i3 = i3;
                        }
                        i = i3;
                    } else {
                        d = d4;
                        i = i3;
                        double X3 = -1.0d;
                        int j2 = 0;
                        double Y2 = -1.0d;
                        while (j2 < 4) {
                            double X4 = X3;
                            int j3 = j2;
                            this.destPoly.add(new Point.LongPoint(Math.round(this.srcPoly.get(0).getX() + (X4 * delta)), Math.round(this.srcPoly.get(0).getY() + (Y2 * delta))));
                            if (X4 < d) {
                                X3 = 1.0d;
                            } else if (Y2 < d) {
                                Y2 = 1.0d;
                                X3 = X4;
                            } else {
                                X3 = -1.0d;
                            }
                            j2 = j3 + 1;
                        }
                    }
                    this.destPolys.add(this.destPoly);
                    y2 = y;
                    y3 = d;
                } else {
                    double d6 = d4;
                    i = i3;
                    this.normals.clear();
                    for (int j4 = 0; j4 < len - 1; j4++) {
                        this.normals.add(Point.getUnitNormal(this.srcPoly.get(j4), this.srcPoly.get(j4 + 1)));
                    }
                    if (node2.getEndType() == IClipper.EndType.CLOSED_LINE || node2.getEndType() == IClipper.EndType.CLOSED_POLYGON) {
                        this.normals.add(Point.getUnitNormal(this.srcPoly.get(len - 1), this.srcPoly.get(0)));
                    } else {
                        this.normals.add(new Point.DoublePoint(this.normals.get(len - 2)));
                    }
                    if (node2.getEndType() == IClipper.EndType.CLOSED_POLYGON) {
                        int[] k = {len - 1};
                        for (int j5 = 0; j5 < len; j5++) {
                            offsetPoint(j5, k, node2.getJoinType());
                        }
                        this.destPolys.add(this.destPoly);
                        y2 = y;
                        y3 = d6;
                    } else if (node2.getEndType() == IClipper.EndType.CLOSED_LINE) {
                        int[] k2 = {len - 1};
                        for (int j6 = 0; j6 < len; j6++) {
                            offsetPoint(j6, k2, node2.getJoinType());
                        }
                        this.destPolys.add(this.destPoly);
                        this.destPoly = new Path();
                        Point.DoublePoint n = this.normals.get(len - 1);
                        int j7 = len - 1;
                        while (true) {
                            list2 = this.normals;
                            if (j7 <= 0) {
                                break;
                            }
                            list2.set(j7, new Point.DoublePoint(-this.normals.get(j7 - 1).getX(), -this.normals.get(j7 - 1).getY()));
                            j7--;
                            n = n;
                            y = y;
                        }
                        y2 = y;
                        Point.DoublePoint n2 = n;
                        list2.set(0, new Point.DoublePoint(-n2.getX(), -n2.getY(), AudioStats.AUDIO_AMPLITUDE_NONE));
                        k2[0] = 0;
                        for (int j8 = len - 1; j8 >= 0; j8--) {
                            offsetPoint(j8, k2, node2.getJoinType());
                        }
                        this.destPolys.add(this.destPoly);
                        y3 = d6;
                    } else {
                        y2 = y;
                        int[] k3 = new int[1];
                        for (int j9 = 1; j9 < len - 1; j9++) {
                            offsetPoint(j9, k3, node2.getJoinType());
                        }
                        if (node2.getEndType() == IClipper.EndType.OPEN_BUTT) {
                            int j10 = len - 1;
                            Point.LongPoint pt1 = new Point.LongPoint(Math.round(this.srcPoly.get(j10).getX() + (this.normals.get(j10).getX() * delta)), Math.round(this.srcPoly.get(j10).getY() + (this.normals.get(j10).getY() * delta)), 0L);
                            this.destPoly.add(pt1);
                            Point.LongPoint pt12 = new Point.LongPoint(Math.round(this.srcPoly.get(j10).getX() - (this.normals.get(j10).getX() * delta)), Math.round(this.srcPoly.get(j10).getY() - (this.normals.get(j10).getY() * delta)), 0L);
                            this.destPoly.add(pt12);
                        } else {
                            int j11 = len - 1;
                            k3[0] = len - 2;
                            this.inA = d6;
                            this.normals.set(j11, new Point.DoublePoint(-this.normals.get(j11).getX(), -this.normals.get(j11).getY()));
                            if (node2.getEndType() == IClipper.EndType.OPEN_SQUARE) {
                                doSquare(j11, k3[0], true);
                            } else {
                                doRound(j11, k3[0]);
                            }
                        }
                        int j12 = len - 1;
                        while (true) {
                            list = this.normals;
                            if (j12 <= 0) {
                                break;
                            }
                            list.set(j12, new Point.DoublePoint(-this.normals.get(j12 - 1).getX(), -this.normals.get(j12 - 1).getY()));
                            j12--;
                        }
                        list.set(0, new Point.DoublePoint(-this.normals.get(1).getX(), -this.normals.get(1).getY()));
                        k3[0] = len - 1;
                        for (int j13 = k3[0] - 1; j13 > 0; j13--) {
                            offsetPoint(j13, k3, node2.getJoinType());
                        }
                        if (node2.getEndType() == IClipper.EndType.OPEN_BUTT) {
                            Point.LongPoint pt13 = new Point.LongPoint(Math.round(this.srcPoly.get(0).getX() - (this.normals.get(0).getX() * delta)), Math.round(this.srcPoly.get(0).getY() - (this.normals.get(0).getY() * delta)));
                            this.destPoly.add(pt13);
                            Point.LongPoint pt14 = new Point.LongPoint(Math.round(this.srcPoly.get(0).getX() + (this.normals.get(0).getX() * delta)), Math.round(this.srcPoly.get(0).getY() + (this.normals.get(0).getY() * delta)));
                            this.destPoly.add(pt14);
                            y3 = AudioStats.AUDIO_AMPLITUDE_NONE;
                        } else {
                            k3[0] = 1;
                            y3 = AudioStats.AUDIO_AMPLITUDE_NONE;
                            this.inA = AudioStats.AUDIO_AMPLITUDE_NONE;
                            if (node2.getEndType() == IClipper.EndType.OPEN_SQUARE) {
                                doSquare(0, 1, true);
                            } else {
                                doRound(0, 1);
                            }
                        }
                        this.destPolys.add(this.destPoly);
                    }
                }
            } else {
                y2 = y;
                y3 = d4;
                i = i3;
            }
            i3 = i + 1;
            d2 = delta;
            d4 = y3;
            y = y2;
        }
    }

    private void doRound(int j, int k) {
        double a = Math.atan2(this.inA, (this.normals.get(k).getX() * this.normals.get(j).getX()) + (this.normals.get(k).getY() * this.normals.get(j).getY()));
        int steps = Math.max((int) Math.round(this.stepsPerRad * Math.abs(a)), 1);
        double X = this.normals.get(k).getX();
        double Y = this.normals.get(k).getY();
        int i = 0;
        while (true) {
            Path path = this.destPoly;
            if (i < steps) {
                path.add(new Point.LongPoint(Math.round(this.srcPoly.get(j).getX() + (this.delta * X)), Math.round(this.srcPoly.get(j).getY() + (this.delta * Y))));
                double X2 = X;
                X = (this.cos * X) - (this.sin * Y);
                Y = (this.sin * X2) + (this.cos * Y);
                i++;
                a = a;
                steps = steps;
            } else {
                path.add(new Point.LongPoint(Math.round(this.srcPoly.get(j).getX() + (this.normals.get(j).getX() * this.delta)), Math.round(this.srcPoly.get(j).getY() + (this.normals.get(j).getY() * this.delta))));
                return;
            }
        }
    }

    private void doSquare(int j, int k, boolean addExtra) {
        double nkx = this.normals.get(k).getX();
        double nky = this.normals.get(k).getY();
        double njx = this.normals.get(j).getX();
        double njy = this.normals.get(j).getY();
        double sjx = this.srcPoly.get(j).getX();
        double sjy = this.srcPoly.get(j).getY();
        double dx = Math.tan(Math.atan2(this.inA, (nkx * njx) + (nky * njy)) / 4.0d);
        Path path = this.destPoly;
        double dx2 = this.delta;
        double d = AudioStats.AUDIO_AMPLITUDE_NONE;
        path.add(new Point.LongPoint(Math.round((dx2 * (nkx - (addExtra ? nky * dx : 0.0d))) + sjx), Math.round((this.delta * (nky + (addExtra ? nkx * dx : 0.0d))) + sjy), 0L));
        Path path2 = this.destPoly;
        long round = Math.round((this.delta * (njx + (addExtra ? njy * dx : 0.0d))) + sjx);
        double d2 = this.delta;
        if (addExtra) {
            d = njx * dx;
        }
        path2.add(new Point.LongPoint(round, Math.round((d2 * (njy - d)) + sjy), 0L));
    }

    public void execute(Paths solution, double delta) {
        solution.clear();
        fixOrientations();
        doOffset(delta);
        DefaultClipper clpr = new DefaultClipper(1);
        clpr.addPaths(this.destPolys, IClipper.PolyType.SUBJECT, true);
        if (delta > AudioStats.AUDIO_AMPLITUDE_NONE) {
            clpr.execute(IClipper.ClipType.UNION, solution, IClipper.PolyFillType.POSITIVE, IClipper.PolyFillType.POSITIVE);
            return;
        }
        LongRect r = this.destPolys.getBounds();
        Path outer = new Path(4);
        outer.add(new Point.LongPoint(r.left - 10, r.bottom + 10, 0L));
        outer.add(new Point.LongPoint(r.right + 10, r.bottom + 10, 0L));
        outer.add(new Point.LongPoint(r.right + 10, r.top - 10, 0L));
        outer.add(new Point.LongPoint(r.left - 10, r.top - 10, 0L));
        clpr.addPath(outer, IClipper.PolyType.SUBJECT, true);
        clpr.execute(IClipper.ClipType.UNION, solution, IClipper.PolyFillType.NEGATIVE, IClipper.PolyFillType.NEGATIVE);
        if (solution.size() > 0) {
            solution.remove(0);
        }
    }

    public void execute(PolyTree solution, double delta) {
        solution.Clear();
        fixOrientations();
        doOffset(delta);
        DefaultClipper clpr = new DefaultClipper(1);
        clpr.addPaths(this.destPolys, IClipper.PolyType.SUBJECT, true);
        if (delta > AudioStats.AUDIO_AMPLITUDE_NONE) {
            clpr.execute(IClipper.ClipType.UNION, solution, IClipper.PolyFillType.POSITIVE, IClipper.PolyFillType.POSITIVE);
            return;
        }
        LongRect r = this.destPolys.getBounds();
        Path outer = new Path(4);
        outer.add(new Point.LongPoint(r.left - 10, r.bottom + 10, 0L));
        outer.add(new Point.LongPoint(r.right + 10, r.bottom + 10, 0L));
        outer.add(new Point.LongPoint(r.right + 10, r.top - 10, 0L));
        outer.add(new Point.LongPoint(r.left - 10, r.top - 10, 0L));
        clpr.addPath(outer, IClipper.PolyType.SUBJECT, true);
        clpr.execute(IClipper.ClipType.UNION, solution, IClipper.PolyFillType.NEGATIVE, IClipper.PolyFillType.NEGATIVE);
        if (solution.getChildCount() == 1 && solution.getChilds().get(0).getChildCount() > 0) {
            PolyNode outerNode = solution.getChilds().get(0);
            solution.getChilds().set(0, outerNode.getChilds().get(0));
            solution.getChilds().get(0).setParent(solution);
            for (int i = 1; i < outerNode.getChildCount(); i++) {
                solution.addChild(outerNode.getChilds().get(i));
            }
            return;
        }
        solution.Clear();
    }

    private void fixOrientations() {
        if (this.lowest.getX() >= 0 && !this.polyNodes.childs.get((int) this.lowest.getX()).getPolygon().orientation()) {
            for (int i = 0; i < this.polyNodes.getChildCount(); i++) {
                PolyNode node = this.polyNodes.childs.get(i);
                if (node.getEndType() == IClipper.EndType.CLOSED_POLYGON || (node.getEndType() == IClipper.EndType.CLOSED_LINE && node.getPolygon().orientation())) {
                    Collections.reverse(node.getPolygon());
                }
            }
            return;
        }
        for (int i2 = 0; i2 < this.polyNodes.getChildCount(); i2++) {
            PolyNode node2 = this.polyNodes.childs.get(i2);
            if (node2.getEndType() == IClipper.EndType.CLOSED_LINE && !node2.getPolygon().orientation()) {
                Collections.reverse(node2.getPolygon());
            }
        }
    }

    private void offsetPoint(int j, int[] kV, IClipper.JoinType jointype) {
        double nkx;
        double cosA;
        char c;
        int k = kV[0];
        double nkx2 = this.normals.get(k).getX();
        double nky = this.normals.get(k).getY();
        double njy = this.normals.get(j).getY();
        double njx = this.normals.get(j).getX();
        long sjx = this.srcPoly.get(j).getX();
        long sjy = this.srcPoly.get(j).getY();
        this.inA = (nkx2 * njy) - (njx * nky);
        if (Math.abs(this.delta * this.inA) < 1.0d) {
            if ((nkx2 * njx) + (njy * nky) > AudioStats.AUDIO_AMPLITUDE_NONE) {
                this.destPoly.add(new Point.LongPoint(Math.round(sjx + (nkx2 * this.delta)), Math.round(sjy + (this.delta * nky)), 0L));
                return;
            } else {
                nkx = nkx2;
                cosA = 1.0d;
            }
        } else {
            nkx = nkx2;
            if (this.inA > 1.0d) {
                this.inA = 1.0d;
                cosA = 1.0d;
            } else {
                cosA = 1.0d;
                if (this.inA < -1.0d) {
                    this.inA = -1.0d;
                }
            }
        }
        if (this.inA * this.delta < AudioStats.AUDIO_AMPLITUDE_NONE) {
            this.destPoly.add(new Point.LongPoint(Math.round(sjx + (this.delta * nkx)), Math.round(sjy + (this.delta * nky))));
            this.destPoly.add(this.srcPoly.get(j));
            this.destPoly.add(new Point.LongPoint(Math.round(sjx + (this.delta * njx)), Math.round(sjy + (this.delta * njy))));
            c = 0;
        } else {
            switch (jointype) {
                case MITER:
                    double r = (njx * nkx) + cosA + (njy * nky);
                    if (r >= this.miterLim) {
                        doMiter(j, k, r);
                        c = 0;
                        break;
                    } else {
                        c = 0;
                        doSquare(j, k, false);
                        break;
                    }
                case BEVEL:
                    doSquare(j, k, false);
                    c = 0;
                    break;
                case ROUND:
                    doRound(j, k);
                    c = 0;
                    break;
                default:
                    c = 0;
                    break;
            }
        }
        kV[c] = j;
    }
}
