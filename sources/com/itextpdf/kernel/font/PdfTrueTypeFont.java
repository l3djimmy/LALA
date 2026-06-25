package com.itextpdf.kernel.font;

import com.itextpdf.io.font.FontEncoding;
import com.itextpdf.io.font.FontNames;
import com.itextpdf.io.font.FontProgramFactory;
import com.itextpdf.io.font.TrueTypeFont;
import com.itextpdf.io.font.Type1Font;
import com.itextpdf.io.font.constants.StandardFonts;
import com.itextpdf.io.font.otf.Glyph;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfStream;
import java.io.IOException;
import java.util.SortedSet;
import java.util.TreeSet;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class PdfTrueTypeFont extends PdfSimpleFont<TrueTypeFont> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public PdfTrueTypeFont(TrueTypeFont ttf, String encoding, boolean embedded) {
        setFontProgram(ttf);
        this.embedded = embedded;
        FontNames fontNames = ttf.getFontNames();
        if (embedded && !fontNames.allowEmbedding()) {
            throw new PdfException(KernelExceptionMessageConstant.CANNOT_BE_EMBEDDED_DUE_TO_LICENSING_RESTRICTIONS).setMessageParams(fontNames.getFontName());
        }
        if ((encoding == null || encoding.length() == 0) && ttf.isFontSpecific()) {
            encoding = FontEncoding.FONT_SPECIFIC;
        }
        if (encoding != null && FontEncoding.FONT_SPECIFIC.toLowerCase().equals(encoding.toLowerCase())) {
            this.fontEncoding = FontEncoding.createFontSpecificEncoding();
        } else {
            this.fontEncoding = FontEncoding.createFontEncoding(encoding);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public PdfTrueTypeFont(PdfDictionary fontDictionary) {
        super(fontDictionary);
        boolean z = false;
        this.newFont = false;
        this.subset = false;
        this.fontEncoding = DocFontEncoding.createDocFontEncoding(fontDictionary.get(PdfName.Encoding), this.toUnicode);
        PdfName baseFontName = fontDictionary.getAsName(PdfName.BaseFont);
        if (baseFontName != null && StandardFonts.isStandardFont(baseFontName.getValue()) && !fontDictionary.containsKey(PdfName.FontDescriptor) && !fontDictionary.containsKey(PdfName.Widths)) {
            try {
                this.fontProgram = FontProgramFactory.createFont(baseFontName.getValue(), true);
            } catch (IOException e) {
                throw new PdfException("I/O exception while creating Font", (Throwable) e);
            }
        } else {
            this.fontProgram = DocTrueTypeFont.createFontProgram(fontDictionary, this.fontEncoding, this.toUnicode);
        }
        if ((this.fontProgram instanceof IDocFontProgram) && ((IDocFontProgram) this.fontProgram).getFontFile() != null) {
            z = true;
        }
        this.embedded = z;
    }

    @Override // com.itextpdf.kernel.font.PdfFont
    public Glyph getGlyph(int unicode) {
        Glyph notdef;
        if (this.fontEncoding.canEncode(unicode)) {
            Glyph glyph = getFontProgram().getGlyph(this.fontEncoding.getUnicodeDifference(unicode));
            if (glyph == null) {
                Glyph glyph2 = this.notdefGlyphs.get(Integer.valueOf(unicode));
                if (glyph2 != null || (notdef = getFontProgram().getGlyphByCode(0)) == null) {
                    return glyph2;
                }
                Glyph glyph3 = new Glyph(notdef, unicode);
                this.notdefGlyphs.put(Integer.valueOf(unicode), glyph3);
                return glyph3;
            }
            return glyph;
        }
        return null;
    }

    @Override // com.itextpdf.kernel.font.PdfFont
    public boolean containsGlyph(int unicode) {
        return this.fontEncoding.isFontSpecific() ? this.fontProgram.getGlyphByCode(unicode) != null : this.fontEncoding.canEncode(unicode) && getFontProgram().getGlyph(this.fontEncoding.getUnicodeDifference(unicode)) != null;
    }

    @Override // com.itextpdf.kernel.font.PdfFont, com.itextpdf.kernel.pdf.PdfObjectWrapper
    public void flush() {
        PdfName subtype;
        String fontName;
        if (isFlushed()) {
            return;
        }
        ensureUnderlyingObjectHasIndirectReference();
        if (this.newFont) {
            if (((TrueTypeFont) getFontProgram()).isCff()) {
                subtype = PdfName.Type1;
                fontName = this.fontProgram.getFontNames().getFontName();
            } else {
                subtype = PdfName.TrueType;
                fontName = updateSubsetPrefix(this.fontProgram.getFontNames().getFontName(), this.subset, this.embedded);
            }
            flushFontData(fontName, subtype);
        }
        super.flush();
    }

    @Override // com.itextpdf.kernel.font.PdfSimpleFont, com.itextpdf.kernel.font.PdfFont
    public boolean isBuiltWith(String fontProgram, String encoding) {
        return (encoding == null || "".equals(encoding) || !super.isBuiltWith(fontProgram, encoding)) ? false : true;
    }

    @Override // com.itextpdf.kernel.font.PdfSimpleFont
    protected void addFontStream(PdfDictionary fontDescriptor) {
        PdfName fontFileName;
        PdfStream fontStream;
        byte[] fontStreamBytes;
        if (this.embedded) {
            if (this.fontProgram instanceof IDocFontProgram) {
                fontFileName = ((IDocFontProgram) this.fontProgram).getFontFileName();
                fontStream = ((IDocFontProgram) this.fontProgram).getFontFile();
            } else if (((TrueTypeFont) getFontProgram()).isCff()) {
                fontFileName = PdfName.FontFile3;
                try {
                    byte[] fontStreamBytes2 = ((TrueTypeFont) getFontProgram()).getFontStreamBytes();
                    PdfStream fontStream2 = getPdfFontStream(fontStreamBytes2, new int[]{fontStreamBytes2.length});
                    fontStream2.put(PdfName.Subtype, new PdfName("Type1C"));
                    fontStream = fontStream2;
                } catch (PdfException e) {
                    Logger logger = LoggerFactory.getLogger(PdfTrueTypeFont.class);
                    logger.error(e.getMessage());
                    fontStream = null;
                }
            } else {
                fontFileName = PdfName.FontFile2;
                SortedSet<Integer> glyphs = new TreeSet<>();
                for (int k = 0; k < this.usedGlyphs.length; k++) {
                    if (this.usedGlyphs[k] != 0) {
                        int uni = this.fontEncoding.getUnicode(k);
                        Glyph glyph = uni > -1 ? this.fontProgram.getGlyph(uni) : this.fontProgram.getGlyphByCode(k);
                        if (glyph != null) {
                            glyphs.add(Integer.valueOf(glyph.getCode()));
                        }
                    }
                }
                ((TrueTypeFont) getFontProgram()).updateUsedGlyphs(glyphs, this.subset, this.subsetRanges);
                try {
                    if (!this.subset && ((TrueTypeFont) getFontProgram()).getDirectoryOffset() <= 0) {
                        fontStreamBytes = ((TrueTypeFont) getFontProgram()).getFontStreamBytes();
                        fontStream = getPdfFontStream(fontStreamBytes, new int[]{fontStreamBytes.length});
                    }
                    fontStreamBytes = ((TrueTypeFont) getFontProgram()).getSubset(glyphs, this.subset);
                    fontStream = getPdfFontStream(fontStreamBytes, new int[]{fontStreamBytes.length});
                } catch (PdfException e2) {
                    Logger logger2 = LoggerFactory.getLogger(PdfTrueTypeFont.class);
                    logger2.error(e2.getMessage());
                    fontStream = null;
                }
            }
            if (fontStream != null) {
                fontDescriptor.put(fontFileName, fontStream);
                if (fontStream.getIndirectReference() != null) {
                    fontStream.flush();
                }
            }
        }
    }

    @Override // com.itextpdf.kernel.font.PdfSimpleFont
    protected boolean isBuiltInFont() {
        return (this.fontProgram instanceof Type1Font) && ((Type1Font) this.fontProgram).isBuiltInFont();
    }
}
