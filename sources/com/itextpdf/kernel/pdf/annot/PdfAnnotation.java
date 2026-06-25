package com.itextpdf.kernel.pdf.annot;

import com.itextpdf.io.font.PdfEncodings;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.colors.Color;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.PdfAnnotationBorder;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfIndirectReference;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfNumber;
import com.itextpdf.kernel.pdf.PdfObject;
import com.itextpdf.kernel.pdf.PdfObjectWrapper;
import com.itextpdf.kernel.pdf.PdfPage;
import com.itextpdf.kernel.pdf.PdfString;
import com.itextpdf.kernel.pdf.filespec.PdfFileSpec;
import com.itextpdf.kernel.pdf.layer.IPdfOCG;
import java.util.Iterator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public abstract class PdfAnnotation extends PdfObjectWrapper<PdfDictionary> {
    public static final int HIDDEN = 2;
    public static final int INVISIBLE = 1;
    public static final int LOCKED = 128;
    public static final int LOCKED_CONTENTS = 512;
    public static final int NO_ROTATE = 16;
    public static final int NO_VIEW = 32;
    public static final int NO_ZOOM = 8;
    public static final int PRINT = 4;
    public static final int READ_ONLY = 64;
    public static final int TOGGLE_NO_VIEW = 256;
    protected PdfPage page;
    public static final PdfName HIGHLIGHT_NONE = PdfName.N;
    public static final PdfName HIGHLIGHT_INVERT = PdfName.I;
    public static final PdfName HIGHLIGHT_OUTLINE = PdfName.O;
    public static final PdfName HIGHLIGHT_PUSH = PdfName.P;
    public static final PdfName HIGHLIGHT_TOGGLE = PdfName.T;
    public static final PdfName STYLE_SOLID = PdfName.S;
    public static final PdfName STYLE_DASHED = PdfName.D;
    public static final PdfName STYLE_BEVELED = PdfName.B;
    public static final PdfName STYLE_INSET = PdfName.I;
    public static final PdfName STYLE_UNDERLINE = PdfName.U;
    public static final PdfString Marked = new PdfString("Marked");
    public static final PdfString Unmarked = new PdfString("Unmarked");
    public static final PdfString Accepted = new PdfString("Accepted");
    public static final PdfString Rejected = new PdfString("Rejected");
    public static final PdfString Canceled = new PdfString("Cancelled");
    public static final PdfString Completed = new PdfString("Completed");
    public static final PdfString None = new PdfString("None");
    public static final PdfString MarkedModel = new PdfString("Marked");
    public static final PdfString ReviewModel = new PdfString("Review");

    public abstract PdfName getSubtype();

    public static PdfAnnotation makeAnnotation(PdfObject pdfObject) {
        if (pdfObject.isIndirectReference()) {
            pdfObject = ((PdfIndirectReference) pdfObject).getRefersTo();
        }
        if (!pdfObject.isDictionary()) {
            return null;
        }
        PdfDictionary dictionary = (PdfDictionary) pdfObject;
        PdfName subtype = dictionary.getAsName(PdfName.Subtype);
        if (PdfName.Link.equals(subtype)) {
            PdfAnnotation annotation = new PdfLinkAnnotation((PdfDictionary) pdfObject);
            return annotation;
        } else if (PdfName.Popup.equals(subtype)) {
            PdfAnnotation annotation2 = new PdfPopupAnnotation((PdfDictionary) pdfObject);
            return annotation2;
        } else if (PdfName.Widget.equals(subtype)) {
            PdfAnnotation annotation3 = new PdfWidgetAnnotation((PdfDictionary) pdfObject);
            return annotation3;
        } else if (PdfName.Screen.equals(subtype)) {
            PdfAnnotation annotation4 = new PdfScreenAnnotation((PdfDictionary) pdfObject);
            return annotation4;
        } else if (PdfName._3D.equals(subtype)) {
            PdfAnnotation annotation5 = new Pdf3DAnnotation((PdfDictionary) pdfObject);
            return annotation5;
        } else if (PdfName.Highlight.equals(subtype) || PdfName.Underline.equals(subtype) || PdfName.Squiggly.equals(subtype) || PdfName.StrikeOut.equals(subtype)) {
            PdfAnnotation annotation6 = new PdfTextMarkupAnnotation((PdfDictionary) pdfObject);
            return annotation6;
        } else if (PdfName.Caret.equals(subtype)) {
            PdfAnnotation annotation7 = new PdfCaretAnnotation((PdfDictionary) pdfObject);
            return annotation7;
        } else if (PdfName.Text.equals(subtype)) {
            PdfAnnotation annotation8 = new PdfTextAnnotation((PdfDictionary) pdfObject);
            return annotation8;
        } else if (PdfName.Sound.equals(subtype)) {
            PdfAnnotation annotation9 = new PdfSoundAnnotation((PdfDictionary) pdfObject);
            return annotation9;
        } else if (PdfName.Stamp.equals(subtype)) {
            PdfAnnotation annotation10 = new PdfStampAnnotation((PdfDictionary) pdfObject);
            return annotation10;
        } else if (PdfName.FileAttachment.equals(subtype)) {
            PdfAnnotation annotation11 = new PdfFileAttachmentAnnotation((PdfDictionary) pdfObject);
            return annotation11;
        } else if (PdfName.Ink.equals(subtype)) {
            PdfAnnotation annotation12 = new PdfInkAnnotation((PdfDictionary) pdfObject);
            return annotation12;
        } else if (PdfName.PrinterMark.equals(subtype)) {
            PdfAnnotation annotation13 = new PdfPrinterMarkAnnotation((PdfDictionary) pdfObject);
            return annotation13;
        } else if (PdfName.TrapNet.equals(subtype)) {
            PdfAnnotation annotation14 = new PdfTrapNetworkAnnotation((PdfDictionary) pdfObject);
            return annotation14;
        } else if (PdfName.FreeText.equals(subtype)) {
            PdfAnnotation annotation15 = new PdfFreeTextAnnotation((PdfDictionary) pdfObject);
            return annotation15;
        } else if (PdfName.Square.equals(subtype)) {
            PdfAnnotation annotation16 = new PdfSquareAnnotation((PdfDictionary) pdfObject);
            return annotation16;
        } else if (PdfName.Circle.equals(subtype)) {
            PdfAnnotation annotation17 = new PdfCircleAnnotation((PdfDictionary) pdfObject);
            return annotation17;
        } else if (PdfName.Line.equals(subtype)) {
            PdfAnnotation annotation18 = new PdfLineAnnotation((PdfDictionary) pdfObject);
            return annotation18;
        } else if (PdfName.Polygon.equals(subtype)) {
            PdfAnnotation annotation19 = new PdfPolygonAnnotation((PdfDictionary) pdfObject);
            return annotation19;
        } else if (PdfName.PolyLine.equals(subtype)) {
            PdfAnnotation annotation20 = new PdfPolylineAnnotation((PdfDictionary) pdfObject);
            return annotation20;
        } else if (PdfName.Redact.equals(subtype)) {
            PdfAnnotation annotation21 = new PdfRedactAnnotation((PdfDictionary) pdfObject);
            return annotation21;
        } else if (PdfName.Watermark.equals(subtype)) {
            PdfAnnotation annotation22 = new PdfWatermarkAnnotation((PdfDictionary) pdfObject);
            return annotation22;
        } else {
            PdfAnnotation annotation23 = new PdfUnknownAnnotation((PdfDictionary) pdfObject);
            return annotation23;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfAnnotation(Rectangle rect) {
        this(new PdfDictionary());
        put(PdfName.Rect, new PdfArray(rect));
        put(PdfName.Subtype, getSubtype());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfAnnotation(PdfDictionary pdfObject) {
        super(pdfObject);
        markObjectAsIndirect(getPdfObject());
    }

    public void setLayer(IPdfOCG layer) {
        getPdfObject().put(PdfName.OC, layer.getIndirectReference());
    }

    public PdfString getContents() {
        return getPdfObject().getAsString(PdfName.Contents);
    }

    public PdfAnnotation setContents(PdfString contents) {
        return put(PdfName.Contents, contents);
    }

    public PdfAnnotation setContents(String contents) {
        return setContents(new PdfString(contents, PdfEncodings.UNICODE_BIG));
    }

    public PdfDictionary getPageObject() {
        return getPdfObject().getAsDictionary(PdfName.P);
    }

    public PdfPage getPage() {
        PdfIndirectReference annotationIndirectReference;
        if (this.page == null && (annotationIndirectReference = getPdfObject().getIndirectReference()) != null) {
            PdfDocument doc = annotationIndirectReference.getDocument();
            PdfDictionary pageDictionary = getPageObject();
            if (pageDictionary != null) {
                this.page = doc.getPage(pageDictionary);
            } else {
                for (int i = 1; i <= doc.getNumberOfPages(); i++) {
                    PdfPage docPage = doc.getPage(i);
                    if (!docPage.isFlushed()) {
                        Iterator<PdfAnnotation> it = docPage.getAnnotations().iterator();
                        while (true) {
                            if (it.hasNext()) {
                                PdfAnnotation annot = it.next();
                                if (annotationIndirectReference.equals(annot.getPdfObject().getIndirectReference())) {
                                    this.page = docPage;
                                    break;
                                }
                            }
                        }
                    }
                }
            }
        }
        return this.page;
    }

    public PdfAnnotation setPage(PdfPage page) {
        this.page = page;
        return put(PdfName.P, page.getPdfObject().getIndirectReference());
    }

    public PdfString getName() {
        return getPdfObject().getAsString(PdfName.NM);
    }

    public PdfAnnotation setName(PdfString name) {
        return put(PdfName.NM, name);
    }

    public PdfString getDate() {
        return getPdfObject().getAsString(PdfName.M);
    }

    public PdfAnnotation setDate(PdfString date) {
        return put(PdfName.M, date);
    }

    public int getFlags() {
        PdfNumber f = getPdfObject().getAsNumber(PdfName.F);
        if (f != null) {
            return f.intValue();
        }
        return 0;
    }

    public PdfAnnotation setFlags(int flags) {
        return put(PdfName.F, new PdfNumber(flags));
    }

    public PdfAnnotation setFlag(int flag) {
        int flags = getFlags();
        return setFlags(flags | flag);
    }

    public PdfAnnotation resetFlag(int flag) {
        int flags = getFlags();
        return setFlags(flags & (~flag));
    }

    public boolean hasFlag(int flag) {
        if (flag == 0) {
            return false;
        }
        if (((flag - 1) & flag) != 0) {
            throw new IllegalArgumentException("Only one flag must be checked at once.");
        }
        int flags = getFlags();
        return (flags & flag) != 0;
    }

    public PdfDictionary getAppearanceDictionary() {
        return getPdfObject().getAsDictionary(PdfName.AP);
    }

    public PdfDictionary getAppearanceObject(PdfName appearanceType) {
        PdfDictionary ap = getAppearanceDictionary();
        if (ap != null) {
            PdfObject apObject = ap.get(appearanceType);
            if (apObject instanceof PdfDictionary) {
                return (PdfDictionary) apObject;
            }
            return null;
        }
        return null;
    }

    public PdfDictionary getNormalAppearanceObject() {
        return getAppearanceObject(PdfName.N);
    }

    public PdfDictionary getRolloverAppearanceObject() {
        return getAppearanceObject(PdfName.R);
    }

    public PdfDictionary getDownAppearanceObject() {
        return getAppearanceObject(PdfName.D);
    }

    public PdfAnnotation setAppearance(PdfName appearanceType, PdfDictionary appearance) {
        PdfDictionary ap = getAppearanceDictionary();
        if (ap == null) {
            ap = new PdfDictionary();
            getPdfObject().put(PdfName.AP, ap);
        }
        ap.put(appearanceType, appearance);
        return this;
    }

    public PdfAnnotation setNormalAppearance(PdfDictionary appearance) {
        return setAppearance(PdfName.N, appearance);
    }

    public PdfAnnotation setRolloverAppearance(PdfDictionary appearance) {
        return setAppearance(PdfName.R, appearance);
    }

    public PdfAnnotation setDownAppearance(PdfDictionary appearance) {
        return setAppearance(PdfName.D, appearance);
    }

    public PdfAnnotation setAppearance(PdfName appearanceType, PdfAnnotationAppearance appearance) {
        return setAppearance(appearanceType, appearance.getPdfObject());
    }

    public PdfAnnotation setNormalAppearance(PdfAnnotationAppearance appearance) {
        return setAppearance(PdfName.N, appearance);
    }

    public PdfAnnotation setRolloverAppearance(PdfAnnotationAppearance appearance) {
        return setAppearance(PdfName.R, appearance);
    }

    public PdfAnnotation setDownAppearance(PdfAnnotationAppearance appearance) {
        return setAppearance(PdfName.D, appearance);
    }

    public PdfName getAppearanceState() {
        return getPdfObject().getAsName(PdfName.AS);
    }

    public PdfAnnotation setAppearanceState(PdfName as) {
        return put(PdfName.AS, as);
    }

    public PdfArray getBorder() {
        return getPdfObject().getAsArray(PdfName.Border);
    }

    public PdfAnnotation setBorder(PdfAnnotationBorder border) {
        return put(PdfName.Border, border.getPdfObject());
    }

    public PdfAnnotation setBorder(PdfArray border) {
        return put(PdfName.Border, border);
    }

    public PdfArray getColorObject() {
        return getPdfObject().getAsArray(PdfName.C);
    }

    public PdfAnnotation setColor(PdfArray color) {
        return put(PdfName.C, color);
    }

    public PdfAnnotation setColor(float[] color) {
        return setColor(new PdfArray(color));
    }

    public PdfAnnotation setColor(Color color) {
        return setColor(new PdfArray(color.getColorValue()));
    }

    public int getStructParentIndex() {
        PdfNumber n = getPdfObject().getAsNumber(PdfName.StructParent);
        if (n == null) {
            return -1;
        }
        return n.intValue();
    }

    public PdfAnnotation setStructParentIndex(int structParentIndex) {
        return put(PdfName.StructParent, new PdfNumber(structParentIndex));
    }

    public PdfAnnotation setTitle(PdfString title) {
        return put(PdfName.T, title);
    }

    public PdfString getTitle() {
        return getPdfObject().getAsString(PdfName.T);
    }

    public PdfAnnotation setRectangle(PdfArray array) {
        return put(PdfName.Rect, array);
    }

    public PdfArray getRectangle() {
        return getPdfObject().getAsArray(PdfName.Rect);
    }

    public String getLang() {
        PdfString lang = getPdfObject().getAsString(PdfName.Lang);
        if (lang != null) {
            return lang.toUnicodeString();
        }
        return null;
    }

    public PdfAnnotation setLang(String lang) {
        return put(PdfName.Lang, new PdfString(lang, PdfEncodings.UNICODE_BIG));
    }

    public PdfName getBlendMode() {
        return getPdfObject().getAsName(PdfName.BM);
    }

    public PdfAnnotation setBlendMode(PdfName blendMode) {
        return put(PdfName.BM, blendMode);
    }

    public float getNonStrokingOpacity() {
        PdfNumber nonStrokingOpacity = getPdfObject().getAsNumber(PdfName.ca);
        if (nonStrokingOpacity != null) {
            return nonStrokingOpacity.floatValue();
        }
        return 1.0f;
    }

    public PdfAnnotation setNonStrokingOpacity(float nonStrokingOpacity) {
        return put(PdfName.ca, new PdfNumber(nonStrokingOpacity));
    }

    public float getStrokingOpacity() {
        PdfNumber strokingOpacity = getPdfObject().getAsNumber(PdfName.CA);
        if (strokingOpacity != null) {
            return strokingOpacity.floatValue();
        }
        return 1.0f;
    }

    public PdfAnnotation setStrokingOpacity(float strokingOpacity) {
        return put(PdfName.CA, new PdfNumber(strokingOpacity));
    }

    public PdfAnnotation put(PdfName key, PdfObject value) {
        getPdfObject().put(key, value);
        setModified();
        return this;
    }

    public PdfAnnotation remove(PdfName key) {
        getPdfObject().remove(key);
        return this;
    }

    public void addAssociatedFile(PdfFileSpec fs) {
        if (((PdfDictionary) fs.getPdfObject()).get(PdfName.AFRelationship) == null) {
            Logger logger = LoggerFactory.getLogger(PdfAnnotation.class);
            logger.error(IoLogMessageConstant.ASSOCIATED_FILE_SPEC_SHALL_INCLUDE_AFRELATIONSHIP);
        }
        PdfArray afArray = ((PdfDictionary) getPdfObject()).getAsArray(PdfName.AF);
        if (afArray == null) {
            afArray = new PdfArray();
            put(PdfName.AF, afArray);
        }
        afArray.add(fs.getPdfObject());
    }

    public PdfArray getAssociatedFiles(boolean create) {
        PdfArray afArray = ((PdfDictionary) getPdfObject()).getAsArray(PdfName.AF);
        if (afArray == null && create) {
            PdfArray afArray2 = new PdfArray();
            put(PdfName.AF, afArray2);
            return afArray2;
        }
        return afArray;
    }

    @Override // com.itextpdf.kernel.pdf.PdfObjectWrapper
    public void flush() {
        super.flush();
    }

    @Override // com.itextpdf.kernel.pdf.PdfObjectWrapper
    protected boolean isWrappedObjectMustBeIndirect() {
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes12.dex */
    public static class PdfUnknownAnnotation extends PdfAnnotation {
        protected PdfUnknownAnnotation(PdfDictionary pdfObject) {
            super(pdfObject);
        }

        @Override // com.itextpdf.kernel.pdf.annot.PdfAnnotation
        public PdfName getSubtype() {
            return getPdfObject().getAsName(PdfName.Subtype);
        }
    }
}
