package com.itextpdf.kernel.pdf;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes12.dex */
final class PdfNameLoader {
    PdfNameLoader() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static Map<String, PdfName> loadNames() {
        Field[] fields = PdfName.class.getDeclaredFields();
        Map<String, PdfName> staticNames = new HashMap<>(fields.length);
        try {
            for (Field field : fields) {
                if ((field.getModifiers() & 25) == 25 && field.getType().equals(PdfName.class)) {
                    PdfName name = (PdfName) field.get(null);
                    staticNames.put(name.getValue(), name);
                }
            }
            return staticNames;
        } catch (Exception e) {
            return null;
        }
    }
}
