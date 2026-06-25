package com.itextpdf.layout.renderer;

import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.layout.properties.InlineVerticalAlignment;
import com.itextpdf.layout.properties.InlineVerticalAlignmentType;
import com.itextpdf.layout.properties.LineHeight;
import com.itextpdf.layout.properties.Property;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Collectors;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes12.dex */
public final class InlineVerticalAlignmentHelper {
    private static final float ADJUSTMENT_THRESHOLD = 0.001f;
    private static final float SUB_OFFSET = -0.2f;
    private static final float SUPER_OFFSET = 0.3f;

    private InlineVerticalAlignmentHelper() {
    }

    public static void adjustChildrenYLineHtmlMode(LineRenderer lineRenderer) {
        float actualYLine = (lineRenderer.occupiedArea.getBBox().getY() + lineRenderer.occupiedArea.getBBox().getHeight()) - lineRenderer.maxDescent;
        processRenderers(lineRenderer, lineRenderer.getChildRenderers(), actualYLine, new Predicate() { // from class: com.itextpdf.layout.renderer.InlineVerticalAlignmentHelper$$ExternalSyntheticLambda0
            @Override // java.util.function.Predicate
            public final boolean test(Object obj) {
                return InlineVerticalAlignmentHelper.lambda$adjustChildrenYLineHtmlMode$0((InlineVerticalAlignment) obj);
            }
        }, new Predicate() { // from class: com.itextpdf.layout.renderer.InlineVerticalAlignmentHelper$$ExternalSyntheticLambda1
            @Override // java.util.function.Predicate
            public final boolean test(Object obj) {
                return InlineVerticalAlignmentHelper.lambda$adjustChildrenYLineHtmlMode$1((InlineVerticalAlignment) obj);
            }
        });
        List<IRenderer> sortedRenderers = (List) lineRenderer.getChildRenderers().stream().sorted(new Comparator() { // from class: com.itextpdf.layout.renderer.InlineVerticalAlignmentHelper$$ExternalSyntheticLambda2
            @Override // java.util.Comparator
            public final int compare(Object obj, Object obj2) {
                int round;
                round = Math.round((((IRenderer) obj2).getOccupiedArea().getBBox().getHeight() - ((IRenderer) obj).getOccupiedArea().getBBox().getHeight()) * 1000.0f);
                return round;
            }
        }).collect(Collectors.toList());
        processRenderers(lineRenderer, sortedRenderers, actualYLine, new Predicate() { // from class: com.itextpdf.layout.renderer.InlineVerticalAlignmentHelper$$ExternalSyntheticLambda3
            @Override // java.util.function.Predicate
            public final boolean test(Object obj) {
                boolean isBoxOrientedVerticalAlignment;
                isBoxOrientedVerticalAlignment = InlineVerticalAlignmentHelper.isBoxOrientedVerticalAlignment((InlineVerticalAlignment) obj);
                return isBoxOrientedVerticalAlignment;
            }
        }, new Predicate() { // from class: com.itextpdf.layout.renderer.InlineVerticalAlignmentHelper$$ExternalSyntheticLambda4
            @Override // java.util.function.Predicate
            public final boolean test(Object obj) {
                return InlineVerticalAlignmentHelper.lambda$adjustChildrenYLineHtmlMode$4((InlineVerticalAlignment) obj);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ boolean lambda$adjustChildrenYLineHtmlMode$0(InlineVerticalAlignment alignment) {
        return !isBoxOrientedVerticalAlignment(alignment);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ boolean lambda$adjustChildrenYLineHtmlMode$1(InlineVerticalAlignment alignment) {
        return !isBoxOrientedVerticalAlignment(alignment);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ boolean lambda$adjustChildrenYLineHtmlMode$4(InlineVerticalAlignment alignment) {
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean isBoxOrientedVerticalAlignment(InlineVerticalAlignment alignment) {
        return alignment.getType() == InlineVerticalAlignmentType.TOP || alignment.getType() == InlineVerticalAlignmentType.BOTTOM;
    }

    private static void processRenderers(LineRenderer lineRenderer, List<IRenderer> renderers, float actualYLine, Predicate<InlineVerticalAlignment> needProcess, Predicate<InlineVerticalAlignment> needRecalculateSizes) {
        InlineVerticalAlignment alignment;
        float[] fontInfo;
        boolean maxminValuesChanged;
        float[] fontInfo2 = LineHeightHelper.getActualFontInfo(lineRenderer);
        float textTop = (actualYLine + fontInfo2[0]) - (fontInfo2[3] / 2.0f);
        float textBottom = (actualYLine + fontInfo2[1]) - (fontInfo2[3] / 2.0f);
        float leading = fontInfo2[3];
        float xHeight = fontInfo2[2];
        float maxTop = Float.MIN_VALUE;
        float minBottom = Float.MAX_VALUE;
        float maxHeight = Float.MIN_VALUE;
        boolean cBbox = false;
        Iterator<IRenderer> it = renderers.iterator();
        while (it.hasNext()) {
            IRenderer renderer = it.next();
            if (!FloatingHelper.isRendererFloating(renderer)) {
                InlineVerticalAlignment alignment2 = (InlineVerticalAlignment) renderer.getProperty(Property.INLINE_VERTICAL_ALIGNMENT);
                if (alignment2 != null) {
                    alignment = alignment2;
                } else {
                    alignment = new InlineVerticalAlignment();
                }
                if (!needProcess.test(alignment)) {
                    fontInfo = fontInfo2;
                    maxminValuesChanged = cBbox;
                } else {
                    Rectangle cBbox2 = getAdjustedArea(renderer);
                    fontInfo = fontInfo2;
                    maxminValuesChanged = cBbox;
                    Rectangle pBbox = new Rectangle(lineRenderer.occupiedArea.getBBox().getX(), Math.min(minBottom, lineRenderer.occupiedArea.getBBox().getY()), lineRenderer.occupiedArea.getBBox().getWidth(), Math.max(maxHeight, lineRenderer.occupiedArea.getBBox().getHeight()));
                    renderer = renderer;
                    float offset = calculateOffset(renderer, cBbox2, alignment, actualYLine, textTop, textBottom, leading, xHeight, pBbox);
                    if (Math.abs(offset) > ADJUSTMENT_THRESHOLD) {
                        renderer.move(0.0f, offset);
                    }
                }
                if (!needRecalculateSizes.test(alignment)) {
                    cBbox = maxminValuesChanged;
                } else {
                    Rectangle cBbox3 = getAdjustedArea(renderer);
                    maxTop = Math.max(maxTop, cBbox3.getTop());
                    minBottom = Math.min(minBottom, cBbox3.getBottom());
                    maxHeight = Math.max(maxHeight, cBbox3.getHeight());
                    cBbox = true;
                }
                fontInfo2 = fontInfo;
            }
        }
        boolean maxminValuesChanged2 = cBbox;
        if (maxminValuesChanged2) {
            adjustBBox(lineRenderer, maxHeight, maxTop, minBottom);
        }
    }

    private static Rectangle getAdjustedArea(IRenderer renderer) {
        Rectangle rect = renderer.getOccupiedArea().getBBox().mo7327clone();
        if ((renderer instanceof AbstractRenderer) && !(renderer instanceof BlockRenderer) && !renderer.hasProperty(Property.INLINE_VERTICAL_ALIGNMENT)) {
            AbstractRenderer ar = (AbstractRenderer) renderer;
            ar.applyBorderBox(rect, false);
            ar.applyPaddings(rect, false);
        }
        return rect;
    }

    private static void adjustBBox(LineRenderer lineRenderer, float maxHeight, float maxTop, float minBottom) {
        LineHeight lineHeight = (LineHeight) lineRenderer.getProperty(Property.LINE_HEIGHT);
        float actualHeight = maxHeight;
        if (lineHeight != null) {
            actualHeight = Math.max(actualHeight, LineHeightHelper.calculateLineHeight(lineRenderer));
        }
        float maxTop2 = maxTop + ((actualHeight - maxHeight) / 2.0f);
        float maxHeight2 = Math.max(actualHeight, maxTop2 - (minBottom - ((actualHeight - maxHeight) / 2.0f)));
        float originalTop = lineRenderer.occupiedArea.getBBox().getTop();
        lineRenderer.occupiedArea.getBBox().setHeight(maxHeight2);
        float delta = originalTop - lineRenderer.occupiedArea.getBBox().getTop();
        lineRenderer.occupiedArea.getBBox().moveUp(delta);
        float childDelta = originalTop - maxTop2;
        for (IRenderer renderer : lineRenderer.getChildRenderers()) {
            renderer.move(0.0f, childDelta);
        }
    }

    private static float calculateOffset(IRenderer renderer, Rectangle cBBox, InlineVerticalAlignment alignment, float baseline, float textTop, float textBottom, float leading, float xHeight, Rectangle pBBox) {
        float offsetFraction;
        switch (alignment.getType()) {
            case BASELINE:
                return baseline - getChildBaseline(renderer, leading);
            case TEXT_TOP:
                return textTop - cBBox.getTop();
            case TEXT_BOTTOM:
                float offsetFixed = cBBox.getBottom();
                return textBottom - offsetFixed;
            case FIXED:
                float offsetFixed2 = alignment.getValue();
                return (baseline + offsetFixed2) - getChildBaseline(renderer, leading);
            case SUPER:
            case SUB:
            case FRACTION:
                if (alignment.getType() == InlineVerticalAlignmentType.SUPER) {
                    offsetFraction = SUPER_OFFSET;
                } else if (alignment.getType() == InlineVerticalAlignmentType.SUB) {
                    offsetFraction = SUB_OFFSET;
                } else {
                    offsetFraction = alignment.getValue();
                }
                float target = ((textTop - textBottom) * offsetFraction) + baseline;
                return target - getChildBaseline(renderer, leading);
            case MIDDLE:
                return ((xHeight / 2.0f) + baseline) - (cBBox.getBottom() + (cBBox.getHeight() / 2.0f));
            case BOTTOM:
                return pBBox.getBottom() - cBBox.getBottom();
            case TOP:
                return pBBox.getTop() - cBBox.getTop();
            default:
                return 0.0f;
        }
    }

    private static float getChildBaseline(IRenderer renderer, float leading) {
        if (renderer instanceof ILeafElementRenderer) {
            float descent = ((ILeafElementRenderer) renderer).getDescent();
            return renderer.getOccupiedArea().getBBox().getBottom() - descent;
        }
        Float yLine = (LineRenderer.isInlineBlockChild(renderer) && (renderer instanceof AbstractRenderer)) ? ((AbstractRenderer) renderer).getLastYLineRecursively() : null;
        return yLine == null ? renderer.getOccupiedArea().getBBox().getBottom() : yLine.floatValue() - (leading / 2.0f);
    }
}
