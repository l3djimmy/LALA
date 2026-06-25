package com.itextpdf.io.source;

import androidx.collection.SieveCacheKt;
import java.io.IOException;
import java.lang.reflect.Method;
import java.nio.BufferUnderflowException;
import java.security.AccessController;
import java.security.PrivilegedAction;
import kotlin.UByte;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
class ByteBufferRandomAccessSource implements IRandomAccessSource {
    private static final BufferCleaner CLEANER;
    public static final boolean UNMAP_SUPPORTED;
    private static boolean allowUnmapping = true;
    private final java.nio.ByteBuffer byteBuffer;

    static {
        Object hack = AccessController.doPrivileged(new PrivilegedAction() { // from class: com.itextpdf.io.source.ByteBufferRandomAccessSource$$ExternalSyntheticLambda1
            @Override // java.security.PrivilegedAction
            public final Object run() {
                return BufferCleaner.unmapHackImpl();
            }
        });
        if (hack instanceof BufferCleaner) {
            CLEANER = (BufferCleaner) hack;
            UNMAP_SUPPORTED = true;
            return;
        }
        CLEANER = null;
        UNMAP_SUPPORTED = false;
    }

    public ByteBufferRandomAccessSource(java.nio.ByteBuffer byteBuffer) {
        this.byteBuffer = byteBuffer;
    }

    public static void enableByteBufferMemoryUnmapping() {
        allowUnmapping = false;
    }

    public static void disableByteBufferMemoryUnmapping() {
        allowUnmapping = false;
    }

    @Override // com.itextpdf.io.source.IRandomAccessSource
    public int get(long position) {
        if (position > SieveCacheKt.NodeLinkMask) {
            throw new IllegalArgumentException("Position must be less than Integer.MAX_VALUE");
        }
        try {
            if (position >= this.byteBuffer.limit()) {
                return -1;
            }
            return this.byteBuffer.duplicate().get((int) position) & UByte.MAX_VALUE;
        } catch (BufferUnderflowException e) {
            return -1;
        }
    }

    @Override // com.itextpdf.io.source.IRandomAccessSource
    public int get(long position, byte[] bytes, int off, int len) {
        if (position > SieveCacheKt.NodeLinkMask) {
            throw new IllegalArgumentException("Position must be less than Integer.MAX_VALUE");
        }
        if (position >= this.byteBuffer.limit()) {
            return -1;
        }
        java.nio.ByteBuffer byteBufferCopy = this.byteBuffer.duplicate();
        byteBufferCopy.position((int) position);
        int bytesFromThisBuffer = Math.min(len, byteBufferCopy.remaining());
        byteBufferCopy.get(bytes, off, bytesFromThisBuffer);
        return bytesFromThisBuffer;
    }

    @Override // com.itextpdf.io.source.IRandomAccessSource
    public long length() {
        return this.byteBuffer.limit();
    }

    @Override // com.itextpdf.io.source.IRandomAccessSource
    public void close() throws IOException {
        if (allowUnmapping) {
            clean(this.byteBuffer);
        }
    }

    private static boolean clean(final java.nio.ByteBuffer buffer) {
        if (buffer == null || !buffer.isDirect()) {
            return false;
        }
        return ((Boolean) AccessController.doPrivileged(new PrivilegedAction() { // from class: com.itextpdf.io.source.ByteBufferRandomAccessSource$$ExternalSyntheticLambda0
            @Override // java.security.PrivilegedAction
            public final Object run() {
                Boolean valueOf;
                valueOf = Boolean.valueOf(ByteBufferRandomAccessSource.cleanByUnmapping(buffer));
                return valueOf;
            }
        })).booleanValue();
    }

    private static boolean cleanByUnmapping(java.nio.ByteBuffer buffer) {
        Boolean success = Boolean.FALSE;
        try {
            if (UNMAP_SUPPORTED) {
                CLEANER.freeBuffer(buffer.toString(), buffer);
            } else {
                Class[] clsArr = null;
                Method getCleanerMethod = buffer.getClass().getMethod("cleaner", null);
                getCleanerMethod.setAccessible(true);
                Object[] objArr = null;
                Object cleaner = getCleanerMethod.invoke(buffer, null);
                Class[] clsArr2 = null;
                Method clean = cleaner.getClass().getMethod("clean", null);
                Object[] objArr2 = null;
                clean.invoke(cleaner, null);
            }
            success = Boolean.TRUE;
        } catch (Exception e) {
            Logger logger = LoggerFactory.getLogger(ByteBufferRandomAccessSource.class);
            logger.debug(e.getMessage());
        }
        return success.booleanValue();
    }
}
