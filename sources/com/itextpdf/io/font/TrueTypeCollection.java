package com.itextpdf.io.font;

import com.itextpdf.commons.utils.FileUtil;
import com.itextpdf.io.exceptions.IoExceptionMessageConstant;
import com.itextpdf.io.source.RandomAccessFileOrArray;
import com.itextpdf.io.source.RandomAccessSourceFactory;
import java.io.IOException;
/* loaded from: classes12.dex */
public class TrueTypeCollection {
    private int TTCSize = 0;
    private boolean cached = true;
    protected RandomAccessFileOrArray raf;
    private byte[] ttc;
    private String ttcPath;

    public TrueTypeCollection(byte[] ttc) throws IOException {
        this.raf = new RandomAccessFileOrArray(new RandomAccessSourceFactory().createSource(ttc));
        this.ttc = ttc;
        initFontSize();
    }

    public TrueTypeCollection(String ttcPath) throws IOException {
        if (!FileUtil.fileExists(ttcPath)) {
            throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.FONT_FILE_NOT_FOUND).setMessageParams(ttcPath);
        }
        this.raf = new RandomAccessFileOrArray(new RandomAccessSourceFactory().createBestSource(ttcPath));
        this.ttcPath = ttcPath;
        initFontSize();
    }

    public FontProgram getFontByTccIndex(int ttcIndex) throws IOException {
        if (ttcIndex > this.TTCSize - 1) {
            throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.TTC_INDEX_DOESNT_EXIST_IN_THIS_TTC_FILE);
        }
        if (this.ttcPath != null) {
            return FontProgramFactory.createFont(this.ttcPath, ttcIndex, this.cached);
        }
        return FontProgramFactory.createFont(this.ttc, ttcIndex, this.cached);
    }

    public int getTTCSize() {
        return this.TTCSize;
    }

    public boolean isCached() {
        return this.cached;
    }

    public void setCached(boolean cached) {
        this.cached = cached;
    }

    private void initFontSize() throws IOException {
        String mainTag = this.raf.readString(4, "Cp1252");
        if (!mainTag.equals("ttcf")) {
            throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.INVALID_TTC_FILE);
        }
        this.raf.skipBytes(4);
        this.TTCSize = this.raf.readInt();
    }
}
