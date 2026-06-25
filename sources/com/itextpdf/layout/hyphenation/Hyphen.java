package com.itextpdf.layout.hyphenation;
/* loaded from: classes12.dex */
public class Hyphen {
    public String noBreak;
    public String postBreak;
    public String preBreak;

    /* JADX INFO: Access modifiers changed from: package-private */
    public Hyphen(String pre, String no, String post) {
        this.preBreak = pre;
        this.noBreak = no;
        this.postBreak = post;
    }

    Hyphen(String pre) {
        this.preBreak = pre;
        this.noBreak = null;
        this.postBreak = null;
    }

    public String toString() {
        if (this.noBreak == null && this.postBreak == null && this.preBreak != null && this.preBreak.equals("-")) {
            return "-";
        }
        StringBuffer res = new StringBuffer("{");
        res.append(this.preBreak);
        res.append("}{");
        res.append(this.postBreak);
        res.append("}{");
        res.append(this.noBreak);
        res.append('}');
        return res.toString();
    }
}
