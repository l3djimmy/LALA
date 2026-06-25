package com.itextpdf.kernel.utils;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;
/* loaded from: classes12.dex */
final class XmlUtils {
    XmlUtils() {
    }

    public static void writeXmlDocToStream(Document xmlReport, OutputStream stream) throws TransformerException {
        Transformer transformer = XmlProcessorCreator.createSafeTransformer();
        transformer.setOutputProperty("indent", "yes");
        transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "0");
        DOMSource source = new DOMSource(xmlReport);
        StreamResult result = new StreamResult(stream);
        transformer.transform(source, result);
    }

    public static boolean compareXmls(InputStream xml1, InputStream xml2) throws ParserConfigurationException, SAXException, IOException {
        DocumentBuilder db = XmlProcessorCreator.createSafeDocumentBuilder(true, true);
        Document doc1 = db.parse(xml1);
        doc1.normalizeDocument();
        Document doc2 = db.parse(xml2);
        doc2.normalizeDocument();
        return doc2.isEqualNode(doc1);
    }

    public static Document initNewXmlDocument() throws ParserConfigurationException {
        DocumentBuilder db = XmlProcessorCreator.createSafeDocumentBuilder(false, false);
        return db.newDocument();
    }
}
