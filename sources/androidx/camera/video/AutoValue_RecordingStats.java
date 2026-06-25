package androidx.camera.video;
/* loaded from: classes.dex */
final class AutoValue_RecordingStats extends RecordingStats {
    private final AudioStats audioStats;
    private final long numBytesRecorded;
    private final long recordedDurationNanos;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_RecordingStats(long recordedDurationNanos, long numBytesRecorded, AudioStats audioStats) {
        this.recordedDurationNanos = recordedDurationNanos;
        this.numBytesRecorded = numBytesRecorded;
        if (audioStats == null) {
            throw new NullPointerException("Null audioStats");
        }
        this.audioStats = audioStats;
    }

    @Override // androidx.camera.video.RecordingStats
    public long getRecordedDurationNanos() {
        return this.recordedDurationNanos;
    }

    @Override // androidx.camera.video.RecordingStats
    public long getNumBytesRecorded() {
        return this.numBytesRecorded;
    }

    @Override // androidx.camera.video.RecordingStats
    public AudioStats getAudioStats() {
        return this.audioStats;
    }

    public String toString() {
        return "RecordingStats{recordedDurationNanos=" + this.recordedDurationNanos + ", numBytesRecorded=" + this.numBytesRecorded + ", audioStats=" + this.audioStats + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof RecordingStats) {
            RecordingStats that = (RecordingStats) o;
            return this.recordedDurationNanos == that.getRecordedDurationNanos() && this.numBytesRecorded == that.getNumBytesRecorded() && this.audioStats.equals(that.getAudioStats());
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((h$ ^ ((int) ((this.recordedDurationNanos >>> 32) ^ this.recordedDurationNanos))) * 1000003) ^ ((int) ((this.numBytesRecorded >>> 32) ^ this.numBytesRecorded))) * 1000003) ^ this.audioStats.hashCode();
    }
}
