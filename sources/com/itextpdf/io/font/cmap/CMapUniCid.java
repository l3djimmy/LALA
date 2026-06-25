package com.itextpdf.io.font.cmap;

import com.itextpdf.io.util.IntHashtable;
import com.itextpdf.io.util.TextUtil;
/* loaded from: classes12.dex */
public class CMapUniCid extends AbstractCMap {
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
            this.map.put(codePoint, ((Integer) code.getValue()).intValue());
        }
    }

    public int lookup(int character) {
        return this.map.get(character);
    }

    public CMapToUnicode exportToUnicode() {
        CMapToUnicode uni = new CMapToUnicode();
        int[] keys = this.map.toOrderedKeys();
        for (int key : keys) {
            uni.addChar(this.map.get(key), TextUtil.convertFromUtf32(key));
        }
        int spaceCid = lookup(32);
        if (spaceCid != 0) {
            uni.addChar(spaceCid, TextUtil.convertFromUtf32(32));
        }
        return uni;
    }

    public int[] getCodePoints() {
        return this.map.getKeys();
    }
}
