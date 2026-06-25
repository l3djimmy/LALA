package com.itextpdf.commons.datastructures;
/* loaded from: classes12.dex */
public class NullableContainer<T> {
    private final T value;

    public NullableContainer(T value) {
        this.value = value;
    }

    public T getValue() {
        return this.value;
    }
}
