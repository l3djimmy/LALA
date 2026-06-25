package com.itextpdf.layout.tagging;

import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.tagging.PdfStructureAttributes;
import com.itextpdf.kernel.pdf.tagging.StandardRoles;
import com.itextpdf.kernel.pdf.tagutils.AccessibilityProperties;
import com.itextpdf.layout.exceptions.LayoutExceptionMessageConstant;
import java.util.List;
/* loaded from: classes12.dex */
class THTaggingRule implements ITaggingRule {
    @Override // com.itextpdf.layout.tagging.ITaggingRule
    public boolean onTagFinish(LayoutTaggingHelper taggingHelper, TaggingHintKey taggingHintKey) {
        if (taggingHintKey.getAccessibilityProperties() == null) {
            throw new IllegalArgumentException(LayoutExceptionMessageConstant.TAGGING_HINTKEY_SHOULD_HAVE_ACCES);
        }
        List<PdfStructureAttributes> attributesList = taggingHintKey.getAccessibilityProperties().getAttributesList();
        for (PdfStructureAttributes attributes : attributesList) {
            PdfName scopeValue = attributes.getPdfObject().getAsName(PdfName.Scope);
            if (scopeValue != null && !PdfName.None.equals(scopeValue)) {
                return true;
            }
            if (PdfName.None.equals(scopeValue)) {
                attributes.removeAttribute(PdfName.Scope.getValue());
                return true;
            }
        }
        if (taggingHintKey.getTagPointer() == null) {
            return true;
        }
        AccessibilityProperties properties = taggingHintKey.getAccessibilityProperties();
        PdfStructureAttributes atr = new PdfStructureAttributes(StandardRoles.TABLE);
        atr.addEnumAttribute(PdfName.Scope.getValue(), PdfName.Column.getValue());
        properties.addAttributes(atr);
        taggingHintKey.getTagPointer().applyProperties(properties);
        return true;
    }
}
