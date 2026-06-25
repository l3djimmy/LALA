package com.itextpdf.kernel.pdf.canvas.parser.clipper;

import androidx.camera.video.AudioStats;
import com.itextpdf.kernel.pdf.canvas.parser.clipper.Point;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
/* loaded from: classes12.dex */
public class Path extends ArrayList<Point.LongPoint> {

    /* loaded from: classes12.dex */
    protected static class Maxima {
        protected Maxima Next;
        protected Maxima Prev;
        protected long X;
    }

    /* loaded from: classes12.dex */
    static class Join {
        private Point.LongPoint offPt;
        OutPt outPt1;
        OutPt outPt2;

        public Point.LongPoint getOffPt() {
            return this.offPt;
        }

        public void setOffPt(Point.LongPoint offPt) {
            this.offPt = offPt;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes12.dex */
    public static class OutPt {
        int idx;
        OutPt next;
        OutPt prev;
        protected Point.LongPoint pt;

        public static OutRec getLowerMostRec(OutRec outRec1, OutRec outRec2) {
            if (outRec1.bottomPt == null) {
                outRec1.bottomPt = outRec1.pts.getBottomPt();
            }
            if (outRec2.bottomPt == null) {
                outRec2.bottomPt = outRec2.pts.getBottomPt();
            }
            OutPt bPt1 = outRec1.bottomPt;
            OutPt bPt2 = outRec2.bottomPt;
            if (bPt1.getPt().getY() > bPt2.getPt().getY()) {
                return outRec1;
            }
            if (bPt1.getPt().getY() < bPt2.getPt().getY()) {
                return outRec2;
            }
            if (bPt1.getPt().getX() < bPt2.getPt().getX()) {
                return outRec1;
            }
            if (bPt1.getPt().getX() > bPt2.getPt().getX()) {
                return outRec2;
            }
            if (bPt1.next == bPt1) {
                return outRec2;
            }
            if (bPt2.next == bPt2) {
                return outRec1;
            }
            if (isFirstBottomPt(bPt1, bPt2)) {
                return outRec1;
            }
            return outRec2;
        }

        private static boolean isFirstBottomPt(OutPt btmPt1, OutPt btmPt2) {
            OutPt p = btmPt1.prev;
            while (p.getPt().equals(btmPt1.getPt()) && !p.equals(btmPt1)) {
                p = p.prev;
            }
            double dx1p = Math.abs(Point.LongPoint.getDeltaX(btmPt1.getPt(), p.getPt()));
            OutPt p2 = btmPt1.next;
            while (p2.getPt().equals(btmPt1.getPt()) && !p2.equals(btmPt1)) {
                p2 = p2.next;
            }
            double dx1n = Math.abs(Point.LongPoint.getDeltaX(btmPt1.getPt(), p2.getPt()));
            OutPt p3 = btmPt2.prev;
            while (p3.getPt().equals(btmPt2.getPt()) && !p3.equals(btmPt2)) {
                p3 = p3.prev;
            }
            double dx2p = Math.abs(Point.LongPoint.getDeltaX(btmPt2.getPt(), p3.getPt()));
            OutPt p4 = btmPt2.next;
            while (p4.getPt().equals(btmPt2.getPt()) && p4.equals(btmPt2)) {
                p4 = p4.next;
            }
            double dx2n = Math.abs(Point.LongPoint.getDeltaX(btmPt2.getPt(), p4.getPt()));
            return (dx1p >= dx2p && dx1p >= dx2n) || (dx1n >= dx2p && dx1n >= dx2n);
        }

        public OutPt duplicate(boolean InsertAfter) {
            OutPt result = new OutPt();
            result.setPt(new Point.LongPoint(getPt()));
            result.idx = this.idx;
            if (InsertAfter) {
                result.next = this.next;
                result.prev = this;
                this.next.prev = result;
                this.next = result;
            } else {
                result.prev = this.prev;
                result.next = this;
                this.prev.next = result;
                this.prev = result;
            }
            return result;
        }

        /* JADX WARN: Code restructure failed: missing block: B:20:0x0068, code lost:
            if (r0 != null) goto L28;
         */
        /* JADX WARN: Code restructure failed: missing block: B:21:0x006a, code lost:
            if (r0 == r1) goto L37;
         */
        /* JADX WARN: Code restructure failed: missing block: B:23:0x0070, code lost:
            if (isFirstBottomPt(r1, r0) != false) goto L32;
         */
        /* JADX WARN: Code restructure failed: missing block: B:24:0x0072, code lost:
            r2 = r0;
         */
        /* JADX WARN: Code restructure failed: missing block: B:25:0x0073, code lost:
            r0 = r0.next;
         */
        /* JADX WARN: Code restructure failed: missing block: B:27:0x0081, code lost:
            if (r0.getPt().equals(r2.getPt()) != false) goto L36;
         */
        /* JADX WARN: Code restructure failed: missing block: B:28:0x0083, code lost:
            r0 = r0.next;
         */
        /* JADX WARN: Code restructure failed: missing block: B:29:0x0086, code lost:
            return r2;
         */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        com.itextpdf.kernel.pdf.canvas.parser.clipper.Path.OutPt getBottomPt() {
            /*
                r7 = this;
                r0 = 0
                com.itextpdf.kernel.pdf.canvas.parser.clipper.Path$OutPt r1 = r7.next
                r2 = r7
            L4:
                if (r1 == r2) goto L68
                com.itextpdf.kernel.pdf.canvas.parser.clipper.Point$LongPoint r3 = r1.getPt()
                long r3 = r3.getY()
                com.itextpdf.kernel.pdf.canvas.parser.clipper.Point$LongPoint r5 = r2.getPt()
                long r5 = r5.getY()
                int r3 = (r3 > r5 ? 1 : (r3 == r5 ? 0 : -1))
                if (r3 <= 0) goto L1d
                r2 = r1
                r0 = 0
                goto L65
            L1d:
                com.itextpdf.kernel.pdf.canvas.parser.clipper.Point$LongPoint r3 = r1.getPt()
                long r3 = r3.getY()
                com.itextpdf.kernel.pdf.canvas.parser.clipper.Point$LongPoint r5 = r2.getPt()
                long r5 = r5.getY()
                int r3 = (r3 > r5 ? 1 : (r3 == r5 ? 0 : -1))
                if (r3 != 0) goto L65
                com.itextpdf.kernel.pdf.canvas.parser.clipper.Point$LongPoint r3 = r1.getPt()
                long r3 = r3.getX()
                com.itextpdf.kernel.pdf.canvas.parser.clipper.Point$LongPoint r5 = r2.getPt()
                long r5 = r5.getX()
                int r3 = (r3 > r5 ? 1 : (r3 == r5 ? 0 : -1))
                if (r3 > 0) goto L65
                com.itextpdf.kernel.pdf.canvas.parser.clipper.Point$LongPoint r3 = r1.getPt()
                long r3 = r3.getX()
                com.itextpdf.kernel.pdf.canvas.parser.clipper.Point$LongPoint r5 = r2.getPt()
                long r5 = r5.getX()
                int r3 = (r3 > r5 ? 1 : (r3 == r5 ? 0 : -1))
                if (r3 >= 0) goto L5c
                r0 = 0
                r2 = r1
                goto L65
            L5c:
                com.itextpdf.kernel.pdf.canvas.parser.clipper.Path$OutPt r3 = r1.next
                if (r3 == r2) goto L65
                com.itextpdf.kernel.pdf.canvas.parser.clipper.Path$OutPt r3 = r1.prev
                if (r3 == r2) goto L65
                r0 = r1
            L65:
                com.itextpdf.kernel.pdf.canvas.parser.clipper.Path$OutPt r1 = r1.next
                goto L4
            L68:
                if (r0 == 0) goto L86
            L6a:
                if (r0 == r1) goto L86
                boolean r3 = isFirstBottomPt(r1, r0)
                if (r3 != 0) goto L73
                r2 = r0
            L73:
                com.itextpdf.kernel.pdf.canvas.parser.clipper.Path$OutPt r0 = r0.next
            L75:
                com.itextpdf.kernel.pdf.canvas.parser.clipper.Point$LongPoint r3 = r0.getPt()
                com.itextpdf.kernel.pdf.canvas.parser.clipper.Point$LongPoint r4 = r2.getPt()
                boolean r3 = r3.equals(r4)
                if (r3 != 0) goto L6a
                com.itextpdf.kernel.pdf.canvas.parser.clipper.Path$OutPt r0 = r0.next
                goto L75
            L86:
                return r2
            */
            throw new UnsupportedOperationException("Method not decompiled: com.itextpdf.kernel.pdf.canvas.parser.clipper.Path.OutPt.getBottomPt():com.itextpdf.kernel.pdf.canvas.parser.clipper.Path$OutPt");
        }

        public int getPointCount() {
            int result = 0;
            OutPt p = this;
            do {
                result++;
                p = p.next;
                if (p == this) {
                    break;
                }
            } while (p != null);
            return result;
        }

        public Point.LongPoint getPt() {
            return this.pt;
        }

        public void reversePolyPtLinks() {
            OutPt pp1 = this;
            do {
                OutPt pp2 = pp1.next;
                pp1.next = pp1.prev;
                pp1.prev = pp2;
                pp1 = pp2;
            } while (pp1 != this);
        }

        public void setPt(Point.LongPoint pt) {
            this.pt = pt;
        }
    }

    /* loaded from: classes12.dex */
    static class OutRec {
        int Idx;
        OutPt bottomPt;
        OutRec firstLeft;
        boolean isHole;
        boolean isOpen;
        PolyNode polyNode;
        protected OutPt pts;

        public double area() {
            OutPt op = this.pts;
            if (op == null) {
                return AudioStats.AUDIO_AMPLITUDE_NONE;
            }
            double a = AudioStats.AUDIO_AMPLITUDE_NONE;
            do {
                a += (op.prev.getPt().getX() + op.getPt().getX()) * (op.prev.getPt().getY() - op.getPt().getY());
                op = op.next;
            } while (op != this.pts);
            return 0.5d * a;
        }

        public void fixHoleLinkage() {
            if (this.firstLeft != null) {
                if (this.isHole != this.firstLeft.isHole && this.firstLeft.pts != null) {
                    return;
                }
                OutRec orfl = this.firstLeft;
                while (orfl != null && (orfl.isHole == this.isHole || orfl.pts == null)) {
                    orfl = orfl.firstLeft;
                }
                this.firstLeft = orfl;
            }
        }

        public OutPt getPoints() {
            return this.pts;
        }

        public void setPoints(OutPt pts) {
            this.pts = pts;
        }
    }

    private static OutPt excludeOp(OutPt op) {
        OutPt result = op.prev;
        result.next = op.next;
        op.next.prev = result;
        result.idx = 0;
        return result;
    }

    public Path() {
    }

    public Path(Point.LongPoint[] points) {
        this();
        for (Point.LongPoint point : points) {
            add(point);
        }
    }

    public Path(int cnt) {
        super(cnt);
    }

    public Path(Collection<? extends Point.LongPoint> c) {
        super(c);
    }

    public double area() {
        int cnt = size();
        if (cnt < 3) {
            return AudioStats.AUDIO_AMPLITUDE_NONE;
        }
        double a = AudioStats.AUDIO_AMPLITUDE_NONE;
        int j = cnt - 1;
        for (int i = 0; i < cnt; i++) {
            a += (get(j).getX() + get(i).getX()) * (get(j).getY() - get(i).getY());
            j = i;
        }
        return (-a) * 0.5d;
    }

    public Path cleanPolygon() {
        return cleanPolygon(1.415d);
    }

    public Path cleanPolygon(double distance) {
        int cnt = size();
        if (cnt == 0) {
            return new Path();
        }
        OutPt[] outPts = new OutPt[cnt];
        for (int i = 0; i < cnt; i++) {
            outPts[i] = new OutPt();
        }
        for (int i2 = 0; i2 < cnt; i2++) {
            outPts[i2].pt = get(i2);
            outPts[i2].next = outPts[(i2 + 1) % cnt];
            outPts[i2].next.prev = outPts[i2];
            outPts[i2].idx = 0;
        }
        double distSqrd = distance * distance;
        OutPt op = outPts[0];
        while (op.idx == 0 && op.next != op.prev) {
            if (Point.arePointsClose(op.pt, op.prev.pt, distSqrd)) {
                op = excludeOp(op);
                cnt--;
            } else if (Point.arePointsClose(op.prev.pt, op.next.pt, distSqrd)) {
                excludeOp(op.next);
                op = excludeOp(op);
                cnt -= 2;
            } else if (Point.slopesNearCollinear(op.prev.pt, op.pt, op.next.pt, distSqrd)) {
                op = excludeOp(op);
                cnt--;
            } else {
                op.idx = 1;
                op = op.next;
            }
        }
        if (cnt < 3) {
            cnt = 0;
        }
        Path result = new Path(cnt);
        for (int i3 = 0; i3 < cnt; i3++) {
            result.add(op.pt);
            op = op.next;
        }
        return result;
    }

    public int isPointInPolygon(Point.LongPoint pt) {
        int i;
        int result = 0;
        int cnt = size();
        int i2 = 0;
        if (cnt < 3) {
            return 0;
        }
        Point.LongPoint ip = get(0);
        int i3 = 1;
        while (i3 <= cnt) {
            Point.LongPoint ipNext = i3 == cnt ? get(i2) : get(i3);
            if (ipNext.getY() == pt.getY()) {
                if (ipNext.getX() != pt.getX()) {
                    if (ip.getY() == pt.getY()) {
                        if ((ipNext.getX() > pt.getX() ? 1 : i2) == (ip.getX() < pt.getX() ? 1 : i2)) {
                        }
                    }
                }
                return -1;
            }
            if ((ip.getY() < pt.getY() ? 1 : i2) == (ipNext.getY() < pt.getY() ? 1 : i2)) {
                i = i3;
            } else if (ip.getX() >= pt.getX()) {
                if (ipNext.getX() > pt.getX()) {
                    result = 1 - result;
                    i = i3;
                } else {
                    i = i3;
                    double d = ((ip.getX() - pt.getX()) * (ipNext.getY() - pt.getY())) - ((ipNext.getX() - pt.getX()) * (ip.getY() - pt.getY()));
                    if (d == AudioStats.AUDIO_AMPLITUDE_NONE) {
                        return -1;
                    }
                    if ((d > AudioStats.AUDIO_AMPLITUDE_NONE) == (ipNext.getY() > ip.getY())) {
                        result = 1 - result;
                    }
                }
            } else {
                i = i3;
                if (ipNext.getX() > pt.getX()) {
                    double d2 = ((ip.getX() - pt.getX()) * (ipNext.getY() - pt.getY())) - ((ipNext.getX() - pt.getX()) * (ip.getY() - pt.getY()));
                    if (d2 == AudioStats.AUDIO_AMPLITUDE_NONE) {
                        return -1;
                    }
                    if ((d2 > AudioStats.AUDIO_AMPLITUDE_NONE) == (ipNext.getY() > ip.getY())) {
                        result = 1 - result;
                    }
                } else {
                    continue;
                }
            }
            ip = ipNext;
            i3 = i + 1;
            i2 = 0;
        }
        return result;
    }

    public boolean orientation() {
        return area() >= AudioStats.AUDIO_AMPLITUDE_NONE;
    }

    public void reverse() {
        Collections.reverse(this);
    }

    public Path TranslatePath(Point.LongPoint delta) {
        Path outPath = new Path(size());
        for (int i = 0; i < size(); i++) {
            outPath.add(new Point.LongPoint(get(i).getX() + delta.getX(), get(i).getY() + delta.getY()));
        }
        return outPath;
    }
}
