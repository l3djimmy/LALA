package com.hardlineforge.lala.data;

import androidx.autofill.HintConstants;
import androidx.room.EntityDeleteOrUpdateAdapter;
import androidx.room.EntityInsertAdapter;
import androidx.room.RoomDatabase;
import androidx.room.coroutines.FlowUtil;
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
import kotlinx.coroutines.flow.Flow;
/* compiled from: CustomCategoryDao_Impl.kt */
@Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\b\u0002\b\u0007\u0018\u0000 \u00152\u00020\u0001:\u0001\u0015B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u0016\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\bH\u0096@¢\u0006\u0002\u0010\u0010J\u0016\u0010\u0011\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\bH\u0096@¢\u0006\u0002\u0010\u0010J\u0014\u0010\u0012\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\b0\u00140\u0013H\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\b0\u0007X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\b0\fX\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0016"}, d2 = {"Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;", "Lcom/hardlineforge/lala/data/CustomCategoryDao;", "__db", "Landroidx/room/RoomDatabase;", "<init>", "(Landroidx/room/RoomDatabase;)V", "__insertAdapterOfCustomCategory", "Landroidx/room/EntityInsertAdapter;", "Lcom/hardlineforge/lala/data/CustomCategory;", "__converters", "Lcom/hardlineforge/lala/data/Converters;", "__deleteAdapterOfCustomCategory", "Landroidx/room/EntityDeleteOrUpdateAdapter;", "insert", "", "category", "(Lcom/hardlineforge/lala/data/CustomCategory;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "delete", "getAll", "Lkotlinx/coroutines/flow/Flow;", "", "Companion", "app_debug"}, k = 1, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes7.dex */
public final class CustomCategoryDao_Impl implements CustomCategoryDao {
    private final Converters __converters;
    private final RoomDatabase __db;
    private final EntityDeleteOrUpdateAdapter<CustomCategory> __deleteAdapterOfCustomCategory;
    private final EntityInsertAdapter<CustomCategory> __insertAdapterOfCustomCategory;
    public static final Companion Companion = new Companion(null);
    public static final int $stable = 8;

    public CustomCategoryDao_Impl(RoomDatabase __db) {
        Intrinsics.checkNotNullParameter(__db, "__db");
        this.__converters = new Converters();
        this.__db = __db;
        this.__insertAdapterOfCustomCategory = new EntityInsertAdapter<CustomCategory>() { // from class: com.hardlineforge.lala.data.CustomCategoryDao_Impl.1
            @Override // androidx.room.EntityInsertAdapter
            protected String createQuery() {
                return "INSERT OR ABORT INTO `custom_categories` (`id`,`name`,`createdAt`) VALUES (?,?,?)";
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // androidx.room.EntityInsertAdapter
            public void bind(SQLiteStatement statement, CustomCategory entity) {
                Intrinsics.checkNotNullParameter(statement, "statement");
                Intrinsics.checkNotNullParameter(entity, "entity");
                statement.mo7193bindText(1, entity.getId());
                statement.mo7193bindText(2, entity.getName());
                Long _tmp = CustomCategoryDao_Impl.this.__converters.fromInstant(entity.getCreatedAt());
                if (_tmp != null) {
                    statement.mo7191bindLong(3, _tmp.longValue());
                } else {
                    statement.mo7192bindNull(3);
                }
            }
        };
        this.__deleteAdapterOfCustomCategory = new EntityDeleteOrUpdateAdapter<CustomCategory>() { // from class: com.hardlineforge.lala.data.CustomCategoryDao_Impl.2
            @Override // androidx.room.EntityDeleteOrUpdateAdapter
            protected String createQuery() {
                return "DELETE FROM `custom_categories` WHERE `id` = ?";
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // androidx.room.EntityDeleteOrUpdateAdapter
            public void bind(SQLiteStatement statement, CustomCategory entity) {
                Intrinsics.checkNotNullParameter(statement, "statement");
                Intrinsics.checkNotNullParameter(entity, "entity");
                statement.mo7193bindText(1, entity.getId());
            }
        };
    }

    @Override // com.hardlineforge.lala.data.CustomCategoryDao
    public Object insert(final CustomCategory category, Continuation<? super Unit> continuation) {
        Object performSuspending = DBUtil.performSuspending(this.__db, false, true, new Function1() { // from class: com.hardlineforge.lala.data.CustomCategoryDao_Impl$$ExternalSyntheticLambda0
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return CustomCategoryDao_Impl.insert$lambda$0(CustomCategoryDao_Impl.this, category, (SQLiteConnection) obj);
            }
        }, continuation);
        return performSuspending == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? performSuspending : Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit insert$lambda$0(CustomCategoryDao_Impl this$0, CustomCategory $category, SQLiteConnection _connection) {
        Intrinsics.checkNotNullParameter(_connection, "_connection");
        this$0.__insertAdapterOfCustomCategory.insert(_connection, (SQLiteConnection) $category);
        return Unit.INSTANCE;
    }

    @Override // com.hardlineforge.lala.data.CustomCategoryDao
    public Object delete(final CustomCategory category, Continuation<? super Unit> continuation) {
        Object performSuspending = DBUtil.performSuspending(this.__db, false, true, new Function1() { // from class: com.hardlineforge.lala.data.CustomCategoryDao_Impl$$ExternalSyntheticLambda1
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return CustomCategoryDao_Impl.delete$lambda$1(CustomCategoryDao_Impl.this, category, (SQLiteConnection) obj);
            }
        }, continuation);
        return performSuspending == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? performSuspending : Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit delete$lambda$1(CustomCategoryDao_Impl this$0, CustomCategory $category, SQLiteConnection _connection) {
        Intrinsics.checkNotNullParameter(_connection, "_connection");
        this$0.__deleteAdapterOfCustomCategory.handle(_connection, $category);
        return Unit.INSTANCE;
    }

    @Override // com.hardlineforge.lala.data.CustomCategoryDao
    public Flow<List<CustomCategory>> getAll() {
        return FlowUtil.createFlow(this.__db, false, new String[]{"custom_categories"}, new Function1() { // from class: com.hardlineforge.lala.data.CustomCategoryDao_Impl$$ExternalSyntheticLambda2
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return CustomCategoryDao_Impl.getAll$lambda$2(r1, this, (SQLiteConnection) obj);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final List getAll$lambda$2(String $_sql, CustomCategoryDao_Impl this$0, SQLiteConnection _connection) {
        Long _tmp;
        Intrinsics.checkNotNullParameter(_connection, "_connection");
        SQLiteStatement _stmt = _connection.prepare($_sql);
        try {
            int _columnIndexOfId = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "id");
            int _columnIndexOfName = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, HintConstants.AUTOFILL_HINT_NAME);
            int _columnIndexOfCreatedAt = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "createdAt");
            List _result = new ArrayList();
            while (_stmt.step()) {
                String _tmpId = _stmt.getText(_columnIndexOfId);
                String _tmpName = _stmt.getText(_columnIndexOfName);
                if (_stmt.isNull(_columnIndexOfCreatedAt)) {
                    _tmp = null;
                } else {
                    _tmp = Long.valueOf(_stmt.getLong(_columnIndexOfCreatedAt));
                }
                Instant _tmp_1 = this$0.__converters.toInstant(_tmp);
                if (_tmp_1 == null) {
                    throw new IllegalStateException("Expected NON-NULL 'java.time.Instant', but it was NULL.".toString());
                }
                CustomCategory _item = new CustomCategory(_tmpId, _tmpName, _tmp_1);
                _result.add(_item);
            }
            return _result;
        } finally {
            _stmt.close();
        }
    }

    /* compiled from: CustomCategoryDao_Impl.kt */
    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\u0004\u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl$Companion;", "", "<init>", "()V", "getRequiredConverters", "", "Lkotlin/reflect/KClass;", "app_debug"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
