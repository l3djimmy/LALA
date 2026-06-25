package com.itextpdf.layout.properties;

import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.layout.renderer.ParagraphRenderer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class ParagraphOrphansControl {
    private int minOrphans;

    public ParagraphOrphansControl(int minOrphans) {
        this.minOrphans = minOrphans;
    }

    public ParagraphOrphansControl setMinAllowedOrphans(int minOrphans) {
        this.minOrphans = minOrphans;
        return this;
    }

    public int getMinOrphans() {
        return this.minOrphans;
    }

    public void handleViolatedOrphans(ParagraphRenderer renderer, String message) {
        Logger logger = LoggerFactory.getLogger(ParagraphOrphansControl.class);
        if (renderer.getOccupiedArea() != null && renderer.getLines() != null) {
            int pageNumber = renderer.getOccupiedArea().getPageNumber();
            String warnText = MessageFormatUtil.format(IoLogMessageConstant.ORPHANS_CONSTRAINT_VIOLATED, Integer.valueOf(pageNumber), Integer.valueOf(this.minOrphans), Integer.valueOf(renderer.getLines().size()), message);
            logger.warn(warnText);
            return;
        }
        logger.warn(IoLogMessageConstant.PREMATURE_CALL_OF_HANDLE_VIOLATION_METHOD);
    }
}
