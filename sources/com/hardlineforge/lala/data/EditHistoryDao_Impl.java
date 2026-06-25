package com.hardlineforge.lala.data;

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
/* compiled from: EditHistoryDao_Impl.kt */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0010 \n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\b\u0007\u0018\u0000 \u00142\u00020\u0001:\u0001\u0014B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u0016\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\bH\u0096@¢\u0006\u0002\u0010\u000eJ\u001c\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\b0\u00102\u0006\u0010\u0011\u001a\u00020\u0012H\u0096@¢\u0006\u0002\u0010\u0013R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\b0\u0007X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0015"}, d2 = {"Lcom/hardlineforge/lala/data/EditHistoryDao_Impl;", "Lcom/hardlineforge/lala/data/EditHistoryDao;", "__db", "Landroidx/room/RoomDatabase;", "<init>", "(Landroidx/room/RoomDatabase;)V", "__insertAdapterOfEditHistory", "Landroidx/room/EntityInsertAdapter;", "Lcom/hardlineforge/lala/data/EditHistory;", "__converters", "Lcom/hardlineforge/lala/data/Converters;", "insert", "", "history", "(Lcom/hardlineforge/lala/data/EditHistory;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getByEntryId", "", "entryId", "", "(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "Companion", "app_debug"}, k = 1, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes7.dex */
public final class EditHistoryDao_Impl implements EditHistoryDao {
    private final Converters __converters;
    private final RoomDatabase __db;
    private final EntityInsertAdapter<EditHistory> __insertAdapterOfEditHistory;
    public static final Companion Companion = new Companion(null);
    public static final int $stable = 8;

    public EditHistoryDao_Impl(RoomDatabase __db) {
        Intrinsics.checkNotNullParameter(__db, "__db");
        this.__converters = new Converters();
        this.__db = __db;
        this.__insertAdapterOfEditHistory = new EntityInsertAdapter<EditHistory>() { // from class: com.hardlineforge.lala.data.EditHistoryDao_Impl.1
            @Override // androidx.room.EntityInsertAdapter
            protected String createQuery() {
                return "INSERT OR REPLACE INTO `edit_history` (`id`,`entryId`,`editedAt`,`note`) VALUES (?,?,?,?)";
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // androidx.room.EntityInsertAdapter
            public void bind(SQLiteStatement statement, EditHistory entity) {
                Intrinsics.checkNotNullParameter(statement, "statement");
                Intrinsics.checkNotNullParameter(entity, "entity");
                statement.mo7193bindText(1, entity.getId());
                statement.mo7193bindText(2, entity.getEntryId());
                Long _tmp = EditHistoryDao_Impl.this.__converters.fromInstant(entity.getEditedAt());
                if (_tmp != null) {
                    statement.mo7191bindLong(3, _tmp.longValue());
                } else {
                    statement.mo7192bindNull(3);
                }
                String _tmpNote = entity.getNote();
                if (_tmpNote == null) {
                    statement.mo7192bindNull(4);
                } else {
                    statement.mo7193bindText(4, _tmpNote);
                }
            }
        };
    }

    @Override // com.hardlineforge.lala.data.EditHistoryDao
    public Object insert(final EditHistory history, Continuation<? super Unit> continuation) {
        Object performSuspending = DBUtil.performSuspending(this.__db, false, true, new Function1() { // from class: com.hardlineforge.lala.data.EditHistoryDao_Impl$$ExternalSyntheticLambda0
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return EditHistoryDao_Impl.insert$lambda$0(EditHistoryDao_Impl.this, history, (SQLiteConnection) obj);
            }
        }, continuation);
        return performSuspending == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? performSuspending : Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit insert$lambda$0(EditHistoryDao_Impl this$0, EditHistory $history, SQLiteConnection _connection) {
        Intrinsics.checkNotNullParameter(_connection, "_connection");
        this$0.__insertAdapterOfEditHistory.insert(_connection, (SQLiteConnection) $history);
        return Unit.INSTANCE;
    }

    @Override // com.hardlineforge.lala.data.EditHistoryDao
    public Object getByEntryId(final String entryId, Continuation<? super List<EditHistory>> continuation) {
        return DBUtil.performSuspending(this.__db, true, false, new Function1() { // from class: com.hardlineforge.lala.data.EditHistoryDao_Impl$$ExternalSyntheticLambda1
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return EditHistoryDao_Impl.getByEntryId$lambda$1(r1, entryId, this, (SQLiteConnection) obj);
            }
        }, continuation);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final List getByEntryId$lambda$1(String $_sql, String $entryId, EditHistoryDao_Impl this$0, SQLiteConnection _connection) {
        Long _tmp;
        String _tmpNote;
        Intrinsics.checkNotNullParameter(_connection, "_connection");
        SQLiteStatement _stmt = _connection.prepare($_sql);
        boolean z = true;
        try {
            _stmt.mo7193bindText(1, $entryId);
            int _columnIndexOfId = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "id");
            int _columnIndexOfEntryId = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "entryId");
            int _columnIndexOfEditedAt = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "editedAt");
            int _columnIndexOfNote = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "note");
            List _result = new ArrayList();
            while (_stmt.step()) {
                String _tmpId = _stmt.getText(_columnIndexOfId);
                String _tmpEntryId = _stmt.getText(_columnIndexOfEntryId);
                if (_stmt.isNull(_columnIndexOfEditedAt)) {
                    _tmp = null;
                } else {
                    _tmp = Long.valueOf(_stmt.getLong(_columnIndexOfEditedAt));
                }
                boolean z2 = z;
                try {
                    Instant _tmp_1 = this$0.__converters.toInstant(_tmp);
                    if (_tmp_1 == null) {
                        throw new IllegalStateException("Expected NON-NULL 'java.time.Instant', but it was NULL.".toString());
                    }
                    if (_stmt.isNull(_columnIndexOfNote)) {
                        _tmpNote = null;
                    } else {
                        String _tmpNote2 = _stmt.getText(_columnIndexOfNote);
                        _tmpNote = _tmpNote2;
                    }
                    EditHistory _item = new EditHistory(_tmpId, _tmpEntryId, _tmp_1, _tmpNote);
                    _result.add(_item);
                    z = z2;
                } catch (Throwable th) {
                    th = th;
                    _stmt.close();
                    throw th;
                }
            }
            _stmt.close();
            return _result;
        } catch (Throwable th2) {
            th = th2;
        }
    }

    /* compiled from: EditHistoryDao_Impl.kt */
    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\u0004\u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/hardlineforge/lala/data/EditHistoryDao_Impl$Companion;", "", "<init>", "()V", "getRequiredConverters", "", "Lkotlin/reflect/KClass;", "app_debug"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
