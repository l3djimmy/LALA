package androidx.room.util;

import androidx.room.PooledConnection;
import androidx.room.RoomDatabase;
import androidx.room.Transactor;
import com.itextpdf.kernel.xmp.PdfConst;
import com.itextpdf.layout.properties.Property;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
/* JADX INFO: Add missing generic type declarations: [R] */
/* compiled from: DBUtil.kt */
@Metadata(d1 = {"\u0000\b\n\u0002\b\u0003\n\u0002\u0018\u0002\u0010\u0000\u001a\u0002H\u0001\"\u0004\b\u0000\u0010\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\n"}, d2 = {"<anonymous>", "R", "transactor", "Landroidx/room/Transactor;"}, k = 3, mv = {2, 1, 0}, xi = 176)
@DebugMetadata(c = "androidx.room.util.DBUtil__DBUtilKt$internalPerform$2", f = "DBUtil.kt", i = {0, 0, 1, 1, 2, 3}, l = {Property.ROTATION_INITIAL_HEIGHT, Property.ROTATION_INITIAL_WIDTH, Property.ROTATION_POINT_Y, 60, 65}, m = "invokeSuspend", n = {"transactor", PdfConst.Type, "transactor", PdfConst.Type, "transactor", "result"}, s = {"L$0", "L$1", "L$0", "L$1", "L$0", "L$0"})
/* loaded from: classes12.dex */
public final class DBUtil__DBUtilKt$internalPerform$2<R> extends SuspendLambda implements Function2<Transactor, Continuation<? super R>, Object> {
    final /* synthetic */ Function2<PooledConnection, Continuation<? super R>, Object> $block;
    final /* synthetic */ boolean $inTransaction;
    final /* synthetic */ boolean $isReadOnly;
    final /* synthetic */ RoomDatabase $this_internalPerform;
    /* synthetic */ Object L$0;
    Object L$1;
    int label;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public DBUtil__DBUtilKt$internalPerform$2(boolean z, boolean z2, RoomDatabase roomDatabase, Function2<? super PooledConnection, ? super Continuation<? super R>, ? extends Object> function2, Continuation<? super DBUtil__DBUtilKt$internalPerform$2> continuation) {
        super(2, continuation);
        this.$inTransaction = z;
        this.$isReadOnly = z2;
        this.$this_internalPerform = roomDatabase;
        this.$block = function2;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        DBUtil__DBUtilKt$internalPerform$2 dBUtil__DBUtilKt$internalPerform$2 = new DBUtil__DBUtilKt$internalPerform$2(this.$inTransaction, this.$isReadOnly, this.$this_internalPerform, this.$block, continuation);
        dBUtil__DBUtilKt$internalPerform$2.L$0 = obj;
        return dBUtil__DBUtilKt$internalPerform$2;
    }

    public final Object invoke(Transactor transactor, Continuation<? super R> continuation) {
        return ((DBUtil__DBUtilKt$internalPerform$2) create(transactor, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    @Override // kotlin.jvm.functions.Function2
    public /* bridge */ /* synthetic */ Object invoke(Transactor transactor, Object obj) {
        return invoke(transactor, (Continuation) ((Continuation) obj));
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x007d  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x009b  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00b7 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00b8  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00c1  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00da  */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r8) {
        /*
            Method dump skipped, instructions count: 262
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.room.util.DBUtil__DBUtilKt$internalPerform$2.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    public final Object invokeSuspend$$forInline(Object $result) {
        Transactor.SQLiteTransactionType type;
        Transactor transactor = (Transactor) this.L$0;
        if (this.$inTransaction) {
            if (this.$isReadOnly) {
                type = Transactor.SQLiteTransactionType.DEFERRED;
            } else {
                type = Transactor.SQLiteTransactionType.IMMEDIATE;
            }
            if (!this.$isReadOnly && !((Boolean) transactor.inTransaction(this)).booleanValue()) {
                this.$this_internalPerform.getInvalidationTracker().sync$room_runtime(this);
            }
            Object withTransaction = transactor.withTransaction(type, new DBUtil__DBUtilKt$internalPerform$2$result$1(this.$block, null), this);
            if (!this.$isReadOnly && !((Boolean) transactor.inTransaction(this)).booleanValue()) {
                this.$this_internalPerform.getInvalidationTracker().refreshAsync();
                return withTransaction;
            }
            return withTransaction;
        }
        return this.$block.invoke(transactor, this);
    }
}
