package com.itextpdf.kernel.font;

import androidx.exifinterface.media.ExifInterface;
import com.itextpdf.commons.exceptions.ITextException;
import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.font.CFFFontSubset;
import com.itextpdf.io.font.CMapEncoding;
import com.itextpdf.io.font.CidFont;
import com.itextpdf.io.font.CidFontProperties;
import com.itextpdf.io.font.FontProgram;
import com.itextpdf.io.font.FontProgramFactory;
import com.itextpdf.io.font.PdfEncodings;
import com.itextpdf.io.font.TrueTypeFont;
import com.itextpdf.io.font.cmap.CMapCharsetEncoder;
import com.itextpdf.io.font.cmap.CMapContentParser;
import com.itextpdf.io.font.cmap.CMapToUnicode;
import com.itextpdf.io.font.cmap.StandardCMapCharsets;
import com.itextpdf.io.font.otf.Glyph;
import com.itextpdf.io.font.otf.GlyphLine;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.io.source.ByteBuffer;
import com.itextpdf.io.source.OutputStream;
import com.itextpdf.io.util.StreamUtil;
import com.itextpdf.io.util.TextUtil;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfLiteral;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfNumber;
import com.itextpdf.kernel.pdf.PdfObject;
import com.itextpdf.kernel.pdf.PdfOutputStream;
import com.itextpdf.kernel.pdf.PdfStream;
import com.itextpdf.kernel.pdf.PdfString;
import com.itextpdf.kernel.pdf.PdfVersion;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;
import kotlin.UByte;
import kotlin.jvm.internal.ByteCompanionObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class PdfType0Font extends PdfFont {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    protected static final int CID_FONT_TYPE_0 = 0;
    protected static final int CID_FONT_TYPE_2 = 2;
    private static final String DEFAULT_ENCODING = "";
    private static final int MAX_CID_CODE_LENGTH = 4;
    private static final byte[] rotbits = {ByteCompanionObject.MIN_VALUE, 64, 32, 16, 8, 4, 2, 1};
    protected int cidFontType;
    protected CMapEncoding cmapEncoding;
    private final CMapToUnicode embeddedToUnicode;
    protected char[] specificUnicodeDifferences;
    protected Set<Integer> usedGlyphs;
    protected boolean vertical;

    /* JADX INFO: Access modifiers changed from: package-private */
    public PdfType0Font(TrueTypeFont ttf, String cmap) {
        if (!PdfEncodings.IDENTITY_H.equals(cmap) && !PdfEncodings.IDENTITY_V.equals(cmap)) {
            throw new PdfException(KernelExceptionMessageConstant.ONLY_IDENTITY_CMAPS_SUPPORTS_WITH_TRUETYPE);
        }
        if (!ttf.getFontNames().allowEmbedding()) {
            throw new PdfException(KernelExceptionMessageConstant.CANNOT_BE_EMBEDDED_DUE_TO_LICENSING_RESTRICTIONS).setMessageParams(ttf.getFontNames().getFontName() + ttf.getFontNames().getStyle());
        }
        this.fontProgram = ttf;
        this.embedded = true;
        this.vertical = cmap.endsWith(ExifInterface.GPS_MEASUREMENT_INTERRUPTED);
        this.cmapEncoding = new CMapEncoding(cmap);
        this.usedGlyphs = new TreeSet();
        this.cidFontType = 2;
        this.embeddedToUnicode = null;
        if (ttf.isFontSpecific()) {
            this.specificUnicodeDifferences = new char[256];
            byte[] bytes = new byte[1];
            for (int k = 0; k < 256; k++) {
                bytes[0] = (byte) k;
                String s = PdfEncodings.convertToString(bytes, null);
                char ch = s.length() > 0 ? s.charAt(0) : '?';
                this.specificUnicodeDifferences[k] = ch;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public PdfType0Font(CidFont font, String cmap) {
        if (!CidFontProperties.isCidFont(font.getFontNames().getFontName(), cmap)) {
            throw new PdfException("Font {0} with {1} encoding is not a cjk font.").setMessageParams(font.getFontNames().getFontName(), cmap);
        }
        this.fontProgram = font;
        this.vertical = cmap.endsWith(ExifInterface.GPS_MEASUREMENT_INTERRUPTED);
        String uniMap = getCompatibleUniMap(this.fontProgram.getRegistry());
        this.cmapEncoding = new CMapEncoding(cmap, uniMap);
        this.usedGlyphs = new TreeSet();
        this.cidFontType = 0;
        this.embeddedToUnicode = null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public PdfType0Font(PdfDictionary fontDictionary) {
        super(fontDictionary);
        CMapToUnicode toUnicodeCMap;
        String uniMap;
        this.newFont = false;
        PdfDictionary cidFont = fontDictionary.getAsArray(PdfName.DescendantFonts).getAsDictionary(0);
        PdfObject cmap = fontDictionary.get(PdfName.Encoding);
        String ordering = getOrdering(cidFont);
        if (ordering == null) {
            throw new PdfException(KernelExceptionMessageConstant.ORDERING_SHOULD_BE_DETERMINED);
        }
        PdfObject toUnicode = fontDictionary.get(PdfName.ToUnicode);
        if (toUnicode == null) {
            toUnicodeCMap = FontUtil.parseUniversalToUnicodeCMap(ordering);
            this.embeddedToUnicode = null;
        } else {
            toUnicodeCMap = FontUtil.processToUnicode(toUnicode);
            this.embeddedToUnicode = toUnicodeCMap;
        }
        if (cmap.isName() && (toUnicodeCMap != null || PdfEncodings.IDENTITY_H.equals(((PdfName) cmap).getValue()) || PdfEncodings.IDENTITY_V.equals(((PdfName) cmap).getValue()))) {
            if (toUnicodeCMap == null && (toUnicodeCMap = FontUtil.getToUnicodeFromUniMap((uniMap = getUniMapFromOrdering(ordering, PdfEncodings.IDENTITY_H.equals(((PdfName) cmap).getValue()))))) == null) {
                toUnicodeCMap = FontUtil.getToUnicodeFromUniMap(PdfEncodings.IDENTITY_H);
                Logger logger = LoggerFactory.getLogger(PdfType0Font.class);
                logger.error(MessageFormatUtil.format(IoLogMessageConstant.UNKNOWN_CMAP, uniMap));
            }
            this.fontProgram = DocTrueTypeFont.createFontProgram(cidFont, toUnicodeCMap);
            this.cmapEncoding = createCMap(cmap, null);
            if (!(this.fontProgram instanceof IDocFontProgram)) {
                throw new AssertionError();
            }
            this.embedded = ((IDocFontProgram) this.fontProgram).getFontFile() != null;
        } else {
            String cidFontName = cidFont.getAsName(PdfName.BaseFont).getValue();
            String uniMap2 = getUniMapFromOrdering(ordering, true);
            if (uniMap2 != null && uniMap2.startsWith("Uni") && CidFontProperties.isCidFont(cidFontName, uniMap2)) {
                try {
                    this.fontProgram = FontProgramFactory.createFont(cidFontName);
                    this.cmapEncoding = createCMap(cmap, uniMap2);
                    this.embedded = false;
                } catch (IOException e) {
                    this.fontProgram = null;
                    this.cmapEncoding = null;
                }
            } else {
                toUnicodeCMap = toUnicodeCMap == null ? FontUtil.getToUnicodeFromUniMap(uniMap2) : toUnicodeCMap;
                if (toUnicodeCMap != null) {
                    this.fontProgram = DocTrueTypeFont.createFontProgram(cidFont, toUnicodeCMap);
                    this.cmapEncoding = createCMap(cmap, uniMap2);
                }
            }
            if (this.fontProgram == null) {
                throw new PdfException(MessageFormatUtil.format(KernelExceptionMessageConstant.CANNOT_RECOGNISE_DOCUMENT_FONT_WITH_ENCODING, cidFontName, cmap));
            }
        }
        PdfDictionary cidFontDictionary = fontDictionary.getAsArray(PdfName.DescendantFonts).getAsDictionary(0);
        PdfName subtype = cidFontDictionary.getAsName(PdfName.Subtype);
        if (PdfName.CIDFontType0.equals(subtype)) {
            this.cidFontType = 0;
        } else if (PdfName.CIDFontType2.equals(subtype)) {
            this.cidFontType = 2;
        } else {
            LoggerFactory.getLogger(getClass()).error(IoLogMessageConstant.FAILED_TO_DETERMINE_CID_FONT_SUBTYPE);
        }
        this.usedGlyphs = new TreeSet();
        this.subset = false;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public static String getUniMapFromOrdering(String ordering, boolean horizontal) {
        char c;
        String result;
        switch (ordering.hashCode()) {
            case -2083395317:
                if (ordering.equals("Japan1")) {
                    c = 1;
                    break;
                }
                c = 65535;
                break;
            case -2041773849:
                if (ordering.equals("Korea1")) {
                    c = 2;
                    break;
                }
                c = 65535;
                break;
            case -71117602:
                if (ordering.equals("Identity")) {
                    c = 4;
                    break;
                }
                c = 65535;
                break;
            case 70326:
                if (ordering.equals("GB1")) {
                    c = 3;
                    break;
                }
                c = 65535;
                break;
            case 2073577:
                if (ordering.equals("CNS1")) {
                    c = 0;
                    break;
                }
                c = 65535;
                break;
            default:
                c = 65535;
                break;
        }
        switch (c) {
            case 0:
                result = "UniCNS-UTF16-";
                break;
            case 1:
                result = "UniJIS-UTF16-";
                break;
            case 2:
                result = "UniKS-UTF16-";
                break;
            case 3:
                result = "UniGB-UTF16-";
                break;
            case 4:
                result = "Identity-";
                break;
            default:
                return null;
        }
        if (horizontal) {
            return result + 'H';
        }
        return result + 'V';
    }

    @Override // com.itextpdf.kernel.font.PdfFont
    public Glyph getGlyph(int unicode) {
        Glyph glyph = getFontProgram().getGlyph(unicode);
        if (glyph == null) {
            Glyph glyph2 = this.notdefGlyphs.get(Integer.valueOf(unicode));
            glyph = glyph2;
            if (glyph2 == null) {
                Glyph notdef = getFontProgram().getGlyphByCode(0);
                if (notdef != null) {
                    glyph = new Glyph(notdef, unicode);
                } else {
                    glyph = new Glyph(-1, 0, unicode);
                }
                this.notdefGlyphs.put(Integer.valueOf(unicode), glyph);
            }
        }
        return glyph;
    }

    @Override // com.itextpdf.kernel.font.PdfFont
    public boolean containsGlyph(int unicode) {
        if (this.cidFontType == 0) {
            return this.cmapEncoding.isDirect() ? this.fontProgram.getGlyphByCode(unicode) != null : getFontProgram().getGlyph(unicode) != null;
        } else if (this.cidFontType == 2) {
            if (!this.fontProgram.isFontSpecific()) {
                return getFontProgram().getGlyph(unicode) != null;
            }
            byte[] b = PdfEncodings.convertToBytes((char) unicode, "symboltt");
            return b.length > 0 && this.fontProgram.getGlyph(b[0] & UByte.MAX_VALUE) != null;
        } else {
            throw new PdfException("Invalid CID font type: " + this.cidFontType);
        }
    }

    private byte[] convertToBytesUsingCMap(String text) {
        int val;
        int len = text.length();
        ByteBuffer buffer = new ByteBuffer();
        if (this.fontProgram.isFontSpecific()) {
            byte[] b = PdfEncodings.convertToBytes(text, "symboltt");
            for (byte b2 : b) {
                Glyph glyph = this.fontProgram.getGlyph(b2 & UByte.MAX_VALUE);
                if (glyph != null) {
                    convertToBytes(glyph, buffer);
                }
            }
        } else {
            int k = 0;
            while (k < len) {
                if (TextUtil.isSurrogatePair(text, k)) {
                    val = TextUtil.convertToUtf32(text, k);
                    k++;
                } else {
                    val = text.charAt(k);
                }
                Glyph glyph2 = getGlyph(val);
                if (glyph2.getCode() > 0) {
                    convertToBytes(glyph2, buffer);
                } else {
                    buffer.append(this.cmapEncoding.getCmapBytes(0));
                }
                k++;
            }
        }
        return buffer.toByteArray();
    }

    @Override // com.itextpdf.kernel.font.PdfFont
    public byte[] convertToBytes(String text) {
        CMapCharsetEncoder encoder = StandardCMapCharsets.getEncoder(this.cmapEncoding.getCmapName());
        if (encoder == null) {
            return convertToBytesUsingCMap(text);
        }
        return converToBytesUsingEncoder(text, encoder);
    }

    private byte[] converToBytesUsingEncoder(String text, CMapCharsetEncoder encoder) {
        ByteArrayOutputStream stream = new ByteArrayOutputStream();
        int[] codePoints = TextUtil.convertToUtf32(text);
        for (int cp : codePoints) {
            try {
                stream.write(encoder.encodeUnicodeCodePoint(cp));
                Glyph glyph = getGlyph(cp);
                if (glyph.getCode() > 0) {
                    this.usedGlyphs.add(Integer.valueOf(glyph.getCode()));
                }
            } catch (IOException e) {
                throw new ITextException(e);
            }
        }
        return stream.toByteArray();
    }

    @Override // com.itextpdf.kernel.font.PdfFont
    public byte[] convertToBytes(GlyphLine glyphLine) {
        if (glyphLine == null) {
            return new byte[0];
        }
        CMapCharsetEncoder encoder = StandardCMapCharsets.getEncoder(this.cmapEncoding.getCmapName());
        if (encoder == null) {
            int totalByteCount = 0;
            for (int i = glyphLine.start; i < glyphLine.end; i++) {
                totalByteCount += this.cmapEncoding.getCmapBytesLength(glyphLine.get(i).getCode());
            }
            byte[] bytes = new byte[totalByteCount];
            int offset = 0;
            for (int i2 = glyphLine.start; i2 < glyphLine.end; i2++) {
                this.usedGlyphs.add(Integer.valueOf(glyphLine.get(i2).getCode()));
                offset = this.cmapEncoding.fillCmapBytes(glyphLine.get(i2).getCode(), bytes, offset);
            }
            return bytes;
        }
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        for (int i3 = glyphLine.start; i3 < glyphLine.end; i3++) {
            Glyph g = glyphLine.get(i3);
            this.usedGlyphs.add(Integer.valueOf(g.getCode()));
            byte[] encodedBit = encoder.encodeUnicodeCodePoint(g.getUnicode());
            try {
                baos.write(encodedBit);
            } catch (IOException e) {
                throw new PdfException(e);
            }
        }
        return baos.toByteArray();
    }

    @Override // com.itextpdf.kernel.font.PdfFont
    public byte[] convertToBytes(Glyph glyph) {
        this.usedGlyphs.add(Integer.valueOf(glyph.getCode()));
        CMapCharsetEncoder encoder = StandardCMapCharsets.getEncoder(this.cmapEncoding.getCmapName());
        if (encoder == null) {
            return this.cmapEncoding.getCmapBytes(glyph.getCode());
        }
        int cp = glyph.getUnicode();
        return encoder.encodeUnicodeCodePoint(cp);
    }

    @Override // com.itextpdf.kernel.font.PdfFont
    public void writeText(GlyphLine text, int from, int to, PdfOutputStream stream) {
        int len = (to - from) + 1;
        if (len > 0) {
            byte[] bytes = convertToBytes(new GlyphLine(text, from, to + 1));
            StreamUtil.writeHexedString(stream, bytes);
        }
    }

    @Override // com.itextpdf.kernel.font.PdfFont
    public void writeText(String text, PdfOutputStream stream) {
        StreamUtil.writeHexedString(stream, convertToBytes(text));
    }

    @Override // com.itextpdf.kernel.font.PdfFont
    public GlyphLine createGlyphLine(String content) {
        int val;
        int ch;
        List<Glyph> glyphs = new ArrayList<>();
        if (this.cidFontType == 0) {
            int len = content.length();
            if (this.cmapEncoding.isDirect()) {
                for (int k = 0; k < len; k++) {
                    Glyph glyph = this.fontProgram.getGlyphByCode(content.charAt(k));
                    if (glyph != null) {
                        glyphs.add(glyph);
                    }
                }
            } else {
                int k2 = 0;
                while (k2 < len) {
                    if (TextUtil.isSurrogatePair(content, k2)) {
                        ch = TextUtil.convertToUtf32(content, k2);
                        k2++;
                    } else {
                        ch = content.charAt(k2);
                    }
                    glyphs.add(getGlyph(ch));
                    k2++;
                }
            }
        } else if (this.cidFontType == 2) {
            int len2 = content.length();
            if (this.fontProgram.isFontSpecific()) {
                byte[] b = PdfEncodings.convertToBytes(content, "symboltt");
                for (byte b2 : b) {
                    Glyph glyph2 = this.fontProgram.getGlyph(b2 & UByte.MAX_VALUE);
                    if (glyph2 != null) {
                        glyphs.add(glyph2);
                    }
                }
            } else {
                int k3 = 0;
                while (k3 < len2) {
                    if (TextUtil.isSurrogatePair(content, k3)) {
                        val = TextUtil.convertToUtf32(content, k3);
                        k3++;
                    } else {
                        val = content.charAt(k3);
                    }
                    glyphs.add(getGlyph(val));
                    k3++;
                }
            }
        } else {
            throw new PdfException("Font has no suitable cmap.");
        }
        return new GlyphLine(glyphs);
    }

    @Override // com.itextpdf.kernel.font.PdfFont
    public int appendGlyphs(String text, int from, int to, List<Glyph> glyphs) {
        if (this.cidFontType == 0) {
            if (this.cmapEncoding.isDirect()) {
                int processed = 0;
                for (int k = from; k <= to; k++) {
                    Glyph glyph = this.fontProgram.getGlyphByCode(text.charAt(k));
                    if (glyph == null || !isAppendableGlyph(glyph)) {
                        break;
                    }
                    glyphs.add(glyph);
                    processed++;
                }
                return processed;
            }
            int processed2 = appendUniGlyphs(text, from, to, glyphs);
            return processed2;
        } else if (this.cidFontType == 2) {
            if (this.fontProgram.isFontSpecific()) {
                int processed3 = 0;
                for (int k2 = from; k2 <= to; k2++) {
                    Glyph glyph2 = this.fontProgram.getGlyph(text.charAt(k2) & 255);
                    if (glyph2 == null || !isAppendableGlyph(glyph2)) {
                        break;
                    }
                    glyphs.add(glyph2);
                    processed3++;
                }
                return processed3;
            }
            int processed4 = appendUniGlyphs(text, from, to, glyphs);
            return processed4;
        } else {
            throw new PdfException("Font has no suitable cmap.");
        }
    }

    private int appendUniGlyphs(String text, int from, int to, List<Glyph> glyphs) {
        int val;
        int processed = 0;
        int k = from;
        while (k <= to) {
            int currentlyProcessed = processed;
            if (TextUtil.isSurrogatePair(text, k)) {
                val = TextUtil.convertToUtf32(text, k);
                processed += 2;
                k++;
            } else {
                val = text.charAt(k);
                processed++;
            }
            Glyph glyph = getGlyph(val);
            if (isAppendableGlyph(glyph)) {
                glyphs.add(glyph);
                k++;
            } else {
                return currentlyProcessed;
            }
        }
        return processed;
    }

    @Override // com.itextpdf.kernel.font.PdfFont
    public int appendAnyGlyph(String text, int from, List<Glyph> glyphs) {
        int ch;
        Glyph glyph;
        int ch2;
        int process = 1;
        if (this.cidFontType == 0) {
            if (this.cmapEncoding.isDirect()) {
                Glyph glyph2 = this.fontProgram.getGlyphByCode(text.charAt(from));
                if (glyph2 != null) {
                    glyphs.add(glyph2);
                }
            } else {
                if (TextUtil.isSurrogatePair(text, from)) {
                    ch2 = TextUtil.convertToUtf32(text, from);
                    process = 2;
                } else {
                    ch2 = text.charAt(from);
                }
                glyphs.add(getGlyph(ch2));
            }
        } else if (this.cidFontType == 2) {
            TrueTypeFont ttf = (TrueTypeFont) this.fontProgram;
            if (ttf.isFontSpecific()) {
                byte[] b = PdfEncodings.convertToBytes(text, "symboltt");
                if (b.length > 0 && (glyph = this.fontProgram.getGlyph(b[0] & UByte.MAX_VALUE)) != null) {
                    glyphs.add(glyph);
                }
            } else {
                if (TextUtil.isSurrogatePair(text, from)) {
                    ch = TextUtil.convertToUtf32(text, from);
                    process = 2;
                } else {
                    ch = text.charAt(from);
                }
                glyphs.add(getGlyph(ch));
            }
        } else {
            throw new PdfException("Font has no suitable cmap.");
        }
        return process;
    }

    private boolean isAppendableGlyph(Glyph glyph) {
        return glyph.getCode() > 0 || TextUtil.isWhitespaceOrNonPrintable(glyph.getUnicode());
    }

    @Override // com.itextpdf.kernel.font.PdfFont
    public String decode(PdfString content) {
        return decodeIntoGlyphLine(content).toString();
    }

    @Override // com.itextpdf.kernel.font.PdfFont
    public GlyphLine decodeIntoGlyphLine(PdfString characterCodes) {
        List<Glyph> glyphs = new ArrayList<>();
        appendDecodedCodesToGlyphsList(glyphs, characterCodes);
        return new GlyphLine(glyphs);
    }

    @Override // com.itextpdf.kernel.font.PdfFont
    public boolean appendDecodedCodesToGlyphsList(List<Glyph> list, PdfString characterCodes) {
        int i;
        boolean allCodesDecoded = true;
        boolean isToUnicodeEmbedded = this.embeddedToUnicode != null;
        CMapEncoding cmap = getCmap();
        FontProgram fontProgram = getFontProgram();
        List<byte[]> codeSpaceRanges = isToUnicodeEmbedded ? this.embeddedToUnicode.getCodeSpaceRanges() : cmap.getCodeSpaceRanges();
        String charCodesSequence = characterCodes.getValue();
        int i2 = 0;
        while (i2 < charCodesSequence.length()) {
            int code = 0;
            Glyph glyph = null;
            int codeSpaceMatchedLength = 1;
            int codeLength = 1;
            while (true) {
                if (codeLength > 4 || i2 + codeLength > charCodesSequence.length()) {
                    break;
                }
                code = (code << 8) + charCodesSequence.charAt((i2 + codeLength) - 1);
                if (containsCodeInCodeSpaceRange(codeSpaceRanges, code, codeLength)) {
                    codeSpaceMatchedLength = codeLength;
                    int glyphCode = isToUnicodeEmbedded ? code : cmap.getCidCode(code);
                    glyph = fontProgram.getGlyphByCode(glyphCode);
                    if (glyph != null) {
                        i2 += codeLength - 1;
                        break;
                    }
                }
                codeLength++;
            }
            if (glyph == null) {
                Logger logger = LoggerFactory.getLogger(PdfType0Font.class);
                if (logger.isWarnEnabled()) {
                    StringBuilder failedCodes = new StringBuilder();
                    int codeLength2 = 1;
                    for (i = 4; codeLength2 <= i && i2 + codeLength2 <= charCodesSequence.length(); i = 4) {
                        failedCodes.append((int) charCodesSequence.charAt((i2 + codeLength2) - 1)).append(" ");
                        codeLength2++;
                    }
                    logger.warn(MessageFormatUtil.format(IoLogMessageConstant.COULD_NOT_FIND_GLYPH_WITH_CODE, failedCodes.toString()));
                }
                i2 += codeSpaceMatchedLength - 1;
            }
            if (glyph == null || glyph.getChars() == null) {
                list.add(new Glyph(0, fontProgram.getGlyphByCode(0).getWidth(), -1));
                allCodesDecoded = false;
            } else {
                list.add(glyph);
            }
            i2++;
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

    @Override // com.itextpdf.kernel.font.PdfFont
    public boolean isBuiltWith(String fontProgram, String encoding) {
        return getFontProgram().isBuiltWith(fontProgram) && this.cmapEncoding.isBuiltWith(normalizeEncoding(encoding));
    }

    @Override // com.itextpdf.kernel.font.PdfFont, com.itextpdf.kernel.pdf.PdfObjectWrapper
    public void flush() {
        if (isFlushed()) {
            return;
        }
        ensureUnderlyingObjectHasIndirectReference();
        if (this.newFont) {
            flushFontData();
        }
        super.flush();
    }

    public CMapEncoding getCmap() {
        return this.cmapEncoding;
    }

    @Override // com.itextpdf.kernel.font.PdfFont
    protected PdfDictionary getFontDescriptor(String fontName) {
        PdfDictionary fontDescriptor = new PdfDictionary();
        makeObjectIndirect(fontDescriptor);
        fontDescriptor.put(PdfName.Type, PdfName.FontDescriptor);
        fontDescriptor.put(PdfName.FontName, new PdfName(fontName));
        fontDescriptor.put(PdfName.FontBBox, new PdfArray(getFontProgram().getFontMetrics().getBbox()));
        fontDescriptor.put(PdfName.Ascent, new PdfNumber(getFontProgram().getFontMetrics().getTypoAscender()));
        fontDescriptor.put(PdfName.Descent, new PdfNumber(getFontProgram().getFontMetrics().getTypoDescender()));
        fontDescriptor.put(PdfName.CapHeight, new PdfNumber(getFontProgram().getFontMetrics().getCapHeight()));
        fontDescriptor.put(PdfName.ItalicAngle, new PdfNumber(getFontProgram().getFontMetrics().getItalicAngle()));
        fontDescriptor.put(PdfName.StemV, new PdfNumber(getFontProgram().getFontMetrics().getStemV()));
        fontDescriptor.put(PdfName.Flags, new PdfNumber(getFontProgram().getPdfFontFlags()));
        if (this.fontProgram.getFontIdentification().getPanose() != null) {
            PdfDictionary styleDictionary = new PdfDictionary();
            styleDictionary.put(PdfName.Panose, new PdfString(this.fontProgram.getFontIdentification().getPanose()).setHexWriting(true));
            fontDescriptor.put(PdfName.Style, styleDictionary);
        }
        return fontDescriptor;
    }

    private void convertToBytes(Glyph glyph, ByteBuffer result) {
        int code = glyph.getCode();
        this.usedGlyphs.add(Integer.valueOf(code));
        this.cmapEncoding.fillCmapBytes(code, result);
    }

    private static String getOrdering(PdfDictionary cidFont) {
        PdfDictionary cidinfo = cidFont.getAsDictionary(PdfName.CIDSystemInfo);
        if (cidinfo != null && cidinfo.containsKey(PdfName.Ordering)) {
            return cidinfo.get(PdfName.Ordering).toString();
        }
        return null;
    }

    private static boolean containsCodeInCodeSpaceRange(List<byte[]> codeSpaceRanges, int code, int length) {
        long unsignedCode = code & (-1);
        for (int i = 0; i < codeSpaceRanges.size(); i += 2) {
            if (length == codeSpaceRanges.get(i).length) {
                byte[] low = codeSpaceRanges.get(i);
                byte[] high = codeSpaceRanges.get(i + 1);
                long lowValue = bytesToLong(low);
                long highValue = bytesToLong(high);
                if (unsignedCode >= lowValue && unsignedCode <= highValue) {
                    return true;
                }
            }
        }
        return false;
    }

    private static long bytesToLong(byte[] bytes) {
        long res = 0;
        int shift = 0;
        for (int i = bytes.length - 1; i >= 0; i--) {
            res += (bytes[i] & UByte.MAX_VALUE) << shift;
            shift += 8;
        }
        return res;
    }

    private void flushFontData() {
        PdfStream fontStream;
        byte[] bytes;
        if (this.cidFontType == 0) {
            ((PdfDictionary) getPdfObject()).put(PdfName.Type, PdfName.Font);
            ((PdfDictionary) getPdfObject()).put(PdfName.Subtype, PdfName.Type0);
            String name = this.fontProgram.getFontNames().getFontName();
            String style = this.fontProgram.getFontNames().getStyle();
            if (style.length() > 0) {
                name = name + "-" + style;
            }
            ((PdfDictionary) getPdfObject()).put(PdfName.BaseFont, new PdfName(MessageFormatUtil.format("{0}-{1}", name, this.cmapEncoding.getCmapName())));
            ((PdfDictionary) getPdfObject()).put(PdfName.Encoding, new PdfName(this.cmapEncoding.getCmapName()));
            PdfDictionary fontDescriptor = getFontDescriptor(name);
            PdfDictionary cidFont = getCidFont(fontDescriptor, this.fontProgram.getFontNames().getFontName(), false);
            ((PdfDictionary) getPdfObject()).put(PdfName.DescendantFonts, new PdfArray(cidFont));
            fontDescriptor.flush();
            cidFont.flush();
        } else if (this.cidFontType == 2) {
            TrueTypeFont ttf = (TrueTypeFont) getFontProgram();
            String fontName = updateSubsetPrefix(ttf.getFontNames().getFontName(), this.subset, this.embedded);
            PdfDictionary fontDescriptor2 = getFontDescriptor(fontName);
            ttf.updateUsedGlyphs((SortedSet) this.usedGlyphs, this.subset, this.subsetRanges);
            if (ttf.isCff()) {
                if (this.subset) {
                    byte[] bytes2 = ttf.getFontStreamBytes();
                    Set<Integer> usedGids = ttf.mapGlyphsCidsToGids(this.usedGlyphs);
                    bytes = new CFFFontSubset(bytes2, usedGids).Process();
                } else {
                    bytes = ttf.getFontStreamBytes();
                }
                fontStream = getPdfFontStream(bytes, new int[]{bytes.length});
                fontStream.put(PdfName.Subtype, new PdfName("CIDFontType0C"));
                ((PdfDictionary) getPdfObject()).put(PdfName.BaseFont, new PdfName(MessageFormatUtil.format("{0}-{1}", fontName, this.cmapEncoding.getCmapName())));
                fontDescriptor2.put(PdfName.FontFile3, fontStream);
            } else {
                byte[] ttfBytes = null;
                if (this.subset || ttf.getDirectoryOffset() > 0) {
                    try {
                        ttfBytes = ttf.getSubset(this.usedGlyphs, this.subset);
                    } catch (com.itextpdf.io.exceptions.IOException e) {
                        Logger logger = LoggerFactory.getLogger(PdfType0Font.class);
                        logger.warn(IoLogMessageConstant.FONT_SUBSET_ISSUE);
                        ttfBytes = null;
                    }
                }
                if (ttfBytes == null) {
                    ttfBytes = ttf.getFontStreamBytes();
                }
                fontStream = getPdfFontStream(ttfBytes, new int[]{ttfBytes.length});
                ((PdfDictionary) getPdfObject()).put(PdfName.BaseFont, new PdfName(fontName));
                fontDescriptor2.put(PdfName.FontFile2, fontStream);
            }
            int numOfGlyphs = ttf.getFontMetrics().getNumberOfGlyphs();
            byte[] cidSetBytes = new byte[(ttf.getFontMetrics().getNumberOfGlyphs() / 8) + 1];
            for (int i = 0; i < numOfGlyphs / 8; i++) {
                cidSetBytes[i] = (byte) (cidSetBytes[i] | UByte.MAX_VALUE);
            }
            for (int i2 = 0; i2 < numOfGlyphs % 8; i2++) {
                int length = cidSetBytes.length - 1;
                cidSetBytes[length] = (byte) (cidSetBytes[length] | rotbits[i2]);
            }
            fontDescriptor2.put(PdfName.CIDSet, new PdfStream(cidSetBytes));
            PdfDictionary cidFont2 = getCidFont(fontDescriptor2, fontName, !ttf.isCff());
            ((PdfDictionary) getPdfObject()).put(PdfName.Type, PdfName.Font);
            ((PdfDictionary) getPdfObject()).put(PdfName.Subtype, PdfName.Type0);
            ((PdfDictionary) getPdfObject()).put(PdfName.Encoding, new PdfName(this.cmapEncoding.getCmapName()));
            ((PdfDictionary) getPdfObject()).put(PdfName.DescendantFonts, new PdfArray(cidFont2));
            PdfStream toUnicode = getToUnicode();
            if (toUnicode != null) {
                ((PdfDictionary) getPdfObject()).put(PdfName.ToUnicode, toUnicode);
                if (toUnicode.getIndirectReference() != null) {
                    toUnicode.flush();
                }
            }
            if (((PdfDictionary) getPdfObject()).getIndirectReference().getDocument().getPdfVersion().compareTo(PdfVersion.PDF_2_0) >= 0) {
                fontDescriptor2.remove(PdfName.CIDSet);
            }
            fontDescriptor2.flush();
            cidFont2.flush();
            fontStream.flush();
        } else {
            throw new IllegalStateException("Unsupported CID Font");
        }
    }

    protected PdfDictionary getCidFont(PdfDictionary fontDescriptor, String fontName, boolean isType2) {
        PdfDictionary cidFont = new PdfDictionary();
        markObjectAsIndirect(cidFont);
        cidFont.put(PdfName.Type, PdfName.Font);
        cidFont.put(PdfName.FontDescriptor, fontDescriptor);
        if (isType2) {
            cidFont.put(PdfName.Subtype, PdfName.CIDFontType2);
            cidFont.put(PdfName.CIDToGIDMap, PdfName.Identity);
        } else {
            cidFont.put(PdfName.Subtype, PdfName.CIDFontType0);
        }
        cidFont.put(PdfName.BaseFont, new PdfName(fontName));
        PdfDictionary cidInfo = new PdfDictionary();
        cidInfo.put(PdfName.Registry, new PdfString(this.cmapEncoding.getRegistry()));
        cidInfo.put(PdfName.Ordering, new PdfString(this.cmapEncoding.getOrdering()));
        cidInfo.put(PdfName.Supplement, new PdfNumber(this.cmapEncoding.getSupplement()));
        cidFont.put(PdfName.CIDSystemInfo, cidInfo);
        if (!this.vertical) {
            cidFont.put(PdfName.DW, new PdfNumber(1000));
            PdfObject widthsArray = generateWidthsArray();
            if (widthsArray != null) {
                cidFont.put(PdfName.W, widthsArray);
            }
        } else {
            Logger logger = LoggerFactory.getLogger(PdfType0Font.class);
            logger.warn("Vertical writing has not been implemented yet.");
        }
        return cidFont;
    }

    private PdfObject generateWidthsArray() {
        com.itextpdf.io.source.ByteArrayOutputStream bytes = new com.itextpdf.io.source.ByteArrayOutputStream();
        OutputStream<com.itextpdf.io.source.ByteArrayOutputStream> stream = new OutputStream<>(bytes);
        stream.writeByte(91);
        int lastNumber = -10;
        boolean firstTime = true;
        for (Integer num : this.usedGlyphs) {
            int code = num.intValue();
            Glyph glyph = this.fontProgram.getGlyphByCode(code);
            if (glyph.getWidth() != 1000) {
                if (glyph.getCode() == lastNumber + 1) {
                    stream.writeByte(32);
                } else {
                    if (!firstTime) {
                        stream.writeByte(93);
                    }
                    firstTime = false;
                    stream.writeInteger(glyph.getCode());
                    stream.writeByte(91);
                }
                stream.writeInteger(glyph.getWidth());
                lastNumber = glyph.getCode();
            }
        }
        if (stream.getCurrentPos() > 1) {
            stream.writeString("]]");
            return new PdfLiteral(bytes.toByteArray());
        }
        return null;
    }

    public PdfStream getToUnicode() {
        OutputStream<com.itextpdf.io.source.ByteArrayOutputStream> stream = new OutputStream<>(new com.itextpdf.io.source.ByteArrayOutputStream());
        stream.writeString("/CIDInit /ProcSet findresource begin\n12 dict begin\nbegincmap\n/CIDSystemInfo\n<< /Registry (Adobe)\n/Ordering (UCS)\n/Supplement 0\n>> def\n/CMapName /Adobe-Identity-UCS def\n/CMapType 2 def\n1 begincodespacerange\n<0000><FFFF>\nendcodespacerange\n");
        ArrayList<Glyph> glyphGroup = new ArrayList<>(100);
        int bfranges = 0;
        for (Integer glyphId : this.usedGlyphs) {
            Glyph glyph = this.fontProgram.getGlyphByCode(glyphId.intValue());
            if (glyph.getChars() != null) {
                glyphGroup.add(glyph);
                if (glyphGroup.size() == 100) {
                    bfranges += writeBfrange(stream, glyphGroup);
                }
            }
        }
        if (bfranges + writeBfrange(stream, glyphGroup) == 0) {
            return null;
        }
        stream.writeString("endcmap\nCMapName currentdict /CMap defineresource pop\nend end\n");
        return new PdfStream(((com.itextpdf.io.source.ByteArrayOutputStream) stream.getOutputStream()).toByteArray());
    }

    private int writeBfrange(OutputStream<com.itextpdf.io.source.ByteArrayOutputStream> stream, List<Glyph> range) {
        char[] chars;
        if (range.isEmpty()) {
            return 0;
        }
        stream.writeInteger(range.size());
        stream.writeString(" beginbfrange\n");
        for (Glyph glyph : range) {
            String fromTo = CMapContentParser.toHex(glyph.getCode());
            stream.writeString(fromTo);
            stream.writeString(fromTo);
            stream.writeByte(60);
            for (char ch : glyph.getChars()) {
                stream.writeString(toHex4(ch));
            }
            stream.writeByte(62);
            stream.writeByte(10);
        }
        stream.writeString("endbfrange\n");
        range.clear();
        return 1;
    }

    private static String toHex4(char ch) {
        String s = "0000" + Integer.toHexString(ch);
        return s.substring(s.length() - 4);
    }

    private String getCompatibleUniMap(String registry) {
        String uniMap = "";
        for (String name : CidFontProperties.getRegistryNames().get(registry + "_Uni")) {
            uniMap = name;
            if ((name.endsWith(ExifInterface.GPS_MEASUREMENT_INTERRUPTED) && this.vertical) || (!name.endsWith(ExifInterface.GPS_MEASUREMENT_INTERRUPTED) && !this.vertical)) {
                break;
            }
        }
        return uniMap;
    }

    private static CMapEncoding createCMap(PdfObject cmap, String uniMap) {
        if (cmap.isStream()) {
            PdfStream cmapStream = (PdfStream) cmap;
            byte[] cmapBytes = cmapStream.getBytes();
            return new CMapEncoding(cmapStream.getAsName(PdfName.CMapName).getValue(), cmapBytes);
        }
        String cmapName = ((PdfName) cmap).getValue();
        if (PdfEncodings.IDENTITY_H.equals(cmapName) || PdfEncodings.IDENTITY_V.equals(cmapName)) {
            return new CMapEncoding(cmapName);
        }
        return new CMapEncoding(cmapName, uniMap);
    }

    private static String normalizeEncoding(String encoding) {
        return (encoding == null || "".equals(encoding)) ? PdfEncodings.IDENTITY_H : encoding;
    }
}
