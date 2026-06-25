package com.itextpdf.kernel.actions.events;

import com.itextpdf.commons.actions.AbstractITextConfigurationEvent;
import com.itextpdf.commons.actions.AbstractProductProcessITextEvent;
import com.itextpdf.commons.actions.sequence.AbstractIdentifiableElement;
import com.itextpdf.commons.actions.sequence.SequenceId;
import com.itextpdf.commons.actions.sequence.SequenceIdManager;
import com.itextpdf.kernel.pdf.PdfDocument;
import java.lang.ref.WeakReference;
import java.util.List;
/* loaded from: classes12.dex */
public final class LinkDocumentIdEvent extends AbstractITextConfigurationEvent {
    private final WeakReference<PdfDocument> document;
    private final WeakReference<SequenceId> sequenceId;

    public LinkDocumentIdEvent(PdfDocument document, SequenceId sequenceId) {
        this.document = new WeakReference<>(document);
        this.sequenceId = new WeakReference<>(sequenceId);
    }

    public LinkDocumentIdEvent(PdfDocument document, AbstractIdentifiableElement identifiableElement) {
        this(document, identifiableElement == null ? null : SequenceIdManager.getSequenceId(identifiableElement));
    }

    @Override // com.itextpdf.commons.actions.AbstractITextConfigurationEvent
    public void doAction() {
        List<AbstractProductProcessITextEvent> anonymousEvents;
        SequenceId storedSequenceId = this.sequenceId.get();
        PdfDocument storedPdfDocument = this.document.get();
        if (storedSequenceId != null && storedPdfDocument != null && (anonymousEvents = getEvents(storedSequenceId)) != null) {
            SequenceId documentId = storedPdfDocument.getDocumentIdWrapper();
            for (AbstractProductProcessITextEvent event : anonymousEvents) {
                List<AbstractProductProcessITextEvent> storedEvents = getEvents(documentId);
                if (!storedEvents.contains(event)) {
                    addEvent(documentId, event);
                }
            }
        }
    }
}
