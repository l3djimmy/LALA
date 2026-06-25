package androidx.camera.video;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class AutoValue_AudioStats extends AudioStats {
    private final double audioAmplitudeInternal;
    private final int audioState;
    private final Throwable errorCause;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_AudioStats(int audioState, double audioAmplitudeInternal, Throwable errorCause) {
        this.audioState = audioState;
        this.audioAmplitudeInternal = audioAmplitudeInternal;
        this.errorCause = errorCause;
    }

    @Override // androidx.camera.video.AudioStats
    public int getAudioState() {
        return this.audioState;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // androidx.camera.video.AudioStats
    public double getAudioAmplitudeInternal() {
        return this.audioAmplitudeInternal;
    }

    @Override // androidx.camera.video.AudioStats
    public Throwable getErrorCause() {
        return this.errorCause;
    }

    public String toString() {
        return "AudioStats{audioState=" + this.audioState + ", audioAmplitudeInternal=" + this.audioAmplitudeInternal + ", errorCause=" + this.errorCause + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof AudioStats) {
            AudioStats that = (AudioStats) o;
            if (this.audioState == that.getAudioState() && Double.doubleToLongBits(this.audioAmplitudeInternal) == Double.doubleToLongBits(that.getAudioAmplitudeInternal())) {
                if (this.errorCause == null) {
                    if (that.getErrorCause() == null) {
                        return true;
                    }
                } else if (this.errorCause.equals(that.getErrorCause())) {
                    return true;
                }
            }
            return false;
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((h$ ^ this.audioState) * 1000003) ^ ((int) ((Double.doubleToLongBits(this.audioAmplitudeInternal) >>> 32) ^ Double.doubleToLongBits(this.audioAmplitudeInternal)))) * 1000003) ^ (this.errorCause == null ? 0 : this.errorCause.hashCode());
    }
}
