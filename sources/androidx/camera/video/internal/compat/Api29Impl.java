package androidx.camera.video.internal.compat;

import android.media.AudioManager;
import android.media.AudioRecord;
import android.media.AudioRecordingConfiguration;
import java.util.concurrent.Executor;
/* loaded from: classes.dex */
public final class Api29Impl {
    private Api29Impl() {
    }

    public static AudioRecordingConfiguration getActiveRecordingConfiguration(AudioRecord audioRecord) {
        return audioRecord.getActiveRecordingConfiguration();
    }

    public static void registerAudioRecordingCallback(AudioRecord audioRecord, Executor executor, AudioManager.AudioRecordingCallback callback) {
        audioRecord.registerAudioRecordingCallback(executor, callback);
    }

    public static void unregisterAudioRecordingCallback(AudioRecord audioRecord, AudioManager.AudioRecordingCallback callback) {
        audioRecord.unregisterAudioRecordingCallback(callback);
    }

    public static boolean isClientSilenced(AudioRecordingConfiguration configuration) {
        return configuration.isClientSilenced();
    }
}
