package com.itextpdf.io.font.cmap;

import com.itextpdf.io.exceptions.IOException;
import java.util.ArrayList;
import java.util.List;
import kotlin.UByte;
/* loaded from: classes12.dex */
public class CMapByteCid extends AbstractCMap {
    private List<int[]> planes = new ArrayList();

    /* JADX INFO: Access modifiers changed from: protected */
    /* loaded from: classes12.dex */
    public static class Cursor {
        public int length;
        public int offset;

        public Cursor(int offset, int length) {
            this.offset = offset;
            this.length = length;
        }
    }

    public CMapByteCid() {
        this.planes.add(new int[256]);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.itextpdf.io.font.cmap.AbstractCMap
    public void addChar(String mark, CMapObject code) {
        if (code.isNumber()) {
            encodeSequence(decodeStringToByte(mark), ((Integer) code.getValue()).intValue());
        }
    }

    public String decodeSequence(byte[] cidBytes, int offset, int length) {
        StringBuilder sb = new StringBuilder();
        Cursor cursor = new Cursor(offset, length);
        while (true) {
            int cid = decodeSingle(cidBytes, cursor);
            if (cid >= 0) {
                sb.append((char) cid);
            } else {
                return sb.toString();
            }
        }
    }

    protected int decodeSingle(byte[] cidBytes, Cursor cursor) {
        int end = cursor.offset + cursor.length;
        int currentPlane = 0;
        while (cursor.offset < end) {
            int i = cursor.offset;
            cursor.offset = i + 1;
            int one = cidBytes[i] & UByte.MAX_VALUE;
            cursor.length--;
            int[] plane = this.planes.get(currentPlane);
            int cid = plane[one];
            if ((32768 & cid) == 0) {
                return cid;
            }
            currentPlane = cid & 32767;
        }
        return -1;
    }

    private void encodeSequence(byte[] seq, int cid) {
        int size = seq.length - 1;
        int nextPlane = 0;
        int idx = 0;
        while (true) {
            List<int[]> list = this.planes;
            if (idx < size) {
                int[] plane = list.get(nextPlane);
                int one = seq[idx] & UByte.MAX_VALUE;
                int c = plane[one];
                if (c != 0 && (c & 32768) == 0) {
                    throw new IOException("Inconsistent mapping.");
                }
                if (c == 0) {
                    this.planes.add(new int[256]);
                    c = (this.planes.size() - 1) | 32768;
                    plane[one] = c;
                }
                nextPlane = c & 32767;
                idx++;
            } else {
                int[] plane2 = list.get(nextPlane);
                int one2 = seq[size] & UByte.MAX_VALUE;
                if ((32768 & plane2[one2]) != 0) {
                    throw new IOException("Inconsistent mapping.");
                }
                plane2[one2] = cid;
                return;
            }
        }
    }
}
