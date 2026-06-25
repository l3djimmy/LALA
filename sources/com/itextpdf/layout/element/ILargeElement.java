package com.itextpdf.layout.element;

import com.itextpdf.layout.Document;
/* loaded from: classes12.dex */
public interface ILargeElement extends IElement {
    void complete();

    void flush();

    void flushContent();

    boolean isComplete();

    void setDocument(Document document);
}
