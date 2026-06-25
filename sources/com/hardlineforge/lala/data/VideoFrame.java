package com.hardlineforge.lala.data;

import java.time.Instant;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: Entities.kt */
@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0013\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0087\b\u0018\u00002\u00020\u0001B;\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\b\u001a\u00020\u0003\u0012\b\b\u0002\u0010\t\u001a\u00020\n¢\u0006\u0004\b\u000b\u0010\fJ\t\u0010\u0016\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0017\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0018\u001a\u00020\u0006HÆ\u0003J\t\u0010\u0019\u001a\u00020\u0006HÆ\u0003J\t\u0010\u001a\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001b\u001a\u00020\nHÆ\u0003JE\u0010\u001c\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00062\b\b\u0002\u0010\u0007\u001a\u00020\u00062\b\b\u0002\u0010\b\u001a\u00020\u00032\b\b\u0002\u0010\t\u001a\u00020\nHÆ\u0001J\u0013\u0010\u001d\u001a\u00020\u001e2\b\u0010\u001f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010 \u001a\u00020\u0006HÖ\u0001J\t\u0010!\u001a\u00020\u0003HÖ\u0001R\u0016\u0010\u0002\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u000eR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0011\u0010\u0007\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0011R\u0011\u0010\b\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u000eR\u0011\u0010\t\u001a\u00020\n¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015¨\u0006\""}, d2 = {"Lcom/hardlineforge/lala/data/VideoFrame;", "", "id", "", "videoId", "frameNumber", "", "timeOffsetMs", "uri", "extractedAt", "Ljava/time/Instant;", "<init>", "(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/time/Instant;)V", "getId", "()Ljava/lang/String;", "getVideoId", "getFrameNumber", "()I", "getTimeOffsetMs", "getUri", "getExtractedAt", "()Ljava/time/Instant;", "component1", "component2", "component3", "component4", "component5", "component6", "copy", "equals", "", "other", "hashCode", "toString", "app_debug"}, k = 1, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes7.dex */
public final class VideoFrame {
    public static final int $stable = 8;
    private final Instant extractedAt;
    private final int frameNumber;
    private final String id;
    private final int timeOffsetMs;
    private final String uri;
    private final String videoId;

    public static /* synthetic */ VideoFrame copy$default(VideoFrame videoFrame, String str, String str2, int i, int i2, String str3, Instant instant, int i3, Object obj) {
        if ((i3 & 1) != 0) {
            str = videoFrame.id;
        }
        if ((i3 & 2) != 0) {
            str2 = videoFrame.videoId;
        }
        if ((i3 & 4) != 0) {
            i = videoFrame.frameNumber;
        }
        if ((i3 & 8) != 0) {
            i2 = videoFrame.timeOffsetMs;
        }
        if ((i3 & 16) != 0) {
            str3 = videoFrame.uri;
        }
        if ((i3 & 32) != 0) {
            instant = videoFrame.extractedAt;
        }
        String str4 = str3;
        Instant instant2 = instant;
        return videoFrame.copy(str, str2, i, i2, str4, instant2);
    }

    public final String component1() {
        return this.id;
    }

    public final String component2() {
        return this.videoId;
    }

    public final int component3() {
        return this.frameNumber;
    }

    public final int component4() {
        return this.timeOffsetMs;
    }

    public final String component5() {
        return this.uri;
    }

    public final Instant component6() {
        return this.extractedAt;
    }

    public final VideoFrame copy(String id, String videoId, int i, int i2, String uri, Instant extractedAt) {
        Intrinsics.checkNotNullParameter(id, "id");
        Intrinsics.checkNotNullParameter(videoId, "videoId");
        Intrinsics.checkNotNullParameter(uri, "uri");
        Intrinsics.checkNotNullParameter(extractedAt, "extractedAt");
        return new VideoFrame(id, videoId, i, i2, uri, extractedAt);
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof VideoFrame) {
            VideoFrame videoFrame = (VideoFrame) obj;
            return Intrinsics.areEqual(this.id, videoFrame.id) && Intrinsics.areEqual(this.videoId, videoFrame.videoId) && this.frameNumber == videoFrame.frameNumber && this.timeOffsetMs == videoFrame.timeOffsetMs && Intrinsics.areEqual(this.uri, videoFrame.uri) && Intrinsics.areEqual(this.extractedAt, videoFrame.extractedAt);
        }
        return false;
    }

    public int hashCode() {
        return (((((((((this.id.hashCode() * 31) + this.videoId.hashCode()) * 31) + Integer.hashCode(this.frameNumber)) * 31) + Integer.hashCode(this.timeOffsetMs)) * 31) + this.uri.hashCode()) * 31) + this.extractedAt.hashCode();
    }

    public String toString() {
        String str = this.id;
        String str2 = this.videoId;
        int i = this.frameNumber;
        int i2 = this.timeOffsetMs;
        String str3 = this.uri;
        return "VideoFrame(id=" + str + ", videoId=" + str2 + ", frameNumber=" + i + ", timeOffsetMs=" + i2 + ", uri=" + str3 + ", extractedAt=" + this.extractedAt + ")";
    }

    public VideoFrame(String id, String videoId, int frameNumber, int timeOffsetMs, String uri, Instant extractedAt) {
        Intrinsics.checkNotNullParameter(id, "id");
        Intrinsics.checkNotNullParameter(videoId, "videoId");
        Intrinsics.checkNotNullParameter(uri, "uri");
        Intrinsics.checkNotNullParameter(extractedAt, "extractedAt");
        this.id = id;
        this.videoId = videoId;
        this.frameNumber = frameNumber;
        this.timeOffsetMs = timeOffsetMs;
        this.uri = uri;
        this.extractedAt = extractedAt;
    }

    /* JADX WARN: Illegal instructions before constructor call */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public /* synthetic */ VideoFrame(java.lang.String r8, java.lang.String r9, int r10, int r11, java.lang.String r12, java.time.Instant r13, int r14, kotlin.jvm.internal.DefaultConstructorMarker r15) {
        /*
            r7 = this;
            r15 = r14 & 1
            if (r15 == 0) goto L13
            java.util.UUID r8 = java.util.UUID.randomUUID()
            java.lang.String r8 = r8.toString()
            java.lang.String r15 = "toString(...)"
            kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r8, r15)
            r1 = r8
            goto L14
        L13:
            r1 = r8
        L14:
            r8 = r14 & 32
            if (r8 == 0) goto L23
            java.time.Instant r13 = java.time.Instant.now()
            java.lang.String r8 = "now(...)"
            kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r13, r8)
            r6 = r13
            goto L24
        L23:
            r6 = r13
        L24:
            r0 = r7
            r2 = r9
            r3 = r10
            r4 = r11
            r5 = r12
            r0.<init>(r1, r2, r3, r4, r5, r6)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.hardlineforge.lala.data.VideoFrame.<init>(java.lang.String, java.lang.String, int, int, java.lang.String, java.time.Instant, int, kotlin.jvm.internal.DefaultConstructorMarker):void");
    }

    public final String getId() {
        return this.id;
    }

    public final String getVideoId() {
        return this.videoId;
    }

    public final int getFrameNumber() {
        return this.frameNumber;
    }

    public final int getTimeOffsetMs() {
        return this.timeOffsetMs;
    }

    public final String getUri() {
        return this.uri;
    }

    public final Instant getExtractedAt() {
        return this.extractedAt;
    }
}
