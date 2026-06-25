package com.itextpdf.kernel.pdf.colorspace;

import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfNumber;
import com.itextpdf.kernel.pdf.PdfObject;
import com.itextpdf.kernel.pdf.PdfObjectWrapper;
import com.itextpdf.kernel.pdf.PdfStream;
import com.itextpdf.kernel.pdf.colorspace.PdfSpecialCs;
import com.itextpdf.kernel.pdf.function.IPdfFunction;
import com.itextpdf.kernel.pdf.function.PdfType2Function;
/* loaded from: classes12.dex */
public abstract class PdfShading extends PdfObjectWrapper<PdfDictionary> {

    /* loaded from: classes12.dex */
    static final class ShadingType {
        public static final int AXIAL = 2;
        public static final int COONS_PATCH_MESH = 6;
        public static final int FREE_FORM_GOURAUD_SHADED_TRIANGLE_MESH = 4;
        public static final int FUNCTION_BASED = 1;
        public static final int LATTICE_FORM_GOURAUD_SHADED_TRIANGLE_MESH = 5;
        public static final int RADIAL = 3;
        public static final int TENSOR_PRODUCT_PATCH_MESH = 7;

        private ShadingType() {
        }
    }

    public static PdfShading makeShading(PdfDictionary shadingDictionary) {
        if (!shadingDictionary.containsKey(PdfName.ShadingType)) {
            throw new PdfException(KernelExceptionMessageConstant.SHADING_TYPE_NOT_FOUND);
        }
        if (!shadingDictionary.containsKey(PdfName.ColorSpace)) {
            throw new PdfException(KernelExceptionMessageConstant.COLOR_SPACE_NOT_FOUND);
        }
        switch (shadingDictionary.getAsNumber(PdfName.ShadingType).intValue()) {
            case 1:
                PdfShading shading = new FunctionBased(shadingDictionary);
                return shading;
            case 2:
                PdfShading shading2 = new Axial(shadingDictionary);
                return shading2;
            case 3:
                PdfShading shading3 = new Radial(shadingDictionary);
                return shading3;
            case 4:
                if (!shadingDictionary.isStream()) {
                    throw new PdfException(KernelExceptionMessageConstant.UNEXPECTED_SHADING_TYPE);
                }
                PdfShading shading4 = new FreeFormGouraudShadedTriangleMesh((PdfStream) shadingDictionary);
                return shading4;
            case 5:
                if (!shadingDictionary.isStream()) {
                    throw new PdfException(KernelExceptionMessageConstant.UNEXPECTED_SHADING_TYPE);
                }
                PdfShading shading5 = new LatticeFormGouraudShadedTriangleMesh((PdfStream) shadingDictionary);
                return shading5;
            case 6:
                if (!shadingDictionary.isStream()) {
                    throw new PdfException(KernelExceptionMessageConstant.UNEXPECTED_SHADING_TYPE);
                }
                PdfShading shading6 = new CoonsPatchMesh((PdfStream) shadingDictionary);
                return shading6;
            case 7:
                if (!shadingDictionary.isStream()) {
                    throw new PdfException(KernelExceptionMessageConstant.UNEXPECTED_SHADING_TYPE);
                }
                PdfShading shading7 = new TensorProductPatchMesh((PdfStream) shadingDictionary);
                return shading7;
            default:
                throw new PdfException(KernelExceptionMessageConstant.UNEXPECTED_SHADING_TYPE);
        }
    }

    protected PdfShading(PdfDictionary pdfObject) {
        super(pdfObject);
    }

    protected PdfShading(PdfDictionary pdfObject, int type, PdfColorSpace colorSpace) {
        super(pdfObject);
        getPdfObject().put(PdfName.ShadingType, new PdfNumber(type));
        if (colorSpace instanceof PdfSpecialCs.Pattern) {
            throw new IllegalArgumentException("colorSpace");
        }
        getPdfObject().put(PdfName.ColorSpace, colorSpace.getPdfObject());
    }

    public int getShadingType() {
        return getPdfObject().getAsInt(PdfName.ShadingType).intValue();
    }

    public PdfObject getColorSpace() {
        return getPdfObject().get(PdfName.ColorSpace);
    }

    public PdfObject getFunction() {
        return getPdfObject().get(PdfName.Function);
    }

    public void setFunction(IPdfFunction function) {
        getPdfObject().put(PdfName.Function, function.getAsPdfObject());
        setModified();
    }

    public void setFunction(IPdfFunction[] functions) {
        PdfArray arr = new PdfArray();
        for (IPdfFunction func : functions) {
            arr.add(func.getAsPdfObject());
        }
        getPdfObject().put(PdfName.Function, arr);
        setModified();
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
    public static class FunctionBased extends PdfShading {
        protected FunctionBased(PdfDictionary pdfDictionary) {
            super(pdfDictionary);
        }

        public FunctionBased(PdfColorSpace colorSpace, IPdfFunction function) {
            this(colorSpace.getPdfObject(), function);
        }

        public FunctionBased(PdfObject colorSpace, IPdfFunction function) {
            super(new PdfDictionary(), 1, PdfColorSpace.makeColorSpace(colorSpace));
            setFunction(function);
        }

        public PdfArray getDomain() {
            return getPdfObject().getAsArray(PdfName.Domain);
        }

        public void setDomain(float xmin, float xmax, float ymin, float ymax) {
            setDomain(new PdfArray(new float[]{xmin, xmax, ymin, ymax}));
        }

        public void setDomain(PdfArray domain) {
            getPdfObject().put(PdfName.Domain, domain);
            setModified();
        }

        public PdfArray getMatrix() {
            PdfArray matrix = getPdfObject().getAsArray(PdfName.Matrix);
            if (matrix == null) {
                PdfArray matrix2 = new PdfArray(new float[]{1.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f});
                setMatrix(matrix2);
                return matrix2;
            }
            return matrix;
        }

        public void setMatrix(float[] matrix) {
            setMatrix(new PdfArray(matrix));
        }

        public void setMatrix(PdfArray matrix) {
            getPdfObject().put(PdfName.Matrix, matrix);
            setModified();
        }
    }

    /* loaded from: classes12.dex */
    public static class Axial extends PdfShading {
        protected Axial(PdfDictionary pdfDictionary) {
            super(pdfDictionary);
        }

        public Axial(PdfColorSpace cs, float x0, float y0, float[] color0, float x1, float y1, float[] color1) {
            super(new PdfDictionary(), 2, cs);
            setCoords(x0, y0, x1, y1);
            IPdfFunction func = new PdfType2Function(new float[]{0.0f, 1.0f}, (float[]) null, color0, color1, 1.0d);
            setFunction(func);
        }

        public Axial(PdfColorSpace cs, float x0, float y0, float[] color0, float x1, float y1, float[] color1, boolean[] extend) {
            this(cs, x0, y0, color0, x1, y1, color1);
            if (extend == null || extend.length != 2) {
                throw new IllegalArgumentException("extend");
            }
            setExtend(extend[0], extend[1]);
        }

        public Axial(PdfColorSpace cs, PdfArray coords, IPdfFunction function) {
            this(cs, coords, null, function);
        }

        public Axial(PdfColorSpace cs, PdfArray coords, PdfArray domain, IPdfFunction function) {
            super(new PdfDictionary(), 2, cs);
            setCoords(coords);
            if (domain != null) {
                setDomain(domain);
            }
            setFunction(function);
        }

        public PdfArray getCoords() {
            return getPdfObject().getAsArray(PdfName.Coords);
        }

        public void setCoords(float x0, float y0, float x1, float y1) {
            setCoords(new PdfArray(new float[]{x0, y0, x1, y1}));
        }

        public void setCoords(PdfArray coords) {
            getPdfObject().put(PdfName.Coords, coords);
            setModified();
        }

        public PdfArray getDomain() {
            PdfArray domain = getPdfObject().getAsArray(PdfName.Domain);
            if (domain == null) {
                PdfArray domain2 = new PdfArray(new float[]{0.0f, 1.0f});
                setDomain(domain2);
                return domain2;
            }
            return domain;
        }

        public void setDomain(float t0, float t1) {
            setDomain(new PdfArray(new float[]{t0, t1}));
        }

        public void setDomain(PdfArray domain) {
            getPdfObject().put(PdfName.Domain, domain);
            setModified();
        }

        public PdfArray getExtend() {
            PdfArray extend = getPdfObject().getAsArray(PdfName.Extend);
            if (extend == null) {
                PdfArray extend2 = new PdfArray(new boolean[]{false, false});
                setExtend(extend2);
                return extend2;
            }
            return extend;
        }

        public void setExtend(boolean extendStart, boolean extendEnd) {
            setExtend(new PdfArray(new boolean[]{extendStart, extendEnd}));
        }

        public void setExtend(PdfArray extend) {
            getPdfObject().put(PdfName.Extend, extend);
            setModified();
        }
    }

    /* loaded from: classes12.dex */
    public static class Radial extends PdfShading {
        protected Radial(PdfDictionary pdfDictionary) {
            super(pdfDictionary);
        }

        public Radial(PdfColorSpace cs, float x0, float y0, float r0, float[] color0, float x1, float y1, float r1, float[] color1) {
            super(new PdfDictionary(), 3, cs);
            setCoords(x0, y0, r0, x1, y1, r1);
            IPdfFunction func = new PdfType2Function(new float[]{0.0f, 1.0f}, (float[]) null, color0, color1, 1.0d);
            setFunction(func);
        }

        public Radial(PdfColorSpace cs, float x0, float y0, float r0, float[] color0, float x1, float y1, float r1, float[] color1, boolean[] extend) {
            this(cs, x0, y0, r0, color0, x1, y1, r1, color1);
            if (extend == null || extend.length != 2) {
                throw new IllegalArgumentException("extend");
            }
            setExtend(extend[0], extend[1]);
        }

        public Radial(PdfColorSpace cs, PdfArray coords, IPdfFunction function) {
            super(new PdfDictionary(), 3, cs);
            setCoords(coords);
            setFunction(function);
        }

        public PdfArray getCoords() {
            return getPdfObject().getAsArray(PdfName.Coords);
        }

        public void setCoords(float x0, float y0, float r0, float x1, float y1, float r1) {
            setCoords(new PdfArray(new float[]{x0, y0, r0, x1, y1, r1}));
        }

        public void setCoords(PdfArray coords) {
            getPdfObject().put(PdfName.Coords, coords);
            setModified();
        }

        public PdfArray getDomain() {
            PdfArray domain = getPdfObject().getAsArray(PdfName.Domain);
            if (domain == null) {
                PdfArray domain2 = new PdfArray(new float[]{0.0f, 1.0f});
                setDomain(domain2);
                return domain2;
            }
            return domain;
        }

        public void setDomain(float t0, float t1) {
            setDomain(new PdfArray(new float[]{t0, t1}));
        }

        public void setDomain(PdfArray domain) {
            getPdfObject().put(PdfName.Domain, domain);
            setModified();
        }

        public PdfArray getExtend() {
            PdfArray extend = getPdfObject().getAsArray(PdfName.Extend);
            if (extend == null) {
                PdfArray extend2 = new PdfArray(new boolean[]{false, false});
                setExtend(extend2);
                return extend2;
            }
            return extend;
        }

        public void setExtend(boolean extendStart, boolean extendEnd) {
            setExtend(new PdfArray(new boolean[]{extendStart, extendEnd}));
        }

        public void setExtend(PdfArray extend) {
            getPdfObject().put(PdfName.Extend, extend);
            setModified();
        }
    }

    /* loaded from: classes12.dex */
    public static class FreeFormGouraudShadedTriangleMesh extends PdfShading {
        protected FreeFormGouraudShadedTriangleMesh(PdfStream pdfStream) {
            super(pdfStream);
        }

        public FreeFormGouraudShadedTriangleMesh(PdfColorSpace cs, int bitsPerCoordinate, int bitsPerComponent, int bitsPerFlag, float[] decode) {
            this(cs, bitsPerCoordinate, bitsPerComponent, bitsPerFlag, new PdfArray(decode));
        }

        public FreeFormGouraudShadedTriangleMesh(PdfColorSpace cs, int bitsPerCoordinate, int bitsPerComponent, int bitsPerFlag, PdfArray decode) {
            super(new PdfStream(), 4, cs);
            setBitsPerCoordinate(bitsPerCoordinate);
            setBitsPerComponent(bitsPerComponent);
            setBitsPerFlag(bitsPerFlag);
            setDecode(decode);
        }

        public int getBitsPerCoordinate() {
            return getPdfObject().getAsInt(PdfName.BitsPerCoordinate).intValue();
        }

        public void setBitsPerCoordinate(int bitsPerCoordinate) {
            getPdfObject().put(PdfName.BitsPerCoordinate, new PdfNumber(bitsPerCoordinate));
            setModified();
        }

        public int getBitsPerComponent() {
            return getPdfObject().getAsInt(PdfName.BitsPerComponent).intValue();
        }

        public void setBitsPerComponent(int bitsPerComponent) {
            getPdfObject().put(PdfName.BitsPerComponent, new PdfNumber(bitsPerComponent));
            setModified();
        }

        public int getBitsPerFlag() {
            return getPdfObject().getAsInt(PdfName.BitsPerFlag).intValue();
        }

        public void setBitsPerFlag(int bitsPerFlag) {
            getPdfObject().put(PdfName.BitsPerFlag, new PdfNumber(bitsPerFlag));
            setModified();
        }

        public PdfArray getDecode() {
            return getPdfObject().getAsArray(PdfName.Decode);
        }

        public void setDecode(float[] decode) {
            setDecode(new PdfArray(decode));
        }

        public void setDecode(PdfArray decode) {
            getPdfObject().put(PdfName.Decode, decode);
            setModified();
        }
    }

    /* loaded from: classes12.dex */
    public static class LatticeFormGouraudShadedTriangleMesh extends PdfShading {
        protected LatticeFormGouraudShadedTriangleMesh(PdfStream pdfStream) {
            super(pdfStream);
        }

        public LatticeFormGouraudShadedTriangleMesh(PdfColorSpace cs, int bitsPerCoordinate, int bitsPerComponent, int verticesPerRow, float[] decode) {
            this(cs, bitsPerCoordinate, bitsPerComponent, verticesPerRow, new PdfArray(decode));
        }

        public LatticeFormGouraudShadedTriangleMesh(PdfColorSpace cs, int bitsPerCoordinate, int bitsPerComponent, int verticesPerRow, PdfArray decode) {
            super(new PdfStream(), 5, cs);
            setBitsPerCoordinate(bitsPerCoordinate);
            setBitsPerComponent(bitsPerComponent);
            setVerticesPerRow(verticesPerRow);
            setDecode(decode);
        }

        public int getBitsPerCoordinate() {
            return getPdfObject().getAsInt(PdfName.BitsPerCoordinate).intValue();
        }

        public void setBitsPerCoordinate(int bitsPerCoordinate) {
            getPdfObject().put(PdfName.BitsPerCoordinate, new PdfNumber(bitsPerCoordinate));
            setModified();
        }

        public int getBitsPerComponent() {
            return getPdfObject().getAsInt(PdfName.BitsPerComponent).intValue();
        }

        public void setBitsPerComponent(int bitsPerComponent) {
            getPdfObject().put(PdfName.BitsPerComponent, new PdfNumber(bitsPerComponent));
            setModified();
        }

        public int getVerticesPerRow() {
            return getPdfObject().getAsInt(PdfName.VerticesPerRow).intValue();
        }

        public void setVerticesPerRow(int verticesPerRow) {
            getPdfObject().put(PdfName.VerticesPerRow, new PdfNumber(verticesPerRow));
            setModified();
        }

        public PdfArray getDecode() {
            return getPdfObject().getAsArray(PdfName.Decode);
        }

        public void setDecode(float[] decode) {
            setDecode(new PdfArray(decode));
        }

        public void setDecode(PdfArray decode) {
            getPdfObject().put(PdfName.Decode, decode);
            setModified();
        }
    }

    /* loaded from: classes12.dex */
    public static class CoonsPatchMesh extends PdfShading {
        protected CoonsPatchMesh(PdfStream pdfStream) {
            super(pdfStream);
        }

        public CoonsPatchMesh(PdfColorSpace cs, int bitsPerCoordinate, int bitsPerComponent, int bitsPerFlag, float[] decode) {
            this(cs, bitsPerCoordinate, bitsPerComponent, bitsPerFlag, new PdfArray(decode));
        }

        public CoonsPatchMesh(PdfColorSpace cs, int bitsPerCoordinate, int bitsPerComponent, int bitsPerFlag, PdfArray decode) {
            super(new PdfStream(), 6, cs);
            setBitsPerCoordinate(bitsPerCoordinate);
            setBitsPerComponent(bitsPerComponent);
            setBitsPerFlag(bitsPerFlag);
            setDecode(decode);
        }

        public int getBitsPerCoordinate() {
            return getPdfObject().getAsInt(PdfName.BitsPerCoordinate).intValue();
        }

        public void setBitsPerCoordinate(int bitsPerCoordinate) {
            getPdfObject().put(PdfName.BitsPerCoordinate, new PdfNumber(bitsPerCoordinate));
            setModified();
        }

        public int getBitsPerComponent() {
            return getPdfObject().getAsInt(PdfName.BitsPerComponent).intValue();
        }

        public void setBitsPerComponent(int bitsPerComponent) {
            getPdfObject().put(PdfName.BitsPerComponent, new PdfNumber(bitsPerComponent));
            setModified();
        }

        public int getBitsPerFlag() {
            return getPdfObject().getAsInt(PdfName.BitsPerFlag).intValue();
        }

        public void setBitsPerFlag(int bitsPerFlag) {
            getPdfObject().put(PdfName.BitsPerFlag, new PdfNumber(bitsPerFlag));
            setModified();
        }

        public PdfArray getDecode() {
            return getPdfObject().getAsArray(PdfName.Decode);
        }

        public void setDecode(float[] decode) {
            setDecode(new PdfArray(decode));
        }

        public void setDecode(PdfArray decode) {
            getPdfObject().put(PdfName.Decode, decode);
            setModified();
        }
    }

    /* loaded from: classes12.dex */
    public static class TensorProductPatchMesh extends PdfShading {
        protected TensorProductPatchMesh(PdfStream pdfStream) {
            super(pdfStream);
        }

        public TensorProductPatchMesh(PdfColorSpace cs, int bitsPerCoordinate, int bitsPerComponent, int bitsPerFlag, float[] decode) {
            this(cs, bitsPerCoordinate, bitsPerComponent, bitsPerFlag, new PdfArray(decode));
        }

        public TensorProductPatchMesh(PdfColorSpace cs, int bitsPerCoordinate, int bitsPerComponent, int bitsPerFlag, PdfArray decode) {
            super(new PdfStream(), 7, cs);
            setBitsPerCoordinate(bitsPerCoordinate);
            setBitsPerComponent(bitsPerComponent);
            setBitsPerFlag(bitsPerFlag);
            setDecode(decode);
        }

        public int getBitsPerCoordinate() {
            return getPdfObject().getAsInt(PdfName.BitsPerCoordinate).intValue();
        }

        public void setBitsPerCoordinate(int bitsPerCoordinate) {
            getPdfObject().put(PdfName.BitsPerCoordinate, new PdfNumber(bitsPerCoordinate));
            setModified();
        }

        public int getBitsPerComponent() {
            return getPdfObject().getAsInt(PdfName.BitsPerComponent).intValue();
        }

        public void setBitsPerComponent(int bitsPerComponent) {
            getPdfObject().put(PdfName.BitsPerComponent, new PdfNumber(bitsPerComponent));
            setModified();
        }

        public int getBitsPerFlag() {
            return getPdfObject().getAsInt(PdfName.BitsPerFlag).intValue();
        }

        public void setBitsPerFlag(int bitsPerFlag) {
            getPdfObject().put(PdfName.BitsPerFlag, new PdfNumber(bitsPerFlag));
            setModified();
        }

        public PdfArray getDecode() {
            return getPdfObject().getAsArray(PdfName.Decode);
        }

        public void setDecode(float[] decode) {
            setDecode(new PdfArray(decode));
        }

        public void setDecode(PdfArray decode) {
            getPdfObject().put(PdfName.Decode, decode);
            setModified();
        }
    }
}
