package com.itextpdf.commons.actions;

import com.itextpdf.commons.actions.data.ProductData;
import com.itextpdf.commons.logs.CommonsLogMessageConstant;
import com.itextpdf.commons.utils.MessageFormatUtil;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public abstract class AbstractStatisticsEvent extends AbstractProductITextEvent {
    private static final Logger LOGGER = LoggerFactory.getLogger(AbstractStatisticsEvent.class);

    public abstract List<String> getStatisticsNames();

    /* JADX INFO: Access modifiers changed from: protected */
    public AbstractStatisticsEvent(ProductData productData) {
        super(productData);
    }

    public AbstractStatisticsAggregator createStatisticsAggregatorFromName(String statisticsName) {
        LOGGER.warn(MessageFormatUtil.format(CommonsLogMessageConstant.INVALID_STATISTICS_NAME, statisticsName));
        return null;
    }
}
