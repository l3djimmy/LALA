package com.hardlineforge.lala.data;

import androidx.room.RoomDatabase;
import kotlin.Metadata;
/* compiled from: AppDatabase.kt */
@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\b'\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\b\u0010\u0004\u001a\u00020\u0005H&J\b\u0010\u0006\u001a\u00020\u0007H&J\b\u0010\b\u001a\u00020\tH&J\b\u0010\n\u001a\u00020\u000bH&J\b\u0010\f\u001a\u00020\rH&J\b\u0010\u000e\u001a\u00020\u000fH&¨\u0006\u0010"}, d2 = {"Lcom/hardlineforge/lala/data/AppDatabase;", "Landroidx/room/RoomDatabase;", "<init>", "()V", "logEntryDao", "Lcom/hardlineforge/lala/data/LogEntryDao;", "photoDao", "Lcom/hardlineforge/lala/data/PhotoDao;", "videoDao", "Lcom/hardlineforge/lala/data/VideoDao;", "videoFrameDao", "Lcom/hardlineforge/lala/data/VideoFrameDao;", "editHistoryDao", "Lcom/hardlineforge/lala/data/EditHistoryDao;", "customCategoryDao", "Lcom/hardlineforge/lala/data/CustomCategoryDao;", "app_debug"}, k = 1, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes7.dex */
public abstract class AppDatabase extends RoomDatabase {
    public static final int $stable = 8;

    public abstract CustomCategoryDao customCategoryDao();

    public abstract EditHistoryDao editHistoryDao();

    public abstract LogEntryDao logEntryDao();

    public abstract PhotoDao photoDao();

    public abstract VideoDao videoDao();

    public abstract VideoFrameDao videoFrameDao();
}
