package com.hardlineforge.lala.data;

import java.time.Instant;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: Entities.kt */
@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B/\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0006\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0012\u001a\u00020\u0006HÆ\u0003J\u000b\u0010\u0013\u001a\u0004\u0018\u00010\u0003HÆ\u0003J3\u0010\u0014\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00062\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u0015\u001a\u00020\u00162\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0018\u001a\u00020\u0019HÖ\u0001J\t\u0010\u001a\u001a\u00020\u0003HÖ\u0001R\u0016\u0010\u0002\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\u000bR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0013\u0010\u0007\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u000b¨\u0006\u001b"}, d2 = {"Lcom/hardlineforge/lala/data/EditHistory;", "", "id", "", "entryId", "editedAt", "Ljava/time/Instant;", "note", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;)V", "getId", "()Ljava/lang/String;", "getEntryId", "getEditedAt", "()Ljava/time/Instant;", "getNote", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "app_debug"}, k = 1, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes7.dex */
public final class EditHistory {
    public static final int $stable = 8;
    private final Instant editedAt;
    private final String entryId;
    private final String id;
    private final String note;

    public static /* synthetic */ EditHistory copy$default(EditHistory editHistory, String str, String str2, Instant instant, String str3, int i, Object obj) {
        if ((i & 1) != 0) {
            str = editHistory.id;
        }
        if ((i & 2) != 0) {
            str2 = editHistory.entryId;
        }
        if ((i & 4) != 0) {
            instant = editHistory.editedAt;
        }
        if ((i & 8) != 0) {
            str3 = editHistory.note;
        }
        return editHistory.copy(str, str2, instant, str3);
    }

    public final String component1() {
        return this.id;
    }

    public final String component2() {
        return this.entryId;
    }

    public final Instant component3() {
        return this.editedAt;
    }

    public final String component4() {
        return this.note;
    }

    public final EditHistory copy(String id, String entryId, Instant editedAt, String str) {
        Intrinsics.checkNotNullParameter(id, "id");
        Intrinsics.checkNotNullParameter(entryId, "entryId");
        Intrinsics.checkNotNullParameter(editedAt, "editedAt");
        return new EditHistory(id, entryId, editedAt, str);
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof EditHistory) {
            EditHistory editHistory = (EditHistory) obj;
            return Intrinsics.areEqual(this.id, editHistory.id) && Intrinsics.areEqual(this.entryId, editHistory.entryId) && Intrinsics.areEqual(this.editedAt, editHistory.editedAt) && Intrinsics.areEqual(this.note, editHistory.note);
        }
        return false;
    }

    public int hashCode() {
        return (((((this.id.hashCode() * 31) + this.entryId.hashCode()) * 31) + this.editedAt.hashCode()) * 31) + (this.note == null ? 0 : this.note.hashCode());
    }

    public String toString() {
        String str = this.id;
        String str2 = this.entryId;
        Instant instant = this.editedAt;
        return "EditHistory(id=" + str + ", entryId=" + str2 + ", editedAt=" + instant + ", note=" + this.note + ")";
    }

    public EditHistory(String id, String entryId, Instant editedAt, String note) {
        Intrinsics.checkNotNullParameter(id, "id");
        Intrinsics.checkNotNullParameter(entryId, "entryId");
        Intrinsics.checkNotNullParameter(editedAt, "editedAt");
        this.id = id;
        this.entryId = entryId;
        this.editedAt = editedAt;
        this.note = note;
    }

    /* JADX WARN: Illegal instructions before constructor call */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public /* synthetic */ EditHistory(java.lang.String r1, java.lang.String r2, java.time.Instant r3, java.lang.String r4, int r5, kotlin.jvm.internal.DefaultConstructorMarker r6) {
        /*
            r0 = this;
            r6 = r5 & 1
            if (r6 == 0) goto L11
            java.util.UUID r1 = java.util.UUID.randomUUID()
            java.lang.String r1 = r1.toString()
            java.lang.String r6 = "toString(...)"
            kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r1, r6)
        L11:
            r6 = r5 & 4
            if (r6 == 0) goto L1e
            java.time.Instant r3 = java.time.Instant.now()
            java.lang.String r6 = "now(...)"
            kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r3, r6)
        L1e:
            r5 = r5 & 8
            if (r5 == 0) goto L23
            r4 = 0
        L23:
            r0.<init>(r1, r2, r3, r4)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.hardlineforge.lala.data.EditHistory.<init>(java.lang.String, java.lang.String, java.time.Instant, java.lang.String, int, kotlin.jvm.internal.DefaultConstructorMarker):void");
    }

    public final String getId() {
        return this.id;
    }

    public final String getEntryId() {
        return this.entryId;
    }

    public final Instant getEditedAt() {
        return this.editedAt;
    }

    public final String getNote() {
        return this.note;
    }
}
