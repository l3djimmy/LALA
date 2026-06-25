package com.itextpdf.io.image;

import androidx.compose.runtime.ComposerKt;
import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.colors.IccProfile;
import com.itextpdf.io.exceptions.IoExceptionMessageConstant;
import com.itextpdf.io.logs.IoLogMessageConstant;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
class JpegImageHelper {
    private static final int M_APP0 = 224;
    private static final int M_APP2 = 226;
    private static final int M_APPD = 237;
    private static final int M_APPE = 238;
    private static final int NOPARAM_MARKER = 2;
    private static final int NOT_A_MARKER = -1;
    private static final int UNSUPPORTED_MARKER = 1;
    private static final int VALID_MARKER = 0;
    private static final Logger LOGGER = LoggerFactory.getLogger(JpegImageHelper.class);
    private static final int[] VALID_MARKERS = {192, 193, 194};
    private static final int[] UNSUPPORTED_MARKERS = {195, 197, 198, 199, 200, 201, 202, 203, 205, ComposerKt.referenceKey, ComposerKt.reuseKey};
    private static final int[] NOPARAM_MARKERS = {208, 209, 210, 211, 212, 213, 214, 215, 216, 1};
    private static final byte[] JFIF_ID = {74, 70, 73, 70, 0};
    private static final byte[] PS_8BIM_RESO = {56, 66, 73, 77, 3, -19};

    JpegImageHelper() {
    }

    public static void processImage(ImageData image) {
        String errorID;
        if (image.getOriginalType() != ImageType.JPEG) {
            throw new IllegalArgumentException("JPEG image expected");
        }
        InputStream jpegStream = null;
        try {
            try {
                if (image.getData() == null) {
                    image.loadData();
                    errorID = image.getUrl().toString();
                } else {
                    errorID = "Byte array";
                }
                jpegStream = new ByteArrayInputStream(image.getData());
                image.imageSize = image.getData().length;
                processParameters(jpegStream, errorID, image);
                try {
                    jpegStream.close();
                } catch (IOException e) {
                }
                updateAttributes(image);
            } catch (IOException e2) {
                throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.JPEG_IMAGE_EXCEPTION, (Throwable) e2);
            }
        } catch (Throwable th) {
            if (jpegStream != null) {
                try {
                    jpegStream.close();
                } catch (IOException e3) {
                }
            }
            throw th;
        }
    }

    static void attemptToSetIccProfileToImage(byte[][] icc, ImageData image) {
        if (icc != null) {
            int total = 0;
            for (byte[] value : icc) {
                if (value == null) {
                    return;
                }
                total += value.length - 14;
            }
            byte[] ficc = new byte[total];
            int total2 = 0;
            for (byte[] bytes : icc) {
                System.arraycopy(bytes, 14, ficc, total2, bytes.length - 14);
                total2 += bytes.length - 14;
            }
            try {
                image.setProfile(IccProfile.getInstance(ficc, image.getColorEncodingComponentsNumber()));
            } catch (Exception e) {
                LOGGER.error(MessageFormatUtil.format(IoLogMessageConstant.DURING_CONSTRUCTION_OF_ICC_PROFILE_ERROR_OCCURRED, e.getClass().getSimpleName(), e.getMessage()));
            }
        }
    }

    private static void updateAttributes(ImageData image) {
        image.filter = "DCTDecode";
        if (image.getColorTransform() == 0) {
            Map<String, Object> decodeParms = new HashMap<>();
            decodeParms.put("ColorTransform", 0);
            image.decodeParms = decodeParms;
        }
        int colorComponents = image.getColorEncodingComponentsNumber();
        if (colorComponents != 1 && colorComponents != 3 && image.isInverted()) {
            image.decode = new float[]{1.0f, 0.0f, 1.0f, 0.0f, 1.0f, 0.0f, 1.0f, 0.0f};
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:114:0x024a, code lost:
        if (r13 == 2) goto L82;
     */
    /* JADX WARN: Removed duplicated region for block: B:113:0x0249  */
    /* JADX WARN: Removed duplicated region for block: B:116:0x024d  */
    /* JADX WARN: Removed duplicated region for block: B:118:0x0250  */
    /* JADX WARN: Removed duplicated region for block: B:119:0x0257  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static void processParameters(java.io.InputStream r22, java.lang.String r23, com.itextpdf.io.image.ImageData r24) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 810
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.itextpdf.io.image.JpegImageHelper.processParameters(java.io.InputStream, java.lang.String, com.itextpdf.io.image.ImageData):void");
    }

    private static int getShort(InputStream jpegStream) throws IOException {
        return (jpegStream.read() << 8) + jpegStream.read();
    }

    private static int marker(int marker) {
        for (int i = 0; i < VALID_MARKERS.length; i++) {
            if (marker == VALID_MARKERS[i]) {
                return 0;
            }
        }
        for (int i2 = 0; i2 < NOPARAM_MARKERS.length; i2++) {
            if (marker == NOPARAM_MARKERS[i2]) {
                return 2;
            }
        }
        for (int i3 = 0; i3 < UNSUPPORTED_MARKERS.length; i3++) {
            if (marker == UNSUPPORTED_MARKERS[i3]) {
                return 1;
            }
        }
        return -1;
    }
}
