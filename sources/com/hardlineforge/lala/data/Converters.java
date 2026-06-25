package com.hardlineforge.lala.data;

import java.time.Instant;
import kotlin.Metadata;
/* compiled from: AppDatabase.kt */
@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u0019\u0010\u0004\u001a\u0004\u0018\u00010\u00052\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007H\u0007¢\u0006\u0002\u0010\bJ\u0019\u0010\t\u001a\u0004\u0018\u00010\u00072\b\u0010\u0006\u001a\u0004\u0018\u00010\u0005H\u0007¢\u0006\u0002\u0010\n¨\u0006\u000b"}, d2 = {"Lcom/hardlineforge/lala/data/Converters;", "", "<init>", "()V", "fromInstant", "", "value", "Ljava/time/Instant;", "(Ljava/time/Instant;)Ljava/lang/Long;", "toInstant", "(Ljava/lang/Long;)Ljava/time/Instant;", "app_debug"}, k = 1, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes7.dex */
public final class Converters {
    public static final int $stable = 0;

    public final Long fromInstant(Instant value) {
        if (value != null) {
            return Long.valueOf(value.toEpochMilli());
        }
        return null;
    }

    public final Instant toInstant(Long value) {
        if (value != null) {
            return Instant.ofEpochMilli(value.longValue());
        }
        return null;
    }
}
