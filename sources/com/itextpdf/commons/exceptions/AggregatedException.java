package com.itextpdf.commons.exceptions;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
/* loaded from: classes12.dex */
public class AggregatedException extends ITextException {
    private static final String AGGREGATED_MESSAGE = "Aggregated message";
    public static final String ERROR_DURING_EVENT_PROCESSING = "Error during event processing";
    private final List<RuntimeException> aggregatedExceptions;

    public AggregatedException(List<RuntimeException> aggregatedExceptions) {
        super("");
        this.aggregatedExceptions = new ArrayList(aggregatedExceptions);
    }

    public AggregatedException(String message, List<RuntimeException> aggregatedExceptions) {
        super(message);
        this.aggregatedExceptions = new ArrayList(aggregatedExceptions);
    }

    @Override // java.lang.Throwable
    public String getMessage() {
        String message = super.getMessage();
        if (message == null || message.isEmpty()) {
            message = AGGREGATED_MESSAGE;
        }
        StringBuilder builder = new StringBuilder(message);
        builder.append(":\n");
        for (int i = 0; i < this.aggregatedExceptions.size(); i++) {
            Exception current = this.aggregatedExceptions.get(i);
            if (current != null) {
                builder.append(i).append(") ").append(current.getMessage()).append('\n');
            }
        }
        return builder.toString();
    }

    public List<Exception> getAggregatedExceptions() {
        return Collections.unmodifiableList(this.aggregatedExceptions);
    }
}
