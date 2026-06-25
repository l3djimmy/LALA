package com.itextpdf.kernel.pdf;

import com.itextpdf.io.font.PdfEncodings;
import com.itextpdf.kernel.xmp.PdfConst;
import com.itextpdf.kernel.xmp.XMPConst;
import com.itextpdf.kernel.xmp.XMPException;
import com.itextpdf.kernel.xmp.XMPMeta;
import com.itextpdf.kernel.xmp.XMPMetaFactory;
import com.itextpdf.kernel.xmp.options.PropertyOptions;
import com.itextpdf.kernel.xmp.properties.XMPProperty;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes12.dex */
public class XmpMetaInfoConverter {
    private XmpMetaInfoConverter() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void appendMetadataToInfo(byte[] xmpMetadata, PdfDocumentInfo info) {
        if (xmpMetadata != null) {
            try {
                XMPMeta meta = XMPMetaFactory.parseFromBuffer(xmpMetadata);
                XMPProperty title = meta.getLocalizedText(XMPConst.NS_DC, "title", XMPConst.X_DEFAULT, XMPConst.X_DEFAULT);
                if (title != null) {
                    info.setTitle(title.getValue());
                }
                String author = fetchArrayIntoString(meta, XMPConst.NS_DC, PdfConst.Creator);
                if (author != null) {
                    info.setAuthor(author);
                }
                XMPProperty keywords = meta.getProperty(XMPConst.NS_PDF, PdfConst.Keywords);
                if (keywords != null) {
                    info.setKeywords(keywords.getValue());
                } else {
                    String keywordsStr = fetchArrayIntoString(meta, XMPConst.NS_DC, PdfConst.Subject);
                    if (keywordsStr != null) {
                        info.setKeywords(keywordsStr);
                    }
                }
                XMPProperty subject = meta.getLocalizedText(XMPConst.NS_DC, PdfConst.Description, XMPConst.X_DEFAULT, XMPConst.X_DEFAULT);
                if (subject != null) {
                    info.setSubject(subject.getValue());
                }
                XMPProperty creator = meta.getProperty(XMPConst.NS_XMP, PdfConst.CreatorTool);
                if (creator != null) {
                    info.setCreator(creator.getValue());
                }
                XMPProperty producer = meta.getProperty(XMPConst.NS_PDF, PdfConst.Producer);
                if (producer != null) {
                    info.put(PdfName.Producer, new PdfString(producer.getValue(), PdfEncodings.UNICODE_BIG));
                }
                XMPProperty trapped = meta.getProperty(XMPConst.NS_PDF, PdfConst.Trapped);
                if (trapped != null) {
                    info.setTrapped(new PdfName(trapped.getValue()));
                }
            } catch (XMPException e) {
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void appendDocumentInfoToMetadata(PdfDocumentInfo info, XMPMeta xmpMeta) throws XMPException {
        String value;
        PdfDictionary docInfo = info.getPdfObject();
        if (docInfo != null) {
            for (PdfName pdfName : docInfo.keySet()) {
                PdfObject obj = docInfo.get(pdfName);
                if (obj != null) {
                    if (obj.isString()) {
                        value = ((PdfString) obj).toUnicodeString();
                    } else if (obj.isName()) {
                        value = ((PdfName) obj).getValue();
                    }
                    if (!PdfName.Title.equals(pdfName)) {
                        int i = 0;
                        if (!PdfName.Author.equals(pdfName)) {
                            if (!PdfName.Subject.equals(pdfName)) {
                                if (!PdfName.Keywords.equals(pdfName)) {
                                    if (!PdfName.Creator.equals(pdfName)) {
                                        if (!PdfName.Producer.equals(pdfName)) {
                                            if (!PdfName.CreationDate.equals(pdfName)) {
                                                if (!PdfName.ModDate.equals(pdfName)) {
                                                    if (PdfName.Trapped.equals(pdfName)) {
                                                        xmpMeta.setProperty(XMPConst.NS_PDF, PdfConst.Trapped, value);
                                                    }
                                                } else {
                                                    xmpMeta.setProperty(XMPConst.NS_XMP, PdfConst.ModifyDate, PdfDate.getW3CDate(value));
                                                }
                                            } else {
                                                xmpMeta.setProperty(XMPConst.NS_XMP, PdfConst.CreateDate, PdfDate.getW3CDate(value));
                                            }
                                        } else {
                                            xmpMeta.setProperty(XMPConst.NS_PDF, PdfConst.Producer, value);
                                        }
                                    } else {
                                        xmpMeta.setProperty(XMPConst.NS_XMP, PdfConst.CreatorTool, value);
                                    }
                                } else {
                                    String[] split = value.split(",|;");
                                    int length = split.length;
                                    while (i < length) {
                                        String v = split[i];
                                        if (v.trim().length() > 0) {
                                            appendArrayItemIfDoesNotExist(xmpMeta, XMPConst.NS_DC, PdfConst.Subject, v.trim(), 512);
                                        }
                                        i++;
                                    }
                                    xmpMeta.setProperty(XMPConst.NS_PDF, PdfConst.Keywords, value);
                                }
                            } else {
                                xmpMeta.setLocalizedText(XMPConst.NS_DC, PdfConst.Description, XMPConst.X_DEFAULT, XMPConst.X_DEFAULT, value);
                            }
                        } else {
                            String[] split2 = value.split(",|;");
                            int length2 = split2.length;
                            while (i < length2) {
                                String v2 = split2[i];
                                if (v2.trim().length() > 0) {
                                    appendArrayItemIfDoesNotExist(xmpMeta, XMPConst.NS_DC, PdfConst.Creator, v2.trim(), 1024);
                                }
                                i++;
                            }
                        }
                    } else {
                        xmpMeta.setLocalizedText(XMPConst.NS_DC, "title", XMPConst.X_DEFAULT, XMPConst.X_DEFAULT, value);
                    }
                }
            }
        }
    }

    private static void appendArrayItemIfDoesNotExist(XMPMeta meta, String ns, String arrayName, String value, int arrayOption) throws XMPException {
        int currentCnt = meta.countArrayItems(ns, arrayName);
        for (int i = 0; i < currentCnt; i++) {
            XMPProperty item = meta.getArrayItem(ns, arrayName, i + 1);
            if (value.equals(item.getValue())) {
                return;
            }
        }
        meta.appendArrayItem(ns, arrayName, new PropertyOptions(arrayOption), value, null);
    }

    private static String fetchArrayIntoString(XMPMeta meta, String ns, String arrayName) throws XMPException {
        int keywordsCnt = meta.countArrayItems(ns, arrayName);
        StringBuilder sb = null;
        for (int i = 0; i < keywordsCnt; i++) {
            XMPProperty curKeyword = meta.getArrayItem(ns, arrayName, i + 1);
            if (sb == null) {
                sb = new StringBuilder();
            } else if (sb.length() > 0) {
                sb.append("; ");
            }
            sb.append(curKeyword.getValue());
        }
        if (sb != null) {
            return sb.toString();
        }
        return null;
    }
}
