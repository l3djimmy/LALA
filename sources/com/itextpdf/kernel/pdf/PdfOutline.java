package com.itextpdf.kernel.pdf;

import com.itextpdf.io.font.PdfEncodings;
import com.itextpdf.kernel.colors.Color;
import com.itextpdf.kernel.pdf.action.PdfAction;
import com.itextpdf.kernel.pdf.colorspace.PdfColorSpace;
import com.itextpdf.kernel.pdf.navigation.PdfDestination;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes12.dex */
public class PdfOutline {
    private List<PdfOutline> children;
    private PdfDictionary content;
    private PdfDestination destination;
    private PdfOutline parent;
    private PdfDocument pdfDoc;
    private String title;
    public static int FLAG_ITALIC = 1;
    public static int FLAG_BOLD = 2;

    /* JADX INFO: Access modifiers changed from: package-private */
    public PdfOutline(String title, PdfDictionary content, PdfDocument pdfDocument) {
        this.children = new ArrayList();
        this.title = title;
        this.content = content;
        this.pdfDoc = pdfDocument;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public PdfOutline(String title, PdfDictionary content, PdfOutline parent) {
        this.children = new ArrayList();
        this.title = title;
        this.content = content;
        this.parent = parent;
        this.pdfDoc = parent.pdfDoc;
        content.makeIndirect(parent.pdfDoc);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public PdfOutline(PdfDocument doc) {
        this.children = new ArrayList();
        this.content = new PdfDictionary();
        this.content.put(PdfName.Type, PdfName.Outlines);
        this.pdfDoc = doc;
        this.content.makeIndirect(doc);
        doc.getCatalog().addRootOutline(this);
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
        this.content.put(PdfName.Title, new PdfString(title, PdfEncodings.UNICODE_BIG));
    }

    public void setColor(Color color) {
        this.content.put(PdfName.C, new PdfArray(color.getColorValue()));
    }

    public Color getColor() {
        PdfArray colorArray = this.content.getAsArray(PdfName.C);
        if (colorArray == null) {
            return null;
        }
        return Color.makeColor(PdfColorSpace.makeColorSpace(PdfName.DeviceRGB), colorArray.toFloatArray());
    }

    public void setStyle(int style) {
        if (style == FLAG_BOLD || style == FLAG_ITALIC) {
            this.content.put(PdfName.F, new PdfNumber(style));
        }
    }

    public Integer getStyle() {
        return this.content.getAsInt(PdfName.F);
    }

    public PdfDictionary getContent() {
        return this.content;
    }

    public List<PdfOutline> getAllChildren() {
        return this.children;
    }

    public PdfOutline getParent() {
        return this.parent;
    }

    public PdfDestination getDestination() {
        return this.destination;
    }

    public void addDestination(PdfDestination destination) {
        setDestination(destination);
        this.content.put(PdfName.Dest, destination.getPdfObject());
    }

    public void addAction(PdfAction action) {
        PdfObject destObject;
        PdfName actionType = action.getPdfObject().getAsName(PdfName.S);
        if (PdfName.GoTo.equals(actionType) && (destObject = action.getPdfObject().get(PdfName.D)) != null) {
            setDestination(PdfDestination.makeDestination(destObject));
        }
        this.content.put(PdfName.A, action.getPdfObject());
    }

    public void setOpen(boolean open) {
        if (!open) {
            this.content.put(PdfName.Count, new PdfNumber(-1));
            return;
        }
        int size = this.children.size();
        PdfDictionary pdfDictionary = this.content;
        if (size > 0) {
            pdfDictionary.put(PdfName.Count, new PdfNumber(this.children.size()));
        } else {
            pdfDictionary.remove(PdfName.Count);
        }
    }

    public boolean isOpen() {
        Integer count = this.content.getAsInt(PdfName.Count);
        return count == null || count.intValue() >= 0;
    }

    public PdfOutline addOutline(String title, int position) {
        if (position == -1) {
            position = this.children.size();
        }
        PdfDictionary dictionary = new PdfDictionary();
        PdfOutline outline = new PdfOutline(title, dictionary, this);
        dictionary.put(PdfName.Title, new PdfString(title, PdfEncodings.UNICODE_BIG));
        dictionary.put(PdfName.Parent, this.content);
        if (this.children.size() > 0) {
            if (position != 0) {
                PdfDictionary prevContent = this.children.get(position - 1).getContent();
                dictionary.put(PdfName.Prev, prevContent);
                prevContent.put(PdfName.Next, dictionary);
            }
            if (position != this.children.size()) {
                PdfDictionary nextContent = this.children.get(position).getContent();
                dictionary.put(PdfName.Next, nextContent);
                nextContent.put(PdfName.Prev, dictionary);
            }
        }
        if (position == 0) {
            this.content.put(PdfName.First, dictionary);
        }
        if (position == this.children.size()) {
            this.content.put(PdfName.Last, dictionary);
        }
        PdfNumber count = this.content.getAsNumber(PdfName.Count);
        if (count == null || count.getValue() != -1.0d) {
            this.content.put(PdfName.Count, new PdfNumber(this.children.size() + 1));
        }
        this.children.add(position, outline);
        return outline;
    }

    public PdfOutline addOutline(String title) {
        return addOutline(title, -1);
    }

    public PdfOutline addOutline(PdfOutline outline) {
        PdfOutline newOutline = addOutline(outline.getTitle());
        newOutline.addDestination(outline.getDestination());
        List<PdfOutline> children = outline.getAllChildren();
        for (PdfOutline child : children) {
            newOutline.addOutline(child);
        }
        return newOutline;
    }

    public void removeOutline() {
        if (!this.pdfDoc.hasOutlines() || isOutlineRoot()) {
            this.pdfDoc.getCatalog().remove(PdfName.Outlines);
            return;
        }
        PdfOutline parent = this.parent;
        List<PdfOutline> children = parent.children;
        children.remove(this);
        PdfDictionary parentContent = parent.content;
        if (children.size() > 0) {
            parentContent.put(PdfName.First, children.get(0).content);
            parentContent.put(PdfName.Last, children.get(children.size() - 1).content);
            PdfDictionary next = this.content.getAsDictionary(PdfName.Next);
            PdfDictionary prev = this.content.getAsDictionary(PdfName.Prev);
            if (prev != null) {
                if (next != null) {
                    prev.put(PdfName.Next, next);
                    next.put(PdfName.Prev, prev);
                    return;
                }
                prev.remove(PdfName.Next);
                return;
            } else if (next != null) {
                next.remove(PdfName.Prev);
                return;
            } else {
                return;
            }
        }
        parent.removeOutline();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void clear() {
        this.children.clear();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setDestination(PdfDestination destination) {
        this.destination = destination;
    }

    private PdfDictionary getOutlineRoot() {
        if (!this.pdfDoc.hasOutlines()) {
            return null;
        }
        return this.pdfDoc.getCatalog().getPdfObject().getAsDictionary(PdfName.Outlines);
    }

    private boolean isOutlineRoot() {
        PdfDictionary outlineRoot = getOutlineRoot();
        return outlineRoot == this.content;
    }
}
