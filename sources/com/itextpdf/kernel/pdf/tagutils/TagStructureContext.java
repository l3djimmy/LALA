package com.itextpdf.kernel.pdf.tagutils;

import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfIndirectReference;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfNumber;
import com.itextpdf.kernel.pdf.PdfPage;
import com.itextpdf.kernel.pdf.PdfVersion;
import com.itextpdf.kernel.pdf.annot.PdfAnnotation;
import com.itextpdf.kernel.pdf.tagging.IStructureNode;
import com.itextpdf.kernel.pdf.tagging.PdfMcr;
import com.itextpdf.kernel.pdf.tagging.PdfNamespace;
import com.itextpdf.kernel.pdf.tagging.PdfObjRef;
import com.itextpdf.kernel.pdf.tagging.PdfStructElem;
import com.itextpdf.kernel.pdf.tagging.PdfStructTreeRoot;
import com.itextpdf.kernel.pdf.tagging.StandardNamespaces;
import com.itextpdf.kernel.pdf.tagging.StandardRoles;
import java.nio.charset.StandardCharsets;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class TagStructureContext {
    private static final Set<String> ALLOWED_ROOT_TAG_ROLES;
    protected TagTreePointer autoTaggingPointer;
    private PdfDocument document;
    private PdfNamespace documentDefaultNamespace;
    private boolean forbidUnknownRoles;
    private Map<String, PdfNamespace> nameToNamespace;
    private Set<PdfDictionary> namespaces;
    private PdfStructElem rootTagElement;
    private PdfVersion tagStructureTargetVersion;
    private WaitingTagsManager waitingTagsManager;

    static {
        HashSet<String> tempSet = new HashSet<>();
        tempSet.add(StandardRoles.DOCUMENT);
        tempSet.add(StandardRoles.PART);
        tempSet.add(StandardRoles.ART);
        tempSet.add(StandardRoles.SECT);
        tempSet.add(StandardRoles.DIV);
        ALLOWED_ROOT_TAG_ROLES = Collections.unmodifiableSet(tempSet);
    }

    public TagStructureContext(PdfDocument document) {
        this(document, document.getPdfVersion());
    }

    public TagStructureContext(PdfDocument document, PdfVersion tagStructureTargetVersion) {
        this.document = document;
        if (!document.isTagged()) {
            throw new PdfException(KernelExceptionMessageConstant.MUST_BE_A_TAGGED_DOCUMENT);
        }
        this.waitingTagsManager = new WaitingTagsManager();
        this.namespaces = new LinkedHashSet();
        this.nameToNamespace = new HashMap();
        this.tagStructureTargetVersion = tagStructureTargetVersion;
        this.forbidUnknownRoles = true;
        if (targetTagStructureVersionIs2()) {
            initRegisteredNamespaces();
            setNamespaceForNewTagsBasedOnExistingRoot();
        }
    }

    public TagStructureContext setForbidUnknownRoles(boolean forbidUnknownRoles) {
        this.forbidUnknownRoles = forbidUnknownRoles;
        return this;
    }

    public PdfVersion getTagStructureTargetVersion() {
        return this.tagStructureTargetVersion;
    }

    public TagTreePointer getAutoTaggingPointer() {
        if (this.autoTaggingPointer == null) {
            this.autoTaggingPointer = new TagTreePointer(this.document);
        }
        return this.autoTaggingPointer;
    }

    public WaitingTagsManager getWaitingTagsManager() {
        return this.waitingTagsManager;
    }

    public PdfNamespace getDocumentDefaultNamespace() {
        return this.documentDefaultNamespace;
    }

    public TagStructureContext setDocumentDefaultNamespace(PdfNamespace namespace) {
        this.documentDefaultNamespace = namespace;
        return this;
    }

    public PdfNamespace fetchNamespace(String namespaceName) {
        PdfNamespace ns = this.nameToNamespace.get(namespaceName);
        if (ns == null) {
            PdfNamespace ns2 = new PdfNamespace(namespaceName);
            this.nameToNamespace.put(namespaceName, ns2);
            return ns2;
        }
        return ns;
    }

    public IRoleMappingResolver getRoleMappingResolver(String role) {
        return getRoleMappingResolver(role, null);
    }

    public IRoleMappingResolver getRoleMappingResolver(String role, PdfNamespace namespace) {
        if (targetTagStructureVersionIs2()) {
            return new RoleMappingResolverPdf2(role, namespace, getDocument());
        }
        return new RoleMappingResolver(role, getDocument());
    }

    public boolean checkIfRoleShallBeMappedToStandardRole(String role, PdfNamespace namespace) {
        return resolveMappingToStandardOrDomainSpecificRole(role, namespace) != null;
    }

    public IRoleMappingResolver resolveMappingToStandardOrDomainSpecificRole(String role, PdfNamespace namespace) {
        IRoleMappingResolver mappingResolver = getRoleMappingResolver(role, namespace);
        mappingResolver.resolveNextMapping();
        int i = 0;
        while (mappingResolver.currentRoleShallBeMappedToStandard()) {
            i++;
            if (i > 100) {
                Logger logger = LoggerFactory.getLogger(TagStructureContext.class);
                logger.error(composeTooMuchTransitiveMappingsException(role, namespace));
                return null;
            } else if (!mappingResolver.resolveNextMapping()) {
                return null;
            }
        }
        return mappingResolver;
    }

    public TagTreePointer removeAnnotationTag(PdfAnnotation annotation) {
        return removeAnnotationTag(annotation, false);
    }

    public TagTreePointer removeAnnotationTag(PdfAnnotation annotation, boolean setAutoTaggingPointer) {
        PdfObjRef objRef;
        PdfStructElem structElem = null;
        PdfDictionary annotDic = annotation.getPdfObject();
        PdfNumber structParentIndex = (PdfNumber) annotDic.get(PdfName.StructParent);
        if (structParentIndex != null && (objRef = this.document.getStructTreeRoot().findObjRefByStructParentIndex(annotDic.getAsDictionary(PdfName.P), structParentIndex.intValue())) != null) {
            PdfStructElem parent = (PdfStructElem) objRef.getParent();
            parent.removeKid(objRef);
            structElem = parent;
        }
        annotDic.remove(PdfName.StructParent);
        annotDic.setModified();
        if (structElem != null) {
            TagTreePointer pointer = new TagTreePointer(this.document).setCurrentStructElem(structElem);
            if (setAutoTaggingPointer) {
                this.autoTaggingPointer = pointer;
            }
            return pointer;
        }
        return null;
    }

    public TagTreePointer removeContentItem(PdfPage page, int mcid) {
        PdfMcr mcr = this.document.getStructTreeRoot().findMcrByMcid(page.getPdfObject(), mcid);
        if (mcr == null) {
            return null;
        }
        PdfStructElem parent = (PdfStructElem) mcr.getParent();
        parent.removeKid(mcr);
        return new TagTreePointer(this.document).setCurrentStructElem(parent);
    }

    public TagStructureContext removePageTags(PdfPage page) {
        PdfStructTreeRoot structTreeRoot = this.document.getStructTreeRoot();
        Collection<PdfMcr> pageMcrs = structTreeRoot.getPageMarkedContentReferences(page);
        if (pageMcrs != null) {
            List<PdfMcr> mcrsList = new ArrayList<>(pageMcrs);
            for (PdfMcr mcr : mcrsList) {
                removePageTagFromParent(mcr, mcr.getParent());
            }
        }
        return this;
    }

    public TagStructureContext flushPageTags(PdfPage page) {
        PdfStructTreeRoot structTreeRoot = this.document.getStructTreeRoot();
        Collection<PdfMcr> pageMcrs = structTreeRoot.getPageMarkedContentReferences(page);
        if (pageMcrs != null) {
            for (PdfMcr mcr : pageMcrs) {
                PdfStructElem parent = (PdfStructElem) mcr.getParent();
                flushParentIfBelongsToPage(parent, page);
            }
        }
        return this;
    }

    public void normalizeDocumentRootTag() {
        boolean forbid = this.forbidUnknownRoles;
        this.forbidUnknownRoles = false;
        List<IStructureNode> rootKids = this.document.getStructTreeRoot().getKids();
        IRoleMappingResolver mapping = null;
        if (rootKids.size() > 0) {
            PdfStructElem firstKid = (PdfStructElem) rootKids.get(0);
            mapping = resolveMappingToStandardOrDomainSpecificRole(firstKid.getRole().getValue(), firstKid.getNamespace());
        }
        if (rootKids.size() == 1 && mapping != null && mapping.currentRoleIsStandard() && isRoleAllowedToBeRoot(mapping.getRole())) {
            this.rootTagElement = (PdfStructElem) rootKids.get(0);
        } else {
            this.document.getStructTreeRoot().getPdfObject().remove(PdfName.K);
            this.rootTagElement = new RootTagNormalizer(this, this.rootTagElement, this.document).makeSingleStandardRootTag(rootKids);
        }
        this.forbidUnknownRoles = forbid;
    }

    public void prepareToDocumentClosing() {
        this.waitingTagsManager.removeAllWaitingStates();
        actualizeNamespacesInStructTreeRoot();
    }

    public PdfStructElem getPointerStructElem(TagTreePointer pointer) {
        return pointer.getCurrentStructElem();
    }

    public TagTreePointer getTagPointerById(byte[] id) {
        PdfStructElem elem = this.document.getStructTreeRoot().getIdTree().getStructElemById(id);
        if (elem == null) {
            return null;
        }
        return new TagTreePointer(this.document).setCurrentStructElem(elem);
    }

    public TagTreePointer getTagPointerByIdString(String id) {
        return getTagPointerById(id.getBytes(StandardCharsets.UTF_8));
    }

    public TagTreePointer createPointerForStructElem(PdfStructElem structElem) {
        return new TagTreePointer(structElem, this.document);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public PdfStructElem getRootTag() {
        if (this.rootTagElement == null) {
            normalizeDocumentRootTag();
        }
        return this.rootTagElement;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public PdfDocument getDocument() {
        return this.document;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void ensureNamespaceRegistered(PdfNamespace namespace) {
        if (namespace != null) {
            PdfDictionary namespaceObj = namespace.getPdfObject();
            if (!this.namespaces.contains(namespaceObj)) {
                this.namespaces.add(namespaceObj);
            }
            this.nameToNamespace.put(namespace.getNamespaceName(), namespace);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void throwExceptionIfRoleIsInvalid(AccessibilityProperties properties, PdfNamespace pointerCurrentNamespace) {
        PdfNamespace namespace = properties.getNamespace();
        if (namespace == null) {
            namespace = pointerCurrentNamespace;
        }
        throwExceptionIfRoleIsInvalid(properties.getRole(), namespace);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void throwExceptionIfRoleIsInvalid(String role, PdfNamespace namespace) {
        if (!checkIfRoleShallBeMappedToStandardRole(role, namespace)) {
            String exMessage = composeInvalidRoleException(role, namespace);
            if (this.forbidUnknownRoles) {
                throw new PdfException(exMessage);
            }
            Logger logger = LoggerFactory.getLogger(TagStructureContext.class);
            logger.warn(exMessage);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean targetTagStructureVersionIs2() {
        return PdfVersion.PDF_2_0.compareTo(this.tagStructureTargetVersion) <= 0;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x004f, code lost:
        r1 = false;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void flushParentIfBelongsToPage(com.itextpdf.kernel.pdf.tagging.PdfStructElem r7, com.itextpdf.kernel.pdf.PdfPage r8) {
        /*
            r6 = this;
            boolean r0 = r7.isFlushed()
            if (r0 != 0) goto L6d
            com.itextpdf.kernel.pdf.tagutils.WaitingTagsManager r0 = r6.waitingTagsManager
            com.itextpdf.kernel.pdf.PdfObject r1 = r7.getPdfObject()
            com.itextpdf.kernel.pdf.PdfDictionary r1 = (com.itextpdf.kernel.pdf.PdfDictionary) r1
            java.lang.Object r0 = r0.getObjForStructDict(r1)
            if (r0 != 0) goto L6d
            com.itextpdf.kernel.pdf.tagging.IStructureNode r0 = r7.getParent()
            boolean r0 = r0 instanceof com.itextpdf.kernel.pdf.tagging.PdfStructTreeRoot
            if (r0 == 0) goto L1d
            goto L6d
        L1d:
            java.util.List r0 = r7.getKids()
            r1 = 1
            java.util.Iterator r2 = r0.iterator()
        L26:
            boolean r3 = r2.hasNext()
            if (r3 == 0) goto L59
            java.lang.Object r3 = r2.next()
            com.itextpdf.kernel.pdf.tagging.IStructureNode r3 = (com.itextpdf.kernel.pdf.tagging.IStructureNode) r3
            boolean r4 = r3 instanceof com.itextpdf.kernel.pdf.tagging.PdfMcr
            if (r4 == 0) goto L51
            r4 = r3
            com.itextpdf.kernel.pdf.tagging.PdfMcr r4 = (com.itextpdf.kernel.pdf.tagging.PdfMcr) r4
            com.itextpdf.kernel.pdf.PdfDictionary r4 = r4.getPageObject()
            boolean r5 = r4.isFlushed()
            if (r5 != 0) goto L57
            if (r8 == 0) goto L4f
            com.itextpdf.kernel.pdf.PdfObject r5 = r8.getPdfObject()
            boolean r5 = r4.equals(r5)
            if (r5 != 0) goto L57
        L4f:
            r1 = 0
            goto L59
        L51:
            boolean r4 = r3 instanceof com.itextpdf.kernel.pdf.tagging.PdfStructElem
            if (r4 == 0) goto L57
            r1 = 0
            goto L59
        L57:
            goto L26
        L59:
            if (r1 == 0) goto L6c
            com.itextpdf.kernel.pdf.tagging.IStructureNode r2 = r7.getParent()
            r7.flush()
            boolean r3 = r2 instanceof com.itextpdf.kernel.pdf.tagging.PdfStructElem
            if (r3 == 0) goto L6c
            r3 = r2
            com.itextpdf.kernel.pdf.tagging.PdfStructElem r3 = (com.itextpdf.kernel.pdf.tagging.PdfStructElem) r3
            r6.flushParentIfBelongsToPage(r3, r8)
        L6c:
            return
        L6d:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.itextpdf.kernel.pdf.tagutils.TagStructureContext.flushParentIfBelongsToPage(com.itextpdf.kernel.pdf.tagging.PdfStructElem, com.itextpdf.kernel.pdf.PdfPage):void");
    }

    private boolean isRoleAllowedToBeRoot(String role) {
        if (targetTagStructureVersionIs2()) {
            return StandardRoles.DOCUMENT.equals(role);
        }
        return ALLOWED_ROOT_TAG_ROLES.contains(role);
    }

    private void setNamespaceForNewTagsBasedOnExistingRoot() {
        String nsStr;
        List<IStructureNode> rootKids = this.document.getStructTreeRoot().getKids();
        if (rootKids.size() > 0) {
            PdfStructElem firstKid = (PdfStructElem) rootKids.get(0);
            IRoleMappingResolver resolvedMapping = resolveMappingToStandardOrDomainSpecificRole(firstKid.getRole().getValue(), firstKid.getNamespace());
            if (resolvedMapping == null || !resolvedMapping.currentRoleIsStandard()) {
                Logger logger = LoggerFactory.getLogger(TagStructureContext.class);
                if (firstKid.getNamespace() != null) {
                    nsStr = firstKid.getNamespace().getNamespaceName();
                } else {
                    nsStr = StandardNamespaces.getDefault();
                }
                logger.warn(MessageFormat.format(IoLogMessageConstant.EXISTING_TAG_STRUCTURE_ROOT_IS_NOT_STANDARD, firstKid.getRole().getValue(), nsStr));
            }
            if (resolvedMapping == null || !StandardNamespaces.PDF_1_7.equals(resolvedMapping.getNamespace().getNamespaceName())) {
                this.documentDefaultNamespace = fetchNamespace(StandardNamespaces.PDF_2_0);
                return;
            }
            return;
        }
        this.documentDefaultNamespace = fetchNamespace(StandardNamespaces.PDF_2_0);
    }

    private String composeInvalidRoleException(String role, PdfNamespace namespace) {
        return composeExceptionBasedOnNamespacePresence(role, namespace, "Role \"{0}\" is not mapped to any standard role.", "Role \"{0}\" in namespace {1} is not mapped to any standard role.");
    }

    private String composeTooMuchTransitiveMappingsException(String role, PdfNamespace namespace) {
        return composeExceptionBasedOnNamespacePresence(role, namespace, IoLogMessageConstant.CANNOT_RESOLVE_ROLE_TOO_MUCH_TRANSITIVE_MAPPINGS, IoLogMessageConstant.CANNOT_RESOLVE_ROLE_IN_NAMESPACE_TOO_MUCH_TRANSITIVE_MAPPINGS);
    }

    private void initRegisteredNamespaces() {
        PdfStructTreeRoot structTreeRoot = this.document.getStructTreeRoot();
        for (PdfNamespace namespace : structTreeRoot.getNamespaces()) {
            this.namespaces.add(namespace.getPdfObject());
            this.nameToNamespace.put(namespace.getNamespaceName(), namespace);
        }
    }

    private void actualizeNamespacesInStructTreeRoot() {
        if (this.namespaces.size() > 0) {
            PdfStructTreeRoot structTreeRoot = getDocument().getStructTreeRoot();
            PdfArray rootNamespaces = structTreeRoot.getNamespacesObject();
            Set<PdfDictionary> newNamespaces = new LinkedHashSet<>(this.namespaces);
            for (int i = 0; i < rootNamespaces.size(); i++) {
                newNamespaces.remove(rootNamespaces.getAsDictionary(i));
            }
            for (PdfDictionary newNs : newNamespaces) {
                rootNamespaces.add(newNs);
            }
            if (!newNamespaces.isEmpty()) {
                structTreeRoot.setModified();
            }
        }
    }

    private void removePageTagFromParent(IStructureNode pageTag, IStructureNode parent) {
        if (parent instanceof PdfStructElem) {
            PdfStructElem structParent = (PdfStructElem) parent;
            if (!structParent.isFlushed()) {
                structParent.removeKid(pageTag);
                PdfDictionary parentStructDict = structParent.getPdfObject();
                if (this.waitingTagsManager.getObjForStructDict(parentStructDict) == null && parent.getKids().size() == 0 && !(structParent.getParent() instanceof PdfStructTreeRoot)) {
                    removePageTagFromParent(structParent, parent.getParent());
                    PdfIndirectReference indRef = parentStructDict.getIndirectReference();
                    if (indRef != null) {
                        indRef.setFree();
                    }
                }
            } else if (pageTag instanceof PdfMcr) {
                throw new PdfException(KernelExceptionMessageConstant.CANNOT_REMOVE_TAG_BECAUSE_ITS_PARENT_IS_FLUSHED);
            }
        }
    }

    private String composeExceptionBasedOnNamespacePresence(String role, PdfNamespace namespace, String withoutNsEx, String withNsEx) {
        if (namespace == null) {
            return MessageFormat.format(withoutNsEx, role);
        }
        String nsName = namespace.getNamespaceName();
        PdfIndirectReference ref = namespace.getPdfObject().getIndirectReference();
        if (ref != null) {
            nsName = nsName + " (" + Integer.toString(ref.getObjNumber()) + " " + Integer.toString(ref.getGenNumber()) + " obj)";
        }
        return MessageFormat.format(withNsEx, role, nsName);
    }
}
