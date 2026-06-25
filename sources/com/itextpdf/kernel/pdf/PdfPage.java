package com.itextpdf.kernel.pdf;

import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.events.PdfDocumentEvent;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.action.PdfAction;
import com.itextpdf.kernel.pdf.annot.PdfAnnotation;
import com.itextpdf.kernel.pdf.annot.PdfLinkAnnotation;
import com.itextpdf.kernel.pdf.annot.PdfMarkupAnnotation;
import com.itextpdf.kernel.pdf.annot.PdfPrinterMarkAnnotation;
import com.itextpdf.kernel.pdf.annot.PdfWidgetAnnotation;
import com.itextpdf.kernel.pdf.filespec.PdfFileSpec;
import com.itextpdf.kernel.pdf.tagging.PdfStructTreeRoot;
import com.itextpdf.kernel.pdf.tagging.StandardRoles;
import com.itextpdf.kernel.pdf.tagutils.TagTreePointer;
import com.itextpdf.kernel.pdf.xobject.PdfFormXObject;
import com.itextpdf.kernel.pdf.xobject.PdfImageXObject;
import com.itextpdf.kernel.utils.ICopyFilter;
import com.itextpdf.kernel.utils.NullCopyFilter;
import com.itextpdf.kernel.xmp.XMPException;
import com.itextpdf.kernel.xmp.XMPMeta;
import com.itextpdf.kernel.xmp.XMPMetaFactory;
import com.itextpdf.kernel.xmp.options.SerializeOptions;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class PdfPage extends PdfObjectWrapper<PdfDictionary> {
    private static final List<PdfName> PAGE_EXCLUDED_KEYS = new ArrayList(Arrays.asList(PdfName.Parent, PdfName.Annots, PdfName.StructParents, PdfName.B));
    private static final List<PdfName> XOBJECT_EXCLUDED_KEYS = new ArrayList(Arrays.asList(PdfName.MediaBox, PdfName.CropBox, PdfName.TrimBox, PdfName.Contents));
    private boolean ignorePageRotationForContent;
    private int mcid;
    private boolean pageRotationInverseMatrixWritten;
    PdfPages parentPages;
    private PdfResources resources;

    static {
        XOBJECT_EXCLUDED_KEYS.addAll(PAGE_EXCLUDED_KEYS);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfPage(PdfDictionary pdfObject) {
        super(pdfObject);
        this.resources = null;
        this.mcid = -1;
        this.ignorePageRotationForContent = false;
        this.pageRotationInverseMatrixWritten = false;
        setForbidRelease();
        ensureObjectIsAddedToDocument(pdfObject);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfPage(PdfDocument pdfDocument, PageSize pageSize) {
        this((PdfDictionary) new PdfDictionary().makeIndirect(pdfDocument));
        PdfStream contentStream = (PdfStream) new PdfStream().makeIndirect(pdfDocument);
        getPdfObject().put(PdfName.Contents, contentStream);
        getPdfObject().put(PdfName.Type, PdfName.Page);
        getPdfObject().put(PdfName.MediaBox, new PdfArray(pageSize));
        getPdfObject().put(PdfName.TrimBox, new PdfArray(pageSize));
        if (pdfDocument.isTagged()) {
            setTabOrder(PdfName.S);
        }
    }

    protected PdfPage(PdfDocument pdfDocument) {
        this(pdfDocument, pdfDocument.getDefaultPageSize());
    }

    public Rectangle getPageSize() {
        return getMediaBox();
    }

    public Rectangle getPageSizeWithRotation() {
        PageSize rect = new PageSize(getPageSize());
        for (int rotation = getRotation(); rotation > 0; rotation -= 90) {
            rect = rect.rotate();
        }
        return rect;
    }

    public int getRotation() {
        PdfNumber rotate = getPdfObject().getAsNumber(PdfName.Rotate);
        int rotateValue = 0;
        if (rotate == null) {
            rotate = (PdfNumber) getInheritedValue(PdfName.Rotate, 8);
        }
        if (rotate != null) {
            rotateValue = rotate.intValue();
        }
        int rotateValue2 = rotateValue % 360;
        return rotateValue2 < 0 ? rotateValue2 + 360 : rotateValue2;
    }

    public PdfPage setRotation(int degAngle) {
        put(PdfName.Rotate, new PdfNumber(degAngle));
        return this;
    }

    public PdfStream getContentStream(int index) {
        int count = getContentStreamCount();
        if (index >= count || index < 0) {
            throw new IndexOutOfBoundsException(MessageFormatUtil.format("Index: {0}, Size: {1}", Integer.valueOf(index), Integer.valueOf(count)));
        }
        PdfObject contents = getPdfObject().get(PdfName.Contents);
        if (contents instanceof PdfStream) {
            return (PdfStream) contents;
        }
        if (contents instanceof PdfArray) {
            PdfArray a = (PdfArray) contents;
            return a.getAsStream(index);
        }
        return null;
    }

    public int getContentStreamCount() {
        PdfObject contents = getPdfObject().get(PdfName.Contents);
        if (contents instanceof PdfStream) {
            return 1;
        }
        if (contents instanceof PdfArray) {
            return ((PdfArray) contents).size();
        }
        return 0;
    }

    public PdfStream getFirstContentStream() {
        if (getContentStreamCount() > 0) {
            return getContentStream(0);
        }
        return null;
    }

    public PdfStream getLastContentStream() {
        int count = getContentStreamCount();
        if (count > 0) {
            return getContentStream(count - 1);
        }
        return null;
    }

    public PdfStream newContentStreamBefore() {
        return newContentStream(true);
    }

    public PdfStream newContentStreamAfter() {
        return newContentStream(false);
    }

    public PdfResources getResources() {
        return getResources(true);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public PdfResources getResources(boolean initResourcesField) {
        if (this.resources == null && initResourcesField) {
            initResources(true);
        }
        return this.resources;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public PdfDictionary initResources(boolean initResourcesField) {
        boolean readOnly = false;
        PdfDictionary resources = getPdfObject().getAsDictionary(PdfName.Resources);
        if (resources == null && (resources = (PdfDictionary) getInheritedValue(PdfName.Resources, 3)) != null) {
            readOnly = true;
        }
        if (resources == null) {
            resources = new PdfDictionary();
            getPdfObject().put(PdfName.Resources, resources);
        }
        if (initResourcesField) {
            this.resources = new PdfResources(resources);
            this.resources.setReadOnly(readOnly);
        }
        return resources;
    }

    public PdfPage setResources(PdfResources pdfResources) {
        put(PdfName.Resources, pdfResources.getPdfObject());
        this.resources = pdfResources;
        return this;
    }

    public PdfPage setXmpMetadata(byte[] xmpMetadata) throws IOException {
        PdfStream xmp = (PdfStream) new PdfStream().makeIndirect(getDocument());
        xmp.getOutputStream().write(xmpMetadata);
        xmp.put(PdfName.Type, PdfName.Metadata);
        xmp.put(PdfName.Subtype, PdfName.XML);
        put(PdfName.Metadata, xmp);
        return this;
    }

    public PdfPage setXmpMetadata(XMPMeta xmpMeta, SerializeOptions serializeOptions) throws XMPException, IOException {
        return setXmpMetadata(XMPMetaFactory.serializeToBuffer(xmpMeta, serializeOptions));
    }

    public PdfPage setXmpMetadata(XMPMeta xmpMeta) throws XMPException, IOException {
        SerializeOptions serializeOptions = new SerializeOptions();
        serializeOptions.setPadding(2000);
        return setXmpMetadata(xmpMeta, serializeOptions);
    }

    public PdfStream getXmpMetadata() {
        return getPdfObject().getAsStream(PdfName.Metadata);
    }

    public PdfPage copyTo(PdfDocument toDocument) {
        return copyTo(toDocument, null);
    }

    public PdfPage copyTo(PdfDocument toDocument, IPdfPageExtraCopier copier) {
        return copyTo(toDocument, copier, false, -1);
    }

    public PdfPage copyTo(PdfDocument toDocument, IPdfPageExtraCopier copier, boolean addPageToDocument, int pageInsertIndex) {
        ICopyFilter copyFilter = new DestinationResolverCopyFilter(getDocument(), toDocument);
        PdfDictionary dictionary = getPdfObject().copyTo(toDocument, PAGE_EXCLUDED_KEYS, true, copyFilter);
        PdfPage page = getDocument().getPageFactory().createPdfPage(dictionary);
        if (addPageToDocument) {
            if (pageInsertIndex == -1) {
                toDocument.addPage(page);
            } else {
                toDocument.addPage(pageInsertIndex, page);
            }
        }
        return copyTo(page, toDocument, copier);
    }

    public PdfFormXObject copyAsFormXObject(PdfDocument toDocument) throws IOException {
        PdfFormXObject xObject = new PdfFormXObject(getCropBox());
        for (PdfName key : getPdfObject().keySet()) {
            if (!XOBJECT_EXCLUDED_KEYS.contains(key)) {
                PdfObject obj = getPdfObject().get(key);
                if (!xObject.getPdfObject().containsKey(key)) {
                    PdfObject copyObj = obj.copyTo(toDocument, false, NullCopyFilter.getInstance());
                    xObject.getPdfObject().put(key, copyObj);
                }
            }
        }
        xObject.getPdfObject().getOutputStream().write(getContentBytes());
        if (!xObject.getPdfObject().containsKey(PdfName.Resources)) {
            PdfObject copyResource = getResources().getPdfObject().copyTo(toDocument, true, (ICopyFilter) NullCopyFilter.getInstance());
            xObject.getPdfObject().put(PdfName.Resources, copyResource);
        }
        return xObject;
    }

    public PdfDocument getDocument() {
        if (getPdfObject().getIndirectReference() != null) {
            return getPdfObject().getIndirectReference().getDocument();
        }
        return null;
    }

    @Override // com.itextpdf.kernel.pdf.PdfObjectWrapper
    public void flush() {
        flush(false);
    }

    public void flush(boolean flushResourcesContentStreams) {
        if (isFlushed()) {
            return;
        }
        getDocument().dispatchEvent(new PdfDocumentEvent(PdfDocumentEvent.END_PAGE, this));
        if (getDocument().isTagged() && !getDocument().getStructTreeRoot().isFlushed()) {
            tryFlushPageTags();
        }
        if (this.resources == null) {
            initResources(false);
        } else if (this.resources.isModified() && !this.resources.isReadOnly()) {
            put(PdfName.Resources, this.resources.getPdfObject());
        }
        if (flushResourcesContentStreams) {
            getDocument().checkIsoConformance(this, IsoKey.PAGE);
            flushResourcesContentStreams();
        }
        PdfArray annots = getAnnots(false);
        if (annots != null && !annots.isFlushed()) {
            for (int i = 0; i < annots.size(); i++) {
                PdfObject a = annots.get(i);
                if (a != null) {
                    a.makeIndirect(getDocument()).flush();
                }
            }
        }
        PdfStream thumb = getPdfObject().getAsStream(PdfName.Thumb);
        if (thumb != null) {
            thumb.flush();
        }
        PdfObject contentsObj = getPdfObject().get(PdfName.Contents);
        if (contentsObj != null && !contentsObj.isFlushed()) {
            int contentStreamCount = getContentStreamCount();
            for (int i2 = 0; i2 < contentStreamCount; i2++) {
                PdfStream contentStream = getContentStream(i2);
                if (contentStream != null) {
                    contentStream.flush(false);
                }
            }
        }
        releaseInstanceFields();
        super.flush();
    }

    public Rectangle getMediaBox() {
        PdfArray mediaBox = getPdfObject().getAsArray(PdfName.MediaBox);
        if (mediaBox == null) {
            mediaBox = (PdfArray) getInheritedValue(PdfName.MediaBox, 1);
        }
        if (mediaBox == null) {
            throw new PdfException(KernelExceptionMessageConstant.CANNOT_RETRIEVE_MEDIA_BOX_ATTRIBUTE);
        }
        int mediaBoxSize = mediaBox.size();
        if (mediaBoxSize != 4) {
            if (mediaBoxSize > 4) {
                Logger logger = LoggerFactory.getLogger(PdfPage.class);
                if (logger.isErrorEnabled()) {
                    logger.error(MessageFormatUtil.format(IoLogMessageConstant.WRONG_MEDIABOX_SIZE_TOO_MANY_ARGUMENTS, Integer.valueOf(mediaBoxSize)));
                }
            }
            if (mediaBoxSize < 4) {
                throw new PdfException(KernelExceptionMessageConstant.WRONG_MEDIA_BOX_SIZE_TOO_FEW_ARGUMENTS).setMessageParams(Integer.valueOf(mediaBox.size()));
            }
        }
        PdfNumber llx = mediaBox.getAsNumber(0);
        PdfNumber lly = mediaBox.getAsNumber(1);
        PdfNumber urx = mediaBox.getAsNumber(2);
        PdfNumber ury = mediaBox.getAsNumber(3);
        if (llx == null || lly == null || urx == null || ury == null) {
            throw new PdfException(KernelExceptionMessageConstant.INVALID_MEDIA_BOX_VALUE);
        }
        return new Rectangle(Math.min(llx.floatValue(), urx.floatValue()), Math.min(lly.floatValue(), ury.floatValue()), Math.abs(urx.floatValue() - llx.floatValue()), Math.abs(ury.floatValue() - lly.floatValue()));
    }

    public PdfPage setMediaBox(Rectangle rectangle) {
        put(PdfName.MediaBox, new PdfArray(rectangle));
        return this;
    }

    public Rectangle getCropBox() {
        PdfArray cropBox = getPdfObject().getAsArray(PdfName.CropBox);
        if (cropBox == null && (cropBox = (PdfArray) getInheritedValue(PdfName.CropBox, 1)) == null) {
            return getMediaBox();
        }
        return cropBox.toRectangle();
    }

    public PdfPage setCropBox(Rectangle rectangle) {
        put(PdfName.CropBox, new PdfArray(rectangle));
        return this;
    }

    public PdfPage setBleedBox(Rectangle rectangle) {
        put(PdfName.BleedBox, new PdfArray(rectangle));
        return this;
    }

    public Rectangle getBleedBox() {
        Rectangle bleedBox = getPdfObject().getAsRectangle(PdfName.BleedBox);
        return bleedBox == null ? getCropBox() : bleedBox;
    }

    public PdfPage setArtBox(Rectangle rectangle) {
        put(PdfName.ArtBox, new PdfArray(rectangle));
        return this;
    }

    public Rectangle getArtBox() {
        Rectangle artBox = getPdfObject().getAsRectangle(PdfName.ArtBox);
        return artBox == null ? getCropBox() : artBox;
    }

    public PdfPage setTrimBox(Rectangle rectangle) {
        put(PdfName.TrimBox, new PdfArray(rectangle));
        return this;
    }

    public Rectangle getTrimBox() {
        Rectangle trimBox = getPdfObject().getAsRectangle(PdfName.TrimBox);
        return trimBox == null ? getCropBox() : trimBox;
    }

    public byte[] getContentBytes() {
        try {
            MemoryLimitsAwareHandler handler = getDocument().memoryLimitsAwareHandler;
            long usedMemory = handler == null ? -1L : handler.getAllMemoryUsedForDecompression();
            MemoryLimitsAwareOutputStream baos = new MemoryLimitsAwareOutputStream();
            int streamCount = getContentStreamCount();
            for (int i = 0; i < streamCount; i++) {
                byte[] streamBytes = getStreamBytes(i);
                if (handler != null && usedMemory < handler.getAllMemoryUsedForDecompression()) {
                    baos.setMaxStreamSize(handler.getMaxSizeOfSingleDecompressedPdfStream());
                }
                baos.write(streamBytes);
                if (streamBytes.length != 0 && !Character.isWhitespace((char) streamBytes[streamBytes.length - 1])) {
                    baos.write(10);
                }
            }
            return baos.toByteArray();
        } catch (IOException ioe) {
            throw new PdfException(KernelExceptionMessageConstant.CANNOT_GET_CONTENT_BYTES, ioe, this);
        }
    }

    public byte[] getStreamBytes(int index) {
        return getContentStream(index).getBytes();
    }

    public int getNextMcid() {
        if (!getDocument().isTagged()) {
            throw new PdfException(KernelExceptionMessageConstant.MUST_BE_A_TAGGED_DOCUMENT);
        }
        if (this.mcid == -1) {
            PdfStructTreeRoot structTreeRoot = getDocument().getStructTreeRoot();
            this.mcid = structTreeRoot.getNextMcidForPage(this);
        }
        int i = this.mcid;
        this.mcid = i + 1;
        return i;
    }

    public int getStructParentIndex() {
        if (getPdfObject().getAsNumber(PdfName.StructParents) != null) {
            return getPdfObject().getAsNumber(PdfName.StructParents).intValue();
        }
        return -1;
    }

    public PdfPage setAdditionalAction(PdfName key, PdfAction action) {
        PdfAction.setAdditionalAction(this, key, action);
        return this;
    }

    public List<PdfAnnotation> getAnnotations() {
        PdfAnnotation annotation;
        List<PdfAnnotation> annotations = new ArrayList<>();
        PdfArray annots = getPdfObject().getAsArray(PdfName.Annots);
        if (annots != null) {
            for (int i = 0; i < annots.size(); i++) {
                PdfDictionary annot = annots.getAsDictionary(i);
                if (annot != null && (annotation = PdfAnnotation.makeAnnotation(annot)) != null) {
                    boolean hasBeenNotModified = (annot.getIndirectReference() == null || annot.getIndirectReference().checkState((short) 8)) ? false : true;
                    annotations.add(annotation.setPage(this));
                    if (hasBeenNotModified) {
                        annot.getIndirectReference().clearState((short) 8);
                        annot.clearState((short) 128);
                    }
                }
            }
        }
        return annotations;
    }

    public boolean containsAnnotation(PdfAnnotation annotation) {
        for (PdfAnnotation a : getAnnotations()) {
            if (a.getPdfObject().equals(annotation.getPdfObject())) {
                return true;
            }
        }
        return false;
    }

    public PdfPage addAnnotation(PdfAnnotation annotation) {
        return addAnnotation(-1, annotation, true);
    }

    public PdfPage addAnnotation(int index, PdfAnnotation annotation, boolean tagAnnotation) {
        if (getDocument().isTagged()) {
            if (tagAnnotation) {
                TagTreePointer tagPointer = getDocument().getTagStructureContext().getAutoTaggingPointer();
                if (!StandardRoles.ANNOT.equals(tagPointer.getRole()) && PdfVersion.PDF_1_4.compareTo(getDocument().getPdfVersion()) < 0) {
                    if (PdfVersion.PDF_2_0.compareTo(getDocument().getPdfVersion()) > 0) {
                        if (!(annotation instanceof PdfWidgetAnnotation) && !(annotation instanceof PdfLinkAnnotation) && !(annotation instanceof PdfPrinterMarkAnnotation)) {
                            tagPointer.addTag(StandardRoles.ANNOT);
                        }
                    } else if (annotation instanceof PdfMarkupAnnotation) {
                        tagPointer.addTag(StandardRoles.ANNOT);
                    }
                }
                PdfPage prevPage = tagPointer.getCurrentPage();
                tagPointer.setPageForTagging(this).addAnnotationTag(annotation);
                if (prevPage != null) {
                    tagPointer.setPageForTagging(prevPage);
                }
            }
            if (getTabOrder() == null) {
                setTabOrder(PdfName.S);
            }
        }
        PdfArray annots = getAnnots(true);
        if (index == -1) {
            annots.add(annotation.setPage(this).getPdfObject());
        } else {
            annots.add(index, annotation.setPage(this).getPdfObject());
        }
        if (annots.getIndirectReference() == null) {
            setModified();
        } else {
            annots.setModified();
        }
        return this;
    }

    public PdfPage removeAnnotation(PdfAnnotation annotation) {
        return removeAnnotation(annotation, false);
    }

    public PdfPage removeAnnotation(PdfAnnotation annotation, boolean rememberTagPointer) {
        TagTreePointer tagPointer;
        boolean standardAnnotTagRole = false;
        PdfArray annots = getAnnots(false);
        if (annots != null) {
            annots.remove(annotation.getPdfObject());
            if (annots.isEmpty()) {
                remove(PdfName.Annots);
            } else if (annots.getIndirectReference() == null) {
                setModified();
            } else {
                annots.setModified();
            }
        }
        if (getDocument().isTagged() && (tagPointer = getDocument().getTagStructureContext().removeAnnotationTag(annotation, rememberTagPointer)) != null) {
            standardAnnotTagRole = (StandardRoles.ANNOT.equals(tagPointer.getRole()) || StandardRoles.FORM.equals(tagPointer.getRole())) ? true : true;
            if (tagPointer.getKidsRoles().isEmpty() && standardAnnotTagRole) {
                tagPointer.removeTag();
            }
        }
        return this;
    }

    public int getAnnotsSize() {
        PdfArray annots = getAnnots(false);
        if (annots == null) {
            return 0;
        }
        return annots.size();
    }

    public List<PdfOutline> getOutlines(boolean updateOutlines) {
        getDocument().getOutlines(updateOutlines);
        return getDocument().getCatalog().getPagesWithOutlines().get(getPdfObject());
    }

    public boolean isIgnorePageRotationForContent() {
        return this.ignorePageRotationForContent;
    }

    public PdfPage setIgnorePageRotationForContent(boolean ignorePageRotationForContent) {
        this.ignorePageRotationForContent = ignorePageRotationForContent;
        return this;
    }

    public PdfPage setPageLabel(PageLabelNumberingStyle numberingStyle, String labelPrefix) {
        return setPageLabel(numberingStyle, labelPrefix, 1);
    }

    public PdfPage setPageLabel(PageLabelNumberingStyle numberingStyle, String labelPrefix, int firstPage) {
        if (firstPage < 1) {
            throw new PdfException(KernelExceptionMessageConstant.IN_A_PAGE_LABEL_THE_PAGE_NUMBERS_MUST_BE_GREATER_OR_EQUAL_TO_1);
        }
        PdfDictionary pageLabel = new PdfDictionary();
        if (numberingStyle != null) {
            switch (numberingStyle) {
                case DECIMAL_ARABIC_NUMERALS:
                    pageLabel.put(PdfName.S, PdfName.D);
                    break;
                case UPPERCASE_ROMAN_NUMERALS:
                    pageLabel.put(PdfName.S, PdfName.R);
                    break;
                case LOWERCASE_ROMAN_NUMERALS:
                    pageLabel.put(PdfName.S, PdfName.r);
                    break;
                case UPPERCASE_LETTERS:
                    pageLabel.put(PdfName.S, PdfName.A);
                    break;
                case LOWERCASE_LETTERS:
                    pageLabel.put(PdfName.S, PdfName.a);
                    break;
            }
        }
        if (labelPrefix != null) {
            pageLabel.put(PdfName.P, new PdfString(labelPrefix));
        }
        if (firstPage != 1) {
            pageLabel.put(PdfName.St, new PdfNumber(firstPage));
        }
        getDocument().getCatalog().getPageLabelsTree(true).addEntry(getDocument().getPageNumber(this) - 1, pageLabel);
        return this;
    }

    public PdfPage setTabOrder(PdfName tabOrder) {
        put(PdfName.Tabs, tabOrder);
        return this;
    }

    public PdfName getTabOrder() {
        return getPdfObject().getAsName(PdfName.Tabs);
    }

    public PdfPage setThumbnailImage(PdfImageXObject thumb) {
        return put(PdfName.Thumb, thumb.getPdfObject());
    }

    public PdfImageXObject getThumbnailImage() {
        PdfStream thumbStream = getPdfObject().getAsStream(PdfName.Thumb);
        if (thumbStream != null) {
            return new PdfImageXObject(thumbStream);
        }
        return null;
    }

    public PdfPage addOutputIntent(PdfOutputIntent outputIntent) {
        if (outputIntent == null) {
            return this;
        }
        PdfArray outputIntents = ((PdfDictionary) getPdfObject()).getAsArray(PdfName.OutputIntents);
        if (outputIntents == null) {
            outputIntents = new PdfArray();
            put(PdfName.OutputIntents, outputIntents);
        }
        outputIntents.add(outputIntent.getPdfObject());
        return this;
    }

    public PdfPage put(PdfName key, PdfObject value) {
        getPdfObject().put(key, value);
        setModified();
        return this;
    }

    public PdfPage remove(PdfName key) {
        getPdfObject().remove(key);
        setModified();
        return this;
    }

    public boolean isPageRotationInverseMatrixWritten() {
        return this.pageRotationInverseMatrixWritten;
    }

    public void setPageRotationInverseMatrixWritten() {
        this.pageRotationInverseMatrixWritten = true;
    }

    public void addAssociatedFile(String description, PdfFileSpec fs) {
        if (((PdfDictionary) fs.getPdfObject()).get(PdfName.AFRelationship) == null) {
            Logger logger = LoggerFactory.getLogger(PdfPage.class);
            logger.error(IoLogMessageConstant.ASSOCIATED_FILE_SPEC_SHALL_INCLUDE_AFRELATIONSHIP);
        }
        if (description != null) {
            PdfString key = new PdfString(description);
            getDocument().getCatalog().addNameToNameTree(key, fs.getPdfObject(), PdfName.EmbeddedFiles);
        }
        PdfArray afArray = ((PdfDictionary) getPdfObject()).getAsArray(PdfName.AF);
        if (afArray == null) {
            afArray = new PdfArray();
            put(PdfName.AF, afArray);
        }
        afArray.add(fs.getPdfObject());
    }

    public void addAssociatedFile(PdfFileSpec fs) {
        addAssociatedFile(null, fs);
    }

    public PdfArray getAssociatedFiles(boolean create) {
        PdfArray afArray = ((PdfDictionary) getPdfObject()).getAsArray(PdfName.AF);
        if (afArray == null && create) {
            PdfArray afArray2 = new PdfArray();
            put(PdfName.AF, afArray2);
            return afArray2;
        }
        return afArray;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void tryFlushPageTags() {
        try {
            if (!getDocument().isClosing) {
                getDocument().getTagStructureContext().flushPageTags(this);
            }
            getDocument().getStructTreeRoot().savePageStructParentIndexIfNeeded(this);
        } catch (Exception ex) {
            throw new PdfException(KernelExceptionMessageConstant.TAG_STRUCTURE_FLUSHING_FAILED_IT_MIGHT_BE_CORRUPTED, (Throwable) ex);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void releaseInstanceFields() {
        this.resources = null;
        this.parentPages = null;
    }

    @Override // com.itextpdf.kernel.pdf.PdfObjectWrapper
    protected boolean isWrappedObjectMustBeIndirect() {
        return true;
    }

    private PdfPage copyTo(PdfPage page, PdfDocument toDocument, IPdfPageExtraCopier copier) {
        ICopyFilter copyFilter = new DestinationResolverCopyFilter(getDocument(), toDocument);
        copyInheritedProperties(page, toDocument, NullCopyFilter.getInstance());
        copyAnnotations(toDocument, page, copyFilter);
        if (copier != null) {
            copier.copy(this, page);
        } else if (!toDocument.getWriter().isUserWarnedAboutAcroFormCopying && getDocument().hasAcroForm()) {
            Logger logger = LoggerFactory.getLogger(PdfPage.class);
            logger.warn(IoLogMessageConstant.SOURCE_DOCUMENT_HAS_ACROFORM_DICTIONARY);
            toDocument.getWriter().isUserWarnedAboutAcroFormCopying = true;
        }
        return page;
    }

    private PdfArray getAnnots(boolean create) {
        PdfArray annots = ((PdfDictionary) getPdfObject()).getAsArray(PdfName.Annots);
        if (annots == null && create) {
            PdfArray annots2 = new PdfArray();
            put(PdfName.Annots, annots2);
            return annots2;
        }
        return annots;
    }

    private PdfObject getInheritedValue(PdfName pdfName, int type) {
        if (this.parentPages == null) {
            this.parentPages = getDocument().getCatalog().getPageTree().findPageParent(this);
        }
        PdfObject val = getInheritedValue(this.parentPages, pdfName);
        if (val == null || val.getType() != type) {
            return null;
        }
        return val;
    }

    private static PdfObject getInheritedValue(PdfPages parentPages, PdfName pdfName) {
        if (parentPages != null) {
            PdfDictionary parentDictionary = parentPages.getPdfObject();
            PdfObject value = parentDictionary.get(pdfName);
            if (value != null) {
                return value;
            }
            return getInheritedValue(parentPages.getParent(), pdfName);
        }
        return null;
    }

    private PdfStream newContentStream(boolean before) {
        PdfArray array;
        PdfObject contents = ((PdfDictionary) getPdfObject()).get(PdfName.Contents);
        if (contents instanceof PdfStream) {
            array = new PdfArray();
            if (contents.getIndirectReference() != null) {
                array.add(contents.getIndirectReference());
            } else {
                array.add(contents);
            }
            put(PdfName.Contents, array);
        } else if (contents instanceof PdfArray) {
            array = (PdfArray) contents;
        } else {
            array = null;
        }
        PdfStream contentStream = (PdfStream) new PdfStream().makeIndirect(getDocument());
        if (array != null) {
            if (before) {
                array.add(0, contentStream);
            } else {
                array.add(contentStream);
            }
            if (array.getIndirectReference() != null) {
                array.setModified();
            } else {
                setModified();
            }
        } else {
            put(PdfName.Contents, contentStream);
        }
        return contentStream;
    }

    private void copyAnnotations(PdfDocument toDocument, PdfPage page, ICopyFilter copyFilter) {
        for (PdfAnnotation annot : getAnnotations()) {
            if (copyFilter.shouldProcess(page.getPdfObject(), null, annot.getPdfObject())) {
                PdfAnnotation newAnnot = PdfAnnotation.makeAnnotation(annot.getPdfObject().copyTo(toDocument, Arrays.asList(PdfName.P, PdfName.Parent), true, copyFilter));
                if (PdfName.Widget.equals(annot.getSubtype())) {
                    rebuildFormFieldParent(annot.getPdfObject(), newAnnot.getPdfObject(), toDocument);
                }
                page.addAnnotation(-1, newAnnot, false);
            }
        }
    }

    private void flushResourcesContentStreams() {
        flushResourcesContentStreams(getResources().getPdfObject());
        PdfArray annots = getAnnots(false);
        if (annots != null && !annots.isFlushed()) {
            for (int i = 0; i < annots.size(); i++) {
                PdfDictionary apDict = annots.getAsDictionary(i).getAsDictionary(PdfName.AP);
                if (apDict != null) {
                    flushAppearanceStreams(apDict);
                }
            }
        }
    }

    private void flushResourcesContentStreams(PdfDictionary resources) {
        if (resources != null && !resources.isFlushed()) {
            flushWithResources(resources.getAsDictionary(PdfName.XObject));
            flushWithResources(resources.getAsDictionary(PdfName.Pattern));
            flushWithResources(resources.getAsDictionary(PdfName.Shading));
        }
    }

    private void flushWithResources(PdfDictionary objsCollection) {
        if (objsCollection == null || objsCollection.isFlushed()) {
            return;
        }
        for (PdfObject obj : objsCollection.values()) {
            if (!obj.isFlushed()) {
                flushResourcesContentStreams(((PdfDictionary) obj).getAsDictionary(PdfName.Resources));
                flushMustBeIndirectObject(obj);
            }
        }
    }

    private void flushAppearanceStreams(PdfDictionary appearanceStreamsDict) {
        if (appearanceStreamsDict.isFlushed()) {
            return;
        }
        for (PdfObject val : appearanceStreamsDict.values()) {
            if (val instanceof PdfDictionary) {
                PdfDictionary ap = (PdfDictionary) val;
                if (ap.isDictionary()) {
                    flushAppearanceStreams(ap);
                } else if (ap.isStream()) {
                    flushMustBeIndirectObject(ap);
                }
            }
        }
    }

    private void flushMustBeIndirectObject(PdfObject obj) {
        obj.makeIndirect(getDocument()).flush();
    }

    private void copyInheritedProperties(PdfPage copyPdfPage, PdfDocument pdfDocument, ICopyFilter copyFilter) {
        PdfNumber rotate;
        PdfArray cropBox;
        if (copyPdfPage.getPdfObject().get(PdfName.Resources) == null) {
            PdfObject copyResource = pdfDocument.getWriter().copyObject(getResources().getPdfObject(), pdfDocument, false, copyFilter);
            copyPdfPage.getPdfObject().put(PdfName.Resources, copyResource);
        }
        PdfObject copyResource2 = copyPdfPage.getPdfObject();
        if (((PdfDictionary) copyResource2).get(PdfName.MediaBox) == null) {
            copyPdfPage.setMediaBox(getMediaBox());
        }
        if (copyPdfPage.getPdfObject().get(PdfName.CropBox) == null && (cropBox = (PdfArray) getInheritedValue(PdfName.CropBox, 1)) != null) {
            copyPdfPage.put(PdfName.CropBox, cropBox.copyTo(pdfDocument));
        }
        if (copyPdfPage.getPdfObject().get(PdfName.Rotate) == null && (rotate = (PdfNumber) getInheritedValue(PdfName.Rotate, 8)) != null) {
            copyPdfPage.put(PdfName.Rotate, rotate.copyTo(pdfDocument));
        }
    }

    private void rebuildFormFieldParent(PdfDictionary field, PdfDictionary newField, PdfDocument toDocument) {
        PdfDictionary oldParent;
        if (!newField.containsKey(PdfName.Parent) && (oldParent = field.getAsDictionary(PdfName.Parent)) != null) {
            PdfDictionary newParent = oldParent.copyTo(toDocument, Arrays.asList(PdfName.P, PdfName.Kids, PdfName.Parent), false, NullCopyFilter.getInstance());
            if (newParent.isFlushed()) {
                newParent = oldParent.copyTo(toDocument, Arrays.asList(PdfName.P, PdfName.Kids, PdfName.Parent), true, NullCopyFilter.getInstance());
            }
            if (oldParent == oldParent.getAsDictionary(PdfName.Parent)) {
                return;
            }
            rebuildFormFieldParent(oldParent, newParent, toDocument);
            PdfArray kids = newParent.getAsArray(PdfName.Kids);
            if (kids == null) {
                newParent.put(PdfName.Kids, new PdfArray());
            }
            newField.put(PdfName.Parent, newParent);
        }
    }
}
