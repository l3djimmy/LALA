.class Landroidx/camera/core/impl/utils/futures/ListFuture;
.super Ljava/lang/Object;
.source "ListFuture.java"

# interfaces
.implements Lcom/google/common/util/concurrent/ListenableFuture;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/common/util/concurrent/ListenableFuture<",
        "Ljava/util/List<",
        "TV;>;>;"
    }
.end annotation


# instance fields
.field private final mAllMustSucceed:Z

.field mFutures:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "+",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "+TV;>;>;"
        }
    .end annotation
.end field

.field private final mRemaining:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final mResult:Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/util/List<",
            "TV;>;>;"
        }
    .end annotation
.end field

.field mResultNotifier:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<",
            "Ljava/util/List<",
            "TV;>;>;"
        }
    .end annotation
.end field

.field mValues:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "TV;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/List;ZLjava/util/concurrent/Executor;)V
    .locals 2
    .param p2, "allMustSucceed"    # Z
    .param p3, "listenerExecutor"    # Ljava/util/concurrent/Executor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "+TV;>;>;Z",
            "Ljava/util/concurrent/Executor;",
            ")V"
        }
    .end annotation

    .line 76
    .local p0, "this":Landroidx/camera/core/impl/utils/futures/ListFuture;, "Landroidx/camera/core/impl/utils/futures/ListFuture<TV;>;"
    .local p1, "futures":Ljava/util/List;, "Ljava/util/List<+Lcom/google/common/util/concurrent/ListenableFuture<+TV;>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    invoke-static {p1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mFutures:Ljava/util/List;

    .line 78
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mValues:Ljava/util/List;

    .line 79
    iput-boolean p2, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mAllMustSucceed:Z

    .line 80
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mRemaining:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 81
    new-instance v0, Landroidx/camera/core/impl/utils/futures/ListFuture$1;

    invoke-direct {v0, p0}, Landroidx/camera/core/impl/utils/futures/ListFuture$1;-><init>(Landroidx/camera/core/impl/utils/futures/ListFuture;)V

    invoke-static {v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mResult:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 93
    invoke-direct {p0, p3}, Landroidx/camera/core/impl/utils/futures/ListFuture;->init(Ljava/util/concurrent/Executor;)V

    .line 94
    return-void
.end method

.method private callAllGets()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 244
    .local p0, "this":Landroidx/camera/core/impl/utils/futures/ListFuture;, "Landroidx/camera/core/impl/utils/futures/ListFuture<TV;>;"
    iget-object v0, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mFutures:Ljava/util/List;

    .line 245
    .local v0, "oldFutures":Ljava/util/List;, "Ljava/util/List<+Lcom/google/common/util/concurrent/ListenableFuture<+TV;>;>;"
    if-eqz v0, :cond_2

    invoke-virtual {p0}, Landroidx/camera/core/impl/utils/futures/ListFuture;->isDone()Z

    move-result v1

    if-nez v1, :cond_2

    .line 246
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/common/util/concurrent/ListenableFuture;

    .line 250
    .local v2, "future":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<+TV;>;"
    :goto_1
    invoke-interface {v2}, Lcom/google/common/util/concurrent/ListenableFuture;->isDone()Z

    move-result v3

    if-nez v3, :cond_1

    .line 252
    :try_start_0
    invoke-interface {v2}, Lcom/google/common/util/concurrent/ListenableFuture;->get()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 264
    goto :goto_1

    .line 257
    :catchall_0
    move-exception v3

    .line 259
    .local v3, "e":Ljava/lang/Throwable;
    iget-boolean v4, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mAllMustSucceed:Z

    if-eqz v4, :cond_0

    .line 260
    return-void

    .line 262
    :cond_0
    goto :goto_1

    .line 255
    .end local v3    # "e":Ljava/lang/Throwable;
    :catch_0
    move-exception v1

    .line 256
    .local v1, "e":Ljava/lang/InterruptedException;
    throw v1

    .line 253
    .end local v1    # "e":Ljava/lang/InterruptedException;
    :catch_1
    move-exception v1

    .line 254
    .local v1, "e":Ljava/lang/Error;
    throw v1

    .line 266
    .end local v1    # "e":Ljava/lang/Error;
    .end local v2    # "future":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<+TV;>;"
    :cond_1
    goto :goto_0

    .line 268
    :cond_2
    return-void
.end method

.method private init(Ljava/util/concurrent/Executor;)V
    .locals 5
    .param p1, "listenerExecutor"    # Ljava/util/concurrent/Executor;

    .line 98
    .local p0, "this":Landroidx/camera/core/impl/utils/futures/ListFuture;, "Landroidx/camera/core/impl/utils/futures/ListFuture<TV;>;"
    new-instance v0, Landroidx/camera/core/impl/utils/futures/ListFuture$2;

    invoke-direct {v0, p0}, Landroidx/camera/core/impl/utils/futures/ListFuture$2;-><init>(Landroidx/camera/core/impl/utils/futures/ListFuture;)V

    .line 108
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v1

    .line 98
    invoke-virtual {p0, v0, v1}, Landroidx/camera/core/impl/utils/futures/ListFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 113
    iget-object v0, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mFutures:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 114
    iget-object v0, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mResultNotifier:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mValues:Ljava/util/List;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    .line 115
    return-void

    .line 119
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mFutures:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 120
    iget-object v1, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mValues:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 119
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 130
    .end local v0    # "i":I
    :cond_1
    iget-object v0, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mFutures:Ljava/util/List;

    .line 131
    .local v0, "localFutures":Ljava/util/List;, "Ljava/util/List<+Lcom/google/common/util/concurrent/ListenableFuture<+TV;>;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 132
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/common/util/concurrent/ListenableFuture;

    .line 133
    .local v2, "listenable":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<+TV;>;"
    move v3, v1

    .line 134
    .local v3, "index":I
    new-instance v4, Landroidx/camera/core/impl/utils/futures/ListFuture$3;

    invoke-direct {v4, p0, v3, v2}, Landroidx/camera/core/impl/utils/futures/ListFuture$3;-><init>(Landroidx/camera/core/impl/utils/futures/ListFuture;ILcom/google/common/util/concurrent/ListenableFuture;)V

    invoke-interface {v2, v4, p1}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 131
    .end local v2    # "listenable":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<+TV;>;"
    .end local v3    # "index":I
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 141
    .end local v1    # "i":I
    :cond_2
    return-void
.end method


# virtual methods
.method public addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V
    .locals 1
    .param p1, "listener"    # Ljava/lang/Runnable;
    .param p2, "executor"    # Ljava/util/concurrent/Executor;

    .line 198
    .local p0, "this":Landroidx/camera/core/impl/utils/futures/ListFuture;, "Landroidx/camera/core/impl/utils/futures/ListFuture<TV;>;"
    iget-object v0, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mResult:Lcom/google/common/util/concurrent/ListenableFuture;

    invoke-interface {v0, p1, p2}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 199
    return-void
.end method

.method public cancel(Z)Z
    .locals 2
    .param p1, "mayInterruptIfRunning"    # Z

    .line 203
    .local p0, "this":Landroidx/camera/core/impl/utils/futures/ListFuture;, "Landroidx/camera/core/impl/utils/futures/ListFuture<TV;>;"
    iget-object v0, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mFutures:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 204
    iget-object v0, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mFutures:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/common/util/concurrent/ListenableFuture;

    .line 205
    .local v1, "f":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<+TV;>;"
    invoke-interface {v1, p1}, Lcom/google/common/util/concurrent/ListenableFuture;->cancel(Z)Z

    .line 206
    .end local v1    # "f":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<+TV;>;"
    goto :goto_0

    .line 209
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mResult:Lcom/google/common/util/concurrent/ListenableFuture;

    invoke-interface {v0, p1}, Lcom/google/common/util/concurrent/ListenableFuture;->cancel(Z)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/ExecutionException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 53
    .local p0, "this":Landroidx/camera/core/impl/utils/futures/ListFuture;, "Landroidx/camera/core/impl/utils/futures/ListFuture<TV;>;"
    invoke-virtual {p0}, Landroidx/camera/core/impl/utils/futures/ListFuture;->get()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/ExecutionException;,
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .line 53
    .local p0, "this":Landroidx/camera/core/impl/utils/futures/ListFuture;, "Landroidx/camera/core/impl/utils/futures/ListFuture<TV;>;"
    invoke-virtual {p0, p1, p2, p3}, Landroidx/camera/core/impl/utils/futures/ListFuture;->get(JLjava/util/concurrent/TimeUnit;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public get()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "TV;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .line 225
    .local p0, "this":Landroidx/camera/core/impl/utils/futures/ListFuture;, "Landroidx/camera/core/impl/utils/futures/ListFuture<TV;>;"
    invoke-direct {p0}, Landroidx/camera/core/impl/utils/futures/ListFuture;->callAllGets()V

    .line 229
    iget-object v0, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mResult:Lcom/google/common/util/concurrent/ListenableFuture;

    invoke-interface {v0}, Lcom/google/common/util/concurrent/ListenableFuture;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public get(JLjava/util/concurrent/TimeUnit;)Ljava/util/List;
    .locals 1
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Ljava/util/List<",
            "TV;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .line 235
    .local p0, "this":Landroidx/camera/core/impl/utils/futures/ListFuture;, "Landroidx/camera/core/impl/utils/futures/ListFuture<TV;>;"
    iget-object v0, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mResult:Lcom/google/common/util/concurrent/ListenableFuture;

    invoke-interface {v0, p1, p2, p3}, Lcom/google/common/util/concurrent/ListenableFuture;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public isCancelled()Z
    .locals 1

    .line 214
    .local p0, "this":Landroidx/camera/core/impl/utils/futures/ListFuture;, "Landroidx/camera/core/impl/utils/futures/ListFuture<TV;>;"
    iget-object v0, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mResult:Lcom/google/common/util/concurrent/ListenableFuture;

    invoke-interface {v0}, Lcom/google/common/util/concurrent/ListenableFuture;->isCancelled()Z

    move-result v0

    return v0
.end method

.method public isDone()Z
    .locals 1

    .line 219
    .local p0, "this":Landroidx/camera/core/impl/utils/futures/ListFuture;, "Landroidx/camera/core/impl/utils/futures/ListFuture<TV;>;"
    iget-object v0, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mResult:Lcom/google/common/util/concurrent/ListenableFuture;

    invoke-interface {v0}, Lcom/google/common/util/concurrent/ListenableFuture;->isDone()Z

    move-result v0

    return v0
.end method

.method setOneValue(ILjava/util/concurrent/Future;)V
    .locals 7
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/concurrent/Future<",
            "+TV;>;)V"
        }
    .end annotation

    .line 147
    .local p0, "this":Landroidx/camera/core/impl/utils/futures/ListFuture;, "Landroidx/camera/core/impl/utils/futures/ListFuture<TV;>;"
    .local p2, "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<+TV;>;"
    const-string v0, "Less than 0 remaining futures"

    iget-object v1, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mValues:Ljava/util/List;

    .line 148
    .local v1, "localValues":Ljava/util/List;, "Ljava/util/List<TV;>;"
    invoke-virtual {p0}, Landroidx/camera/core/impl/utils/futures/ListFuture;->isDone()Z

    move-result v2

    if-nez v2, :cond_e

    if-nez v1, :cond_0

    goto/16 :goto_a

    .line 158
    :cond_0
    const/4 v2, 0x1

    const/4 v3, 0x0

    :try_start_0
    invoke-interface {p2}, Ljava/util/concurrent/Future;->isDone()Z

    move-result v4

    const-string/jumbo v5, "Tried to set value from future which is not done"

    invoke-static {v4, v5}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 160
    invoke-static {p2}, Landroidx/camera/core/impl/utils/futures/Futures;->getUninterruptibly(Ljava/util/concurrent/Future;)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v1, p1, v4}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/util/concurrent/CancellationException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 183
    iget-object v4, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mRemaining:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v4

    .line 184
    .local v4, "newRemaining":I
    if-ltz v4, :cond_1

    goto :goto_0

    :cond_1
    move v2, v3

    :goto_0
    invoke-static {v2, v0}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 185
    if-nez v4, :cond_a

    .line 186
    iget-object v1, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mValues:Ljava/util/List;

    .line 187
    if-eqz v1, :cond_9

    .line 188
    iget-object v0, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mResultNotifier:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    goto/16 :goto_5

    .line 183
    .end local v4    # "newRemaining":I
    :catchall_0
    move-exception v4

    goto/16 :goto_7

    .line 179
    :catch_0
    move-exception v4

    .line 181
    .local v4, "e":Ljava/lang/Error;
    :try_start_1
    iget-object v5, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mResultNotifier:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    invoke-virtual {v5, v4}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 183
    nop

    .end local v4    # "e":Ljava/lang/Error;
    iget-object v4, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mRemaining:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v4

    .line 184
    .local v4, "newRemaining":I
    if-ltz v4, :cond_2

    goto :goto_1

    :cond_2
    move v2, v3

    :goto_1
    invoke-static {v2, v0}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 185
    if-nez v4, :cond_a

    .line 186
    iget-object v1, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mValues:Ljava/util/List;

    .line 187
    if-eqz v1, :cond_9

    .line 188
    iget-object v0, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mResultNotifier:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    goto/16 :goto_5

    .line 175
    .end local v4    # "newRemaining":I
    :catch_1
    move-exception v4

    .line 176
    .local v4, "e":Ljava/lang/RuntimeException;
    :try_start_2
    iget-boolean v5, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mAllMustSucceed:Z

    if-eqz v5, :cond_3

    .line 177
    iget-object v5, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mResultNotifier:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    invoke-virtual {v5, v4}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 183
    .end local v4    # "e":Ljava/lang/RuntimeException;
    :cond_3
    iget-object v4, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mRemaining:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v4

    .line 184
    .local v4, "newRemaining":I
    if-ltz v4, :cond_4

    goto :goto_2

    :cond_4
    move v2, v3

    :goto_2
    invoke-static {v2, v0}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 185
    if-nez v4, :cond_a

    .line 186
    iget-object v1, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mValues:Ljava/util/List;

    .line 187
    if-eqz v1, :cond_9

    .line 188
    iget-object v0, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mResultNotifier:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    goto :goto_5

    .line 169
    .end local v4    # "newRemaining":I
    :catch_2
    move-exception v4

    .line 170
    .local v4, "e":Ljava/util/concurrent/ExecutionException;
    :try_start_3
    iget-boolean v5, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mAllMustSucceed:Z

    if-eqz v5, :cond_5

    .line 173
    iget-object v5, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mResultNotifier:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    invoke-virtual {v4}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 183
    .end local v4    # "e":Ljava/util/concurrent/ExecutionException;
    :cond_5
    iget-object v4, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mRemaining:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v4

    .line 184
    .local v4, "newRemaining":I
    if-ltz v4, :cond_6

    goto :goto_3

    :cond_6
    move v2, v3

    :goto_3
    invoke-static {v2, v0}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 185
    if-nez v4, :cond_a

    .line 186
    iget-object v1, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mValues:Ljava/util/List;

    .line 187
    if-eqz v1, :cond_9

    .line 188
    iget-object v0, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mResultNotifier:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    goto :goto_5

    .line 161
    .end local v4    # "newRemaining":I
    :catch_3
    move-exception v4

    .line 162
    .local v4, "e":Ljava/util/concurrent/CancellationException;
    :try_start_4
    iget-boolean v5, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mAllMustSucceed:Z

    if-eqz v5, :cond_7

    .line 167
    invoke-virtual {p0, v3}, Landroidx/camera/core/impl/utils/futures/ListFuture;->cancel(Z)Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 183
    .end local v4    # "e":Ljava/util/concurrent/CancellationException;
    :cond_7
    iget-object v4, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mRemaining:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v4

    .line 184
    .local v4, "newRemaining":I
    if-ltz v4, :cond_8

    goto :goto_4

    :cond_8
    move v2, v3

    :goto_4
    invoke-static {v2, v0}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 185
    if-nez v4, :cond_a

    .line 186
    iget-object v1, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mValues:Ljava/util/List;

    .line 187
    if-eqz v1, :cond_9

    .line 188
    iget-object v0, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mResultNotifier:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    :goto_5
    invoke-virtual {v0, v2}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    goto :goto_6

    .line 190
    :cond_9
    invoke-virtual {p0}, Landroidx/camera/core/impl/utils/futures/ListFuture;->isDone()Z

    move-result v0

    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkState(Z)V

    .line 193
    .end local v4    # "newRemaining":I
    :cond_a
    :goto_6
    nop

    .line 194
    return-void

    .line 183
    :goto_7
    iget-object v5, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mRemaining:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v5

    .line 184
    .local v5, "newRemaining":I
    if-ltz v5, :cond_b

    goto :goto_8

    :cond_b
    move v2, v3

    :goto_8
    invoke-static {v2, v0}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 185
    if-nez v5, :cond_d

    .line 186
    iget-object v1, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mValues:Ljava/util/List;

    .line 187
    if-eqz v1, :cond_c

    .line 188
    iget-object v0, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mResultNotifier:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, v2}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    goto :goto_9

    .line 190
    :cond_c
    invoke-virtual {p0}, Landroidx/camera/core/impl/utils/futures/ListFuture;->isDone()Z

    move-result v0

    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkState(Z)V

    .line 193
    .end local v5    # "newRemaining":I
    :cond_d
    :goto_9
    throw v4

    .line 152
    :cond_e
    :goto_a
    iget-boolean v0, p0, Landroidx/camera/core/impl/utils/futures/ListFuture;->mAllMustSucceed:Z

    const-string v2, "Future was done before all dependencies completed"

    invoke-static {v0, v2}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 154
    return-void
.end method
