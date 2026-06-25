package com.itextpdf.kernel.font;

import androidx.camera.video.AudioStats;
import com.itextpdf.io.font.AdobeGlyphList;
import com.itextpdf.io.font.FontEncoding;
import com.itextpdf.io.font.FontMetrics;
import com.itextpdf.io.font.FontNames;
import com.itextpdf.io.font.FontProgram;
import com.itextpdf.io.font.constants.FontDescriptorFlags;
import com.itextpdf.io.font.otf.Glyph;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfNumber;
import com.itextpdf.kernel.pdf.PdfString;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class PdfType3Font extends PdfSimpleFont<Type3Font> {
    private static final double[] DEFAULT_FONT_MATRIX = {0.001d, AudioStats.AUDIO_AMPLITUDE_NONE, AudioStats.AUDIO_AMPLITUDE_NONE, 0.001d, AudioStats.AUDIO_AMPLITUDE_NONE, AudioStats.AUDIO_AMPLITUDE_NONE};
    private static final int FONT_BBOX_LLX = 0;
    private static final int FONT_BBOX_LLY = 1;
    private static final int FONT_BBOX_URX = 2;
    private static final int FONT_BBOX_URY = 3;
    private double[] fontMatrix;
    private double glyphSpaceNormalizationFactor;

    private double[] getFontMatrix() {
        return this.fontMatrix;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public PdfType3Font(PdfDocument document, boolean colorized) {
        this.fontMatrix = DEFAULT_FONT_MATRIX;
        makeIndirect(document);
        this.subset = true;
        this.embedded = true;
        this.fontProgram = new Type3Font(colorized);
        this.fontEncoding = FontEncoding.createEmptyFontEncoding();
        setGlyphSpaceNormalizationFactor(1.0d);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public PdfType3Font(PdfDocument document, String fontName, String fontFamily, boolean colorized) {
        this(document, colorized);
        ((Type3Font) this.fontProgram).setFontName(fontName);
        ((Type3Font) this.fontProgram).setFontFamily(fontFamily);
        setGlyphSpaceNormalizationFactor(1.0d);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public PdfType3Font(PdfDictionary fontDictionary) {
        super(fontDictionary);
        this.fontMatrix = DEFAULT_FONT_MATRIX;
        this.subset = true;
        this.embedded = true;
        this.fontProgram = new Type3Font(false);
        this.fontEncoding = DocFontEncoding.createDocFontEncoding(fontDictionary.get(PdfName.Encoding), this.toUnicode);
        double[] fontMatrixArray = readFontMatrix();
        double[] fontBBoxRect = readFontBBox();
        double[] widthsArray = readWidths(fontDictionary);
        setGlyphSpaceNormalizationFactor(FontProgram.convertGlyphSpaceToTextSpace(fontMatrixArray[0]));
        PdfDictionary charProcsDic = fontDictionary.getAsDictionary(PdfName.CharProcs);
        PdfDictionary encoding = fontDictionary.getAsDictionary(PdfName.Encoding);
        PdfArray differences = encoding != null ? encoding.getAsArray(PdfName.Differences) : null;
        if (charProcsDic == null || differences == null) {
            LoggerFactory.getLogger(getClass()).warn(IoLogMessageConstant.TYPE3_FONT_INITIALIZATION_ISSUE);
        }
        fillFontDescriptor(fontDictionary.getAsDictionary(PdfName.FontDescriptor));
        normalize1000UnitsToGlyphSpaceUnits(fontMatrixArray);
        normalizeGlyphSpaceUnitsTo1000Units(fontBBoxRect);
        normalizeGlyphSpaceUnitsTo1000Units(widthsArray);
        int firstChar = initializeUsedGlyphs(fontDictionary);
        this.fontMatrix = fontMatrixArray;
        initializeFontBBox(fontBBoxRect);
        initializeTypoAscenderDescender(fontBBoxRect);
        int[] widths = new int[256];
        for (int i = 0; i < widthsArray.length && firstChar + i < 256; i++) {
            widths[firstChar + i] = (int) widthsArray[i];
        }
        addGlyphsFromDifferences(differences, charProcsDic, widths);
        addGlyphsFromCharProcs(charProcsDic, widths);
    }

    public void setFontName(String fontName) {
        ((Type3Font) this.fontProgram).setFontName(fontName);
    }

    public void setFontFamily(String fontFamily) {
        ((Type3Font) this.fontProgram).setFontFamily(fontFamily);
    }

    public void setFontWeight(int fontWeight) {
        ((Type3Font) this.fontProgram).setFontWeight(fontWeight);
    }

    public void setCapHeight(int capHeight) {
        ((Type3Font) this.fontProgram).setCapHeight(capHeight);
    }

    public void setItalicAngle(int italicAngle) {
        ((Type3Font) this.fontProgram).setItalicAngle(italicAngle);
    }

    public void setFontStretch(String fontWidth) {
        ((Type3Font) this.fontProgram).setFontStretch(fontWidth);
    }

    public void setPdfFontFlags(int flags) {
        ((Type3Font) this.fontProgram).setPdfFontFlags(flags);
    }

    public Type3Glyph getType3Glyph(int unicode) {
        return ((Type3Font) getFontProgram()).getType3Glyph(unicode);
    }

    @Override // com.itextpdf.kernel.font.PdfFont
    public boolean isSubset() {
        return true;
    }

    @Override // com.itextpdf.kernel.font.PdfFont
    public boolean isEmbedded() {
        return true;
    }

    public int getNumberOfGlyphs() {
        return ((Type3Font) getFontProgram()).getNumberOfGlyphs();
    }

    public Type3Glyph addGlyph(char c, int wx, int llx, int lly, int urx, int ury) {
        Type3Glyph glyph = getType3Glyph(c);
        if (glyph != null) {
            return glyph;
        }
        int code = getFirstEmptyCode();
        Type3Glyph glyph2 = new Type3Glyph(getDocument(), wx, llx, lly, urx, ury, ((Type3Font) getFontProgram()).isColorized());
        ((Type3Font) getFontProgram()).addGlyph(code, c, wx, new int[]{llx, lly, urx, ury}, glyph2);
        this.fontEncoding.addSymbol(code, c);
        if (!((Type3Font) getFontProgram()).isColorized()) {
            if (this.fontProgram.countOfGlyphs() == 0) {
                this.fontProgram.getFontMetrics().setBbox(llx, lly, urx, ury);
            } else {
                int[] bbox = this.fontProgram.getFontMetrics().getBbox();
                int newLlx = Math.min(bbox[0], llx);
                int newLly = Math.min(bbox[1], lly);
                int newUrx = Math.max(bbox[2], urx);
                int newUry = Math.max(bbox[3], ury);
                this.fontProgram.getFontMetrics().setBbox(newLlx, newLly, newUrx, newUry);
            }
        }
        return glyph2;
    }

    @Override // com.itextpdf.kernel.font.PdfFont
    public Glyph getGlyph(int unicode) {
        if (this.fontEncoding.canEncode(unicode) || unicode < 33) {
            Glyph glyph = getFontProgram().getGlyph(this.fontEncoding.getUnicodeDifference(unicode));
            if (glyph == null) {
                Glyph glyph2 = this.notdefGlyphs.get(Integer.valueOf(unicode));
                if (glyph2 == null) {
                    Glyph glyph3 = new Glyph(-1, 0, unicode);
                    this.notdefGlyphs.put(Integer.valueOf(unicode), glyph3);
                    return glyph3;
                }
                return glyph2;
            }
            return glyph;
        }
        return null;
    }

    @Override // com.itextpdf.kernel.font.PdfFont
    public boolean containsGlyph(int unicode) {
        return (this.fontEncoding.canEncode(unicode) || unicode < 33) && getFontProgram().getGlyph(this.fontEncoding.getUnicodeDifference(unicode)) != null;
    }

    @Override // com.itextpdf.kernel.font.PdfFont, com.itextpdf.kernel.pdf.PdfObjectWrapper
    public void flush() {
        if (isFlushed()) {
            return;
        }
        ensureUnderlyingObjectHasIndirectReference();
        flushFontData();
        super.flush();
    }

    @Override // com.itextpdf.kernel.font.PdfSimpleFont, com.itextpdf.kernel.font.PdfFont
    protected PdfDictionary getFontDescriptor(String fontName) {
        if (fontName != null && fontName.length() > 0) {
            PdfDictionary fontDescriptor = new PdfDictionary();
            makeObjectIndirect(fontDescriptor);
            fontDescriptor.put(PdfName.Type, PdfName.FontDescriptor);
            FontMetrics fontMetrics = this.fontProgram.getFontMetrics();
            int capHeight = fontMetrics.getCapHeight();
            fontDescriptor.put(PdfName.CapHeight, new PdfNumber(normalize1000UnitsToGlyphSpaceUnits(capHeight)));
            fontDescriptor.put(PdfName.ItalicAngle, new PdfNumber(fontMetrics.getItalicAngle()));
            FontNames fontNames = this.fontProgram.getFontNames();
            fontDescriptor.put(PdfName.FontWeight, new PdfNumber(fontNames.getFontWeight()));
            fontDescriptor.put(PdfName.FontName, new PdfName(fontName));
            if (fontNames.getFamilyName() != null && fontNames.getFamilyName().length > 0 && fontNames.getFamilyName()[0].length >= 4) {
                fontDescriptor.put(PdfName.FontFamily, new PdfString(fontNames.getFamilyName()[0][3]));
            }
            int flags = this.fontProgram.getPdfFontFlags();
            fontDescriptor.put(PdfName.Flags, new PdfNumber((flags & (~(FontDescriptorFlags.Symbolic | FontDescriptorFlags.Nonsymbolic))) | (this.fontEncoding.isFontSpecific() ? FontDescriptorFlags.Symbolic : FontDescriptorFlags.Nonsymbolic)));
            return fontDescriptor;
        } else if (getPdfObject().getIndirectReference() != null && ((PdfDictionary) getPdfObject()).getIndirectReference().getDocument().isTagged()) {
            Logger logger = LoggerFactory.getLogger(PdfType3Font.class);
            logger.warn(IoLogMessageConstant.TYPE3_FONT_ISSUE_TAGGED_PDF);
            return null;
        } else {
            return null;
        }
    }

    @Override // com.itextpdf.kernel.font.PdfSimpleFont
    protected PdfArray buildWidthsArray(int firstChar, int lastChar) {
        double[] widths = new double[(lastChar - firstChar) + 1];
        for (int k = firstChar; k <= lastChar; k++) {
            int i = k - firstChar;
            byte b = this.usedGlyphs[k];
            double d = AudioStats.AUDIO_AMPLITUDE_NONE;
            if (b == 0) {
                widths[i] = 0.0d;
            } else {
                int uni = getFontEncoding().getUnicode(k);
                Glyph glyph = uni > -1 ? getGlyph(uni) : getFontProgram().getGlyphByCode(k);
                if (glyph != null) {
                    d = glyph.getWidth();
                }
                widths[i] = d;
            }
        }
        normalize1000UnitsToGlyphSpaceUnits(widths);
        return new PdfArray(widths);
    }

    @Override // com.itextpdf.kernel.font.PdfSimpleFont
    protected void addFontStream(PdfDictionary fontDescriptor) {
    }

    protected PdfDocument getDocument() {
        return getPdfObject().getIndirectReference().getDocument();
    }

    final double getGlyphSpaceNormalizationFactor() {
        return this.glyphSpaceNormalizationFactor;
    }

    final void setGlyphSpaceNormalizationFactor(double glyphSpaceNormalizationFactor) {
        this.glyphSpaceNormalizationFactor = glyphSpaceNormalizationFactor;
    }

    /* JADX WARN: Incorrect condition in loop: B:7:0x000c */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void addGlyphsFromDifferences(com.itextpdf.kernel.pdf.PdfArray r11, com.itextpdf.kernel.pdf.PdfDictionary r12, int[] r13) {
        /*
            r10 = this;
            if (r11 == 0) goto L71
            if (r12 != 0) goto L5
            goto L71
        L5:
            r0 = 0
            r1 = 0
            r3 = r0
        L8:
            int r0 = r11.size()
            if (r1 >= r0) goto L70
            com.itextpdf.kernel.pdf.PdfObject r0 = r11.get(r1)
            boolean r2 = r0.isNumber()
            if (r2 == 0) goto L21
            r2 = r0
            com.itextpdf.kernel.pdf.PdfNumber r2 = (com.itextpdf.kernel.pdf.PdfNumber) r2
            int r2 = r2.intValue()
            r3 = r2
            goto L6d
        L21:
            r2 = 255(0xff, float:3.57E-43)
            if (r3 <= r2) goto L26
            goto L6d
        L26:
            r2 = r0
            com.itextpdf.kernel.pdf.PdfName r2 = (com.itextpdf.kernel.pdf.PdfName) r2
            java.lang.String r8 = r2.getValue()
            com.itextpdf.io.font.FontEncoding r2 = r10.fontEncoding
            int r4 = r2.getUnicode(r3)
            com.itextpdf.io.font.FontProgram r2 = r10.getFontProgram()
            com.itextpdf.io.font.otf.Glyph r2 = r2.getGlyphByCode(r3)
            if (r2 != 0) goto L6b
            com.itextpdf.kernel.pdf.PdfName r2 = new com.itextpdf.kernel.pdf.PdfName
            r2.<init>(r8)
            boolean r2 = r12.containsKey(r2)
            if (r2 == 0) goto L6b
            com.itextpdf.io.font.FontEncoding r2 = r10.fontEncoding
            r2.setDifference(r3, r8)
            com.itextpdf.io.font.FontProgram r2 = r10.getFontProgram()
            com.itextpdf.kernel.font.Type3Font r2 = (com.itextpdf.kernel.font.Type3Font) r2
            r5 = r13[r3]
            com.itextpdf.kernel.font.Type3Glyph r7 = new com.itextpdf.kernel.font.Type3Glyph
            com.itextpdf.kernel.pdf.PdfName r6 = new com.itextpdf.kernel.pdf.PdfName
            r6.<init>(r8)
            com.itextpdf.kernel.pdf.PdfStream r6 = r12.getAsStream(r6)
            com.itextpdf.kernel.pdf.PdfDocument r9 = r10.getDocument()
            r7.<init>(r6, r9)
            r6 = 0
            r2.addGlyph(r3, r4, r5, r6, r7)
        L6b:
            int r3 = r3 + 1
        L6d:
            int r1 = r1 + 1
            goto L8
        L70:
            return
        L71:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.itextpdf.kernel.font.PdfType3Font.addGlyphsFromDifferences(com.itextpdf.kernel.pdf.PdfArray, com.itextpdf.kernel.pdf.PdfDictionary, int[]):void");
    }

    private int getFirstEmptyCode() {
        for (int i = 1; i <= 255; i++) {
            if (!this.fontEncoding.canDecode(i) && this.fontProgram.getGlyphByCode(i) == null) {
                return i;
            }
        }
        return -1;
    }

    private void addGlyphsFromCharProcs(PdfDictionary charProcsDic, int[] widths) {
        int code;
        if (charProcsDic == null) {
            return;
        }
        Map<Integer, Integer> unicodeToCode = null;
        if (getToUnicode() != null) {
            try {
                unicodeToCode = getToUnicode().createReverseMapping();
            } catch (Exception e) {
            }
        }
        for (PdfName glyphName : charProcsDic.keySet()) {
            int unicode = AdobeGlyphList.nameToUnicode(glyphName.getValue());
            if (this.fontEncoding.canEncode(unicode)) {
                int code2 = this.fontEncoding.convertToByte(unicode);
                code = code2;
            } else if (unicodeToCode != null && unicodeToCode.containsKey(Integer.valueOf(unicode))) {
                int code3 = unicodeToCode.get(Integer.valueOf(unicode)).intValue();
                code = code3;
            } else {
                code = -1;
            }
            if (code != -1 && getFontProgram().getGlyphByCode(code) == null) {
                ((Type3Font) getFontProgram()).addGlyph(code, unicode, widths[code], null, new Type3Glyph(charProcsDic.getAsStream(glyphName), getDocument()));
            }
        }
    }

    private void flushFontData() {
        if (((Type3Font) getFontProgram()).getNumberOfGlyphs() < 1) {
            throw new PdfException(KernelExceptionMessageConstant.NO_GLYPHS_DEFINED_FOR_TYPE_3_FONT);
        }
        PdfDictionary charProcs = new PdfDictionary();
        for (int i = 0; i <= 255; i++) {
            Type3Glyph glyph = null;
            if (this.fontEncoding.canDecode(i)) {
                glyph = getType3Glyph(this.fontEncoding.getUnicode(i));
            }
            if (glyph == null) {
                glyph = ((Type3Font) getFontProgram()).getType3GlyphByCode(i);
            }
            if (glyph != null) {
                charProcs.put(new PdfName(this.fontEncoding.getDifference(i)), glyph.getContentStream());
                glyph.getContentStream().flush();
            }
        }
        getPdfObject().put(PdfName.CharProcs, charProcs);
        double[] fontMatrixDouble = getFontMatrix();
        int[] fontBBoxInt = getFontProgram().getFontMetrics().getBbox();
        double[] fontBBoxDouble = {fontBBoxInt[0], fontBBoxInt[1], fontBBoxInt[2], fontBBoxInt[3]};
        normalizeGlyphSpaceUnitsTo1000Units(fontMatrixDouble);
        normalize1000UnitsToGlyphSpaceUnits(fontBBoxDouble);
        getPdfObject().put(PdfName.FontMatrix, new PdfArray(fontMatrixDouble));
        getPdfObject().put(PdfName.FontBBox, new PdfArray(fontBBoxDouble));
        String fontName = this.fontProgram.getFontNames().getFontName();
        super.flushFontData(fontName, PdfName.Type3);
        makeObjectIndirect(getPdfObject().get(PdfName.Widths));
        getPdfObject().remove(PdfName.BaseFont);
    }

    private double[] readWidths(PdfDictionary fontDictionary) {
        PdfArray pdfWidths = fontDictionary.getAsArray(PdfName.Widths);
        if (pdfWidths == null) {
            throw new PdfException(KernelExceptionMessageConstant.MISSING_REQUIRED_FIELD_IN_FONT_DICTIONARY).setMessageParams(PdfName.Widths);
        }
        double[] widths = new double[pdfWidths.size()];
        for (int i = 0; i < pdfWidths.size(); i++) {
            PdfNumber n = pdfWidths.getAsNumber(i);
            widths[i] = n != null ? n.doubleValue() : AudioStats.AUDIO_AMPLITUDE_NONE;
        }
        return widths;
    }

    private int initializeUsedGlyphs(PdfDictionary fontDictionary) {
        int firstChar = normalizeFirstLastChar(fontDictionary.getAsNumber(PdfName.FirstChar), 0);
        int lastChar = normalizeFirstLastChar(fontDictionary.getAsNumber(PdfName.LastChar), 255);
        for (int i = firstChar; i <= lastChar; i++) {
            this.usedGlyphs[i] = 1;
        }
        return firstChar;
    }

    private double[] readFontBBox() {
        PdfArray fontBBox = getPdfObject().getAsArray(PdfName.FontBBox);
        if (fontBBox != null) {
            double llx = fontBBox.getAsNumber(0).doubleValue();
            double lly = fontBBox.getAsNumber(1).doubleValue();
            double urx = fontBBox.getAsNumber(2).doubleValue();
            double ury = fontBBox.getAsNumber(3).doubleValue();
            return new double[]{llx, lly, urx, ury};
        }
        return new double[]{AudioStats.AUDIO_AMPLITUDE_NONE, AudioStats.AUDIO_AMPLITUDE_NONE, AudioStats.AUDIO_AMPLITUDE_NONE, AudioStats.AUDIO_AMPLITUDE_NONE};
    }

    private double[] readFontMatrix() {
        PdfArray fontMatrixArray = getPdfObject().getAsArray(PdfName.FontMatrix);
        if (fontMatrixArray == null) {
            throw new PdfException(KernelExceptionMessageConstant.MISSING_REQUIRED_FIELD_IN_FONT_DICTIONARY).setMessageParams(PdfName.FontMatrix);
        }
        double[] fontMatrix = new double[6];
        for (int i = 0; i < fontMatrixArray.size(); i++) {
            fontMatrix[i] = ((PdfNumber) fontMatrixArray.get(i)).getValue();
        }
        return fontMatrix;
    }

    private void initializeTypoAscenderDescender(double[] fontBBoxRect) {
        ((Type3Font) this.fontProgram).setTypoAscender((int) fontBBoxRect[3]);
        ((Type3Font) this.fontProgram).setTypoDescender((int) fontBBoxRect[1]);
    }

    private void initializeFontBBox(double[] fontBBoxRect) {
        this.fontProgram.getFontMetrics().setBbox((int) fontBBoxRect[0], (int) fontBBoxRect[1], (int) fontBBoxRect[2], (int) fontBBoxRect[3]);
    }

    private void normalizeGlyphSpaceUnitsTo1000Units(double[] array) {
        for (int i = 0; i < array.length; i++) {
            array[i] = normalizeGlyphSpaceUnitsTo1000Units(array[i]);
        }
    }

    private double normalizeGlyphSpaceUnitsTo1000Units(double value) {
        return getGlyphSpaceNormalizationFactor() * value;
    }

    private void normalize1000UnitsToGlyphSpaceUnits(double[] array) {
        for (int i = 0; i < array.length; i++) {
            array[i] = normalize1000UnitsToGlyphSpaceUnits(array[i]);
        }
    }

    private double normalize1000UnitsToGlyphSpaceUnits(double value) {
        return value / getGlyphSpaceNormalizationFactor();
    }

    private void fillFontDescriptor(PdfDictionary fontDesc) {
        if (fontDesc == null) {
            return;
        }
        PdfNumber v = fontDesc.getAsNumber(PdfName.CapHeight);
        if (v != null) {
            double capHeight = v.doubleValue();
            setCapHeight((int) normalizeGlyphSpaceUnitsTo1000Units(capHeight));
        }
        PdfNumber v2 = fontDesc.getAsNumber(PdfName.ItalicAngle);
        if (v2 != null) {
            setItalicAngle(v2.intValue());
        }
        PdfNumber v3 = fontDesc.getAsNumber(PdfName.FontWeight);
        if (v3 != null) {
            setFontWeight(v3.intValue());
        }
        PdfName fontStretch = fontDesc.getAsName(PdfName.FontStretch);
        if (fontStretch != null) {
            setFontStretch(fontStretch.getValue());
        }
        PdfName fontName = fontDesc.getAsName(PdfName.FontName);
        if (fontName != null) {
            setFontName(fontName.getValue());
        }
        PdfString fontFamily = fontDesc.getAsString(PdfName.FontFamily);
        if (fontFamily != null) {
            setFontFamily(fontFamily.getValue());
        }
    }

    private int normalizeFirstLastChar(PdfNumber firstLast, int defaultValue) {
        if (firstLast == null) {
            return defaultValue;
        }
        int result = firstLast.intValue();
        return (result < 0 || result > 255) ? defaultValue : result;
    }
}
