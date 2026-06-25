.class final Landroidx/camera/core/impl/StateObservable$ObserverWrapper;
.super Ljava/lang/Object;
.source "StateObservable.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/core/impl/StateObservable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ObserverWrapper"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# static fields
.field private static final NOT_SET:Ljava/lang/Object;

.field private static final NO_VERSION:I = -0x1


# instance fields
.field private final mActive:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final mExecutor:Ljava/util/concurrent/Executor;

.field private mLastState:Ljava/lang/Object;

.field private mLatestSignalledVersion:I

.field private final mObserver:Landroidx/camera/core/impl/Observable$Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/Observable$Observer<",
            "-TT;>;"
        }
    .end annotation
.end field

.field private final mStateRef:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private mWrapperUpdating:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 186
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Landroidx/camera/core/impl/StateObservable$ObserverWrapper;->NOT_SET:Ljava/lang/Object;

    return-void
.end method

.method constructor <init>(Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/Executor;Landroidx/camera/core/impl/Observable$Observer;)V
    .locals 2
    .param p2, "executor"    # Ljava/util/concurrent/Executor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/concurrent/Executor;",
            "Landroidx/camera/core/impl/Observable$Observer<",
            "-TT;>;)V"
        }
    .end annotation

    .line 202
    .local p0, "this":Landroidx/camera/core/impl/StateObservable$ObserverWrapper;, "Landroidx/camera/core/impl/StateObservable$ObserverWrapper<TT;>;"
    .local p1, "stateRef":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Ljava/lang/Object;>;"
    .local p3, "observer":Landroidx/camera/core/impl/Observable$Observer;, "Landroidx/camera/core/impl/Observable$Observer<-TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 191
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Landroidx/camera/core/impl/StateObservable$ObserverWrapper;->mActive:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 195
    sget-object v0, Landroidx/camera/core/impl/StateObservable$ObserverWrapper;->NOT_SET:Ljava/lang/Object;

    iput-object v0, p0, Landroidx/camera/core/impl/StateObservable$ObserverWrapper;->mLastState:Ljava/lang/Object;

    .line 196
    const/4 v0, -0x1

    iput v0, p0, Landroidx/camera/core/impl/StateObservable$ObserverWrapper;->mLatestSignalledVersion:I

    .line 198
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/core/impl/StateObservable$ObserverWrapper;->mWrapperUpdating:Z

    .line 203
    iput-object p1, p0, Landroidx/camera/core/impl/StateObservable$ObserverWrapper;->mStateRef:Ljava/util/concurrent/atomic/AtomicReference;

    .line 204
    iput-object p2, p0, Landroidx/camera/core/impl/StateObservable$ObserverWrapper;->mExecutor:Ljava/util/concurrent/Executor;

    .line 205
    iput-object p3, p0, Landroidx/camera/core/impl/StateObservable$ObserverWrapper;->mObserver:Landroidx/camera/core/impl/Observable$Observer;

    .line 206
    return-void
.end method


# virtual methods
.method close()V
    .locals 2

    .line 278
    .local p0, "this":Landroidx/camera/core/impl/StateObservable$ObserverWrapper;, "Landroidx/camera/core/impl/StateObservable$ObserverWrapper<TT;>;"
    iget-object v0, p0, Landroidx/camera/core/impl/StateObservable$ObserverWrapper;->mActive:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 279
    return-void
.end method

.method public run()V
    .locals 5

    .line 213
    .local p0, "this":Landroidx/camera/core/impl/StateObservable$ObserverWrapper;, "Landroidx/camera/core/impl/StateObservable$ObserverWrapper<TT;>;"
    monitor-enter p0

    .line 215
    :try_start_0
    iget-object v0, p0, Landroidx/camera/core/impl/StateObservable$ObserverWrapper;->mActive:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 216
    iput-boolean v1, p0, Landroidx/camera/core/impl/StateObservable$ObserverWrapper;->mWrapperUpdating:Z

    .line 217
    monitor-exit p0

    return-void

    .line 220
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/impl/StateObservable$ObserverWrapper;->mStateRef:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    .line 221
    .local v0, "newState":Ljava/lang/Object;
    iget v2, p0, Landroidx/camera/core/impl/StateObservable$ObserverWrapper;->mLatestSignalledVersion:I

    .line 222
    .local v2, "currentVersion":I
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 227
    :goto_0
    iget-object v3, p0, Landroidx/camera/core/impl/StateObservable$ObserverWrapper;->mLastState:Ljava/lang/Object;

    invoke-static {v3, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 228
    iput-object v0, p0, Landroidx/camera/core/impl/StateObservable$ObserverWrapper;->mLastState:Ljava/lang/Object;

    .line 229
    instance-of v3, v0, Landroidx/camera/core/impl/StateObservable$ErrorWrapper;

    .line 232
    iget-object v4, p0, Landroidx/camera/core/impl/StateObservable$ObserverWrapper;->mObserver:Landroidx/camera/core/impl/Observable$Observer;

    .line 229
    if-eqz v3, :cond_1

    .line 230
    move-object v3, v0

    check-cast v3, Landroidx/camera/core/impl/StateObservable$ErrorWrapper;

    invoke-virtual {v3}, Landroidx/camera/core/impl/StateObservable$ErrorWrapper;->getError()Ljava/lang/Throwable;

    move-result-object v3

    invoke-interface {v4, v3}, Landroidx/camera/core/impl/Observable$Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 232
    :cond_1
    invoke-interface {v4, v0}, Landroidx/camera/core/impl/Observable$Observer;->onNewData(Ljava/lang/Object;)V

    .line 236
    :cond_2
    :goto_1
    monitor-enter p0

    .line 237
    :try_start_1
    iget v3, p0, Landroidx/camera/core/impl/StateObservable$ObserverWrapper;->mLatestSignalledVersion:I

    if-eq v2, v3, :cond_4

    iget-object v3, p0, Landroidx/camera/core/impl/StateObservable$ObserverWrapper;->mActive:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v3

    if-nez v3, :cond_3

    goto :goto_2

    .line 244
    :cond_3
    iget-object v3, p0, Landroidx/camera/core/impl/StateObservable$ObserverWrapper;->mStateRef:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    .line 245
    iget v3, p0, Landroidx/camera/core/impl/StateObservable$ObserverWrapper;->mLatestSignalledVersion:I

    move v2, v3

    .line 246
    monitor-exit p0

    goto :goto_0

    .line 239
    :cond_4
    :goto_2
    iput-boolean v1, p0, Landroidx/camera/core/impl/StateObservable$ObserverWrapper;->mWrapperUpdating:Z

    .line 240
    monitor-exit p0

    .line 248
    return-void

    .line 246
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    .line 222
    .end local v0    # "newState":Ljava/lang/Object;
    .end local v2    # "currentVersion":I
    :catchall_1
    move-exception v0

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v0
.end method

.method update(I)V
    .locals 2
    .param p1, "version"    # I

    .line 251
    .local p0, "this":Landroidx/camera/core/impl/StateObservable$ObserverWrapper;, "Landroidx/camera/core/impl/StateObservable$ObserverWrapper<TT;>;"
    monitor-enter p0

    .line 253
    :try_start_0
    iget-object v0, p0, Landroidx/camera/core/impl/StateObservable$ObserverWrapper;->mActive:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_0

    monitor-exit p0

    return-void

    .line 255
    :cond_0
    iget v0, p0, Landroidx/camera/core/impl/StateObservable$ObserverWrapper;->mLatestSignalledVersion:I

    if-gt p1, v0, :cond_1

    monitor-exit p0

    return-void

    .line 256
    :cond_1
    iput p1, p0, Landroidx/camera/core/impl/StateObservable$ObserverWrapper;->mLatestSignalledVersion:I

    .line 258
    iget-boolean v0, p0, Landroidx/camera/core/impl/StateObservable$ObserverWrapper;->mWrapperUpdating:Z

    if-eqz v0, :cond_2

    monitor-exit p0

    return-void

    .line 259
    :cond_2
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/camera/core/impl/StateObservable$ObserverWrapper;->mWrapperUpdating:Z

    .line 260
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 263
    :try_start_1
    iget-object v0, p0, Landroidx/camera/core/impl/StateObservable$ObserverWrapper;->mExecutor:Ljava/util/concurrent/Executor;

    invoke-interface {v0, p0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 273
    goto :goto_0

    .line 264
    :catchall_0
    move-exception v0

    .line 269
    .local v0, "t":Ljava/lang/Throwable;
    monitor-enter p0

    .line 271
    const/4 v1, 0x0

    :try_start_2
    iput-boolean v1, p0, Landroidx/camera/core/impl/StateObservable$ObserverWrapper;->mWrapperUpdating:Z

    .line 272
    monitor-exit p0

    .line 274
    .end local v0    # "t":Ljava/lang/Throwable;
    :goto_0
    return-void

    .line 272
    .restart local v0    # "t":Ljava/lang/Throwable;
    :catchall_1
    move-exception v1

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v1

    .line 260
    .end local v0    # "t":Ljava/lang/Throwable;
    :catchall_2
    move-exception v0

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    throw v0
.end method
