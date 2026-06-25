package com.itextpdf.io.font.cmap;

import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.io.util.IntHashtable;
import com.itextpdf.io.util.TextUtil;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.UByte;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class CMapToUnicode extends AbstractCMap {
    public static CMapToUnicode EmptyCMapToUnicodeMap = new CMapToUnicode(true);
    private final Map<Integer, char[]> byteMappings;
    private final List<byte[]> codeSpaceRanges;

    private CMapToUnicode(boolean emptyCMap) {
        this.codeSpaceRanges = new ArrayList();
        this.byteMappings = Collections.emptyMap();
    }

    public CMapToUnicode() {
        this.codeSpaceRanges = new ArrayList();
        this.byteMappings = new HashMap();
    }

    public static CMapToUnicode getIdentity() {
        CMapToUnicode uni = new CMapToUnicode();
        for (int i = 0; i < 65537; i++) {
            uni.addChar(i, TextUtil.convertFromUtf32(i));
        }
        uni.addCodeSpaceRange(new byte[]{0, 0}, new byte[]{-1, -1});
        return uni;
    }

    public boolean hasByteMappings() {
        return this.byteMappings.size() != 0;
    }

    public char[] lookup(byte[] code, int offset, int length) {
        if (length == 1) {
            int key = code[offset] & UByte.MAX_VALUE;
            char[] result = this.byteMappings.get(Integer.valueOf(key));
            return result;
        } else if (length != 2) {
            return null;
        } else {
            int intKey = code[offset] & UByte.MAX_VALUE;
            char[] result2 = this.byteMappings.get(Integer.valueOf((intKey << 8) + (code[offset + 1] & UByte.MAX_VALUE)));
            return result2;
        }
    }

    public char[] lookup(byte[] code) {
        return lookup(code, 0, code.length);
    }

    public char[] lookup(int code) {
        return this.byteMappings.get(Integer.valueOf(code));
    }

    public Set<Integer> getCodes() {
        return this.byteMappings.keySet();
    }

    public IntHashtable createDirectMapping() {
        IntHashtable result = new IntHashtable();
        for (Map.Entry<Integer, char[]> entry : this.byteMappings.entrySet()) {
            if (entry.getValue().length == 1) {
                result.put(entry.getKey().intValue(), convertToInt(entry.getValue()));
            }
        }
        return result;
    }

    public Map<Integer, Integer> createReverseMapping() {
        Map<Integer, Integer> result = new HashMap<>();
        for (Map.Entry<Integer, char[]> entry : this.byteMappings.entrySet()) {
            if (entry.getValue().length == 1) {
                result.put(Integer.valueOf(convertToInt(entry.getValue())), entry.getKey());
            }
        }
        return result;
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

    private int convertToInt(char[] s) {
        int value = 0;
        for (int i = 0; i < s.length - 1; i++) {
            value = (value + s[i]) << 8;
        }
        int i2 = s.length;
        return value + s[i2 - 1];
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void addChar(int cid, char[] uni) {
        this.byteMappings.put(Integer.valueOf(cid), uni);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.itextpdf.io.font.cmap.AbstractCMap
    public void addChar(String mark, CMapObject code) {
        if (mark.length() == 1) {
            char[] dest = createCharsFromDoubleBytes((byte[]) code.getValue());
            this.byteMappings.put(Integer.valueOf(mark.charAt(0)), dest);
        } else if (mark.length() == 2) {
            char[] dest2 = createCharsFromDoubleBytes((byte[]) code.getValue());
            this.byteMappings.put(Integer.valueOf((mark.charAt(0) << '\b') + mark.charAt(1)), dest2);
        } else {
            Logger logger = LoggerFactory.getLogger(CMapToUnicode.class);
            logger.warn(IoLogMessageConstant.TOUNICODE_CMAP_MORE_THAN_2_BYTES_NOT_SUPPORTED);
        }
    }

    private char[] createCharsFromSingleBytes(byte[] bytes) {
        if (bytes.length == 1) {
            return new char[]{(char) (bytes[0] & UByte.MAX_VALUE)};
        }
        char[] chars = new char[bytes.length];
        for (int i = 0; i < bytes.length; i++) {
            chars[i] = (char) (bytes[i] & UByte.MAX_VALUE);
        }
        return chars;
    }

    private char[] createCharsFromDoubleBytes(byte[] bytes) {
        char[] chars = new char[bytes.length / 2];
        for (int i = 0; i < bytes.length; i += 2) {
            chars[i / 2] = (char) (((bytes[i] & UByte.MAX_VALUE) << 8) + (bytes[i + 1] & UByte.MAX_VALUE));
        }
        return chars;
    }
}
