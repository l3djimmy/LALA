package com.itextpdf.layout.renderer;

import com.itextpdf.commons.actions.contexts.IMetaInfo;
import com.itextpdf.commons.actions.sequence.SequenceId;
import com.itextpdf.io.font.FontProgram;
import com.itextpdf.io.font.TrueTypeFont;
import com.itextpdf.io.font.otf.GlyphLine;
import com.itextpdf.layout.properties.BaseDirection;
import com.itextpdf.layout.renderer.LineRenderer;
import com.itextpdf.layout.renderer.typography.AbstractTypographyApplier;
import com.itextpdf.layout.renderer.typography.DefaultTypographyApplier;
import java.io.IOException;
import java.lang.Character;
import java.lang.reflect.Method;
import java.util.Collection;
import java.util.List;
import java.util.Map;
/* loaded from: classes12.dex */
public final class TypographyUtils {
    private static final String TYPOGRAPHY_APPLIER = "shaping.TypographyApplier";
    private static final String TYPOGRAPHY_APPLIER_INITIALIZE = "registerForLayout";
    private static final String TYPOGRAPHY_PACKAGE = "com.itextpdf.typography.";
    private static AbstractTypographyApplier applierInstance;

    static {
        Method method;
        try {
            Class<?> type = getTypographyClass("com.itextpdf.typography.shaping.TypographyApplier");
            if (type != null && (method = type.getMethod(TYPOGRAPHY_APPLIER_INITIALIZE, new Class[0])) != null) {
                method.invoke(null, new Object[0]);
            }
        } catch (Exception e) {
        }
        if (applierInstance == null) {
            setTypographyApplierInstance(new DefaultTypographyApplier());
        }
    }

    private TypographyUtils() {
    }

    public static void setTypographyApplierInstance(AbstractTypographyApplier newInstance) {
        applierInstance = newInstance;
    }

    public static boolean isPdfCalligraphAvailable() {
        return applierInstance.isPdfCalligraphInstance();
    }

    public static Collection<Character.UnicodeScript> getSupportedScripts() {
        return applierInstance.getSupportedScripts();
    }

    public static Collection<Character.UnicodeScript> getSupportedScripts(Object typographyConfig) {
        return applierInstance.getSupportedScripts(typographyConfig);
    }

    public static Map<String, byte[]> loadShippedFonts() throws IOException {
        return applierInstance.loadShippedFonts();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void applyOtfScript(FontProgram fontProgram, GlyphLine text, Character.UnicodeScript script, Object typographyConfig, SequenceId sequenceId, IMetaInfo metaInfo) {
        applierInstance.applyOtfScript((TrueTypeFont) fontProgram, text, script, typographyConfig, sequenceId, metaInfo);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void applyKerning(FontProgram fontProgram, GlyphLine text, SequenceId sequenceId, IMetaInfo metaInfo) {
        applierInstance.applyKerning(fontProgram, text, sequenceId, metaInfo);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static byte[] getBidiLevels(BaseDirection baseDirection, int[] unicodeIds, SequenceId sequenceId, IMetaInfo metaInfo) {
        return applierInstance.getBidiLevels(baseDirection, unicodeIds, sequenceId, metaInfo);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int[] reorderLine(List<LineRenderer.RendererGlyph> line, byte[] lineLevels, byte[] levels) {
        return applierInstance.reorderLine(line, lineLevels, levels);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static List<Integer> getPossibleBreaks(String str) {
        return applierInstance.getPossibleBreaks(str);
    }

    private static Class<?> getTypographyClass(String typographyClassName) throws ClassNotFoundException {
        return Class.forName(typographyClassName);
    }
}
