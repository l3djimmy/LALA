package com.itextpdf.commons.actions;

import com.itextpdf.commons.actions.confirmations.ConfirmEvent;
import com.itextpdf.commons.actions.confirmations.ConfirmedEventWrapper;
import com.itextpdf.commons.actions.contexts.UnknownContext;
import com.itextpdf.commons.actions.processors.ITextProductEventProcessor;
import com.itextpdf.commons.actions.sequence.SequenceId;
import com.itextpdf.commons.exceptions.ProductEventHandlerRepeatException;
import com.itextpdf.commons.exceptions.UnknownProductException;
import com.itextpdf.commons.logs.CommonsLogMessageConstant;
import com.itextpdf.commons.utils.MessageFormatUtil;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
final class ProductEventHandler extends AbstractContextBasedEventHandler {
    static final ProductEventHandler INSTANCE = new ProductEventHandler();
    private static final Logger LOGGER = LoggerFactory.getLogger(ProductEventHandler.class);
    private static final int MAX_EVENT_RETRY_COUNT = 4;
    private final WeakHashMap<SequenceId, List<AbstractProductProcessITextEvent>> events;
    private final ConcurrentHashMap<String, ITextProductEventProcessor> processors;

    private ProductEventHandler() {
        super(UnknownContext.PERMISSIVE);
        this.processors = new ConcurrentHashMap<>();
        this.events = new WeakHashMap<>();
    }

    @Override // com.itextpdf.commons.actions.AbstractContextBasedEventHandler
    protected void onAcceptedEvent(AbstractContextBasedITextEvent event) {
        for (int i = 0; i < 4; i++) {
            try {
                tryProcessEvent(event);
                return;
            } catch (ProductEventHandlerRepeatException e) {
            }
        }
        tryProcessEvent(event);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public ITextProductEventProcessor addProcessor(ITextProductEventProcessor processor) {
        return this.processors.put(processor.getProductName(), processor);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public ITextProductEventProcessor removeProcessor(String productName) {
        return this.processors.remove(productName);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public ITextProductEventProcessor getActiveProcessor(String productName) {
        ITextProductEventProcessor processor = this.processors.get(productName);
        if (processor != null) {
            return processor;
        }
        if (ProductNameConstant.PRODUCT_NAMES.contains(productName)) {
            ITextProductEventProcessor processor2 = ProductProcessorFactoryKeeper.getProductProcessorFactory().createProcessor(productName);
            this.processors.put(productName, processor2);
            return processor2;
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Map<String, ITextProductEventProcessor> getProcessors() {
        return Collections.unmodifiableMap(new HashMap(this.processors));
    }

    void clearProcessors() {
        this.processors.clear();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public List<AbstractProductProcessITextEvent> getEvents(SequenceId id) {
        synchronized (this.events) {
            List<AbstractProductProcessITextEvent> listOfEvents = this.events.get(id);
            if (listOfEvents == null) {
                return Collections.emptyList();
            }
            return Collections.unmodifiableList(new ArrayList(listOfEvents));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void addEvent(SequenceId id, AbstractProductProcessITextEvent event) {
        synchronized (this.events) {
            List<AbstractProductProcessITextEvent> listOfEvents = this.events.get(id);
            if (listOfEvents == null) {
                listOfEvents = new ArrayList();
                this.events.put(id, listOfEvents);
            }
            listOfEvents.add(event);
        }
    }

    private void tryProcessEvent(AbstractContextBasedITextEvent event) {
        if (!(event instanceof AbstractProductProcessITextEvent)) {
            return;
        }
        AbstractProductProcessITextEvent productEvent = (AbstractProductProcessITextEvent) event;
        String productName = productEvent.getProductName();
        ITextProductEventProcessor productEventProcessor = getActiveProcessor(productName);
        if (productEventProcessor == null) {
            throw new UnknownProductException(MessageFormatUtil.format(UnknownProductException.UNKNOWN_PRODUCT, productName));
        }
        productEventProcessor.onEvent(productEvent);
        if (productEvent.getSequenceId() != null) {
            if (productEvent instanceof ConfirmEvent) {
                wrapConfirmedEvent((ConfirmEvent) productEvent, productEventProcessor);
            } else {
                addEvent(productEvent.getSequenceId(), productEvent);
            }
        }
    }

    private void wrapConfirmedEvent(ConfirmEvent event, ITextProductEventProcessor productEventProcessor) {
        synchronized (this.events) {
            List<AbstractProductProcessITextEvent> eventsList = this.events.get(event.getSequenceId());
            AbstractProductProcessITextEvent confirmedEvent = event.getConfirmedEvent();
            int indexOfReportedEvent = eventsList.indexOf(confirmedEvent);
            if (indexOfReportedEvent >= 0) {
                eventsList.set(indexOfReportedEvent, new ConfirmedEventWrapper(confirmedEvent, productEventProcessor.getUsageType(), productEventProcessor.getProducer()));
            } else {
                LOGGER.warn(MessageFormatUtil.format(CommonsLogMessageConstant.UNREPORTED_EVENT, confirmedEvent.getProductName(), confirmedEvent.getEventType()));
            }
        }
    }
}
