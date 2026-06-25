package com.itextpdf.io.font.cmap;

import com.itextpdf.io.exceptions.IoExceptionMessageConstant;
import com.itextpdf.io.font.constants.FontResources;
import com.itextpdf.io.source.PdfTokenizer;
import com.itextpdf.io.source.RandomAccessFileOrArray;
import com.itextpdf.io.source.RandomAccessSourceFactory;
import com.itextpdf.io.util.ResourceUtil;
import java.io.IOException;
import java.io.InputStream;
/* loaded from: classes12.dex */
public class CMapLocationResource implements ICMapLocation {
    @Override // com.itextpdf.io.font.cmap.ICMapLocation
    public PdfTokenizer getLocation(String location) throws IOException {
        String fullName = getLocationPath() + location;
        InputStream inp = ResourceUtil.getResourceStream(fullName);
        if (inp == null) {
            throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.CMAP_WAS_NOT_FOUND).setMessageParams(fullName);
        }
        return new PdfTokenizer(new RandomAccessFileOrArray(new RandomAccessSourceFactory().createSource(inp)));
    }

    public String getLocationPath() {
        return FontResources.CMAPS;
    }
}
