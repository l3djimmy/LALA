package com.itextpdf.kernel.geom;

import com.itextpdf.kernel.exceptions.PdfException;
import java.util.Arrays;
import java.util.List;
/* loaded from: classes12.dex */
public final class ShapeTransformUtil {
    public static BezierCurve transformBezierCurve(BezierCurve bezierCurve, Matrix ctm) {
        return (BezierCurve) transformSegment(bezierCurve, ctm);
    }

    public static Line transformLine(Line line, Matrix ctm) {
        return (Line) transformSegment(line, ctm);
    }

    public static Path transformPath(Path path, Matrix ctm) {
        Path newPath = new Path();
        for (Subpath subpath : path.getSubpaths()) {
            Subpath transformedSubpath = transformSubpath(subpath, ctm);
            newPath.addSubpath(transformedSubpath);
        }
        return newPath;
    }

    private static Subpath transformSubpath(Subpath subpath, Matrix ctm) {
        Subpath newSubpath = new Subpath();
        newSubpath.setClosed(subpath.isClosed());
        for (IShape segment : subpath.getSegments()) {
            IShape transformedSegment = transformSegment(segment, ctm);
            newSubpath.addSegment(transformedSegment);
        }
        return newSubpath;
    }

    private static IShape transformSegment(IShape segment, Matrix ctm) {
        List<Point> basePoints = segment.getBasePoints();
        Point[] newBasePoints = transformPoints(ctm, (Point[]) basePoints.toArray(new Point[basePoints.size()]));
        if (segment instanceof BezierCurve) {
            IShape newSegment = new BezierCurve(Arrays.asList(newBasePoints));
            return newSegment;
        }
        IShape newSegment2 = new Line(newBasePoints[0], newBasePoints[1]);
        return newSegment2;
    }

    private static Point[] transformPoints(Matrix ctm, Point... points) {
        NoninvertibleTransformException e;
        AffineTransform t;
        Point[] newPoints;
        try {
            AffineTransform t2 = new AffineTransform(ctm.get(0), ctm.get(1), ctm.get(3), ctm.get(4), ctm.get(6), ctm.get(7));
            t = t2.createInverse();
            newPoints = new Point[points.length];
        } catch (NoninvertibleTransformException e2) {
            e = e2;
        }
        try {
            t.transform(points, 0, newPoints, 0, points.length);
            return newPoints;
        } catch (NoninvertibleTransformException e3) {
            e = e3;
            throw new PdfException("A noninvertible matrix has been parsed. The behaviour is unpredictable.", (Throwable) e);
        }
    }
}
