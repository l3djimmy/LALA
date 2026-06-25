package com.itextpdf.kernel.pdf.statistics;

import com.itextpdf.commons.actions.AbstractStatisticsAggregator;
import com.itextpdf.commons.actions.AbstractStatisticsEvent;
import com.itextpdf.commons.actions.data.ProductData;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import java.util.Collections;
import java.util.List;
/* loaded from: classes12.dex */
public class NumberOfPagesStatisticsEvent extends AbstractStatisticsEvent {
    private static final String NUMBER_OF_PAGES_STATISTICS = "numberOfPages";
    private final int numberOfPages;

    public NumberOfPagesStatisticsEvent(int numberOfPages, ProductData productData) {
        super(productData);
        if (numberOfPages < 0) {
            throw new IllegalStateException(KernelExceptionMessageConstant.NUMBER_OF_PAGES_CAN_NOT_BE_NEGATIVE);
        }
        this.numberOfPages = numberOfPages;
    }

    @Override // com.itextpdf.commons.actions.AbstractStatisticsEvent
    public AbstractStatisticsAggregator createStatisticsAggregatorFromName(String statisticsName) {
        if (NUMBER_OF_PAGES_STATISTICS.equals(statisticsName)) {
            return new NumberOfPagesStatisticsAggregator();
        }
        return super.createStatisticsAggregatorFromName(statisticsName);
    }

    @Override // com.itextpdf.commons.actions.AbstractStatisticsEvent
    public List<String> getStatisticsNames() {
        return Collections.singletonList(NUMBER_OF_PAGES_STATISTICS);
    }

    public int getNumberOfPages() {
        return this.numberOfPages;
    }
}
