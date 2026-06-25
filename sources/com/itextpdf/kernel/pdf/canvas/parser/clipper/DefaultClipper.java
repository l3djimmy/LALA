package com.itextpdf.kernel.pdf.canvas.parser.clipper;

import androidx.camera.video.AudioStats;
import com.itextpdf.kernel.pdf.canvas.parser.clipper.ClipperBase;
import com.itextpdf.kernel.pdf.canvas.parser.clipper.Edge;
import com.itextpdf.kernel.pdf.canvas.parser.clipper.IClipper;
import com.itextpdf.kernel.pdf.canvas.parser.clipper.Path;
import com.itextpdf.kernel.pdf.canvas.parser.clipper.Point;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Logger;
/* loaded from: classes12.dex */
public class DefaultClipper extends ClipperBase {
    private static final Logger LOGGER = Logger.getLogger(DefaultClipper.class.getName());
    private Edge activeEdges;
    private IClipper.PolyFillType clipFillType;
    private IClipper.ClipType clipType;
    private final List<Path.Join> ghostJoins;
    private final List<IntersectNode> intersectList;
    private final Comparator<IntersectNode> intersectNodeComparer;
    private final List<Path.Join> joins;
    private Path.Maxima maxima;
    protected final List<Path.OutRec> polyOuts;
    private final boolean reverseSolution;
    private ClipperBase.Scanbeam scanbeam;
    private Edge sortedEdges;
    private final boolean strictlySimple;
    private IClipper.PolyFillType subjFillType;
    private boolean usingPolyTree;
    public IClipper.IZFillCallback zFillFunction;

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public class IntersectNode {
        Edge Edge2;
        Edge edge1;
        private Point.LongPoint pt;

        private IntersectNode() {
        }

        public Point.LongPoint getPt() {
            return this.pt;
        }

        public void setPt(Point.LongPoint pt) {
            this.pt = pt;
        }
    }

    private static void getHorzDirection(Edge HorzEdge, IClipper.Direction[] Dir, long[] Left, long[] Right) {
        if (HorzEdge.getBot().getX() < HorzEdge.getTop().getX()) {
            Left[0] = HorzEdge.getBot().getX();
            Right[0] = HorzEdge.getTop().getX();
            Dir[0] = IClipper.Direction.LEFT_TO_RIGHT;
            return;
        }
        Left[0] = HorzEdge.getTop().getX();
        Right[0] = HorzEdge.getBot().getX();
        Dir[0] = IClipper.Direction.RIGHT_TO_LEFT;
    }

    private static boolean getOverlap(long a1, long a2, long b1, long b2, long[] Left, long[] Right) {
        if (a1 < a2) {
            if (b1 < b2) {
                Left[0] = Math.max(a1, b1);
                Right[0] = Math.min(a2, b2);
            } else {
                Left[0] = Math.max(a1, b2);
                Right[0] = Math.min(a2, b1);
            }
        } else if (b1 < b2) {
            Left[0] = Math.max(a2, b1);
            Right[0] = Math.min(a1, b2);
        } else {
            Left[0] = Math.max(a2, b2);
            Right[0] = Math.min(a1, b1);
        }
        return Left[0] < Right[0];
    }

    private static boolean isParam1RightOfParam2(Path.OutRec outRec1, Path.OutRec outRec2) {
        do {
            outRec1 = outRec1.firstLeft;
            if (outRec1 == outRec2) {
                return true;
            }
        } while (outRec1 != null);
        return false;
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x0062, code lost:
        return -1;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static int isPointInPolygon(com.itextpdf.kernel.pdf.canvas.parser.clipper.Point.LongPoint r27, com.itextpdf.kernel.pdf.canvas.parser.clipper.Path.OutPt r28) {
        /*
            Method dump skipped, instructions count: 257
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.itextpdf.kernel.pdf.canvas.parser.clipper.DefaultClipper.isPointInPolygon(com.itextpdf.kernel.pdf.canvas.parser.clipper.Point$LongPoint, com.itextpdf.kernel.pdf.canvas.parser.clipper.Path$OutPt):int");
    }

    /* JADX WARN: Code restructure failed: missing block: B:24:0x0087, code lost:
        if (r7.getPt().getX() == r11.getX()) goto L25;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x0089, code lost:
        r7 = r7.next;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x00f3, code lost:
        if (r7.getPt().getX() == r11.getX()) goto L85;
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x00f5, code lost:
        r7 = r7.next;
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x015e, code lost:
        if (r9.getPt().getX() == r11.getX()) goto L42;
     */
    /* JADX WARN: Code restructure failed: missing block: B:55:0x0160, code lost:
        r9 = r9.next;
     */
    /* JADX WARN: Code restructure failed: missing block: B:68:0x01ca, code lost:
        if (r9.getPt().getX() == r11.getX()) goto L66;
     */
    /* JADX WARN: Code restructure failed: missing block: B:69:0x01cc, code lost:
        r9 = r9.next;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static boolean joinHorz(com.itextpdf.kernel.pdf.canvas.parser.clipper.Path.OutPt r7, com.itextpdf.kernel.pdf.canvas.parser.clipper.Path.OutPt r8, com.itextpdf.kernel.pdf.canvas.parser.clipper.Path.OutPt r9, com.itextpdf.kernel.pdf.canvas.parser.clipper.Path.OutPt r10, com.itextpdf.kernel.pdf.canvas.parser.clipper.Point.LongPoint r11, boolean r12) {
        /*
            Method dump skipped, instructions count: 510
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.itextpdf.kernel.pdf.canvas.parser.clipper.DefaultClipper.joinHorz(com.itextpdf.kernel.pdf.canvas.parser.clipper.Path$OutPt, com.itextpdf.kernel.pdf.canvas.parser.clipper.Path$OutPt, com.itextpdf.kernel.pdf.canvas.parser.clipper.Path$OutPt, com.itextpdf.kernel.pdf.canvas.parser.clipper.Path$OutPt, com.itextpdf.kernel.pdf.canvas.parser.clipper.Point$LongPoint, boolean):boolean");
    }

    private boolean joinPoints(Path.Join j, Path.OutRec outRec1, Path.OutRec outRec2) {
        boolean DiscardLeftSide;
        Point.LongPoint Pt;
        Path.OutPt op1 = j.outPt1;
        Path.OutPt op2 = j.outPt2;
        boolean isHorizontal = j.outPt1.getPt().getY() == j.getOffPt().getY();
        if (isHorizontal && j.getOffPt().equals(j.outPt1.getPt()) && j.getOffPt().equals(j.outPt2.getPt())) {
            if (outRec1 != outRec2) {
                return false;
            }
            Path.OutPt op1b = j.outPt1.next;
            while (op1b != op1 && op1b.getPt().equals(j.getOffPt())) {
                op1b = op1b.next;
            }
            boolean reverse1 = op1b.getPt().getY() > j.getOffPt().getY();
            Path.OutPt op2b = j.outPt2.next;
            while (op2b != op2 && op2b.getPt().equals(j.getOffPt())) {
                op2b = op2b.next;
            }
            boolean reverse2 = op2b.getPt().getY() > j.getOffPt().getY();
            if (reverse1 == reverse2) {
                return false;
            }
            if (reverse1) {
                Path.OutPt op1b2 = op1.duplicate(false);
                Path.OutPt op2b2 = op2.duplicate(true);
                op1.prev = op2;
                op2.next = op1;
                op1b2.next = op2b2;
                op2b2.prev = op1b2;
                j.outPt1 = op1;
                j.outPt2 = op1b2;
                return true;
            }
            Path.OutPt op1b3 = op1.duplicate(true);
            Path.OutPt op2b3 = op2.duplicate(false);
            op1.next = op2;
            op2.prev = op1;
            op1b3.prev = op2b3;
            op2b3.next = op1b3;
            j.outPt1 = op1;
            j.outPt2 = op1b3;
            return true;
        } else if (isHorizontal) {
            Path.OutPt op12 = op1;
            while (op12.prev.getPt().getY() == op12.getPt().getY() && op12.prev != op1 && op12.prev != op2) {
                op12 = op12.prev;
            }
            Path.OutPt op1b4 = op1;
            while (op1b4.next.getPt().getY() == op1b4.getPt().getY() && op1b4.next != op12 && op1b4.next != op2) {
                op1b4 = op1b4.next;
            }
            if (op1b4.next == op12 || op1b4.next == op2) {
                return false;
            }
            Path.OutPt op22 = op2;
            while (op22.prev.getPt().getY() == op22.getPt().getY() && op22.prev != op2 && op22.prev != op1b4) {
                op22 = op22.prev;
            }
            Path.OutPt op2b4 = op2;
            while (op2b4.next.getPt().getY() == op2b4.getPt().getY() && op2b4.next != op22 && op2b4.next != op12) {
                op2b4 = op2b4.next;
            }
            if (op2b4.next == op22 || op2b4.next == op12) {
                return false;
            }
            long[] LeftV = new long[1];
            long[] RightV = new long[1];
            if (getOverlap(op12.getPt().getX(), op1b4.getPt().getX(), op22.getPt().getX(), op2b4.getPt().getX(), LeftV, RightV)) {
                long Left = LeftV[0];
                long Right = RightV[0];
                if (op12.getPt().getX() >= Left && op12.getPt().getX() <= Right) {
                    Point.LongPoint Pt2 = new Point.LongPoint(op12.getPt());
                    DiscardLeftSide = op12.getPt().getX() > op1b4.getPt().getX();
                    Pt = Pt2;
                } else {
                    Point.LongPoint Pt3 = op22.getPt();
                    if (Pt3.getX() >= Left && op22.getPt().getX() <= Right) {
                        Point.LongPoint Pt4 = new Point.LongPoint(op22.getPt());
                        DiscardLeftSide = op22.getPt().getX() > op2b4.getPt().getX();
                        Pt = Pt4;
                    } else {
                        Point.LongPoint Pt5 = op1b4.getPt();
                        if (Pt5.getX() >= Left && op1b4.getPt().getX() <= Right) {
                            Point.LongPoint Pt6 = new Point.LongPoint(op1b4.getPt());
                            DiscardLeftSide = op1b4.getPt().getX() > op12.getPt().getX();
                            Pt = Pt6;
                        } else {
                            Point.LongPoint Pt7 = new Point.LongPoint(op2b4.getPt());
                            DiscardLeftSide = op2b4.getPt().getX() > op22.getPt().getX();
                            Pt = Pt7;
                        }
                    }
                }
                j.outPt1 = op12;
                j.outPt2 = op22;
                return joinHorz(op12, op1b4, op22, op2b4, Pt, DiscardLeftSide);
            }
            return false;
        } else {
            Path.OutPt op1b5 = op1.next;
            while (op1b5.getPt().equals(op1.getPt()) && op1b5 != op1) {
                op1b5 = op1b5.next;
            }
            boolean Reverse1 = op1b5.getPt().getY() > op1.getPt().getY() || !Point.slopesEqual(op1.getPt(), op1b5.getPt(), j.getOffPt(), this.useFullRange);
            if (Reverse1) {
                op1b5 = op1.prev;
                while (op1b5.getPt().equals(op1.getPt()) && op1b5 != op1) {
                    op1b5 = op1b5.prev;
                }
                if (op1b5.getPt().getY() > op1.getPt().getY() || !Point.slopesEqual(op1.getPt(), op1b5.getPt(), j.getOffPt(), this.useFullRange)) {
                    return false;
                }
            }
            Path.OutPt op2b5 = op2.next;
            while (op2b5.getPt().equals(op2.getPt()) && op2b5 != op2) {
                op2b5 = op2b5.next;
            }
            boolean Reverse2 = op2b5.getPt().getY() > op2.getPt().getY() || !Point.slopesEqual(op2.getPt(), op2b5.getPt(), j.getOffPt(), this.useFullRange);
            if (Reverse2) {
                op2b5 = op2.prev;
                while (op2b5.getPt().equals(op2.getPt()) && op2b5 != op2) {
                    op2b5 = op2b5.prev;
                }
                if (op2b5.getPt().getY() > op2.getPt().getY() || !Point.slopesEqual(op2.getPt(), op2b5.getPt(), j.getOffPt(), this.useFullRange)) {
                    return false;
                }
            }
            if (op1b5 == op1 || op2b5 == op2 || op1b5 == op2b5 || (outRec1 == outRec2 && Reverse1 == Reverse2)) {
                return false;
            }
            if (Reverse1) {
                Path.OutPt op1b6 = op1.duplicate(false);
                Path.OutPt op2b6 = op2.duplicate(true);
                op1.prev = op2;
                op2.next = op1;
                op1b6.next = op2b6;
                op2b6.prev = op1b6;
                j.outPt1 = op1;
                j.outPt2 = op1b6;
                return true;
            }
            Path.OutPt op1b7 = op1.duplicate(true);
            Path.OutPt op2b7 = op2.duplicate(false);
            op1.next = op2;
            op2.prev = op1;
            op1b7.prev = op2b7;
            op2b7.next = op1b7;
            j.outPt1 = op1;
            j.outPt2 = op1b7;
            return true;
        }
    }

    private static Paths minkowski(Path pattern, Path path, boolean IsSum, boolean IsClosed) {
        int polyCnt = pattern.size();
        int pathCnt = path.size();
        Paths result = new Paths(pathCnt);
        if (IsSum) {
            for (int i = 0; i < pathCnt; i++) {
                Path p = new Path(polyCnt);
                Iterator<Point.LongPoint> it = pattern.iterator();
                while (it.hasNext()) {
                    Point.LongPoint ip = it.next();
                    p.add(new Point.LongPoint(path.get(i).getX() + ip.getX(), path.get(i).getY() + ip.getY(), 0L));
                }
                result.add(p);
            }
        } else {
            for (int i2 = 0; i2 < pathCnt; i2++) {
                Path p2 = new Path(polyCnt);
                Iterator<Point.LongPoint> it2 = pattern.iterator();
                while (it2.hasNext()) {
                    Point.LongPoint ip2 = it2.next();
                    p2.add(new Point.LongPoint(path.get(i2).getX() - ip2.getX(), path.get(i2).getY() - ip2.getY(), 0L));
                }
                result.add(p2);
            }
        }
        Paths quads = new Paths((pathCnt + (IsClosed ? 1 : 0)) * (polyCnt + 1));
        for (int i3 = 0; i3 < (pathCnt - 1) + (IsClosed ? 1 : 0); i3++) {
            for (int j = 0; j < polyCnt; j++) {
                Path quad = new Path(4);
                quad.add(result.get(i3 % pathCnt).get(j % polyCnt));
                quad.add(result.get((i3 + 1) % pathCnt).get(j % polyCnt));
                quad.add(result.get((i3 + 1) % pathCnt).get((j + 1) % polyCnt));
                quad.add(result.get(i3 % pathCnt).get((j + 1) % polyCnt));
                if (!quad.orientation()) {
                    Collections.reverse(quad);
                }
                quads.add(quad);
            }
        }
        return quads;
    }

    public static Paths minkowskiDiff(Path poly1, Path poly2) {
        Paths paths = minkowski(poly1, poly2, false, true);
        DefaultClipper c = new DefaultClipper();
        c.addPaths(paths, IClipper.PolyType.SUBJECT, true);
        c.execute(IClipper.ClipType.UNION, paths, IClipper.PolyFillType.NON_ZERO, IClipper.PolyFillType.NON_ZERO);
        return paths;
    }

    public static Paths minkowskiSum(Path pattern, Path path, boolean pathIsClosed) {
        Paths paths = minkowski(pattern, path, true, pathIsClosed);
        DefaultClipper c = new DefaultClipper();
        c.addPaths(paths, IClipper.PolyType.SUBJECT, true);
        c.execute(IClipper.ClipType.UNION, paths, IClipper.PolyFillType.NON_ZERO, IClipper.PolyFillType.NON_ZERO);
        return paths;
    }

    public static Paths minkowskiSum(Path pattern, Paths paths, boolean pathIsClosed) {
        Paths solution = new Paths();
        DefaultClipper c = new DefaultClipper();
        for (int i = 0; i < paths.size(); i++) {
            Paths tmp = minkowski(pattern, paths.get(i), true, pathIsClosed);
            c.addPaths(tmp, IClipper.PolyType.SUBJECT, true);
            if (pathIsClosed) {
                Path path = paths.get(i).TranslatePath(pattern.get(0));
                c.addPath(path, IClipper.PolyType.CLIP, true);
            }
        }
        c.execute(IClipper.ClipType.UNION, solution, IClipper.PolyFillType.NON_ZERO, IClipper.PolyFillType.NON_ZERO);
        return solution;
    }

    private static boolean poly2ContainsPoly1(Path.OutPt outPt1, Path.OutPt outPt2) {
        Path.OutPt op = outPt1;
        do {
            int res = isPointInPolygon(op.getPt(), outPt2);
            if (res >= 0) {
                return res > 0;
            }
            op = op.next;
        } while (op != outPt1);
        return true;
    }

    public static Paths simplifyPolygon(Path poly) {
        return simplifyPolygon(poly, IClipper.PolyFillType.EVEN_ODD);
    }

    public static Paths simplifyPolygon(Path poly, IClipper.PolyFillType fillType) {
        Paths result = new Paths();
        DefaultClipper c = new DefaultClipper(2);
        c.addPath(poly, IClipper.PolyType.SUBJECT, true);
        c.execute(IClipper.ClipType.UNION, result, fillType, fillType);
        return result;
    }

    public static Paths simplifyPolygons(Paths polys) {
        return simplifyPolygons(polys, IClipper.PolyFillType.EVEN_ODD);
    }

    public static Paths simplifyPolygons(Paths polys, IClipper.PolyFillType fillType) {
        Paths result = new Paths();
        DefaultClipper c = new DefaultClipper(2);
        c.addPaths(polys, IClipper.PolyType.SUBJECT, true);
        c.execute(IClipper.ClipType.UNION, result, fillType, fillType);
        return result;
    }

    public DefaultClipper() {
        this(0);
    }

    public DefaultClipper(int InitOptions) {
        super((InitOptions & 4) != 0);
        this.scanbeam = null;
        this.maxima = null;
        this.activeEdges = null;
        this.sortedEdges = null;
        this.intersectList = new ArrayList();
        this.intersectNodeComparer = new Comparator<IntersectNode>() { // from class: com.itextpdf.kernel.pdf.canvas.parser.clipper.DefaultClipper.1
            @Override // java.util.Comparator
            public int compare(IntersectNode o1, IntersectNode o2) {
                long i = o2.getPt().getY() - o1.getPt().getY();
                if (i > 0) {
                    return 1;
                }
                if (i < 0) {
                    return -1;
                }
                return 0;
            }
        };
        this.usingPolyTree = false;
        this.polyOuts = new ArrayList();
        this.joins = new ArrayList();
        this.ghostJoins = new ArrayList();
        this.reverseSolution = (InitOptions & 1) != 0;
        this.strictlySimple = (InitOptions & 2) != 0;
        this.zFillFunction = null;
    }

    private void insertScanbeam(long Y) {
        if (this.scanbeam == null) {
            this.scanbeam = new ClipperBase.Scanbeam();
            this.scanbeam.next = null;
            this.scanbeam.y = Y;
        } else if (Y > this.scanbeam.y) {
            ClipperBase.Scanbeam newSb = new ClipperBase.Scanbeam();
            newSb.y = Y;
            newSb.next = this.scanbeam;
            this.scanbeam = newSb;
        } else {
            ClipperBase.Scanbeam sb2 = this.scanbeam;
            while (sb2.next != null && Y <= sb2.next.y) {
                sb2 = sb2.next;
            }
            if (Y == sb2.y) {
                return;
            }
            ClipperBase.Scanbeam newSb2 = new ClipperBase.Scanbeam();
            newSb2.y = Y;
            newSb2.next = sb2.next;
            sb2.next = newSb2;
        }
    }

    private void InsertMaxima(long X) {
        Path.Maxima newMax = new Path.Maxima();
        newMax.X = X;
        if (this.maxima == null) {
            this.maxima = newMax;
            this.maxima.Next = null;
            this.maxima.Prev = null;
        } else if (X < this.maxima.X) {
            newMax.Next = this.maxima;
            newMax.Prev = null;
            this.maxima = newMax;
        } else {
            Path.Maxima m = this.maxima;
            while (m.Next != null && X >= m.Next.X) {
                m = m.Next;
            }
            if (X == m.X) {
                return;
            }
            newMax.Next = m.Next;
            newMax.Prev = m;
            if (m.Next != null) {
                m.Next.Prev = newMax;
            }
            m.Next = newMax;
        }
    }

    private void addEdgeToSEL(Edge edge) {
        LOGGER.entering(DefaultClipper.class.getName(), "addEdgeToSEL");
        if (this.sortedEdges == null) {
            this.sortedEdges = edge;
            edge.prevInSEL = null;
            edge.nextInSEL = null;
            return;
        }
        edge.nextInSEL = this.sortedEdges;
        edge.prevInSEL = null;
        this.sortedEdges.prevInSEL = edge;
        this.sortedEdges = edge;
    }

    private void addGhostJoin(Path.OutPt Op, Point.LongPoint OffPt) {
        Path.Join j = new Path.Join();
        j.outPt1 = Op;
        j.setOffPt(OffPt);
        this.ghostJoins.add(j);
    }

    private void addJoin(Path.OutPt Op1, Path.OutPt Op2, Point.LongPoint OffPt) {
        LOGGER.entering(DefaultClipper.class.getName(), "addJoin");
        Path.Join j = new Path.Join();
        j.outPt1 = Op1;
        j.outPt2 = Op2;
        j.setOffPt(OffPt);
        this.joins.add(j);
    }

    private void addLocalMaxPoly(Edge e1, Edge e2, Point.LongPoint pt) {
        addOutPt(e1, pt);
        if (e2.windDelta == 0) {
            addOutPt(e2, pt);
        }
        if (e1.outIdx == e2.outIdx) {
            e1.outIdx = -1;
            e2.outIdx = -1;
        } else if (e1.outIdx < e2.outIdx) {
            appendPolygon(e1, e2);
        } else {
            appendPolygon(e2, e1);
        }
    }

    private Path.OutPt addLocalMinPoly(Edge e1, Edge e2, Point.LongPoint pt) {
        Path.OutPt result;
        Edge e;
        Edge prevE;
        LOGGER.entering(DefaultClipper.class.getName(), "addLocalMinPoly");
        if (e2.isHorizontal() || e1.deltaX > e2.deltaX) {
            result = addOutPt(e1, pt);
            e2.outIdx = e1.outIdx;
            e1.side = Edge.Side.LEFT;
            e2.side = Edge.Side.RIGHT;
            e = e1;
            if (e.prevInAEL == e2) {
                prevE = e2.prevInAEL;
            } else {
                prevE = e.prevInAEL;
            }
        } else {
            result = addOutPt(e2, pt);
            e1.outIdx = e2.outIdx;
            e1.side = Edge.Side.RIGHT;
            e2.side = Edge.Side.LEFT;
            e = e2;
            if (e.prevInAEL == e1) {
                prevE = e1.prevInAEL;
            } else {
                prevE = e.prevInAEL;
            }
        }
        if (prevE != null && prevE.outIdx >= 0 && Edge.topX(prevE, pt.getY()) == Edge.topX(e, pt.getY()) && Edge.slopesEqual(e, prevE, this.useFullRange) && e.windDelta != 0 && prevE.windDelta != 0) {
            Path.OutPt outPt = addOutPt(prevE, pt);
            addJoin(result, outPt, e.getTop());
        }
        return result;
    }

    private Path.OutPt addOutPt(Edge e, Point.LongPoint pt) {
        boolean ToFront;
        LOGGER.entering(DefaultClipper.class.getName(), "addOutPt");
        if (e.outIdx < 0) {
            Path.OutRec outRec = createOutRec();
            ToFront = e.windDelta == 0;
            outRec.isOpen = ToFront;
            Path.OutPt newOp = new Path.OutPt();
            outRec.pts = newOp;
            newOp.idx = outRec.Idx;
            newOp.pt = pt;
            newOp.next = newOp;
            newOp.prev = newOp;
            if (!outRec.isOpen) {
                setHoleState(e, outRec);
            }
            e.outIdx = outRec.Idx;
            return newOp;
        }
        Path.OutRec outRec2 = this.polyOuts.get(e.outIdx);
        Path.OutPt op = outRec2.getPoints();
        ToFront = e.side == Edge.Side.LEFT;
        LOGGER.finest("op=" + op.getPointCount());
        LOGGER.finest(ToFront + " " + pt + " " + op.getPt());
        if (ToFront && pt.equals(op.getPt())) {
            return op;
        }
        if (!ToFront && pt.equals(op.prev.getPt())) {
            return op.prev;
        }
        Path.OutPt newOp2 = new Path.OutPt();
        newOp2.idx = outRec2.Idx;
        newOp2.setPt(new Point.LongPoint(pt));
        newOp2.next = op;
        newOp2.prev = op.prev;
        newOp2.prev.next = newOp2;
        op.prev = newOp2;
        if (ToFront) {
            outRec2.setPoints(newOp2);
        }
        return newOp2;
    }

    private Path.OutPt GetLastOutPt(Edge e) {
        Path.OutRec outRec = this.polyOuts.get(e.outIdx);
        if (e.side == Edge.Side.LEFT) {
            return outRec.pts;
        }
        return outRec.pts.prev;
    }

    private void appendPolygon(Edge e1, Edge e2) {
        Path.OutRec holeStateRec;
        Edge.Side side;
        LOGGER.entering(DefaultClipper.class.getName(), "appendPolygon");
        Path.OutRec outRec1 = this.polyOuts.get(e1.outIdx);
        Path.OutRec outRec2 = this.polyOuts.get(e2.outIdx);
        LOGGER.finest("" + e1.outIdx);
        LOGGER.finest("" + e2.outIdx);
        if (isParam1RightOfParam2(outRec1, outRec2)) {
            holeStateRec = outRec2;
        } else if (isParam1RightOfParam2(outRec2, outRec1)) {
            holeStateRec = outRec1;
        } else {
            holeStateRec = Path.OutPt.getLowerMostRec(outRec1, outRec2);
        }
        Path.OutPt p1_lft = outRec1.getPoints();
        Path.OutPt p1_rt = p1_lft.prev;
        Path.OutPt p2_lft = outRec2.getPoints();
        Path.OutPt p2_rt = p2_lft.prev;
        LOGGER.finest("p1_lft.getPointCount() = " + p1_lft.getPointCount());
        LOGGER.finest("p1_rt.getPointCount() = " + p1_rt.getPointCount());
        LOGGER.finest("p2_lft.getPointCount() = " + p2_lft.getPointCount());
        LOGGER.finest("p2_rt.getPointCount() = " + p2_rt.getPointCount());
        if (e1.side == Edge.Side.LEFT) {
            if (e2.side == Edge.Side.LEFT) {
                p2_lft.reversePolyPtLinks();
                p2_lft.next = p1_lft;
                p1_lft.prev = p2_lft;
                p1_rt.next = p2_rt;
                p2_rt.prev = p1_rt;
                outRec1.setPoints(p2_rt);
            } else {
                p2_rt.next = p1_lft;
                p1_lft.prev = p2_rt;
                p2_lft.prev = p1_rt;
                p1_rt.next = p2_lft;
                outRec1.setPoints(p2_lft);
            }
            side = Edge.Side.LEFT;
        } else {
            Edge.Side side2 = e2.side;
            if (side2 == Edge.Side.RIGHT) {
                p2_lft.reversePolyPtLinks();
                p1_rt.next = p2_rt;
                p2_rt.prev = p1_rt;
                p2_lft.next = p1_lft;
                p1_lft.prev = p2_lft;
            } else {
                p1_rt.next = p2_lft;
                p2_lft.prev = p1_rt;
                p1_lft.prev = p2_rt;
                p2_rt.next = p1_lft;
            }
            side = Edge.Side.RIGHT;
        }
        outRec1.bottomPt = null;
        if (holeStateRec.equals(outRec2)) {
            if (outRec2.firstLeft != outRec1) {
                outRec1.firstLeft = outRec2.firstLeft;
            }
            outRec1.isHole = outRec2.isHole;
        }
        outRec2.setPoints(null);
        outRec2.bottomPt = null;
        outRec2.firstLeft = outRec1;
        int OKIdx = e1.outIdx;
        int ObsoleteIdx = e2.outIdx;
        e1.outIdx = -1;
        e2.outIdx = -1;
        Edge e = this.activeEdges;
        while (true) {
            if (e == null) {
                break;
            } else if (e.outIdx == ObsoleteIdx) {
                e.outIdx = OKIdx;
                e.side = side;
                break;
            } else {
                e = e.nextInAEL;
            }
        }
        outRec2.Idx = outRec1.Idx;
    }

    private void buildIntersectList(long topY) {
        if (this.activeEdges == null) {
            return;
        }
        Edge e = this.activeEdges;
        this.sortedEdges = e;
        while (e != null) {
            e.prevInSEL = e.prevInAEL;
            e.nextInSEL = e.nextInAEL;
            e.getCurrent().setX(Long.valueOf(Edge.topX(e, topY)));
            e = e.nextInAEL;
        }
        boolean isModified = true;
        while (isModified && this.sortedEdges != null) {
            isModified = false;
            Edge e2 = this.sortedEdges;
            while (e2.nextInSEL != null) {
                Edge eNext = e2.nextInSEL;
                Point.LongPoint[] pt = new Point.LongPoint[1];
                if (e2.getCurrent().getX() > eNext.getCurrent().getX()) {
                    intersectPoint(e2, eNext, pt);
                    IntersectNode newNode = new IntersectNode();
                    newNode.edge1 = e2;
                    newNode.Edge2 = eNext;
                    newNode.setPt(pt[0]);
                    this.intersectList.add(newNode);
                    swapPositionsInSEL(e2, eNext);
                    isModified = true;
                } else {
                    e2 = eNext;
                }
            }
            if (e2.prevInSEL == null) {
                break;
            }
            e2.prevInSEL.nextInSEL = null;
        }
        this.sortedEdges = null;
    }

    private void buildResult(Paths polyg) {
        polyg.clear();
        for (int i = 0; i < this.polyOuts.size(); i++) {
            Path.OutRec outRec = this.polyOuts.get(i);
            if (outRec.getPoints() != null) {
                Path.OutPt p = outRec.getPoints().prev;
                int cnt = p.getPointCount();
                LOGGER.finest("cnt = " + cnt);
                if (cnt >= 2) {
                    Path pg = new Path(cnt);
                    for (int j = 0; j < cnt; j++) {
                        pg.add(p.getPt());
                        p = p.prev;
                    }
                    polyg.add(pg);
                }
            }
        }
    }

    private void buildResult2(PolyTree polytree) {
        polytree.Clear();
        for (int i = 0; i < this.polyOuts.size(); i++) {
            Path.OutRec outRec = this.polyOuts.get(i);
            int cnt = outRec.getPoints() != null ? outRec.getPoints().getPointCount() : 0;
            if ((!outRec.isOpen || cnt >= 2) && (outRec.isOpen || cnt >= 3)) {
                outRec.fixHoleLinkage();
                PolyNode pn = new PolyNode();
                polytree.getAllPolys().add(pn);
                outRec.polyNode = pn;
                Path.OutPt op = outRec.getPoints().prev;
                for (int j = 0; j < cnt; j++) {
                    pn.getPolygon().add(op.getPt());
                    op = op.prev;
                }
            }
        }
        for (int i2 = 0; i2 < this.polyOuts.size(); i2++) {
            Path.OutRec outRec2 = this.polyOuts.get(i2);
            if (outRec2.polyNode != null) {
                if (outRec2.isOpen) {
                    outRec2.polyNode.setOpen(true);
                    polytree.addChild(outRec2.polyNode);
                } else if (outRec2.firstLeft != null && outRec2.firstLeft.polyNode != null) {
                    outRec2.firstLeft.polyNode.addChild(outRec2.polyNode);
                } else {
                    polytree.addChild(outRec2.polyNode);
                }
            }
        }
    }

    private void copyAELToSEL() {
        Edge e = this.activeEdges;
        this.sortedEdges = e;
        while (e != null) {
            e.prevInSEL = e.prevInAEL;
            e.nextInSEL = e.nextInAEL;
            e = e.nextInAEL;
        }
    }

    private Path.OutRec createOutRec() {
        Path.OutRec result = new Path.OutRec();
        result.Idx = -1;
        result.isHole = false;
        result.isOpen = false;
        result.firstLeft = null;
        result.setPoints(null);
        result.bottomPt = null;
        result.polyNode = null;
        this.polyOuts.add(result);
        result.Idx = this.polyOuts.size() - 1;
        return result;
    }

    private void deleteFromAEL(Edge e) {
        LOGGER.entering(DefaultClipper.class.getName(), "deleteFromAEL");
        Edge AelPrev = e.prevInAEL;
        Edge AelNext = e.nextInAEL;
        if (AelPrev == null && AelNext == null && e != this.activeEdges) {
            return;
        }
        if (AelPrev != null) {
            AelPrev.nextInAEL = AelNext;
        } else {
            this.activeEdges = AelNext;
        }
        if (AelNext != null) {
            AelNext.prevInAEL = AelPrev;
        }
        e.nextInAEL = null;
        e.prevInAEL = null;
        LOGGER.exiting(DefaultClipper.class.getName(), "deleteFromAEL");
    }

    private void deleteFromSEL(Edge e) {
        LOGGER.entering(DefaultClipper.class.getName(), "deleteFromSEL");
        Edge SelPrev = e.prevInSEL;
        Edge SelNext = e.nextInSEL;
        if (SelPrev == null && SelNext == null && !e.equals(this.sortedEdges)) {
            return;
        }
        if (SelPrev != null) {
            SelPrev.nextInSEL = SelNext;
        } else {
            this.sortedEdges = SelNext;
        }
        if (SelNext != null) {
            SelNext.prevInSEL = SelPrev;
        }
        e.nextInSEL = null;
        e.prevInSEL = null;
    }

    private boolean doHorzSegmentsOverlap(long seg1a, long seg1b, long seg2a, long seg2b) {
        if (seg1a > seg1b) {
            seg1a = seg1b;
            seg1b = seg1a;
        }
        if (seg2a > seg2b) {
            seg2a = seg2b;
            seg2b = seg2a;
        }
        return seg1a < seg2b && seg2a < seg1b;
    }

    private void doMaxima(Edge e) {
        Edge eMaxPair = e.getMaximaPair();
        if (eMaxPair == null) {
            if (e.outIdx >= 0) {
                addOutPt(e, e.getTop());
            }
            deleteFromAEL(e);
            return;
        }
        Edge eNext = e.nextInAEL;
        while (eNext != null && eNext != eMaxPair) {
            Point.LongPoint tmp = new Point.LongPoint(e.getTop());
            intersectEdges(e, eNext, tmp);
            e.setTop(tmp);
            swapPositionsInAEL(e, eNext);
            eNext = e.nextInAEL;
        }
        if (e.outIdx == -1 && eMaxPair.outIdx == -1) {
            deleteFromAEL(e);
            deleteFromAEL(eMaxPair);
        } else if (e.outIdx >= 0 && eMaxPair.outIdx >= 0) {
            if (e.outIdx >= 0) {
                addLocalMaxPoly(e, eMaxPair, e.getTop());
            }
            deleteFromAEL(e);
            deleteFromAEL(eMaxPair);
        } else if (e.windDelta == 0) {
            if (e.outIdx >= 0) {
                addOutPt(e, e.getTop());
                e.outIdx = -1;
            }
            deleteFromAEL(e);
            if (eMaxPair.outIdx >= 0) {
                addOutPt(eMaxPair, e.getTop());
                eMaxPair.outIdx = -1;
            }
            deleteFromAEL(eMaxPair);
        } else {
            throw new IllegalStateException("DoMaxima error");
        }
    }

    private void doSimplePolygons() {
        Path.OutPt op2;
        int i = 0;
        while (i < this.polyOuts.size()) {
            int i2 = i + 1;
            Path.OutRec outrec = this.polyOuts.get(i);
            Path.OutPt op = outrec.getPoints();
            if (op == null || outrec.isOpen) {
                i = i2;
            } else {
                do {
                    Path.OutPt op22 = op.next;
                    while (op22 != outrec.getPoints()) {
                        if (op.getPt().equals(op22.getPt()) && !op22.next.equals(op) && !op22.prev.equals(op)) {
                            Path.OutPt op3 = op.prev;
                            Path.OutPt op4 = op22.prev;
                            op.prev = op4;
                            op4.next = op;
                            op22.prev = op3;
                            op3.next = op22;
                            outrec.setPoints(op);
                            Path.OutRec outrec2 = createOutRec();
                            outrec2.setPoints(op22);
                            updateOutPtIdxs(outrec2);
                            if (poly2ContainsPoly1(outrec2.getPoints(), outrec.getPoints())) {
                                outrec2.isHole = !outrec.isHole;
                                outrec2.firstLeft = outrec;
                                if (this.usingPolyTree) {
                                    fixupFirstLefts2(outrec2, outrec);
                                }
                            } else if (poly2ContainsPoly1(outrec.getPoints(), outrec2.getPoints())) {
                                outrec2.isHole = outrec.isHole;
                                outrec.isHole = !outrec2.isHole;
                                outrec2.firstLeft = outrec.firstLeft;
                                outrec.firstLeft = outrec2;
                                if (this.usingPolyTree) {
                                    fixupFirstLefts2(outrec, outrec2);
                                }
                            } else {
                                outrec2.isHole = outrec.isHole;
                                outrec2.firstLeft = outrec.firstLeft;
                                if (this.usingPolyTree) {
                                    fixupFirstLefts1(outrec, outrec2);
                                }
                            }
                            op22 = op;
                        }
                        op22 = op22.next;
                    }
                    op = op.next;
                    op2 = outrec.getPoints();
                } while (op != op2);
                i = i2;
            }
        }
    }

    private boolean EdgesAdjacent(IntersectNode inode) {
        return inode.edge1.nextInSEL == inode.Edge2 || inode.edge1.prevInSEL == inode.Edge2;
    }

    public boolean execute(IClipper.ClipType clipType, Paths solution, IClipper.PolyFillType FillType) {
        return execute(clipType, solution, FillType, FillType);
    }

    @Override // com.itextpdf.kernel.pdf.canvas.parser.clipper.IClipper
    public boolean execute(IClipper.ClipType clipType, PolyTree polytree) {
        return execute(clipType, polytree, IClipper.PolyFillType.EVEN_ODD);
    }

    public boolean execute(IClipper.ClipType clipType, PolyTree polytree, IClipper.PolyFillType FillType) {
        return execute(clipType, polytree, FillType, FillType);
    }

    @Override // com.itextpdf.kernel.pdf.canvas.parser.clipper.IClipper
    public boolean execute(IClipper.ClipType clipType, Paths solution) {
        return execute(clipType, solution, IClipper.PolyFillType.EVEN_ODD);
    }

    @Override // com.itextpdf.kernel.pdf.canvas.parser.clipper.IClipper
    public boolean execute(IClipper.ClipType clipType, Paths solution, IClipper.PolyFillType subjFillType, IClipper.PolyFillType clipFillType) {
        boolean succeeded;
        synchronized (this) {
            if (this.hasOpenPaths) {
                throw new IllegalStateException("Error: PolyTree struct is needed for open path clipping.");
            }
            solution.clear();
            this.subjFillType = subjFillType;
            this.clipFillType = clipFillType;
            this.clipType = clipType;
            this.usingPolyTree = false;
            succeeded = executeInternal();
            if (succeeded) {
                buildResult(solution);
            }
            this.polyOuts.clear();
        }
        return succeeded;
    }

    @Override // com.itextpdf.kernel.pdf.canvas.parser.clipper.IClipper
    public boolean execute(IClipper.ClipType clipType, PolyTree polytree, IClipper.PolyFillType subjFillType, IClipper.PolyFillType clipFillType) {
        boolean succeeded;
        synchronized (this) {
            this.subjFillType = subjFillType;
            this.clipFillType = clipFillType;
            this.clipType = clipType;
            this.usingPolyTree = true;
            succeeded = executeInternal();
            if (succeeded) {
                buildResult2(polytree);
            }
            this.polyOuts.clear();
        }
        return succeeded;
    }

    private boolean executeInternal() {
        try {
            reset();
            if (this.currentLM == null) {
                return false;
            }
            long botY = popScanbeam();
            while (true) {
                insertLocalMinimaIntoAEL(botY);
                processHorizontals();
                this.ghostJoins.clear();
                if (this.scanbeam == null) {
                    break;
                }
                long topY = popScanbeam();
                if (!processIntersections(topY)) {
                    return false;
                }
                processEdgesAtTopOfScanbeam(topY);
                botY = topY;
                if (this.scanbeam == null && this.currentLM == null) {
                    break;
                }
            }
            int i = 0;
            while (true) {
                boolean z = true;
                if (i >= this.polyOuts.size()) {
                    break;
                }
                Path.OutRec outRec = this.polyOuts.get(i);
                if (outRec.pts != null && !outRec.isOpen) {
                    boolean z2 = outRec.isHole ^ this.reverseSolution;
                    if (outRec.area() <= AudioStats.AUDIO_AMPLITUDE_NONE) {
                        z = false;
                    }
                    if (z2 == z) {
                        outRec.getPoints().reversePolyPtLinks();
                    }
                }
                i++;
            }
            joinCommonEdges();
            for (int i2 = 0; i2 < this.polyOuts.size(); i2++) {
                Path.OutRec outRec2 = this.polyOuts.get(i2);
                if (outRec2.getPoints() != null) {
                    if (outRec2.isOpen) {
                        fixupOutPolyline(outRec2);
                    } else {
                        fixupOutPolygon(outRec2);
                    }
                }
            }
            if (this.strictlySimple) {
                doSimplePolygons();
            }
            return true;
        } finally {
            this.joins.clear();
            this.ghostJoins.clear();
        }
    }

    private void fixupFirstLefts1(Path.OutRec OldOutRec, Path.OutRec NewOutRec) {
        for (int i = 0; i < this.polyOuts.size(); i++) {
            Path.OutRec outRec = this.polyOuts.get(i);
            if (outRec.getPoints() != null && outRec.firstLeft != null) {
                Path.OutRec firstLeft = parseFirstLeft(outRec.firstLeft);
                if (firstLeft.equals(OldOutRec) && poly2ContainsPoly1(outRec.getPoints(), NewOutRec.getPoints())) {
                    outRec.firstLeft = NewOutRec;
                }
            }
        }
    }

    private void fixupFirstLefts2(Path.OutRec OldOutRec, Path.OutRec NewOutRec) {
        for (Path.OutRec outRec : this.polyOuts) {
            if (outRec.firstLeft == OldOutRec) {
                outRec.firstLeft = NewOutRec;
            }
        }
    }

    private boolean fixupIntersectionOrder() {
        Collections.sort(this.intersectList, this.intersectNodeComparer);
        copyAELToSEL();
        int cnt = this.intersectList.size();
        for (int i = 0; i < cnt; i++) {
            if (!EdgesAdjacent(this.intersectList.get(i))) {
                int j = i + 1;
                while (j < cnt && !EdgesAdjacent(this.intersectList.get(j))) {
                    j++;
                }
                if (j == cnt) {
                    return false;
                }
                IntersectNode tmp = this.intersectList.get(i);
                this.intersectList.set(i, this.intersectList.get(j));
                this.intersectList.set(j, tmp);
            }
            swapPositionsInSEL(this.intersectList.get(i).edge1, this.intersectList.get(i).Edge2);
        }
        return true;
    }

    private void fixupOutPolyline(Path.OutRec outrec) {
        Path.OutPt pp = outrec.pts;
        Path.OutPt lastPP = pp.prev;
        while (pp != lastPP) {
            pp = pp.next;
            if (pp.pt.equals(pp.prev.pt)) {
                if (pp == lastPP) {
                    lastPP = pp.prev;
                }
                Path.OutPt tmpPP = pp.prev;
                tmpPP.next = pp.next;
                pp.next.prev = tmpPP;
                pp = tmpPP;
            }
        }
        if (pp == pp.prev) {
            outrec.pts = null;
        }
    }

    private void fixupOutPolygon(Path.OutRec outRec) {
        Path.OutPt lastOK = null;
        outRec.bottomPt = null;
        Path.OutPt pp = outRec.getPoints();
        boolean preserveCol = this.preserveCollinear || this.strictlySimple;
        while (pp.prev != pp && pp.prev != pp.next) {
            if (pp.getPt().equals(pp.next.getPt()) || pp.getPt().equals(pp.prev.getPt()) || (Point.slopesEqual(pp.prev.getPt(), pp.getPt(), pp.next.getPt(), this.useFullRange) && (!preserveCol || !Point.isPt2BetweenPt1AndPt3(pp.prev.getPt(), pp.getPt(), pp.next.getPt())))) {
                lastOK = null;
                pp.prev.next = pp.next;
                pp.next.prev = pp.prev;
                pp = pp.prev;
            } else if (pp != lastOK) {
                if (lastOK == null) {
                    lastOK = pp;
                }
                pp = pp.next;
            } else {
                outRec.setPoints(pp);
                return;
            }
        }
        outRec.setPoints(null);
    }

    private Path.OutRec getOutRec(int idx) {
        Path.OutRec outrec = this.polyOuts.get(idx);
        while (true) {
            Path.OutRec outrec2 = outrec;
            if (outrec2 != this.polyOuts.get(outrec2.Idx)) {
                outrec = this.polyOuts.get(outrec2.Idx);
            } else {
                return outrec2;
            }
        }
    }

    private void insertEdgeIntoAEL(Edge edge, Edge startEdge) {
        LOGGER.entering(DefaultClipper.class.getName(), "insertEdgeIntoAEL");
        if (this.activeEdges == null) {
            edge.prevInAEL = null;
            edge.nextInAEL = null;
            LOGGER.finest("Edge " + edge.outIdx + " -> " + ((Object) null));
            this.activeEdges = edge;
        } else if (startEdge == null && Edge.doesE2InsertBeforeE1(this.activeEdges, edge)) {
            edge.prevInAEL = null;
            edge.nextInAEL = this.activeEdges;
            LOGGER.finest("Edge " + edge.outIdx + " -> " + edge.nextInAEL.outIdx);
            this.activeEdges.prevInAEL = edge;
            this.activeEdges = edge;
        } else {
            LOGGER.finest("activeEdges unchanged");
            if (startEdge == null) {
                startEdge = this.activeEdges;
            }
            while (startEdge.nextInAEL != null && !Edge.doesE2InsertBeforeE1(startEdge.nextInAEL, edge)) {
                startEdge = startEdge.nextInAEL;
            }
            edge.nextInAEL = startEdge.nextInAEL;
            if (startEdge.nextInAEL != null) {
                startEdge.nextInAEL.prevInAEL = edge;
            }
            edge.prevInAEL = startEdge;
            startEdge.nextInAEL = edge;
        }
    }

    private void insertLocalMinimaIntoAEL(long botY) {
        Path.OutPt Op1;
        LOGGER.entering(DefaultClipper.class.getName(), "insertLocalMinimaIntoAEL");
        while (this.currentLM != null && this.currentLM.y == botY) {
            Edge lb = this.currentLM.leftBound;
            Edge rb = this.currentLM.rightBound;
            popLocalMinima();
            Path.OutPt Op12 = null;
            if (lb == null) {
                insertEdgeIntoAEL(rb, null);
                updateWindingCount(rb);
                if (!rb.isContributing(this.clipFillType, this.subjFillType, this.clipType)) {
                    Op1 = null;
                } else {
                    Op1 = addOutPt(rb, rb.getBot());
                }
            } else if (rb == null) {
                insertEdgeIntoAEL(lb, null);
                updateWindingCount(lb);
                if (lb.isContributing(this.clipFillType, this.subjFillType, this.clipType)) {
                    Op12 = addOutPt(lb, lb.getBot());
                }
                insertScanbeam(lb.getTop().getY());
                Op1 = Op12;
            } else {
                insertEdgeIntoAEL(lb, null);
                insertEdgeIntoAEL(rb, lb);
                updateWindingCount(lb);
                rb.windCnt = lb.windCnt;
                rb.windCnt2 = lb.windCnt2;
                if (lb.isContributing(this.clipFillType, this.subjFillType, this.clipType)) {
                    Op12 = addLocalMinPoly(lb, rb, lb.getBot());
                }
                insertScanbeam(lb.getTop().getY());
                Op1 = Op12;
            }
            if (rb != null) {
                if (rb.isHorizontal()) {
                    addEdgeToSEL(rb);
                } else {
                    insertScanbeam(rb.getTop().getY());
                }
            }
            if (lb != null && rb != null) {
                if (Op1 != null && rb.isHorizontal() && this.ghostJoins.size() > 0 && rb.windDelta != 0) {
                    for (int i = 0; i < this.ghostJoins.size(); i++) {
                        Path.Join j = this.ghostJoins.get(i);
                        if (doHorzSegmentsOverlap(j.outPt1.getPt().getX(), j.getOffPt().getX(), rb.getBot().getX(), rb.getTop().getX())) {
                            addJoin(j.outPt1, Op1, j.getOffPt());
                        }
                    }
                }
                if (lb.outIdx >= 0 && lb.prevInAEL != null && lb.prevInAEL.getCurrent().getX() == lb.getBot().getX() && lb.prevInAEL.outIdx >= 0 && Edge.slopesEqual(lb.prevInAEL, lb, this.useFullRange) && lb.windDelta != 0 && lb.prevInAEL.windDelta != 0) {
                    Path.OutPt Op2 = addOutPt(lb.prevInAEL, lb.getBot());
                    addJoin(Op1, Op2, lb.getTop());
                }
                if (lb.nextInAEL != rb) {
                    if (rb.outIdx >= 0 && rb.prevInAEL.outIdx >= 0 && Edge.slopesEqual(rb.prevInAEL, rb, this.useFullRange) && rb.windDelta != 0 && rb.prevInAEL.windDelta != 0) {
                        Path.OutPt Op22 = addOutPt(rb.prevInAEL, rb.getBot());
                        addJoin(Op1, Op22, rb.getTop());
                    }
                    Edge e = lb.nextInAEL;
                    if (e != null) {
                        while (e != rb) {
                            intersectEdges(rb, e, lb.getCurrent());
                            e = e.nextInAEL;
                        }
                    }
                }
            }
        }
    }

    private void intersectEdges(Edge e1, Edge e2, Point.LongPoint pt) {
        IClipper.PolyFillType e1FillType;
        IClipper.PolyFillType e1FillType2;
        IClipper.PolyFillType e2FillType;
        IClipper.PolyFillType e2FillType2;
        int e1Wc;
        int e2Wc;
        int e1Wc2;
        int e2Wc2;
        LOGGER.entering(DefaultClipper.class.getName(), "insersectEdges");
        boolean e1Contributing = e1.outIdx >= 0;
        boolean e2Contributing = e2.outIdx >= 0;
        setZ(pt, e1, e2);
        if (e1.windDelta == 0 || e2.windDelta == 0) {
            if (e1.windDelta == 0 && e2.windDelta == 0) {
                return;
            }
            if (e1.polyTyp == e2.polyTyp && e1.windDelta != e2.windDelta && this.clipType == IClipper.ClipType.UNION) {
                if (e1.windDelta == 0) {
                    if (e2Contributing) {
                        addOutPt(e1, pt);
                        if (e1Contributing) {
                            e1.outIdx = -1;
                            return;
                        }
                        return;
                    }
                    return;
                } else if (e1Contributing) {
                    addOutPt(e2, pt);
                    if (e2Contributing) {
                        e2.outIdx = -1;
                        return;
                    }
                    return;
                } else {
                    return;
                }
            } else if (e1.polyTyp != e2.polyTyp) {
                if (e1.windDelta == 0 && Math.abs(e2.windCnt) == 1 && (this.clipType != IClipper.ClipType.UNION || e2.windCnt2 == 0)) {
                    addOutPt(e1, pt);
                    if (e1Contributing) {
                        e1.outIdx = -1;
                        return;
                    }
                    return;
                } else if (e2.windDelta == 0 && Math.abs(e1.windCnt) == 1) {
                    if (this.clipType != IClipper.ClipType.UNION || e1.windCnt2 == 0) {
                        addOutPt(e2, pt);
                        if (e2Contributing) {
                            e2.outIdx = -1;
                            return;
                        }
                        return;
                    }
                    return;
                } else {
                    return;
                }
            } else {
                return;
            }
        }
        IClipper.PolyType polyType = e1.polyTyp;
        IClipper.PolyType polyType2 = e2.polyTyp;
        IClipper.PolyFillType polyFillType = this.clipFillType;
        if (polyType == polyType2) {
            if (e1.isEvenOddFillType(polyFillType, this.subjFillType)) {
                int oldE1WindCnt = e1.windCnt;
                e1.windCnt = e2.windCnt;
                e2.windCnt = oldE1WindCnt;
            } else {
                if (e1.windCnt + e2.windDelta == 0) {
                    e1.windCnt = -e1.windCnt;
                } else {
                    e1.windCnt += e2.windDelta;
                }
                if (e2.windCnt - e1.windDelta == 0) {
                    e2.windCnt = -e2.windCnt;
                } else {
                    e2.windCnt -= e1.windDelta;
                }
            }
        } else {
            if (!e2.isEvenOddFillType(polyFillType, this.subjFillType)) {
                e1.windCnt2 += e2.windDelta;
            } else {
                e1.windCnt2 = e1.windCnt2 == 0 ? 1 : 0;
            }
            if (!e1.isEvenOddFillType(this.clipFillType, this.subjFillType)) {
                e2.windCnt2 -= e1.windDelta;
            } else {
                e2.windCnt2 = e2.windCnt2 == 0 ? 1 : 0;
            }
        }
        if (e1.polyTyp == IClipper.PolyType.SUBJECT) {
            e1FillType = this.subjFillType;
            e1FillType2 = this.clipFillType;
        } else {
            e1FillType = this.clipFillType;
            e1FillType2 = this.subjFillType;
        }
        if (e2.polyTyp == IClipper.PolyType.SUBJECT) {
            e2FillType = this.subjFillType;
            e2FillType2 = this.clipFillType;
        } else {
            e2FillType = this.clipFillType;
            e2FillType2 = this.subjFillType;
        }
        switch (e1FillType) {
            case POSITIVE:
                e1Wc = e1.windCnt;
                break;
            case NEGATIVE:
                int e1Wc3 = e1.windCnt;
                e1Wc = -e1Wc3;
                break;
            default:
                e1Wc = Math.abs(e1.windCnt);
                break;
        }
        switch (e2FillType) {
            case POSITIVE:
                e2Wc = e2.windCnt;
                break;
            case NEGATIVE:
                int e2Wc3 = e2.windCnt;
                e2Wc = -e2Wc3;
                break;
            default:
                e2Wc = Math.abs(e2.windCnt);
                break;
        }
        if (e1Contributing && e2Contributing) {
            if ((e1Wc != 0 && e1Wc != 1) || ((e2Wc != 0 && e2Wc != 1) || (e1.polyTyp != e2.polyTyp && this.clipType != IClipper.ClipType.XOR))) {
                addLocalMaxPoly(e1, e2, pt);
                return;
            }
            addOutPt(e1, pt);
            addOutPt(e2, pt);
            Edge.swapSides(e1, e2);
            Edge.swapPolyIndexes(e1, e2);
        } else if (e1Contributing) {
            if (e2Wc == 0 || e2Wc == 1) {
                addOutPt(e1, pt);
                Edge.swapSides(e1, e2);
                Edge.swapPolyIndexes(e1, e2);
            }
        } else if (e2Contributing) {
            if (e1Wc == 0 || e1Wc == 1) {
                addOutPt(e2, pt);
                Edge.swapSides(e1, e2);
                Edge.swapPolyIndexes(e1, e2);
            }
        } else if (e1Wc == 0 || e1Wc == 1) {
            if (e2Wc == 0 || e2Wc == 1) {
                switch (e1FillType2) {
                    case POSITIVE:
                        e1Wc2 = e1.windCnt2;
                        break;
                    case NEGATIVE:
                        int e1Wc22 = e1.windCnt2;
                        e1Wc2 = -e1Wc22;
                        break;
                    default:
                        e1Wc2 = Math.abs(e1.windCnt2);
                        break;
                }
                switch (e2FillType2) {
                    case POSITIVE:
                        e2Wc2 = e2.windCnt2;
                        break;
                    case NEGATIVE:
                        int e2Wc22 = e2.windCnt2;
                        e2Wc2 = -e2Wc22;
                        break;
                    default:
                        e2Wc2 = Math.abs(e2.windCnt2);
                        break;
                }
                if (e1.polyTyp != e2.polyTyp) {
                    addLocalMinPoly(e1, e2, pt);
                } else if (e1Wc == 1 && e2Wc == 1) {
                    switch (this.clipType) {
                        case INTERSECTION:
                            if (e1Wc2 > 0 && e2Wc2 > 0) {
                                addLocalMinPoly(e1, e2, pt);
                                return;
                            }
                            return;
                        case UNION:
                            if (e1Wc2 <= 0 && e2Wc2 <= 0) {
                                addLocalMinPoly(e1, e2, pt);
                                return;
                            }
                            return;
                        case DIFFERENCE:
                            if ((e1.polyTyp == IClipper.PolyType.CLIP && e1Wc2 > 0 && e2Wc2 > 0) || (e1.polyTyp == IClipper.PolyType.SUBJECT && e1Wc2 <= 0 && e2Wc2 <= 0)) {
                                addLocalMinPoly(e1, e2, pt);
                                return;
                            }
                            return;
                        case XOR:
                            addLocalMinPoly(e1, e2, pt);
                            return;
                        default:
                            return;
                    }
                } else {
                    Edge.swapSides(e1, e2);
                }
            }
        }
    }

    private void intersectPoint(Edge edge1, Edge edge2, Point.LongPoint[] ipV) {
        Point.LongPoint ip = new Point.LongPoint();
        ipV[0] = ip;
        if (edge1.deltaX == edge2.deltaX) {
            ip.setY(Long.valueOf(edge1.getCurrent().getY()));
            ip.setX(Long.valueOf(Edge.topX(edge1, ip.getY())));
            return;
        }
        if (edge1.getDelta().getX() == 0) {
            ip.setX(Long.valueOf(edge1.getBot().getX()));
            if (edge2.isHorizontal()) {
                ip.setY(Long.valueOf(edge2.getBot().getY()));
            } else {
                ip.setY(Long.valueOf(Math.round((ip.getX() / edge2.deltaX) + (edge2.getBot().getY() - (edge2.getBot().getX() / edge2.deltaX)))));
            }
        } else if (edge2.getDelta().getX() == 0) {
            ip.setX(Long.valueOf(edge2.getBot().getX()));
            if (edge1.isHorizontal()) {
                ip.setY(Long.valueOf(edge1.getBot().getY()));
            } else {
                ip.setY(Long.valueOf(Math.round((ip.getX() / edge1.deltaX) + (edge1.getBot().getY() - (edge1.getBot().getX() / edge1.deltaX)))));
            }
        } else {
            double b1 = edge1.getBot().getX() - (edge1.getBot().getY() * edge1.deltaX);
            double b2 = edge2.getBot().getX() - (edge2.getBot().getY() * edge2.deltaX);
            double q = (b2 - b1) / (edge1.deltaX - edge2.deltaX);
            ip.setY(Long.valueOf(Math.round(q)));
            if (Math.abs(edge1.deltaX) < Math.abs(edge2.deltaX)) {
                ip.setX(Long.valueOf(Math.round((edge1.deltaX * q) + b1)));
            } else {
                ip.setX(Long.valueOf(Math.round((edge2.deltaX * q) + b2)));
            }
        }
        if (ip.getY() < edge1.getTop().getY() || ip.getY() < edge2.getTop().getY()) {
            if (edge1.getTop().getY() > edge2.getTop().getY()) {
                ip.setY(Long.valueOf(edge1.getTop().getY()));
            } else {
                ip.setY(Long.valueOf(edge2.getTop().getY()));
            }
            if (Math.abs(edge1.deltaX) < Math.abs(edge2.deltaX)) {
                ip.setX(Long.valueOf(Edge.topX(edge1, ip.getY())));
            } else {
                ip.setX(Long.valueOf(Edge.topX(edge2, ip.getY())));
            }
        }
        if (ip.getY() > edge1.getCurrent().getY()) {
            ip.setY(Long.valueOf(edge1.getCurrent().getY()));
            if (Math.abs(edge1.deltaX) > Math.abs(edge2.deltaX)) {
                ip.setX(Long.valueOf(Edge.topX(edge2, ip.getY())));
            } else {
                ip.setX(Long.valueOf(Edge.topX(edge1, ip.getY())));
            }
        }
    }

    private void joinCommonEdges() {
        Path.OutRec holeStateRec;
        for (int i = 0; i < this.joins.size(); i++) {
            Path.Join join = this.joins.get(i);
            Path.OutRec outRec1 = getOutRec(join.outPt1.idx);
            Path.OutRec outRec2 = getOutRec(join.outPt2.idx);
            if (outRec1.getPoints() != null && outRec2.getPoints() != null && !outRec1.isOpen && !outRec2.isOpen) {
                if (outRec1 == outRec2) {
                    holeStateRec = outRec1;
                } else if (isParam1RightOfParam2(outRec1, outRec2)) {
                    holeStateRec = outRec2;
                } else if (isParam1RightOfParam2(outRec2, outRec1)) {
                    holeStateRec = outRec1;
                } else {
                    holeStateRec = Path.OutPt.getLowerMostRec(outRec1, outRec2);
                }
                if (joinPoints(join, outRec1, outRec2)) {
                    if (outRec1 == outRec2) {
                        outRec1.setPoints(join.outPt1);
                        outRec1.bottomPt = null;
                        Path.OutRec outRec22 = createOutRec();
                        outRec22.setPoints(join.outPt2);
                        updateOutPtIdxs(outRec22);
                        if (this.usingPolyTree) {
                            for (int j = 0; j < this.polyOuts.size() - 1; j++) {
                                Path.OutRec oRec = this.polyOuts.get(j);
                                if (oRec.getPoints() != null && parseFirstLeft(oRec.firstLeft) == outRec1 && oRec.isHole != outRec1.isHole && poly2ContainsPoly1(oRec.getPoints(), join.outPt2)) {
                                    oRec.firstLeft = outRec22;
                                }
                            }
                        }
                        if (poly2ContainsPoly1(outRec22.getPoints(), outRec1.getPoints())) {
                            outRec22.isHole = !outRec1.isHole;
                            outRec22.firstLeft = outRec1;
                            if (this.usingPolyTree) {
                                fixupFirstLefts2(outRec22, outRec1);
                            }
                            if ((outRec22.isHole ^ this.reverseSolution) == (outRec22.area() > AudioStats.AUDIO_AMPLITUDE_NONE)) {
                                outRec22.getPoints().reversePolyPtLinks();
                            }
                        } else if (poly2ContainsPoly1(outRec1.getPoints(), outRec22.getPoints())) {
                            outRec22.isHole = outRec1.isHole;
                            outRec1.isHole = !outRec22.isHole;
                            outRec22.firstLeft = outRec1.firstLeft;
                            outRec1.firstLeft = outRec22;
                            if (this.usingPolyTree) {
                                fixupFirstLefts2(outRec1, outRec22);
                            }
                            if ((outRec1.isHole ^ this.reverseSolution) == (outRec1.area() > AudioStats.AUDIO_AMPLITUDE_NONE)) {
                                outRec1.getPoints().reversePolyPtLinks();
                            }
                        } else {
                            outRec22.isHole = outRec1.isHole;
                            outRec22.firstLeft = outRec1.firstLeft;
                            if (this.usingPolyTree) {
                                fixupFirstLefts1(outRec1, outRec22);
                            }
                        }
                    } else {
                        outRec2.setPoints(null);
                        outRec2.bottomPt = null;
                        outRec2.Idx = outRec1.Idx;
                        outRec1.isHole = holeStateRec.isHole;
                        if (holeStateRec == outRec2) {
                            outRec1.firstLeft = outRec2.firstLeft;
                        }
                        outRec2.firstLeft = outRec1;
                        if (this.usingPolyTree) {
                            fixupFirstLefts2(outRec2, outRec1);
                        }
                    }
                }
            }
        }
    }

    private long popScanbeam() {
        LOGGER.entering(DefaultClipper.class.getName(), "popBeam");
        long y = this.scanbeam.y;
        this.scanbeam = this.scanbeam.next;
        return y;
    }

    private void processEdgesAtTopOfScanbeam(long topY) {
        LOGGER.entering(DefaultClipper.class.getName(), "processEdgesAtTopOfScanbeam");
        Edge e = this.activeEdges;
        while (e != null) {
            boolean IsMaximaEdge = e.isMaxima(topY);
            if (IsMaximaEdge) {
                Edge eMaxPair = e.getMaximaPair();
                IsMaximaEdge = eMaxPair == null || !eMaxPair.isHorizontal();
            }
            if (IsMaximaEdge) {
                if (this.strictlySimple) {
                    InsertMaxima(e.getTop().getX());
                }
                Edge ePrev = e.prevInAEL;
                doMaxima(e);
                if (ePrev == null) {
                    e = this.activeEdges;
                } else {
                    e = ePrev.nextInAEL;
                }
            } else {
                if (e.isIntermediate(topY) && e.nextInLML.isHorizontal()) {
                    Edge[] t = {e};
                    updateEdgeIntoAEL(t);
                    e = t[0];
                    if (e.outIdx >= 0) {
                        addOutPt(e, e.getBot());
                    }
                    addEdgeToSEL(e);
                } else {
                    e.getCurrent().setX(Long.valueOf(Edge.topX(e, topY)));
                    e.getCurrent().setY(Long.valueOf(topY));
                }
                if (this.strictlySimple) {
                    Edge ePrev2 = e.prevInAEL;
                    if (e.outIdx >= 0 && e.windDelta != 0 && ePrev2 != null && ePrev2.outIdx >= 0 && ePrev2.getCurrent().getX() == e.getCurrent().getX() && ePrev2.windDelta != 0) {
                        Point.LongPoint ip = new Point.LongPoint(e.getCurrent());
                        setZ(ip, ePrev2, e);
                        Path.OutPt op = addOutPt(ePrev2, ip);
                        Path.OutPt op2 = addOutPt(e, ip);
                        addJoin(op, op2, ip);
                    }
                }
                e = e.nextInAEL;
            }
        }
        processHorizontals();
        this.maxima = null;
        Edge e2 = this.activeEdges;
        while (e2 != null) {
            if (e2.isIntermediate(topY)) {
                Path.OutPt op3 = null;
                if (e2.outIdx >= 0) {
                    op3 = addOutPt(e2, e2.getTop());
                }
                Edge[] t2 = {e2};
                updateEdgeIntoAEL(t2);
                e2 = t2[0];
                Edge ePrev3 = e2.prevInAEL;
                Edge eNext = e2.nextInAEL;
                if (ePrev3 != null && ePrev3.getCurrent().equals(e2.getBot()) && op3 != null && ePrev3.outIdx >= 0 && ePrev3.getCurrent().getY() > ePrev3.getTop().getY() && Edge.slopesEqual(e2, ePrev3, this.useFullRange) && e2.windDelta != 0 && ePrev3.windDelta != 0) {
                    Path.OutPt op22 = addOutPt(ePrev3, e2.getBot());
                    addJoin(op3, op22, e2.getTop());
                } else if (eNext != null && eNext.getCurrent().equals(e2.getBot()) && op3 != null && eNext.outIdx >= 0 && eNext.getCurrent().getY() > eNext.getTop().getY() && Edge.slopesEqual(e2, eNext, this.useFullRange) && e2.windDelta != 0 && eNext.windDelta != 0) {
                    Path.OutPt op23 = addOutPt(eNext, e2.getBot());
                    addJoin(op3, op23, e2.getTop());
                }
            }
            e2 = e2.nextInAEL;
        }
        LOGGER.exiting(DefaultClipper.class.getName(), "processEdgesAtTopOfScanbeam");
    }

    private void processHorizontal(Edge horzEdge) {
        Edge horzEdge2;
        IClipper.Direction[] dir;
        char c;
        boolean IsOpen;
        Edge eMaxPair;
        Path.Maxima currMax;
        IClipper.Direction[] dir2;
        IClipper.Direction[] dir3;
        Path.Maxima currMax2;
        Edge eNextHorz;
        Path.Maxima currMax3;
        Edge horzEdge3;
        Edge e;
        Path.Maxima currMax4;
        Edge eMaxPair2;
        Edge horzEdge4;
        Edge e2;
        Path.Maxima currMax5;
        Edge eMaxPair3;
        char c2;
        boolean IsOpen2;
        Edge horzEdge5 = horzEdge;
        LOGGER.entering(DefaultClipper.class.getName(), "isHorizontal");
        char c3 = 1;
        IClipper.Direction[] dir4 = new IClipper.Direction[1];
        long[] horzLeft = new long[1];
        long[] horzRight = new long[1];
        char c4 = 0;
        boolean IsOpen3 = horzEdge5.outIdx >= 0 && this.polyOuts.get(horzEdge5.outIdx).isOpen;
        getHorzDirection(horzEdge5, dir4, horzLeft, horzRight);
        Edge eLastHorz = horzEdge;
        while (eLastHorz.nextInLML != null && eLastHorz.nextInLML.isHorizontal()) {
            eLastHorz = eLastHorz.nextInLML;
        }
        Edge eMaxPair4 = eLastHorz.nextInLML == null ? eLastHorz.getMaximaPair() : null;
        Path.Maxima currMax6 = this.maxima;
        if (currMax6 != null) {
            if (dir4[0] == IClipper.Direction.LEFT_TO_RIGHT) {
                while (currMax6 != null && currMax6.X <= horzEdge5.getBot().getX()) {
                    currMax6 = currMax6.Next;
                }
                if (currMax6 != null && currMax6.X >= eLastHorz.getBot().getX()) {
                    currMax6 = null;
                }
            } else {
                while (currMax6.Next != null && currMax6.Next.X < horzEdge5.getBot().getX()) {
                    currMax6 = currMax6.Next;
                }
                if (currMax6.X <= eLastHorz.getTop().getX()) {
                    currMax6 = null;
                }
            }
        }
        Path.OutPt op1 = null;
        while (true) {
            char c5 = horzEdge5 == eLastHorz ? c3 : c4;
            Edge e3 = horzEdge5.getNextInAEL(dir4[c4]);
            while (e3 != null) {
                if (currMax6 == null) {
                    c = c4;
                    IsOpen = IsOpen3;
                    currMax3 = currMax6;
                } else {
                    if (dir4[c4] != IClipper.Direction.LEFT_TO_RIGHT) {
                        c = c4;
                        IsOpen = IsOpen3;
                        while (currMax6 != null && currMax6.X > e3.getCurrent().getX()) {
                            if (horzEdge5.outIdx >= 0 && !IsOpen) {
                                addOutPt(horzEdge5, new Point.LongPoint(currMax6.X, horzEdge5.getBot().getY()));
                            }
                            currMax6 = currMax6.Prev;
                        }
                    } else {
                        while (currMax6 != null && currMax6.X < e3.getCurrent().getX()) {
                            if (horzEdge5.outIdx >= 0 && !IsOpen3) {
                                c2 = c4;
                                IsOpen2 = IsOpen3;
                                addOutPt(horzEdge5, new Point.LongPoint(currMax6.X, horzEdge5.getBot().getY()));
                            } else {
                                c2 = c4;
                                IsOpen2 = IsOpen3;
                            }
                            currMax6 = currMax6.Next;
                            c4 = c2;
                            IsOpen3 = IsOpen2;
                        }
                        c = c4;
                        IsOpen = IsOpen3;
                    }
                    currMax3 = currMax6;
                }
                if (dir4[c] == IClipper.Direction.LEFT_TO_RIGHT && e3.getCurrent().getX() > horzRight[c]) {
                    dir = dir4;
                } else if (dir4[c] != IClipper.Direction.RIGHT_TO_LEFT || e3.getCurrent().getX() >= horzLeft[c]) {
                    if (e3.getCurrent().getX() != horzEdge5.getTop().getX() || horzEdge5.nextInLML == null) {
                        dir = dir4;
                    } else {
                        dir = dir4;
                        if (e3.deltaX < horzEdge5.nextInLML.deltaX) {
                        }
                    }
                    if (horzEdge5.outIdx >= 0 && !IsOpen) {
                        Path.OutPt op12 = addOutPt(horzEdge5, e3.getCurrent());
                        Edge eNextHorz2 = this.sortedEdges;
                        while (eNextHorz2 != null) {
                            if (eNextHorz2.outIdx < 0) {
                                horzEdge4 = horzEdge5;
                                e2 = e3;
                                currMax5 = currMax3;
                                eMaxPair3 = eMaxPair4;
                            } else {
                                Path.Maxima maxima = currMax3;
                                eMaxPair3 = eMaxPair4;
                                currMax5 = maxima;
                                horzEdge4 = horzEdge5;
                                e2 = e3;
                                if (doHorzSegmentsOverlap(horzEdge5.getBot().getX(), horzEdge5.getTop().getX(), eNextHorz2.getBot().getX(), eNextHorz2.getTop().getX())) {
                                    Path.OutPt op2 = GetLastOutPt(eNextHorz2);
                                    addJoin(op2, op12, eNextHorz2.getTop());
                                }
                            }
                            eNextHorz2 = eNextHorz2.nextInSEL;
                            horzEdge5 = horzEdge4;
                            eMaxPair4 = eMaxPair3;
                            e3 = e2;
                            currMax3 = currMax5;
                        }
                        horzEdge3 = horzEdge5;
                        e = e3;
                        currMax4 = currMax3;
                        eMaxPair2 = eMaxPair4;
                        addGhostJoin(op12, horzEdge3.getBot());
                        op1 = op12;
                    } else {
                        horzEdge3 = horzEdge5;
                        e = e3;
                        currMax4 = currMax3;
                        eMaxPair2 = eMaxPair4;
                    }
                    if (e != eMaxPair2 || c5 == 0) {
                        Edge horzEdge6 = horzEdge3;
                        if (dir[c] == IClipper.Direction.LEFT_TO_RIGHT) {
                            Point.LongPoint Pt = new Point.LongPoint(e.getCurrent().getX(), horzEdge6.getCurrent().getY());
                            intersectEdges(horzEdge6, e, Pt);
                        } else {
                            Point.LongPoint Pt2 = new Point.LongPoint(e.getCurrent().getX(), horzEdge6.getCurrent().getY());
                            intersectEdges(e, horzEdge6, Pt2);
                        }
                        Edge eNext = e.getNextInAEL(dir[c]);
                        swapPositionsInAEL(horzEdge6, e);
                        e3 = eNext;
                        horzEdge5 = horzEdge6;
                        eMaxPair4 = eMaxPair2;
                        dir4 = dir;
                        c4 = c;
                        IsOpen3 = IsOpen;
                        currMax6 = currMax4;
                    } else {
                        Edge horzEdge7 = horzEdge3;
                        if (horzEdge7.outIdx >= 0) {
                            addLocalMaxPoly(horzEdge7, eMaxPair2, horzEdge7.getTop());
                        }
                        deleteFromAEL(horzEdge7);
                        deleteFromAEL(eMaxPair2);
                        return;
                    }
                } else {
                    dir = dir4;
                }
                horzEdge2 = horzEdge5;
                currMax = currMax3;
                eMaxPair = eMaxPair4;
                break;
            }
            horzEdge2 = horzEdge5;
            dir = dir4;
            c = c4;
            IsOpen = IsOpen3;
            eMaxPair = eMaxPair4;
            currMax = currMax6;
            if (horzEdge2.nextInLML == null) {
                dir2 = dir;
                break;
            } else if (!horzEdge2.nextInLML.isHorizontal()) {
                dir2 = dir;
                break;
            } else {
                Edge[] temp = new Edge[1];
                temp[c] = horzEdge2;
                updateEdgeIntoAEL(temp);
                horzEdge5 = temp[c];
                if (horzEdge5.outIdx >= 0) {
                    addOutPt(horzEdge5, horzEdge5.getBot());
                }
                IClipper.Direction[] dir5 = dir;
                getHorzDirection(horzEdge5, dir5, horzLeft, horzRight);
                currMax6 = currMax;
                IsOpen3 = IsOpen;
                c3 = 1;
                dir4 = dir5;
                eMaxPair4 = eMaxPair;
                c4 = c;
            }
        }
        if (horzEdge2.outIdx >= 0 && op1 == null) {
            Path.OutPt op13 = GetLastOutPt(horzEdge2);
            Edge eNextHorz3 = this.sortedEdges;
            while (eNextHorz3 != null) {
                if (eNextHorz3.outIdx < 0) {
                    dir3 = dir2;
                    currMax2 = currMax;
                    eNextHorz = eNextHorz3;
                } else {
                    currMax2 = currMax;
                    eNextHorz = eNextHorz3;
                    dir3 = dir2;
                    if (doHorzSegmentsOverlap(horzEdge2.getBot().getX(), horzEdge2.getTop().getX(), eNextHorz3.getBot().getX(), eNextHorz3.getTop().getX())) {
                        Path.OutPt op22 = GetLastOutPt(eNextHorz);
                        addJoin(op22, op13, eNextHorz.getTop());
                    }
                }
                eNextHorz3 = eNextHorz.nextInSEL;
                currMax = currMax2;
                dir2 = dir3;
            }
            addGhostJoin(op13, horzEdge2.getTop());
        }
        if (horzEdge2.nextInLML != null) {
            if (horzEdge2.outIdx >= 0) {
                Path.OutPt op14 = addOutPt(horzEdge2, horzEdge2.getTop());
                Edge[] t = new Edge[1];
                t[c] = horzEdge2;
                updateEdgeIntoAEL(t);
                Edge horzEdge8 = t[c];
                if (horzEdge8.windDelta == 0) {
                    return;
                }
                Edge ePrev = horzEdge8.prevInAEL;
                Edge eNext2 = horzEdge8.nextInAEL;
                if (ePrev != null && ePrev.getCurrent().equals(horzEdge8.getBot()) && ePrev.windDelta != 0 && ePrev.outIdx >= 0 && ePrev.getCurrent().getY() > ePrev.getTop().getY() && Edge.slopesEqual(horzEdge8, ePrev, this.useFullRange)) {
                    Path.OutPt op23 = addOutPt(ePrev, horzEdge8.getBot());
                    addJoin(op14, op23, horzEdge8.getTop());
                } else if (eNext2 != null && eNext2.getCurrent().equals(horzEdge8.getBot()) && eNext2.windDelta != 0 && eNext2.outIdx >= 0 && eNext2.getCurrent().getY() > eNext2.getTop().getY() && Edge.slopesEqual(horzEdge8, eNext2, this.useFullRange)) {
                    Path.OutPt op24 = addOutPt(eNext2, horzEdge8.getBot());
                    addJoin(op14, op24, horzEdge8.getTop());
                }
                return;
            }
            Edge[] t2 = new Edge[1];
            t2[c] = horzEdge2;
            updateEdgeIntoAEL(t2);
            Edge edge = t2[c];
            return;
        }
        if (horzEdge2.outIdx >= 0) {
            addOutPt(horzEdge2, horzEdge2.getTop());
        }
        deleteFromAEL(horzEdge2);
    }

    private void processHorizontals() {
        LOGGER.entering(DefaultClipper.class.getName(), "processHorizontals");
        Edge horzEdge = this.sortedEdges;
        while (horzEdge != null) {
            deleteFromSEL(horzEdge);
            processHorizontal(horzEdge);
            horzEdge = this.sortedEdges;
        }
    }

    private boolean processIntersections(long topY) {
        LOGGER.entering(DefaultClipper.class.getName(), "processIntersections");
        if (this.activeEdges == null) {
            return true;
        }
        try {
            buildIntersectList(topY);
            if (this.intersectList.size() == 0) {
                return true;
            }
            if (this.intersectList.size() != 1 && !fixupIntersectionOrder()) {
                return false;
            }
            processIntersectList();
            this.sortedEdges = null;
            return true;
        } catch (Exception e) {
            this.sortedEdges = null;
            this.intersectList.clear();
            throw new IllegalStateException("ProcessIntersections error", e);
        }
    }

    private void processIntersectList() {
        int i = 0;
        while (true) {
            int size = this.intersectList.size();
            List<IntersectNode> list = this.intersectList;
            if (i < size) {
                IntersectNode iNode = list.get(i);
                intersectEdges(iNode.edge1, iNode.Edge2, iNode.getPt());
                swapPositionsInAEL(iNode.edge1, iNode.Edge2);
                i++;
            } else {
                list.clear();
                return;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.kernel.pdf.canvas.parser.clipper.ClipperBase
    public void reset() {
        super.reset();
        this.scanbeam = null;
        this.maxima = null;
        this.activeEdges = null;
        this.sortedEdges = null;
        for (ClipperBase.LocalMinima lm = this.minimaList; lm != null; lm = lm.next) {
            insertScanbeam(lm.y);
        }
    }

    private void setHoleState(Edge e, Path.OutRec outRec) {
        boolean isHole = false;
        Edge e2 = e.prevInAEL;
        while (true) {
            if (e2 == null) {
                break;
            }
            if (e2.outIdx >= 0 && e2.windDelta != 0) {
                boolean isHole2 = isHole ? false : true;
                if (outRec.firstLeft == null) {
                    outRec.firstLeft = this.polyOuts.get(e2.outIdx);
                }
                isHole = isHole2;
            }
            e2 = e2.prevInAEL;
        }
        if (isHole) {
            outRec.isHole = true;
        }
    }

    private void setZ(Point.LongPoint pt, Edge e1, Edge e2) {
        if (pt.getZ() == 0 && this.zFillFunction != null) {
            if (pt.equals(e1.getBot())) {
                pt.setZ(Long.valueOf(e1.getBot().getZ()));
            } else if (pt.equals(e1.getTop())) {
                pt.setZ(Long.valueOf(e1.getTop().getZ()));
            } else if (pt.equals(e2.getBot())) {
                pt.setZ(Long.valueOf(e2.getBot().getZ()));
            } else if (pt.equals(e2.getTop())) {
                pt.setZ(Long.valueOf(e2.getTop().getZ()));
            } else {
                this.zFillFunction.zFill(e1.getBot(), e1.getTop(), e2.getBot(), e2.getTop(), pt);
            }
        }
    }

    private void swapPositionsInAEL(Edge edge1, Edge edge2) {
        LOGGER.entering(DefaultClipper.class.getName(), "swapPositionsInAEL");
        if (edge1.nextInAEL == edge1.prevInAEL || edge2.nextInAEL == edge2.prevInAEL) {
            return;
        }
        if (edge1.nextInAEL == edge2) {
            Edge next = edge2.nextInAEL;
            if (next != null) {
                next.prevInAEL = edge1;
            }
            Edge prev = edge1.prevInAEL;
            if (prev != null) {
                prev.nextInAEL = edge2;
            }
            edge2.prevInAEL = prev;
            edge2.nextInAEL = edge1;
            edge1.prevInAEL = edge2;
            edge1.nextInAEL = next;
        } else if (edge2.nextInAEL == edge1) {
            Edge next2 = edge1.nextInAEL;
            if (next2 != null) {
                next2.prevInAEL = edge2;
            }
            Edge prev2 = edge2.prevInAEL;
            if (prev2 != null) {
                prev2.nextInAEL = edge1;
            }
            edge1.prevInAEL = prev2;
            edge1.nextInAEL = edge2;
            edge2.prevInAEL = edge1;
            edge2.nextInAEL = next2;
        } else {
            Edge next3 = edge1.nextInAEL;
            Edge prev3 = edge1.prevInAEL;
            edge1.nextInAEL = edge2.nextInAEL;
            if (edge1.nextInAEL != null) {
                edge1.nextInAEL.prevInAEL = edge1;
            }
            edge1.prevInAEL = edge2.prevInAEL;
            if (edge1.prevInAEL != null) {
                edge1.prevInAEL.nextInAEL = edge1;
            }
            edge2.nextInAEL = next3;
            if (edge2.nextInAEL != null) {
                edge2.nextInAEL.prevInAEL = edge2;
            }
            edge2.prevInAEL = prev3;
            if (edge2.prevInAEL != null) {
                edge2.prevInAEL.nextInAEL = edge2;
            }
        }
        Edge next4 = edge1.prevInAEL;
        if (next4 == null) {
            this.activeEdges = edge1;
        } else if (edge2.prevInAEL == null) {
            this.activeEdges = edge2;
        }
        LOGGER.exiting(DefaultClipper.class.getName(), "swapPositionsInAEL");
    }

    private void swapPositionsInSEL(Edge edge1, Edge edge2) {
        if (edge1.nextInSEL == null && edge1.prevInSEL == null) {
            return;
        }
        if (edge2.nextInSEL == null && edge2.prevInSEL == null) {
            return;
        }
        if (edge1.nextInSEL == edge2) {
            Edge next = edge2.nextInSEL;
            if (next != null) {
                next.prevInSEL = edge1;
            }
            Edge prev = edge1.prevInSEL;
            if (prev != null) {
                prev.nextInSEL = edge2;
            }
            edge2.prevInSEL = prev;
            edge2.nextInSEL = edge1;
            edge1.prevInSEL = edge2;
            edge1.nextInSEL = next;
        } else if (edge2.nextInSEL == edge1) {
            Edge next2 = edge1.nextInSEL;
            if (next2 != null) {
                next2.prevInSEL = edge2;
            }
            Edge prev2 = edge2.prevInSEL;
            if (prev2 != null) {
                prev2.nextInSEL = edge1;
            }
            edge1.prevInSEL = prev2;
            edge1.nextInSEL = edge2;
            edge2.prevInSEL = edge1;
            edge2.nextInSEL = next2;
        } else {
            Edge next3 = edge1.nextInSEL;
            Edge prev3 = edge1.prevInSEL;
            edge1.nextInSEL = edge2.nextInSEL;
            if (edge1.nextInSEL != null) {
                edge1.nextInSEL.prevInSEL = edge1;
            }
            edge1.prevInSEL = edge2.prevInSEL;
            if (edge1.prevInSEL != null) {
                edge1.prevInSEL.nextInSEL = edge1;
            }
            edge2.nextInSEL = next3;
            if (edge2.nextInSEL != null) {
                edge2.nextInSEL.prevInSEL = edge2;
            }
            edge2.prevInSEL = prev3;
            if (edge2.prevInSEL != null) {
                edge2.prevInSEL.nextInSEL = edge2;
            }
        }
        Edge next4 = edge1.prevInSEL;
        if (next4 == null) {
            this.sortedEdges = edge1;
        } else if (edge2.prevInSEL == null) {
            this.sortedEdges = edge2;
        }
    }

    private void updateEdgeIntoAEL(Edge[] eV) {
        Edge e = eV[0];
        if (e.nextInLML == null) {
            throw new IllegalStateException("UpdateEdgeIntoAEL: invalid call");
        }
        Edge AelPrev = e.prevInAEL;
        Edge AelNext = e.nextInAEL;
        e.nextInLML.outIdx = e.outIdx;
        if (AelPrev != null) {
            AelPrev.nextInAEL = e.nextInLML;
        } else {
            this.activeEdges = e.nextInLML;
        }
        if (AelNext != null) {
            AelNext.prevInAEL = e.nextInLML;
        }
        e.nextInLML.side = e.side;
        e.nextInLML.windDelta = e.windDelta;
        e.nextInLML.windCnt = e.windCnt;
        e.nextInLML.windCnt2 = e.windCnt2;
        Edge e2 = e.nextInLML;
        eV[0] = e2;
        e2.setCurrent(e2.getBot());
        e2.prevInAEL = AelPrev;
        e2.nextInAEL = AelNext;
        if (!e2.isHorizontal()) {
            insertScanbeam(e2.getTop().getY());
        }
    }

    private void updateOutPtIdxs(Path.OutRec outrec) {
        Path.OutPt op = outrec.getPoints();
        do {
            op.idx = outrec.Idx;
            op = op.prev;
        } while (op != outrec.getPoints());
    }

    private void updateWindingCount(Edge edge) {
        Edge e;
        LOGGER.entering(DefaultClipper.class.getName(), "updateWindingCount");
        Edge e2 = edge.prevInAEL;
        while (e2 != null && (e2.polyTyp != edge.polyTyp || e2.windDelta == 0)) {
            e2 = e2.prevInAEL;
        }
        if (e2 == null) {
            edge.windCnt = edge.windDelta == 0 ? 1 : edge.windDelta;
            edge.windCnt2 = 0;
            e = this.activeEdges;
        } else if (edge.windDelta == 0 && this.clipType != IClipper.ClipType.UNION) {
            edge.windCnt = 1;
            edge.windCnt2 = e2.windCnt2;
            e = e2.nextInAEL;
        } else if (edge.isEvenOddFillType(this.clipFillType, this.subjFillType)) {
            if (edge.windDelta == 0) {
                boolean Inside = true;
                for (Edge e22 = e2.prevInAEL; e22 != null; e22 = e22.prevInAEL) {
                    if (e22.polyTyp == e2.polyTyp && e22.windDelta != 0) {
                        Inside = !Inside;
                    }
                }
                edge.windCnt = Inside ? 0 : 1;
            } else {
                edge.windCnt = edge.windDelta;
            }
            edge.windCnt2 = e2.windCnt2;
            e = e2.nextInAEL;
        } else {
            if (e2.windCnt * e2.windDelta < 0) {
                if (Math.abs(e2.windCnt) > 1) {
                    if (e2.windDelta * edge.windDelta < 0) {
                        edge.windCnt = e2.windCnt;
                    } else {
                        edge.windCnt = e2.windCnt + edge.windDelta;
                    }
                } else {
                    edge.windCnt = edge.windDelta == 0 ? 1 : edge.windDelta;
                }
            } else if (edge.windDelta == 0) {
                edge.windCnt = e2.windCnt < 0 ? e2.windCnt - 1 : e2.windCnt + 1;
            } else if (e2.windDelta * edge.windDelta < 0) {
                edge.windCnt = e2.windCnt;
            } else {
                edge.windCnt = e2.windCnt + edge.windDelta;
            }
            edge.windCnt2 = e2.windCnt2;
            e = e2.nextInAEL;
        }
        if (edge.isEvenOddAltFillType(this.clipFillType, this.subjFillType)) {
            while (e != edge) {
                if (e.windDelta != 0) {
                    edge.windCnt2 = edge.windCnt2 == 0 ? 1 : 0;
                }
                e = e.nextInAEL;
            }
            return;
        }
        while (e != edge) {
            edge.windCnt2 += e.windDelta;
            e = e.nextInAEL;
        }
    }
}
