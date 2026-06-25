package com.itextpdf.layout.minmaxwidth;
/* loaded from: classes12.dex */
public class MinMaxWidth {
    private float additionalWidth;
    private float childrenMaxWidth;
    private float childrenMinWidth;

    public MinMaxWidth() {
        this(0.0f);
    }

    public MinMaxWidth(float additionalWidth) {
        this(0.0f, 0.0f, additionalWidth);
    }

    public MinMaxWidth(float childrenMinWidth, float childrenMaxWidth, float additionalWidth) {
        this.childrenMinWidth = childrenMinWidth;
        this.childrenMaxWidth = childrenMaxWidth;
        this.additionalWidth = additionalWidth;
    }

    public float getChildrenMinWidth() {
        return this.childrenMinWidth;
    }

    public void setChildrenMinWidth(float childrenMinWidth) {
        this.childrenMinWidth = childrenMinWidth;
    }

    public float getChildrenMaxWidth() {
        return this.childrenMaxWidth;
    }

    public void setChildrenMaxWidth(float childrenMaxWidth) {
        this.childrenMaxWidth = childrenMaxWidth;
    }

    public float getAdditionalWidth() {
        return this.additionalWidth;
    }

    public void setAdditionalWidth(float additionalWidth) {
        this.additionalWidth = additionalWidth;
    }

    public float getMaxWidth() {
        return Math.min(this.childrenMaxWidth + this.additionalWidth, MinMaxWidthUtils.getInfWidth());
    }

    public float getMinWidth() {
        return Math.min(this.childrenMinWidth + this.additionalWidth, getMaxWidth());
    }

    public String toString() {
        return "min=" + (this.childrenMinWidth + this.additionalWidth) + ", max=" + (this.childrenMaxWidth + this.additionalWidth);
    }
}
