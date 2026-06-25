package com.itextpdf.kernel.xmp.impl;

import com.itextpdf.kernel.xmp.XMPConst;
import com.itextpdf.kernel.xmp.XMPError;
import com.itextpdf.kernel.xmp.XMPException;
import com.itextpdf.kernel.xmp.XMPMetaFactory;
import com.itextpdf.kernel.xmp.XMPSchemaRegistry;
import com.itextpdf.kernel.xmp.options.PropertyOptions;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.w3c.dom.Attr;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
/* loaded from: classes12.dex */
public class ParseRDF implements XMPError, XMPConst {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    public static final String DEFAULT_PREFIX = "_dflt";
    public static final int RDFTERM_ABOUT = 3;
    public static final int RDFTERM_ABOUT_EACH = 10;
    public static final int RDFTERM_ABOUT_EACH_PREFIX = 11;
    public static final int RDFTERM_BAG_ID = 12;
    public static final int RDFTERM_DATATYPE = 7;
    public static final int RDFTERM_DESCRIPTION = 8;
    public static final int RDFTERM_FIRST_CORE = 1;
    public static final int RDFTERM_FIRST_OLD = 10;
    public static final int RDFTERM_FIRST_SYNTAX = 1;
    public static final int RDFTERM_ID = 2;
    public static final int RDFTERM_LAST_CORE = 7;
    public static final int RDFTERM_LAST_OLD = 12;
    public static final int RDFTERM_LAST_SYNTAX = 9;
    public static final int RDFTERM_LI = 9;
    public static final int RDFTERM_NODE_ID = 6;
    public static final int RDFTERM_OTHER = 0;
    public static final int RDFTERM_PARSE_TYPE = 4;
    public static final int RDFTERM_RDF = 1;
    public static final int RDFTERM_RESOURCE = 5;

    /* JADX INFO: Access modifiers changed from: package-private */
    public static XMPMetaImpl parse(Node xmlRoot) throws XMPException {
        XMPMetaImpl xmp = new XMPMetaImpl();
        rdf_RDF(xmp, xmlRoot);
        return xmp;
    }

    static void rdf_RDF(XMPMetaImpl xmp, Node rdfRdfNode) throws XMPException {
        if (rdfRdfNode.hasAttributes()) {
            rdf_NodeElementList(xmp, xmp.getRoot(), rdfRdfNode);
            return;
        }
        throw new XMPException("Invalid attributes of rdf:RDF element", 202);
    }

    private static void rdf_NodeElementList(XMPMetaImpl xmp, XMPNode xmpParent, Node rdfRdfNode) throws XMPException {
        for (int i = 0; i < rdfRdfNode.getChildNodes().getLength(); i++) {
            Node child = rdfRdfNode.getChildNodes().item(i);
            if (!isWhitespaceNode(child)) {
                rdf_NodeElement(xmp, xmpParent, child, true);
            }
        }
    }

    private static void rdf_NodeElement(XMPMetaImpl xmp, XMPNode xmpParent, Node xmlNode, boolean isTopLevel) throws XMPException {
        int nodeTerm = getRDFTermKind(xmlNode);
        if (nodeTerm != 8 && nodeTerm != 0) {
            throw new XMPException("Node element must be rdf:Description or typed node", 202);
        }
        if (isTopLevel && nodeTerm == 0) {
            throw new XMPException("Top level typed node not allowed", 203);
        }
        rdf_NodeElementAttrs(xmp, xmpParent, xmlNode, isTopLevel);
        rdf_PropertyElementList(xmp, xmpParent, xmlNode, isTopLevel);
    }

    private static void rdf_NodeElementAttrs(XMPMetaImpl xmp, XMPNode xmpParent, Node xmlNode, boolean isTopLevel) throws XMPException {
        int exclusiveAttrs = 0;
        for (int i = 0; i < xmlNode.getAttributes().getLength(); i++) {
            Node attribute = xmlNode.getAttributes().item(i);
            if (!"xmlns".equals(attribute.getPrefix()) && (attribute.getPrefix() != null || !"xmlns".equals(attribute.getNodeName()))) {
                int attrTerm = getRDFTermKind(attribute);
                switch (attrTerm) {
                    case 0:
                        addChildNode(xmp, xmpParent, attribute, attribute.getNodeValue(), isTopLevel);
                        continue;
                    case 1:
                    case 4:
                    case 5:
                    default:
                        throw new XMPException("Invalid nodeElement attribute", 202);
                    case 2:
                    case 3:
                    case 6:
                        if (exclusiveAttrs > 0) {
                            throw new XMPException("Mutally exclusive about, ID, nodeID attributes", 202);
                        }
                        exclusiveAttrs++;
                        if (isTopLevel) {
                            if (attrTerm == 3) {
                                if (xmpParent.getName() != null && xmpParent.getName().length() > 0) {
                                    if (!xmpParent.getName().equals(attribute.getNodeValue())) {
                                        throw new XMPException("Mismatched top level rdf:about values", 203);
                                    }
                                    break;
                                } else {
                                    xmpParent.setName(attribute.getNodeValue());
                                    break;
                                }
                            } else {
                                continue;
                            }
                        } else {
                            continue;
                        }
                }
            }
        }
    }

    private static void rdf_PropertyElementList(XMPMetaImpl xmp, XMPNode xmpParent, Node xmlParent, boolean isTopLevel) throws XMPException {
        for (int i = 0; i < xmlParent.getChildNodes().getLength(); i++) {
            Node currChild = xmlParent.getChildNodes().item(i);
            if (!isWhitespaceNode(currChild)) {
                if (currChild.getNodeType() != 1) {
                    throw new XMPException("Expected property element node not found", 202);
                }
                rdf_PropertyElement(xmp, xmpParent, currChild, isTopLevel);
            }
        }
    }

    private static void rdf_PropertyElement(XMPMetaImpl xmp, XMPNode xmpParent, Node xmlNode, boolean isTopLevel) throws XMPException {
        int nodeTerm = getRDFTermKind(xmlNode);
        if (!isPropertyElementName(nodeTerm)) {
            throw new XMPException("Invalid property element name", 202);
        }
        NamedNodeMap attributes = xmlNode.getAttributes();
        List<String> nsAttrs = null;
        for (int i = 0; i < attributes.getLength(); i++) {
            Node attribute = attributes.item(i);
            if ("xmlns".equals(attribute.getPrefix()) || (attribute.getPrefix() == null && "xmlns".equals(attribute.getNodeName()))) {
                if (nsAttrs == null) {
                    nsAttrs = new ArrayList();
                }
                nsAttrs.add(attribute.getNodeName());
            }
        }
        if (nsAttrs != null) {
            for (String ns : nsAttrs) {
                attributes.removeNamedItem(ns);
            }
        }
        if (attributes.getLength() > 3) {
            rdf_EmptyPropertyElement(xmp, xmpParent, xmlNode, isTopLevel);
            return;
        }
        for (int i2 = 0; i2 < attributes.getLength(); i2++) {
            Node attribute2 = attributes.item(i2);
            String attrLocal = attribute2.getLocalName();
            String attrNS = attribute2.getNamespaceURI();
            String attrValue = attribute2.getNodeValue();
            if (!XMPConst.XML_LANG.equals(attribute2.getNodeName()) || ("ID".equals(attrLocal) && XMPConst.NS_RDF.equals(attrNS))) {
                if ("datatype".equals(attrLocal) && XMPConst.NS_RDF.equals(attrNS)) {
                    rdf_LiteralPropertyElement(xmp, xmpParent, xmlNode, isTopLevel);
                    return;
                } else if (!"parseType".equals(attrLocal) || !XMPConst.NS_RDF.equals(attrNS)) {
                    rdf_EmptyPropertyElement(xmp, xmpParent, xmlNode, isTopLevel);
                    return;
                } else if ("Literal".equals(attrValue)) {
                    rdf_ParseTypeLiteralPropertyElement();
                    return;
                } else if ("Resource".equals(attrValue)) {
                    rdf_ParseTypeResourcePropertyElement(xmp, xmpParent, xmlNode, isTopLevel);
                    return;
                } else if ("Collection".equals(attrValue)) {
                    rdf_ParseTypeCollectionPropertyElement();
                    return;
                } else {
                    rdf_ParseTypeOtherPropertyElement();
                    return;
                }
            }
        }
        if (xmlNode.hasChildNodes()) {
            for (int i3 = 0; i3 < xmlNode.getChildNodes().getLength(); i3++) {
                Node currChild = xmlNode.getChildNodes().item(i3);
                if (currChild.getNodeType() != 3) {
                    rdf_ResourcePropertyElement(xmp, xmpParent, xmlNode, isTopLevel);
                    return;
                }
            }
            rdf_LiteralPropertyElement(xmp, xmpParent, xmlNode, isTopLevel);
            return;
        }
        rdf_EmptyPropertyElement(xmp, xmpParent, xmlNode, isTopLevel);
    }

    private static void rdf_ResourcePropertyElement(XMPMetaImpl xmp, XMPNode xmpParent, Node xmlNode, boolean isTopLevel) throws XMPException {
        if (isTopLevel && "iX:changes".equals(xmlNode.getNodeName())) {
            return;
        }
        XMPNode newCompound = addChildNode(xmp, xmpParent, xmlNode, "", isTopLevel);
        for (int i = 0; i < xmlNode.getAttributes().getLength(); i++) {
            Node attribute = xmlNode.getAttributes().item(i);
            if (!"xmlns".equals(attribute.getPrefix()) && (attribute.getPrefix() != null || !"xmlns".equals(attribute.getNodeName()))) {
                String attrLocal = attribute.getLocalName();
                String attrNS = attribute.getNamespaceURI();
                if (XMPConst.XML_LANG.equals(attribute.getNodeName())) {
                    addQualifierNode(newCompound, XMPConst.XML_LANG, attribute.getNodeValue());
                } else if (!"ID".equals(attrLocal) || !XMPConst.NS_RDF.equals(attrNS)) {
                    throw new XMPException("Invalid attribute for resource property element", 202);
                }
            }
        }
        boolean found = false;
        for (int i2 = 0; i2 < xmlNode.getChildNodes().getLength(); i2++) {
            Node currChild = xmlNode.getChildNodes().item(i2);
            if (!isWhitespaceNode(currChild)) {
                if (currChild.getNodeType() == 1 && !found) {
                    boolean isRDF = XMPConst.NS_RDF.equals(currChild.getNamespaceURI());
                    String childLocal = currChild.getLocalName();
                    if (isRDF && "Bag".equals(childLocal)) {
                        newCompound.getOptions().setArray(true);
                    } else if (isRDF && "Seq".equals(childLocal)) {
                        newCompound.getOptions().setArray(true).setArrayOrdered(true);
                    } else if (isRDF && "Alt".equals(childLocal)) {
                        newCompound.getOptions().setArray(true).setArrayOrdered(true).setArrayAlternate(true);
                    } else {
                        newCompound.getOptions().setStruct(true);
                        if (!isRDF && !"Description".equals(childLocal)) {
                            String typeName = currChild.getNamespaceURI();
                            if (typeName == null) {
                                throw new XMPException("All XML elements must be in a namespace", 203);
                            }
                            addQualifierNode(newCompound, XMPConst.RDF_TYPE, typeName + ':' + childLocal);
                        }
                    }
                    rdf_NodeElement(xmp, newCompound, currChild, false);
                    if (newCompound.getHasValueChild()) {
                        fixupQualifiedNode(newCompound);
                    } else if (newCompound.getOptions().isArrayAlternate()) {
                        XMPNodeUtils.detectAltText(newCompound);
                    }
                    found = true;
                } else if (found) {
                    throw new XMPException("Invalid child of resource property element", 202);
                } else {
                    throw new XMPException("Children of resource property element must be XML elements", 202);
                }
            }
        }
        if (!found) {
            throw new XMPException("Missing child of resource property element", 202);
        }
    }

    private static void rdf_LiteralPropertyElement(XMPMetaImpl xmp, XMPNode xmpParent, Node xmlNode, boolean isTopLevel) throws XMPException {
        XMPNode newChild = addChildNode(xmp, xmpParent, xmlNode, null, isTopLevel);
        for (int i = 0; i < xmlNode.getAttributes().getLength(); i++) {
            Node attribute = xmlNode.getAttributes().item(i);
            if (!"xmlns".equals(attribute.getPrefix()) && (attribute.getPrefix() != null || !"xmlns".equals(attribute.getNodeName()))) {
                String attrNS = attribute.getNamespaceURI();
                String attrLocal = attribute.getLocalName();
                if (XMPConst.XML_LANG.equals(attribute.getNodeName())) {
                    addQualifierNode(newChild, XMPConst.XML_LANG, attribute.getNodeValue());
                } else if (!XMPConst.NS_RDF.equals(attrNS) || (!"ID".equals(attrLocal) && !"datatype".equals(attrLocal))) {
                    throw new XMPException("Invalid attribute for literal property element", 202);
                }
            }
        }
        String textValue = "";
        for (int i2 = 0; i2 < xmlNode.getChildNodes().getLength(); i2++) {
            Node child = xmlNode.getChildNodes().item(i2);
            if (child.getNodeType() == 3) {
                textValue = textValue + child.getNodeValue();
            } else {
                throw new XMPException("Invalid child of literal property element", 202);
            }
        }
        newChild.setValue(textValue);
    }

    private static void rdf_ParseTypeLiteralPropertyElement() throws XMPException {
        throw new XMPException("ParseTypeLiteral property element not allowed", 203);
    }

    private static void rdf_ParseTypeResourcePropertyElement(XMPMetaImpl xmp, XMPNode xmpParent, Node xmlNode, boolean isTopLevel) throws XMPException {
        XMPNode newStruct = addChildNode(xmp, xmpParent, xmlNode, "", isTopLevel);
        newStruct.getOptions().setStruct(true);
        for (int i = 0; i < xmlNode.getAttributes().getLength(); i++) {
            Node attribute = xmlNode.getAttributes().item(i);
            if (!"xmlns".equals(attribute.getPrefix()) && (attribute.getPrefix() != null || !"xmlns".equals(attribute.getNodeName()))) {
                String attrLocal = attribute.getLocalName();
                String attrNS = attribute.getNamespaceURI();
                if (XMPConst.XML_LANG.equals(attribute.getNodeName())) {
                    addQualifierNode(newStruct, XMPConst.XML_LANG, attribute.getNodeValue());
                } else if (!XMPConst.NS_RDF.equals(attrNS) || (!"ID".equals(attrLocal) && !"parseType".equals(attrLocal))) {
                    throw new XMPException("Invalid attribute for ParseTypeResource property element", 202);
                }
            }
        }
        rdf_PropertyElementList(xmp, newStruct, xmlNode, false);
        if (newStruct.getHasValueChild()) {
            fixupQualifiedNode(newStruct);
        }
    }

    private static void rdf_ParseTypeCollectionPropertyElement() throws XMPException {
        throw new XMPException("ParseTypeCollection property element not allowed", 203);
    }

    private static void rdf_ParseTypeOtherPropertyElement() throws XMPException {
        throw new XMPException("ParseTypeOther property element not allowed", 203);
    }

    private static void rdf_EmptyPropertyElement(XMPMetaImpl xmp, XMPNode xmpParent, Node xmlNode, boolean isTopLevel) throws XMPException {
        boolean hasPropertyAttrs;
        boolean hasResourceAttr;
        boolean hasPropertyAttrs2 = false;
        boolean hasResourceAttr2 = false;
        boolean hasNodeIDAttr = false;
        boolean hasValueAttr = false;
        Node valueNode = null;
        if (xmlNode.hasChildNodes()) {
            throw new XMPException("Nested content not allowed with rdf:resource or property attributes", 202);
        }
        for (int i = 0; i < xmlNode.getAttributes().getLength(); i++) {
            Node attribute = xmlNode.getAttributes().item(i);
            if (!"xmlns".equals(attribute.getPrefix()) && (attribute.getPrefix() != null || !"xmlns".equals(attribute.getNodeName()))) {
                int attrTerm = getRDFTermKind(attribute);
                switch (attrTerm) {
                    case 0:
                        if ("value".equals(attribute.getLocalName()) && XMPConst.NS_RDF.equals(attribute.getNamespaceURI())) {
                            if (hasResourceAttr2) {
                                throw new XMPException("Empty property element can't have both rdf:value and rdf:resource", 203);
                            }
                            hasValueAttr = true;
                            valueNode = attribute;
                            break;
                        } else if (XMPConst.XML_LANG.equals(attribute.getNodeName())) {
                            break;
                        } else {
                            hasPropertyAttrs2 = true;
                            continue;
                        }
                        break;
                    case 1:
                    case 3:
                    case 4:
                    default:
                        throw new XMPException("Unrecognized attribute of empty property element", 202);
                    case 2:
                        break;
                    case 5:
                        if (hasNodeIDAttr) {
                            throw new XMPException("Empty property element can't have both rdf:resource and rdf:nodeID", 202);
                        }
                        if (hasValueAttr) {
                            throw new XMPException("Empty property element can't have both rdf:value and rdf:resource", 203);
                        }
                        hasResourceAttr2 = true;
                        if (!hasValueAttr) {
                            valueNode = attribute;
                            break;
                        } else {
                            continue;
                        }
                    case 6:
                        if (hasResourceAttr2) {
                            throw new XMPException("Empty property element can't have both rdf:resource and rdf:nodeID", 202);
                        }
                        hasNodeIDAttr = true;
                        continue;
                }
            }
        }
        XMPNode childNode = addChildNode(xmp, xmpParent, xmlNode, "", isTopLevel);
        boolean childIsStruct = false;
        if (hasValueAttr || hasResourceAttr2) {
            childNode.setValue(valueNode != null ? valueNode.getNodeValue() : "");
            if (!hasValueAttr) {
                childNode.getOptions().setURI(true);
            }
        } else if (hasPropertyAttrs2) {
            childNode.getOptions().setStruct(true);
            childIsStruct = true;
        }
        int i2 = 0;
        while (i2 < xmlNode.getAttributes().getLength()) {
            Node attribute2 = xmlNode.getAttributes().item(i2);
            if (attribute2 == valueNode) {
                hasPropertyAttrs = hasPropertyAttrs2;
                hasResourceAttr = hasResourceAttr2;
            } else {
                hasPropertyAttrs = hasPropertyAttrs2;
                if ("xmlns".equals(attribute2.getPrefix())) {
                    hasResourceAttr = hasResourceAttr2;
                } else if (attribute2.getPrefix() == null && "xmlns".equals(attribute2.getNodeName())) {
                    hasResourceAttr = hasResourceAttr2;
                } else {
                    int attrTerm2 = getRDFTermKind(attribute2);
                    switch (attrTerm2) {
                        case 0:
                            hasResourceAttr = hasResourceAttr2;
                            if (!childIsStruct) {
                                addQualifierNode(childNode, attribute2.getNodeName(), attribute2.getNodeValue());
                                continue;
                            } else if (!XMPConst.XML_LANG.equals(attribute2.getNodeName())) {
                                addChildNode(xmp, childNode, attribute2, attribute2.getNodeValue(), false);
                                break;
                            } else {
                                addQualifierNode(childNode, XMPConst.XML_LANG, attribute2.getNodeValue());
                                break;
                            }
                        case 1:
                        case 3:
                        case 4:
                        default:
                            throw new XMPException("Unrecognized attribute of empty property element", 202);
                        case 2:
                        case 6:
                            hasResourceAttr = hasResourceAttr2;
                            continue;
                        case 5:
                            hasResourceAttr = hasResourceAttr2;
                            addQualifierNode(childNode, "rdf:resource", attribute2.getNodeValue());
                            continue;
                    }
                }
            }
            i2++;
            hasPropertyAttrs2 = hasPropertyAttrs;
            hasResourceAttr2 = hasResourceAttr;
        }
    }

    private static XMPNode addChildNode(XMPMetaImpl xmp, XMPNode xmpParent, Node xmlNode, String value, boolean isTopLevel) throws XMPException {
        XMPSchemaRegistry registry = XMPMetaFactory.getSchemaRegistry();
        String namespace = xmlNode.getNamespaceURI();
        if (namespace != null) {
            if (XMPConst.NS_DC_DEPRECATED.equals(namespace)) {
                namespace = XMPConst.NS_DC;
            }
            String prefix = registry.getNamespacePrefix(namespace);
            if (prefix == null) {
                prefix = registry.registerNamespace(namespace, xmlNode.getPrefix() != null ? xmlNode.getPrefix() : DEFAULT_PREFIX);
            }
            String prefix2 = prefix + xmlNode.getLocalName();
            PropertyOptions childOptions = new PropertyOptions();
            boolean isAlias = false;
            if (isTopLevel) {
                XMPNode schemaNode = XMPNodeUtils.findSchemaNode(xmp.getRoot(), namespace, DEFAULT_PREFIX, true);
                schemaNode.setImplicit(false);
                xmpParent = schemaNode;
                if (registry.findAlias(prefix2) != null) {
                    isAlias = true;
                    xmp.getRoot().setHasAliases(true);
                    schemaNode.setHasAliases(true);
                }
            }
            boolean isArrayItem = "rdf:li".equals(prefix2);
            boolean isValueNode = "rdf:value".equals(prefix2);
            XMPNode newChild = new XMPNode(prefix2, value, childOptions);
            newChild.setAlias(isAlias);
            if (!isValueNode) {
                xmpParent.addChild(newChild);
            } else {
                xmpParent.addChild(1, newChild);
            }
            if (isValueNode) {
                if (isTopLevel || !xmpParent.getOptions().isStruct()) {
                    throw new XMPException("Misplaced rdf:value element", 202);
                }
                xmpParent.setHasValueChild(true);
            }
            if (isArrayItem) {
                if (!xmpParent.getOptions().isArray()) {
                    throw new XMPException("Misplaced rdf:li element", 202);
                }
                newChild.setName("[]");
            }
            return newChild;
        }
        throw new XMPException("XML namespace required for all elements and attributes", 202);
    }

    private static XMPNode addQualifierNode(XMPNode xmpParent, String name, String value) throws XMPException {
        boolean isLang = XMPConst.XML_LANG.equals(name);
        XMPNode newQual = new XMPNode(name, isLang ? Utils.normalizeLangValue(value) : value, null);
        xmpParent.addQualifier(newQual);
        return newQual;
    }

    private static void fixupQualifiedNode(XMPNode xmpParent) throws XMPException {
        if (!xmpParent.getOptions().isStruct() || !xmpParent.hasChildren()) {
            throw new AssertionError();
        }
        XMPNode valueNode = xmpParent.getChild(1);
        if (!"rdf:value".equals(valueNode.getName())) {
            throw new AssertionError();
        }
        if (valueNode.getOptions().getHasLanguage()) {
            if (xmpParent.getOptions().getHasLanguage()) {
                throw new XMPException("Redundant xml:lang for rdf:value element", 203);
            }
            XMPNode langQual = valueNode.getQualifier(1);
            valueNode.removeQualifier(langQual);
            xmpParent.addQualifier(langQual);
        }
        for (int i = 1; i <= valueNode.getQualifierLength(); i++) {
            XMPNode qualifier = valueNode.getQualifier(i);
            xmpParent.addQualifier(qualifier);
        }
        for (int i2 = 2; i2 <= xmpParent.getChildrenLength(); i2++) {
            XMPNode qualifier2 = xmpParent.getChild(i2);
            xmpParent.addQualifier(qualifier2);
        }
        if (!xmpParent.getOptions().isStruct() && !xmpParent.getHasValueChild()) {
            throw new AssertionError();
        }
        xmpParent.setHasValueChild(false);
        xmpParent.getOptions().setStruct(false);
        xmpParent.getOptions().mergeWith(valueNode.getOptions());
        xmpParent.setValue(valueNode.getValue());
        xmpParent.removeChildren();
        Iterator it = valueNode.iterateChildren();
        while (it.hasNext()) {
            XMPNode child = (XMPNode) it.next();
            xmpParent.addChild(child);
        }
    }

    private static boolean isWhitespaceNode(Node node) {
        if (node.getNodeType() != 3) {
            return false;
        }
        String value = node.getNodeValue();
        for (int i = 0; i < value.length(); i++) {
            if (!Character.isWhitespace(value.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    private static boolean isPropertyElementName(int term) {
        if (term == 8 || isOldTerm(term)) {
            return false;
        }
        return !isCoreSyntaxTerm(term);
    }

    private static boolean isOldTerm(int term) {
        return 10 <= term && term <= 12;
    }

    private static boolean isCoreSyntaxTerm(int term) {
        return 1 <= term && term <= 7;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    private static int getRDFTermKind(Node node) {
        char c;
        String localName = node.getLocalName();
        String namespace = node.getNamespaceURI();
        if (namespace == null && (("about".equals(localName) || "ID".equals(localName)) && (node instanceof Attr) && XMPConst.NS_RDF.equals(((Attr) node).getOwnerElement().getNamespaceURI()))) {
            namespace = XMPConst.NS_RDF;
        }
        if (XMPConst.NS_RDF.equals(namespace)) {
            switch (localName.hashCode()) {
                case -1833071475:
                    if (localName.equals("parseType")) {
                        c = 1;
                        break;
                    }
                    c = 65535;
                    break;
                case -1340118226:
                    if (localName.equals("aboutEach")) {
                        c = '\t';
                        break;
                    }
                    c = 65535;
                    break;
                case -1040171363:
                    if (localName.equals("nodeID")) {
                        c = 7;
                        break;
                    }
                    c = 65535;
                    break;
                case -341064690:
                    if (localName.equals("resource")) {
                        c = 4;
                        break;
                    }
                    c = 65535;
                    break;
                case -56677412:
                    if (localName.equals("Description")) {
                        c = 2;
                        break;
                    }
                    c = 65535;
                    break;
                case 2331:
                    if (localName.equals("ID")) {
                        c = 6;
                        break;
                    }
                    c = 65535;
                    break;
                case 3453:
                    if (localName.equals("li")) {
                        c = 0;
                        break;
                    }
                    c = 65535;
                    break;
                case 80980:
                    if (localName.equals("RDF")) {
                        c = 5;
                        break;
                    }
                    c = 65535;
                    break;
                case 92611469:
                    if (localName.equals("about")) {
                        c = 3;
                        break;
                    }
                    c = 65535;
                    break;
                case 93496099:
                    if (localName.equals("bagID")) {
                        c = 11;
                        break;
                    }
                    c = 65535;
                    break;
                case 670789472:
                    if (localName.equals("aboutEachPrefix")) {
                        c = '\n';
                        break;
                    }
                    c = 65535;
                    break;
                case 1790024164:
                    if (localName.equals("datatype")) {
                        c = '\b';
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
                    return 9;
                case 1:
                    return 4;
                case 2:
                    return 8;
                case 3:
                    return 3;
                case 4:
                    return 5;
                case 5:
                    return 1;
                case 6:
                    return 2;
                case 7:
                    return 6;
                case '\b':
                    return 7;
                case '\t':
                    return 10;
                case '\n':
                    return 11;
                case 11:
                    return 12;
            }
        }
        return 0;
    }
}
