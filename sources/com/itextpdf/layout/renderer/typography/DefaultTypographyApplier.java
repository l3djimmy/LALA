package com.itextpdf.layout.renderer.typography;

import com.itextpdf.commons.actions.contexts.IMetaInfo;
import com.itextpdf.commons.actions.sequence.SequenceId;
import com.itextpdf.io.font.FontProgram;
import com.itextpdf.io.font.TrueTypeFont;
import com.itextpdf.io.font.otf.GlyphLine;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.layout.properties.BaseDirection;
import com.itextpdf.layout.renderer.LineRenderer;
import java.io.IOException;
import java.lang.Character;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public final class DefaultTypographyApplier extends AbstractTypographyApplier {
    private static final Logger LOGGER = LoggerFactory.getLogger(DefaultTypographyApplier.class);

    @Override // com.itextpdf.layout.renderer.typography.AbstractTypographyApplier
    public boolean isPdfCalligraphInstance() {
        return false;
    }

    @Override // com.itextpdf.layout.renderer.typography.AbstractTypographyApplier
    public boolean applyOtfScript(TrueTypeFont font, GlyphLine glyphLine, Character.UnicodeScript script, Object configurator, SequenceId id, IMetaInfo metaInfo) {
        LOGGER.warn(IoLogMessageConstant.TYPOGRAPHY_NOT_FOUND);
        return super.applyOtfScript(font, glyphLine, script, configurator, id, metaInfo);
    }

    @Override // com.itextpdf.layout.renderer.typography.AbstractTypographyApplier
    public Collection<Character.UnicodeScript> getSupportedScripts() {
        LOGGER.warn(IoLogMessageConstant.TYPOGRAPHY_NOT_FOUND);
        return super.getSupportedScripts();
    }

    @Override // com.itextpdf.layout.renderer.typography.AbstractTypographyApplier
    public Collection<Character.UnicodeScript> getSupportedScripts(Object configurator) {
        LOGGER.warn(IoLogMessageConstant.TYPOGRAPHY_NOT_FOUND);
        return super.getSupportedScripts(configurator);
    }

    @Override // com.itextpdf.layout.renderer.typography.AbstractTypographyApplier
    public boolean applyKerning(FontProgram fontProgram, GlyphLine text, SequenceId sequenceId, IMetaInfo metaInfo) {
        LOGGER.warn(IoLogMessageConstant.TYPOGRAPHY_NOT_FOUND);
        return super.applyKerning(fontProgram, text, sequenceId, metaInfo);
    }

    @Override // com.itextpdf.layout.renderer.typography.AbstractTypographyApplier
    public byte[] getBidiLevels(BaseDirection baseDirection, int[] unicodeIds, SequenceId sequenceId, IMetaInfo metaInfo) {
        LOGGER.warn(IoLogMessageConstant.TYPOGRAPHY_NOT_FOUND);
        return super.getBidiLevels(baseDirection, unicodeIds, sequenceId, metaInfo);
    }

    @Override // com.itextpdf.layout.renderer.typography.AbstractTypographyApplier
    public int[] reorderLine(List<LineRenderer.RendererGlyph> line, byte[] lineLevels, byte[] levels) {
        LOGGER.warn(IoLogMessageConstant.TYPOGRAPHY_NOT_FOUND);
        return super.reorderLine(line, lineLevels, levels);
    }

    @Override // com.itextpdf.layout.renderer.typography.AbstractTypographyApplier
    public List<Integer> getPossibleBreaks(String str) {
        LOGGER.warn(IoLogMessageConstant.TYPOGRAPHY_NOT_FOUND);
        return super.getPossibleBreaks(str);
    }

    @Override // com.itextpdf.layout.renderer.typography.AbstractTypographyApplier
    public Map<String, byte[]> loadShippedFonts() throws IOException {
        LOGGER.warn(IoLogMessageConstant.TYPOGRAPHY_NOT_FOUND);
        return super.loadShippedFonts();
    }
}
