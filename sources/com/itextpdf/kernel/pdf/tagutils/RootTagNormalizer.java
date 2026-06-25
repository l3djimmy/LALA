package com.itextpdf.kernel.pdf.tagutils;

import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.tagging.IStructureNode;
import com.itextpdf.kernel.pdf.tagging.PdfNamespace;
import com.itextpdf.kernel.pdf.tagging.PdfStructElem;
import com.itextpdf.kernel.pdf.tagging.StandardNamespaces;
import com.itextpdf.kernel.pdf.tagging.StandardRoles;
import java.text.MessageFormat;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes12.dex */
public class RootTagNormalizer {
    private TagStructureContext context;
    private PdfDocument document;
    private PdfStructElem rootTagElement;

    /* JADX INFO: Access modifiers changed from: package-private */
    public RootTagNormalizer(TagStructureContext context, PdfStructElem rootTagElement, PdfDocument document) {
        this.context = context;
        this.rootTagElement = rootTagElement;
        this.document = document;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public PdfStructElem makeSingleStandardRootTag(List<IStructureNode> rootKids) {
        this.document.getStructTreeRoot().makeIndirect(this.document);
        if (this.rootTagElement == null) {
            createNewRootTag();
        } else {
            this.rootTagElement.makeIndirect(this.document);
            this.document.getStructTreeRoot().addKid(this.rootTagElement);
            ensureExistingRootTagIsDocument();
        }
        addStructTreeRootKidsToTheRootTag(rootKids);
        return this.rootTagElement;
    }

    private void createNewRootTag() {
        PdfNamespace docDefaultNs = this.context.getDocumentDefaultNamespace();
        IRoleMappingResolver mapping = this.context.resolveMappingToStandardOrDomainSpecificRole(StandardRoles.DOCUMENT, docDefaultNs);
        if (mapping == null || (mapping.currentRoleIsStandard() && !StandardRoles.DOCUMENT.equals(mapping.getRole()))) {
            logCreatedRootTagHasMappingIssue(docDefaultNs, mapping);
        }
        this.rootTagElement = this.document.getStructTreeRoot().addKid(new PdfStructElem(this.document, PdfName.Document));
        if (this.context.targetTagStructureVersionIs2()) {
            this.rootTagElement.setNamespace(docDefaultNs);
            this.context.ensureNamespaceRegistered(docDefaultNs);
        }
    }

    private void ensureExistingRootTagIsDocument() {
        IRoleMappingResolver mapping = this.context.getRoleMappingResolver(this.rootTagElement.getRole().getValue(), this.rootTagElement.getNamespace());
        boolean isDocAfterResolving = true;
        boolean isDocBeforeResolving = mapping.currentRoleIsStandard() && StandardRoles.DOCUMENT.equals(mapping.getRole());
        IRoleMappingResolver mapping2 = this.context.resolveMappingToStandardOrDomainSpecificRole(this.rootTagElement.getRole().getValue(), this.rootTagElement.getNamespace());
        if (mapping2 == null || !mapping2.currentRoleIsStandard() || !StandardRoles.DOCUMENT.equals(mapping2.getRole())) {
            isDocAfterResolving = false;
        }
        if (isDocBeforeResolving && !isDocAfterResolving) {
            logCreatedRootTagHasMappingIssue(this.rootTagElement.getNamespace(), mapping2);
        } else if (!isDocAfterResolving) {
            wrapAllKidsInTag(this.rootTagElement, this.rootTagElement.getRole(), this.rootTagElement.getNamespace());
            this.rootTagElement.setRole(PdfName.Document);
            if (this.context.targetTagStructureVersionIs2()) {
                this.rootTagElement.setNamespace(this.context.getDocumentDefaultNamespace());
                this.context.ensureNamespaceRegistered(this.context.getDocumentDefaultNamespace());
            }
        }
    }

    private void addStructTreeRootKidsToTheRootTag(List<IStructureNode> rootKids) {
        int originalRootKidsIndex = 0;
        boolean isBeforeOriginalRoot = true;
        for (IStructureNode elem : rootKids) {
            PdfStructElem kid = (PdfStructElem) elem;
            if (kid.getPdfObject() == this.rootTagElement.getPdfObject()) {
                isBeforeOriginalRoot = false;
            } else {
                boolean kidIsDocument = PdfName.Document.equals(kid.getRole());
                if (kidIsDocument && kid.getNamespace() != null && this.context.targetTagStructureVersionIs2()) {
                    String kidNamespaceName = kid.getNamespace().getNamespaceName();
                    kidIsDocument = StandardNamespaces.PDF_1_7.equals(kidNamespaceName) || StandardNamespaces.PDF_2_0.equals(kidNamespaceName);
                }
                PdfStructElem pdfStructElem = this.rootTagElement;
                if (isBeforeOriginalRoot) {
                    pdfStructElem.addKid(originalRootKidsIndex, kid);
                    originalRootKidsIndex += kidIsDocument ? kid.getKids().size() : 1;
                } else {
                    pdfStructElem.addKid(kid);
                }
                if (kidIsDocument) {
                    removeOldRoot(kid);
                }
            }
        }
    }

    private void wrapAllKidsInTag(PdfStructElem parent, PdfName wrapTagRole, PdfNamespace wrapTagNs) {
        int kidsNum = parent.getKids().size();
        TagTreePointer tagPointer = new TagTreePointer(parent, this.document);
        tagPointer.addTag(0, wrapTagRole.getValue());
        if (this.context.targetTagStructureVersionIs2()) {
            tagPointer.getProperties().setNamespace(wrapTagNs);
        }
        TagTreePointer newParentOfKids = new TagTreePointer(tagPointer);
        tagPointer.moveToParent();
        for (int i = 0; i < kidsNum; i++) {
            tagPointer.relocateKid(1, newParentOfKids);
        }
    }

    private void removeOldRoot(PdfStructElem oldRoot) {
        new TagTreePointer(oldRoot, this.document).removeTag();
    }

    private void logCreatedRootTagHasMappingIssue(PdfNamespace rootTagOriginalNs, IRoleMappingResolver mapping) {
        String mappingRole;
        String origRootTagNs = "";
        if (rootTagOriginalNs != null && rootTagOriginalNs.getNamespaceName() != null) {
            origRootTagNs = " in \"" + rootTagOriginalNs.getNamespaceName() + "\" namespace";
        }
        if (mapping != null) {
            mappingRole = " to \"" + mapping.getRole() + "\"";
            if (mapping.getNamespace() != null && !StandardNamespaces.PDF_1_7.equals(mapping.getNamespace().getNamespaceName())) {
                mappingRole = mappingRole + " in \"" + mapping.getNamespace().getNamespaceName() + "\" namespace";
            }
        } else {
            mappingRole = " to not standard role";
        }
        Logger logger = LoggerFactory.getLogger(RootTagNormalizer.class);
        logger.warn(MessageFormat.format(IoLogMessageConstant.CREATED_ROOT_TAG_HAS_MAPPING, origRootTagNs, mappingRole));
    }
}
