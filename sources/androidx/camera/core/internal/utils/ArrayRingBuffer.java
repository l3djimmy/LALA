package androidx.camera.core.internal.utils;

import androidx.camera.core.internal.utils.RingBuffer;
import java.util.ArrayDeque;
/* loaded from: classes.dex */
public class ArrayRingBuffer<T> implements RingBuffer<T> {
    private static final String TAG = "ZslRingBuffer";
    private final ArrayDeque<T> mBuffer;
    private final Object mLock;
    final RingBuffer.OnRemoveCallback<T> mOnRemoveCallback;
    private final int mRingBufferCapacity;

    public ArrayRingBuffer(int ringBufferCapacity) {
        this(ringBufferCapacity, null);
    }

    public ArrayRingBuffer(int ringBufferCapacity, RingBuffer.OnRemoveCallback<T> onRemoveCallback) {
        this.mLock = new Object();
        this.mRingBufferCapacity = ringBufferCapacity;
        this.mBuffer = new ArrayDeque<>(this.mRingBufferCapacity);
        this.mOnRemoveCallback = onRemoveCallback;
    }

    @Override // androidx.camera.core.internal.utils.RingBuffer
    public void enqueue(T element) {
        T removedItem = null;
        synchronized (this.mLock) {
            if (this.mBuffer.size() >= this.mRingBufferCapacity) {
                removedItem = dequeue();
            }
            this.mBuffer.addFirst(element);
        }
        if (this.mOnRemoveCallback != null && removedItem != null) {
            this.mOnRemoveCallback.onRemove(removedItem);
        }
    }

    @Override // androidx.camera.core.internal.utils.RingBuffer
    public T dequeue() {
        T removeLast;
        synchronized (this.mLock) {
            removeLast = this.mBuffer.removeLast();
        }
        return removeLast;
    }

    @Override // androidx.camera.core.internal.utils.RingBuffer
    public int getMaxCapacity() {
        return this.mRingBufferCapacity;
    }

    @Override // androidx.camera.core.internal.utils.RingBuffer
    public boolean isEmpty() {
        boolean isEmpty;
        synchronized (this.mLock) {
            isEmpty = this.mBuffer.isEmpty();
        }
        return isEmpty;
    }
}
