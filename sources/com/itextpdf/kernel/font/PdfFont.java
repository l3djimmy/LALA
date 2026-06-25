package com.itextpdf.kernel.font;

import com.itextpdf.io.font.FontProgram;
import com.itextpdf.io.font.otf.Glyph;
import com.itextpdf.io.font.otf.GlyphLine;
import com.itextpdf.io.util.TextUtil;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfNumber;
import com.itextpdf.kernel.pdf.PdfObject;
import com.itextpdf.kernel.pdf.PdfObjectWrapper;
import com.itextpdf.kernel.pdf.PdfOutputStream;
import com.itextpdf.kernel.pdf.PdfStream;
import com.itextpdf.kernel.pdf.PdfString;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/* loaded from: classes12.dex */
public abstract class PdfFont extends PdfObjectWrapper<PdfDictionary> {
    protected static final byte[] EMPTY_BYTES = new byte[0];
    public static final int SIMPLE_FONT_MAX_CHAR_CODE_VALUE = 255;
    protected boolean embedded;
    protected FontProgram fontProgram;
    protected boolean newFont;
    protected Map<Integer, Glyph> notdefGlyphs;
    protected boolean subset;
    protected List<int[]> subsetRanges;

    public abstract int appendAnyGlyph(String str, int i, List<Glyph> list);

    public abstract int appendGlyphs(String str, int i, int i2, List<Glyph> list);

    public abstract byte[] convertToBytes(Glyph glyph);

    public abstract byte[] convertToBytes(GlyphLine glyphLine);

    public abstract byte[] convertToBytes(String str);

    public abstract GlyphLine createGlyphLine(String str);

    public abstract String decode(PdfString pdfString);

    public abstract GlyphLine decodeIntoGlyphLine(PdfString pdfString);

    public abstract float getContentWidth(PdfString pdfString);

    protected abstract PdfDictionary getFontDescriptor(String str);

    public abstract Glyph getGlyph(int i);

    public abstract void writeText(GlyphLine glyphLine, int i, int i2, PdfOutputStream pdfOutputStream);

    public abstract void writeText(String str, PdfOutputStream pdfOutputStream);

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfFont(PdfDictionary fontDictionary) {
        super(fontDictionary);
        this.notdefGlyphs = new HashMap();
        this.newFont = true;
        this.embedded = false;
        this.subset = true;
        getPdfObject().put(PdfName.Type, PdfName.Font);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfFont() {
        super(new PdfDictionary());
        this.notdefGlyphs = new HashMap();
        this.newFont = true;
        this.embedded = false;
        this.subset = true;
        getPdfObject().put(PdfName.Type, PdfName.Font);
    }

    public boolean containsGlyph(int unicode) {
        Glyph glyph = getGlyph(unicode);
        if (glyph != null) {
            return (getFontProgram() == null || !getFontProgram().isFontSpecific()) ? glyph.getCode() > 0 : glyph.getCode() > -1;
        }
        return false;
    }

    public boolean appendDecodedCodesToGlyphsList(List<Glyph> list, PdfString characterCodes) {
        return false;
    }

    public int getWidth(int unicode) {
        Glyph glyph = getGlyph(unicode);
        if (glyph != null) {
            return glyph.getWidth();
        }
        return 0;
    }

    public float getWidth(int unicode, float fontSize) {
        return FontProgram.convertTextSpaceToGlyphSpace(getWidth(unicode) * fontSize);
    }

    public int getWidth(String text) {
        int ch;
        int total = 0;
        int i = 0;
        while (i < text.length()) {
            if (TextUtil.isSurrogatePair(text, i)) {
                ch = TextUtil.convertToUtf32(text, i);
                i++;
            } else {
                ch = text.charAt(i);
            }
            Glyph glyph = getGlyph(ch);
            if (glyph != null) {
                total += glyph.getWidth();
            }
            i++;
        }
        return total;
    }

    public float getWidth(String text, float fontSize) {
        return FontProgram.convertTextSpaceToGlyphSpace(getWidth(text) * fontSize);
    }

    public float getDescent(String text, float fontSize) {
        int ch;
        int min = 0;
        int k = 0;
        while (k < text.length()) {
            if (TextUtil.isSurrogatePair(text, k)) {
                ch = TextUtil.convertToUtf32(text, k);
                k++;
            } else {
                ch = text.charAt(k);
            }
            Glyph glyph = getGlyph(ch);
            if (glyph != null) {
                int[] bbox = glyph.getBbox();
                if (bbox != null && bbox[1] < min) {
                    min = bbox[1];
                } else if (bbox == null && getFontProgram().getFontMetrics().getTypoDescender() < min) {
                    min = getFontProgram().getFontMetrics().getTypoDescender();
                }
            }
            k++;
        }
        return FontProgram.convertTextSpaceToGlyphSpace(min * fontSize);
    }

    public float getDescent(int unicode, float fontSize) {
        int min = 0;
        Glyph glyph = getGlyph(unicode);
        if (glyph == null) {
            return 0.0f;
        }
        int[] bbox = glyph.getBbox();
        if (bbox != null && bbox[1] < 0) {
            min = bbox[1];
        } else if (bbox == null && getFontProgram().getFontMetrics().getTypoDescender() < 0) {
            min = getFontProgram().getFontMetrics().getTypoDescender();
        }
        return FontProgram.convertTextSpaceToGlyphSpace(min * fontSize);
    }

    public float getAscent(String text, float fontSize) {
        int ch;
        int max = 0;
        int k = 0;
        while (k < text.length()) {
            if (TextUtil.isSurrogatePair(text, k)) {
                ch = TextUtil.convertToUtf32(text, k);
                k++;
            } else {
                ch = text.charAt(k);
            }
            Glyph glyph = getGlyph(ch);
            if (glyph != null) {
                int[] bbox = glyph.getBbox();
                if (bbox != null && bbox[3] > max) {
                    max = bbox[3];
                } else if (bbox == null && getFontProgram().getFontMetrics().getTypoAscender() > max) {
                    max = getFontProgram().getFontMetrics().getTypoAscender();
                }
            }
            k++;
        }
        return FontProgram.convertTextSpaceToGlyphSpace(max * fontSize);
    }

    public float getAscent(int unicode, float fontSize) {
        int max = 0;
        Glyph glyph = getGlyph(unicode);
        if (glyph == null) {
            return 0.0f;
        }
        int[] bbox = glyph.getBbox();
        if (bbox != null && bbox[3] > 0) {
            max = bbox[3];
        } else if (bbox == null && getFontProgram().getFontMetrics().getTypoAscender() > 0) {
            max = getFontProgram().getFontMetrics().getTypoAscender();
        }
        return FontProgram.convertTextSpaceToGlyphSpace(max * fontSize);
    }

    public FontProgram getFontProgram() {
        return this.fontProgram;
    }

    public boolean isEmbedded() {
        return this.embedded;
    }

    public boolean isSubset() {
        return this.subset;
    }

    public void setSubset(boolean subset) {
        this.subset = subset;
    }

    public void addSubsetRange(int[] range) {
        if (this.subsetRanges == null) {
            this.subsetRanges = new ArrayList();
        }
        this.subsetRanges.add(range);
        setSubset(true);
    }

    public List<String> splitString(String text, float fontSize, float maxWidth) {
        List<String> resultString = new ArrayList<>();
        int lastWhiteSpace = 0;
        int startPos = 0;
        float tokenLength = 0.0f;
        int i = 0;
        while (i < text.length()) {
            char ch = text.charAt(i);
            if (Character.isWhitespace(ch)) {
                lastWhiteSpace = i;
            }
            float currentCharWidth = getWidth(ch, fontSize);
            if (tokenLength + currentCharWidth >= maxWidth || ch == '\n') {
                if (startPos < lastWhiteSpace) {
                    resultString.add(text.substring(startPos, lastWhiteSpace));
                    startPos = lastWhiteSpace + 1;
                    tokenLength = 0.0f;
                    i = lastWhiteSpace;
                } else if (startPos != i) {
                    resultString.add(text.substring(startPos, i));
                    startPos = i;
                    tokenLength = currentCharWidth;
                } else {
                    resultString.add(text.substring(startPos, startPos + 1));
                    startPos = i + 1;
                    tokenLength = 0.0f;
                }
            } else {
                tokenLength += currentCharWidth;
            }
            i++;
        }
        resultString.add(text.substring(startPos));
        return resultString;
    }

    public boolean isBuiltWith(String fontProgram, String encoding) {
        return false;
    }

    @Override // com.itextpdf.kernel.pdf.PdfObjectWrapper
    public void flush() {
        super.flush();
    }

    @Override // com.itextpdf.kernel.pdf.PdfObjectWrapper
    protected boolean isWrappedObjectMustBeIndirect() {
        return true;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static String updateSubsetPrefix(String fontName, boolean isSubset, boolean isEmbedded) {
        if (isSubset && isEmbedded) {
            return FontUtil.addRandomSubsetPrefixForFontName(fontName);
        }
        return fontName;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfStream getPdfFontStream(byte[] fontStreamBytes, int[] fontStreamLengths) {
        if (fontStreamBytes == null || fontStreamLengths == null) {
            throw new PdfException(KernelExceptionMessageConstant.FONT_EMBEDDING_ISSUE);
        }
        PdfStream fontStream = new PdfStream(fontStreamBytes);
        makeObjectIndirect(fontStream);
        for (int k = 0; k < fontStreamLengths.length; k++) {
            fontStream.put(new PdfName("Length" + (k + 1)), new PdfNumber(fontStreamLengths[k]));
        }
        return fontStream;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean makeObjectIndirect(PdfObject obj) {
        if (getPdfObject().getIndirectReference() != null) {
            obj.makeIndirect(getPdfObject().getIndirectReference().getDocument());
            return true;
        }
        markObjectAsIndirect(obj);
        return false;
    }

    public String toString() {
        return "PdfFont{fontProgram=" + this.fontProgram + '}';
    }
}
