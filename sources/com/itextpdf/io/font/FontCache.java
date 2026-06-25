package com.itextpdf.io.font;

import com.itextpdf.io.font.cmap.CMapByteCid;
import com.itextpdf.io.font.cmap.CMapCidToCodepoint;
import com.itextpdf.io.font.cmap.CMapCidUni;
import com.itextpdf.io.font.cmap.CMapCodepointToCid;
import com.itextpdf.io.font.cmap.CMapUniCid;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
/* loaded from: classes12.dex */
public class FontCache {
    private static Map<FontCacheKey, FontProgram> fontCache = new ConcurrentHashMap();

    @Deprecated
    protected static boolean isPredefinedCidFont(String fontName) {
        return CjkResourceLoader.isPredefinedCidFont(fontName);
    }

    @Deprecated
    public static String getCompatibleCidFont(String cmap) {
        return CjkResourceLoader.getCompatibleCidFont(cmap);
    }

    @Deprecated
    public static Set<String> getCompatibleCmaps(String fontName) {
        return CjkResourceLoader.getCompatibleCmaps(fontName);
    }

    @Deprecated
    public static Map<String, Map<String, Object>> getAllPredefinedCidFonts() {
        return CjkResourceLoader.getAllPredefinedCidFonts();
    }

    @Deprecated
    public static Map<String, Set<String>> getRegistryNames() {
        return CjkResourceLoader.getRegistryNames();
    }

    @Deprecated
    public static CMapCidUni getCid2UniCmap(String uniMap) {
        return CjkResourceLoader.getCid2UniCmap(uniMap);
    }

    @Deprecated
    public static CMapUniCid getUni2CidCmap(String uniMap) {
        return CjkResourceLoader.getUni2CidCmap(uniMap);
    }

    @Deprecated
    public static CMapByteCid getByte2CidCmap(String cmap) {
        return CjkResourceLoader.getByte2CidCmap(cmap);
    }

    @Deprecated
    public static CMapCidToCodepoint getCidToCodepointCmap(String cmap) {
        return CjkResourceLoader.getCidToCodepointCmap(cmap);
    }

    @Deprecated
    public static CMapCodepointToCid getCodepointToCidCmap(String uniMap) {
        return CjkResourceLoader.getCodepointToCidCmap(uniMap);
    }

    public static void clearSavedFonts() {
        fontCache.clear();
    }

    public static FontProgram getFont(String fontName) {
        return fontCache.get(FontCacheKey.create(fontName));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static FontProgram getFont(FontCacheKey key) {
        return fontCache.get(key);
    }

    public static FontProgram saveFont(FontProgram font, String fontName) {
        return saveFont(font, FontCacheKey.create(fontName));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static FontProgram saveFont(FontProgram font, FontCacheKey key) {
        FontProgram fontFound = fontCache.get(key);
        if (fontFound != null) {
            return fontFound;
        }
        fontCache.put(key, font);
        return font;
    }
}
