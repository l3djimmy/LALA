package androidx.camera.video.internal.workaround;

import androidx.camera.core.Logger;
import androidx.camera.core.impl.Timebase;
import androidx.camera.video.internal.encoder.TimeProvider;
/* loaded from: classes.dex */
public class VideoTimebaseConverter {
    private static final String TAG = "VideoTimebaseConverter";
    private Timebase mInputTimebase;
    private final TimeProvider mTimeProvider;
    private long mUptimeToRealtimeOffsetUs = -1;

    public VideoTimebaseConverter(TimeProvider timeProvider, Timebase inputTimebase) {
        this.mTimeProvider = timeProvider;
        this.mInputTimebase = inputTimebase;
    }

    public long convertToUptimeUs(long timestampUs) {
        if (this.mInputTimebase == null) {
            if (isCloseToRealtime(timestampUs)) {
                this.mInputTimebase = Timebase.REALTIME;
            } else {
                this.mInputTimebase = Timebase.UPTIME;
            }
            Logger.d(TAG, "Detect input timebase = " + this.mInputTimebase);
        }
        switch (this.mInputTimebase) {
            case REALTIME:
                if (this.mUptimeToRealtimeOffsetUs == -1) {
                    this.mUptimeToRealtimeOffsetUs = calculateUptimeToRealtimeOffsetUs();
                    Logger.d(TAG, "mUptimeToRealtimeOffsetUs = " + this.mUptimeToRealtimeOffsetUs);
                }
                return timestampUs - this.mUptimeToRealtimeOffsetUs;
            case UPTIME:
                return timestampUs;
            default:
                throw new AssertionError("Unknown timebase: " + this.mInputTimebase);
        }
    }

    private boolean isCloseToRealtime(long timeUs) {
        long uptimeUs = this.mTimeProvider.uptimeUs();
        long realtimeUs = this.mTimeProvider.realtimeUs();
        return Math.abs(timeUs - realtimeUs) < Math.abs(timeUs - uptimeUs);
    }

    private long calculateUptimeToRealtimeOffsetUs() {
        long bestGap = Long.MAX_VALUE;
        long measured = 0;
        for (int i = 0; i < 3; i++) {
            long uptime1 = this.mTimeProvider.uptimeUs();
            long realtime = this.mTimeProvider.realtimeUs();
            long uptime2 = this.mTimeProvider.uptimeUs();
            long gap = uptime2 - uptime1;
            if (i == 0 || gap < bestGap) {
                bestGap = gap;
                measured = realtime - ((uptime1 + uptime2) >> 1);
            }
        }
        return Math.max(0L, measured);
    }
}
