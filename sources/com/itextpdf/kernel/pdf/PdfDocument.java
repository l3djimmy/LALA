package com.itextpdf.kernel.pdf;

import androidx.exifinterface.media.ExifInterface;
import com.itextpdf.commons.actions.EventManager;
import com.itextpdf.commons.actions.confirmations.ConfirmEvent;
import com.itextpdf.commons.actions.confirmations.EventConfirmationType;
import com.itextpdf.commons.actions.data.ProductData;
import com.itextpdf.commons.actions.sequence.SequenceId;
import com.itextpdf.commons.utils.DIContainer;
import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.io.source.ByteUtils;
import com.itextpdf.io.source.RandomAccessFileOrArray;
import com.itextpdf.kernel.actions.data.ITextCoreProductData;
import com.itextpdf.kernel.actions.events.FlushPdfDocumentEvent;
import com.itextpdf.kernel.actions.events.ITextCoreProductEvent;
import com.itextpdf.kernel.colors.Color;
import com.itextpdf.kernel.events.Event;
import com.itextpdf.kernel.events.EventDispatcher;
import com.itextpdf.kernel.events.IEventDispatcher;
import com.itextpdf.kernel.events.IEventHandler;
import com.itextpdf.kernel.events.PdfDocumentEvent;
import com.itextpdf.kernel.exceptions.BadPasswordException;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.logs.KernelLogMessageConstant;
import com.itextpdf.kernel.numbering.EnglishAlphabetNumbering;
import com.itextpdf.kernel.numbering.RomanNumbering;
import com.itextpdf.kernel.pdf.PdfReader;
import com.itextpdf.kernel.pdf.annot.PdfAnnotation;
import com.itextpdf.kernel.pdf.annot.PdfWidgetAnnotation;
import com.itextpdf.kernel.pdf.canvas.CanvasGraphicsState;
import com.itextpdf.kernel.pdf.collection.PdfCollection;
import com.itextpdf.kernel.pdf.filespec.PdfEncryptedPayloadFileSpecFactory;
import com.itextpdf.kernel.pdf.filespec.PdfFileSpec;
import com.itextpdf.kernel.pdf.navigation.PdfDestination;
import com.itextpdf.kernel.pdf.statistics.NumberOfPagesStatisticsEvent;
import com.itextpdf.kernel.pdf.statistics.SizeOfPdfStatisticsEvent;
import com.itextpdf.kernel.pdf.tagging.PdfStructTreeRoot;
import com.itextpdf.kernel.pdf.tagutils.TagStructureContext;
import com.itextpdf.kernel.utils.ValidationContainer;
import com.itextpdf.kernel.utils.ValidationContext;
import com.itextpdf.kernel.xmp.PdfConst;
import com.itextpdf.kernel.xmp.XMPConst;
import com.itextpdf.kernel.xmp.XMPException;
import com.itextpdf.kernel.xmp.XMPMeta;
import com.itextpdf.kernel.xmp.XMPMetaFactory;
import com.itextpdf.kernel.xmp.options.PropertyOptions;
import com.itextpdf.kernel.xmp.options.SerializeOptions;
import com.itextpdf.layout.properties.Property;
import java.io.Closeable;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Consumer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class PdfDocument implements IEventDispatcher, Closeable {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private static final PdfName[] PDF_NAMES_TO_REMOVE_FROM_ORIGINAL_TRAILER = {PdfName.Encrypt, PdfName.Size, PdfName.Prev, PdfName.Root, PdfName.Info, PdfName.ID, PdfName.XRefStm};
    private static final IPdfPageFactory pdfPageFactory = new PdfPageFactory();
    protected PdfCatalog catalog;
    protected boolean closeReader;
    protected boolean closeWriter;
    protected boolean closed;
    private PdfFont defaultFont;
    private PageSize defaultPageSize;
    private final DIContainer diContainer;
    private final Map<PdfIndirectReference, PdfFont> documentFonts;
    private final SequenceId documentId;
    private EncryptedEmbeddedStreamsHandler encryptedEmbeddedStreamsHandler;
    protected EventDispatcher eventDispatcher;
    protected FingerPrint fingerPrint;
    protected boolean flushUnusedObjects;
    protected PdfDocumentInfo info;
    protected boolean isClosing;
    MemoryLimitsAwareHandler memoryLimitsAwareHandler;
    private PdfString modifiedDocumentId;
    private PdfString originalDocumentId;
    protected PdfVersion pdfVersion;
    private final List<DestinationMutationInfo> pendingDestinationMutations;
    protected final StampingProperties properties;
    protected PdfReader reader;
    protected SerializeOptions serializeOptions;
    Map<PdfIndirectReference, byte[]> serializedObjectsCache;
    protected int structParentIndex;
    protected PdfStructTreeRoot structTreeRoot;
    protected TagStructureContext tagStructureContext;
    protected PdfDictionary trailer;
    protected PdfWriter writer;
    protected byte[] xmpMetadata;
    final PdfXrefTable xref;

    public PdfDocument(PdfReader reader) {
        this(reader, new DocumentProperties());
    }

    public PdfDocument(PdfReader reader, DocumentProperties properties) {
        this.xref = new PdfXrefTable();
        this.documentFonts = new HashMap();
        this.pendingDestinationMutations = new ArrayList();
        this.eventDispatcher = new EventDispatcher();
        this.writer = null;
        this.reader = null;
        this.xmpMetadata = null;
        this.catalog = null;
        this.trailer = null;
        this.info = null;
        this.pdfVersion = PdfVersion.PDF_1_7;
        this.serializeOptions = new SerializeOptions();
        this.structParentIndex = -1;
        this.closeReader = true;
        this.closeWriter = true;
        this.isClosing = false;
        this.closed = false;
        this.flushUnusedObjects = false;
        this.serializedObjectsCache = new HashMap();
        this.memoryLimitsAwareHandler = null;
        this.defaultPageSize = PageSize.DEFAULT;
        this.defaultFont = null;
        this.diContainer = new DIContainer();
        if (reader == null) {
            throw new IllegalArgumentException("The reader in PdfDocument constructor can not be null.");
        }
        this.documentId = new SequenceId();
        this.reader = reader;
        this.properties = new StampingProperties();
        this.properties.setEventCountingMetaInfo(properties.metaInfo);
        open(null);
    }

    public PdfDocument(PdfWriter writer) {
        this(writer, new DocumentProperties());
    }

    public PdfDocument(PdfWriter writer, DocumentProperties properties) {
        this.xref = new PdfXrefTable();
        this.documentFonts = new HashMap();
        this.pendingDestinationMutations = new ArrayList();
        this.eventDispatcher = new EventDispatcher();
        this.writer = null;
        this.reader = null;
        this.xmpMetadata = null;
        this.catalog = null;
        this.trailer = null;
        this.info = null;
        this.pdfVersion = PdfVersion.PDF_1_7;
        this.serializeOptions = new SerializeOptions();
        this.structParentIndex = -1;
        this.closeReader = true;
        this.closeWriter = true;
        this.isClosing = false;
        this.closed = false;
        this.flushUnusedObjects = false;
        this.serializedObjectsCache = new HashMap();
        this.memoryLimitsAwareHandler = null;
        this.defaultPageSize = PageSize.DEFAULT;
        this.defaultFont = null;
        this.diContainer = new DIContainer();
        if (writer == null) {
            throw new IllegalArgumentException("The writer in PdfDocument constructor can not be null.");
        }
        this.documentId = new SequenceId();
        this.writer = writer;
        this.properties = new StampingProperties();
        this.properties.setEventCountingMetaInfo(properties.metaInfo);
        open(writer.properties.pdfVersion);
    }

    public PdfDocument(PdfReader reader, PdfWriter writer) {
        this(reader, writer, new StampingProperties());
    }

    public PdfDocument(PdfReader reader, PdfWriter writer, StampingProperties properties) {
        this.xref = new PdfXrefTable();
        this.documentFonts = new HashMap();
        this.pendingDestinationMutations = new ArrayList();
        this.eventDispatcher = new EventDispatcher();
        this.writer = null;
        this.reader = null;
        this.xmpMetadata = null;
        this.catalog = null;
        this.trailer = null;
        this.info = null;
        this.pdfVersion = PdfVersion.PDF_1_7;
        this.serializeOptions = new SerializeOptions();
        this.structParentIndex = -1;
        this.closeReader = true;
        this.closeWriter = true;
        this.isClosing = false;
        this.closed = false;
        this.flushUnusedObjects = false;
        this.serializedObjectsCache = new HashMap();
        this.memoryLimitsAwareHandler = null;
        this.defaultPageSize = PageSize.DEFAULT;
        this.defaultFont = null;
        this.diContainer = new DIContainer();
        if (reader == null) {
            throw new IllegalArgumentException("The reader in PdfDocument constructor can not be null.");
        }
        if (writer == null) {
            throw new IllegalArgumentException("The writer in PdfDocument constructor can not be null.");
        }
        this.documentId = new SequenceId();
        this.reader = reader;
        this.writer = writer;
        this.properties = properties;
        boolean writerHasEncryption = writerHasEncryption();
        if (properties.appendMode && writerHasEncryption) {
            Logger logger = LoggerFactory.getLogger(PdfDocument.class);
            logger.warn(IoLogMessageConstant.WRITER_ENCRYPTION_IS_IGNORED_APPEND);
        }
        if (properties.preserveEncryption && writerHasEncryption) {
            Logger logger2 = LoggerFactory.getLogger(PdfDocument.class);
            logger2.warn(IoLogMessageConstant.WRITER_ENCRYPTION_IS_IGNORED_PRESERVE);
        }
        open(writer.properties.pdfVersion);
    }

    public void setXmpMetadata(XMPMeta xmpMeta, SerializeOptions serializeOptions) throws XMPException {
        this.serializeOptions = serializeOptions;
        setXmpMetadata(XMPMetaFactory.serializeToBuffer(xmpMeta, serializeOptions));
    }

    protected void setXmpMetadata(byte[] xmpMetadata) {
        this.xmpMetadata = xmpMetadata;
    }

    public void setXmpMetadata(XMPMeta xmpMeta) throws XMPException {
        this.serializeOptions.setPadding(2000);
        setXmpMetadata(xmpMeta, this.serializeOptions);
    }

    public byte[] getXmpMetadata() {
        return getXmpMetadata(false);
    }

    public byte[] getXmpMetadata(boolean createNew) {
        if (this.xmpMetadata == null && createNew) {
            XMPMeta xmpMeta = XMPMetaFactory.create();
            xmpMeta.setObjectName(XMPConst.TAG_XMPMETA);
            xmpMeta.setObjectName("");
            addCustomMetadataExtensions(xmpMeta);
            try {
                xmpMeta.setProperty(XMPConst.NS_DC, PdfConst.Format, "application/pdf");
                setXmpMetadata(xmpMeta);
            } catch (XMPException e) {
            }
        }
        return this.xmpMetadata;
    }

    public PdfObject getPdfObject(int objNum) {
        checkClosingStatus();
        PdfIndirectReference reference = this.xref.get(objNum);
        if (reference == null) {
            return null;
        }
        return reference.getRefersTo();
    }

    public int getNumberOfPdfObjects() {
        return this.xref.size();
    }

    public PdfPage getPage(int pageNum) {
        checkClosingStatus();
        return this.catalog.getPageTree().getPage(pageNum);
    }

    public PdfPage getPage(PdfDictionary pageDictionary) {
        checkClosingStatus();
        return this.catalog.getPageTree().getPage(pageDictionary);
    }

    public PdfPage getFirstPage() {
        checkClosingStatus();
        return getPage(1);
    }

    public PdfPage getLastPage() {
        return getPage(getNumberOfPages());
    }

    public MemoryLimitsAwareHandler getMemoryLimitsAwareHandler() {
        return this.memoryLimitsAwareHandler;
    }

    public void markStreamAsEmbeddedFile(PdfStream stream) {
        this.encryptedEmbeddedStreamsHandler.storeEmbeddedStream(stream);
    }

    public PdfPage addNewPage() {
        return addNewPage(getDefaultPageSize());
    }

    public PdfPage addNewPage(PageSize pageSize) {
        checkClosingStatus();
        PdfPage page = getPageFactory().createPdfPage(this, pageSize);
        checkAndAddPage(page);
        dispatchEvent(new PdfDocumentEvent(PdfDocumentEvent.START_PAGE, page));
        dispatchEvent(new PdfDocumentEvent(PdfDocumentEvent.INSERT_PAGE, page));
        return page;
    }

    public PdfPage addNewPage(int index) {
        return addNewPage(index, getDefaultPageSize());
    }

    public PdfPage addNewPage(int index, PageSize pageSize) {
        checkClosingStatus();
        PdfPage page = getPageFactory().createPdfPage(this, pageSize);
        checkAndAddPage(index, page);
        dispatchEvent(new PdfDocumentEvent(PdfDocumentEvent.START_PAGE, page));
        dispatchEvent(new PdfDocumentEvent(PdfDocumentEvent.INSERT_PAGE, page));
        return page;
    }

    public PdfPage addPage(PdfPage page) {
        checkClosingStatus();
        checkAndAddPage(page);
        dispatchEvent(new PdfDocumentEvent(PdfDocumentEvent.INSERT_PAGE, page));
        return page;
    }

    public PdfPage addPage(int index, PdfPage page) {
        checkClosingStatus();
        checkAndAddPage(index, page);
        dispatchEvent(new PdfDocumentEvent(PdfDocumentEvent.INSERT_PAGE, page));
        return page;
    }

    public int getNumberOfPages() {
        checkClosingStatus();
        return this.catalog.getPageTree().getNumberOfPages();
    }

    public int getPageNumber(PdfPage page) {
        checkClosingStatus();
        return this.catalog.getPageTree().getPageNumber(page);
    }

    public int getPageNumber(PdfDictionary pageDictionary) {
        return this.catalog.getPageTree().getPageNumber(pageDictionary);
    }

    public boolean movePage(PdfPage page, int insertBefore) {
        checkClosingStatus();
        int pageNum = getPageNumber(page);
        if (pageNum > 0) {
            movePage(pageNum, insertBefore);
            return true;
        }
        return false;
    }

    public void movePage(int pageNumber, int insertBefore) {
        checkClosingStatus();
        if (insertBefore < 1 || insertBefore > getNumberOfPages() + 1) {
            throw new IndexOutOfBoundsException(MessageFormatUtil.format(KernelExceptionMessageConstant.REQUESTED_PAGE_NUMBER_IS_OUT_OF_BOUNDS, Integer.valueOf(insertBefore)));
        }
        PdfPage page = getPage(pageNumber);
        if (isTagged()) {
            getStructTreeRoot().move(page, insertBefore);
            getTagStructureContext().normalizeDocumentRootTag();
        }
        PdfPage removedPage = this.catalog.getPageTree().removePage(pageNumber);
        if (insertBefore > pageNumber) {
            insertBefore--;
        }
        this.catalog.getPageTree().addPage(insertBefore, removedPage);
    }

    public boolean removePage(PdfPage page) {
        checkClosingStatus();
        int pageNum = getPageNumber(page);
        if (pageNum >= 1) {
            removePage(pageNum);
            return true;
        }
        return false;
    }

    public void removePage(int pageNum) {
        checkClosingStatus();
        PdfPage removedPage = getPage(pageNum);
        if (removedPage != null && removedPage.isFlushed() && (isTagged() || hasAcroForm())) {
            throw new PdfException(KernelExceptionMessageConstant.FLUSHED_PAGE_CANNOT_BE_REMOVED);
        }
        if (removedPage != null) {
            this.catalog.removeOutlines(removedPage);
            removeUnusedWidgetsFromFields(removedPage);
            if (isTagged()) {
                getTagStructureContext().removePageTags(removedPage);
            }
            if (!removedPage.isFlushed()) {
                removedPage.getPdfObject().remove(PdfName.Parent);
                removedPage.getPdfObject().getIndirectReference().setFree();
            }
            dispatchEvent(new PdfDocumentEvent(PdfDocumentEvent.REMOVE_PAGE, removedPage));
        }
        this.catalog.getPageTree().removePage(pageNum);
    }

    public DIContainer getDiContainer() {
        return this.diContainer;
    }

    public PdfDocumentInfo getDocumentInfo() {
        checkClosingStatus();
        if (this.info == null) {
            PdfObject infoDict = this.trailer.get(PdfName.Info);
            this.info = new PdfDocumentInfo(infoDict instanceof PdfDictionary ? (PdfDictionary) infoDict : new PdfDictionary(), this);
            XmpMetaInfoConverter.appendMetadataToInfo(this.xmpMetadata, this.info);
        }
        return this.info;
    }

    public PdfString getOriginalDocumentId() {
        return this.originalDocumentId;
    }

    public PdfString getModifiedDocumentId() {
        return this.modifiedDocumentId;
    }

    public PageSize getDefaultPageSize() {
        return this.defaultPageSize;
    }

    public void setDefaultPageSize(PageSize pageSize) {
        this.defaultPageSize = pageSize;
    }

    @Override // com.itextpdf.kernel.events.IEventDispatcher
    public void addEventHandler(String type, IEventHandler handler) {
        this.eventDispatcher.addEventHandler(type, handler);
    }

    @Override // com.itextpdf.kernel.events.IEventDispatcher
    public void dispatchEvent(Event event) {
        this.eventDispatcher.dispatchEvent(event);
    }

    @Override // com.itextpdf.kernel.events.IEventDispatcher
    public void dispatchEvent(Event event, boolean delayed) {
        this.eventDispatcher.dispatchEvent(event, delayed);
    }

    @Override // com.itextpdf.kernel.events.IEventDispatcher
    public boolean hasEventHandler(String type) {
        return this.eventDispatcher.hasEventHandler(type);
    }

    @Override // com.itextpdf.kernel.events.IEventDispatcher
    public void removeEventHandler(String type, IEventHandler handler) {
        this.eventDispatcher.removeEventHandler(type, handler);
    }

    @Override // com.itextpdf.kernel.events.IEventDispatcher
    public void removeAllHandlers() {
        this.eventDispatcher.removeAllHandlers();
    }

    public PdfWriter getWriter() {
        checkClosingStatus();
        return this.writer;
    }

    public PdfReader getReader() {
        checkClosingStatus();
        return this.reader;
    }

    public boolean isAppendMode() {
        checkClosingStatus();
        return this.properties.appendMode;
    }

    public PdfIndirectReference createNextIndirectReference() {
        checkClosingStatus();
        return this.xref.createNextIndirectReference(this);
    }

    public PdfVersion getPdfVersion() {
        return this.pdfVersion;
    }

    public PdfCatalog getCatalog() {
        checkClosingStatus();
        return this.catalog;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        PdfObject object;
        PdfName[] pdfNameArr;
        if (this.closed) {
            return;
        }
        this.isClosing = true;
        try {
            try {
                if (this.writer != null) {
                    if (this.catalog.isFlushed()) {
                        throw new PdfException(KernelExceptionMessageConstant.CANNOT_CLOSE_DOCUMENT_WITH_ALREADY_FLUSHED_PDF_CATALOG);
                    }
                    EventManager manager = EventManager.getInstance();
                    manager.onEvent(new NumberOfPagesStatisticsEvent(this.catalog.getPageTree().getNumberOfPages(), ITextCoreProductData.getInstance()));
                    manager.onEvent(new FlushPdfDocumentEvent(this));
                    updateXmpMetadata();
                    if (this.pdfVersion.compareTo(PdfVersion.PDF_2_0) >= 0) {
                        for (PdfName deprecatedKey : PdfDocumentInfo.PDF20_DEPRECATED_KEYS) {
                            getDocumentInfo().getPdfObject().remove(deprecatedKey);
                        }
                    }
                    if (getXmpMetadata() != null) {
                        PdfStream xmp = this.catalog.getPdfObject().getAsStream(PdfName.Metadata);
                        if (isAppendMode() && xmp != null && !xmp.isFlushed() && xmp.getIndirectReference() != null) {
                            xmp.setData(this.xmpMetadata);
                            xmp.setModified();
                        } else {
                            xmp = (PdfStream) new PdfStream().makeIndirect(this);
                            xmp.getOutputStream().write(this.xmpMetadata);
                            this.catalog.getPdfObject().put(PdfName.Metadata, xmp);
                            this.catalog.setModified();
                        }
                        xmp.put(PdfName.Type, PdfName.Metadata);
                        xmp.put(PdfName.Subtype, PdfName.XML);
                        if (this.writer.crypto != null && !this.writer.crypto.isMetadataEncrypted()) {
                            PdfArray ar = new PdfArray();
                            ar.add(PdfName.Crypt);
                            xmp.put(PdfName.Filter, ar);
                        }
                    }
                    if (!this.properties.appendMode && this.catalog.isOCPropertiesMayHaveChanged()) {
                        this.catalog.getPdfObject().put(PdfName.OCProperties, this.catalog.getOCProperties(false).getPdfObject());
                    }
                    checkIsoConformance();
                    if (getNumberOfPages() == 0) {
                        addNewPage();
                    }
                    PdfObject crypto = null;
                    Set<PdfIndirectReference> forbiddenToFlush = new HashSet<>();
                    if (this.properties.appendMode) {
                        if (this.structTreeRoot != null) {
                            tryFlushTagStructure(true);
                        }
                        if (this.catalog.isOCPropertiesMayHaveChanged() && this.catalog.getOCProperties(false).getPdfObject().isModified()) {
                            this.catalog.getOCProperties(false).flush();
                        }
                        if (this.catalog.pageLabels != null) {
                            this.catalog.put(PdfName.PageLabels, this.catalog.pageLabels.buildTree());
                        }
                        for (Map.Entry<PdfName, PdfNameTree> entry : this.catalog.nameTrees.entrySet()) {
                            PdfNameTree tree = entry.getValue();
                            if (tree.isModified()) {
                                ensureTreeRootAddedToNames(tree.buildTree().makeIndirect(this), entry.getKey());
                            }
                        }
                        PdfObject pageRoot = this.catalog.getPageTree().generateTree();
                        flushInfoDictionary(this.properties.appendMode);
                        if (this.catalog.getPdfObject().isModified() || pageRoot.isModified()) {
                            this.catalog.put(PdfName.Pages, pageRoot);
                            this.catalog.getPdfObject().flush(false);
                        }
                        flushFonts();
                        if (this.writer.crypto != null) {
                            if (this.reader.decrypt.getPdfObject() != this.writer.crypto.getPdfObject()) {
                                throw new AssertionError("Conflict with source encryption");
                            }
                            crypto = this.reader.decrypt.getPdfObject();
                            if (crypto.getIndirectReference() != null) {
                                forbiddenToFlush.add(crypto.getIndirectReference());
                            }
                        }
                        this.writer.flushModifiedWaitingObjects(forbiddenToFlush);
                        for (int i = 0; i < this.xref.size(); i++) {
                            PdfIndirectReference indirectReference = this.xref.get(i);
                            if (indirectReference != null && !indirectReference.isFree() && indirectReference.checkState((short) 8) && !indirectReference.checkState((short) 1) && !forbiddenToFlush.contains(indirectReference)) {
                                indirectReference.setFree();
                            }
                        }
                    } else {
                        if (this.catalog.isOCPropertiesMayHaveChanged()) {
                            this.catalog.getOCProperties(false).flush();
                        }
                        if (this.catalog.pageLabels != null) {
                            this.catalog.put(PdfName.PageLabels, this.catalog.pageLabels.buildTree());
                        }
                        this.catalog.getPdfObject().put(PdfName.Pages, this.catalog.getPageTree().generateTree());
                        for (Map.Entry<PdfName, PdfNameTree> entry2 : this.catalog.nameTrees.entrySet()) {
                            PdfNameTree tree2 = entry2.getValue();
                            if (tree2.isModified()) {
                                ensureTreeRootAddedToNames(tree2.buildTree().makeIndirect(this), entry2.getKey());
                            }
                        }
                        for (int pageNum = 1; pageNum <= getNumberOfPages(); pageNum++) {
                            PdfPage page = getPage(pageNum);
                            if (page != null) {
                                page.flush();
                            }
                        }
                        if (this.structTreeRoot != null) {
                            tryFlushTagStructure(false);
                        }
                        flushInfoDictionary(this.properties.appendMode);
                        this.catalog.getPdfObject().flush(false);
                        flushFonts();
                        if (this.writer.crypto != null) {
                            crypto = this.writer.crypto.getPdfObject();
                            crypto.makeIndirect(this);
                            forbiddenToFlush.add(crypto.getIndirectReference());
                        }
                        this.writer.flushWaitingObjects(forbiddenToFlush);
                        for (int i2 = 0; i2 < this.xref.size(); i2++) {
                            PdfIndirectReference indirectReference2 = this.xref.get(i2);
                            if (indirectReference2 != null && !indirectReference2.isFree() && !indirectReference2.checkState((short) 1) && !forbiddenToFlush.contains(indirectReference2)) {
                                if (isFlushUnusedObjects() && !indirectReference2.checkState((short) 16) && (object = indirectReference2.getRefersTo(false)) != null) {
                                    object.flush();
                                } else {
                                    indirectReference2.setFree();
                                }
                            }
                        }
                    }
                    this.writer.crypto = null;
                    checkIsoConformance(crypto, IsoKey.CRYPTO);
                    if (!this.properties.appendMode && crypto != null) {
                        crypto.flush(false);
                    }
                    this.trailer.put(PdfName.Root, this.catalog.getPdfObject());
                    PdfObject fileId = PdfEncryption.createInfoId(ByteUtils.getIsoBytes(this.originalDocumentId.getValue()), ByteUtils.getIsoBytes(this.modifiedDocumentId.getValue()), this.properties.preserveEncryption);
                    this.xref.writeXrefTableAndTrailer(this, fileId, crypto);
                    this.writer.flush();
                    if (this.writer.getOutputStream() instanceof CountOutputStream) {
                        long amountOfBytes = ((CountOutputStream) this.writer.getOutputStream()).getAmountOfWrittenBytes();
                        manager.onEvent(new SizeOfPdfStatisticsEvent(amountOfBytes, ITextCoreProductData.getInstance()));
                    }
                }
                this.catalog.getPageTree().clearPageRefs();
                removeAllHandlers();
                this.closed = true;
            } catch (IOException e) {
                throw new PdfException(KernelExceptionMessageConstant.CANNOT_CLOSE_DOCUMENT, e, this);
            }
        } finally {
            if (this.writer != null && isCloseWriter()) {
                try {
                    this.writer.close();
                } catch (Exception e2) {
                    Logger logger = LoggerFactory.getLogger(PdfDocument.class);
                    logger.error(IoLogMessageConstant.PDF_WRITER_CLOSING_FAILED, (Throwable) e2);
                }
            }
            if (this.reader != null && isCloseReader()) {
                try {
                    this.reader.close();
                } catch (Exception e3) {
                    Logger logger2 = LoggerFactory.getLogger(PdfDocument.class);
                    logger2.error(IoLogMessageConstant.PDF_READER_CLOSING_FAILED, (Throwable) e3);
                }
            }
        }
    }

    public boolean isClosed() {
        return this.closed;
    }

    public boolean isTagged() {
        return this.structTreeRoot != null;
    }

    public PdfDocument setTagged() {
        checkClosingStatus();
        if (this.structTreeRoot == null) {
            this.structTreeRoot = new PdfStructTreeRoot(this);
            this.catalog.getPdfObject().put(PdfName.StructTreeRoot, this.structTreeRoot.getPdfObject());
            updateValueInMarkInfoDict(PdfName.Marked, PdfBoolean.TRUE);
            this.structParentIndex = 0;
        }
        return this;
    }

    public PdfStructTreeRoot getStructTreeRoot() {
        return this.structTreeRoot;
    }

    public int getNextStructParentIndex() {
        if (this.structParentIndex < 0) {
            return -1;
        }
        int i = this.structParentIndex;
        this.structParentIndex = i + 1;
        return i;
    }

    public TagStructureContext getTagStructureContext() {
        checkClosingStatus();
        if (this.tagStructureContext == null) {
            if (!isTagged()) {
                throw new PdfException(KernelExceptionMessageConstant.MUST_BE_A_TAGGED_DOCUMENT);
            }
            initTagStructureContext();
        }
        return this.tagStructureContext;
    }

    public List<PdfPage> copyPagesTo(int pageFrom, int pageTo, PdfDocument toDocument, int insertBeforePage) {
        return copyPagesTo(pageFrom, pageTo, toDocument, insertBeforePage, null);
    }

    public IConformanceLevel getConformanceLevel() {
        return null;
    }

    public List<PdfPage> copyPagesTo(int pageFrom, int pageTo, PdfDocument toDocument, int insertBeforePage, IPdfPageExtraCopier copier) {
        List<Integer> pages = new ArrayList<>();
        for (int i = pageFrom; i <= pageTo; i++) {
            pages.add(Integer.valueOf(i));
        }
        return copyPagesTo(pages, toDocument, insertBeforePage, copier);
    }

    public List<PdfPage> copyPagesTo(int pageFrom, int pageTo, PdfDocument toDocument) {
        return copyPagesTo(pageFrom, pageTo, toDocument, (IPdfPageExtraCopier) null);
    }

    public List<PdfPage> copyPagesTo(int pageFrom, int pageTo, PdfDocument toDocument, IPdfPageExtraCopier copier) {
        return copyPagesTo(pageFrom, pageTo, toDocument, toDocument.getNumberOfPages() + 1, copier);
    }

    public List<PdfPage> copyPagesTo(List<Integer> pagesToCopy, PdfDocument toDocument, int insertBeforePage) {
        return copyPagesTo(pagesToCopy, toDocument, insertBeforePage, (IPdfPageExtraCopier) null);
    }

    public List<PdfPage> copyPagesTo(List<Integer> pagesToCopy, PdfDocument toDocument, int insertBeforePage, IPdfPageExtraCopier copier) {
        List<Map<PdfPage, PdfPage>> rangesOfPagesWithIncreasingNumbers;
        boolean z;
        if (pagesToCopy.isEmpty()) {
            return Collections.emptyList();
        }
        this.pendingDestinationMutations.clear();
        checkClosingStatus();
        List<PdfPage> copiedPages = new ArrayList<>();
        Map<PdfPage, PdfPage> page2page = new LinkedHashMap<>();
        Set<PdfOutline> outlinesToCopy = new HashSet<>();
        List<Map<PdfPage, PdfPage>> rangesOfPagesWithIncreasingNumbers2 = new ArrayList<>();
        int lastCopiedPageNum = pagesToCopy.get(0).intValue();
        int pageInsertIndex = insertBeforePage;
        boolean z2 = true;
        int insertBeforePage2 = insertBeforePage;
        boolean insertInBetween = insertBeforePage2 < toDocument.getNumberOfPages() + 1;
        for (Integer pageNum : pagesToCopy) {
            PdfPage page = getPage(pageNum.intValue());
            PdfPage newPage = page.copyTo(toDocument, copier, z2, insertInBetween ? pageInsertIndex : -1);
            copiedPages.add(newPage);
            page2page.put(page, newPage);
            boolean z3 = z2;
            if (lastCopiedPageNum >= pageNum.intValue()) {
                rangesOfPagesWithIncreasingNumbers2.add(new HashMap<>());
            }
            int lastRangeInd = rangesOfPagesWithIncreasingNumbers2.size() - 1;
            List<PdfPage> copiedPages2 = copiedPages;
            rangesOfPagesWithIncreasingNumbers2.get(lastRangeInd).put(page, newPage);
            pageInsertIndex++;
            if (!toDocument.hasOutlines()) {
                rangesOfPagesWithIncreasingNumbers = rangesOfPagesWithIncreasingNumbers2;
                z = false;
            } else {
                rangesOfPagesWithIncreasingNumbers = rangesOfPagesWithIncreasingNumbers2;
                z = false;
                List<PdfOutline> pageOutlines = page.getOutlines(false);
                if (pageOutlines != null) {
                    outlinesToCopy.addAll(pageOutlines);
                }
            }
            lastCopiedPageNum = pageNum.intValue();
            rangesOfPagesWithIncreasingNumbers2 = rangesOfPagesWithIncreasingNumbers;
            z2 = z3;
            copiedPages = copiedPages2;
        }
        List<PdfPage> copiedPages3 = copiedPages;
        List<Map<PdfPage, PdfPage>> rangesOfPagesWithIncreasingNumbers3 = rangesOfPagesWithIncreasingNumbers2;
        boolean z4 = z2;
        resolveDestinations(toDocument, page2page);
        if (getCatalog() != null && getCatalog().getPdfObject().getAsDictionary(PdfName.OCProperties) != null) {
            OcgPropertiesCopier.copyOCGProperties(this, toDocument, page2page);
            toDocument.getCatalog().setOcgCopied(z4);
        }
        if (toDocument.isTagged()) {
            if (isTagged()) {
                try {
                    for (Map<PdfPage, PdfPage> increasingPagesRange : rangesOfPagesWithIncreasingNumbers3) {
                        try {
                            if (insertInBetween) {
                                getStructTreeRoot().copyTo(toDocument, insertBeforePage2, increasingPagesRange);
                            } else {
                                getStructTreeRoot().copyTo(toDocument, increasingPagesRange);
                            }
                            insertBeforePage2 += increasingPagesRange.size();
                        } catch (Exception e) {
                            ex = e;
                            throw new PdfException(KernelExceptionMessageConstant.TAG_STRUCTURE_COPYING_FAILED_IT_MIGHT_BE_CORRUPTED_IN_ONE_OF_THE_DOCUMENTS, (Throwable) ex);
                        }
                    }
                    toDocument.getTagStructureContext().normalizeDocumentRootTag();
                    if (copier instanceof IPdfPageFormCopier) {
                        ((IPdfPageFormCopier) copier).recreateAcroformToProcessCopiedFields(toDocument);
                    }
                } catch (Exception e2) {
                    ex = e2;
                }
            } else {
                Logger logger = LoggerFactory.getLogger(PdfDocument.class);
                logger.warn(IoLogMessageConstant.NOT_TAGGED_PAGES_IN_TAGGED_DOCUMENT);
            }
        }
        if (this.catalog.isOutlineMode()) {
            copyOutlines(outlinesToCopy, toDocument, page2page);
        }
        return copiedPages3;
    }

    public List<PdfPage> copyPagesTo(List<Integer> pagesToCopy, PdfDocument toDocument) {
        return copyPagesTo(pagesToCopy, toDocument, (IPdfPageExtraCopier) null);
    }

    public List<PdfPage> copyPagesTo(List<Integer> pagesToCopy, PdfDocument toDocument, IPdfPageExtraCopier copier) {
        return copyPagesTo(pagesToCopy, toDocument, toDocument.getNumberOfPages() + 1, copier);
    }

    public void flushCopiedObjects(PdfDocument sourceDoc) {
        if (getWriter() != null) {
            getWriter().flushCopiedObjects(sourceDoc.getDocumentId());
        }
    }

    public boolean isCloseReader() {
        return this.closeReader;
    }

    public void setCloseReader(boolean closeReader) {
        checkClosingStatus();
        this.closeReader = closeReader;
    }

    public boolean isCloseWriter() {
        return this.closeWriter;
    }

    public void setCloseWriter(boolean closeWriter) {
        checkClosingStatus();
        this.closeWriter = closeWriter;
    }

    public boolean isFlushUnusedObjects() {
        return this.flushUnusedObjects;
    }

    public void setFlushUnusedObjects(boolean flushUnusedObjects) {
        checkClosingStatus();
        this.flushUnusedObjects = flushUnusedObjects;
    }

    public PdfOutline getOutlines(boolean updateOutlines) {
        checkClosingStatus();
        return this.catalog.getOutlines(updateOutlines);
    }

    public void initializeOutlines() {
        checkClosingStatus();
        getOutlines(false);
    }

    public void addNamedDestination(String key, PdfObject value) {
        addNamedDestination(new PdfString(key), value);
    }

    public void addNamedDestination(PdfString key, PdfObject value) {
        checkClosingStatus();
        if (value.isArray() && ((PdfArray) value).get(0).isNumber()) {
            LoggerFactory.getLogger(PdfDocument.class).warn(IoLogMessageConstant.INVALID_DESTINATION_TYPE);
        }
        this.catalog.addNamedDestination(key, value);
    }

    public List<PdfIndirectReference> listIndirectReferences() {
        checkClosingStatus();
        List<PdfIndirectReference> indRefs = new ArrayList<>(this.xref.size());
        for (int i = 0; i < this.xref.size(); i++) {
            PdfIndirectReference indref = this.xref.get(i);
            if (indref != null) {
                indRefs.add(indref);
            }
        }
        return indRefs;
    }

    public PdfDictionary getTrailer() {
        checkClosingStatus();
        return this.trailer;
    }

    public void addOutputIntent(PdfOutputIntent outputIntent) {
        checkClosingStatus();
        if (outputIntent == null) {
            return;
        }
        PdfArray outputIntents = this.catalog.getPdfObject().getAsArray(PdfName.OutputIntents);
        if (outputIntents == null) {
            outputIntents = new PdfArray();
            this.catalog.put(PdfName.OutputIntents, outputIntents);
        }
        outputIntents.add(outputIntent.getPdfObject());
    }

    public void checkIsoConformance(Object obj, IsoKey key) {
        checkIsoConformance(obj, key, null, null);
    }

    public void checkIsoConformance(Object obj, IsoKey key, PdfResources resources, PdfStream contentStream) {
        checkIsoConformance(obj, key, resources, contentStream, null);
    }

    public void checkIsoConformance(Object obj, IsoKey key, PdfResources resources, PdfStream contentStream, Object extra) {
        ValidationContainer container;
        if (!getDiContainer().isRegistered(ValidationContainer.class) || (container = (ValidationContainer) getDiContainer().getInstance(ValidationContainer.class)) == null) {
            return;
        }
        container.validate(obj, key, resources, contentStream, extra);
    }

    public void checkShowTextIsoConformance(CanvasGraphicsState gState, PdfResources resources) {
    }

    public void addFileAttachment(String key, PdfFileSpec fs) {
        checkClosingStatus();
        this.catalog.addNameToNameTree(new PdfString(key), fs.getPdfObject(), PdfName.EmbeddedFiles);
    }

    public void addAssociatedFile(String description, PdfFileSpec fs) {
        if (((PdfDictionary) fs.getPdfObject()).get(PdfName.AFRelationship) == null) {
            Logger logger = LoggerFactory.getLogger(PdfDocument.class);
            logger.error(IoLogMessageConstant.ASSOCIATED_FILE_SPEC_SHALL_INCLUDE_AFRELATIONSHIP);
        }
        PdfArray afArray = this.catalog.getPdfObject().getAsArray(PdfName.AF);
        if (afArray == null) {
            afArray = (PdfArray) new PdfArray().makeIndirect(this);
            this.catalog.put(PdfName.AF, afArray);
        }
        afArray.add(fs.getPdfObject());
        addFileAttachment(description, fs);
    }

    public PdfArray getAssociatedFiles() {
        checkClosingStatus();
        return this.catalog.getPdfObject().getAsArray(PdfName.AF);
    }

    public PdfEncryptedPayloadDocument getEncryptedPayloadDocument() {
        PdfCollection collection;
        if ((getReader() == null || !getReader().isEncrypted()) && (collection = getCatalog().getCollection()) != null && collection.isViewHidden()) {
            PdfString documentName = collection.getInitialDocument();
            PdfNameTree embeddedFiles = getCatalog().getNameTree(PdfName.EmbeddedFiles);
            PdfObject fileSpecObject = embeddedFiles.getNames().get(documentName);
            if (fileSpecObject != null && fileSpecObject.isDictionary()) {
                try {
                    PdfFileSpec fileSpec = PdfEncryptedPayloadFileSpecFactory.wrap((PdfDictionary) fileSpecObject);
                    if (fileSpec != null) {
                        PdfDictionary embeddedDictionary = ((PdfDictionary) fileSpec.getPdfObject()).getAsDictionary(PdfName.EF);
                        PdfStream stream = embeddedDictionary.getAsStream(PdfName.UF);
                        if (stream == null) {
                            stream = embeddedDictionary.getAsStream(PdfName.F);
                        }
                        if (stream != null) {
                            String documentNameUnicode = documentName.toUnicodeString();
                            return new PdfEncryptedPayloadDocument(stream, fileSpec, documentNameUnicode);
                        }
                    }
                } catch (PdfException e) {
                    LoggerFactory.getLogger(getClass()).error(e.getMessage());
                }
            }
        }
        return null;
    }

    public void setEncryptedPayload(PdfFileSpec fs) {
        if (getWriter() == null) {
            throw new PdfException(KernelExceptionMessageConstant.CANNOT_SET_ENCRYPTED_PAYLOAD_TO_DOCUMENT_OPENED_IN_READING_MODE);
        }
        if (writerHasEncryption()) {
            throw new PdfException(KernelExceptionMessageConstant.CANNOT_SET_ENCRYPTED_PAYLOAD_TO_ENCRYPTED_DOCUMENT);
        }
        if (!PdfName.EncryptedPayload.equals(((PdfDictionary) fs.getPdfObject()).get(PdfName.AFRelationship))) {
            LoggerFactory.getLogger(getClass()).error(IoLogMessageConstant.ENCRYPTED_PAYLOAD_FILE_SPEC_SHALL_HAVE_AFRELATIONSHIP_FILED_EQUAL_TO_ENCRYPTED_PAYLOAD);
        }
        PdfEncryptedPayload encryptedPayload = PdfEncryptedPayload.extractFrom(fs);
        if (encryptedPayload == null) {
            throw new PdfException(KernelExceptionMessageConstant.ENCRYPTED_PAYLOAD_FILE_SPEC_DOES_NOT_HAVE_ENCRYPTED_PAYLOAD_DICTIONARY);
        }
        PdfCollection collection = getCatalog().getCollection();
        if (collection != null) {
            LoggerFactory.getLogger(getClass()).warn(IoLogMessageConstant.COLLECTION_DICTIONARY_ALREADY_EXISTS_IT_WILL_BE_MODIFIED);
        } else {
            collection = new PdfCollection();
            getCatalog().setCollection(collection);
        }
        collection.setView(2);
        String displayName = PdfEncryptedPayloadFileSpecFactory.generateFileDisplay(encryptedPayload);
        collection.setInitialDocument(displayName);
        addAssociatedFile(displayName, fs);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public String[] getPageLabels() {
        char c;
        if (this.catalog.getPageLabelsTree(false) == null) {
            return null;
        }
        Map<Integer, PdfObject> pageLabels = this.catalog.getPageLabelsTree(false).getNumbers();
        if (pageLabels.size() == 0) {
            return null;
        }
        String[] labelStrings = new String[getNumberOfPages()];
        int pageCount = 1;
        String prefix = "";
        String type = "D";
        for (int i = 0; i < getNumberOfPages(); i++) {
            if (pageLabels.containsKey(Integer.valueOf(i))) {
                PdfDictionary labelDictionary = (PdfDictionary) pageLabels.get(Integer.valueOf(i));
                PdfNumber pageRange = labelDictionary.getAsNumber(PdfName.St);
                if (pageRange != null) {
                    pageCount = pageRange.intValue();
                } else {
                    pageCount = 1;
                }
                PdfString p = labelDictionary.getAsString(PdfName.P);
                if (p != null) {
                    prefix = p.toUnicodeString();
                } else {
                    prefix = "";
                }
                PdfName t = labelDictionary.getAsName(PdfName.S);
                if (t != null) {
                    type = t.getValue();
                } else {
                    type = "e";
                }
            }
            switch (type.hashCode()) {
                case 65:
                    if (type.equals(ExifInterface.GPS_MEASUREMENT_IN_PROGRESS)) {
                        c = 2;
                        break;
                    }
                    c = 65535;
                    break;
                case Property.APPEARANCE_STREAM_LAYOUT /* 82 */:
                    if (type.equals("R")) {
                        c = 0;
                        break;
                    }
                    c = 65535;
                    break;
                case Property.IGNORE_HEADER /* 97 */:
                    if (type.equals("a")) {
                        c = 3;
                        break;
                    }
                    c = 65535;
                    break;
                case 101:
                    if (type.equals("e")) {
                        c = 4;
                        break;
                    }
                    c = 65535;
                    break;
                case Property.BORDER_COLLAPSE /* 114 */:
                    if (type.equals("r")) {
                        c = 1;
                        break;
                    }
                    c = 65535;
                    break;
                default:
                    c = 65535;
                    break;
            }
            switch (c) {
                case 0:
                    labelStrings[i] = prefix + RomanNumbering.toRomanUpperCase(pageCount);
                    break;
                case 1:
                    labelStrings[i] = prefix + RomanNumbering.toRomanLowerCase(pageCount);
                    break;
                case 2:
                    labelStrings[i] = prefix + EnglishAlphabetNumbering.toLatinAlphabetNumberUpperCase(pageCount);
                    break;
                case 3:
                    labelStrings[i] = prefix + EnglishAlphabetNumbering.toLatinAlphabetNumberLowerCase(pageCount);
                    break;
                case 4:
                    labelStrings[i] = prefix;
                    break;
                default:
                    labelStrings[i] = prefix + pageCount;
                    break;
            }
            pageCount++;
        }
        return labelStrings;
    }

    public boolean hasOutlines() {
        return this.catalog.hasOutlines();
    }

    public void setUserProperties(boolean userProperties) {
        PdfBoolean userPropsVal = userProperties ? PdfBoolean.TRUE : PdfBoolean.FALSE;
        updateValueInMarkInfoDict(PdfName.UserProperties, userPropsVal);
    }

    public PdfFont getFont(PdfDictionary dictionary) {
        PdfIndirectReference indirectReference = dictionary.getIndirectReference();
        if (indirectReference != null && this.documentFonts.containsKey(indirectReference)) {
            return this.documentFonts.get(indirectReference);
        }
        return addFont(PdfFontFactory.createFont(dictionary));
    }

    public PdfFont getDefaultFont() {
        if (this.defaultFont == null) {
            try {
                this.defaultFont = PdfFontFactory.createFont();
                if (this.writer != null) {
                    this.defaultFont.makeIndirect(this);
                }
            } catch (IOException e) {
                Logger logger = LoggerFactory.getLogger(PdfDocument.class);
                logger.error(IoLogMessageConstant.EXCEPTION_WHILE_CREATING_DEFAULT_FONT, (Throwable) e);
                this.defaultFont = null;
            }
        }
        return this.defaultFont;
    }

    public PdfFont addFont(PdfFont font) {
        font.makeIndirect(this);
        font.setForbidRelease();
        this.documentFonts.put(font.getPdfObject().getIndirectReference(), font);
        return font;
    }

    public boolean registerProduct(ProductData productData) {
        return this.fingerPrint.registerProduct(productData);
    }

    public FingerPrint getFingerPrint() {
        return this.fingerPrint;
    }

    public PdfFont findFont(String fontProgram, String encoding) {
        for (PdfFont font : this.documentFonts.values()) {
            if (!font.isFlushed() && font.isBuiltWith(fontProgram, encoding)) {
                return font;
            }
        }
        return null;
    }

    public long getDocumentId() {
        return this.documentId.getId();
    }

    public SequenceId getDocumentIdWrapper() {
        return this.documentId;
    }

    public SerializeOptions getSerializeOptions() {
        return this.serializeOptions;
    }

    public void setSerializeOptions(SerializeOptions serializeOptions) {
        this.serializeOptions = serializeOptions;
    }

    protected void initTagStructureContext() {
        this.tagStructureContext = new TagStructureContext(this);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void storeDestinationToReaddress(PdfDestination destination, Consumer<PdfDestination> onPageAvailable, Consumer<PdfDestination> onPageNotAvailable) {
        this.pendingDestinationMutations.add(new DestinationMutationInfo(destination, onPageAvailable, onPageNotAvailable));
    }

    protected void checkIsoConformance() {
        ValidationContainer container;
        if (!getDiContainer().isRegistered(ValidationContainer.class) || (container = (ValidationContainer) getDiContainer().getInstance(ValidationContainer.class)) == null) {
            return;
        }
        ValidationContext context = new ValidationContext().withPdfDocument(this).withFonts(getDocumentFonts());
        container.validate(context);
    }

    protected void markObjectAsMustBeFlushed(PdfObject pdfObject) {
        if (pdfObject.getIndirectReference() != null) {
            pdfObject.getIndirectReference().setState((short) 32);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void flushObject(PdfObject pdfObject, boolean canBeInObjStm) throws IOException {
        this.writer.flushObject(pdfObject, canBeInObjStm);
    }

    protected void open(PdfVersion newPdfVersion) {
        PdfNumber r;
        PdfName[] pdfNameArr;
        this.fingerPrint = new FingerPrint();
        this.encryptedEmbeddedStreamsHandler = new EncryptedEmbeddedStreamsHandler(this);
        try {
            ITextCoreProductEvent event = ITextCoreProductEvent.createProcessPdfEvent(getDocumentIdWrapper(), this.properties.metaInfo, this.writer == null ? EventConfirmationType.ON_DEMAND : EventConfirmationType.ON_CLOSE);
            EventManager.getInstance().onEvent(event);
            boolean embeddedStreamsSavedOnReading = false;
            if (this.reader != null) {
                if (this.reader.pdfDocument != null) {
                    throw new PdfException(KernelExceptionMessageConstant.PDF_READER_HAS_BEEN_ALREADY_UTILIZED);
                }
                this.reader.pdfDocument = this;
                this.memoryLimitsAwareHandler = this.reader.properties.memoryLimitsAwareHandler;
                if (this.memoryLimitsAwareHandler == null) {
                    this.memoryLimitsAwareHandler = new MemoryLimitsAwareHandler(this.reader.tokens.getSafeFile().length());
                }
                this.xref.setMemoryLimitsAwareHandler(this.memoryLimitsAwareHandler);
                this.reader.readPdf();
                if (this.reader.decrypt != null && this.reader.decrypt.isEmbeddedFilesOnly()) {
                    this.encryptedEmbeddedStreamsHandler.storeAllEmbeddedStreams();
                    embeddedStreamsSavedOnReading = true;
                }
                this.pdfVersion = this.reader.headerPdfVersion;
                this.trailer = new PdfDictionary(this.reader.trailer);
                readDocumentIds();
                PdfDictionary catalogDictionary = (PdfDictionary) this.trailer.get(PdfName.Root, true);
                if (catalogDictionary == null) {
                    throw new PdfException(KernelExceptionMessageConstant.CORRUPTED_ROOT_ENTRY_IN_TRAILER);
                }
                this.catalog = new PdfCatalog(catalogDictionary);
                updatePdfVersionFromCatalog();
                PdfStream xmpMetadataStream = this.catalog.getPdfObject().getAsStream(PdfName.Metadata);
                if (xmpMetadataStream != null) {
                    this.xmpMetadata = xmpMetadataStream.getBytes();
                    if (!getClass().equals(PdfDocument.class)) {
                        this.reader.getPdfAConformanceLevel();
                        getDocumentInfo();
                    }
                }
                PdfDictionary str = this.catalog.getPdfObject().getAsDictionary(PdfName.StructTreeRoot);
                if (str != null) {
                    tryInitTagStructure(str);
                }
                if (this.properties.appendMode && (this.reader.hasRebuiltXref() || this.reader.hasFixedXref())) {
                    throw new PdfException(KernelExceptionMessageConstant.APPEND_MODE_REQUIRES_A_DOCUMENT_WITHOUT_ERRORS_EVEN_IF_RECOVERY_IS_POSSIBLE);
                }
            }
            this.xref.initFreeReferencesList(this);
            if (this.writer != null) {
                if (this.reader != null && this.reader.hasXrefStm() && this.writer.properties.isFullCompression == null) {
                    this.writer.properties.isFullCompression = true;
                }
                if (this.reader != null && !this.reader.isOpenedWithFullPermission()) {
                    throw new BadPasswordException(BadPasswordException.PdfReaderNotOpenedWithOwnerPassword);
                }
                if (this.reader != null && this.properties.preserveEncryption) {
                    this.writer.crypto = this.reader.decrypt;
                }
                this.writer.document = this;
                if (this.reader == null) {
                    this.catalog = new PdfCatalog(this);
                    this.info = new PdfDocumentInfo(this).addCreationDate();
                }
                getDocumentInfo().addModDate();
                if (this.trailer == null) {
                    this.trailer = new PdfDictionary();
                }
                if (this.trailer.size() > 0) {
                    for (PdfName key : PDF_NAMES_TO_REMOVE_FROM_ORIGINAL_TRAILER) {
                        this.trailer.remove(key);
                    }
                }
                this.trailer.put(PdfName.Root, this.catalog.getPdfObject().getIndirectReference());
                if (this.reader != null && this.reader.trailer.containsKey(PdfName.ID)) {
                    this.trailer.put(PdfName.ID, this.reader.trailer.get(PdfName.ID));
                }
                if (this.writer.properties != null) {
                    PdfString readerModifiedId = this.modifiedDocumentId;
                    if (this.writer.properties.initialDocumentId != null && (this.reader == null || this.reader.decrypt == null || (!this.properties.appendMode && !this.properties.preserveEncryption))) {
                        this.originalDocumentId = this.writer.properties.initialDocumentId;
                    }
                    if (this.writer.properties.modifiedDocumentId != null) {
                        this.modifiedDocumentId = this.writer.properties.modifiedDocumentId;
                    }
                    if (this.originalDocumentId == null && this.modifiedDocumentId != null) {
                        this.originalDocumentId = this.modifiedDocumentId;
                    }
                    if (this.modifiedDocumentId == null) {
                        if (this.originalDocumentId == null) {
                            this.originalDocumentId = new PdfString(PdfEncryption.generateNewDocumentId());
                        }
                        this.modifiedDocumentId = this.originalDocumentId;
                    }
                    if (this.writer.properties.modifiedDocumentId == null && this.modifiedDocumentId.equals(readerModifiedId)) {
                        this.modifiedDocumentId = new PdfString(PdfEncryption.generateNewDocumentId());
                    }
                }
                PdfString readerModifiedId2 = this.originalDocumentId;
                if (readerModifiedId2 == null) {
                    throw new AssertionError();
                }
                if (this.modifiedDocumentId == null) {
                    throw new AssertionError();
                }
            }
            if (this.properties.appendMode) {
                if (this.reader == null) {
                    throw new AssertionError();
                }
                RandomAccessFileOrArray file = this.reader.tokens.getSafeFile();
                byte[] buffer = new byte[8192];
                while (true) {
                    int n = file.read(buffer);
                    if (n <= 0) {
                        break;
                    }
                    this.writer.write(buffer, 0, n);
                }
                file.close();
                this.writer.write(10);
                overrideFullCompressionInWriterProperties(this.writer.properties, this.reader.hasXrefStm());
                this.writer.crypto = this.reader.decrypt;
                if (newPdfVersion != null && this.pdfVersion.compareTo(PdfVersion.PDF_1_4) >= 0 && newPdfVersion.compareTo(this.reader.headerPdfVersion) > 0) {
                    this.catalog.put(PdfName.Version, newPdfVersion.toPdfName());
                    this.catalog.setModified();
                    this.pdfVersion = newPdfVersion;
                }
            } else if (this.writer != null) {
                if (newPdfVersion != null) {
                    this.pdfVersion = newPdfVersion;
                }
                this.writer.writeHeader();
                if (this.writer.crypto == null) {
                    this.writer.initCryptoIfSpecified(this.pdfVersion);
                }
                if (this.writer.crypto != null) {
                    if (!embeddedStreamsSavedOnReading && this.writer.crypto.isEmbeddedFilesOnly()) {
                        this.encryptedEmbeddedStreamsHandler.storeAllEmbeddedStreams();
                    }
                    if (this.writer.crypto.getCryptoMode() < 3) {
                        VersionConforming.validatePdfVersionForDeprecatedFeatureLogWarn(this, PdfVersion.PDF_2_0, VersionConforming.DEPRECATED_ENCRYPTION_ALGORITHMS);
                    } else if (this.writer.crypto.getCryptoMode() == 3 && (r = this.writer.crypto.getPdfObject().getAsNumber(PdfName.R)) != null && r.intValue() == 5) {
                        VersionConforming.validatePdfVersionForDeprecatedFeatureLogWarn(this, PdfVersion.PDF_2_0, VersionConforming.DEPRECATED_AES256_REVISION);
                    }
                }
            }
            if (EventConfirmationType.ON_DEMAND == event.getConfirmationType()) {
                EventManager.getInstance().onEvent(new ConfirmEvent(event));
            }
        } catch (IOException e) {
            throw new PdfException(KernelExceptionMessageConstant.CANNOT_OPEN_DOCUMENT, e, this);
        }
    }

    protected void addCustomMetadataExtensions(XMPMeta xmpMeta) {
    }

    protected void flushInfoDictionary(boolean appendMode) {
        PdfObject infoDictObj = getDocumentInfo().getPdfObject();
        if (!appendMode || infoDictObj.isModified()) {
            infoDictObj.flush(false);
        }
        this.trailer.put(PdfName.Info, infoDictObj);
    }

    protected void updateXmpMetadata() {
        try {
            if (this.xmpMetadata != null || this.writer.properties.addXmpMetadata || this.pdfVersion.compareTo(PdfVersion.PDF_2_0) >= 0) {
                setXmpMetadata(updateDefaultXmpMetadata());
            }
        } catch (XMPException e) {
            Logger logger = LoggerFactory.getLogger(PdfDocument.class);
            logger.error(IoLogMessageConstant.EXCEPTION_WHILE_UPDATING_XMPMETADATA, (Throwable) e);
        }
    }

    protected XMPMeta updateDefaultXmpMetadata() throws XMPException {
        XMPMeta xmpMeta = XMPMetaFactory.parseFromBuffer(getXmpMetadata(true));
        XmpMetaInfoConverter.appendDocumentInfoToMetadata(getDocumentInfo(), xmpMeta);
        if (isTagged() && this.writer.properties.addUAXmpMetadata && !isXmpMetaHasProperty(xmpMeta, XMPConst.NS_PDFUA_ID, "part")) {
            xmpMeta.setPropertyInteger(XMPConst.NS_PDFUA_ID, "part", 1, new PropertyOptions(1073741824));
        }
        return xmpMeta;
    }

    protected Collection<PdfFont> getDocumentFonts() {
        return this.documentFonts.values();
    }

    protected void flushFonts() {
        if (this.properties.appendMode) {
            for (PdfFont font : getDocumentFonts()) {
                if (font.getPdfObject().checkState((short) 64) || font.getPdfObject().getIndirectReference().checkState((short) 8)) {
                    font.flush();
                }
            }
            return;
        }
        for (PdfFont font2 : getDocumentFonts()) {
            font2.flush();
        }
    }

    protected void checkAndAddPage(int index, PdfPage page) {
        if (page.isFlushed()) {
            throw new PdfException(KernelExceptionMessageConstant.FLUSHED_PAGE_CANNOT_BE_ADDED_OR_INSERTED, page);
        }
        if (page.getDocument() != null && this != page.getDocument()) {
            throw new PdfException(KernelExceptionMessageConstant.PAGE_CANNOT_BE_ADDED_TO_DOCUMENT_BECAUSE_IT_BELONGS_TO_ANOTHER_DOCUMENT).setMessageParams(page.getDocument(), Integer.valueOf(page.getDocument().getPageNumber(page)), this);
        }
        this.catalog.getPageTree().addPage(index, page);
    }

    protected void checkAndAddPage(PdfPage page) {
        if (page.isFlushed()) {
            throw new PdfException(KernelExceptionMessageConstant.FLUSHED_PAGE_CANNOT_BE_ADDED_OR_INSERTED, page);
        }
        if (page.getDocument() != null && this != page.getDocument()) {
            throw new PdfException(KernelExceptionMessageConstant.PAGE_CANNOT_BE_ADDED_TO_DOCUMENT_BECAUSE_IT_BELONGS_TO_ANOTHER_DOCUMENT).setMessageParams(page.getDocument(), Integer.valueOf(page.getDocument().getPageNumber(page)), this);
        }
        this.catalog.getPageTree().addPage(page);
    }

    protected void checkClosingStatus() {
        if (this.closed) {
            throw new PdfException("Document was closed. It is impossible to execute action.");
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public IPdfPageFactory getPageFactory() {
        return pdfPageFactory;
    }

    protected void tryInitTagStructure(PdfDictionary str) {
        try {
            this.structTreeRoot = new PdfStructTreeRoot(str, this);
            this.structParentIndex = getStructTreeRoot().getParentTreeNextKey();
        } catch (Exception ex) {
            this.structTreeRoot = null;
            this.structParentIndex = -1;
            Logger logger = LoggerFactory.getLogger(PdfDocument.class);
            logger.error(IoLogMessageConstant.TAG_STRUCTURE_INIT_FAILED, (Throwable) ex);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public PdfXrefTable getXref() {
        return this.xref;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isDocumentFont(PdfIndirectReference indRef) {
        return indRef != null && this.documentFonts.containsKey(indRef);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean doesStreamBelongToEmbeddedFile(PdfStream stream) {
        return this.encryptedEmbeddedStreamsHandler.isStreamStoredAsEmbedded(stream);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean hasAcroForm() {
        return getCatalog().getPdfObject().containsKey(PdfName.AcroForm);
    }

    private void tryFlushTagStructure(boolean isAppendMode) {
        try {
            if (this.tagStructureContext != null) {
                this.tagStructureContext.prepareToDocumentClosing();
            }
            if (!isAppendMode || this.structTreeRoot.getPdfObject().isModified()) {
                this.structTreeRoot.flush();
            }
        } catch (Exception ex) {
            throw new PdfException(KernelExceptionMessageConstant.TAG_STRUCTURE_FLUSHING_FAILED_IT_MIGHT_BE_CORRUPTED, (Throwable) ex);
        }
    }

    private void updateValueInMarkInfoDict(PdfName key, PdfObject value) {
        PdfDictionary markInfo = this.catalog.getPdfObject().getAsDictionary(PdfName.MarkInfo);
        if (markInfo == null) {
            markInfo = new PdfDictionary();
            this.catalog.getPdfObject().put(PdfName.MarkInfo, markInfo);
        }
        markInfo.put(key, value);
    }

    private void removeUnusedWidgetsFromFields(PdfPage page) {
        if (page.isFlushed()) {
            return;
        }
        PdfDictionary acroForm = getCatalog().getPdfObject().getAsDictionary(PdfName.AcroForm);
        PdfArray fields = acroForm == null ? null : acroForm.getAsArray(PdfName.Fields);
        List<PdfAnnotation> annots = page.getAnnotations();
        for (PdfAnnotation annot : annots) {
            if (annot.getSubtype().equals(PdfName.Widget)) {
                ((PdfWidgetAnnotation) annot).releaseFormFieldFromWidgetAnnotation();
                if (fields != null) {
                    fields.remove(annot.getPdfObject());
                }
            }
        }
    }

    private void resolveDestinations(PdfDocument toDocument, Map<PdfPage, PdfPage> page2page) {
        for (int i = 0; i < this.pendingDestinationMutations.size(); i++) {
            DestinationMutationInfo mutation = this.pendingDestinationMutations.get(i);
            PdfDestination copiedDest = getCatalog().copyDestination(mutation.getOriginalDestination().getPdfObject(), page2page, toDocument);
            if (copiedDest == null) {
                mutation.handleDestinationUnavailable();
            } else {
                mutation.handleDestinationAvailable(copiedDest);
            }
        }
    }

    private void copyOutlines(Set<PdfOutline> outlines, PdfDocument toDocument, Map<PdfPage, PdfPage> page2page) {
        PdfOutline rootOutline;
        Set<PdfOutline> outlinesToCopy = new HashSet<>();
        outlinesToCopy.addAll(outlines);
        for (PdfOutline outline : outlines) {
            getAllOutlinesToCopy(outline, outlinesToCopy);
        }
        PdfOutline rootOutline2 = toDocument.getOutlines(false);
        if (rootOutline2 != null) {
            rootOutline = rootOutline2;
        } else {
            PdfOutline rootOutline3 = new PdfOutline(toDocument);
            rootOutline3.setTitle("Outlines");
            rootOutline = rootOutline3;
        }
        cloneOutlines(outlinesToCopy, rootOutline, getOutlines(false), page2page, toDocument);
    }

    private void getAllOutlinesToCopy(PdfOutline outline, Set<PdfOutline> outlinesToCopy) {
        PdfOutline parent = outline.getParent();
        if ("Outlines".equals(parent.getTitle()) || outlinesToCopy.contains(parent)) {
            return;
        }
        outlinesToCopy.add(parent);
        getAllOutlinesToCopy(parent, outlinesToCopy);
    }

    private void cloneOutlines(Set<PdfOutline> outlinesToCopy, PdfOutline newParent, PdfOutline oldParent, Map<PdfPage, PdfPage> page2page, PdfDocument toDocument) {
        Set<PdfOutline> outlinesToCopy2;
        Map<PdfPage, PdfPage> page2page2;
        PdfDocument toDocument2;
        if (oldParent == null) {
            return;
        }
        for (PdfOutline outline : oldParent.getAllChildren()) {
            if (!outlinesToCopy.contains(outline)) {
                outlinesToCopy2 = outlinesToCopy;
                page2page2 = page2page;
                toDocument2 = toDocument;
            } else {
                PdfDestination copiedDest = null;
                if (outline.getDestination() != null) {
                    PdfObject destObjToCopy = outline.getDestination().getPdfObject();
                    copiedDest = getCatalog().copyDestination(destObjToCopy, page2page, toDocument);
                }
                PdfOutline child = newParent.addOutline(outline.getTitle());
                if (copiedDest != null) {
                    child.addDestination(copiedDest);
                }
                Integer copiedStyle = outline.getStyle();
                if (copiedStyle != null) {
                    child.setStyle(copiedStyle.intValue());
                }
                Color copiedColor = outline.getColor();
                if (copiedColor != null) {
                    child.setColor(copiedColor);
                }
                child.setOpen(outline.isOpen());
                outlinesToCopy2 = outlinesToCopy;
                page2page2 = page2page;
                toDocument2 = toDocument;
                cloneOutlines(outlinesToCopy2, child, outline, page2page2, toDocument2);
            }
            outlinesToCopy = outlinesToCopy2;
            page2page = page2page2;
            toDocument = toDocument2;
        }
    }

    private void ensureTreeRootAddedToNames(PdfObject treeRoot, PdfName treeType) {
        PdfDictionary names = this.catalog.getPdfObject().getAsDictionary(PdfName.Names);
        if (names == null) {
            names = new PdfDictionary();
            this.catalog.put(PdfName.Names, names);
            names.makeIndirect(this);
        }
        names.put(treeType, treeRoot);
        names.setModified();
    }

    private boolean writerHasEncryption() {
        return this.writer.properties.isStandardEncryptionUsed() || this.writer.properties.isPublicKeyEncryptionUsed();
    }

    private void updatePdfVersionFromCatalog() {
        if (this.catalog.getPdfObject().containsKey(PdfName.Version)) {
            try {
                PdfVersion catalogVersion = PdfVersion.fromPdfName(this.catalog.getPdfObject().getAsName(PdfName.Version));
                if (catalogVersion.compareTo(this.pdfVersion) > 0) {
                    this.pdfVersion = catalogVersion;
                }
            } catch (IllegalArgumentException e) {
                processReadingError(IoLogMessageConstant.DOCUMENT_VERSION_IN_CATALOG_CORRUPTED);
            }
        }
    }

    private void readDocumentIds() {
        PdfArray id = this.reader.trailer.getAsArray(PdfName.ID);
        if (id != null) {
            if (id.size() == 2) {
                this.originalDocumentId = id.getAsString(0);
                this.modifiedDocumentId = id.getAsString(1);
            }
            if (this.originalDocumentId == null || this.modifiedDocumentId == null) {
                processReadingError(IoLogMessageConstant.DOCUMENT_IDS_ARE_CORRUPTED);
            }
        }
    }

    private void processReadingError(String errorMessage) {
        if (PdfReader.StrictnessLevel.CONSERVATIVE.isStricter(this.reader.getStrictnessLevel())) {
            Logger logger = LoggerFactory.getLogger(PdfDocument.class);
            logger.error(errorMessage);
            return;
        }
        throw new PdfException(errorMessage);
    }

    private static void overrideFullCompressionInWriterProperties(WriterProperties properties, boolean readerHasXrefStream) {
        if (Boolean.TRUE == properties.isFullCompression && !readerHasXrefStream) {
            Logger logger = LoggerFactory.getLogger(PdfDocument.class);
            logger.warn(KernelLogMessageConstant.FULL_COMPRESSION_APPEND_MODE_XREF_TABLE_INCONSISTENCY);
        } else if (Boolean.FALSE == properties.isFullCompression && readerHasXrefStream) {
            Logger logger2 = LoggerFactory.getLogger(PdfDocument.class);
            logger2.warn(KernelLogMessageConstant.FULL_COMPRESSION_APPEND_MODE_XREF_STREAM_INCONSISTENCY);
        }
        properties.isFullCompression = Boolean.valueOf(readerHasXrefStream);
    }

    private static boolean isXmpMetaHasProperty(XMPMeta xmpMeta, String schemaNS, String propName) throws XMPException {
        return xmpMeta.getProperty(schemaNS, propName) != null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class DestinationMutationInfo {
        private final Consumer<PdfDestination> onDestinationAvailable;
        private final Consumer<PdfDestination> onDestinationNotAvailable;
        private final PdfDestination originalDestination;

        public DestinationMutationInfo(PdfDestination originalDestination, Consumer<PdfDestination> onDestinationAvailable, Consumer<PdfDestination> onDestinationNotAvailable) {
            this.originalDestination = originalDestination;
            this.onDestinationAvailable = onDestinationAvailable;
            this.onDestinationNotAvailable = onDestinationNotAvailable;
        }

        public void handleDestinationAvailable(PdfDestination newDestination) {
            this.onDestinationAvailable.accept(newDestination);
        }

        public void handleDestinationUnavailable() {
            this.onDestinationNotAvailable.accept(this.originalDestination);
        }

        public PdfDestination getOriginalDestination() {
            return this.originalDestination;
        }
    }
}
