package com.itextpdf.kernel.pdf.xobject;

import com.itextpdf.io.codec.PngWriter;
import com.itextpdf.io.codec.TIFFConstants;
import com.itextpdf.io.codec.TiffWriter;
import com.itextpdf.io.exceptions.IoExceptionMessageConstant;
import com.itextpdf.kernel.actions.data.ITextCoreProductData;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfObject;
import com.itextpdf.kernel.pdf.PdfStream;
import com.itextpdf.kernel.pdf.PdfString;
import com.itextpdf.kernel.pdf.colorspace.PdfSpecialCs;
import com.itextpdf.kernel.pdf.function.IPdfFunction;
import com.itextpdf.kernel.pdf.function.PdfFunctionFactory;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import kotlin.UByte;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes12.dex */
public class ImagePdfBytesInfo {
    private static final String TIFFTAG_SOFTWARE_VALUE = "iText® " + ITextCoreProductData.getInstance().getVersion() + " ©" + ITextCoreProductData.getInstance().getSinceCopyrightYear() + "-" + ITextCoreProductData.getInstance().getToCopyrightYear() + " Apryse Group NV";
    private final int bpc;
    private final PdfObject colorspace;
    private final PdfArray decode;
    private final int height;
    private int pngBitDepth;
    private final int width;
    private int pngColorType = -1;
    private byte[] palette = null;
    private byte[] icc = null;
    private int stride = 0;

    public ImagePdfBytesInfo(PdfImageXObject imageXObject) {
        this.bpc = imageXObject.getPdfObject().getAsNumber(PdfName.BitsPerComponent).intValue();
        this.pngBitDepth = this.bpc;
        this.width = (int) imageXObject.getWidth();
        this.height = (int) imageXObject.getHeight();
        this.colorspace = imageXObject.getPdfObject().get(PdfName.ColorSpace);
        this.decode = imageXObject.getPdfObject().getAsArray(PdfName.Decode);
        findColorspace(this.colorspace, true);
    }

    public int getPngColorType() {
        return this.pngColorType;
    }

    public byte[] decodeTiffAndPngBytes(byte[] imageBytes) throws IOException {
        if (this.pngColorType < 0) {
            if (this.bpc == 8) {
                if (this.colorspace instanceof PdfArray) {
                    PdfArray ca = (PdfArray) this.colorspace;
                    PdfObject tyca = ca.get(0);
                    if (!PdfName.ICCBased.equals(tyca)) {
                        throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.COLOR_SPACE_IS_NOT_SUPPORTED).setMessageParams(tyca.toString());
                    }
                    PdfStream pr = (PdfStream) ca.get(1);
                    int n = pr.getAsNumber(PdfName.N).intValue();
                    if (n != 4) {
                        throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.N_VALUE_IS_NOT_SUPPORTED).setMessageParams(Integer.valueOf(n));
                    }
                    this.icc = pr.getBytes();
                } else if (!PdfName.DeviceCMYK.equals(this.colorspace)) {
                    throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.COLOR_SPACE_IS_NOT_SUPPORTED).setMessageParams(this.colorspace.toString());
                }
                ByteArrayOutputStream ms = new ByteArrayOutputStream();
                this.stride = this.width * 4;
                TiffWriter wr = new TiffWriter();
                wr.addField(new TiffWriter.FieldShort((int) TIFFConstants.TIFFTAG_SAMPLESPERPIXEL, 4));
                wr.addField(new TiffWriter.FieldShort(258, new int[]{8, 8, 8, 8}));
                wr.addField(new TiffWriter.FieldShort(262, 5));
                wr.addField(new TiffWriter.FieldLong(256, this.width));
                wr.addField(new TiffWriter.FieldLong(257, this.height));
                wr.addField(new TiffWriter.FieldShort(259, 5));
                wr.addField(new TiffWriter.FieldShort(317, 2));
                wr.addField(new TiffWriter.FieldLong((int) TIFFConstants.TIFFTAG_ROWSPERSTRIP, this.height));
                wr.addField(new TiffWriter.FieldRational((int) TIFFConstants.TIFFTAG_XRESOLUTION, new int[]{300, 1}));
                wr.addField(new TiffWriter.FieldRational((int) TIFFConstants.TIFFTAG_YRESOLUTION, new int[]{300, 1}));
                wr.addField(new TiffWriter.FieldShort((int) TIFFConstants.TIFFTAG_RESOLUTIONUNIT, 2));
                wr.addField(new TiffWriter.FieldAscii(305, TIFFTAG_SOFTWARE_VALUE));
                ByteArrayOutputStream comp = new ByteArrayOutputStream();
                TiffWriter.compressLZW(comp, 2, imageBytes, this.height, 4, this.stride);
                byte[] buf = comp.toByteArray();
                wr.addField(new TiffWriter.FieldImage(buf));
                wr.addField(new TiffWriter.FieldLong((int) TIFFConstants.TIFFTAG_STRIPBYTECOUNTS, buf.length));
                if (this.icc != null) {
                    wr.addField(new TiffWriter.FieldUndefined(TIFFConstants.TIFFTAG_ICCPROFILE, this.icc));
                }
                wr.writeFile(ms);
                return ms.toByteArray();
            }
            throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.COLOR_DEPTH_IS_NOT_SUPPORTED).setMessageParams(Integer.valueOf(this.bpc));
        }
        if (this.colorspace instanceof PdfArray) {
            PdfArray ca2 = (PdfArray) this.colorspace;
            if (PdfName.Separation.equals(ca2.get(0))) {
                return processSeperationColor(imageBytes, ca2);
            }
        }
        return processPng(imageBytes, this.pngBitDepth, this.pngColorType);
    }

    private byte[] processSeperationColor(byte[] imageBytes, PdfArray colorSpaceArray) throws IOException {
        PdfSpecialCs.Separation scs = new PdfSpecialCs.Separation(colorSpaceArray);
        byte[] newImageBytes = scs.getTintTransformation().calculateFromByteArray(imageBytes, 0, imageBytes.length, 8, 8);
        if (scs.getBaseCs().getNumberOfComponents() > 3) {
            throw new UnsupportedOperationException(KernelExceptionMessageConstant.GET_IMAGEBYTES_FOR_SEPARATION_COLOR_ONLY_SUPPORTS_RGB);
        }
        this.stride = (((this.width * this.bpc) * 3) + 7) / 8;
        return processPng(newImageBytes, this.pngBitDepth, 2);
    }

    private byte[] processPng(byte[] imageBytes, int pngBitDepth, int pngColorType) throws IOException {
        ByteArrayOutputStream ms = new ByteArrayOutputStream();
        PngWriter png = new PngWriter(ms);
        if (this.decode != null && pngBitDepth == 1 && this.decode.getAsNumber(0).intValue() == 1 && this.decode.getAsNumber(1).intValue() == 0) {
            int len = imageBytes.length;
            for (int t = 0; t < len; t++) {
                imageBytes[t] = (byte) (imageBytes[t] ^ UByte.MAX_VALUE);
            }
        }
        int len2 = this.width;
        png.writeHeader(len2, this.height, pngBitDepth, pngColorType);
        if (this.icc != null) {
            png.writeIccProfile(this.icc);
        }
        if (this.palette != null) {
            png.writePalette(this.palette);
        }
        png.writeData(imageBytes, this.stride);
        png.writeEnd();
        return ms.toByteArray();
    }

    private void findColorspace(PdfObject csObj, boolean allowIndexed) {
        if (!PdfName.DeviceGray.equals(csObj)) {
            if (csObj != null || this.bpc != 1) {
                if (PdfName.DeviceRGB.equals(csObj)) {
                    if (this.bpc == 8 || this.bpc == 16) {
                        this.stride = (((this.width * this.bpc) * 3) + 7) / 8;
                        this.pngColorType = 2;
                        return;
                    }
                    return;
                } else if (csObj instanceof PdfArray) {
                    PdfArray ca = (PdfArray) csObj;
                    PdfObject tyca = ca.get(0);
                    if (PdfName.CalGray.equals(tyca)) {
                        this.stride = ((this.width * this.bpc) + 7) / 8;
                        this.pngColorType = 0;
                        return;
                    } else if (PdfName.CalRGB.equals(tyca)) {
                        if (this.bpc == 8 || this.bpc == 16) {
                            this.stride = (((this.width * this.bpc) * 3) + 7) / 8;
                            this.pngColorType = 2;
                            return;
                        }
                        return;
                    } else if (PdfName.ICCBased.equals(tyca)) {
                        PdfStream pr = (PdfStream) ca.get(1);
                        int n = pr.getAsNumber(PdfName.N).intValue();
                        if (n == 1) {
                            this.stride = ((this.width * this.bpc) + 7) / 8;
                            this.pngColorType = 0;
                            this.icc = pr.getBytes();
                            return;
                        } else if (n == 3) {
                            this.stride = (((this.width * this.bpc) * 3) + 7) / 8;
                            this.pngColorType = 2;
                            this.icc = pr.getBytes();
                            return;
                        } else {
                            return;
                        }
                    } else if (allowIndexed && PdfName.Indexed.equals(tyca)) {
                        findColorspace(ca.get(1), false);
                        if (this.pngColorType == 2) {
                            PdfObject id2 = ca.get(3);
                            if (id2 instanceof PdfString) {
                                this.palette = ((PdfString) id2).getValueBytes();
                            } else if (id2 instanceof PdfStream) {
                                this.palette = ((PdfStream) id2).getBytes();
                            }
                            this.stride = ((this.width * this.bpc) + 7) / 8;
                            this.pngColorType = 3;
                            return;
                        }
                        return;
                    } else if (PdfName.Separation.equals(tyca)) {
                        IPdfFunction fct = PdfFunctionFactory.create(ca.get(3));
                        int components = fct.getOutputSize();
                        this.pngColorType = components != 1 ? 2 : 1;
                        this.pngBitDepth = 8;
                        return;
                    } else {
                        return;
                    }
                } else {
                    return;
                }
            }
        }
        this.stride = ((this.width * this.bpc) + 7) / 8;
        this.pngColorType = 0;
    }
}
