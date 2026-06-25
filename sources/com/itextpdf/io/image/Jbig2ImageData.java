package com.itextpdf.io.image;

import com.itextpdf.io.codec.Jbig2SegmentReader;
import com.itextpdf.io.exceptions.IOException;
import com.itextpdf.io.exceptions.IoExceptionMessageConstant;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.io.source.IRandomAccessSource;
import com.itextpdf.io.source.RandomAccessFileOrArray;
import com.itextpdf.io.source.RandomAccessSourceFactory;
import java.net.URL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class Jbig2ImageData extends ImageData {
    private int page;

    /* JADX INFO: Access modifiers changed from: protected */
    public Jbig2ImageData(URL url, int page) {
        super(url, ImageType.JBIG2);
        this.page = page;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Jbig2ImageData(byte[] bytes, int page) {
        super(bytes, ImageType.JBIG2);
        this.page = page;
    }

    public int getPage() {
        return this.page;
    }

    public static int getNumberOfPages(byte[] bytes) {
        IRandomAccessSource ras = new RandomAccessSourceFactory().createSource(bytes);
        return getNumberOfPages(new RandomAccessFileOrArray(ras));
    }

    public static int getNumberOfPages(RandomAccessFileOrArray raf) {
        try {
            Jbig2SegmentReader sr = new Jbig2SegmentReader(raf);
            sr.read();
            return sr.numberOfPages();
        } catch (Exception e) {
            throw new IOException(IoExceptionMessageConstant.JBIG2_IMAGE_EXCEPTION, (Throwable) e);
        }
    }

    @Override // com.itextpdf.io.image.ImageData
    public boolean canImageBeInline() {
        Logger logger = LoggerFactory.getLogger(ImageData.class);
        logger.warn(IoLogMessageConstant.IMAGE_HAS_JBIG2DECODE_FILTER);
        return false;
    }
}
