.class public final Landroidx/camera/core/impl/DeferrableSurfaces;
.super Ljava/lang/Object;
.source "DeferrableSurfaces.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    return-void
.end method

.method public static decrementAll(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/DeferrableSurface;",
            ">;)V"
        }
    .end annotation

    .line 175
    .local p0, "surfaceList":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/DeferrableSurface;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/DeferrableSurface;

    .line 176
    .local v1, "surface":Landroidx/camera/core/impl/DeferrableSurface;
    invoke-virtual {v1}, Landroidx/camera/core/impl/DeferrableSurface;->decrementUseCount()V

    .line 177
    .end local v1    # "surface":Landroidx/camera/core/impl/DeferrableSurface;
    goto :goto_0

    .line 178
    :cond_0
    return-void
.end method

.method public static incrementAll(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/DeferrableSurface;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/impl/DeferrableSurface$SurfaceClosedException;
        }
    .end annotation

    .line 148
    .local p0, "surfaceList":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/DeferrableSurface;>;"
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 149
    const/4 v0, 0x0

    .line 152
    .local v0, "i":I
    :cond_0
    :try_start_0
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/DeferrableSurface;

    invoke-virtual {v1}, Landroidx/camera/core/impl/DeferrableSurface;->incrementUseCount()V

    .line 155
    add-int/lit8 v0, v0, 0x1

    .line 156
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1
    :try_end_0
    .catch Landroidx/camera/core/impl/DeferrableSurface$SurfaceClosedException; {:try_start_0 .. :try_end_0} :catch_0

    if-lt v0, v1, :cond_0

    .line 165
    goto :goto_1

    .line 157
    :catch_0
    move-exception v1

    .line 159
    .local v1, "e":Landroidx/camera/core/impl/DeferrableSurface$SurfaceClosedException;
    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_1

    .line 160
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/DeferrableSurface;

    invoke-virtual {v2}, Landroidx/camera/core/impl/DeferrableSurface;->decrementUseCount()V

    .line 159
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 164
    :cond_1
    throw v1

    .line 167
    .end local v0    # "i":I
    .end local v1    # "e":Landroidx/camera/core/impl/DeferrableSurface$SurfaceClosedException;
    :cond_2
    :goto_1
    return-void
.end method

.method static synthetic lambda$surfaceListWithTimeout$0(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;J)V
    .locals 3
    .param p0, "listenableFuture"    # Lcom/google/common/util/concurrent/ListenableFuture;
    .param p1, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .param p2, "timeout"    # J

    .line 77
    invoke-interface {p0}, Lcom/google/common/util/concurrent/ListenableFuture;->isDone()Z

    move-result v0

    if-nez v0, :cond_0

    .line 78
    new-instance v0, Ljava/util/concurrent/TimeoutException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot complete surfaceList within "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/concurrent/TimeoutException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z

    .line 81
    const/4 v0, 0x1

    invoke-interface {p0, v0}, Lcom/google/common/util/concurrent/ListenableFuture;->cancel(Z)Z

    .line 83
    :cond_0
    return-void
.end method

.method static synthetic lambda$surfaceListWithTimeout$1(Ljava/util/concurrent/Executor;Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;J)V
    .locals 1
    .param p0, "executor"    # Ljava/util/concurrent/Executor;
    .param p1, "listenableFuture"    # Lcom/google/common/util/concurrent/ListenableFuture;
    .param p2, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .param p3, "timeout"    # J

    .line 76
    new-instance v0, Landroidx/camera/core/impl/DeferrableSurfaces$$ExternalSyntheticLambda1;

    invoke-direct {v0, p1, p2, p3, p4}, Landroidx/camera/core/impl/DeferrableSurfaces$$ExternalSyntheticLambda1;-><init>(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;J)V

    invoke-interface {p0, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 84
    return-void
.end method

.method static synthetic lambda$surfaceListWithTimeout$2(Lcom/google/common/util/concurrent/ListenableFuture;)V
    .locals 1
    .param p0, "listenableFuture"    # Lcom/google/common/util/concurrent/ListenableFuture;

    .line 88
    const/4 v0, 0x1

    invoke-interface {p0, v0}, Lcom/google/common/util/concurrent/ListenableFuture;->cancel(Z)Z

    return-void
.end method

.method static synthetic lambda$surfaceListWithTimeout$3(Ljava/util/List;Ljava/util/concurrent/ScheduledExecutorService;Ljava/util/concurrent/Executor;JZLandroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 6
    .param p0, "listenableFutureSurfaces"    # Ljava/util/List;
    .param p1, "scheduledExecutorService"    # Ljava/util/concurrent/ScheduledExecutorService;
    .param p2, "executor"    # Ljava/util/concurrent/Executor;
    .param p3, "timeout"    # J
    .param p5, "removeNullSurfaces"    # Z
    .param p6, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 72
    invoke-static {p0}, Landroidx/camera/core/impl/utils/futures/Futures;->successfulAsList(Ljava/util/Collection;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v2

    .line 75
    .local v2, "listenableFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Ljava/util/List<Landroid/view/Surface;>;>;"
    new-instance v0, Landroidx/camera/core/impl/DeferrableSurfaces$$ExternalSyntheticLambda2;

    move-object v1, p2

    move-wide v4, p3

    move-object v3, p6

    .end local p2    # "executor":Ljava/util/concurrent/Executor;
    .end local p3    # "timeout":J
    .end local p6    # "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .local v1, "executor":Ljava/util/concurrent/Executor;
    .local v3, "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .local v4, "timeout":J
    invoke-direct/range {v0 .. v5}, Landroidx/camera/core/impl/DeferrableSurfaces$$ExternalSyntheticLambda2;-><init>(Ljava/util/concurrent/Executor;Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;J)V

    sget-object p2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {p1, v0, v4, v5, p2}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object p2

    .line 88
    .local p2, "scheduledFuture":Ljava/util/concurrent/ScheduledFuture;, "Ljava/util/concurrent/ScheduledFuture<*>;"
    new-instance p3, Landroidx/camera/core/impl/DeferrableSurfaces$$ExternalSyntheticLambda3;

    invoke-direct {p3, v2}, Landroidx/camera/core/impl/DeferrableSurfaces$$ExternalSyntheticLambda3;-><init>(Lcom/google/common/util/concurrent/ListenableFuture;)V

    invoke-virtual {v3, p3, v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->addCancellationListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 91
    new-instance p3, Landroidx/camera/core/impl/DeferrableSurfaces$1;

    invoke-direct {p3, p5, v3, p2}, Landroidx/camera/core/impl/DeferrableSurfaces$1;-><init>(ZLandroidx/concurrent/futures/CallbackToFutureAdapter$Completer;Ljava/util/concurrent/ScheduledFuture;)V

    invoke-static {v2, p3, v1}, Landroidx/camera/core/impl/utils/futures/Futures;->addCallback(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/camera/core/impl/utils/futures/FutureCallback;Ljava/util/concurrent/Executor;)V

    .line 111
    const-string/jumbo p3, "surfaceList"

    return-object p3
.end method

.method public static surfaceListWithTimeout(Ljava/util/Collection;ZJLjava/util/concurrent/Executor;Ljava/util/concurrent/ScheduledExecutorService;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 8
    .param p1, "removeNullSurfaces"    # Z
    .param p2, "timeout"    # J
    .param p4, "executor"    # Ljava/util/concurrent/Executor;
    .param p5, "scheduledExecutorService"    # Ljava/util/concurrent/ScheduledExecutorService;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/impl/DeferrableSurface;",
            ">;ZJ",
            "Ljava/util/concurrent/Executor;",
            "Ljava/util/concurrent/ScheduledExecutorService;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/util/List<",
            "Landroid/view/Surface;",
            ">;>;"
        }
    .end annotation

    .line 63
    .local p0, "deferrableSurfaces":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/impl/DeferrableSurface;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v2, v0

    .line 65
    .local v2, "listenableFutureSurfaces":Ljava/util/List;, "Ljava/util/List<Lcom/google/common/util/concurrent/ListenableFuture<Landroid/view/Surface;>;>;"
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/DeferrableSurface;

    .line 66
    .local v1, "deferrableSurface":Landroidx/camera/core/impl/DeferrableSurface;
    nop

    .line 67
    invoke-virtual {v1}, Landroidx/camera/core/impl/DeferrableSurface;->getSurface()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v3

    invoke-static {v3}, Landroidx/camera/core/impl/utils/futures/Futures;->nonCancellationPropagating(Lcom/google/common/util/concurrent/ListenableFuture;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v3

    .line 66
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 68
    .end local v1    # "deferrableSurface":Landroidx/camera/core/impl/DeferrableSurface;
    goto :goto_0

    .line 70
    :cond_0
    new-instance v1, Landroidx/camera/core/impl/DeferrableSurfaces$$ExternalSyntheticLambda0;

    move v7, p1

    move-wide v5, p2

    move-object v4, p4

    move-object v3, p5

    .end local p1    # "removeNullSurfaces":Z
    .end local p2    # "timeout":J
    .end local p4    # "executor":Ljava/util/concurrent/Executor;
    .end local p5    # "scheduledExecutorService":Ljava/util/concurrent/ScheduledExecutorService;
    .local v3, "scheduledExecutorService":Ljava/util/concurrent/ScheduledExecutorService;
    .local v4, "executor":Ljava/util/concurrent/Executor;
    .local v5, "timeout":J
    .local v7, "removeNullSurfaces":Z
    invoke-direct/range {v1 .. v7}, Landroidx/camera/core/impl/DeferrableSurfaces$$ExternalSyntheticLambda0;-><init>(Ljava/util/List;Ljava/util/concurrent/ScheduledExecutorService;Ljava/util/concurrent/Executor;JZ)V

    invoke-static {v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object p1

    return-object p1
.end method

.method public static tryIncrementAll(Ljava/util/List;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/DeferrableSurface;",
            ">;)Z"
        }
    .end annotation

    .line 127
    .local p0, "surfaceList":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/DeferrableSurface;>;"
    :try_start_0
    invoke-static {p0}, Landroidx/camera/core/impl/DeferrableSurfaces;->incrementAll(Ljava/util/List;)V
    :try_end_0
    .catch Landroidx/camera/core/impl/DeferrableSurface$SurfaceClosedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 130
    nop

    .line 132
    const/4 v0, 0x1

    return v0

    .line 128
    :catch_0
    move-exception v0

    .line 129
    .local v0, "e":Landroidx/camera/core/impl/DeferrableSurface$SurfaceClosedException;
    const/4 v1, 0x0

    return v1
.end method
