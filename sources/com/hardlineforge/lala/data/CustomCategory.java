package com.hardlineforge.lala.data;

import androidx.autofill.HintConstants;
import java.time.Instant;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: Entities.kt */
@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B#\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0016\u0010\u0002\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/hardlineforge/lala/data/CustomCategory;", "", "id", "", HintConstants.AUTOFILL_HINT_NAME, "createdAt", "Ljava/time/Instant;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;)V", "getId", "()Ljava/lang/String;", "getName", "getCreatedAt", "()Ljava/time/Instant;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "app_debug"}, k = 1, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes7.dex */
public final class CustomCategory {
    public static final int $stable = 8;
    private final Instant createdAt;
    private final String id;
    private final String name;

    public static /* synthetic */ CustomCategory copy$default(CustomCategory customCategory, String str, String str2, Instant instant, int i, Object obj) {
        if ((i & 1) != 0) {
            str = customCategory.id;
        }
        if ((i & 2) != 0) {
            str2 = customCategory.name;
        }
        if ((i & 4) != 0) {
            instant = customCategory.createdAt;
        }
        return customCategory.copy(str, str2, instant);
    }

    public final String component1() {
        return this.id;
    }

    public final String component2() {
        return this.name;
    }

    public final Instant component3() {
        return this.createdAt;
    }

    public final CustomCategory copy(String id, String name, Instant createdAt) {
        Intrinsics.checkNotNullParameter(id, "id");
        Intrinsics.checkNotNullParameter(name, "name");
        Intrinsics.checkNotNullParameter(createdAt, "createdAt");
        return new CustomCategory(id, name, createdAt);
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof CustomCategory) {
            CustomCategory customCategory = (CustomCategory) obj;
            return Intrinsics.areEqual(this.id, customCategory.id) && Intrinsics.areEqual(this.name, customCategory.name) && Intrinsics.areEqual(this.createdAt, customCategory.createdAt);
        }
        return false;
    }

    public int hashCode() {
        return (((this.id.hashCode() * 31) + this.name.hashCode()) * 31) + this.createdAt.hashCode();
    }

    public String toString() {
        String str = this.id;
        String str2 = this.name;
        return "CustomCategory(id=" + str + ", name=" + str2 + ", createdAt=" + this.createdAt + ")";
    }

    public CustomCategory(String id, String name, Instant createdAt) {
        Intrinsics.checkNotNullParameter(id, "id");
        Intrinsics.checkNotNullParameter(name, "name");
        Intrinsics.checkNotNullParameter(createdAt, "createdAt");
        this.id = id;
        this.name = name;
        this.createdAt = createdAt;
    }

    /* JADX WARN: Illegal instructions before constructor call */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public /* synthetic */ CustomCategory(java.lang.String r1, java.lang.String r2, java.time.Instant r3, int r4, kotlin.jvm.internal.DefaultConstructorMarker r5) {
        /*
            r0 = this;
            r5 = r4 & 1
            if (r5 == 0) goto L11
            java.util.UUID r1 = java.util.UUID.randomUUID()
            java.lang.String r1 = r1.toString()
            java.lang.String r5 = "toString(...)"
            kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r1, r5)
        L11:
            r4 = r4 & 4
            if (r4 == 0) goto L1e
            java.time.Instant r3 = java.time.Instant.now()
            java.lang.String r4 = "now(...)"
            kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r3, r4)
        L1e:
            r0.<init>(r1, r2, r3)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.hardlineforge.lala.data.CustomCategory.<init>(java.lang.String, java.lang.String, java.time.Instant, int, kotlin.jvm.internal.DefaultConstructorMarker):void");
    }

    public final String getId() {
        return this.id;
    }

    public final String getName() {
        return this.name;
    }

    public final Instant getCreatedAt() {
        return this.createdAt;
    }
}
