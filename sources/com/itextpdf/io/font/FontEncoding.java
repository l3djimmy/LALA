package com.itextpdf.io.font;

import com.itextpdf.io.util.ArrayUtil;
import com.itextpdf.io.util.IntHashtable;
import com.itextpdf.io.util.TextUtil;
import java.util.Objects;
import java.util.StringTokenizer;
/* loaded from: classes12.dex */
public class FontEncoding {
    public static final String FONT_SPECIFIC = "FontSpecific";
    public static final String NOTDEF = ".notdef";
    private static final byte[] emptyBytes = new byte[0];
    protected String baseEncoding;
    protected String[] differences;
    protected IntHashtable unicodeToCode = new IntHashtable(256);
    protected int[] codeToUnicode = ArrayUtil.fillWithValue(new int[256], -1);
    protected IntHashtable unicodeDifferences = new IntHashtable(256);
    protected boolean fontSpecific = false;

    public static FontEncoding createFontEncoding(String baseEncoding) {
        FontEncoding encoding = new FontEncoding();
        encoding.baseEncoding = normalizeEncoding(baseEncoding);
        if (encoding.baseEncoding.startsWith("#")) {
            encoding.fillCustomEncoding();
        } else {
            encoding.fillNamedEncoding();
        }
        return encoding;
    }

    public static FontEncoding createEmptyFontEncoding() {
        FontEncoding encoding = new FontEncoding();
        encoding.baseEncoding = null;
        encoding.fontSpecific = false;
        encoding.differences = new String[256];
        for (int ch = 0; ch < 256; ch++) {
            encoding.unicodeDifferences.put(ch, ch);
        }
        return encoding;
    }

    public static FontEncoding createFontSpecificEncoding() {
        FontEncoding encoding = new FontEncoding();
        encoding.fontSpecific = true;
        fillFontEncoding(encoding);
        return encoding;
    }

    public static void fillFontEncoding(FontEncoding encoding) {
        for (int ch = 0; ch < 256; ch++) {
            encoding.unicodeToCode.put(ch, ch);
            encoding.codeToUnicode[ch] = ch;
            encoding.unicodeDifferences.put(ch, ch);
        }
    }

    public String getBaseEncoding() {
        return this.baseEncoding;
    }

    public boolean isFontSpecific() {
        return this.fontSpecific;
    }

    public boolean addSymbol(int code, int unicode) {
        String glyphName;
        if (code < 0 || code > 255 || (glyphName = AdobeGlyphList.unicodeToName(unicode)) == null) {
            return false;
        }
        this.unicodeToCode.put(unicode, code);
        this.codeToUnicode[code] = unicode;
        this.differences[code] = glyphName;
        this.unicodeDifferences.put(unicode, unicode);
        return true;
    }

    public int getUnicode(int index) {
        return this.codeToUnicode[index];
    }

    public int getUnicodeDifference(int index) {
        return this.unicodeDifferences.get(index);
    }

    public boolean hasDifferences() {
        return this.differences != null;
    }

    public String getDifference(int index) {
        if (this.differences != null) {
            return this.differences[index];
        }
        return null;
    }

    public void setDifference(int index, String difference) {
        if (index >= 0 && this.differences != null && index < this.differences.length) {
            this.differences[index] = difference;
        }
    }

    public byte[] convertToBytes(String text) {
        if (text == null || text.length() == 0) {
            return emptyBytes;
        }
        int ptr = 0;
        byte[] bytes = new byte[text.length()];
        for (int i = 0; i < text.length(); i++) {
            if (this.unicodeToCode.containsKey(text.charAt(i))) {
                bytes[ptr] = (byte) convertToByte(text.charAt(i));
                ptr++;
            }
        }
        return ArrayUtil.shortenArray(bytes, ptr);
    }

    public int convertToByte(int unicode) {
        return this.unicodeToCode.get(unicode);
    }

    public boolean canEncode(int unicode) {
        return this.unicodeToCode.containsKey(unicode) || TextUtil.isNonPrintable(unicode) || TextUtil.isNewLine(unicode);
    }

    public boolean canDecode(int code) {
        return this.codeToUnicode[code] > -1;
    }

    public boolean isBuiltWith(String encoding) {
        return Objects.equals(normalizeEncoding(encoding), this.baseEncoding);
    }

    protected void fillCustomEncoding() {
        int orderK;
        this.differences = new String[256];
        StringTokenizer tok = new StringTokenizer(this.baseEncoding.substring(1), " ,\t\n\r\f");
        if (tok.nextToken().equals("full")) {
            while (tok.hasMoreTokens()) {
                String order = tok.nextToken();
                String name = tok.nextToken();
                char uni = (char) Integer.parseInt(tok.nextToken(), 16);
                int uniName = AdobeGlyphList.nameToUnicode(name);
                if (order.startsWith("'")) {
                    orderK = order.charAt(1);
                } else {
                    orderK = Integer.parseInt(order);
                }
                int orderK2 = orderK % 256;
                this.unicodeToCode.put(uni, orderK2);
                this.codeToUnicode[orderK2] = uni;
                this.differences[orderK2] = name;
                this.unicodeDifferences.put(uni, uniName);
            }
        } else {
            int k = 0;
            if (tok.hasMoreTokens()) {
                k = Integer.parseInt(tok.nextToken());
            }
            while (tok.hasMoreTokens() && k < 256) {
                String hex = tok.nextToken();
                int uni2 = Integer.parseInt(hex, 16) % 65536;
                String name2 = AdobeGlyphList.unicodeToName(uni2);
                if (name2 == null) {
                    name2 = "uni" + hex;
                }
                this.unicodeToCode.put(uni2, k);
                this.codeToUnicode[k] = uni2;
                this.differences[k] = name2;
                this.unicodeDifferences.put(uni2, uni2);
                k++;
            }
        }
        for (int k2 = 0; k2 < 256; k2++) {
            if (this.differences[k2] == null) {
                this.differences[k2] = NOTDEF;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void fillNamedEncoding() {
        PdfEncodings.convertToBytes(" ", this.baseEncoding);
        boolean stdEncoding = "Cp1252".equals(this.baseEncoding) || PdfEncodings.MACROMAN.equals(this.baseEncoding);
        if (!stdEncoding && this.differences == null) {
            this.differences = new String[256];
        }
        byte[] b = new byte[256];
        for (int k = 0; k < 256; k++) {
            b[k] = (byte) k;
        }
        String str = PdfEncodings.convertToString(b, this.baseEncoding);
        char[] encoded = str.toCharArray();
        for (int ch = 0; ch < 256; ch++) {
            char uni = encoded[ch];
            String name = AdobeGlyphList.unicodeToName(uni);
            if (name == null) {
                name = NOTDEF;
            } else {
                this.unicodeToCode.put(uni, ch);
                this.codeToUnicode[ch] = uni;
                this.unicodeDifferences.put(uni, uni);
            }
            if (this.differences != null) {
                this.differences[ch] = name;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void fillStandardEncoding() {
        int[] encoded = PdfEncodings.standardEncoding;
        for (int ch = 0; ch < 256; ch++) {
            int uni = encoded[ch];
            String name = AdobeGlyphList.unicodeToName(uni);
            if (name == null) {
                name = NOTDEF;
            } else {
                this.unicodeToCode.put(uni, ch);
                this.codeToUnicode[ch] = uni;
                this.unicodeDifferences.put(uni, uni);
            }
            if (this.differences != null) {
                this.differences[ch] = name;
            }
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    protected static String normalizeEncoding(String enc) {
        char c;
        String tmp = enc == null ? "" : enc.toLowerCase();
        switch (tmp.hashCode()) {
            case -1125785742:
                if (tmp.equals("winansiencoding")) {
                    c = 2;
                    break;
                }
                c = 65535;
                break;
            case -175708658:
                if (tmp.equals("macroman")) {
                    c = 3;
                    break;
                }
                c = 65535;
                break;
            case 0:
                if (tmp.equals("")) {
                    c = 0;
                    break;
                }
                c = 65535;
                break;
            case 217982305:
                if (tmp.equals("macromanencoding")) {
                    c = 4;
                    break;
                }
                c = 65535;
                break;
            case 1349402911:
                if (tmp.equals("winansi")) {
                    c = 1;
                    break;
                }
                c = 65535;
                break;
            case 2128309164:
                if (tmp.equals("zapfdingbatsencoding")) {
                    c = 5;
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
            case 1:
            case 2:
                return "Cp1252";
            case 3:
            case 4:
                return PdfEncodings.MACROMAN;
            case 5:
                return "ZapfDingbats";
            default:
                return enc;
        }
    }
}
