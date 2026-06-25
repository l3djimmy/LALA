package com.itextpdf.kernel.xmp.impl;

import com.itextpdf.kernel.xmp.XMPConst;
import com.itextpdf.kernel.xmp.XMPException;
import com.itextpdf.kernel.xmp.XMPMeta;
import com.itextpdf.kernel.xmp.XMPMetaFactory;
import com.itextpdf.kernel.xmp.impl.xpath.XMPPath;
import com.itextpdf.kernel.xmp.impl.xpath.XMPPathParser;
import com.itextpdf.kernel.xmp.options.PropertyOptions;
import com.itextpdf.kernel.xmp.properties.XMPAliasInfo;
import java.util.Iterator;
import kotlin.text.Typography;
/* loaded from: classes12.dex */
public final class XMPUtilsImpl implements XMPConst {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private static final String COMMAS = ",，､﹐﹑、،՝";
    private static final String CONTROLS = "\u2028\u2029";
    private static final String QUOTES = "\"«»〝〞〟―‹›";
    private static final String SEMICOLA = ";；﹔؛;";
    private static final String SPACES = " \u3000〿";
    private static final int UCK_COMMA = 2;
    private static final int UCK_CONTROL = 5;
    private static final int UCK_NORMAL = 0;
    private static final int UCK_QUOTE = 4;
    private static final int UCK_SEMICOLON = 3;
    private static final int UCK_SPACE = 1;

    private XMPUtilsImpl() {
    }

    public static String catenateArrayItems(XMPMeta xmp, String schemaNS, String arrayName, String separator, String quotes, boolean allowCommas) throws XMPException {
        ParameterAsserts.assertSchemaNS(schemaNS);
        ParameterAsserts.assertArrayName(arrayName);
        ParameterAsserts.assertImplementation(xmp);
        String separator2 = (separator == null || separator.length() == 0) ? "; " : separator;
        String quotes2 = (quotes == null || quotes.length() == 0) ? "\"" : quotes;
        XMPMetaImpl xmpImpl = (XMPMetaImpl) xmp;
        XMPPath arrayPath = XMPPathParser.expandXPath(schemaNS, arrayName);
        XMPNode arrayNode = XMPNodeUtils.findNode(xmpImpl.getRoot(), arrayPath, false, null);
        if (arrayNode == null) {
            return "";
        }
        if (!arrayNode.getOptions().isArray() || arrayNode.getOptions().isArrayAlternate()) {
            throw new XMPException("Named property must be non-alternate array", 4);
        }
        checkSeparator(separator2);
        char openQuote = quotes2.charAt(0);
        char closeQuote = checkQuotes(quotes2, openQuote);
        StringBuffer catinatedString = new StringBuffer();
        Iterator it = arrayNode.iterateChildren();
        while (it.hasNext()) {
            XMPNode currItem = (XMPNode) it.next();
            if (currItem.getOptions().isCompositeProperty()) {
                throw new XMPException("Array items must be simple", 4);
            }
            String str = applyQuotes(currItem.getValue(), openQuote, closeQuote, allowCommas);
            catinatedString.append(str);
            if (it.hasNext()) {
                catinatedString.append(separator2);
            }
        }
        return catinatedString.toString();
    }

    public static void separateArrayItems(XMPMeta xmp, String schemaNS, String arrayName, String catedStr, PropertyOptions arrayOptions, boolean preserveCommas) throws XMPException {
        String itemValue;
        String str;
        char nextChar;
        int nextKind;
        String str2 = catedStr;
        ParameterAsserts.assertSchemaNS(schemaNS);
        ParameterAsserts.assertArrayName(arrayName);
        int i = 4;
        if (str2 == null) {
            throw new XMPException("Parameter must not be null", 4);
        }
        ParameterAsserts.assertImplementation(xmp);
        XMPMetaImpl xmpImpl = (XMPMetaImpl) xmp;
        XMPNode arrayNode = separateFindCreateArray(schemaNS, arrayName, arrayOptions, xmpImpl);
        int charKind = 0;
        char ch = 0;
        int itemEnd = 0;
        int endPos = str2.length();
        while (itemEnd < endPos) {
            int itemStart = itemEnd;
            while (itemStart < endPos) {
                ch = str2.charAt(itemStart);
                charKind = classifyCharacter(ch);
                if (charKind == 0 || charKind == i) {
                    break;
                }
                itemStart++;
            }
            if (itemStart < endPos) {
                if (charKind != i) {
                    itemEnd = itemStart;
                    while (itemEnd < endPos) {
                        ch = str2.charAt(itemEnd);
                        charKind = classifyCharacter(ch);
                        if (charKind != 0 && charKind != i && ((charKind != 2 || !preserveCommas) && (charKind != 1 || itemEnd + 1 >= endPos || ((nextKind = classifyCharacter((ch = str2.charAt(itemEnd + 1)))) != 0 && nextKind != i && (nextKind != 2 || !preserveCommas))))) {
                            break;
                        }
                        itemEnd++;
                    }
                    itemValue = str2.substring(itemStart, itemEnd);
                } else {
                    char openQuote = ch;
                    char closeQuote = getClosingQuote(openQuote);
                    itemEnd = itemStart + 1;
                    itemValue = "";
                    while (true) {
                        if (itemEnd >= endPos) {
                            break;
                        }
                        ch = str2.charAt(itemEnd);
                        charKind = classifyCharacter(ch);
                        if (charKind != i || !isSurroundingQuote(ch, openQuote, closeQuote)) {
                            str = itemValue + ch;
                        } else {
                            if (itemEnd + 1 < endPos) {
                                nextChar = str2.charAt(itemEnd + 1);
                                classifyCharacter(nextChar);
                            } else {
                                nextChar = ';';
                            }
                            if (ch == nextChar) {
                                str = itemValue + ch;
                                itemEnd++;
                            } else if (!isClosingingQuote(ch, openQuote, closeQuote)) {
                                str = itemValue + ch;
                            } else {
                                itemEnd++;
                                break;
                            }
                        }
                        itemValue = str;
                        itemEnd++;
                        str2 = catedStr;
                        i = 4;
                    }
                }
                int foundIndex = -1;
                int oldChild = 1;
                while (true) {
                    if (oldChild > arrayNode.getChildrenLength()) {
                        break;
                    } else if (!itemValue.equals(arrayNode.getChild(oldChild).getValue())) {
                        oldChild++;
                    } else {
                        foundIndex = oldChild;
                        break;
                    }
                }
                if (foundIndex < 0) {
                    XMPNode newItem = new XMPNode("[]", itemValue, null);
                    arrayNode.addChild(newItem);
                }
                str2 = catedStr;
                i = 4;
            } else {
                return;
            }
        }
    }

    private static XMPNode separateFindCreateArray(String schemaNS, String arrayName, PropertyOptions arrayOptions, XMPMetaImpl xmp) throws XMPException {
        PropertyOptions arrayOptions2 = XMPNodeUtils.verifySetOptions(arrayOptions, null);
        if (!arrayOptions2.isOnlyArrayOptions()) {
            throw new XMPException("Options can only provide array form", 103);
        }
        XMPPath arrayPath = XMPPathParser.expandXPath(schemaNS, arrayName);
        XMPNode arrayNode = XMPNodeUtils.findNode(xmp.getRoot(), arrayPath, false, null);
        if (arrayNode != null) {
            PropertyOptions arrayForm = arrayNode.getOptions();
            if (!arrayForm.isArray() || arrayForm.isArrayAlternate()) {
                throw new XMPException("Named property must be non-alternate array", 102);
            }
            if (arrayOptions2.equalArrayTypes(arrayForm)) {
                throw new XMPException("Mismatch of specified and existing array form", 102);
            }
        } else {
            arrayNode = XMPNodeUtils.findNode(xmp.getRoot(), arrayPath, true, arrayOptions2.setArray(true));
            if (arrayNode == null) {
                throw new XMPException("Failed to create named array", 102);
            }
        }
        return arrayNode;
    }

    public static void removeProperties(XMPMeta xmp, String schemaNS, String propName, boolean doAllProperties, boolean includeAliases) throws XMPException {
        ParameterAsserts.assertImplementation(xmp);
        XMPMetaImpl xmpImpl = (XMPMetaImpl) xmp;
        if (propName != null && propName.length() > 0) {
            if (schemaNS == null || schemaNS.length() == 0) {
                throw new XMPException("Property name requires schema namespace", 4);
            }
            XMPPath expPath = XMPPathParser.expandXPath(schemaNS, propName);
            XMPNode propNode = XMPNodeUtils.findNode(xmpImpl.getRoot(), expPath, false, null);
            if (propNode != null) {
                if (doAllProperties || !Utils.isInternalProperty(expPath.getSegment(0).getName(), expPath.getSegment(1).getName())) {
                    XMPNode parent = propNode.getParent();
                    parent.removeChild(propNode);
                    if (parent.getOptions().isSchemaNode() && !parent.hasChildren()) {
                        parent.getParent().removeChild(parent);
                    }
                }
            }
        } else if (schemaNS != null && schemaNS.length() > 0) {
            XMPNode schemaNode = XMPNodeUtils.findSchemaNode(xmpImpl.getRoot(), schemaNS, false);
            if (schemaNode != null && removeSchemaChildren(schemaNode, doAllProperties)) {
                xmpImpl.getRoot().removeChild(schemaNode);
            }
            if (includeAliases) {
                XMPAliasInfo[] aliases = XMPMetaFactory.getSchemaRegistry().findAliases(schemaNS);
                for (XMPAliasInfo info : aliases) {
                    XMPPath path = XMPPathParser.expandXPath(info.getNamespace(), info.getPropName());
                    XMPNode actualProp = XMPNodeUtils.findNode(xmpImpl.getRoot(), path, false, null);
                    if (actualProp != null) {
                        actualProp.getParent().removeChild(actualProp);
                    }
                }
            }
        } else {
            Iterator it = xmpImpl.getRoot().iterateChildren();
            while (it.hasNext()) {
                XMPNode schema = (XMPNode) it.next();
                if (removeSchemaChildren(schema, doAllProperties)) {
                    it.remove();
                }
            }
        }
    }

    public static void appendProperties(XMPMeta source, XMPMeta destination, boolean doAllProperties, boolean replaceOldValues, boolean deleteEmptyValues) throws XMPException {
        ParameterAsserts.assertImplementation(source);
        ParameterAsserts.assertImplementation(destination);
        XMPMetaImpl src = (XMPMetaImpl) source;
        XMPMetaImpl dest = (XMPMetaImpl) destination;
        Iterator it = src.getRoot().iterateChildren();
        while (it.hasNext()) {
            XMPNode sourceSchema = (XMPNode) it.next();
            XMPNode destSchema = XMPNodeUtils.findSchemaNode(dest.getRoot(), sourceSchema.getName(), false);
            boolean createdSchema = false;
            if (destSchema == null) {
                destSchema = new XMPNode(sourceSchema.getName(), sourceSchema.getValue(), new PropertyOptions().setSchemaNode(true));
                dest.getRoot().addChild(destSchema);
                createdSchema = true;
            }
            Iterator ic = sourceSchema.iterateChildren();
            while (ic.hasNext()) {
                XMPNode sourceProp = (XMPNode) ic.next();
                if (doAllProperties || !Utils.isInternalProperty(sourceSchema.getName(), sourceProp.getName())) {
                    appendSubtree(dest, sourceProp, destSchema, replaceOldValues, deleteEmptyValues);
                }
            }
            if (!destSchema.hasChildren() && (createdSchema || deleteEmptyValues)) {
                dest.getRoot().removeChild(destSchema);
            }
        }
    }

    private static boolean removeSchemaChildren(XMPNode schemaNode, boolean doAllProperties) {
        Iterator it = schemaNode.iterateChildren();
        while (it.hasNext()) {
            XMPNode currProp = (XMPNode) it.next();
            if (doAllProperties || !Utils.isInternalProperty(schemaNode.getName(), currProp.getName())) {
                it.remove();
            }
        }
        return !schemaNode.hasChildren();
    }

    private static void appendSubtree(XMPMetaImpl destXMP, XMPNode sourceNode, XMPNode destParent, boolean replaceOldValues, boolean deleteEmptyValues) throws XMPException {
        boolean z = false;
        XMPNode destNode = XMPNodeUtils.findChildNode(destParent, sourceNode.getName(), false);
        boolean valueIsEmpty = false;
        if (deleteEmptyValues) {
            if (sourceNode.getOptions().isSimple()) {
                if (sourceNode.getValue() == null || sourceNode.getValue().length() == 0) {
                    z = true;
                }
            } else if (!sourceNode.hasChildren()) {
                z = true;
            }
            valueIsEmpty = z;
        }
        if (deleteEmptyValues && valueIsEmpty) {
            if (destNode != null) {
                destParent.removeChild(destNode);
            }
        } else if (destNode == null) {
            destParent.addChild((XMPNode) sourceNode.clone());
        } else if (replaceOldValues) {
            destXMP.setNode(destNode, sourceNode.getValue(), sourceNode.getOptions(), true);
            destParent.removeChild(destNode);
            destParent.addChild((XMPNode) sourceNode.clone());
        } else {
            PropertyOptions sourceForm = sourceNode.getOptions();
            PropertyOptions destForm = destNode.getOptions();
            if (sourceForm != destForm) {
                return;
            }
            if (sourceForm.isStruct()) {
                Iterator it = sourceNode.iterateChildren();
                while (it.hasNext()) {
                    XMPNode sourceField = (XMPNode) it.next();
                    appendSubtree(destXMP, sourceField, destNode, replaceOldValues, deleteEmptyValues);
                    if (deleteEmptyValues && !destNode.hasChildren()) {
                        destParent.removeChild(destNode);
                    }
                }
            } else if (sourceForm.isArrayAltText()) {
                Iterator it2 = sourceNode.iterateChildren();
                while (it2.hasNext()) {
                    XMPNode sourceItem = (XMPNode) it2.next();
                    if (sourceItem.hasQualifier() && XMPConst.XML_LANG.equals(sourceItem.getQualifier(1).getName())) {
                        int destIndex = XMPNodeUtils.lookupLanguageItem(destNode, sourceItem.getQualifier(1).getValue());
                        if (deleteEmptyValues && (sourceItem.getValue() == null || sourceItem.getValue().length() == 0)) {
                            if (destIndex != -1) {
                                destNode.removeChild(destIndex);
                                if (!destNode.hasChildren()) {
                                    destParent.removeChild(destNode);
                                }
                            }
                        } else if (destIndex == -1) {
                            if (!XMPConst.X_DEFAULT.equals(sourceItem.getQualifier(1).getValue()) || !destNode.hasChildren()) {
                                sourceItem.cloneSubtree(destNode);
                            } else {
                                XMPNode destItem = new XMPNode(sourceItem.getName(), sourceItem.getValue(), sourceItem.getOptions());
                                sourceItem.cloneSubtree(destItem);
                                destNode.addChild(1, destItem);
                            }
                        }
                    }
                }
            } else if (sourceForm.isArray()) {
                Iterator is = sourceNode.iterateChildren();
                while (is.hasNext()) {
                    XMPNode sourceItem2 = (XMPNode) is.next();
                    boolean match = false;
                    Iterator id = destNode.iterateChildren();
                    while (id.hasNext()) {
                        if (itemValuesMatch(sourceItem2, (XMPNode) id.next())) {
                            match = true;
                        }
                    }
                    if (!match) {
                        destNode = (XMPNode) sourceItem2.clone();
                        destParent.addChild(destNode);
                    }
                }
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x0075  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static boolean itemValuesMatch(com.itextpdf.kernel.xmp.impl.XMPNode r10, com.itextpdf.kernel.xmp.impl.XMPNode r11) throws com.itextpdf.kernel.xmp.XMPException {
        /*
            com.itextpdf.kernel.xmp.options.PropertyOptions r0 = r10.getOptions()
            com.itextpdf.kernel.xmp.options.PropertyOptions r1 = r11.getOptions()
            boolean r2 = r0.equals(r1)
            r3 = 0
            if (r2 == 0) goto L10
            return r3
        L10:
            int r2 = r0.getOptions()
            r4 = 1
            if (r2 != 0) goto L5a
            java.lang.String r2 = r10.getValue()
            java.lang.String r5 = r11.getValue()
            boolean r2 = r2.equals(r5)
            if (r2 != 0) goto L26
            return r3
        L26:
            com.itextpdf.kernel.xmp.options.PropertyOptions r2 = r10.getOptions()
            boolean r2 = r2.getHasLanguage()
            com.itextpdf.kernel.xmp.options.PropertyOptions r5 = r11.getOptions()
            boolean r5 = r5.getHasLanguage()
            if (r2 == r5) goto L39
            return r3
        L39:
            com.itextpdf.kernel.xmp.options.PropertyOptions r2 = r10.getOptions()
            boolean r2 = r2.getHasLanguage()
            if (r2 == 0) goto Lc3
            com.itextpdf.kernel.xmp.impl.XMPNode r2 = r10.getQualifier(r4)
            java.lang.String r2 = r2.getValue()
            com.itextpdf.kernel.xmp.impl.XMPNode r5 = r11.getQualifier(r4)
            java.lang.String r5 = r5.getValue()
            boolean r2 = r2.equals(r5)
            if (r2 != 0) goto Lc3
            return r3
        L5a:
            boolean r2 = r0.isStruct()
            if (r2 == 0) goto L8f
            int r2 = r10.getChildrenLength()
            int r5 = r11.getChildrenLength()
            if (r2 == r5) goto L6b
            return r3
        L6b:
            java.util.Iterator r2 = r10.iterateChildren()
        L6f:
            boolean r5 = r2.hasNext()
            if (r5 == 0) goto L8e
            java.lang.Object r5 = r2.next()
            com.itextpdf.kernel.xmp.impl.XMPNode r5 = (com.itextpdf.kernel.xmp.impl.XMPNode) r5
            java.lang.String r6 = r5.getName()
            com.itextpdf.kernel.xmp.impl.XMPNode r6 = com.itextpdf.kernel.xmp.impl.XMPNodeUtils.findChildNode(r11, r6, r3)
            if (r6 == 0) goto L8d
            boolean r7 = itemValuesMatch(r5, r6)
            if (r7 != 0) goto L8c
            goto L8d
        L8c:
            goto L6f
        L8d:
            return r3
        L8e:
            goto Lc3
        L8f:
            boolean r2 = r0.isArray()
            if (r2 == 0) goto Lc4
            java.util.Iterator r2 = r10.iterateChildren()
        L99:
            boolean r5 = r2.hasNext()
            if (r5 == 0) goto Lc3
            java.lang.Object r5 = r2.next()
            com.itextpdf.kernel.xmp.impl.XMPNode r5 = (com.itextpdf.kernel.xmp.impl.XMPNode) r5
            r6 = 0
            java.util.Iterator r7 = r11.iterateChildren()
        Laa:
            boolean r8 = r7.hasNext()
            if (r8 == 0) goto Lbf
            java.lang.Object r8 = r7.next()
            com.itextpdf.kernel.xmp.impl.XMPNode r8 = (com.itextpdf.kernel.xmp.impl.XMPNode) r8
            boolean r9 = itemValuesMatch(r5, r8)
            if (r9 == 0) goto Lbe
            r6 = 1
            goto Lbf
        Lbe:
            goto Laa
        Lbf:
            if (r6 != 0) goto Lc2
            return r3
        Lc2:
            goto L99
        Lc3:
            return r4
        Lc4:
            java.lang.AssertionError r2 = new java.lang.AssertionError
            r2.<init>()
            throw r2
        */
        throw new UnsupportedOperationException("Method not decompiled: com.itextpdf.kernel.xmp.impl.XMPUtilsImpl.itemValuesMatch(com.itextpdf.kernel.xmp.impl.XMPNode, com.itextpdf.kernel.xmp.impl.XMPNode):boolean");
    }

    private static void checkSeparator(String separator) throws XMPException {
        boolean haveSemicolon = false;
        for (int i = 0; i < separator.length(); i++) {
            int charKind = classifyCharacter(separator.charAt(i));
            if (charKind == 3) {
                if (haveSemicolon) {
                    throw new XMPException("Separator can have only one semicolon", 4);
                }
                haveSemicolon = true;
            } else if (charKind != 1) {
                throw new XMPException("Separator can have only spaces and one semicolon", 4);
            }
        }
        if (!haveSemicolon) {
            throw new XMPException("Separator must have one semicolon", 4);
        }
    }

    private static char checkQuotes(String quotes, char openQuote) throws XMPException {
        char closeQuote;
        int charKind = classifyCharacter(openQuote);
        if (charKind != 4) {
            throw new XMPException("Invalid quoting character", 4);
        }
        if (quotes.length() == 1) {
            closeQuote = openQuote;
        } else {
            char closeQuote2 = quotes.charAt(1);
            int charKind2 = classifyCharacter(closeQuote2);
            if (charKind2 != 4) {
                throw new XMPException("Invalid quoting character", 4);
            }
            closeQuote = closeQuote2;
        }
        if (closeQuote != getClosingQuote(openQuote)) {
            throw new XMPException("Mismatched quote pair", 4);
        }
        return closeQuote;
    }

    private static int classifyCharacter(char ch) {
        if (SPACES.indexOf(ch) < 0) {
            if (8192 <= ch && ch <= 8203) {
                return 1;
            }
            if (COMMAS.indexOf(ch) >= 0) {
                return 2;
            }
            if (SEMICOLA.indexOf(ch) >= 0) {
                return 3;
            }
            if (QUOTES.indexOf(ch) < 0) {
                if (12296 > ch || ch > 12303) {
                    if (8216 <= ch && ch <= 8223) {
                        return 4;
                    }
                    if (ch < ' ' || CONTROLS.indexOf(ch) >= 0) {
                        return 5;
                    }
                    return 0;
                }
                return 4;
            }
            return 4;
        }
        return 1;
    }

    private static char getClosingQuote(char openQuote) {
        switch (openQuote) {
            case '\"':
                return Typography.quote;
            case 171:
                return (char) 187;
            case 187:
                return (char) 171;
            case 8213:
                return (char) 8213;
            case 8216:
                return Typography.rightSingleQuote;
            case 8218:
                return (char) 8219;
            case 8220:
                return Typography.rightDoubleQuote;
            case 8222:
                return (char) 8223;
            case 8249:
                return (char) 8250;
            case 8250:
                return (char) 8249;
            case 12296:
                return (char) 12297;
            case 12298:
                return (char) 12299;
            case 12300:
                return (char) 12301;
            case 12302:
                return (char) 12303;
            case 12317:
                return (char) 12319;
            default:
                return (char) 0;
        }
    }

    private static String applyQuotes(String item, char openQuote, char closeQuote, boolean allowCommas) {
        if (item == null) {
            item = "";
        }
        boolean prevSpace = false;
        int i = 0;
        while (i < item.length()) {
            char ch = item.charAt(i);
            int charKind = classifyCharacter(ch);
            if (i == 0 && charKind == 4) {
                break;
            } else if (charKind == 1) {
                if (prevSpace) {
                    break;
                }
                prevSpace = true;
                i++;
            } else {
                prevSpace = false;
                if (charKind == 3) {
                    break;
                } else if (charKind == 5) {
                    break;
                } else {
                    if (charKind == 2 && !allowCommas) {
                        break;
                    }
                    i++;
                }
            }
        }
        if (i < item.length()) {
            StringBuffer newItem = new StringBuffer(item.length() + 2);
            int splitPoint = 0;
            while (splitPoint <= i && classifyCharacter(item.charAt(i)) != 4) {
                splitPoint++;
            }
            newItem.append(openQuote).append(item.substring(0, splitPoint));
            for (int charOffset = splitPoint; charOffset < item.length(); charOffset++) {
                newItem.append(item.charAt(charOffset));
                if (classifyCharacter(item.charAt(charOffset)) == 4 && isSurroundingQuote(item.charAt(charOffset), openQuote, closeQuote)) {
                    newItem.append(item.charAt(charOffset));
                }
            }
            newItem.append(closeQuote);
            return newItem.toString();
        }
        return item;
    }

    private static boolean isSurroundingQuote(char ch, char openQuote, char closeQuote) {
        return ch == openQuote || isClosingingQuote(ch, openQuote, closeQuote);
    }

    private static boolean isClosingingQuote(char ch, char openQuote, char closeQuote) {
        return ch == closeQuote || (openQuote == 12317 && ch == 12318) || ch == 12319;
    }
}
