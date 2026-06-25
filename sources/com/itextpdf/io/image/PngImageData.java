package com.itextpdf.io.image;

import java.net.URL;
/* loaded from: classes12.dex */
public class PngImageData extends RawImageData {
    private byte[] colorPalette;
    private int colorType;
    private float gamma;
    private PngChromaticities pngChromaticities;

    /* JADX INFO: Access modifiers changed from: protected */
    public PngImageData(byte[] bytes) {
        super(bytes, ImageType.PNG);
        this.gamma = 1.0f;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PngImageData(URL url) {
        super(url, ImageType.PNG);
        this.gamma = 1.0f;
    }

    public byte[] getColorPalette() {
        return this.colorPalette;
    }

    public void setColorPalette(byte[] colorPalette) {
        this.colorPalette = colorPalette;
    }

    public float getGamma() {
        return this.gamma;
    }

    public void setGamma(float gamma) {
        this.gamma = gamma;
    }

    public boolean isHasCHRM() {
        return this.pngChromaticities != null;
    }

    public PngChromaticities getPngChromaticities() {
        return this.pngChromaticities;
    }

    public void setPngChromaticities(PngChromaticities pngChromaticities) {
        this.pngChromaticities = pngChromaticities;
    }

    public int getColorType() {
        return this.colorType;
    }

    public void setColorType(int colorType) {
        this.colorType = colorType;
    }

    public boolean isIndexed() {
        return this.colorType == 3;
    }

    public boolean isGrayscaleImage() {
        return (this.colorType & 2) == 0;
    }
}
