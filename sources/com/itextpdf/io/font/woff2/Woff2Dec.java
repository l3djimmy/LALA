package com.itextpdf.io.font.woff2;

import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.codec.brotli.dec.BrotliInputStream;
import com.itextpdf.io.exceptions.FontCompressionException;
import com.itextpdf.io.exceptions.IoExceptionMessageConstant;
import com.itextpdf.io.font.woff2.Woff2Common;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes12.dex */
public class Woff2Dec {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private static final int FLAG_ARG_1_AND_2_ARE_WORDS = 1;
    private static final int FLAG_MORE_COMPONENTS = 32;
    private static final int FLAG_WE_HAVE_AN_X_AND_Y_SCALE = 64;
    private static final int FLAG_WE_HAVE_A_SCALE = 8;
    private static final int FLAG_WE_HAVE_A_TWO_BY_TWO = 128;
    private static final int FLAG_WE_HAVE_INSTRUCTIONS = 256;
    private static final int kDefaultGlyphBuf = 5120;
    private static final int kEndPtsOfContoursOffset = 10;
    private static final int kGlyfOnCurve = 1;
    private static final int kGlyfRepeat = 8;
    private static final int kGlyfThisXIsSame = 16;
    private static final int kGlyfThisYIsSame = 32;
    private static final int kGlyfXShort = 2;
    private static final int kGlyfYShort = 4;
    private static final float kMaxPlausibleCompressionRatio = 100.0f;

    Woff2Dec() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class TtcFont {
        public int dst_offset;
        public int flavor;
        public int header_checksum;
        public short[] table_indices;

        private TtcFont() {
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class Woff2Header {
        public int compressed_length;
        public int compressed_offset;
        public int flavor;
        public int header_version;
        public short num_tables;
        public Woff2Common.Table[] tables;
        public TtcFont[] ttc_fonts;
        public int uncompressed_size;

        private Woff2Header() {
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class Woff2FontInfo {
        public short index_format;
        public short num_glyphs;
        public short num_hmetrics;
        public Map<Integer, Integer> table_entry_by_tag;
        public short[] x_mins;

        private Woff2FontInfo() {
            this.table_entry_by_tag = new HashMap();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class RebuildMetadata {
        Map<TableChecksumInfo, Integer> checksums;
        Woff2FontInfo[] font_infos;
        int header_checksum;

        private RebuildMetadata() {
            this.checksums = new HashMap();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class TableChecksumInfo {
        public int offset;
        public int tag;

        public TableChecksumInfo(int tag, int offset) {
            this.tag = tag;
            this.offset = offset;
        }

        public int hashCode() {
            return (new Integer(this.tag).hashCode() * 13) + new Integer(this.offset).hashCode();
        }

        public boolean equals(Object o) {
            if (this == o) {
                return true;
            }
            if (o instanceof TableChecksumInfo) {
                TableChecksumInfo info = (TableChecksumInfo) o;
                return this.tag == info.tag && this.offset == info.offset;
            }
            return false;
        }
    }

    private static int withSign(int flag, int baseval) {
        return (flag & 1) != 0 ? baseval : -baseval;
    }

    private static int tripletDecode(byte[] data, int flags_in_offset, int in_offset, int in_size, int n_points, Woff2Common.Point[] result) {
        int n_data_bytes;
        int dx;
        int dy;
        int x = 0;
        int y = 0;
        if (n_points > in_size) {
            throw new FontCompressionException(IoExceptionMessageConstant.RECONSTRUCT_GLYPH_FAILED);
        }
        int triplet_index = 0;
        for (int i = 0; i < n_points; i++) {
            int flag = JavaUnsignedUtil.asU8(data[i + flags_in_offset]);
            boolean on_curve = (flag >> 7) == 0;
            int flag2 = flag & 127;
            if (flag2 < 84) {
                n_data_bytes = 1;
            } else if (flag2 < 120) {
                n_data_bytes = 2;
            } else if (flag2 < 124) {
                n_data_bytes = 3;
            } else {
                n_data_bytes = 4;
            }
            if (triplet_index + n_data_bytes > in_size || triplet_index + n_data_bytes < triplet_index) {
                throw new FontCompressionException(IoExceptionMessageConstant.RECONSTRUCT_GLYPH_FAILED);
            }
            if (flag2 < 10) {
                dx = 0;
                dy = withSign(flag2, ((flag2 & 14) << 7) + JavaUnsignedUtil.asU8(data[in_offset + triplet_index]));
            } else if (flag2 < 20) {
                dx = withSign(flag2, (((flag2 - 10) & 14) << 7) + JavaUnsignedUtil.asU8(data[in_offset + triplet_index]));
                dy = 0;
            } else if (flag2 < 84) {
                int b0 = flag2 - 20;
                int b1 = JavaUnsignedUtil.asU8(data[in_offset + triplet_index]);
                int dx2 = withSign(flag2, (b0 & 48) + 1 + (b1 >> 4));
                dy = withSign(flag2 >> 1, ((b0 & 12) << 2) + 1 + (b1 & 15));
                dx = dx2;
            } else if (flag2 >= 120) {
                if (flag2 < 124) {
                    int b2 = JavaUnsignedUtil.asU8(data[in_offset + triplet_index + 1]);
                    int dx3 = withSign(flag2, (JavaUnsignedUtil.asU8(data[in_offset + triplet_index]) << 4) + (b2 >> 4));
                    dy = withSign(flag2 >> 1, ((b2 & 15) << 8) + JavaUnsignedUtil.asU8(data[in_offset + triplet_index + 2]));
                    dx = dx3;
                } else {
                    int dx4 = in_offset + triplet_index;
                    dx = withSign(flag2, (JavaUnsignedUtil.asU8(data[dx4]) << 8) + JavaUnsignedUtil.asU8(data[in_offset + triplet_index + 1]));
                    dy = withSign(flag2 >> 1, (JavaUnsignedUtil.asU8(data[(in_offset + triplet_index) + 2]) << 8) + JavaUnsignedUtil.asU8(data[in_offset + triplet_index + 3]));
                }
            } else {
                int b02 = flag2 - 84;
                int dx5 = withSign(flag2, ((b02 / 12) << 8) + 1 + JavaUnsignedUtil.asU8(data[in_offset + triplet_index]));
                dy = withSign(flag2 >> 1, (((b02 % 12) >> 2) << 8) + 1 + JavaUnsignedUtil.asU8(data[in_offset + triplet_index + 1]));
                dx = dx5;
            }
            triplet_index += n_data_bytes;
            x += dx;
            y += dy;
            result[i] = new Woff2Common.Point(x, y, on_curve);
        }
        return triplet_index;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r15v6, types: [boolean] */
    private static int storePoints(int n_points, Woff2Common.Point[] points, int n_contours, int instruction_length, byte[] dst, int dst_size) {
        int flag;
        int flag2;
        int flag_offset = (n_contours * 2) + 10 + 2 + instruction_length;
        int last_flag = 65535;
        int repeat_count = 0;
        int last_x = 0;
        int last_y = 0;
        int x_bytes = 0;
        int y_bytes = 0;
        for (int i = 0; i < n_points; i++) {
            Woff2Common.Point point = points[i];
            ?? r15 = point.on_curve;
            int dx = point.x - last_x;
            int dy = point.y - last_y;
            if (dx == 0) {
                flag = (r15 == true ? 1 : 0) | 16;
            } else if (dx > -256 && dx < 256) {
                x_bytes++;
                flag = (r15 == true ? 1 : 0) | (dx > 0 ? (char) 16 : (char) 0) | 2;
            } else {
                x_bytes += 2;
                flag = r15;
            }
            if (dy == 0) {
                flag2 = (flag == 1 ? 1 : 0) | 32;
            } else if (dy > -256 && dy < 256) {
                y_bytes++;
                flag2 = (flag == 1 ? 1 : 0) | (dy > 0 ? ' ' : (char) 0) | 4;
            } else {
                y_bytes += 2;
                flag2 = flag;
            }
            if (flag2 == last_flag && repeat_count != 255) {
                int i2 = flag_offset - 1;
                dst[i2] = (byte) (dst[i2] | 8);
                repeat_count++;
            } else {
                if (repeat_count != 0) {
                    if (flag_offset >= dst_size) {
                        throw new FontCompressionException(IoExceptionMessageConstant.RECONSTRUCT_POINT_FAILED);
                    }
                    dst[flag_offset] = (byte) repeat_count;
                    flag_offset++;
                }
                if (flag_offset >= dst_size) {
                    throw new FontCompressionException(IoExceptionMessageConstant.RECONSTRUCT_POINT_FAILED);
                }
                dst[flag_offset] = (byte) flag2;
                repeat_count = 0;
                flag_offset++;
            }
            last_x = point.x;
            last_y = point.y;
            last_flag = flag2;
        }
        if (repeat_count != 0) {
            if (flag_offset >= dst_size) {
                throw new FontCompressionException(IoExceptionMessageConstant.RECONSTRUCT_POINT_FAILED);
            }
            dst[flag_offset] = (byte) repeat_count;
            flag_offset++;
        }
        int xy_bytes = x_bytes + y_bytes;
        if (xy_bytes < x_bytes || flag_offset + xy_bytes < flag_offset || flag_offset + xy_bytes > dst_size) {
            throw new FontCompressionException(IoExceptionMessageConstant.RECONSTRUCT_POINT_FAILED);
        }
        int x_offset = flag_offset;
        int y_offset = flag_offset + x_bytes;
        int last_x2 = 0;
        int last_y2 = 0;
        for (int i3 = 0; i3 < n_points; i3++) {
            int dx2 = points[i3].x - last_x2;
            if (dx2 != 0) {
                if (dx2 > -256 && dx2 < 256) {
                    dst[x_offset] = (byte) Math.abs(dx2);
                    x_offset++;
                } else {
                    x_offset = StoreBytes.storeU16(dst, x_offset, dx2);
                }
            }
            last_x2 += dx2;
            int dy2 = points[i3].y - last_y2;
            if (dy2 != 0) {
                if (dy2 > -256 && dy2 < 256) {
                    dst[y_offset] = (byte) Math.abs(dy2);
                    y_offset++;
                } else {
                    y_offset = StoreBytes.storeU16(dst, y_offset, dy2);
                }
            }
            last_y2 += dy2;
        }
        int i4 = y_offset;
        return i4;
    }

    private static void computeBbox(int n_points, Woff2Common.Point[] points, byte[] dst) {
        int x_min = 0;
        int y_min = 0;
        int x_max = 0;
        int y_max = 0;
        if (n_points > 0) {
            x_min = points[0].x;
            x_max = points[0].x;
            y_min = points[0].y;
            y_max = points[0].y;
        }
        for (int i = 1; i < n_points; i++) {
            int x = points[i].x;
            int y = points[i].y;
            x_min = Math.min(x, x_min);
            x_max = Math.max(x, x_max);
            y_min = Math.min(y, y_min);
            y_max = Math.max(y, y_max);
        }
        int offset = StoreBytes.storeU16(dst, 2, x_min);
        StoreBytes.storeU16(dst, StoreBytes.storeU16(dst, StoreBytes.storeU16(dst, offset, y_min), x_max), y_max);
    }

    private static CompositeGlyphInfo sizeOfComposite(Buffer composite_stream) {
        int arg_size;
        Buffer composite_stream2 = new Buffer(composite_stream);
        int start_offset = composite_stream2.getOffset();
        boolean we_have_instructions = false;
        int flags = 32;
        while ((flags & 32) != 0) {
            flags = JavaUnsignedUtil.asU16(composite_stream2.readShort());
            we_have_instructions |= (flags & 256) != 0;
            if ((flags & 1) != 0) {
                arg_size = 2 + 4;
            } else {
                arg_size = 2 + 2;
            }
            if ((flags & 8) != 0) {
                arg_size += 2;
            } else if ((flags & 64) != 0) {
                arg_size += 4;
            } else if ((flags & 128) != 0) {
                arg_size += 8;
            }
            composite_stream2.skip(arg_size);
        }
        int size = composite_stream2.getOffset() - start_offset;
        boolean have_instructions = we_have_instructions;
        return new CompositeGlyphInfo(size, have_instructions);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class CompositeGlyphInfo {
        public boolean have_instructions;
        public int size;

        public CompositeGlyphInfo(int size, boolean have_instructions) {
            this.size = size;
            this.have_instructions = have_instructions;
        }
    }

    private static void pad4(Woff2Out out) {
        byte[] zeroes = {0, 0, 0};
        if (out.size() + 3 < out.size()) {
            throw new FontCompressionException(IoExceptionMessageConstant.PADDING_OVERFLOW);
        }
        int pad_bytes = Round.round4(out.size()) - out.size();
        if (pad_bytes > 0) {
            out.write(zeroes, 0, pad_bytes);
        }
    }

    private static int storeLoca(int[] loca_values, int index_format, Woff2Out out) {
        long loca_size = loca_values.length;
        long offset_size = index_format != 0 ? 4L : 2L;
        if (((loca_size << 2) >> 2) != loca_size) {
            throw new FontCompressionException(IoExceptionMessageConstant.LOCA_SIZE_OVERFLOW);
        }
        byte[] loca_content = new byte[(int) (loca_size * offset_size)];
        int offset = 0;
        for (int value : loca_values) {
            if (index_format != 0) {
                offset = StoreBytes.storeU32(loca_content, offset, value);
            } else {
                offset = StoreBytes.storeU16(loca_content, offset, value >> 1);
            }
        }
        int i = loca_content.length;
        int checksum = Woff2Common.computeULongSum(loca_content, 0, i);
        out.write(loca_content, 0, loca_content.length);
        return checksum;
    }

    /* JADX WARN: Code restructure failed: missing block: B:71:0x0312, code lost:
        throw new com.itextpdf.io.exceptions.FontCompressionException(com.itextpdf.io.exceptions.IoExceptionMessageConstant.RECONSTRUCT_GLYF_TABLE_FAILED);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static com.itextpdf.io.font.woff2.Woff2Dec.Checksums reconstructGlyf(byte[] r43, int r44, com.itextpdf.io.font.woff2.Woff2Common.Table r45, int r46, com.itextpdf.io.font.woff2.Woff2Common.Table r47, int r48, com.itextpdf.io.font.woff2.Woff2Dec.Woff2FontInfo r49, com.itextpdf.io.font.woff2.Woff2Out r50) {
        /*
            Method dump skipped, instructions count: 970
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.itextpdf.io.font.woff2.Woff2Dec.reconstructGlyf(byte[], int, com.itextpdf.io.font.woff2.Woff2Common$Table, int, com.itextpdf.io.font.woff2.Woff2Common$Table, int, com.itextpdf.io.font.woff2.Woff2Dec$Woff2FontInfo, com.itextpdf.io.font.woff2.Woff2Out):com.itextpdf.io.font.woff2.Woff2Dec$Checksums");
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class Checksums {
        public int glyph_checksum;
        public int loca_checksum;

        public Checksums(int loca_checksum, int glyph_checksum) {
            this.loca_checksum = loca_checksum;
            this.glyph_checksum = glyph_checksum;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class StreamInfo {
        public int length;
        public int offset;

        public StreamInfo(int offset, int length) {
            this.offset = offset;
            this.length = length;
        }
    }

    private static Woff2Common.Table findTable(ArrayList<Woff2Common.Table> tables, int tag) {
        Iterator<Woff2Common.Table> it = tables.iterator();
        while (it.hasNext()) {
            Woff2Common.Table table = it.next();
            if (table.tag == tag) {
                return table;
            }
        }
        return null;
    }

    private static short readNumHMetrics(byte[] data, int offset, int data_length) {
        Buffer buffer = new Buffer(data, offset, data_length);
        buffer.skip(34);
        return buffer.readShort();
    }

    private static int reconstructTransformedHmtx(byte[] transformed_buf, int transformed_offset, int transformed_size, int num_glyphs, int num_hmetrics, short[] x_mins, Woff2Out out) {
        short lsb;
        short lsb2;
        int i = num_glyphs;
        Buffer hmtx_buff_in = new Buffer(transformed_buf, transformed_offset, transformed_size);
        int hmtx_flags = JavaUnsignedUtil.asU8(hmtx_buff_in.readByte());
        boolean has_proportional_lsbs = (hmtx_flags & 1) == 0;
        boolean has_monospace_lsbs = (hmtx_flags & 2) == 0;
        if (has_proportional_lsbs && has_monospace_lsbs) {
            throw new FontCompressionException(IoExceptionMessageConstant.RECONSTRUCT_HMTX_TABLE_FAILED);
        }
        if (x_mins == null || x_mins.length != i) {
            throw new FontCompressionException(IoExceptionMessageConstant.RECONSTRUCT_HMTX_TABLE_FAILED);
        }
        if (num_hmetrics > i) {
            throw new FontCompressionException(IoExceptionMessageConstant.RECONSTRUCT_HMTX_TABLE_FAILED);
        }
        if (num_hmetrics < 1) {
            throw new FontCompressionException(IoExceptionMessageConstant.RECONSTRUCT_HMTX_TABLE_FAILED);
        }
        short[] advance_widths = new short[num_hmetrics];
        for (int i2 = 0; i2 < num_hmetrics; i2++) {
            short advance_width = hmtx_buff_in.readShort();
            advance_widths[i2] = advance_width;
        }
        short[] lsbs = new short[i];
        for (int i3 = 0; i3 < num_hmetrics; i3++) {
            if (has_proportional_lsbs) {
                lsb2 = hmtx_buff_in.readShort();
            } else {
                lsb2 = x_mins[i3];
            }
            lsbs[i3] = lsb2;
        }
        for (int i4 = num_hmetrics; i4 < i; i4++) {
            if (has_monospace_lsbs) {
                lsb = hmtx_buff_in.readShort();
            } else {
                lsb = x_mins[i4];
            }
            lsbs[i4] = lsb;
        }
        int i5 = i * 2;
        int hmtx_output_size = i5 + (num_hmetrics * 2);
        byte[] hmtx_table = new byte[hmtx_output_size];
        int dst_offset = 0;
        int i6 = 0;
        while (i6 < i) {
            if (i6 < num_hmetrics) {
                dst_offset = StoreBytes.storeU16(hmtx_table, dst_offset, advance_widths[i6]);
            }
            dst_offset = StoreBytes.storeU16(hmtx_table, dst_offset, lsbs[i6]);
            i6++;
            i = num_glyphs;
        }
        int checksum = Woff2Common.computeULongSum(hmtx_table, 0, hmtx_output_size);
        out.write(hmtx_table, 0, hmtx_output_size);
        return checksum;
    }

    private static void woff2Uncompress(byte[] dst_buf, int dst_offset, int dst_length, byte[] src_buf, int src_offset, int src_length) {
        int remain = dst_length;
        try {
            BrotliInputStream stream = new BrotliInputStream(new ByteArrayInputStream(src_buf, src_offset, src_length));
            while (remain > 0) {
                int read = stream.read(dst_buf, dst_offset, dst_length);
                if (read < 0) {
                    throw new FontCompressionException(IoExceptionMessageConstant.BROTLI_DECODING_FAILED);
                }
                remain -= read;
            }
            if (stream.read() != -1) {
                throw new FontCompressionException(IoExceptionMessageConstant.BROTLI_DECODING_FAILED);
            }
            if (remain != 0) {
                throw new FontCompressionException(IoExceptionMessageConstant.BROTLI_DECODING_FAILED);
            }
        } catch (IOException e) {
            throw new FontCompressionException(IoExceptionMessageConstant.BROTLI_DECODING_FAILED);
        }
    }

    private static void readTableDirectory(Buffer file, Woff2Common.Table[] tables, int num_tables) {
        int tag;
        int src_offset = 0;
        for (int i = 0; i < num_tables; i++) {
            Woff2Common.Table table = new Woff2Common.Table();
            tables[i] = table;
            int flag_byte = JavaUnsignedUtil.asU8(file.readByte());
            if ((flag_byte & 63) == 63) {
                tag = file.readInt();
            } else {
                tag = TableTags.kKnownTags[flag_byte & 63];
            }
            int flags = 0;
            int xform_version = (flag_byte >> 6) & 3;
            if (tag == 1735162214 || tag == 1819239265) {
                if (xform_version == 0) {
                    flags = 0 | 256;
                }
            } else if (xform_version != 0) {
                flags = 0 | 256;
            }
            int flags2 = flags | xform_version;
            int dst_length = VariableLength.readBase128(file);
            int transform_length = dst_length;
            if ((flags2 & 256) != 0) {
                transform_length = VariableLength.readBase128(file);
                if (tag == 1819239265 && transform_length != 0) {
                    throw new FontCompressionException(IoExceptionMessageConstant.READ_TABLE_DIRECTORY_FAILED);
                }
            }
            if (src_offset + transform_length < src_offset) {
                throw new FontCompressionException(IoExceptionMessageConstant.READ_TABLE_DIRECTORY_FAILED);
            }
            table.src_offset = src_offset;
            table.src_length = transform_length;
            src_offset += transform_length;
            table.tag = tag;
            table.flags = flags2;
            table.transform_length = transform_length;
            table.dst_length = dst_length;
        }
    }

    private static int storeOffsetTable(byte[] result, int offset, int flavor, int num_tables) {
        int offset2 = StoreBytes.storeU16(result, StoreBytes.storeU32(result, offset, flavor), num_tables);
        int max_pow2 = 0;
        while ((1 << (max_pow2 + 1)) <= num_tables) {
            max_pow2++;
        }
        int output_search_range = (1 << max_pow2) << 4;
        return StoreBytes.storeU16(result, StoreBytes.storeU16(result, StoreBytes.storeU16(result, offset2, output_search_range), max_pow2), (num_tables << 4) - output_search_range);
    }

    private static int storeTableEntry(byte[] result, int offset, int tag) {
        return StoreBytes.storeU32(result, StoreBytes.storeU32(result, StoreBytes.storeU32(result, StoreBytes.storeU32(result, offset, tag), 0), 0), 0);
    }

    private static int computeOffsetToFirstTable(Woff2Header hdr) {
        TtcFont[] ttcFontArr;
        int offset = (hdr.num_tables * 16) + 12;
        if (hdr.header_version != 0) {
            int offset2 = Woff2Common.collectionHeaderSize(hdr.header_version, hdr.ttc_fonts.length) + (hdr.ttc_fonts.length * 12);
            for (TtcFont ttc_font : hdr.ttc_fonts) {
                offset2 += ttc_font.table_indices.length * 16;
            }
            return offset2;
        }
        return offset;
    }

    private static ArrayList<Woff2Common.Table> tables(Woff2Header hdr, int font_index) {
        short[] sArr;
        ArrayList<Woff2Common.Table> tables = new ArrayList<>();
        if (hdr.header_version != 0) {
            for (short index : hdr.ttc_fonts[font_index].table_indices) {
                tables.add(hdr.tables[JavaUnsignedUtil.asU16(index)]);
            }
        } else {
            tables.addAll(Arrays.asList(hdr.tables));
        }
        return tables;
    }

    private static void reconstructFont(byte[] transformed_buf, int transformed_buf_offset, int transformed_buf_size, RebuildMetadata metadata, Woff2Header hdr, int font_index, Woff2Out out) {
        String str;
        char c;
        Woff2Common.Table table;
        Woff2FontInfo info;
        int checksum;
        byte[] bArr = transformed_buf;
        Woff2Out woff2Out = out;
        int dest_offset = woff2Out.size();
        byte[] table_entry = new byte[12];
        Woff2FontInfo info2 = metadata.font_infos[font_index];
        ArrayList<Woff2Common.Table> tables = tables(hdr, font_index);
        boolean z = findTable(tables, TableTags.kGlyfTableTag) == null;
        boolean z2 = findTable(tables, TableTags.kLocaTableTag) != null;
        String str2 = IoExceptionMessageConstant.RECONSTRUCT_TABLE_DIRECTORY_FAILED;
        if (z == z2) {
            throw new FontCompressionException(IoExceptionMessageConstant.RECONSTRUCT_TABLE_DIRECTORY_FAILED);
        }
        int font_checksum = metadata.header_checksum;
        if (hdr.header_version != 0) {
            font_checksum = hdr.ttc_fonts[font_index].header_checksum;
        }
        int loca_checksum = 0;
        int font_checksum2 = font_checksum;
        int checksum2 = 0;
        while (checksum2 < tables.size()) {
            Woff2Common.Table table2 = tables.get(checksum2);
            TableChecksumInfo checksum_key = new TableChecksumInfo(table2.tag, table2.src_offset);
            boolean reused = metadata.checksums.containsKey(checksum_key);
            if (font_index == 0 && reused) {
                throw new FontCompressionException(str2);
            }
            int i = checksum2;
            int loca_checksum2 = loca_checksum;
            if (table2.src_offset + table2.src_length > transformed_buf_size) {
                throw new FontCompressionException(str2);
            }
            if (table2.tag == 1751672161) {
                info2.num_hmetrics = readNumHMetrics(bArr, transformed_buf_offset + table2.src_offset, table2.src_length);
            }
            if (reused) {
                str = str2;
                c = 25441;
                table = table2;
                info = info2;
                checksum = metadata.checksums.get(checksum_key).intValue();
                loca_checksum = loca_checksum2;
            } else {
                if ((table2.flags & 256) != 256) {
                    if (table2.tag == 1751474532) {
                        if (table2.src_length < 12) {
                            throw new FontCompressionException(str2);
                        }
                        StoreBytes.storeU32(bArr, transformed_buf_offset + table2.src_offset + 8, 0);
                    }
                    table2.dst_offset = dest_offset;
                    checksum = Woff2Common.computeULongSum(bArr, transformed_buf_offset + table2.src_offset, table2.src_length);
                    woff2Out.write(bArr, transformed_buf_offset + table2.src_offset, table2.src_length);
                    str = str2;
                    loca_checksum = loca_checksum2;
                    c = 25441;
                    table = table2;
                    info = info2;
                } else if (table2.tag == 1735162214) {
                    table2.dst_offset = dest_offset;
                    Woff2Common.Table loca_table = findTable(tables, TableTags.kLocaTableTag);
                    int dest_offset2 = transformed_buf_offset + table2.src_offset;
                    Woff2Out woff2Out2 = woff2Out;
                    Woff2FontInfo info3 = info2;
                    str = str2;
                    Checksums resultChecksum = reconstructGlyf(bArr, dest_offset2, table2, 0, loca_table, loca_checksum2, info3, woff2Out2);
                    info = info3;
                    checksum = resultChecksum.glyph_checksum;
                    loca_checksum = resultChecksum.loca_checksum;
                    woff2Out = out;
                    c = 25441;
                    table = table2;
                } else {
                    int dest_offset3 = dest_offset;
                    str = str2;
                    info = info2;
                    int dest_offset4 = table2.tag;
                    if (dest_offset4 == 1819239265) {
                        checksum = loca_checksum2;
                        woff2Out = out;
                        c = 25441;
                        loca_checksum = loca_checksum2;
                        table = table2;
                    } else if (table2.tag != 1752003704) {
                        throw new FontCompressionException(str);
                    } else {
                        table2.dst_offset = dest_offset3;
                        c = 25441;
                        woff2Out = out;
                        table = table2;
                        checksum = reconstructTransformedHmtx(transformed_buf, transformed_buf_offset + table2.src_offset, table2.src_length, JavaUnsignedUtil.asU16(info.num_glyphs), JavaUnsignedUtil.asU16(info.num_hmetrics), info.x_mins, woff2Out);
                        loca_checksum = loca_checksum2;
                    }
                }
                metadata.checksums.put(checksum_key, Integer.valueOf(checksum));
            }
            StoreBytes.storeU32(table_entry, 0, checksum);
            StoreBytes.storeU32(table_entry, 4, table.dst_offset);
            StoreBytes.storeU32(table_entry, 8, table.dst_length);
            woff2Out.write(table_entry, 0, info.table_entry_by_tag.get(Integer.valueOf(table.tag)).intValue() + 4, 12);
            font_checksum2 = font_checksum2 + checksum + Woff2Common.computeULongSum(table_entry, 0, 12);
            pad4(woff2Out);
            if (table.dst_offset + table.dst_length > woff2Out.size()) {
                throw new FontCompressionException(str);
            }
            dest_offset = woff2Out.size();
            checksum2 = i + 1;
            bArr = transformed_buf;
            info2 = info;
            str2 = str;
        }
        String str3 = str2;
        Woff2Common.Table head_table = findTable(tables, TableTags.kHeadTableTag);
        if (head_table != null) {
            if (head_table.dst_length < 12) {
                throw new FontCompressionException(str3);
            }
            byte[] checksum_adjustment = new byte[4];
            StoreBytes.storeU32(checksum_adjustment, 0, (-1313820742) - font_checksum2);
            woff2Out.write(checksum_adjustment, 0, head_table.dst_offset + 8, 4);
        }
    }

    private static void readWoff2Header(byte[] data, int length, Woff2Header hdr) {
        Buffer file;
        Buffer file2 = new Buffer(data, 0, length);
        int signature = file2.readInt();
        if (signature != 2001684018) {
            throw new FontCompressionException(IoExceptionMessageConstant.INCORRECT_SIGNATURE);
        }
        hdr.flavor = file2.readInt();
        int reported_length = file2.readInt();
        if (reported_length <= 0) {
            throw new AssertionError();
        }
        if (length != reported_length) {
            throw new FontCompressionException(IoExceptionMessageConstant.READ_HEADER_FAILED);
        }
        hdr.num_tables = file2.readShort();
        if (hdr.num_tables == 0) {
            throw new FontCompressionException(IoExceptionMessageConstant.READ_HEADER_FAILED);
        }
        file2.skip(6);
        hdr.compressed_length = file2.readInt();
        if (hdr.compressed_length < 0) {
            throw new AssertionError();
        }
        file2.skip(4);
        int meta_offset = file2.readInt();
        if (meta_offset < 0) {
            throw new AssertionError();
        }
        int meta_length = file2.readInt();
        if (meta_length < 0) {
            throw new AssertionError();
        }
        int meta_length_orig = file2.readInt();
        if (meta_length_orig < 0) {
            throw new AssertionError();
        }
        if (meta_offset != 0 && (meta_offset >= length || length - meta_offset < meta_length)) {
            throw new FontCompressionException(IoExceptionMessageConstant.READ_HEADER_FAILED);
        }
        int priv_offset = file2.readInt();
        if (priv_offset < 0) {
            throw new AssertionError();
        }
        int priv_length = file2.readInt();
        if (priv_length < 0) {
            throw new AssertionError();
        }
        if (priv_offset != 0 && (priv_offset >= length || length - priv_offset < priv_length)) {
            throw new FontCompressionException(IoExceptionMessageConstant.READ_HEADER_FAILED);
        }
        hdr.tables = new Woff2Common.Table[hdr.num_tables];
        readTableDirectory(file2, hdr.tables, hdr.num_tables);
        Woff2Common.Table last_table = hdr.tables[hdr.tables.length - 1];
        hdr.uncompressed_size = last_table.src_offset + last_table.src_length;
        if (hdr.uncompressed_size <= 0) {
            throw new AssertionError();
        }
        if (hdr.uncompressed_size < last_table.src_offset) {
            throw new FontCompressionException(IoExceptionMessageConstant.READ_HEADER_FAILED);
        }
        hdr.header_version = 0;
        if (hdr.flavor != 1953784678) {
            file = file2;
        } else {
            hdr.header_version = file2.readInt();
            if (hdr.header_version != 65536 && hdr.header_version != 131072) {
                throw new FontCompressionException(IoExceptionMessageConstant.READ_COLLECTION_HEADER_FAILED);
            }
            int num_fonts = VariableLength.read255UShort(file2);
            hdr.ttc_fonts = new TtcFont[num_fonts];
            int i = 0;
            while (i < num_fonts) {
                Buffer file3 = file2;
                TtcFont ttc_font = new TtcFont();
                hdr.ttc_fonts[i] = ttc_font;
                int num_tables = VariableLength.read255UShort(file3);
                int signature2 = signature;
                ttc_font.flavor = file3.readInt();
                ttc_font.table_indices = new short[num_tables];
                Woff2Common.Table loca_table = null;
                Woff2Common.Table glyf_table = null;
                int j = 0;
                while (j < num_tables) {
                    int num_tables2 = num_tables;
                    int table_idx = VariableLength.read255UShort(file3);
                    int j2 = j;
                    if (table_idx >= hdr.tables.length) {
                        throw new FontCompressionException(IoExceptionMessageConstant.READ_COLLECTION_HEADER_FAILED);
                    }
                    TtcFont ttc_font2 = ttc_font;
                    ttc_font.table_indices[j2] = (short) table_idx;
                    Woff2Common.Table table = hdr.tables[table_idx];
                    if (table.tag == 1819239265) {
                        loca_table = table;
                    }
                    if (table.tag == 1735162214) {
                        glyf_table = table;
                    }
                    j = j2 + 1;
                    num_tables = num_tables2;
                    ttc_font = ttc_font2;
                }
                if ((glyf_table == null) == (loca_table == null)) {
                    i++;
                    file2 = file3;
                    signature = signature2;
                } else {
                    throw new FontCompressionException(IoExceptionMessageConstant.READ_COLLECTION_HEADER_FAILED);
                }
            }
            file = file2;
        }
        hdr.compressed_offset = file.getOffset();
        int src_offset = Round.round4(hdr.compressed_offset + hdr.compressed_length);
        if (src_offset > length) {
            throw new FontCompressionException(IoExceptionMessageConstant.READ_HEADER_FAILED);
        }
        if (meta_offset != 0) {
            if (src_offset != meta_offset) {
                throw new FontCompressionException(IoExceptionMessageConstant.READ_HEADER_FAILED);
            }
            src_offset = Round.round4(meta_offset + meta_length);
        }
        if (priv_offset != 0) {
            if (src_offset != priv_offset) {
                throw new FontCompressionException(IoExceptionMessageConstant.READ_HEADER_FAILED);
            }
            src_offset = Round.round4(priv_offset + priv_length);
        }
        if (src_offset != Round.round4(length)) {
            throw new FontCompressionException(IoExceptionMessageConstant.READ_HEADER_FAILED);
        }
    }

    private static void writeHeaders(byte[] data, int length, RebuildMetadata metadata, Woff2Header hdr, Woff2Out out) {
        int i;
        TtcFont[] ttcFontArr;
        short[] sArr;
        byte[] output = new byte[computeOffsetToFirstTable(hdr)];
        List<Woff2Common.Table> sorted_tables = new ArrayList<>(Arrays.asList(hdr.tables));
        int i2 = 0;
        if (hdr.header_version != 0) {
            for (TtcFont ttc_font : hdr.ttc_fonts) {
                Map<Integer, Short> sorted_index_by_tag = new TreeMap<>();
                for (short table_index : ttc_font.table_indices) {
                    sorted_index_by_tag.put(Integer.valueOf(hdr.tables[table_index].tag), Short.valueOf(table_index));
                }
                short index = 0;
                for (Map.Entry<Integer, Short> i3 : sorted_index_by_tag.entrySet()) {
                    ttc_font.table_indices[index] = i3.getValue().shortValue();
                    index = (short) (index + 1);
                }
            }
        } else {
            Collections.sort(sorted_tables);
        }
        AnonymousClass1 anonymousClass1 = null;
        if (hdr.header_version != 0) {
            int offset = StoreBytes.storeU32(output, 0, hdr.flavor);
            int offset2 = StoreBytes.storeU32(output, StoreBytes.storeU32(output, offset, hdr.header_version), hdr.ttc_fonts.length);
            int offset_table = offset2;
            for (int i4 = 0; i4 < hdr.ttc_fonts.length; i4++) {
                offset2 = StoreBytes.storeU32(output, offset2, 0);
            }
            int i5 = hdr.header_version;
            if (i5 == 131072) {
                offset2 = StoreBytes.storeU32(output, StoreBytes.storeU32(output, StoreBytes.storeU32(output, offset2, 0), 0), 0);
            }
            metadata.font_infos = new Woff2FontInfo[hdr.ttc_fonts.length];
            int i6 = 0;
            while (i6 < hdr.ttc_fonts.length) {
                TtcFont ttc_font2 = hdr.ttc_fonts[i6];
                offset_table = StoreBytes.storeU32(output, offset_table, offset2);
                ttc_font2.dst_offset = offset2;
                offset2 = storeOffsetTable(output, offset2, ttc_font2.flavor, ttc_font2.table_indices.length);
                metadata.font_infos[i6] = new Woff2FontInfo();
                short[] sArr2 = ttc_font2.table_indices;
                int length2 = sArr2.length;
                int i7 = i2;
                while (i7 < length2) {
                    int tag = hdr.tables[sArr2[i7]].tag;
                    metadata.font_infos[i6].table_entry_by_tag.put(Integer.valueOf(tag), Integer.valueOf(offset2));
                    offset2 = storeTableEntry(output, offset2, tag);
                    i7++;
                    i2 = i2;
                }
                ttc_font2.header_checksum = Woff2Common.computeULongSum(output, ttc_font2.dst_offset, offset2 - ttc_font2.dst_offset);
                i6++;
                i2 = i2;
                anonymousClass1 = null;
            }
            i = i2;
        } else {
            i = 0;
            metadata.font_infos = new Woff2FontInfo[1];
            int offset3 = storeOffsetTable(output, 0, hdr.flavor, hdr.num_tables);
            metadata.font_infos[0] = new Woff2FontInfo();
            for (int i8 = 0; i8 < hdr.num_tables; i8++) {
                metadata.font_infos[0].table_entry_by_tag.put(Integer.valueOf(sorted_tables.get(i8).tag), Integer.valueOf(offset3));
                offset3 = storeTableEntry(output, offset3, sorted_tables.get(i8).tag);
            }
        }
        int i9 = output.length;
        int i10 = i;
        out.write(output, i10, i9);
        metadata.header_checksum = Woff2Common.computeULongSum(output, i10, output.length);
    }

    public static int computeWoff2FinalSize(byte[] data, int length) {
        Buffer file = new Buffer(data, 0, length);
        file.skip(16);
        return file.readInt();
    }

    public static void convertWoff2ToTtf(byte[] data, int length, Woff2Out out) {
        RebuildMetadata metadata = new RebuildMetadata();
        Woff2Header hdr = new Woff2Header();
        readWoff2Header(data, length, hdr);
        writeHeaders(data, length, metadata, hdr, out);
        float compression_ratio = hdr.uncompressed_size / length;
        if (compression_ratio > kMaxPlausibleCompressionRatio) {
            throw new FontCompressionException(MessageFormatUtil.format("Implausible compression ratio {0}", Float.valueOf(compression_ratio)));
        }
        byte[] uncompressed_buf = new byte[hdr.uncompressed_size];
        woff2Uncompress(uncompressed_buf, 0, hdr.uncompressed_size, data, hdr.compressed_offset, hdr.compressed_length);
        for (int i = 0; i < metadata.font_infos.length; i++) {
            reconstructFont(uncompressed_buf, 0, hdr.uncompressed_size, metadata, hdr, i, out);
        }
    }
}
