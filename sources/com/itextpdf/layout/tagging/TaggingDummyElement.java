package com.itextpdf.layout.tagging;

import com.itextpdf.kernel.pdf.tagutils.AccessibilityProperties;
import com.itextpdf.kernel.pdf.tagutils.DefaultAccessibilityProperties;
import com.itextpdf.layout.IPropertyContainer;
/* loaded from: classes12.dex */
public class TaggingDummyElement implements IAccessibleElement, IPropertyContainer {
    private Object id;
    private DefaultAccessibilityProperties properties;

    public TaggingDummyElement(String role) {
        this.properties = new DefaultAccessibilityProperties(role);
    }

    @Override // com.itextpdf.layout.tagging.IAccessibleElement
    public AccessibilityProperties getAccessibilityProperties() {
        return this.properties;
    }

    @Override // com.itextpdf.layout.IPropertyContainer
    public <T1> T1 getProperty(int property) {
        if (property == 109) {
            return (T1) this.id;
        }
        return null;
    }

    @Override // com.itextpdf.layout.IPropertyContainer
    public void setProperty(int property, Object value) {
        if (property == 109) {
            this.id = value;
        }
    }

    @Override // com.itextpdf.layout.IPropertyContainer
    public boolean hasProperty(int property) {
        throw new UnsupportedOperationException();
    }

    @Override // com.itextpdf.layout.IPropertyContainer
    public boolean hasOwnProperty(int property) {
        throw new UnsupportedOperationException();
    }

    @Override // com.itextpdf.layout.IPropertyContainer
    public <T1> T1 getOwnProperty(int property) {
        throw new UnsupportedOperationException();
    }

    @Override // com.itextpdf.layout.IPropertyContainer
    public <T1> T1 getDefaultProperty(int property) {
        throw new UnsupportedOperationException();
    }

    @Override // com.itextpdf.layout.IPropertyContainer
    public void deleteOwnProperty(int property) {
        throw new UnsupportedOperationException();
    }
}
