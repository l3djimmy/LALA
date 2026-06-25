package com.itextpdf.kernel.font;

import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.font.FontEncoding;
import com.itextpdf.io.font.FontMetrics;
import com.itextpdf.io.font.FontNames;
import com.itextpdf.io.font.FontProgram;
import com.itextpdf.io.font.cmap.CMapToUnicode;
import com.itextpdf.io.font.constants.FontDescriptorFlags;
import com.itextpdf.io.font.otf.Glyph;
import com.itextpdf.io.font.otf.GlyphLine;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.io.util.ArrayUtil;
import com.itextpdf.io.util.StreamUtil;
import com.itextpdf.io.util.TextUtil;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfNumber;
import com.itextpdf.kernel.pdf.PdfOutputStream;
import com.itextpdf.kernel.pdf.PdfString;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import kotlin.UByte;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public abstract class PdfSimpleFont<T extends FontProgram> extends PdfFont {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    protected FontEncoding fontEncoding;
    protected boolean forceWidthsOutput;
    protected CMapToUnicode toUnicode;
    protected byte[] usedGlyphs;

    protected abstract void addFontStream(PdfDictionary pdfDictionary);

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfSimpleFont(PdfDictionary fontDictionary) {
        super(fontDictionary);
        this.forceWidthsOutput = false;
        this.usedGlyphs = new byte[256];
        this.toUnicode = FontUtil.processToUnicode(fontDictionary.get(PdfName.ToUnicode));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfSimpleFont() {
        this.forceWidthsOutput = false;
        this.usedGlyphs = new byte[256];
    }

    @Override // com.itextpdf.kernel.font.PdfFont
    public boolean isBuiltWith(String fontProgram, String encoding) {
        return getFontProgram().isBuiltWith(fontProgram) && this.fontEncoding.isBuiltWith(encoding);
    }

    @Override // com.itextpdf.kernel.font.PdfFont
    public GlyphLine createGlyphLine(String content) {
        List<Glyph> glyphs = new ArrayList<>(content.length());
        if (this.fontEncoding.isFontSpecific()) {
            for (int i = 0; i < content.length(); i++) {
                Glyph glyph = this.fontProgram.getGlyphByCode(content.charAt(i));
                if (glyph != null) {
                    glyphs.add(glyph);
                }
            }
        } else {
            for (int i2 = 0; i2 < content.length(); i2++) {
                Glyph glyph2 = getGlyph(content.charAt(i2));
                if (glyph2 != null) {
                    glyphs.add(glyph2);
                }
            }
        }
        return new GlyphLine(glyphs);
    }

    @Override // com.itextpdf.kernel.font.PdfFont
    public int appendGlyphs(String text, int from, int to, List<Glyph> glyphs) {
        int processed = 0;
        if (this.fontEncoding.isFontSpecific()) {
            for (int i = from; i <= to; i++) {
                Glyph glyph = this.fontProgram.getGlyphByCode(text.charAt(i) & 255);
                if (glyph == null) {
                    break;
                }
                glyphs.add(glyph);
                processed++;
            }
        } else {
            for (int i2 = from; i2 <= to; i2++) {
                Glyph glyph2 = getGlyph(text.charAt(i2));
                if (glyph2 != null && (containsGlyph(glyph2.getUnicode()) || isAppendableGlyph(glyph2))) {
                    glyphs.add(glyph2);
                } else if (glyph2 != null || !TextUtil.isWhitespaceOrNonPrintable(text.charAt(i2))) {
                    break;
                }
                processed++;
            }
        }
        return processed;
    }

    @Override // com.itextpdf.kernel.font.PdfFont
    public int appendAnyGlyph(String text, int from, List<Glyph> glyphs) {
        Glyph glyph;
        if (this.fontEncoding.isFontSpecific()) {
            glyph = this.fontProgram.getGlyphByCode(text.charAt(from));
        } else {
            glyph = getGlyph(text.charAt(from));
        }
        if (glyph != null) {
            glyphs.add(glyph);
            return 1;
        }
        return 1;
    }

    private boolean isAppendableGlyph(Glyph glyph) {
        return glyph.getCode() > 0 || TextUtil.isWhitespaceOrNonPrintable(glyph.getUnicode());
    }

    public FontEncoding getFontEncoding() {
        return this.fontEncoding;
    }

    public CMapToUnicode getToUnicode() {
        return this.toUnicode;
    }

    @Override // com.itextpdf.kernel.font.PdfFont
    public byte[] convertToBytes(String text) {
        byte[] bytes = this.fontEncoding.convertToBytes(text);
        for (byte b : bytes) {
            this.usedGlyphs[b & UByte.MAX_VALUE] = 1;
        }
        return bytes;
    }

    @Override // com.itextpdf.kernel.font.PdfFont
    public byte[] convertToBytes(GlyphLine glyphLine) {
        if (glyphLine != null) {
            byte[] bytes = new byte[glyphLine.size()];
            int ptr = 0;
            if (this.fontEncoding.isFontSpecific()) {
                int i = 0;
                while (i < glyphLine.size()) {
                    bytes[ptr] = (byte) glyphLine.get(i).getCode();
                    i++;
                    ptr++;
                }
            } else {
                for (int i2 = 0; i2 < glyphLine.size(); i2++) {
                    if (this.fontEncoding.canEncode(glyphLine.get(i2).getUnicode())) {
                        bytes[ptr] = (byte) this.fontEncoding.convertToByte(glyphLine.get(i2).getUnicode());
                        ptr++;
                    }
                }
            }
            byte[] bytes2 = ArrayUtil.shortenArray(bytes, ptr);
            for (byte b : bytes2) {
                this.usedGlyphs[b & UByte.MAX_VALUE] = 1;
            }
            return bytes2;
        }
        return EMPTY_BYTES;
    }

    @Override // com.itextpdf.kernel.font.PdfFont
    public byte[] convertToBytes(Glyph glyph) {
        byte[] bytes = new byte[1];
        if (this.fontEncoding.isFontSpecific()) {
            bytes[0] = (byte) glyph.getCode();
        } else if (this.fontEncoding.canEncode(glyph.getUnicode())) {
            bytes[0] = (byte) this.fontEncoding.convertToByte(glyph.getUnicode());
        } else {
            return EMPTY_BYTES;
        }
        this.usedGlyphs[bytes[0] & UByte.MAX_VALUE] = 1;
        return bytes;
    }

    @Override // com.itextpdf.kernel.font.PdfFont
    public void writeText(GlyphLine text, int from, int to, PdfOutputStream stream) {
        byte[] bytes = new byte[(to - from) + 1];
        int ptr = 0;
        if (this.fontEncoding.isFontSpecific()) {
            int i = from;
            while (i <= to) {
                bytes[ptr] = (byte) text.get(i).getCode();
                i++;
                ptr++;
            }
        } else {
            for (int i2 = from; i2 <= to; i2++) {
                Glyph glyph = text.get(i2);
                if (this.fontEncoding.canEncode(glyph.getUnicode())) {
                    bytes[ptr] = (byte) this.fontEncoding.convertToByte(glyph.getUnicode());
                    ptr++;
                }
            }
        }
        byte[] bytes2 = ArrayUtil.shortenArray(bytes, ptr);
        for (byte b : bytes2) {
            this.usedGlyphs[b & UByte.MAX_VALUE] = 1;
        }
        StreamUtil.writeEscapedString(stream, bytes2);
    }

    @Override // com.itextpdf.kernel.font.PdfFont
    public void writeText(String text, PdfOutputStream stream) {
        StreamUtil.writeEscapedString(stream, convertToBytes(text));
    }

    @Override // com.itextpdf.kernel.font.PdfFont
    public String decode(PdfString content) {
        return decodeIntoGlyphLine(content).toString();
    }

    @Override // com.itextpdf.kernel.font.PdfFont
    public GlyphLine decodeIntoGlyphLine(PdfString content) {
        List<Glyph> glyphs = new ArrayList<>(content.getValue().length());
        appendDecodedCodesToGlyphsList(glyphs, content);
        return new GlyphLine(glyphs);
    }

    @Override // com.itextpdf.kernel.font.PdfFont
    public boolean appendDecodedCodesToGlyphsList(List<Glyph> list, PdfString characterCodes) {
        char[] chars;
        boolean allCodesDecoded = true;
        FontEncoding enc = getFontEncoding();
        byte[] contentBytes = characterCodes.getValueBytes();
        for (byte b : contentBytes) {
            int code = b & UByte.MAX_VALUE;
            Glyph glyph = getFontProgram().getGlyphByCode(code);
            int uni = enc.getUnicode(code);
            if (glyph == null && uni > -1) {
                glyph = getGlyph(uni);
            }
            if (glyph != null) {
                CMapToUnicode toUnicodeCMap = getToUnicode();
                if (toUnicodeCMap != null && (chars = toUnicodeCMap.lookup(code)) != null && !Arrays.equals(chars, glyph.getChars())) {
                    glyph = new Glyph(glyph);
                    glyph.setChars(chars);
                }
                list.add(glyph);
            } else {
                Logger logger = LoggerFactory.getLogger(getClass());
                if (logger.isWarnEnabled()) {
                    logger.warn(MessageFormatUtil.format(IoLogMessageConstant.COULD_NOT_FIND_GLYPH_WITH_CODE, Integer.valueOf(code)));
                }
                allCodesDecoded = false;
            }
        }
        return allCodesDecoded;
    }

    @Override // com.itextpdf.kernel.font.PdfFont
    public float getContentWidth(PdfString content) {
        float width = 0.0f;
        GlyphLine glyphLine = decodeIntoGlyphLine(content);
        for (int i = glyphLine.start; i < glyphLine.end; i++) {
            width += glyphLine.get(i).getWidth();
        }
        return width;
    }

    public boolean isForceWidthsOutput() {
        return this.forceWidthsOutput;
    }

    public void setForceWidthsOutput(boolean forceWidthsOutput) {
        this.forceWidthsOutput = forceWidthsOutput;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void flushFontData(String fontName, PdfName subtype) {
        getPdfObject().put(PdfName.Subtype, subtype);
        if (fontName != null && fontName.length() > 0) {
            getPdfObject().put(PdfName.BaseFont, new PdfName(fontName));
        }
        int firstChar = 0;
        while (firstChar <= 255 && this.usedGlyphs[firstChar] == 0) {
            firstChar++;
        }
        int lastChar = 255;
        while (lastChar >= firstChar && this.usedGlyphs[lastChar] == 0) {
            lastChar--;
        }
        if (firstChar > 255) {
            firstChar = 255;
            lastChar = 255;
        }
        if (!isSubset() || !isEmbedded()) {
            firstChar = 0;
            lastChar = this.usedGlyphs.length - 1;
            for (int k = 0; k < this.usedGlyphs.length; k++) {
                if (this.fontEncoding.canDecode(k)) {
                    this.usedGlyphs[k] = 1;
                } else if (!this.fontEncoding.hasDifferences() && this.fontProgram.getGlyphByCode(k) != null) {
                    this.usedGlyphs[k] = 1;
                } else {
                    this.usedGlyphs[k] = 0;
                }
            }
        }
        if (this.fontEncoding.hasDifferences()) {
            int k2 = firstChar;
            while (true) {
                if (k2 <= lastChar) {
                    if (FontEncoding.NOTDEF.equals(this.fontEncoding.getDifference(k2))) {
                        k2++;
                    } else {
                        firstChar = k2;
                        break;
                    }
                } else {
                    break;
                }
            }
            int k3 = lastChar;
            while (true) {
                if (k3 >= firstChar) {
                    if (!FontEncoding.NOTDEF.equals(this.fontEncoding.getDifference(k3))) {
                        lastChar = k3;
                        break;
                    } else {
                        k3--;
                    }
                } else {
                    break;
                }
            }
            PdfDictionary enc = new PdfDictionary();
            enc.put(PdfName.Type, PdfName.Encoding);
            PdfArray diff = new PdfArray();
            boolean gap = true;
            for (int k4 = firstChar; k4 <= lastChar; k4++) {
                if (this.usedGlyphs[k4] != 0) {
                    if (gap) {
                        diff.add(new PdfNumber(k4));
                        gap = false;
                    }
                    diff.add(new PdfName(this.fontEncoding.getDifference(k4)));
                } else {
                    gap = true;
                }
            }
            enc.put(PdfName.Differences, diff);
            getPdfObject().put(PdfName.Encoding, enc);
        } else if (!this.fontEncoding.isFontSpecific()) {
            getPdfObject().put(PdfName.Encoding, "Cp1252".equals(this.fontEncoding.getBaseEncoding()) ? PdfName.WinAnsiEncoding : PdfName.MacRomanEncoding);
        }
        if (isForceWidthsOutput() || !isBuiltInFont() || this.fontEncoding.hasDifferences()) {
            getPdfObject().put(PdfName.FirstChar, new PdfNumber(firstChar));
            getPdfObject().put(PdfName.LastChar, new PdfNumber(lastChar));
            PdfArray wd = buildWidthsArray(firstChar, lastChar);
            getPdfObject().put(PdfName.Widths, wd);
        }
        PdfDictionary fontDescriptor = !isBuiltInFont() ? getFontDescriptor(fontName) : null;
        if (fontDescriptor != null) {
            getPdfObject().put(PdfName.FontDescriptor, fontDescriptor);
            if (fontDescriptor.getIndirectReference() != null) {
                fontDescriptor.flush();
            }
        }
    }

    protected boolean isBuiltInFont() {
        return false;
    }

    @Override // com.itextpdf.kernel.font.PdfFont
    protected PdfDictionary getFontDescriptor(String fontName) {
        if (fontName == null || fontName.length() <= 0) {
            throw new AssertionError();
        }
        FontMetrics fontMetrics = this.fontProgram.getFontMetrics();
        FontNames fontNames = this.fontProgram.getFontNames();
        PdfDictionary fontDescriptor = new PdfDictionary();
        makeObjectIndirect(fontDescriptor);
        fontDescriptor.put(PdfName.Type, PdfName.FontDescriptor);
        fontDescriptor.put(PdfName.FontName, new PdfName(fontName));
        fontDescriptor.put(PdfName.Ascent, new PdfNumber(fontMetrics.getTypoAscender()));
        fontDescriptor.put(PdfName.CapHeight, new PdfNumber(fontMetrics.getCapHeight()));
        fontDescriptor.put(PdfName.Descent, new PdfNumber(fontMetrics.getTypoDescender()));
        fontDescriptor.put(PdfName.FontBBox, new PdfArray(ArrayUtil.cloneArray(fontMetrics.getBbox())));
        fontDescriptor.put(PdfName.ItalicAngle, new PdfNumber(fontMetrics.getItalicAngle()));
        fontDescriptor.put(PdfName.StemV, new PdfNumber(fontMetrics.getStemV()));
        if (fontMetrics.getXHeight() > 0) {
            fontDescriptor.put(PdfName.XHeight, new PdfNumber(fontMetrics.getXHeight()));
        }
        if (fontMetrics.getStemH() > 0) {
            fontDescriptor.put(PdfName.StemH, new PdfNumber(fontMetrics.getStemH()));
        }
        if (fontNames.getFontWeight() > 0) {
            fontDescriptor.put(PdfName.FontWeight, new PdfNumber(fontNames.getFontWeight()));
        }
        if (fontNames.getFamilyName() != null && fontNames.getFamilyName().length > 0 && fontNames.getFamilyName()[0].length >= 4) {
            fontDescriptor.put(PdfName.FontFamily, new PdfString(fontNames.getFamilyName()[0][3]));
        }
        addFontStream(fontDescriptor);
        int flags = this.fontProgram.getPdfFontFlags();
        fontDescriptor.put(PdfName.Flags, new PdfNumber((flags & (~(FontDescriptorFlags.Symbolic | FontDescriptorFlags.Nonsymbolic))) | (this.fontEncoding.isFontSpecific() ? FontDescriptorFlags.Symbolic : FontDescriptorFlags.Nonsymbolic)));
        return fontDescriptor;
    }

    protected PdfArray buildWidthsArray(int firstChar, int lastChar) {
        PdfArray wd = new PdfArray();
        for (int k = firstChar; k <= lastChar; k++) {
            if (this.usedGlyphs[k] == 0) {
                wd.add(new PdfNumber(0));
            } else {
                int uni = this.fontEncoding.getUnicode(k);
                Glyph glyph = uni > -1 ? getGlyph(uni) : this.fontProgram.getGlyphByCode(k);
                wd.add(new PdfNumber(glyph != null ? glyph.getWidth() : 0));
            }
        }
        return wd;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setFontProgram(T fontProgram) {
        this.fontProgram = fontProgram;
    }
}
