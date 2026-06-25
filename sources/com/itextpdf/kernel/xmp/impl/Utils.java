package com.itextpdf.kernel.xmp.impl;

import com.itextpdf.kernel.xmp.XMPConst;
import com.itextpdf.layout.properties.Property;
/* loaded from: classes12.dex */
public final class Utils implements XMPConst {
    public static final int UUID_LENGTH = 36;
    public static final int UUID_SEGMENT_COUNT = 4;
    private static boolean[] xmlNameChars;
    private static boolean[] xmlNameStartChars;

    static {
        initCharTables();
    }

    private Utils() {
    }

    public static String normalizeLangValue(String value) {
        if (XMPConst.X_DEFAULT.equals(value)) {
            return value;
        }
        int subTag = 1;
        StringBuffer buffer = new StringBuffer();
        for (int i = 0; i < value.length(); i++) {
            switch (value.charAt(i)) {
                case ' ':
                    break;
                case '-':
                case Property.FONT_WEIGHT /* 95 */:
                    buffer.append('-');
                    subTag++;
                    break;
                default:
                    if (subTag != 2) {
                        buffer.append(Character.toLowerCase(value.charAt(i)));
                        break;
                    } else {
                        buffer.append(Character.toUpperCase(value.charAt(i)));
                        break;
                    }
            }
        }
        return buffer.toString();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String[] splitNameAndValue(String selector) {
        int eq = selector.indexOf(61);
        int pos = 1;
        if (selector.charAt(1) == '?') {
            pos = 1 + 1;
        }
        String name = selector.substring(pos, eq);
        int pos2 = eq + 1;
        char quote = selector.charAt(pos2);
        int pos3 = pos2 + 1;
        int end = selector.length() - 2;
        StringBuffer value = new StringBuffer(end - eq);
        while (pos3 < end) {
            value.append(selector.charAt(pos3));
            pos3++;
            if (selector.charAt(pos3) == quote) {
                pos3++;
            }
        }
        return new String[]{name, value.toString()};
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean isInternalProperty(String schema, String prop) {
        if (XMPConst.NS_DC.equals(schema)) {
            if (!"dc:format".equals(prop) && !"dc:language".equals(prop)) {
                return false;
            }
            return true;
        } else if (XMPConst.NS_XMP.equals(schema)) {
            if (!"xmp:BaseURL".equals(prop) && !"xmp:CreatorTool".equals(prop) && !"xmp:Format".equals(prop) && !"xmp:Locale".equals(prop) && !"xmp:MetadataDate".equals(prop) && !"xmp:ModifyDate".equals(prop)) {
                return false;
            }
            return true;
        } else if (XMPConst.NS_PDF.equals(schema)) {
            if (!"pdf:BaseURL".equals(prop) && !"pdf:Creator".equals(prop) && !"pdf:ModDate".equals(prop) && !"pdf:PDFVersion".equals(prop) && !"pdf:Producer".equals(prop)) {
                return false;
            }
            return true;
        } else if (XMPConst.NS_TIFF.equals(schema)) {
            if (!"tiff:ImageDescription".equals(prop) && !"tiff:Artist".equals(prop) && !"tiff:Copyright".equals(prop)) {
                return true;
            }
            return false;
        } else if (XMPConst.NS_EXIF.equals(schema)) {
            if (!"exif:UserComment".equals(prop)) {
                return true;
            }
            return false;
        } else if (XMPConst.NS_EXIF_AUX.equals(schema)) {
            return true;
        } else {
            if (XMPConst.NS_PHOTOSHOP.equals(schema)) {
                if (!"photoshop:ICCProfile".equals(prop)) {
                    return false;
                }
                return true;
            } else if (XMPConst.NS_CAMERARAW.equals(schema)) {
                if (!"crs:Version".equals(prop) && !"crs:RawFileName".equals(prop) && !"crs:ToneCurveName".equals(prop)) {
                    return false;
                }
                return true;
            } else if (!XMPConst.NS_ADOBESTOCKPHOTO.equals(schema) && !XMPConst.NS_XMP_MM.equals(schema) && !XMPConst.TYPE_TEXT.equals(schema) && !XMPConst.TYPE_PAGEDFILE.equals(schema) && !XMPConst.TYPE_GRAPHICS.equals(schema) && !XMPConst.TYPE_IMAGE.equals(schema) && !XMPConst.TYPE_FONT.equals(schema)) {
                return false;
            } else {
                return true;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean checkUUIDFormat(String uuid) {
        boolean result = true;
        int delimCnt = 0;
        if (uuid == null) {
            return false;
        }
        int delimPos = 0;
        while (true) {
            boolean z = true;
            if (delimPos >= uuid.length()) {
                break;
            }
            if (uuid.charAt(delimPos) == '-') {
                delimCnt++;
                if (!result || (delimPos != 8 && delimPos != 13 && delimPos != 18 && delimPos != 23)) {
                    z = false;
                }
                result = z;
            }
            delimPos++;
        }
        return result && 4 == delimCnt && 36 == delimPos;
    }

    public static boolean isXMLName(String name) {
        if (name.length() <= 0 || isNameStartChar(name.charAt(0))) {
            for (int i = 1; i < name.length(); i++) {
                if (!isNameChar(name.charAt(i))) {
                    return false;
                }
            }
            return true;
        }
        return false;
    }

    public static boolean isXMLNameNS(String name) {
        if (name.length() <= 0 || (isNameStartChar(name.charAt(0)) && name.charAt(0) != ':')) {
            for (int i = 1; i < name.length(); i++) {
                if (!isNameChar(name.charAt(i)) || name.charAt(i) == ':') {
                    return false;
                }
            }
            return true;
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean isControlChar(char c) {
        return ((c > 31 && c != 127) || c == '\t' || c == '\n' || c == '\r') ? false : true;
    }

    public static String escapeXML(String value, boolean forAttribute, boolean escapeWhitespaces) {
        boolean needsEscaping = false;
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            if (c == '<' || c == '>' || c == '&' || ((escapeWhitespaces && (c == '\t' || c == '\n' || c == '\r')) || (forAttribute && c == '\"'))) {
                needsEscaping = true;
                break;
            }
        }
        if (!needsEscaping) {
            return value;
        }
        StringBuffer buffer = new StringBuffer((value.length() * 4) / 3);
        for (int i2 = 0; i2 < value.length(); i2++) {
            char c2 = value.charAt(i2);
            if (!escapeWhitespaces || (c2 != '\t' && c2 != '\n' && c2 != '\r')) {
                switch (c2) {
                    case '\"':
                        buffer.append(forAttribute ? "&quot;" : "\"");
                        continue;
                    case '&':
                        buffer.append("&amp;");
                        continue;
                    case '<':
                        buffer.append("&lt;");
                        continue;
                    case '>':
                        buffer.append("&gt;");
                        continue;
                    default:
                        buffer.append(c2);
                        continue;
                }
            } else {
                buffer.append("&#x");
                buffer.append(Integer.toHexString(c2).toUpperCase());
                buffer.append(';');
            }
        }
        return buffer.toString();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String removeControlChars(String value) {
        StringBuilder buffer = new StringBuilder(value);
        for (int i = 0; i < buffer.length(); i++) {
            if (isControlChar(buffer.charAt(i))) {
                buffer.setCharAt(i, ' ');
            }
        }
        return buffer.toString();
    }

    private static boolean isNameStartChar(char ch) {
        return (ch <= 255 && xmlNameStartChars[ch]) || (ch >= 256 && ch <= 767) || ((ch >= 880 && ch <= 893) || ((ch >= 895 && ch <= 8191) || ((ch >= 8204 && ch <= 8205) || ((ch >= 8304 && ch <= 8591) || ((ch >= 11264 && ch <= 12271) || ((ch >= 12289 && ch <= 55295) || ((ch >= 63744 && ch <= 64975) || ((ch >= 65008 && ch <= 65533) || (ch >= 0 && ch <= 65535)))))))));
    }

    private static boolean isNameChar(char ch) {
        return (ch <= 255 && xmlNameChars[ch]) || isNameStartChar(ch) || (ch >= 768 && ch <= 879) || (ch >= 8255 && ch <= 8256);
    }

    private static void initCharTables() {
        xmlNameChars = new boolean[256];
        xmlNameStartChars = new boolean[256];
        for (int i = 0; i < xmlNameChars.length; i++) {
            char ch = (char) i;
            boolean z = false;
            xmlNameStartChars[ch] = ch == ':' || ('A' <= ch && ch <= 'Z') || ch == '_' || (('a' <= ch && ch <= 'z') || ((192 <= ch && ch <= 214) || ((216 <= ch && ch <= 246) || (248 <= ch && ch <= 255))));
            boolean[] zArr = xmlNameChars;
            if (xmlNameStartChars[ch] || ch == '-' || ch == '.' || (('0' <= ch && ch <= '9') || ch == 183)) {
                z = true;
            }
            zArr[ch] = z;
        }
    }
}
