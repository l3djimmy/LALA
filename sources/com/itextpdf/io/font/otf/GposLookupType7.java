package com.itextpdf.io.font.otf;

import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.font.otf.OpenTableLookup;
import com.itextpdf.io.font.otf.lookuptype7.PosTableLookup7Format2;
import com.itextpdf.io.logs.IoLogMessageConstant;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class GposLookupType7 extends OpenTableLookup {
    private static final Logger LOGGER = LoggerFactory.getLogger(GposLookupType7.class);
    protected List<ContextualTable<ContextualPositionRule>> subTables;

    public GposLookupType7(OpenTypeFontTableReader openReader, int lookupFlag, int[] subTableLocations) throws IOException {
        super(openReader, lookupFlag, subTableLocations);
        this.subTables = new ArrayList();
        readSubTables();
    }

    @Override // com.itextpdf.io.font.otf.OpenTableLookup
    public boolean transformOne(GlyphLine line) {
        boolean changed = false;
        int oldLineStart = line.start;
        int oldLineEnd = line.end;
        int initialLineIndex = line.idx;
        for (ContextualTable<ContextualPositionRule> subTable : this.subTables) {
            ContextualPositionRule contextRule = subTable.getMatchingContextRule(line);
            if (contextRule != null) {
                int lineEndBeforeTransformations = line.end;
                PosLookupRecord[] posLookupRecords = contextRule.getPosLookupRecords();
                OpenTableLookup.GlyphIndexer gidx = new OpenTableLookup.GlyphIndexer();
                gidx.line = line;
                for (PosLookupRecord posRecord : posLookupRecords) {
                    gidx.idx = initialLineIndex;
                    int i = 0;
                    while (i < posRecord.sequenceIndex) {
                        gidx.nextGlyph(this.openReader, this.lookupFlag);
                        i++;
                        changed = changed;
                    }
                    boolean changed2 = changed;
                    line.idx = gidx.idx;
                    OpenTableLookup lookupTable = this.openReader.getLookupTable(posRecord.lookupListIndex);
                    changed = lookupTable.transformOne(line) || changed2;
                }
                boolean changed3 = changed;
                line.idx = line.end;
                line.start = oldLineStart;
                int lenDelta = lineEndBeforeTransformations - line.end;
                line.end = oldLineEnd - lenDelta;
                return changed3;
            }
        }
        line.idx++;
        return false;
    }

    @Override // com.itextpdf.io.font.otf.OpenTableLookup
    protected void readSubTable(int subTableLocation) throws IOException {
        this.openReader.rf.seek(subTableLocation);
        int substFormat = this.openReader.rf.readShort();
        switch (substFormat) {
            case 1:
            case 3:
                LOGGER.warn(MessageFormatUtil.format(IoLogMessageConstant.GPOS_LOOKUP_SUBTABLE_FORMAT_NOT_SUPPORTED, Integer.valueOf(substFormat), 7));
                return;
            case 2:
                readSubTableFormat2(subTableLocation);
                return;
            default:
                throw new IllegalArgumentException("Bad subtable format identifier: " + substFormat);
        }
    }

    protected void readSubTableFormat2(int subTableLocation) throws IOException {
        int coverageOffset = this.openReader.rf.readUnsignedShort();
        int classDefOffset = this.openReader.rf.readUnsignedShort();
        int posClassSetCount = this.openReader.rf.readUnsignedShort();
        int[] posClassSetOffsets = this.openReader.readUShortArray(posClassSetCount, subTableLocation);
        Set<Integer> coverageGlyphIds = new HashSet<>(this.openReader.readCoverageFormat(subTableLocation + coverageOffset));
        OtfClass classDefinition = this.openReader.readClassDefinition(subTableLocation + classDefOffset);
        PosTableLookup7Format2 t = new PosTableLookup7Format2(this.openReader, this.lookupFlag, coverageGlyphIds, classDefinition);
        List<List<ContextualPositionRule>> subClassSets = new ArrayList<>(posClassSetCount);
        int i = 0;
        while (i < posClassSetCount) {
            List<ContextualPositionRule> subClassSet = null;
            if (posClassSetOffsets[i] != 0) {
                this.openReader.rf.seek(posClassSetOffsets[i]);
                int posClassRuleCount = this.openReader.rf.readUnsignedShort();
                int[] posClassRuleOffsets = this.openReader.readUShortArray(posClassRuleCount, posClassSetOffsets[i]);
                subClassSet = new ArrayList<>(posClassRuleCount);
                int j = 0;
                while (j < posClassRuleCount) {
                    int coverageOffset2 = coverageOffset;
                    this.openReader.rf.seek(posClassRuleOffsets[j]);
                    int glyphCount = this.openReader.rf.readUnsignedShort();
                    int posCount = this.openReader.rf.readUnsignedShort();
                    int[] inputClassIds = this.openReader.readUShortArray(glyphCount - 1);
                    PosLookupRecord[] posLookupRecords = this.openReader.readPosLookupRecords(posCount);
                    ContextualPositionRule rule = new PosTableLookup7Format2.PosRuleFormat2(t, inputClassIds, posLookupRecords);
                    subClassSet.add(rule);
                    j++;
                    coverageOffset = coverageOffset2;
                }
            }
            subClassSets.add(subClassSet);
            i++;
            coverageOffset = coverageOffset;
        }
        t.setPosClassSets(subClassSets);
        this.subTables.add(t);
    }
}
