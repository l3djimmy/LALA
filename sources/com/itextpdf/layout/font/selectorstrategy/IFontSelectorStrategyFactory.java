package com.itextpdf.layout.font.selectorstrategy;

import com.itextpdf.layout.font.FontProvider;
import com.itextpdf.layout.font.FontSelector;
import com.itextpdf.layout.font.FontSet;
/* loaded from: classes12.dex */
public interface IFontSelectorStrategyFactory {
    IFontSelectorStrategy createFontSelectorStrategy(FontProvider fontProvider, FontSelector fontSelector, FontSet fontSet);
}
