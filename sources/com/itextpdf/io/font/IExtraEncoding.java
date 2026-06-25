package com.itextpdf.io.font;
/* loaded from: classes12.dex */
public interface IExtraEncoding {
    String byteToChar(byte[] bArr, String str);

    byte[] charToByte(char c, String str);

    byte[] charToByte(String str, String str2);
}
