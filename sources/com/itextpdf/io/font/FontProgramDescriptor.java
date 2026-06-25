package com.itextpdf.io.font;

import androidx.exifinterface.media.ExifInterface;
import java.util.HashSet;
import java.util.Set;
/* loaded from: classes12.dex */
public class FontProgramDescriptor {
    private static final String[] TT_FAMILY_ORDER = {ExifInterface.GPS_MEASUREMENT_3D, "1", "1033", ExifInterface.GPS_MEASUREMENT_3D, "0", "1033", "1", "0", "0", "0", ExifInterface.GPS_MEASUREMENT_3D, "0"};
    private final String familyName2LowerCase;
    private final String familyNameEnglishOpenType;
    private final String familyNameLowerCase;
    private final String fontName;
    private final String fontNameLowerCase;
    private final String fullNameLowerCase;
    private final Set<String> fullNamesAllLangs;
    private final Set<String> fullNamesEnglishOpenType;
    private final boolean isMonospace;
    private final float italicAngle;
    private final int macStyle;
    private final String style;
    private final int weight;

    /* JADX INFO: Access modifiers changed from: package-private */
    public FontProgramDescriptor(FontNames fontNames, float italicAngle, boolean isMonospace) {
        this.fontName = fontNames.getFontName();
        this.fontNameLowerCase = this.fontName.toLowerCase();
        this.fullNameLowerCase = fontNames.getFullName()[0][3].toLowerCase();
        String str = null;
        this.familyNameLowerCase = (fontNames.getFamilyName() == null || fontNames.getFamilyName()[0][3] == null) ? null : fontNames.getFamilyName()[0][3].toLowerCase();
        String[][] familyName2 = fontNames.getFamilyName2();
        if (familyName2 != null && familyName2[familyName2.length - 1][3] != null) {
            str = familyName2[familyName2.length - 1][3].toLowerCase();
        }
        this.familyName2LowerCase = str;
        this.style = fontNames.getStyle();
        this.weight = fontNames.getFontWeight();
        this.macStyle = fontNames.getMacStyle();
        this.italicAngle = italicAngle;
        this.isMonospace = isMonospace;
        this.familyNameEnglishOpenType = extractFamilyNameEnglishOpenType(fontNames);
        this.fullNamesAllLangs = extractFullFontNames(fontNames);
        this.fullNamesEnglishOpenType = extractFullNamesEnglishOpenType(fontNames);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public FontProgramDescriptor(FontNames fontNames, FontMetrics fontMetrics) {
        this(fontNames, fontMetrics.getItalicAngle(), fontMetrics.isFixedPitch());
    }

    public String getFontName() {
        return this.fontName;
    }

    public String getStyle() {
        return this.style;
    }

    public int getFontWeight() {
        return this.weight;
    }

    public float getItalicAngle() {
        return this.italicAngle;
    }

    public boolean isMonospace() {
        return this.isMonospace;
    }

    public boolean isBold() {
        return (this.macStyle & 1) != 0;
    }

    public boolean isItalic() {
        return (this.macStyle & 2) != 0;
    }

    public String getFullNameLowerCase() {
        return this.fullNameLowerCase;
    }

    public String getFontNameLowerCase() {
        return this.fontNameLowerCase;
    }

    public String getFamilyNameLowerCase() {
        return this.familyNameLowerCase;
    }

    public String getFamilyName2LowerCase() {
        return this.familyName2LowerCase;
    }

    public Set<String> getFullNameAllLangs() {
        return this.fullNamesAllLangs;
    }

    public Set<String> getFullNamesEnglishOpenType() {
        return this.fullNamesEnglishOpenType;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String getFamilyNameEnglishOpenType() {
        return this.familyNameEnglishOpenType;
    }

    private Set<String> extractFullFontNames(FontNames fontNames) {
        String[][] fullName;
        Set<String> uniqueFullNames = new HashSet<>();
        for (String[] fullName2 : fontNames.getFullName()) {
            uniqueFullNames.add(fullName2[3].toLowerCase());
        }
        return uniqueFullNames;
    }

    private String extractFamilyNameEnglishOpenType(FontNames fontNames) {
        String[][] familyName;
        if (fontNames.getFamilyName() != null) {
            for (int k = 0; k < TT_FAMILY_ORDER.length; k += 3) {
                for (String[] name : fontNames.getFamilyName()) {
                    if (TT_FAMILY_ORDER[k].equals(name[0]) && TT_FAMILY_ORDER[k + 1].equals(name[1]) && TT_FAMILY_ORDER[k + 2].equals(name[2])) {
                        return name[3].toLowerCase();
                    }
                }
            }
            return null;
        }
        return null;
    }

    private Set<String> extractFullNamesEnglishOpenType(FontNames fontNames) {
        if (this.familyNameEnglishOpenType != null) {
            Set<String> uniqueTtfSuitableFullNames = new HashSet<>();
            String[][] names = fontNames.getFullName();
            for (String[] name : names) {
                int k = 0;
                while (true) {
                    if (k >= TT_FAMILY_ORDER.length) {
                        break;
                    } else if (!TT_FAMILY_ORDER[k].equals(name[0]) || !TT_FAMILY_ORDER[k + 1].equals(name[1]) || !TT_FAMILY_ORDER[k + 2].equals(name[2])) {
                        k += 3;
                    } else {
                        uniqueTtfSuitableFullNames.add(name[3]);
                        break;
                    }
                }
            }
            return uniqueTtfSuitableFullNames;
        }
        return new HashSet();
    }
}
