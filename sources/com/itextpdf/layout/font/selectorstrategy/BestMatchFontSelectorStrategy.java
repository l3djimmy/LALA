package com.itextpdf.layout.font.selectorstrategy;

import com.itextpdf.layout.font.FontProvider;
import com.itextpdf.layout.font.FontSelector;
import com.itextpdf.layout.font.FontSet;
/* loaded from: classes12.dex */
public class BestMatchFontSelectorStrategy extends AbstractFontSelectorStrategy {
    public BestMatchFontSelectorStrategy(FontProvider fontProvider, FontSelector fontSelector, FontSet additionalFonts) {
        super(fontProvider, fontSelector, additionalFonts);
    }

    @Override // com.itextpdf.layout.font.selectorstrategy.AbstractFontSelectorStrategy
    protected boolean isCurrentFontCheckRequired() {
        return true;
    }

    /* loaded from: classes12.dex */
    public static final class BestMatchFontSelectorStrategyFactory implements IFontSelectorStrategyFactory {
        @Override // com.itextpdf.layout.font.selectorstrategy.IFontSelectorStrategyFactory
        public IFontSelectorStrategy createFontSelectorStrategy(FontProvider fontProvider, FontSelector fontSelector, FontSet additionalFonts) {
            return new BestMatchFontSelectorStrategy(fontProvider, fontSelector, additionalFonts);
        }
    }
}
