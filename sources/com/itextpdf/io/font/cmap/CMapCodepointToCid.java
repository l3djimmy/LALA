package com.itextpdf.io.font.cmap;

import com.itextpdf.io.util.IntHashtable;
import kotlin.UByte;
/* loaded from: classes12.dex */
public class CMapCodepointToCid extends AbstractCMap {
    private final IntHashtable map;

    public CMapCodepointToCid() {
        this.map = new IntHashtable();
    }

    public CMapCodepointToCid(CMapCidToCodepoint reverseMap) {
        this.map = reverseMap.getReversMap();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.itextpdf.io.font.cmap.AbstractCMap
    public void addChar(String mark, CMapObject code) {
        if (code.isNumber()) {
            byte[] ser = decodeStringToByte(mark);
            int byteCode = 0;
            for (byte b : ser) {
                byteCode = (byteCode << 8) + (b & UByte.MAX_VALUE);
            }
            this.map.put(byteCode, ((Integer) code.getValue()).intValue());
        }
    }

    public int lookup(int codepoint) {
        return this.map.get(codepoint);
    }
}
