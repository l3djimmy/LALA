package com.itextpdf.io.font;

import androidx.recyclerview.widget.ItemTouchHelper;
import com.itextpdf.io.font.constants.FontWeights;
import com.itextpdf.io.font.constants.StandardFonts;
import com.itextpdf.io.font.otf.Glyph;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.io.source.RandomAccessFileOrArray;
import com.itextpdf.layout.properties.Property;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.StringTokenizer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class Type1Font extends FontProgram {
    private static final int[] PFB_TYPES = {1, 2, 1};
    private String characterSet;
    private Type1Parser fontParser;
    private byte[] fontStreamBytes;
    private int[] fontStreamLengths;
    private Map<Long, Integer> kernPairs;

    protected static Type1Font createStandardFont(String name) throws IOException {
        if (StandardFonts.isStandardFont(name)) {
            return new Type1Font(name, null, null, null);
        }
        throw new com.itextpdf.io.exceptions.IOException("{0} is not a standard type1 font.").setMessageParams(name);
    }

    protected Type1Font() {
        this.kernPairs = new HashMap();
        this.fontNames = new FontNames();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Type1Font(String metricsPath, String binaryPath, byte[] afm, byte[] pfb) throws IOException {
        this();
        this.fontParser = new Type1Parser(metricsPath, binaryPath, afm, pfb);
        process();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Type1Font(String baseFont) {
        this();
        getFontNames().setFontName(baseFont);
    }

    public void initializeGlyphs(FontEncoding fontEncoding) {
        for (int i = 0; i < 256; i++) {
            int unicode = fontEncoding.getUnicode(i);
            Glyph fontGlyph = this.unicodeToGlyph.get(Integer.valueOf(unicode));
            if (fontGlyph != null) {
                Glyph glyph = new Glyph(i, fontGlyph.getWidth(), unicode, fontGlyph.getChars(), false);
                this.codeToGlyph.put(Integer.valueOf(i), glyph);
                this.unicodeToGlyph.put(Integer.valueOf(glyph.getUnicode()), glyph);
            }
        }
    }

    public boolean isBuiltInFont() {
        return this.fontParser != null && this.fontParser.isBuiltInFont();
    }

    @Override // com.itextpdf.io.font.FontProgram
    public int getPdfFontFlags() {
        int flags = 0;
        if (this.fontMetrics.isFixedPitch()) {
            flags = 0 | 1;
        }
        int flags2 = flags | (isFontSpecific() ? 4 : 32);
        if (this.fontMetrics.getItalicAngle() < 0.0f) {
            flags2 |= 64;
        }
        if (this.fontNames.getFontName().contains("Caps") || this.fontNames.getFontName().endsWith("SC")) {
            flags2 |= 131072;
        }
        if (this.fontNames.isBold() || this.fontNames.getFontWeight() > 500) {
            return flags2 | 262144;
        }
        return flags2;
    }

    public String getCharacterSet() {
        return this.characterSet;
    }

    @Override // com.itextpdf.io.font.FontProgram
    public boolean hasKernPairs() {
        return this.kernPairs.size() > 0;
    }

    @Override // com.itextpdf.io.font.FontProgram
    public int getKerning(Glyph first, Glyph second) {
        if (first.hasValidUnicode() && second.hasValidUnicode()) {
            long record = (first.getUnicode() << 32) + second.getUnicode();
            if (this.kernPairs.containsKey(Long.valueOf(record))) {
                return this.kernPairs.get(Long.valueOf(record)).intValue();
            }
            return 0;
        }
        return 0;
    }

    public boolean setKerning(int first, int second, int kern) {
        long record = (first << 32) + second;
        this.kernPairs.put(Long.valueOf(record), Integer.valueOf(kern));
        return true;
    }

    public Glyph getGlyph(String name) {
        int unicode = AdobeGlyphList.nameToUnicode(name);
        if (unicode != -1) {
            return getGlyph(unicode);
        }
        return null;
    }

    public byte[] getFontStreamBytes() {
        if (this.fontParser.isBuiltInFont()) {
            return null;
        }
        if (this.fontStreamBytes != null) {
            return this.fontStreamBytes;
        }
        RandomAccessFileOrArray raf = null;
        try {
            try {
                RandomAccessFileOrArray raf2 = this.fontParser.getPostscriptBinary();
                int fileLength = (int) raf2.length();
                this.fontStreamBytes = new byte[fileLength - 18];
                this.fontStreamLengths = new int[3];
                int bytePtr = 0;
                for (int k = 0; k < 3; k++) {
                    if (raf2.read() != 128) {
                        Logger logger = LoggerFactory.getLogger(Type1Font.class);
                        logger.error(IoLogMessageConstant.START_MARKER_MISSING_IN_PFB_FILE);
                        if (raf2 != null) {
                            try {
                                raf2.close();
                            } catch (Exception e) {
                            }
                        }
                        return null;
                    } else if (raf2.read() != PFB_TYPES[k]) {
                        Logger logger2 = LoggerFactory.getLogger(Type1Font.class);
                        logger2.error("incorrect.segment.type.in.pfb.file");
                        if (raf2 != null) {
                            try {
                                raf2.close();
                            } catch (Exception e2) {
                            }
                        }
                        return null;
                    } else {
                        int size = raf2.read() + (raf2.read() << 8) + (raf2.read() << 16) + (raf2.read() << 24);
                        this.fontStreamLengths[k] = size;
                        while (size != 0) {
                            int got = raf2.read(this.fontStreamBytes, bytePtr, size);
                            if (got < 0) {
                                Logger logger3 = LoggerFactory.getLogger(Type1Font.class);
                                logger3.error("premature.end.in.pfb.file");
                                if (raf2 != null) {
                                    try {
                                        raf2.close();
                                    } catch (Exception e3) {
                                    }
                                }
                                return null;
                            }
                            bytePtr += got;
                            size -= got;
                        }
                    }
                }
                byte[] bArr = this.fontStreamBytes;
                if (raf2 != null) {
                    try {
                        raf2.close();
                    } catch (Exception e4) {
                    }
                }
                return bArr;
            } catch (Exception e5) {
                Logger logger4 = LoggerFactory.getLogger(Type1Font.class);
                logger4.error("type1.font.file.exception");
                if (0 != 0) {
                    try {
                        raf.close();
                    } catch (Exception e6) {
                    }
                }
                return null;
            }
        } catch (Throwable th) {
            if (0 != 0) {
                try {
                    raf.close();
                } catch (Exception e7) {
                }
            }
            throw th;
        }
    }

    public int[] getFontStreamLengths() {
        return this.fontStreamLengths;
    }

    @Override // com.itextpdf.io.font.FontProgram
    public boolean isBuiltWith(String fontProgram) {
        return Objects.equals(this.fontParser.getAfmPath(), fontProgram);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    protected void process() throws IOException {
        char c;
        char c2;
        Glyph space;
        char c3;
        String line;
        char c4;
        RandomAccessFileOrArray raf = this.fontParser.getMetricsFile();
        boolean startKernPairs = false;
        while (true) {
            c = 0;
            c2 = 1;
            if (!startKernPairs && (line = raf.readLine()) != null) {
                StringTokenizer tok = new StringTokenizer(line, " ,\n\r\t\f");
                if (tok.hasMoreTokens()) {
                    String ident = tok.nextToken();
                    switch (ident.hashCode()) {
                        case -2037328797:
                            if (ident.equals("ItalicAngle")) {
                                c4 = 4;
                                break;
                            }
                            c4 = 65535;
                            break;
                        case -1707725160:
                            if (ident.equals("Weight")) {
                                c4 = 3;
                                break;
                            }
                            c4 = 65535;
                            break;
                        case -1587834632:
                            if (ident.equals("EncodingScheme")) {
                                c4 = '\n';
                                break;
                            }
                            c4 = 65535;
                            break;
                        case -1502948305:
                            if (ident.equals("FamilyName")) {
                                c4 = 2;
                                break;
                            }
                            c4 = 65535;
                            break;
                        case -1346249825:
                            if (ident.equals("XHeight")) {
                                c4 = '\f';
                                break;
                            }
                            c4 = 65535;
                            break;
                        case -1278893927:
                            if (ident.equals("CharacterSet")) {
                                c4 = 6;
                                break;
                            }
                            c4 = 65535;
                            break;
                        case -812484743:
                            if (ident.equals("CapHeight")) {
                                c4 = 11;
                                break;
                            }
                            c4 = 65535;
                            break;
                        case -802988361:
                            if (ident.equals("Descender")) {
                                c4 = 14;
                                break;
                            }
                            c4 = 65535;
                            break;
                        case -766799081:
                            if (ident.equals("Ascender")) {
                                c4 = '\r';
                                break;
                            }
                            c4 = 65535;
                            break;
                        case -265632490:
                            if (ident.equals("IsFixedPitch")) {
                                c4 = 5;
                                break;
                            }
                            c4 = 65535;
                            break;
                        case 80206418:
                            if (ident.equals("StdHW")) {
                                c4 = 15;
                                break;
                            }
                            c4 = 65535;
                            break;
                        case 80206852:
                            if (ident.equals("StdVW")) {
                                c4 = 16;
                                break;
                            }
                            c4 = 65535;
                            break;
                        case 425555957:
                            if (ident.equals("UnderlinePosition")) {
                                c4 = '\b';
                                break;
                            }
                            c4 = 65535;
                            break;
                        case 429700888:
                            if (ident.equals("FontBBox")) {
                                c4 = 7;
                                break;
                            }
                            c4 = 65535;
                            break;
                        case 430088090:
                            if (ident.equals("FontName")) {
                                c4 = 0;
                                break;
                            }
                            c4 = 65535;
                            break;
                        case 1395496410:
                            if (ident.equals("FullName")) {
                                c4 = 1;
                                break;
                            }
                            c4 = 65535;
                            break;
                        case 1672376043:
                            if (ident.equals("StartCharMetrics")) {
                                c4 = 17;
                                break;
                            }
                            c4 = 65535;
                            break;
                        case 1887629864:
                            if (ident.equals("UnderlineThickness")) {
                                c4 = '\t';
                                break;
                            }
                            c4 = 65535;
                            break;
                        default:
                            c4 = 65535;
                            break;
                    }
                    switch (c4) {
                        case 0:
                            this.fontNames.setFontName(tok.nextToken("ÿ").substring(1));
                            continue;
                        case 1:
                            String familyName = tok.nextToken("ÿ");
                            String fullName = familyName.substring(1);
                            this.fontNames.setFullName(new String[][]{new String[]{"", "", "", fullName}});
                            continue;
                        case 2:
                            String familyName2 = tok.nextToken("ÿ").substring(1);
                            this.fontNames.setFamilyName(new String[][]{new String[]{"", "", "", familyName2}});
                            continue;
                        case 3:
                            this.fontNames.setFontWeight(FontWeights.fromType1FontWeight(tok.nextToken("ÿ").substring(1)));
                            continue;
                        case 4:
                            this.fontMetrics.setItalicAngle(Float.parseFloat(tok.nextToken()));
                            continue;
                        case 5:
                            this.fontMetrics.setIsFixedPitch(tok.nextToken().equals("true"));
                            continue;
                        case 6:
                            this.characterSet = tok.nextToken("ÿ").substring(1);
                            continue;
                        case 7:
                            int llx = (int) Float.parseFloat(tok.nextToken());
                            int lly = (int) Float.parseFloat(tok.nextToken());
                            int urx = (int) Float.parseFloat(tok.nextToken());
                            int ury = (int) Float.parseFloat(tok.nextToken());
                            this.fontMetrics.setBbox(llx, lly, urx, ury);
                            continue;
                        case '\b':
                            this.fontMetrics.setUnderlinePosition((int) Float.parseFloat(tok.nextToken()));
                            continue;
                        case '\t':
                            this.fontMetrics.setUnderlineThickness((int) Float.parseFloat(tok.nextToken()));
                            continue;
                        case '\n':
                            this.encodingScheme = tok.nextToken("ÿ").substring(1).trim();
                            continue;
                        case 11:
                            this.fontMetrics.setCapHeight((int) Float.parseFloat(tok.nextToken()));
                            continue;
                        case '\f':
                            this.fontMetrics.setXHeight((int) Float.parseFloat(tok.nextToken()));
                            continue;
                        case '\r':
                            this.fontMetrics.setTypoAscender((int) Float.parseFloat(tok.nextToken()));
                            continue;
                        case 14:
                            this.fontMetrics.setTypoDescender((int) Float.parseFloat(tok.nextToken()));
                            continue;
                        case 15:
                            this.fontMetrics.setStemH((int) Float.parseFloat(tok.nextToken()));
                            continue;
                        case 16:
                            this.fontMetrics.setStemV((int) Float.parseFloat(tok.nextToken()));
                            continue;
                        case 17:
                            startKernPairs = true;
                            continue;
                    }
                }
            }
        }
        if (!startKernPairs) {
            String metricsPath = this.fontParser.getAfmPath();
            if (metricsPath != null) {
                throw new com.itextpdf.io.exceptions.IOException("startcharmetrics is missing in {0}.").setMessageParams(metricsPath);
            }
            throw new com.itextpdf.io.exceptions.IOException("startcharmetrics is missing in the metrics file.");
        }
        this.avgWidth = 0;
        int widthCount = 0;
        while (true) {
            String line2 = raf.readLine();
            if (line2 != null) {
                StringTokenizer tok2 = new StringTokenizer(line2);
                if (tok2.hasMoreTokens()) {
                    if (tok2.nextToken().equals("EndCharMetrics")) {
                        startKernPairs = false;
                    } else {
                        int C = -1;
                        int WX = ItemTouchHelper.Callback.DEFAULT_SWIPE_ANIMATION_DURATION;
                        String N = "";
                        int[] B = null;
                        StringTokenizer tok3 = new StringTokenizer(line2, ";");
                        while (tok3.hasMoreTokens()) {
                            StringTokenizer tokc = new StringTokenizer(tok3.nextToken());
                            if (tokc.hasMoreTokens()) {
                                String ident2 = tokc.nextToken();
                                switch (ident2.hashCode()) {
                                    case 66:
                                        if (ident2.equals("B")) {
                                            c3 = 3;
                                            break;
                                        }
                                        c3 = 65535;
                                        break;
                                    case 67:
                                        if (ident2.equals("C")) {
                                            c3 = c;
                                            break;
                                        }
                                        c3 = 65535;
                                        break;
                                    case Property.WORD_SPACING /* 78 */:
                                        if (ident2.equals("N")) {
                                            c3 = 2;
                                            break;
                                        }
                                        c3 = 65535;
                                        break;
                                    case 2785:
                                        if (ident2.equals("WX")) {
                                            c3 = c2;
                                            break;
                                        }
                                        c3 = 65535;
                                        break;
                                    default:
                                        c3 = 65535;
                                        break;
                                }
                                switch (c3) {
                                    case 0:
                                        int C2 = Integer.parseInt(tokc.nextToken());
                                        C = C2;
                                        break;
                                    case 1:
                                        String N2 = tokc.nextToken();
                                        int WX2 = (int) Float.parseFloat(N2);
                                        WX = WX2;
                                        break;
                                    case 2:
                                        String N3 = tokc.nextToken();
                                        N = N3;
                                        break;
                                    case 3:
                                        B = new int[]{Integer.parseInt(tokc.nextToken()), Integer.parseInt(tokc.nextToken()), Integer.parseInt(tokc.nextToken()), Integer.parseInt(tokc.nextToken())};
                                        break;
                                }
                                c = 0;
                                c2 = 1;
                            }
                        }
                        int unicode = AdobeGlyphList.nameToUnicode(N);
                        Glyph glyph = new Glyph(C, WX, unicode, B);
                        if (C >= 0) {
                            this.codeToGlyph.put(Integer.valueOf(C), glyph);
                        }
                        if (unicode != -1) {
                            this.unicodeToGlyph.put(Integer.valueOf(unicode), glyph);
                        }
                        this.avgWidth += WX;
                        widthCount++;
                        c = 0;
                        c2 = 1;
                    }
                }
            }
        }
        if (widthCount != 0) {
            this.avgWidth /= widthCount;
        }
        if (startKernPairs) {
            String metricsPath2 = this.fontParser.getAfmPath();
            if (metricsPath2 != null) {
                throw new com.itextpdf.io.exceptions.IOException("endcharmetrics is missing in {0}.").setMessageParams(metricsPath2);
            }
            throw new com.itextpdf.io.exceptions.IOException("endcharmetrics is missing in the metrics file.");
        }
        char c5 = ' ';
        if (!this.unicodeToGlyph.containsKey(160) && (space = this.unicodeToGlyph.get(32)) != null) {
            this.unicodeToGlyph.put(160, new Glyph(space.getCode(), space.getWidth(), 160, space.getBbox()));
        }
        boolean endOfMetrics = false;
        while (true) {
            String line3 = raf.readLine();
            if (line3 != null) {
                StringTokenizer tok4 = new StringTokenizer(line3);
                if (tok4.hasMoreTokens()) {
                    String ident3 = tok4.nextToken();
                    if (ident3.equals("EndFontMetrics")) {
                        endOfMetrics = true;
                    } else if (ident3.equals("StartKernPairs")) {
                        startKernPairs = true;
                    }
                }
            }
        }
        if (startKernPairs) {
            while (true) {
                String line4 = raf.readLine();
                if (line4 != null) {
                    StringTokenizer tok5 = new StringTokenizer(line4);
                    if (tok5.hasMoreTokens()) {
                        String ident4 = tok5.nextToken();
                        if (ident4.equals("KPX")) {
                            String first = tok5.nextToken();
                            String second = tok5.nextToken();
                            Integer width = Integer.valueOf((int) Float.parseFloat(tok5.nextToken()));
                            int firstUni = AdobeGlyphList.nameToUnicode(first);
                            int secondUni = AdobeGlyphList.nameToUnicode(second);
                            if (firstUni != -1 && secondUni != -1) {
                                long record = (firstUni << c5) + secondUni;
                                this.kernPairs.put(Long.valueOf(record), width);
                            }
                        } else if (ident4.equals("EndKernPairs")) {
                            startKernPairs = false;
                        }
                    }
                    c5 = ' ';
                }
            }
        } else if (!endOfMetrics) {
            String metricsPath3 = this.fontParser.getAfmPath();
            if (metricsPath3 != null) {
                throw new com.itextpdf.io.exceptions.IOException("endfontmetrics is missing in {0}.").setMessageParams(metricsPath3);
            }
            throw new com.itextpdf.io.exceptions.IOException("endfontmetrics is missing in the metrics file.");
        }
        if (startKernPairs) {
            String metricsPath4 = this.fontParser.getAfmPath();
            if (metricsPath4 != null) {
                throw new com.itextpdf.io.exceptions.IOException("endkernpairs is missing in {0}.").setMessageParams(metricsPath4);
            }
            throw new com.itextpdf.io.exceptions.IOException("endkernpairs is missing in the metrics file.");
        }
        raf.close();
        this.isFontSpecific = (this.encodingScheme.equals("AdobeStandardEncoding") || this.encodingScheme.equals("StandardEncoding")) ? false : true;
    }
}
