package com.itextpdf.kernel.pdf.canvas.parser.clipper;

import com.itextpdf.kernel.pdf.canvas.parser.clipper.Edge;
import com.itextpdf.kernel.pdf.canvas.parser.clipper.IClipper;
import com.itextpdf.kernel.pdf.canvas.parser.clipper.Path;
import com.itextpdf.kernel.pdf.canvas.parser.clipper.Point;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
/* loaded from: classes12.dex */
public abstract class ClipperBase implements IClipper {
    private static final long HI_RANGE = 4611686018427387903L;
    private static final Logger LOGGER = Logger.getLogger(IClipper.class.getName());
    private static final long LOW_RANGE = 1073741823;
    protected final boolean preserveCollinear;
    protected boolean useFullRange;
    protected LocalMinima minimaList = null;
    protected LocalMinima currentLM = null;
    protected boolean hasOpenPaths = false;
    private final List<List<Edge>> edges = new ArrayList();

    /* JADX INFO: Access modifiers changed from: protected */
    /* loaded from: classes12.dex */
    public class LocalMinima {
        Edge leftBound;
        LocalMinima next;
        Edge rightBound;
        long y;

        protected LocalMinima() {
        }
    }

    /* loaded from: classes12.dex */
    protected class Scanbeam {
        Scanbeam next;
        long y;

        /* JADX INFO: Access modifiers changed from: protected */
        public Scanbeam() {
        }
    }

    private static void initEdge(Edge e, Edge eNext, Edge ePrev, Point.LongPoint pt) {
        e.next = eNext;
        e.prev = ePrev;
        e.setCurrent(new Point.LongPoint(pt));
        e.outIdx = -1;
    }

    private static void initEdge2(Edge e, IClipper.PolyType polyType) {
        if (e.getCurrent().getY() >= e.next.getCurrent().getY()) {
            e.setBot(new Point.LongPoint(e.getCurrent()));
            e.setTop(new Point.LongPoint(e.next.getCurrent()));
        } else {
            e.setTop(new Point.LongPoint(e.getCurrent()));
            e.setBot(new Point.LongPoint(e.next.getCurrent()));
        }
        e.updateDeltaX();
        e.polyTyp = polyType;
    }

    private static boolean rangeTest(Point.LongPoint Pt, boolean useFullRange) {
        if (useFullRange) {
            if (Pt.getX() > 4611686018427387903L || Pt.getY() > 4611686018427387903L || (-Pt.getX()) > 4611686018427387903L || (-Pt.getY()) > 4611686018427387903L) {
                throw new ClipperException(ClipperExceptionConstant.COORDINATE_OUTSIDE_ALLOWED_RANGE);
            }
        } else if (Pt.getX() > 1073741823 || Pt.getY() > 1073741823 || (-Pt.getX()) > 1073741823 || (-Pt.getY()) > 1073741823) {
            return rangeTest(Pt, true);
        }
        return useFullRange;
    }

    private static Edge removeEdge(Edge e) {
        e.prev.next = e.next;
        e.next.prev = e.prev;
        Edge result = e.next;
        e.prev = null;
        return result;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public ClipperBase(boolean preserveCollinear) {
        this.preserveCollinear = preserveCollinear;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r4v1, types: [boolean] */
    /* JADX WARN: Type inference failed for: r4v2, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r4v5 */
    /* JADX WARN: Type inference failed for: r4v7 */
    @Override // com.itextpdf.kernel.pdf.canvas.parser.clipper.IClipper
    public boolean addPath(Path pg, IClipper.PolyType polyType, boolean Closed) {
        boolean leftBoundIsForward;
        LocalMinima localMinima;
        if (!Closed && polyType == IClipper.PolyType.CLIP) {
            throw new IllegalStateException("AddPath: Open paths must be subject.");
        }
        boolean z = 1;
        int highI = pg.size() - 1;
        if (Closed) {
            while (highI > 0 && pg.get(highI).equals(pg.get(0))) {
                highI--;
            }
        }
        while (highI > 0 && pg.get(highI).equals(pg.get(highI - 1))) {
            highI--;
        }
        if ((Closed && highI < 2) || (!Closed && highI < 1)) {
            return false;
        }
        List<Edge> edges = new ArrayList<>(highI + 1);
        for (int i = 0; i <= highI; i++) {
            edges.add(new Edge());
        }
        boolean IsFlat = true;
        edges.get(1).setCurrent(new Point.LongPoint(pg.get(1)));
        this.useFullRange = rangeTest(pg.get(0), this.useFullRange);
        this.useFullRange = rangeTest(pg.get(highI), this.useFullRange);
        initEdge(edges.get(0), edges.get(1), edges.get(highI), pg.get(0));
        initEdge(edges.get(highI), edges.get(0), edges.get(highI - 1), pg.get(highI));
        for (int i2 = highI - 1; i2 >= 1; i2--) {
            this.useFullRange = rangeTest(pg.get(i2), this.useFullRange);
            initEdge(edges.get(i2), edges.get(i2 + 1), edges.get(i2 - 1), pg.get(i2));
        }
        Edge eStart = edges.get(0);
        Edge e = eStart;
        Edge eLoopStop = eStart;
        while (true) {
            if (e.getCurrent().equals(e.next.getCurrent()) && (Closed || !e.next.equals(eStart))) {
                if (e == e.next) {
                    break;
                }
                if (e == eStart) {
                    eStart = e.next;
                }
                e = removeEdge(e);
                eLoopStop = e;
            } else if (e.prev != e.next) {
                if (Closed && Point.slopesEqual(e.prev.getCurrent(), e.getCurrent(), e.next.getCurrent(), this.useFullRange) && (!isPreserveCollinear() || !Point.isPt2BetweenPt1AndPt3(e.prev.getCurrent(), e.getCurrent(), e.next.getCurrent()))) {
                    if (e == eStart) {
                        eStart = e.next;
                    }
                    e = removeEdge(e).prev;
                    eLoopStop = e;
                } else {
                    e = e.next;
                    if (e == eLoopStop) {
                        break;
                    } else if (!Closed && e.next == eStart) {
                        break;
                    }
                }
            } else {
                break;
            }
        }
        if ((!Closed && e == e.next) || (Closed && e.prev == e.next)) {
            return false;
        }
        if (!Closed) {
            this.hasOpenPaths = true;
            eStart.prev.outIdx = -2;
        }
        Edge e2 = eStart;
        while (true) {
            initEdge2(e2, polyType);
            e2 = e2.next;
            if (IsFlat && e2.getCurrent().getY() != eStart.getCurrent().getY()) {
                IsFlat = false;
            }
            if (e2 == eStart) {
                break;
            }
            z = 1;
        }
        LocalMinima localMinima2 = null;
        if (IsFlat) {
            if (Closed) {
                return false;
            }
            e2.prev.outIdx = -2;
            LocalMinima locMin = new LocalMinima();
            locMin.next = null;
            locMin.y = e2.getBot().getY();
            locMin.leftBound = null;
            locMin.rightBound = e2;
            locMin.rightBound.side = Edge.Side.RIGHT;
            locMin.rightBound.windDelta = 0;
            while (true) {
                if (e2.getBot().getX() != e2.prev.getTop().getX()) {
                    e2.reverseHorizontal();
                }
                if (e2.next.outIdx != -2) {
                    e2.nextInLML = e2.next;
                    e2 = e2.next;
                } else {
                    insertLocalMinima(locMin);
                    this.edges.add(edges);
                    return z;
                }
            }
        } else {
            this.edges.add(edges);
            Edge EMin = null;
            if (e2.prev.getBot().equals(e2.prev.getTop())) {
                e2 = e2.next;
            }
            while (true) {
                Edge e3 = e2.findNextLocMin();
                if (e3 != EMin) {
                    if (EMin == null) {
                        EMin = e3;
                    }
                    LocalMinima locMin2 = new LocalMinima();
                    locMin2.next = localMinima2;
                    Edge EMin2 = EMin;
                    locMin2.y = e3.getBot().getY();
                    if (e3.deltaX < e3.prev.deltaX) {
                        locMin2.leftBound = e3.prev;
                        locMin2.rightBound = e3;
                        leftBoundIsForward = false;
                    } else {
                        locMin2.leftBound = e3;
                        locMin2.rightBound = e3.prev;
                        leftBoundIsForward = true;
                    }
                    locMin2.leftBound.side = Edge.Side.LEFT;
                    locMin2.rightBound.side = Edge.Side.RIGHT;
                    if (!Closed) {
                        locMin2.leftBound.windDelta = 0;
                    } else if (locMin2.leftBound.next == locMin2.rightBound) {
                        locMin2.leftBound.windDelta = -1;
                    } else {
                        locMin2.leftBound.windDelta = z;
                    }
                    locMin2.rightBound.windDelta = -locMin2.leftBound.windDelta;
                    e2 = processBound(locMin2.leftBound, leftBoundIsForward);
                    if (e2.outIdx == -2) {
                        e2 = processBound(e2, leftBoundIsForward);
                    }
                    Edge E2 = processBound(locMin2.rightBound, !leftBoundIsForward);
                    if (E2.outIdx == -2) {
                        E2 = processBound(E2, !leftBoundIsForward);
                    }
                    if (locMin2.leftBound.outIdx == -2) {
                        localMinima = null;
                        locMin2.leftBound = null;
                    } else {
                        localMinima = null;
                        if (locMin2.rightBound.outIdx == -2) {
                            locMin2.rightBound = null;
                        }
                    }
                    insertLocalMinima(locMin2);
                    if (!leftBoundIsForward) {
                        e2 = E2;
                    }
                    localMinima2 = localMinima;
                    EMin = EMin2;
                    z = 1;
                } else {
                    return z;
                }
            }
        }
    }

    @Override // com.itextpdf.kernel.pdf.canvas.parser.clipper.IClipper
    public boolean addPaths(Paths ppg, IClipper.PolyType polyType, boolean closed) {
        boolean result = false;
        for (int i = 0; i < ppg.size(); i++) {
            if (addPath(ppg.get(i), polyType, closed)) {
                result = true;
            }
        }
        return result;
    }

    @Override // com.itextpdf.kernel.pdf.canvas.parser.clipper.IClipper
    public void clear() {
        disposeLocalMinimaList();
        this.edges.clear();
        this.useFullRange = false;
        this.hasOpenPaths = false;
    }

    private void disposeLocalMinimaList() {
        while (this.minimaList != null) {
            LocalMinima tmpLm = this.minimaList.next;
            this.minimaList = null;
            this.minimaList = tmpLm;
        }
        this.currentLM = null;
    }

    private void insertLocalMinima(LocalMinima newLm) {
        if (this.minimaList == null) {
            this.minimaList = newLm;
        } else if (newLm.y >= this.minimaList.y) {
            newLm.next = this.minimaList;
            this.minimaList = newLm;
        } else {
            LocalMinima tmpLm = this.minimaList;
            while (tmpLm.next != null && newLm.y < tmpLm.next.y) {
                tmpLm = tmpLm.next;
            }
            newLm.next = tmpLm.next;
            tmpLm.next = newLm;
        }
    }

    public boolean isPreserveCollinear() {
        return this.preserveCollinear;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void popLocalMinima() {
        LOGGER.entering(ClipperBase.class.getName(), "popLocalMinima");
        if (this.currentLM == null) {
            return;
        }
        this.currentLM = this.currentLM.next;
    }

    private Edge processBound(Edge e, boolean LeftBoundIsForward) {
        Edge EStart;
        Edge e2;
        Edge result = e;
        if (result.outIdx == -2) {
            Edge e3 = result;
            if (LeftBoundIsForward) {
                while (e3.getTop().getY() == e3.next.getBot().getY()) {
                    e3 = e3.next;
                }
                while (e3 != result && e3.deltaX == -3.4E38d) {
                    e3 = e3.prev;
                }
            } else {
                while (e3.getTop().getY() == e3.prev.getBot().getY()) {
                    e3 = e3.prev;
                }
                while (e3 != result && e3.deltaX == -3.4E38d) {
                    e3 = e3.next;
                }
            }
            if (e3 == result) {
                if (LeftBoundIsForward) {
                    return e3.next;
                }
                return e3.prev;
            }
            if (LeftBoundIsForward) {
                e2 = result.next;
            } else {
                e2 = result.prev;
            }
            LocalMinima locMin = new LocalMinima();
            locMin.next = null;
            locMin.y = e2.getBot().getY();
            locMin.leftBound = null;
            locMin.rightBound = e2;
            e2.windDelta = 0;
            Edge result2 = processBound(e2, LeftBoundIsForward);
            insertLocalMinima(locMin);
            return result2;
        }
        if (e.deltaX == -3.4E38d) {
            if (LeftBoundIsForward) {
                EStart = e.prev;
            } else {
                EStart = e.next;
            }
            if (EStart.deltaX == -3.4E38d) {
                if (EStart.getBot().getX() != e.getBot().getX() && EStart.getTop().getX() != e.getBot().getX()) {
                    e.reverseHorizontal();
                }
            } else if (EStart.getBot().getX() != e.getBot().getX()) {
                e.reverseHorizontal();
            }
        }
        if (LeftBoundIsForward) {
            while (result.getTop().getY() == result.next.getBot().getY() && result.next.outIdx != -2) {
                result = result.next;
            }
            if (result.deltaX == -3.4E38d && result.next.outIdx != -2) {
                Edge Horz = result;
                while (Horz.prev.deltaX == -3.4E38d) {
                    Horz = Horz.prev;
                }
                if (Horz.prev.getTop().getX() > result.next.getTop().getX()) {
                    result = Horz.prev;
                }
            }
            while (e != result) {
                e.nextInLML = e.next;
                if (e.deltaX == -3.4E38d && e != e && e.getBot().getX() != e.prev.getTop().getX()) {
                    e.reverseHorizontal();
                }
                e = e.next;
            }
            if (e.deltaX == -3.4E38d && e != e && e.getBot().getX() != e.prev.getTop().getX()) {
                e.reverseHorizontal();
            }
            return result.next;
        }
        while (result.getTop().getY() == result.prev.getBot().getY() && result.prev.outIdx != -2) {
            result = result.prev;
        }
        if (result.deltaX == -3.4E38d && result.prev.outIdx != -2) {
            Edge Horz2 = result;
            while (Horz2.next.deltaX == -3.4E38d) {
                Horz2 = Horz2.next;
            }
            if (Horz2.next.getTop().getX() == result.prev.getTop().getX() || Horz2.next.getTop().getX() > result.prev.getTop().getX()) {
                result = Horz2.next;
            }
        }
        while (e != result) {
            e.nextInLML = e.prev;
            if (e.deltaX == -3.4E38d && e != e && e.getBot().getX() != e.next.getTop().getX()) {
                e.reverseHorizontal();
            }
            e = e.prev;
        }
        if (e.deltaX == -3.4E38d && e != e && e.getBot().getX() != e.next.getTop().getX()) {
            e.reverseHorizontal();
        }
        return result.prev;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static Path.OutRec parseFirstLeft(Path.OutRec FirstLeft) {
        while (FirstLeft != null && FirstLeft.getPoints() == null) {
            FirstLeft = FirstLeft.firstLeft;
        }
        return FirstLeft;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void reset() {
        this.currentLM = this.minimaList;
        if (this.currentLM == null) {
            return;
        }
        for (LocalMinima lm = this.minimaList; lm != null; lm = lm.next) {
            Edge e = lm.leftBound;
            if (e != null) {
                e.setCurrent(new Point.LongPoint(e.getBot()));
                e.side = Edge.Side.LEFT;
                e.outIdx = -1;
            }
            Edge e2 = lm.rightBound;
            if (e2 != null) {
                e2.setCurrent(new Point.LongPoint(e2.getBot()));
                e2.side = Edge.Side.RIGHT;
                e2.outIdx = -1;
            }
        }
    }
}
