package com.itextpdf.io.font.woff2;

import androidx.constraintlayout.core.motion.utils.TypedValues;
import com.itextpdf.io.exceptions.FontCompressionException;
import com.itextpdf.io.exceptions.IoExceptionMessageConstant;
import kotlin.jvm.internal.ByteCompanionObject;
/* loaded from: classes12.dex */
class VariableLength {
    VariableLength() {
    }

    public static int read255UShort(Buffer buf) {
        byte code = buf.readByte();
        if (JavaUnsignedUtil.asU8(code) == 253) {
            short result = buf.readShort();
            return JavaUnsignedUtil.asU16(result);
        } else if (JavaUnsignedUtil.asU8(code) == 255) {
            byte result2 = buf.readByte();
            return JavaUnsignedUtil.asU8(result2) + 253;
        } else if (JavaUnsignedUtil.asU8(code) == 254) {
            byte result3 = buf.readByte();
            return JavaUnsignedUtil.asU8(result3) + TypedValues.PositionType.TYPE_PERCENT_X;
        } else {
            return JavaUnsignedUtil.asU8(code);
        }
    }

    public static int readBase128(Buffer buf) {
        int result = 0;
        for (int i = 0; i < 5; i++) {
            byte code = buf.readByte();
            if (i == 0 && JavaUnsignedUtil.asU8(code) == 128) {
                throw new FontCompressionException(IoExceptionMessageConstant.READ_BASE_128_FAILED);
            }
            if (((-33554432) & result) != 0) {
                throw new FontCompressionException(IoExceptionMessageConstant.READ_BASE_128_FAILED);
            }
            result = (result << 7) | (code & ByteCompanionObject.MAX_VALUE);
            if ((code & ByteCompanionObject.MIN_VALUE) == 0) {
                return result;
            }
        }
        throw new FontCompressionException(IoExceptionMessageConstant.READ_BASE_128_FAILED);
    }
}
