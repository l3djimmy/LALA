package com.itextpdf.io.font;

import com.itextpdf.io.font.cmap.CMapCidToCodepoint;
import com.itextpdf.io.font.cmap.CMapCodepointToCid;
import com.itextpdf.io.font.cmap.CMapLocationFromBytes;
import com.itextpdf.io.font.cmap.CMapParser;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.io.source.ByteBuffer;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class CMapEncoding {
    private static final List<byte[]> IDENTITY_H_V_CODESPACE_RANGES = Arrays.asList(new byte[]{0, 0}, new byte[]{-1, -1});
    private CMapCidToCodepoint cid2Code;
    private final String cmap;
    private CMapCodepointToCid code2Cid;
    private List<byte[]> codeSpaceRanges;
    private boolean isDirect;
    private String uniMap;

    public CMapEncoding(String cmap) {
        this.cmap = cmap;
        if (cmap.equals(PdfEncodings.IDENTITY_H) || cmap.equals(PdfEncodings.IDENTITY_V)) {
            this.isDirect = true;
        }
        this.codeSpaceRanges = IDENTITY_H_V_CODESPACE_RANGES;
    }

    public CMapEncoding(String cmap, String uniMap) {
        this.cmap = cmap;
        this.uniMap = uniMap;
        if (cmap.equals(PdfEncodings.IDENTITY_H) || cmap.equals(PdfEncodings.IDENTITY_V)) {
            this.isDirect = true;
            this.codeSpaceRanges = IDENTITY_H_V_CODESPACE_RANGES;
            return;
        }
        this.cid2Code = CjkResourceLoader.getCidToCodepointCmap(cmap);
        this.code2Cid = getCodeToCidCmap(cmap, this.cid2Code);
        this.codeSpaceRanges = this.cid2Code.getCodeSpaceRanges();
    }

    public CMapEncoding(String cmap, byte[] cmapBytes) {
        this.cmap = cmap;
        this.cid2Code = new CMapCidToCodepoint();
        try {
            CMapParser.parseCid(cmap, this.cid2Code, new CMapLocationFromBytes(cmapBytes));
            this.code2Cid = getCodeToCidCmap(cmap, this.cid2Code);
            this.codeSpaceRanges = this.cid2Code.getCodeSpaceRanges();
        } catch (IOException e) {
            LoggerFactory.getLogger(getClass()).error(IoLogMessageConstant.FAILED_TO_PARSE_ENCODING_STREAM);
        }
    }

    public boolean isDirect() {
        return this.isDirect;
    }

    public boolean hasUniMap() {
        return this.uniMap != null && this.uniMap.length() > 0;
    }

    public String getRegistry() {
        if (isDirect()) {
            return "Adobe";
        }
        return this.cid2Code.getRegistry();
    }

    public String getOrdering() {
        if (isDirect()) {
            return "Identity";
        }
        return this.cid2Code.getOrdering();
    }

    public int getSupplement() {
        if (isDirect()) {
            return 0;
        }
        return this.cid2Code.getSupplement();
    }

    public String getUniMapName() {
        return this.uniMap;
    }

    public String getCmapName() {
        return this.cmap;
    }

    public boolean isBuiltWith(String cmap) {
        return Objects.equals(cmap, this.cmap);
    }

    public byte[] getCmapBytes(int cid) {
        int length = getCmapBytesLength(cid);
        byte[] result = new byte[length];
        fillCmapBytes(cid, result, 0);
        return result;
    }

    public int fillCmapBytes(int cid, byte[] array, int offset) {
        if (this.isDirect) {
            int offset2 = offset + 1;
            array[offset] = (byte) ((65280 & cid) >> 8);
            int offset3 = offset2 + 1;
            array[offset2] = (byte) (cid & 255);
            return offset3;
        }
        byte[] bytes = this.cid2Code.lookup(cid);
        int i = 0;
        while (i < bytes.length) {
            array[offset] = bytes[i];
            i++;
            offset++;
        }
        return offset;
    }

    public void fillCmapBytes(int cid, ByteBuffer buffer) {
        if (this.isDirect) {
            buffer.append((byte) ((65280 & cid) >> 8));
            buffer.append((byte) (cid & 255));
            return;
        }
        byte[] bytes = this.cid2Code.lookup(cid);
        buffer.append(bytes);
    }

    public int getCmapBytesLength(int cid) {
        if (this.isDirect) {
            return 2;
        }
        return this.cid2Code.lookup(cid).length;
    }

    public int getCidCode(int cmapCode) {
        if (this.isDirect) {
            return cmapCode;
        }
        return this.code2Cid.lookup(cmapCode);
    }

    public List<byte[]> getCodeSpaceRanges() {
        return this.codeSpaceRanges;
    }

    private static CMapCodepointToCid getCodeToCidCmap(String cmap, CMapCidToCodepoint cid2Code) {
        try {
            return CjkResourceLoader.getCodepointToCidCmap(cmap);
        } catch (com.itextpdf.io.exceptions.IOException e) {
            return new CMapCodepointToCid(cid2Code);
        }
    }
}
