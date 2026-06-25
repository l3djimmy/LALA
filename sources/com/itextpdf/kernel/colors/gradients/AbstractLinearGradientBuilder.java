package com.itextpdf.kernel.colors.gradients;

import androidx.camera.video.AudioStats;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.colors.Color;
import com.itextpdf.kernel.colors.PatternColor;
import com.itextpdf.kernel.colors.gradients.GradientColorStop;
import com.itextpdf.kernel.geom.AffineTransform;
import com.itextpdf.kernel.geom.NoninvertibleTransformException;
import com.itextpdf.kernel.geom.Point;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.colorspace.PdfPattern;
import com.itextpdf.kernel.pdf.colorspace.PdfShading;
import com.itextpdf.kernel.pdf.function.AbstractPdfFunction;
import com.itextpdf.kernel.pdf.function.IPdfFunction;
import com.itextpdf.kernel.pdf.function.PdfType2Function;
import com.itextpdf.kernel.pdf.function.PdfType3Function;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public abstract class AbstractLinearGradientBuilder {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    protected static final double ZERO_EPSILON = 1.0E-10d;
    private final List<GradientColorStop> stops = new ArrayList();
    private GradientSpreadMethod spreadMethod = GradientSpreadMethod.NONE;

    protected abstract Point[] getGradientVector(Rectangle rectangle, AffineTransform affineTransform);

    public AbstractLinearGradientBuilder addColorStop(GradientColorStop gradientColorStop) {
        if (gradientColorStop != null) {
            this.stops.add(gradientColorStop);
        }
        return this;
    }

    public AbstractLinearGradientBuilder setSpreadMethod(GradientSpreadMethod gradientSpreadMethod) {
        if (this.spreadMethod != null) {
            this.spreadMethod = gradientSpreadMethod;
        } else {
            this.spreadMethod = GradientSpreadMethod.NONE;
        }
        return this;
    }

    public List<GradientColorStop> getColorStops() {
        return new ArrayList(this.stops);
    }

    public GradientSpreadMethod getSpreadMethod() {
        return this.spreadMethod;
    }

    public Color buildColor(Rectangle targetBoundingBox, AffineTransform contextTransform, PdfDocument document) {
        Point[] baseCoordinatesVector = getGradientVector(targetBoundingBox, contextTransform);
        if (baseCoordinatesVector == null || this.stops.isEmpty()) {
            return null;
        }
        AffineTransform shadingTransform = new AffineTransform();
        if (contextTransform != null) {
            shadingTransform.concatenate(contextTransform);
        }
        AffineTransform gradientTransformation = getCurrentSpaceToGradientVectorSpaceTransformation(targetBoundingBox, contextTransform);
        if (gradientTransformation != null) {
            if (targetBoundingBox != null) {
                try {
                    targetBoundingBox = Rectangle.calculateBBox(Arrays.asList(gradientTransformation.inverseTransform(new Point(targetBoundingBox.getLeft(), targetBoundingBox.getBottom()), null), gradientTransformation.inverseTransform(new Point(targetBoundingBox.getLeft(), targetBoundingBox.getTop()), null), gradientTransformation.inverseTransform(new Point(targetBoundingBox.getRight(), targetBoundingBox.getBottom()), null), gradientTransformation.inverseTransform(new Point(targetBoundingBox.getRight(), targetBoundingBox.getTop()), null)));
                } catch (NoninvertibleTransformException e) {
                    LoggerFactory.getLogger(getClass()).error(IoLogMessageConstant.UNABLE_TO_INVERT_GRADIENT_TRANSFORMATION);
                }
            }
            shadingTransform.concatenate(gradientTransformation);
        }
        PdfShading.Axial axial = createAxialShading(baseCoordinatesVector, this.stops, this.spreadMethod, targetBoundingBox);
        if (axial == null) {
            return null;
        }
        PdfPattern.Shading shading = new PdfPattern.Shading(axial);
        if (!shadingTransform.isIdentity()) {
            double[] matrix = new double[6];
            shadingTransform.getMatrix(matrix);
            shading.setMatrix(new PdfArray(matrix));
        }
        return new PatternColor(shading);
    }

    protected AffineTransform getCurrentSpaceToGradientVectorSpaceTransformation(Rectangle targetBoundingBox, AffineTransform contextTransform) {
        return null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static double[] evaluateCoveringDomain(Point[] coords, Rectangle toCover) {
        double cos;
        if (toCover == null) {
            return new double[]{AudioStats.AUDIO_AMPLITUDE_NONE, 1.0d};
        }
        AffineTransform transform = new AffineTransform();
        char c = 0;
        double scale = 1.0d / coords[0].distance(coords[1]);
        double sin = (-(coords[1].getY() - coords[0].getY())) * scale;
        double cos2 = (coords[1].getX() - coords[0].getX()) * scale;
        if (Math.abs(cos2) < ZERO_EPSILON) {
            sin = sin <= AudioStats.AUDIO_AMPLITUDE_NONE ? -1.0d : 1.0d;
            cos = 0.0d;
        } else if (Math.abs(sin) >= ZERO_EPSILON) {
            cos = cos2;
        } else {
            sin = AudioStats.AUDIO_AMPLITUDE_NONE;
            cos = cos2 <= AudioStats.AUDIO_AMPLITUDE_NONE ? -1.0d : 1.0d;
        }
        transform.concatenate(new AffineTransform(cos, sin, -sin, cos, AudioStats.AUDIO_AMPLITUDE_NONE, AudioStats.AUDIO_AMPLITUDE_NONE));
        transform.scale(scale, scale);
        transform.translate(-coords[0].getX(), -coords[0].getY());
        Point[] rectanglePoints = toCover.toPointsArray();
        double minX = transform.transform(rectanglePoints[0], null).getX();
        double maxX = minX;
        int i = 1;
        while (i < rectanglePoints.length) {
            char c2 = c;
            double currentX = transform.transform(rectanglePoints[i], null).getX();
            minX = Math.min(minX, currentX);
            maxX = Math.max(maxX, currentX);
            i++;
            c = c2;
            rectanglePoints = rectanglePoints;
        }
        double[] dArr = new double[2];
        dArr[c] = minX;
        dArr[1] = maxX;
        return dArr;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static Point[] createCoordinatesForNewDomain(double[] newDomain, Point[] baseVector) {
        double xDiff = baseVector[1].getX() - baseVector[0].getX();
        double yDiff = baseVector[1].getY() - baseVector[0].getY();
        Point[] targetCoords = {baseVector[0].getLocation(), baseVector[1].getLocation()};
        targetCoords[0].translate(newDomain[0] * xDiff, newDomain[0] * yDiff);
        targetCoords[1].translate((newDomain[1] - 1.0d) * xDiff, (newDomain[1] - 1.0d) * yDiff);
        return targetCoords;
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x0099  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x009e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static com.itextpdf.kernel.pdf.colorspace.PdfShading.Axial createAxialShading(com.itextpdf.kernel.geom.Point[] r19, java.util.List<com.itextpdf.kernel.colors.gradients.GradientColorStop> r20, com.itextpdf.kernel.colors.gradients.GradientSpreadMethod r21, com.itextpdf.kernel.geom.Rectangle r22) {
        /*
            Method dump skipped, instructions count: 286
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.itextpdf.kernel.colors.gradients.AbstractLinearGradientBuilder.createAxialShading(com.itextpdf.kernel.geom.Point[], java.util.List, com.itextpdf.kernel.colors.gradients.GradientSpreadMethod, com.itextpdf.kernel.geom.Rectangle):com.itextpdf.kernel.pdf.colorspace.PdfShading$Axial");
    }

    private static List<GradientColorStop> normalizeStops(List<GradientColorStop> toNormalize, double baseVectorLength) {
        if (baseVectorLength < ZERO_EPSILON) {
            return Arrays.asList(new GradientColorStop(toNormalize.get(toNormalize.size() - 1), (double) AudioStats.AUDIO_AMPLITUDE_NONE, GradientColorStop.OffsetType.RELATIVE));
        }
        List<GradientColorStop> result = copyStopsAndNormalizeAbsoluteOffsets(toNormalize, baseVectorLength);
        normalizeFirstStopOffset(result);
        normalizeAutoStops(result);
        normalizeHintsOffsets(result);
        return result;
    }

    private static void normalizeHintsOffsets(List<GradientColorStop> result) {
        for (int i = 0; i < result.size() - 1; i++) {
            GradientColorStop stopColor = result.get(i);
            if (stopColor.getHintOffsetType() == GradientColorStop.HintOffsetType.RELATIVE_ON_GRADIENT) {
                double currentStopOffset = stopColor.getOffset();
                double nextStopOffset = result.get(i + 1).getOffset();
                if (currentStopOffset != nextStopOffset) {
                    double hintOffset = (stopColor.getHintOffset() - currentStopOffset) / (nextStopOffset - currentStopOffset);
                    stopColor.setHint(hintOffset, GradientColorStop.HintOffsetType.RELATIVE_BETWEEN_COLORS);
                } else {
                    stopColor.setHint(AudioStats.AUDIO_AMPLITUDE_NONE, GradientColorStop.HintOffsetType.NONE);
                }
            }
        }
        int i2 = result.size();
        result.get(i2 - 1).setHint(AudioStats.AUDIO_AMPLITUDE_NONE, GradientColorStop.HintOffsetType.NONE);
    }

    /* JADX WARN: Incorrect condition in loop: B:10:0x002e */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static void normalizeAutoStops(java.util.List<com.itextpdf.kernel.colors.gradients.GradientColorStop> r12) {
        /*
            r0 = 0
            java.lang.Object r1 = r12.get(r0)
            com.itextpdf.kernel.colors.gradients.GradientColorStop r1 = (com.itextpdf.kernel.colors.gradients.GradientColorStop) r1
            com.itextpdf.kernel.colors.gradients.GradientColorStop$OffsetType r1 = r1.getOffsetType()
            com.itextpdf.kernel.colors.gradients.GradientColorStop$OffsetType r2 = com.itextpdf.kernel.colors.gradients.GradientColorStop.OffsetType.RELATIVE
            if (r1 != r2) goto L96
            r1 = 1
            java.lang.Object r0 = r12.get(r0)
            com.itextpdf.kernel.colors.gradients.GradientColorStop r0 = (com.itextpdf.kernel.colors.gradients.GradientColorStop) r0
            com.itextpdf.kernel.colors.gradients.GradientColorStop$HintOffsetType r2 = r0.getHintOffsetType()
            com.itextpdf.kernel.colors.gradients.GradientColorStop$HintOffsetType r3 = com.itextpdf.kernel.colors.gradients.GradientColorStop.HintOffsetType.RELATIVE_ON_GRADIENT
            if (r2 != r3) goto L23
            double r2 = r0.getHintOffset()
            goto L27
        L23:
            double r2 = r0.getOffset()
        L27:
            r4 = 1
            r6 = r1
            r8 = r2
        L2a:
            int r1 = r12.size()
            if (r4 >= r1) goto L80
            java.lang.Object r1 = r12.get(r4)
            com.itextpdf.kernel.colors.gradients.GradientColorStop r1 = (com.itextpdf.kernel.colors.gradients.GradientColorStop) r1
            com.itextpdf.kernel.colors.gradients.GradientColorStop$OffsetType r2 = r1.getOffsetType()
            com.itextpdf.kernel.colors.gradients.GradientColorStop$OffsetType r3 = com.itextpdf.kernel.colors.gradients.GradientColorStop.OffsetType.AUTO
            if (r2 != r3) goto L5a
            com.itextpdf.kernel.colors.gradients.GradientColorStop$HintOffsetType r2 = r1.getHintOffsetType()
            com.itextpdf.kernel.colors.gradients.GradientColorStop$HintOffsetType r3 = com.itextpdf.kernel.colors.gradients.GradientColorStop.HintOffsetType.RELATIVE_ON_GRADIENT
            if (r2 != r3) goto L57
            double r10 = r1.getHintOffset()
            int r7 = r4 + 1
            r5 = r12
            normalizeAutoStops(r5, r6, r7, r8, r10)
            r2 = r10
            int r12 = r4 + 1
            r6 = r12
            r8 = r2
            r7 = r4
            goto L7c
        L57:
            r5 = r12
            r7 = r4
            goto L7c
        L5a:
            r5 = r12
            if (r6 >= r4) goto L66
            double r10 = r1.getOffset()
            r7 = r4
            normalizeAutoStops(r5, r6, r7, r8, r10)
            goto L67
        L66:
            r7 = r4
        L67:
            int r4 = r7 + 1
            com.itextpdf.kernel.colors.gradients.GradientColorStop$HintOffsetType r12 = r1.getHintOffsetType()
            com.itextpdf.kernel.colors.gradients.GradientColorStop$HintOffsetType r2 = com.itextpdf.kernel.colors.gradients.GradientColorStop.HintOffsetType.RELATIVE_ON_GRADIENT
            if (r12 != r2) goto L76
            double r2 = r1.getHintOffset()
            goto L7a
        L76:
            double r2 = r1.getOffset()
        L7a:
            r8 = r2
            r6 = r4
        L7c:
            int r4 = r7 + 1
            r12 = r5
            goto L2a
        L80:
            r5 = r12
            r7 = r4
            int r12 = r5.size()
            if (r6 >= r12) goto L95
            r1 = 4607182418800017408(0x3ff0000000000000, double:1.0)
            double r10 = java.lang.Math.max(r1, r8)
            int r7 = r5.size()
            normalizeAutoStops(r5, r6, r7, r8, r10)
        L95:
            return
        L96:
            r5 = r12
            java.lang.AssertionError r12 = new java.lang.AssertionError
            r12.<init>()
            throw r12
        */
        throw new UnsupportedOperationException("Method not decompiled: com.itextpdf.kernel.colors.gradients.AbstractLinearGradientBuilder.normalizeAutoStops(java.util.List):void");
    }

    private static void normalizeAutoStops(List<GradientColorStop> toNormalizeList, int fromIndex, int toIndex, double prevOffset, double nextOffset) {
        if (toIndex < fromIndex) {
            throw new AssertionError();
        }
        int intervalsCount = (Math.min(toIndex, toNormalizeList.size() - 1) - fromIndex) + 1;
        double offsetShift = (nextOffset - prevOffset) / intervalsCount;
        double currentOffset = prevOffset;
        for (int i = fromIndex; i < toIndex; i++) {
            currentOffset += offsetShift;
            GradientColorStop currentAutoStop = toNormalizeList.get(i);
            if (currentAutoStop.getOffsetType() != GradientColorStop.OffsetType.AUTO) {
                throw new AssertionError();
            }
            currentAutoStop.setOffset(currentOffset, GradientColorStop.OffsetType.RELATIVE);
        }
    }

    private static void normalizeFirstStopOffset(List<GradientColorStop> result) {
        GradientColorStop firstStop = result.get(0);
        if (firstStop.getOffsetType() != GradientColorStop.OffsetType.AUTO) {
            return;
        }
        double firstStopOffset = AudioStats.AUDIO_AMPLITUDE_NONE;
        Iterator<GradientColorStop> it = result.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            GradientColorStop stopColor = it.next();
            if (stopColor.getOffsetType() == GradientColorStop.OffsetType.RELATIVE) {
                firstStopOffset = stopColor.getOffset();
                break;
            } else if (stopColor.getHintOffsetType() == GradientColorStop.HintOffsetType.RELATIVE_ON_GRADIENT) {
                firstStopOffset = stopColor.getHintOffset();
                break;
            }
        }
        firstStop.setOffset(Math.min((double) AudioStats.AUDIO_AMPLITUDE_NONE, firstStopOffset), GradientColorStop.OffsetType.RELATIVE);
    }

    private static List<GradientColorStop> copyStopsAndNormalizeAbsoluteOffsets(List<GradientColorStop> toNormalize, double baseVectorLength) {
        double lastUsedOffset = Double.NEGATIVE_INFINITY;
        List<GradientColorStop> copy = new ArrayList<>(toNormalize.size());
        for (GradientColorStop stop : toNormalize) {
            double offset = stop.getOffset();
            GradientColorStop.OffsetType offsetType = stop.getOffsetType();
            if (offsetType == GradientColorStop.OffsetType.ABSOLUTE) {
                offsetType = GradientColorStop.OffsetType.RELATIVE;
                offset /= baseVectorLength;
            }
            if (offsetType == GradientColorStop.OffsetType.RELATIVE) {
                if (offset < lastUsedOffset) {
                    offset = lastUsedOffset;
                }
                lastUsedOffset = offset;
            }
            GradientColorStop result = new GradientColorStop(stop, offset, offsetType);
            double hintOffset = stop.getHintOffset();
            GradientColorStop.HintOffsetType hintOffsetType = stop.getHintOffsetType();
            if (hintOffsetType == GradientColorStop.HintOffsetType.ABSOLUTE_ON_GRADIENT) {
                hintOffsetType = GradientColorStop.HintOffsetType.RELATIVE_ON_GRADIENT;
                hintOffset /= baseVectorLength;
            }
            if (hintOffsetType == GradientColorStop.HintOffsetType.RELATIVE_ON_GRADIENT) {
                if (hintOffset < lastUsedOffset) {
                    hintOffset = lastUsedOffset;
                }
                lastUsedOffset = hintOffset;
            }
            result.setHint(hintOffset, hintOffsetType);
            copy.add(result);
        }
        return copy;
    }

    private static void adjustStopsForPadIfNeeded(List<GradientColorStop> stopsToConstruct, double[] coordinatesDomain) {
        GradientColorStop firstStop = stopsToConstruct.get(0);
        if (coordinatesDomain[0] < firstStop.getOffset()) {
            stopsToConstruct.add(0, new GradientColorStop(firstStop, coordinatesDomain[0], GradientColorStop.OffsetType.RELATIVE));
        }
        GradientColorStop lastStop = stopsToConstruct.get(stopsToConstruct.size() - 1);
        if (coordinatesDomain[1] > lastStop.getOffset()) {
            stopsToConstruct.add(new GradientColorStop(lastStop, coordinatesDomain[1], GradientColorStop.OffsetType.RELATIVE));
        }
    }

    private static List<GradientColorStop> adjustNormalizedStopsToCoverDomain(List<GradientColorStop> normalizedStops, double[] targetDomain, GradientSpreadMethod spreadMethod) {
        boolean isIterationInverse;
        double offset;
        List<GradientColorStop> adjustedStops;
        List<GradientColorStop> list = normalizedStops;
        GradientSpreadMethod gradientSpreadMethod = spreadMethod;
        List<GradientColorStop> adjustedStops2 = new ArrayList<>();
        GradientColorStop lastColorStop = list.get(list.size() - 1);
        double originalIntervalEnd = lastColorStop.getOffset();
        int i = 0;
        double originalIntervalStart = list.get(0).getOffset();
        double originalIntervalLength = originalIntervalEnd - originalIntervalStart;
        char c = 2;
        if (originalIntervalLength <= ZERO_EPSILON) {
            return Arrays.asList(new GradientColorStop(lastColorStop, targetDomain[0], GradientColorStop.OffsetType.RELATIVE), new GradientColorStop(lastColorStop, targetDomain[1], GradientColorStop.OffsetType.RELATIVE));
        }
        double startIntervalsShift = Math.floor((targetDomain[0] - originalIntervalStart) / originalIntervalLength);
        double iterationOffset = originalIntervalStart + (originalIntervalLength * startIntervalsShift);
        if (gradientSpreadMethod != GradientSpreadMethod.REFLECT || Math.abs(startIntervalsShift) % 2.0d == AudioStats.AUDIO_AMPLITUDE_NONE) {
            isIterationInverse = false;
        } else {
            isIterationInverse = true;
        }
        int currentIterationIndex = isIterationInverse ? list.size() - 1 : 0;
        double lastComputedOffset = iterationOffset;
        while (lastComputedOffset <= targetDomain[1]) {
            char c2 = c;
            GradientColorStop currentStop = list.get(currentIterationIndex);
            if (isIterationInverse) {
                offset = (iterationOffset + originalIntervalEnd) - currentStop.getOffset();
            } else {
                offset = (iterationOffset + currentStop.getOffset()) - originalIntervalStart;
            }
            double lastComputedOffset2 = offset;
            int i2 = i;
            GradientColorStop lastColorStop2 = lastColorStop;
            double originalIntervalEnd2 = originalIntervalEnd;
            boolean isIterationInverse2 = isIterationInverse;
            GradientColorStop computedStop = new GradientColorStop(currentStop, lastComputedOffset2, GradientColorStop.OffsetType.RELATIVE);
            if (lastComputedOffset2 < targetDomain[i2] && !adjustedStops2.isEmpty()) {
                adjustedStops2.set(i2, computedStop);
            } else {
                adjustedStops2.add(computedStop);
            }
            if (isIterationInverse2) {
                currentIterationIndex--;
                if (currentIterationIndex < 0) {
                    iterationOffset += originalIntervalLength;
                    isIterationInverse2 = false;
                    currentIterationIndex = 1;
                }
            } else {
                currentIterationIndex++;
                if (currentIterationIndex == list.size()) {
                    iterationOffset += originalIntervalLength;
                    boolean isIterationInverse3 = gradientSpreadMethod == GradientSpreadMethod.REFLECT;
                    currentIterationIndex = isIterationInverse3 ? list.size() - 2 : 0;
                    isIterationInverse2 = isIterationInverse3;
                }
            }
            if (isIterationInverse2) {
                GradientColorStop nextColor = list.get(currentIterationIndex);
                adjustedStops = adjustedStops2;
                computedStop.setHint(1.0d - nextColor.getHintOffset(), nextColor.getHintOffsetType());
            } else {
                adjustedStops = adjustedStops2;
                computedStop.setHint(currentStop.getHintOffset(), currentStop.getHintOffsetType());
            }
            list = normalizedStops;
            gradientSpreadMethod = spreadMethod;
            lastComputedOffset = lastComputedOffset2;
            isIterationInverse = isIterationInverse2;
            c = c2;
            lastColorStop = lastColorStop2;
            originalIntervalEnd = originalIntervalEnd2;
            adjustedStops2 = adjustedStops;
            i = 0;
        }
        return adjustedStops2;
    }

    private static IPdfFunction constructFunction(List<GradientColorStop> toConstruct) {
        int functionsAmount = toConstruct.size() - 1;
        double[] bounds = new double[functionsAmount - 1];
        List<AbstractPdfFunction<? extends PdfDictionary>> type2Functions = new ArrayList<>(functionsAmount);
        GradientColorStop nextStop = toConstruct.get(0);
        double domainStart = nextStop.getOffset();
        for (int i = 1; i < functionsAmount; i++) {
            GradientColorStop currentStop = nextStop;
            nextStop = toConstruct.get(i);
            bounds[i - 1] = nextStop.getOffset();
            type2Functions.add(constructSingleGradientSegmentFunction(currentStop, nextStop));
        }
        GradientColorStop currentStop2 = nextStop;
        GradientColorStop nextStop2 = toConstruct.get(toConstruct.size() - 1);
        type2Functions.add(constructSingleGradientSegmentFunction(currentStop2, nextStop2));
        double domainEnd = nextStop2.getOffset();
        double[] encode = new double[functionsAmount * 2];
        for (int i2 = 0; i2 < encode.length; i2 += 2) {
            encode[i2] = 0.0d;
            encode[i2 + 1] = 1.0d;
        }
        return new PdfType3Function(new double[]{domainStart, domainEnd}, (double[]) null, type2Functions, bounds, encode);
    }

    private static AbstractPdfFunction<? extends PdfDictionary> constructSingleGradientSegmentFunction(GradientColorStop from, GradientColorStop to) {
        double exponent;
        float[] fromColor;
        float[] toColor;
        float[] fromColor2 = from.getRgbArray();
        float[] toColor2 = to.getRgbArray();
        if (from.getHintOffsetType() != GradientColorStop.HintOffsetType.RELATIVE_BETWEEN_COLORS) {
            exponent = 1.0d;
            fromColor = fromColor2;
            toColor = toColor2;
        } else {
            double hintOffset = from.getHintOffset();
            if (hintOffset <= ZERO_EPSILON) {
                exponent = 1.0d;
                fromColor = toColor2;
                toColor = toColor2;
            } else if (hintOffset >= 0.9999999999d) {
                exponent = 1.0d;
                fromColor = fromColor2;
                toColor = fromColor2;
            } else {
                double exponent2 = Math.log(0.5d) / Math.log(hintOffset);
                exponent = exponent2;
                fromColor = fromColor2;
                toColor = toColor2;
            }
        }
        return new PdfType2Function(new float[]{0.0f, 1.0f}, (float[]) null, fromColor, toColor, exponent);
    }

    private static PdfArray createCoordsPdfArray(Point[] coordsPoints) {
        if (coordsPoints == null || coordsPoints.length != 2) {
            throw new AssertionError();
        }
        return new PdfArray(new double[]{coordsPoints[0].getX(), coordsPoints[0].getY(), coordsPoints[1].getX(), coordsPoints[1].getY()});
    }
}
