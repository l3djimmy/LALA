package com.itextpdf.kernel.pdf.tagutils;

import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.tagging.PdfNamespace;
import com.itextpdf.kernel.pdf.tagging.PdfStructTreeRoot;
import com.itextpdf.kernel.pdf.tagging.StandardNamespaces;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes12.dex */
public class RoleMappingResolver implements IRoleMappingResolver {
    private PdfName currRole;
    private PdfDictionary roleMap;

    /* JADX INFO: Access modifiers changed from: package-private */
    public RoleMappingResolver(String role, PdfDocument document) {
        this.currRole = PdfStructTreeRoot.convertRoleToPdfName(role);
        this.roleMap = document.getStructTreeRoot().getRoleMap();
    }

    @Override // com.itextpdf.kernel.pdf.tagutils.IRoleMappingResolver
    public String getRole() {
        return this.currRole.getValue();
    }

    @Override // com.itextpdf.kernel.pdf.tagutils.IRoleMappingResolver
    public PdfNamespace getNamespace() {
        return null;
    }

    @Override // com.itextpdf.kernel.pdf.tagutils.IRoleMappingResolver
    public boolean currentRoleIsStandard() {
        return StandardNamespaces.roleBelongsToStandardNamespace(this.currRole.getValue(), StandardNamespaces.PDF_1_7);
    }

    @Override // com.itextpdf.kernel.pdf.tagutils.IRoleMappingResolver
    public boolean currentRoleShallBeMappedToStandard() {
        return !currentRoleIsStandard();
    }

    @Override // com.itextpdf.kernel.pdf.tagutils.IRoleMappingResolver
    public boolean resolveNextMapping() {
        PdfName mappedRole = this.roleMap.getAsName(this.currRole);
        if (mappedRole == null) {
            return false;
        }
        this.currRole = mappedRole;
        return true;
    }
}
