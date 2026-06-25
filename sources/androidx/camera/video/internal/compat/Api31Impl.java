package androidx.camera.video.internal.compat;

import android.content.Context;
import android.media.AudioRecord;
import android.media.MediaCodecInfo;
import android.util.Range;
/* loaded from: classes.dex */
public final class Api31Impl {
    private Api31Impl() {
    }

    public static int getMinInputChannelCount(MediaCodecInfo.AudioCapabilities caps) {
        return caps.getMinInputChannelCount();
    }

    public static Range<Integer>[] getInputChannelCountRanges(MediaCodecInfo.AudioCapabilities caps) {
        return caps.getInputChannelCountRanges();
    }

    public static void setContext(AudioRecord.Builder builder, Context context) {
        builder.setContext(context);
    }
}
