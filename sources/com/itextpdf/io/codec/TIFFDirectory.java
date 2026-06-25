package com.itextpdf.io.codec;

import com.itextpdf.io.exceptions.IoExceptionMessageConstant;
import com.itextpdf.io.source.RandomAccessFileOrArray;
import java.io.EOFException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/* loaded from: classes12.dex */
public class TIFFDirectory {
    private static final int[] sizeOfType = {0, 1, 1, 2, 4, 8, 1, 1, 2, 4, 8, 4, 8};
    TIFFField[] fields;
    boolean isBigEndian;
    int numEntries;
    Map<Integer, Integer> fieldIndex = new HashMap();
    long IFDOffset = 8;
    long nextIFDOffset = 0;

    TIFFDirectory() {
    }

    private static boolean isValidEndianTag(int endian) {
        return endian == 18761 || endian == 19789;
    }

    public TIFFDirectory(RandomAccessFileOrArray stream, int directory) throws IOException {
        long global_save_offset = stream.getPosition();
        stream.seek(0L);
        int endian = stream.readUnsignedShort();
        if (!isValidEndianTag(endian)) {
            throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.BAD_ENDIANNESS_TAG_0X4949_OR_0X4D4D);
        }
        this.isBigEndian = endian == 19789;
        int magic = readUnsignedShort(stream);
        if (magic != 42) {
            throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.BAD_MAGIC_NUMBER_SHOULD_BE_42);
        }
        long ifd_offset = readUnsignedInt(stream);
        for (int i = 0; i < directory; i++) {
            if (ifd_offset == 0) {
                throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.DIRECTORY_NUMBER_IS_TOO_LARGE);
            }
            stream.seek(ifd_offset);
            int entries = readUnsignedShort(stream);
            stream.skip(entries * 12);
            ifd_offset = readUnsignedInt(stream);
        }
        stream.seek(ifd_offset);
        initialize(stream);
        stream.seek(global_save_offset);
    }

    public TIFFDirectory(RandomAccessFileOrArray stream, long ifd_offset, int directory) throws IOException {
        long global_save_offset = stream.getPosition();
        stream.seek(0L);
        int endian = stream.readUnsignedShort();
        if (!isValidEndianTag(endian)) {
            throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.BAD_ENDIANNESS_TAG_0X4949_OR_0X4D4D);
        }
        this.isBigEndian = endian == 19789;
        stream.seek(ifd_offset);
        for (int dirNum = 0; dirNum < directory; dirNum++) {
            int numEntries = readUnsignedShort(stream);
            stream.seek((numEntries * 12) + ifd_offset);
            ifd_offset = readUnsignedInt(stream);
            stream.seek(ifd_offset);
        }
        initialize(stream);
        stream.seek(global_save_offset);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r12v15, types: [double[]] */
    /* JADX WARN: Type inference failed for: r13v16 */
    /* JADX WARN: Type inference failed for: r13v17 */
    /* JADX WARN: Type inference failed for: r13v8, types: [long[][]] */
    /* JADX WARN: Type inference failed for: r15v2 */
    /* JADX WARN: Type inference failed for: r15v3 */
    /* JADX WARN: Type inference failed for: r15v4, types: [int[][]] */
    /* JADX WARN: Type inference failed for: r3v7, types: [java.lang.String[]] */
    private void initialize(RandomAccessFileOrArray stream) throws IOException {
        int i;
        long maxOffset = stream.length();
        this.IFDOffset = stream.getPosition();
        this.numEntries = readUnsignedShort(stream);
        this.fields = new TIFFField[this.numEntries];
        long nextTagOffset = 0;
        int i2 = 0;
        while (i2 < this.numEntries && nextTagOffset < maxOffset) {
            int tag = readUnsignedShort(stream);
            int type = readUnsignedShort(stream);
            int count = (int) readUnsignedInt(stream);
            boolean processTag = true;
            nextTagOffset = stream.getPosition() + 4;
            try {
                if (sizeOfType[type] * count > 4) {
                    long valueOffset = readUnsignedInt(stream);
                    if (valueOffset < maxOffset) {
                        stream.seek(valueOffset);
                    } else {
                        processTag = false;
                    }
                }
            } catch (ArrayIndexOutOfBoundsException e) {
                processTag = false;
            }
            if (!processTag) {
                i = i2;
            } else {
                this.fieldIndex.put(Integer.valueOf(tag), Integer.valueOf(i2));
                float[] obj = null;
                switch (type) {
                    case 1:
                    case 2:
                    case 6:
                    case 7:
                        byte[] bvalues = new byte[count];
                        stream.readFully(bvalues, 0, count);
                        if (type == 2) {
                            int index = 0;
                            int prevIndex = 0;
                            List<String> v = new ArrayList<>();
                            while (index < count) {
                                while (true) {
                                    if (index < count) {
                                        int index2 = index + 1;
                                        if (bvalues[index] != 0) {
                                            index = index2;
                                        } else {
                                            index = index2;
                                        }
                                    }
                                }
                                int i3 = i2;
                                int i4 = index - prevIndex;
                                v.add(new String(bvalues, prevIndex, i4));
                                prevIndex = index;
                                obj = obj;
                                i2 = i3;
                            }
                            i = i2;
                            int count2 = v.size();
                            ?? r3 = new String[count2];
                            for (int c = 0; c < count2; c++) {
                                r3[c] = v.get(c);
                            }
                            count = count2;
                            obj = r3;
                            break;
                        } else {
                            i = i2;
                            obj = bvalues;
                            break;
                        }
                        break;
                    case 3:
                        char[] cvalues = new char[count];
                        for (int j = 0; j < count; j++) {
                            cvalues[j] = (char) readUnsignedShort(stream);
                        }
                        obj = cvalues;
                        i = i2;
                        break;
                    case 4:
                        long[] lvalues = new long[count];
                        for (int j2 = 0; j2 < count; j2++) {
                            lvalues[j2] = readUnsignedInt(stream);
                        }
                        obj = lvalues;
                        i = i2;
                        break;
                    case 5:
                        ?? r13 = new long[count];
                        for (int j3 = 0; j3 < count; j3++) {
                            r13[j3] = new long[2];
                            r13[j3][0] = readUnsignedInt(stream);
                            r13[j3][1] = readUnsignedInt(stream);
                        }
                        obj = r13;
                        i = i2;
                        break;
                    case 8:
                        short[] svalues = new short[count];
                        for (int j4 = 0; j4 < count; j4++) {
                            svalues[j4] = readShort(stream);
                        }
                        obj = svalues;
                        i = i2;
                        break;
                    case 9:
                        int[] ivalues = new int[count];
                        for (int j5 = 0; j5 < count; j5++) {
                            ivalues[j5] = readInt(stream);
                        }
                        obj = ivalues;
                        i = i2;
                        break;
                    case 10:
                        ?? r15 = new int[count];
                        for (int j6 = 0; j6 < count; j6++) {
                            r15[j6] = new int[2];
                            r15[j6][0] = readInt(stream);
                            r15[j6][1] = readInt(stream);
                        }
                        obj = r15;
                        i = i2;
                        break;
                    case 11:
                        float[] fvalues = new float[count];
                        for (int j7 = 0; j7 < count; j7++) {
                            fvalues[j7] = readFloat(stream);
                        }
                        obj = fvalues;
                        i = i2;
                        break;
                    case 12:
                        ?? r12 = new double[count];
                        for (int j8 = 0; j8 < count; j8++) {
                            r12[j8] = readDouble(stream);
                        }
                        obj = r12;
                        i = i2;
                        break;
                    default:
                        i = i2;
                        break;
                }
                this.fields[i] = new TIFFField(tag, type, count, obj);
            }
            stream.seek(nextTagOffset);
            i2 = i + 1;
        }
        try {
            this.nextIFDOffset = readUnsignedInt(stream);
        } catch (Exception e2) {
            this.nextIFDOffset = 0L;
        }
    }

    public int getNumEntries() {
        return this.numEntries;
    }

    public TIFFField getField(int tag) {
        Integer i = this.fieldIndex.get(Integer.valueOf(tag));
        if (i == null) {
            return null;
        }
        return this.fields[i.intValue()];
    }

    public boolean isTagPresent(int tag) {
        return this.fieldIndex.containsKey(Integer.valueOf(tag));
    }

    public int[] getTags() {
        int[] tags = new int[this.fieldIndex.size()];
        int i = 0;
        for (Integer integer : this.fieldIndex.keySet()) {
            tags[i] = integer.intValue();
            i++;
        }
        return tags;
    }

    public TIFFField[] getFields() {
        return this.fields;
    }

    public byte getFieldAsByte(int tag, int index) {
        Integer i = this.fieldIndex.get(Integer.valueOf(tag));
        byte[] b = this.fields[i.intValue()].getAsBytes();
        return b[index];
    }

    public byte getFieldAsByte(int tag) {
        return getFieldAsByte(tag, 0);
    }

    public long getFieldAsLong(int tag, int index) {
        Integer i = this.fieldIndex.get(Integer.valueOf(tag));
        return this.fields[i.intValue()].getAsLong(index);
    }

    public long getFieldAsLong(int tag) {
        return getFieldAsLong(tag, 0);
    }

    public float getFieldAsFloat(int tag, int index) {
        Integer i = this.fieldIndex.get(Integer.valueOf(tag));
        return this.fields[i.intValue()].getAsFloat(index);
    }

    public float getFieldAsFloat(int tag) {
        return getFieldAsFloat(tag, 0);
    }

    public double getFieldAsDouble(int tag, int index) {
        Integer i = this.fieldIndex.get(Integer.valueOf(tag));
        return this.fields[i.intValue()].getAsDouble(index);
    }

    public double getFieldAsDouble(int tag) {
        return getFieldAsDouble(tag, 0);
    }

    private short readShort(RandomAccessFileOrArray stream) throws IOException {
        if (this.isBigEndian) {
            return stream.readShort();
        }
        return stream.readShortLE();
    }

    private int readUnsignedShort(RandomAccessFileOrArray stream) throws IOException {
        if (this.isBigEndian) {
            return stream.readUnsignedShort();
        }
        return stream.readUnsignedShortLE();
    }

    private int readInt(RandomAccessFileOrArray stream) throws IOException {
        if (this.isBigEndian) {
            return stream.readInt();
        }
        return stream.readIntLE();
    }

    private long readUnsignedInt(RandomAccessFileOrArray stream) throws IOException {
        if (this.isBigEndian) {
            return stream.readUnsignedInt();
        }
        return stream.readUnsignedIntLE();
    }

    private long readLong(RandomAccessFileOrArray stream) throws IOException {
        if (this.isBigEndian) {
            return stream.readLong();
        }
        return stream.readLongLE();
    }

    private float readFloat(RandomAccessFileOrArray stream) throws IOException {
        if (this.isBigEndian) {
            return stream.readFloat();
        }
        return stream.readFloatLE();
    }

    private double readDouble(RandomAccessFileOrArray stream) throws IOException {
        if (this.isBigEndian) {
            return stream.readDouble();
        }
        return stream.readDoubleLE();
    }

    private static int readUnsignedShort(RandomAccessFileOrArray stream, boolean isBigEndian) throws IOException {
        if (isBigEndian) {
            return stream.readUnsignedShort();
        }
        return stream.readUnsignedShortLE();
    }

    private static long readUnsignedInt(RandomAccessFileOrArray stream, boolean isBigEndian) throws IOException {
        if (isBigEndian) {
            return stream.readUnsignedInt();
        }
        return stream.readUnsignedIntLE();
    }

    public static int getNumDirectories(RandomAccessFileOrArray stream) throws IOException {
        long pointer = stream.getPosition();
        stream.seek(0L);
        int endian = stream.readUnsignedShort();
        if (!isValidEndianTag(endian)) {
            throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.BAD_ENDIANNESS_TAG_0X4949_OR_0X4D4D);
        }
        boolean isBigEndian = endian == 19789;
        int magic = readUnsignedShort(stream, isBigEndian);
        if (magic != 42) {
            throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.BAD_MAGIC_NUMBER_SHOULD_BE_42);
        }
        stream.seek(4L);
        long offset = readUnsignedInt(stream, isBigEndian);
        int numDirectories = 0;
        while (offset != 0) {
            numDirectories++;
            try {
                stream.seek(offset);
                int entries = readUnsignedShort(stream, isBigEndian);
                stream.skip(entries * 12);
                offset = readUnsignedInt(stream, isBigEndian);
            } catch (EOFException e) {
                numDirectories--;
            }
        }
        stream.seek(pointer);
        return numDirectories;
    }

    public boolean isBigEndian() {
        return this.isBigEndian;
    }

    public long getIFDOffset() {
        return this.IFDOffset;
    }

    public long getNextIFDOffset() {
        return this.nextIFDOffset;
    }
}
