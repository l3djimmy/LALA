package com.itextpdf.kernel.pdf.xobject;

import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfObjectWrapper;
import com.itextpdf.kernel.pdf.PdfStream;
import com.itextpdf.kernel.pdf.filespec.PdfFileSpec;
import com.itextpdf.kernel.pdf.layer.IPdfOCG;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public abstract class PdfXObject extends PdfObjectWrapper<PdfStream> {
    /* JADX INFO: Access modifiers changed from: protected */
    public PdfXObject(PdfStream pdfObject) {
        super(pdfObject);
    }

    public static PdfXObject makeXObject(PdfStream stream) {
        if (PdfName.Form.equals(stream.getAsName(PdfName.Subtype))) {
            return new PdfFormXObject(stream);
        }
        if (PdfName.Image.equals(stream.getAsName(PdfName.Subtype))) {
            return new PdfImageXObject(stream);
        }
        throw new UnsupportedOperationException(KernelExceptionMessageConstant.UNSUPPORTED_XOBJECT_TYPE);
    }

    public static Rectangle calculateProportionallyFitRectangleWithWidth(PdfXObject xObject, float x, float y, float width) {
        if (xObject instanceof PdfFormXObject) {
            PdfFormXObject formXObject = (PdfFormXObject) xObject;
            Rectangle bBox = PdfFormXObject.calculateBBoxMultipliedByMatrix(formXObject);
            return new Rectangle(x, y, width, (width / bBox.getWidth()) * bBox.getHeight());
        } else if (xObject instanceof PdfImageXObject) {
            PdfImageXObject imageXObject = (PdfImageXObject) xObject;
            return new Rectangle(x, y, width, (width / imageXObject.getWidth()) * imageXObject.getHeight());
        } else {
            throw new IllegalArgumentException("PdfFormXObject or PdfImageXObject expected.");
        }
    }

    public static Rectangle calculateProportionallyFitRectangleWithHeight(PdfXObject xObject, float x, float y, float height) {
        if (xObject instanceof PdfFormXObject) {
            PdfFormXObject formXObject = (PdfFormXObject) xObject;
            Rectangle bBox = PdfFormXObject.calculateBBoxMultipliedByMatrix(formXObject);
            return new Rectangle(x, y, (height / bBox.getHeight()) * bBox.getWidth(), height);
        } else if (xObject instanceof PdfImageXObject) {
            PdfImageXObject imageXObject = (PdfImageXObject) xObject;
            return new Rectangle(x, y, (height / imageXObject.getHeight()) * imageXObject.getWidth(), height);
        } else {
            throw new IllegalArgumentException("PdfFormXObject or PdfImageXObject expected.");
        }
    }

    public void setLayer(IPdfOCG layer) {
        getPdfObject().put(PdfName.OC, layer.getIndirectReference());
    }

    public float getWidth() {
        throw new UnsupportedOperationException();
    }

    public float getHeight() {
        throw new UnsupportedOperationException();
    }

    public void addAssociatedFile(PdfFileSpec fs) {
        if (((PdfDictionary) fs.getPdfObject()).get(PdfName.AFRelationship) == null) {
            Logger logger = LoggerFactory.getLogger(PdfXObject.class);
            logger.error(IoLogMessageConstant.ASSOCIATED_FILE_SPEC_SHALL_INCLUDE_AFRELATIONSHIP);
        }
        PdfArray afArray = getPdfObject().getAsArray(PdfName.AF);
        if (afArray == null) {
            afArray = new PdfArray();
            getPdfObject().put(PdfName.AF, afArray);
        }
        afArray.add(fs.getPdfObject());
    }

    public PdfArray getAssociatedFiles(boolean create) {
        PdfArray afArray = getPdfObject().getAsArray(PdfName.AF);
        if (afArray == null && create) {
            PdfArray afArray2 = new PdfArray();
            getPdfObject().put(PdfName.AF, afArray2);
            return afArray2;
        }
        return afArray;
    }

    @Override // com.itextpdf.kernel.pdf.PdfObjectWrapper
    protected boolean isWrappedObjectMustBeIndirect() {
        return true;
    }
}
