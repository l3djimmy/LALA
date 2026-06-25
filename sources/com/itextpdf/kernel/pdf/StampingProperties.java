package com.itextpdf.kernel.pdf;
/* loaded from: classes12.dex */
public class StampingProperties extends DocumentProperties {
    protected boolean appendMode;
    protected boolean preserveEncryption;

    public StampingProperties() {
        this.appendMode = false;
        this.preserveEncryption = false;
    }

    public StampingProperties(StampingProperties other) {
        super(other);
        this.appendMode = false;
        this.preserveEncryption = false;
        this.appendMode = other.appendMode;
        this.preserveEncryption = other.preserveEncryption;
    }

    public StampingProperties useAppendMode() {
        this.appendMode = true;
        return this;
    }

    public StampingProperties preserveEncryption() {
        this.preserveEncryption = true;
        return this;
    }
}
