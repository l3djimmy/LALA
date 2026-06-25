package com.itextpdf.kernel.pdf.canvas.parser.data;

import com.itextpdf.kernel.geom.Matrix;
import com.itextpdf.kernel.geom.Vector;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfStream;
import com.itextpdf.kernel.pdf.canvas.CanvasGraphicsState;
import com.itextpdf.kernel.pdf.canvas.CanvasTag;
import com.itextpdf.kernel.pdf.xobject.PdfImageXObject;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Stack;
/* loaded from: classes12.dex */
public class ImageRenderInfo extends AbstractRenderInfo {
    private final List<CanvasTag> canvasTagHierarchy;
    private final PdfDictionary colorSpaceDictionary;
    private final Matrix ctm;
    private final PdfImageXObject image;
    private final boolean isInline;
    private final PdfName resourceName;

    public ImageRenderInfo(Stack<CanvasTag> canvasTagHierarchy, CanvasGraphicsState gs, Matrix ctm, PdfStream imageStream, PdfName resourceName, PdfDictionary colorSpaceDictionary, boolean isInline) {
        super(gs);
        this.canvasTagHierarchy = Collections.unmodifiableList(new ArrayList(canvasTagHierarchy));
        this.resourceName = resourceName;
        this.ctm = ctm;
        this.image = new PdfImageXObject(imageStream);
        this.colorSpaceDictionary = colorSpaceDictionary;
        this.isInline = isInline;
    }

    public PdfImageXObject getImage() {
        return this.image;
    }

    public PdfName getImageResourceName() {
        return this.resourceName;
    }

    public Vector getStartPoint() {
        return new Vector(0.0f, 0.0f, 1.0f).cross(this.ctm);
    }

    public Matrix getImageCtm() {
        return this.ctm;
    }

    public float getArea() {
        return this.ctm.getDeterminant();
    }

    public boolean isInline() {
        return this.isInline;
    }

    public PdfDictionary getColorSpaceDictionary() {
        return this.colorSpaceDictionary;
    }

    public List<CanvasTag> getCanvasTagHierarchy() {
        return this.canvasTagHierarchy;
    }

    public int getMcid() {
        for (CanvasTag tag : this.canvasTagHierarchy) {
            if (tag.hasMcid()) {
                return tag.getMcid();
            }
        }
        return -1;
    }

    public boolean hasMcid(int mcid) {
        return hasMcid(mcid, false);
    }

    public boolean hasMcid(int mcid, boolean checkTheTopmostLevelOnly) {
        List<CanvasTag> list = this.canvasTagHierarchy;
        if (checkTheTopmostLevelOnly) {
            if (list != null) {
                int infoMcid = getMcid();
                return infoMcid != -1 && infoMcid == mcid;
            }
        } else {
            for (CanvasTag tag : list) {
                if (tag.hasMcid() && tag.getMcid() == mcid) {
                    return true;
                }
            }
        }
        return false;
    }
}
