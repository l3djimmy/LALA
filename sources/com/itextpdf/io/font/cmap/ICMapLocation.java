package com.itextpdf.io.font.cmap;

import com.itextpdf.io.source.PdfTokenizer;
import java.io.IOException;
/* loaded from: classes12.dex */
public interface ICMapLocation {
    PdfTokenizer getLocation(String str) throws IOException;
}
