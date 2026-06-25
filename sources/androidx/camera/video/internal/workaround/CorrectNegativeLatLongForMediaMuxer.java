package androidx.camera.video.internal.workaround;

import android.util.Pair;
import androidx.camera.video.AudioStats;
import androidx.camera.video.internal.compat.quirk.DeviceQuirks;
import androidx.camera.video.internal.compat.quirk.NegativeLatLongSavesIncorrectlyQuirk;
/* loaded from: classes.dex */
public final class CorrectNegativeLatLongForMediaMuxer {
    private CorrectNegativeLatLongForMediaMuxer() {
    }

    public static Pair<Double, Double> adjustGeoLocation(double latitude, double longitude) {
        if (DeviceQuirks.get(NegativeLatLongSavesIncorrectlyQuirk.class) != null) {
            latitude = adjustInternal(latitude);
            longitude = adjustInternal(longitude);
        }
        return Pair.create(Double.valueOf(latitude), Double.valueOf(longitude));
    }

    private static double adjustInternal(double value) {
        return value >= AudioStats.AUDIO_AMPLITUDE_NONE ? value : ((value * 10000.0d) - 1.0d) / 10000.0d;
    }
}
