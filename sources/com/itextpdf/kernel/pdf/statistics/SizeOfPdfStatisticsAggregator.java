package com.itextpdf.kernel.pdf.statistics;

import com.itextpdf.commons.actions.AbstractStatisticsAggregator;
import com.itextpdf.commons.actions.AbstractStatisticsEvent;
import com.itextpdf.commons.utils.MapUtil;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.function.BiFunction;
/* loaded from: classes12.dex */
public class SizeOfPdfStatisticsAggregator extends AbstractStatisticsAggregator {
    private static final Map<Long, String> DOCUMENT_SIZES;
    private static final long MEASURE_COEFFICIENT = 1024;
    private static final long SIZE_128KB = 131072;
    private static final long SIZE_128MB = 134217728;
    private static final long SIZE_16MB = 16777216;
    private static final long SIZE_1MB = 1048576;
    private static final List<Long> SORTED_UPPER_BOUNDS_OF_SIZES;
    private static final String STRING_FOR_128KB = "<128kb";
    private static final String STRING_FOR_128MB = "16mb-128mb";
    private static final String STRING_FOR_16MB = "1mb-16mb";
    private static final String STRING_FOR_1MB = "128kb-1mb";
    private static final String STRING_FOR_INF = "128mb+";
    private final Object lock = new Object();
    private final Map<String, Long> numberOfDocuments = new LinkedHashMap();

    static {
        Long valueOf = Long.valueOf((long) SIZE_128KB);
        Long valueOf2 = Long.valueOf((long) SIZE_1MB);
        Long valueOf3 = Long.valueOf((long) SIZE_16MB);
        Long valueOf4 = Long.valueOf((long) SIZE_128MB);
        SORTED_UPPER_BOUNDS_OF_SIZES = Arrays.asList(valueOf, valueOf2, valueOf3, valueOf4);
        Map<Long, String> temp = new HashMap<>();
        temp.put(valueOf, STRING_FOR_128KB);
        temp.put(valueOf2, STRING_FOR_1MB);
        temp.put(valueOf3, STRING_FOR_16MB);
        temp.put(valueOf4, STRING_FOR_128MB);
        DOCUMENT_SIZES = Collections.unmodifiableMap(temp);
    }

    @Override // com.itextpdf.commons.actions.AbstractStatisticsAggregator
    public void aggregate(AbstractStatisticsEvent event) {
        if (!(event instanceof SizeOfPdfStatisticsEvent)) {
            return;
        }
        long sizeOfPdf = ((SizeOfPdfStatisticsEvent) event).getAmountOfBytes();
        String range = STRING_FOR_INF;
        Iterator<Long> it = SORTED_UPPER_BOUNDS_OF_SIZES.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            long upperBound = it.next().longValue();
            if (sizeOfPdf <= upperBound) {
                String range2 = DOCUMENT_SIZES.get(Long.valueOf(upperBound));
                range = range2;
                break;
            }
        }
        synchronized (this.lock) {
            Long documentsOfThisRange = this.numberOfDocuments.get(range);
            long j = 1;
            if (documentsOfThisRange != null) {
                j = 1 + documentsOfThisRange.longValue();
            }
            Long currentValue = Long.valueOf(j);
            this.numberOfDocuments.put(range, currentValue);
        }
    }

    @Override // com.itextpdf.commons.actions.AbstractStatisticsAggregator
    public Object retrieveAggregation() {
        return Collections.unmodifiableMap(this.numberOfDocuments);
    }

    @Override // com.itextpdf.commons.actions.AbstractStatisticsAggregator
    public void merge(AbstractStatisticsAggregator aggregator) {
        if (!(aggregator instanceof SizeOfPdfStatisticsAggregator)) {
            return;
        }
        Map<String, Long> amountOfDocuments = ((SizeOfPdfStatisticsAggregator) aggregator).numberOfDocuments;
        synchronized (this.lock) {
            MapUtil.merge(this.numberOfDocuments, amountOfDocuments, new BiFunction() { // from class: com.itextpdf.kernel.pdf.statistics.SizeOfPdfStatisticsAggregator$$ExternalSyntheticLambda0
                @Override // java.util.function.BiFunction
                public final Object apply(Object obj, Object obj2) {
                    return SizeOfPdfStatisticsAggregator.lambda$merge$0((Long) obj, (Long) obj2);
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ Long lambda$merge$0(Long el1, Long el2) {
        if (el2 == null) {
            return el1;
        }
        return Long.valueOf(el1.longValue() + el2.longValue());
    }
}
