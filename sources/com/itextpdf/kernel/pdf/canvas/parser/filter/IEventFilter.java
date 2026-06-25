package com.itextpdf.kernel.pdf.canvas.parser.filter;

import com.itextpdf.kernel.pdf.canvas.parser.EventType;
import com.itextpdf.kernel.pdf.canvas.parser.data.IEventData;
/* loaded from: classes12.dex */
public interface IEventFilter {
    boolean accept(IEventData iEventData, EventType eventType);
}
