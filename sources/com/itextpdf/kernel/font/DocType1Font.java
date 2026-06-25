package com.itextpdf.kernel.font;

import com.itextpdf.io.font.FontEncoding;
import com.itextpdf.io.font.FontProgram;
import com.itextpdf.io.font.FontProgramFactory;
import com.itextpdf.io.font.Type1Font;
import com.itextpdf.io.font.cmap.CMapToUnicode;
import com.itextpdf.io.font.otf.Glyph;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfNumber;
import com.itextpdf.kernel.pdf.PdfStream;
import com.itextpdf.kernel.pdf.PdfString;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes12.dex */
public class DocType1Font extends Type1Font implements IDocFontProgram {
    private PdfStream fontFile;
    private PdfName fontFileName;
    private int missingWidth;
    private PdfName subtype;

    private DocType1Font(String fontName) {
        super(fontName);
        this.missingWidth = 0;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static Type1Font createFontProgram(PdfDictionary fontDictionary, FontEncoding fontEncoding, CMapToUnicode toUnicode) {
        Type1Font type1StdFont;
        String baseFont = getBaseFont(fontDictionary);
        if (!fontDictionary.containsKey(PdfName.FontDescriptor) && (type1StdFont = getType1Font(baseFont)) != null) {
            type1StdFont.initializeGlyphs(fontEncoding);
            return type1StdFont;
        }
        DocType1Font fontProgram = new DocType1Font(baseFont);
        PdfDictionary fontDesc = fontDictionary.getAsDictionary(PdfName.FontDescriptor);
        fontProgram.subtype = fontDesc != null ? fontDesc.getAsName(PdfName.Subtype) : null;
        fillFontDescriptor(fontProgram, fontDesc);
        initializeGlyphs(fontDictionary, fontEncoding, toUnicode, fontProgram);
        return fontProgram;
    }

    static void initializeGlyphs(PdfDictionary fontDictionary, FontEncoding fontEncoding, CMapToUnicode toUnicode, DocType1Font fontProgram) {
        PdfNumber firstCharNumber = fontDictionary.getAsNumber(PdfName.FirstChar);
        int firstChar = firstCharNumber != null ? Math.max(firstCharNumber.intValue(), 0) : 0;
        int[] widths = FontUtil.convertSimpleWidthsArray(fontDictionary.getAsArray(PdfName.Widths), firstChar, fontProgram.getMissingWidth());
        fontProgram.avgWidth = 0;
        int glyphsWithWidths = 0;
        for (int i = 0; i < 256; i++) {
            Glyph glyph = new Glyph(i, widths[i], fontEncoding.getUnicode(i));
            fontProgram.codeToGlyph.put(Integer.valueOf(i), glyph);
            if (glyph.hasValidUnicode()) {
                if (fontEncoding.convertToByte(glyph.getUnicode()) == i) {
                    fontProgram.unicodeToGlyph.put(Integer.valueOf(glyph.getUnicode()), glyph);
                }
            } else if (toUnicode != null) {
                glyph.setChars(toUnicode.lookup(i));
            }
            if (widths[i] > 0) {
                glyphsWithWidths++;
                fontProgram.avgWidth += widths[i];
            }
        }
        if (glyphsWithWidths != 0) {
            fontProgram.avgWidth /= glyphsWithWidths;
        }
    }

    static String getBaseFont(PdfDictionary fontDictionary) {
        PdfName baseFontName = fontDictionary.getAsName(PdfName.BaseFont);
        if (baseFontName == null) {
            return FontUtil.createRandomFontName();
        }
        return baseFontName.getValue();
    }

    static Type1Font getType1Font(String baseFont) {
        try {
            return (Type1Font) FontProgramFactory.createFont(baseFont, false);
        } catch (Exception e) {
            return null;
        }
    }

    @Override // com.itextpdf.kernel.font.IDocFontProgram
    public PdfStream getFontFile() {
        return this.fontFile;
    }

    @Override // com.itextpdf.kernel.font.IDocFontProgram
    public PdfName getFontFileName() {
        return this.fontFileName;
    }

    @Override // com.itextpdf.kernel.font.IDocFontProgram
    public PdfName getSubtype() {
        return this.subtype;
    }

    @Override // com.itextpdf.io.font.Type1Font, com.itextpdf.io.font.FontProgram
    public boolean isBuiltWith(String fontName) {
        return false;
    }

    public int getMissingWidth() {
        return this.missingWidth;
    }

    static void fillFontDescriptor(DocType1Font font, PdfDictionary fontDesc) {
        if (fontDesc == null) {
            Logger logger = LoggerFactory.getLogger(FontUtil.class);
            logger.warn(IoLogMessageConstant.FONT_DICTIONARY_WITH_NO_FONT_DESCRIPTOR);
            return;
        }
        PdfNumber v = fontDesc.getAsNumber(PdfName.Ascent);
        if (v != null) {
            font.setTypoAscender(v.intValue());
        }
        PdfNumber v2 = fontDesc.getAsNumber(PdfName.Descent);
        if (v2 != null) {
            font.setTypoDescender(v2.intValue());
        }
        PdfNumber v3 = fontDesc.getAsNumber(PdfName.CapHeight);
        if (v3 != null) {
            font.setCapHeight(v3.intValue());
        }
        PdfNumber v4 = fontDesc.getAsNumber(PdfName.XHeight);
        if (v4 != null) {
            font.setXHeight(v4.intValue());
        }
        PdfNumber v5 = fontDesc.getAsNumber(PdfName.ItalicAngle);
        if (v5 != null) {
            font.setItalicAngle(v5.intValue());
        }
        PdfNumber v6 = fontDesc.getAsNumber(PdfName.StemV);
        if (v6 != null) {
            font.setStemV(v6.intValue());
        }
        PdfNumber v7 = fontDesc.getAsNumber(PdfName.StemH);
        if (v7 != null) {
            font.setStemH(v7.intValue());
        }
        PdfNumber v8 = fontDesc.getAsNumber(PdfName.FontWeight);
        if (v8 != null) {
            font.setFontWeight(v8.intValue());
        }
        PdfNumber v9 = fontDesc.getAsNumber(PdfName.MissingWidth);
        if (v9 != null) {
            font.missingWidth = v9.intValue();
        }
        PdfName fontStretch = fontDesc.getAsName(PdfName.FontStretch);
        if (fontStretch != null) {
            font.setFontStretch(fontStretch.getValue());
        }
        PdfArray bboxValue = fontDesc.getAsArray(PdfName.FontBBox);
        if (bboxValue != null) {
            int[] bbox = {bboxValue.getAsNumber(0).intValue(), bboxValue.getAsNumber(1).intValue(), bboxValue.getAsNumber(2).intValue(), bboxValue.getAsNumber(3).intValue()};
            if (bbox[0] > bbox[2]) {
                int t = bbox[0];
                bbox[0] = bbox[2];
                bbox[2] = t;
            }
            int t2 = bbox[1];
            if (t2 > bbox[3]) {
                int t3 = bbox[1];
                bbox[1] = bbox[3];
                bbox[3] = t3;
            }
            font.setBbox(bbox);
            if (font.getFontMetrics().getTypoAscender() == 0 && font.getFontMetrics().getTypoDescender() == 0) {
                float maxAscent = Math.max(bbox[3], font.getFontMetrics().getTypoAscender());
                float minDescent = Math.min(bbox[1], font.getFontMetrics().getTypoDescender());
                font.setTypoAscender((int) (FontProgram.convertGlyphSpaceToTextSpace(maxAscent) / (maxAscent - minDescent)));
                font.setTypoDescender((int) (FontProgram.convertGlyphSpaceToTextSpace(minDescent) / (maxAscent - minDescent)));
            }
        }
        PdfString fontFamily = fontDesc.getAsString(PdfName.FontFamily);
        if (fontFamily != null) {
            font.setFontFamily(fontFamily.getValue());
        }
        PdfNumber flagsValue = fontDesc.getAsNumber(PdfName.Flags);
        if (flagsValue != null) {
            int flags = flagsValue.intValue();
            if ((flags & 1) != 0) {
                font.setFixedPitch(true);
            }
            if ((262144 & flags) != 0) {
                font.setBold(true);
            }
        }
        PdfName[] fontFileNames = {PdfName.FontFile, PdfName.FontFile2, PdfName.FontFile3};
        for (PdfName fontFile : fontFileNames) {
            if (fontDesc.containsKey(fontFile)) {
                font.fontFileName = fontFile;
                font.fontFile = fontDesc.getAsStream(fontFile);
                return;
            }
        }
    }
}
