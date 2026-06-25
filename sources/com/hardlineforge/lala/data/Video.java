package com.hardlineforge.lala.data;

import java.time.Instant;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: Entities.kt */
@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0006\n\u0002\b\u001b\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0087\b\u0018\u00002\u00020\u0001BW\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\t\u001a\u00020\n\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\f\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\f¢\u0006\u0004\b\u000e\u0010\u000fJ\t\u0010\u001d\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001f\u001a\u00020\u0003HÆ\u0003J\t\u0010 \u001a\u00020\u0007HÆ\u0003J\u000b\u0010!\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\t\u0010\"\u001a\u00020\nHÆ\u0003J\u0010\u0010#\u001a\u0004\u0018\u00010\fHÆ\u0003¢\u0006\u0002\u0010\u001aJ\u0010\u0010$\u001a\u0004\u0018\u00010\fHÆ\u0003¢\u0006\u0002\u0010\u001aJd\u0010%\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\t\u001a\u00020\n2\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\f2\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\fHÆ\u0001¢\u0006\u0002\u0010&J\u0013\u0010'\u001a\u00020(2\b\u0010)\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010*\u001a\u00020\u0007HÖ\u0001J\t\u0010+\u001a\u00020\u0003HÖ\u0001R\u0016\u0010\u0002\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0011R\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0011R\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R\u0013\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0011R\u0011\u0010\t\u001a\u00020\n¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0018R\u0015\u0010\u000b\u001a\u0004\u0018\u00010\f¢\u0006\n\n\u0002\u0010\u001b\u001a\u0004\b\u0019\u0010\u001aR\u0015\u0010\r\u001a\u0004\u0018\u00010\f¢\u0006\n\n\u0002\u0010\u001b\u001a\u0004\b\u001c\u0010\u001a¨\u0006,"}, d2 = {"Lcom/hardlineforge/lala/data/Video;", "", "id", "", "entryId", "uri", "durationSeconds", "", "thumbnailUri", "timestamp", "Ljava/time/Instant;", "gpsLat", "", "gpsLon", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/time/Instant;Ljava/lang/Double;Ljava/lang/Double;)V", "getId", "()Ljava/lang/String;", "getEntryId", "getUri", "getDurationSeconds", "()I", "getThumbnailUri", "getTimestamp", "()Ljava/time/Instant;", "getGpsLat", "()Ljava/lang/Double;", "Ljava/lang/Double;", "getGpsLon", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/time/Instant;Ljava/lang/Double;Ljava/lang/Double;)Lcom/hardlineforge/lala/data/Video;", "equals", "", "other", "hashCode", "toString", "app_debug"}, k = 1, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes7.dex */
public final class Video {
    public static final int $stable = 8;
    private final int durationSeconds;
    private final String entryId;
    private final Double gpsLat;
    private final Double gpsLon;
    private final String id;
    private final String thumbnailUri;
    private final Instant timestamp;
    private final String uri;

    public static /* synthetic */ Video copy$default(Video video, String str, String str2, String str3, int i, String str4, Instant instant, Double d, Double d2, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            str = video.id;
        }
        if ((i2 & 2) != 0) {
            str2 = video.entryId;
        }
        if ((i2 & 4) != 0) {
            str3 = video.uri;
        }
        if ((i2 & 8) != 0) {
            i = video.durationSeconds;
        }
        if ((i2 & 16) != 0) {
            str4 = video.thumbnailUri;
        }
        if ((i2 & 32) != 0) {
            instant = video.timestamp;
        }
        if ((i2 & 64) != 0) {
            d = video.gpsLat;
        }
        if ((i2 & 128) != 0) {
            d2 = video.gpsLon;
        }
        Double d3 = d;
        Double d4 = d2;
        String str5 = str4;
        Instant instant2 = instant;
        return video.copy(str, str2, str3, i, str5, instant2, d3, d4);
    }

    public final String component1() {
        return this.id;
    }

    public final String component2() {
        return this.entryId;
    }

    public final String component3() {
        return this.uri;
    }

    public final int component4() {
        return this.durationSeconds;
    }

    public final String component5() {
        return this.thumbnailUri;
    }

    public final Instant component6() {
        return this.timestamp;
    }

    public final Double component7() {
        return this.gpsLat;
    }

    public final Double component8() {
        return this.gpsLon;
    }

    public final Video copy(String id, String entryId, String uri, int i, String str, Instant timestamp, Double d, Double d2) {
        Intrinsics.checkNotNullParameter(id, "id");
        Intrinsics.checkNotNullParameter(entryId, "entryId");
        Intrinsics.checkNotNullParameter(uri, "uri");
        Intrinsics.checkNotNullParameter(timestamp, "timestamp");
        return new Video(id, entryId, uri, i, str, timestamp, d, d2);
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof Video) {
            Video video = (Video) obj;
            return Intrinsics.areEqual(this.id, video.id) && Intrinsics.areEqual(this.entryId, video.entryId) && Intrinsics.areEqual(this.uri, video.uri) && this.durationSeconds == video.durationSeconds && Intrinsics.areEqual(this.thumbnailUri, video.thumbnailUri) && Intrinsics.areEqual(this.timestamp, video.timestamp) && Intrinsics.areEqual((Object) this.gpsLat, (Object) video.gpsLat) && Intrinsics.areEqual((Object) this.gpsLon, (Object) video.gpsLon);
        }
        return false;
    }

    public int hashCode() {
        return (((((((((((((this.id.hashCode() * 31) + this.entryId.hashCode()) * 31) + this.uri.hashCode()) * 31) + Integer.hashCode(this.durationSeconds)) * 31) + (this.thumbnailUri == null ? 0 : this.thumbnailUri.hashCode())) * 31) + this.timestamp.hashCode()) * 31) + (this.gpsLat == null ? 0 : this.gpsLat.hashCode())) * 31) + (this.gpsLon != null ? this.gpsLon.hashCode() : 0);
    }

    public String toString() {
        String str = this.id;
        String str2 = this.entryId;
        String str3 = this.uri;
        int i = this.durationSeconds;
        String str4 = this.thumbnailUri;
        Instant instant = this.timestamp;
        Double d = this.gpsLat;
        return "Video(id=" + str + ", entryId=" + str2 + ", uri=" + str3 + ", durationSeconds=" + i + ", thumbnailUri=" + str4 + ", timestamp=" + instant + ", gpsLat=" + d + ", gpsLon=" + this.gpsLon + ")";
    }

    public Video(String id, String entryId, String uri, int durationSeconds, String thumbnailUri, Instant timestamp, Double gpsLat, Double gpsLon) {
        Intrinsics.checkNotNullParameter(id, "id");
        Intrinsics.checkNotNullParameter(entryId, "entryId");
        Intrinsics.checkNotNullParameter(uri, "uri");
        Intrinsics.checkNotNullParameter(timestamp, "timestamp");
        this.id = id;
        this.entryId = entryId;
        this.uri = uri;
        this.durationSeconds = durationSeconds;
        this.thumbnailUri = thumbnailUri;
        this.timestamp = timestamp;
        this.gpsLat = gpsLat;
        this.gpsLon = gpsLon;
    }

    /* JADX WARN: Illegal instructions before constructor call */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public /* synthetic */ Video(java.lang.String r12, java.lang.String r13, java.lang.String r14, int r15, java.lang.String r16, java.time.Instant r17, java.lang.Double r18, java.lang.Double r19, int r20, kotlin.jvm.internal.DefaultConstructorMarker r21) {
        /*
            r11 = this;
            r0 = r20
            r1 = r0 & 1
            if (r1 == 0) goto L15
            java.util.UUID r12 = java.util.UUID.randomUUID()
            java.lang.String r12 = r12.toString()
            java.lang.String r1 = "toString(...)"
            kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r12, r1)
            r3 = r12
            goto L16
        L15:
            r3 = r12
        L16:
            r12 = r0 & 16
            r1 = 0
            if (r12 == 0) goto L1d
            r7 = r1
            goto L1f
        L1d:
            r7 = r16
        L1f:
            r12 = r0 & 32
            if (r12 == 0) goto L2e
            java.time.Instant r12 = java.time.Instant.now()
            java.lang.String r2 = "now(...)"
            kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r12, r2)
            r8 = r12
            goto L30
        L2e:
            r8 = r17
        L30:
            r12 = r0 & 64
            if (r12 == 0) goto L36
            r9 = r1
            goto L38
        L36:
            r9 = r18
        L38:
            r12 = r0 & 128(0x80, float:1.8E-43)
            if (r12 == 0) goto L3e
            r10 = r1
            goto L40
        L3e:
            r10 = r19
        L40:
            r2 = r11
            r4 = r13
            r5 = r14
            r6 = r15
            r2.<init>(r3, r4, r5, r6, r7, r8, r9, r10)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.hardlineforge.lala.data.Video.<init>(java.lang.String, java.lang.String, java.lang.String, int, java.lang.String, java.time.Instant, java.lang.Double, java.lang.Double, int, kotlin.jvm.internal.DefaultConstructorMarker):void");
    }

    public final String getId() {
        return this.id;
    }

    public final String getEntryId() {
        return this.entryId;
    }

    public final String getUri() {
        return this.uri;
    }

    public final int getDurationSeconds() {
        return this.durationSeconds;
    }

    public final String getThumbnailUri() {
        return this.thumbnailUri;
    }

    public final Instant getTimestamp() {
        return this.timestamp;
    }

    public final Double getGpsLat() {
        return this.gpsLat;
    }

    public final Double getGpsLon() {
        return this.gpsLon;
    }
}
