package com.itextpdf.layout.font;

import java.util.ArrayList;
import java.util.List;
/* loaded from: classes12.dex */
final class FontSelectorKey {
    private FontCharacteristics fc;
    private List<String> fontFamilies;

    /* JADX INFO: Access modifiers changed from: package-private */
    public FontSelectorKey(List<String> fontFamilies, FontCharacteristics fc) {
        this.fontFamilies = new ArrayList(fontFamilies);
        this.fc = fc;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        FontSelectorKey that = (FontSelectorKey) o;
        if (this.fontFamilies.equals(that.fontFamilies)) {
            if (this.fc != null) {
                if (this.fc.equals(that.fc)) {
                    return true;
                }
            } else if (that.fc == null) {
                return true;
            }
        }
        return false;
    }

    public int hashCode() {
        int result = this.fontFamilies != null ? this.fontFamilies.hashCode() : 0;
        return (result * 31) + (this.fc != null ? this.fc.hashCode() : 0);
    }
}
