package com.itextpdf.io.source;

import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.security.AccessController;
import java.security.PrivilegedAction;
import java.util.Objects;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes12.dex */
public class BufferCleaner {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    final Method method;
    final Object theUnsafe;
    Class<?> unmappableBufferClass;

    BufferCleaner(Class<?> unmappableBufferClass, Method method, Object theUnsafe) {
        this.unmappableBufferClass = unmappableBufferClass;
        this.method = method;
        this.theUnsafe = theUnsafe;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void freeBuffer(String resourceDescription, final java.nio.ByteBuffer buffer) throws IOException {
        if (!Objects.equals(Void.TYPE, this.method.getReturnType())) {
            throw new AssertionError();
        }
        if (this.method.getParameterTypes().length != 1) {
            throw new AssertionError();
        }
        if (!Objects.equals(java.nio.ByteBuffer.class, this.method.getParameterTypes()[0])) {
            throw new AssertionError();
        }
        if (!buffer.isDirect()) {
            throw new IllegalArgumentException("unmapping only works with direct buffers");
        }
        if (!this.unmappableBufferClass.isInstance(buffer)) {
            throw new IllegalArgumentException("buffer is not an instance of " + this.unmappableBufferClass.getName());
        }
        Throwable error = (Throwable) AccessController.doPrivileged(new PrivilegedAction<Throwable>() { // from class: com.itextpdf.io.source.BufferCleaner.1
            @Override // java.security.PrivilegedAction
            public Throwable run() {
                try {
                    BufferCleaner.this.method.invoke(BufferCleaner.this.theUnsafe, buffer);
                    return null;
                } catch (IllegalAccessException | InvocationTargetException e) {
                    return e;
                }
            }
        });
        if (error != null) {
            throw new IOException("Unable to unmap the mapped buffer: " + resourceDescription, error);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static Object unmapHackImpl() {
        try {
            Class<?> unsafeClass = Class.forName("sun.misc.Unsafe");
            Method method = unsafeClass.getDeclaredMethod("invokeCleaner", java.nio.ByteBuffer.class);
            Field f = unsafeClass.getDeclaredField("theUnsafe");
            f.setAccessible(true);
            Object theUnsafe = f.get(null);
            return new BufferCleaner(java.nio.ByteBuffer.class, method, theUnsafe);
        } catch (Exception e) {
            return e.getMessage();
        }
    }
}
