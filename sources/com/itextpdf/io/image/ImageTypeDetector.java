package com.itextpdf.io.image;

import com.itextpdf.io.util.UrlUtil;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
/* loaded from: classes12.dex */
public final class ImageTypeDetector {
    private static final byte[] gif = {71, 73, 70};
    private static final byte[] jpeg = {-1, -40};
    private static final byte[] jpeg2000_1 = {0, 0, 0, 12};
    private static final byte[] jpeg2000_2 = {-1, 79, -1, 81};
    private static final byte[] png = {-119, 80, 78, 71};
    private static final byte[] wmf = {-41, -51};
    private static final byte[] bmp = {66, 77};
    private static final byte[] tiff_1 = {77, 77, 0, 42};
    private static final byte[] tiff_2 = {73, 73, 42, 0};
    private static final byte[] jbig2 = {-105, 74, 66, 50, 13, 10, 26, 10};

    private ImageTypeDetector() {
    }

    public static ImageType detectImageType(byte[] source) {
        byte[] header = readImageType(source);
        return detectImageTypeByHeader(header);
    }

    public static ImageType detectImageType(URL source) {
        byte[] header = readImageType(source);
        return detectImageTypeByHeader(header);
    }

    public static ImageType detectImageType(InputStream stream) {
        byte[] header = readImageType(stream);
        return detectImageTypeByHeader(header);
    }

    private static ImageType detectImageTypeByHeader(byte[] header) {
        if (imageTypeIs(header, gif)) {
            return ImageType.GIF;
        }
        if (imageTypeIs(header, jpeg)) {
            return ImageType.JPEG;
        }
        if (imageTypeIs(header, jpeg2000_1) || imageTypeIs(header, jpeg2000_2)) {
            return ImageType.JPEG2000;
        }
        if (imageTypeIs(header, png)) {
            return ImageType.PNG;
        }
        if (imageTypeIs(header, bmp)) {
            return ImageType.BMP;
        }
        if (imageTypeIs(header, tiff_1) || imageTypeIs(header, tiff_2)) {
            return ImageType.TIFF;
        }
        if (imageTypeIs(header, jbig2)) {
            return ImageType.JBIG2;
        }
        if (imageTypeIs(header, wmf)) {
            return ImageType.WMF;
        }
        return ImageType.NONE;
    }

    private static boolean imageTypeIs(byte[] imageType, byte[] compareWith) {
        for (int i = 0; i < compareWith.length; i++) {
            if (imageType[i] != compareWith[i]) {
                return false;
            }
        }
        return true;
    }

    private static byte[] readImageType(URL source) {
        try {
            InputStream stream = UrlUtil.openStream(source);
            byte[] readImageType = readImageType(stream);
            if (stream != null) {
                stream.close();
            }
            return readImageType;
        } catch (IOException e) {
            throw new com.itextpdf.io.exceptions.IOException("I/O exception.", (Throwable) e);
        }
    }

    private static byte[] readImageType(InputStream stream) {
        try {
            byte[] bytes = new byte[8];
            stream.read(bytes);
            return bytes;
        } catch (IOException e) {
            throw new com.itextpdf.io.exceptions.IOException("I/O exception.", (Throwable) e);
        }
    }

    private static byte[] readImageType(byte[] source) {
        try {
            InputStream stream = new ByteArrayInputStream(source);
            byte[] bytes = new byte[8];
            stream.read(bytes);
            return bytes;
        } catch (IOException e) {
            return null;
        }
    }
}
