package com.itextpdf.commons.actions.producer;

import com.itextpdf.commons.actions.confirmations.ConfirmedEventWrapper;
import com.itextpdf.commons.exceptions.CommonsExceptionMessageConstant;
import com.itextpdf.commons.utils.MessageFormatUtil;
import java.util.List;
/* loaded from: classes12.dex */
class CopyrightSincePlaceholderPopulator implements IPlaceholderPopulator {
    @Override // com.itextpdf.commons.actions.producer.IPlaceholderPopulator
    public String populate(List<ConfirmedEventWrapper> events, String parameter) {
        if (parameter != null) {
            throw new IllegalArgumentException(MessageFormatUtil.format(CommonsExceptionMessageConstant.INVALID_USAGE_CONFIGURATION_FORBIDDEN, "copyrightSince"));
        }
        int earliestYear = Integer.MAX_VALUE;
        for (ConfirmedEventWrapper event : events) {
            int currentYear = event.getEvent().getProductData().getSinceCopyrightYear();
            if (currentYear < earliestYear) {
                earliestYear = currentYear;
            }
        }
        return String.valueOf(earliestYear);
    }
}
