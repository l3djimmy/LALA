package com.itextpdf.io.font.cmap;

import com.itextpdf.io.util.IntHashtable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import kotlin.UByte;
/* loaded from: classes12.dex */
public class CMapCidToCodepoint extends AbstractCMap {
    private static final byte[] EMPTY = new byte[0];
    private final Map<Integer, byte[]> map = new HashMap();
    private final List<byte[]> codeSpaceRanges = new ArrayList();

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.itextpdf.io.font.cmap.AbstractCMap
    public void addChar(String mark, CMapObject code) {
        if (code.isNumber()) {
            byte[] ser = decodeStringToByte(mark);
            this.map.put(Integer.valueOf(((Integer) code.getValue()).intValue()), ser);
        }
    }

    public byte[] lookup(int cid) {
        byte[] ser = this.map.get(Integer.valueOf(cid));
        if (ser == null) {
            return EMPTY;
        }
        return ser;
    }

    public IntHashtable getReversMap() {
        IntHashtable code2cid = new IntHashtable(this.map.size());
        for (Map.Entry<Integer, byte[]> entry : this.map.entrySet()) {
            byte[] bytes = entry.getValue();
            int byteCode = 0;
            for (byte b : bytes) {
                byteCode = (byteCode << 8) + (b & UByte.MAX_VALUE);
            }
            code2cid.put(byteCode, entry.getKey().intValue());
        }
        return code2cid;
    }

    public List<byte[]> getCodeSpaceRanges() {
        return this.codeSpaceRanges;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.itextpdf.io.font.cmap.AbstractCMap
    public void addCodeSpaceRange(byte[] low, byte[] high) {
        this.codeSpaceRanges.add(low);
        this.codeSpaceRanges.add(high);
    }
}
