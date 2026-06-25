package com.itextpdf.io.font;
/* loaded from: classes12.dex */
public class FontIdentification {
    private String panose;
    private String ttfUniqueId;
    private String ttfVersion;
    private Integer type1Xuid;

    public String getTtfVersion() {
        return this.ttfVersion;
    }

    public String getTtfUniqueId() {
        return this.ttfUniqueId;
    }

    public Integer getType1Xuid() {
        return this.type1Xuid;
    }

    public String getPanose() {
        return this.panose;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setTtfVersion(String ttfVersion) {
        this.ttfVersion = ttfVersion;
    }

    protected void setTtfUniqueId(String ttfUniqueId) {
        this.ttfUniqueId = ttfUniqueId;
    }

    protected void setType1Xuid(Integer type1Xuid) {
        this.type1Xuid = type1Xuid;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setPanose(byte[] panose) {
        this.panose = new String(panose);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setPanose(String panose) {
        this.panose = panose;
    }
}
