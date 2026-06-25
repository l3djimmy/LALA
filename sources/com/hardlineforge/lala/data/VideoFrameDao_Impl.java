package com.hardlineforge.lala.data;

import androidx.constraintlayout.core.motion.utils.TypedValues;
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
/* compiled from: VideoFrameDao_Impl.kt */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0010 \n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0004\b\u0007\u0018\u0000 \u00152\u00020\u0001:\u0001\u0015B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u0016\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\bH\u0096@¢\u0006\u0002\u0010\u000eJ\u001c\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\b0\u00102\u0006\u0010\u0011\u001a\u00020\u0012H\u0096@¢\u0006\u0002\u0010\u0013J\u0016\u0010\u0014\u001a\u00020\f2\u0006\u0010\u0011\u001a\u00020\u0012H\u0096@¢\u0006\u0002\u0010\u0013R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\b0\u0007X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0016"}, d2 = {"Lcom/hardlineforge/lala/data/VideoFrameDao_Impl;", "Lcom/hardlineforge/lala/data/VideoFrameDao;", "__db", "Landroidx/room/RoomDatabase;", "<init>", "(Landroidx/room/RoomDatabase;)V", "__insertAdapterOfVideoFrame", "Landroidx/room/EntityInsertAdapter;", "Lcom/hardlineforge/lala/data/VideoFrame;", "__converters", "Lcom/hardlineforge/lala/data/Converters;", "insert", "", TypedValues.AttributesType.S_FRAME, "(Lcom/hardlineforge/lala/data/VideoFrame;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getByVideoId", "", "videoId", "", "(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "deleteByVideoId", "Companion", "app_debug"}, k = 1, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes7.dex */
public final class VideoFrameDao_Impl implements VideoFrameDao {
    private final Converters __converters;
    private final RoomDatabase __db;
    private final EntityInsertAdapter<VideoFrame> __insertAdapterOfVideoFrame;
    public static final Companion Companion = new Companion(null);
    public static final int $stable = 8;

    public VideoFrameDao_Impl(RoomDatabase __db) {
        Intrinsics.checkNotNullParameter(__db, "__db");
        this.__converters = new Converters();
        this.__db = __db;
        this.__insertAdapterOfVideoFrame = new EntityInsertAdapter<VideoFrame>() { // from class: com.hardlineforge.lala.data.VideoFrameDao_Impl.1
            @Override // androidx.room.EntityInsertAdapter
            protected String createQuery() {
                return "INSERT OR REPLACE INTO `video_frames` (`id`,`videoId`,`frameNumber`,`timeOffsetMs`,`uri`,`extractedAt`) VALUES (?,?,?,?,?,?)";
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // androidx.room.EntityInsertAdapter
            public void bind(SQLiteStatement statement, VideoFrame entity) {
                Intrinsics.checkNotNullParameter(statement, "statement");
                Intrinsics.checkNotNullParameter(entity, "entity");
                statement.mo7193bindText(1, entity.getId());
                statement.mo7193bindText(2, entity.getVideoId());
                statement.mo7191bindLong(3, entity.getFrameNumber());
                statement.mo7191bindLong(4, entity.getTimeOffsetMs());
                statement.mo7193bindText(5, entity.getUri());
                Long _tmp = VideoFrameDao_Impl.this.__converters.fromInstant(entity.getExtractedAt());
                if (_tmp != null) {
                    statement.mo7191bindLong(6, _tmp.longValue());
                } else {
                    statement.mo7192bindNull(6);
                }
            }
        };
    }

    @Override // com.hardlineforge.lala.data.VideoFrameDao
    public Object insert(final VideoFrame frame, Continuation<? super Unit> continuation) {
        Object performSuspending = DBUtil.performSuspending(this.__db, false, true, new Function1() { // from class: com.hardlineforge.lala.data.VideoFrameDao_Impl$$ExternalSyntheticLambda0
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return VideoFrameDao_Impl.insert$lambda$0(VideoFrameDao_Impl.this, frame, (SQLiteConnection) obj);
            }
        }, continuation);
        return performSuspending == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? performSuspending : Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit insert$lambda$0(VideoFrameDao_Impl this$0, VideoFrame $frame, SQLiteConnection _connection) {
        Intrinsics.checkNotNullParameter(_connection, "_connection");
        this$0.__insertAdapterOfVideoFrame.insert(_connection, (SQLiteConnection) $frame);
        return Unit.INSTANCE;
    }

    @Override // com.hardlineforge.lala.data.VideoFrameDao
    public Object getByVideoId(final String videoId, Continuation<? super List<VideoFrame>> continuation) {
        return DBUtil.performSuspending(this.__db, true, false, new Function1() { // from class: com.hardlineforge.lala.data.VideoFrameDao_Impl$$ExternalSyntheticLambda1
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return VideoFrameDao_Impl.getByVideoId$lambda$1(r1, videoId, this, (SQLiteConnection) obj);
            }
        }, continuation);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final List getByVideoId$lambda$1(String $_sql, String $videoId, VideoFrameDao_Impl this$0, SQLiteConnection _connection) {
        Long _tmp;
        Intrinsics.checkNotNullParameter(_connection, "_connection");
        SQLiteStatement _stmt = _connection.prepare($_sql);
        boolean z = true;
        try {
            _stmt.mo7193bindText(1, $videoId);
            int _columnIndexOfId = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "id");
            int _columnIndexOfVideoId = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "videoId");
            int _columnIndexOfFrameNumber = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "frameNumber");
            int _columnIndexOfTimeOffsetMs = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "timeOffsetMs");
            int _columnIndexOfUri = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "uri");
            int _columnIndexOfExtractedAt = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "extractedAt");
            List _result = new ArrayList();
            while (_stmt.step()) {
                String _tmpId = _stmt.getText(_columnIndexOfId);
                String _tmpVideoId = _stmt.getText(_columnIndexOfVideoId);
                int _tmpFrameNumber = (int) _stmt.getLong(_columnIndexOfFrameNumber);
                boolean z2 = z;
                int _tmpTimeOffsetMs = (int) _stmt.getLong(_columnIndexOfTimeOffsetMs);
                String _tmpUri = _stmt.getText(_columnIndexOfUri);
                if (_stmt.isNull(_columnIndexOfExtractedAt)) {
                    _tmp = null;
                } else {
                    _tmp = Long.valueOf(_stmt.getLong(_columnIndexOfExtractedAt));
                }
                Instant _tmp_1 = this$0.__converters.toInstant(_tmp);
                if (_tmp_1 == null) {
                    throw new IllegalStateException("Expected NON-NULL 'java.time.Instant', but it was NULL.".toString());
                }
                VideoFrame _item = new VideoFrame(_tmpId, _tmpVideoId, _tmpFrameNumber, _tmpTimeOffsetMs, _tmpUri, _tmp_1);
                _result.add(_item);
                z = z2;
            }
            return _result;
        } finally {
            _stmt.close();
        }
    }

    @Override // com.hardlineforge.lala.data.VideoFrameDao
    public Object deleteByVideoId(final String videoId, Continuation<? super Unit> continuation) {
        Object performSuspending = DBUtil.performSuspending(this.__db, false, true, new Function1() { // from class: com.hardlineforge.lala.data.VideoFrameDao_Impl$$ExternalSyntheticLambda2
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return VideoFrameDao_Impl.deleteByVideoId$lambda$2(r1, videoId, (SQLiteConnection) obj);
            }
        }, continuation);
        return performSuspending == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? performSuspending : Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit deleteByVideoId$lambda$2(String $_sql, String $videoId, SQLiteConnection _connection) {
        Intrinsics.checkNotNullParameter(_connection, "_connection");
        SQLiteStatement _stmt = _connection.prepare($_sql);
        try {
            _stmt.mo7193bindText(1, $videoId);
            _stmt.step();
            _stmt.close();
            return Unit.INSTANCE;
        } catch (Throwable th) {
            _stmt.close();
            throw th;
        }
    }

    /* compiled from: VideoFrameDao_Impl.kt */
    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\u0004\u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/hardlineforge/lala/data/VideoFrameDao_Impl$Companion;", "", "<init>", "()V", "getRequiredConverters", "", "Lkotlin/reflect/KClass;", "app_debug"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
