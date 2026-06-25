package com.itextpdf.commons.actions.sequence;

import java.util.concurrent.atomic.AtomicLong;
/* loaded from: classes12.dex */
public final class SequenceId {
    private static final AtomicLong ID_GENERATOR = new AtomicLong();
    private final long id = ID_GENERATOR.incrementAndGet();

    public long getId() {
        return this.id;
    }
}
