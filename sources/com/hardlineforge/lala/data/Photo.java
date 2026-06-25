package com.hardlineforge.lala.data;

import java.time.Instant;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: Entities.kt */
@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0006\n\u0002\b\u0018\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001BO\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\u0007\u001a\u00020\b\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\n\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n¢\u0006\u0004\b\f\u0010\rJ\t\u0010\u0019\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001a\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001b\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u001c\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\t\u0010\u001d\u001a\u00020\bHÆ\u0003J\u0010\u0010\u001e\u001a\u0004\u0018\u00010\nHÆ\u0003¢\u0006\u0002\u0010\u0016J\u0010\u0010\u001f\u001a\u0004\u0018\u00010\nHÆ\u0003¢\u0006\u0002\u0010\u0016JZ\u0010 \u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0007\u001a\u00020\b2\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\n2\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\nHÆ\u0001¢\u0006\u0002\u0010!J\u0013\u0010\"\u001a\u00020#2\b\u0010$\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010%\u001a\u00020&HÖ\u0001J\t\u0010'\u001a\u00020\u0003HÖ\u0001R\u0016\u0010\u0002\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u000fR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u000fR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u000fR\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014R\u0015\u0010\t\u001a\u0004\u0018\u00010\n¢\u0006\n\n\u0002\u0010\u0017\u001a\u0004\b\u0015\u0010\u0016R\u0015\u0010\u000b\u001a\u0004\u0018\u00010\n¢\u0006\n\n\u0002\u0010\u0017\u001a\u0004\b\u0018\u0010\u0016¨\u0006("}, d2 = {"Lcom/hardlineforge/lala/data/Photo;", "", "id", "", "entryId", "uri", "caption", "timestamp", "Ljava/time/Instant;", "gpsLat", "", "gpsLon", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/lang/Double;Ljava/lang/Double;)V", "getId", "()Ljava/lang/String;", "getEntryId", "getUri", "getCaption", "getTimestamp", "()Ljava/time/Instant;", "getGpsLat", "()Ljava/lang/Double;", "Ljava/lang/Double;", "getGpsLon", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/lang/Double;Ljava/lang/Double;)Lcom/hardlineforge/lala/data/Photo;", "equals", "", "other", "hashCode", "", "toString", "app_debug"}, k = 1, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes7.dex */
public final class Photo {
    public static final int $stable = 8;
    private final String caption;
    private final String entryId;
    private final Double gpsLat;
    private final Double gpsLon;
    private final String id;
    private final Instant timestamp;
    private final String uri;

    public static /* synthetic */ Photo copy$default(Photo photo, String str, String str2, String str3, String str4, Instant instant, Double d, Double d2, int i, Object obj) {
        if ((i & 1) != 0) {
            str = photo.id;
        }
        if ((i & 2) != 0) {
            str2 = photo.entryId;
        }
        if ((i & 4) != 0) {
            str3 = photo.uri;
        }
        if ((i & 8) != 0) {
            str4 = photo.caption;
        }
        if ((i & 16) != 0) {
            instant = photo.timestamp;
        }
        if ((i & 32) != 0) {
            d = photo.gpsLat;
        }
        if ((i & 64) != 0) {
            d2 = photo.gpsLon;
        }
        Double d3 = d;
        Double d4 = d2;
        Instant instant2 = instant;
        String str5 = str3;
        return photo.copy(str, str2, str5, str4, instant2, d3, d4);
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

    public final String component4() {
        return this.caption;
    }

    public final Instant component5() {
        return this.timestamp;
    }

    public final Double component6() {
        return this.gpsLat;
    }

    public final Double component7() {
        return this.gpsLon;
    }

    public final Photo copy(String id, String entryId, String uri, String str, Instant timestamp, Double d, Double d2) {
        Intrinsics.checkNotNullParameter(id, "id");
        Intrinsics.checkNotNullParameter(entryId, "entryId");
        Intrinsics.checkNotNullParameter(uri, "uri");
        Intrinsics.checkNotNullParameter(timestamp, "timestamp");
        return new Photo(id, entryId, uri, str, timestamp, d, d2);
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof Photo) {
            Photo photo = (Photo) obj;
            return Intrinsics.areEqual(this.id, photo.id) && Intrinsics.areEqual(this.entryId, photo.entryId) && Intrinsics.areEqual(this.uri, photo.uri) && Intrinsics.areEqual(this.caption, photo.caption) && Intrinsics.areEqual(this.timestamp, photo.timestamp) && Intrinsics.areEqual((Object) this.gpsLat, (Object) photo.gpsLat) && Intrinsics.areEqual((Object) this.gpsLon, (Object) photo.gpsLon);
        }
        return false;
    }

    public int hashCode() {
        return (((((((((((this.id.hashCode() * 31) + this.entryId.hashCode()) * 31) + this.uri.hashCode()) * 31) + (this.caption == null ? 0 : this.caption.hashCode())) * 31) + this.timestamp.hashCode()) * 31) + (this.gpsLat == null ? 0 : this.gpsLat.hashCode())) * 31) + (this.gpsLon != null ? this.gpsLon.hashCode() : 0);
    }

    public String toString() {
        String str = this.id;
        String str2 = this.entryId;
        String str3 = this.uri;
        String str4 = this.caption;
        Instant instant = this.timestamp;
        Double d = this.gpsLat;
        return "Photo(id=" + str + ", entryId=" + str2 + ", uri=" + str3 + ", caption=" + str4 + ", timestamp=" + instant + ", gpsLat=" + d + ", gpsLon=" + this.gpsLon + ")";
    }

    public Photo(String id, String entryId, String uri, String caption, Instant timestamp, Double gpsLat, Double gpsLon) {
        Intrinsics.checkNotNullParameter(id, "id");
        Intrinsics.checkNotNullParameter(entryId, "entryId");
        Intrinsics.checkNotNullParameter(uri, "uri");
        Intrinsics.checkNotNullParameter(timestamp, "timestamp");
        this.id = id;
        this.entryId = entryId;
        this.uri = uri;
        this.caption = caption;
        this.timestamp = timestamp;
        this.gpsLat = gpsLat;
        this.gpsLon = gpsLon;
    }

    /* JADX WARN: Illegal instructions before constructor call */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public /* synthetic */ Photo(java.lang.String r10, java.lang.String r11, java.lang.String r12, java.lang.String r13, java.time.Instant r14, java.lang.Double r15, java.lang.Double r16, int r17, kotlin.jvm.internal.DefaultConstructorMarker r18) {
        /*
            r9 = this;
            r0 = r17 & 1
            if (r0 == 0) goto L13
            java.util.UUID r10 = java.util.UUID.randomUUID()
            java.lang.String r10 = r10.toString()
            java.lang.String r0 = "toString(...)"
            kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r10, r0)
            r2 = r10
            goto L14
        L13:
            r2 = r10
        L14:
            r10 = r17 & 8
            r0 = 0
            if (r10 == 0) goto L1b
            r5 = r0
            goto L1c
        L1b:
            r5 = r13
        L1c:
            r10 = r17 & 16
            if (r10 == 0) goto L2b
            java.time.Instant r14 = java.time.Instant.now()
            java.lang.String r10 = "now(...)"
            kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r14, r10)
            r6 = r14
            goto L2c
        L2b:
            r6 = r14
        L2c:
            r10 = r17 & 32
            if (r10 == 0) goto L32
            r7 = r0
            goto L33
        L32:
            r7 = r15
        L33:
            r10 = r17 & 64
            if (r10 == 0) goto L39
            r8 = r0
            goto L3b
        L39:
            r8 = r16
        L3b:
            r1 = r9
            r3 = r11
            r4 = r12
            r1.<init>(r2, r3, r4, r5, r6, r7, r8)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.hardlineforge.lala.data.Photo.<init>(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.time.Instant, java.lang.Double, java.lang.Double, int, kotlin.jvm.internal.DefaultConstructorMarker):void");
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

    public final String getCaption() {
        return this.caption;
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
