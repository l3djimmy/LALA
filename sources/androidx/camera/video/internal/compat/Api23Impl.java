package androidx.camera.video.internal.compat;

import android.media.AudioFormat;
import android.media.AudioRecord;
/* loaded from: classes.dex */
public final class Api23Impl {
    private Api23Impl() {
    }

    public static AudioRecord.Builder createAudioRecordBuilder() {
        return new AudioRecord.Builder();
    }

    public static void setAudioSource(AudioRecord.Builder audioRecordBuilder, int audioSource) {
        audioRecordBuilder.setAudioSource(audioSource);
    }

    public static void setAudioFormat(AudioRecord.Builder audioRecordBuilder, AudioFormat audioFormat) {
        audioRecordBuilder.setAudioFormat(audioFormat);
    }

    public static void setBufferSizeInBytes(AudioRecord.Builder audioRecordBuilder, int bufferSizeInBytes) {
        audioRecordBuilder.setBufferSizeInBytes(bufferSizeInBytes);
    }

    public static AudioRecord build(AudioRecord.Builder audioRecordBuilder) {
        return audioRecordBuilder.build();
    }
}
