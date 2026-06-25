package com.itextpdf.kernel.xmp.impl;

import com.itextpdf.kernel.utils.XmlProcessorCreator;
import com.itextpdf.kernel.xmp.XMPConst;
import com.itextpdf.kernel.xmp.XMPException;
import com.itextpdf.kernel.xmp.XMPMeta;
import com.itextpdf.kernel.xmp.options.ParseOptions;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import javax.xml.parsers.DocumentBuilder;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.w3c.dom.ProcessingInstruction;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
/* loaded from: classes12.dex */
public class XMPMetaParser {
    private static final Object XMP_RDF = new Object();

    private XMPMetaParser() {
    }

    public static XMPMeta parse(Object input, ParseOptions options) throws XMPException {
        ParameterAsserts.assertNotNull(input);
        ParseOptions options2 = options != null ? options : new ParseOptions();
        Document document = parseXml(input, options2);
        boolean xmpmetaRequired = options2.getRequireXMPMeta();
        Object[] result = findRootNode(document, xmpmetaRequired, new Object[3]);
        if (result != null && result[1] == XMP_RDF) {
            XMPMetaImpl xmp = ParseRDF.parse((Node) result[0]);
            xmp.setPacketHeader((String) result[2]);
            if (!options2.getOmitNormalization()) {
                return XMPNormalizer.process(xmp, options2);
            }
            return xmp;
        }
        return new XMPMetaImpl();
    }

    private static Document parseXml(Object input, ParseOptions options) throws XMPException {
        if (input instanceof InputStream) {
            return parseXmlFromInputStream((InputStream) input, options);
        }
        if (input instanceof byte[]) {
            return parseXmlFromBytebuffer(new ByteBuffer((byte[]) input), options);
        }
        return parseXmlFromString((String) input, options);
    }

    private static Document parseXmlFromInputStream(InputStream stream, ParseOptions options) throws XMPException {
        if (!options.getAcceptLatin1() && !options.getFixControlChars()) {
            return parseInputSource(new InputSource(stream));
        }
        try {
            ByteBuffer buffer = new ByteBuffer(stream);
            return parseXmlFromBytebuffer(buffer, options);
        } catch (IOException e) {
            throw new XMPException("Error reading the XML-file", 204, e);
        }
    }

    private static Document parseXmlFromBytebuffer(ByteBuffer buffer, ParseOptions options) throws XMPException {
        InputSource source = new InputSource(buffer.getByteStream());
        try {
            return parseInputSource(source);
        } catch (XMPException e) {
            if (e.getErrorCode() == 201 || e.getErrorCode() == 204) {
                if (options.getAcceptLatin1()) {
                    buffer = Latin1Converter.convert(buffer);
                }
                if (options.getFixControlChars()) {
                    try {
                        String encoding = buffer.getEncoding();
                        Reader fixReader = new FixASCIIControlsReader(new InputStreamReader(buffer.getByteStream(), encoding));
                        return parseInputSource(new InputSource(fixReader));
                    } catch (UnsupportedEncodingException e2) {
                        throw new XMPException("Unsupported Encoding", 9, e);
                    }
                }
                InputSource source2 = new InputSource(buffer.getByteStream());
                return parseInputSource(source2);
            }
            throw e;
        }
    }

    private static Document parseXmlFromString(String input, ParseOptions options) throws XMPException {
        InputSource source = new InputSource(new StringReader(input));
        try {
            return parseInputSource(source);
        } catch (XMPException e) {
            if (e.getErrorCode() == 201 && options.getFixControlChars()) {
                InputSource source2 = new InputSource(new FixASCIIControlsReader(new StringReader(input)));
                return parseInputSource(source2);
            }
            throw e;
        }
    }

    private static Document parseInputSource(InputSource source) throws XMPException {
        try {
            DocumentBuilder builder = XmlProcessorCreator.createSafeDocumentBuilder(true, true);
            builder.setErrorHandler(null);
            return builder.parse(source);
        } catch (IOException e) {
            throw new XMPException("Error reading the XML-file", 204, e);
        } catch (SAXException e2) {
            throw new XMPException(e2.getMessage(), 201, e2);
        }
    }

    private static Object[] findRootNode(Node root, boolean xmpmetaRequired, Object[] result) {
        NodeList children = root.getChildNodes();
        for (int i = 0; i < children.getLength(); i++) {
            Node root2 = children.item(i);
            if (7 == root2.getNodeType() && XMPConst.XMP_PI.equals(((ProcessingInstruction) root2).getTarget())) {
                if (result != null) {
                    result[2] = ((ProcessingInstruction) root2).getData();
                }
            } else if (3 != root2.getNodeType() && 7 != root2.getNodeType()) {
                String rootNS = root2.getNamespaceURI();
                String rootLocal = root2.getLocalName();
                if ((XMPConst.TAG_XMPMETA.equals(rootLocal) || XMPConst.TAG_XAPMETA.equals(rootLocal)) && XMPConst.NS_X.equals(rootNS)) {
                    return findRootNode(root2, false, result);
                }
                if (!xmpmetaRequired && "RDF".equals(rootLocal) && XMPConst.NS_RDF.equals(rootNS)) {
                    if (result != null) {
                        result[0] = root2;
                        result[1] = XMP_RDF;
                    }
                    return result;
                }
                Object[] newResult = findRootNode(root2, xmpmetaRequired, result);
                if (newResult != null) {
                    return newResult;
                }
            }
        }
        return null;
    }
}
