package com.itextpdf.kernel.pdf.tagutils;

import com.itextpdf.io.font.PdfEncodings;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfNumber;
import com.itextpdf.kernel.pdf.PdfObject;
import com.itextpdf.kernel.pdf.PdfString;
import com.itextpdf.kernel.pdf.tagging.PdfStructElem;
import com.itextpdf.kernel.pdf.tagging.PdfStructureAttributes;
import java.util.List;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes12.dex */
public final class AccessibilityPropertiesToStructElem {
    AccessibilityPropertiesToStructElem() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void apply(AccessibilityProperties properties, PdfStructElem elem) {
        setTextualAids(properties, elem);
        setAttributes(properties.getAttributesList(), elem);
        if (properties.getNamespace() != null) {
            elem.setNamespace(properties.getNamespace());
        }
        if (properties.getStructureElementId() != null) {
            elem.setStructureElementId(new PdfString(properties.getStructureElementId()));
        }
        for (TagTreePointer ref : properties.getRefsList()) {
            elem.addRef(ref.getCurrentStructElem());
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static PdfObject combineAttributesList(PdfObject attributesObject, int insertIndex, List<PdfStructureAttributes> newAttributesList, PdfNumber revision) {
        if (attributesObject instanceof PdfDictionary) {
            PdfArray combinedAttributesArray = new PdfArray();
            combinedAttributesArray.add(attributesObject);
            addNewAttributesToAttributesArray(insertIndex, newAttributesList, revision, combinedAttributesArray);
            return combinedAttributesArray;
        } else if (attributesObject instanceof PdfArray) {
            PdfArray combinedAttributesArray2 = (PdfArray) attributesObject;
            addNewAttributesToAttributesArray(insertIndex, newAttributesList, revision, combinedAttributesArray2);
            return combinedAttributesArray2;
        } else if (newAttributesList.size() == 1) {
            if (insertIndex > 0) {
                throw new IndexOutOfBoundsException();
            }
            return newAttributesList.get(0).getPdfObject();
        } else {
            PdfObject combinedAttributes = new PdfArray();
            addNewAttributesToAttributesArray(insertIndex, newAttributesList, revision, (PdfArray) combinedAttributes);
            return combinedAttributes;
        }
    }

    private static void setAttributes(List<PdfStructureAttributes> newAttributesList, PdfStructElem elem) {
        if (newAttributesList.size() > 0) {
            PdfObject attributesObject = elem.getAttributes(false);
            PdfObject combinedAttributes = combineAttributesList(attributesObject, -1, newAttributesList, elem.getPdfObject().getAsNumber(PdfName.R));
            elem.setAttributes(combinedAttributes);
        }
    }

    private static void setTextualAids(AccessibilityProperties properties, PdfStructElem elem) {
        if (properties.getLanguage() != null) {
            elem.setLang(new PdfString(properties.getLanguage(), PdfEncodings.UNICODE_BIG));
        }
        if (properties.getActualText() != null) {
            elem.setActualText(new PdfString(properties.getActualText(), PdfEncodings.UNICODE_BIG));
        }
        if (properties.getAlternateDescription() != null) {
            elem.setAlt(new PdfString(properties.getAlternateDescription(), PdfEncodings.UNICODE_BIG));
        }
        if (properties.getExpansion() != null) {
            elem.setE(new PdfString(properties.getExpansion(), PdfEncodings.UNICODE_BIG));
        }
        if (properties.getPhoneme() != null) {
            elem.setPhoneme(new PdfString(properties.getPhoneme(), PdfEncodings.UNICODE_BIG));
        }
        if (properties.getPhoneticAlphabet() != null) {
            elem.setPhoneticAlphabet(new PdfName(properties.getPhoneticAlphabet()));
        }
    }

    private static void addNewAttributesToAttributesArray(int insertIndex, List<PdfStructureAttributes> newAttributesList, PdfNumber revision, PdfArray attributesArray) {
        if (insertIndex < 0) {
            insertIndex = attributesArray.size();
        }
        if (revision != null) {
            for (PdfStructureAttributes attributes : newAttributesList) {
                int insertIndex2 = insertIndex + 1;
                attributesArray.add(insertIndex, attributes.getPdfObject());
                insertIndex = insertIndex2 + 1;
                attributesArray.add(insertIndex2, revision);
            }
            return;
        }
        for (PdfStructureAttributes newAttribute : newAttributesList) {
            attributesArray.add(insertIndex, newAttribute.getPdfObject());
            insertIndex++;
        }
    }
}
