package com.itextpdf.io.font.constants;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
/* loaded from: classes12.dex */
public final class StandardFonts {
    private static final Set<String> BUILTIN_FONTS;
    public static final String COURIER = "Courier";
    public static final String COURIER_BOLD = "Courier-Bold";
    public static final String COURIER_BOLDOBLIQUE = "Courier-BoldOblique";
    public static final String COURIER_OBLIQUE = "Courier-Oblique";
    public static final String HELVETICA = "Helvetica";
    public static final String HELVETICA_BOLD = "Helvetica-Bold";
    public static final String HELVETICA_BOLDOBLIQUE = "Helvetica-BoldOblique";
    public static final String HELVETICA_OBLIQUE = "Helvetica-Oblique";
    public static final String SYMBOL = "Symbol";
    public static final String TIMES_BOLD = "Times-Bold";
    public static final String TIMES_BOLDITALIC = "Times-BoldItalic";
    public static final String TIMES_ITALIC = "Times-Italic";
    public static final String TIMES_ROMAN = "Times-Roman";
    public static final String ZAPFDINGBATS = "ZapfDingbats";

    private StandardFonts() {
    }

    static {
        HashSet<String> tempSet = new HashSet<>();
        tempSet.add("Courier");
        tempSet.add(COURIER_BOLD);
        tempSet.add(COURIER_BOLDOBLIQUE);
        tempSet.add(COURIER_OBLIQUE);
        tempSet.add("Helvetica");
        tempSet.add(HELVETICA_BOLD);
        tempSet.add(HELVETICA_BOLDOBLIQUE);
        tempSet.add(HELVETICA_OBLIQUE);
        tempSet.add("Symbol");
        tempSet.add(TIMES_ROMAN);
        tempSet.add(TIMES_BOLD);
        tempSet.add(TIMES_BOLDITALIC);
        tempSet.add(TIMES_ITALIC);
        tempSet.add("ZapfDingbats");
        BUILTIN_FONTS = Collections.unmodifiableSet(tempSet);
    }

    public static boolean isStandardFont(String fontName) {
        return BUILTIN_FONTS.contains(fontName);
    }
}
