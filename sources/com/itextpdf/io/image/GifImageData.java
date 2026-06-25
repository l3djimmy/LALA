package com.itextpdf.io.image;

import com.itextpdf.io.source.ByteArrayOutputStream;
import com.itextpdf.io.util.StreamUtil;
import com.itextpdf.io.util.UrlUtil;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes12.dex */
public class GifImageData {
    private byte[] data;
    private List<ImageData> frames = new ArrayList();
    private float logicalHeight;
    private float logicalWidth;
    private URL url;

    /* JADX INFO: Access modifiers changed from: protected */
    public GifImageData(URL url) {
        this.url = url;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public GifImageData(byte[] data) {
        this.data = data;
    }

    public float getLogicalHeight() {
        return this.logicalHeight;
    }

    public void setLogicalHeight(float logicalHeight) {
        this.logicalHeight = logicalHeight;
    }

    public float getLogicalWidth() {
        return this.logicalWidth;
    }

    public void setLogicalWidth(float logicalWidth) {
        this.logicalWidth = logicalWidth;
    }

    public List<ImageData> getFrames() {
        return this.frames;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public byte[] getData() {
        return this.data;
    }

    protected URL getUrl() {
        return this.url;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void addFrame(ImageData frame) {
        this.frames.add(frame);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void loadData() throws IOException {
        InputStream input = null;
        try {
            input = UrlUtil.openStream(this.url);
            ByteArrayOutputStream stream = new ByteArrayOutputStream();
            StreamUtil.transferBytes(UrlUtil.openStream(this.url), stream);
            this.data = stream.toByteArray();
        } finally {
            if (input != null) {
                input.close();
            }
        }
    }
}
