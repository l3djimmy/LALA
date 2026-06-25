package androidx.camera.video.internal.audio;

import androidx.camera.video.internal.audio.AutoValue_AudioSettings;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
/* loaded from: classes.dex */
public abstract class AudioSettings {
    public static final List<Integer> COMMON_SAMPLE_RATES = Collections.unmodifiableList(Arrays.asList(48000, 44100, 22050, 11025, 8000, 4800));

    public abstract int getAudioFormat();

    public abstract int getAudioSource();

    public abstract int getChannelCount();

    public abstract int getSampleRate();

    public abstract Builder toBuilder();

    public static Builder builder() {
        return new AutoValue_AudioSettings.Builder().setAudioSource(-1).setSampleRate(-1).setChannelCount(-1).setAudioFormat(-1);
    }

    public int getBytesPerFrame() {
        return AudioUtils.getBytesPerFrame(getAudioFormat(), getChannelCount());
    }

    /* loaded from: classes.dex */
    public static abstract class Builder {
        abstract AudioSettings autoBuild();

        public abstract Builder setAudioFormat(int i);

        public abstract Builder setAudioSource(int i);

        public abstract Builder setChannelCount(int i);

        public abstract Builder setSampleRate(int i);

        public final AudioSettings build() {
            AudioSettings settings = autoBuild();
            String missingOrInvalid = settings.getAudioSource() == -1 ? " audioSource" : "";
            if (settings.getSampleRate() <= 0) {
                missingOrInvalid = missingOrInvalid + " sampleRate";
            }
            if (settings.getChannelCount() <= 0) {
                missingOrInvalid = missingOrInvalid + " channelCount";
            }
            if (settings.getAudioFormat() == -1) {
                missingOrInvalid = missingOrInvalid + " audioFormat";
            }
            if (!missingOrInvalid.isEmpty()) {
                throw new IllegalArgumentException("Required settings missing or non-positive:" + missingOrInvalid);
            }
            return settings;
        }
    }
}
