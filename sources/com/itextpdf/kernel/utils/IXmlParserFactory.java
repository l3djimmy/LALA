package com.itextpdf.kernel.utils;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.transform.Transformer;
import org.xml.sax.XMLReader;
/* loaded from: classes12.dex */
public interface IXmlParserFactory {
    DocumentBuilder createDocumentBuilderInstance(boolean z, boolean z2);

    Transformer createTransformerInstance();

    XMLReader createXMLReaderInstance(boolean z, boolean z2);
}
