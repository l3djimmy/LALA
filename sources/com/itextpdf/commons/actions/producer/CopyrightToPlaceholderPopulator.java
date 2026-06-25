package com.itextpdf.commons.actions.producer;

import com.itextpdf.commons.actions.confirmations.ConfirmedEventWrapper;
import com.itextpdf.commons.exceptions.CommonsExceptionMessageConstant;
import com.itextpdf.commons.utils.MessageFormatUtil;
import java.util.List;
/* loaded from: classes12.dex */
class CopyrightToPlaceholderPopulator implements IPlaceholderPopulator {
    @Override // com.itextpdf.commons.actions.producer.IPlaceholderPopulator
    public String populate(List<ConfirmedEventWrapper> events, String parameter) {
        if (parameter != null) {
            throw new IllegalArgumentException(MessageFormatUtil.format(CommonsExceptionMessageConstant.INVALID_USAGE_CONFIGURATION_FORBIDDEN, "copyrightTo"));
        }
        int latestYear = Integer.MIN_VALUE;
        for (ConfirmedEventWrapper event : events) {
            int currentYear = event.getEvent().getProductData().getToCopyrightYear();
            if (currentYear > latestYear) {
                latestYear = currentYear;
            }
        }
        return String.valueOf(latestYear);
    }
}
