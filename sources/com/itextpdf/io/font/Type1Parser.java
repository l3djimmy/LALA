package com.itextpdf.io.font;

import com.itextpdf.io.exceptions.IoExceptionMessageConstant;
import com.itextpdf.io.font.constants.FontResources;
import com.itextpdf.io.font.constants.StandardFonts;
import com.itextpdf.io.source.RandomAccessFileOrArray;
import com.itextpdf.io.source.RandomAccessSourceFactory;
import com.itextpdf.io.util.ResourceUtil;
import java.io.ByteArrayOutputStream;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
/* loaded from: classes12.dex */
class Type1Parser {
    private static final String AFM_HEADER = "StartFontMetrics";
    private byte[] afmData;
    private String afmPath;
    private boolean isBuiltInFont;
    private byte[] pfbData;
    private String pfbPath;
    private RandomAccessSourceFactory sourceFactory = new RandomAccessSourceFactory();

    public Type1Parser(String metricsPath, String binaryPath, byte[] afm, byte[] pfb) {
        this.afmData = afm;
        this.pfbData = pfb;
        this.afmPath = metricsPath;
        this.pfbPath = binaryPath;
    }

    /* JADX WARN: Finally extract failed */
    public RandomAccessFileOrArray getMetricsFile() throws IOException {
        this.isBuiltInFont = false;
        if (StandardFonts.isStandardFont(this.afmPath)) {
            this.isBuiltInFont = true;
            byte[] buf = new byte[1024];
            InputStream resource = null;
            try {
                String resourcePath = FontResources.AFMS + this.afmPath + ".afm";
                resource = ResourceUtil.getResourceStream(resourcePath);
                if (resource == null) {
                    throw new com.itextpdf.io.exceptions.IOException("{0} was not found as resource.").setMessageParams(resourcePath);
                }
                ByteArrayOutputStream stream = new ByteArrayOutputStream();
                while (true) {
                    int read = resource.read(buf);
                    if (read < 0) {
                        break;
                    }
                    stream.write(buf, 0, read);
                }
                return new RandomAccessFileOrArray(this.sourceFactory.createSource(stream.toByteArray()));
            } finally {
                if (resource != null) {
                    try {
                        resource.close();
                    } catch (Exception e) {
                    }
                }
            }
        } else if (this.afmPath != null) {
            if (this.afmPath.toLowerCase().endsWith(".afm")) {
                return new RandomAccessFileOrArray(this.sourceFactory.createBestSource(this.afmPath));
            }
            if (this.afmPath.toLowerCase().endsWith(".pfm")) {
                ByteArrayOutputStream ba = new ByteArrayOutputStream();
                RandomAccessFileOrArray rf = new RandomAccessFileOrArray(this.sourceFactory.createBestSource(this.afmPath));
                Pfm2afm.convert(rf, ba);
                rf.close();
                return new RandomAccessFileOrArray(this.sourceFactory.createSource(ba.toByteArray()));
            }
            throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.IS_NOT_AN_AFM_OR_PFM_FONT_FILE).setMessageParams(this.afmPath);
        } else if (this.afmData != null) {
            RandomAccessFileOrArray rf2 = new RandomAccessFileOrArray(this.sourceFactory.createSource(this.afmData));
            if (isAfmFile(rf2)) {
                return rf2;
            }
            ByteArrayOutputStream ba2 = new ByteArrayOutputStream();
            try {
                try {
                    Pfm2afm.convert(rf2, ba2);
                    rf2.close();
                    return new RandomAccessFileOrArray(this.sourceFactory.createSource(ba2.toByteArray()));
                } catch (Exception e2) {
                    throw new com.itextpdf.io.exceptions.IOException("Invalid afm or pfm font file.");
                }
            } catch (Throwable th) {
                rf2.close();
                throw th;
            }
        } else {
            throw new com.itextpdf.io.exceptions.IOException("Invalid afm or pfm font file.");
        }
    }

    public RandomAccessFileOrArray getPostscriptBinary() throws IOException {
        if (this.pfbData != null) {
            return new RandomAccessFileOrArray(this.sourceFactory.createSource(this.pfbData));
        }
        if (this.pfbPath != null && this.pfbPath.toLowerCase().endsWith(".pfb")) {
            return new RandomAccessFileOrArray(this.sourceFactory.createBestSource(this.pfbPath));
        }
        this.pfbPath = this.afmPath.substring(0, this.afmPath.length() - 3) + "pfb";
        return new RandomAccessFileOrArray(this.sourceFactory.createBestSource(this.pfbPath));
    }

    public boolean isBuiltInFont() {
        return this.isBuiltInFont;
    }

    public String getAfmPath() {
        return this.afmPath;
    }

    private boolean isAfmFile(RandomAccessFileOrArray raf) throws IOException {
        StringBuilder builder = new StringBuilder(AFM_HEADER.length());
        for (int i = 0; i < AFM_HEADER.length(); i++) {
            try {
                builder.append((char) raf.readByte());
            } catch (EOFException e) {
                raf.seek(0L);
                return false;
            }
        }
        raf.seek(0L);
        return AFM_HEADER.equals(builder.toString());
    }
}
