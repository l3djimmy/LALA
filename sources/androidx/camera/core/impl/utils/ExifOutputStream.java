package androidx.camera.core.impl.utils;

import androidx.camera.core.impl.utils.ExifData;
import androidx.core.util.Preconditions;
import java.io.BufferedOutputStream;
import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Map;
/* loaded from: classes.dex */
public final class ExifOutputStream extends FilterOutputStream {
    private static final short BYTE_ALIGN_II = 18761;
    private static final short BYTE_ALIGN_MM = 19789;
    private static final boolean DEBUG = false;
    private static final byte[] IDENTIFIER_EXIF_APP1 = "Exif\u0000\u0000".getBytes(ExifAttribute.ASCII);
    private static final int IFD_OFFSET = 8;
    private static final byte START_CODE = 42;
    private static final int STATE_FRAME_HEADER = 1;
    private static final int STATE_JPEG_DATA = 2;
    private static final int STATE_SOI = 0;
    private static final int STREAMBUFFER_SIZE = 65536;
    private static final String TAG = "ExifOutputStream";
    private final ByteBuffer mBuffer;
    private int mByteToCopy;
    private int mByteToSkip;
    private final ExifData mExifData;
    private final byte[] mSingleByteArray;
    private int mState;

    public ExifOutputStream(OutputStream ou, ExifData exifData) {
        super(new BufferedOutputStream(ou, 65536));
        this.mSingleByteArray = new byte[1];
        this.mBuffer = ByteBuffer.allocate(4);
        this.mState = 0;
        this.mExifData = exifData;
    }

    private int requestByteToBuffer(int requestByteCount, byte[] buffer, int offset, int length) {
        int byteNeeded = requestByteCount - this.mBuffer.position();
        int byteToRead = Math.min(length, byteNeeded);
        this.mBuffer.put(buffer, offset, byteToRead);
        return byteToRead;
    }

    /* JADX WARN: Code restructure failed: missing block: B:45:0x010d, code lost:
        if (r11 <= 0) goto L12;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x010f, code lost:
        r8.out.write(r9, r10, r11);
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x0114, code lost:
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:60:?, code lost:
        return;
     */
    @Override // java.io.FilterOutputStream, java.io.OutputStream
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void write(byte[] r9, int r10, int r11) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 286
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.camera.core.impl.utils.ExifOutputStream.write(byte[], int, int):void");
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream
    public void write(int oneByte) throws IOException {
        this.mSingleByteArray[0] = (byte) (oneByte & 255);
        write(this.mSingleByteArray);
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream
    public void write(byte[] buffer) throws IOException {
        write(buffer, 0, buffer.length);
    }

    private void writeExifSegment(ByteOrderedDataOutputStream dataOutputStream) throws IOException {
        ExifTag[] exifTagArr;
        int i;
        ExifData exifData;
        int[] ifdOffsets = new int[ExifData.EXIF_TAGS.length];
        int[] ifdDataSizes = new int[ExifData.EXIF_TAGS.length];
        for (ExifTag tag : ExifData.EXIF_POINTER_TAGS) {
            for (int ifdIndex = 0; ifdIndex < ExifData.EXIF_TAGS.length; ifdIndex++) {
                this.mExifData.getAttributes(ifdIndex).remove(tag.name);
            }
        }
        if (!this.mExifData.getAttributes(1).isEmpty()) {
            this.mExifData.getAttributes(0).put(ExifData.EXIF_POINTER_TAGS[1].name, ExifAttribute.createULong(0L, this.mExifData.getByteOrder()));
        }
        int i2 = 2;
        if (!this.mExifData.getAttributes(2).isEmpty()) {
            this.mExifData.getAttributes(0).put(ExifData.EXIF_POINTER_TAGS[2].name, ExifAttribute.createULong(0L, this.mExifData.getByteOrder()));
        }
        if (!this.mExifData.getAttributes(3).isEmpty()) {
            this.mExifData.getAttributes(1).put(ExifData.EXIF_POINTER_TAGS[3].name, ExifAttribute.createULong(0L, this.mExifData.getByteOrder()));
        }
        int i3 = 0;
        while (true) {
            i = 4;
            if (i3 >= ExifData.EXIF_TAGS.length) {
                break;
            }
            int sum = 0;
            for (Map.Entry<String, ExifAttribute> entry : this.mExifData.getAttributes(i3).entrySet()) {
                ExifAttribute exifAttribute = entry.getValue();
                int size = exifAttribute.size();
                if (size > 4) {
                    sum += size;
                }
            }
            ifdDataSizes[i3] = ifdDataSizes[i3] + sum;
            i3++;
        }
        int position = 8;
        int ifdType = 0;
        while (true) {
            int length = ExifData.EXIF_TAGS.length;
            exifData = this.mExifData;
            if (ifdType >= length) {
                break;
            }
            if (!exifData.getAttributes(ifdType).isEmpty()) {
                ifdOffsets[ifdType] = position;
                position += (this.mExifData.getAttributes(ifdType).size() * 12) + 2 + 4 + ifdDataSizes[ifdType];
            }
            ifdType++;
        }
        int ifdType2 = position;
        int totalSize = ifdType2 + 8;
        if (!exifData.getAttributes(1).isEmpty()) {
            this.mExifData.getAttributes(0).put(ExifData.EXIF_POINTER_TAGS[1].name, ExifAttribute.createULong(ifdOffsets[1], this.mExifData.getByteOrder()));
        }
        if (!this.mExifData.getAttributes(2).isEmpty()) {
            this.mExifData.getAttributes(0).put(ExifData.EXIF_POINTER_TAGS[2].name, ExifAttribute.createULong(ifdOffsets[2], this.mExifData.getByteOrder()));
        }
        if (!this.mExifData.getAttributes(3).isEmpty()) {
            this.mExifData.getAttributes(1).put(ExifData.EXIF_POINTER_TAGS[3].name, ExifAttribute.createULong(ifdOffsets[3], this.mExifData.getByteOrder()));
        }
        dataOutputStream.writeUnsignedShort(totalSize);
        dataOutputStream.write(IDENTIFIER_EXIF_APP1);
        dataOutputStream.writeShort(this.mExifData.getByteOrder() == ByteOrder.BIG_ENDIAN ? BYTE_ALIGN_MM : BYTE_ALIGN_II);
        dataOutputStream.setByteOrder(this.mExifData.getByteOrder());
        dataOutputStream.writeUnsignedShort(42);
        dataOutputStream.writeUnsignedInt(8L);
        int ifdType3 = 0;
        while (ifdType3 < ExifData.EXIF_TAGS.length) {
            if (!this.mExifData.getAttributes(ifdType3).isEmpty()) {
                dataOutputStream.writeUnsignedShort(this.mExifData.getAttributes(ifdType3).size());
                int dataOffset = ifdOffsets[ifdType3] + i2 + (this.mExifData.getAttributes(ifdType3).size() * 12) + i;
                for (Map.Entry<String, ExifAttribute> entry2 : this.mExifData.getAttributes(ifdType3).entrySet()) {
                    ExifTag tag2 = ExifData.Builder.sExifTagMapsForWriting.get(ifdType3).get(entry2.getKey());
                    int tagNumber = ((ExifTag) Preconditions.checkNotNull(tag2, "Tag not supported: " + entry2.getKey() + ". Tag needs to be ported from ExifInterface to ExifData.")).number;
                    ExifAttribute attribute = entry2.getValue();
                    int size2 = attribute.size();
                    dataOutputStream.writeUnsignedShort(tagNumber);
                    dataOutputStream.writeUnsignedShort(attribute.format);
                    dataOutputStream.writeInt(attribute.numberOfComponents);
                    if (size2 > i) {
                        dataOutputStream.writeUnsignedInt(dataOffset);
                        dataOffset += size2;
                    } else {
                        dataOutputStream.write(attribute.bytes);
                        if (size2 < 4) {
                            int i4 = size2;
                            for (int i5 = 4; i4 < i5; i5 = 4) {
                                dataOutputStream.writeByte(0);
                                i4++;
                            }
                        }
                    }
                    i = 4;
                }
                dataOutputStream.writeUnsignedInt(0L);
                for (Map.Entry<String, ExifAttribute> entry3 : this.mExifData.getAttributes(ifdType3).entrySet()) {
                    ExifAttribute attribute2 = entry3.getValue();
                    if (attribute2.bytes.length > 4) {
                        dataOutputStream.write(attribute2.bytes, 0, attribute2.bytes.length);
                    }
                }
            }
            ifdType3++;
            i2 = 2;
            i = 4;
        }
        dataOutputStream.setByteOrder(ByteOrder.BIG_ENDIAN);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static final class JpegHeader {
        public static final short APP1 = -31;
        public static final short DAC = -52;
        public static final short DHT = -60;
        public static final short EOI = -39;
        public static final short JPG = -56;
        public static final short SOF0 = -64;
        public static final short SOF15 = -49;
        public static final short SOI = -40;

        public static boolean isSofMarker(short marker) {
            return (marker < -64 || marker > -49 || marker == -60 || marker == -56 || marker == -52) ? false : true;
        }

        private JpegHeader() {
        }
    }
}
