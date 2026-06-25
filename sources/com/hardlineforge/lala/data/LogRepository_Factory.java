package com.hardlineforge.lala.data;

import dagger.internal.Factory;
import dagger.internal.Provider;
/* loaded from: classes7.dex */
public final class LogRepository_Factory implements Factory<LogRepository> {
    private final Provider<AppDatabase> dbProvider;

    private LogRepository_Factory(Provider<AppDatabase> dbProvider) {
        this.dbProvider = dbProvider;
    }

    @Override // javax.inject.Provider, jakarta.inject.Provider
    public LogRepository get() {
        return newInstance(this.dbProvider.get());
    }

    public static LogRepository_Factory create(Provider<AppDatabase> dbProvider) {
        return new LogRepository_Factory(dbProvider);
    }

    public static LogRepository newInstance(AppDatabase db) {
        return new LogRepository(db);
    }
}
