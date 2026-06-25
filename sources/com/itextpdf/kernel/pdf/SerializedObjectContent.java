package com.itextpdf.kernel.pdf;

import java.util.Arrays;
import kotlin.UByte;
/* loaded from: classes12.dex */
class SerializedObjectContent {
    private final int hash;
    private final byte[] serializedContent;

    /* JADX INFO: Access modifiers changed from: package-private */
    public SerializedObjectContent(byte[] serializedContent) {
        this.serializedContent = serializedContent;
        this.hash = calculateHash(serializedContent);
    }

    public boolean equals(Object obj) {
        return (obj instanceof SerializedObjectContent) && hashCode() == obj.hashCode() && Arrays.equals(this.serializedContent, ((SerializedObjectContent) obj).serializedContent);
    }

    public int hashCode() {
        return this.hash;
    }

    private static int calculateHash(byte[] b) {
        int hash = 0;
        for (byte b2 : b) {
            hash = (hash * 31) + (b2 & UByte.MAX_VALUE);
        }
        return hash;
    }
}
