package com.itextpdf.io.font;

import com.itextpdf.io.font.constants.FontResources;
import com.itextpdf.io.util.ResourceUtil;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;
/* loaded from: classes12.dex */
public class AdobeGlyphList {
    private static Map<Integer, String> unicode2names = new HashMap();
    private static Map<String, Integer> names2unicode = new HashMap();

    static {
        InputStream resource;
        InputStream resource2 = null;
        try {
            try {
                resource = ResourceUtil.getResourceStream(FontResources.ADOBE_GLYPH_LIST);
            } catch (Throwable th) {
                if (0 != 0) {
                    try {
                        resource2.close();
                    } catch (Exception e) {
                    }
                }
                throw th;
            }
        } catch (Exception e2) {
            System.err.println("AdobeGlyphList.txt loading error: " + e2.getMessage());
            if (0 == 0) {
                return;
            }
        }
        if (resource == null) {
            throw new Exception("com/itextpdf/io/font/AdobeGlyphList.txt not found as resource.");
        }
        byte[] buf = new byte[1024];
        ByteArrayOutputStream stream = new ByteArrayOutputStream();
        while (true) {
            int size = resource.read(buf);
            if (size < 0) {
                break;
            }
            stream.write(buf, 0, size);
        }
        resource.close();
        resource2 = null;
        String s = PdfEncodings.convertToString(stream.toByteArray(), null);
        StringTokenizer tk = new StringTokenizer(s, "\r\n");
        while (tk.hasMoreTokens()) {
            String line = tk.nextToken();
            if (!line.startsWith("#")) {
                StringTokenizer t2 = new StringTokenizer(line, " ;\r\n\t\f");
                if (t2.hasMoreTokens()) {
                    String name = t2.nextToken();
                    if (t2.hasMoreTokens()) {
                        String hex = t2.nextToken();
                        if (!t2.hasMoreTokens()) {
                            int num = Integer.parseInt(hex, 16);
                            unicode2names.put(Integer.valueOf(num), name);
                            names2unicode.put(name, Integer.valueOf(num));
                        }
                    }
                }
            }
        }
        if (0 == 0) {
            return;
        }
        try {
            resource2.close();
        } catch (Exception e3) {
        }
    }

    public static int nameToUnicode(String name) {
        int v = -1;
        if (names2unicode.containsKey(name)) {
            v = names2unicode.get(name).intValue();
        }
        if (v == -1 && name.length() == 7 && name.toLowerCase().startsWith("uni")) {
            try {
                return Integer.parseInt(name.substring(3), 16);
            } catch (Exception e) {
            }
        }
        return v;
    }

    public static String unicodeToName(int num) {
        return unicode2names.get(Integer.valueOf(num));
    }

    public static int getNameToUnicodeLength() {
        return names2unicode.size();
    }

    public static int getUnicodeToNameLength() {
        return unicode2names.size();
    }
}
