package androidx.camera.core.impl.utils;

import androidx.camera.core.Logger;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
/* loaded from: classes.dex */
final class ExifAttribute {
    public static final long BYTES_OFFSET_UNKNOWN = -1;
    static final int IFD_FORMAT_BYTE = 1;
    static final int IFD_FORMAT_DOUBLE = 12;
    static final int IFD_FORMAT_SBYTE = 6;
    static final int IFD_FORMAT_SINGLE = 11;
    static final int IFD_FORMAT_SLONG = 9;
    static final int IFD_FORMAT_SRATIONAL = 10;
    static final int IFD_FORMAT_SSHORT = 8;
    static final int IFD_FORMAT_STRING = 2;
    static final int IFD_FORMAT_ULONG = 4;
    static final int IFD_FORMAT_UNDEFINED = 7;
    static final int IFD_FORMAT_URATIONAL = 5;
    static final int IFD_FORMAT_USHORT = 3;
    private static final String TAG = "ExifAttribute";
    public final byte[] bytes;
    public final long bytesOffset;
    public final int format;
    public final int numberOfComponents;
    static final Charset ASCII = StandardCharsets.US_ASCII;
    static final String[] IFD_FORMAT_NAMES = {"", "BYTE", "STRING", "USHORT", "ULONG", "URATIONAL", "SBYTE", "UNDEFINED", "SSHORT", "SLONG", "SRATIONAL", "SINGLE", "DOUBLE", "IFD"};
    static final int[] IFD_FORMAT_BYTES_PER_FORMAT = {0, 1, 1, 2, 4, 8, 1, 1, 2, 4, 8, 4, 8, 1};
    static final byte[] EXIF_ASCII_PREFIX = {65, 83, 67, 73, 73, 0, 0, 0};

    ExifAttribute(int format, int numberOfComponents, byte[] bytes) {
        this(format, numberOfComponents, -1L, bytes);
    }

    ExifAttribute(int format, int numberOfComponents, long bytesOffset, byte[] bytes) {
        this.format = format;
        this.numberOfComponents = numberOfComponents;
        this.bytesOffset = bytesOffset;
        this.bytes = bytes;
    }

    public static ExifAttribute createUShort(int[] values, ByteOrder byteOrder) {
        ByteBuffer buffer = ByteBuffer.wrap(new byte[IFD_FORMAT_BYTES_PER_FORMAT[3] * values.length]);
        buffer.order(byteOrder);
        for (int value : values) {
            buffer.putShort((short) value);
        }
        return new ExifAttribute(3, values.length, buffer.array());
    }

    public static ExifAttribute createUShort(int value, ByteOrder byteOrder) {
        return createUShort(new int[]{value}, byteOrder);
    }

    public static ExifAttribute createULong(long[] values, ByteOrder byteOrder) {
        ByteBuffer buffer = ByteBuffer.wrap(new byte[IFD_FORMAT_BYTES_PER_FORMAT[4] * values.length]);
        buffer.order(byteOrder);
        for (long value : values) {
            buffer.putInt((int) value);
        }
        return new ExifAttribute(4, values.length, buffer.array());
    }

    public static ExifAttribute createULong(long value, ByteOrder byteOrder) {
        return createULong(new long[]{value}, byteOrder);
    }

    public static ExifAttribute createSLong(int[] values, ByteOrder byteOrder) {
        ByteBuffer buffer = ByteBuffer.wrap(new byte[IFD_FORMAT_BYTES_PER_FORMAT[9] * values.length]);
        buffer.order(byteOrder);
        for (int value : values) {
            buffer.putInt(value);
        }
        return new ExifAttribute(9, values.length, buffer.array());
    }

    public static ExifAttribute createSLong(int value, ByteOrder byteOrder) {
        return createSLong(new int[]{value}, byteOrder);
    }

    public static ExifAttribute createByte(String value) {
        if (value.length() == 1 && value.charAt(0) >= '0' && value.charAt(0) <= '1') {
            byte[] bytes = {(byte) (value.charAt(0) - '0')};
            return new ExifAttribute(1, bytes.length, bytes);
        }
        byte[] ascii = value.getBytes(ASCII);
        return new ExifAttribute(1, ascii.length, ascii);
    }

    public static ExifAttribute createString(String value) {
        byte[] ascii = (value + (char) 0).getBytes(ASCII);
        return new ExifAttribute(2, ascii.length, ascii);
    }

    public static ExifAttribute createURational(LongRational[] values, ByteOrder byteOrder) {
        ByteBuffer buffer = ByteBuffer.wrap(new byte[IFD_FORMAT_BYTES_PER_FORMAT[5] * values.length]);
        buffer.order(byteOrder);
        for (LongRational value : values) {
            buffer.putInt((int) value.getNumerator());
            buffer.putInt((int) value.getDenominator());
        }
        return new ExifAttribute(5, values.length, buffer.array());
    }

    public static ExifAttribute createURational(LongRational value, ByteOrder byteOrder) {
        return createURational(new LongRational[]{value}, byteOrder);
    }

    public static ExifAttribute createSRational(LongRational[] values, ByteOrder byteOrder) {
        ByteBuffer buffer = ByteBuffer.wrap(new byte[IFD_FORMAT_BYTES_PER_FORMAT[10] * values.length]);
        buffer.order(byteOrder);
        for (LongRational value : values) {
            buffer.putInt((int) value.getNumerator());
            buffer.putInt((int) value.getDenominator());
        }
        return new ExifAttribute(10, values.length, buffer.array());
    }

    public static ExifAttribute createSRational(LongRational value, ByteOrder byteOrder) {
        return createSRational(new LongRational[]{value}, byteOrder);
    }

    public static ExifAttribute createDouble(double[] values, ByteOrder byteOrder) {
        ByteBuffer buffer = ByteBuffer.wrap(new byte[IFD_FORMAT_BYTES_PER_FORMAT[12] * values.length]);
        buffer.order(byteOrder);
        for (double value : values) {
            buffer.putDouble(value);
        }
        return new ExifAttribute(12, values.length, buffer.array());
    }

    public static ExifAttribute createDouble(double value, ByteOrder byteOrder) {
        return createDouble(new double[]{value}, byteOrder);
    }

    public String toString() {
        return "(" + IFD_FORMAT_NAMES[this.format] + ", data length:" + this.bytes.length + ")";
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Object getValue(ByteOrder byteOrder) {
        int ch;
        ByteOrderedDataInputStream inputStream = null;
        try {
            try {
                ByteOrderedDataInputStream inputStream2 = new ByteOrderedDataInputStream(this.bytes);
                inputStream2.setByteOrder(byteOrder);
                switch (this.format) {
                    case 1:
                    case 6:
                        if (this.bytes.length != 1 || this.bytes[0] < 0 || this.bytes[0] > 1) {
                            String str = new String(this.bytes, ASCII);
                            try {
                                inputStream2.close();
                            } catch (IOException e) {
                                Logger.e(TAG, "IOException occurred while closing InputStream", e);
                            }
                            return str;
                        }
                        String str2 = new String(new char[]{(char) (this.bytes[0] + 48)});
                        try {
                            inputStream2.close();
                        } catch (IOException e2) {
                            Logger.e(TAG, "IOException occurred while closing InputStream", e2);
                        }
                        return str2;
                    case 2:
                    case 7:
                        int index = 0;
                        if (this.numberOfComponents >= EXIF_ASCII_PREFIX.length) {
                            boolean same = true;
                            int i = 0;
                            while (true) {
                                if (i < EXIF_ASCII_PREFIX.length) {
                                    if (this.bytes[i] != EXIF_ASCII_PREFIX[i]) {
                                        same = false;
                                    } else {
                                        i++;
                                    }
                                }
                            }
                            if (same) {
                                index = EXIF_ASCII_PREFIX.length;
                            }
                        }
                        StringBuilder stringBuilder = new StringBuilder();
                        while (index < this.numberOfComponents && (ch = this.bytes[index]) != 0) {
                            if (ch >= 32) {
                                stringBuilder.append((char) ch);
                            } else {
                                stringBuilder.append('?');
                            }
                            index++;
                        }
                        String sb = stringBuilder.toString();
                        try {
                            inputStream2.close();
                        } catch (IOException e3) {
                            Logger.e(TAG, "IOException occurred while closing InputStream", e3);
                        }
                        return sb;
                    case 3:
                        int[] values = new int[this.numberOfComponents];
                        for (int i2 = 0; i2 < this.numberOfComponents; i2++) {
                            values[i2] = inputStream2.readUnsignedShort();
                        }
                        try {
                            inputStream2.close();
                        } catch (IOException e4) {
                            Logger.e(TAG, "IOException occurred while closing InputStream", e4);
                        }
                        return values;
                    case 4:
                        long[] values2 = new long[this.numberOfComponents];
                        for (int i3 = 0; i3 < this.numberOfComponents; i3++) {
                            values2[i3] = inputStream2.readUnsignedInt();
                        }
                        try {
                            inputStream2.close();
                        } catch (IOException e5) {
                            Logger.e(TAG, "IOException occurred while closing InputStream", e5);
                        }
                        return values2;
                    case 5:
                        LongRational[] values3 = new LongRational[this.numberOfComponents];
                        for (int i4 = 0; i4 < this.numberOfComponents; i4++) {
                            long numerator = inputStream2.readUnsignedInt();
                            long denominator = inputStream2.readUnsignedInt();
                            values3[i4] = new LongRational(numerator, denominator);
                        }
                        try {
                            inputStream2.close();
                        } catch (IOException e6) {
                            Logger.e(TAG, "IOException occurred while closing InputStream", e6);
                        }
                        return values3;
                    case 8:
                        int[] values4 = new int[this.numberOfComponents];
                        for (int i5 = 0; i5 < this.numberOfComponents; i5++) {
                            values4[i5] = inputStream2.readShort();
                        }
                        try {
                            inputStream2.close();
                        } catch (IOException e7) {
                            Logger.e(TAG, "IOException occurred while closing InputStream", e7);
                        }
                        return values4;
                    case 9:
                        int[] values5 = new int[this.numberOfComponents];
                        for (int i6 = 0; i6 < this.numberOfComponents; i6++) {
                            values5[i6] = inputStream2.readInt();
                        }
                        try {
                            inputStream2.close();
                        } catch (IOException e8) {
                            Logger.e(TAG, "IOException occurred while closing InputStream", e8);
                        }
                        return values5;
                    case 10:
                        LongRational[] values6 = new LongRational[this.numberOfComponents];
                        for (int i7 = 0; i7 < this.numberOfComponents; i7++) {
                            long numerator2 = inputStream2.readInt();
                            long denominator2 = inputStream2.readInt();
                            values6[i7] = new LongRational(numerator2, denominator2);
                        }
                        try {
                            inputStream2.close();
                        } catch (IOException e9) {
                            Logger.e(TAG, "IOException occurred while closing InputStream", e9);
                        }
                        return values6;
                    case 11:
                        double[] values7 = new double[this.numberOfComponents];
                        for (int i8 = 0; i8 < this.numberOfComponents; i8++) {
                            values7[i8] = inputStream2.readFloat();
                        }
                        try {
                            inputStream2.close();
                        } catch (IOException e10) {
                            Logger.e(TAG, "IOException occurred while closing InputStream", e10);
                        }
                        return values7;
                    case 12:
                        double[] values8 = new double[this.numberOfComponents];
                        for (int i9 = 0; i9 < this.numberOfComponents; i9++) {
                            values8[i9] = inputStream2.readDouble();
                        }
                        try {
                            inputStream2.close();
                        } catch (IOException e11) {
                            Logger.e(TAG, "IOException occurred while closing InputStream", e11);
                        }
                        return values8;
                    default:
                        try {
                            inputStream2.close();
                        } catch (IOException e12) {
                            Logger.e(TAG, "IOException occurred while closing InputStream", e12);
                        }
                        return null;
                }
            } catch (IOException e13) {
                Logger.w(TAG, "IOException occurred during reading a value", e13);
                if (0 != 0) {
                    try {
                        inputStream.close();
                    } catch (IOException e14) {
                        Logger.e(TAG, "IOException occurred while closing InputStream", e14);
                    }
                }
                return null;
            }
        } catch (Throwable th) {
            if (0 != 0) {
                try {
                    inputStream.close();
                } catch (IOException e15) {
                    Logger.e(TAG, "IOException occurred while closing InputStream", e15);
                }
            }
            throw th;
        }
    }

    public double getDoubleValue(ByteOrder byteOrder) {
        Object value = getValue(byteOrder);
        if (value == null) {
            throw new NumberFormatException("NULL can't be converted to a double value");
        }
        if (value instanceof String) {
            return Double.parseDouble((String) value);
        }
        if (value instanceof long[]) {
            long[] array = (long[]) value;
            if (array.length == 1) {
                return array[0];
            }
            throw new NumberFormatException("There are more than one component");
        } else if (value instanceof int[]) {
            int[] array2 = (int[]) value;
            if (array2.length == 1) {
                return array2[0];
            }
            throw new NumberFormatException("There are more than one component");
        } else if (value instanceof double[]) {
            double[] array3 = (double[]) value;
            if (array3.length == 1) {
                return array3[0];
            }
            throw new NumberFormatException("There are more than one component");
        } else if (value instanceof LongRational[]) {
            LongRational[] array4 = (LongRational[]) value;
            if (array4.length == 1) {
                return array4[0].toDouble();
            }
            throw new NumberFormatException("There are more than one component");
        } else {
            throw new NumberFormatException("Couldn't find a double value");
        }
    }

    public int getIntValue(ByteOrder byteOrder) {
        Object value = getValue(byteOrder);
        if (value == null) {
            throw new NumberFormatException("NULL can't be converted to a integer value");
        }
        if (value instanceof String) {
            return Integer.parseInt((String) value);
        }
        if (value instanceof long[]) {
            long[] array = (long[]) value;
            if (array.length == 1) {
                return (int) array[0];
            }
            throw new NumberFormatException("There are more than one component");
        } else if (value instanceof int[]) {
            int[] array2 = (int[]) value;
            if (array2.length == 1) {
                return array2[0];
            }
            throw new NumberFormatException("There are more than one component");
        } else {
            throw new NumberFormatException("Couldn't find a integer value");
        }
    }

    public String getStringValue(ByteOrder byteOrder) {
        Object value = getValue(byteOrder);
        if (value == null) {
            return null;
        }
        if (value instanceof String) {
            return (String) value;
        }
        StringBuilder stringBuilder = new StringBuilder();
        if (value instanceof long[]) {
            long[] array = (long[]) value;
            for (int i = 0; i < array.length; i++) {
                stringBuilder.append(array[i]);
                if (i + 1 != array.length) {
                    stringBuilder.append(",");
                }
            }
            return stringBuilder.toString();
        } else if (value instanceof int[]) {
            int[] array2 = (int[]) value;
            for (int i2 = 0; i2 < array2.length; i2++) {
                stringBuilder.append(array2[i2]);
                if (i2 + 1 != array2.length) {
                    stringBuilder.append(",");
                }
            }
            return stringBuilder.toString();
        } else if (value instanceof double[]) {
            double[] array3 = (double[]) value;
            for (int i3 = 0; i3 < array3.length; i3++) {
                stringBuilder.append(array3[i3]);
                if (i3 + 1 != array3.length) {
                    stringBuilder.append(",");
                }
            }
            return stringBuilder.toString();
        } else if (!(value instanceof LongRational[])) {
            return null;
        } else {
            LongRational[] array4 = (LongRational[]) value;
            for (int i4 = 0; i4 < array4.length; i4++) {
                stringBuilder.append(array4[i4].getNumerator());
                stringBuilder.append('/');
                stringBuilder.append(array4[i4].getDenominator());
                if (i4 + 1 != array4.length) {
                    stringBuilder.append(",");
                }
            }
            return stringBuilder.toString();
        }
    }

    public int size() {
        return IFD_FORMAT_BYTES_PER_FORMAT[this.format] * this.numberOfComponents;
    }
}
