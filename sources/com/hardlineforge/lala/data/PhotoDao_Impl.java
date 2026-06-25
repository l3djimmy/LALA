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
/* compiled from: PhotoDao_Impl.kt */
@Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0004\n\u0002\u0010 \n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\b\u0007\u0018\u0000 \u00172\u00020\u0001:\u0001\u0017B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u0016\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\bH\u0096@¢\u0006\u0002\u0010\u0010J\u0016\u0010\u0011\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\bH\u0096@¢\u0006\u0002\u0010\u0010J\u001c\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\b0\u00132\u0006\u0010\u0014\u001a\u00020\u0015H\u0096@¢\u0006\u0002\u0010\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\b0\u0007X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\b0\fX\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0018"}, d2 = {"Lcom/hardlineforge/lala/data/PhotoDao_Impl;", "Lcom/hardlineforge/lala/data/PhotoDao;", "__db", "Landroidx/room/RoomDatabase;", "<init>", "(Landroidx/room/RoomDatabase;)V", "__insertAdapterOfPhoto", "Landroidx/room/EntityInsertAdapter;", "Lcom/hardlineforge/lala/data/Photo;", "__converters", "Lcom/hardlineforge/lala/data/Converters;", "__deleteAdapterOfPhoto", "Landroidx/room/EntityDeleteOrUpdateAdapter;", "insert", "", "photo", "(Lcom/hardlineforge/lala/data/Photo;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "delete", "getByEntryId", "", "entryId", "", "(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "Companion", "app_debug"}, k = 1, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes7.dex */
public final class PhotoDao_Impl implements PhotoDao {
    private final Converters __converters;
    private final RoomDatabase __db;
    private final EntityDeleteOrUpdateAdapter<Photo> __deleteAdapterOfPhoto;
    private final EntityInsertAdapter<Photo> __insertAdapterOfPhoto;
    public static final Companion Companion = new Companion(null);
    public static final int $stable = 8;

    public PhotoDao_Impl(RoomDatabase __db) {
        Intrinsics.checkNotNullParameter(__db, "__db");
        this.__converters = new Converters();
        this.__db = __db;
        this.__insertAdapterOfPhoto = new EntityInsertAdapter<Photo>() { // from class: com.hardlineforge.lala.data.PhotoDao_Impl.1
            @Override // androidx.room.EntityInsertAdapter
            protected String createQuery() {
                return "INSERT OR REPLACE INTO `photos` (`id`,`entryId`,`uri`,`caption`,`timestamp`,`gpsLat`,`gpsLon`) VALUES (?,?,?,?,?,?,?)";
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // androidx.room.EntityInsertAdapter
            public void bind(SQLiteStatement statement, Photo entity) {
                Intrinsics.checkNotNullParameter(statement, "statement");
                Intrinsics.checkNotNullParameter(entity, "entity");
                statement.mo7193bindText(1, entity.getId());
                statement.mo7193bindText(2, entity.getEntryId());
                statement.mo7193bindText(3, entity.getUri());
                String _tmpCaption = entity.getCaption();
                if (_tmpCaption == null) {
                    statement.mo7192bindNull(4);
                } else {
                    statement.mo7193bindText(4, _tmpCaption);
                }
                Long _tmp = PhotoDao_Impl.this.__converters.fromInstant(entity.getTimestamp());
                if (_tmp != null) {
                    statement.mo7191bindLong(5, _tmp.longValue());
                } else {
                    statement.mo7192bindNull(5);
                }
                Double _tmpGpsLat = entity.getGpsLat();
                if (_tmpGpsLat != null) {
                    statement.mo7190bindDouble(6, _tmpGpsLat.doubleValue());
                } else {
                    statement.mo7192bindNull(6);
                }
                Double _tmpGpsLon = entity.getGpsLon();
                if (_tmpGpsLon != null) {
                    statement.mo7190bindDouble(7, _tmpGpsLon.doubleValue());
                } else {
                    statement.mo7192bindNull(7);
                }
            }
        };
        this.__deleteAdapterOfPhoto = new EntityDeleteOrUpdateAdapter<Photo>() { // from class: com.hardlineforge.lala.data.PhotoDao_Impl.2
            @Override // androidx.room.EntityDeleteOrUpdateAdapter
            protected String createQuery() {
                return "DELETE FROM `photos` WHERE `id` = ?";
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // androidx.room.EntityDeleteOrUpdateAdapter
            public void bind(SQLiteStatement statement, Photo entity) {
                Intrinsics.checkNotNullParameter(statement, "statement");
                Intrinsics.checkNotNullParameter(entity, "entity");
                statement.mo7193bindText(1, entity.getId());
            }
        };
    }

    @Override // com.hardlineforge.lala.data.PhotoDao
    public Object insert(final Photo photo, Continuation<? super Unit> continuation) {
        Object performSuspending = DBUtil.performSuspending(this.__db, false, true, new Function1() { // from class: com.hardlineforge.lala.data.PhotoDao_Impl$$ExternalSyntheticLambda0
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return PhotoDao_Impl.insert$lambda$0(PhotoDao_Impl.this, photo, (SQLiteConnection) obj);
            }
        }, continuation);
        return performSuspending == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? performSuspending : Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit insert$lambda$0(PhotoDao_Impl this$0, Photo $photo, SQLiteConnection _connection) {
        Intrinsics.checkNotNullParameter(_connection, "_connection");
        this$0.__insertAdapterOfPhoto.insert(_connection, (SQLiteConnection) $photo);
        return Unit.INSTANCE;
    }

    @Override // com.hardlineforge.lala.data.PhotoDao
    public Object delete(final Photo photo, Continuation<? super Unit> continuation) {
        Object performSuspending = DBUtil.performSuspending(this.__db, false, true, new Function1() { // from class: com.hardlineforge.lala.data.PhotoDao_Impl$$ExternalSyntheticLambda1
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return PhotoDao_Impl.delete$lambda$1(PhotoDao_Impl.this, photo, (SQLiteConnection) obj);
            }
        }, continuation);
        return performSuspending == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? performSuspending : Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit delete$lambda$1(PhotoDao_Impl this$0, Photo $photo, SQLiteConnection _connection) {
        Intrinsics.checkNotNullParameter(_connection, "_connection");
        this$0.__deleteAdapterOfPhoto.handle(_connection, $photo);
        return Unit.INSTANCE;
    }

    @Override // com.hardlineforge.lala.data.PhotoDao
    public Object getByEntryId(final String entryId, Continuation<? super List<Photo>> continuation) {
        return DBUtil.performSuspending(this.__db, true, false, new Function1() { // from class: com.hardlineforge.lala.data.PhotoDao_Impl$$ExternalSyntheticLambda2
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return PhotoDao_Impl.getByEntryId$lambda$2(r1, entryId, this, (SQLiteConnection) obj);
            }
        }, continuation);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final List getByEntryId$lambda$2(String $_sql, String $entryId, PhotoDao_Impl this$0, SQLiteConnection _connection) {
        String _tmpCaption;
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
            int _columnIndexOfCaption = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "caption");
            int _columnIndexOfTimestamp = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "timestamp");
            int _columnIndexOfGpsLat = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "gpsLat");
            int _columnIndexOfGpsLon = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "gpsLon");
            List _result = new ArrayList();
            while (_stmt.step()) {
                String _tmpId = _stmt.getText(_columnIndexOfId);
                String _tmpEntryId = _stmt.getText(_columnIndexOfEntryId);
                String _tmpUri = _stmt.getText(_columnIndexOfUri);
                if (_stmt.isNull(_columnIndexOfCaption)) {
                    _tmpCaption = null;
                } else {
                    String _tmpCaption2 = _stmt.getText(_columnIndexOfCaption);
                    _tmpCaption = _tmpCaption2;
                }
                if (_stmt.isNull(_columnIndexOfTimestamp)) {
                    _tmp = null;
                } else {
                    _tmp = Long.valueOf(_stmt.getLong(_columnIndexOfTimestamp));
                }
                boolean z2 = z;
                Instant _tmp_1 = this$0.__converters.toInstant(_tmp);
                if (_tmp_1 == null) {
                    throw new IllegalStateException("Expected NON-NULL 'java.time.Instant', but it was NULL.".toString());
                }
                if (_stmt.isNull(_columnIndexOfGpsLat)) {
                    _tmpGpsLat = null;
                } else {
                    Double _tmpGpsLat2 = Double.valueOf(_stmt.getDouble(_columnIndexOfGpsLat));
                    _tmpGpsLat = _tmpGpsLat2;
                }
                if (_stmt.isNull(_columnIndexOfGpsLon)) {
                    _tmpGpsLon = null;
                } else {
                    Double _tmpGpsLon2 = Double.valueOf(_stmt.getDouble(_columnIndexOfGpsLon));
                    _tmpGpsLon = _tmpGpsLon2;
                }
                Photo _item = new Photo(_tmpId, _tmpEntryId, _tmpUri, _tmpCaption, _tmp_1, _tmpGpsLat, _tmpGpsLon);
                _result.add(_item);
                z = z2;
            }
            return _result;
        } finally {
            _stmt.close();
        }
    }

    /* compiled from: PhotoDao_Impl.kt */
    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\u0004\u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/hardlineforge/lala/data/PhotoDao_Impl$Companion;", "", "<init>", "()V", "getRequiredConverters", "", "Lkotlin/reflect/KClass;", "app_debug"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
