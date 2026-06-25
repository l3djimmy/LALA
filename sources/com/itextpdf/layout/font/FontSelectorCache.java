package com.itextpdf.layout.font;

import java.util.HashMap;
import java.util.Map;
/* loaded from: classes12.dex */
class FontSelectorCache {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private final Map<Long, FontSetSelectors> caches = new HashMap();
    private final FontSet defaultFontSet;
    private final FontSetSelectors defaultSelectors;

    /* JADX INFO: Access modifiers changed from: package-private */
    public FontSelectorCache(FontSet defaultFontSet) {
        if (defaultFontSet == null) {
            throw new AssertionError();
        }
        this.defaultSelectors = new FontSetSelectors();
        this.defaultSelectors.update(defaultFontSet);
        this.defaultFontSet = defaultFontSet;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public FontSelector get(FontSelectorKey key) {
        if (update(null, null)) {
            return null;
        }
        return this.defaultSelectors.map.get(key);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public FontSelector get(FontSelectorKey key, FontSet additionalFonts) {
        if (additionalFonts == null) {
            return get(key);
        }
        FontSetSelectors selectors = this.caches.get(Long.valueOf(additionalFonts.getId()));
        if (selectors == null) {
            Map<Long, FontSetSelectors> map = this.caches;
            Long valueOf = Long.valueOf(additionalFonts.getId());
            FontSetSelectors fontSetSelectors = new FontSetSelectors();
            selectors = fontSetSelectors;
            map.put(valueOf, fontSetSelectors);
        }
        if (update(selectors, additionalFonts)) {
            return null;
        }
        return selectors.map.get(key);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void put(FontSelectorKey key, FontSelector fontSelector) {
        update(null, null);
        this.defaultSelectors.map.put(key, fontSelector);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void put(FontSelectorKey key, FontSelector fontSelector, FontSet fontSet) {
        if (fontSet == null) {
            put(key, fontSelector);
            return;
        }
        FontSetSelectors selectors = this.caches.get(Long.valueOf(fontSet.getId()));
        if (selectors == null) {
            Map<Long, FontSetSelectors> map = this.caches;
            Long valueOf = Long.valueOf(fontSet.getId());
            FontSetSelectors fontSetSelectors = new FontSetSelectors();
            selectors = fontSetSelectors;
            map.put(valueOf, fontSetSelectors);
        }
        update(selectors, fontSet);
        selectors.map.put(key, fontSelector);
    }

    private boolean update(FontSetSelectors selectors, FontSet fontSet) {
        boolean updated = false;
        if (this.defaultSelectors.update(this.defaultFontSet)) {
            updated = true;
        }
        if (selectors != null && selectors.update(fontSet)) {
            return true;
        }
        return updated;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class FontSetSelectors {
        static final /* synthetic */ boolean $assertionsDisabled = false;
        private int fontSetSize;
        final Map<FontSelectorKey, FontSelector> map;

        private FontSetSelectors() {
            this.map = new HashMap();
            this.fontSetSize = -1;
        }

        boolean update(FontSet fontSet) {
            if (fontSet == null) {
                throw new AssertionError();
            }
            if (this.fontSetSize == fontSet.size()) {
                return false;
            }
            this.map.clear();
            this.fontSetSize = fontSet.size();
            return true;
        }
    }
}
