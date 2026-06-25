package com.itextpdf.io.font.constants;
/* loaded from: classes12.dex */
public final class FontWeights {
    public static final int BLACK = 900;
    public static final int BOLD = 700;
    public static final int EXTRA_BOLD = 800;
    public static final int EXTRA_LIGHT = 200;
    public static final int LIGHT = 300;
    public static final int MEDIUM = 500;
    public static final int NORMAL = 400;
    public static final int SEMI_BOLD = 600;
    public static final int THIN = 100;

    private FontWeights() {
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public static int fromType1FontWeight(String weight) {
        char c;
        String lowerCase = weight.toLowerCase();
        switch (lowerCase.hashCode()) {
            case -1078030475:
                if (lowerCase.equals("medium")) {
                    c = 7;
                    break;
                }
                c = 65535;
                break;
            case -1039745817:
                if (lowerCase.equals("normal")) {
                    c = 6;
                    break;
                }
                c = 65535;
                break;
            case -252885355:
                if (lowerCase.equals("extrabold")) {
                    c = 11;
                    break;
                }
                c = 65535;
                break;
            case 101145:
                if (lowerCase.equals("fat")) {
                    c = 17;
                    break;
                }
                c = 65535;
                break;
            case 3029637:
                if (lowerCase.equals("bold")) {
                    c = '\n';
                    break;
                }
                c = 65535;
                break;
            case 3029737:
                if (lowerCase.equals("book")) {
                    c = 4;
                    break;
                }
                c = 65535;
                break;
            case 3559065:
                if (lowerCase.equals("thin")) {
                    c = 1;
                    break;
                }
                c = 65535;
                break;
            case 93818879:
                if (lowerCase.equals("black")) {
                    c = 14;
                    break;
                }
                c = 65535;
                break;
            case 99152071:
                if (lowerCase.equals("heavy")) {
                    c = '\r';
                    break;
                }
                c = 65535;
                break;
            case 102970646:
                if (lowerCase.equals("light")) {
                    c = 3;
                    break;
                }
                c = 65535;
                break;
            case 111384492:
                if (lowerCase.equals("ultra")) {
                    c = 15;
                    break;
                }
                c = 65535;
                break;
            case 750388719:
                if (lowerCase.equals("extrablack")) {
                    c = 18;
                    break;
                }
                c = 65535;
                break;
            case 759540486:
                if (lowerCase.equals("extralight")) {
                    c = 2;
                    break;
                }
                c = 65535;
                break;
            case 851509730:
                if (lowerCase.equals("demibold")) {
                    c = '\b';
                    break;
                }
                c = 65535;
                break;
            case 1086463900:
                if (lowerCase.equals("regular")) {
                    c = 5;
                    break;
                }
                c = 65535;
                break;
            case 1223860979:
                if (lowerCase.equals("semibold")) {
                    c = '\t';
                    break;
                }
                c = 65535;
                break;
            case 1453726769:
                if (lowerCase.equals("ultrabold")) {
                    c = '\f';
                    break;
                }
                c = 65535;
                break;
            case 2115757011:
                if (lowerCase.equals("ultrablack")) {
                    c = 16;
                    break;
                }
                c = 65535;
                break;
            case 2124908778:
                if (lowerCase.equals("ultralight")) {
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
                return 100;
            case 1:
            case 2:
                return 200;
            case 3:
                return 300;
            case 4:
            case 5:
            case 6:
                return NORMAL;
            case 7:
                return MEDIUM;
            case '\b':
            case '\t':
                return 600;
            case '\n':
                return 700;
            case 11:
            case '\f':
                return EXTRA_BOLD;
            case '\r':
            case 14:
            case 15:
            case 16:
                return 900;
            case 17:
            case 18:
                return 900;
            default:
                return NORMAL;
        }
    }

    public static int normalizeFontWeight(int fontWeight) {
        int fontWeight2 = (fontWeight / 100) * 100;
        if (fontWeight2 < 100) {
            return 100;
        }
        if (fontWeight2 > 900) {
            return 900;
        }
        return fontWeight2;
    }
}
