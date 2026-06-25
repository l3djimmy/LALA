package com.itextpdf.io.image;

import com.itextpdf.io.codec.CCITTG4Encoder;
import com.itextpdf.io.codec.TIFFFaxDecoder;
import com.itextpdf.io.exceptions.IOException;
import com.itextpdf.io.exceptions.IoExceptionMessageConstant;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes12.dex */
public final class RawImageHelper {
    public static void updateImageAttributes(RawImageData image, Map<String, Object> additional) {
        if (!image.isRawImage()) {
            throw new IllegalArgumentException("Raw image expected.");
        }
        int colorSpace = image.getColorEncodingComponentsNumber();
        int typeCCITT = image.getTypeCcitt();
        if (typeCCITT > 255) {
            if (!image.isMask()) {
                image.setColorEncodingComponentsNumber(1);
            }
            image.setBpc(1);
            image.setFilter("CCITTFaxDecode");
            int k = typeCCITT - 257;
            Map<String, Object> decodeparms = new HashMap<>();
            if (k != 0) {
                decodeparms.put("K", Integer.valueOf(k));
            }
            if ((colorSpace & 1) != 0) {
                decodeparms.put("BlackIs1", true);
            }
            if ((colorSpace & 2) != 0) {
                decodeparms.put("EncodedByteAlign", true);
            }
            if ((colorSpace & 4) != 0) {
                decodeparms.put("EndOfLine", true);
            }
            if ((colorSpace & 8) != 0) {
                decodeparms.put("EndOfBlock", false);
            }
            decodeparms.put(PngImageHelperConstants.COLUMNS, Float.valueOf(image.getWidth()));
            decodeparms.put("Rows", Float.valueOf(image.getHeight()));
            image.decodeParms = decodeparms;
            return;
        }
        switch (colorSpace) {
            case 1:
                if (image.isInverted()) {
                    image.decode = new float[]{1.0f, 0.0f};
                    break;
                }
                break;
            case 2:
            default:
                if (image.isInverted()) {
                    image.decode = new float[]{1.0f, 0.0f, 1.0f, 0.0f, 1.0f, 0.0f, 1.0f, 0.0f};
                    break;
                }
                break;
            case 3:
                if (image.isInverted()) {
                    image.decode = new float[]{1.0f, 0.0f, 1.0f, 0.0f, 1.0f, 0.0f};
                    break;
                }
                break;
        }
        if (additional != null) {
            image.setImageAttributes(additional);
        }
        if (image.isMask() && (image.getBpc() == 1 || image.getBpc() > 8)) {
            image.setColorEncodingComponentsNumber(-1);
        }
        if (image.isDeflated()) {
            image.setFilter("FlateDecode");
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static void updateRawImageParameters(RawImageData image, int width, int height, int components, int bpc, byte[] data) {
        image.setHeight(height);
        image.setWidth(width);
        if (components != 1 && components != 3 && components != 4) {
            throw new IOException(IoExceptionMessageConstant.COMPONENTS_MUST_BE_1_3_OR_4);
        }
        if (bpc != 1 && bpc != 2 && bpc != 4 && bpc != 8) {
            throw new IOException(IoExceptionMessageConstant.BITS_PER_COMPONENT_MUST_BE_1_2_4_OR_8);
        }
        image.setColorEncodingComponentsNumber(components);
        image.setBpc(bpc);
        image.data = data;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static void updateRawImageParameters(RawImageData image, int width, int height, int components, int bpc, byte[] data, int[] transparency) {
        if (transparency != null && transparency.length != components * 2) {
            throw new IOException(IoExceptionMessageConstant.TRANSPARENCY_LENGTH_MUST_BE_EQUAL_TO_2_WITH_CCITT_IMAGES);
        }
        if (components == 1 && bpc == 1) {
            byte[] g4 = CCITTG4Encoder.compress(data, width, height);
            updateRawImageParameters(image, width, height, false, 256, 1, g4, transparency);
            return;
        }
        updateRawImageParameters(image, width, height, components, bpc, data);
        image.setTransparency(transparency);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static void updateRawImageParameters(RawImageData image, int width, int height, boolean reverseBits, int typeCCITT, int parameters, byte[] data, int[] transparency) {
        if (transparency != null && transparency.length != 2) {
            throw new IOException(IoExceptionMessageConstant.TRANSPARENCY_LENGTH_MUST_BE_EQUAL_TO_2_WITH_CCITT_IMAGES);
        }
        updateCcittImageParameters(image, width, height, reverseBits, typeCCITT, parameters, data);
        image.setTransparency(transparency);
    }

    protected static void updateCcittImageParameters(RawImageData image, int width, int height, boolean reverseBits, int typeCcitt, int parameters, byte[] data) {
        if (typeCcitt != 256 && typeCcitt != 257 && typeCcitt != 258) {
            throw new IOException(IoExceptionMessageConstant.CCITT_COMPRESSION_TYPE_MUST_BE_CCITTG4_CCITTG3_1D_OR_CCITTG3_2D);
        }
        if (reverseBits) {
            TIFFFaxDecoder.reverseBits(data);
        }
        image.setHeight(height);
        image.setWidth(width);
        image.setColorEncodingComponentsNumber(parameters);
        image.setTypeCcitt(typeCcitt);
        image.data = data;
    }
}
