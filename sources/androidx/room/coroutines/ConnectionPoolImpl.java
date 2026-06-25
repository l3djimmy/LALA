package androidx.room.coroutines;

import android.database.SQLException;
import androidx.room.concurrent.ThreadLocal_jvmAndroidKt;
import androidx.sqlite.SQLite;
import androidx.sqlite.SQLiteConnection;
import androidx.sqlite.SQLiteDriver;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
/* compiled from: ConnectionPoolImpl.kt */
@Metadata(d1 = {"\u0000l\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\b\u0000\u0018\u00002\u00020\u0001B!\b\u0016\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007¢\u0006\u0004\b\b\u0010\tB1\b\u0016\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\n\u001a\u00020\u0007\u0012\u0006\u0010\u000b\u001a\u00020\u0007\u0012\u0006\u0010\u0006\u001a\u00020\u0007¢\u0006\u0004\b\b\u0010\fJ@\u0010%\u001a\u0002H&\"\u0004\b\u0000\u0010&2\u0006\u0010'\u001a\u00020\u00182\"\u0010(\u001a\u001e\b\u0001\u0012\u0004\u0012\u00020*\u0012\n\u0012\b\u0012\u0004\u0012\u0002H&0+\u0012\u0006\u0012\u0004\u0018\u00010,0)H\u0096@¢\u0006\u0002\u0010-J\u0010\u0010.\u001a\u00020/2\u0006\u00100\u001a\u00020\u0014H\u0002J\u0010\u0010 \u001a\u0002012\u0006\u0010'\u001a\u00020\u0018H\u0002J\b\u00102\u001a\u000201H\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u000eX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u000eX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0011X\u0082\u0004¢\u0006\u0002\n\u0000R \u0010\u0012\u001a\u0012\u0012\u0004\u0012\u00020\u00140\u0013j\b\u0012\u0004\u0012\u00020\u0014`\u0015X\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u0016R\u000e\u0010\u0017\u001a\u00020\u0018X\u0082\u000e¢\u0006\u0002\n\u0000R\u001c\u0010\u0019\u001a\u00020\u001aX\u0080\u000e¢\u0006\u0010\n\u0002\u0010\u001f\u001a\u0004\b\u001b\u0010\u001c\"\u0004\b\u001d\u0010\u001eR\u001a\u0010 \u001a\u00020\u0007X\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b!\u0010\"\"\u0004\b#\u0010$¨\u00063"}, d2 = {"Landroidx/room/coroutines/ConnectionPoolImpl;", "Landroidx/room/coroutines/ConnectionPool;", "driver", "Landroidx/sqlite/SQLiteDriver;", "fileName", "", "preparedStatementCacheSize", "", "<init>", "(Landroidx/sqlite/SQLiteDriver;Ljava/lang/String;I)V", "maxNumOfReaders", "maxNumOfWriters", "(Landroidx/sqlite/SQLiteDriver;Ljava/lang/String;III)V", "readers", "Landroidx/room/coroutines/Pool;", "writers", "connectionElementKey", "Landroidx/room/coroutines/ConnectionElementKey;", "connectionThreadLocal", "Ljava/lang/ThreadLocal;", "Landroidx/room/coroutines/PooledConnectionImpl;", "Landroidx/room/concurrent/ThreadLocal;", "Ljava/lang/ThreadLocal;", "isClosed", "", "timeout", "Lkotlin/time/Duration;", "getTimeout-UwyO8pc$room_runtime", "()J", "setTimeout-LRDsOJo$room_runtime", "(J)V", "J", "onTimeout", "getOnTimeout$room_runtime", "()I", "setOnTimeout$room_runtime", "(I)V", "useConnection", "R", "isReadOnly", "block", "Lkotlin/Function2;", "Landroidx/room/Transactor;", "Lkotlin/coroutines/Continuation;", "", "(ZLkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "createConnectionContext", "Lkotlin/coroutines/CoroutineContext;", "connection", "", "close", "room-runtime"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes12.dex */
public final class ConnectionPoolImpl implements ConnectionPool {
    private final ConnectionElementKey connectionElementKey;
    private final ThreadLocal<PooledConnectionImpl> connectionThreadLocal;
    private final SQLiteDriver driver;
    private volatile boolean isClosed;
    private int onTimeout;
    private final Pool readers;
    private long timeout;
    private final Pool writers;

    /* renamed from: getTimeout-UwyO8pc$room_runtime  reason: not valid java name */
    public final long m7186getTimeoutUwyO8pc$room_runtime() {
        return this.timeout;
    }

    /* renamed from: setTimeout-LRDsOJo$room_runtime  reason: not valid java name */
    public final void m7187setTimeoutLRDsOJo$room_runtime(long j) {
        this.timeout = j;
    }

    public final int getOnTimeout$room_runtime() {
        return this.onTimeout;
    }

    public final void setOnTimeout$room_runtime(int i) {
        this.onTimeout = i;
    }

    public ConnectionPoolImpl(final SQLiteDriver driver, final String fileName, int preparedStatementCacheSize) {
        Intrinsics.checkNotNullParameter(driver, "driver");
        Intrinsics.checkNotNullParameter(fileName, "fileName");
        this.connectionElementKey = new ConnectionElementKey();
        this.connectionThreadLocal = new ThreadLocal<>();
        Duration.Companion companion = Duration.Companion;
        this.timeout = DurationKt.toDuration(30, DurationUnit.SECONDS);
        this.onTimeout = 2;
        this.driver = driver;
        this.readers = new Pool(1, new Function0() { // from class: androidx.room.coroutines.ConnectionPoolImpl$$ExternalSyntheticLambda3
            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                SQLiteConnection open;
                open = SQLiteDriver.this.open(fileName);
                return open;
            }
        }, preparedStatementCacheSize);
        this.writers = this.readers;
    }

    public ConnectionPoolImpl(final SQLiteDriver driver, final String fileName, int maxNumOfReaders, int maxNumOfWriters, int preparedStatementCacheSize) {
        Intrinsics.checkNotNullParameter(driver, "driver");
        Intrinsics.checkNotNullParameter(fileName, "fileName");
        this.connectionElementKey = new ConnectionElementKey();
        this.connectionThreadLocal = new ThreadLocal<>();
        Duration.Companion companion = Duration.Companion;
        this.timeout = DurationKt.toDuration(30, DurationUnit.SECONDS);
        this.onTimeout = 2;
        if (!(maxNumOfReaders > 0)) {
            throw new IllegalArgumentException("Maximum number of readers must be greater than 0".toString());
        }
        if (!(maxNumOfWriters > 0)) {
            throw new IllegalArgumentException("Maximum number of writers must be greater than 0".toString());
        }
        this.driver = driver;
        this.readers = new Pool(maxNumOfReaders, new Function0() { // from class: androidx.room.coroutines.ConnectionPoolImpl$$ExternalSyntheticLambda0
            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                return ConnectionPoolImpl._init_$lambda$4(SQLiteDriver.this, fileName);
            }
        }, preparedStatementCacheSize);
        this.writers = new Pool(maxNumOfWriters, new Function0() { // from class: androidx.room.coroutines.ConnectionPoolImpl$$ExternalSyntheticLambda1
            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                SQLiteConnection open;
                open = SQLiteDriver.this.open(fileName);
                return open;
            }
        }, preparedStatementCacheSize);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final SQLiteConnection _init_$lambda$4(SQLiteDriver $driver, String $fileName) {
        SQLiteConnection newConnection = $driver.open($fileName);
        SQLite.execSQL(newConnection, "PRAGMA query_only = 1");
        return newConnection;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x002d  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x0035  */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0049  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0076  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x007c  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0081  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x014c  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x014e  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x0158 A[Catch: all -> 0x01ae, TRY_LEAVE, TryCatch #5 {all -> 0x01ae, blocks: (B:62:0x0137, B:67:0x0148, B:71:0x014f, B:73:0x0158, B:85:0x01a2, B:86:0x01ad), top: B:115:0x0137 }] */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0189 A[Catch: all -> 0x019f, TRY_LEAVE, TryCatch #6 {, blocks: (B:78:0x0183, B:80:0x0189), top: B:116:0x0183 }] */
    /* JADX WARN: Removed duplicated region for block: B:85:0x01a2 A[Catch: all -> 0x01ae, TRY_ENTER, TryCatch #5 {all -> 0x01ae, blocks: (B:62:0x0137, B:67:0x0148, B:71:0x014f, B:73:0x0158, B:85:0x01a2, B:86:0x01ad), top: B:115:0x0137 }] */
    /* JADX WARN: Type inference failed for: r9v5, types: [androidx.room.coroutines.PooledConnectionImpl, T] */
    @Override // androidx.room.coroutines.ConnectionPool
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public <R> java.lang.Object useConnection(boolean r17, kotlin.jvm.functions.Function2<? super androidx.room.Transactor, ? super kotlin.coroutines.Continuation<? super R>, ? extends java.lang.Object> r18, kotlin.coroutines.Continuation<? super R> r19) {
        /*
            Method dump skipped, instructions count: 504
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.room.coroutines.ConnectionPoolImpl.useConnection(boolean, kotlin.jvm.functions.Function2, kotlin.coroutines.Continuation):java.lang.Object");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit useConnection$lambda$6(ConnectionPoolImpl this$0, boolean $isReadOnly) {
        this$0.onTimeout($isReadOnly);
        return Unit.INSTANCE;
    }

    private final CoroutineContext createConnectionContext(PooledConnectionImpl connection) {
        return new ConnectionElement(this.connectionElementKey, connection).plus(ThreadLocal_jvmAndroidKt.asContextElement(this.connectionThreadLocal, connection));
    }

    private final void onTimeout(boolean isReadOnly) {
        String readOrWrite = isReadOnly ? "reader" : "writer";
        StringBuilder $this$onTimeout_u24lambda_u248 = new StringBuilder();
        $this$onTimeout_u24lambda_u248.append("Timed out attempting to acquire a " + readOrWrite + " connection.").append('\n');
        $this$onTimeout_u24lambda_u248.append('\n');
        $this$onTimeout_u24lambda_u248.append("Writer pool:").append('\n');
        this.writers.dump($this$onTimeout_u24lambda_u248);
        $this$onTimeout_u24lambda_u248.append("Reader pool:").append('\n');
        this.readers.dump($this$onTimeout_u24lambda_u248);
        String message = $this$onTimeout_u24lambda_u248.toString();
        try {
            SQLite.throwSQLiteException(5, message);
            throw new KotlinNothingValueException();
        } catch (SQLException ex) {
            switch (this.onTimeout) {
                case 1:
                    throw ex;
                case 2:
                    ex.printStackTrace();
                    return;
                default:
                    return;
            }
        }
    }

    @Override // androidx.room.coroutines.ConnectionPool, java.lang.AutoCloseable
    public void close() {
        if (!this.isClosed) {
            this.isClosed = true;
            this.readers.close();
            this.writers.close();
        }
    }
}
