package com.hardlineforge.lala.pdf;

import android.content.Context;
import dagger.internal.Factory;
import dagger.internal.Provider;
/* loaded from: classes7.dex */
public final class PdfGenerator_Factory implements Factory<PdfGenerator> {
    private final Provider<Context> contextProvider;

    private PdfGenerator_Factory(Provider<Context> contextProvider) {
        this.contextProvider = contextProvider;
    }

    @Override // javax.inject.Provider, jakarta.inject.Provider
    public PdfGenerator get() {
        return newInstance(this.contextProvider.get());
    }

    public static PdfGenerator_Factory create(Provider<Context> contextProvider) {
        return new PdfGenerator_Factory(contextProvider);
    }

    public static PdfGenerator newInstance(Context context) {
        return new PdfGenerator(context);
    }
}
