package com.itextpdf.kernel.font;

import com.itextpdf.io.font.CjkResourceLoader;
import com.itextpdf.io.font.PdfEncodings;
import com.itextpdf.io.font.cmap.CMapLocationFromBytes;
import com.itextpdf.io.font.cmap.CMapLocationResource;
import com.itextpdf.io.font.cmap.CMapParser;
import com.itextpdf.io.font.cmap.CMapToUnicode;
import com.itextpdf.io.font.cmap.CMapUniCid;
import com.itextpdf.io.font.cmap.ICMapLocation;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.io.util.IntHashtable;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfNumber;
import com.itextpdf.kernel.pdf.PdfObject;
import com.itextpdf.kernel.pdf.PdfStream;
import java.security.SecureRandom;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class FontUtil {
    private static final String UNIVERSAL_CMAP_DIR = "toUnicode/";
    private static final SecureRandom NUMBER_GENERATOR = new SecureRandom();
    private static final HashMap<String, CMapToUnicode> uniMaps = new HashMap<>();
    private static final Logger LOGGER = LoggerFactory.getLogger(FontUtil.class);
    private static final Set<String> UNIVERSAL_CMAP_ORDERINGS = new HashSet(Arrays.asList("CNS1", "GB1", "Japan1", "Korea1", "KR"));

    private FontUtil() {
    }

    public static String addRandomSubsetPrefixForFontName(String fontName) {
        StringBuilder newFontName = getRandomFontPrefix(6);
        newFontName.append('+').append(fontName);
        return newFontName.toString();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static CMapToUnicode processToUnicode(PdfObject toUnicode) {
        if (toUnicode instanceof PdfStream) {
            try {
                byte[] uniBytes = ((PdfStream) toUnicode).getBytes();
                ICMapLocation lb = new CMapLocationFromBytes(uniBytes);
                CMapToUnicode cMapToUnicode = new CMapToUnicode();
                CMapParser.parseCid("", cMapToUnicode, lb);
                return cMapToUnicode;
            } catch (Exception e) {
                LOGGER.error(IoLogMessageConstant.UNKNOWN_ERROR_WHILE_PROCESSING_CMAP, (Throwable) e);
                return CMapToUnicode.EmptyCMapToUnicodeMap;
            }
        } else if (!PdfName.IdentityH.equals(toUnicode)) {
            return null;
        } else {
            return CMapToUnicode.getIdentity();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static CMapToUnicode parseUniversalToUnicodeCMap(String ordering) {
        if (UNIVERSAL_CMAP_ORDERINGS.contains(ordering)) {
            String cmapRelPath = "toUnicode/Adobe-" + ordering + "-UCS2";
            CMapToUnicode cMapToUnicode = new CMapToUnicode();
            try {
                CMapParser.parseCid(cmapRelPath, cMapToUnicode, new CMapLocationResource());
                return cMapToUnicode;
            } catch (Exception e) {
                LOGGER.error(IoLogMessageConstant.UNKNOWN_ERROR_WHILE_PROCESSING_CMAP, (Throwable) e);
                return null;
            }
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static CMapToUnicode getToUnicodeFromUniMap(String uniMap) {
        CMapToUnicode toUnicode;
        if (uniMap == null) {
            return null;
        }
        synchronized (uniMaps) {
            if (uniMaps.containsKey(uniMap)) {
                return uniMaps.get(uniMap);
            }
            if (PdfEncodings.IDENTITY_H.equals(uniMap)) {
                toUnicode = CMapToUnicode.getIdentity();
            } else {
                CMapUniCid uni = CjkResourceLoader.getUni2CidCmap(uniMap);
                toUnicode = uni.exportToUnicode();
            }
            uniMaps.put(uniMap, toUnicode);
            return toUnicode;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String createRandomFontName() {
        return getRandomFontPrefix(7).toString();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int[] convertSimpleWidthsArray(PdfArray widthsArray, int first, int missingWidth) {
        int[] res = new int[256];
        Arrays.fill(res, missingWidth);
        if (widthsArray == null) {
            Logger logger = LoggerFactory.getLogger(FontUtil.class);
            logger.warn(IoLogMessageConstant.FONT_DICTIONARY_WITH_NO_WIDTHS);
            return res;
        }
        for (int i = 0; i < widthsArray.size() && first + i < 256; i++) {
            PdfNumber number = widthsArray.getAsNumber(i);
            res[first + i] = number != null ? number.intValue() : missingWidth;
        }
        return res;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static IntHashtable convertCompositeWidthsArray(PdfArray widthsArray) {
        IntHashtable res = new IntHashtable();
        if (widthsArray == null) {
            return res;
        }
        int k = 0;
        while (k < widthsArray.size()) {
            int c1 = widthsArray.getAsNumber(k).intValue();
            int k2 = k + 1;
            PdfObject obj = widthsArray.get(k2);
            if (obj.isArray()) {
                PdfArray subWidths = (PdfArray) obj;
                int j = 0;
                while (j < subWidths.size()) {
                    int c2 = subWidths.getAsNumber(j).intValue();
                    res.put(c1, c2);
                    j++;
                    c1++;
                }
            } else {
                int c22 = ((PdfNumber) obj).intValue();
                k2++;
                int w = widthsArray.getAsNumber(k2).intValue();
                while (c1 <= c22) {
                    res.put(c1, w);
                    c1++;
                }
            }
            k = k2 + 1;
        }
        return res;
    }

    private static StringBuilder getRandomFontPrefix(int length) {
        StringBuilder stringBuilder = new StringBuilder();
        byte[] randomByte = new byte[length];
        NUMBER_GENERATOR.nextBytes(randomByte);
        for (int k = 0; k < length; k++) {
            stringBuilder.append((char) (Math.abs(randomByte[k] % 26) + 65));
        }
        return stringBuilder;
    }
}
