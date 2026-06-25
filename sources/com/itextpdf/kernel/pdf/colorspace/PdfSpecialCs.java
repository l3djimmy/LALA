package com.itextpdf.kernel.pdf.colorspace;

import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfNumber;
import com.itextpdf.kernel.pdf.PdfObject;
import com.itextpdf.kernel.pdf.PdfString;
import com.itextpdf.kernel.pdf.function.IPdfFunction;
import com.itextpdf.kernel.pdf.function.PdfFunctionFactory;
import java.util.Arrays;
import java.util.List;
/* loaded from: classes12.dex */
public abstract class PdfSpecialCs extends PdfColorSpace {
    protected PdfSpecialCs(PdfArray pdfObject) {
        super(pdfObject);
    }

    @Override // com.itextpdf.kernel.pdf.PdfObjectWrapper
    public void flush() {
        super.flush();
    }

    @Override // com.itextpdf.kernel.pdf.PdfObjectWrapper
    protected boolean isWrappedObjectMustBeIndirect() {
        return true;
    }

    /* loaded from: classes12.dex */
    public static class Indexed extends PdfSpecialCs {
        public Indexed(PdfArray pdfObject) {
            super(pdfObject);
        }

        public Indexed(PdfObject base, int hival, PdfString lookup) {
            this(getIndexedCsArray(base, hival, lookup));
        }

        @Override // com.itextpdf.kernel.pdf.colorspace.PdfColorSpace
        public int getNumberOfComponents() {
            return 1;
        }

        public PdfColorSpace getBaseCs() {
            return makeColorSpace(((PdfArray) getPdfObject()).get(1));
        }

        private static PdfArray getIndexedCsArray(PdfObject base, int hival, PdfString lookup) {
            PdfArray indexed = new PdfArray();
            indexed.add(PdfName.Indexed);
            indexed.add(base);
            indexed.add(new PdfNumber(hival));
            indexed.add(lookup.setHexWriting(true));
            return indexed;
        }
    }

    /* loaded from: classes12.dex */
    public static class Separation extends PdfSpecialCs {
        public Separation(PdfArray pdfObject) {
            super(pdfObject);
        }

        public Separation(PdfName name, PdfObject alternateSpace, PdfObject tintTransform) {
            this(getSeparationCsArray(name, alternateSpace, tintTransform));
        }

        public Separation(String name, PdfColorSpace alternateSpace, IPdfFunction tintTransform) {
            this(new PdfName(name), alternateSpace.getPdfObject(), tintTransform.getAsPdfObject());
            if (!tintTransform.checkCompatibilityWithColorSpace(alternateSpace)) {
                throw new PdfException(KernelExceptionMessageConstant.FUNCTION_IS_NOT_COMPATIBLE_WITH_COLOR_SPACE, this);
            }
        }

        @Override // com.itextpdf.kernel.pdf.colorspace.PdfColorSpace
        public int getNumberOfComponents() {
            return 1;
        }

        public PdfColorSpace getBaseCs() {
            return makeColorSpace(((PdfArray) getPdfObject()).get(2));
        }

        public PdfName getName() {
            return ((PdfArray) getPdfObject()).getAsName(1);
        }

        public IPdfFunction getTintTransformation() {
            return PdfFunctionFactory.create(((PdfArray) getPdfObject()).get(3));
        }

        private static PdfArray getSeparationCsArray(PdfName name, PdfObject alternateSpace, PdfObject tintTransform) {
            PdfArray separation = new PdfArray();
            separation.add(PdfName.Separation);
            separation.add(name);
            separation.add(alternateSpace);
            separation.add(tintTransform);
            return separation;
        }
    }

    /* loaded from: classes12.dex */
    public static class DeviceN extends PdfSpecialCs {
        protected int numOfComponents;

        public DeviceN(PdfArray pdfObject) {
            super(pdfObject);
            this.numOfComponents = 0;
            this.numOfComponents = pdfObject.getAsArray(1).size();
        }

        public DeviceN(PdfArray names, PdfObject alternateSpace, PdfObject tintTransform) {
            this(getDeviceNCsArray(names, alternateSpace, tintTransform));
        }

        public DeviceN(List<String> names, PdfColorSpace alternateSpace, IPdfFunction tintTransform) {
            this(new PdfArray(names, true), alternateSpace.getPdfObject(), tintTransform.getAsPdfObject());
            if (tintTransform.getInputSize() != this.numOfComponents || tintTransform.getOutputSize() != alternateSpace.getNumberOfComponents()) {
                throw new PdfException(KernelExceptionMessageConstant.FUNCTION_IS_NOT_COMPATIBLE_WITH_COLOR_SPACE, this);
            }
        }

        @Override // com.itextpdf.kernel.pdf.colorspace.PdfColorSpace
        public int getNumberOfComponents() {
            return this.numOfComponents;
        }

        public PdfColorSpace getBaseCs() {
            return makeColorSpace(((PdfArray) getPdfObject()).get(2));
        }

        public PdfArray getNames() {
            return ((PdfArray) getPdfObject()).getAsArray(1);
        }

        protected static PdfArray getDeviceNCsArray(PdfArray names, PdfObject alternateSpace, PdfObject tintTransform) {
            PdfArray deviceN = new PdfArray();
            deviceN.add(PdfName.DeviceN);
            deviceN.add(names);
            deviceN.add(alternateSpace);
            deviceN.add(tintTransform);
            return deviceN;
        }
    }

    /* loaded from: classes12.dex */
    public static class NChannel extends DeviceN {
        public NChannel(PdfArray pdfObject) {
            super(pdfObject);
        }

        public NChannel(PdfArray names, PdfObject alternateSpace, PdfObject tintTransform, PdfDictionary attributes) {
            this(getNChannelCsArray(names, alternateSpace, tintTransform, attributes));
        }

        public NChannel(List<String> names, PdfColorSpace alternateSpace, IPdfFunction tintTransform, PdfDictionary attributes) {
            this(new PdfArray(names, true), alternateSpace.getPdfObject(), tintTransform.getAsPdfObject(), attributes);
            if (tintTransform.getInputSize() != 1 || tintTransform.getOutputSize() != alternateSpace.getNumberOfComponents()) {
                throw new PdfException(KernelExceptionMessageConstant.FUNCTION_IS_NOT_COMPATIBLE_WITH_COLOR_SPACE, this);
            }
        }

        protected static PdfArray getNChannelCsArray(PdfArray names, PdfObject alternateSpace, PdfObject tintTransform, PdfDictionary attributes) {
            PdfArray nChannel = getDeviceNCsArray(names, alternateSpace, tintTransform);
            nChannel.add(attributes);
            return nChannel;
        }
    }

    /* loaded from: classes12.dex */
    public static class Pattern extends PdfColorSpace {
        public Pattern() {
            super(PdfName.Pattern);
        }

        protected Pattern(PdfObject pdfObj) {
            super(pdfObj);
        }

        @Override // com.itextpdf.kernel.pdf.colorspace.PdfColorSpace
        public int getNumberOfComponents() {
            return 0;
        }

        @Override // com.itextpdf.kernel.pdf.PdfObjectWrapper
        protected boolean isWrappedObjectMustBeIndirect() {
            return false;
        }
    }

    /* loaded from: classes12.dex */
    public static class UncoloredTilingPattern extends Pattern {
        public UncoloredTilingPattern(PdfArray pdfObject) {
            super(pdfObject);
        }

        public UncoloredTilingPattern(PdfColorSpace underlyingColorSpace) {
            super(new PdfArray(Arrays.asList(PdfName.Pattern, underlyingColorSpace.getPdfObject())));
        }

        @Override // com.itextpdf.kernel.pdf.PdfObjectWrapper
        public void flush() {
            super.flush();
        }

        public PdfColorSpace getUnderlyingColorSpace() {
            return PdfColorSpace.makeColorSpace(((PdfArray) getPdfObject()).get(1));
        }

        @Override // com.itextpdf.kernel.pdf.colorspace.PdfSpecialCs.Pattern, com.itextpdf.kernel.pdf.colorspace.PdfColorSpace
        public int getNumberOfComponents() {
            return PdfColorSpace.makeColorSpace(((PdfArray) getPdfObject()).get(1)).getNumberOfComponents();
        }

        @Override // com.itextpdf.kernel.pdf.colorspace.PdfSpecialCs.Pattern, com.itextpdf.kernel.pdf.PdfObjectWrapper
        protected boolean isWrappedObjectMustBeIndirect() {
            return true;
        }
    }
}
