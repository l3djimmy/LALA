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
public class NumberOfPagesStatisticsAggregator extends AbstractStatisticsAggregator {
    private static final int HUNDRED = 100;
    private static final Map<Integer, String> NUMBERS_OF_PAGES;
    private static final int ONE = 1;
    private static final List<Integer> SORTED_UPPER_BOUNDS_OF_PAGES = Arrays.asList(1, 10, 100, 1000);
    private static final String STRING_FOR_HUNDRED_PAGES = "11-100";
    private static final String STRING_FOR_INF = "1001+";
    private static final String STRING_FOR_ONE_PAGE = "1";
    private static final String STRING_FOR_TEN_PAGES = "2-10";
    private static final String STRING_FOR_THOUSAND_PAGES = "101-1000";
    private static final int TEN = 10;
    private static final int THOUSAND = 1000;
    private final Object lock = new Object();
    private final Map<String, Long> numberOfDocuments = new LinkedHashMap();

    static {
        Map<Integer, String> temp = new HashMap<>();
        temp.put(1, STRING_FOR_ONE_PAGE);
        temp.put(10, STRING_FOR_TEN_PAGES);
        temp.put(100, STRING_FOR_HUNDRED_PAGES);
        temp.put(1000, STRING_FOR_THOUSAND_PAGES);
        NUMBERS_OF_PAGES = Collections.unmodifiableMap(temp);
    }

    @Override // com.itextpdf.commons.actions.AbstractStatisticsAggregator
    public void aggregate(AbstractStatisticsEvent event) {
        if (!(event instanceof NumberOfPagesStatisticsEvent)) {
            return;
        }
        int numberOfPages = ((NumberOfPagesStatisticsEvent) event).getNumberOfPages();
        String range = STRING_FOR_INF;
        Iterator<Integer> it = SORTED_UPPER_BOUNDS_OF_PAGES.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            int upperBound = it.next().intValue();
            if (numberOfPages <= upperBound) {
                String range2 = NUMBERS_OF_PAGES.get(Integer.valueOf(upperBound));
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
        if (!(aggregator instanceof NumberOfPagesStatisticsAggregator)) {
            return;
        }
        Map<String, Long> numberOfDocuments = ((NumberOfPagesStatisticsAggregator) aggregator).numberOfDocuments;
        synchronized (this.lock) {
            MapUtil.merge(this.numberOfDocuments, numberOfDocuments, new BiFunction() { // from class: com.itextpdf.kernel.pdf.statistics.NumberOfPagesStatisticsAggregator$$ExternalSyntheticLambda0
                @Override // java.util.function.BiFunction
                public final Object apply(Object obj, Object obj2) {
                    return NumberOfPagesStatisticsAggregator.lambda$merge$0((Long) obj, (Long) obj2);
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
