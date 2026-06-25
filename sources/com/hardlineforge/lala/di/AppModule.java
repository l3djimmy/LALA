package com.hardlineforge.lala.di;

import android.content.Context;
import androidx.room.Room;
import com.hardlineforge.lala.data.AppDatabase;
import dagger.Module;
import dagger.Provides;
import dagger.hilt.android.qualifiers.ApplicationContext;
import javax.inject.Singleton;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: AppModule.kt */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0012\u0010\u0004\u001a\u00020\u00052\b\b\u0001\u0010\u0006\u001a\u00020\u0007H\u0007¨\u0006\b"}, d2 = {"Lcom/hardlineforge/lala/di/AppModule;", "", "<init>", "()V", "provideDatabase", "Lcom/hardlineforge/lala/data/AppDatabase;", "ctx", "Landroid/content/Context;", "app_debug"}, k = 1, mv = {2, 2, 0}, xi = 48)
@Module
/* loaded from: classes7.dex */
public final class AppModule {
    public static final int $stable = 0;
    public static final AppModule INSTANCE = new AppModule();

    private AppModule() {
    }

    @Provides
    @Singleton
    public final AppDatabase provideDatabase(@ApplicationContext Context ctx) {
        Intrinsics.checkNotNullParameter(ctx, "ctx");
        return (AppDatabase) Room.databaseBuilder(ctx, AppDatabase.class, "lala.db").fallbackToDestructiveMigration().build();
    }
}
