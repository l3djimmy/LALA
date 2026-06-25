package com.hardlineforge.lala.di;

import android.content.Context;
import com.hardlineforge.lala.data.AppDatabase;
import dagger.internal.Factory;
import dagger.internal.Preconditions;
import dagger.internal.Provider;
/* loaded from: classes7.dex */
public final class AppModule_ProvideDatabaseFactory implements Factory<AppDatabase> {
    private final Provider<Context> ctxProvider;

    private AppModule_ProvideDatabaseFactory(Provider<Context> ctxProvider) {
        this.ctxProvider = ctxProvider;
    }

    @Override // javax.inject.Provider, jakarta.inject.Provider
    public AppDatabase get() {
        return provideDatabase(this.ctxProvider.get());
    }

    public static AppModule_ProvideDatabaseFactory create(Provider<Context> ctxProvider) {
        return new AppModule_ProvideDatabaseFactory(ctxProvider);
    }

    public static AppDatabase provideDatabase(Context ctx) {
        return (AppDatabase) Preconditions.checkNotNullFromProvides(AppModule.INSTANCE.provideDatabase(ctx));
    }
}
