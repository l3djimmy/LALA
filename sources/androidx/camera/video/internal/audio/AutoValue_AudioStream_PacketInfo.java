package androidx.camera.video.internal.audio;

import androidx.camera.video.internal.audio.AudioStream;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class AutoValue_AudioStream_PacketInfo extends AudioStream.PacketInfo {
    private final int sizeInBytes;
    private final long timestampNs;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_AudioStream_PacketInfo(int sizeInBytes, long timestampNs) {
        this.sizeInBytes = sizeInBytes;
        this.timestampNs = timestampNs;
    }

    @Override // androidx.camera.video.internal.audio.AudioStream.PacketInfo
    public int getSizeInBytes() {
        return this.sizeInBytes;
    }

    @Override // androidx.camera.video.internal.audio.AudioStream.PacketInfo
    public long getTimestampNs() {
        return this.timestampNs;
    }

    public String toString() {
        return "PacketInfo{sizeInBytes=" + this.sizeInBytes + ", timestampNs=" + this.timestampNs + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof AudioStream.PacketInfo) {
            AudioStream.PacketInfo that = (AudioStream.PacketInfo) o;
            return this.sizeInBytes == that.getSizeInBytes() && this.timestampNs == that.getTimestampNs();
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((h$ ^ this.sizeInBytes) * 1000003) ^ ((int) ((this.timestampNs >>> 32) ^ this.timestampNs));
    }
}
