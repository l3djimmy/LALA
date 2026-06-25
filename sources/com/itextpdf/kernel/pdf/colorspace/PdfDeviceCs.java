package com.itextpdf.kernel.pdf.colorspace;

import com.itextpdf.kernel.pdf.PdfName;
/* loaded from: classes12.dex */
public abstract class PdfDeviceCs extends PdfColorSpace {
    @Override // com.itextpdf.kernel.pdf.PdfObjectWrapper
    protected boolean isWrappedObjectMustBeIndirect() {
        return false;
    }

    protected PdfDeviceCs(PdfName pdfObject) {
        super(pdfObject);
    }

    /* loaded from: classes12.dex */
    public static class Gray extends PdfDeviceCs {
        public Gray() {
            super(PdfName.DeviceGray);
        }

        @Override // com.itextpdf.kernel.pdf.colorspace.PdfColorSpace
        public int getNumberOfComponents() {
            return 1;
        }
    }

    /* loaded from: classes12.dex */
    public static class Rgb extends PdfDeviceCs {
        public Rgb() {
            super(PdfName.DeviceRGB);
        }

        @Override // com.itextpdf.kernel.pdf.colorspace.PdfColorSpace
        public int getNumberOfComponents() {
            return 3;
        }
    }

    /* loaded from: classes12.dex */
    public static class Cmyk extends PdfDeviceCs {
        public Cmyk() {
            super(PdfName.DeviceCMYK);
        }

        @Override // com.itextpdf.kernel.pdf.colorspace.PdfColorSpace
        public int getNumberOfComponents() {
            return 4;
        }
    }
}
