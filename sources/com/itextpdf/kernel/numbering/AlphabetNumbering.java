package com.itextpdf.kernel.numbering;
/* loaded from: classes12.dex */
public class AlphabetNumbering {
    public static String toAlphabetNumber(int number, char[] alphabet) {
        if (number < 1) {
            throw new IllegalArgumentException("The parameter must be a positive integer");
        }
        int cardinality = alphabet.length;
        int number2 = number - 1;
        int bytes = 1;
        long start = 0;
        for (long symbols = cardinality; number2 >= symbols + start; symbols *= cardinality) {
            bytes++;
            start += symbols;
        }
        long c = number2 - start;
        char[] value = new char[bytes];
        while (bytes > 0) {
            bytes--;
            value[bytes] = alphabet[(int) (c % cardinality)];
            c /= cardinality;
        }
        return new String(value);
    }
}
