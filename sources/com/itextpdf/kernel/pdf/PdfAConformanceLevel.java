package com.itextpdf.kernel.pdf;

import androidx.exifinterface.media.ExifInterface;
import com.itextpdf.kernel.xmp.XMPConst;
import com.itextpdf.kernel.xmp.XMPException;
import com.itextpdf.kernel.xmp.XMPMeta;
import com.itextpdf.kernel.xmp.properties.XMPProperty;
/* loaded from: classes12.dex */
public class PdfAConformanceLevel implements IConformanceLevel {
    public static final PdfAConformanceLevel PDF_A_1A = new PdfAConformanceLevel("1", ExifInterface.GPS_MEASUREMENT_IN_PROGRESS);
    public static final PdfAConformanceLevel PDF_A_1B = new PdfAConformanceLevel("1", "B");
    public static final PdfAConformanceLevel PDF_A_2A = new PdfAConformanceLevel(ExifInterface.GPS_MEASUREMENT_2D, ExifInterface.GPS_MEASUREMENT_IN_PROGRESS);
    public static final PdfAConformanceLevel PDF_A_2B = new PdfAConformanceLevel(ExifInterface.GPS_MEASUREMENT_2D, "B");
    public static final PdfAConformanceLevel PDF_A_2U = new PdfAConformanceLevel(ExifInterface.GPS_MEASUREMENT_2D, "U");
    public static final PdfAConformanceLevel PDF_A_3A = new PdfAConformanceLevel(ExifInterface.GPS_MEASUREMENT_3D, ExifInterface.GPS_MEASUREMENT_IN_PROGRESS);
    public static final PdfAConformanceLevel PDF_A_3B = new PdfAConformanceLevel(ExifInterface.GPS_MEASUREMENT_3D, "B");
    public static final PdfAConformanceLevel PDF_A_3U = new PdfAConformanceLevel(ExifInterface.GPS_MEASUREMENT_3D, "U");
    public static final PdfAConformanceLevel PDF_A_4 = new PdfAConformanceLevel("4", null);
    public static final PdfAConformanceLevel PDF_A_4E = new PdfAConformanceLevel("4", ExifInterface.LONGITUDE_EAST);
    public static final PdfAConformanceLevel PDF_A_4F = new PdfAConformanceLevel("4", "F");
    public static final String PDF_A_4_REVISION = "2020";
    private final String conformance;
    private final String part;

    private PdfAConformanceLevel(String part, String conformance) {
        this.conformance = conformance;
        this.part = part;
    }

    public String getConformance() {
        return this.conformance;
    }

    public String getPart() {
        return this.part;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public static PdfAConformanceLevel getConformanceLevel(String part, String conformance) {
        char c;
        String lowLetter = conformance == null ? null : conformance.toUpperCase();
        boolean aLevel = ExifInterface.GPS_MEASUREMENT_IN_PROGRESS.equals(lowLetter);
        boolean bLevel = "B".equals(lowLetter);
        boolean uLevel = "U".equals(lowLetter);
        boolean eLevel = ExifInterface.LONGITUDE_EAST.equals(lowLetter);
        boolean fLevel = "F".equals(lowLetter);
        switch (part.hashCode()) {
            case 49:
                if (part.equals("1")) {
                    c = 0;
                    break;
                }
                c = 65535;
                break;
            case 50:
                if (part.equals(ExifInterface.GPS_MEASUREMENT_2D)) {
                    c = 1;
                    break;
                }
                c = 65535;
                break;
            case 51:
                if (part.equals(ExifInterface.GPS_MEASUREMENT_3D)) {
                    c = 2;
                    break;
                }
                c = 65535;
                break;
            case 52:
                if (part.equals("4")) {
                    c = 3;
                    break;
                }
                c = 65535;
                break;
            default:
                c = 65535;
                break;
        }
        switch (c) {
            case 0:
                if (aLevel) {
                    return PDF_A_1A;
                }
                if (bLevel) {
                    return PDF_A_1B;
                }
                break;
            case 1:
                if (aLevel) {
                    return PDF_A_2A;
                }
                if (bLevel) {
                    return PDF_A_2B;
                }
                if (uLevel) {
                    return PDF_A_2U;
                }
                break;
            case 2:
                if (aLevel) {
                    return PDF_A_3A;
                }
                if (bLevel) {
                    return PDF_A_3B;
                }
                if (uLevel) {
                    return PDF_A_3U;
                }
                break;
            case 3:
                if (eLevel) {
                    return PDF_A_4E;
                }
                if (fLevel) {
                    return PDF_A_4F;
                }
                return PDF_A_4;
        }
        return null;
    }

    public static PdfAConformanceLevel getConformanceLevel(XMPMeta meta) {
        XMPProperty conformanceXmpProperty = null;
        XMPProperty partXmpProperty = null;
        try {
            conformanceXmpProperty = meta.getProperty(XMPConst.NS_PDFA_ID, XMPConst.CONFORMANCE);
            partXmpProperty = meta.getProperty(XMPConst.NS_PDFA_ID, "part");
        } catch (XMPException e) {
        }
        String str = null;
        if (partXmpProperty == null || (conformanceXmpProperty == null && !"4".equals(partXmpProperty.getValue()))) {
            return null;
        }
        String value = partXmpProperty.getValue();
        if (conformanceXmpProperty != null) {
            str = conformanceXmpProperty.getValue();
        }
        return getConformanceLevel(value, str);
    }

    @Deprecated
    public static PdfAConformanceLevel getPDFAConformance(IConformanceLevel possibleConformance, PdfDocument document) {
        if (possibleConformance instanceof PdfAConformanceLevel) {
            return (PdfAConformanceLevel) possibleConformance;
        }
        if (document == null || !(document.getConformanceLevel() instanceof PdfAConformanceLevel)) {
            return null;
        }
        return (PdfAConformanceLevel) document.getConformanceLevel();
    }
}
