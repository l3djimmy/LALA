package com.hardlineforge.lala.data;

import androidx.constraintlayout.core.motion.utils.TypedValues;
import com.google.android.gms.actions.SearchIntents;
import java.time.Instant;
import java.util.List;
import javax.inject.Inject;
import javax.inject.Singleton;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.flow.Flow;
/* compiled from: Repository.kt */
@Singleton
@Metadata(d1 = {"\u0000\u008e\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\t\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001B\u0011\b\u0007\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0012\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00150\u00140\u0013J\u001a\u0010\u0016\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00150\u00140\u00132\u0006\u0010\u0017\u001a\u00020\u0018J\u001a\u0010\u0019\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00150\u00140\u00132\u0006\u0010\u001a\u001a\u00020\u0018J\"\u0010\u001b\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00150\u00140\u00132\u0006\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\u001e\u001a\u00020\u001dJ\u0018\u0010\u001f\u001a\u0004\u0018\u00010\u00152\u0006\u0010 \u001a\u00020\u0018H\u0086@¢\u0006\u0002\u0010!J\u0016\u0010\"\u001a\u00020#2\u0006\u0010$\u001a\u00020\u0015H\u0086@¢\u0006\u0002\u0010%J\u0016\u0010&\u001a\u00020'2\u0006\u0010$\u001a\u00020\u0015H\u0086@¢\u0006\u0002\u0010%J\u0016\u0010(\u001a\u00020'2\u0006\u0010$\u001a\u00020\u0015H\u0086@¢\u0006\u0002\u0010%J\u0016\u0010)\u001a\u00020'2\u0006\u0010 \u001a\u00020\u0018H\u0086@¢\u0006\u0002\u0010!J\u001c\u0010*\u001a\b\u0012\u0004\u0012\u00020+0\u00142\u0006\u0010,\u001a\u00020\u0018H\u0086@¢\u0006\u0002\u0010!J\u0016\u0010-\u001a\u00020'2\u0006\u0010.\u001a\u00020+H\u0086@¢\u0006\u0002\u0010/J\u0016\u00100\u001a\u00020'2\u0006\u0010.\u001a\u00020+H\u0086@¢\u0006\u0002\u0010/J\u001c\u00101\u001a\b\u0012\u0004\u0012\u0002020\u00142\u0006\u0010,\u001a\u00020\u0018H\u0086@¢\u0006\u0002\u0010!J\u0018\u00103\u001a\u0004\u0018\u0001022\u0006\u0010 \u001a\u00020\u0018H\u0086@¢\u0006\u0002\u0010!J\u0016\u00104\u001a\u00020'2\u0006\u00105\u001a\u000202H\u0086@¢\u0006\u0002\u00106J\u0016\u00107\u001a\u00020'2\u0006\u00105\u001a\u000202H\u0086@¢\u0006\u0002\u00106J\u001c\u00108\u001a\b\u0012\u0004\u0012\u0002090\u00142\u0006\u0010:\u001a\u00020\u0018H\u0086@¢\u0006\u0002\u0010!J\u0016\u0010;\u001a\u00020'2\u0006\u0010<\u001a\u000209H\u0086@¢\u0006\u0002\u0010=J\u0016\u0010>\u001a\u00020'2\u0006\u0010:\u001a\u00020\u0018H\u0086@¢\u0006\u0002\u0010!J\u001c\u0010?\u001a\b\u0012\u0004\u0012\u00020@0\u00142\u0006\u0010,\u001a\u00020\u0018H\u0086@¢\u0006\u0002\u0010!J\u0016\u0010A\u001a\u00020'2\u0006\u0010B\u001a\u00020@H\u0086@¢\u0006\u0002\u0010CJ\u0012\u0010D\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020E0\u00140\u0013J\u0016\u0010F\u001a\u00020'2\u0006\u0010\u0017\u001a\u00020EH\u0086@¢\u0006\u0002\u0010GJ\u0016\u0010H\u001a\u00020'2\u0006\u0010\u0017\u001a\u00020EH\u0086@¢\u0006\u0002\u0010GR\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\tX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\f\u001a\u00020\rX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u000fX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0011X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006I"}, d2 = {"Lcom/hardlineforge/lala/data/LogRepository;", "", "db", "Lcom/hardlineforge/lala/data/AppDatabase;", "<init>", "(Lcom/hardlineforge/lala/data/AppDatabase;)V", "entryDao", "Lcom/hardlineforge/lala/data/LogEntryDao;", "photoDao", "Lcom/hardlineforge/lala/data/PhotoDao;", "videoDao", "Lcom/hardlineforge/lala/data/VideoDao;", "frameDao", "Lcom/hardlineforge/lala/data/VideoFrameDao;", "editDao", "Lcom/hardlineforge/lala/data/EditHistoryDao;", "categoryDao", "Lcom/hardlineforge/lala/data/CustomCategoryDao;", "getAllEntries", "Lkotlinx/coroutines/flow/Flow;", "", "Lcom/hardlineforge/lala/data/LogEntry;", "getEntriesByCategory", "category", "", "searchEntries", SearchIntents.EXTRA_QUERY, "getEntriesByDateRange", "start", "Ljava/time/Instant;", "end", "getEntryById", "id", "(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "insertEntry", "", "entry", "(Lcom/hardlineforge/lala/data/LogEntry;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "updateEntry", "", "deleteEntry", "deleteEntryById", "getPhotos", "Lcom/hardlineforge/lala/data/Photo;", "entryId", "insertPhoto", "photo", "(Lcom/hardlineforge/lala/data/Photo;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "deletePhoto", "getVideos", "Lcom/hardlineforge/lala/data/Video;", "getVideoById", "insertVideo", "video", "(Lcom/hardlineforge/lala/data/Video;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "deleteVideo", "getVideoFrames", "Lcom/hardlineforge/lala/data/VideoFrame;", "videoId", "insertVideoFrame", TypedValues.AttributesType.S_FRAME, "(Lcom/hardlineforge/lala/data/VideoFrame;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "deleteVideoFrames", "getEditHistory", "Lcom/hardlineforge/lala/data/EditHistory;", "insertEditHistory", "history", "(Lcom/hardlineforge/lala/data/EditHistory;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getCustomCategories", "Lcom/hardlineforge/lala/data/CustomCategory;", "insertCustomCategory", "(Lcom/hardlineforge/lala/data/CustomCategory;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "deleteCustomCategory", "app_debug"}, k = 1, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes7.dex */
public final class LogRepository {
    public static final int $stable = 8;
    private final CustomCategoryDao categoryDao;
    private final AppDatabase db;
    private final EditHistoryDao editDao;
    private final LogEntryDao entryDao;
    private final VideoFrameDao frameDao;
    private final PhotoDao photoDao;
    private final VideoDao videoDao;

    @Inject
    public LogRepository(AppDatabase db) {
        Intrinsics.checkNotNullParameter(db, "db");
        this.db = db;
        this.entryDao = this.db.logEntryDao();
        this.photoDao = this.db.photoDao();
        this.videoDao = this.db.videoDao();
        this.frameDao = this.db.videoFrameDao();
        this.editDao = this.db.editHistoryDao();
        this.categoryDao = this.db.customCategoryDao();
    }

    public final Flow<List<LogEntry>> getAllEntries() {
        return this.entryDao.getAll();
    }

    public final Flow<List<LogEntry>> getEntriesByCategory(String category) {
        Intrinsics.checkNotNullParameter(category, "category");
        return this.entryDao.getByCategory(category);
    }

    public final Flow<List<LogEntry>> searchEntries(String query) {
        Intrinsics.checkNotNullParameter(query, "query");
        return this.entryDao.search(query);
    }

    public final Flow<List<LogEntry>> getEntriesByDateRange(Instant start, Instant end) {
        Intrinsics.checkNotNullParameter(start, "start");
        Intrinsics.checkNotNullParameter(end, "end");
        return this.entryDao.getByDateRange(start, end);
    }

    public final Object getEntryById(String id, Continuation<? super LogEntry> continuation) {
        return this.entryDao.getById(id, continuation);
    }

    public final Object insertEntry(LogEntry entry, Continuation<? super Long> continuation) {
        return this.entryDao.insert(entry, continuation);
    }

    public final Object updateEntry(LogEntry entry, Continuation<? super Unit> continuation) {
        Object update = this.entryDao.update(entry, continuation);
        return update == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? update : Unit.INSTANCE;
    }

    public final Object deleteEntry(LogEntry entry, Continuation<? super Unit> continuation) {
        Object delete = this.entryDao.delete(entry, continuation);
        return delete == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? delete : Unit.INSTANCE;
    }

    public final Object deleteEntryById(String id, Continuation<? super Unit> continuation) {
        Object deleteById = this.entryDao.deleteById(id, continuation);
        return deleteById == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? deleteById : Unit.INSTANCE;
    }

    public final Object getPhotos(String entryId, Continuation<? super List<Photo>> continuation) {
        return this.photoDao.getByEntryId(entryId, continuation);
    }

    public final Object insertPhoto(Photo photo, Continuation<? super Unit> continuation) {
        Object insert = this.photoDao.insert(photo, continuation);
        return insert == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? insert : Unit.INSTANCE;
    }

    public final Object deletePhoto(Photo photo, Continuation<? super Unit> continuation) {
        Object delete = this.photoDao.delete(photo, continuation);
        return delete == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? delete : Unit.INSTANCE;
    }

    public final Object getVideos(String entryId, Continuation<? super List<Video>> continuation) {
        return this.videoDao.getByEntryId(entryId, continuation);
    }

    public final Object getVideoById(String id, Continuation<? super Video> continuation) {
        return this.videoDao.getById(id, continuation);
    }

    public final Object insertVideo(Video video, Continuation<? super Unit> continuation) {
        Object insert = this.videoDao.insert(video, continuation);
        return insert == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? insert : Unit.INSTANCE;
    }

    public final Object deleteVideo(Video video, Continuation<? super Unit> continuation) {
        Object delete = this.videoDao.delete(video, continuation);
        return delete == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? delete : Unit.INSTANCE;
    }

    public final Object getVideoFrames(String videoId, Continuation<? super List<VideoFrame>> continuation) {
        return this.frameDao.getByVideoId(videoId, continuation);
    }

    public final Object insertVideoFrame(VideoFrame frame, Continuation<? super Unit> continuation) {
        Object insert = this.frameDao.insert(frame, continuation);
        return insert == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? insert : Unit.INSTANCE;
    }

    public final Object deleteVideoFrames(String videoId, Continuation<? super Unit> continuation) {
        Object deleteByVideoId = this.frameDao.deleteByVideoId(videoId, continuation);
        return deleteByVideoId == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? deleteByVideoId : Unit.INSTANCE;
    }

    public final Object getEditHistory(String entryId, Continuation<? super List<EditHistory>> continuation) {
        return this.editDao.getByEntryId(entryId, continuation);
    }

    public final Object insertEditHistory(EditHistory history, Continuation<? super Unit> continuation) {
        Object insert = this.editDao.insert(history, continuation);
        return insert == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? insert : Unit.INSTANCE;
    }

    public final Flow<List<CustomCategory>> getCustomCategories() {
        return this.categoryDao.getAll();
    }

    public final Object insertCustomCategory(CustomCategory category, Continuation<? super Unit> continuation) {
        Object insert = this.categoryDao.insert(category, continuation);
        return insert == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? insert : Unit.INSTANCE;
    }

    public final Object deleteCustomCategory(CustomCategory category, Continuation<? super Unit> continuation) {
        Object delete = this.categoryDao.delete(category, continuation);
        return delete == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? delete : Unit.INSTANCE;
    }
}
