package com.itextpdf.layout.renderer;

import com.itextpdf.io.font.otf.ActualTextIterator;
import com.itextpdf.io.font.otf.GlyphLine;
import com.itextpdf.layout.layout.LayoutResult;
import com.itextpdf.layout.layout.TextLayoutResult;
import com.itextpdf.layout.properties.OverflowPropertyValue;
import com.itextpdf.layout.renderer.LineRenderer;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes12.dex */
public final class TextSequenceWordWrapping {
    private static final float OCCUPIED_AREA_RELAYOUT_EPS = 1.0E-4f;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes12.dex */
    public enum SpecialScriptsContainingSequenceStatus {
        MOVE_SEQUENCE_CONTAINING_SPECIAL_SCRIPTS_ON_NEXT_LINE,
        MOVE_TO_PREVIOUS_TEXT_RENDERER_CONTAINING_SPECIAL_SCRIPTS,
        FORCED_SPLIT
    }

    private TextSequenceWordWrapping() {
    }

    public static boolean isTextRendererAndRequiresSpecialScriptPreLayoutProcessing(IRenderer childRenderer) {
        return (childRenderer instanceof TextRenderer) && ((TextRenderer) childRenderer).getSpecialScriptsWordBreakPoints() == null && ((TextRenderer) childRenderer).textContainsSpecialScriptGlyphs(false) && !LineRenderer.isChildFloating(childRenderer);
    }

    public static void processSpecialScriptPreLayout(LineRenderer lineRenderer, int childPos) {
        SpecialScriptsContainingTextRendererSequenceInfo info = getSpecialScriptsContainingTextRendererSequenceInfo(lineRenderer, childPos);
        int numberOfSequentialTextRenderers = info.numberOfSequentialTextRenderers;
        String sequentialTextContent = info.sequentialTextContent;
        List<Integer> indicesOfFloating = info.indicesOfFloating;
        List<Integer> possibleBreakPointsGlobal = TypographyUtils.getPossibleBreaks(sequentialTextContent);
        distributePossibleBreakPointsOverSequentialTextRenderers(lineRenderer, childPos, numberOfSequentialTextRenderers, possibleBreakPointsGlobal, indicesOfFloating);
    }

    public static void updateTextSequenceLayoutResults(Map<Integer, LayoutResult> textRendererLayoutResults, boolean specialScripts, IRenderer childRenderer, int childPos, LayoutResult childResult) {
        if ((childRenderer instanceof TextRenderer) && ((TextRenderer) childRenderer).textContainsSpecialScriptGlyphs(true) == specialScripts) {
            textRendererLayoutResults.put(Integer.valueOf(childPos), childResult);
        }
    }

    public static void resetTextSequenceIfItEnded(Map<Integer, LayoutResult> textRendererLayoutResults, boolean specialScripts, IRenderer childRenderer, int childPos, MinMaxWidthOfTextRendererSequenceHelper minMaxWidthOfTextRendererSequenceHelper, boolean noSoftWrap, AbstractWidthHandler widthHandler) {
        if ((!(childRenderer instanceof TextRenderer) || ((TextRenderer) childRenderer).textContainsSpecialScriptGlyphs(true) != specialScripts || LineRenderer.isChildFloating(childRenderer)) && !textRendererLayoutResults.isEmpty()) {
            int lastChildInTextSequence = childPos;
            while (lastChildInTextSequence >= 0 && textRendererLayoutResults.get(Integer.valueOf(lastChildInTextSequence)) == null) {
                lastChildInTextSequence--;
            }
            LayoutResult childResult = textRendererLayoutResults.get(Integer.valueOf(lastChildInTextSequence));
            updateMinMaxWidthOfLineRendererAfterTextRendererSequenceProcessing(noSoftWrap, lastChildInTextSequence, childResult, widthHandler, minMaxWidthOfTextRendererSequenceHelper, textRendererLayoutResults);
            textRendererLayoutResults.clear();
        }
    }

    public static LineRenderer.LineAscentDescentState updateTextRendererSequenceAscentDescent(LineRenderer lineRenderer, Map<Integer, float[]> textRendererSequenceAscentDescent, int childPos, float[] childAscentDescent, LineRenderer.LineAscentDescentState preTextSequenceAscentDescent) {
        IRenderer childRenderer = lineRenderer.childRenderers.get(childPos);
        if ((childRenderer instanceof TextRenderer) && !((TextRenderer) childRenderer).textContainsSpecialScriptGlyphs(true)) {
            if (textRendererSequenceAscentDescent.isEmpty()) {
                preTextSequenceAscentDescent = new LineRenderer.LineAscentDescentState(lineRenderer.maxAscent, lineRenderer.maxDescent, lineRenderer.maxTextAscent, lineRenderer.maxTextDescent);
            }
            textRendererSequenceAscentDescent.put(Integer.valueOf(childPos), childAscentDescent);
            return preTextSequenceAscentDescent;
        } else if (!textRendererSequenceAscentDescent.isEmpty()) {
            textRendererSequenceAscentDescent.clear();
            return null;
        } else {
            return preTextSequenceAscentDescent;
        }
    }

    public static MinMaxWidthOfTextRendererSequenceHelper updateTextRendererSequenceMinMaxWidth(LineRenderer lineRenderer, AbstractWidthHandler widthHandler, int childPos, MinMaxWidthOfTextRendererSequenceHelper minMaxWidthOfTextRendererSequenceHelper, boolean anythingPlaced, Map<Integer, LayoutResult> textRendererLayoutResults, Map<Integer, LayoutResult> specialScriptLayoutResults, float textIndent) {
        IRenderer childRenderer = lineRenderer.childRenderers.get(childPos);
        if (childRenderer instanceof TextRenderer) {
            boolean firstTextRendererWithoutSpecialScripts = true;
            boolean firstTextRendererWithSpecialScripts = ((TextRenderer) childRenderer).textContainsSpecialScriptGlyphs(true) && specialScriptLayoutResults.size() == 1;
            if (((TextRenderer) childRenderer).textContainsSpecialScriptGlyphs(true) || textRendererLayoutResults.size() != 1) {
                firstTextRendererWithoutSpecialScripts = false;
            }
            if (firstTextRendererWithoutSpecialScripts || firstTextRendererWithSpecialScripts) {
                MinMaxWidthOfTextRendererSequenceHelper minMaxWidthOfTextRendererSequenceHelper2 = new MinMaxWidthOfTextRendererSequenceHelper(widthHandler.minMaxWidth.getChildrenMinWidth(), textIndent, anythingPlaced);
                return minMaxWidthOfTextRendererSequenceHelper2;
            }
            return minMaxWidthOfTextRendererSequenceHelper;
        }
        return null;
    }

    /* JADX WARN: Code restructure failed: missing block: B:26:0x008d, code lost:
        if (r11.getStatus() != 3) goto L49;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x008f, code lost:
        r12 = r11;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x0091, code lost:
        r12 = new com.itextpdf.layout.layout.TextLayoutResult(3, null, null, r16.childRenderers.get(r4));
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x009e, code lost:
        r3 = r12;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x0120, code lost:
        if (com.itextpdf.layout.renderer.LineRenderer.isChildFloating(r16.childRenderers.get(r5)) != false) goto L72;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x012a, code lost:
        if ((r16.childRenderers.get(r5) instanceof com.itextpdf.layout.renderer.ImageRenderer) != false) goto L72;
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x0138, code lost:
        if (com.itextpdf.layout.renderer.LineRenderer.isInlineBlockChild(r16.childRenderers.get(r5)) == false) goto L30;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x013a, code lost:
        r3 = new com.itextpdf.layout.layout.TextLayoutResult(3, null, null, r16.childRenderers.get(r4));
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static com.itextpdf.layout.renderer.TextSequenceWordWrapping.LastFittingChildRendererData getIndexAndLayoutResultOfTheLastTextRendererWithNoSpecialScripts(com.itextpdf.layout.renderer.LineRenderer r16, int r17, java.util.Map<java.lang.Integer, com.itextpdf.layout.layout.LayoutResult> r18, boolean r19, boolean r20, boolean r21) {
        /*
            Method dump skipped, instructions count: 422
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.itextpdf.layout.renderer.TextSequenceWordWrapping.getIndexAndLayoutResultOfTheLastTextRendererWithNoSpecialScripts(com.itextpdf.layout.renderer.LineRenderer, int, java.util.Map, boolean, boolean, boolean):com.itextpdf.layout.renderer.TextSequenceWordWrapping$LastFittingChildRendererData");
    }

    /* JADX WARN: Code restructure failed: missing block: B:56:0x00f1, code lost:
        if (r9 != null) goto L36;
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x00f3, code lost:
        r1 = r7;
        r9 = (com.itextpdf.layout.renderer.TextRenderer) r18.childRenderers.get(r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x00fc, code lost:
        if (r4 == false) goto L35;
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x00fe, code lost:
        r10 = (r5 - r6) + r9.text.start;
     */
    /* JADX WARN: Code restructure failed: missing block: B:60:0x0105, code lost:
        if (r10 == r3) goto L34;
     */
    /* JADX WARN: Code restructure failed: missing block: B:61:0x0107, code lost:
        r11 = r9.getOccupiedArea().mo7332clone();
        r11.getBBox().increaseHeight(1.0E-4f).increaseWidth(1.0E-4f);
        r9.setSpecialScriptFirstNotFittingIndex(r3);
        r1 = r9.layout(new com.itextpdf.layout.layout.LayoutContext(r11, r21));
        r9.setSpecialScriptFirstNotFittingIndex(-1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:63:0x0132, code lost:
        r9 = r1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:64:0x0134, code lost:
        r11 = r16;
        r9 = new com.itextpdf.layout.layout.TextLayoutResult(3, r11, r11, r9);
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x0140, code lost:
        r9 = r9;
     */
    /* JADX WARN: Code restructure failed: missing block: B:67:0x0147, code lost:
        return new com.itextpdf.layout.renderer.TextSequenceWordWrapping.LastFittingChildRendererData(r2, r9);
     */
    /* JADX WARN: Type inference failed for: r11v0, types: [com.itextpdf.layout.layout.LayoutArea, com.itextpdf.layout.renderer.IRenderer] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static com.itextpdf.layout.renderer.TextSequenceWordWrapping.LastFittingChildRendererData getIndexAndLayoutResultOfTheLastTextRendererContainingSpecialScripts(com.itextpdf.layout.renderer.LineRenderer r18, int r19, java.util.Map<java.lang.Integer, com.itextpdf.layout.layout.LayoutResult> r20, boolean r21, boolean r22) {
        /*
            Method dump skipped, instructions count: 328
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.itextpdf.layout.renderer.TextSequenceWordWrapping.getIndexAndLayoutResultOfTheLastTextRendererContainingSpecialScripts(com.itextpdf.layout.renderer.LineRenderer, int, java.util.Map, boolean, boolean):com.itextpdf.layout.renderer.TextSequenceWordWrapping$LastFittingChildRendererData");
    }

    /* JADX WARN: Code restructure failed: missing block: B:5:0x000d, code lost:
        if (((com.itextpdf.layout.renderer.TextRenderer) r6).textContainsSpecialScriptGlyphs(true) != false) goto L5;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void preprocessTextSequenceOverflowX(com.itextpdf.layout.renderer.LineRenderer r4, boolean r5, com.itextpdf.layout.renderer.IRenderer r6, boolean r7, com.itextpdf.layout.properties.OverflowPropertyValue r8) {
        /*
            boolean r0 = r6 instanceof com.itextpdf.layout.renderer.TextRenderer
            r1 = 0
            if (r0 == 0) goto L10
            r0 = r6
            com.itextpdf.layout.renderer.TextRenderer r0 = (com.itextpdf.layout.renderer.TextRenderer) r0
            r2 = 1
            boolean r0 = r0.textContainsSpecialScriptGlyphs(r2)
            if (r0 == 0) goto L10
            goto L11
        L10:
            r2 = r1
        L11:
            r0 = 103(0x67, float:1.44E-43)
            if (r5 == 0) goto L36
            if (r2 == 0) goto L36
            r3 = r6
            com.itextpdf.layout.renderer.TextRenderer r3 = (com.itextpdf.layout.renderer.TextRenderer) r3
            java.util.List r3 = r3.getSpecialScriptsWordBreakPoints()
            java.lang.Object r1 = r3.get(r1)
            java.lang.Integer r1 = (java.lang.Integer) r1
            int r1 = r1.intValue()
            r3 = -1
            if (r1 == r3) goto L31
            r3 = r6
            com.itextpdf.layout.renderer.TextRenderer r3 = (com.itextpdf.layout.renderer.TextRenderer) r3
            r3.setSpecialScriptFirstNotFittingIndex(r1)
        L31:
            if (r7 == 0) goto L36
            r4.setProperty(r0, r8)
        L36:
            if (r5 == 0) goto L3f
            if (r2 != 0) goto L3f
            if (r7 == 0) goto L3f
            r4.setProperty(r0, r8)
        L3f:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.itextpdf.layout.renderer.TextSequenceWordWrapping.preprocessTextSequenceOverflowX(com.itextpdf.layout.renderer.LineRenderer, boolean, com.itextpdf.layout.renderer.IRenderer, boolean, com.itextpdf.layout.properties.OverflowPropertyValue):void");
    }

    public static boolean postprocessTextSequenceOverflowX(LineRenderer lineRenderer, boolean textSequenceOverflowXProcessing, int childPos, IRenderer childRenderer, LayoutResult childResult, boolean wasXOverflowChanged) {
        boolean lastElemOfTextSequence = false;
        boolean specialScripts = (childRenderer instanceof TextRenderer) && ((TextRenderer) childRenderer).textContainsSpecialScriptGlyphs(true);
        boolean shouldBreakLayouting = false;
        if (childPos + 1 == lineRenderer.childRenderers.size() || LineRenderer.isChildFloating(lineRenderer.childRenderers.get(childPos + 1)) || !(lineRenderer.childRenderers.get(childPos + 1) instanceof TextRenderer)) {
            lastElemOfTextSequence = true;
        }
        if (textSequenceOverflowXProcessing && specialScripts) {
            shouldBreakLayouting = (((TextRenderer) childRenderer).getSpecialScriptFirstNotFittingIndex() > 0 || lastElemOfTextSequence) ? true : true;
            ((TextRenderer) childRenderer).setSpecialScriptFirstNotFittingIndex(-1);
            if (wasXOverflowChanged) {
                lineRenderer.setProperty(103, OverflowPropertyValue.FIT);
            }
        }
        if (textSequenceOverflowXProcessing && !specialScripts) {
            if (((childResult instanceof TextLayoutResult) && ((TextLayoutResult) childResult).isContainsPossibleBreak()) || lastElemOfTextSequence) {
                shouldBreakLayouting = true;
            }
            if (wasXOverflowChanged) {
                lineRenderer.setProperty(103, OverflowPropertyValue.FIT);
            }
        }
        return shouldBreakLayouting;
    }

    static SpecialScriptsContainingTextRendererSequenceInfo getSpecialScriptsContainingTextRendererSequenceInfo(LineRenderer lineRenderer, int childPos) {
        StringBuilder sequentialTextContentBuilder = new StringBuilder();
        int numberOfSequentialTextRenderers = 0;
        List<Integer> indicesOfFloating = new ArrayList<>();
        for (int i = childPos; i < lineRenderer.childRenderers.size(); i++) {
            if (LineRenderer.isChildFloating(lineRenderer.childRenderers.get(i))) {
                numberOfSequentialTextRenderers++;
                indicesOfFloating.add(Integer.valueOf(i));
            } else if (!(lineRenderer.childRenderers.get(i) instanceof TextRenderer) || !((TextRenderer) lineRenderer.childRenderers.get(i)).textContainsSpecialScriptGlyphs(false)) {
                break;
            } else {
                sequentialTextContentBuilder.append(((TextRenderer) lineRenderer.childRenderers.get(i)).text.toString());
                numberOfSequentialTextRenderers++;
            }
        }
        return new SpecialScriptsContainingTextRendererSequenceInfo(numberOfSequentialTextRenderers, sequentialTextContentBuilder.toString(), indicesOfFloating);
    }

    static void distributePossibleBreakPointsOverSequentialTextRenderers(LineRenderer lineRenderer, int childPos, int numberOfSequentialTextRenderers, List<Integer> possibleBreakPointsGlobal, List<Integer> indicesOfFloating) {
        int alreadyProcessedNumberOfCharsWithinGlyphLines = 0;
        int indexToBeginWith = 0;
        for (int i = 0; i < numberOfSequentialTextRenderers; i++) {
            if (!indicesOfFloating.contains(Integer.valueOf(i))) {
                TextRenderer childTextRenderer = (TextRenderer) lineRenderer.childRenderers.get(childPos + i);
                List<Integer> amountOfCharsBetweenTextStartAndActualTextChunk = new ArrayList<>();
                List<Integer> glyphLineBasedIndicesOfActualTextChunkEnds = new ArrayList<>();
                fillActualTextChunkRelatedLists(childTextRenderer.getText(), amountOfCharsBetweenTextStartAndActualTextChunk, glyphLineBasedIndicesOfActualTextChunkEnds);
                List<Integer> possibleBreakPoints = new ArrayList<>();
                int j = indexToBeginWith;
                while (true) {
                    if (j >= possibleBreakPointsGlobal.size()) {
                        break;
                    }
                    int shiftedBreakPoint = possibleBreakPointsGlobal.get(j).intValue() - alreadyProcessedNumberOfCharsWithinGlyphLines;
                    int amountOfCharsBetweenTextStartAndTextEnd = amountOfCharsBetweenTextStartAndActualTextChunk.get(amountOfCharsBetweenTextStartAndActualTextChunk.size() - 1).intValue();
                    if (shiftedBreakPoint > amountOfCharsBetweenTextStartAndTextEnd) {
                        indexToBeginWith = j;
                        alreadyProcessedNumberOfCharsWithinGlyphLines += amountOfCharsBetweenTextStartAndTextEnd;
                        break;
                    }
                    possibleBreakPoints.add(Integer.valueOf(shiftedBreakPoint));
                    j++;
                }
                List<Integer> glyphLineBasedPossibleBreakPoints = convertPossibleBreakPointsToGlyphLineBased(possibleBreakPoints, amountOfCharsBetweenTextStartAndActualTextChunk, glyphLineBasedIndicesOfActualTextChunkEnds);
                childTextRenderer.setSpecialScriptsWordBreakPoints(glyphLineBasedPossibleBreakPoints);
            }
        }
    }

    static SpecialScriptsContainingSequenceStatus getSpecialScriptsContainingSequenceStatus(LineRenderer lineRenderer, int analyzedTextRendererIndex) {
        boolean moveSequenceContainingSpecialScriptsOnNextLine = false;
        boolean moveToPreviousTextRendererContainingSpecialScripts = false;
        boolean forcedSplit = true;
        if (analyzedTextRendererIndex > 0) {
            IRenderer prevChildRenderer = lineRenderer.childRenderers.get(analyzedTextRendererIndex - 1);
            if ((prevChildRenderer instanceof TextRenderer) && !LineRenderer.isChildFloating(prevChildRenderer)) {
                if (((TextRenderer) prevChildRenderer).textContainsSpecialScriptGlyphs(true)) {
                    moveToPreviousTextRendererContainingSpecialScripts = true;
                } else {
                    moveSequenceContainingSpecialScriptsOnNextLine = true;
                }
            } else if (LineRenderer.isChildFloating(prevChildRenderer) || (prevChildRenderer instanceof ImageRenderer) || LineRenderer.isInlineBlockChild(prevChildRenderer)) {
                moveSequenceContainingSpecialScriptsOnNextLine = true;
            }
        }
        forcedSplit = (moveToPreviousTextRendererContainingSpecialScripts || moveSequenceContainingSpecialScriptsOnNextLine) ? false : false;
        if (moveSequenceContainingSpecialScriptsOnNextLine) {
            return SpecialScriptsContainingSequenceStatus.MOVE_SEQUENCE_CONTAINING_SPECIAL_SCRIPTS_ON_NEXT_LINE;
        }
        if (forcedSplit) {
            return SpecialScriptsContainingSequenceStatus.FORCED_SPLIT;
        }
        return SpecialScriptsContainingSequenceStatus.MOVE_TO_PREVIOUS_TEXT_RENDERER_CONTAINING_SPECIAL_SCRIPTS;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static float getCurWidthRelayoutedTextSequenceDecrement(int childPos, int newChildPos, Map<Integer, LayoutResult> textRendererLayoutResults) {
        float decrement = 0.0f;
        if (childPos != newChildPos) {
            for (int i = childPos - 1; i >= newChildPos; i--) {
                if (textRendererLayoutResults.get(Integer.valueOf(i)) != null) {
                    decrement += textRendererLayoutResults.get(Integer.valueOf(i)).getOccupiedArea().getBBox().getWidth();
                }
            }
        }
        return decrement;
    }

    private static void updateMinMaxWidthOfLineRendererAfterTextRendererSequenceProcessing(boolean noSoftWrap, int childPos, LayoutResult layoutResult, AbstractWidthHandler widthHandler, MinMaxWidthOfTextRendererSequenceHelper minMaxWidthOfTextRendererSequenceHelper, Map<Integer, LayoutResult> textRendererLayoutResults) {
        if (noSoftWrap) {
            return;
        }
        TextLayoutResult currLayoutResult = (TextLayoutResult) layoutResult;
        float leftMinWidthCurrRenderer = currLayoutResult.getLeftMinWidth();
        float generalMinWidthCurrRenderer = currLayoutResult.getMinMaxWidth().getMinWidth();
        float widthOfUnbreakableChunkSplitAcrossRenderers = leftMinWidthCurrRenderer;
        float minWidthOfTextRendererSequence = generalMinWidthCurrRenderer;
        for (int prevRendererIndex = childPos - 1; prevRendererIndex >= 0; prevRendererIndex--) {
            if (textRendererLayoutResults.get(Integer.valueOf(prevRendererIndex)) != null) {
                TextLayoutResult prevLayoutResult = (TextLayoutResult) textRendererLayoutResults.get(Integer.valueOf(prevRendererIndex));
                float leftMinWidthPrevRenderer = prevLayoutResult.getLeftMinWidth();
                float generalMinWidthPrevRenderer = prevLayoutResult.getMinMaxWidth().getMinWidth();
                float rightMinWidthPrevRenderer = prevLayoutResult.getRightMinWidth();
                minWidthOfTextRendererSequence = Math.max(minWidthOfTextRendererSequence, generalMinWidthPrevRenderer);
                if (!prevLayoutResult.isEndsWithSplitCharacter() && !currLayoutResult.isStartsWithSplitCharacterWhiteSpace()) {
                    if (rightMinWidthPrevRenderer > -1.0f) {
                        widthOfUnbreakableChunkSplitAcrossRenderers += rightMinWidthPrevRenderer;
                    } else {
                        widthOfUnbreakableChunkSplitAcrossRenderers += leftMinWidthPrevRenderer;
                    }
                    minWidthOfTextRendererSequence = Math.max(minWidthOfTextRendererSequence, widthOfUnbreakableChunkSplitAcrossRenderers);
                    if (rightMinWidthPrevRenderer > -1.0f) {
                        widthOfUnbreakableChunkSplitAcrossRenderers = leftMinWidthPrevRenderer;
                    }
                } else {
                    widthOfUnbreakableChunkSplitAcrossRenderers = leftMinWidthPrevRenderer;
                }
                currLayoutResult = prevLayoutResult;
            }
        }
        if (!minMaxWidthOfTextRendererSequenceHelper.anythingPlacedBeforeTextRendererSequence) {
            minWidthOfTextRendererSequence = Math.max(minWidthOfTextRendererSequence, widthOfUnbreakableChunkSplitAcrossRenderers + minMaxWidthOfTextRendererSequenceHelper.textIndent);
        }
        float lineMinWidth = Math.max(minWidthOfTextRendererSequence, minMaxWidthOfTextRendererSequenceHelper.minWidthPreSequence);
        widthHandler.minMaxWidth.setChildrenMinWidth(lineMinWidth);
    }

    private static List<Integer> convertPossibleBreakPointsToGlyphLineBased(List<Integer> possibleBreakPoints, List<Integer> amountOfChars, List<Integer> indices) {
        if (possibleBreakPoints.isEmpty()) {
            possibleBreakPoints.add(-1);
            return possibleBreakPoints;
        }
        List<Integer> glyphLineBased = new ArrayList<>();
        for (Integer num : possibleBreakPoints) {
            int j = num.intValue();
            int found = TextRenderer.findPossibleBreaksSplitPosition(amountOfChars, j, true);
            if (found >= 0) {
                glyphLineBased.add(indices.get(found));
            }
        }
        return glyphLineBased;
    }

    private static void fillActualTextChunkRelatedLists(GlyphLine glyphLine, List<Integer> amountOfCharsBetweenTextStartAndActualTextChunk, List<Integer> glyphLineBasedIndicesOfActualTextChunkEnds) {
        ActualTextIterator actualTextIterator = new ActualTextIterator(glyphLine);
        int amountOfCharsBetweenTextStartAndCurrentActualTextStartOrGlyph = 0;
        while (actualTextIterator.hasNext()) {
            GlyphLine.GlyphLinePart part = actualTextIterator.next();
            if (part.actualText != null) {
                int amountOfCharsWithinCurrentActualTextOrGlyph = part.actualText.length();
                int nextAmountOfChars = amountOfCharsWithinCurrentActualTextOrGlyph + amountOfCharsBetweenTextStartAndCurrentActualTextStartOrGlyph;
                amountOfCharsBetweenTextStartAndActualTextChunk.add(Integer.valueOf(nextAmountOfChars));
                glyphLineBasedIndicesOfActualTextChunkEnds.add(Integer.valueOf(part.end));
                amountOfCharsBetweenTextStartAndCurrentActualTextStartOrGlyph = nextAmountOfChars;
            } else {
                for (int j = part.start; j < part.end; j++) {
                    char[] chars = glyphLine.get(j).getChars();
                    int amountOfCharsWithinCurrentActualTextOrGlyph2 = chars != null ? chars.length : 0;
                    int nextAmountOfChars2 = amountOfCharsWithinCurrentActualTextOrGlyph2 + amountOfCharsBetweenTextStartAndCurrentActualTextStartOrGlyph;
                    amountOfCharsBetweenTextStartAndActualTextChunk.add(Integer.valueOf(nextAmountOfChars2));
                    glyphLineBasedIndicesOfActualTextChunkEnds.add(Integer.valueOf(j + 1));
                    amountOfCharsBetweenTextStartAndCurrentActualTextStartOrGlyph = nextAmountOfChars2;
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes12.dex */
    public static class MinMaxWidthOfTextRendererSequenceHelper {
        public boolean anythingPlacedBeforeTextRendererSequence;
        public float minWidthPreSequence;
        public float textIndent;

        public MinMaxWidthOfTextRendererSequenceHelper(float minWidthPreSequence, float textIndent, boolean anythingPlacedBeforeTextRendererSequence) {
            this.minWidthPreSequence = minWidthPreSequence;
            this.textIndent = textIndent;
            this.anythingPlacedBeforeTextRendererSequence = anythingPlacedBeforeTextRendererSequence;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes12.dex */
    public static class LastFittingChildRendererData {
        public int childIndex;
        public LayoutResult childLayoutResult;

        public LastFittingChildRendererData(int childIndex, LayoutResult childLayoutResult) {
            this.childIndex = childIndex;
            this.childLayoutResult = childLayoutResult;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes12.dex */
    public static class SpecialScriptsContainingTextRendererSequenceInfo {
        List<Integer> indicesOfFloating;
        public int numberOfSequentialTextRenderers;
        public String sequentialTextContent;

        public SpecialScriptsContainingTextRendererSequenceInfo(int numberOfSequentialTextRenderers, String sequentialTextContent, List<Integer> indicesOfFloating) {
            this.numberOfSequentialTextRenderers = numberOfSequentialTextRenderers;
            this.sequentialTextContent = sequentialTextContent;
            this.indicesOfFloating = indicesOfFloating;
        }
    }
}
