package com.itextpdf.kernel.pdf.statistics;

import com.itextpdf.commons.actions.AbstractStatisticsAggregator;
import com.itextpdf.commons.actions.AbstractStatisticsEvent;
import com.itextpdf.commons.actions.data.ProductData;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import java.util.Collections;
import java.util.List;
/* loaded from: classes12.dex */
public class SizeOfPdfStatisticsEvent extends AbstractStatisticsEvent {
    private static final String PDF_SIZE_STATISTICS = "pdfSize";
    private final long amountOfBytes;

    public SizeOfPdfStatisticsEvent(long amountOfBytes, ProductData productData) {
        super(productData);
        if (amountOfBytes < 0) {
            throw new IllegalArgumentException(KernelExceptionMessageConstant.AMOUNT_OF_BYTES_LESS_THAN_ZERO);
        }
        this.amountOfBytes = amountOfBytes;
    }

    @Override // com.itextpdf.commons.actions.AbstractStatisticsEvent
    public AbstractStatisticsAggregator createStatisticsAggregatorFromName(String statisticsName) {
        if (PDF_SIZE_STATISTICS.equals(statisticsName)) {
            return new SizeOfPdfStatisticsAggregator();
        }
        return super.createStatisticsAggregatorFromName(statisticsName);
    }

    @Override // com.itextpdf.commons.actions.AbstractStatisticsEvent
    public List<String> getStatisticsNames() {
        return Collections.singletonList(PDF_SIZE_STATISTICS);
    }

    public long getAmountOfBytes() {
        return this.amountOfBytes;
    }
}
