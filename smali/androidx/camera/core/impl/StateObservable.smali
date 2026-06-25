.class public abstract Landroidx/camera/core/impl/StateObservable;
.super Ljava/lang/Object;
.source "StateObservable.java"

# interfaces
.implements Landroidx/camera/core/impl/Observable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/impl/StateObservable$ErrorWrapper;,
        Landroidx/camera/core/impl/StateObservable$ObserverWrapper;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Landroidx/camera/core/impl/Observable<",
        "TT;>;"
    }
.end annotation


# static fields
.field private static final INITIAL_VERSION:I


# instance fields
.field private final mLock:Ljava/lang/Object;

.field private final mNotifySet:Ljava/util/concurrent/CopyOnWriteArraySet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArraySet<",
            "Landroidx/camera/core/impl/StateObservable$ObserverWrapper<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field private final mState:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private mUpdating:Z

.field private mVersion:I

.field private final mWrapperMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/Observable$Observer<",
            "-TT;>;",
            "Landroidx/camera/core/impl/StateObservable$ObserverWrapper<",
            "TT;>;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/Object;Z)V
    .locals 2
    .param p1, "initialState"    # Ljava/lang/Object;
    .param p2, "isError"    # Z

    .line 76
    .local p0, "this":Landroidx/camera/core/impl/StateObservable;, "Landroidx/camera/core/impl/StateObservable<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/impl/StateObservable;->mLock:Ljava/lang/Object;

    .line 65
    const/4 v0, 0x0

    iput v0, p0, Landroidx/camera/core/impl/StateObservable;->mVersion:I

    .line 67
    iput-boolean v0, p0, Landroidx/camera/core/impl/StateObservable;->mUpdating:Z

    .line 71
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/impl/StateObservable;->mWrapperMap:Ljava/util/Map;

    .line 73
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/impl/StateObservable;->mNotifySet:Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 77
    if-eqz p2, :cond_0

    .line 78
    instance-of v0, p1, Ljava/lang/Throwable;

    const-string v1, "Initial errors must be Throwable"

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 80
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    move-object v1, p1

    check-cast v1, Ljava/lang/Throwable;

    invoke-static {v1}, Landroidx/camera/core/impl/StateObservable$ErrorWrapper;->wrap(Ljava/lang/Throwable;)Landroidx/camera/core/impl/StateObservable$ErrorWrapper;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroidx/camera/core/impl/StateObservable;->mState:Ljava/util/concurrent/atomic/AtomicReference;

    goto :goto_0

    .line 82
    :cond_0
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroidx/camera/core/impl/StateObservable;->mState:Ljava/util/concurrent/atomic/AtomicReference;

    .line 85
    :goto_0
    return-void
.end method

.method private removeObserverLocked(Landroidx/camera/core/impl/Observable$Observer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/Observable$Observer<",
            "-TT;>;)V"
        }
    .end annotation

    .line 178
    .local p0, "this":Landroidx/camera/core/impl/StateObservable;, "Landroidx/camera/core/impl/StateObservable<TT;>;"
    .local p1, "observer":Landroidx/camera/core/impl/Observable$Observer;, "Landroidx/camera/core/impl/Observable$Observer<-TT;>;"
    iget-object v0, p0, Landroidx/camera/core/impl/StateObservable;->mWrapperMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/StateObservable$ObserverWrapper;

    .line 179
    .local v0, "wrapper":Landroidx/camera/core/impl/StateObservable$ObserverWrapper;, "Landroidx/camera/core/impl/StateObservable$ObserverWrapper<TT;>;"
    if-eqz v0, :cond_0

    .line 180
    invoke-virtual {v0}, Landroidx/camera/core/impl/StateObservable$ObserverWrapper;->close()V

    .line 181
    iget-object v1, p0, Landroidx/camera/core/impl/StateObservable;->mNotifySet:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/CopyOnWriteArraySet;->remove(Ljava/lang/Object;)Z

    .line 183
    :cond_0
    return-void
.end method

.method private updateStateInternal(Ljava/lang/Object;)V
    .locals 5
    .param p1, "newState"    # Ljava/lang/Object;

    .line 98
    .local p0, "this":Landroidx/camera/core/impl/StateObservable;, "Landroidx/camera/core/impl/StateObservable<TT;>;"
    iget-object v0, p0, Landroidx/camera/core/impl/StateObservable;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 99
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/impl/StateObservable;->mState:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 101
    .local v1, "oldState":Ljava/lang/Object;
    invoke-static {v1, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    monitor-exit v0

    return-void

    .line 102
    :cond_0
    iget v2, p0, Landroidx/camera/core/impl/StateObservable;->mVersion:I

    const/4 v3, 0x1

    add-int/2addr v2, v3

    iput v2, p0, Landroidx/camera/core/impl/StateObservable;->mVersion:I

    .line 103
    .local v2, "currentVersion":I
    iget-boolean v4, p0, Landroidx/camera/core/impl/StateObservable;->mUpdating:Z

    if-eqz v4, :cond_1

    monitor-exit v0

    return-void

    .line 104
    :cond_1
    iput-boolean v3, p0, Landroidx/camera/core/impl/StateObservable;->mUpdating:Z

    .line 105
    iget-object v3, p0, Landroidx/camera/core/impl/StateObservable;->mNotifySet:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v3}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 106
    .end local v1    # "oldState":Ljava/lang/Object;
    .local v3, "notifyIter":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroidx/camera/core/impl/StateObservable$ObserverWrapper<TT;>;>;"
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 110
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 111
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/StateObservable$ObserverWrapper;

    invoke-virtual {v0, v2}, Landroidx/camera/core/impl/StateObservable$ObserverWrapper;->update(I)V

    goto :goto_0

    .line 115
    :cond_2
    iget-object v1, p0, Landroidx/camera/core/impl/StateObservable;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 116
    :try_start_1
    iget v0, p0, Landroidx/camera/core/impl/StateObservable;->mVersion:I

    if-ne v0, v2, :cond_3

    .line 118
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/core/impl/StateObservable;->mUpdating:Z

    .line 119
    monitor-exit v1

    .line 128
    return-void

    .line 124
    :cond_3
    iget-object v0, p0, Landroidx/camera/core/impl/StateObservable;->mNotifySet:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    move-object v3, v0

    .line 125
    iget v0, p0, Landroidx/camera/core/impl/StateObservable;->mVersion:I

    move v2, v0

    .line 126
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 106
    .end local v2    # "currentVersion":I
    .end local v3    # "notifyIter":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroidx/camera/core/impl/StateObservable$ObserverWrapper<TT;>;>;"
    :catchall_1
    move-exception v1

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v1
.end method


# virtual methods
.method public addObserver(Ljava/util/concurrent/Executor;Landroidx/camera/core/impl/Observable$Observer;)V
    .locals 3
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Executor;",
            "Landroidx/camera/core/impl/Observable$Observer<",
            "-TT;>;)V"
        }
    .end annotation

    .line 154
    .local p0, "this":Landroidx/camera/core/impl/StateObservable;, "Landroidx/camera/core/impl/StateObservable<TT;>;"
    .local p2, "observer":Landroidx/camera/core/impl/Observable$Observer;, "Landroidx/camera/core/impl/Observable$Observer<-TT;>;"
    iget-object v0, p0, Landroidx/camera/core/impl/StateObservable;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 156
    :try_start_0
    invoke-direct {p0, p2}, Landroidx/camera/core/impl/StateObservable;->removeObserverLocked(Landroidx/camera/core/impl/Observable$Observer;)V

    .line 158
    new-instance v1, Landroidx/camera/core/impl/StateObservable$ObserverWrapper;

    iget-object v2, p0, Landroidx/camera/core/impl/StateObservable;->mState:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v1, v2, p1, p2}, Landroidx/camera/core/impl/StateObservable$ObserverWrapper;-><init>(Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/Executor;Landroidx/camera/core/impl/Observable$Observer;)V

    .line 159
    .local v1, "wrapper":Landroidx/camera/core/impl/StateObservable$ObserverWrapper;, "Landroidx/camera/core/impl/StateObservable$ObserverWrapper<TT;>;"
    iget-object v2, p0, Landroidx/camera/core/impl/StateObservable;->mWrapperMap:Ljava/util/Map;

    invoke-interface {v2, p2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    iget-object v2, p0, Landroidx/camera/core/impl/StateObservable;->mNotifySet:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v2, v1}, Ljava/util/concurrent/CopyOnWriteArraySet;->add(Ljava/lang/Object;)Z

    .line 161
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 166
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Landroidx/camera/core/impl/StateObservable$ObserverWrapper;->update(I)V

    .line 167
    return-void

    .line 161
    .end local v1    # "wrapper":Landroidx/camera/core/impl/StateObservable$ObserverWrapper;, "Landroidx/camera/core/impl/StateObservable$ObserverWrapper<TT;>;"
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public fetchData()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "TT;>;"
        }
    .end annotation

    .line 143
    .local p0, "this":Landroidx/camera/core/impl/StateObservable;, "Landroidx/camera/core/impl/StateObservable<TT;>;"
    iget-object v0, p0, Landroidx/camera/core/impl/StateObservable;->mState:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    .line 144
    .local v0, "state":Ljava/lang/Object;
    instance-of v1, v0, Landroidx/camera/core/impl/StateObservable$ErrorWrapper;

    if-eqz v1, :cond_0

    .line 145
    move-object v1, v0

    check-cast v1, Landroidx/camera/core/impl/StateObservable$ErrorWrapper;

    invoke-virtual {v1}, Landroidx/camera/core/impl/StateObservable$ErrorWrapper;->getError()Ljava/lang/Throwable;

    move-result-object v1

    invoke-static {v1}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    return-object v1

    .line 147
    :cond_0
    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFuture(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    return-object v1
.end method

.method public removeObserver(Landroidx/camera/core/impl/Observable$Observer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/Observable$Observer<",
            "-TT;>;)V"
        }
    .end annotation

    .line 171
    .local p0, "this":Landroidx/camera/core/impl/StateObservable;, "Landroidx/camera/core/impl/StateObservable<TT;>;"
    .local p1, "observer":Landroidx/camera/core/impl/Observable$Observer;, "Landroidx/camera/core/impl/Observable$Observer<-TT;>;"
    iget-object v0, p0, Landroidx/camera/core/impl/StateObservable;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 172
    :try_start_0
    invoke-direct {p0, p1}, Landroidx/camera/core/impl/StateObservable;->removeObserverLocked(Landroidx/camera/core/impl/Observable$Observer;)V

    .line 173
    monitor-exit v0

    .line 174
    return-void

    .line 173
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method updateState(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 88
    .local p0, "this":Landroidx/camera/core/impl/StateObservable;, "Landroidx/camera/core/impl/StateObservable<TT;>;"
    .local p1, "state":Ljava/lang/Object;, "TT;"
    invoke-direct {p0, p1}, Landroidx/camera/core/impl/StateObservable;->updateStateInternal(Ljava/lang/Object;)V

    .line 89
    return-void
.end method

.method updateStateAsError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "error"    # Ljava/lang/Throwable;

    .line 92
    .local p0, "this":Landroidx/camera/core/impl/StateObservable;, "Landroidx/camera/core/impl/StateObservable<TT;>;"
    invoke-static {p1}, Landroidx/camera/core/impl/StateObservable$ErrorWrapper;->wrap(Ljava/lang/Throwable;)Landroidx/camera/core/impl/StateObservable$ErrorWrapper;

    move-result-object v0

    invoke-direct {p0, v0}, Landroidx/camera/core/impl/StateObservable;->updateStateInternal(Ljava/lang/Object;)V

    .line 93
    return-void
.end method
