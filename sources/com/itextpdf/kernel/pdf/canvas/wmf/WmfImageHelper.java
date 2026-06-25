package com.itextpdf.kernel.pdf.canvas.wmf;

import com.itextpdf.io.image.ImageData;
import com.itextpdf.io.image.ImageType;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import com.itextpdf.kernel.pdf.xobject.PdfFormXObject;
import com.itextpdf.kernel.pdf.xobject.PdfXObject;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
/* loaded from: classes12.dex */
public class WmfImageHelper {
    public static float wmfFontCorrection = 0.86f;
    private float plainHeight;
    private float plainWidth;
    private WmfImageData wmf;

    public WmfImageHelper(ImageData wmf) {
        if (wmf.getOriginalType() != ImageType.WMF) {
            throw new IllegalArgumentException("WMF image expected");
        }
        this.wmf = (WmfImageData) wmf;
        processParameters();
    }

    private void processParameters() {
        InputStream is;
        String errorID;
        InputStream is2 = null;
        try {
            try {
                if (this.wmf.getData() == null) {
                    is = this.wmf.getUrl().openStream();
                    errorID = this.wmf.getUrl().toString();
                } else {
                    is = new ByteArrayInputStream(this.wmf.getData());
                    errorID = "Byte array";
                }
                InputMeta in = new InputMeta(is);
                if (in.readInt() != -1698247209) {
                    throw new PdfException(KernelExceptionMessageConstant.NOT_A_VALID_PLACEABLE_WINDOWS_METAFILE, errorID);
                }
                in.readWord();
                int left = in.readShort();
                int top = in.readShort();
                int right = in.readShort();
                int bottom = in.readShort();
                int inch = in.readWord();
                this.wmf.setDpi(72, 72);
                this.wmf.setHeight(((bottom - top) / inch) * 72.0f);
                this.wmf.setWidth(((right - left) / inch) * 72.0f);
                if (is != null) {
                    try {
                        is.close();
                    } catch (IOException e) {
                    }
                }
            } catch (IOException e2) {
                throw new PdfException(KernelExceptionMessageConstant.WMF_IMAGE_EXCEPTION);
            }
        } catch (Throwable th) {
            if (0 != 0) {
                try {
                    is2.close();
                } catch (IOException e3) {
                }
            }
            throw th;
        }
    }

    public PdfXObject createFormXObject(PdfDocument document) {
        PdfFormXObject pdfForm = new PdfFormXObject(new Rectangle(0.0f, 0.0f, this.wmf.getWidth(), this.wmf.getHeight()));
        PdfCanvas canvas = new PdfCanvas(pdfForm, document);
        InputStream is = null;
        try {
            try {
                if (this.wmf.getData() == null) {
                    is = this.wmf.getUrl().openStream();
                } else {
                    is = new ByteArrayInputStream(this.wmf.getData());
                }
                MetaDo meta = new MetaDo(is, canvas);
                meta.readAll();
                return pdfForm;
            } catch (IOException e) {
                throw new PdfException(KernelExceptionMessageConstant.WMF_IMAGE_EXCEPTION, (Throwable) e);
            }
        } finally {
            if (is != null) {
                try {
                    is.close();
                } catch (IOException e2) {
                }
            }
        }
    }
}
