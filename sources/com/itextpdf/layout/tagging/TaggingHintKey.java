package com.itextpdf.layout.tagging;

import com.itextpdf.kernel.pdf.tagutils.AccessibilityProperties;
import com.itextpdf.kernel.pdf.tagutils.TagTreePointer;
/* loaded from: classes12.dex */
public final class TaggingHintKey {
    private IAccessibleElement elem;
    private boolean elementBasedFinishingOnly;
    private boolean isArtifact;
    private boolean isFinished;
    private String overriddenRole;
    private TagTreePointer tagPointer;

    /* JADX INFO: Access modifiers changed from: package-private */
    public TaggingHintKey(IAccessibleElement elem, boolean createdElementBased) {
        this.elem = elem;
        this.elementBasedFinishingOnly = createdElementBased;
    }

    public IAccessibleElement getAccessibleElement() {
        return this.elem;
    }

    public TagTreePointer getTagPointer() {
        return this.tagPointer;
    }

    public void setTagPointer(TagTreePointer tag) {
        this.tagPointer = tag;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public AccessibilityProperties getAccessibilityProperties() {
        if (this.elem == null) {
            return null;
        }
        return this.elem.getAccessibilityProperties();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isFinished() {
        return this.isFinished;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setFinished() {
        this.isFinished = true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isArtifact() {
        return this.isArtifact;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setArtifact() {
        this.isArtifact = true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String getOverriddenRole() {
        return this.overriddenRole;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setOverriddenRole(String overriddenRole) {
        this.overriddenRole = overriddenRole;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isElementBasedFinishingOnly() {
        return this.elementBasedFinishingOnly;
    }
}
