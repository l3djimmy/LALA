package com.itextpdf.io.font;

import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.font.OpenTypeParser;
import com.itextpdf.io.font.constants.TrueTypeCodePages;
import com.itextpdf.io.font.otf.Glyph;
import com.itextpdf.io.font.otf.GlyphPositioningTableReader;
import com.itextpdf.io.font.otf.GlyphSubstitutionTableReader;
import com.itextpdf.io.font.otf.OpenTypeGdefTableReader;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.io.util.IntHashtable;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.SortedSet;
import java.util.function.Function;
import java.util.stream.Collectors;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class TrueTypeFont extends FontProgram {
    protected int[][] bBoxes;
    private OpenTypeParser fontParser;
    private byte[] fontStreamBytes;
    private OpenTypeGdefTableReader gdefTable;
    private GlyphPositioningTableReader gposTable;
    private GlyphSubstitutionTableReader gsubTable;
    protected boolean isVertical;
    protected IntHashtable kerning;

    private TrueTypeFont(OpenTypeParser fontParser) throws IOException {
        this.kerning = new IntHashtable();
        this.fontParser = fontParser;
        this.fontParser.loadTables(true);
        initializeFontProperties();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public TrueTypeFont() {
        this.kerning = new IntHashtable();
        this.fontNames = new FontNames();
    }

    public TrueTypeFont(String path) throws IOException {
        this(new OpenTypeParser(path));
    }

    public TrueTypeFont(byte[] ttf) throws IOException {
        this(new OpenTypeParser(ttf));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public TrueTypeFont(String ttcPath, int ttcIndex) throws IOException {
        this(new OpenTypeParser(ttcPath, ttcIndex));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public TrueTypeFont(byte[] ttc, int ttcIndex) throws IOException {
        this(new OpenTypeParser(ttc, ttcIndex));
    }

    @Override // com.itextpdf.io.font.FontProgram
    public boolean hasKernPairs() {
        return this.kerning.size() > 0;
    }

    @Override // com.itextpdf.io.font.FontProgram
    public int getKerning(Glyph first, Glyph second) {
        if (first == null || second == null) {
            return 0;
        }
        return this.kerning.get((first.getCode() << 16) + second.getCode());
    }

    public boolean isCff() {
        return this.fontParser.isCff();
    }

    public Map<Integer, int[]> getActiveCmap() {
        OpenTypeParser.CmapTable cmaps = this.fontParser.getCmapTable();
        if (cmaps.cmapExt != null) {
            return cmaps.cmapExt;
        }
        if (!cmaps.fontSpecific && cmaps.cmap31 != null) {
            return cmaps.cmap31;
        }
        if (cmaps.fontSpecific && cmaps.cmap10 != null) {
            return cmaps.cmap10;
        }
        if (cmaps.cmap31 != null) {
            return cmaps.cmap31;
        }
        return cmaps.cmap10;
    }

    public byte[] getFontStreamBytes() {
        if (this.fontStreamBytes != null) {
            return this.fontStreamBytes;
        }
        try {
            boolean isCff = this.fontParser.isCff();
            OpenTypeParser openTypeParser = this.fontParser;
            if (isCff) {
                this.fontStreamBytes = openTypeParser.readCffFont();
            } else {
                this.fontStreamBytes = openTypeParser.getFullFont();
            }
            return this.fontStreamBytes;
        } catch (IOException e) {
            this.fontStreamBytes = null;
            throw new com.itextpdf.io.exceptions.IOException("I/O exception.", (Throwable) e);
        }
    }

    @Override // com.itextpdf.io.font.FontProgram
    public int getPdfFontFlags() {
        int flags = 0;
        if (this.fontMetrics.isFixedPitch()) {
            flags = 0 | 1;
        }
        int flags2 = flags | (isFontSpecific() ? 4 : 32);
        if (this.fontNames.isItalic()) {
            flags2 |= 64;
        }
        if (this.fontNames.isBold() || this.fontNames.getFontWeight() > 500) {
            return flags2 | 262144;
        }
        return flags2;
    }

    public int getDirectoryOffset() {
        return this.fontParser.directoryOffset;
    }

    public GlyphSubstitutionTableReader getGsubTable() {
        return this.gsubTable;
    }

    public GlyphPositioningTableReader getGposTable() {
        return this.gposTable;
    }

    public OpenTypeGdefTableReader getGdefTable() {
        return this.gdefTable;
    }

    public byte[] getSubset(Set<Integer> glyphs, boolean subset) {
        try {
            return this.fontParser.getSubset(glyphs, subset);
        } catch (IOException e) {
            throw new com.itextpdf.io.exceptions.IOException("I/O exception.", (Throwable) e);
        }
    }

    public Set<Integer> mapGlyphsCidsToGids(Set<Integer> glyphs) {
        return (Set) glyphs.stream().map(new Function() { // from class: com.itextpdf.io.font.TrueTypeFont$$ExternalSyntheticLambda0
            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return TrueTypeFont.this.m7325lambda$mapGlyphsCidsToGids$0$comitextpdfiofontTrueTypeFont((Integer) obj);
            }
        }).collect(Collectors.toSet());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$mapGlyphsCidsToGids$0$com-itextpdf-io-font-TrueTypeFont  reason: not valid java name */
    public /* synthetic */ Integer m7325lambda$mapGlyphsCidsToGids$0$comitextpdfiofontTrueTypeFont(Integer i) {
        Glyph usedGlyph = getGlyphByCode(i.intValue());
        if (usedGlyph instanceof GidAwareGlyph) {
            return Integer.valueOf(((GidAwareGlyph) usedGlyph).getGid());
        }
        return i;
    }

    protected void readGdefTable() throws IOException {
        int[] gdef = this.fontParser.tables.get("GDEF");
        if (gdef != null) {
            this.gdefTable = new OpenTypeGdefTableReader(this.fontParser.raf, gdef[0]);
        } else {
            this.gdefTable = new OpenTypeGdefTableReader(this.fontParser.raf, 0);
        }
        this.gdefTable.readTable();
    }

    protected void readGsubTable() throws IOException {
        int[] gsub = this.fontParser.tables.get("GSUB");
        if (gsub != null) {
            this.gsubTable = new GlyphSubstitutionTableReader(this.fontParser.raf, gsub[0], this.gdefTable, this.codeToGlyph, this.fontMetrics.getUnitsPerEm());
        }
    }

    protected void readGposTable() throws IOException {
        int[] gpos = this.fontParser.tables.get("GPOS");
        if (gpos != null) {
            this.gposTable = new GlyphPositioningTableReader(this.fontParser.raf, gpos[0], this.gdefTable, this.codeToGlyph, this.fontMetrics.getUnitsPerEm());
        }
    }

    private void initializeFontProperties() throws IOException {
        OpenTypeParser.WindowsMetrics os_2;
        int cid;
        Glyph glyph;
        OpenTypeParser.HeaderTable head = this.fontParser.getHeadTable();
        OpenTypeParser.HorizontalHeader hhea = this.fontParser.getHheaTable();
        OpenTypeParser.WindowsMetrics os_22 = this.fontParser.getOs_2Table();
        OpenTypeParser.PostTable post = this.fontParser.getPostTable();
        this.isFontSpecific = this.fontParser.getCmapTable().fontSpecific;
        this.kerning = this.fontParser.readKerning(head.unitsPerEm);
        this.bBoxes = this.fontParser.readBbox(head.unitsPerEm);
        this.fontNames = this.fontParser.getFontNames();
        this.fontMetrics.setUnitsPerEm(head.unitsPerEm);
        this.fontMetrics.updateBbox(head.xMin, head.yMin, head.xMax, head.yMax);
        this.fontMetrics.setNumberOfGlyphs(this.fontParser.readNumGlyphs());
        this.fontMetrics.setGlyphWidths(this.fontParser.getGlyphWidthsByIndex());
        this.fontMetrics.setTypoAscender(os_22.sTypoAscender);
        this.fontMetrics.setTypoDescender(os_22.sTypoDescender);
        this.fontMetrics.setCapHeight(os_22.sCapHeight);
        this.fontMetrics.setXHeight(os_22.sxHeight);
        this.fontMetrics.setItalicAngle(post.italicAngle);
        this.fontMetrics.setAscender(hhea.Ascender);
        this.fontMetrics.setDescender(hhea.Descender);
        this.fontMetrics.setLineGap(hhea.LineGap);
        this.fontMetrics.setWinAscender(os_22.usWinAscent);
        this.fontMetrics.setWinDescender(os_22.usWinDescent);
        this.fontMetrics.setAdvanceWidthMax(hhea.advanceWidthMax);
        this.fontMetrics.setUnderlinePosition((post.underlinePosition - post.underlineThickness) / 2);
        this.fontMetrics.setUnderlineThickness(post.underlineThickness);
        this.fontMetrics.setStrikeoutPosition(os_22.yStrikeoutPosition);
        this.fontMetrics.setStrikeoutSize(os_22.yStrikeoutSize);
        this.fontMetrics.setSubscriptOffset(-os_22.ySubscriptYOffset);
        this.fontMetrics.setSubscriptSize(os_22.ySubscriptYSize);
        this.fontMetrics.setSuperscriptOffset(os_22.ySuperscriptYOffset);
        this.fontMetrics.setSuperscriptSize(os_22.ySuperscriptYSize);
        this.fontMetrics.setIsFixedPitch(post.isFixedPitch);
        String[][] ttfVersion = this.fontNames.getNames(5);
        char c = 0;
        if (ttfVersion != null) {
            this.fontIdentification.setTtfVersion(ttfVersion[0][3]);
        }
        String[][] ttfUniqueId = this.fontNames.getNames(3);
        if (ttfUniqueId != null) {
            this.fontIdentification.setTtfVersion(ttfUniqueId[0][3]);
        }
        byte[] pdfPanose = new byte[12];
        pdfPanose[1] = (byte) os_22.sFamilyClass;
        pdfPanose[0] = (byte) (os_22.sFamilyClass >> 8);
        System.arraycopy(os_22.panose, 0, pdfPanose, 2, 10);
        this.fontIdentification.setPanose(pdfPanose);
        Map<Integer, int[]> cmap = getActiveCmap();
        int[] glyphWidths = this.fontParser.getGlyphWidthsByIndex();
        int numOfGlyphs = this.fontMetrics.getNumberOfGlyphs();
        this.unicodeToGlyph = new LinkedHashMap(cmap.size());
        this.codeToGlyph = new LinkedHashMap(numOfGlyphs);
        this.avgWidth = 0;
        CFFFontSubset cffFontSubset = null;
        if (isCff()) {
            cffFontSubset = new CFFFontSubset(getFontStreamBytes());
        }
        for (Integer num : cmap.keySet()) {
            int charCode = num.intValue();
            int index = cmap.get(Integer.valueOf(charCode))[c];
            if (index >= numOfGlyphs) {
                Logger LOGGER = LoggerFactory.getLogger(TrueTypeFont.class);
                LOGGER.warn(MessageFormatUtil.format(IoLogMessageConstant.FONT_HAS_INVALID_GLYPH, getFontNames().getFontName(), Integer.valueOf(index)));
                hhea = hhea;
                head = head;
                c = 0;
            } else {
                OpenTypeParser.HeaderTable head2 = head;
                OpenTypeParser.HorizontalHeader hhea2 = hhea;
                int[] glyphBBox = this.bBoxes != null ? this.bBoxes[index] : null;
                if (cffFontSubset == null || !cffFontSubset.isCID()) {
                    os_2 = os_22;
                    cid = index;
                    glyph = new Glyph(cid, glyphWidths[index], charCode, glyphBBox);
                } else {
                    cid = cffFontSubset.getCidForGlyphId(index);
                    os_2 = os_22;
                    GidAwareGlyph cffGlyph = new GidAwareGlyph(cid, glyphWidths[index], charCode, glyphBBox);
                    cffGlyph.setGid(index);
                    glyph = cffGlyph;
                }
                this.unicodeToGlyph.put(Integer.valueOf(charCode), glyph);
                if (!this.codeToGlyph.containsKey(Integer.valueOf(cid))) {
                    this.codeToGlyph.put(Integer.valueOf(cid), glyph);
                }
                this.avgWidth += glyph.getWidth();
                hhea = hhea2;
                head = head2;
                os_22 = os_2;
                c = 0;
            }
        }
        fixSpaceIssue();
        for (int index2 = 0; index2 < glyphWidths.length; index2++) {
            if (!this.codeToGlyph.containsKey(Integer.valueOf(index2))) {
                Glyph glyph2 = new Glyph(index2, glyphWidths[index2], -1);
                this.codeToGlyph.put(Integer.valueOf(index2), glyph2);
                this.avgWidth += glyph2.getWidth();
            }
        }
        if (this.codeToGlyph.size() != 0) {
            this.avgWidth /= this.codeToGlyph.size();
        }
        readGdefTable();
        readGsubTable();
        readGposTable();
        this.isVertical = false;
    }

    public String[] getCodePagesSupported() {
        long cp = (this.fontParser.getOs_2Table().ulCodePageRange2 << 32) + (this.fontParser.getOs_2Table().ulCodePageRange1 & 4294967295L);
        int count = 0;
        long bit = 1;
        for (int k = 0; k < 64; k++) {
            if ((cp & bit) != 0 && TrueTypeCodePages.get(k) != null) {
                count++;
            }
            bit <<= 1;
        }
        String[] ret = new String[count];
        int count2 = 0;
        long bit2 = 1;
        for (int k2 = 0; k2 < 64; k2++) {
            if ((cp & bit2) != 0 && TrueTypeCodePages.get(k2) != null) {
                ret[count2] = TrueTypeCodePages.get(k2);
                count2++;
            }
            bit2 <<= 1;
        }
        return ret;
    }

    @Override // com.itextpdf.io.font.FontProgram
    public boolean isBuiltWith(String fontProgram) {
        return Objects.equals(this.fontParser.fileName, fontProgram);
    }

    public void close() throws IOException {
        if (this.fontParser != null) {
            this.fontParser.close();
        }
        this.fontParser = null;
    }

    public void updateUsedGlyphs(SortedSet<Integer> usedGlyphs, boolean subset, List<int[]> subsetRanges) {
        int[] compactRange;
        if (subsetRanges != null) {
            compactRange = toCompactRange(subsetRanges);
        } else if (!subset) {
            compactRange = new int[]{0, 65535};
        } else {
            compactRange = new int[0];
        }
        for (int k = 0; k < compactRange.length; k += 2) {
            int from = compactRange[k];
            int to = compactRange[k + 1];
            for (int glyphId = from; glyphId <= to; glyphId++) {
                if (getGlyphByCode(glyphId) != null) {
                    usedGlyphs.add(Integer.valueOf(glyphId));
                }
            }
        }
    }

    private static int[] toCompactRange(List<int[]> ranges) {
        List<int[]> simp = new ArrayList<>();
        for (int[] range : ranges) {
            for (int j = 0; j < range.length; j += 2) {
                simp.add(new int[]{Math.max(0, Math.min(range[j], range[j + 1])), Math.min(65535, Math.max(range[j], range[j + 1]))});
            }
        }
        for (int k1 = 0; k1 < simp.size() - 1; k1++) {
            int k2 = k1 + 1;
            while (k2 < simp.size()) {
                int[] r1 = simp.get(k1);
                int[] r2 = simp.get(k2);
                if ((r1[0] >= r2[0] && r1[0] <= r2[1]) || (r1[1] >= r2[0] && r1[0] <= r2[1])) {
                    r1[0] = Math.min(r1[0], r2[0]);
                    r1[1] = Math.max(r1[1], r2[1]);
                    simp.remove(k2);
                    k2--;
                }
                k2++;
            }
        }
        int k12 = simp.size();
        int[] s = new int[k12 * 2];
        for (int k = 0; k < simp.size(); k++) {
            int[] r = simp.get(k);
            s[k * 2] = r[0];
            s[(k * 2) + 1] = r[1];
        }
        return s;
    }
}
