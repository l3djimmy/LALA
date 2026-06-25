package com.itextpdf.kernel.numbering;

import com.itextpdf.io.font.constants.FontWeights;
/* loaded from: classes12.dex */
public class RomanNumbering {
    private static final RomanDigit[] ROMAN_DIGITS = {new RomanDigit('m', 1000, false), new RomanDigit('d', FontWeights.MEDIUM, false), new RomanDigit('c', 100, true), new RomanDigit('l', 50, false), new RomanDigit('x', 10, true), new RomanDigit('v', 5, false), new RomanDigit('i', 1, true)};

    public static String toRomanLowerCase(int number) {
        return convert(number);
    }

    public static String toRomanUpperCase(int number) {
        return convert(number).toUpperCase();
    }

    public static String toRoman(int number, boolean upperCase) {
        return upperCase ? toRomanUpperCase(number) : toRomanLowerCase(number);
    }

    protected static String convert(int index) {
        StringBuilder buf = new StringBuilder();
        if (index < 0) {
            buf.append('-');
            index = -index;
        }
        if (index >= 4000) {
            buf.append('|');
            buf.append(convert(index / 1000));
            buf.append('|');
            index -= (index / 1000) * 1000;
        }
        int pos = 0;
        while (true) {
            RomanDigit dig = ROMAN_DIGITS[pos];
            while (index >= dig.value) {
                buf.append(dig.digit);
                index -= dig.value;
            }
            if (index > 0) {
                int j = pos;
                do {
                    j++;
                } while (!ROMAN_DIGITS[j].pre);
                if (ROMAN_DIGITS[j].value + index >= dig.value) {
                    buf.append(ROMAN_DIGITS[j].digit).append(dig.digit);
                    index -= dig.value - ROMAN_DIGITS[j].value;
                }
                pos++;
            } else {
                return buf.toString();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class RomanDigit {
        public char digit;
        public boolean pre;
        public int value;

        RomanDigit(char digit, int value, boolean pre) {
            this.digit = digit;
            this.value = value;
            this.pre = pre;
        }
    }
}
