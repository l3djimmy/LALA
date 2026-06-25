package com.itextpdf.kernel.pdf.collection;

import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.pdf.PdfBoolean;
import com.itextpdf.kernel.pdf.PdfDate;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfNumber;
import com.itextpdf.kernel.pdf.PdfObject;
import com.itextpdf.kernel.pdf.PdfObjectWrapper;
import com.itextpdf.kernel.pdf.PdfString;
import com.itextpdf.layout.properties.Property;
/* loaded from: classes12.dex */
public class PdfCollectionField extends PdfObjectWrapper<PdfDictionary> {
    public static final int CREATIONDATE = 6;
    public static final int DATE = 1;
    public static final int DESC = 4;
    public static final int FILENAME = 3;
    public static final int MODDATE = 5;
    public static final int NUMBER = 2;
    public static final int SIZE = 7;
    public static final int TEXT = 0;
    protected int subType;

    /* JADX INFO: Access modifiers changed from: protected */
    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public PdfCollectionField(PdfDictionary pdfObject) {
        super(pdfObject);
        char c;
        String subType = pdfObject.getAsName(PdfName.Subtype).getValue();
        switch (subType.hashCode()) {
            case -1404350032:
                if (subType.equals("ModDate")) {
                    c = 4;
                    break;
                }
                c = 65535;
                break;
            case Property.TAB_LEADER /* 68 */:
                if (subType.equals("D")) {
                    c = 0;
                    break;
                }
                c = 65535;
                break;
            case Property.TEXT_ALIGNMENT /* 70 */:
                if (subType.equals("F")) {
                    c = 2;
                    break;
                }
                c = 65535;
                break;
            case Property.WORD_SPACING /* 78 */:
                if (subType.equals("N")) {
                    c = 1;
                    break;
                }
                c = 65535;
                break;
            case 2126513:
                if (subType.equals("Desc")) {
                    c = 3;
                    break;
                }
                c = 65535;
                break;
            case 2577441:
                if (subType.equals("Size")) {
                    c = 6;
                    break;
                }
                c = 65535;
                break;
            case 1749851981:
                if (subType.equals("CreationDate")) {
                    c = 5;
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
                this.subType = 1;
                return;
            case 1:
                this.subType = 2;
                return;
            case 2:
                this.subType = 3;
                return;
            case 3:
                this.subType = 4;
                return;
            case 4:
                this.subType = 5;
                return;
            case 5:
                this.subType = 6;
                return;
            case 6:
                this.subType = 7;
                return;
            default:
                this.subType = 0;
                return;
        }
    }

    public PdfCollectionField(String name, int subType) {
        super(new PdfDictionary());
        getPdfObject().put(PdfName.N, new PdfString(name));
        this.subType = subType;
        switch (subType) {
            case 1:
                getPdfObject().put(PdfName.Subtype, PdfName.D);
                return;
            case 2:
                getPdfObject().put(PdfName.Subtype, PdfName.N);
                return;
            case 3:
                getPdfObject().put(PdfName.Subtype, PdfName.F);
                return;
            case 4:
                getPdfObject().put(PdfName.Subtype, PdfName.Desc);
                return;
            case 5:
                getPdfObject().put(PdfName.Subtype, PdfName.ModDate);
                return;
            case 6:
                getPdfObject().put(PdfName.Subtype, PdfName.CreationDate);
                return;
            case 7:
                getPdfObject().put(PdfName.Subtype, PdfName.Size);
                return;
            default:
                getPdfObject().put(PdfName.Subtype, PdfName.S);
                return;
        }
    }

    public PdfCollectionField setOrder(int order) {
        getPdfObject().put(PdfName.O, new PdfNumber(order));
        return this;
    }

    public PdfNumber getOrder() {
        return getPdfObject().getAsNumber(PdfName.O);
    }

    public PdfCollectionField setVisibility(boolean visible) {
        getPdfObject().put(PdfName.V, PdfBoolean.valueOf(visible));
        return this;
    }

    public PdfBoolean getVisibility() {
        return getPdfObject().getAsBoolean(PdfName.V);
    }

    public PdfCollectionField setEditable(boolean editable) {
        getPdfObject().put(PdfName.E, PdfBoolean.valueOf(editable));
        return this;
    }

    public PdfBoolean getEditable() {
        return getPdfObject().getAsBoolean(PdfName.E);
    }

    public PdfObject getValue(String value) {
        switch (this.subType) {
            case 0:
                return new PdfString(value);
            case 1:
                return new PdfDate(PdfDate.decode(value)).getPdfObject();
            case 2:
                return new PdfNumber(Double.parseDouble(value.trim()));
            default:
                throw new PdfException(KernelExceptionMessageConstant.UNACCEPTABLE_FIELD_VALUE).setMessageParams(value, getPdfObject().getAsString(PdfName.N).getValue());
        }
    }

    @Override // com.itextpdf.kernel.pdf.PdfObjectWrapper
    protected boolean isWrappedObjectMustBeIndirect() {
        return false;
    }
}
