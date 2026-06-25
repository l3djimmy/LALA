package androidx.camera.view.video;
/* loaded from: classes.dex */
public class AudioConfig {
    public static final AudioConfig AUDIO_DISABLED = new AudioConfig(false);
    private final boolean mIsAudioEnabled;

    AudioConfig(boolean audioEnabled) {
        this.mIsAudioEnabled = audioEnabled;
    }

    public static AudioConfig create(boolean enableAudio) {
        return new AudioConfig(enableAudio);
    }

    public boolean getAudioEnabled() {
        return this.mIsAudioEnabled;
    }
}
