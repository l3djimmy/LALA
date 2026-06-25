package com.itextpdf.io.font.cmap;

import com.itextpdf.commons.exceptions.ITextException;
import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.exceptions.IoExceptionMessageConstant;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.Charset;
import java.nio.charset.CharsetEncoder;
/* loaded from: classes12.dex */
public final class CMapCharsetEncoder {
    private final boolean bmpOnly;
    private final CharBuffer charBuf;
    private final CharsetEncoder encoder;
    private final Charset targetCharset;

    public CMapCharsetEncoder(Charset targetCharset) {
        this(targetCharset, false);
    }

    public CMapCharsetEncoder(Charset targetCharset, boolean bmpOnly) {
        this.charBuf = CharBuffer.allocate(2);
        this.bmpOnly = bmpOnly;
        this.targetCharset = targetCharset;
        this.encoder = targetCharset.newEncoder();
    }

    public byte[] encodeUnicodeCodePoint(int cp) {
        if (!Character.isBmpCodePoint(cp) && this.bmpOnly) {
            throw new ITextException(IoExceptionMessageConstant.ONLY_BMP_ENCODING);
        }
        this.charBuf.clear();
        this.charBuf.put(Character.toChars(cp));
        this.charBuf.flip();
        this.encoder.reset();
        try {
            ByteBuffer destBuf = this.encoder.encode(this.charBuf);
            byte[] result = new byte[destBuf.limit()];
            destBuf.get(result);
            return result;
        } catch (CharacterCodingException e) {
            throw new ITextException(MessageFormatUtil.format(IoExceptionMessageConstant.ENCODING_ERROR, Integer.valueOf(cp), this.targetCharset.name()), e);
        }
    }
}
