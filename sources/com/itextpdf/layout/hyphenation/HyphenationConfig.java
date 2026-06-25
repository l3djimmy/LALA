package com.itextpdf.layout.hyphenation;
/* loaded from: classes12.dex */
public class HyphenationConfig {
    protected char hyphenSymbol = '-';
    protected Hyphenator hyphenator;

    public HyphenationConfig(int leftMin, int rightMin) {
        this.hyphenator = new Hyphenator(null, null, leftMin, rightMin);
    }

    public HyphenationConfig(Hyphenator hyphenator) {
        this.hyphenator = hyphenator;
    }

    public HyphenationConfig(String lang, String country, int leftMin, int rightMin) {
        this.hyphenator = new Hyphenator(lang, country, leftMin, rightMin);
    }

    public Hyphenation hyphenate(String word) {
        if (this.hyphenator != null) {
            return this.hyphenator.hyphenate(word);
        }
        return null;
    }

    public char getHyphenSymbol() {
        return this.hyphenSymbol;
    }

    public void setHyphenSymbol(char hyphenSymbol) {
        this.hyphenSymbol = hyphenSymbol;
    }
}
