package com.itextpdf.kernel.actions.events;

import com.itextpdf.commons.actions.AbstractITextConfigurationEvent;
import com.itextpdf.commons.actions.AbstractProductProcessITextEvent;
import com.itextpdf.commons.actions.EventManager;
import com.itextpdf.commons.actions.confirmations.ConfirmEvent;
import com.itextpdf.commons.actions.confirmations.ConfirmedEventWrapper;
import com.itextpdf.commons.actions.confirmations.EventConfirmationType;
import com.itextpdf.commons.actions.data.ProductData;
import com.itextpdf.commons.actions.processors.ITextProductEventProcessor;
import com.itextpdf.commons.actions.producer.ProducerBuilder;
import com.itextpdf.commons.actions.sequence.SequenceId;
import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.kernel.actions.data.ITextCoreProductData;
import com.itextpdf.kernel.logs.KernelLogMessageConstant;
import com.itextpdf.kernel.pdf.PdfDocument;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public final class FlushPdfDocumentEvent extends AbstractITextConfigurationEvent {
    private static final Logger LOGGER = LoggerFactory.getLogger(FlushPdfDocumentEvent.class);
    private final WeakReference<PdfDocument> document;

    public FlushPdfDocumentEvent(PdfDocument document) {
        this.document = new WeakReference<>(document);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.commons.actions.AbstractITextConfigurationEvent
    public void doAction() {
        PdfDocument pdfDocument = this.document.get();
        if (pdfDocument == null) {
            return;
        }
        List<AbstractProductProcessITextEvent> events = getEvents(pdfDocument.getDocumentIdWrapper());
        if (events == null || events.isEmpty()) {
            ProductData productData = ITextCoreProductData.getInstance();
            String noEventProducer = "iText® ©" + productData.getSinceCopyrightYear() + "-" + productData.getToCopyrightYear() + " Apryse Group NV (no registered products)";
            pdfDocument.getDocumentInfo().setProducer(noEventProducer);
            return;
        }
        Set<String> products = new HashSet<>();
        for (AbstractProductProcessITextEvent event : events) {
            pdfDocument.getFingerPrint().registerProduct(event.getProductData());
            if (event.getConfirmationType() == EventConfirmationType.ON_CLOSE) {
                EventManager.getInstance().onEvent(new ConfirmEvent(pdfDocument.getDocumentIdWrapper(), event));
            }
            products.add(event.getProductName());
        }
        for (String product : products) {
            ITextProductEventProcessor processor = getActiveProcessor(product);
            if (processor == null && LOGGER.isWarnEnabled()) {
                LOGGER.warn(MessageFormatUtil.format(KernelLogMessageConstant.UNKNOWN_PRODUCT_INVOLVED, product));
            }
        }
        String oldProducer = pdfDocument.getDocumentInfo().getProducer();
        String newProducer = ProducerBuilder.modifyProducer(getConfirmedEvents(pdfDocument.getDocumentIdWrapper()), oldProducer);
        pdfDocument.getDocumentInfo().setProducer(newProducer);
    }

    private List<ConfirmedEventWrapper> getConfirmedEvents(SequenceId sequenceId) {
        List<AbstractProductProcessITextEvent> events = getEvents(sequenceId);
        List<ConfirmedEventWrapper> confirmedEvents = new ArrayList<>();
        for (AbstractProductProcessITextEvent event : events) {
            if (event instanceof ConfirmedEventWrapper) {
                confirmedEvents.add((ConfirmedEventWrapper) event);
            } else {
                LOGGER.warn(MessageFormatUtil.format(KernelLogMessageConstant.UNCONFIRMED_EVENT, event.getProductName(), event.getEventType()));
            }
        }
        return confirmedEvents;
    }
}
