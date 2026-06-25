package com.itextpdf.kernel.utils;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.transform.Transformer;
import org.xml.sax.XMLReader;
/* loaded from: classes12.dex */
public final class XmlProcessorCreator {
    private static IXmlParserFactory xmlParserFactory = new DefaultSafeXmlParserFactory();

    private XmlProcessorCreator() {
    }

    public static void setXmlParserFactory(IXmlParserFactory factory) {
        if (factory == null) {
            xmlParserFactory = new DefaultSafeXmlParserFactory();
        } else {
            xmlParserFactory = factory;
        }
    }

    public static DocumentBuilder createSafeDocumentBuilder(boolean namespaceAware, boolean ignoringComments) {
        return xmlParserFactory.createDocumentBuilderInstance(namespaceAware, ignoringComments);
    }

    public static XMLReader createSafeXMLReader(boolean namespaceAware, boolean validating) {
        return xmlParserFactory.createXMLReaderInstance(namespaceAware, validating);
    }

    public static Transformer createSafeTransformer() {
        return xmlParserFactory.createTransformerInstance();
    }
}
