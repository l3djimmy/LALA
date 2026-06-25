package com.hardlineforge.lala.data;

import androidx.room.EntityDeleteOrUpdateAdapter;
import androidx.room.EntityInsertAdapter;
import androidx.room.RoomDatabase;
import androidx.room.coroutines.FlowUtil;
import androidx.room.util.DBUtil;
import androidx.room.util.SQLiteStatementUtil;
import androidx.sqlite.SQLiteConnection;
import androidx.sqlite.SQLiteStatement;
import com.google.android.gms.actions.SearchIntents;
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
import kotlinx.coroutines.flow.Flow;
/* compiled from: LogEntryDao_Impl.kt */
@Metadata(d1 = {"\u0000V\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u0000 %2\u00020\u0001:\u0001%B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u0016\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\bH\u0096@¢\u0006\u0002\u0010\u0011J\u0016\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0010\u001a\u00020\bH\u0096@¢\u0006\u0002\u0010\u0011J\u0016\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u0010\u001a\u00020\bH\u0096@¢\u0006\u0002\u0010\u0011J\u0014\u0010\u0015\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\b0\u00170\u0016H\u0016J\u0018\u0010\u0018\u001a\u0004\u0018\u00010\b2\u0006\u0010\u0019\u001a\u00020\u001aH\u0096@¢\u0006\u0002\u0010\u001bJ\u001c\u0010\u001c\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\b0\u00170\u00162\u0006\u0010\u001d\u001a\u00020\u001aH\u0016J\u001c\u0010\u001e\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\b0\u00170\u00162\u0006\u0010\u001f\u001a\u00020\u001aH\u0016J$\u0010 \u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\b0\u00170\u00162\u0006\u0010!\u001a\u00020\"2\u0006\u0010#\u001a\u00020\"H\u0016J\u0016\u0010$\u001a\u00020\u00132\u0006\u0010\u0019\u001a\u00020\u001aH\u0096@¢\u0006\u0002\u0010\u001bR\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\b0\u0007X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\b0\fX\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\r\u001a\b\u0012\u0004\u0012\u00020\b0\fX\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006&"}, d2 = {"Lcom/hardlineforge/lala/data/LogEntryDao_Impl;", "Lcom/hardlineforge/lala/data/LogEntryDao;", "__db", "Landroidx/room/RoomDatabase;", "<init>", "(Landroidx/room/RoomDatabase;)V", "__insertAdapterOfLogEntry", "Landroidx/room/EntityInsertAdapter;", "Lcom/hardlineforge/lala/data/LogEntry;", "__converters", "Lcom/hardlineforge/lala/data/Converters;", "__deleteAdapterOfLogEntry", "Landroidx/room/EntityDeleteOrUpdateAdapter;", "__updateAdapterOfLogEntry", "insert", "", "entry", "(Lcom/hardlineforge/lala/data/LogEntry;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "delete", "", "update", "getAll", "Lkotlinx/coroutines/flow/Flow;", "", "getById", "id", "", "(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getByCategory", "category", "search", SearchIntents.EXTRA_QUERY, "getByDateRange", "start", "Ljava/time/Instant;", "end", "deleteById", "Companion", "app_debug"}, k = 1, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes7.dex */
public final class LogEntryDao_Impl implements LogEntryDao {
    private final Converters __converters;
    private final RoomDatabase __db;
    private final EntityDeleteOrUpdateAdapter<LogEntry> __deleteAdapterOfLogEntry;
    private final EntityInsertAdapter<LogEntry> __insertAdapterOfLogEntry;
    private final EntityDeleteOrUpdateAdapter<LogEntry> __updateAdapterOfLogEntry;
    public static final Companion Companion = new Companion(null);
    public static final int $stable = 8;

    public LogEntryDao_Impl(RoomDatabase __db) {
        Intrinsics.checkNotNullParameter(__db, "__db");
        this.__converters = new Converters();
        this.__db = __db;
        this.__insertAdapterOfLogEntry = new EntityInsertAdapter<LogEntry>() { // from class: com.hardlineforge.lala.data.LogEntryDao_Impl.1
            @Override // androidx.room.EntityInsertAdapter
            protected String createQuery() {
                return "INSERT OR REPLACE INTO `log_entries` (`id`,`timestamp`,`timezone`,`gpsLat`,`gpsLon`,`gpsAccuracy`,`category`,`locationName`,`comment`,`tags`,`createdAt`,`updatedAt`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // androidx.room.EntityInsertAdapter
            public void bind(SQLiteStatement statement, LogEntry entity) {
                Intrinsics.checkNotNullParameter(statement, "statement");
                Intrinsics.checkNotNullParameter(entity, "entity");
                statement.mo7193bindText(1, entity.getId());
                Long _tmp = LogEntryDao_Impl.this.__converters.fromInstant(entity.getTimestamp());
                if (_tmp != null) {
                    statement.mo7191bindLong(2, _tmp.longValue());
                } else {
                    statement.mo7192bindNull(2);
                }
                statement.mo7193bindText(3, entity.getTimezone());
                Double _tmpGpsLat = entity.getGpsLat();
                if (_tmpGpsLat != null) {
                    statement.mo7190bindDouble(4, _tmpGpsLat.doubleValue());
                } else {
                    statement.mo7192bindNull(4);
                }
                Double _tmpGpsLon = entity.getGpsLon();
                if (_tmpGpsLon != null) {
                    statement.mo7190bindDouble(5, _tmpGpsLon.doubleValue());
                } else {
                    statement.mo7192bindNull(5);
                }
                Float _tmpGpsAccuracy = entity.getGpsAccuracy();
                if (_tmpGpsAccuracy != null) {
                    statement.mo7190bindDouble(6, _tmpGpsAccuracy.floatValue());
                } else {
                    statement.mo7192bindNull(6);
                }
                statement.mo7193bindText(7, entity.getCategory());
                String _tmpLocationName = entity.getLocationName();
                if (_tmpLocationName == null) {
                    statement.mo7192bindNull(8);
                } else {
                    statement.mo7193bindText(8, _tmpLocationName);
                }
                statement.mo7193bindText(9, entity.getComment());
                statement.mo7193bindText(10, entity.getTags());
                Long _tmp_1 = LogEntryDao_Impl.this.__converters.fromInstant(entity.getCreatedAt());
                if (_tmp_1 != null) {
                    statement.mo7191bindLong(11, _tmp_1.longValue());
                } else {
                    statement.mo7192bindNull(11);
                }
                Long _tmp_2 = LogEntryDao_Impl.this.__converters.fromInstant(entity.getUpdatedAt());
                if (_tmp_2 != null) {
                    statement.mo7191bindLong(12, _tmp_2.longValue());
                } else {
                    statement.mo7192bindNull(12);
                }
            }
        };
        this.__deleteAdapterOfLogEntry = new EntityDeleteOrUpdateAdapter<LogEntry>() { // from class: com.hardlineforge.lala.data.LogEntryDao_Impl.2
            @Override // androidx.room.EntityDeleteOrUpdateAdapter
            protected String createQuery() {
                return "DELETE FROM `log_entries` WHERE `id` = ?";
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // androidx.room.EntityDeleteOrUpdateAdapter
            public void bind(SQLiteStatement statement, LogEntry entity) {
                Intrinsics.checkNotNullParameter(statement, "statement");
                Intrinsics.checkNotNullParameter(entity, "entity");
                statement.mo7193bindText(1, entity.getId());
            }
        };
        this.__updateAdapterOfLogEntry = new EntityDeleteOrUpdateAdapter<LogEntry>() { // from class: com.hardlineforge.lala.data.LogEntryDao_Impl.3
            @Override // androidx.room.EntityDeleteOrUpdateAdapter
            protected String createQuery() {
                return "UPDATE OR ABORT `log_entries` SET `id` = ?,`timestamp` = ?,`timezone` = ?,`gpsLat` = ?,`gpsLon` = ?,`gpsAccuracy` = ?,`category` = ?,`locationName` = ?,`comment` = ?,`tags` = ?,`createdAt` = ?,`updatedAt` = ? WHERE `id` = ?";
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // androidx.room.EntityDeleteOrUpdateAdapter
            public void bind(SQLiteStatement statement, LogEntry entity) {
                Intrinsics.checkNotNullParameter(statement, "statement");
                Intrinsics.checkNotNullParameter(entity, "entity");
                statement.mo7193bindText(1, entity.getId());
                Long _tmp = LogEntryDao_Impl.this.__converters.fromInstant(entity.getTimestamp());
                if (_tmp != null) {
                    statement.mo7191bindLong(2, _tmp.longValue());
                } else {
                    statement.mo7192bindNull(2);
                }
                statement.mo7193bindText(3, entity.getTimezone());
                Double _tmpGpsLat = entity.getGpsLat();
                if (_tmpGpsLat != null) {
                    statement.mo7190bindDouble(4, _tmpGpsLat.doubleValue());
                } else {
                    statement.mo7192bindNull(4);
                }
                Double _tmpGpsLon = entity.getGpsLon();
                if (_tmpGpsLon != null) {
                    statement.mo7190bindDouble(5, _tmpGpsLon.doubleValue());
                } else {
                    statement.mo7192bindNull(5);
                }
                Float _tmpGpsAccuracy = entity.getGpsAccuracy();
                if (_tmpGpsAccuracy != null) {
                    statement.mo7190bindDouble(6, _tmpGpsAccuracy.floatValue());
                } else {
                    statement.mo7192bindNull(6);
                }
                statement.mo7193bindText(7, entity.getCategory());
                String _tmpLocationName = entity.getLocationName();
                if (_tmpLocationName == null) {
                    statement.mo7192bindNull(8);
                } else {
                    statement.mo7193bindText(8, _tmpLocationName);
                }
                statement.mo7193bindText(9, entity.getComment());
                statement.mo7193bindText(10, entity.getTags());
                Long _tmp_1 = LogEntryDao_Impl.this.__converters.fromInstant(entity.getCreatedAt());
                if (_tmp_1 != null) {
                    statement.mo7191bindLong(11, _tmp_1.longValue());
                } else {
                    statement.mo7192bindNull(11);
                }
                Long _tmp_2 = LogEntryDao_Impl.this.__converters.fromInstant(entity.getUpdatedAt());
                if (_tmp_2 != null) {
                    statement.mo7191bindLong(12, _tmp_2.longValue());
                } else {
                    statement.mo7192bindNull(12);
                }
                statement.mo7193bindText(13, entity.getId());
            }
        };
    }

    @Override // com.hardlineforge.lala.data.LogEntryDao
    public Object insert(final LogEntry entry, Continuation<? super Long> continuation) {
        return DBUtil.performSuspending(this.__db, false, true, new Function1() { // from class: com.hardlineforge.lala.data.LogEntryDao_Impl$$ExternalSyntheticLambda1
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return Long.valueOf(LogEntryDao_Impl.insert$lambda$0(LogEntryDao_Impl.this, entry, (SQLiteConnection) obj));
            }
        }, continuation);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final long insert$lambda$0(LogEntryDao_Impl this$0, LogEntry $entry, SQLiteConnection _connection) {
        Intrinsics.checkNotNullParameter(_connection, "_connection");
        long _result = this$0.__insertAdapterOfLogEntry.insertAndReturnId(_connection, $entry);
        return _result;
    }

    @Override // com.hardlineforge.lala.data.LogEntryDao
    public Object delete(final LogEntry entry, Continuation<? super Unit> continuation) {
        Object performSuspending = DBUtil.performSuspending(this.__db, false, true, new Function1() { // from class: com.hardlineforge.lala.data.LogEntryDao_Impl$$ExternalSyntheticLambda8
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return LogEntryDao_Impl.delete$lambda$1(LogEntryDao_Impl.this, entry, (SQLiteConnection) obj);
            }
        }, continuation);
        return performSuspending == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? performSuspending : Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit delete$lambda$1(LogEntryDao_Impl this$0, LogEntry $entry, SQLiteConnection _connection) {
        Intrinsics.checkNotNullParameter(_connection, "_connection");
        this$0.__deleteAdapterOfLogEntry.handle(_connection, $entry);
        return Unit.INSTANCE;
    }

    @Override // com.hardlineforge.lala.data.LogEntryDao
    public Object update(final LogEntry entry, Continuation<? super Unit> continuation) {
        Object performSuspending = DBUtil.performSuspending(this.__db, false, true, new Function1() { // from class: com.hardlineforge.lala.data.LogEntryDao_Impl$$ExternalSyntheticLambda4
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return LogEntryDao_Impl.update$lambda$2(LogEntryDao_Impl.this, entry, (SQLiteConnection) obj);
            }
        }, continuation);
        return performSuspending == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? performSuspending : Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit update$lambda$2(LogEntryDao_Impl this$0, LogEntry $entry, SQLiteConnection _connection) {
        Intrinsics.checkNotNullParameter(_connection, "_connection");
        this$0.__updateAdapterOfLogEntry.handle(_connection, $entry);
        return Unit.INSTANCE;
    }

    @Override // com.hardlineforge.lala.data.LogEntryDao
    public Flow<List<LogEntry>> getAll() {
        return FlowUtil.createFlow(this.__db, false, new String[]{"log_entries"}, new Function1() { // from class: com.hardlineforge.lala.data.LogEntryDao_Impl$$ExternalSyntheticLambda6
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return LogEntryDao_Impl.getAll$lambda$3(r1, this, (SQLiteConnection) obj);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final List getAll$lambda$3(String $_sql, LogEntryDao_Impl this$0, SQLiteConnection _connection) {
        int _columnIndexOfId;
        Long _tmp;
        Double _tmpGpsLat;
        Double _tmpGpsLon;
        Float _tmpGpsAccuracy;
        String _tmpLocationName;
        Long _tmp_2;
        Long _tmp_4;
        LogEntryDao_Impl logEntryDao_Impl = this$0;
        Intrinsics.checkNotNullParameter(_connection, "_connection");
        SQLiteStatement _stmt = _connection.prepare($_sql);
        try {
            int _columnIndexOfId2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "id");
            int _columnIndexOfTimestamp = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "timestamp");
            int _columnIndexOfTimezone = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "timezone");
            int _columnIndexOfGpsLat = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "gpsLat");
            int _columnIndexOfGpsLon = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "gpsLon");
            int _columnIndexOfGpsAccuracy = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "gpsAccuracy");
            int _columnIndexOfCategory = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "category");
            int _columnIndexOfLocationName = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "locationName");
            int _columnIndexOfComment = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "comment");
            int _columnIndexOfTags = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "tags");
            int _columnIndexOfCreatedAt = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "createdAt");
            int _columnIndexOfUpdatedAt = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "updatedAt");
            List _result = new ArrayList();
            while (_stmt.step()) {
                String _tmpId = _stmt.getText(_columnIndexOfId2);
                if (_stmt.isNull(_columnIndexOfTimestamp)) {
                    _columnIndexOfId = _columnIndexOfId2;
                    _tmp = null;
                } else {
                    Long _tmp2 = Long.valueOf(_stmt.getLong(_columnIndexOfTimestamp));
                    _columnIndexOfId = _columnIndexOfId2;
                    _tmp = _tmp2;
                }
                Instant _tmp_1 = logEntryDao_Impl.__converters.toInstant(_tmp);
                if (_tmp_1 == null) {
                    throw new IllegalStateException("Expected NON-NULL 'java.time.Instant', but it was NULL.".toString());
                }
                String _tmpTimezone = _stmt.getText(_columnIndexOfTimezone);
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
                if (_stmt.isNull(_columnIndexOfGpsAccuracy)) {
                    _tmpGpsAccuracy = null;
                } else {
                    Float _tmpGpsAccuracy2 = Float.valueOf((float) _stmt.getDouble(_columnIndexOfGpsAccuracy));
                    _tmpGpsAccuracy = _tmpGpsAccuracy2;
                }
                String _tmpCategory = _stmt.getText(_columnIndexOfCategory);
                if (_stmt.isNull(_columnIndexOfLocationName)) {
                    _tmpLocationName = null;
                } else {
                    String _tmpLocationName2 = _stmt.getText(_columnIndexOfLocationName);
                    _tmpLocationName = _tmpLocationName2;
                }
                String _tmpComment = _stmt.getText(_columnIndexOfComment);
                String _tmpTags = _stmt.getText(_columnIndexOfTags);
                if (_stmt.isNull(_columnIndexOfCreatedAt)) {
                    _tmp_2 = null;
                } else {
                    _tmp_2 = Long.valueOf(_stmt.getLong(_columnIndexOfCreatedAt));
                }
                Instant _tmp_3 = logEntryDao_Impl.__converters.toInstant(_tmp_2);
                if (_tmp_3 == null) {
                    throw new IllegalStateException("Expected NON-NULL 'java.time.Instant', but it was NULL.".toString());
                }
                if (_stmt.isNull(_columnIndexOfUpdatedAt)) {
                    _tmp_4 = null;
                } else {
                    Long _tmp_42 = Long.valueOf(_stmt.getLong(_columnIndexOfUpdatedAt));
                    _tmp_4 = _tmp_42;
                }
                Instant _tmp_5 = logEntryDao_Impl.__converters.toInstant(_tmp_4);
                if (_tmp_5 == null) {
                    throw new IllegalStateException("Expected NON-NULL 'java.time.Instant', but it was NULL.".toString());
                }
                LogEntry _item = new LogEntry(_tmpId, _tmp_1, _tmpTimezone, _tmpGpsLat, _tmpGpsLon, _tmpGpsAccuracy, _tmpCategory, _tmpLocationName, _tmpComment, _tmpTags, _tmp_3, _tmp_5);
                List _result2 = _result;
                _result2.add(_item);
                logEntryDao_Impl = this$0;
                _result = _result2;
                _columnIndexOfId2 = _columnIndexOfId;
            }
            return _result;
        } finally {
            _stmt.close();
        }
    }

    @Override // com.hardlineforge.lala.data.LogEntryDao
    public Object getById(final String id, Continuation<? super LogEntry> continuation) {
        return DBUtil.performSuspending(this.__db, true, false, new Function1() { // from class: com.hardlineforge.lala.data.LogEntryDao_Impl$$ExternalSyntheticLambda5
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return LogEntryDao_Impl.getById$lambda$4(r1, id, this, (SQLiteConnection) obj);
            }
        }, continuation);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final LogEntry getById$lambda$4(String $_sql, String $id, LogEntryDao_Impl this$0, SQLiteConnection _connection) {
        LogEntry _result;
        Long _tmp;
        Double _tmpGpsLat;
        Double _tmpGpsLon;
        Float _tmpGpsAccuracy;
        String _tmpLocationName;
        Long _tmp_2;
        Long _tmp_4;
        Intrinsics.checkNotNullParameter(_connection, "_connection");
        SQLiteStatement _stmt = _connection.prepare($_sql);
        try {
            _stmt.mo7193bindText(1, $id);
            int _columnIndexOfId = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "id");
            int _columnIndexOfTimestamp = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "timestamp");
            int _columnIndexOfTimezone = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "timezone");
            int _columnIndexOfGpsLat = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "gpsLat");
            int _columnIndexOfGpsLon = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "gpsLon");
            int _columnIndexOfGpsAccuracy = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "gpsAccuracy");
            int _columnIndexOfCategory = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "category");
            int _columnIndexOfLocationName = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "locationName");
            int _columnIndexOfComment = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "comment");
            int _columnIndexOfTags = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "tags");
            int _columnIndexOfCreatedAt = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "createdAt");
            int _columnIndexOfUpdatedAt = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "updatedAt");
            if (_stmt.step()) {
                String _tmpId = _stmt.getText(_columnIndexOfId);
                if (_stmt.isNull(_columnIndexOfTimestamp)) {
                    _tmp = null;
                } else {
                    Long _tmp2 = Long.valueOf(_stmt.getLong(_columnIndexOfTimestamp));
                    _tmp = _tmp2;
                }
                Instant _tmp_1 = this$0.__converters.toInstant(_tmp);
                if (_tmp_1 == null) {
                    throw new IllegalStateException("Expected NON-NULL 'java.time.Instant', but it was NULL.".toString());
                }
                String _tmpTimezone = _stmt.getText(_columnIndexOfTimezone);
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
                if (_stmt.isNull(_columnIndexOfGpsAccuracy)) {
                    _tmpGpsAccuracy = null;
                } else {
                    Float _tmpGpsAccuracy2 = Float.valueOf((float) _stmt.getDouble(_columnIndexOfGpsAccuracy));
                    _tmpGpsAccuracy = _tmpGpsAccuracy2;
                }
                String _tmpCategory = _stmt.getText(_columnIndexOfCategory);
                if (_stmt.isNull(_columnIndexOfLocationName)) {
                    _tmpLocationName = null;
                } else {
                    String _tmpLocationName2 = _stmt.getText(_columnIndexOfLocationName);
                    _tmpLocationName = _tmpLocationName2;
                }
                String _tmpComment = _stmt.getText(_columnIndexOfComment);
                String _tmpTags = _stmt.getText(_columnIndexOfTags);
                if (_stmt.isNull(_columnIndexOfCreatedAt)) {
                    _tmp_2 = null;
                } else {
                    _tmp_2 = Long.valueOf(_stmt.getLong(_columnIndexOfCreatedAt));
                }
                Instant _tmp_3 = this$0.__converters.toInstant(_tmp_2);
                if (_tmp_3 == null) {
                    throw new IllegalStateException("Expected NON-NULL 'java.time.Instant', but it was NULL.".toString());
                }
                if (_stmt.isNull(_columnIndexOfUpdatedAt)) {
                    _tmp_4 = null;
                } else {
                    Long _tmp_42 = Long.valueOf(_stmt.getLong(_columnIndexOfUpdatedAt));
                    _tmp_4 = _tmp_42;
                }
                Instant _tmp_5 = this$0.__converters.toInstant(_tmp_4);
                if (_tmp_5 != null) {
                    _result = new LogEntry(_tmpId, _tmp_1, _tmpTimezone, _tmpGpsLat, _tmpGpsLon, _tmpGpsAccuracy, _tmpCategory, _tmpLocationName, _tmpComment, _tmpTags, _tmp_3, _tmp_5);
                } else {
                    throw new IllegalStateException("Expected NON-NULL 'java.time.Instant', but it was NULL.".toString());
                }
            } else {
                _result = null;
            }
            return _result;
        } finally {
            _stmt.close();
        }
    }

    @Override // com.hardlineforge.lala.data.LogEntryDao
    public Flow<List<LogEntry>> getByCategory(final String category) {
        Intrinsics.checkNotNullParameter(category, "category");
        return FlowUtil.createFlow(this.__db, false, new String[]{"log_entries"}, new Function1() { // from class: com.hardlineforge.lala.data.LogEntryDao_Impl$$ExternalSyntheticLambda2
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return LogEntryDao_Impl.getByCategory$lambda$5(r1, category, this, (SQLiteConnection) obj);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final List getByCategory$lambda$5(String $_sql, String $category, LogEntryDao_Impl this$0, SQLiteConnection _connection) {
        Long _tmp;
        Double _tmpGpsLat;
        Double _tmpGpsLon;
        int _columnIndexOfId;
        Float _tmpGpsAccuracy;
        String _tmpLocationName;
        Long _tmp_2;
        Long _tmp_4;
        Intrinsics.checkNotNullParameter(_connection, "_connection");
        SQLiteStatement _stmt = _connection.prepare($_sql);
        try {
            _stmt.mo7193bindText(1, $category);
            int _columnIndexOfId2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "id");
            int _columnIndexOfTimestamp = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "timestamp");
            int _columnIndexOfTimezone = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "timezone");
            int _columnIndexOfGpsLat = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "gpsLat");
            int _columnIndexOfGpsLon = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "gpsLon");
            int _columnIndexOfGpsAccuracy = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "gpsAccuracy");
            int _columnIndexOfCategory = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "category");
            int _columnIndexOfLocationName = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "locationName");
            int _columnIndexOfComment = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "comment");
            int _columnIndexOfTags = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "tags");
            int _columnIndexOfCreatedAt = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "createdAt");
            int _columnIndexOfUpdatedAt = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "updatedAt");
            List _result = new ArrayList();
            while (_stmt.step()) {
                String _tmpId = _stmt.getText(_columnIndexOfId2);
                if (_stmt.isNull(_columnIndexOfTimestamp)) {
                    _tmp = null;
                } else {
                    Long _tmp2 = Long.valueOf(_stmt.getLong(_columnIndexOfTimestamp));
                    _tmp = _tmp2;
                }
                Instant _tmp_1 = this$0.__converters.toInstant(_tmp);
                if (_tmp_1 == null) {
                    throw new IllegalStateException("Expected NON-NULL 'java.time.Instant', but it was NULL.".toString());
                }
                String _tmpTimezone = _stmt.getText(_columnIndexOfTimezone);
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
                if (_stmt.isNull(_columnIndexOfGpsAccuracy)) {
                    _columnIndexOfId = _columnIndexOfId2;
                    _tmpGpsAccuracy = null;
                } else {
                    _columnIndexOfId = _columnIndexOfId2;
                    Float _tmpGpsAccuracy2 = Float.valueOf((float) _stmt.getDouble(_columnIndexOfGpsAccuracy));
                    _tmpGpsAccuracy = _tmpGpsAccuracy2;
                }
                String _tmpCategory = _stmt.getText(_columnIndexOfCategory);
                if (_stmt.isNull(_columnIndexOfLocationName)) {
                    _tmpLocationName = null;
                } else {
                    String _tmpLocationName2 = _stmt.getText(_columnIndexOfLocationName);
                    _tmpLocationName = _tmpLocationName2;
                }
                String _tmpComment = _stmt.getText(_columnIndexOfComment);
                String _tmpTags = _stmt.getText(_columnIndexOfTags);
                if (_stmt.isNull(_columnIndexOfCreatedAt)) {
                    _tmp_2 = null;
                } else {
                    _tmp_2 = Long.valueOf(_stmt.getLong(_columnIndexOfCreatedAt));
                }
                int _columnIndexOfCreatedAt2 = _columnIndexOfCreatedAt;
                Instant _tmp_3 = this$0.__converters.toInstant(_tmp_2);
                if (_tmp_3 == null) {
                    throw new IllegalStateException("Expected NON-NULL 'java.time.Instant', but it was NULL.".toString());
                }
                if (_stmt.isNull(_columnIndexOfUpdatedAt)) {
                    _tmp_4 = null;
                } else {
                    Long _tmp_42 = Long.valueOf(_stmt.getLong(_columnIndexOfUpdatedAt));
                    _tmp_4 = _tmp_42;
                }
                int _columnIndexOfUpdatedAt2 = _columnIndexOfUpdatedAt;
                Instant _tmp_5 = this$0.__converters.toInstant(_tmp_4);
                if (_tmp_5 != null) {
                    LogEntry _item = new LogEntry(_tmpId, _tmp_1, _tmpTimezone, _tmpGpsLat, _tmpGpsLon, _tmpGpsAccuracy, _tmpCategory, _tmpLocationName, _tmpComment, _tmpTags, _tmp_3, _tmp_5);
                    List _result2 = _result;
                    _result2.add(_item);
                    _result = _result2;
                    _columnIndexOfId2 = _columnIndexOfId;
                    _columnIndexOfCreatedAt = _columnIndexOfCreatedAt2;
                    _columnIndexOfUpdatedAt = _columnIndexOfUpdatedAt2;
                } else {
                    throw new IllegalStateException("Expected NON-NULL 'java.time.Instant', but it was NULL.".toString());
                }
            }
            return _result;
        } finally {
            _stmt.close();
        }
    }

    @Override // com.hardlineforge.lala.data.LogEntryDao
    public Flow<List<LogEntry>> search(final String query) {
        Intrinsics.checkNotNullParameter(query, "query");
        return FlowUtil.createFlow(this.__db, false, new String[]{"log_entries"}, new Function1() { // from class: com.hardlineforge.lala.data.LogEntryDao_Impl$$ExternalSyntheticLambda3
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return LogEntryDao_Impl.search$lambda$6(r1, query, this, (SQLiteConnection) obj);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final List search$lambda$6(String $_sql, String $query, LogEntryDao_Impl this$0, SQLiteConnection _connection) {
        Long _tmp;
        Double _tmpGpsLat;
        Double _tmpGpsLon;
        Float _tmpGpsAccuracy;
        String _tmpLocationName;
        Long _tmp_2;
        Long _tmp_4;
        Intrinsics.checkNotNullParameter(_connection, "_connection");
        SQLiteStatement _stmt = _connection.prepare($_sql);
        try {
            _stmt.mo7193bindText(1, $query);
            _stmt.mo7193bindText(2, $query);
            _stmt.mo7193bindText(3, $query);
            _stmt.mo7193bindText(4, $query);
            int _columnIndexOfId = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "id");
            int _columnIndexOfTimestamp = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "timestamp");
            int _columnIndexOfTimezone = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "timezone");
            int _columnIndexOfGpsLat = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "gpsLat");
            int _columnIndexOfGpsLon = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "gpsLon");
            int _columnIndexOfGpsAccuracy = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "gpsAccuracy");
            int _columnIndexOfCategory = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "category");
            int _columnIndexOfLocationName = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "locationName");
            int _columnIndexOfComment = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "comment");
            int _columnIndexOfTags = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "tags");
            int _columnIndexOfCreatedAt = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "createdAt");
            int _columnIndexOfUpdatedAt = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "updatedAt");
            List _result = new ArrayList();
            while (_stmt.step()) {
                String _tmpId = _stmt.getText(_columnIndexOfId);
                if (_stmt.isNull(_columnIndexOfTimestamp)) {
                    _tmp = null;
                } else {
                    Long _tmp2 = Long.valueOf(_stmt.getLong(_columnIndexOfTimestamp));
                    _tmp = _tmp2;
                }
                Instant _tmp_1 = this$0.__converters.toInstant(_tmp);
                if (_tmp_1 == null) {
                    throw new IllegalStateException("Expected NON-NULL 'java.time.Instant', but it was NULL.".toString());
                }
                String _tmpTimezone = _stmt.getText(_columnIndexOfTimezone);
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
                if (_stmt.isNull(_columnIndexOfGpsAccuracy)) {
                    _tmpGpsAccuracy = null;
                } else {
                    Float _tmpGpsAccuracy2 = Float.valueOf((float) _stmt.getDouble(_columnIndexOfGpsAccuracy));
                    _tmpGpsAccuracy = _tmpGpsAccuracy2;
                }
                String _tmpCategory = _stmt.getText(_columnIndexOfCategory);
                if (_stmt.isNull(_columnIndexOfLocationName)) {
                    _tmpLocationName = null;
                } else {
                    String _tmpLocationName2 = _stmt.getText(_columnIndexOfLocationName);
                    _tmpLocationName = _tmpLocationName2;
                }
                String _tmpComment = _stmt.getText(_columnIndexOfComment);
                String _tmpTags = _stmt.getText(_columnIndexOfTags);
                if (_stmt.isNull(_columnIndexOfCreatedAt)) {
                    _tmp_2 = null;
                } else {
                    _tmp_2 = Long.valueOf(_stmt.getLong(_columnIndexOfCreatedAt));
                }
                int _columnIndexOfCreatedAt2 = _columnIndexOfCreatedAt;
                Instant _tmp_3 = this$0.__converters.toInstant(_tmp_2);
                if (_tmp_3 == null) {
                    throw new IllegalStateException("Expected NON-NULL 'java.time.Instant', but it was NULL.".toString());
                }
                if (_stmt.isNull(_columnIndexOfUpdatedAt)) {
                    _tmp_4 = null;
                } else {
                    Long _tmp_42 = Long.valueOf(_stmt.getLong(_columnIndexOfUpdatedAt));
                    _tmp_4 = _tmp_42;
                }
                int _columnIndexOfUpdatedAt2 = _columnIndexOfUpdatedAt;
                Instant _tmp_5 = this$0.__converters.toInstant(_tmp_4);
                if (_tmp_5 == null) {
                    throw new IllegalStateException("Expected NON-NULL 'java.time.Instant', but it was NULL.".toString());
                }
                LogEntry _item = new LogEntry(_tmpId, _tmp_1, _tmpTimezone, _tmpGpsLat, _tmpGpsLon, _tmpGpsAccuracy, _tmpCategory, _tmpLocationName, _tmpComment, _tmpTags, _tmp_3, _tmp_5);
                List _result2 = _result;
                _result2.add(_item);
                _result = _result2;
                _columnIndexOfCreatedAt = _columnIndexOfCreatedAt2;
                _columnIndexOfUpdatedAt = _columnIndexOfUpdatedAt2;
            }
            return _result;
        } finally {
            _stmt.close();
        }
    }

    @Override // com.hardlineforge.lala.data.LogEntryDao
    public Flow<List<LogEntry>> getByDateRange(final Instant start, final Instant end) {
        Intrinsics.checkNotNullParameter(start, "start");
        Intrinsics.checkNotNullParameter(end, "end");
        return FlowUtil.createFlow(this.__db, false, new String[]{"log_entries"}, new Function1() { // from class: com.hardlineforge.lala.data.LogEntryDao_Impl$$ExternalSyntheticLambda7
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return LogEntryDao_Impl.getByDateRange$lambda$7(r1, this, start, end, (SQLiteConnection) obj);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final List getByDateRange$lambda$7(String $_sql, LogEntryDao_Impl this$0, Instant $start, Instant $end, SQLiteConnection _connection) {
        Long _tmp_1;
        Long _tmp_12;
        Double _tmpGpsLat;
        Double _tmpGpsLon;
        Float _tmpGpsAccuracy;
        String _tmpLocationName;
        Long _tmp_4;
        Long _tmp_6;
        Intrinsics.checkNotNullParameter(_connection, "_connection");
        SQLiteStatement _stmt = _connection.prepare($_sql);
        try {
            Long _tmp = this$0.__converters.fromInstant($start);
            if (_tmp != null) {
                _stmt.mo7191bindLong(1, _tmp.longValue());
            } else {
                _stmt.mo7192bindNull(1);
            }
            Long _tmp_13 = this$0.__converters.fromInstant($end);
            if (_tmp_13 != null) {
                _stmt.mo7191bindLong(2, _tmp_13.longValue());
            } else {
                _stmt.mo7192bindNull(2);
            }
            int _columnIndexOfId = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "id");
            int _columnIndexOfTimestamp = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "timestamp");
            int _columnIndexOfTimezone = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "timezone");
            int _columnIndexOfGpsLat = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "gpsLat");
            int _columnIndexOfGpsLon = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "gpsLon");
            int _columnIndexOfGpsAccuracy = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "gpsAccuracy");
            int _columnIndexOfCategory = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "category");
            int _columnIndexOfLocationName = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "locationName");
            int _columnIndexOfComment = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "comment");
            int _columnIndexOfTags = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "tags");
            int _columnIndexOfCreatedAt = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "createdAt");
            int _columnIndexOfUpdatedAt = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "updatedAt");
            List _result = new ArrayList();
            while (_stmt.step()) {
                String _tmpId = _stmt.getText(_columnIndexOfId);
                if (_stmt.isNull(_columnIndexOfTimestamp)) {
                    _tmp_1 = _tmp_13;
                    _tmp_12 = null;
                } else {
                    Long _tmp_2 = Long.valueOf(_stmt.getLong(_columnIndexOfTimestamp));
                    _tmp_1 = _tmp_13;
                    _tmp_12 = _tmp_2;
                }
                Instant _tmp_3 = this$0.__converters.toInstant(_tmp_12);
                if (_tmp_3 == null) {
                    throw new IllegalStateException("Expected NON-NULL 'java.time.Instant', but it was NULL.".toString());
                }
                String _tmpTimezone = _stmt.getText(_columnIndexOfTimezone);
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
                if (_stmt.isNull(_columnIndexOfGpsAccuracy)) {
                    _tmpGpsAccuracy = null;
                } else {
                    Float _tmpGpsAccuracy2 = Float.valueOf((float) _stmt.getDouble(_columnIndexOfGpsAccuracy));
                    _tmpGpsAccuracy = _tmpGpsAccuracy2;
                }
                String _tmpCategory = _stmt.getText(_columnIndexOfCategory);
                if (_stmt.isNull(_columnIndexOfLocationName)) {
                    _tmpLocationName = null;
                } else {
                    String _tmpLocationName2 = _stmt.getText(_columnIndexOfLocationName);
                    _tmpLocationName = _tmpLocationName2;
                }
                String _tmpComment = _stmt.getText(_columnIndexOfComment);
                String _tmpTags = _stmt.getText(_columnIndexOfTags);
                if (_stmt.isNull(_columnIndexOfCreatedAt)) {
                    _tmp_4 = null;
                } else {
                    _tmp_4 = Long.valueOf(_stmt.getLong(_columnIndexOfCreatedAt));
                }
                int _columnIndexOfLocationName2 = _columnIndexOfLocationName;
                Instant _tmp_5 = this$0.__converters.toInstant(_tmp_4);
                if (_tmp_5 == null) {
                    throw new IllegalStateException("Expected NON-NULL 'java.time.Instant', but it was NULL.".toString());
                }
                if (_stmt.isNull(_columnIndexOfUpdatedAt)) {
                    _tmp_6 = null;
                } else {
                    Long _tmp_62 = Long.valueOf(_stmt.getLong(_columnIndexOfUpdatedAt));
                    _tmp_6 = _tmp_62;
                }
                int _columnIndexOfComment2 = _columnIndexOfComment;
                Instant _tmp_7 = this$0.__converters.toInstant(_tmp_6);
                if (_tmp_7 != null) {
                    LogEntry _item = new LogEntry(_tmpId, _tmp_3, _tmpTimezone, _tmpGpsLat, _tmpGpsLon, _tmpGpsAccuracy, _tmpCategory, _tmpLocationName, _tmpComment, _tmpTags, _tmp_5, _tmp_7);
                    List _result2 = _result;
                    _result2.add(_item);
                    _result = _result2;
                    _tmp_13 = _tmp_1;
                    _columnIndexOfLocationName = _columnIndexOfLocationName2;
                    _columnIndexOfComment = _columnIndexOfComment2;
                } else {
                    throw new IllegalStateException("Expected NON-NULL 'java.time.Instant', but it was NULL.".toString());
                }
            }
            return _result;
        } finally {
            _stmt.close();
        }
    }

    @Override // com.hardlineforge.lala.data.LogEntryDao
    public Object deleteById(final String id, Continuation<? super Unit> continuation) {
        Object performSuspending = DBUtil.performSuspending(this.__db, false, true, new Function1() { // from class: com.hardlineforge.lala.data.LogEntryDao_Impl$$ExternalSyntheticLambda0
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return LogEntryDao_Impl.deleteById$lambda$8(r1, id, (SQLiteConnection) obj);
            }
        }, continuation);
        return performSuspending == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? performSuspending : Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit deleteById$lambda$8(String $_sql, String $id, SQLiteConnection _connection) {
        Intrinsics.checkNotNullParameter(_connection, "_connection");
        SQLiteStatement _stmt = _connection.prepare($_sql);
        try {
            _stmt.mo7193bindText(1, $id);
            _stmt.step();
            _stmt.close();
            return Unit.INSTANCE;
        } catch (Throwable th) {
            _stmt.close();
            throw th;
        }
    }

    /* compiled from: LogEntryDao_Impl.kt */
    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\u0004\u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/hardlineforge/lala/data/LogEntryDao_Impl$Companion;", "", "<init>", "()V", "getRequiredConverters", "", "Lkotlin/reflect/KClass;", "app_debug"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
