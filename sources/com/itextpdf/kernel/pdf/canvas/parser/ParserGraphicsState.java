package com.itextpdf.kernel.pdf.canvas.parser;

import com.itextpdf.kernel.geom.Matrix;
import com.itextpdf.kernel.geom.Path;
import com.itextpdf.kernel.geom.ShapeTransformUtil;
import com.itextpdf.kernel.pdf.canvas.CanvasGraphicsState;
import com.itextpdf.kernel.pdf.canvas.parser.clipper.ClipperBridge;
import com.itextpdf.kernel.pdf.canvas.parser.clipper.DefaultClipper;
import com.itextpdf.kernel.pdf.canvas.parser.clipper.IClipper;
import com.itextpdf.kernel.pdf.canvas.parser.clipper.PolyTree;
/* loaded from: classes12.dex */
public class ParserGraphicsState extends CanvasGraphicsState {
    private Path clippingPath;

    /* JADX INFO: Access modifiers changed from: package-private */
    public ParserGraphicsState() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public ParserGraphicsState(ParserGraphicsState source) {
        super(source);
        if (source.clippingPath != null) {
            this.clippingPath = new Path(source.clippingPath);
        }
    }

    @Override // com.itextpdf.kernel.pdf.canvas.CanvasGraphicsState
    public void updateCtm(Matrix newCtm) {
        super.updateCtm(newCtm);
        if (this.clippingPath != null) {
            transformClippingPath(newCtm);
        }
    }

    public void clip(Path path, int fillingRule) {
        if (this.clippingPath == null || this.clippingPath.isEmpty()) {
            return;
        }
        Path pathCopy = new Path(path);
        pathCopy.closeAllSubpaths();
        IClipper clipper = new DefaultClipper();
        ClipperBridge.addPath(clipper, this.clippingPath, IClipper.PolyType.SUBJECT);
        ClipperBridge.addPath(clipper, pathCopy, IClipper.PolyType.CLIP);
        PolyTree resultTree = new PolyTree();
        clipper.execute(IClipper.ClipType.INTERSECTION, resultTree, IClipper.PolyFillType.NON_ZERO, ClipperBridge.getFillType(fillingRule));
        this.clippingPath = ClipperBridge.convertToPath(resultTree);
    }

    public Path getClippingPath() {
        return this.clippingPath;
    }

    public void setClippingPath(Path clippingPath) {
        Path pathCopy = new Path(clippingPath);
        pathCopy.closeAllSubpaths();
        this.clippingPath = pathCopy;
    }

    private void transformClippingPath(Matrix newCtm) {
        this.clippingPath = ShapeTransformUtil.transformPath(this.clippingPath, newCtm);
    }
}
