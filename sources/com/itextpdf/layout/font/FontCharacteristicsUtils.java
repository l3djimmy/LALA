package com.itextpdf.layout.font;
/* loaded from: classes12.dex */
final class FontCharacteristicsUtils {
    FontCharacteristicsUtils() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static short normalizeFontWeight(short fw) {
        short fw2 = (short) ((fw / 100) * 100);
        if (fw2 < 100) {
            return (short) 100;
        }
        if (fw2 > 900) {
            return (short) 900;
        }
        return fw2;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public static short parseFontWeight(String fw) {
        boolean z;
        if (fw == null || fw.length() == 0) {
            return (short) -1;
        }
        String fw2 = fw.trim().toLowerCase();
        switch (fw2.hashCode()) {
            case -1039745817:
                if (fw2.equals("normal")) {
                    z = true;
                    break;
                }
                z = true;
                break;
            case 3029637:
                if (fw2.equals("bold")) {
                    z = false;
                    break;
                }
                z = true;
                break;
            default:
                z = true;
                break;
        }
        switch (z) {
            case false:
                return (short) 700;
            case true:
                return (short) 400;
            default:
                try {
                    return normalizeFontWeight((short) Integer.parseInt(fw2));
                } catch (NumberFormatException e) {
                    return (short) -1;
                }
        }
    }
}
