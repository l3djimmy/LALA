package com.itextpdf.kernel.font;

import com.itextpdf.io.font.CidFont;
import com.itextpdf.io.font.FontProgram;
import com.itextpdf.io.font.FontProgramFactory;
import com.itextpdf.io.font.PdfEncodings;
import com.itextpdf.io.font.TrueTypeFont;
import com.itextpdf.io.font.Type1Font;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfObject;
import java.io.IOException;
import java.util.Set;
/* loaded from: classes12.dex */
public final class PdfFontFactory {
    private static final boolean DEFAULT_CACHED = true;
    private static final EmbeddingStrategy DEFAULT_EMBEDDING = EmbeddingStrategy.PREFER_EMBEDDED;
    private static final String DEFAULT_ENCODING = "";

    /* loaded from: classes12.dex */
    public enum EmbeddingStrategy {
        FORCE_EMBEDDED,
        FORCE_NOT_EMBEDDED,
        PREFER_EMBEDDED,
        PREFER_NOT_EMBEDDED
    }

    public static PdfFont createFont() throws IOException {
        return createFont("Helvetica", "");
    }

    public static PdfFont createFont(PdfDictionary fontDictionary) {
        if (fontDictionary == null) {
            throw new PdfException(KernelExceptionMessageConstant.CANNOT_CREATE_FONT_FROM_NULL_PDF_DICTIONARY);
        }
        PdfObject subtypeObject = fontDictionary.get(PdfName.Subtype);
        if (PdfName.Type1.equals(subtypeObject)) {
            return new PdfType1Font(fontDictionary);
        }
        if (PdfName.Type0.equals(subtypeObject)) {
            return new PdfType0Font(fontDictionary);
        }
        if (PdfName.TrueType.equals(subtypeObject)) {
            return new PdfTrueTypeFont(fontDictionary);
        }
        if (PdfName.Type3.equals(subtypeObject)) {
            return new PdfType3Font(fontDictionary);
        }
        if (PdfName.MMType1.equals(subtypeObject)) {
            return new PdfType1Font(fontDictionary);
        }
        throw new PdfException(KernelExceptionMessageConstant.DICTIONARY_DOES_NOT_HAVE_SUPPORTED_FONT_DATA);
    }

    public static PdfFont createFont(String fontProgram, String encoding, PdfDocument cacheTo) throws IOException {
        return createFont(fontProgram, encoding, DEFAULT_EMBEDDING, cacheTo);
    }

    public static PdfFont createFont(String fontProgram, String encoding, EmbeddingStrategy embeddingStrategy, PdfDocument cacheTo) throws IOException {
        if (cacheTo == null) {
            return createFont(fontProgram, encoding, embeddingStrategy);
        }
        PdfFont pdfFont = cacheTo.findFont(fontProgram, encoding);
        if (pdfFont == null && (pdfFont = createFont(fontProgram, encoding, embeddingStrategy)) != null) {
            pdfFont.makeIndirect(cacheTo);
        }
        return pdfFont;
    }

    public static PdfFont createFont(String fontProgram) throws IOException {
        return createFont(fontProgram, "");
    }

    public static PdfFont createFont(String fontProgram, String encoding) throws IOException {
        return createFont(fontProgram, encoding, DEFAULT_EMBEDDING);
    }

    public static PdfFont createFont(String fontProgram, EmbeddingStrategy embeddingStrategy) throws IOException {
        return createFont(fontProgram, "", embeddingStrategy);
    }

    public static PdfFont createFont(String fontProgram, String encoding, EmbeddingStrategy embeddingStrategy) throws IOException {
        return createFont(fontProgram, encoding, embeddingStrategy, true);
    }

    public static PdfFont createFont(String fontProgram, String encoding, EmbeddingStrategy embeddingStrategy, boolean cached) throws IOException {
        FontProgram fp = FontProgramFactory.createFont(fontProgram, encoding, cached);
        return createFont(fp, encoding, embeddingStrategy);
    }

    public static PdfFont createFont(FontProgram fontProgram, String encoding, EmbeddingStrategy embeddingStrategy) {
        if (fontProgram == null) {
            return null;
        }
        if (fontProgram instanceof Type1Font) {
            return createFontFromType1FontProgram((Type1Font) fontProgram, encoding, embeddingStrategy);
        }
        if (fontProgram instanceof TrueTypeFont) {
            if (encoding == null || "".equals(encoding)) {
                encoding = PdfEncodings.IDENTITY_H;
            }
            if (PdfEncodings.IDENTITY_H.equals(encoding) || PdfEncodings.IDENTITY_V.equals(encoding)) {
                return createType0FontFromTrueTypeFontProgram((TrueTypeFont) fontProgram, encoding, embeddingStrategy);
            }
            return createTrueTypeFontFromTrueTypeFontProgram((TrueTypeFont) fontProgram, encoding, embeddingStrategy);
        } else if (!(fontProgram instanceof CidFont)) {
            return null;
        } else {
            return createType0FontFromCidFontProgram((CidFont) fontProgram, encoding, embeddingStrategy);
        }
    }

    public static PdfFont createFont(FontProgram fontProgram, String encoding) {
        return createFont(fontProgram, encoding, DEFAULT_EMBEDDING);
    }

    public static PdfFont createFont(FontProgram fontProgram) {
        return createFont(fontProgram, "");
    }

    public static PdfFont createFont(byte[] fontProgram, String encoding) throws IOException {
        return createFont(fontProgram, encoding, DEFAULT_EMBEDDING);
    }

    public static PdfFont createFont(byte[] fontProgram, EmbeddingStrategy embeddingStrategy) throws IOException {
        return createFont(fontProgram, "", embeddingStrategy);
    }

    public static PdfFont createFont(byte[] fontProgram, String encoding, EmbeddingStrategy embeddingStrategy) throws IOException {
        return createFont(fontProgram, encoding, embeddingStrategy, true);
    }

    public static PdfFont createFont(byte[] fontProgram, String encoding, EmbeddingStrategy embeddingStrategy, boolean cached) throws IOException {
        FontProgram fp = FontProgramFactory.createFont(fontProgram, cached);
        return createFont(fp, encoding, embeddingStrategy);
    }

    public static PdfFont createTtcFont(byte[] ttc, int ttcIndex, String encoding, EmbeddingStrategy embeddingStrategy, boolean cached) throws IOException {
        FontProgram fontProgram = FontProgramFactory.createFont(ttc, ttcIndex, cached);
        return createFont(fontProgram, encoding, embeddingStrategy);
    }

    public static PdfFont createTtcFont(String ttc, int ttcIndex, String encoding, EmbeddingStrategy embeddingStrategy, boolean cached) throws IOException {
        FontProgram fontProgram = FontProgramFactory.createFont(ttc, ttcIndex, cached);
        return createFont(fontProgram, encoding, embeddingStrategy);
    }

    public static PdfType3Font createType3Font(PdfDocument document, boolean colorized) {
        return new PdfType3Font(document, colorized);
    }

    public static PdfType3Font createType3Font(PdfDocument document, String fontName, String fontFamily, boolean colorized) {
        return new PdfType3Font(document, fontName, fontFamily, colorized);
    }

    public static PdfFont createRegisteredFont(String fontName, String encoding, EmbeddingStrategy embeddingStrategy, int style, boolean cached) throws IOException {
        FontProgram fp = FontProgramFactory.createRegisteredFont(fontName, style, cached);
        return createFont(fp, encoding, embeddingStrategy);
    }

    public static PdfFont createRegisteredFont(String fontName, String encoding, EmbeddingStrategy embeddingStrategy, boolean cached) throws IOException {
        return createRegisteredFont(fontName, encoding, embeddingStrategy, -1, cached);
    }

    public static PdfFont createRegisteredFont(String fontName, String encoding, EmbeddingStrategy embeddingStrategy) throws IOException {
        return createRegisteredFont(fontName, encoding, embeddingStrategy, -1);
    }

    public static PdfFont createRegisteredFont(String fontName, String encoding, EmbeddingStrategy embeddingStrategy, int style) throws IOException {
        return createRegisteredFont(fontName, encoding, embeddingStrategy, style, true);
    }

    public static PdfFont createRegisteredFont(String fontName, String encoding) throws IOException {
        return createRegisteredFont(fontName, encoding, DEFAULT_EMBEDDING);
    }

    public static PdfFont createRegisteredFont(String fontName) throws IOException {
        return createRegisteredFont(fontName, "");
    }

    public static void registerFamily(String familyName, String fullName, String path) {
        FontProgramFactory.registerFontFamily(familyName, fullName, path);
    }

    public static void register(String path) {
        register(path, null);
    }

    public static void register(String path, String alias) {
        FontProgramFactory.registerFont(path, alias);
    }

    public static int registerDirectory(String dirPath) {
        return FontProgramFactory.registerFontDirectory(dirPath);
    }

    public static int registerSystemDirectories() {
        return FontProgramFactory.registerSystemFontDirectories();
    }

    public static Set<String> getRegisteredFonts() {
        return FontProgramFactory.getRegisteredFonts();
    }

    public static Set<String> getRegisteredFamilies() {
        return FontProgramFactory.getRegisteredFontFamilies();
    }

    public static boolean isRegistered(String fontName) {
        return FontProgramFactory.isRegisteredFont(fontName);
    }

    private static PdfType1Font createFontFromType1FontProgram(Type1Font fontProgram, String encoding, EmbeddingStrategy embeddingStrategy) {
        boolean embedded;
        switch (embeddingStrategy) {
            case FORCE_EMBEDDED:
                boolean embedded2 = fontProgram.isBuiltInFont();
                if (embedded2) {
                    throw new PdfException(KernelExceptionMessageConstant.CANNOT_EMBED_STANDARD_FONT);
                }
                embedded = true;
                break;
            case PREFER_EMBEDDED:
                boolean embedded3 = fontProgram.isBuiltInFont();
                embedded = !embedded3;
                break;
            case PREFER_NOT_EMBEDDED:
            case FORCE_NOT_EMBEDDED:
                embedded = false;
                break;
            default:
                throw new PdfException(KernelExceptionMessageConstant.UNSUPPORTED_FONT_EMBEDDING_STRATEGY);
        }
        return new PdfType1Font(fontProgram, encoding, embedded);
    }

    private static PdfType0Font createType0FontFromTrueTypeFontProgram(TrueTypeFont fontProgram, String encoding, EmbeddingStrategy embeddingStrategy) {
        if (!fontProgram.getFontNames().allowEmbedding()) {
            throw new PdfException(KernelExceptionMessageConstant.CANNOT_BE_EMBEDDED_DUE_TO_LICENSING_RESTRICTIONS).setMessageParams(fontProgram.getFontNames().getFontName() + fontProgram.getFontNames().getStyle());
        }
        switch (embeddingStrategy) {
            case FORCE_EMBEDDED:
            case PREFER_EMBEDDED:
            case PREFER_NOT_EMBEDDED:
                return new PdfType0Font(fontProgram, encoding);
            case FORCE_NOT_EMBEDDED:
                throw new PdfException(KernelExceptionMessageConstant.CANNOT_CREATE_TYPE_0_FONT_WITH_TRUE_TYPE_FONT_PROGRAM_WITHOUT_EMBEDDING_IT);
            default:
                throw new PdfException(KernelExceptionMessageConstant.UNSUPPORTED_FONT_EMBEDDING_STRATEGY);
        }
    }

    private static PdfTrueTypeFont createTrueTypeFontFromTrueTypeFontProgram(TrueTypeFont fontProgram, String encoding, EmbeddingStrategy embeddingStrategy) {
        boolean embedded;
        switch (embeddingStrategy) {
            case FORCE_EMBEDDED:
                if (!fontProgram.getFontNames().allowEmbedding()) {
                    throw new PdfException(KernelExceptionMessageConstant.CANNOT_BE_EMBEDDED_DUE_TO_LICENSING_RESTRICTIONS).setMessageParams(fontProgram.getFontNames().getFontName() + fontProgram.getFontNames().getStyle());
                }
                embedded = true;
                break;
            case PREFER_EMBEDDED:
                embedded = fontProgram.getFontNames().allowEmbedding();
                break;
            case PREFER_NOT_EMBEDDED:
            case FORCE_NOT_EMBEDDED:
                embedded = false;
                break;
            default:
                throw new PdfException(KernelExceptionMessageConstant.UNSUPPORTED_FONT_EMBEDDING_STRATEGY);
        }
        return new PdfTrueTypeFont(fontProgram, encoding, embedded);
    }

    private static PdfType0Font createType0FontFromCidFontProgram(CidFont fontProgram, String encoding, EmbeddingStrategy embeddingStrategy) {
        if (!fontProgram.compatibleWith(encoding)) {
            return null;
        }
        switch (embeddingStrategy) {
            case FORCE_EMBEDDED:
                throw new PdfException(KernelExceptionMessageConstant.CANNOT_EMBED_TYPE_0_FONT_WITH_CID_FONT_PROGRAM);
            case PREFER_EMBEDDED:
            case PREFER_NOT_EMBEDDED:
            case FORCE_NOT_EMBEDDED:
                return new PdfType0Font(fontProgram, encoding);
            default:
                throw new PdfException(KernelExceptionMessageConstant.UNSUPPORTED_FONT_EMBEDDING_STRATEGY);
        }
    }
}
