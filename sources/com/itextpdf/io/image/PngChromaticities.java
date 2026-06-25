package com.itextpdf.io.image;
/* loaded from: classes12.dex */
public class PngChromaticities {
    private float xB;
    private float xG;
    private float xR;
    private float xW;
    private float yB;
    private float yG;
    private float yR;
    private float yW;

    public PngChromaticities(float xW, float yW, float xR, float yR, float xG, float yG, float xB, float yB) {
        this.xW = xW;
        this.yW = yW;
        this.xR = xR;
        this.yR = yR;
        this.xG = xG;
        this.yG = yG;
        this.xB = xB;
        this.yB = yB;
    }

    public float getXW() {
        return this.xW;
    }

    public float getYW() {
        return this.yW;
    }

    public float getXR() {
        return this.xR;
    }

    public float getYR() {
        return this.yR;
    }

    public float getXG() {
        return this.xG;
    }

    public float getYG() {
        return this.yG;
    }

    public float getXB() {
        return this.xB;
    }

    public float getYB() {
        return this.yB;
    }
}
