package com.itextpdf.kernel.pdf.canvas.parser.clipper;

import androidx.camera.video.AudioStats;
import java.lang.Comparable;
import java.lang.Number;
import java.math.BigInteger;
import java.util.Comparator;
/* loaded from: classes12.dex */
public abstract class Point<T extends Number & Comparable<T>> {
    private static final NumberComparator NUMBER_COMPARATOR = new NumberComparator();
    protected T x;
    protected T y;
    protected T z;

    protected Point(Point<T> pt) {
        this(pt.x, pt.y, pt.z);
    }

    protected Point(T x, T y, T z) {
        this.x = x;
        this.y = y;
        this.z = z;
    }

    public boolean equals(Object obj) {
        if (obj == null || !(obj instanceof Point)) {
            return false;
        }
        Point<?> a = (Point) obj;
        return NUMBER_COMPARATOR.compare((Number) this.x, (Number) a.x) == 0 && NUMBER_COMPARATOR.compare((Number) this.y, (Number) a.y) == 0;
    }

    public void set(Point<T> other) {
        this.x = other.x;
        this.y = other.y;
        this.z = other.z;
    }

    public void setX(T x) {
        this.x = x;
    }

    public void setY(T y) {
        this.y = y;
    }

    public void setZ(T z) {
        this.z = z;
    }

    public String toString() {
        return "Point [x=" + this.x + ", y=" + this.y + ", z=" + this.z + "]";
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static boolean isPt2BetweenPt1AndPt3(LongPoint pt1, LongPoint pt2, LongPoint pt3) {
        if (pt1.equals(pt3) || pt1.equals(pt2) || pt3.equals(pt2)) {
            return false;
        }
        if (pt1.getX() != pt3.getX()) {
            return ((((Long) pt2.x).longValue() > ((Long) pt1.x).longValue() ? 1 : (((Long) pt2.x).longValue() == ((Long) pt1.x).longValue() ? 0 : -1)) > 0) == ((((Long) pt2.x).longValue() > ((Long) pt3.x).longValue() ? 1 : (((Long) pt2.x).longValue() == ((Long) pt3.x).longValue() ? 0 : -1)) < 0);
        }
        return ((((Long) pt2.y).longValue() > ((Long) pt1.y).longValue() ? 1 : (((Long) pt2.y).longValue() == ((Long) pt1.y).longValue() ? 0 : -1)) > 0) == ((((Long) pt2.y).longValue() > ((Long) pt3.y).longValue() ? 1 : (((Long) pt2.y).longValue() == ((Long) pt3.y).longValue() ? 0 : -1)) < 0);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static boolean slopesEqual(LongPoint pt1, LongPoint pt2, LongPoint pt3, boolean useFullRange) {
        return slopesEqual(pt1, pt2, pt2, pt3, useFullRange);
    }

    protected static boolean slopesEqual(LongPoint pt1, LongPoint pt2, LongPoint pt3, LongPoint pt4, boolean useFullRange) {
        if (useFullRange) {
            return BigInteger.valueOf(pt1.getY() - pt2.getY()).multiply(BigInteger.valueOf(pt3.getX() - pt4.getX())).equals(BigInteger.valueOf(pt1.getX() - pt2.getX()).multiply(BigInteger.valueOf(pt3.getY() - pt4.getY())));
        }
        return ((pt1.getY() - pt2.getY()) * (pt3.getX() - pt4.getX())) - ((pt1.getX() - pt2.getX()) * (pt3.getY() - pt4.getY())) == 0;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean arePointsClose(Point<? extends Number> pt1, Point<? extends Number> pt2, double distSqrd) {
        double dx = pt1.x.doubleValue() - pt2.x.doubleValue();
        double dy = pt1.y.doubleValue() - pt2.y.doubleValue();
        return (dx * dx) + (dy * dy) <= distSqrd;
    }

    static double distanceFromLineSqrd(Point<? extends Number> pt, Point<? extends Number> ln1, Point<? extends Number> ln2) {
        double A = ln1.y.doubleValue() - ln2.y.doubleValue();
        double B = ln2.x.doubleValue() - ln1.x.doubleValue();
        double C = ((pt.x.doubleValue() * A) + (pt.y.doubleValue() * B)) - ((ln1.x.doubleValue() * A) + (ln1.y.doubleValue() * B));
        return (C * C) / ((A * A) + (B * B));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static DoublePoint getUnitNormal(LongPoint pt1, LongPoint pt2) {
        double dx = ((Long) pt2.x).longValue() - ((Long) pt1.x).longValue();
        double dy = ((Long) pt2.y).longValue() - ((Long) pt1.y).longValue();
        if (dx == AudioStats.AUDIO_AMPLITUDE_NONE && dy == AudioStats.AUDIO_AMPLITUDE_NONE) {
            return new DoublePoint();
        }
        double f = 1.0d / Math.sqrt((dx * dx) + (dy * dy));
        return new DoublePoint(dy * f, -(dx * f));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean slopesNearCollinear(LongPoint pt1, LongPoint pt2, LongPoint pt3, double distSqrd) {
        if (Math.abs(((Long) pt1.x).longValue() - ((Long) pt2.x).longValue()) > Math.abs(((Long) pt1.y).longValue() - ((Long) pt2.y).longValue())) {
            if ((((Long) pt1.x).longValue() > ((Long) pt2.x).longValue()) == (((Long) pt1.x).longValue() < ((Long) pt3.x).longValue())) {
                return distanceFromLineSqrd(pt1, pt2, pt3) < distSqrd;
            }
            return ((((Long) pt2.x).longValue() > ((Long) pt1.x).longValue() ? 1 : (((Long) pt2.x).longValue() == ((Long) pt1.x).longValue() ? 0 : -1)) > 0) == ((((Long) pt2.x).longValue() > ((Long) pt3.x).longValue() ? 1 : (((Long) pt2.x).longValue() == ((Long) pt3.x).longValue() ? 0 : -1)) < 0) ? distanceFromLineSqrd(pt2, pt1, pt3) < distSqrd : distanceFromLineSqrd(pt3, pt1, pt2) < distSqrd;
        }
        if ((((Long) pt1.y).longValue() > ((Long) pt2.y).longValue()) == (((Long) pt1.y).longValue() < ((Long) pt3.y).longValue())) {
            return distanceFromLineSqrd(pt1, pt2, pt3) < distSqrd;
        }
        return ((((Long) pt2.y).longValue() > ((Long) pt1.y).longValue() ? 1 : (((Long) pt2.y).longValue() == ((Long) pt1.y).longValue() ? 0 : -1)) > 0) == ((((Long) pt2.y).longValue() > ((Long) pt3.y).longValue() ? 1 : (((Long) pt2.y).longValue() == ((Long) pt3.y).longValue() ? 0 : -1)) < 0) ? distanceFromLineSqrd(pt2, pt1, pt3) < distSqrd : distanceFromLineSqrd(pt3, pt1, pt2) < distSqrd;
    }

    /* loaded from: classes12.dex */
    public static class DoublePoint extends Point<Double> {
        public DoublePoint() {
            this(AudioStats.AUDIO_AMPLITUDE_NONE, AudioStats.AUDIO_AMPLITUDE_NONE);
        }

        public DoublePoint(double x, double y) {
            this(x, y, AudioStats.AUDIO_AMPLITUDE_NONE);
        }

        public DoublePoint(double x, double y, double z) {
            super(Double.valueOf(x), Double.valueOf(y), Double.valueOf(z));
        }

        public DoublePoint(DoublePoint other) {
            super(other);
        }

        public double getX() {
            return ((Double) this.x).doubleValue();
        }

        public double getY() {
            return ((Double) this.y).doubleValue();
        }

        public double getZ() {
            return ((Double) this.z).doubleValue();
        }
    }

    /* loaded from: classes12.dex */
    public static class LongPoint extends Point<Long> {
        public LongPoint() {
            this(0L, 0L);
        }

        public LongPoint(long x, long y) {
            this(x, y, 0L);
        }

        public LongPoint(double x, double y) {
            this((long) x, (long) y);
        }

        public LongPoint(long x, long y, long z) {
            super(Long.valueOf(x), Long.valueOf(y), Long.valueOf(z));
        }

        public LongPoint(LongPoint other) {
            super(other);
        }

        public static double getDeltaX(LongPoint pt1, LongPoint pt2) {
            if (pt1.getY() == pt2.getY()) {
                return -3.4E38d;
            }
            return (pt2.getX() - pt1.getX()) / (pt2.getY() - pt1.getY());
        }

        public long getX() {
            return ((Long) this.x).longValue();
        }

        public long getY() {
            return ((Long) this.y).longValue();
        }

        public long getZ() {
            return ((Long) this.z).longValue();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class NumberComparator<T extends Number & Comparable<T>> implements Comparator<T> {
        private NumberComparator() {
        }

        @Override // java.util.Comparator
        public int compare(T a, T b) throws ClassCastException {
            return ((Comparable) a).compareTo(b);
        }
    }
}
