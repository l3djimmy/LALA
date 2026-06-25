package com.itextpdf.commons.actions.producer;

import com.itextpdf.commons.exceptions.CommonsExceptionMessageConstant;
/* loaded from: classes12.dex */
abstract class AbstractFormattedPlaceholderPopulator implements IPlaceholderPopulator {
    protected static final char APOSTROPHE = '\'';
    private static final char A_LOWERCASE = 'a';
    private static final char A_UPPERCASE = 'A';
    private static final char ESCAPE_CHARACTER = '\\';
    private static final char Z_LOWERCASE = 'z';
    private static final char Z_UPPERCASE = 'Z';

    /* JADX INFO: Access modifiers changed from: protected */
    public int attachQuotedString(int index, StringBuilder builder, char[] formatArray) {
        boolean isEscaped = false;
        int index2 = index + 1;
        while (index2 < formatArray.length && (formatArray[index2] != '\'' || isEscaped)) {
            isEscaped = formatArray[index2] == '\\' && !isEscaped;
            if (!isEscaped) {
                builder.append(formatArray[index2]);
            }
            index2++;
        }
        if (index2 == formatArray.length) {
            throw new IllegalArgumentException(CommonsExceptionMessageConstant.PATTERN_CONTAINS_OPEN_QUOTATION);
        }
        return index2;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final boolean isLetter(char ch) {
        return ('a' <= ch && 'z' >= ch) || ('A' <= ch && 'Z' >= ch);
    }
}
