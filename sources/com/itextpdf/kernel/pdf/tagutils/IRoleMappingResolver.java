package com.itextpdf.kernel.pdf.tagutils;

import com.itextpdf.kernel.pdf.tagging.PdfNamespace;
/* loaded from: classes12.dex */
public interface IRoleMappingResolver {
    boolean currentRoleIsStandard();

    boolean currentRoleShallBeMappedToStandard();

    PdfNamespace getNamespace();

    String getRole();

    boolean resolveNextMapping();
}
