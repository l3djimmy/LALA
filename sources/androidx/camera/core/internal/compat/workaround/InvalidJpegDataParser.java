package androidx.camera.core.internal.compat.workaround;

import androidx.camera.core.internal.compat.quirk.DeviceQuirks;
import androidx.camera.core.internal.compat.quirk.LargeJpegImageQuirk;
import kotlin.UByte;
/* loaded from: classes.dex */
public class InvalidJpegDataParser {
    private final boolean mHasQuirk;

    public InvalidJpegDataParser() {
        this.mHasQuirk = DeviceQuirks.get(LargeJpegImageQuirk.class) != null;
    }

    public int getValidDataLength(byte[] bytes) {
        if (!this.mHasQuirk) {
            return bytes.length;
        }
        int markPosition = 2;
        while (markPosition + 4 <= bytes.length && bytes[markPosition] == -1) {
            int segmentLength = ((bytes[markPosition + 2] & UByte.MAX_VALUE) << 8) | (bytes[markPosition + 3] & UByte.MAX_VALUE);
            if (bytes[markPosition] != -1 || bytes[markPosition + 1] != -38) {
                markPosition += segmentLength + 2;
            } else {
                for (int eoiPosition = markPosition + 2; eoiPosition + 2 <= bytes.length; eoiPosition++) {
                    if (bytes[eoiPosition] == -1 && bytes[eoiPosition + 1] == -39) {
                        return eoiPosition + 2;
                    }
                }
                return bytes.length;
            }
        }
        return bytes.length;
    }
}
