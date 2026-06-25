package com.itextpdf.layout.renderer;

import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.layout.exceptions.LayoutExceptionMessageConstant;
import com.itextpdf.layout.layout.LayoutArea;
import com.itextpdf.layout.layout.LayoutContext;
import com.itextpdf.layout.layout.LayoutResult;
import com.itextpdf.layout.minmaxwidth.MinMaxWidth;
import com.itextpdf.layout.properties.AlignmentPropertyValue;
import com.itextpdf.layout.properties.FlexDirectionPropertyValue;
import com.itextpdf.layout.properties.FlexWrapPropertyValue;
import com.itextpdf.layout.properties.InlineVerticalAlignmentType;
import com.itextpdf.layout.properties.JustifyContent;
import com.itextpdf.layout.properties.Property;
import com.itextpdf.layout.properties.UnitValue;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes12.dex */
public final class FlexUtil {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private static final float EPSILON = 1.0E-4f;
    private static final float FLEX_GROW_INITIAL_VALUE = 0.0f;
    private static final float FLEX_SHRINK_INITIAL_VALUE = 1.0f;
    private static final Logger logger = LoggerFactory.getLogger(FlexUtil.class);

    private FlexUtil() {
    }

    public static List<List<FlexItemInfo>> calculateChildrenRectangles(Rectangle flexContainerBBox, FlexContainerRenderer flexContainerRenderer) {
        Rectangle layoutBox = flexContainerBBox.mo7327clone();
        boolean isSingleLine = false;
        flexContainerRenderer.applyMarginsBordersPaddings(layoutBox, false);
        float mainSize = getMainSize(flexContainerRenderer, layoutBox);
        Float[] crossSizes = getCrossSizes(flexContainerRenderer, layoutBox);
        Float crossSize = crossSizes[0];
        Float minCrossSize = crossSizes[1];
        Float maxCrossSize = crossSizes[2];
        float layoutBoxCrossSize = isColumnDirection(flexContainerRenderer) ? layoutBox.getWidth() : layoutBox.getHeight();
        float layoutBoxCrossSize2 = crossSize == null ? layoutBoxCrossSize : Math.min(crossSize.floatValue(), layoutBoxCrossSize);
        List<FlexItemCalculationInfo> flexItemCalculationInfos = createFlexItemCalculationInfos(flexContainerRenderer, mainSize, layoutBoxCrossSize2);
        determineFlexBasisAndHypotheticalMainSizeForFlexItems(flexItemCalculationInfos, layoutBoxCrossSize2, isColumnDirection(flexContainerRenderer));
        isSingleLine = (!flexContainerRenderer.hasProperty(128) || FlexWrapPropertyValue.NOWRAP == flexContainerRenderer.getProperty(128)) ? true : true;
        List<List<FlexItemCalculationInfo>> lines = collectFlexItemsIntoFlexLines(flexItemCalculationInfos, isColumnDirection(flexContainerRenderer) ? Math.min(mainSize, layoutBox.getHeight()) : mainSize, isSingleLine);
        float maxHypotheticalMainSize = 0.0f;
        for (List<FlexItemCalculationInfo> line : lines) {
            float hypotheticalMainSizesSum = 0.0f;
            for (FlexItemCalculationInfo info : line) {
                boolean isSingleLine2 = isSingleLine;
                hypotheticalMainSizesSum += info.getOuterMainSize(info.hypotheticalMainSize);
                crossSizes = crossSizes;
                isSingleLine = isSingleLine2;
            }
            maxHypotheticalMainSize = Math.max(maxHypotheticalMainSize, hypotheticalMainSizesSum);
        }
        float containerMainSize = getMainSize(flexContainerRenderer, new Rectangle(isColumnDirection(flexContainerRenderer) ? 0.0f : maxHypotheticalMainSize, isColumnDirection(flexContainerRenderer) ? maxHypotheticalMainSize : 0.0f));
        if (isColumnDirection(flexContainerRenderer)) {
            resolveFlexibleLengths(lines, layoutBox.getHeight(), containerMainSize);
        } else {
            resolveFlexibleLengths(lines, mainSize);
        }
        determineHypotheticalCrossSizeForFlexItems(lines, isColumnDirection(flexContainerRenderer), layoutBoxCrossSize2);
        List<Float> lineCrossSizes = calculateCrossSizeOfEachFlexLine(lines, minCrossSize, crossSize, maxCrossSize);
        Float currentCrossSize = isColumnDirection(flexContainerRenderer) ? new Float(layoutBoxCrossSize2) : crossSize;
        handleAlignContentStretch(flexContainerRenderer, lines, currentCrossSize, lineCrossSizes, layoutBox);
        determineUsedCrossSizeOfEachFlexItem(lines, lineCrossSizes, flexContainerRenderer);
        applyJustifyContent(lines, flexContainerRenderer, isColumnDirection(flexContainerRenderer) ? layoutBox.getHeight() : mainSize, containerMainSize);
        applyAlignItemsAndAlignSelf(lines, flexContainerRenderer, lineCrossSizes);
        List<List<FlexItemInfo>> layoutTable = new ArrayList<>();
        for (List<FlexItemCalculationInfo> line2 : lines) {
            List<FlexItemInfo> layoutLine = new ArrayList<>();
            for (FlexItemCalculationInfo info2 : line2) {
                layoutLine.add(new FlexItemInfo(info2.renderer, info2.toRectangle()));
                layoutBox = layoutBox;
                containerMainSize = containerMainSize;
            }
            layoutTable.add(layoutLine);
        }
        return layoutTable;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean isColumnDirection(FlexContainerRenderer renderer) {
        FlexDirectionPropertyValue flexDir = (FlexDirectionPropertyValue) renderer.getProperty(Property.FLEX_DIRECTION, FlexDirectionPropertyValue.ROW);
        return FlexDirectionPropertyValue.COLUMN == flexDir || FlexDirectionPropertyValue.COLUMN_REVERSE == flexDir;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static float getMainSize(FlexContainerRenderer renderer, Rectangle layoutBox) {
        float layoutBoxMainSize;
        Float mainSize;
        Float maxDimension;
        Float minDimension;
        boolean isColumnDirection = isColumnDirection(renderer);
        if (isColumnDirection) {
            layoutBoxMainSize = layoutBox.getHeight();
            mainSize = renderer.retrieveHeight();
            maxDimension = resolveUnitValue(renderer, 84, layoutBoxMainSize);
            minDimension = resolveUnitValue(renderer, 85, layoutBoxMainSize);
        } else {
            layoutBoxMainSize = layoutBox.getWidth();
            mainSize = renderer.retrieveWidth(layoutBoxMainSize);
            maxDimension = resolveUnitValue(renderer, 79, layoutBoxMainSize);
            minDimension = resolveUnitValue(renderer, 80, layoutBoxMainSize);
        }
        if (mainSize == null) {
            mainSize = Float.valueOf(layoutBoxMainSize);
        }
        if (minDimension != null && minDimension.floatValue() > mainSize.floatValue()) {
            mainSize = minDimension;
        }
        if (maxDimension != null && ((minDimension == null || maxDimension.floatValue() > minDimension.floatValue()) && maxDimension.floatValue() < mainSize.floatValue())) {
            mainSize = maxDimension;
        }
        return mainSize.floatValue();
    }

    private static Float resolveUnitValue(FlexContainerRenderer renderer, int property, float baseValue) {
        UnitValue value = renderer.getPropertyAsUnitValue(property);
        if (value == null) {
            return null;
        }
        if (value.isPercentValue()) {
            return Float.valueOf((value.getValue() / 100.0f) * baseValue);
        }
        return Float.valueOf(value.getValue());
    }

    private static Float[] getCrossSizes(FlexContainerRenderer renderer, Rectangle layoutBox) {
        boolean isColumnDirection = isColumnDirection(renderer);
        Float[] fArr = new Float[3];
        fArr[0] = isColumnDirection ? renderer.retrieveWidth(layoutBox.getWidth()) : renderer.retrieveHeight();
        fArr[1] = isColumnDirection ? renderer.retrieveMinWidth(layoutBox.getWidth()) : renderer.retrieveMinHeight();
        fArr[2] = isColumnDirection ? renderer.retrieveMaxWidth(layoutBox.getWidth()) : renderer.retrieveMaxHeight();
        return fArr;
    }

    static void determineFlexBasisAndHypotheticalMainSizeForFlexItems(List<FlexItemCalculationInfo> flexItemCalculationInfos, float crossSize, boolean isColumnDirection) {
        for (FlexItemCalculationInfo info : flexItemCalculationInfos) {
            AbstractRenderer renderer = info.renderer;
            Float definiteCrossSize = null;
            if (renderer.hasAspectRatio()) {
                definiteCrossSize = isColumnDirection ? renderer.retrieveWidth(crossSize) : renderer.retrieveHeight();
            }
            if (info.flexBasisContent && definiteCrossSize != null) {
                float aspectRatio = renderer.getAspectRatio().floatValue();
                info.flexBaseSize = isColumnDirection ? definiteCrossSize.floatValue() / aspectRatio : definiteCrossSize.floatValue() * aspectRatio;
            } else {
                info.flexBaseSize = info.flexBasis;
            }
            info.hypotheticalMainSize = Math.max(0.0f, Math.min(Math.max(info.minContent, info.flexBaseSize), info.maxContent));
            info.mainSize = info.hypotheticalMainSize;
        }
    }

    static List<List<FlexItemCalculationInfo>> collectFlexItemsIntoFlexLines(List<FlexItemCalculationInfo> flexItemCalculationInfos, float mainSize, boolean isSingleLine) {
        List<List<FlexItemCalculationInfo>> lines = new ArrayList<>();
        List<FlexItemCalculationInfo> currentLineInfos = new ArrayList<>();
        if (isSingleLine) {
            currentLineInfos.addAll(flexItemCalculationInfos);
        } else {
            float occupiedLineSpace = 0.0f;
            for (FlexItemCalculationInfo info : flexItemCalculationInfos) {
                occupiedLineSpace += info.getOuterMainSize(info.hypotheticalMainSize);
                if (occupiedLineSpace > 1.0E-4f + mainSize) {
                    if (currentLineInfos.isEmpty()) {
                        currentLineInfos.add(info);
                        lines.add(currentLineInfos);
                        currentLineInfos = new ArrayList<>();
                        occupiedLineSpace = 0.0f;
                    } else {
                        lines.add(currentLineInfos);
                        currentLineInfos = new ArrayList<>();
                        currentLineInfos.add(info);
                        occupiedLineSpace = info.getOuterMainSize(info.hypotheticalMainSize);
                    }
                } else {
                    currentLineInfos.add(info);
                }
            }
        }
        if (!currentLineInfos.isEmpty()) {
            lines.add(currentLineInfos);
        }
        return lines;
    }

    static void resolveFlexibleLengths(List<List<FlexItemCalculationInfo>> lines, float mainSize) {
        for (List<FlexItemCalculationInfo> line : lines) {
            float hypotheticalMainSizesSum = 0.0f;
            for (FlexItemCalculationInfo info : line) {
                hypotheticalMainSizesSum += info.getOuterMainSize(info.hypotheticalMainSize);
            }
            boolean isFlexGrow = hypotheticalMainSizesSum < mainSize;
            for (FlexItemCalculationInfo info2 : line) {
                if (isFlexGrow) {
                    if (isZero(info2.flexGrow) || info2.flexBaseSize > info2.hypotheticalMainSize) {
                        info2.mainSize = info2.hypotheticalMainSize;
                        info2.isFrozen = true;
                    }
                } else if (isZero(info2.flexShrink) || info2.flexBaseSize < info2.hypotheticalMainSize) {
                    info2.mainSize = info2.hypotheticalMainSize;
                    info2.isFrozen = true;
                }
            }
            float initialFreeSpace = calculateFreeSpace(line, mainSize);
            while (hasFlexibleItems(line)) {
                float remainingFreeSpace = calculateFreeSpace(line, mainSize);
                float flexFactorSum = 0.0f;
                for (FlexItemCalculationInfo info3 : line) {
                    if (!info3.isFrozen) {
                        flexFactorSum += isFlexGrow ? info3.flexGrow : info3.flexShrink;
                    }
                }
                if (flexFactorSum < 1.0f && Math.abs(remainingFreeSpace) > Math.abs(initialFreeSpace * flexFactorSum)) {
                    remainingFreeSpace = initialFreeSpace * flexFactorSum;
                }
                if (!isZero(remainingFreeSpace)) {
                    float scaledFlexShrinkFactorsSum = 0.0f;
                    for (FlexItemCalculationInfo info4 : line) {
                        if (!info4.isFrozen) {
                            if (isFlexGrow) {
                                float ratio = info4.flexGrow / flexFactorSum;
                                info4.mainSize = info4.flexBaseSize + (remainingFreeSpace * ratio);
                            } else {
                                info4.scaledFlexShrinkFactor = info4.flexShrink * info4.flexBaseSize;
                                scaledFlexShrinkFactorsSum += info4.scaledFlexShrinkFactor;
                            }
                        }
                    }
                    if (!isZero(scaledFlexShrinkFactorsSum)) {
                        for (FlexItemCalculationInfo info5 : line) {
                            if (!info5.isFrozen && !isFlexGrow) {
                                float ratio2 = info5.scaledFlexShrinkFactor / scaledFlexShrinkFactorsSum;
                                info5.mainSize = info5.flexBaseSize - (Math.abs(remainingFreeSpace) * ratio2);
                            }
                        }
                    }
                } else {
                    for (FlexItemCalculationInfo info6 : line) {
                        if (!info6.isFrozen) {
                            info6.mainSize = info6.flexBaseSize;
                        }
                    }
                }
                float sum = 0.0f;
                for (FlexItemCalculationInfo info7 : line) {
                    if (!info7.isFrozen) {
                        float clampedSize = Math.min(Math.max(info7.mainSize, info7.minContent), info7.maxContent);
                        if (info7.mainSize > clampedSize) {
                            info7.isMaxViolated = true;
                        } else if (info7.mainSize < clampedSize) {
                            info7.isMinViolated = true;
                        }
                        sum += clampedSize - info7.mainSize;
                        info7.mainSize = clampedSize;
                    }
                }
                for (FlexItemCalculationInfo info8 : line) {
                    if (!info8.isFrozen && (isZero(sum) || ((0.0f < sum && info8.isMinViolated) || (0.0f > sum && info8.isMaxViolated)))) {
                        info8.isFrozen = true;
                    }
                }
            }
        }
    }

    private static void resolveFlexibleLengths(List<List<FlexItemCalculationInfo>> lines, float layoutBoxSize, float containerSize) {
        resolveFlexibleLengths(lines, containerSize);
        if (lines.size() == 1 && layoutBoxSize < containerSize - 1.0E-4f) {
            List<FlexItemCalculationInfo> arrayList = new ArrayList<>();
            float mainSize = 0.0f;
            for (FlexItemCalculationInfo itemInfo : lines.get(0)) {
                mainSize += itemInfo.getOuterMainSize(itemInfo.mainSize);
                if (mainSize >= layoutBoxSize - 1.0E-4f) {
                    break;
                }
                itemInfo.isFrozen = false;
                arrayList.add(itemInfo);
            }
            if (arrayList.size() > 0) {
                List<List<FlexItemCalculationInfo>> updatedLines = new ArrayList<>();
                updatedLines.add(arrayList);
                resolveFlexibleLengths(updatedLines, layoutBoxSize);
            }
        }
    }

    static void determineHypotheticalCrossSizeForFlexItems(List<List<FlexItemCalculationInfo>> lines, boolean isColumnDirection, float crossSize) {
        for (List<FlexItemCalculationInfo> line : lines) {
            for (FlexItemCalculationInfo info : line) {
                determineHypotheticalCrossSizeForFlexItem(info, isColumnDirection, crossSize);
            }
        }
    }

    private static void determineHypotheticalCrossSizeForFlexItem(FlexItemCalculationInfo info, boolean isColumnDirection, float crossSize) {
        if ((info.renderer instanceof FlexContainerRenderer) && ((FlexContainerRenderer) info.renderer).getHypotheticalCrossSize(Float.valueOf(info.mainSize)) != null) {
            info.hypotheticalCrossSize = ((FlexContainerRenderer) info.renderer).getHypotheticalCrossSize(Float.valueOf(info.mainSize)).floatValue();
        } else if (isColumnDirection) {
            MinMaxWidth minMaxWidth = info.renderer.getMinMaxWidth();
            info.hypotheticalCrossSize = info.getInnerCrossSize(Math.max(Math.min(minMaxWidth.getMaxWidth(), crossSize), minMaxWidth.getMinWidth()));
            if (info.renderer instanceof FlexContainerRenderer) {
                ((FlexContainerRenderer) info.renderer).setHypotheticalCrossSize(Float.valueOf(info.mainSize), Float.valueOf(info.hypotheticalCrossSize));
            }
        } else {
            UnitValue prevMainSize = (UnitValue) info.renderer.replaceOwnProperty(77, UnitValue.createPointValue(info.mainSize));
            UnitValue prevMinMainSize = (UnitValue) info.renderer.replaceOwnProperty(80, null);
            info.renderer.setProperty(Property.INLINE_VERTICAL_ALIGNMENT, InlineVerticalAlignmentType.BOTTOM);
            LayoutResult result = info.renderer.layout(new LayoutContext(new LayoutArea(0, new Rectangle(1000000.0f, 1000000.0f))));
            info.renderer.returnBackOwnProperty(80, prevMinMainSize);
            info.renderer.returnBackOwnProperty(77, prevMainSize);
            if (result.getStatus() == 1) {
                info.hypotheticalCrossSize = info.getInnerCrossSize(result.getOccupiedArea().getBBox().getHeight());
                if (info.renderer instanceof FlexContainerRenderer) {
                    ((FlexContainerRenderer) info.renderer).setHypotheticalCrossSize(Float.valueOf(info.mainSize), Float.valueOf(info.hypotheticalCrossSize));
                    return;
                }
                return;
            }
            logger.error(IoLogMessageConstant.FLEX_ITEM_LAYOUT_RESULT_IS_NOT_FULL);
            info.hypotheticalCrossSize = 0.0f;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static List<Float> calculateColumnDirectionCrossSizes(List<List<FlexItemInfo>> lines) {
        List<Float> lineCrossSizes = new ArrayList<>();
        for (List<FlexItemInfo> line : lines) {
            float flexLinesCrossSize = 0.0f;
            float largestCrossSize = 0.0f;
            for (FlexItemInfo info : line) {
                largestCrossSize = Math.max(largestCrossSize, info.getRectangle().getWidth());
                flexLinesCrossSize = Math.max(0.0f, largestCrossSize);
            }
            lineCrossSizes.add(Float.valueOf(flexLinesCrossSize));
        }
        return lineCrossSizes;
    }

    static List<Float> calculateCrossSizeOfEachFlexLine(List<List<FlexItemCalculationInfo>> lines, Float minCrossSize, Float crossSize, Float maxCrossSize) {
        boolean isSingleLine = lines.size() == 1;
        List<Float> lineCrossSizes = new ArrayList<>();
        if (isSingleLine && crossSize != null) {
            lineCrossSizes.add(Float.valueOf(crossSize.floatValue()));
        } else {
            for (List<FlexItemCalculationInfo> line : lines) {
                float flexLinesCrossSize = 0.0f;
                float largestHypotheticalCrossSize = 0.0f;
                for (FlexItemCalculationInfo info : line) {
                    if (largestHypotheticalCrossSize < info.getOuterCrossSize(info.hypotheticalCrossSize)) {
                        largestHypotheticalCrossSize = info.getOuterCrossSize(info.hypotheticalCrossSize);
                    }
                    flexLinesCrossSize = Math.max(0.0f, largestHypotheticalCrossSize);
                }
                if (isSingleLine) {
                    if (minCrossSize != null) {
                        flexLinesCrossSize = Math.max(minCrossSize.floatValue(), flexLinesCrossSize);
                    }
                    if (maxCrossSize != null) {
                        flexLinesCrossSize = Math.min(maxCrossSize.floatValue(), flexLinesCrossSize);
                    }
                }
                lineCrossSizes.add(Float.valueOf(flexLinesCrossSize));
            }
        }
        return lineCrossSizes;
    }

    static void handleAlignContentStretch(FlexContainerRenderer flexContainerRenderer, List<List<FlexItemCalculationInfo>> lines, Float crossSize, List<Float> lineCrossSizes, Rectangle layoutBox) {
        AlignmentPropertyValue alignContent = (AlignmentPropertyValue) flexContainerRenderer.getProperty(Property.ALIGN_CONTENT, AlignmentPropertyValue.STRETCH);
        if (crossSize != null && alignContent == AlignmentPropertyValue.STRETCH) {
            if (flexContainerRenderer.isWrapReverse()) {
                Collections.reverse(lineCrossSizes);
                Collections.reverse(lines);
            }
            List<Float> currentPageLineCrossSizes = retrieveCurrentPageLineCrossSizes(flexContainerRenderer, lines, lineCrossSizes, crossSize, layoutBox);
            if (currentPageLineCrossSizes.size() > 0) {
                float flexLinesCrossSizesSum = 0.0f;
                for (Float f : currentPageLineCrossSizes) {
                    float size = f.floatValue();
                    flexLinesCrossSizesSum += size;
                }
                if (flexLinesCrossSizesSum < crossSize.floatValue() - 1.0E-4f) {
                    float addition = (crossSize.floatValue() - flexLinesCrossSizesSum) / currentPageLineCrossSizes.size();
                    for (int i = 0; i < currentPageLineCrossSizes.size(); i++) {
                        lineCrossSizes.set(i, Float.valueOf(lineCrossSizes.get(i).floatValue() + addition));
                    }
                }
            }
            if (flexContainerRenderer.isWrapReverse()) {
                Collections.reverse(lineCrossSizes);
                Collections.reverse(lines);
            }
        }
    }

    static void determineUsedCrossSizeOfEachFlexItem(List<List<FlexItemCalculationInfo>> lines, List<Float> lineCrossSizes, FlexContainerRenderer flexContainerRenderer) {
        AbstractRenderer abstractRenderer;
        int i;
        boolean isColumnDirection = isColumnDirection(flexContainerRenderer);
        AlignmentPropertyValue alignItems = (AlignmentPropertyValue) flexContainerRenderer.getProperty(Property.ALIGN_ITEMS, AlignmentPropertyValue.STRETCH);
        if (lines.size() != lineCrossSizes.size()) {
            throw new AssertionError();
        }
        for (int i2 = 0; i2 < lines.size(); i2++) {
            for (FlexItemCalculationInfo info : lines.get(i2)) {
                AbstractRenderer infoRenderer = info.renderer;
                AlignmentPropertyValue alignSelf = (AlignmentPropertyValue) infoRenderer.getProperty(Property.ALIGN_SELF, alignItems);
                if (isColumnDirection) {
                    abstractRenderer = info.renderer;
                    i = 77;
                } else {
                    abstractRenderer = info.renderer;
                    i = 27;
                }
                boolean definiteCrossSize = abstractRenderer.hasProperty(i);
                if ((alignSelf == AlignmentPropertyValue.STRETCH || alignSelf == AlignmentPropertyValue.NORMAL) && !definiteCrossSize) {
                    info.crossSize = info.getInnerCrossSize(lineCrossSizes.get(i2).floatValue());
                    Float maxCrossSize = isColumnDirection ? infoRenderer.retrieveMaxWidth(lineCrossSizes.get(i2).floatValue()) : infoRenderer.retrieveMaxHeight();
                    if (maxCrossSize != null) {
                        info.crossSize = Math.min(maxCrossSize.floatValue(), info.crossSize);
                    }
                    Float minCrossSize = isColumnDirection ? infoRenderer.retrieveMinWidth(lineCrossSizes.get(i2).floatValue()) : infoRenderer.retrieveMinHeight();
                    if (minCrossSize != null) {
                        info.crossSize = Math.max(minCrossSize.floatValue(), info.crossSize);
                    }
                } else {
                    info.crossSize = info.hypotheticalCrossSize;
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Float retrieveMaxHeightForMainDirection(AbstractRenderer renderer) {
        Float maxHeight = renderer.retrieveMaxHeight();
        if (renderer.hasProperty(84)) {
            return maxHeight;
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Float retrieveMinHeightForMainDirection(AbstractRenderer renderer) {
        Float minHeight = renderer.retrieveMinHeight();
        if (!renderer.hasProperty(85) || renderer.getProperty(85) == null) {
            return null;
        }
        return minHeight;
    }

    private static void applyAlignItemsAndAlignSelf(List<List<FlexItemCalculationInfo>> lines, FlexContainerRenderer renderer, List<Float> lineCrossSizes) {
        boolean isColumnDirection = isColumnDirection(renderer);
        AlignmentPropertyValue itemsAlignment = (AlignmentPropertyValue) renderer.getProperty(Property.ALIGN_ITEMS, AlignmentPropertyValue.STRETCH);
        if (lines.size() != lineCrossSizes.size()) {
            throw new AssertionError();
        }
        if (renderer.isWrapReverse()) {
            Collections.reverse(lines);
            Collections.reverse(lineCrossSizes);
        }
        float nextLineShift = 0.0f;
        for (int i = 0; i < lines.size(); i++) {
            float lineShift = nextLineShift;
            List<FlexItemCalculationInfo> line = lines.get(i);
            float lineCrossSize = lineCrossSizes.get(i).floatValue();
            nextLineShift = lineCrossSize - line.get(0).getOuterCrossSize(line.get(0).crossSize);
            for (FlexItemCalculationInfo itemInfo : line) {
                if (isColumnDirection) {
                    itemInfo.xShift = lineShift;
                } else {
                    itemInfo.yShift = lineShift;
                }
                AlignmentPropertyValue selfAlignment = (AlignmentPropertyValue) itemInfo.renderer.getProperty(Property.ALIGN_SELF, itemsAlignment);
                float freeSpace = lineCrossSize - itemInfo.getOuterCrossSize(itemInfo.crossSize);
                nextLineShift = Math.min(nextLineShift, freeSpace);
                switch (selfAlignment) {
                    case SELF_END:
                    case END:
                        if (isColumnDirection) {
                            itemInfo.xShift += freeSpace;
                        } else {
                            itemInfo.yShift += freeSpace;
                        }
                        nextLineShift = 0.0f;
                        break;
                    case FLEX_END:
                        if (renderer.isWrapReverse()) {
                            break;
                        } else {
                            if (isColumnDirection) {
                                itemInfo.xShift += freeSpace;
                            } else {
                                itemInfo.yShift += freeSpace;
                            }
                            nextLineShift = 0.0f;
                            break;
                        }
                    case CENTER:
                        if (isColumnDirection) {
                            itemInfo.xShift += freeSpace / 2.0f;
                        } else {
                            itemInfo.yShift += freeSpace / 2.0f;
                        }
                        nextLineShift = Math.min(nextLineShift, freeSpace / 2.0f);
                        break;
                    case FLEX_START:
                        if (renderer.isWrapReverse()) {
                            if (isColumnDirection) {
                                itemInfo.xShift += freeSpace;
                            } else {
                                itemInfo.yShift += freeSpace;
                            }
                            nextLineShift = 0.0f;
                            break;
                        } else {
                            break;
                        }
                }
            }
        }
        if (renderer.isWrapReverse()) {
            Collections.reverse(lines);
            Collections.reverse(lineCrossSizes);
        }
    }

    private static void applyJustifyContent(List<List<FlexItemCalculationInfo>> lines, FlexContainerRenderer renderer, float mainSize, float containerMainSize) {
        JustifyContent justifyContent = (JustifyContent) renderer.getProperty(Property.JUSTIFY_CONTENT, JustifyContent.FLEX_START);
        boolean containsFixedHeight = containerMainSize > 0.0f;
        boolean isFixedHeightAppliedOnTheCurrentPage = containsFixedHeight && containerMainSize < mainSize;
        if (renderer.isWrapReverse()) {
            Collections.reverse(lines);
        }
        for (List<FlexItemCalculationInfo> line : lines) {
            float childrenMainSize = 0.0f;
            boolean isColumnReverse = FlexDirectionPropertyValue.COLUMN_REVERSE == renderer.getProperty(Property.FLEX_DIRECTION, null);
            if (isColumnReverse) {
                Collections.reverse(line);
            }
            List<FlexItemCalculationInfo> lineToJustify = new ArrayList<>();
            for (int i = 0; i < line.size(); i++) {
                FlexItemCalculationInfo itemInfo = line.get(i);
                if (i != 0 && isColumnDirection(renderer) && !isFixedHeightAppliedOnTheCurrentPage && lines.size() == 1 && itemInfo.getOuterMainSize(itemInfo.mainSize) + childrenMainSize > mainSize + 1.0E-4f) {
                    break;
                }
                childrenMainSize += itemInfo.getOuterMainSize(itemInfo.mainSize);
                lineToJustify.add(itemInfo);
            }
            if (isColumnReverse) {
                Collections.reverse(line);
                Collections.reverse(lineToJustify);
            }
            float freeSpace = 0.0f;
            if (!isColumnDirection(renderer)) {
                freeSpace = mainSize - childrenMainSize;
            } else if (containsFixedHeight) {
                freeSpace = isFixedHeightAppliedOnTheCurrentPage ? containerMainSize - childrenMainSize : Math.max(0.0f, mainSize - childrenMainSize);
            }
            renderer.getFlexItemMainDirector().applyJustifyContent(lineToJustify, justifyContent, freeSpace);
        }
        if (renderer.isWrapReverse()) {
            Collections.reverse(lines);
        }
    }

    private static float calculateFreeSpace(List<FlexItemCalculationInfo> line, float initialFreeSpace) {
        float result = initialFreeSpace;
        for (FlexItemCalculationInfo info : line) {
            if (info.isFrozen) {
                result -= info.getOuterMainSize(info.mainSize);
            } else {
                result -= info.getOuterMainSize(info.flexBaseSize);
            }
        }
        return result;
    }

    private static boolean hasFlexibleItems(List<FlexItemCalculationInfo> line) {
        for (FlexItemCalculationInfo info : line) {
            if (!info.isFrozen) {
                return true;
            }
        }
        return false;
    }

    static boolean isZero(float value) {
        return Math.abs(value) < 1.0E-4f;
    }

    private static List<FlexItemCalculationInfo> createFlexItemCalculationInfos(FlexContainerRenderer flexContainerRenderer, float flexContainerMainSize, float crossSize) {
        FlexContainerRenderer flexContainerRenderer2;
        float containerMainSize;
        float flexBasis;
        List<IRenderer> childRenderers = flexContainerRenderer.getChildRenderers();
        List<FlexItemCalculationInfo> flexItems = new ArrayList<>();
        for (IRenderer renderer : childRenderers) {
            if (renderer instanceof AbstractRenderer) {
                AbstractRenderer abstractRenderer = (AbstractRenderer) renderer;
                float maxMainSize = calculateMaxMainSize(abstractRenderer, flexContainerMainSize, isColumnDirection(flexContainerRenderer), crossSize);
                boolean flexBasisContent = false;
                if (renderer.getProperty(Property.FLEX_BASIS) == null) {
                    flexBasis = maxMainSize;
                    flexBasisContent = true;
                    flexContainerRenderer2 = flexContainerRenderer;
                } else {
                    if (!isColumnDirection(flexContainerRenderer)) {
                        flexContainerRenderer2 = flexContainerRenderer;
                        containerMainSize = flexContainerMainSize;
                    } else {
                        flexContainerRenderer2 = flexContainerRenderer;
                        containerMainSize = getMainSize(flexContainerRenderer2, new Rectangle(0.0f, 0.0f));
                    }
                    flexBasis = abstractRenderer.retrieveUnitValue(containerMainSize, Property.FLEX_BASIS).floatValue();
                    if (AbstractRenderer.isBorderBoxSizing(abstractRenderer)) {
                        flexBasis -= AbstractRenderer.calculatePaddingBorderWidth(abstractRenderer);
                    }
                }
                float flexBasis2 = Math.max(flexBasis, 0.0f);
                float flexGrow = ((Float) renderer.getProperty(Property.FLEX_GROW, Float.valueOf(0.0f))).floatValue();
                float flexShrink = ((Float) renderer.getProperty(127, Float.valueOf(1.0f))).floatValue();
                FlexItemCalculationInfo flexItemInfo = new FlexItemCalculationInfo((AbstractRenderer) renderer, flexBasis2, flexGrow, flexShrink, flexContainerMainSize, flexBasisContent, isColumnDirection(flexContainerRenderer2), crossSize);
                flexItems.add(flexItemInfo);
            }
        }
        return flexItems;
    }

    private static float calculateMaxMainSize(AbstractRenderer flexItemRenderer, float flexContainerMainSize, boolean isColumnDirection, float crossSize) {
        Float maxMainSize;
        Float maxMainSize2;
        if (flexItemRenderer instanceof TableRenderer) {
            if (isColumnDirection) {
                Float itemRendererMaxHeight = flexItemRenderer.retrieveMaxHeight();
                maxMainSize2 = itemRendererMaxHeight;
                if (maxMainSize2 == null) {
                    maxMainSize2 = Float.valueOf(calculateHeight(flexItemRenderer, crossSize));
                }
            } else {
                maxMainSize2 = new Float(flexItemRenderer.getMinMaxWidth().getMaxWidth());
            }
            if (isColumnDirection) {
                maxMainSize = Float.valueOf(flexItemRenderer.applyMarginsBordersPaddings(new Rectangle(0.0f, maxMainSize2.floatValue()), false).getHeight());
            } else {
                maxMainSize = Float.valueOf(flexItemRenderer.applyMarginsBordersPaddings(new Rectangle(maxMainSize2.floatValue(), 0.0f), false).getWidth());
            }
        } else {
            maxMainSize = isColumnDirection ? flexItemRenderer.retrieveHeight() : flexItemRenderer.retrieveWidth(flexContainerMainSize);
            if (maxMainSize == null) {
                maxMainSize = isColumnDirection ? retrieveMaxHeightForMainDirection(flexItemRenderer) : flexItemRenderer.retrieveMaxWidth(flexContainerMainSize);
            }
            if (maxMainSize == null) {
                if (flexItemRenderer instanceof ImageRenderer) {
                    ImageRenderer imageRenderer = (ImageRenderer) flexItemRenderer;
                    maxMainSize = Float.valueOf(isColumnDirection ? imageRenderer.getImageHeight() : imageRenderer.getImageWidth());
                } else if (isColumnDirection) {
                    Float height = retrieveMaxHeightForMainDirection(flexItemRenderer);
                    if (height == null) {
                        height = Float.valueOf(calculateHeight(flexItemRenderer, crossSize));
                    }
                    maxMainSize = Float.valueOf(flexItemRenderer.applyMarginsBordersPaddings(new Rectangle(0.0f, height.floatValue()), false).getHeight());
                } else {
                    maxMainSize = Float.valueOf(flexItemRenderer.applyMarginsBordersPaddings(new Rectangle(flexItemRenderer.getMinMaxWidth().getMaxWidth(), 0.0f), false).getWidth());
                }
            }
        }
        return maxMainSize.floatValue();
    }

    private static List<Float> retrieveCurrentPageLineCrossSizes(FlexContainerRenderer flexContainerRenderer, List<List<FlexItemCalculationInfo>> lines, List<Float> lineCrossSizes, Float crossSize, Rectangle layoutBox) {
        float mainSize = getMainSize(flexContainerRenderer, new Rectangle(0.0f, 0.0f));
        boolean isColumnDirectionWithPagination = isColumnDirection(flexContainerRenderer) && (mainSize < 1.0E-4f || mainSize > layoutBox.getHeight() + 1.0E-4f);
        if (!isColumnDirectionWithPagination || crossSize == null) {
            return lineCrossSizes;
        }
        List<Float> currentPageLineCrossSizes = new ArrayList<>();
        float flexLinesCrossSizesSum = 0.0f;
        for (int i = 0; i < lineCrossSizes.size(); i++) {
            float size = lineCrossSizes.get(i).floatValue();
            if (flexLinesCrossSizesSum + size > crossSize.floatValue() + 1.0E-4f || lines.get(i).get(0).mainSize > layoutBox.getHeight() + 1.0E-4f) {
                if (i == 0) {
                    currentPageLineCrossSizes.add(Float.valueOf(size));
                }
                return currentPageLineCrossSizes;
            }
            flexLinesCrossSizesSum += size;
            currentPageLineCrossSizes.add(Float.valueOf(size));
        }
        return currentPageLineCrossSizes;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static float calculateHeight(AbstractRenderer flexItemRenderer, float width) {
        LayoutResult result = flexItemRenderer.layout(new LayoutContext(new LayoutArea(1, new Rectangle(width, 1000000.0f))));
        if (result.getStatus() == 3) {
            return 0.0f;
        }
        return result.getOccupiedArea().getBBox().getHeight();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes12.dex */
    public static class FlexItemCalculationInfo {
        float crossSize;
        float flexBaseSize;
        float flexBasis;
        boolean flexBasisContent;
        float flexGrow;
        float flexShrink;
        float hypotheticalCrossSize;
        float hypotheticalMainSize;
        boolean isColumnDirection;
        float mainSize;
        float maxContent;
        float minContent;
        AbstractRenderer renderer;
        float scaledFlexShrinkFactor;
        float xShift;
        float yShift;
        boolean isFrozen = false;
        boolean isMinViolated = false;
        boolean isMaxViolated = false;

        public FlexItemCalculationInfo(AbstractRenderer renderer, float flexBasis, float flexGrow, float flexShrink, float areaMainSize, boolean flexBasisContent, boolean isColumnDirection, float crossSize) {
            this.isColumnDirection = isColumnDirection;
            this.flexBasisContent = flexBasisContent;
            this.renderer = renderer;
            this.flexBasis = flexBasis;
            if (flexShrink < 0.0f) {
                throw new IllegalArgumentException(LayoutExceptionMessageConstant.FLEX_SHRINK_CANNOT_BE_NEGATIVE);
            }
            this.flexShrink = flexShrink;
            if (flexGrow < 0.0f) {
                throw new IllegalArgumentException(LayoutExceptionMessageConstant.FLEX_GROW_CANNOT_BE_NEGATIVE);
            }
            this.flexGrow = flexGrow;
            Float definiteMinContent = isColumnDirection ? FlexUtil.retrieveMinHeightForMainDirection(renderer) : renderer.retrieveMinWidth(areaMainSize);
            this.minContent = definiteMinContent == null ? calculateMinContentAuto(areaMainSize, crossSize) : definiteMinContent.floatValue();
            AbstractRenderer abstractRenderer = this.renderer;
            Float maxMainSize = isColumnDirection ? FlexUtil.retrieveMaxHeightForMainDirection(abstractRenderer) : abstractRenderer.retrieveMaxWidth(areaMainSize);
            this.maxContent = maxMainSize == null ? 1000000.0f : maxMainSize.floatValue();
        }

        public Rectangle toRectangle() {
            if (this.isColumnDirection) {
                return new Rectangle(this.xShift, this.yShift, getOuterCrossSize(this.crossSize), getOuterMainSize(this.mainSize));
            }
            return new Rectangle(this.xShift, this.yShift, getOuterMainSize(this.mainSize), getOuterCrossSize(this.crossSize));
        }

        float getOuterMainSize(float size) {
            boolean z = this.isColumnDirection;
            AbstractRenderer abstractRenderer = this.renderer;
            if (z) {
                return abstractRenderer.applyMarginsBordersPaddings(new Rectangle(0.0f, size), true).getHeight();
            }
            return abstractRenderer.applyMarginsBordersPaddings(new Rectangle(size, 0.0f), true).getWidth();
        }

        float getInnerMainSize(float size) {
            boolean z = this.isColumnDirection;
            AbstractRenderer abstractRenderer = this.renderer;
            if (z) {
                return abstractRenderer.applyMarginsBordersPaddings(new Rectangle(0.0f, size), false).getHeight();
            }
            return abstractRenderer.applyMarginsBordersPaddings(new Rectangle(size, 0.0f), false).getWidth();
        }

        float getOuterCrossSize(float size) {
            boolean z = this.isColumnDirection;
            AbstractRenderer abstractRenderer = this.renderer;
            if (z) {
                return abstractRenderer.applyMarginsBordersPaddings(new Rectangle(size, 0.0f), true).getWidth();
            }
            return abstractRenderer.applyMarginsBordersPaddings(new Rectangle(0.0f, size), true).getHeight();
        }

        float getInnerCrossSize(float size) {
            boolean z = this.isColumnDirection;
            AbstractRenderer abstractRenderer = this.renderer;
            if (z) {
                return abstractRenderer.applyMarginsBordersPaddings(new Rectangle(size, 0.0f), false).getWidth();
            }
            return abstractRenderer.applyMarginsBordersPaddings(new Rectangle(0.0f, size), false).getHeight();
        }

        private float calculateMinContentAuto(float flexContainerMainSize, float crossSize) {
            Float specifiedSizeSuggestion = calculateSpecifiedSizeSuggestion(flexContainerMainSize);
            float contentSizeSuggestion = calculateContentSizeSuggestion(flexContainerMainSize, crossSize);
            if (this.renderer.hasAspectRatio() && specifiedSizeSuggestion == null) {
                Float transferredSizeSuggestion = calculateTransferredSizeSuggestion(flexContainerMainSize);
                if (transferredSizeSuggestion == null) {
                    return contentSizeSuggestion;
                }
                return Math.min(contentSizeSuggestion, transferredSizeSuggestion.floatValue());
            } else if (specifiedSizeSuggestion == null) {
                return contentSizeSuggestion;
            } else {
                return Math.min(contentSizeSuggestion, specifiedSizeSuggestion.floatValue());
            }
        }

        private Float calculateTransferredSizeSuggestion(float flexContainerMainSize) {
            boolean z = this.isColumnDirection;
            AbstractRenderer abstractRenderer = this.renderer;
            Float crossSize = z ? abstractRenderer.retrieveWidth(flexContainerMainSize) : abstractRenderer.retrieveHeight();
            if (!this.renderer.hasAspectRatio() || crossSize == null) {
                return null;
            }
            Float transferredSizeSuggestion = Float.valueOf(crossSize.floatValue() * this.renderer.getAspectRatio().floatValue());
            return Float.valueOf(clampValueByCrossSizesConvertedThroughAspectRatio(transferredSizeSuggestion.floatValue(), flexContainerMainSize));
        }

        private Float calculateSpecifiedSizeSuggestion(float flexContainerMainSize) {
            boolean z = this.isColumnDirection;
            AbstractRenderer abstractRenderer = this.renderer;
            if (z) {
                if (!abstractRenderer.hasProperty(27)) {
                    return null;
                }
                Float mainSizeSuggestion = this.renderer.retrieveHeight();
                return mainSizeSuggestion;
            } else if (!abstractRenderer.hasProperty(77)) {
                return null;
            } else {
                Float mainSizeSuggestion2 = this.renderer.retrieveWidth(flexContainerMainSize);
                return mainSizeSuggestion2;
            }
        }

        private float calculateContentSizeSuggestion(float flexContainerMainSize, float crossSize) {
            float minContentSize;
            Float maxMainSize;
            UnitValue rendererWidth = (UnitValue) this.renderer.replaceOwnProperty(77, null);
            UnitValue rendererHeight = (UnitValue) this.renderer.replaceOwnProperty(27, null);
            boolean z = this.isColumnDirection;
            AbstractRenderer abstractRenderer = this.renderer;
            if (z) {
                Float height = FlexUtil.retrieveMinHeightForMainDirection(abstractRenderer);
                if (height == null) {
                    height = Float.valueOf(FlexUtil.calculateHeight(this.renderer, crossSize));
                }
                minContentSize = getInnerMainSize(height.floatValue());
            } else {
                MinMaxWidth minMaxWidth = abstractRenderer.getMinMaxWidth();
                minContentSize = getInnerMainSize(minMaxWidth.getMinWidth());
            }
            this.renderer.returnBackOwnProperty(27, rendererHeight);
            this.renderer.returnBackOwnProperty(77, rendererWidth);
            if (this.renderer.hasAspectRatio()) {
                minContentSize = clampValueByCrossSizesConvertedThroughAspectRatio(minContentSize, flexContainerMainSize);
            }
            boolean z2 = this.isColumnDirection;
            AbstractRenderer abstractRenderer2 = this.renderer;
            if (z2) {
                maxMainSize = FlexUtil.retrieveMaxHeightForMainDirection(abstractRenderer2);
            } else {
                maxMainSize = abstractRenderer2.retrieveMaxWidth(flexContainerMainSize);
            }
            if (maxMainSize == null) {
                maxMainSize = Float.valueOf(1000000.0f);
            }
            return Math.min(minContentSize, maxMainSize.floatValue());
        }

        /* JADX WARN: Code restructure failed: missing block: B:12:0x0020, code lost:
            if (r5.renderer.hasProperty(r5.isColumnDirection ? 79 : 84) == false) goto L26;
         */
        /* JADX WARN: Code restructure failed: missing block: B:24:0x0049, code lost:
            if (r5.renderer.hasProperty(r5.isColumnDirection ? 80 : 85) == false) goto L23;
         */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        private float clampValueByCrossSizesConvertedThroughAspectRatio(float r6, float r7) {
            /*
                r5 = this;
                boolean r0 = r5.isColumnDirection
                com.itextpdf.layout.renderer.AbstractRenderer r1 = r5.renderer
                if (r0 == 0) goto Lb
                java.lang.Float r0 = r1.retrieveMaxWidth(r7)
                goto Lf
            Lb:
                java.lang.Float r0 = r1.retrieveMaxHeight()
            Lf:
                if (r0 == 0) goto L22
                com.itextpdf.layout.renderer.AbstractRenderer r1 = r5.renderer
                boolean r2 = r5.isColumnDirection
                if (r2 == 0) goto L1a
                r2 = 79
                goto L1c
            L1a:
                r2 = 84
            L1c:
                boolean r1 = r1.hasProperty(r2)
                if (r1 != 0) goto L29
            L22:
                r1 = 1232348160(0x49742400, float:1000000.0)
                java.lang.Float r0 = java.lang.Float.valueOf(r1)
            L29:
                boolean r1 = r5.isColumnDirection
                com.itextpdf.layout.renderer.AbstractRenderer r2 = r5.renderer
                if (r1 == 0) goto L34
                java.lang.Float r1 = r2.retrieveMinWidth(r7)
                goto L38
            L34:
                java.lang.Float r1 = r2.retrieveMinHeight()
            L38:
                if (r1 == 0) goto L4b
                com.itextpdf.layout.renderer.AbstractRenderer r2 = r5.renderer
                boolean r3 = r5.isColumnDirection
                if (r3 == 0) goto L43
                r3 = 80
                goto L45
            L43:
                r3 = 85
            L45:
                boolean r2 = r2.hasProperty(r3)
                if (r2 != 0) goto L50
            L4b:
                r2 = 0
                java.lang.Float r1 = java.lang.Float.valueOf(r2)
            L50:
                float r2 = r1.floatValue()
                com.itextpdf.layout.renderer.AbstractRenderer r3 = r5.renderer
                java.lang.Float r3 = r3.getAspectRatio()
                float r3 = r3.floatValue()
                float r2 = r2 * r3
                float r2 = java.lang.Math.max(r2, r6)
                float r3 = r0.floatValue()
                com.itextpdf.layout.renderer.AbstractRenderer r4 = r5.renderer
                java.lang.Float r4 = r4.getAspectRatio()
                float r4 = r4.floatValue()
                float r3 = r3 * r4
                float r2 = java.lang.Math.min(r2, r3)
                return r2
            */
            throw new UnsupportedOperationException("Method not decompiled: com.itextpdf.layout.renderer.FlexUtil.FlexItemCalculationInfo.clampValueByCrossSizesConvertedThroughAspectRatio(float, float):float");
        }
    }
}
