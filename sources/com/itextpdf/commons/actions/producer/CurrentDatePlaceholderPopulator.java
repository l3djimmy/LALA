package com.itextpdf.commons.actions.producer;

import com.itextpdf.commons.actions.confirmations.ConfirmedEventWrapper;
import com.itextpdf.commons.exceptions.CommonsExceptionMessageConstant;
import com.itextpdf.commons.utils.DateTimeUtil;
import com.itextpdf.commons.utils.MessageFormatUtil;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
/* loaded from: classes12.dex */
class CurrentDatePlaceholderPopulator extends AbstractFormattedPlaceholderPopulator {
    private static final Set<String> ALLOWED_PATTERNS = new HashSet(Arrays.asList("dd", "MM", "MMM", "MMMM", "yy", "yyyy", "ss", "mm", "HH"));

    @Override // com.itextpdf.commons.actions.producer.IPlaceholderPopulator
    public String populate(List<ConfirmedEventWrapper> events, String parameter) {
        if (parameter == null) {
            throw new IllegalArgumentException(MessageFormatUtil.format(CommonsExceptionMessageConstant.INVALID_USAGE_FORMAT_REQUIRED, "currentDate"));
        }
        Date now = DateTimeUtil.getCurrentTimeDate();
        return formatDate(now, parameter);
    }

    private String formatDate(Date date, String format) {
        StringBuilder builder = new StringBuilder();
        char[] formatArray = format.toCharArray();
        int i = 0;
        while (i < formatArray.length) {
            if (formatArray[i] == '\'') {
                i = attachQuotedString(i, builder, formatArray);
            } else if (isLetter(formatArray[i])) {
                i = processDateComponent(i, date, builder, formatArray);
            } else {
                builder.append(formatArray[i]);
            }
            i++;
        }
        return builder.toString();
    }

    private int processDateComponent(int index, Date date, StringBuilder builder, char[] formatArray) {
        StringBuilder peaceBuilder = new StringBuilder();
        char currentChar = formatArray[index];
        peaceBuilder.append(currentChar);
        while (index + 1 < formatArray.length && currentChar == formatArray[index + 1]) {
            index++;
            peaceBuilder.append(formatArray[index]);
        }
        String piece = peaceBuilder.toString();
        if (ALLOWED_PATTERNS.contains(piece)) {
            builder.append(DateTimeUtil.format(date, piece));
            return index;
        }
        throw new IllegalArgumentException(MessageFormatUtil.format(CommonsExceptionMessageConstant.PATTERN_CONTAINS_UNEXPECTED_COMPONENT, piece));
    }
}
