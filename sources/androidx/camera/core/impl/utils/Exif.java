package androidx.camera.core.impl.utils;

import android.location.Location;
import androidx.camera.core.ImageProxy;
import androidx.camera.core.Logger;
import androidx.exifinterface.media.ExifInterface;
import com.itextpdf.io.codec.TIFFConstants;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Objects;
/* loaded from: classes.dex */
public final class Exif {
    public static final long INVALID_TIMESTAMP = -1;
    private static final String KILOMETERS_PER_HOUR = "K";
    private static final String KNOTS = "N";
    private static final String MILES_PER_HOUR = "M";
    private final ExifInterface mExifInterface;
    private boolean mRemoveTimestamp = false;
    private static final String TAG = Exif.class.getSimpleName();
    private static final ThreadLocal<SimpleDateFormat> DATE_FORMAT = new ThreadLocal<SimpleDateFormat>() { // from class: androidx.camera.core.impl.utils.Exif.1
        @Override // java.lang.ThreadLocal
        public SimpleDateFormat initialValue() {
            return new SimpleDateFormat("yyyy:MM:dd", Locale.US);
        }
    };
    private static final ThreadLocal<SimpleDateFormat> TIME_FORMAT = new ThreadLocal<SimpleDateFormat>() { // from class: androidx.camera.core.impl.utils.Exif.2
        @Override // java.lang.ThreadLocal
        public SimpleDateFormat initialValue() {
            return new SimpleDateFormat("HH:mm:ss", Locale.US);
        }
    };
    private static final ThreadLocal<SimpleDateFormat> DATETIME_FORMAT = new ThreadLocal<SimpleDateFormat>() { // from class: androidx.camera.core.impl.utils.Exif.3
        @Override // java.lang.ThreadLocal
        public SimpleDateFormat initialValue() {
            return new SimpleDateFormat("yyyy:MM:dd HH:mm:ss", Locale.US);
        }
    };
    private static final List<String> ALL_EXIF_TAGS = getAllExifTags();
    private static final List<String> DO_NOT_COPY_EXIF_TAGS = Arrays.asList(ExifInterface.TAG_IMAGE_WIDTH, ExifInterface.TAG_IMAGE_LENGTH, ExifInterface.TAG_PIXEL_X_DIMENSION, ExifInterface.TAG_PIXEL_Y_DIMENSION, ExifInterface.TAG_COMPRESSION, ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT, ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT_LENGTH, ExifInterface.TAG_THUMBNAIL_IMAGE_LENGTH, ExifInterface.TAG_THUMBNAIL_IMAGE_WIDTH, ExifInterface.TAG_THUMBNAIL_ORIENTATION);

    private Exif(ExifInterface exifInterface) {
        this.mExifInterface = exifInterface;
    }

    public static Exif createFromFile(File file) throws IOException {
        return createFromFileString(file.toString());
    }

    public static Exif createFromImageProxy(ImageProxy imageProxy) throws IOException {
        ByteBuffer buffer = imageProxy.getPlanes()[0].getBuffer();
        buffer.rewind();
        byte[] data = new byte[buffer.capacity()];
        buffer.get(data);
        InputStream inputStream = new ByteArrayInputStream(data);
        return createFromInputStream(inputStream);
    }

    public static Exif createFromFileString(String filePath) throws IOException {
        return new Exif(new ExifInterface(filePath));
    }

    public static Exif createFromInputStream(InputStream is) throws IOException {
        return new Exif(new ExifInterface(is));
    }

    private static String convertToExifDateTime(long timestamp) {
        return DATETIME_FORMAT.get().format(new Date(timestamp));
    }

    private static Date convertFromExifDateTime(String dateTime) throws ParseException {
        return DATETIME_FORMAT.get().parse(dateTime);
    }

    private static Date convertFromExifDate(String date) throws ParseException {
        return DATE_FORMAT.get().parse(date);
    }

    private static Date convertFromExifTime(String time) throws ParseException {
        return TIME_FORMAT.get().parse(time);
    }

    public void save() throws IOException {
        if (!this.mRemoveTimestamp) {
            attachLastModifiedTimestamp();
        }
        this.mExifInterface.saveAttributes();
    }

    public void copyToCroppedImage(Exif croppedExif) {
        List<String> exifTags = new ArrayList<>(ALL_EXIF_TAGS);
        exifTags.removeAll(DO_NOT_COPY_EXIF_TAGS);
        for (String tag : exifTags) {
            String originalValue = this.mExifInterface.getAttribute(tag);
            String croppedExifValue = croppedExif.mExifInterface.getAttribute(tag);
            if (originalValue != null && !Objects.equals(originalValue, croppedExifValue)) {
                croppedExif.mExifInterface.setAttribute(tag, originalValue);
            }
        }
    }

    public String toString() {
        return String.format(Locale.ENGLISH, "Exif{width=%s, height=%s, rotation=%d, isFlippedVertically=%s, isFlippedHorizontally=%s, location=%s, timestamp=%s, description=%s}", Integer.valueOf(getWidth()), Integer.valueOf(getHeight()), Integer.valueOf(getRotation()), Boolean.valueOf(isFlippedVertically()), Boolean.valueOf(isFlippedHorizontally()), getLocation(), Long.valueOf(getTimestamp()), getDescription());
    }

    public int getOrientation() {
        return this.mExifInterface.getAttributeInt(ExifInterface.TAG_ORIENTATION, 0);
    }

    public void setOrientation(int orientation) {
        this.mExifInterface.setAttribute(ExifInterface.TAG_ORIENTATION, String.valueOf(orientation));
    }

    public int getWidth() {
        return this.mExifInterface.getAttributeInt(ExifInterface.TAG_IMAGE_WIDTH, 0);
    }

    public int getHeight() {
        return this.mExifInterface.getAttributeInt(ExifInterface.TAG_IMAGE_LENGTH, 0);
    }

    public String getDescription() {
        return this.mExifInterface.getAttribute(ExifInterface.TAG_IMAGE_DESCRIPTION);
    }

    public void setDescription(String description) {
        this.mExifInterface.setAttribute(ExifInterface.TAG_IMAGE_DESCRIPTION, description);
    }

    public int getRotation() {
        switch (getOrientation()) {
            case 2:
                return 0;
            case 3:
                return 180;
            case 4:
                return 180;
            case 5:
                return TIFFConstants.TIFFTAG_IMAGEDESCRIPTION;
            case 6:
                return 90;
            case 7:
                return 90;
            case 8:
                return TIFFConstants.TIFFTAG_IMAGEDESCRIPTION;
            default:
                return 0;
        }
    }

    public boolean isFlippedVertically() {
        switch (getOrientation()) {
            case 2:
                return false;
            case 3:
                return false;
            case 4:
                return true;
            case 5:
                return true;
            case 6:
                return false;
            case 7:
                return true;
            case 8:
                return false;
            default:
                return false;
        }
    }

    public boolean isFlippedHorizontally() {
        switch (getOrientation()) {
            case 2:
                return true;
            case 3:
                return false;
            case 4:
                return false;
            case 5:
                return false;
            case 6:
                return false;
            case 7:
                return false;
            case 8:
                return false;
            default:
                return false;
        }
    }

    private void attachLastModifiedTimestamp() {
        long now = System.currentTimeMillis();
        String datetime = convertToExifDateTime(now);
        this.mExifInterface.setAttribute(ExifInterface.TAG_DATETIME, datetime);
        try {
            String subsec = Long.toString(now - convertFromExifDateTime(datetime).getTime());
            this.mExifInterface.setAttribute(ExifInterface.TAG_SUBSEC_TIME, subsec);
        } catch (ParseException e) {
        }
    }

    public long getLastModifiedTimestamp() {
        long timestamp = parseTimestamp(this.mExifInterface.getAttribute(ExifInterface.TAG_DATETIME));
        if (timestamp == -1) {
            return -1L;
        }
        String subSecs = this.mExifInterface.getAttribute(ExifInterface.TAG_SUBSEC_TIME);
        if (subSecs != null) {
            try {
                long sub = Long.parseLong(subSecs);
                while (sub > 1000) {
                    sub /= 10;
                }
                return timestamp + sub;
            } catch (NumberFormatException e) {
                return timestamp;
            }
        }
        return timestamp;
    }

    public long getTimestamp() {
        long timestamp = parseTimestamp(this.mExifInterface.getAttribute(ExifInterface.TAG_DATETIME_ORIGINAL));
        if (timestamp == -1) {
            return -1L;
        }
        String subSecs = this.mExifInterface.getAttribute(ExifInterface.TAG_SUBSEC_TIME_ORIGINAL);
        if (subSecs != null) {
            try {
                long sub = Long.parseLong(subSecs);
                while (sub > 1000) {
                    sub /= 10;
                }
                return timestamp + sub;
            } catch (NumberFormatException e) {
                return timestamp;
            }
        }
        return timestamp;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x0082, code lost:
        if (r11.equals("M") != false) goto L20;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public android.location.Location getLocation() {
        /*
            r18 = this;
            r0 = r18
            androidx.exifinterface.media.ExifInterface r1 = r0.mExifInterface
            java.lang.String r2 = "GPSProcessingMethod"
            java.lang.String r1 = r1.getAttribute(r2)
            androidx.exifinterface.media.ExifInterface r2 = r0.mExifInterface
            double[] r2 = r2.getLatLong()
            androidx.exifinterface.media.ExifInterface r3 = r0.mExifInterface
            r4 = 0
            double r6 = r3.getAltitude(r4)
            androidx.exifinterface.media.ExifInterface r3 = r0.mExifInterface
            java.lang.String r8 = "GPSSpeed"
            double r8 = r3.getAttributeDouble(r8, r4)
            androidx.exifinterface.media.ExifInterface r3 = r0.mExifInterface
            java.lang.String r10 = "GPSSpeedRef"
            java.lang.String r3 = r3.getAttribute(r10)
            java.lang.String r10 = "K"
            if (r3 != 0) goto L2e
            r11 = r10
            goto L2f
        L2e:
            r11 = r3
        L2f:
            androidx.exifinterface.media.ExifInterface r3 = r0.mExifInterface
            java.lang.String r12 = "GPSDateStamp"
            java.lang.String r3 = r3.getAttribute(r12)
            androidx.exifinterface.media.ExifInterface r12 = r0.mExifInterface
            java.lang.String r13 = "GPSTimeStamp"
            java.lang.String r12 = r12.getAttribute(r13)
            long r12 = r0.parseTimestamp(r3, r12)
            if (r2 != 0) goto L47
            r3 = 0
            return r3
        L47:
            if (r1 != 0) goto L4b
            java.lang.String r1 = androidx.camera.core.impl.utils.Exif.TAG
        L4b:
            android.location.Location r3 = new android.location.Location
            r3.<init>(r1)
            r14 = 0
            r15 = r4
            r4 = r2[r14]
            r3.setLatitude(r4)
            r17 = 1
            r4 = r2[r17]
            r3.setLongitude(r4)
            int r4 = (r6 > r15 ? 1 : (r6 == r15 ? 0 : -1))
            if (r4 == 0) goto L65
            r3.setAltitude(r6)
        L65:
            int r4 = (r8 > r15 ? 1 : (r8 == r15 ? 0 : -1))
            if (r4 == 0) goto Lb2
            int r4 = r11.hashCode()
            switch(r4) {
                case 75: goto L85;
                case 76: goto L70;
                case 77: goto L7c;
                case 78: goto L71;
                default: goto L70;
            }
        L70:
            goto L8d
        L71:
            java.lang.String r4 = "N"
            boolean r4 = r11.equals(r4)
            if (r4 == 0) goto L70
            r14 = r17
            goto L8e
        L7c:
            java.lang.String r4 = "M"
            boolean r4 = r11.equals(r4)
            if (r4 == 0) goto L70
            goto L8e
        L85:
            boolean r4 = r11.equals(r10)
            if (r4 == 0) goto L70
            r14 = 2
            goto L8e
        L8d:
            r14 = -1
        L8e:
            switch(r14) {
                case 0: goto La5;
                case 1: goto L9b;
                default: goto L91;
            }
        L91:
            androidx.camera.core.impl.utils.Exif$Speed$Converter r4 = androidx.camera.core.impl.utils.Exif.Speed.fromKilometersPerHour(r8)
            double r4 = r4.toMetersPerSecond()
            r8 = r4
            goto Lae
        L9b:
            androidx.camera.core.impl.utils.Exif$Speed$Converter r4 = androidx.camera.core.impl.utils.Exif.Speed.fromKnots(r8)
            double r4 = r4.toMetersPerSecond()
            r8 = r4
            goto Lae
        La5:
            androidx.camera.core.impl.utils.Exif$Speed$Converter r4 = androidx.camera.core.impl.utils.Exif.Speed.fromMilesPerHour(r8)
            double r4 = r4.toMetersPerSecond()
            r8 = r4
        Lae:
            float r4 = (float) r8
            r3.setSpeed(r4)
        Lb2:
            r4 = -1
            int r4 = (r12 > r4 ? 1 : (r12 == r4 ? 0 : -1))
            if (r4 == 0) goto Lbb
            r3.setTime(r12)
        Lbb:
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.camera.core.impl.utils.Exif.getLocation():android.location.Location");
    }

    public void rotate(int degrees) {
        if (degrees % 90 != 0) {
            Logger.w(TAG, String.format(Locale.US, "Can only rotate in right angles (eg. 0, 90, 180, 270). %d is unsupported.", Integer.valueOf(degrees)));
            this.mExifInterface.setAttribute(ExifInterface.TAG_ORIENTATION, String.valueOf(0));
            return;
        }
        int degrees2 = degrees % 360;
        int orientation = getOrientation();
        while (degrees2 < 0) {
            degrees2 += 90;
            switch (orientation) {
                case 2:
                    orientation = 5;
                    break;
                case 3:
                    orientation = 6;
                    break;
                case 4:
                    orientation = 7;
                    break;
                case 5:
                    orientation = 4;
                    break;
                case 6:
                    orientation = 1;
                    break;
                case 7:
                    orientation = 2;
                    break;
                case 8:
                    orientation = 6;
                    break;
                default:
                    orientation = 8;
                    break;
            }
        }
        while (degrees2 > 0) {
            degrees2 -= 90;
            switch (orientation) {
                case 2:
                    orientation = 7;
                    break;
                case 3:
                    orientation = 8;
                    break;
                case 4:
                    orientation = 5;
                    break;
                case 5:
                    orientation = 2;
                    break;
                case 6:
                    orientation = 3;
                    break;
                case 7:
                    orientation = 4;
                    break;
                case 8:
                    orientation = 1;
                    break;
                default:
                    orientation = 6;
                    break;
            }
        }
        this.mExifInterface.setAttribute(ExifInterface.TAG_ORIENTATION, String.valueOf(orientation));
    }

    public void flipVertically() {
        int orientation;
        switch (getOrientation()) {
            case 2:
                orientation = 3;
                break;
            case 3:
                orientation = 2;
                break;
            case 4:
                orientation = 1;
                break;
            case 5:
                orientation = 8;
                break;
            case 6:
                orientation = 7;
                break;
            case 7:
                orientation = 6;
                break;
            case 8:
                orientation = 5;
                break;
            default:
                orientation = 4;
                break;
        }
        this.mExifInterface.setAttribute(ExifInterface.TAG_ORIENTATION, String.valueOf(orientation));
    }

    public void flipHorizontally() {
        int orientation;
        switch (getOrientation()) {
            case 2:
                orientation = 1;
                break;
            case 3:
                orientation = 4;
                break;
            case 4:
                orientation = 3;
                break;
            case 5:
                orientation = 6;
                break;
            case 6:
                orientation = 5;
                break;
            case 7:
                orientation = 8;
                break;
            case 8:
                orientation = 7;
                break;
            default:
                orientation = 2;
                break;
        }
        this.mExifInterface.setAttribute(ExifInterface.TAG_ORIENTATION, String.valueOf(orientation));
    }

    public ExifInterface getExifInterface() {
        return this.mExifInterface;
    }

    public void attachTimestamp() {
        long now = System.currentTimeMillis();
        String datetime = convertToExifDateTime(now);
        this.mExifInterface.setAttribute(ExifInterface.TAG_DATETIME_ORIGINAL, datetime);
        this.mExifInterface.setAttribute(ExifInterface.TAG_DATETIME_DIGITIZED, datetime);
        try {
            String subsec = Long.toString(now - convertFromExifDateTime(datetime).getTime());
            this.mExifInterface.setAttribute(ExifInterface.TAG_SUBSEC_TIME_ORIGINAL, subsec);
            this.mExifInterface.setAttribute(ExifInterface.TAG_SUBSEC_TIME_DIGITIZED, subsec);
        } catch (ParseException e) {
        }
        this.mRemoveTimestamp = false;
    }

    public void removeTimestamp() {
        this.mExifInterface.setAttribute(ExifInterface.TAG_DATETIME, null);
        this.mExifInterface.setAttribute(ExifInterface.TAG_DATETIME_ORIGINAL, null);
        this.mExifInterface.setAttribute(ExifInterface.TAG_DATETIME_DIGITIZED, null);
        this.mExifInterface.setAttribute(ExifInterface.TAG_SUBSEC_TIME, null);
        this.mExifInterface.setAttribute(ExifInterface.TAG_SUBSEC_TIME_ORIGINAL, null);
        this.mExifInterface.setAttribute(ExifInterface.TAG_SUBSEC_TIME_DIGITIZED, null);
        this.mRemoveTimestamp = true;
    }

    public void attachLocation(Location location) {
        this.mExifInterface.setGpsInfo(location);
    }

    public void removeLocation() {
        this.mExifInterface.setAttribute(ExifInterface.TAG_GPS_PROCESSING_METHOD, null);
        this.mExifInterface.setAttribute(ExifInterface.TAG_GPS_LATITUDE, null);
        this.mExifInterface.setAttribute(ExifInterface.TAG_GPS_LATITUDE_REF, null);
        this.mExifInterface.setAttribute(ExifInterface.TAG_GPS_LONGITUDE, null);
        this.mExifInterface.setAttribute(ExifInterface.TAG_GPS_LONGITUDE_REF, null);
        this.mExifInterface.setAttribute(ExifInterface.TAG_GPS_ALTITUDE, null);
        this.mExifInterface.setAttribute(ExifInterface.TAG_GPS_ALTITUDE_REF, null);
        this.mExifInterface.setAttribute(ExifInterface.TAG_GPS_SPEED, null);
        this.mExifInterface.setAttribute(ExifInterface.TAG_GPS_SPEED_REF, null);
        this.mExifInterface.setAttribute(ExifInterface.TAG_GPS_DATESTAMP, null);
        this.mExifInterface.setAttribute(ExifInterface.TAG_GPS_TIMESTAMP, null);
    }

    private long parseTimestamp(String date, String time) {
        if (date == null && time == null) {
            return -1L;
        }
        if (time == null) {
            try {
                return convertFromExifDate(date).getTime();
            } catch (ParseException e) {
                return -1L;
            }
        } else if (date == null) {
            try {
                return convertFromExifTime(time).getTime();
            } catch (ParseException e2) {
                return -1L;
            }
        } else {
            return parseTimestamp(date + " " + time);
        }
    }

    private long parseTimestamp(String datetime) {
        if (datetime == null) {
            return -1L;
        }
        try {
            return convertFromExifDateTime(datetime).getTime();
        } catch (ParseException e) {
            return -1L;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static final class Speed {
        private Speed() {
        }

        static Converter fromKilometersPerHour(double kph) {
            return new Converter(0.621371d * kph);
        }

        static Converter fromMilesPerHour(double mph) {
            return new Converter(mph);
        }

        static Converter fromKnots(double knots) {
            return new Converter(1.15078d * knots);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* loaded from: classes.dex */
        public static final class Converter {
            final double mMph;

            Converter(double mph) {
                this.mMph = mph;
            }

            double toMetersPerSecond() {
                return this.mMph / 2.23694d;
            }
        }
    }

    public static List<String> getAllExifTags() {
        return Arrays.asList(ExifInterface.TAG_IMAGE_WIDTH, ExifInterface.TAG_IMAGE_LENGTH, ExifInterface.TAG_BITS_PER_SAMPLE, ExifInterface.TAG_COMPRESSION, ExifInterface.TAG_PHOTOMETRIC_INTERPRETATION, ExifInterface.TAG_ORIENTATION, ExifInterface.TAG_SAMPLES_PER_PIXEL, ExifInterface.TAG_PLANAR_CONFIGURATION, ExifInterface.TAG_Y_CB_CR_SUB_SAMPLING, ExifInterface.TAG_Y_CB_CR_POSITIONING, ExifInterface.TAG_X_RESOLUTION, ExifInterface.TAG_Y_RESOLUTION, ExifInterface.TAG_RESOLUTION_UNIT, ExifInterface.TAG_STRIP_OFFSETS, ExifInterface.TAG_ROWS_PER_STRIP, ExifInterface.TAG_STRIP_BYTE_COUNTS, ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT, ExifInterface.TAG_JPEG_INTERCHANGE_FORMAT_LENGTH, ExifInterface.TAG_TRANSFER_FUNCTION, ExifInterface.TAG_WHITE_POINT, ExifInterface.TAG_PRIMARY_CHROMATICITIES, ExifInterface.TAG_Y_CB_CR_COEFFICIENTS, ExifInterface.TAG_REFERENCE_BLACK_WHITE, ExifInterface.TAG_DATETIME, ExifInterface.TAG_IMAGE_DESCRIPTION, ExifInterface.TAG_MAKE, ExifInterface.TAG_MODEL, ExifInterface.TAG_SOFTWARE, ExifInterface.TAG_ARTIST, ExifInterface.TAG_COPYRIGHT, ExifInterface.TAG_EXIF_VERSION, ExifInterface.TAG_FLASHPIX_VERSION, ExifInterface.TAG_COLOR_SPACE, ExifInterface.TAG_GAMMA, ExifInterface.TAG_PIXEL_X_DIMENSION, ExifInterface.TAG_PIXEL_Y_DIMENSION, ExifInterface.TAG_COMPONENTS_CONFIGURATION, ExifInterface.TAG_COMPRESSED_BITS_PER_PIXEL, ExifInterface.TAG_MAKER_NOTE, ExifInterface.TAG_USER_COMMENT, ExifInterface.TAG_RELATED_SOUND_FILE, ExifInterface.TAG_DATETIME_ORIGINAL, ExifInterface.TAG_DATETIME_DIGITIZED, ExifInterface.TAG_OFFSET_TIME, ExifInterface.TAG_OFFSET_TIME_ORIGINAL, ExifInterface.TAG_OFFSET_TIME_DIGITIZED, ExifInterface.TAG_SUBSEC_TIME, ExifInterface.TAG_SUBSEC_TIME_ORIGINAL, ExifInterface.TAG_SUBSEC_TIME_DIGITIZED, ExifInterface.TAG_EXPOSURE_TIME, ExifInterface.TAG_F_NUMBER, ExifInterface.TAG_EXPOSURE_PROGRAM, ExifInterface.TAG_SPECTRAL_SENSITIVITY, ExifInterface.TAG_PHOTOGRAPHIC_SENSITIVITY, ExifInterface.TAG_OECF, ExifInterface.TAG_SENSITIVITY_TYPE, ExifInterface.TAG_STANDARD_OUTPUT_SENSITIVITY, ExifInterface.TAG_RECOMMENDED_EXPOSURE_INDEX, ExifInterface.TAG_ISO_SPEED, ExifInterface.TAG_ISO_SPEED_LATITUDE_YYY, ExifInterface.TAG_ISO_SPEED_LATITUDE_ZZZ, ExifInterface.TAG_SHUTTER_SPEED_VALUE, ExifInterface.TAG_APERTURE_VALUE, ExifInterface.TAG_BRIGHTNESS_VALUE, ExifInterface.TAG_EXPOSURE_BIAS_VALUE, ExifInterface.TAG_MAX_APERTURE_VALUE, ExifInterface.TAG_SUBJECT_DISTANCE, ExifInterface.TAG_METERING_MODE, ExifInterface.TAG_LIGHT_SOURCE, ExifInterface.TAG_FLASH, ExifInterface.TAG_SUBJECT_AREA, ExifInterface.TAG_FOCAL_LENGTH, ExifInterface.TAG_FLASH_ENERGY, ExifInterface.TAG_SPATIAL_FREQUENCY_RESPONSE, ExifInterface.TAG_FOCAL_PLANE_X_RESOLUTION, ExifInterface.TAG_FOCAL_PLANE_Y_RESOLUTION, ExifInterface.TAG_FOCAL_PLANE_RESOLUTION_UNIT, ExifInterface.TAG_SUBJECT_LOCATION, ExifInterface.TAG_EXPOSURE_INDEX, ExifInterface.TAG_SENSING_METHOD, ExifInterface.TAG_FILE_SOURCE, ExifInterface.TAG_SCENE_TYPE, ExifInterface.TAG_CFA_PATTERN, ExifInterface.TAG_CUSTOM_RENDERED, ExifInterface.TAG_EXPOSURE_MODE, ExifInterface.TAG_WHITE_BALANCE, ExifInterface.TAG_DIGITAL_ZOOM_RATIO, ExifInterface.TAG_FOCAL_LENGTH_IN_35MM_FILM, ExifInterface.TAG_SCENE_CAPTURE_TYPE, ExifInterface.TAG_GAIN_CONTROL, ExifInterface.TAG_CONTRAST, ExifInterface.TAG_SATURATION, ExifInterface.TAG_SHARPNESS, ExifInterface.TAG_DEVICE_SETTING_DESCRIPTION, ExifInterface.TAG_SUBJECT_DISTANCE_RANGE, ExifInterface.TAG_IMAGE_UNIQUE_ID, "CameraOwnerName", ExifInterface.TAG_BODY_SERIAL_NUMBER, ExifInterface.TAG_LENS_SPECIFICATION, ExifInterface.TAG_LENS_MAKE, ExifInterface.TAG_LENS_MODEL, ExifInterface.TAG_LENS_SERIAL_NUMBER, ExifInterface.TAG_GPS_VERSION_ID, ExifInterface.TAG_GPS_LATITUDE_REF, ExifInterface.TAG_GPS_LATITUDE, ExifInterface.TAG_GPS_LONGITUDE_REF, ExifInterface.TAG_GPS_LONGITUDE, ExifInterface.TAG_GPS_ALTITUDE_REF, ExifInterface.TAG_GPS_ALTITUDE, ExifInterface.TAG_GPS_TIMESTAMP, ExifInterface.TAG_GPS_SATELLITES, ExifInterface.TAG_GPS_STATUS, ExifInterface.TAG_GPS_MEASURE_MODE, ExifInterface.TAG_GPS_DOP, ExifInterface.TAG_GPS_SPEED_REF, ExifInterface.TAG_GPS_SPEED, ExifInterface.TAG_GPS_TRACK_REF, ExifInterface.TAG_GPS_TRACK, ExifInterface.TAG_GPS_IMG_DIRECTION_REF, ExifInterface.TAG_GPS_IMG_DIRECTION, ExifInterface.TAG_GPS_MAP_DATUM, ExifInterface.TAG_GPS_DEST_LATITUDE_REF, ExifInterface.TAG_GPS_DEST_LATITUDE, ExifInterface.TAG_GPS_DEST_LONGITUDE_REF, ExifInterface.TAG_GPS_DEST_LONGITUDE, ExifInterface.TAG_GPS_DEST_BEARING_REF, ExifInterface.TAG_GPS_DEST_BEARING, ExifInterface.TAG_GPS_DEST_DISTANCE_REF, ExifInterface.TAG_GPS_DEST_DISTANCE, ExifInterface.TAG_GPS_PROCESSING_METHOD, ExifInterface.TAG_GPS_AREA_INFORMATION, ExifInterface.TAG_GPS_DATESTAMP, ExifInterface.TAG_GPS_DIFFERENTIAL, ExifInterface.TAG_GPS_H_POSITIONING_ERROR, ExifInterface.TAG_INTEROPERABILITY_INDEX, ExifInterface.TAG_THUMBNAIL_IMAGE_LENGTH, ExifInterface.TAG_THUMBNAIL_IMAGE_WIDTH, ExifInterface.TAG_THUMBNAIL_ORIENTATION, ExifInterface.TAG_DNG_VERSION, ExifInterface.TAG_DEFAULT_CROP_SIZE, ExifInterface.TAG_ORF_THUMBNAIL_IMAGE, ExifInterface.TAG_ORF_PREVIEW_IMAGE_START, ExifInterface.TAG_ORF_PREVIEW_IMAGE_LENGTH, ExifInterface.TAG_ORF_ASPECT_FRAME, ExifInterface.TAG_RW2_SENSOR_BOTTOM_BORDER, ExifInterface.TAG_RW2_SENSOR_LEFT_BORDER, ExifInterface.TAG_RW2_SENSOR_RIGHT_BORDER, ExifInterface.TAG_RW2_SENSOR_TOP_BORDER, ExifInterface.TAG_RW2_ISO, ExifInterface.TAG_RW2_JPG_FROM_RAW, ExifInterface.TAG_XMP, ExifInterface.TAG_NEW_SUBFILE_TYPE, ExifInterface.TAG_SUBFILE_TYPE);
    }
}
