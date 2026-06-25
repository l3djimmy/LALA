package com.itextpdf.io.image;

import java.net.URL;
/* loaded from: classes12.dex */
public class JpegImageData extends ImageData {
    /* JADX INFO: Access modifiers changed from: protected */
    public JpegImageData(URL url) {
        super(url, ImageType.JPEG);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public JpegImageData(byte[] bytes) {
        super(bytes, ImageType.JPEG);
    }
}
