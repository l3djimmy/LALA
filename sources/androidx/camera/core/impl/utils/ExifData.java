package androidx.camera.core.impl.utils;

import android.os.Build;
import android.util.Pair;
import androidx.camera.core.ImageProxy;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.CameraCaptureMetaData;
import androidx.collection.SieveCacheKt;
import androidx.core.util.Preconditions;
import androidx.exifinterface.media.ExifInterface;
import com.itextpdf.io.codec.TIFFConstants;
import com.itextpdf.layout.properties.Property;
import java.nio.ByteOrder;
import java.util.Arrays;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import okhttp3.internal.ws.WebSocketProtocol;
/* loaded from: classes.dex */
public class ExifData {
    private static final boolean DEBUG = false;
    static final int IFD_TYPE_EXIF = 1;
    static final int IFD_TYPE_GPS = 2;
    static final int IFD_TYPE_INTEROPERABILITY = 3;
    static final int IFD_TYPE_PRIMARY = 0;
    private static final int MM_IN_MICRONS = 1000;
    private static final String TAG = "ExifData";
    private final List<Map<String, ExifAttribute>> mAttributes;
    private final ByteOrder mByteOrder;
    static final String[] IFD_FORMAT_NAMES = {"", "BYTE", "STRING", "USHORT", "ULONG", "URATIONAL", "SBYTE", "UNDEFINED", "SSHORT", "SLONG", "SRATIONAL", "SINGLE", "DOUBLE", "IFD"};
    static final String TAG_SUB_IFD_POINTER = "SubIFDPointer";
    static final String TAG_EXIF_IFD_POINTER = "ExifIFDPointer";
    static final String TAG_GPS_INFO_IFD_POINTER = "GPSInfoIFDPointer";
    private static final ExifTag[] IFD_TIFF_TAGS = {new ExifTag(ExifInterface.TAG_IMAGE_WIDTH, 256, 3, 4), new ExifTag(ExifInterface.TAG_IMAGE_LENGTH, 257, 3, 4), new ExifTag(ExifInterface.TAG_MAKE, TIFFConstants.TIFFTAG_MAKE, 2), new ExifTag(ExifInterface.TAG_MODEL, TIFFConstants.TIFFTAG_MODEL, 2), new ExifTag(ExifInterface.TAG_ORIENTATION, TIFFConstants.TIFFTAG_ORIENTATION, 3), new ExifTag(ExifInterface.TAG_X_RESOLUTION, TIFFConstants.TIFFTAG_XRESOLUTION, 5), new ExifTag(ExifInterface.TAG_Y_RESOLUTION, TIFFConstants.TIFFTAG_YRESOLUTION, 5), new ExifTag(ExifInterface.TAG_RESOLUTION_UNIT, TIFFConstants.TIFFTAG_RESOLUTIONUNIT, 3), new ExifTag(ExifInterface.TAG_SOFTWARE, 305, 2), new ExifTag(ExifInterface.TAG_DATETIME, 306, 2), new ExifTag(ExifInterface.TAG_Y_CB_CR_POSITIONING, 531, 3), new ExifTag(TAG_SUB_IFD_POINTER, TIFFConstants.TIFFTAG_SUBIFD, 4), new ExifTag(TAG_EXIF_IFD_POINTER, 34665, 4), new ExifTag(TAG_GPS_INFO_IFD_POINTER, 34853, 4)};
    static final String TAG_INTEROPERABILITY_IFD_POINTER = "InteroperabilityIFDPointer";
    private static final ExifTag[] IFD_EXIF_TAGS = {new ExifTag(ExifInterface.TAG_EXPOSURE_TIME, 33434, 5), new ExifTag(ExifInterface.TAG_F_NUMBER, 33437, 5), new ExifTag(ExifInterface.TAG_EXPOSURE_PROGRAM, 34850, 3), new ExifTag(ExifInterface.TAG_PHOTOGRAPHIC_SENSITIVITY, 34855, 3), new ExifTag(ExifInterface.TAG_SENSITIVITY_TYPE, 34864, 3), new ExifTag(ExifInterface.TAG_EXIF_VERSION, 36864, 2), new ExifTag(ExifInterface.TAG_DATETIME_ORIGINAL, 36867, 2), new ExifTag(ExifInterface.TAG_DATETIME_DIGITIZED, 36868, 2), new ExifTag(ExifInterface.TAG_COMPONENTS_CONFIGURATION, 37121, 7), new ExifTag(ExifInterface.TAG_SHUTTER_SPEED_VALUE, 37377, 10), new ExifTag(ExifInterface.TAG_APERTURE_VALUE, 37378, 5), new ExifTag(ExifInterface.TAG_BRIGHTNESS_VALUE, 37379, 10), new ExifTag(ExifInterface.TAG_EXPOSURE_BIAS_VALUE, 37380, 10), new ExifTag(ExifInterface.TAG_MAX_APERTURE_VALUE, 37381, 5), new ExifTag(ExifInterface.TAG_METERING_MODE, 37383, 3), new ExifTag(ExifInterface.TAG_LIGHT_SOURCE, 37384, 3), new ExifTag(ExifInterface.TAG_FLASH, 37385, 3), new ExifTag(ExifInterface.TAG_FOCAL_LENGTH, 37386, 5), new ExifTag(ExifInterface.TAG_SUBSEC_TIME, 37520, 2), new ExifTag(ExifInterface.TAG_SUBSEC_TIME_ORIGINAL, 37521, 2), new ExifTag(ExifInterface.TAG_SUBSEC_TIME_DIGITIZED, 37522, 2), new ExifTag(ExifInterface.TAG_FLASHPIX_VERSION, 40960, 7), new ExifTag(ExifInterface.TAG_COLOR_SPACE, 40961, 3), new ExifTag(ExifInterface.TAG_PIXEL_X_DIMENSION, 40962, 3, 4), new ExifTag(ExifInterface.TAG_PIXEL_Y_DIMENSION, 40963, 3, 4), new ExifTag(TAG_INTEROPERABILITY_IFD_POINTER, 40965, 4), new ExifTag(ExifInterface.TAG_FOCAL_PLANE_RESOLUTION_UNIT, 41488, 3), new ExifTag(ExifInterface.TAG_SENSING_METHOD, 41495, 3), new ExifTag(ExifInterface.TAG_FILE_SOURCE, 41728, 7), new ExifTag(ExifInterface.TAG_SCENE_TYPE, 41729, 7), new ExifTag(ExifInterface.TAG_CUSTOM_RENDERED, 41985, 3), new ExifTag(ExifInterface.TAG_EXPOSURE_MODE, 41986, 3), new ExifTag(ExifInterface.TAG_WHITE_BALANCE, 41987, 3), new ExifTag(ExifInterface.TAG_SCENE_CAPTURE_TYPE, 41990, 3), new ExifTag(ExifInterface.TAG_CONTRAST, 41992, 3), new ExifTag(ExifInterface.TAG_SATURATION, 41993, 3), new ExifTag(ExifInterface.TAG_SHARPNESS, 41994, 3)};
    private static final ExifTag[] IFD_GPS_TAGS = {new ExifTag(ExifInterface.TAG_GPS_VERSION_ID, 0, 1), new ExifTag(ExifInterface.TAG_GPS_LATITUDE_REF, 1, 2), new ExifTag(ExifInterface.TAG_GPS_LATITUDE, 2, 5, 10), new ExifTag(ExifInterface.TAG_GPS_LONGITUDE_REF, 3, 2), new ExifTag(ExifInterface.TAG_GPS_LONGITUDE, 4, 5, 10), new ExifTag(ExifInterface.TAG_GPS_ALTITUDE_REF, 5, 1), new ExifTag(ExifInterface.TAG_GPS_ALTITUDE, 6, 5), new ExifTag(ExifInterface.TAG_GPS_TIMESTAMP, 7, 5), new ExifTag(ExifInterface.TAG_GPS_SPEED_REF, 12, 2), new ExifTag(ExifInterface.TAG_GPS_TRACK_REF, 14, 2), new ExifTag(ExifInterface.TAG_GPS_IMG_DIRECTION_REF, 16, 2), new ExifTag(ExifInterface.TAG_GPS_DEST_BEARING_REF, 23, 2), new ExifTag(ExifInterface.TAG_GPS_DEST_DISTANCE_REF, 25, 2)};
    static final ExifTag[] EXIF_POINTER_TAGS = {new ExifTag(TAG_SUB_IFD_POINTER, TIFFConstants.TIFFTAG_SUBIFD, 4), new ExifTag(TAG_EXIF_IFD_POINTER, 34665, 4), new ExifTag(TAG_GPS_INFO_IFD_POINTER, 34853, 4), new ExifTag(TAG_INTEROPERABILITY_IFD_POINTER, 40965, 4)};
    private static final ExifTag[] IFD_INTEROPERABILITY_TAGS = {new ExifTag(ExifInterface.TAG_INTEROPERABILITY_INDEX, 1, 2)};
    static final ExifTag[][] EXIF_TAGS = {IFD_TIFF_TAGS, IFD_EXIF_TAGS, IFD_GPS_TAGS, IFD_INTEROPERABILITY_TAGS};
    static final HashSet<String> sTagSetForCompatibility = new HashSet<>(Arrays.asList(ExifInterface.TAG_F_NUMBER, ExifInterface.TAG_EXPOSURE_TIME, ExifInterface.TAG_GPS_TIMESTAMP));

    /* loaded from: classes.dex */
    public enum WhiteBalanceMode {
        AUTO,
        MANUAL
    }

    ExifData(ByteOrder order, List<Map<String, ExifAttribute>> attributes) {
        Preconditions.checkState(attributes.size() == EXIF_TAGS.length, "Malformed attributes list. Number of IFDs mismatch.");
        this.mByteOrder = order;
        this.mAttributes = attributes;
    }

    public static ExifData create(ImageProxy imageProxy, int rotationDegrees) {
        Builder builder = builderForDevice();
        if (imageProxy.getImageInfo() != null) {
            imageProxy.getImageInfo().populateExifData(builder);
        }
        builder.setOrientationDegrees(rotationDegrees);
        return builder.setImageWidth(imageProxy.getWidth()).setImageHeight(imageProxy.getHeight()).build();
    }

    public ByteOrder getByteOrder() {
        return this.mByteOrder;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Map<String, ExifAttribute> getAttributes(int ifdIndex) {
        Preconditions.checkArgumentInRange(ifdIndex, 0, EXIF_TAGS.length, "Invalid IFD index: " + ifdIndex + ". Index should be between [0, EXIF_TAGS.length] ");
        return this.mAttributes.get(ifdIndex);
    }

    public String getAttribute(String tag) {
        ExifAttribute attribute = getExifAttribute(tag);
        if (attribute == null) {
            return null;
        }
        if (!sTagSetForCompatibility.contains(tag)) {
            return attribute.getStringValue(this.mByteOrder);
        }
        if (tag.equals(ExifInterface.TAG_GPS_TIMESTAMP)) {
            if (attribute.format != 5 && attribute.format != 10) {
                Logger.w(TAG, "GPS Timestamp format is not rational. format=" + attribute.format);
                return null;
            }
            LongRational[] array = (LongRational[]) attribute.getValue(this.mByteOrder);
            if (array == null || array.length != 3) {
                Logger.w(TAG, "Invalid GPS Timestamp array. array=" + Arrays.toString(array));
                return null;
            }
            return String.format(Locale.US, "%02d:%02d:%02d", Integer.valueOf((int) (((float) array[0].getNumerator()) / ((float) array[0].getDenominator()))), Integer.valueOf((int) (((float) array[1].getNumerator()) / ((float) array[1].getDenominator()))), Integer.valueOf((int) (((float) array[2].getNumerator()) / ((float) array[2].getDenominator()))));
        }
        try {
            return Double.toString(attribute.getDoubleValue(this.mByteOrder));
        } catch (NumberFormatException e) {
            return null;
        }
    }

    private ExifAttribute getExifAttribute(String tag) {
        if (ExifInterface.TAG_ISO_SPEED_RATINGS.equals(tag)) {
            tag = ExifInterface.TAG_PHOTOGRAPHIC_SENSITIVITY;
        }
        for (int i = 0; i < EXIF_TAGS.length; i++) {
            ExifAttribute value = this.mAttributes.get(i).get(tag);
            if (value != null) {
                return value;
            }
        }
        return null;
    }

    public static Builder builderForDevice() {
        return new Builder(ByteOrder.BIG_ENDIAN).setAttribute(ExifInterface.TAG_ORIENTATION, String.valueOf(1)).setAttribute(ExifInterface.TAG_X_RESOLUTION, "72/1").setAttribute(ExifInterface.TAG_Y_RESOLUTION, "72/1").setAttribute(ExifInterface.TAG_RESOLUTION_UNIT, String.valueOf(2)).setAttribute(ExifInterface.TAG_Y_CB_CR_POSITIONING, String.valueOf(1)).setAttribute(ExifInterface.TAG_MAKE, Build.MANUFACTURER).setAttribute(ExifInterface.TAG_MODEL, Build.MODEL);
    }

    /* loaded from: classes.dex */
    public static final class Builder {
        private static final int DATETIME_VALUE_STRING_LENGTH = 19;
        final List<Map<String, ExifAttribute>> mAttributes = Collections.list(new Enumeration<Map<String, ExifAttribute>>() { // from class: androidx.camera.core.impl.utils.ExifData.Builder.2
            int mIfdIndex = 0;

            @Override // java.util.Enumeration
            public boolean hasMoreElements() {
                return this.mIfdIndex < ExifData.EXIF_TAGS.length;
            }

            @Override // java.util.Enumeration
            public Map<String, ExifAttribute> nextElement() {
                this.mIfdIndex++;
                return new HashMap();
            }
        });
        private final ByteOrder mByteOrder;
        private static final Pattern GPS_TIMESTAMP_PATTERN = Pattern.compile("^(\\d{2}):(\\d{2}):(\\d{2})$");
        private static final Pattern DATETIME_PRIMARY_FORMAT_PATTERN = Pattern.compile("^(\\d{4}):(\\d{2}):(\\d{2})\\s(\\d{2}):(\\d{2}):(\\d{2})$");
        private static final Pattern DATETIME_SECONDARY_FORMAT_PATTERN = Pattern.compile("^(\\d{4})-(\\d{2})-(\\d{2})\\s(\\d{2}):(\\d{2}):(\\d{2})$");
        static final List<HashMap<String, ExifTag>> sExifTagMapsForWriting = Collections.list(new Enumeration<HashMap<String, ExifTag>>() { // from class: androidx.camera.core.impl.utils.ExifData.Builder.1
            int mIfdIndex = 0;

            @Override // java.util.Enumeration
            public boolean hasMoreElements() {
                return this.mIfdIndex < ExifData.EXIF_TAGS.length;
            }

            @Override // java.util.Enumeration
            public HashMap<String, ExifTag> nextElement() {
                ExifTag[] exifTagArr;
                HashMap<String, ExifTag> map = new HashMap<>();
                for (ExifTag tag : ExifData.EXIF_TAGS[this.mIfdIndex]) {
                    map.put(tag.name, tag);
                }
                this.mIfdIndex++;
                return map;
            }
        });

        Builder(ByteOrder byteOrder) {
            this.mByteOrder = byteOrder;
        }

        public Builder setImageWidth(int width) {
            return setAttribute(ExifInterface.TAG_IMAGE_WIDTH, String.valueOf(width));
        }

        public Builder setImageHeight(int height) {
            return setAttribute(ExifInterface.TAG_IMAGE_LENGTH, String.valueOf(height));
        }

        public Builder setOrientationDegrees(int orientationDegrees) {
            int orientationEnum;
            switch (orientationDegrees) {
                case 0:
                    orientationEnum = 1;
                    break;
                case Property.BACKGROUND_IMAGE /* 90 */:
                    orientationEnum = 6;
                    break;
                case 180:
                    orientationEnum = 3;
                    break;
                case TIFFConstants.TIFFTAG_IMAGEDESCRIPTION /* 270 */:
                    orientationEnum = 8;
                    break;
                default:
                    Logger.w(ExifData.TAG, "Unexpected orientation value: " + orientationDegrees + ". Must be one of 0, 90, 180, 270.");
                    orientationEnum = 0;
                    break;
            }
            return setAttribute(ExifInterface.TAG_ORIENTATION, String.valueOf(orientationEnum));
        }

        public Builder setFlashState(CameraCaptureMetaData.FlashState flashState) {
            short value;
            if (flashState == CameraCaptureMetaData.FlashState.UNKNOWN) {
                return this;
            }
            switch (flashState) {
                case READY:
                    value = 0;
                    break;
                case NONE:
                    value = 32;
                    break;
                case FIRED:
                    value = 1;
                    break;
                default:
                    Logger.w(ExifData.TAG, "Unknown flash state: " + flashState);
                    return this;
            }
            if ((value & 1) == 1) {
                setAttribute(ExifInterface.TAG_LIGHT_SOURCE, String.valueOf(4));
            }
            return setAttribute(ExifInterface.TAG_FLASH, String.valueOf((int) value));
        }

        public Builder setExposureTimeNanos(long exposureTimeNs) {
            return setAttribute(ExifInterface.TAG_EXPOSURE_TIME, String.valueOf(exposureTimeNs / TimeUnit.SECONDS.toNanos(1L)));
        }

        public Builder setLensFNumber(float fNumber) {
            return setAttribute(ExifInterface.TAG_F_NUMBER, String.valueOf(fNumber));
        }

        public Builder setIso(int iso) {
            return setAttribute(ExifInterface.TAG_SENSITIVITY_TYPE, String.valueOf(3)).setAttribute(ExifInterface.TAG_PHOTOGRAPHIC_SENSITIVITY, String.valueOf(Math.min(65535, iso)));
        }

        public Builder setFocalLength(float focalLength) {
            LongRational focalLengthRational = new LongRational(1000.0f * focalLength, 1000L);
            return setAttribute(ExifInterface.TAG_FOCAL_LENGTH, focalLengthRational.toString());
        }

        public Builder setWhiteBalanceMode(WhiteBalanceMode whiteBalanceMode) {
            String wbString = null;
            switch (whiteBalanceMode) {
                case AUTO:
                    wbString = String.valueOf(0);
                    break;
                case MANUAL:
                    wbString = String.valueOf(1);
                    break;
            }
            return setAttribute(ExifInterface.TAG_WHITE_BALANCE, wbString);
        }

        public Builder setAttribute(String tag, String value) {
            setAttributeInternal(tag, value, this.mAttributes);
            return this;
        }

        public Builder removeAttribute(String tag) {
            setAttributeInternal(tag, null, this.mAttributes);
            return this;
        }

        private void setAttributeIfMissing(String tag, String value, List<Map<String, ExifAttribute>> attributes) {
            for (Map<String, ExifAttribute> attrs : attributes) {
                if (attrs.containsKey(tag)) {
                    return;
                }
            }
            setAttributeInternal(tag, value, attributes);
        }

        private void setAttributeInternal(String tag, String value, List<Map<String, ExifAttribute>> attributes) {
            String tag2;
            int i;
            int dataFormat;
            String value2 = value;
            if ((ExifInterface.TAG_DATETIME.equals(tag) || ExifInterface.TAG_DATETIME_ORIGINAL.equals(tag) || ExifInterface.TAG_DATETIME_DIGITIZED.equals(tag)) && value2 != null) {
                boolean isPrimaryFormat = DATETIME_PRIMARY_FORMAT_PATTERN.matcher(value2).find();
                boolean isSecondaryFormat = DATETIME_SECONDARY_FORMAT_PATTERN.matcher(value2).find();
                if (value2.length() != 19 || (!isPrimaryFormat && !isSecondaryFormat)) {
                    Logger.w(ExifData.TAG, "Invalid value for " + tag + " : " + value2);
                    return;
                } else if (isSecondaryFormat) {
                    value2 = value2.replaceAll("-", ":");
                }
            }
            if (!ExifInterface.TAG_ISO_SPEED_RATINGS.equals(tag)) {
                tag2 = tag;
            } else {
                tag2 = ExifInterface.TAG_PHOTOGRAPHIC_SENSITIVITY;
            }
            int i2 = 2;
            int i3 = 1;
            if (value2 != null && ExifData.sTagSetForCompatibility.contains(tag2)) {
                if (tag2.equals(ExifInterface.TAG_GPS_TIMESTAMP)) {
                    Matcher m = GPS_TIMESTAMP_PATTERN.matcher(value2);
                    if (!m.find()) {
                        Logger.w(ExifData.TAG, "Invalid value for " + tag2 + " : " + value2);
                        return;
                    }
                    value2 = Integer.parseInt((String) Preconditions.checkNotNull(m.group(1))) + "/1," + Integer.parseInt((String) Preconditions.checkNotNull(m.group(2))) + "/1," + Integer.parseInt((String) Preconditions.checkNotNull(m.group(3))) + "/1";
                } else {
                    try {
                        double doubleValue = Double.parseDouble(value2);
                        value2 = new LongRational(doubleValue).toString();
                    } catch (NumberFormatException e) {
                        Logger.w(ExifData.TAG, "Invalid value for " + tag2 + " : " + value2, e);
                        return;
                    }
                }
            }
            int i4 = 0;
            while (i4 < ExifData.EXIF_TAGS.length) {
                ExifTag exifTag = sExifTagMapsForWriting.get(i4).get(tag2);
                if (exifTag == null) {
                    i = i3;
                } else if (value2 == null) {
                    attributes.get(i4).remove(tag2);
                    i = i3;
                } else {
                    Pair<Integer, Integer> guess = guessDataFormat(value2);
                    int i5 = -1;
                    if (exifTag.primaryFormat == ((Integer) guess.first).intValue() || exifTag.primaryFormat == ((Integer) guess.second).intValue()) {
                        dataFormat = exifTag.primaryFormat;
                    } else if (exifTag.secondaryFormat != -1 && (exifTag.secondaryFormat == ((Integer) guess.first).intValue() || exifTag.secondaryFormat == ((Integer) guess.second).intValue())) {
                        dataFormat = exifTag.secondaryFormat;
                    } else {
                        int dataFormat2 = exifTag.primaryFormat;
                        if (dataFormat2 == i3 || exifTag.primaryFormat == 7 || exifTag.primaryFormat == i2) {
                            dataFormat = exifTag.primaryFormat;
                        } else {
                            i = i3;
                        }
                    }
                    char c = 0;
                    switch (dataFormat) {
                        case 1:
                            i = i3;
                            attributes.get(i4).put(tag2, ExifAttribute.createByte(value2));
                            continue;
                        case 2:
                        case 7:
                            i = i3;
                            attributes.get(i4).put(tag2, ExifAttribute.createString(value2));
                            continue;
                        case 3:
                            i = i3;
                            String[] values = value2.split(",", -1);
                            int[] intArray = new int[values.length];
                            for (int j = 0; j < values.length; j++) {
                                intArray[j] = Integer.parseInt(values[j]);
                            }
                            attributes.get(i4).put(tag2, ExifAttribute.createUShort(intArray, this.mByteOrder));
                            continue;
                        case 4:
                            i = i3;
                            String[] values2 = value2.split(",", -1);
                            long[] longArray = new long[values2.length];
                            for (int j2 = 0; j2 < values2.length; j2++) {
                                longArray[j2] = Long.parseLong(values2[j2]);
                            }
                            attributes.get(i4).put(tag2, ExifAttribute.createULong(longArray, this.mByteOrder));
                            continue;
                        case 5:
                            i = i3;
                            String[] values3 = value2.split(",", -1);
                            LongRational[] rationalArray = new LongRational[values3.length];
                            int j3 = 0;
                            while (j3 < values3.length) {
                                String[] numbers = values3[j3].split("/", -1);
                                int j4 = j3;
                                rationalArray[j4] = new LongRational((long) Double.parseDouble(numbers[0]), (long) Double.parseDouble(numbers[i]));
                                j3 = j4 + 1;
                                values3 = values3;
                            }
                            attributes.get(i4).put(tag2, ExifAttribute.createURational(rationalArray, this.mByteOrder));
                            continue;
                        case 6:
                        case 8:
                        case 11:
                        default:
                            i = i3;
                            continue;
                        case 9:
                            i = i3;
                            String[] values4 = value2.split(",", -1);
                            int[] intArray2 = new int[values4.length];
                            for (int j5 = 0; j5 < values4.length; j5++) {
                                intArray2[j5] = Integer.parseInt(values4[j5]);
                            }
                            attributes.get(i4).put(tag2, ExifAttribute.createSLong(intArray2, this.mByteOrder));
                            continue;
                        case 10:
                            String[] values5 = value2.split(",", -1);
                            LongRational[] rationalArray2 = new LongRational[values5.length];
                            int j6 = 0;
                            while (j6 < values5.length) {
                                String[] numbers2 = values5[j6].split("/", i5);
                                int i6 = i3;
                                rationalArray2[j6] = new LongRational((long) Double.parseDouble(numbers2[c]), (long) Double.parseDouble(numbers2[i6]));
                                j6++;
                                i3 = i6;
                                c = c;
                                exifTag = exifTag;
                                guess = guess;
                                i5 = -1;
                            }
                            i = i3;
                            attributes.get(i4).put(tag2, ExifAttribute.createSRational(rationalArray2, this.mByteOrder));
                            continue;
                        case 12:
                            String[] values6 = value2.split(",", -1);
                            double[] doubleArray = new double[values6.length];
                            for (int j7 = 0; j7 < values6.length; j7++) {
                                doubleArray[j7] = Double.parseDouble(values6[j7]);
                            }
                            attributes.get(i4).put(tag2, ExifAttribute.createDouble(doubleArray, this.mByteOrder));
                            i = i3;
                            continue;
                    }
                }
                i4++;
                i3 = i;
                i2 = 2;
            }
        }

        public ExifData build() {
            List<Map<String, ExifAttribute>> attributes = Collections.list(new Enumeration<Map<String, ExifAttribute>>() { // from class: androidx.camera.core.impl.utils.ExifData.Builder.3
                final Enumeration<Map<String, ExifAttribute>> mMapEnumeration;

                {
                    this.mMapEnumeration = Collections.enumeration(Builder.this.mAttributes);
                }

                @Override // java.util.Enumeration
                public boolean hasMoreElements() {
                    return this.mMapEnumeration.hasMoreElements();
                }

                @Override // java.util.Enumeration
                public Map<String, ExifAttribute> nextElement() {
                    return new HashMap(this.mMapEnumeration.nextElement());
                }
            });
            if (!attributes.get(1).isEmpty()) {
                setAttributeIfMissing(ExifInterface.TAG_EXPOSURE_PROGRAM, String.valueOf(0), attributes);
                setAttributeIfMissing(ExifInterface.TAG_EXIF_VERSION, "0230", attributes);
                setAttributeIfMissing(ExifInterface.TAG_COMPONENTS_CONFIGURATION, "1,2,3,0", attributes);
                setAttributeIfMissing(ExifInterface.TAG_METERING_MODE, String.valueOf(0), attributes);
                setAttributeIfMissing(ExifInterface.TAG_LIGHT_SOURCE, String.valueOf(0), attributes);
                setAttributeIfMissing(ExifInterface.TAG_FLASHPIX_VERSION, "0100", attributes);
                setAttributeIfMissing(ExifInterface.TAG_FOCAL_PLANE_RESOLUTION_UNIT, String.valueOf(2), attributes);
                setAttributeIfMissing(ExifInterface.TAG_FILE_SOURCE, String.valueOf(3), attributes);
                setAttributeIfMissing(ExifInterface.TAG_SCENE_TYPE, String.valueOf(1), attributes);
                setAttributeIfMissing(ExifInterface.TAG_CUSTOM_RENDERED, String.valueOf(0), attributes);
                setAttributeIfMissing(ExifInterface.TAG_SCENE_CAPTURE_TYPE, String.valueOf(0), attributes);
                setAttributeIfMissing(ExifInterface.TAG_CONTRAST, String.valueOf(0), attributes);
                setAttributeIfMissing(ExifInterface.TAG_SATURATION, String.valueOf(0), attributes);
                setAttributeIfMissing(ExifInterface.TAG_SHARPNESS, String.valueOf(0), attributes);
            }
            if (!attributes.get(2).isEmpty()) {
                setAttributeIfMissing(ExifInterface.TAG_GPS_VERSION_ID, "2300", attributes);
                setAttributeIfMissing(ExifInterface.TAG_GPS_SPEED_REF, "K", attributes);
                setAttributeIfMissing(ExifInterface.TAG_GPS_TRACK_REF, ExifInterface.GPS_DIRECTION_TRUE, attributes);
                setAttributeIfMissing(ExifInterface.TAG_GPS_IMG_DIRECTION_REF, ExifInterface.GPS_DIRECTION_TRUE, attributes);
                setAttributeIfMissing(ExifInterface.TAG_GPS_DEST_BEARING_REF, ExifInterface.GPS_DIRECTION_TRUE, attributes);
                setAttributeIfMissing(ExifInterface.TAG_GPS_DEST_DISTANCE_REF, "K", attributes);
            }
            return new ExifData(this.mByteOrder, attributes);
        }

        private static Pair<Integer, Integer> guessDataFormat(String entryValue) {
            if (entryValue.contains(",")) {
                String[] entryValues = entryValue.split(",", -1);
                Pair<Integer, Integer> dataFormat = guessDataFormat(entryValues[0]);
                if (((Integer) dataFormat.first).intValue() == 2) {
                    return dataFormat;
                }
                for (int i = 1; i < entryValues.length; i++) {
                    Pair<Integer, Integer> guessDataFormat = guessDataFormat(entryValues[i]);
                    int first = -1;
                    int second = -1;
                    if (((Integer) guessDataFormat.first).equals(dataFormat.first) || ((Integer) guessDataFormat.second).equals(dataFormat.first)) {
                        first = ((Integer) dataFormat.first).intValue();
                    }
                    if (((Integer) dataFormat.second).intValue() != -1 && (((Integer) guessDataFormat.first).equals(dataFormat.second) || ((Integer) guessDataFormat.second).equals(dataFormat.second))) {
                        second = ((Integer) dataFormat.second).intValue();
                    }
                    if (first == -1 && second == -1) {
                        return new Pair<>(2, -1);
                    }
                    if (first == -1) {
                        dataFormat = new Pair<>(Integer.valueOf(second), -1);
                    } else if (second == -1) {
                        dataFormat = new Pair<>(Integer.valueOf(first), -1);
                    }
                }
                return dataFormat;
            } else if (entryValue.contains("/")) {
                String[] rationalNumber = entryValue.split("/", -1);
                if (rationalNumber.length == 2) {
                    try {
                        long numerator = (long) Double.parseDouble(rationalNumber[0]);
                        long denominator = (long) Double.parseDouble(rationalNumber[1]);
                        if (numerator >= 0 && denominator >= 0) {
                            if (numerator <= SieveCacheKt.NodeLinkMask && denominator <= SieveCacheKt.NodeLinkMask) {
                                return new Pair<>(10, 5);
                            }
                            return new Pair<>(5, -1);
                        }
                        return new Pair<>(10, -1);
                    } catch (NumberFormatException e) {
                    }
                }
                return new Pair<>(2, -1);
            } else {
                try {
                    long longValue = Long.parseLong(entryValue);
                    if (longValue >= 0 && longValue <= WebSocketProtocol.PAYLOAD_SHORT_MAX) {
                        return new Pair<>(3, 4);
                    }
                    if (longValue < 0) {
                        return new Pair<>(9, -1);
                    }
                    return new Pair<>(4, -1);
                } catch (NumberFormatException e2) {
                    try {
                        Double.parseDouble(entryValue);
                        return new Pair<>(12, -1);
                    } catch (NumberFormatException e3) {
                        return new Pair<>(2, -1);
                    }
                }
            }
        }
    }
}
