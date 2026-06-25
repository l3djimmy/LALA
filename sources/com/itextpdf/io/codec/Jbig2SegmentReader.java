package com.itextpdf.io.codec;

import com.itextpdf.io.source.RandomAccessFileOrArray;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class Jbig2SegmentReader {
    public static final int END_OF_FILE = 51;
    public static final int END_OF_PAGE = 49;
    public static final int END_OF_STRIPE = 50;
    public static final int EXTENSION = 62;
    public static final int IMMEDIATE_GENERIC_REFINEMENT_REGION = 42;
    public static final int IMMEDIATE_GENERIC_REGION = 38;
    public static final int IMMEDIATE_HALFTONE_REGION = 22;
    public static final int IMMEDIATE_LOSSLESS_GENERIC_REFINEMENT_REGION = 43;
    public static final int IMMEDIATE_LOSSLESS_GENERIC_REGION = 39;
    public static final int IMMEDIATE_LOSSLESS_HALFTONE_REGION = 23;
    public static final int IMMEDIATE_LOSSLESS_TEXT_REGION = 7;
    public static final int IMMEDIATE_TEXT_REGION = 6;
    public static final int INTERMEDIATE_GENERIC_REFINEMENT_REGION = 40;
    public static final int INTERMEDIATE_GENERIC_REGION = 36;
    public static final int INTERMEDIATE_HALFTONE_REGION = 20;
    public static final int INTERMEDIATE_TEXT_REGION = 4;
    public static final int PAGE_INFORMATION = 48;
    public static final int PATTERN_DICTIONARY = 16;
    public static final int PROFILES = 52;
    public static final int SYMBOL_DICTIONARY = 0;
    public static final int TABLES = 53;
    private boolean number_of_pages_known;
    private RandomAccessFileOrArray ra;
    private boolean sequential;
    private final Map<Integer, Jbig2Segment> segments = new TreeMap();
    private final Map<Integer, Jbig2Page> pages = new TreeMap();
    private final Set<Jbig2Segment> globals = new TreeSet();
    private int number_of_pages = -1;
    private boolean read = false;

    /* loaded from: classes12.dex */
    public static class Jbig2Segment implements Comparable<Jbig2Segment> {
        public final int segmentNumber;
        public long dataLength = -1;
        public int page = -1;
        public int[] referredToSegmentNumbers = null;
        public boolean[] segmentRetentionFlags = null;
        public int type = -1;
        public boolean deferredNonRetain = false;
        public int countOfReferredToSegments = -1;
        public byte[] data = null;
        public byte[] headerData = null;
        public boolean page_association_size = false;
        public int page_association_offset = -1;

        public Jbig2Segment(int segment_number) {
            this.segmentNumber = segment_number;
        }

        @Override // java.lang.Comparable
        public int compareTo(Jbig2Segment s) {
            return this.segmentNumber - s.segmentNumber;
        }
    }

    /* loaded from: classes12.dex */
    public static class Jbig2Page {
        public final int page;
        private final Jbig2SegmentReader sr;
        private final Map<Integer, Jbig2Segment> segs = new TreeMap();
        public int pageBitmapWidth = -1;
        public int pageBitmapHeight = -1;

        public Jbig2Page(int page, Jbig2SegmentReader sr) {
            this.page = page;
            this.sr = sr;
        }

        public byte[] getData(boolean for_embedding) throws IOException {
            ByteArrayOutputStream os = new ByteArrayOutputStream();
            for (Integer num : this.segs.keySet()) {
                int sn = num.intValue();
                Jbig2Segment s = this.segs.get(Integer.valueOf(sn));
                if (!for_embedding || (s.type != 51 && s.type != 49)) {
                    if (for_embedding) {
                        byte[] headerData_emb = Jbig2SegmentReader.copyByteArray(s.headerData);
                        if (s.page_association_size) {
                            headerData_emb[s.page_association_offset] = 0;
                            headerData_emb[s.page_association_offset + 1] = 0;
                            headerData_emb[s.page_association_offset + 2] = 0;
                            headerData_emb[s.page_association_offset + 3] = 1;
                        } else {
                            headerData_emb[s.page_association_offset] = 1;
                        }
                        os.write(headerData_emb);
                    } else {
                        os.write(s.headerData);
                    }
                    os.write(s.data);
                }
            }
            os.close();
            return os.toByteArray();
        }

        public void addSegment(Jbig2Segment s) {
            this.segs.put(Integer.valueOf(s.segmentNumber), s);
        }
    }

    public Jbig2SegmentReader(RandomAccessFileOrArray ra) {
        this.ra = ra;
    }

    public static byte[] copyByteArray(byte[] b) {
        byte[] bc = new byte[b.length];
        System.arraycopy(b, 0, bc, 0, b.length);
        return bc;
    }

    public void read() throws IOException {
        Jbig2Segment tmp;
        if (this.read) {
            throw new IllegalStateException("already.attempted.a.read.on.this.jbig2.file");
        }
        this.read = true;
        readFileHeader();
        if (this.sequential) {
            do {
                Jbig2Segment tmp2 = readHeader();
                readSegment(tmp2);
                this.segments.put(Integer.valueOf(tmp2.segmentNumber), tmp2);
            } while (this.ra.getPosition() < this.ra.length());
            return;
        }
        do {
            tmp = readHeader();
            this.segments.put(Integer.valueOf(tmp.segmentNumber), tmp);
        } while (tmp.type != 51);
        for (Integer num : this.segments.keySet()) {
            int integer = num.intValue();
            readSegment(this.segments.get(Integer.valueOf(integer)));
        }
    }

    void readSegment(Jbig2Segment s) throws IOException {
        int ptr = (int) this.ra.getPosition();
        if (s.dataLength == 4294967295L) {
            return;
        }
        byte[] data = new byte[(int) s.dataLength];
        this.ra.read(data);
        s.data = data;
        if (s.type == 48) {
            int last = (int) this.ra.getPosition();
            this.ra.seek(ptr);
            int page_bitmap_width = this.ra.readInt();
            int page_bitmap_height = this.ra.readInt();
            this.ra.seek(last);
            Jbig2Page p = this.pages.get(Integer.valueOf(s.page));
            if (p == null) {
                throw new com.itextpdf.io.exceptions.IOException("Referring to widht or height of a page we haven't seen yet: {0}").setMessageParams(Integer.valueOf(s.page));
            }
            p.pageBitmapWidth = page_bitmap_width;
            p.pageBitmapHeight = page_bitmap_height;
        }
    }

    Jbig2Segment readHeader() throws IOException {
        int segment_page_association;
        int ptr = (int) this.ra.getPosition();
        int segment_number = this.ra.readInt();
        Jbig2Segment s = new Jbig2Segment(segment_number);
        int segment_header_flags = this.ra.read();
        boolean deferred_non_retain = (segment_header_flags & 128) == 128;
        s.deferredNonRetain = deferred_non_retain;
        boolean page_association_size = (segment_header_flags & 64) == 64;
        int segment_type = segment_header_flags & 63;
        s.type = segment_type;
        int referred_to_byte0 = this.ra.read();
        int i = (referred_to_byte0 & 224) >> 5;
        boolean[] segment_retention_flags = null;
        if (i == 7) {
            int segment_header_flags2 = 1;
            this.ra.seek(this.ra.getPosition() - 1);
            int count_of_referred_to_segments = this.ra.readInt() & 536870911;
            boolean[] segment_retention_flags2 = new boolean[count_of_referred_to_segments + 1];
            int i2 = 0;
            int referred_to_current_byte = 0;
            while (true) {
                int j = i2 % 8;
                if (j == 0) {
                    referred_to_current_byte = this.ra.read();
                }
                int segment_header_flags3 = segment_header_flags;
                segment_retention_flags2[i2] = (((segment_header_flags2 << j) & referred_to_current_byte) >> j) == segment_header_flags2;
                i2++;
                if (i2 > count_of_referred_to_segments) {
                    break;
                }
                segment_header_flags = segment_header_flags3;
                segment_header_flags2 = 1;
            }
            i = count_of_referred_to_segments;
            segment_retention_flags = segment_retention_flags2;
        } else if (i <= 4) {
            segment_retention_flags = new boolean[i + 1];
            int referred_to_byte02 = referred_to_byte0 & 31;
            for (int i3 = 0; i3 <= i; i3++) {
                segment_retention_flags[i3] = (((1 << i3) & referred_to_byte02) >> i3) == 1;
            }
        } else if (i == 5 || i == 6) {
            throw new com.itextpdf.io.exceptions.IOException("Count of referred-to segments has forbidden value in the header for segment {0} starting at {1}").setMessageParams(Integer.valueOf(segment_number), Integer.valueOf(ptr));
        }
        s.segmentRetentionFlags = segment_retention_flags;
        s.countOfReferredToSegments = i;
        int[] referred_to_segment_numbers = new int[i + 1];
        for (int i4 = 1; i4 <= i; i4++) {
            if (segment_number <= 256) {
                referred_to_segment_numbers[i4] = this.ra.read();
            } else {
                RandomAccessFileOrArray randomAccessFileOrArray = this.ra;
                if (segment_number <= 65536) {
                    referred_to_segment_numbers[i4] = randomAccessFileOrArray.readUnsignedShort();
                } else {
                    referred_to_segment_numbers[i4] = (int) randomAccessFileOrArray.readUnsignedInt();
                }
            }
        }
        s.referredToSegmentNumbers = referred_to_segment_numbers;
        int page_association_offset = ((int) this.ra.getPosition()) - ptr;
        RandomAccessFileOrArray randomAccessFileOrArray2 = this.ra;
        if (page_association_size) {
            segment_page_association = randomAccessFileOrArray2.readInt();
        } else {
            segment_page_association = randomAccessFileOrArray2.read();
        }
        if (segment_page_association < 0) {
            throw new com.itextpdf.io.exceptions.IOException("Page {0} is invalid for segment {1} starting at {2}").setMessageParams(Integer.valueOf(segment_page_association), Integer.valueOf(segment_number), Integer.valueOf(ptr));
        }
        s.page = segment_page_association;
        s.page_association_size = page_association_size;
        s.page_association_offset = page_association_offset;
        if (segment_page_association > 0 && !this.pages.containsKey(Integer.valueOf(segment_page_association))) {
            this.pages.put(Integer.valueOf(segment_page_association), new Jbig2Page(segment_page_association, this));
        }
        if (segment_page_association > 0) {
            this.pages.get(Integer.valueOf(segment_page_association)).addSegment(s);
        } else {
            this.globals.add(s);
        }
        long segment_data_length = this.ra.readUnsignedInt();
        s.dataLength = segment_data_length;
        int end_ptr = (int) this.ra.getPosition();
        this.ra.seek(ptr);
        byte[] header_data = new byte[end_ptr - ptr];
        this.ra.read(header_data);
        s.headerData = header_data;
        return s;
    }

    void readFileHeader() throws IOException {
        this.ra.seek(0L);
        byte[] idstring = new byte[8];
        this.ra.read(idstring);
        byte[] refidstring = {-105, 74, 66, 50, 13, 10, 26, 10};
        for (int i = 0; i < idstring.length; i++) {
            if (idstring[i] != refidstring[i]) {
                throw new com.itextpdf.io.exceptions.IOException("File header idstring is not good at byte {0}").setMessageParams(Integer.valueOf(i));
            }
        }
        int fileheaderflags = this.ra.read();
        this.sequential = (fileheaderflags & 1) == 1;
        this.number_of_pages_known = (fileheaderflags & 2) == 0;
        if ((fileheaderflags & 252) != 0) {
            throw new com.itextpdf.io.exceptions.IOException("File header flags bits from 2 to 7 should be 0, some not");
        }
        if (this.number_of_pages_known) {
            this.number_of_pages = this.ra.readInt();
        }
    }

    public int numberOfPages() {
        return this.pages.size();
    }

    public int getPageHeight(int i) {
        return this.pages.get(Integer.valueOf(i)).pageBitmapHeight;
    }

    public int getPageWidth(int i) {
        return this.pages.get(Integer.valueOf(i)).pageBitmapWidth;
    }

    public Jbig2Page getPage(int page) {
        return this.pages.get(Integer.valueOf(page));
    }

    public byte[] getGlobal(boolean for_embedding) {
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        byte[] streamBytes = null;
        try {
            for (Object element : this.globals) {
                Jbig2Segment s = (Jbig2Segment) element;
                if (!for_embedding || (s.type != 51 && s.type != 49)) {
                    os.write(s.headerData);
                    os.write(s.data);
                }
            }
            if (os.size() > 0) {
                streamBytes = os.toByteArray();
            }
            os.close();
        } catch (IOException e) {
            Logger logger = LoggerFactory.getLogger(Jbig2SegmentReader.class);
            logger.debug(e.getMessage());
        }
        return streamBytes;
    }

    public String toString() {
        if (this.read) {
            return "Jbig2SegmentReader: number of pages: " + numberOfPages();
        }
        return "Jbig2SegmentReader in indeterminate state.";
    }
}
