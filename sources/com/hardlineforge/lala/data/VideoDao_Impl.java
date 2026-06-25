package com.hardlineforge.lala.data;

import androidx.room.EntityDeleteOrUpdateAdapter;
import androidx.room.EntityInsertAdapter;
import androidx.room.RoomDatabase;
import androidx.room.util.DBUtil;
import androidx.room.util.SQLiteStatementUtil;
import androidx.sqlite.SQLiteConnection;
import androidx.sqlite.SQLiteStatement;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.CollectionsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KClass;
/* compiled from: VideoDao_Impl.kt */
@Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0004\n\u0002\u0010 \n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0007\u0018\u0000 \u00192\u00020\u0001:\u0001\u0019B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u0016\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\bH\u0096@¢\u0006\u0002\u0010\u0010J\u0016\u0010\u0011\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\bH\u0096@¢\u0006\u0002\u0010\u0010J\u001c\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\b0\u00132\u0006\u0010\u0014\u001a\u00020\u0015H\u0096@¢\u0006\u0002\u0010\u0016J\u0018\u0010\u0017\u001a\u0004\u0018\u00010\b2\u0006\u0010\u0018\u001a\u00020\u0015H\u0096@¢\u0006\u0002\u0010\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\b0\u0007X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\b0\fX\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u001a"}, d2 = {"Lcom/hardlineforge/lala/data/VideoDao_Impl;", "Lcom/hardlineforge/lala/data/VideoDao;", "__db", "Landroidx/room/RoomDatabase;", "<init>", "(Landroidx/room/RoomDatabase;)V", "__insertAdapterOfVideo", "Landroidx/room/EntityInsertAdapter;", "Lcom/hardlineforge/lala/data/Video;", "__converters", "Lcom/hardlineforge/lala/data/Converters;", "__deleteAdapterOfVideo", "Landroidx/room/EntityDeleteOrUpdateAdapter;", "insert", "", "video", "(Lcom/hardlineforge/lala/data/Video;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "delete", "getByEntryId", "", "entryId", "", "(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getById", "id", "Companion", "app_debug"}, k = 1, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes7.dex */
public final class VideoDao_Impl implements VideoDao {
    private final Converters __converters;
    private final RoomDatabase __db;
    private final EntityDeleteOrUpdateAdapter<Video> __deleteAdapterOfVideo;
    private final EntityInsertAdapter<Video> __insertAdapterOfVideo;
    public static final Companion Companion = new Companion(null);
    public static final int $stable = 8;

    public VideoDao_Impl(RoomDatabase __db) {
        Intrinsics.checkNotNullParameter(__db, "__db");
        this.__converters = new Converters();
        this.__db = __db;
        this.__insertAdapterOfVideo = new EntityInsertAdapter<Video>() { // from class: com.hardlineforge.lala.data.VideoDao_Impl.1
            @Override // androidx.room.EntityInsertAdapter
            protected String createQuery() {
                return "INSERT OR REPLACE INTO `videos` (`id`,`entryId`,`uri`,`durationSeconds`,`thumbnailUri`,`timestamp`,`gpsLat`,`gpsLon`) VALUES (?,?,?,?,?,?,?,?)";
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // androidx.room.EntityInsertAdapter
            public void bind(SQLiteStatement statement, Video entity) {
                Intrinsics.checkNotNullParameter(statement, "statement");
                Intrinsics.checkNotNullParameter(entity, "entity");
                statement.mo7193bindText(1, entity.getId());
                statement.mo7193bindText(2, entity.getEntryId());
                statement.mo7193bindText(3, entity.getUri());
                statement.mo7191bindLong(4, entity.getDurationSeconds());
                String _tmpThumbnailUri = entity.getThumbnailUri();
                if (_tmpThumbnailUri == null) {
                    statement.mo7192bindNull(5);
                } else {
                    statement.mo7193bindText(5, _tmpThumbnailUri);
                }
                Long _tmp = VideoDao_Impl.this.__converters.fromInstant(entity.getTimestamp());
                if (_tmp != null) {
                    statement.mo7191bindLong(6, _tmp.longValue());
                } else {
                    statement.mo7192bindNull(6);
                }
                Double _tmpGpsLat = entity.getGpsLat();
                if (_tmpGpsLat != null) {
                    statement.mo7190bindDouble(7, _tmpGpsLat.doubleValue());
                } else {
                    statement.mo7192bindNull(7);
                }
                Double _tmpGpsLon = entity.getGpsLon();
                if (_tmpGpsLon != null) {
                    statement.mo7190bindDouble(8, _tmpGpsLon.doubleValue());
                } else {
                    statement.mo7192bindNull(8);
                }
            }
        };
        this.__deleteAdapterOfVideo = new EntityDeleteOrUpdateAdapter<Video>() { // from class: com.hardlineforge.lala.data.VideoDao_Impl.2
            @Override // androidx.room.EntityDeleteOrUpdateAdapter
            protected String createQuery() {
                return "DELETE FROM `videos` WHERE `id` = ?";
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // androidx.room.EntityDeleteOrUpdateAdapter
            public void bind(SQLiteStatement statement, Video entity) {
                Intrinsics.checkNotNullParameter(statement, "statement");
                Intrinsics.checkNotNullParameter(entity, "entity");
                statement.mo7193bindText(1, entity.getId());
            }
        };
    }

    @Override // com.hardlineforge.lala.data.VideoDao
    public Object insert(final Video video, Continuation<? super Unit> continuation) {
        Object performSuspending = DBUtil.performSuspending(this.__db, false, true, new Function1() { // from class: com.hardlineforge.lala.data.VideoDao_Impl$$ExternalSyntheticLambda1
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return VideoDao_Impl.insert$lambda$0(VideoDao_Impl.this, video, (SQLiteConnection) obj);
            }
        }, continuation);
        return performSuspending == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? performSuspending : Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit insert$lambda$0(VideoDao_Impl this$0, Video $video, SQLiteConnection _connection) {
        Intrinsics.checkNotNullParameter(_connection, "_connection");
        this$0.__insertAdapterOfVideo.insert(_connection, (SQLiteConnection) $video);
        return Unit.INSTANCE;
    }

    @Override // com.hardlineforge.lala.data.VideoDao
    public Object delete(final Video video, Continuation<? super Unit> continuation) {
        Object performSuspending = DBUtil.performSuspending(this.__db, false, true, new Function1() { // from class: com.hardlineforge.lala.data.VideoDao_Impl$$ExternalSyntheticLambda3
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return VideoDao_Impl.delete$lambda$1(VideoDao_Impl.this, video, (SQLiteConnection) obj);
            }
        }, continuation);
        return performSuspending == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? performSuspending : Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit delete$lambda$1(VideoDao_Impl this$0, Video $video, SQLiteConnection _connection) {
        Intrinsics.checkNotNullParameter(_connection, "_connection");
        this$0.__deleteAdapterOfVideo.handle(_connection, $video);
        return Unit.INSTANCE;
    }

    @Override // com.hardlineforge.lala.data.VideoDao
    public Object getByEntryId(final String entryId, Continuation<? super List<Video>> continuation) {
        return DBUtil.performSuspending(this.__db, true, false, new Function1() { // from class: com.hardlineforge.lala.data.VideoDao_Impl$$ExternalSyntheticLambda2
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return VideoDao_Impl.getByEntryId$lambda$2(r1, entryId, this, (SQLiteConnection) obj);
            }
        }, continuation);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final List getByEntryId$lambda$2(String $_sql, String $entryId, VideoDao_Impl this$0, SQLiteConnection _connection) {
        String _tmpThumbnailUri;
        Long _tmp;
        Double _tmpGpsLat;
        Double _tmpGpsLon;
        Intrinsics.checkNotNullParameter(_connection, "_connection");
        SQLiteStatement _stmt = _connection.prepare($_sql);
        boolean z = true;
        try {
            _stmt.mo7193bindText(1, $entryId);
            int _columnIndexOfId = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "id");
            int _columnIndexOfEntryId = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "entryId");
            int _columnIndexOfUri = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "uri");
            int _columnIndexOfDurationSeconds = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "durationSeconds");
            int _columnIndexOfThumbnailUri = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "thumbnailUri");
            int _columnIndexOfTimestamp = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "timestamp");
            int _columnIndexOfGpsLat = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "gpsLat");
            int _columnIndexOfGpsLon = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "gpsLon");
            List _result = new ArrayList();
            while (_stmt.step()) {
                String _tmpId = _stmt.getText(_columnIndexOfId);
                String _tmpEntryId = _stmt.getText(_columnIndexOfEntryId);
                String _tmpUri = _stmt.getText(_columnIndexOfUri);
                boolean z2 = z;
                int _tmpDurationSeconds = (int) _stmt.getLong(_columnIndexOfDurationSeconds);
                if (_stmt.isNull(_columnIndexOfThumbnailUri)) {
                    _tmpThumbnailUri = null;
                } else {
                    String _tmpThumbnailUri2 = _stmt.getText(_columnIndexOfThumbnailUri);
                    _tmpThumbnailUri = _tmpThumbnailUri2;
                }
                if (_stmt.isNull(_columnIndexOfTimestamp)) {
                    _tmp = null;
                } else {
                    _tmp = Long.valueOf(_stmt.getLong(_columnIndexOfTimestamp));
                }
                Instant _tmp_1 = this$0.__converters.toInstant(_tmp);
                if (_tmp_1 == null) {
                    throw new IllegalStateException("Expected NON-NULL 'java.time.Instant', but it was NULL.".toString());
                }
                if (_stmt.isNull(_columnIndexOfGpsLat)) {
                    _tmpGpsLat = null;
                } else {
                    _tmpGpsLat = Double.valueOf(_stmt.getDouble(_columnIndexOfGpsLat));
                }
                if (_stmt.isNull(_columnIndexOfGpsLon)) {
                    _tmpGpsLon = null;
                } else {
                    _tmpGpsLon = Double.valueOf(_stmt.getDouble(_columnIndexOfGpsLon));
                }
                Video _item = new Video(_tmpId, _tmpEntryId, _tmpUri, _tmpDurationSeconds, _tmpThumbnailUri, _tmp_1, _tmpGpsLat, _tmpGpsLon);
                _result.add(_item);
                z = z2;
            }
            return _result;
        } finally {
            _stmt.close();
        }
    }

    @Override // com.hardlineforge.lala.data.VideoDao
    public Object getById(final String id, Continuation<? super Video> continuation) {
        return DBUtil.performSuspending(this.__db, true, false, new Function1() { // from class: com.hardlineforge.lala.data.VideoDao_Impl$$ExternalSyntheticLambda0
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return VideoDao_Impl.getById$lambda$3(r1, id, this, (SQLiteConnection) obj);
            }
        }, continuation);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Video getById$lambda$3(String $_sql, String $id, VideoDao_Impl this$0, SQLiteConnection _connection) {
        Video _result;
        String _tmpThumbnailUri;
        Long _tmp;
        Double _tmpGpsLat;
        Double _tmpGpsLon;
        Intrinsics.checkNotNullParameter(_connection, "_connection");
        SQLiteStatement _stmt = _connection.prepare($_sql);
        try {
            _stmt.mo7193bindText(1, $id);
            int _columnIndexOfId = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "id");
            int _columnIndexOfEntryId = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "entryId");
            int _columnIndexOfUri = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "uri");
            int _columnIndexOfDurationSeconds = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "durationSeconds");
            int _columnIndexOfThumbnailUri = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "thumbnailUri");
            int _columnIndexOfTimestamp = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "timestamp");
            int _columnIndexOfGpsLat = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "gpsLat");
            int _columnIndexOfGpsLon = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "gpsLon");
            if (_stmt.step()) {
                String _tmpId = _stmt.getText(_columnIndexOfId);
                String _tmpEntryId = _stmt.getText(_columnIndexOfEntryId);
                String _tmpUri = _stmt.getText(_columnIndexOfUri);
                int _tmpDurationSeconds = (int) _stmt.getLong(_columnIndexOfDurationSeconds);
                if (_stmt.isNull(_columnIndexOfThumbnailUri)) {
                    _tmpThumbnailUri = null;
                } else {
                    String _tmpThumbnailUri2 = _stmt.getText(_columnIndexOfThumbnailUri);
                    _tmpThumbnailUri = _tmpThumbnailUri2;
                }
                if (_stmt.isNull(_columnIndexOfTimestamp)) {
                    _tmp = null;
                } else {
                    _tmp = Long.valueOf(_stmt.getLong(_columnIndexOfTimestamp));
                }
                Instant _tmp_1 = this$0.__converters.toInstant(_tmp);
                if (_tmp_1 == null) {
                    throw new IllegalStateException("Expected NON-NULL 'java.time.Instant', but it was NULL.".toString());
                }
                if (_stmt.isNull(_columnIndexOfGpsLat)) {
                    _tmpGpsLat = null;
                } else {
                    _tmpGpsLat = Double.valueOf(_stmt.getDouble(_columnIndexOfGpsLat));
                }
                if (_stmt.isNull(_columnIndexOfGpsLon)) {
                    _tmpGpsLon = null;
                } else {
                    _tmpGpsLon = Double.valueOf(_stmt.getDouble(_columnIndexOfGpsLon));
                }
                _result = new Video(_tmpId, _tmpEntryId, _tmpUri, _tmpDurationSeconds, _tmpThumbnailUri, _tmp_1, _tmpGpsLat, _tmpGpsLon);
            } else {
                _result = null;
            }
            return _result;
        } finally {
            _stmt.close();
        }
    }

    /* compiled from: VideoDao_Impl.kt */
    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\u0004\u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/hardlineforge/lala/data/VideoDao_Impl$Companion;", "", "<init>", "()V", "getRequiredConverters", "", "Lkotlin/reflect/KClass;", "app_debug"}, k = 1, mv = {2, 2, 0}, xi = 48)
    /* loaded from: classes7.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        public final List<KClass<?>> getRequiredConverters() {
            return CollectionsKt.emptyList();
        }
    }
}
