package com.itextpdf.layout.font;

import com.itextpdf.commons.utils.FileUtil;
import com.itextpdf.io.font.FontProgram;
import com.itextpdf.io.font.FontProgramFactory;
import com.itextpdf.io.font.PdfEncodings;
import com.itextpdf.io.font.Type1Font;
import com.itextpdf.io.font.constants.StandardFonts;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.layout.font.selectorstrategy.FirstMatchFontSelectorStrategy;
import com.itextpdf.layout.font.selectorstrategy.IFontSelectorStrategy;
import com.itextpdf.layout.font.selectorstrategy.IFontSelectorStrategyFactory;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/* loaded from: classes12.dex */
public class FontProvider {
    private static final String DEFAULT_FONT_FAMILY = "Helvetica";
    protected final String defaultFontFamily;
    private final FontSelectorCache fontSelectorCache;
    private IFontSelectorStrategyFactory fontSelectorStrategyFactory;
    private final FontSet fontSet;
    protected final Map<FontInfo, PdfFont> pdfFonts;

    public FontProvider(FontSet fontSet) {
        this(fontSet, "Helvetica");
    }

    public FontProvider() {
        this(new FontSet());
    }

    public FontProvider(String defaultFontFamily) {
        this(new FontSet(), defaultFontFamily);
    }

    public FontProvider(FontSet fontSet, String defaultFontFamily) {
        this.fontSet = fontSet != null ? fontSet : new FontSet();
        this.pdfFonts = new HashMap();
        this.fontSelectorCache = new FontSelectorCache(this.fontSet);
        this.defaultFontFamily = defaultFontFamily;
        this.fontSelectorStrategyFactory = new FirstMatchFontSelectorStrategy.FirstMathFontSelectorStrategyFactory();
    }

    public boolean addFont(FontProgram fontProgram, String encoding, Range unicodeRange) {
        return this.fontSet.addFont(fontProgram, encoding, (String) null, unicodeRange);
    }

    public boolean addFont(FontProgram fontProgram, String encoding) {
        return addFont(fontProgram, encoding, (Range) null);
    }

    public boolean addFont(FontProgram fontProgram) {
        return addFont(fontProgram, getDefaultEncoding(fontProgram));
    }

    public boolean addFont(String fontPath, String encoding, Range unicodeRange) {
        return this.fontSet.addFont(fontPath, encoding, (String) null, unicodeRange);
    }

    public boolean addFont(String fontPath, String encoding) {
        return addFont(fontPath, encoding, (Range) null);
    }

    public boolean addFont(String fontPath) {
        return addFont(fontPath, (String) null);
    }

    public boolean addFont(byte[] fontData, String encoding, Range unicodeRange) {
        return this.fontSet.addFont(fontData, encoding, (String) null, unicodeRange);
    }

    public boolean addFont(byte[] fontData, String encoding) {
        return addFont(fontData, encoding, (Range) null);
    }

    public boolean addFont(byte[] fontData) {
        return addFont(fontData, (String) null);
    }

    public int addDirectory(String dir) {
        return this.fontSet.addDirectory(dir);
    }

    public int addSystemFonts() {
        int count = 0;
        String[] withSubDirs = {FileUtil.getFontsDir(), "/usr/share/X11/fonts", "/usr/X/lib/X11/fonts", "/usr/openwin/lib/X11/fonts", "/usr/share/fonts", "/usr/X11R6/lib/X11/fonts"};
        for (String directory : withSubDirs) {
            count += this.fontSet.addDirectory(directory, true);
        }
        String[] withoutSubDirs = {"/Library/Fonts", "/System/Library/Fonts"};
        for (String directory2 : withoutSubDirs) {
            count += this.fontSet.addDirectory(directory2, false);
        }
        return count;
    }

    public int addStandardPdfFonts() {
        addFont("Courier");
        addFont(StandardFonts.COURIER_BOLD);
        addFont(StandardFonts.COURIER_BOLDOBLIQUE);
        addFont(StandardFonts.COURIER_OBLIQUE);
        addFont("Helvetica");
        addFont(StandardFonts.HELVETICA_BOLD);
        addFont(StandardFonts.HELVETICA_BOLDOBLIQUE);
        addFont(StandardFonts.HELVETICA_OBLIQUE);
        addFont("Symbol");
        addFont(StandardFonts.TIMES_ROMAN);
        addFont(StandardFonts.TIMES_BOLD);
        addFont(StandardFonts.TIMES_BOLDITALIC);
        addFont(StandardFonts.TIMES_ITALIC);
        addFont("ZapfDingbats");
        return 14;
    }

    public FontSet getFontSet() {
        return this.fontSet;
    }

    public String getDefaultFontFamily() {
        return this.defaultFontFamily;
    }

    public String getDefaultEncoding(FontProgram fontProgram) {
        if (fontProgram instanceof Type1Font) {
            return "Cp1252";
        }
        return PdfEncodings.IDENTITY_H;
    }

    public boolean getDefaultCacheFlag() {
        return true;
    }

    public boolean getDefaultEmbeddingFlag() {
        return true;
    }

    @Deprecated
    public FontSelectorStrategy getStrategy(String text, List<String> fontFamilies, FontCharacteristics fc, FontSet additionalFonts) {
        return new ComplexFontSelectorStrategy(text, getFontSelector(fontFamilies, fc, additionalFonts), this, additionalFonts);
    }

    @Deprecated
    public FontSelectorStrategy getStrategy(String text, List<String> fontFamilies, FontCharacteristics fc) {
        return getStrategy(text, fontFamilies, fc, null);
    }

    @Deprecated
    public FontSelectorStrategy getStrategy(String text, List<String> fontFamilies) {
        return getStrategy(text, fontFamilies, null);
    }

    public void setFontSelectorStrategyFactory(IFontSelectorStrategyFactory factory) {
        this.fontSelectorStrategyFactory = factory;
    }

    public IFontSelectorStrategy createFontSelectorStrategy(List<String> fontFamilies, FontCharacteristics fc, FontSet additionalFonts) {
        FontSelector fontSelector = getFontSelector(fontFamilies, fc, additionalFonts);
        return this.fontSelectorStrategyFactory.createFontSelectorStrategy(this, fontSelector, additionalFonts);
    }

    public final FontSelector getFontSelector(List<String> fontFamilies, FontCharacteristics fc) {
        FontSelectorKey key = new FontSelectorKey(fontFamilies, fc);
        FontSelector fontSelector = this.fontSelectorCache.get(key);
        if (fontSelector == null) {
            FontSelector fontSelector2 = createFontSelector(this.fontSet.getFonts(), fontFamilies, fc);
            this.fontSelectorCache.put(key, fontSelector2);
            return fontSelector2;
        }
        return fontSelector;
    }

    public final FontSelector getFontSelector(List<String> fontFamilies, FontCharacteristics fc, FontSet additionalFonts) {
        FontSelectorKey key = new FontSelectorKey(fontFamilies, fc);
        FontSelector fontSelector = this.fontSelectorCache.get(key, additionalFonts);
        if (fontSelector == null) {
            FontSelector fontSelector2 = createFontSelector(this.fontSet.getFonts(additionalFonts), fontFamilies, fc);
            this.fontSelectorCache.put(key, fontSelector2, additionalFonts);
            return fontSelector2;
        }
        return fontSelector;
    }

    protected FontSelector createFontSelector(Collection<FontInfo> fonts, List<String> fontFamilies, FontCharacteristics fc) {
        List<String> fontFamiliesToBeProcessed = new ArrayList<>(fontFamilies);
        fontFamiliesToBeProcessed.add(this.defaultFontFamily);
        return new FontSelector(fonts, fontFamiliesToBeProcessed, fc);
    }

    public PdfFont getPdfFont(FontInfo fontInfo) {
        return getPdfFont(fontInfo, null);
    }

    public PdfFont getPdfFont(FontInfo fontInfo, FontSet additionalFonts) {
        if (this.pdfFonts.containsKey(fontInfo)) {
            return this.pdfFonts.get(fontInfo);
        }
        FontProgram fontProgram = null;
        if (additionalFonts != null) {
            fontProgram = additionalFonts.getFontProgram(fontInfo);
        }
        if (fontProgram == null) {
            fontProgram = this.fontSet.getFontProgram(fontInfo);
        }
        if (fontProgram == null) {
            try {
                if (fontInfo.getFontData() != null) {
                    fontProgram = FontProgramFactory.createFont(fontInfo.getFontData(), getDefaultCacheFlag());
                } else {
                    fontProgram = FontProgramFactory.createFont(fontInfo.getFontName(), getDefaultCacheFlag());
                }
            } catch (IOException e) {
                throw new PdfException("I/O exception while creating Font", (Throwable) e);
            }
        }
        String encoding = fontInfo.getEncoding();
        if (encoding == null || encoding.length() == 0) {
            encoding = getDefaultEncoding(fontProgram);
        }
        PdfFontFactory.EmbeddingStrategy embeddingStrategy = getDefaultEmbeddingFlag() ? PdfFontFactory.EmbeddingStrategy.PREFER_EMBEDDED : PdfFontFactory.EmbeddingStrategy.PREFER_NOT_EMBEDDED;
        PdfFont pdfFont = PdfFontFactory.createFont(fontProgram, encoding, embeddingStrategy);
        this.pdfFonts.put(fontInfo, pdfFont);
        return pdfFont;
    }

    public void reset() {
        this.pdfFonts.clear();
    }
}
