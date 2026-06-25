package com.itextpdf.io.font.woff2;
/* loaded from: classes12.dex */
class Woff2Common {
    public static final int kSfntEntrySize = 16;
    public static final int kSfntHeaderSize = 12;
    public static final int kTtcFontFlavor = 1953784678;
    public static final int kWoff2FlagsTransform = 256;
    public static final int kWoff2Signature = 2001684018;

    Woff2Common() {
    }

    /* loaded from: classes12.dex */
    public static class Point {
        public boolean on_curve;
        public int x;
        public int y;

        public Point(int x, int y, boolean on_curve) {
            this.x = x;
            this.y = y;
            this.on_curve = on_curve;
        }
    }

    /* loaded from: classes12.dex */
    public static class Table implements Comparable<Table> {
        public int dst_length;
        public int dst_offset;
        public int flags;
        public int src_length;
        public int src_offset;
        public int tag;
        public int transform_length;

        @Override // java.lang.Comparable
        public int compareTo(Table o) {
            return JavaUnsignedUtil.compareAsUnsigned(this.tag, o.tag);
        }
    }

    public static int collectionHeaderSize(int header_version, int num_fonts) {
        int size = 0;
        if (header_version == 131072) {
            size = 0 + 12;
        }
        if (header_version == 65536 || header_version == 131072) {
            return size + (num_fonts * 4) + 12;
        }
        return size;
    }

    public static int computeULongSum(byte[] buf, int offset, int size) {
        int checksum = 0;
        int aligned_size = size & (-4);
        for (int i = 0; i < aligned_size; i += 4) {
            checksum += (JavaUnsignedUtil.asU8(buf[offset + i]) << 24) | (JavaUnsignedUtil.asU8(buf[(offset + i) + 1]) << 16) | (JavaUnsignedUtil.asU8(buf[(offset + i) + 2]) << 8) | JavaUnsignedUtil.asU8(buf[offset + i + 3]);
        }
        if (size != aligned_size) {
            int v = 0;
            for (int i2 = aligned_size; i2 < size; i2++) {
                v |= JavaUnsignedUtil.asU8(buf[offset + i2]) << (24 - ((i2 & 3) * 8));
            }
            return checksum + v;
        }
        return checksum;
    }
}
