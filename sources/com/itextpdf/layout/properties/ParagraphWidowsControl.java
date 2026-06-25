package com.itextpdf.layout.properties;

import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.layout.renderer.ParagraphRenderer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class ParagraphWidowsControl {
    private int maxLinesToMove;
    private int minWidows;
    private boolean overflowOnWidowsViolation;

    public ParagraphWidowsControl(int minWidows, int maxLinesToMove, boolean overflowParagraphOnViolation) {
        this.minWidows = minWidows;
        this.maxLinesToMove = maxLinesToMove;
        this.overflowOnWidowsViolation = overflowParagraphOnViolation;
    }

    public ParagraphWidowsControl setMinAllowedWidows(int minWidows, int maxLinesToMove, boolean overflowParagraphOnViolation) {
        this.minWidows = minWidows;
        this.maxLinesToMove = maxLinesToMove;
        this.overflowOnWidowsViolation = overflowParagraphOnViolation;
        return this;
    }

    public int getMinWidows() {
        return this.minWidows;
    }

    public int getMaxLinesToMove() {
        return this.maxLinesToMove;
    }

    public boolean isOverflowOnWidowsViolation() {
        return this.overflowOnWidowsViolation;
    }

    public void handleViolatedWidows(ParagraphRenderer widowsRenderer, String message) {
        Logger logger = LoggerFactory.getLogger(ParagraphWidowsControl.class);
        if (widowsRenderer.getOccupiedArea() != null && widowsRenderer.getLines() != null) {
            int pageNumber = widowsRenderer.getOccupiedArea().getPageNumber();
            String warnText = MessageFormatUtil.format(IoLogMessageConstant.WIDOWS_CONSTRAINT_VIOLATED, Integer.valueOf(pageNumber), Integer.valueOf(this.minWidows), Integer.valueOf(widowsRenderer.getLines().size()), message);
            logger.warn(warnText);
            return;
        }
        logger.warn(IoLogMessageConstant.PREMATURE_CALL_OF_HANDLE_VIOLATION_METHOD);
    }
}
