package androidx.camera.core.internal.compat.quirk;

import android.os.Build;
import androidx.camera.core.ImageProxy;
import androidx.camera.core.impl.Quirk;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;
import kotlin.UByte;
/* loaded from: classes.dex */
public final class IncorrectJpegMetadataQuirk implements Quirk {
    private static final Set<String> SAMSUNG_DEVICES = new HashSet(Arrays.asList("A24"));

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean load() {
        return isSamsungProblematicDevice();
    }

    private static boolean isSamsungProblematicDevice() {
        return "Samsung".equalsIgnoreCase(Build.BRAND) && SAMSUNG_DEVICES.contains(Build.DEVICE.toUpperCase(Locale.US));
    }

    public byte[] jpegImageToJpegByteArray(ImageProxy imageProxy) {
        ByteBuffer byteBuffer = imageProxy.getPlanes()[0].getBuffer();
        byte[] bytes = new byte[byteBuffer.capacity()];
        byteBuffer.rewind();
        byteBuffer.get(bytes);
        int copyStartPos = 0;
        if (!canParseSosMarker(bytes)) {
            int secondFfd8Position = findSecondFfd8Position(bytes);
            if (secondFfd8Position != -1) {
                copyStartPos = secondFfd8Position;
            } else {
                return bytes;
            }
        }
        return Arrays.copyOfRange(bytes, copyStartPos, byteBuffer.limit());
    }

    private boolean canParseSosMarker(byte[] bytes) {
        int markPosition = 2;
        while (markPosition + 4 <= bytes.length && bytes[markPosition] == -1) {
            if (bytes[markPosition] == -1 && bytes[markPosition + 1] == -38) {
                return true;
            }
            int segmentLength = ((bytes[markPosition + 2] & UByte.MAX_VALUE) << 8) | (bytes[markPosition + 3] & UByte.MAX_VALUE);
            markPosition += segmentLength + 2;
        }
        return false;
    }

    private int findSecondFfd8Position(byte[] bytes) {
        for (int position = 2; position + 1 <= bytes.length; position++) {
            if (bytes[position] == -1 && bytes[position + 1] == -40) {
                return position;
            }
        }
        return -1;
    }
}
