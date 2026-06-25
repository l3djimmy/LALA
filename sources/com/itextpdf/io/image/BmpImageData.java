package com.itextpdf.io.image;

import java.net.URL;
/* loaded from: classes12.dex */
public class BmpImageData extends RawImageData {
    private final boolean noHeader;

    /* JADX INFO: Access modifiers changed from: protected */
    public BmpImageData(URL url, boolean noHeader) {
        super(url, ImageType.BMP);
        this.noHeader = noHeader;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public BmpImageData(byte[] bytes, boolean noHeader) {
        super(bytes, ImageType.BMP);
        this.noHeader = noHeader;
    }

    public boolean isNoHeader() {
        return this.noHeader;
    }
}
