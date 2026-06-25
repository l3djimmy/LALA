package com.itextpdf.kernel.pdf.tagging;

import com.itextpdf.kernel.pdf.PdfName;
import java.util.List;
/* loaded from: classes12.dex */
public interface IStructureNode {
    List<IStructureNode> getKids();

    IStructureNode getParent();

    PdfName getRole();
}
