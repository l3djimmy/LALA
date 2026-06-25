package com.itextpdf.commons.actions.processors;

import com.google.android.gms.location.DeviceOrientationRequest;
import com.itextpdf.commons.actions.AbstractProductProcessITextEvent;
import com.itextpdf.commons.actions.confirmations.ConfirmEvent;
import com.itextpdf.commons.utils.Base64;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.atomic.AtomicLong;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class DefaultITextProductEventProcessor extends AbstractITextProductEventProcessor {
    private final AtomicLong counter;
    private final AtomicLong level;
    private final Object lock;
    private final AtomicLong repeatLevel;
    static final byte[] MESSAGE_FOR_LOGGING = Base64.decode("WW91IGFyZSB1c2luZyBpVGV4dCB1bmRlciB0aGUgQUdQTC4KCklmIHRoaXMgaXMgeW91ciBpbnRlbnRpb24sIHlvdSBoYXZlIHB1Ymxpc2hlZCB5b3VyIG93biBzb3VyY2UgY29kZSBhcyBBR1BMIHNvZnR3YXJlIHRvby4KUGxlYXNlIGxldCB1cyBrbm93IHdoZXJlIHRvIGZpbmQgeW91ciBzb3VyY2UgY29kZSBieSBzZW5kaW5nIGEgbWFpbCB0byBhZ3BsQGFwcnlzZS5jb20KV2UnZCBiZSBob25vcmVkIHRvIGFkZCBpdCB0byBvdXIgbGlzdCBvZiBBR1BMIHByb2plY3RzIGJ1aWx0IG9uIHRvcCBvZiBpVGV4dAphbmQgd2UnbGwgZXhwbGFpbiBob3cgdG8gcmVtb3ZlIHRoaXMgbWVzc2FnZSBmcm9tIHlvdXIgZXJyb3IgbG9ncy4KCklmIHRoaXMgd2Fzbid0IHlvdXIgaW50ZW50aW9uLCB5b3UgYXJlIHByb2JhYmx5IHVzaW5nIGlUZXh0IGluIGEgbm9uLWZyZWUgZW52aXJvbm1lbnQuCkluIHRoaXMgY2FzZSwgcGxlYXNlIGNvbnRhY3QgdXMgYnkgZmlsbGluZyBvdXQgdGhpcyBmb3JtOiBodHRwOi8vaXRleHRwZGYuY29tL3NhbGVzCklmIHlvdSBhcmUgYSBjdXN0b21lciwgd2UnbGwgZXhwbGFpbiBob3cgdG8gaW5zdGFsbCB5b3VyIGxpY2Vuc2Uga2V5IHRvIGF2b2lkIHRoaXMgbWVzc2FnZS4KSWYgeW91J3JlIG5vdCBhIGN1c3RvbWVyLCB3ZSdsbCBleHBsYWluIHRoZSBiZW5lZml0cyBvZiBiZWNvbWluZyBhIGN1c3RvbWVyLg==");
    private static final Logger LOGGER = LoggerFactory.getLogger(DefaultITextProductEventProcessor.class);
    private static final long[] REPEAT = {DeviceOrientationRequest.OUTPUT_PERIOD_MEDIUM, 5000, 1000};
    private static final int MAX_LVL = REPEAT.length - 1;

    public DefaultITextProductEventProcessor(String productName) {
        super(productName);
        this.lock = new Object();
        this.counter = new AtomicLong(0L);
        this.level = new AtomicLong(0L);
        this.repeatLevel = new AtomicLong(acquireRepeatLevel((int) this.level.get()));
    }

    @Override // com.itextpdf.commons.actions.processors.AbstractITextProductEventProcessor, com.itextpdf.commons.actions.processors.ITextProductEventProcessor
    public void onEvent(AbstractProductProcessITextEvent event) {
        if (!(event instanceof ConfirmEvent)) {
            return;
        }
        boolean isNeededToLogMessage = false;
        synchronized (this.lock) {
            if (this.counter.incrementAndGet() > this.repeatLevel.get()) {
                this.counter.set(0L);
                if (this.level.incrementAndGet() > MAX_LVL) {
                    this.level.set(MAX_LVL);
                }
                this.repeatLevel.set(acquireRepeatLevel((int) this.level.get()));
                isNeededToLogMessage = true;
            }
        }
        if (isNeededToLogMessage) {
            String message = new String(MESSAGE_FOR_LOGGING, StandardCharsets.ISO_8859_1);
            LOGGER.info(message);
            System.out.println(message);
        }
    }

    @Override // com.itextpdf.commons.actions.processors.AbstractITextProductEventProcessor, com.itextpdf.commons.actions.processors.ITextProductEventProcessor
    public String getUsageType() {
        return "AGPL";
    }

    long acquireRepeatLevel(int lvl) {
        return REPEAT[lvl];
    }
}
