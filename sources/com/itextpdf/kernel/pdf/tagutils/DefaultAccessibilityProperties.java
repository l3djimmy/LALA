package com.itextpdf.kernel.pdf.tagutils;

import com.itextpdf.kernel.pdf.tagging.PdfNamespace;
import com.itextpdf.kernel.pdf.tagging.PdfStructureAttributes;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
/* loaded from: classes12.dex */
public class DefaultAccessibilityProperties extends AccessibilityProperties {
    protected String actualText;
    protected String alternateDescription;
    protected String expansion;
    protected String language;
    protected PdfNamespace namespace;
    protected String phoneme;
    protected String phoneticAlphabet;
    protected String role;
    private byte[] structElemId;
    protected List<PdfStructureAttributes> attributesList = new ArrayList();
    protected List<TagTreePointer> refs = new ArrayList();

    public DefaultAccessibilityProperties(String role) {
        this.role = role;
    }

    @Override // com.itextpdf.kernel.pdf.tagutils.AccessibilityProperties
    public String getRole() {
        return this.role;
    }

    @Override // com.itextpdf.kernel.pdf.tagutils.AccessibilityProperties
    public AccessibilityProperties setRole(String role) {
        this.role = role;
        return this;
    }

    @Override // com.itextpdf.kernel.pdf.tagutils.AccessibilityProperties
    public String getLanguage() {
        return this.language;
    }

    @Override // com.itextpdf.kernel.pdf.tagutils.AccessibilityProperties
    public AccessibilityProperties setLanguage(String language) {
        this.language = language;
        return this;
    }

    @Override // com.itextpdf.kernel.pdf.tagutils.AccessibilityProperties
    public String getActualText() {
        return this.actualText;
    }

    @Override // com.itextpdf.kernel.pdf.tagutils.AccessibilityProperties
    public AccessibilityProperties setActualText(String actualText) {
        this.actualText = actualText;
        return this;
    }

    @Override // com.itextpdf.kernel.pdf.tagutils.AccessibilityProperties
    public String getAlternateDescription() {
        return this.alternateDescription;
    }

    @Override // com.itextpdf.kernel.pdf.tagutils.AccessibilityProperties
    public AccessibilityProperties setAlternateDescription(String alternateDescription) {
        this.alternateDescription = alternateDescription;
        return this;
    }

    @Override // com.itextpdf.kernel.pdf.tagutils.AccessibilityProperties
    public String getExpansion() {
        return this.expansion;
    }

    @Override // com.itextpdf.kernel.pdf.tagutils.AccessibilityProperties
    public AccessibilityProperties setExpansion(String expansion) {
        this.expansion = expansion;
        return this;
    }

    @Override // com.itextpdf.kernel.pdf.tagutils.AccessibilityProperties
    public AccessibilityProperties addAttributes(PdfStructureAttributes attributes) {
        return addAttributes(-1, attributes);
    }

    @Override // com.itextpdf.kernel.pdf.tagutils.AccessibilityProperties
    public AccessibilityProperties addAttributes(int index, PdfStructureAttributes attributes) {
        if (attributes != null) {
            List<PdfStructureAttributes> list = this.attributesList;
            if (index > 0) {
                list.add(index, attributes);
            } else {
                list.add(attributes);
            }
        }
        return this;
    }

    @Override // com.itextpdf.kernel.pdf.tagutils.AccessibilityProperties
    public AccessibilityProperties clearAttributes() {
        this.attributesList.clear();
        return this;
    }

    @Override // com.itextpdf.kernel.pdf.tagutils.AccessibilityProperties
    public List<PdfStructureAttributes> getAttributesList() {
        return this.attributesList;
    }

    @Override // com.itextpdf.kernel.pdf.tagutils.AccessibilityProperties
    public String getPhoneme() {
        return this.phoneme;
    }

    @Override // com.itextpdf.kernel.pdf.tagutils.AccessibilityProperties
    public AccessibilityProperties setPhoneme(String phoneme) {
        this.phoneme = phoneme;
        return this;
    }

    @Override // com.itextpdf.kernel.pdf.tagutils.AccessibilityProperties
    public String getPhoneticAlphabet() {
        return this.phoneticAlphabet;
    }

    @Override // com.itextpdf.kernel.pdf.tagutils.AccessibilityProperties
    public AccessibilityProperties setPhoneticAlphabet(String phoneticAlphabet) {
        this.phoneticAlphabet = phoneticAlphabet;
        return this;
    }

    @Override // com.itextpdf.kernel.pdf.tagutils.AccessibilityProperties
    public PdfNamespace getNamespace() {
        return this.namespace;
    }

    @Override // com.itextpdf.kernel.pdf.tagutils.AccessibilityProperties
    public AccessibilityProperties setNamespace(PdfNamespace namespace) {
        this.namespace = namespace;
        return this;
    }

    @Override // com.itextpdf.kernel.pdf.tagutils.AccessibilityProperties
    public AccessibilityProperties addRef(TagTreePointer treePointer) {
        this.refs.add(new TagTreePointer(treePointer));
        return this;
    }

    @Override // com.itextpdf.kernel.pdf.tagutils.AccessibilityProperties
    public List<TagTreePointer> getRefsList() {
        return Collections.unmodifiableList(this.refs);
    }

    @Override // com.itextpdf.kernel.pdf.tagutils.AccessibilityProperties
    public AccessibilityProperties clearRefs() {
        this.refs.clear();
        return this;
    }

    @Override // com.itextpdf.kernel.pdf.tagutils.AccessibilityProperties
    public byte[] getStructureElementId() {
        return this.structElemId;
    }

    @Override // com.itextpdf.kernel.pdf.tagutils.AccessibilityProperties
    public AccessibilityProperties setStructureElementId(byte[] id) {
        this.structElemId = Arrays.copyOf(id, id.length);
        return this;
    }
}
