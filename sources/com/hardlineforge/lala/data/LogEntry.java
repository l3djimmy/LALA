package com.hardlineforge.lala.data;

import java.time.Instant;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: Entities.kt */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0006\n\u0002\b\u0002\n\u0002\u0010\u0007\n\u0002\b)\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u0083\u0001\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0005\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\b\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u000b\u0012\u0006\u0010\f\u001a\u00020\u0003\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u000e\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u000f\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0010\u001a\u00020\u0005\u0012\b\b\u0002\u0010\u0011\u001a\u00020\u0005¢\u0006\u0004\b\u0012\u0010\u0013J\t\u0010&\u001a\u00020\u0003HÆ\u0003J\t\u0010'\u001a\u00020\u0005HÆ\u0003J\t\u0010(\u001a\u00020\u0003HÆ\u0003J\u0010\u0010)\u001a\u0004\u0018\u00010\bHÆ\u0003¢\u0006\u0002\u0010\u001aJ\u0010\u0010*\u001a\u0004\u0018\u00010\bHÆ\u0003¢\u0006\u0002\u0010\u001aJ\u0010\u0010+\u001a\u0004\u0018\u00010\u000bHÆ\u0003¢\u0006\u0002\u0010\u001eJ\t\u0010,\u001a\u00020\u0003HÆ\u0003J\u000b\u0010-\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\t\u0010.\u001a\u00020\u0003HÆ\u0003J\t\u0010/\u001a\u00020\u0003HÆ\u0003J\t\u00100\u001a\u00020\u0005HÆ\u0003J\t\u00101\u001a\u00020\u0005HÆ\u0003J\u008e\u0001\u00102\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u000b2\b\b\u0002\u0010\f\u001a\u00020\u00032\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u000e\u001a\u00020\u00032\b\b\u0002\u0010\u000f\u001a\u00020\u00032\b\b\u0002\u0010\u0010\u001a\u00020\u00052\b\b\u0002\u0010\u0011\u001a\u00020\u0005HÆ\u0001¢\u0006\u0002\u00103J\u0013\u00104\u001a\u0002052\b\u00106\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u00107\u001a\u000208HÖ\u0001J\t\u00109\u001a\u00020\u0003HÖ\u0001R\u0016\u0010\u0002\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017R\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0015R\u0015\u0010\u0007\u001a\u0004\u0018\u00010\b¢\u0006\n\n\u0002\u0010\u001b\u001a\u0004\b\u0019\u0010\u001aR\u0015\u0010\t\u001a\u0004\u0018\u00010\b¢\u0006\n\n\u0002\u0010\u001b\u001a\u0004\b\u001c\u0010\u001aR\u0015\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\n\n\u0002\u0010\u001f\u001a\u0004\b\u001d\u0010\u001eR\u0011\u0010\f\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b \u0010\u0015R\u0013\u0010\r\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b!\u0010\u0015R\u0011\u0010\u000e\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\"\u0010\u0015R\u0011\u0010\u000f\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b#\u0010\u0015R\u0011\u0010\u0010\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b$\u0010\u0017R\u0011\u0010\u0011\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b%\u0010\u0017¨\u0006:"}, d2 = {"Lcom/hardlineforge/lala/data/LogEntry;", "", "id", "", "timestamp", "Ljava/time/Instant;", "timezone", "gpsLat", "", "gpsLon", "gpsAccuracy", "", "category", "locationName", "comment", "tags", "createdAt", "updatedAt", "<init>", "(Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/Double;Ljava/lang/Double;Ljava/lang/Float;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/time/Instant;)V", "getId", "()Ljava/lang/String;", "getTimestamp", "()Ljava/time/Instant;", "getTimezone", "getGpsLat", "()Ljava/lang/Double;", "Ljava/lang/Double;", "getGpsLon", "getGpsAccuracy", "()Ljava/lang/Float;", "Ljava/lang/Float;", "getCategory", "getLocationName", "getComment", "getTags", "getCreatedAt", "getUpdatedAt", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "component9", "component10", "component11", "component12", "copy", "(Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;Ljava/lang/Double;Ljava/lang/Double;Ljava/lang/Float;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/time/Instant;)Lcom/hardlineforge/lala/data/LogEntry;", "equals", "", "other", "hashCode", "", "toString", "app_debug"}, k = 1, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes7.dex */
public final class LogEntry {
    public static final int $stable = 8;
    private final String category;
    private final String comment;
    private final Instant createdAt;
    private final Float gpsAccuracy;
    private final Double gpsLat;
    private final Double gpsLon;
    private final String id;
    private final String locationName;
    private final String tags;
    private final Instant timestamp;
    private final String timezone;
    private final Instant updatedAt;

    public static /* synthetic */ LogEntry copy$default(LogEntry logEntry, String str, Instant instant, String str2, Double d, Double d2, Float f, String str3, String str4, String str5, String str6, Instant instant2, Instant instant3, int i, Object obj) {
        if ((i & 1) != 0) {
            str = logEntry.id;
        }
        if ((i & 2) != 0) {
            instant = logEntry.timestamp;
        }
        if ((i & 4) != 0) {
            str2 = logEntry.timezone;
        }
        if ((i & 8) != 0) {
            d = logEntry.gpsLat;
        }
        if ((i & 16) != 0) {
            d2 = logEntry.gpsLon;
        }
        if ((i & 32) != 0) {
            f = logEntry.gpsAccuracy;
        }
        if ((i & 64) != 0) {
            str3 = logEntry.category;
        }
        if ((i & 128) != 0) {
            str4 = logEntry.locationName;
        }
        if ((i & 256) != 0) {
            str5 = logEntry.comment;
        }
        if ((i & 512) != 0) {
            str6 = logEntry.tags;
        }
        if ((i & 1024) != 0) {
            instant2 = logEntry.createdAt;
        }
        if ((i & 2048) != 0) {
            instant3 = logEntry.updatedAt;
        }
        Instant instant4 = instant2;
        Instant instant5 = instant3;
        String str7 = str5;
        String str8 = str6;
        String str9 = str3;
        String str10 = str4;
        Double d3 = d2;
        Float f2 = f;
        return logEntry.copy(str, instant, str2, d, d3, f2, str9, str10, str7, str8, instant4, instant5);
    }

    public final String component1() {
        return this.id;
    }

    public final String component10() {
        return this.tags;
    }

    public final Instant component11() {
        return this.createdAt;
    }

    public final Instant component12() {
        return this.updatedAt;
    }

    public final Instant component2() {
        return this.timestamp;
    }

    public final String component3() {
        return this.timezone;
    }

    public final Double component4() {
        return this.gpsLat;
    }

    public final Double component5() {
        return this.gpsLon;
    }

    public final Float component6() {
        return this.gpsAccuracy;
    }

    public final String component7() {
        return this.category;
    }

    public final String component8() {
        return this.locationName;
    }

    public final String component9() {
        return this.comment;
    }

    public final LogEntry copy(String id, Instant timestamp, String timezone, Double d, Double d2, Float f, String category, String str, String comment, String tags, Instant createdAt, Instant updatedAt) {
        Intrinsics.checkNotNullParameter(id, "id");
        Intrinsics.checkNotNullParameter(timestamp, "timestamp");
        Intrinsics.checkNotNullParameter(timezone, "timezone");
        Intrinsics.checkNotNullParameter(category, "category");
        Intrinsics.checkNotNullParameter(comment, "comment");
        Intrinsics.checkNotNullParameter(tags, "tags");
        Intrinsics.checkNotNullParameter(createdAt, "createdAt");
        Intrinsics.checkNotNullParameter(updatedAt, "updatedAt");
        return new LogEntry(id, timestamp, timezone, d, d2, f, category, str, comment, tags, createdAt, updatedAt);
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof LogEntry) {
            LogEntry logEntry = (LogEntry) obj;
            return Intrinsics.areEqual(this.id, logEntry.id) && Intrinsics.areEqual(this.timestamp, logEntry.timestamp) && Intrinsics.areEqual(this.timezone, logEntry.timezone) && Intrinsics.areEqual((Object) this.gpsLat, (Object) logEntry.gpsLat) && Intrinsics.areEqual((Object) this.gpsLon, (Object) logEntry.gpsLon) && Intrinsics.areEqual((Object) this.gpsAccuracy, (Object) logEntry.gpsAccuracy) && Intrinsics.areEqual(this.category, logEntry.category) && Intrinsics.areEqual(this.locationName, logEntry.locationName) && Intrinsics.areEqual(this.comment, logEntry.comment) && Intrinsics.areEqual(this.tags, logEntry.tags) && Intrinsics.areEqual(this.createdAt, logEntry.createdAt) && Intrinsics.areEqual(this.updatedAt, logEntry.updatedAt);
        }
        return false;
    }

    public int hashCode() {
        return (((((((((((((((((((((this.id.hashCode() * 31) + this.timestamp.hashCode()) * 31) + this.timezone.hashCode()) * 31) + (this.gpsLat == null ? 0 : this.gpsLat.hashCode())) * 31) + (this.gpsLon == null ? 0 : this.gpsLon.hashCode())) * 31) + (this.gpsAccuracy == null ? 0 : this.gpsAccuracy.hashCode())) * 31) + this.category.hashCode()) * 31) + (this.locationName != null ? this.locationName.hashCode() : 0)) * 31) + this.comment.hashCode()) * 31) + this.tags.hashCode()) * 31) + this.createdAt.hashCode()) * 31) + this.updatedAt.hashCode();
    }

    public String toString() {
        String str = this.id;
        Instant instant = this.timestamp;
        String str2 = this.timezone;
        Double d = this.gpsLat;
        Double d2 = this.gpsLon;
        Float f = this.gpsAccuracy;
        String str3 = this.category;
        String str4 = this.locationName;
        String str5 = this.comment;
        String str6 = this.tags;
        Instant instant2 = this.createdAt;
        return "LogEntry(id=" + str + ", timestamp=" + instant + ", timezone=" + str2 + ", gpsLat=" + d + ", gpsLon=" + d2 + ", gpsAccuracy=" + f + ", category=" + str3 + ", locationName=" + str4 + ", comment=" + str5 + ", tags=" + str6 + ", createdAt=" + instant2 + ", updatedAt=" + this.updatedAt + ")";
    }

    public LogEntry(String id, Instant timestamp, String timezone, Double gpsLat, Double gpsLon, Float gpsAccuracy, String category, String locationName, String comment, String tags, Instant createdAt, Instant updatedAt) {
        Intrinsics.checkNotNullParameter(id, "id");
        Intrinsics.checkNotNullParameter(timestamp, "timestamp");
        Intrinsics.checkNotNullParameter(timezone, "timezone");
        Intrinsics.checkNotNullParameter(category, "category");
        Intrinsics.checkNotNullParameter(comment, "comment");
        Intrinsics.checkNotNullParameter(tags, "tags");
        Intrinsics.checkNotNullParameter(createdAt, "createdAt");
        Intrinsics.checkNotNullParameter(updatedAt, "updatedAt");
        this.id = id;
        this.timestamp = timestamp;
        this.timezone = timezone;
        this.gpsLat = gpsLat;
        this.gpsLon = gpsLon;
        this.gpsAccuracy = gpsAccuracy;
        this.category = category;
        this.locationName = locationName;
        this.comment = comment;
        this.tags = tags;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    /* JADX WARN: Illegal instructions before constructor call */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public /* synthetic */ LogEntry(java.lang.String r17, java.time.Instant r18, java.lang.String r19, java.lang.Double r20, java.lang.Double r21, java.lang.Float r22, java.lang.String r23, java.lang.String r24, java.lang.String r25, java.lang.String r26, java.time.Instant r27, java.time.Instant r28, int r29, kotlin.jvm.internal.DefaultConstructorMarker r30) {
        /*
            r16 = this;
            r0 = r29
            r1 = r0 & 1
            if (r1 == 0) goto L15
            java.util.UUID r1 = java.util.UUID.randomUUID()
            java.lang.String r1 = r1.toString()
            java.lang.String r2 = "toString(...)"
            kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r1, r2)
            r4 = r1
            goto L17
        L15:
            r4 = r17
        L17:
            r1 = r0 & 2
            java.lang.String r2 = "now(...)"
            if (r1 == 0) goto L26
            java.time.Instant r1 = java.time.Instant.now()
            kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r1, r2)
            r5 = r1
            goto L28
        L26:
            r5 = r18
        L28:
            r1 = r0 & 4
            if (r1 == 0) goto L3b
            java.time.ZoneId r1 = java.time.ZoneId.systemDefault()
            java.lang.String r1 = r1.getId()
            java.lang.String r3 = "getId(...)"
            kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r1, r3)
            r6 = r1
            goto L3d
        L3b:
            r6 = r19
        L3d:
            r1 = r0 & 8
            r3 = 0
            if (r1 == 0) goto L44
            r7 = r3
            goto L46
        L44:
            r7 = r20
        L46:
            r1 = r0 & 16
            if (r1 == 0) goto L4c
            r8 = r3
            goto L4e
        L4c:
            r8 = r21
        L4e:
            r1 = r0 & 32
            if (r1 == 0) goto L54
            r9 = r3
            goto L56
        L54:
            r9 = r22
        L56:
            r1 = r0 & 128(0x80, float:1.8E-43)
            if (r1 == 0) goto L5c
            r11 = r3
            goto L5e
        L5c:
            r11 = r24
        L5e:
            r1 = r0 & 512(0x200, float:7.17E-43)
            if (r1 == 0) goto L66
            java.lang.String r1 = ""
            r13 = r1
            goto L68
        L66:
            r13 = r26
        L68:
            r1 = r0 & 1024(0x400, float:1.435E-42)
            if (r1 == 0) goto L75
            java.time.Instant r1 = java.time.Instant.now()
            kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r1, r2)
            r14 = r1
            goto L77
        L75:
            r14 = r27
        L77:
            r0 = r0 & 2048(0x800, float:2.87E-42)
            if (r0 == 0) goto L84
            java.time.Instant r0 = java.time.Instant.now()
            kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r0, r2)
            r15 = r0
            goto L86
        L84:
            r15 = r28
        L86:
            r3 = r16
            r10 = r23
            r12 = r25
            r3.<init>(r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.hardlineforge.lala.data.LogEntry.<init>(java.lang.String, java.time.Instant, java.lang.String, java.lang.Double, java.lang.Double, java.lang.Float, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.time.Instant, java.time.Instant, int, kotlin.jvm.internal.DefaultConstructorMarker):void");
    }

    public final String getId() {
        return this.id;
    }

    public final Instant getTimestamp() {
        return this.timestamp;
    }

    public final String getTimezone() {
        return this.timezone;
    }

    public final Double getGpsLat() {
        return this.gpsLat;
    }

    public final Double getGpsLon() {
        return this.gpsLon;
    }

    public final Float getGpsAccuracy() {
        return this.gpsAccuracy;
    }

    public final String getCategory() {
        return this.category;
    }

    public final String getLocationName() {
        return this.locationName;
    }

    public final String getComment() {
        return this.comment;
    }

    public final String getTags() {
        return this.tags;
    }

    public final Instant getCreatedAt() {
        return this.createdAt;
    }

    public final Instant getUpdatedAt() {
        return this.updatedAt;
    }
}
