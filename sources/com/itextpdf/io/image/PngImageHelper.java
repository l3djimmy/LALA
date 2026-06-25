package com.itextpdf.io.image;

import com.itextpdf.io.colors.IccProfile;
import com.itextpdf.io.exceptions.IoExceptionMessageConstant;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.io.source.ByteArrayOutputStream;
import com.itextpdf.io.util.FilterUtil;
import com.itextpdf.io.util.StreamUtil;
import com.itextpdf.layout.properties.Property;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import kotlin.UByte;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
class PngImageHelper {
    public static final String IDAT = "IDAT";
    public static final String IEND = "IEND";
    public static final String IHDR = "IHDR";
    public static final String PLTE = "PLTE";
    private static final int PNG_FILTER_AVERAGE = 3;
    private static final int PNG_FILTER_NONE = 0;
    private static final int PNG_FILTER_PAETH = 4;
    private static final int PNG_FILTER_SUB = 1;
    private static final int PNG_FILTER_UP = 2;
    private static final int TRANSFERSIZE = 4096;
    public static final String cHRM = "cHRM";
    public static final String gAMA = "gAMA";
    public static final String iCCP = "iCCP";
    public static final String pHYs = "pHYs";
    public static final String sRGB = "sRGB";
    public static final String tRNS = "tRNS";
    public static final int[] PNGID = {Property.ADD_MARKED_CONTENT_TEXT, 80, 78, 71, 13, 10, 26, 10};
    private static final String[] intents = {PngImageHelperConstants.PERCEPTUAL, PngImageHelperConstants.RELATIVE_COLORIMETRIC, PngImageHelperConstants.SATURATION, PngImageHelperConstants.ABSOLUTE_COLORMETRIC};

    PngImageHelper() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class PngParameters {
        float XYRatio;
        int bitDepth;
        int bytesPerPixel;
        int compressionMethod;
        InputStream dataStream;
        int dpiX;
        int dpiY;
        int filterMethod;
        boolean genBWMask;
        int height;
        IccProfile iccProfile;
        PngImageData image;
        byte[] imageData;
        int inputBands;
        String intent;
        int interlaceMethod;
        boolean palShades;
        byte[] smask;
        byte[] trans;
        int width;
        Map<String, Object> additional = new HashMap();
        ByteArrayOutputStream idat = new ByteArrayOutputStream();
        int transRedGray = -1;
        int transGreen = -1;
        int transBlue = -1;

        PngParameters(PngImageData image) {
            this.image = image;
        }
    }

    public static void processImage(ImageData image) {
        if (image.getOriginalType() != ImageType.PNG) {
            throw new IllegalArgumentException("PNG image expected");
        }
        InputStream pngStream = null;
        try {
            try {
                if (image.getData() == null) {
                    image.loadData();
                }
                pngStream = new ByteArrayInputStream(image.getData());
                image.imageSize = image.getData().length;
                PngParameters png = new PngParameters((PngImageData) image);
                processPng(pngStream, png);
                try {
                    pngStream.close();
                } catch (IOException e) {
                }
                RawImageHelper.updateImageAttributes(png.image, png.additional);
            } catch (IOException e2) {
                throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.PNG_IMAGE_EXCEPTION, (Throwable) e2);
            }
        } catch (Throwable th) {
            if (pngStream != null) {
                try {
                    pngStream.close();
                } catch (IOException e3) {
                }
            }
            throw th;
        }
    }

    private static void processPng(InputStream pngStream, PngParameters png) throws IOException {
        int components;
        int bpc;
        readPng(pngStream, png);
        int colorType = png.image.getColorType();
        if (png.iccProfile != null && png.iccProfile.getNumComponents() != getExpectedNumberOfColorComponents(png)) {
            LoggerFactory.getLogger(PngImageHelper.class).warn(IoLogMessageConstant.PNG_IMAGE_HAS_ICC_PROFILE_WITH_INCOMPATIBLE_NUMBER_OF_COLOR_COMPONENTS);
        }
        int pal0 = 0;
        int palIdx = 0;
        boolean needDecode = false;
        try {
            png.palShades = false;
            int i = 1;
            if (png.trans != null) {
                int k = 0;
                while (true) {
                    if (k < png.trans.length) {
                        int n = png.trans[k] & UByte.MAX_VALUE;
                        if (n == 0) {
                            pal0++;
                            palIdx = k;
                        }
                        if (n == 0 || n == 255) {
                            k++;
                        } else {
                            png.palShades = true;
                            break;
                        }
                    } else {
                        break;
                    }
                }
            }
            int k2 = colorType & 4;
            if (k2 != 0) {
                png.palShades = true;
            }
            png.genBWMask = !png.palShades && (pal0 > 1 || png.transRedGray >= 0);
            if (!png.palShades && !png.genBWMask && pal0 == 1) {
                png.additional.put(PngImageHelperConstants.MASK, new int[]{palIdx, palIdx});
            }
            if (png.interlaceMethod == 1 || png.bitDepth == 16 || (colorType & 4) != 0 || png.palShades || png.genBWMask) {
                needDecode = true;
            }
            switch (colorType) {
                case 0:
                    png.inputBands = 1;
                    break;
                case 2:
                    png.inputBands = 3;
                    break;
                case 3:
                    png.inputBands = 1;
                    break;
                case 4:
                    png.inputBands = 2;
                    break;
                case 6:
                    png.inputBands = 4;
                    break;
            }
            if (needDecode) {
                decodeIdat(png);
            }
            int components2 = png.inputBands;
            if ((colorType & 4) == 0) {
                components = components2;
            } else {
                components = components2 - 1;
            }
            int components3 = png.bitDepth;
            if (components3 != 16) {
                bpc = components3;
            } else {
                bpc = 8;
            }
            if (png.imageData == null) {
                RawImageHelper.updateRawImageParameters(png.image, png.width, png.height, components, bpc, png.idat.toByteArray());
                png.image.setDeflated(true);
                Map<String, Object> decodeparms = new HashMap<>();
                decodeparms.put(PngImageHelperConstants.BITS_PER_COMPONENT, Integer.valueOf(png.bitDepth));
                decodeparms.put(PngImageHelperConstants.PREDICTOR, 15);
                decodeparms.put(PngImageHelperConstants.COLUMNS, Integer.valueOf(png.width));
                if (!png.image.isIndexed() && !png.image.isGrayscaleImage()) {
                    i = 3;
                }
                decodeparms.put(PngImageHelperConstants.COLORS, Integer.valueOf(i));
                png.image.decodeParms = decodeparms;
            } else if (png.image.isIndexed()) {
                RawImageHelper.updateRawImageParameters(png.image, png.width, png.height, components, bpc, png.imageData);
            } else {
                RawImageHelper.updateRawImageParameters(png.image, png.width, png.height, components, bpc, png.imageData, null);
            }
            if (png.intent != null) {
                png.additional.put(PngImageHelperConstants.INTENT, png.intent);
            }
            if (png.iccProfile != null) {
                png.image.setProfile(png.iccProfile);
            }
            if (png.palShades) {
                RawImageData im2 = (RawImageData) ImageDataFactory.createRawImage(null);
                RawImageHelper.updateRawImageParameters(im2, png.width, png.height, 1, 8, png.smask);
                im2.makeMask();
                png.image.setImageMask(im2);
            }
            if (png.genBWMask) {
                RawImageData im22 = (RawImageData) ImageDataFactory.createRawImage(null);
                RawImageHelper.updateRawImageParameters(im22, png.width, png.height, 1, 1, png.smask);
                im22.makeMask();
                png.image.setImageMask(im22);
            }
            png.image.setDpi(png.dpiX, png.dpiY);
            png.image.setXYRatio(png.XYRatio);
        } catch (Exception e) {
            throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.PNG_IMAGE_EXCEPTION, (Throwable) e);
        }
    }

    private static int getExpectedNumberOfColorComponents(PngParameters png) {
        return png.image.isGrayscaleImage() ? 1 : 3;
    }

    /* JADX WARN: Code restructure failed: missing block: B:123:0x031e, code lost:
        throw new java.io.IOException("corrupted.png.file");
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static void readPng(java.io.InputStream r18, com.itextpdf.io.image.PngImageHelper.PngParameters r19) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 812
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.itextpdf.io.image.PngImageHelper.readPng(java.io.InputStream, com.itextpdf.io.image.PngImageHelper$PngParameters):void");
    }

    private static boolean checkMarker(String s) {
        if (s.length() != 4) {
            return false;
        }
        for (int k = 0; k < 4; k++) {
            char c = s.charAt(k);
            if ((c < 'a' || c > 'z') && (c < 'A' || c > 'Z')) {
                return false;
            }
        }
        return true;
    }

    private static void decodeIdat(PngParameters png) {
        int nbitDepth;
        int size;
        int nbitDepth2 = png.bitDepth;
        if (nbitDepth2 != 16) {
            nbitDepth = nbitDepth2;
        } else {
            nbitDepth = 8;
        }
        int size2 = -1;
        png.bytesPerPixel = png.bitDepth == 16 ? 2 : 1;
        switch (png.image.getColorType()) {
            case 0:
                int size3 = (((png.width * nbitDepth) + 7) / 8) * png.height;
                size = size3;
                break;
            case 1:
            case 5:
            default:
                size = -1;
                break;
            case 2:
                int size4 = png.width * 3 * png.height;
                png.bytesPerPixel *= 3;
                size = size4;
                break;
            case 3:
                if (png.interlaceMethod == 1) {
                    size2 = (((png.width * nbitDepth) + 7) / 8) * png.height;
                }
                png.bytesPerPixel = 1;
                size = size2;
                break;
            case 4:
                int size5 = png.width * png.height;
                png.bytesPerPixel *= 2;
                size = size5;
                break;
            case 6:
                int size6 = png.width * 3 * png.height;
                png.bytesPerPixel *= 4;
                size = size6;
                break;
        }
        if (size >= 0) {
            png.imageData = new byte[size];
        }
        if (png.palShades) {
            png.smask = new byte[png.width * png.height];
        } else if (png.genBWMask) {
            png.smask = new byte[((png.width + 7) / 8) * png.height];
        }
        ByteArrayInputStream bai = new ByteArrayInputStream(png.idat.toByteArray());
        png.dataStream = FilterUtil.getInflaterInputStream(bai);
        if (png.interlaceMethod != 1) {
            decodePass(0, 0, 1, 1, png.width, png.height, png);
            return;
        }
        decodePass(0, 0, 8, 8, (png.width + 7) / 8, (png.height + 7) / 8, png);
        decodePass(4, 0, 8, 8, (png.width + 3) / 8, (png.height + 7) / 8, png);
        decodePass(0, 4, 4, 8, (png.width + 3) / 4, (png.height + 3) / 8, png);
        decodePass(2, 0, 4, 4, (png.width + 1) / 4, (png.height + 3) / 4, png);
        decodePass(0, 2, 2, 4, (png.width + 1) / 2, (png.height + 1) / 4, png);
        decodePass(1, 0, 2, 2, png.width / 2, (png.height + 1) / 2, png);
        decodePass(0, 1, 1, 2, png.width, png.height / 2, png);
    }

    private static void decodePass(int xOffset, int yOffset, int xStep, int yStep, int passWidth, int passHeight, PngParameters png) {
        int filter;
        PngParameters pngParameters = png;
        if (passWidth == 0 || passHeight == 0) {
            return;
        }
        int bytesPerRow = (((pngParameters.inputBands * passWidth) * pngParameters.bitDepth) + 7) / 8;
        byte[] curr = new byte[bytesPerRow];
        byte[] prior = new byte[bytesPerRow];
        byte[] prior2 = prior;
        int srcY = 0;
        int dstY = yOffset;
        byte[] curr2 = curr;
        while (srcY < passHeight) {
            int filter2 = 0;
            try {
                filter2 = pngParameters.dataStream.read();
                StreamUtil.readFully(pngParameters.dataStream, curr2, 0, bytesPerRow);
                filter = filter2;
            } catch (Exception e) {
                filter = filter2;
            }
            switch (filter) {
                case 0:
                    break;
                case 1:
                    decodeSubFilter(curr2, bytesPerRow, pngParameters.bytesPerPixel);
                    break;
                case 2:
                    decodeUpFilter(curr2, prior2, bytesPerRow);
                    break;
                case 3:
                    decodeAverageFilter(curr2, prior2, bytesPerRow, pngParameters.bytesPerPixel);
                    break;
                case 4:
                    decodePaethFilter(curr2, prior2, bytesPerRow, pngParameters.bytesPerPixel);
                    break;
                default:
                    throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.UNKNOWN_PNG_FILTER);
            }
            processPixels(curr2, xOffset, xStep, dstY, passWidth, pngParameters);
            byte[] tmp = prior2;
            prior2 = curr2;
            curr2 = tmp;
            srcY++;
            dstY += yStep;
            pngParameters = png;
        }
    }

    private static void processPixels(byte[] curr, int xOffset, int step, int y, int width, PngParameters png) {
        int sizes;
        int sizes2;
        int colorType = png.image.getColorType();
        int[] outPixel = getPixel(curr, png);
        switch (colorType) {
            case 0:
            case 3:
            case 4:
                sizes = 1;
                break;
            case 1:
            case 5:
            default:
                sizes = 0;
                break;
            case 2:
            case 6:
                sizes = 3;
                break;
        }
        if (png.imageData == null) {
            sizes2 = sizes;
        } else {
            int yStride = (((png.width * sizes) * (png.bitDepth == 16 ? 8 : png.bitDepth)) + 7) / 8;
            int dstX = xOffset;
            for (int srcX = 0; srcX < width; srcX++) {
                setPixel(png.imageData, outPixel, png.inputBands * srcX, sizes, dstX, y, png.bitDepth, yStride);
                dstX += step;
            }
            sizes2 = sizes;
        }
        if (png.palShades) {
            if ((colorType & 4) != 0) {
                if (png.bitDepth == 16) {
                    for (int k = 0; k < width; k++) {
                        int i = (png.inputBands * k) + sizes2;
                        outPixel[i] = outPixel[i] >>> 8;
                    }
                }
                int yStride2 = png.width;
                int dstX2 = xOffset;
                for (int srcX2 = 0; srcX2 < width; srcX2++) {
                    setPixel(png.smask, outPixel, (png.inputBands * srcX2) + sizes2, 1, dstX2, y, 8, yStride2);
                    dstX2 += step;
                }
                return;
            }
            int yStride3 = png.width;
            int[] v = new int[1];
            int dstX3 = xOffset;
            for (int srcX3 = 0; srcX3 < width; srcX3++) {
                int idx = outPixel[srcX3];
                if (idx < png.trans.length) {
                    v[0] = png.trans[idx];
                } else {
                    v[0] = 255;
                }
                setPixel(png.smask, v, 0, 1, dstX3, y, 8, yStride3);
                dstX3 += step;
            }
        } else if (png.genBWMask) {
            switch (colorType) {
                case 0:
                    int yStride4 = (png.width + 7) / 8;
                    int[] v2 = new int[1];
                    int dstX4 = xOffset;
                    for (int srcX4 = 0; srcX4 < width; srcX4++) {
                        int g = outPixel[srcX4];
                        v2[0] = g == png.transRedGray ? 1 : 0;
                        setPixel(png.smask, v2, 0, 1, dstX4, y, 1, yStride4);
                        dstX4 += step;
                    }
                    return;
                case 1:
                default:
                    return;
                case 2:
                    int yStride5 = (png.width + 7) / 8;
                    int[] v3 = new int[1];
                    int dstX5 = xOffset;
                    for (int srcX5 = 0; srcX5 < width; srcX5++) {
                        int markRed = png.inputBands * srcX5;
                        v3[0] = (outPixel[markRed] == png.transRedGray && outPixel[markRed + 1] == png.transGreen && outPixel[markRed + 2] == png.transBlue) ? 1 : 0;
                        setPixel(png.smask, v3, 0, 1, dstX5, y, 1, yStride5);
                        dstX5 += step;
                    }
                    return;
                case 3:
                    int yStride6 = (png.width + 7) / 8;
                    int[] v4 = new int[1];
                    int dstX6 = xOffset;
                    for (int srcX6 = 0; srcX6 < width; srcX6++) {
                        int idx2 = outPixel[srcX6];
                        v4[0] = (idx2 >= png.trans.length || png.trans[idx2] != 0) ? 0 : 1;
                        setPixel(png.smask, v4, 0, 1, dstX6, y, 1, yStride6);
                        dstX6 += step;
                    }
                    return;
            }
        }
    }

    private static int getPixel(byte[] image, int x, int y, int bitDepth, int bytesPerRow) {
        if (bitDepth != 8) {
            int pos = (bytesPerRow * y) + (x / (8 / bitDepth));
            int v = image[pos] >> ((8 - ((x % (8 / bitDepth)) * bitDepth)) - bitDepth);
            return v & ((1 << bitDepth) - 1);
        }
        int pos2 = (bytesPerRow * y) + x;
        return image[pos2] & UByte.MAX_VALUE;
    }

    static void setPixel(byte[] image, int[] data, int offset, int size, int x, int y, int bitDepth, int bytesPerRow) {
        if (bitDepth == 8) {
            int pos = (bytesPerRow * y) + (size * x);
            for (int k = 0; k < size; k++) {
                image[pos + k] = (byte) data[k + offset];
            }
        } else if (bitDepth != 16) {
            int pos2 = (bytesPerRow * y) + (x / (8 / bitDepth));
            int v = data[offset] << ((8 - ((x % (8 / bitDepth)) * bitDepth)) - bitDepth);
            image[pos2] = (byte) (image[pos2] | ((byte) v));
        } else {
            int pos3 = (bytesPerRow * y) + (size * x);
            for (int k2 = 0; k2 < size; k2++) {
                image[pos3 + k2] = (byte) (data[k2 + offset] >>> 8);
            }
        }
    }

    private static int[] getPixel(byte[] curr, PngParameters png) {
        switch (png.bitDepth) {
            case 8:
                int[] res = new int[curr.length];
                for (int k = 0; k < res.length; k++) {
                    res[k] = curr[k] & UByte.MAX_VALUE;
                }
                return res;
            case 16:
                int[] res2 = new int[curr.length / 2];
                for (int k2 = 0; k2 < res2.length; k2++) {
                    res2[k2] = ((curr[k2 * 2] & UByte.MAX_VALUE) << 8) + (curr[(k2 * 2) + 1] & UByte.MAX_VALUE);
                }
                return res2;
            default:
                int[] res3 = new int[(curr.length * 8) / png.bitDepth];
                int idx = 0;
                int passes = 8 / png.bitDepth;
                int mask = (1 << png.bitDepth) - 1;
                for (byte b : curr) {
                    int j = passes - 1;
                    while (j >= 0) {
                        res3[idx] = (b >>> (png.bitDepth * j)) & mask;
                        j--;
                        idx++;
                    }
                }
                return res3;
        }
    }

    private static void decodeSubFilter(byte[] curr, int count, int bpp) {
        for (int i = bpp; i < count; i++) {
            int val = curr[i] & UByte.MAX_VALUE;
            curr[i] = (byte) (val + (curr[i - bpp] & UByte.MAX_VALUE));
        }
    }

    private static void decodeUpFilter(byte[] curr, byte[] prev, int count) {
        for (int i = 0; i < count; i++) {
            int raw = curr[i] & UByte.MAX_VALUE;
            int prior = prev[i] & UByte.MAX_VALUE;
            curr[i] = (byte) (raw + prior);
        }
    }

    private static void decodeAverageFilter(byte[] curr, byte[] prev, int count, int bpp) {
        for (int i = 0; i < bpp; i++) {
            int raw = curr[i] & UByte.MAX_VALUE;
            int priorRow = prev[i] & UByte.MAX_VALUE;
            curr[i] = (byte) ((priorRow / 2) + raw);
        }
        for (int i2 = bpp; i2 < count; i2++) {
            int raw2 = curr[i2] & UByte.MAX_VALUE;
            int priorPixel = curr[i2 - bpp] & UByte.MAX_VALUE;
            int priorRow2 = prev[i2] & UByte.MAX_VALUE;
            curr[i2] = (byte) (((priorPixel + priorRow2) / 2) + raw2);
        }
    }

    private static int paethPredictor(int a, int b, int c) {
        int p = (a + b) - c;
        int pa = Math.abs(p - a);
        int pb = Math.abs(p - b);
        int pc = Math.abs(p - c);
        if (pa <= pb && pa <= pc) {
            return a;
        }
        if (pb <= pc) {
            return b;
        }
        return c;
    }

    private static void decodePaethFilter(byte[] curr, byte[] prev, int count, int bpp) {
        for (int i = 0; i < bpp; i++) {
            int raw = curr[i] & UByte.MAX_VALUE;
            int priorRow = prev[i] & UByte.MAX_VALUE;
            curr[i] = (byte) (raw + priorRow);
        }
        for (int i2 = bpp; i2 < count; i2++) {
            int raw2 = curr[i2] & UByte.MAX_VALUE;
            int priorPixel = curr[i2 - bpp] & UByte.MAX_VALUE;
            int priorRow2 = prev[i2] & UByte.MAX_VALUE;
            int priorRowPixel = prev[i2 - bpp] & UByte.MAX_VALUE;
            curr[i2] = (byte) (paethPredictor(priorPixel, priorRow2, priorRowPixel) + raw2);
        }
    }

    public static int getInt(InputStream pngStream) throws IOException {
        return (pngStream.read() << 24) + (pngStream.read() << 16) + (pngStream.read() << 8) + pngStream.read();
    }

    public static int getWord(InputStream pngStream) throws IOException {
        return (pngStream.read() << 8) + pngStream.read();
    }

    public static String getString(InputStream pngStream) throws IOException {
        StringBuilder buf = new StringBuilder();
        for (int i = 0; i < 4; i++) {
            buf.append((char) pngStream.read());
        }
        return buf.toString();
    }
}
