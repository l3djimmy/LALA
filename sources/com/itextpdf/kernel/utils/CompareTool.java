package com.itextpdf.kernel.utils;

import com.itextpdf.commons.actions.contexts.IMetaInfo;
import com.itextpdf.commons.utils.FileUtil;
import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.font.PdfEncodings;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.io.util.GhostscriptHelper;
import com.itextpdf.io.util.ImageMagickHelper;
import com.itextpdf.io.util.UrlUtil;
import com.itextpdf.io.util.XmlUtil;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.DocumentProperties;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfBoolean;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfDocumentInfo;
import com.itextpdf.kernel.pdf.PdfIndirectReference;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfNameTree;
import com.itextpdf.kernel.pdf.PdfNumber;
import com.itextpdf.kernel.pdf.PdfObject;
import com.itextpdf.kernel.pdf.PdfReader;
import com.itextpdf.kernel.pdf.PdfStream;
import com.itextpdf.kernel.pdf.PdfString;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.kernel.pdf.ReaderProperties;
import com.itextpdf.kernel.pdf.StampingProperties;
import com.itextpdf.kernel.pdf.WriterProperties;
import com.itextpdf.kernel.pdf.annot.PdfAnnotation;
import com.itextpdf.kernel.pdf.annot.PdfLinkAnnotation;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import com.itextpdf.kernel.utils.objectpathitems.ObjectPath;
import com.itextpdf.kernel.utils.objectpathitems.TrailerPath;
import com.itextpdf.kernel.xmp.PdfConst;
import com.itextpdf.kernel.xmp.XMPConst;
import com.itextpdf.kernel.xmp.XMPMeta;
import com.itextpdf.kernel.xmp.XMPMetaFactory;
import com.itextpdf.kernel.xmp.XMPUtils;
import com.itextpdf.kernel.xmp.options.ParseOptions;
import com.itextpdf.kernel.xmp.options.SerializeOptions;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileFilter;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.TransformerException;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.xml.sax.SAXException;
/* loaded from: classes12.dex */
public class CompareTool {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private static final String COPYRIGHT_REGEXP = "©\\d+-\\d+ (?:iText Group NV|Apryse Group NV)";
    private static final String COPYRIGHT_REPLACEMENT = "©<copyright years> Apryse Group NV";
    private static final String DIFFERENT_PAGES = "File file://<filename> differs on page <pagenumber>.";
    private static final String FILE_PROTOCOL = "file://";
    private static final String IGNORED_AREAS_PREFIX = "ignored_areas_";
    private static final String NEW_LINES = "\\r|\\n";
    private static final String UNEXPECTED_NUMBER_OF_PAGES = "Unexpected number of pages for <filename>.";
    private static final String VERSION_REGEXP = "(\\d+\\.)+\\d+(-SNAPSHOT)?";
    private static final String VERSION_REPLACEMENT = "<version>";
    private String cmpImage;
    private List<PdfIndirectReference> cmpPagesRef;
    private String cmpPdf;
    private String cmpPdfName;
    private ReaderProperties cmpProps;
    private String compareExec;
    private String gsExec;
    private IMetaInfo metaInfo;
    private String outImage;
    private List<PdfIndirectReference> outPagesRef;
    private String outPdf;
    private String outPdfName;
    private ReaderProperties outProps;
    private int compareByContentErrorsLimit = 1000;
    private boolean generateCompareByContentXmlReport = false;
    private boolean encryptionCompareEnabled = false;
    private boolean useCachedPagesForComparison = true;

    public CompareTool() {
    }

    CompareTool(String gsExec, String compareExec) {
        this.gsExec = gsExec;
        this.compareExec = compareExec;
    }

    public static PdfWriter createTestPdfWriter(String filename) throws FileNotFoundException {
        return createTestPdfWriter(filename, new WriterProperties());
    }

    public static PdfWriter createTestPdfWriter(String filename, WriterProperties properties) throws FileNotFoundException {
        return new MemoryFirstPdfWriter(filename, properties);
    }

    public static PdfReader createOutputReader(String filename) throws IOException {
        return createOutputReader(filename, new ReaderProperties());
    }

    public static PdfReader createOutputReader(String filename, ReaderProperties properties) throws IOException {
        MemoryFirstPdfWriter outWriter = MemoryFirstPdfWriter.get(filename);
        if (outWriter != null) {
            return new PdfReader(new ByteArrayInputStream(outWriter.getBAOutputStream().toByteArray()), properties);
        }
        return new PdfReader(filename, properties);
    }

    public static void cleanup(String path) {
        MemoryFirstPdfWriter.cleanup(path);
    }

    public CompareResult compareByCatalog(PdfDocument outDocument, PdfDocument cmpDocument) {
        CompareResult compareResult = new CompareResult(this.compareByContentErrorsLimit);
        ObjectPath catalogPath = new ObjectPath(cmpDocument.getCatalog().getPdfObject().getIndirectReference(), outDocument.getCatalog().getPdfObject().getIndirectReference());
        Set<PdfName> ignoredCatalogEntries = new LinkedHashSet<>(Arrays.asList(PdfName.Metadata));
        compareDictionariesExtended(outDocument.getCatalog().getPdfObject(), cmpDocument.getCatalog().getPdfObject(), catalogPath, compareResult, ignoredCatalogEntries);
        if (this.cmpPagesRef == null || this.outPagesRef == null) {
            return compareResult;
        }
        if (this.outPagesRef.size() != this.cmpPagesRef.size() && !compareResult.isMessageLimitReached()) {
            compareResult.addError(catalogPath, "Documents have different numbers of pages.");
        }
        for (int i = 0; i < Math.min(this.cmpPagesRef.size(), this.outPagesRef.size()) && !compareResult.isMessageLimitReached(); i++) {
            ObjectPath currentPath = new ObjectPath(this.cmpPagesRef.get(i), this.outPagesRef.get(i));
            PdfDictionary outPageDict = (PdfDictionary) this.outPagesRef.get(i).getRefersTo();
            PdfDictionary cmpPageDict = (PdfDictionary) this.cmpPagesRef.get(i).getRefersTo();
            compareDictionariesExtended(outPageDict, cmpPageDict, currentPath, compareResult);
        }
        return compareResult;
    }

    public CompareTool disableCachedPagesComparison() {
        this.useCachedPagesForComparison = false;
        return this;
    }

    public CompareTool setCompareByContentErrorsLimit(int compareByContentMaxErrorCount) {
        this.compareByContentErrorsLimit = compareByContentMaxErrorCount;
        return this;
    }

    public CompareTool setGenerateCompareByContentXmlReport(boolean generateCompareByContentXmlReport) {
        this.generateCompareByContentXmlReport = generateCompareByContentXmlReport;
        return this;
    }

    public void setEventCountingMetaInfo(IMetaInfo metaInfo) {
        this.metaInfo = metaInfo;
    }

    public CompareTool enableEncryptionCompare() {
        this.encryptionCompareEnabled = true;
        return this;
    }

    public ReaderProperties getOutReaderProperties() {
        if (this.outProps == null) {
            this.outProps = new ReaderProperties();
        }
        return this.outProps;
    }

    public ReaderProperties getCmpReaderProperties() {
        if (this.cmpProps == null) {
            this.cmpProps = new ReaderProperties();
        }
        return this.cmpProps;
    }

    public String compareVisually(String outPdf, String cmpPdf, String outPath, String differenceImagePrefix) throws InterruptedException, IOException {
        return compareVisually(outPdf, cmpPdf, outPath, differenceImagePrefix, null);
    }

    public String compareVisually(String outPdf, String cmpPdf, String outPath, String differenceImagePrefix, Map<Integer, List<Rectangle>> ignoredAreas) throws InterruptedException, IOException {
        init(outPdf, cmpPdf);
        System.out.println("Out pdf: " + UrlUtil.getNormalizedFileUriString(outPdf));
        System.out.println("Cmp pdf: " + UrlUtil.getNormalizedFileUriString(cmpPdf) + "\n");
        return compareVisually(outPath, differenceImagePrefix, ignoredAreas);
    }

    public String compareByContent(String outPdf, String cmpPdf, String outPath) throws InterruptedException, IOException {
        return compareByContent(outPdf, cmpPdf, outPath, null, null, null, null);
    }

    public String compareByContent(String outPdf, String cmpPdf, String outPath, String differenceImagePrefix) throws InterruptedException, IOException {
        return compareByContent(outPdf, cmpPdf, outPath, differenceImagePrefix, null, null, null);
    }

    public String compareByContent(String outPdf, String cmpPdf, String outPath, String differenceImagePrefix, byte[] outPass, byte[] cmpPass) throws InterruptedException, IOException {
        return compareByContent(outPdf, cmpPdf, outPath, differenceImagePrefix, null, outPass, cmpPass);
    }

    public String compareByContent(String outPdf, String cmpPdf, String outPath, String differenceImagePrefix, Map<Integer, List<Rectangle>> ignoredAreas) throws InterruptedException, IOException {
        return compareByContent(outPdf, cmpPdf, outPath, differenceImagePrefix, ignoredAreas, null, null);
    }

    public String compareByContent(String outPdf, String cmpPdf, String outPath, String differenceImagePrefix, Map<Integer, List<Rectangle>> ignoredAreas, byte[] outPass, byte[] cmpPass) throws InterruptedException, IOException {
        init(outPdf, cmpPdf);
        System.out.println("Out pdf: " + UrlUtil.getNormalizedFileUriString(outPdf));
        System.out.println("Cmp pdf: " + UrlUtil.getNormalizedFileUriString(cmpPdf) + "\n");
        setPassword(outPass, cmpPass);
        return compareByContent(outPath, differenceImagePrefix, ignoredAreas);
    }

    public boolean compareDictionaries(PdfDictionary outDict, PdfDictionary cmpDict) {
        return compareDictionariesExtended(outDict, cmpDict, null, null);
    }

    public CompareResult compareDictionariesStructure(PdfDictionary outDict, PdfDictionary cmpDict) {
        return compareDictionariesStructure(outDict, cmpDict, null);
    }

    public CompareResult compareDictionariesStructure(PdfDictionary outDict, PdfDictionary cmpDict, Set<PdfName> excludedKeys) {
        if (outDict.getIndirectReference() == null || cmpDict.getIndirectReference() == null) {
            throw new IllegalArgumentException("The 'outDict' and 'cmpDict' objects shall have indirect references.");
        }
        CompareResult compareResult = new CompareResult(this.compareByContentErrorsLimit);
        ObjectPath currentPath = new ObjectPath(cmpDict.getIndirectReference(), outDict.getIndirectReference());
        if (!compareDictionariesExtended(outDict, cmpDict, currentPath, compareResult, excludedKeys)) {
            if (compareResult.isOk()) {
                throw new AssertionError();
            }
            System.out.println(compareResult.getReport());
            return compareResult;
        } else if (!compareResult.isOk()) {
            throw new AssertionError();
        } else {
            return null;
        }
    }

    public CompareResult compareStreamsStructure(PdfStream outStream, PdfStream cmpStream) {
        CompareResult compareResult = new CompareResult(this.compareByContentErrorsLimit);
        ObjectPath currentPath = new ObjectPath(cmpStream.getIndirectReference(), outStream.getIndirectReference());
        if (!compareStreamsExtended(outStream, cmpStream, currentPath, compareResult)) {
            if (compareResult.isOk()) {
                throw new AssertionError();
            }
            System.out.println(compareResult.getReport());
            return compareResult;
        } else if (!compareResult.isOk()) {
            throw new AssertionError();
        } else {
            return null;
        }
    }

    public boolean compareStreams(PdfStream outStream, PdfStream cmpStream) {
        return compareStreamsExtended(outStream, cmpStream, null, null);
    }

    public boolean compareArrays(PdfArray outArray, PdfArray cmpArray) {
        return compareArraysExtended(outArray, cmpArray, null, null);
    }

    public boolean compareNames(PdfName outName, PdfName cmpName) {
        return cmpName.equals(outName);
    }

    public boolean compareNumbers(PdfNumber outNumber, PdfNumber cmpNumber) {
        return cmpNumber.getValue() == outNumber.getValue();
    }

    public boolean compareStrings(PdfString outString, PdfString cmpString) {
        return cmpString.getValue().equals(outString.getValue());
    }

    public boolean compareBooleans(PdfBoolean outBoolean, PdfBoolean cmpBoolean) {
        return cmpBoolean.getValue() == outBoolean.getValue();
    }

    public String compareXmp(String outPdf, String cmpPdf) {
        return compareXmp(outPdf, cmpPdf, false);
    }

    public String compareXmp(String outPdf, String cmpPdf, boolean ignoreDateAndProducerProperties) {
        init(outPdf, cmpPdf);
        try {
            PdfReader readerCmp = createOutputReader(this.cmpPdf);
            PdfDocument cmpDocument = new PdfDocument(readerCmp, new DocumentProperties().setEventCountingMetaInfo(this.metaInfo));
            PdfReader readerOut = createOutputReader(this.outPdf);
            PdfDocument outDocument = new PdfDocument(readerOut, new DocumentProperties().setEventCountingMetaInfo(this.metaInfo));
            try {
                byte[] cmpBytes = cmpDocument.getXmpMetadata();
                byte[] outBytes = outDocument.getXmpMetadata();
                if (ignoreDateAndProducerProperties) {
                    XMPMeta xmpMeta = XMPMetaFactory.parseFromBuffer(cmpBytes, new ParseOptions().setOmitNormalization(true));
                    XMPUtils.removeProperties(xmpMeta, XMPConst.NS_XMP, PdfConst.CreateDate, true, true);
                    XMPUtils.removeProperties(xmpMeta, XMPConst.NS_XMP, PdfConst.ModifyDate, true, true);
                    XMPUtils.removeProperties(xmpMeta, XMPConst.NS_XMP, PdfConst.MetadataDate, true, true);
                    XMPUtils.removeProperties(xmpMeta, XMPConst.NS_PDF, PdfConst.Producer, true, true);
                    cmpBytes = XMPMetaFactory.serializeToBuffer(xmpMeta, new SerializeOptions(8192));
                    XMPMeta xmpMeta2 = XMPMetaFactory.parseFromBuffer(outBytes, new ParseOptions().setOmitNormalization(true));
                    XMPUtils.removeProperties(xmpMeta2, XMPConst.NS_XMP, PdfConst.CreateDate, true, true);
                    XMPUtils.removeProperties(xmpMeta2, XMPConst.NS_XMP, PdfConst.ModifyDate, true, true);
                    XMPUtils.removeProperties(xmpMeta2, XMPConst.NS_XMP, PdfConst.MetadataDate, true, true);
                    XMPUtils.removeProperties(xmpMeta2, XMPConst.NS_PDF, PdfConst.Producer, true, true);
                    outBytes = XMPMetaFactory.serializeToBuffer(xmpMeta2, new SerializeOptions(8192));
                }
                if (!compareXmls(cmpBytes, outBytes)) {
                    outDocument.close();
                    if (readerOut != null) {
                        readerOut.close();
                    }
                    cmpDocument.close();
                    if (readerCmp != null) {
                        readerCmp.close();
                    }
                    return "The XMP packages different!";
                }
                outDocument.close();
                if (readerOut != null) {
                    readerOut.close();
                }
                cmpDocument.close();
                if (readerCmp != null) {
                    readerCmp.close();
                    return null;
                }
                return null;
            } catch (Throwable th) {
                try {
                    throw th;
                } catch (Throwable th2) {
                    try {
                        outDocument.close();
                    } catch (Throwable th3) {
                        th.addSuppressed(th3);
                    }
                    throw th2;
                }
            }
        } catch (Exception e) {
            return "XMP parsing failure!";
        }
    }

    public boolean compareXmls(byte[] xml1, byte[] xml2) throws ParserConfigurationException, SAXException, IOException {
        return XmlUtils.compareXmls(new ByteArrayInputStream(xml1), new ByteArrayInputStream(xml2));
    }

    public boolean compareXmls(String outXmlFile, String cmpXmlFile) throws ParserConfigurationException, SAXException, IOException {
        System.out.println("Out xml: " + UrlUtil.getNormalizedFileUriString(outXmlFile));
        System.out.println("Cmp xml: " + UrlUtil.getNormalizedFileUriString(cmpXmlFile) + "\n");
        InputStream outXmlStream = FileUtil.getInputStreamForFile(outXmlFile);
        try {
            InputStream cmpXmlStream = FileUtil.getInputStreamForFile(cmpXmlFile);
            boolean compareXmls = XmlUtils.compareXmls(outXmlStream, cmpXmlStream);
            if (cmpXmlStream != null) {
                cmpXmlStream.close();
            }
            if (outXmlStream != null) {
                outXmlStream.close();
            }
            return compareXmls;
        } catch (Throwable th) {
            try {
                throw th;
            } catch (Throwable th2) {
                if (outXmlStream != null) {
                    try {
                        outXmlStream.close();
                    } catch (Throwable th3) {
                        th.addSuppressed(th3);
                    }
                }
                throw th2;
            }
        }
    }

    public String compareDocumentInfo(String outPdf, String cmpPdf, byte[] outPass, byte[] cmpPass) throws IOException {
        System.out.print("[itext] INFO  Comparing document info.......");
        String message = null;
        setPassword(outPass, cmpPass);
        PdfReader readerCmp = createOutputReader(outPdf, getOutReaderProperties());
        try {
            PdfDocument outDocument = new PdfDocument(readerCmp, new DocumentProperties().setEventCountingMetaInfo(this.metaInfo));
            readerCmp = createOutputReader(cmpPdf, getCmpReaderProperties());
            try {
                PdfDocument cmpDocument = new PdfDocument(readerCmp, new DocumentProperties().setEventCountingMetaInfo(this.metaInfo));
                String[] cmpInfo = convertDocInfoToStrings(cmpDocument.getDocumentInfo());
                String[] outInfo = convertDocInfoToStrings(outDocument.getDocumentInfo());
                int i = 0;
                while (true) {
                    if (i >= cmpInfo.length) {
                        break;
                    } else if (!cmpInfo[i].equals(outInfo[i])) {
                        String message2 = MessageFormatUtil.format("Document info fail. Expected: \"{0}\", actual: \"{1}\"", cmpInfo[i], outInfo[i]);
                        message = message2;
                        break;
                    } else {
                        i++;
                    }
                }
                cmpDocument.close();
                if (readerCmp != null) {
                    readerCmp.close();
                }
                outDocument.close();
                if (readerCmp != null) {
                    readerCmp.close();
                }
                if (message == null) {
                    System.out.println("OK");
                } else {
                    writeOnDisk(outPdf);
                    writeOnDiskIfNotExists(cmpPdf);
                    System.out.println("Fail");
                }
                System.out.flush();
                return message;
            } catch (Throwable th) {
            }
        } finally {
            try {
                throw th;
            } finally {
            }
        }
    }

    public String compareDocumentInfo(String outPdf, String cmpPdf) throws IOException {
        return compareDocumentInfo(outPdf, cmpPdf, null, null);
    }

    public String compareLinkAnnotations(String outPdf, String cmpPdf) throws IOException {
        System.out.print("[itext] INFO  Comparing link annotations....");
        String message = null;
        PdfReader readerCmp = createOutputReader(outPdf);
        try {
            PdfDocument outDocument = new PdfDocument(readerCmp, new DocumentProperties().setEventCountingMetaInfo(this.metaInfo));
            readerCmp = createOutputReader(cmpPdf);
            try {
                PdfDocument cmpDocument = new PdfDocument(readerCmp, new DocumentProperties().setEventCountingMetaInfo(this.metaInfo));
                int i = 0;
                while (true) {
                    if (i >= outDocument.getNumberOfPages() || i >= cmpDocument.getNumberOfPages()) {
                        break;
                    }
                    List<PdfLinkAnnotation> outLinks = getLinkAnnotations(i + 1, outDocument);
                    List<PdfLinkAnnotation> cmpLinks = getLinkAnnotations(i + 1, cmpDocument);
                    if (cmpLinks.size() != outLinks.size()) {
                        String message2 = MessageFormatUtil.format("Different number of links on page {0}.", Integer.valueOf(i + 1));
                        message = message2;
                        break;
                    }
                    int j = 0;
                    while (true) {
                        if (j >= cmpLinks.size()) {
                            break;
                        } else if (!compareLinkAnnotations(cmpLinks.get(j), outLinks.get(j), cmpDocument, outDocument)) {
                            message = MessageFormatUtil.format("Different links on page {0}.\n{1}\n{2}", Integer.valueOf(i + 1), cmpLinks.get(j).toString(), outLinks.get(j).toString());
                            break;
                        } else {
                            j++;
                        }
                    }
                    i++;
                }
                cmpDocument.close();
                if (readerCmp != null) {
                    readerCmp.close();
                }
                outDocument.close();
                if (readerCmp != null) {
                    readerCmp.close();
                }
                if (message == null) {
                    System.out.println("OK");
                } else {
                    writeOnDisk(outPdf);
                    writeOnDiskIfNotExists(cmpPdf);
                    System.out.println("Fail");
                }
                System.out.flush();
                return message;
            } catch (Throwable th) {
            }
        } finally {
            try {
                throw th;
            } finally {
            }
        }
    }

    public String compareTagStructures(String outPdf, String cmpPdf) throws IOException, ParserConfigurationException, SAXException {
        System.out.print("[itext] INFO  Comparing tag structures......");
        String outXmlPath = outPdf.replace(".pdf", ".xml");
        String cmpXmlPath = outPdf.replace(".pdf", ".cmp.xml");
        PdfReader readerCmp = createOutputReader(outPdf);
        try {
            PdfDocument docOut = new PdfDocument(readerCmp, new DocumentProperties().setEventCountingMetaInfo(this.metaInfo));
            FileOutputStream xmlOut = new FileOutputStream(outXmlPath);
            try {
                new TaggedPdfReaderTool(docOut).setRootTag("root").convertToXml(xmlOut);
                xmlOut.close();
                docOut.close();
                if (readerCmp != null) {
                    readerCmp.close();
                }
                readerCmp = createOutputReader(cmpPdf);
                try {
                    PdfDocument docCmp = new PdfDocument(readerCmp, new DocumentProperties().setEventCountingMetaInfo(this.metaInfo));
                    FileOutputStream xmlCmp = new FileOutputStream(cmpXmlPath);
                    new TaggedPdfReaderTool(docCmp).setRootTag("root").convertToXml(xmlCmp);
                    xmlCmp.close();
                    docCmp.close();
                    if (readerCmp != null) {
                        readerCmp.close();
                    }
                    String message = compareXmls(outXmlPath, cmpXmlPath) ? null : "The tag structures are different.";
                    if (message == null) {
                        System.out.println("OK");
                    } else {
                        writeOnDisk(outPdf);
                        writeOnDiskIfNotExists(cmpPdf);
                        System.out.println("Fail");
                    }
                    System.out.flush();
                    return message;
                } finally {
                }
            } catch (Throwable th) {
                try {
                    throw th;
                } catch (Throwable th2) {
                    try {
                        xmlOut.close();
                    } catch (Throwable th3) {
                        th.addSuppressed(th3);
                    }
                    throw th2;
                }
            }
        } finally {
            try {
                throw th;
            } finally {
            }
        }
    }

    protected String[] convertDocInfoToStrings(PdfDocumentInfo info) {
        String[] convertedInfo = {"", "", "", "", ""};
        String infoValue = info.getTitle();
        if (infoValue != null) {
            convertedInfo[0] = infoValue;
        }
        String infoValue2 = info.getAuthor();
        if (infoValue2 != null) {
            convertedInfo[1] = infoValue2;
        }
        String infoValue3 = info.getSubject();
        if (infoValue3 != null) {
            convertedInfo[2] = infoValue3;
        }
        String infoValue4 = info.getKeywords();
        if (infoValue4 != null) {
            convertedInfo[3] = infoValue4;
        }
        String infoValue5 = info.getProducer();
        if (infoValue5 != null) {
            convertedInfo[4] = convertProducerLine(infoValue5);
        }
        return convertedInfo;
    }

    String convertProducerLine(String producer) {
        return producer.replaceAll(VERSION_REGEXP, VERSION_REPLACEMENT).replaceAll(COPYRIGHT_REGEXP, COPYRIGHT_REPLACEMENT);
    }

    private void init(String outPdf, String cmpPdf) {
        this.outPdf = outPdf;
        this.cmpPdf = cmpPdf;
        this.outPdfName = new File(outPdf).getName();
        this.cmpPdfName = new File(cmpPdf).getName();
        this.outImage = this.outPdfName;
        if (this.cmpPdfName.startsWith("cmp_")) {
            this.cmpImage = this.cmpPdfName;
        } else {
            this.cmpImage = "cmp_" + this.cmpPdfName;
        }
    }

    private void setPassword(byte[] outPass, byte[] cmpPass) {
        if (outPass != null) {
            getOutReaderProperties().setPassword(outPass);
        }
        if (cmpPass != null) {
            getCmpReaderProperties().setPassword(outPass);
        }
    }

    private String compareVisually(String outPath, String differenceImagePrefix, Map<Integer, List<Rectangle>> ignoredAreas) throws InterruptedException, IOException {
        return compareVisually(outPath, differenceImagePrefix, ignoredAreas, (List<Integer>) null);
    }

    private String compareVisually(String outPath, String differenceImagePrefix, Map<Integer, List<Rectangle>> ignoredAreas, List<Integer> equalPages) throws IOException, InterruptedException {
        if (!outPath.endsWith("/")) {
            outPath = outPath + "/";
        }
        if (differenceImagePrefix == null) {
            String fileBasedPrefix = "";
            if (this.outPdfName != null) {
                fileBasedPrefix = this.outPdfName + "_";
            }
            differenceImagePrefix = "diff_" + fileBasedPrefix;
        }
        prepareOutputDirs(outPath, differenceImagePrefix);
        System.out.println("Comparing visually..........");
        if (ignoredAreas != null && !ignoredAreas.isEmpty()) {
            createIgnoredAreasPdfs(outPath, ignoredAreas);
        }
        try {
            GhostscriptHelper ghostscriptHelper = new GhostscriptHelper(this.gsExec);
            ghostscriptHelper.runGhostScriptImageGeneration(this.outPdf, outPath, this.outImage);
            ghostscriptHelper.runGhostScriptImageGeneration(this.cmpPdf, outPath, this.cmpImage);
            return compareImagesOfPdfs(outPath, differenceImagePrefix, equalPages);
        } catch (IllegalArgumentException e) {
            throw new CompareToolExecutionException(e.getMessage());
        }
    }

    private String compareImagesOfPdfs(String outPath, String differenceImagePrefix, List<Integer> equalPages) throws IOException, InterruptedException {
        boolean bUnexpectedNumberOfPages;
        boolean compareExecIsOk;
        String str;
        boolean compareExecIsOk2;
        String str2 = outPath;
        List<Integer> list = equalPages;
        File[] imageFiles = FileUtil.listFilesInDirectoryByFilter(str2, new PngFileFilter(this.outPdfName));
        File[] cmpImageFiles = FileUtil.listFilesInDirectoryByFilter(str2, new CmpPngFileFilter(this.cmpPdfName));
        if (imageFiles.length == cmpImageFiles.length) {
            bUnexpectedNumberOfPages = false;
        } else {
            bUnexpectedNumberOfPages = true;
        }
        int cnt = Math.min(imageFiles.length, cmpImageFiles.length);
        if (cnt >= 1) {
            String str3 = null;
            Arrays.sort(imageFiles, new ImageNameComparator());
            Arrays.sort(cmpImageFiles, new ImageNameComparator());
            String imageMagickInitError = null;
            ImageMagickHelper imageMagickHelper = null;
            try {
                imageMagickHelper = new ImageMagickHelper(this.compareExec);
                compareExecIsOk = true;
            } catch (IllegalArgumentException e) {
                imageMagickInitError = e.getMessage();
                LoggerFactory.getLogger(CompareTool.class).warn(e.getMessage());
                compareExecIsOk = false;
            }
            List<Integer> diffPages = new ArrayList<>();
            String differentPagesFail = null;
            int i = 0;
            while (i < cnt) {
                if (list == null || !list.contains(Integer.valueOf(i))) {
                    str = str3;
                    compareExecIsOk2 = compareExecIsOk;
                    System.out.println("Comparing page " + Integer.toString(i + 1) + ": " + UrlUtil.getNormalizedFileUriString(imageFiles[i].getName()) + " ...");
                    System.out.println("Comparing page " + Integer.toString(i + 1) + ": " + UrlUtil.getNormalizedFileUriString(imageFiles[i].getName()) + " ...");
                    FileInputStream is1 = new FileInputStream(imageFiles[i].getAbsolutePath());
                    FileInputStream is2 = new FileInputStream(cmpImageFiles[i].getAbsolutePath());
                    boolean cmpResult = compareStreams(is1, is2);
                    is1.close();
                    is2.close();
                    if (cmpResult) {
                        System.out.println(" done.");
                    } else {
                        differentPagesFail = "Page is different!";
                        diffPages.add(Integer.valueOf(i + 1));
                        if (compareExecIsOk2) {
                            String diffName = str2 + differenceImagePrefix + Integer.toString(i + 1) + ".png";
                            if (!imageMagickHelper.runImageMagickImageCompare(imageFiles[i].getAbsolutePath(), cmpImageFiles[i].getAbsolutePath(), diffName)) {
                                File diffFile = new File(diffName);
                                differentPagesFail = "Page is different!\nPlease, examine file://" + UrlUtil.toNormalizedURI(diffFile).getPath() + " for more details.";
                            }
                        }
                        System.out.println(differentPagesFail);
                    }
                } else {
                    compareExecIsOk2 = compareExecIsOk;
                    str = str3;
                }
                i++;
                str2 = outPath;
                list = equalPages;
                str3 = str;
                compareExecIsOk = compareExecIsOk2;
            }
            boolean compareExecIsOk3 = compareExecIsOk;
            String str4 = str3;
            if (differentPagesFail != null) {
                String errorMessage = DIFFERENT_PAGES.replace("<filename>", UrlUtil.toNormalizedURI(this.outPdf).getPath()).replace("<pagenumber>", listDiffPagesAsString(diffPages));
                if (!compareExecIsOk3) {
                    return errorMessage + "\n" + imageMagickInitError;
                }
                return errorMessage;
            } else if (bUnexpectedNumberOfPages) {
                return UNEXPECTED_NUMBER_OF_PAGES.replace("<filename>", this.outPdf);
            } else {
                return str4;
            }
        }
        throw new CompareToolExecutionException("No files for comparing. The result or sample pdf file is not processed by GhostScript.");
    }

    private String listDiffPagesAsString(List<Integer> diffPages) {
        StringBuilder sb = new StringBuilder("[");
        for (int i = 0; i < diffPages.size(); i++) {
            sb.append(diffPages.get(i));
            if (i < diffPages.size() - 1) {
                sb.append(", ");
            }
        }
        sb.append("]");
        return sb.toString();
    }

    private void createIgnoredAreasPdfs(String outPath, Map<Integer, List<Rectangle>> ignoredAreas) throws IOException {
        Iterator<Map.Entry<Integer, List<Rectangle>>> it;
        StampingProperties properties = new StampingProperties();
        properties.setEventCountingMetaInfo(this.metaInfo);
        PdfWriter cmpWriter = new PdfWriter(outPath + IGNORED_AREAS_PREFIX + this.outPdfName);
        try {
            PdfReader readerOut = createOutputReader(this.outPdf);
            PdfDocument pdfOutDoc = new PdfDocument(readerOut, cmpWriter, properties);
            cmpWriter = new PdfWriter(outPath + IGNORED_AREAS_PREFIX + this.cmpPdfName);
            try {
                PdfReader readerCmp = createOutputReader(this.cmpPdf);
                PdfDocument pdfCmpDoc = new PdfDocument(readerCmp, cmpWriter, properties);
                try {
                    Iterator<Map.Entry<Integer, List<Rectangle>>> it2 = ignoredAreas.entrySet().iterator();
                    while (it2.hasNext()) {
                        Map.Entry<Integer, List<Rectangle>> entry = it2.next();
                        int pageNumber = entry.getKey().intValue();
                        List<Rectangle> rectangles = entry.getValue();
                        if (rectangles == null || rectangles.isEmpty()) {
                            it = it2;
                        } else {
                            PdfCanvas outCanvas = new PdfCanvas(pdfOutDoc.getPage(pageNumber));
                            it = it2;
                            PdfCanvas cmpCanvas = new PdfCanvas(pdfCmpDoc.getPage(pageNumber));
                            outCanvas.saveState();
                            cmpCanvas.saveState();
                            for (Iterator<Rectangle> it3 = rectangles.iterator(); it3.hasNext(); it3 = it3) {
                                Rectangle rect = it3.next();
                                outCanvas.rectangle(rect).fill();
                                cmpCanvas.rectangle(rect).fill();
                            }
                            outCanvas.restoreState();
                            cmpCanvas.restoreState();
                        }
                        it2 = it;
                    }
                    pdfCmpDoc.close();
                    if (readerCmp != null) {
                        readerCmp.close();
                    }
                    cmpWriter.close();
                    pdfOutDoc.close();
                    if (readerOut != null) {
                        readerOut.close();
                    }
                    cmpWriter.close();
                    init(outPath + IGNORED_AREAS_PREFIX + this.outPdfName, outPath + IGNORED_AREAS_PREFIX + this.cmpPdfName);
                } finally {
                }
            } finally {
            }
        } finally {
            try {
                throw th;
            } finally {
            }
        }
    }

    private void prepareOutputDirs(String outPath, String differenceImagePrefix) {
        if (!FileUtil.directoryExists(outPath)) {
            FileUtil.createDirectories(outPath);
            return;
        }
        File[] imageFiles = FileUtil.listFilesInDirectoryByFilter(outPath, new PngFileFilter(this.cmpPdfName));
        for (File file : imageFiles) {
            file.delete();
        }
        File[] cmpImageFiles = FileUtil.listFilesInDirectoryByFilter(outPath, new CmpPngFileFilter(this.cmpPdfName));
        for (File file2 : cmpImageFiles) {
            file2.delete();
        }
        File[] diffFiles = FileUtil.listFilesInDirectoryByFilter(outPath, new DiffPngFileFilter(differenceImagePrefix));
        for (File file3 : diffFiles) {
            file3.delete();
        }
    }

    private void printOutCmpDirectories() {
        System.out.println("Out file folder: file://" + UrlUtil.toNormalizedURI(new File(this.outPdf).getParentFile()).getPath());
        System.out.println("Cmp file folder: file://" + UrlUtil.toNormalizedURI(new File(this.cmpPdf).getParentFile()).getPath());
    }

    private String compareByContent(String outPath, String differenceImagePrefix, Map<Integer, List<Rectangle>> ignoredAreas) throws InterruptedException, IOException {
        String str;
        printOutCmpDirectories();
        System.out.print("Comparing by content..........");
        PdfReader readerCmp = createOutputReader(this.outPdf, getOutReaderProperties());
        try {
            PdfDocument outDocument = new PdfDocument(readerCmp, new DocumentProperties().setEventCountingMetaInfo(this.metaInfo));
            readerCmp = createOutputReader(this.cmpPdf, getCmpReaderProperties());
            try {
                PdfDocument cmpDocument = new PdfDocument(readerCmp, new DocumentProperties().setEventCountingMetaInfo(this.metaInfo));
                try {
                    List<PdfDictionary> outPages = new ArrayList<>();
                    this.outPagesRef = new ArrayList();
                    loadPagesFromReader(outDocument, outPages, this.outPagesRef);
                    List<PdfDictionary> cmpPages = new ArrayList<>();
                    this.cmpPagesRef = new ArrayList();
                    loadPagesFromReader(cmpDocument, cmpPages, this.cmpPagesRef);
                    if (outPages.size() != cmpPages.size()) {
                        writeOnDisk(this.outPdf);
                        writeOnDiskIfNotExists(this.cmpPdf);
                        String compareVisuallyAndCombineReports = compareVisuallyAndCombineReports("Documents have different numbers of pages.", outPath, differenceImagePrefix, ignoredAreas, null);
                        cmpDocument.close();
                        if (readerCmp != null) {
                            readerCmp.close();
                        }
                        outDocument.close();
                        if (readerCmp != null) {
                            readerCmp.close();
                        }
                        return compareVisuallyAndCombineReports;
                    }
                    CompareResult compareResult = new CompareResult(this.compareByContentErrorsLimit);
                    List<Integer> equalPages = new ArrayList<>(cmpPages.size());
                    for (int i = 0; i < cmpPages.size(); i++) {
                        ObjectPath currentPath = new ObjectPath(this.cmpPagesRef.get(i), this.outPagesRef.get(i));
                        if (compareDictionariesExtended(outPages.get(i), cmpPages.get(i), currentPath, compareResult)) {
                            equalPages.add(Integer.valueOf(i));
                        }
                    }
                    ObjectPath catalogPath = new ObjectPath(cmpDocument.getCatalog().getPdfObject().getIndirectReference(), outDocument.getCatalog().getPdfObject().getIndirectReference());
                    Set<PdfName> ignoredCatalogEntries = new LinkedHashSet<>(Arrays.asList(PdfName.Pages, PdfName.Metadata));
                    compareDictionariesExtended(outDocument.getCatalog().getPdfObject(), cmpDocument.getCatalog().getPdfObject(), catalogPath, compareResult, ignoredCatalogEntries);
                    if (this.encryptionCompareEnabled) {
                        compareDocumentsEncryption(outDocument, cmpDocument, compareResult);
                    }
                    if (this.generateCompareByContentXmlReport) {
                        try {
                            String outPdfName = new File(this.outPdf).getName();
                            str = outPath;
                            FileOutputStream xml = new FileOutputStream(str + "/" + outPdfName.substring(0, outPdfName.length() - 3) + "report.xml");
                            try {
                                compareResult.writeReportToXml(xml);
                                xml.close();
                            } catch (Exception e) {
                                throw new RuntimeException(e.getMessage(), e);
                            }
                        } catch (Throwable th) {
                            th = th;
                            throw th;
                        }
                    } else {
                        str = outPath;
                    }
                    if (equalPages.size() == cmpPages.size() && compareResult.isOk()) {
                        System.out.println("OK");
                        System.out.flush();
                        cmpDocument.close();
                        if (readerCmp != null) {
                            readerCmp.close();
                        }
                        outDocument.close();
                        if (readerCmp != null) {
                            readerCmp.close();
                            return null;
                        }
                        return null;
                    }
                    writeOnDisk(this.outPdf);
                    writeOnDiskIfNotExists(this.cmpPdf);
                    String compareVisuallyAndCombineReports2 = compareVisuallyAndCombineReports(compareResult.getReport(), str, differenceImagePrefix, ignoredAreas, equalPages);
                    cmpDocument.close();
                    if (readerCmp != null) {
                        readerCmp.close();
                    }
                    outDocument.close();
                    if (readerCmp != null) {
                        readerCmp.close();
                    }
                    return compareVisuallyAndCombineReports2;
                } catch (Throwable th2) {
                    th = th2;
                }
            } finally {
            }
        } finally {
        }
    }

    private static void writeOnDisk(String filename) throws IOException {
        MemoryFirstPdfWriter outWriter = MemoryFirstPdfWriter.get(filename);
        if (outWriter != null) {
            outWriter.dump();
        }
    }

    private static void writeOnDiskIfNotExists(String filename) throws IOException {
        if (!new File(filename).exists()) {
            writeOnDisk(filename);
        }
    }

    private String compareVisuallyAndCombineReports(String compareByFailContentReason, String outPath, String differenceImagePrefix, Map<Integer, List<Rectangle>> ignoredAreas, List<Integer> equalPages) throws IOException, InterruptedException {
        System.out.println("Fail");
        System.out.flush();
        String compareByContentReport = "Compare by content report:\n" + compareByFailContentReason;
        System.out.println(compareByContentReport);
        System.out.flush();
        String message = compareVisually(outPath, differenceImagePrefix, ignoredAreas, equalPages);
        if (message == null || message.length() == 0) {
            return "Compare by content fails. No visual differences";
        }
        return message;
    }

    private void loadPagesFromReader(PdfDocument doc, List<PdfDictionary> pages, List<PdfIndirectReference> pagesRef) {
        int numOfPages = doc.getNumberOfPages();
        for (int i = 0; i < numOfPages; i++) {
            pages.add(doc.getPage(i + 1).getPdfObject());
            pagesRef.add(pages.get(i).getIndirectReference());
        }
    }

    private void compareDocumentsEncryption(PdfDocument outDocument, PdfDocument cmpDocument, CompareResult compareResult) {
        CompareResult compareResult2 = compareResult;
        PdfDictionary outEncrypt = outDocument.getTrailer().getAsDictionary(PdfName.Encrypt);
        PdfDictionary cmpEncrypt = cmpDocument.getTrailer().getAsDictionary(PdfName.Encrypt);
        if (outEncrypt == null && cmpEncrypt == null) {
            return;
        }
        TrailerPath trailerPath = new TrailerPath(cmpDocument, outDocument);
        if (outEncrypt == null) {
            compareResult2.addError(trailerPath, "Expected encrypted document.");
        } else if (cmpEncrypt == null) {
            compareResult2.addError(trailerPath, "Expected not encrypted document.");
        } else {
            Set<PdfName> ignoredEncryptEntries = new LinkedHashSet<>(Arrays.asList(PdfName.O, PdfName.U, PdfName.OE, PdfName.UE, PdfName.Perms, PdfName.CF, PdfName.Recipients));
            ObjectPath objectPath = new ObjectPath(outEncrypt.getIndirectReference(), cmpEncrypt.getIndirectReference());
            compareDictionariesExtended(outEncrypt, cmpEncrypt, objectPath, compareResult2, ignoredEncryptEntries);
            PdfDictionary outCfDict = outEncrypt.getAsDictionary(PdfName.CF);
            PdfDictionary cmpCfDict = cmpEncrypt.getAsDictionary(PdfName.CF);
            if (cmpCfDict != null || outCfDict != null) {
                if ((cmpCfDict != null && outCfDict == null) || cmpCfDict == null) {
                    compareResult2.addError(objectPath, "One of the dictionaries is null, the other is not.");
                    return;
                }
                Set<PdfName> mergedKeys = new TreeSet<>(outCfDict.keySet());
                mergedKeys.addAll(cmpCfDict.keySet());
                for (PdfName key : mergedKeys) {
                    objectPath.pushDictItemToPath(key);
                    LinkedHashSet<PdfName> excludedKeys = new LinkedHashSet<>(Arrays.asList(PdfName.Recipients));
                    compareDictionariesExtended(outCfDict.getAsDictionary(key), cmpCfDict.getAsDictionary(key), objectPath, compareResult2, excludedKeys);
                    objectPath.pop();
                    compareResult2 = compareResult;
                    mergedKeys = mergedKeys;
                }
            }
        }
    }

    private boolean compareStreams(InputStream is1, InputStream is2) throws IOException {
        int len1;
        byte[] buffer1 = new byte[65536];
        byte[] buffer2 = new byte[65536];
        do {
            len1 = is1.read(buffer1);
            int len2 = is2.read(buffer2);
            if (len1 != len2 || !Arrays.equals(buffer1, buffer2)) {
                return false;
            }
        } while (len1 != -1);
        return true;
    }

    private boolean compareDictionariesExtended(PdfDictionary outDict, PdfDictionary cmpDict, ObjectPath currentPath, CompareResult compareResult) {
        return compareDictionariesExtended(outDict, cmpDict, currentPath, compareResult, null);
    }

    private boolean compareDictionariesExtended(PdfDictionary outDict, PdfDictionary cmpDict, ObjectPath currentPath, CompareResult compareResult, Set<PdfName> excludedKeys) {
        PdfObject cmpObj;
        PdfDictionary pdfDictionary = outDict;
        PdfDictionary pdfDictionary2 = cmpDict;
        Set<PdfName> set = excludedKeys;
        boolean z = false;
        if ((pdfDictionary2 != null && pdfDictionary == null) || (pdfDictionary != null && pdfDictionary2 == null)) {
            compareResult.addError(currentPath, "One of the dictionaries is null, the other is not.");
            return false;
        }
        boolean dictsAreSame = true;
        Set<PdfName> mergedKeys = new TreeSet<>(pdfDictionary2.keySet());
        mergedKeys.addAll(pdfDictionary.keySet());
        for (PdfName key : mergedKeys) {
            if (!dictsAreSame && (currentPath == null || compareResult == null || compareResult.isMessageLimitReached())) {
                return z;
            }
            if ((set == null || !set.contains(key)) && !key.equals(PdfName.Parent) && !key.equals(PdfName.P) && !key.equals(PdfName.ModDate) && (!pdfDictionary.isStream() || !pdfDictionary2.isStream() || (!key.equals(PdfName.Filter) && !key.equals(PdfName.Length)))) {
                if ((key.equals(PdfName.BaseFont) || key.equals(PdfName.FontName)) && (cmpObj = pdfDictionary2.get(key)) != null && cmpObj.isName() && cmpObj.toString().indexOf(43) > 0) {
                    PdfObject outObj = pdfDictionary.get(key);
                    if (!outObj.isName() || outObj.toString().indexOf(43) == -1) {
                        if (compareResult != null && currentPath != null) {
                            compareResult.addError(currentPath, MessageFormatUtil.format("PdfDictionary {0} entry: Expected: {1}. Found: {2}", key.toString(), cmpObj.toString(), outObj.toString()));
                        }
                        dictsAreSame = false;
                        set = excludedKeys;
                        z = false;
                    } else {
                        String cmpName = cmpObj.toString().substring(cmpObj.toString().indexOf(43));
                        String outName = outObj.toString().substring(outObj.toString().indexOf(43));
                        if (!cmpName.equals(outName)) {
                            if (compareResult != null && currentPath != null) {
                                String pdfName = key.toString();
                                String obj = cmpObj.toString();
                                String outName2 = outObj.toString();
                                compareResult.addError(currentPath, MessageFormatUtil.format("PdfDictionary {0} entry: Expected: {1}. Found: {2}", pdfName, obj, outName2));
                            }
                            dictsAreSame = false;
                        }
                        set = excludedKeys;
                        z = false;
                    }
                } else {
                    if (!key.equals(PdfName.ParentTree) && !key.equals(PdfName.PageLabels)) {
                        if (currentPath != null) {
                            currentPath.pushDictItemToPath(key);
                        }
                        dictsAreSame = compareObjects(pdfDictionary.get(key, false), pdfDictionary2.get(key, false), currentPath, compareResult) && dictsAreSame;
                        if (currentPath != null) {
                            currentPath.pop();
                        }
                        z = false;
                        set = excludedKeys;
                    }
                    if (currentPath != null) {
                        currentPath.pushDictItemToPath(key);
                    }
                    PdfDictionary outNumTree = pdfDictionary.getAsDictionary(key);
                    PdfDictionary cmpNumTree = pdfDictionary2.getAsDictionary(key);
                    LinkedList<PdfObject> outItems = new LinkedList<>();
                    LinkedList<PdfObject> cmpItems = new LinkedList<>();
                    PdfNumber outLeftover = flattenNumTree(outNumTree, null, outItems);
                    PdfNumber cmpLeftover = flattenNumTree(cmpNumTree, null, cmpItems);
                    if (outLeftover != null) {
                        LoggerFactory.getLogger(CompareTool.class).warn(IoLogMessageConstant.NUM_TREE_SHALL_NOT_END_WITH_KEY);
                        if (cmpLeftover == null) {
                            if (compareResult != null && currentPath != null) {
                                compareResult.addError(currentPath, "Number tree unexpectedly ends with a key");
                            }
                            dictsAreSame = false;
                        }
                    }
                    if (cmpLeftover != null) {
                        LoggerFactory.getLogger(CompareTool.class).warn(IoLogMessageConstant.NUM_TREE_SHALL_NOT_END_WITH_KEY);
                        if (outLeftover == null) {
                            if (compareResult != null && currentPath != null) {
                                compareResult.addError(currentPath, "Number tree was expected to end with a key (although it is invalid according to the specification), but ended with a value");
                            }
                            dictsAreSame = false;
                        }
                    }
                    if (outLeftover != null && cmpLeftover != null && !compareNumbers(outLeftover, cmpLeftover)) {
                        if (compareResult != null && currentPath != null) {
                            compareResult.addError(currentPath, "Number tree was expected to end with a different key (although it is invalid according to the specification)");
                        }
                        dictsAreSame = false;
                    }
                    PdfArray outArray = new PdfArray(outItems, outItems.size());
                    PdfArray cmpArray = new PdfArray(cmpItems, cmpItems.size());
                    if (!compareArraysExtended(outArray, cmpArray, currentPath, compareResult)) {
                        if (compareResult != null && currentPath != null) {
                            compareResult.addError(currentPath, "Number trees were flattened, compared and found to be different.");
                        }
                        dictsAreSame = false;
                    }
                    if (currentPath != null) {
                        currentPath.pop();
                    }
                }
            }
            pdfDictionary = outDict;
            pdfDictionary2 = cmpDict;
            set = excludedKeys;
            z = false;
        }
        return dictsAreSame;
    }

    private PdfNumber flattenNumTree(PdfDictionary dictionary, PdfNumber leftOver, LinkedList<PdfObject> items) {
        PdfNumber number;
        PdfArray nums = dictionary.getAsArray(PdfName.Nums);
        if (nums != null) {
            int k = 0;
            while (k < nums.size()) {
                if (leftOver == null) {
                    number = nums.getAsNumber(k);
                    k++;
                } else {
                    number = leftOver;
                    leftOver = null;
                }
                if (k < nums.size()) {
                    items.addLast(number);
                    items.addLast(nums.get(k, false));
                    k++;
                } else {
                    return number;
                }
            }
            return null;
        }
        PdfArray nums2 = dictionary.getAsArray(PdfName.Kids);
        if (nums2 != null) {
            for (int k2 = 0; k2 < nums2.size(); k2++) {
                PdfDictionary kid = nums2.getAsDictionary(k2);
                leftOver = flattenNumTree(kid, leftOver, items);
            }
            return null;
        }
        return null;
    }

    protected boolean compareObjects(PdfObject outObj, PdfObject cmpObj, ObjectPath currentPath, CompareResult compareResult) {
        PdfObject outDirectObj = null;
        PdfObject cmpDirectObj = null;
        if (outObj != null) {
            outDirectObj = outObj.isIndirectReference() ? ((PdfIndirectReference) outObj).getRefersTo(false) : outObj;
        }
        if (cmpObj != null) {
            cmpDirectObj = cmpObj.isIndirectReference() ? ((PdfIndirectReference) cmpObj).getRefersTo(false) : cmpObj;
        }
        if (cmpDirectObj == null && outDirectObj == null) {
            return true;
        }
        if (outDirectObj == null) {
            compareResult.addError(currentPath, "Expected object was not found.");
            return false;
        } else if (cmpDirectObj == null) {
            compareResult.addError(currentPath, "Found object which was not expected to be found.");
            return false;
        } else if (cmpDirectObj.getType() != outDirectObj.getType()) {
            compareResult.addError(currentPath, MessageFormatUtil.format("Types do not match. Expected: {0}. Found: {1}.", cmpDirectObj.getClass().getSimpleName(), outDirectObj.getClass().getSimpleName()));
            return false;
        } else if (cmpObj.isIndirectReference() && !outObj.isIndirectReference()) {
            compareResult.addError(currentPath, "Expected indirect object.");
            return false;
        } else if (!cmpObj.isIndirectReference() && outObj.isIndirectReference()) {
            compareResult.addError(currentPath, "Expected direct object.");
            return false;
        } else {
            if (currentPath != null && cmpObj.isIndirectReference() && outObj.isIndirectReference()) {
                if (currentPath.isComparing((PdfIndirectReference) cmpObj, (PdfIndirectReference) outObj)) {
                    return true;
                }
                currentPath = currentPath.resetDirectPath((PdfIndirectReference) cmpObj, (PdfIndirectReference) outObj);
            }
            if (cmpDirectObj.isDictionary() && PdfName.Page.equals(((PdfDictionary) cmpDirectObj).getAsName(PdfName.Type)) && this.useCachedPagesForComparison) {
                if (!outDirectObj.isDictionary() || !PdfName.Page.equals(((PdfDictionary) outDirectObj).getAsName(PdfName.Type))) {
                    if (compareResult != null && currentPath != null) {
                        compareResult.addError(currentPath, "Expected a page. Found not a page.");
                    }
                    return false;
                }
                PdfIndirectReference cmpRefKey = cmpObj.isIndirectReference() ? (PdfIndirectReference) cmpObj : cmpObj.getIndirectReference();
                PdfIndirectReference outRefKey = outObj.isIndirectReference() ? (PdfIndirectReference) outObj : outObj.getIndirectReference();
                if (this.cmpPagesRef == null) {
                    this.cmpPagesRef = new ArrayList();
                    for (int i = 1; i <= cmpRefKey.getDocument().getNumberOfPages(); i++) {
                        this.cmpPagesRef.add(cmpRefKey.getDocument().getPage(i).getPdfObject().getIndirectReference());
                    }
                }
                if (this.outPagesRef == null) {
                    this.outPagesRef = new ArrayList();
                    for (int i2 = 1; i2 <= outRefKey.getDocument().getNumberOfPages(); i2++) {
                        this.outPagesRef.add(outRefKey.getDocument().getPage(i2).getPdfObject().getIndirectReference());
                    }
                }
                if (this.cmpPagesRef.contains(cmpRefKey) || this.outPagesRef.contains(outRefKey)) {
                    if (this.cmpPagesRef.contains(cmpRefKey) && this.cmpPagesRef.indexOf(cmpRefKey) == this.outPagesRef.indexOf(outRefKey)) {
                        return true;
                    }
                    if (compareResult != null && currentPath != null) {
                        compareResult.addError(currentPath, MessageFormatUtil.format("The dictionaries refer to different pages. Expected page number: {0}. Found: {1}", Integer.valueOf(this.cmpPagesRef.indexOf(cmpRefKey) + 1), Integer.valueOf(this.outPagesRef.indexOf(outRefKey) + 1)));
                    }
                    return false;
                }
            }
            if (cmpDirectObj.isDictionary()) {
                return compareDictionariesExtended((PdfDictionary) outDirectObj, (PdfDictionary) cmpDirectObj, currentPath, compareResult);
            }
            if (cmpDirectObj.isStream()) {
                return compareStreamsExtended((PdfStream) outDirectObj, (PdfStream) cmpDirectObj, currentPath, compareResult);
            }
            if (cmpDirectObj.isArray()) {
                return compareArraysExtended((PdfArray) outDirectObj, (PdfArray) cmpDirectObj, currentPath, compareResult);
            }
            if (cmpDirectObj.isName()) {
                return compareNamesExtended((PdfName) outDirectObj, (PdfName) cmpDirectObj, currentPath, compareResult);
            }
            if (cmpDirectObj.isNumber()) {
                return compareNumbersExtended((PdfNumber) outDirectObj, (PdfNumber) cmpDirectObj, currentPath, compareResult);
            }
            if (cmpDirectObj.isString()) {
                return compareStringsExtended((PdfString) outDirectObj, (PdfString) cmpDirectObj, currentPath, compareResult);
            }
            if (cmpDirectObj.isBoolean()) {
                return compareBooleansExtended((PdfBoolean) outDirectObj, (PdfBoolean) cmpDirectObj, currentPath, compareResult);
            }
            if (outDirectObj.isNull() && cmpDirectObj.isNull()) {
                return true;
            }
            throw new UnsupportedOperationException();
        }
    }

    private boolean compareStreamsExtended(PdfStream outStream, PdfStream cmpStream, ObjectPath currentPath, CompareResult compareResult) {
        boolean toDecode = PdfName.FlateDecode.equals(outStream.get(PdfName.Filter));
        byte[] outStreamBytes = outStream.getBytes(toDecode);
        byte[] cmpStreamBytes = cmpStream.getBytes(toDecode);
        if (Arrays.equals(outStreamBytes, cmpStreamBytes)) {
            return compareDictionariesExtended(outStream, cmpStream, currentPath, compareResult);
        }
        StringBuilder errorMessage = new StringBuilder();
        if (cmpStreamBytes.length != outStreamBytes.length) {
            errorMessage.append(MessageFormatUtil.format("PdfStream. Lengths are different. Expected: {0}. Found: {1}\n", Integer.valueOf(cmpStreamBytes.length), Integer.valueOf(outStreamBytes.length)));
        } else {
            errorMessage.append("PdfStream. Bytes are different.\n");
        }
        int firstDifferenceOffset = findBytesDifference(outStreamBytes, cmpStreamBytes, errorMessage);
        if (compareResult != null && currentPath != null) {
            currentPath.pushOffsetToPath(firstDifferenceOffset);
            compareResult.addError(currentPath, errorMessage.toString());
            currentPath.pop();
            return false;
        }
        return false;
    }

    private int findBytesDifference(byte[] outStreamBytes, byte[] cmpStreamBytes, StringBuilder errorMessage) {
        String bytesDifference;
        int numberOfDifferentBytes = 0;
        int firstDifferenceOffset = 0;
        int minLength = Math.min(cmpStreamBytes.length, outStreamBytes.length);
        for (int i = 0; i < minLength; i++) {
            if (cmpStreamBytes[i] != outStreamBytes[i] && (numberOfDifferentBytes = numberOfDifferentBytes + 1) == 1) {
                firstDifferenceOffset = i;
            }
        }
        if (numberOfDifferentBytes > 0) {
            int lCmp = Math.max(0, firstDifferenceOffset - 10);
            int rCmp = Math.min(cmpStreamBytes.length, firstDifferenceOffset + 10);
            int lOut = Math.max(0, firstDifferenceOffset - 10);
            int rOut = Math.min(outStreamBytes.length, firstDifferenceOffset + 10);
            String cmpByte = new String(new byte[]{cmpStreamBytes[firstDifferenceOffset]}, StandardCharsets.ISO_8859_1);
            String cmpByteNeighbours = new String(cmpStreamBytes, lCmp, rCmp - lCmp, StandardCharsets.ISO_8859_1).replaceAll(NEW_LINES, " ");
            String outByte = new String(new byte[]{outStreamBytes[firstDifferenceOffset]}, StandardCharsets.ISO_8859_1);
            String outBytesNeighbours = new String(outStreamBytes, lOut, rOut - lOut, StandardCharsets.ISO_8859_1).replaceAll(NEW_LINES, " ");
            bytesDifference = MessageFormatUtil.format("First bytes difference is encountered at index {0}. Expected: {1} ({2}). Found: {3} ({4}). Total number of different bytes: {5}", Integer.valueOf(firstDifferenceOffset).toString(), cmpByte, cmpByteNeighbours, outByte, outBytesNeighbours, Integer.valueOf(numberOfDifferentBytes));
        } else {
            firstDifferenceOffset = minLength;
            bytesDifference = MessageFormatUtil.format("Bytes of the shorter array are the same as the first {0} bytes of the longer one.", Integer.valueOf(minLength));
        }
        errorMessage.append(bytesDifference);
        return firstDifferenceOffset;
    }

    private boolean compareArraysExtended(PdfArray outArray, PdfArray cmpArray, ObjectPath currentPath, CompareResult compareResult) {
        if (outArray == null) {
            if (compareResult != null && currentPath != null) {
                compareResult.addError(currentPath, "Found null. Expected PdfArray.");
            }
            return false;
        } else if (outArray.size() != cmpArray.size()) {
            if (compareResult != null && currentPath != null) {
                compareResult.addError(currentPath, MessageFormatUtil.format("PdfArrays. Lengths are different. Expected: {0}. Found: {1}.", Integer.valueOf(cmpArray.size()), Integer.valueOf(outArray.size())));
            }
            return false;
        } else {
            boolean arraysAreEqual = true;
            for (int i = 0; i < cmpArray.size(); i++) {
                if (currentPath != null) {
                    currentPath.pushArrayItemToPath(i);
                }
                arraysAreEqual = compareObjects(outArray.get(i, false), cmpArray.get(i, false), currentPath, compareResult) && arraysAreEqual;
                if (currentPath != null) {
                    currentPath.pop();
                }
                if (!arraysAreEqual && (currentPath == null || compareResult == null || compareResult.isMessageLimitReached())) {
                    return false;
                }
            }
            return arraysAreEqual;
        }
    }

    private boolean compareNamesExtended(PdfName outName, PdfName cmpName, ObjectPath currentPath, CompareResult compareResult) {
        if (cmpName.equals(outName)) {
            return true;
        }
        if (compareResult != null && currentPath != null) {
            compareResult.addError(currentPath, MessageFormatUtil.format("PdfName. Expected: {0}. Found: {1}", cmpName.toString(), outName.toString()));
            return false;
        }
        return false;
    }

    private boolean compareNumbersExtended(PdfNumber outNumber, PdfNumber cmpNumber, ObjectPath currentPath, CompareResult compareResult) {
        if (cmpNumber.getValue() == outNumber.getValue()) {
            return true;
        }
        if (compareResult != null && currentPath != null) {
            compareResult.addError(currentPath, MessageFormatUtil.format("PdfNumber. Expected: {0}. Found: {1}", cmpNumber, outNumber));
            return false;
        }
        return false;
    }

    private boolean compareStringsExtended(PdfString outString, PdfString cmpString, ObjectPath currentPath, CompareResult compareResult) {
        if (Arrays.equals(convertPdfStringToBytes(cmpString), convertPdfStringToBytes(outString))) {
            return true;
        }
        String cmpStr = cmpString.toUnicodeString();
        String outStr = outString.toUnicodeString();
        StringBuilder errorMessage = new StringBuilder();
        if (cmpStr.length() != outStr.length()) {
            errorMessage.append(MessageFormatUtil.format("PdfString. Lengths are different. Expected: {0}. Found: {1}\n", Integer.valueOf(cmpStr.length()), Integer.valueOf(outStr.length())));
        } else {
            errorMessage.append("PdfString. Characters are different.\n");
        }
        int firstDifferenceOffset = findStringDifference(outStr, cmpStr, errorMessage);
        if (compareResult != null && currentPath != null) {
            currentPath.pushOffsetToPath(firstDifferenceOffset);
            compareResult.addError(currentPath, errorMessage.toString());
            currentPath.pop();
            return false;
        }
        return false;
    }

    private int findStringDifference(String outString, String cmpString, StringBuilder errorMessage) {
        String stringDifference;
        int numberOfDifferentChars = 0;
        int firstDifferenceOffset = 0;
        int minLength = Math.min(cmpString.length(), outString.length());
        for (int i = 0; i < minLength; i++) {
            if (cmpString.charAt(i) != outString.charAt(i) && (numberOfDifferentChars = numberOfDifferentChars + 1) == 1) {
                firstDifferenceOffset = i;
            }
        }
        if (numberOfDifferentChars > 0) {
            int lCmp = Math.max(0, firstDifferenceOffset - 15);
            int rCmp = Math.min(cmpString.length(), firstDifferenceOffset + 15);
            int lOut = Math.max(0, firstDifferenceOffset - 15);
            int rOut = Math.min(outString.length(), firstDifferenceOffset + 15);
            String cmpByte = String.valueOf(cmpString.charAt(firstDifferenceOffset));
            String cmpByteNeighbours = cmpString.substring(lCmp, rCmp).replaceAll(NEW_LINES, " ");
            String outByte = String.valueOf(outString.charAt(firstDifferenceOffset));
            String outBytesNeighbours = outString.substring(lOut, rOut).replaceAll(NEW_LINES, " ");
            stringDifference = MessageFormatUtil.format("First characters difference is encountered at index {0}.\nExpected: {1} ({2}).\nFound: {3} ({4}).\nTotal number of different characters: {5}", Integer.valueOf(firstDifferenceOffset).toString(), cmpByte, cmpByteNeighbours, outByte, outBytesNeighbours, Integer.valueOf(numberOfDifferentChars));
        } else {
            firstDifferenceOffset = minLength;
            stringDifference = MessageFormatUtil.format("All characters of the shorter string are the same as the first {0} characters of the longer one.", Integer.valueOf(minLength));
        }
        errorMessage.append(stringDifference);
        return firstDifferenceOffset;
    }

    private byte[] convertPdfStringToBytes(PdfString pdfString) {
        String value = pdfString.getValue();
        String encoding = pdfString.getEncoding();
        if (encoding != null && PdfEncodings.UNICODE_BIG.equals(encoding) && PdfEncodings.isPdfDocEncoding(value)) {
            byte[] bytes = PdfEncodings.convertToBytes(value, PdfEncodings.PDF_DOC_ENCODING);
            return bytes;
        }
        byte[] bytes2 = PdfEncodings.convertToBytes(value, encoding);
        return bytes2;
    }

    private boolean compareBooleansExtended(PdfBoolean outBoolean, PdfBoolean cmpBoolean, ObjectPath currentPath, CompareResult compareResult) {
        if (cmpBoolean.getValue() == outBoolean.getValue()) {
            return true;
        }
        if (compareResult != null && currentPath != null) {
            compareResult.addError(currentPath, MessageFormatUtil.format("PdfBoolean. Expected: {0}. Found: {1}.", Boolean.valueOf(cmpBoolean.getValue()), Boolean.valueOf(outBoolean.getValue())));
            return false;
        }
        return false;
    }

    private List<PdfLinkAnnotation> getLinkAnnotations(int pageNum, PdfDocument document) {
        List<PdfLinkAnnotation> linkAnnotations = new ArrayList<>();
        List<PdfAnnotation> annotations = document.getPage(pageNum).getAnnotations();
        for (PdfAnnotation annotation : annotations) {
            if (PdfName.Link.equals(annotation.getSubtype())) {
                linkAnnotations.add((PdfLinkAnnotation) annotation);
            }
        }
        return linkAnnotations;
    }

    private boolean compareLinkAnnotations(PdfLinkAnnotation cmpLink, PdfLinkAnnotation outLink, PdfDocument cmpDocument, PdfDocument outDocument) {
        PdfObject cmpDestObject = cmpLink.getDestinationObject();
        PdfObject outDestObject = outLink.getDestinationObject();
        if (cmpDestObject != null && outDestObject != null) {
            if (cmpDestObject.getType() != outDestObject.getType()) {
                return false;
            }
            PdfArray explicitCmpDest = null;
            PdfArray explicitOutDest = null;
            PdfNameTree cmpNamedDestinations = cmpDocument.getCatalog().getNameTree(PdfName.Dests);
            PdfNameTree outNamedDestinations = outDocument.getCatalog().getNameTree(PdfName.Dests);
            switch (cmpDestObject.getType()) {
                case 1:
                    explicitCmpDest = (PdfArray) cmpDestObject;
                    explicitOutDest = (PdfArray) outDestObject;
                    break;
                case 6:
                    String cmpDestName = ((PdfName) cmpDestObject).getValue();
                    explicitCmpDest = (PdfArray) cmpNamedDestinations.getEntry(cmpDestName);
                    String outDestName = ((PdfName) outDestObject).getValue();
                    explicitOutDest = (PdfArray) outNamedDestinations.getEntry(outDestName);
                    break;
                case 10:
                    explicitCmpDest = (PdfArray) cmpNamedDestinations.getEntry((PdfString) cmpDestObject);
                    explicitOutDest = (PdfArray) outNamedDestinations.getEntry((PdfString) outDestObject);
                    break;
            }
            if (getExplicitDestinationPageNum(explicitCmpDest) != getExplicitDestinationPageNum(explicitOutDest)) {
                return false;
            }
        }
        PdfDictionary cmpDict = cmpLink.getPdfObject();
        PdfDictionary outDict = outLink.getPdfObject();
        if (cmpDict.size() != outDict.size()) {
            return false;
        }
        Rectangle cmpRect = cmpDict.getAsRectangle(PdfName.Rect);
        Rectangle outRect = outDict.getAsRectangle(PdfName.Rect);
        if (cmpRect.getHeight() != outRect.getHeight() || cmpRect.getWidth() != outRect.getWidth() || cmpRect.getX() != outRect.getX() || cmpRect.getY() != outRect.getY()) {
            return false;
        }
        for (Map.Entry<PdfName, PdfObject> cmpEntry : cmpDict.entrySet()) {
            PdfObject cmpObj = cmpEntry.getValue();
            if (!outDict.containsKey(cmpEntry.getKey())) {
                return false;
            }
            PdfObject outObj = outDict.get(cmpEntry.getKey());
            if (cmpObj.getType() != outObj.getType()) {
                return false;
            }
            switch (cmpObj.getType()) {
                case 2:
                case 6:
                case 7:
                case 8:
                case 10:
                    if (cmpObj.toString().equals(outObj.toString())) {
                        break;
                    } else {
                        return false;
                    }
            }
        }
        return true;
    }

    private int getExplicitDestinationPageNum(PdfArray explicitDest) {
        PdfIndirectReference pageReference = (PdfIndirectReference) explicitDest.get(0, false);
        PdfDocument doc = pageReference.getDocument();
        for (int i = 1; i <= doc.getNumberOfPages(); i++) {
            if (doc.getPage(i).getPdfObject().getIndirectReference().equals(pageReference)) {
                return i;
            }
        }
        throw new IllegalArgumentException("PdfLinkAnnotation comparison: Page not found.");
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class PngFileFilter implements FileFilter {
        private String currentOutPdfName;

        public PngFileFilter(String currentOutPdfName) {
            this.currentOutPdfName = currentOutPdfName;
        }

        @Override // java.io.FileFilter
        public boolean accept(File pathname) {
            String ap = pathname.getName();
            boolean b1 = ap.endsWith(".png");
            boolean b2 = ap.contains("cmp_");
            return b1 && !b2 && ap.contains(this.currentOutPdfName);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class CmpPngFileFilter implements FileFilter {
        private String currentCmpPdfName;

        public CmpPngFileFilter(String currentCmpPdfName) {
            this.currentCmpPdfName = currentCmpPdfName;
        }

        @Override // java.io.FileFilter
        public boolean accept(File pathname) {
            String ap = pathname.getName();
            boolean b1 = ap.endsWith(".png");
            boolean b2 = ap.contains("cmp_");
            return b1 && b2 && ap.contains(this.currentCmpPdfName);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class DiffPngFileFilter implements FileFilter {
        private String differenceImagePrefix;

        public DiffPngFileFilter(String differenceImagePrefix) {
            this.differenceImagePrefix = differenceImagePrefix;
        }

        @Override // java.io.FileFilter
        public boolean accept(File pathname) {
            String ap = pathname.getName();
            boolean b1 = ap.endsWith(".png");
            boolean b2 = ap.startsWith(this.differenceImagePrefix);
            return b1 && b2;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class ImageNameComparator implements Comparator<File> {
        private ImageNameComparator() {
        }

        @Override // java.util.Comparator
        public int compare(File f1, File f2) {
            String f1Name = f1.getName();
            String f2Name = f2.getName();
            return f1Name.compareTo(f2Name);
        }
    }

    /* loaded from: classes12.dex */
    public static class CompareResult {
        protected Map<ObjectPath, String> differences = new LinkedHashMap();
        protected int messageLimit;

        public CompareResult(int messageLimit) {
            this.messageLimit = 1;
            this.messageLimit = messageLimit;
        }

        public boolean isOk() {
            return this.differences.size() == 0;
        }

        public int getErrorCount() {
            return this.differences.size();
        }

        public String getReport() {
            StringBuilder sb = new StringBuilder();
            boolean firstEntry = true;
            for (Map.Entry<ObjectPath, String> entry : this.differences.entrySet()) {
                if (!firstEntry) {
                    sb.append("-----------------------------").append("\n");
                }
                ObjectPath diffPath = entry.getKey();
                sb.append(entry.getValue()).append("\n").append(diffPath.toString()).append("\n");
                firstEntry = false;
            }
            return sb.toString();
        }

        public Map<ObjectPath, String> getDifferences() {
            return this.differences;
        }

        public void writeReportToXml(OutputStream stream) throws ParserConfigurationException, TransformerException {
            Document xmlReport = XmlUtil.initNewXmlDocument();
            Element root = xmlReport.createElement("report");
            Element errors = xmlReport.createElement("errors");
            errors.setAttribute("count", String.valueOf(this.differences.size()));
            root.appendChild(errors);
            for (Map.Entry<ObjectPath, String> entry : this.differences.entrySet()) {
                Node errorNode = xmlReport.createElement("error");
                Node message = xmlReport.createElement("message");
                message.appendChild(xmlReport.createTextNode(entry.getValue()));
                Node path = entry.getKey().toXmlNode(xmlReport);
                errorNode.appendChild(message);
                errorNode.appendChild(path);
                errors.appendChild(errorNode);
            }
            xmlReport.appendChild(root);
            XmlUtils.writeXmlDocToStream(xmlReport, stream);
        }

        protected boolean isMessageLimitReached() {
            return this.differences.size() >= this.messageLimit;
        }

        protected void addError(ObjectPath path, String message) {
            if (this.differences.size() < this.messageLimit) {
                this.differences.put(new ObjectPath(path), message);
            }
        }
    }

    /* loaded from: classes12.dex */
    public static class CompareToolExecutionException extends RuntimeException {
        public CompareToolExecutionException(String msg) {
            super(msg);
        }
    }
}
