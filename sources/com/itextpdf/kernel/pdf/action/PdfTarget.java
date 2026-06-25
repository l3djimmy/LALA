package com.itextpdf.kernel.pdf.action;

import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfNameTree;
import com.itextpdf.kernel.pdf.PdfNumber;
import com.itextpdf.kernel.pdf.PdfObject;
import com.itextpdf.kernel.pdf.PdfObjectWrapper;
import com.itextpdf.kernel.pdf.PdfPage;
import com.itextpdf.kernel.pdf.PdfString;
import com.itextpdf.kernel.pdf.annot.PdfAnnotation;
import com.itextpdf.kernel.pdf.annot.PdfFileAttachmentAnnotation;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class PdfTarget extends PdfObjectWrapper<PdfDictionary> {
    private PdfTarget(PdfDictionary pdfObject) {
        super(pdfObject);
    }

    public static PdfTarget create(PdfDictionary pdfObject) {
        return new PdfTarget(pdfObject);
    }

    private static PdfTarget create(PdfName r) {
        PdfTarget pdfTarget = new PdfTarget(new PdfDictionary());
        pdfTarget.put(PdfName.R, r);
        return pdfTarget;
    }

    public static PdfTarget createParentTarget() {
        return create(PdfName.P);
    }

    public static PdfTarget createChildTarget() {
        return create(PdfName.C);
    }

    public static PdfTarget createChildTarget(String embeddedFileName) {
        return create(PdfName.C).put(PdfName.N, new PdfString(embeddedFileName));
    }

    public static PdfTarget createChildTarget(String namedDestination, String annotationIdentifier) {
        return create(PdfName.C).put(PdfName.P, new PdfString(namedDestination)).put(PdfName.A, new PdfString(annotationIdentifier));
    }

    public static PdfTarget createChildTarget(int pageNumber, int annotationIndex) {
        return create(PdfName.C).put(PdfName.P, new PdfNumber(pageNumber - 1)).put(PdfName.A, new PdfNumber(annotationIndex));
    }

    public PdfTarget setName(String name) {
        return put(PdfName.N, new PdfString(name));
    }

    public String getName() {
        return getPdfObject().getAsString(PdfName.N).toString();
    }

    public PdfTarget setAnnotation(PdfFileAttachmentAnnotation pdfAnnotation, PdfDocument pdfDocument) {
        PdfPage page = pdfAnnotation.getPage();
        if (page == null) {
            throw new PdfException(KernelExceptionMessageConstant.ANNOTATION_SHALL_HAVE_REFERENCE_TO_PAGE);
        }
        put(PdfName.P, new PdfNumber(pdfDocument.getPageNumber(page) - 1));
        int indexOfAnnotation = -1;
        List<PdfAnnotation> annots = page.getAnnotations();
        int i = 0;
        while (true) {
            if (i < annots.size()) {
                if (annots.get(i) == null || !pdfAnnotation.getPdfObject().equals(annots.get(i).getPdfObject())) {
                    i++;
                } else {
                    indexOfAnnotation = i;
                    break;
                }
            } else {
                break;
            }
        }
        put(PdfName.A, new PdfNumber(indexOfAnnotation));
        return this;
    }

    public PdfFileAttachmentAnnotation getAnnotation(PdfDocument pdfDocument) {
        PdfObject pValue = getPdfObject().get(PdfName.P);
        PdfPage page = null;
        if (pValue instanceof PdfNumber) {
            page = pdfDocument.getPage(((PdfNumber) pValue).intValue() + 1);
        } else if (pValue instanceof PdfString) {
            PdfNameTree destsTree = pdfDocument.getCatalog().getNameTree(PdfName.Dests);
            Map<PdfString, PdfObject> dests = destsTree.getNames();
            PdfArray pdfArray = (PdfArray) dests.get((PdfString) pValue);
            if (pdfArray != null) {
                page = pdfArray.get(0) instanceof PdfNumber ? pdfDocument.getPage(((PdfNumber) pdfArray.get(0)).intValue()) : pdfDocument.getPage((PdfDictionary) pdfArray.get(0));
            }
        }
        List<PdfAnnotation> pageAnnotations = null;
        if (page != null) {
            pageAnnotations = page.getAnnotations();
        }
        PdfObject aValue = getPdfObject().get(PdfName.A);
        PdfFileAttachmentAnnotation resultAnnotation = null;
        if (pageAnnotations != null) {
            if (aValue instanceof PdfNumber) {
                resultAnnotation = (PdfFileAttachmentAnnotation) pageAnnotations.get(((PdfNumber) aValue).intValue());
            } else if (aValue instanceof PdfString) {
                Iterator<PdfAnnotation> it = pageAnnotations.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    PdfAnnotation annotation = it.next();
                    if (aValue.equals(annotation.getName())) {
                        resultAnnotation = (PdfFileAttachmentAnnotation) annotation;
                        break;
                    }
                }
            }
        }
        if (resultAnnotation == null) {
            Logger logger = LoggerFactory.getLogger(PdfTarget.class);
            logger.error(IoLogMessageConstant.SOME_TARGET_FIELDS_ARE_NOT_SET_OR_INCORRECT);
        }
        return resultAnnotation;
    }

    public PdfTarget setTarget(PdfTarget target) {
        return put(PdfName.T, target.getPdfObject());
    }

    public PdfTarget getTarget() {
        PdfDictionary targetDictObject = getPdfObject().getAsDictionary(PdfName.T);
        if (targetDictObject != null) {
            return new PdfTarget(targetDictObject);
        }
        return null;
    }

    public PdfTarget put(PdfName key, PdfObject value) {
        getPdfObject().put(key, value);
        return this;
    }

    @Override // com.itextpdf.kernel.pdf.PdfObjectWrapper
    protected boolean isWrappedObjectMustBeIndirect() {
        return false;
    }
}
