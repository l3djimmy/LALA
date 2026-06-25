package com.itextpdf.io.font.cmap;

import com.itextpdf.io.exceptions.IoExceptionMessageConstant;
import com.itextpdf.io.font.PdfEncodings;
import com.itextpdf.io.source.PdfTokenizer;
import com.itextpdf.io.util.PdfNameUtil;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import okio.Utf8;
/* loaded from: classes12.dex */
public class CMapContentParser {
    public static final int COMMAND_TYPE = 200;
    private PdfTokenizer tokeniser;

    public CMapContentParser(PdfTokenizer tokeniser) {
        this.tokeniser = tokeniser;
    }

    public void parse(List<CMapObject> ls) throws IOException {
        CMapObject ob;
        ls.clear();
        do {
            ob = readObject();
            if (ob != null) {
                ls.add(ob);
            } else {
                return;
            }
        } while (!ob.isLiteral());
    }

    public CMapObject readDictionary() throws IOException {
        Map<String, CMapObject> dic = new HashMap<>();
        while (nextValidToken()) {
            if (this.tokeniser.getTokenType() != PdfTokenizer.TokenType.EndDic) {
                if (this.tokeniser.getTokenType() != PdfTokenizer.TokenType.Other || !"def".equals(this.tokeniser.getStringValue())) {
                    if (this.tokeniser.getTokenType() != PdfTokenizer.TokenType.Name) {
                        throw new com.itextpdf.io.exceptions.IOException(KernelExceptionMessageConstant.THIS_DICTIONARY_KEY_IS_NOT_A_NAME).setMessageParams(this.tokeniser.getStringValue());
                    }
                    String name = this.tokeniser.getStringValue();
                    CMapObject obj = readObject();
                    if (obj.isToken()) {
                        if (obj.toString().equals(">>")) {
                            this.tokeniser.throwError(IoExceptionMessageConstant.UNEXPECTED_GT_GT, new Object[0]);
                        }
                        if (obj.toString().equals("]")) {
                            this.tokeniser.throwError(IoExceptionMessageConstant.UNEXPECTED_CLOSE_BRACKET, new Object[0]);
                        }
                    }
                    dic.put(name, obj);
                }
            } else {
                return new CMapObject(7, dic);
            }
        }
        throw new com.itextpdf.io.exceptions.IOException(KernelExceptionMessageConstant.UNEXPECTED_END_OF_FILE);
    }

    public CMapObject readArray() throws IOException {
        List<CMapObject> array = new ArrayList<>();
        while (true) {
            CMapObject obj = readObject();
            if (obj.isToken()) {
                if (!obj.toString().equals("]")) {
                    if (obj.toString().equals(">>")) {
                        this.tokeniser.throwError(IoExceptionMessageConstant.UNEXPECTED_GT_GT, new Object[0]);
                    }
                } else {
                    return new CMapObject(6, array);
                }
            }
            array.add(obj);
        }
    }

    public CMapObject readObject() throws IOException {
        if (nextValidToken()) {
            PdfTokenizer.TokenType type = this.tokeniser.getTokenType();
            switch (type) {
                case StartDic:
                    return readDictionary();
                case StartArray:
                    CMapObject obj = readArray();
                    return obj;
                case String:
                    if (this.tokeniser.isHexString()) {
                        CMapObject obj2 = new CMapObject(2, PdfTokenizer.decodeStringContent(this.tokeniser.getByteContent(), true));
                        return obj2;
                    }
                    CMapObject obj3 = new CMapObject(1, PdfTokenizer.decodeStringContent(this.tokeniser.getByteContent(), false));
                    return obj3;
                case Name:
                    return new CMapObject(3, PdfNameUtil.decodeName(this.tokeniser.getByteContent()));
                case Number:
                    CMapObject numObject = new CMapObject(4, null);
                    try {
                        numObject.setValue(Integer.valueOf((int) Double.parseDouble(this.tokeniser.getStringValue())));
                    } catch (NumberFormatException e) {
                        numObject.setValue(Integer.MIN_VALUE);
                    }
                    return numObject;
                case Other:
                    return new CMapObject(5, this.tokeniser.getStringValue());
                case EndArray:
                    return new CMapObject(8, "]");
                case EndDic:
                    return new CMapObject(8, ">>");
                default:
                    return new CMapObject(0, "");
            }
        }
        return null;
    }

    public boolean nextValidToken() throws IOException {
        while (this.tokeniser.nextToken()) {
            if (this.tokeniser.getTokenType() != PdfTokenizer.TokenType.Comment) {
                return true;
            }
        }
        return false;
    }

    @Deprecated
    protected static String decodeName(byte[] content) {
        return PdfNameUtil.decodeName(content);
    }

    private static String toHex4(int n) {
        String s = "0000" + Integer.toHexString(n);
        return s.substring(s.length() - 4);
    }

    public static String toHex(int n) {
        if (n < 65536) {
            return "<" + toHex4(n) + ">";
        }
        int n2 = n - 65536;
        int high = (n2 / 1024) + 55296;
        int low = (n2 % 1024) + Utf8.LOG_SURROGATE_HEADER;
        return "[<" + toHex4(high) + toHex4(low) + ">]";
    }

    public static String decodeCMapObject(CMapObject cMapObject) {
        if (cMapObject.isHexString()) {
            return PdfEncodings.convertToString(((String) cMapObject.getValue()).getBytes(), PdfEncodings.UNICODE_BIG_UNMARKED);
        }
        return (String) cMapObject.getValue();
    }
}
