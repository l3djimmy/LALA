package com.itextpdf.io.image;

import androidx.core.view.MotionEventCompat;
import androidx.exifinterface.media.ExifInterface;
import com.google.android.material.internal.ViewUtils;
import com.itextpdf.io.exceptions.IoExceptionMessageConstant;
import com.itextpdf.io.font.PdfEncodings;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import kotlin.UByte;
/* loaded from: classes12.dex */
final class BmpImageHelper {
    private static final int BI_BITFIELDS = 3;
    private static final int BI_RGB = 0;
    private static final int BI_RLE4 = 2;
    private static final int BI_RLE8 = 1;
    private static final int LCS_CALIBRATED_RGB = 0;
    private static final int LCS_CMYK = 2;
    private static final int LCS_SRGB = 1;
    private static final int VERSION_2_1_BIT = 0;
    private static final int VERSION_2_24_BIT = 3;
    private static final int VERSION_2_4_BIT = 1;
    private static final int VERSION_2_8_BIT = 2;
    private static final int VERSION_3_1_BIT = 4;
    private static final int VERSION_3_24_BIT = 7;
    private static final int VERSION_3_4_BIT = 5;
    private static final int VERSION_3_8_BIT = 6;
    private static final int VERSION_3_NT_16_BIT = 8;
    private static final int VERSION_3_NT_32_BIT = 9;
    private static final int VERSION_4_16_BIT = 13;
    private static final int VERSION_4_1_BIT = 10;
    private static final int VERSION_4_24_BIT = 14;
    private static final int VERSION_4_32_BIT = 15;
    private static final int VERSION_4_4_BIT = 11;
    private static final int VERSION_4_8_BIT = 12;

    BmpImageHelper() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class BmpParameters {
        Map<String, Object> additional;
        int alphaMask;
        long bitmapFileSize;
        long bitmapOffset;
        int bitsPerPixel;
        int blueMask;
        long compression;
        int greenMask;
        int height;
        BmpImageData image;
        long imageSize;
        int imageType;
        InputStream inputStream;
        boolean isBottomUp;
        int numBands;
        byte[] palette;
        Map<String, Object> properties = new HashMap();
        int redMask;
        int width;
        long xPelsPerMeter;
        long yPelsPerMeter;

        public BmpParameters(BmpImageData image) {
            this.image = image;
        }
    }

    public static void processImage(ImageData image) {
        if (image.getOriginalType() != ImageType.BMP) {
            throw new IllegalArgumentException("BMP image expected");
        }
        try {
            if (image.getData() == null) {
                image.loadData();
            }
            InputStream bmpStream = new ByteArrayInputStream(image.getData());
            image.imageSize = image.getData().length;
            BmpParameters bmp = new BmpParameters((BmpImageData) image);
            process(bmp, bmpStream);
            if (getImage(bmp)) {
                image.setWidth(bmp.width);
                image.setHeight(bmp.height);
                image.setDpi((int) ((bmp.xPelsPerMeter * 0.0254d) + 0.5d), (int) ((bmp.yPelsPerMeter * 0.0254d) + 0.5d));
            }
            RawImageHelper.updateImageAttributes(bmp.image, bmp.additional);
        } catch (IOException e) {
            throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.BMP_IMAGE_EXCEPTION, (Throwable) e);
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    private static void process(BmpParameters bmp, InputStream stream) throws IOException {
        long size;
        int i;
        bmp.inputStream = stream;
        if (!bmp.image.isNoHeader()) {
            if (readUnsignedByte(bmp.inputStream) == 66 && readUnsignedByte(bmp.inputStream) == 77) {
                bmp.bitmapFileSize = readDWord(bmp.inputStream);
                readWord(bmp.inputStream);
                readWord(bmp.inputStream);
                bmp.bitmapOffset = readDWord(bmp.inputStream);
            } else {
                throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.INVALID_MAGIC_VALUE_FOR_BMP_FILE_MUST_BE_BM);
            }
        }
        long size2 = readDWord(bmp.inputStream);
        if (size2 == 12) {
            bmp.width = readWord(bmp.inputStream);
            bmp.height = readWord(bmp.inputStream);
        } else {
            bmp.width = readLong(bmp.inputStream);
            bmp.height = readLong(bmp.inputStream);
        }
        int planes = readWord(bmp.inputStream);
        bmp.bitsPerPixel = readWord(bmp.inputStream);
        bmp.properties.put("color_planes", Integer.valueOf(planes));
        bmp.properties.put("bits_per_pixel", Integer.valueOf(bmp.bitsPerPixel));
        bmp.numBands = 3;
        if (bmp.bitmapOffset == 0) {
            bmp.bitmapOffset = size2;
        }
        if (size2 != 12) {
            bmp.compression = readDWord(bmp.inputStream);
            bmp.imageSize = readDWord(bmp.inputStream);
            bmp.xPelsPerMeter = readLong(bmp.inputStream);
            bmp.yPelsPerMeter = readLong(bmp.inputStream);
            long colorsUsed = readDWord(bmp.inputStream);
            long colorsImportant = readDWord(bmp.inputStream);
            switch ((int) bmp.compression) {
                case 0:
                    bmp.properties.put("compression", "BI_RGB");
                    break;
                case 1:
                    bmp.properties.put("compression", "BI_RLE8");
                    break;
                case 2:
                    bmp.properties.put("compression", "BI_RLE4");
                    break;
                case 3:
                    bmp.properties.put("compression", "BI_BITFIELDS");
                    break;
            }
            bmp.properties.put("x_pixels_per_meter", Long.valueOf(bmp.xPelsPerMeter));
            bmp.properties.put("y_pixels_per_meter", Long.valueOf(bmp.yPelsPerMeter));
            bmp.properties.put("colors_used", Long.valueOf(colorsUsed));
            bmp.properties.put("colors_important", Long.valueOf(colorsImportant));
            if (size2 == 40 || size2 == 52) {
                size = size2;
            } else if (size2 == 56) {
                size = size2;
            } else if (size2 != 108) {
                bmp.properties.put("bmp_version", "BMP v. 5.x");
                throw new RuntimeException("Not implemented yet.");
            } else {
                bmp.properties.put("bmp_version", "BMP v. 4.x");
                bmp.redMask = (int) readDWord(bmp.inputStream);
                bmp.greenMask = (int) readDWord(bmp.inputStream);
                bmp.blueMask = (int) readDWord(bmp.inputStream);
                bmp.alphaMask = (int) readDWord(bmp.inputStream);
                long csType = readDWord(bmp.inputStream);
                int redX = readLong(bmp.inputStream);
                int redY = readLong(bmp.inputStream);
                int redZ = readLong(bmp.inputStream);
                int greenX = readLong(bmp.inputStream);
                int greenY = readLong(bmp.inputStream);
                int greenZ = readLong(bmp.inputStream);
                int blueX = readLong(bmp.inputStream);
                int blueY = readLong(bmp.inputStream);
                int blueZ = readLong(bmp.inputStream);
                long gammaRed = readDWord(bmp.inputStream);
                long gammaGreen = readDWord(bmp.inputStream);
                long gammaBlue = readDWord(bmp.inputStream);
                if (bmp.bitsPerPixel == 1) {
                    bmp.imageType = 10;
                } else if (bmp.bitsPerPixel == 4) {
                    bmp.imageType = 11;
                } else if (bmp.bitsPerPixel == 8) {
                    bmp.imageType = 12;
                } else if (bmp.bitsPerPixel == 16) {
                    bmp.imageType = 13;
                    if (((int) bmp.compression) == 0) {
                        bmp.redMask = 31744;
                        bmp.greenMask = 992;
                        bmp.blueMask = 31;
                    }
                } else if (bmp.bitsPerPixel == 24) {
                    bmp.imageType = 14;
                } else if (bmp.bitsPerPixel == 32) {
                    bmp.imageType = 15;
                    if (((int) bmp.compression) == 0) {
                        bmp.redMask = 16711680;
                        bmp.greenMask = MotionEventCompat.ACTION_POINTER_INDEX_MASK;
                        bmp.blueMask = 255;
                    }
                }
                bmp.properties.put("red_mask", Integer.valueOf(bmp.redMask));
                bmp.properties.put("green_mask", Integer.valueOf(bmp.greenMask));
                bmp.properties.put("blue_mask", Integer.valueOf(bmp.blueMask));
                bmp.properties.put("alpha_mask", Integer.valueOf(bmp.alphaMask));
                int numberOfEntries = (int) (((bmp.bitmapOffset - 14) - size2) / 4);
                int sizeOfPalette = numberOfEntries * 4;
                if (bmp.bitmapOffset == size2) {
                    switch (bmp.imageType) {
                        case 10:
                            int sizeOfPalette2 = (colorsUsed > 0L ? 1 : (colorsUsed == 0L ? 0 : -1));
                            int sizeOfPalette3 = ((int) (sizeOfPalette2 == 0 ? 2L : colorsUsed)) * 4;
                            sizeOfPalette = sizeOfPalette3;
                            break;
                        case 11:
                            int sizeOfPalette4 = (colorsUsed > 0L ? 1 : (colorsUsed == 0L ? 0 : -1));
                            int sizeOfPalette5 = ((int) (sizeOfPalette4 == 0 ? 16L : colorsUsed)) * 4;
                            sizeOfPalette = sizeOfPalette5;
                            break;
                        case 12:
                            int sizeOfPalette6 = ((int) (colorsUsed == 0 ? 256L : colorsUsed)) * 4;
                            sizeOfPalette = sizeOfPalette6;
                            break;
                        default:
                            sizeOfPalette = 0;
                            break;
                    }
                    bmp.bitmapOffset = size2 + sizeOfPalette;
                }
                readPalette(sizeOfPalette, bmp);
                switch ((int) csType) {
                    case 0:
                        bmp.properties.put("color_space", "LCS_CALIBRATED_RGB");
                        bmp.properties.put("redX", Integer.valueOf(redX));
                        bmp.properties.put("redY", Integer.valueOf(redY));
                        bmp.properties.put("redZ", Integer.valueOf(redZ));
                        bmp.properties.put("greenX", Integer.valueOf(greenX));
                        bmp.properties.put("greenY", Integer.valueOf(greenY));
                        bmp.properties.put("greenZ", Integer.valueOf(greenZ));
                        bmp.properties.put("blueX", Integer.valueOf(blueX));
                        bmp.properties.put("blueY", Integer.valueOf(blueY));
                        bmp.properties.put("blueZ", Integer.valueOf(blueZ));
                        bmp.properties.put("gamma_red", Long.valueOf(gammaRed));
                        bmp.properties.put("gamma_green", Long.valueOf(gammaGreen));
                        bmp.properties.put("gamma_blue", Long.valueOf(gammaBlue));
                        throw new RuntimeException("Not implemented yet.");
                    case 1:
                        bmp.properties.put("color_space", "LCS_sRGB");
                        break;
                    case 2:
                        bmp.properties.put("color_space", "LCS_CMYK");
                        throw new RuntimeException("Not implemented yet.");
                }
            }
            switch ((int) bmp.compression) {
                case 0:
                case 1:
                case 2:
                    if (bmp.bitsPerPixel == 1) {
                        bmp.imageType = 4;
                    } else if (bmp.bitsPerPixel == 4) {
                        bmp.imageType = 5;
                    } else if (bmp.bitsPerPixel == 8) {
                        bmp.imageType = 6;
                    } else if (bmp.bitsPerPixel == 24) {
                        bmp.imageType = 7;
                    } else if (bmp.bitsPerPixel == 16) {
                        bmp.imageType = 8;
                        bmp.redMask = 31744;
                        bmp.greenMask = 992;
                        bmp.blueMask = 31;
                        bmp.properties.put("red_mask", Integer.valueOf(bmp.redMask));
                        bmp.properties.put("green_mask", Integer.valueOf(bmp.greenMask));
                        bmp.properties.put("blue_mask", Integer.valueOf(bmp.blueMask));
                    } else if (bmp.bitsPerPixel == 32) {
                        bmp.imageType = 9;
                        bmp.redMask = 16711680;
                        bmp.greenMask = MotionEventCompat.ACTION_POINTER_INDEX_MASK;
                        bmp.blueMask = 255;
                        bmp.properties.put("red_mask", Integer.valueOf(bmp.redMask));
                        bmp.properties.put("green_mask", Integer.valueOf(bmp.greenMask));
                        bmp.properties.put("blue_mask", Integer.valueOf(bmp.blueMask));
                    }
                    if (size >= 52) {
                        bmp.redMask = (int) readDWord(bmp.inputStream);
                        bmp.greenMask = (int) readDWord(bmp.inputStream);
                        bmp.blueMask = (int) readDWord(bmp.inputStream);
                        bmp.properties.put("red_mask", Integer.valueOf(bmp.redMask));
                        bmp.properties.put("green_mask", Integer.valueOf(bmp.greenMask));
                        bmp.properties.put("blue_mask", Integer.valueOf(bmp.blueMask));
                    }
                    if (size == 56) {
                        bmp.alphaMask = (int) readDWord(bmp.inputStream);
                        bmp.properties.put("alpha_mask", Integer.valueOf(bmp.alphaMask));
                    }
                    int numberOfEntries2 = (int) (((bmp.bitmapOffset - 14) - size) / 4);
                    int sizeOfPalette7 = numberOfEntries2 * 4;
                    if (bmp.bitmapOffset == size) {
                        switch (bmp.imageType) {
                            case 4:
                                int sizeOfPalette8 = (colorsUsed > 0L ? 1 : (colorsUsed == 0L ? 0 : -1));
                                int sizeOfPalette9 = ((int) (sizeOfPalette8 == 0 ? 2L : colorsUsed)) * 4;
                                sizeOfPalette7 = sizeOfPalette9;
                                break;
                            case 5:
                                int sizeOfPalette10 = (colorsUsed > 0L ? 1 : (colorsUsed == 0L ? 0 : -1));
                                int sizeOfPalette11 = ((int) (sizeOfPalette10 == 0 ? 16L : colorsUsed)) * 4;
                                sizeOfPalette7 = sizeOfPalette11;
                                break;
                            case 6:
                                int sizeOfPalette12 = ((int) (colorsUsed == 0 ? 256L : colorsUsed)) * 4;
                                sizeOfPalette7 = sizeOfPalette12;
                                break;
                            default:
                                sizeOfPalette7 = 0;
                                break;
                        }
                        bmp.bitmapOffset = size + sizeOfPalette7;
                    }
                    readPalette(sizeOfPalette7, bmp);
                    bmp.properties.put("bmp_version", "BMP v. 3.x");
                    break;
                case 3:
                    if (bmp.bitsPerPixel == 16) {
                        bmp.imageType = 8;
                    } else if (bmp.bitsPerPixel == 32) {
                        bmp.imageType = 9;
                    }
                    bmp.redMask = (int) readDWord(bmp.inputStream);
                    bmp.greenMask = (int) readDWord(bmp.inputStream);
                    bmp.blueMask = (int) readDWord(bmp.inputStream);
                    if (size == 56) {
                        bmp.alphaMask = (int) readDWord(bmp.inputStream);
                        bmp.properties.put("alpha_mask", Integer.valueOf(bmp.alphaMask));
                    }
                    bmp.properties.put("red_mask", Integer.valueOf(bmp.redMask));
                    bmp.properties.put("green_mask", Integer.valueOf(bmp.greenMask));
                    bmp.properties.put("blue_mask", Integer.valueOf(bmp.blueMask));
                    if (colorsUsed != 0) {
                        int sizeOfPalette13 = ((int) colorsUsed) * 4;
                        readPalette(sizeOfPalette13, bmp);
                    }
                    bmp.properties.put("bmp_version", "BMP v. 3.x NT");
                    break;
                default:
                    throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.INVALID_BMP_FILE_COMPRESSION);
            }
        } else {
            bmp.properties.put("bmp_version", "BMP v. 2.x");
            if (bmp.bitsPerPixel == 1) {
                bmp.imageType = 0;
            } else if (bmp.bitsPerPixel == 4) {
                bmp.imageType = 1;
            } else if (bmp.bitsPerPixel == 8) {
                bmp.imageType = 2;
            } else if (bmp.bitsPerPixel == 24) {
                bmp.imageType = 3;
            }
            int numberOfEntries3 = (int) (((bmp.bitmapOffset - 14) - size2) / 3);
            int sizeOfPalette14 = numberOfEntries3 * 3;
            if (bmp.bitmapOffset == size2) {
                switch (bmp.imageType) {
                    case 0:
                        sizeOfPalette14 = 6;
                        break;
                    case 1:
                        sizeOfPalette14 = 48;
                        break;
                    case 2:
                        sizeOfPalette14 = ViewUtils.EDGE_TO_EDGE_FLAGS;
                        break;
                    case 3:
                        sizeOfPalette14 = 0;
                        break;
                }
                bmp.bitmapOffset = sizeOfPalette14 + size2;
            }
            readPalette(sizeOfPalette14, bmp);
        }
        int numberOfEntries4 = bmp.height;
        if (numberOfEntries4 > 0) {
            i = 1;
            bmp.isBottomUp = true;
        } else {
            i = 1;
            bmp.isBottomUp = false;
            bmp.height = Math.abs(bmp.height);
        }
        if (bmp.bitsPerPixel == i || bmp.bitsPerPixel == 4 || bmp.bitsPerPixel == 8) {
            bmp.numBands = 1;
            if (bmp.imageType == 0 || bmp.imageType == 1 || bmp.imageType == 2) {
                int sizep = bmp.palette.length / 3;
                if (sizep > 256) {
                    sizep = 256;
                }
                byte[] r = new byte[sizep];
                byte[] g = new byte[sizep];
                byte[] b = new byte[sizep];
                for (int i2 = 0; i2 < sizep; i2++) {
                    int off = i2 * 3;
                    b[i2] = bmp.palette[off];
                    g[i2] = bmp.palette[off + 1];
                    r[i2] = bmp.palette[off + 2];
                }
                return;
            }
            int sizep2 = bmp.palette.length / 4;
            if (sizep2 > 256) {
                sizep2 = 256;
            }
            byte[] r2 = new byte[sizep2];
            byte[] g2 = new byte[sizep2];
            byte[] b2 = new byte[sizep2];
            for (int i3 = 0; i3 < sizep2; i3++) {
                int off2 = i3 * 4;
                b2[i3] = bmp.palette[off2];
                g2[i3] = bmp.palette[off2 + 1];
                r2[i3] = bmp.palette[off2 + 2];
            }
        } else if (bmp.bitsPerPixel == 16) {
            bmp.numBands = 3;
        } else if (bmp.bitsPerPixel == 32) {
            bmp.numBands = bmp.alphaMask == 0 ? 3 : 4;
        } else {
            bmp.numBands = 3;
        }
    }

    private static byte[] getPalette(int group, BmpParameters bmp) {
        if (bmp.palette == null) {
            return null;
        }
        byte[] np = new byte[(bmp.palette.length / group) * 3];
        int e = bmp.palette.length / group;
        for (int k = 0; k < e; k++) {
            int src = k * group;
            int dest = k * 3;
            int src2 = src + 1;
            np[dest + 2] = bmp.palette[src];
            np[dest + 1] = bmp.palette[src2];
            np[dest] = bmp.palette[src2 + 1];
        }
        return np;
    }

    private static boolean getImage(BmpParameters bmp) throws IOException {
        switch (bmp.imageType) {
            case 0:
                read1Bit(3, bmp);
                return true;
            case 1:
                read4Bit(3, bmp);
                return true;
            case 2:
                read8Bit(3, bmp);
                return true;
            case 3:
                byte[] bdata = new byte[bmp.width * bmp.height * 3];
                read24Bit(bdata, bmp);
                RawImageHelper.updateRawImageParameters(bmp.image, bmp.width, bmp.height, 3, 8, bdata);
                return true;
            case 4:
                read1Bit(4, bmp);
                return true;
            case 5:
                switch ((int) bmp.compression) {
                    case 0:
                        read4Bit(4, bmp);
                        break;
                    case 1:
                    default:
                        throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.INVALID_BMP_FILE_COMPRESSION);
                    case 2:
                        readRLE4(bmp);
                        break;
                }
                return true;
            case 6:
                switch ((int) bmp.compression) {
                    case 0:
                        read8Bit(4, bmp);
                        break;
                    case 1:
                        readRLE8(bmp);
                        break;
                    default:
                        throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.INVALID_BMP_FILE_COMPRESSION);
                }
                return true;
            case 7:
                byte[] bdata2 = new byte[bmp.width * bmp.height * 3];
                read24Bit(bdata2, bmp);
                RawImageHelper.updateRawImageParameters(bmp.image, bmp.width, bmp.height, 3, 8, bdata2);
                return true;
            case 8:
                read1632Bit(false, bmp);
                return true;
            case 9:
                read1632Bit(true, bmp);
                return true;
            case 10:
                read1Bit(4, bmp);
                return true;
            case 11:
                switch ((int) bmp.compression) {
                    case 0:
                        read4Bit(4, bmp);
                        break;
                    case 1:
                    default:
                        throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.INVALID_BMP_FILE_COMPRESSION);
                    case 2:
                        readRLE4(bmp);
                        break;
                }
                return true;
            case 12:
                switch ((int) bmp.compression) {
                    case 0:
                        read8Bit(4, bmp);
                        break;
                    case 1:
                        readRLE8(bmp);
                        break;
                    default:
                        throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.INVALID_BMP_FILE_COMPRESSION);
                }
                return true;
            case 13:
                read1632Bit(false, bmp);
                return true;
            case 14:
                byte[] bdata3 = new byte[bmp.width * bmp.height * 3];
                read24Bit(bdata3, bmp);
                RawImageHelper.updateRawImageParameters(bmp.image, bmp.width, bmp.height, 3, 8, bdata3);
                return true;
            case 15:
                read1632Bit(true, bmp);
                return true;
            default:
                return false;
        }
    }

    private static void indexedModel(byte[] bdata, int bpc, int paletteEntries, BmpParameters bmp) {
        RawImageHelper.updateRawImageParameters(bmp.image, bmp.width, bmp.height, 1, bpc, bdata);
        byte[] np = getPalette(paletteEntries, bmp);
        int len = np.length;
        Object[] colorSpace = {"/Indexed", "/DeviceRGB", Integer.valueOf((len / 3) - 1), PdfEncodings.convertToString(np, null)};
        bmp.additional = new HashMap();
        bmp.additional.put(ExifInterface.TAG_COLOR_SPACE, colorSpace);
    }

    private static void readPalette(int sizeOfPalette, BmpParameters bmp) throws IOException {
        if (sizeOfPalette == 0) {
            return;
        }
        bmp.palette = new byte[sizeOfPalette];
        int bytesRead = 0;
        while (bytesRead < sizeOfPalette) {
            int r = bmp.inputStream.read(bmp.palette, bytesRead, sizeOfPalette - bytesRead);
            if (r < 0) {
                throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.INCOMPLETE_PALETTE);
            }
            bytesRead += r;
        }
        bmp.properties.put("palette", bmp.palette);
    }

    private static void read1Bit(int paletteEntries, BmpParameters bmp) throws IOException {
        byte[] bdata = new byte[((bmp.width + 7) / 8) * bmp.height];
        int padding = 0;
        int bytesPerScanline = (int) Math.ceil(bmp.width / 8.0d);
        int remainder = bytesPerScanline % 4;
        if (remainder != 0) {
            padding = 4 - remainder;
        }
        int imSize = (bytesPerScanline + padding) * bmp.height;
        byte[] values = new byte[imSize];
        int bytesRead = 0;
        while (bytesRead < imSize) {
            bytesRead += bmp.inputStream.read(values, bytesRead, imSize - bytesRead);
        }
        if (bmp.isBottomUp) {
            for (int i = 0; i < bmp.height; i++) {
                System.arraycopy(values, imSize - ((i + 1) * (bytesPerScanline + padding)), bdata, i * bytesPerScanline, bytesPerScanline);
            }
        } else {
            for (int i2 = 0; i2 < bmp.height; i2++) {
                System.arraycopy(values, (bytesPerScanline + padding) * i2, bdata, i2 * bytesPerScanline, bytesPerScanline);
            }
        }
        indexedModel(bdata, 1, paletteEntries, bmp);
    }

    private static void read4Bit(int paletteEntries, BmpParameters bmp) throws IOException {
        byte[] bdata = new byte[((bmp.width + 1) / 2) * bmp.height];
        int padding = 0;
        int bytesPerScanline = (int) Math.ceil(bmp.width / 2.0d);
        int remainder = bytesPerScanline % 4;
        if (remainder != 0) {
            padding = 4 - remainder;
        }
        int imSize = (bytesPerScanline + padding) * bmp.height;
        byte[] values = new byte[imSize];
        int bytesRead = 0;
        while (bytesRead < imSize) {
            bytesRead += bmp.inputStream.read(values, bytesRead, imSize - bytesRead);
        }
        if (bmp.isBottomUp) {
            for (int i = 0; i < bmp.height; i++) {
                System.arraycopy(values, imSize - ((i + 1) * (bytesPerScanline + padding)), bdata, i * bytesPerScanline, bytesPerScanline);
            }
        } else {
            for (int i2 = 0; i2 < bmp.height; i2++) {
                System.arraycopy(values, (bytesPerScanline + padding) * i2, bdata, i2 * bytesPerScanline, bytesPerScanline);
            }
        }
        indexedModel(bdata, 4, paletteEntries, bmp);
    }

    private static void read8Bit(int paletteEntries, BmpParameters bmp) throws IOException {
        byte[] bdata = new byte[bmp.width * bmp.height];
        int padding = 0;
        int bitsPerScanline = bmp.width * 8;
        if (bitsPerScanline % 32 != 0) {
            int padding2 = (((bitsPerScanline / 32) + 1) * 32) - bitsPerScanline;
            padding = (int) Math.ceil(padding2 / 8.0d);
        }
        int padding3 = bmp.width;
        int imSize = (padding3 + padding) * bmp.height;
        byte[] values = new byte[imSize];
        int bytesRead = 0;
        while (bytesRead < imSize) {
            bytesRead += bmp.inputStream.read(values, bytesRead, imSize - bytesRead);
        }
        if (bmp.isBottomUp) {
            for (int i = 0; i < bmp.height; i++) {
                System.arraycopy(values, imSize - ((i + 1) * (bmp.width + padding)), bdata, bmp.width * i, bmp.width);
            }
        } else {
            for (int i2 = 0; i2 < bmp.height; i2++) {
                System.arraycopy(values, (bmp.width + padding) * i2, bdata, bmp.width * i2, bmp.width);
            }
        }
        indexedModel(bdata, 8, paletteEntries, bmp);
    }

    private static void read24Bit(byte[] bdata, BmpParameters bmp) throws IOException {
        int padding = 0;
        int bitsPerScanline = bmp.width * 24;
        if (bitsPerScanline % 32 != 0) {
            int padding2 = (((bitsPerScanline / 32) + 1) * 32) - bitsPerScanline;
            padding = (int) Math.ceil(padding2 / 8.0d);
        }
        int padding3 = bmp.width;
        int imSize = (((padding3 * 3) + 3) / 4) * 4 * bmp.height;
        byte[] values = new byte[imSize];
        int bytesRead = 0;
        while (bytesRead < imSize) {
            int r = bmp.inputStream.read(values, bytesRead, imSize - bytesRead);
            if (r < 0) {
                break;
            }
            bytesRead += r;
        }
        int l = 0;
        if (bmp.isBottomUp) {
            int max = ((bmp.width * bmp.height) * 3) - 1;
            int count = -padding;
            for (int i = 0; i < bmp.height; i++) {
                int l2 = (max - (((i + 1) * bmp.width) * 3)) + 1;
                count += padding;
                for (int j = 0; j < bmp.width; j++) {
                    int count2 = count + 1;
                    bdata[l2 + 2] = values[count];
                    int count3 = count2 + 1;
                    bdata[l2 + 1] = values[count2];
                    count = count3 + 1;
                    bdata[l2] = values[count3];
                    l2 += 3;
                }
            }
            return;
        }
        int count4 = -padding;
        for (int i2 = 0; i2 < bmp.height; i2++) {
            count4 += padding;
            for (int j2 = 0; j2 < bmp.width; j2++) {
                int count5 = count4 + 1;
                bdata[l + 2] = values[count4];
                int count6 = count5 + 1;
                bdata[l + 1] = values[count5];
                count4 = count6 + 1;
                bdata[l] = values[count6];
                l += 3;
            }
        }
    }

    private static int findMask(int mask) {
        for (int k = 0; k < 32 && (mask & 1) != 1; k++) {
            mask >>>= 1;
        }
        return mask;
    }

    private static int findShift(int mask) {
        int k = 0;
        while (k < 32 && (mask & 1) != 1) {
            mask >>>= 1;
            k++;
        }
        return k;
    }

    private static void read1632Bit(boolean is32, BmpParameters bmp) throws IOException {
        int red_mask;
        int red_shift;
        int imSize;
        int v;
        int v2;
        int red_mask2 = findMask(bmp.redMask);
        int red_shift2 = findShift(bmp.redMask);
        int red_factor = red_mask2 + 1;
        int green_mask = findMask(bmp.greenMask);
        int green_shift = findShift(bmp.greenMask);
        int green_factor = green_mask + 1;
        int blue_mask = findMask(bmp.blueMask);
        int blue_shift = findShift(bmp.blueMask);
        int blue_factor = blue_mask + 1;
        byte[] bdata = new byte[bmp.width * bmp.height * 3];
        int padding = 0;
        if (!is32) {
            int bitsPerScanline = bmp.width * 16;
            if (bitsPerScanline % 32 != 0) {
                padding = (int) Math.ceil(((((bitsPerScanline / 32) + 1) * 32) - bitsPerScanline) / 8.0d);
            }
        }
        int imSize2 = (int) bmp.imageSize;
        if (imSize2 == 0) {
            red_mask = red_mask2;
            red_shift = red_shift2;
            imSize = (int) (bmp.bitmapFileSize - bmp.bitmapOffset);
        } else {
            red_mask = red_mask2;
            red_shift = red_shift2;
            imSize = imSize2;
        }
        int l = 0;
        if (bmp.isBottomUp) {
            int i = bmp.height - 1;
            while (i >= 0) {
                int l2 = bmp.width * 3 * i;
                int j = 0;
                while (j < bmp.width) {
                    if (is32) {
                        v2 = (int) readDWord(bmp.inputStream);
                    } else {
                        v2 = readWord(bmp.inputStream);
                    }
                    int l3 = l2 + 1;
                    int imSize3 = imSize;
                    bdata[l2] = (byte) ((((v2 >>> red_shift) & red_mask) * 256) / red_factor);
                    int l4 = l3 + 1;
                    bdata[l3] = (byte) ((((v2 >>> green_shift) & green_mask) * 256) / green_factor);
                    l2 = l4 + 1;
                    bdata[l4] = (byte) ((((v2 >>> blue_shift) & blue_mask) * 256) / blue_factor);
                    j++;
                    imSize = imSize3;
                }
                int imSize4 = imSize;
                for (int m = 0; m < padding; m++) {
                    bmp.inputStream.read();
                }
                i--;
                imSize = imSize4;
            }
        } else {
            for (int i2 = 0; i2 < bmp.height; i2++) {
                int j2 = 0;
                while (j2 < bmp.width) {
                    if (is32) {
                        v = (int) readDWord(bmp.inputStream);
                    } else {
                        v = readWord(bmp.inputStream);
                    }
                    int l5 = l + 1;
                    bdata[l] = (byte) ((((v >>> red_shift) & red_mask) * 256) / red_factor);
                    int l6 = l5 + 1;
                    bdata[l5] = (byte) ((((v >>> green_shift) & green_mask) * 256) / green_factor);
                    bdata[l6] = (byte) ((((v >>> blue_shift) & blue_mask) * 256) / blue_factor);
                    j2++;
                    l = l6 + 1;
                }
                for (int m2 = 0; m2 < padding; m2++) {
                    bmp.inputStream.read();
                }
            }
        }
        RawImageHelper.updateRawImageParameters(bmp.image, bmp.width, bmp.height, 3, 8, bdata);
    }

    private static void readRLE8(BmpParameters bmp) throws IOException {
        int imSize = (int) bmp.imageSize;
        if (imSize == 0) {
            imSize = (int) (bmp.bitmapFileSize - bmp.bitmapOffset);
        }
        byte[] values = new byte[imSize];
        int bytesRead = 0;
        while (bytesRead < imSize) {
            bytesRead += bmp.inputStream.read(values, bytesRead, imSize - bytesRead);
        }
        byte[] val = decodeRLE(true, values, bmp);
        int imSize2 = bmp.width * bmp.height;
        if (bmp.isBottomUp) {
            byte[] temp = new byte[val.length];
            int bytesPerScanline = bmp.width;
            for (int i = 0; i < bmp.height; i++) {
                System.arraycopy(val, imSize2 - ((i + 1) * bytesPerScanline), temp, i * bytesPerScanline, bytesPerScanline);
            }
            val = temp;
        }
        indexedModel(val, 8, 4, bmp);
    }

    private static void readRLE4(BmpParameters bmp) throws IOException {
        int imSize = (int) bmp.imageSize;
        if (imSize == 0) {
            imSize = (int) (bmp.bitmapFileSize - bmp.bitmapOffset);
        }
        byte[] values = new byte[imSize];
        int bytesRead = 0;
        while (bytesRead < imSize) {
            bytesRead += bmp.inputStream.read(values, bytesRead, imSize - bytesRead);
        }
        byte[] val = decodeRLE(false, values, bmp);
        if (bmp.isBottomUp) {
            val = new byte[bmp.width * bmp.height];
            int l = 0;
            for (int i = bmp.height - 1; i >= 0; i--) {
                int index = bmp.width * i;
                int lineEnd = bmp.width + l;
                while (l != lineEnd) {
                    val[l] = val[index];
                    l++;
                    index++;
                }
            }
        }
        int stride = (bmp.width + 1) / 2;
        byte[] bdata = new byte[bmp.height * stride];
        int ptr = 0;
        int sh = 0;
        for (int h = 0; h < bmp.height; h++) {
            for (int w = 0; w < bmp.width; w++) {
                if ((w & 1) == 0) {
                    bdata[(w / 2) + sh] = (byte) (val[ptr] << 4);
                    ptr++;
                } else {
                    int i2 = (w / 2) + sh;
                    bdata[i2] = (byte) (((byte) (val[ptr] & 15)) | bdata[i2]);
                    ptr++;
                }
            }
            sh += stride;
        }
        indexedModel(bdata, 4, 4, bmp);
    }

    private static byte[] decodeRLE(boolean is8, byte[] values, BmpParameters bmp) {
        byte[] val = new byte[bmp.width * bmp.height];
        int count = 0;
        int x = 0;
        int q = 0;
        int y = 0;
        while (y < bmp.height && count < values.length) {
            try {
                int ptr = count + 1;
                int count2 = values[count] & 255;
                if (count2 != 0) {
                    int ptr2 = ptr + 1;
                    int bt = values[ptr] & 255;
                    if (is8) {
                        int i = count2;
                        while (i != 0) {
                            val[q] = (byte) bt;
                            i--;
                            q++;
                        }
                    } else {
                        int i2 = 0;
                        while (i2 < count2) {
                            int q2 = q + 1;
                            val[q] = (byte) ((i2 & 1) == 1 ? bt & 15 : (bt >>> 4) & 15);
                            i2++;
                            q = q2;
                        }
                    }
                    x += count2;
                    count = ptr2;
                } else {
                    int ptr3 = ptr + 1;
                    int count3 = values[ptr] & 255;
                    if (count3 != 1) {
                        switch (count3) {
                            case 0:
                                x = 0;
                                y++;
                                int q3 = bmp.width * y;
                                q = q3;
                                count = ptr3;
                                continue;
                            case 1:
                            default:
                                if (is8) {
                                    int q4 = count3;
                                    while (q4 != 0) {
                                        val[q] = (byte) (values[ptr3] & 255);
                                        q4--;
                                        q++;
                                        ptr3++;
                                    }
                                } else {
                                    int bt2 = 0;
                                    int i3 = 0;
                                    while (i3 < count3) {
                                        if ((i3 & 1) == 0) {
                                            bt2 = values[ptr3] & 255;
                                            ptr3++;
                                        }
                                        int ptr4 = q + 1;
                                        val[q] = (byte) ((i3 & 1) == 1 ? bt2 & 15 : (bt2 >>> 4) & 15);
                                        i3++;
                                        q = ptr4;
                                    }
                                }
                                x += count3;
                                if (is8) {
                                    if ((count3 & 1) == 1) {
                                        count = ptr3 + 1;
                                        break;
                                    } else {
                                        count = ptr3;
                                        break;
                                    }
                                } else if ((count3 & 3) == 1 || (count3 & 3) == 2) {
                                    count = ptr3 + 1;
                                    continue;
                                } else {
                                    count = ptr3;
                                }
                                break;
                            case 2:
                                int i4 = ptr3 + 1;
                                x += values[ptr3] & UByte.MAX_VALUE;
                                int ptr5 = i4 + 1;
                                y += values[i4] & 255;
                                int q5 = (bmp.width * y) + x;
                                q = q5;
                                count = ptr5;
                                continue;
                        }
                    }
                }
            } catch (Exception e) {
            }
        }
        return val;
    }

    private static int readUnsignedByte(InputStream stream) throws IOException {
        return stream.read() & 255;
    }

    private static int readUnsignedShort(InputStream stream) throws IOException {
        int b1 = readUnsignedByte(stream);
        int b2 = readUnsignedByte(stream);
        return ((b2 << 8) | b1) & 65535;
    }

    private static int readShort(InputStream stream) throws IOException {
        int b1 = readUnsignedByte(stream);
        int b2 = readUnsignedByte(stream);
        return (b2 << 8) | b1;
    }

    private static int readWord(InputStream stream) throws IOException {
        return readUnsignedShort(stream);
    }

    private static long readUnsignedInt(InputStream stream) throws IOException {
        int b1 = readUnsignedByte(stream);
        int b2 = readUnsignedByte(stream);
        int b3 = readUnsignedByte(stream);
        int b4 = readUnsignedByte(stream);
        long l = (b4 << 24) | (b3 << 16) | (b2 << 8) | b1;
        return (-1) & l;
    }

    private static int readInt(InputStream stream) throws IOException {
        int b1 = readUnsignedByte(stream);
        int b2 = readUnsignedByte(stream);
        int b3 = readUnsignedByte(stream);
        int b4 = readUnsignedByte(stream);
        return (b4 << 24) | (b3 << 16) | (b2 << 8) | b1;
    }

    private static long readDWord(InputStream stream) throws IOException {
        return readUnsignedInt(stream);
    }

    private static int readLong(InputStream stream) throws IOException {
        return readInt(stream);
    }
}
