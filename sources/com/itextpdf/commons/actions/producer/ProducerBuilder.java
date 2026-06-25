package com.itextpdf.commons.actions.producer;

import com.itextpdf.commons.actions.AbstractITextConfigurationEvent;
import com.itextpdf.commons.actions.AbstractProductProcessITextEvent;
import com.itextpdf.commons.actions.confirmations.ConfirmedEventWrapper;
import com.itextpdf.commons.actions.processors.ITextProductEventProcessor;
import com.itextpdf.commons.exceptions.CommonsExceptionMessageConstant;
import com.itextpdf.commons.logs.CommonsLogMessageConstant;
import com.itextpdf.commons.utils.MessageFormatUtil;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public final class ProducerBuilder extends AbstractITextConfigurationEvent {
    private static final String COPYRIGHT_SINCE = "copyrightSince";
    private static final String COPYRIGHT_TO = "copyrightTo";
    private static final String CURRENT_DATE = "currentDate";
    private static final char FORMAT_DELIMITER = ':';
    private static final String MODIFIED_USING = "; modified using ";
    private static final Map<String, IPlaceholderPopulator> PLACEHOLDER_POPULATORS;
    private static final String USED_PRODUCTS = "usedProducts";
    private static final Logger LOGGER = LoggerFactory.getLogger(ProducerBuilder.class);
    private static final ProducerBuilder INSTANCE = new ProducerBuilder();
    private static final String PATTERN_STRING = "\\$\\{([^}]*)\\}";
    private static final Pattern PATTERN = Pattern.compile(PATTERN_STRING);

    static {
        Map<String, IPlaceholderPopulator> populators = new HashMap<>();
        populators.put(CURRENT_DATE, new CurrentDatePlaceholderPopulator());
        populators.put(USED_PRODUCTS, new UsedProductsPlaceholderPopulator());
        populators.put(COPYRIGHT_SINCE, new CopyrightSincePlaceholderPopulator());
        populators.put(COPYRIGHT_TO, new CopyrightToPlaceholderPopulator());
        PLACEHOLDER_POPULATORS = Collections.unmodifiableMap(populators);
    }

    private ProducerBuilder() {
    }

    public static String modifyProducer(List<? extends AbstractProductProcessITextEvent> events, String oldProducer) {
        List<ConfirmedEventWrapper> confirmedEvents = new ArrayList<>();
        if (events != null) {
            for (AbstractProductProcessITextEvent event : events) {
                if (event instanceof ConfirmedEventWrapper) {
                    confirmedEvents.add((ConfirmedEventWrapper) event);
                } else {
                    ITextProductEventProcessor processor = INSTANCE.getActiveProcessor(event.getProductName());
                    confirmedEvents.add(new ConfirmedEventWrapper(event, processor.getUsageType(), processor.getProducer()));
                }
            }
        }
        String newProducer = buildProducer(confirmedEvents);
        if (oldProducer == null || oldProducer.isEmpty()) {
            return newProducer;
        }
        return oldProducer + MODIFIED_USING + newProducer;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.commons.actions.AbstractITextConfigurationEvent
    public void doAction() {
        throw new IllegalStateException("Configuration events for util internal purposes are not expected to be sent");
    }

    private static String buildProducer(List<ConfirmedEventWrapper> events) {
        if (events == null || events.isEmpty()) {
            throw new IllegalArgumentException(CommonsExceptionMessageConstant.NO_EVENTS_WERE_REGISTERED_FOR_THE_DOCUMENT);
        }
        String producer = events.get(0).getProducerLine();
        return populatePlaceholders(producer, events);
    }

    private static String populatePlaceholders(String producerLine, List<ConfirmedEventWrapper> events) {
        String placeholderName;
        int lastIndex = 0;
        Matcher matcher = PATTERN.matcher(producerLine);
        StringBuilder builder = new StringBuilder();
        while (matcher.find()) {
            builder.append(producerLine.substring(lastIndex, matcher.start()));
            lastIndex = matcher.end();
            String placeholder = matcher.group(1);
            int delimiterPosition = placeholder.indexOf(58);
            String parameter = null;
            if (placeholder.indexOf(58) == -1) {
                placeholderName = placeholder;
            } else {
                placeholderName = placeholder.substring(0, delimiterPosition);
                parameter = placeholder.substring(delimiterPosition + 1);
            }
            IPlaceholderPopulator populator = PLACEHOLDER_POPULATORS.get(placeholderName);
            if (populator == null) {
                LOGGER.info(MessageFormatUtil.format(CommonsLogMessageConstant.UNKNOWN_PLACEHOLDER_WAS_IGNORED, placeholderName));
            } else {
                builder.append(populator.populate(events, parameter));
            }
        }
        builder.append(producerLine.substring(lastIndex));
        return builder.toString();
    }
}
