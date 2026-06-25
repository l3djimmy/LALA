package com.itextpdf.kernel.utils;

import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.util.XmlUtil;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.logs.KernelLogMessageConstant;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.xml.sax.EntityResolver;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.SAXNotRecognizedException;
import org.xml.sax.SAXNotSupportedException;
import org.xml.sax.XMLReader;
/* loaded from: classes12.dex */
public class DefaultSafeXmlParserFactory implements IXmlParserFactory {
    private static final String DISALLOW_DOCTYPE_DECL = "http://apache.org/xml/features/disallow-doctype-decl";
    private static final String EXTERNAL_GENERAL_ENTITIES = "http://xml.org/sax/features/external-general-entities";
    private static final String EXTERNAL_PARAMETER_ENTITIES = "http://xml.org/sax/features/external-parameter-entities";
    private static final String LOAD_EXTERNAL_DTD = "http://apache.org/xml/features/nonvalidating/load-external-dtd";
    private static final Logger LOGGER = LoggerFactory.getLogger(DefaultSafeXmlParserFactory.class);

    @Override // com.itextpdf.kernel.utils.IXmlParserFactory
    public DocumentBuilder createDocumentBuilderInstance(boolean namespaceAware, boolean ignoringComments) {
        DocumentBuilderFactory factory = createDocumentBuilderFactory();
        configureSafeDocumentBuilderFactory(factory);
        factory.setNamespaceAware(namespaceAware);
        factory.setIgnoringComments(ignoringComments);
        try {
            DocumentBuilder db = factory.newDocumentBuilder();
            db.setEntityResolver(new SafeEmptyEntityResolver());
            return db;
        } catch (ParserConfigurationException e) {
            throw new PdfException(e.getMessage(), (Throwable) e);
        }
    }

    @Override // com.itextpdf.kernel.utils.IXmlParserFactory
    public XMLReader createXMLReaderInstance(boolean namespaceAware, boolean validating) {
        SAXParserFactory factory = createSAXParserFactory();
        factory.setNamespaceAware(namespaceAware);
        factory.setValidating(validating);
        configureSafeSAXParserFactory(factory);
        try {
            SAXParser saxParser = factory.newSAXParser();
            XMLReader xmlReader = saxParser.getXMLReader();
            xmlReader.setEntityResolver(new SafeEmptyEntityResolver());
            return xmlReader;
        } catch (ParserConfigurationException | SAXException e) {
            throw new PdfException(e.getMessage(), (Throwable) e);
        }
    }

    @Override // com.itextpdf.kernel.utils.IXmlParserFactory
    public Transformer createTransformerInstance() {
        TransformerFactory factory = TransformerFactory.newInstance();
        configureSafeTransformerFactory(factory);
        try {
            Transformer transformer = factory.newTransformer();
            return transformer;
        } catch (TransformerConfigurationException e) {
            throw new PdfException(e.getMessage(), (Throwable) e);
        }
    }

    protected DocumentBuilderFactory createDocumentBuilderFactory() {
        return XmlUtil.getDocumentBuilderFactory();
    }

    protected SAXParserFactory createSAXParserFactory() {
        return XmlUtil.createSAXParserFactory();
    }

    protected void configureSafeDocumentBuilderFactory(DocumentBuilderFactory factory) {
        tryToSetFeature(factory, DISALLOW_DOCTYPE_DECL, true);
        tryToSetFeature(factory, EXTERNAL_GENERAL_ENTITIES, false);
        tryToSetFeature(factory, EXTERNAL_PARAMETER_ENTITIES, false);
        tryToSetFeature(factory, LOAD_EXTERNAL_DTD, false);
        factory.setXIncludeAware(false);
        factory.setExpandEntityReferences(false);
    }

    protected void configureSafeSAXParserFactory(SAXParserFactory factory) {
        tryToSetFeature(factory, DISALLOW_DOCTYPE_DECL, true);
        tryToSetFeature(factory, EXTERNAL_GENERAL_ENTITIES, false);
        tryToSetFeature(factory, EXTERNAL_PARAMETER_ENTITIES, false);
        tryToSetFeature(factory, LOAD_EXTERNAL_DTD, false);
        factory.setXIncludeAware(false);
    }

    protected void configureSafeTransformerFactory(TransformerFactory factory) {
        factory.setAttribute("http://javax.xml.XMLConstants/property/accessExternalDTD", "");
        factory.setAttribute("http://javax.xml.XMLConstants/property/accessExternalStylesheet", "");
    }

    private void tryToSetFeature(DocumentBuilderFactory factory, String feature, boolean value) {
        try {
            factory.setFeature(feature, value);
        } catch (ParserConfigurationException e) {
            LOGGER.info(MessageFormatUtil.format(KernelLogMessageConstant.FEATURE_IS_NOT_SUPPORTED, e.getMessage(), feature));
        }
    }

    private void tryToSetFeature(SAXParserFactory factory, String feature, boolean value) {
        try {
            factory.setFeature(feature, value);
        } catch (ParserConfigurationException | SAXNotRecognizedException | SAXNotSupportedException e) {
            LOGGER.info(MessageFormatUtil.format(KernelLogMessageConstant.FEATURE_IS_NOT_SUPPORTED, e.getMessage(), feature));
        }
    }

    /* loaded from: classes12.dex */
    private static class SafeEmptyEntityResolver implements EntityResolver {
        @Override // org.xml.sax.EntityResolver
        public InputSource resolveEntity(String publicId, String systemId) {
            throw new PdfException(KernelExceptionMessageConstant.EXTERNAL_ENTITY_ELEMENT_FOUND_IN_XML);
        }
    }
}
