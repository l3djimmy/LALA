package com.itextpdf.layout.font.selectorstrategy;

import com.itextpdf.commons.datastructures.Tuple2;
import com.itextpdf.io.font.otf.GlyphLine;
import com.itextpdf.kernel.font.PdfFont;
import java.util.List;
/* loaded from: classes12.dex */
public interface IFontSelectorStrategy {
    List<Tuple2<GlyphLine, PdfFont>> getGlyphLines(String str);
}
