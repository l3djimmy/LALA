package androidx.camera.video;

import androidx.camera.core.SurfaceRequest;
import androidx.camera.video.StreamInfo;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class AutoValue_StreamInfo extends StreamInfo {
    private final int id;
    private final SurfaceRequest.TransformationInfo inProgressTransformationInfo;
    private final StreamInfo.StreamState streamState;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_StreamInfo(int id, StreamInfo.StreamState streamState, SurfaceRequest.TransformationInfo inProgressTransformationInfo) {
        this.id = id;
        if (streamState == null) {
            throw new NullPointerException("Null streamState");
        }
        this.streamState = streamState;
        this.inProgressTransformationInfo = inProgressTransformationInfo;
    }

    @Override // androidx.camera.video.StreamInfo
    public int getId() {
        return this.id;
    }

    @Override // androidx.camera.video.StreamInfo
    public StreamInfo.StreamState getStreamState() {
        return this.streamState;
    }

    @Override // androidx.camera.video.StreamInfo
    public SurfaceRequest.TransformationInfo getInProgressTransformationInfo() {
        return this.inProgressTransformationInfo;
    }

    public String toString() {
        return "StreamInfo{id=" + this.id + ", streamState=" + this.streamState + ", inProgressTransformationInfo=" + this.inProgressTransformationInfo + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof StreamInfo) {
            StreamInfo that = (StreamInfo) o;
            if (this.id == that.getId() && this.streamState.equals(that.getStreamState())) {
                if (this.inProgressTransformationInfo == null) {
                    if (that.getInProgressTransformationInfo() == null) {
                        return true;
                    }
                } else if (this.inProgressTransformationInfo.equals(that.getInProgressTransformationInfo())) {
                    return true;
                }
            }
            return false;
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((h$ ^ this.id) * 1000003) ^ this.streamState.hashCode()) * 1000003) ^ (this.inProgressTransformationInfo == null ? 0 : this.inProgressTransformationInfo.hashCode());
    }
}
