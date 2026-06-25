package com.itextpdf.layout.layout;

import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.util.HashCode;
import com.itextpdf.kernel.geom.Rectangle;
/* loaded from: classes12.dex */
public class LayoutArea implements Cloneable {
    protected Rectangle bBox;
    protected int pageNumber;

    public LayoutArea(int pageNumber, Rectangle bBox) {
        this.pageNumber = pageNumber;
        this.bBox = bBox;
    }

    public int getPageNumber() {
        return this.pageNumber;
    }

    public Rectangle getBBox() {
        return this.bBox;
    }

    public void setBBox(Rectangle bbox) {
        this.bBox = bbox;
    }

    @Override // 
    /* renamed from: clone */
    public LayoutArea mo7332clone() {
        try {
            LayoutArea clone = (LayoutArea) super.clone();
            clone.bBox = this.bBox.mo7327clone();
            return clone;
        } catch (CloneNotSupportedException e) {
            return null;
        }
    }

    public boolean equals(Object obj) {
        if (getClass() != obj.getClass()) {
            return false;
        }
        LayoutArea that = (LayoutArea) obj;
        return this.pageNumber == that.pageNumber && this.bBox.equalsWithEpsilon(that.bBox);
    }

    public int hashCode() {
        HashCode hashCode = new HashCode();
        hashCode.append(this.pageNumber).append(this.bBox.hashCode());
        return hashCode.hashCode();
    }

    public String toString() {
        return MessageFormatUtil.format("{0}, page {1}", this.bBox.toString(), Integer.valueOf(this.pageNumber));
    }
}
