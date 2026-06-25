package com.itextpdf.kernel.pdf.filters;

import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.MemoryLimitsAwareException;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.pdf.MemoryLimitsAwareFilter;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfNumber;
import com.itextpdf.kernel.pdf.PdfObject;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.IOException;
import java.util.zip.InflaterInputStream;
import kotlin.UByte;
/* loaded from: classes12.dex */
public class FlateDecodeFilter extends MemoryLimitsAwareFilter {
    public static byte[] flateDecode(byte[] in, boolean strict) {
        return flateDecodeInternal(in, strict, new ByteArrayOutputStream());
    }

    public static byte[] decodePredictor(byte[] in, PdfObject decodeParams) {
        PdfDictionary dic;
        char c;
        int ret;
        if (decodeParams == null || decodeParams.getType() != 3) {
            return in;
        }
        PdfDictionary dic2 = (PdfDictionary) decodeParams;
        PdfObject obj = dic2.get(PdfName.Predictor);
        if (obj != null && obj.getType() == 8) {
            int predictor = ((PdfNumber) obj).intValue();
            char c2 = 2;
            if (predictor < 10 && predictor != 2) {
                return in;
            }
            int width = getNumberOrDefault(dic2, PdfName.Columns, 1);
            int colors = getNumberOrDefault(dic2, PdfName.Colors, 1);
            int bpc = getNumberOrDefault(dic2, PdfName.BitsPerComponent, 8);
            DataInputStream dataStream = new DataInputStream(new ByteArrayInputStream(in));
            ByteArrayOutputStream fout = new ByteArrayOutputStream(in.length);
            int bytesPerPixel = (colors * bpc) / 8;
            int bytesPerRow = (((colors * width) * bpc) + 7) / 8;
            byte[] curr = new byte[bytesPerRow];
            byte[] prior = new byte[bytesPerRow];
            if (predictor != 2) {
                byte[] curr2 = curr;
                while (true) {
                    try {
                        int filter = dataStream.read();
                        if (filter < 0) {
                            try {
                                return fout.toByteArray();
                            } catch (Exception e) {
                                return fout.toByteArray();
                            }
                        }
                        dataStream.readFully(curr2, 0, bytesPerRow);
                        switch (filter) {
                            case 0:
                                dic = dic2;
                                c = c2;
                                break;
                            case 1:
                                dic = dic2;
                                c = c2;
                                for (int i = bytesPerPixel; i < bytesPerRow; i++) {
                                    curr2[i] = (byte) (curr2[i] + curr2[i - bytesPerPixel]);
                                }
                                break;
                            case 2:
                                dic = dic2;
                                c = c2;
                                for (int i2 = 0; i2 < bytesPerRow; i2++) {
                                    curr2[i2] = (byte) (curr2[i2] + prior[i2]);
                                }
                                break;
                            case 3:
                                dic = dic2;
                                c = c2;
                                for (int i3 = 0; i3 < bytesPerPixel; i3++) {
                                    curr2[i3] = (byte) (curr2[i3] + ((byte) (prior[i3] / 2)));
                                }
                                for (int i4 = bytesPerPixel; i4 < bytesPerRow; i4++) {
                                    curr2[i4] = (byte) (curr2[i4] + ((byte) (((curr2[i4 - bytesPerPixel] & UByte.MAX_VALUE) + (prior[i4] & UByte.MAX_VALUE)) / 2)));
                                }
                                break;
                            case 4:
                                int i5 = 0;
                                while (i5 < bytesPerPixel) {
                                    curr2[i5] = (byte) (curr2[i5] + prior[i5]);
                                    i5++;
                                    c2 = c2;
                                }
                                c = c2;
                                int ret2 = bytesPerPixel;
                                while (ret2 < bytesPerRow) {
                                    int a = curr2[ret2 - bytesPerPixel] & UByte.MAX_VALUE;
                                    int i6 = ret2;
                                    int b = prior[i6] & 255;
                                    int c3 = prior[i6 - bytesPerPixel] & 255;
                                    int p = (a + b) - c3;
                                    int pa = Math.abs(p - a);
                                    int pb = Math.abs(p - b);
                                    PdfDictionary dic3 = dic2;
                                    int pc = Math.abs(p - c3);
                                    if (pa <= pb && pa <= pc) {
                                        ret = a;
                                    } else if (pb <= pc) {
                                        ret = b;
                                    } else {
                                        ret = c3;
                                    }
                                    curr2[i6] = (byte) (curr2[i6] + ((byte) ret));
                                    ret2 = i6 + 1;
                                    dic2 = dic3;
                                }
                                dic = dic2;
                                break;
                            default:
                                throw new PdfException(KernelExceptionMessageConstant.PNG_FILTER_UNKNOWN);
                        }
                        try {
                            fout.write(curr2);
                        } catch (IOException e2) {
                        }
                        byte[] tmp = prior;
                        prior = curr2;
                        curr2 = tmp;
                        c2 = c;
                        dic2 = dic;
                    } catch (Exception e3) {
                    }
                }
            } else {
                if (bpc == 8) {
                    int numRows = in.length / bytesPerRow;
                    int row = 0;
                    while (row < numRows) {
                        int rowStart = row * bytesPerRow;
                        byte[] curr3 = curr;
                        int col = bytesPerPixel;
                        while (col < bytesPerRow) {
                            int col2 = col;
                            in[rowStart + col] = (byte) (in[rowStart + col] + in[(rowStart + col) - bytesPerPixel]);
                            col = col2 + 1;
                        }
                        row++;
                        curr = curr3;
                    }
                }
                return in;
            }
        }
        return in;
    }

    @Override // com.itextpdf.kernel.pdf.filters.IFilterHandler
    public byte[] decode(byte[] b, PdfName filterName, PdfObject decodeParams, PdfDictionary streamDictionary) {
        ByteArrayOutputStream outputStream = enableMemoryLimitsAwareHandler(streamDictionary);
        byte[] res = flateDecodeInternal(b, true, outputStream);
        if (res == null) {
            outputStream.reset();
            res = flateDecodeInternal(b, false, outputStream);
        }
        return decodePredictor(res, decodeParams);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static byte[] flateDecodeInternal(byte[] in, boolean strict, ByteArrayOutputStream out) {
        ByteArrayInputStream stream = new ByteArrayInputStream(in);
        InflaterInputStream zip = new InflaterInputStream(stream);
        byte[] b = new byte[strict ? 4092 : 1];
        while (true) {
            try {
                int n = zip.read(b);
                if (n >= 0) {
                    out.write(b, 0, n);
                } else {
                    zip.close();
                    out.close();
                    return out.toByteArray();
                }
            } catch (MemoryLimitsAwareException e) {
                throw e;
            } catch (Exception e2) {
                if (strict) {
                    return null;
                }
                return out.toByteArray();
            }
        }
    }

    private static int getNumberOrDefault(PdfDictionary dict, PdfName key, int defaultInt) {
        PdfObject obj = dict.get(key);
        if (obj == null || obj.getType() != 8) {
            return defaultInt;
        }
        int result = ((PdfNumber) obj).intValue();
        return result;
    }
}
