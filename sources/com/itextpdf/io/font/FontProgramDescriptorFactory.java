package com.itextpdf.io.font;

import com.itextpdf.io.font.constants.StandardFonts;
import com.itextpdf.io.font.woff2.Woff2Converter;
import java.io.IOException;
/* loaded from: classes12.dex */
public final class FontProgramDescriptorFactory {
    private static boolean FETCH_CACHED_FIRST = true;

    public static FontProgramDescriptor fetchDescriptor(String fontName) {
        byte[] fontProgram;
        FontProgramDescriptor fontDescriptor;
        if (fontName == null || fontName.length() == 0) {
            return null;
        }
        String baseName = FontProgram.trimFontStyle(fontName);
        boolean isBuiltinFonts14 = StandardFonts.isStandardFont(fontName);
        boolean isCidFont = !isBuiltinFonts14 && CjkResourceLoader.isPredefinedCidFont(baseName);
        if (FETCH_CACHED_FIRST && (fontDescriptor = fetchCachedDescriptor(fontName, null)) != null) {
            return fontDescriptor;
        }
        try {
            String fontNameLowerCase = baseName.toLowerCase();
            if (!isBuiltinFonts14 && !fontNameLowerCase.endsWith(".afm") && !fontNameLowerCase.endsWith(".pfm")) {
                if (isCidFont) {
                    FontProgramDescriptor fontDescriptor2 = fetchCidFontDescriptor(fontName);
                    return fontDescriptor2;
                }
                if (!fontNameLowerCase.endsWith(".ttf") && !fontNameLowerCase.endsWith(".otf")) {
                    if (!fontNameLowerCase.endsWith(".woff") && !fontNameLowerCase.endsWith(".woff2")) {
                        FontProgramDescriptor fontDescriptor3 = fetchTTCDescriptor(baseName);
                        return fontDescriptor3;
                    }
                    if (fontNameLowerCase.endsWith(".woff")) {
                        fontProgram = WoffConverter.convert(FontProgramFactory.readFontBytesFromPath(baseName));
                    } else {
                        byte[] fontProgram2 = FontProgramFactory.readFontBytesFromPath(baseName);
                        fontProgram = Woff2Converter.convert(fontProgram2);
                    }
                    FontProgramDescriptor fontDescriptor4 = fetchTrueTypeFontDescriptor(fontProgram);
                    return fontDescriptor4;
                }
                FontProgramDescriptor fontDescriptor5 = fetchTrueTypeFontDescriptor(fontName);
                return fontDescriptor5;
            }
            FontProgramDescriptor fontDescriptor6 = fetchType1FontDescriptor(fontName, null);
            return fontDescriptor6;
        } catch (Exception e) {
            return null;
        }
    }

    public static FontProgramDescriptor fetchDescriptor(byte[] fontProgram) {
        if (fontProgram == null || fontProgram.length == 0) {
            return null;
        }
        FontProgramDescriptor fontDescriptor = null;
        if (FETCH_CACHED_FIRST && (fontDescriptor = fetchCachedDescriptor(null, fontProgram)) != null) {
            return fontDescriptor;
        }
        try {
            fontDescriptor = fetchTrueTypeFontDescriptor(fontProgram);
        } catch (Exception e) {
        }
        if (fontDescriptor == null) {
            try {
                FontProgramDescriptor fontDescriptor2 = fetchType1FontDescriptor(null, fontProgram);
                return fontDescriptor2;
            } catch (Exception e2) {
                return fontDescriptor;
            }
        }
        return fontDescriptor;
    }

    public static FontProgramDescriptor fetchDescriptor(FontProgram fontProgram) {
        return fetchDescriptorFromFontProgram(fontProgram);
    }

    private static FontProgramDescriptor fetchCachedDescriptor(String fontName, byte[] fontProgram) {
        FontCacheKey key;
        if (fontName != null) {
            key = FontCacheKey.create(fontName);
        } else {
            key = FontCacheKey.create(fontProgram);
        }
        FontProgram fontFound = FontCache.getFont(key);
        if (fontFound != null) {
            return fetchDescriptorFromFontProgram(fontFound);
        }
        return null;
    }

    private static FontProgramDescriptor fetchTTCDescriptor(String baseName) throws IOException {
        int ttcSplit = baseName.toLowerCase().indexOf(".ttc,");
        if (ttcSplit > 0) {
            try {
                String ttcName = baseName.substring(0, ttcSplit + 4);
                int ttcIndex = Integer.parseInt(baseName.substring(ttcSplit + 5));
                OpenTypeParser parser = new OpenTypeParser(ttcName, ttcIndex);
                FontProgramDescriptor descriptor = fetchOpenTypeFontDescriptor(parser);
                parser.close();
                return descriptor;
            } catch (NumberFormatException nfe) {
                throw new com.itextpdf.io.exceptions.IOException(nfe.getMessage(), (Throwable) nfe);
            }
        }
        return null;
    }

    private static FontProgramDescriptor fetchTrueTypeFontDescriptor(String fontName) throws IOException {
        OpenTypeParser parser = new OpenTypeParser(fontName);
        try {
            FontProgramDescriptor fetchOpenTypeFontDescriptor = fetchOpenTypeFontDescriptor(parser);
            parser.close();
            return fetchOpenTypeFontDescriptor;
        } catch (Throwable th) {
            try {
                throw th;
            } catch (Throwable th2) {
                try {
                    parser.close();
                } catch (Throwable th3) {
                    th.addSuppressed(th3);
                }
                throw th2;
            }
        }
    }

    private static FontProgramDescriptor fetchTrueTypeFontDescriptor(byte[] fontProgram) throws IOException {
        OpenTypeParser parser = new OpenTypeParser(fontProgram);
        try {
            FontProgramDescriptor fetchOpenTypeFontDescriptor = fetchOpenTypeFontDescriptor(parser);
            parser.close();
            return fetchOpenTypeFontDescriptor;
        } catch (Throwable th) {
            try {
                throw th;
            } catch (Throwable th2) {
                try {
                    parser.close();
                } catch (Throwable th3) {
                    th.addSuppressed(th3);
                }
                throw th2;
            }
        }
    }

    private static FontProgramDescriptor fetchOpenTypeFontDescriptor(OpenTypeParser fontParser) throws IOException {
        fontParser.loadTables(false);
        return new FontProgramDescriptor(fontParser.getFontNames(), fontParser.getPostTable().italicAngle, fontParser.getPostTable().isFixedPitch);
    }

    private static FontProgramDescriptor fetchType1FontDescriptor(String fontName, byte[] afm) throws IOException {
        Type1Font fp = new Type1Font(fontName, null, afm, null);
        return new FontProgramDescriptor(fp.getFontNames(), fp.getFontMetrics());
    }

    private static FontProgramDescriptor fetchCidFontDescriptor(String fontName) {
        CidFont font = new CidFont(fontName, null, null);
        return new FontProgramDescriptor(font.getFontNames(), font.getFontMetrics());
    }

    private static FontProgramDescriptor fetchDescriptorFromFontProgram(FontProgram fontProgram) {
        return new FontProgramDescriptor(fontProgram.getFontNames(), fontProgram.getFontMetrics());
    }
}
