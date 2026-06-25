package com.itextpdf.kernel.pdf.canvas.parser.data;

import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.pdf.canvas.CanvasGraphicsState;
/* loaded from: classes12.dex */
public class AbstractRenderInfo implements IEventData {
    private boolean graphicsStateIsPreserved;
    protected CanvasGraphicsState gs;

    public AbstractRenderInfo(CanvasGraphicsState gs) {
        this.gs = gs;
    }

    @Override // com.itextpdf.kernel.pdf.canvas.parser.data.IEventData
    public CanvasGraphicsState getGraphicsState() {
        checkGraphicsState();
        return this.graphicsStateIsPreserved ? this.gs : new CanvasGraphicsState(this.gs);
    }

    public boolean isGraphicsStatePreserved() {
        return this.graphicsStateIsPreserved;
    }

    public void preserveGraphicsState() {
        checkGraphicsState();
        this.graphicsStateIsPreserved = true;
        this.gs = new CanvasGraphicsState(this.gs);
    }

    public void releaseGraphicsState() {
        if (!this.graphicsStateIsPreserved) {
            this.gs = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void checkGraphicsState() {
        if (this.gs == null) {
            throw new IllegalStateException(IoLogMessageConstant.GRAPHICS_STATE_WAS_DELETED);
        }
    }
}
