package com.itextpdf.kernel.pdf.canvas.parser.clipper;

import com.itextpdf.kernel.pdf.canvas.parser.clipper.Point;
/* loaded from: classes12.dex */
public interface IClipper {
    public static final int PRESERVE_COLINEAR = 4;
    public static final int REVERSE_SOLUTION = 1;
    public static final int STRICTLY_SIMPLE = 2;

    /* loaded from: classes12.dex */
    public enum ClipType {
        INTERSECTION,
        UNION,
        DIFFERENCE,
        XOR
    }

    /* loaded from: classes12.dex */
    public enum Direction {
        RIGHT_TO_LEFT,
        LEFT_TO_RIGHT
    }

    /* loaded from: classes12.dex */
    public enum EndType {
        CLOSED_POLYGON,
        CLOSED_LINE,
        OPEN_BUTT,
        OPEN_SQUARE,
        OPEN_ROUND
    }

    /* loaded from: classes12.dex */
    public interface IZFillCallback {
        void zFill(Point.LongPoint longPoint, Point.LongPoint longPoint2, Point.LongPoint longPoint3, Point.LongPoint longPoint4, Point.LongPoint longPoint5);
    }

    /* loaded from: classes12.dex */
    public enum JoinType {
        BEVEL,
        ROUND,
        MITER
    }

    /* loaded from: classes12.dex */
    public enum PolyFillType {
        EVEN_ODD,
        NON_ZERO,
        POSITIVE,
        NEGATIVE
    }

    /* loaded from: classes12.dex */
    public enum PolyType {
        SUBJECT,
        CLIP
    }

    boolean addPath(Path path, PolyType polyType, boolean z);

    boolean addPaths(Paths paths, PolyType polyType, boolean z);

    void clear();

    boolean execute(ClipType clipType, Paths paths);

    boolean execute(ClipType clipType, Paths paths, PolyFillType polyFillType, PolyFillType polyFillType2);

    boolean execute(ClipType clipType, PolyTree polyTree);

    boolean execute(ClipType clipType, PolyTree polyTree, PolyFillType polyFillType, PolyFillType polyFillType2);
}
