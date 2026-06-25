package com.itextpdf.io.font.cmap;

import com.itextpdf.io.util.IntHashtable;
import com.itextpdf.io.util.TextUtil;
/* loaded from: classes12.dex */
public class CMapCidUni extends AbstractCMap {
    private IntHashtable map = new IntHashtable(65537);

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.itextpdf.io.font.cmap.AbstractCMap
    public void addChar(String mark, CMapObject code) {
        int codePoint;
        if (code.isNumber()) {
            String s = toUnicodeString(mark, true);
            if (TextUtil.isSurrogatePair(s, 0)) {
                codePoint = TextUtil.convertToUtf32(s, 0);
            } else {
                codePoint = s.charAt(0);
            }
            this.map.put(((Integer) code.getValue()).intValue(), codePoint);
        }
    }

    public int lookup(int character) {
        return this.map.get(character);
    }

    public int[] getCids() {
        return this.map.getKeys();
    }
}
