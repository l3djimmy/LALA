.class Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;
.super Landroidx/camera/core/impl/utils/futures/FutureChain;
.source "ChainingListenableFuture.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<I:",
        "Ljava/lang/Object;",
        "O:",
        "Ljava/lang/Object;",
        ">",
        "Landroidx/camera/core/impl/utils/futures/FutureChain<",
        "TO;>;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# instance fields
.field private mFunction:Landroidx/camera/core/impl/utils/futures/AsyncFunction;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/utils/futures/AsyncFunction<",
            "-TI;+TO;>;"
        }
    .end annotation
.end field

.field private mInputFuture:Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "+TI;>;"
        }
    .end annotation
.end field

.field private final mMayInterruptIfRunningChannel:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final mOutputCreated:Ljava/util/concurrent/CountDownLatch;

.field volatile mOutputFuture:Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "+TO;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroidx/camera/core/impl/utils/futures/AsyncFunction;Lcom/google/common/util/concurrent/ListenableFuture;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/utils/futures/AsyncFunction<",
            "-TI;+TO;>;",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "+TI;>;)V"
        }
    .end annotation

    .line 69
    .local p0, "this":Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;, "Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture<TI;TO;>;"
    .local p1, "function":Landroidx/camera/core/impl/utils/futures/AsyncFunction;, "Landroidx/camera/core/impl/utils/futures/AsyncFunction<-TI;+TO;>;"
    .local p2, "inputFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<+TI;>;"
    invoke-direct {p0}, Landroidx/camera/core/impl/utils/futures/FutureChain;-><init>()V

    .line 58
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>(I)V

    iput-object v0, p0, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->mMayInterruptIfRunningChannel:Ljava/util/concurrent/BlockingQueue;

    .line 60
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v0, p0, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->mOutputCreated:Ljava/util/concurrent/CountDownLatch;

    .line 70
    invoke-static {p1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/utils/futures/AsyncFunction;

    iput-object v0, p0, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->mFunction:Landroidx/camera/core/impl/utils/futures/AsyncFunction;

    .line 71
    invoke-static {p2}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/util/concurrent/ListenableFuture;

    iput-object v0, p0, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->mInputFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 72
    return-void
.end method

.method private cancel(Ljava/util/concurrent/Future;Z)V
    .locals 0
    .param p2, "mayInterruptIfRunning"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Future<",
            "*>;Z)V"
        }
    .end annotation

    .line 179
    .local p0, "this":Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;, "Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture<TI;TO;>;"
    .local p1, "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    if-eqz p1, :cond_0

    .line 180
    invoke-interface {p1, p2}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 182
    :cond_0
    return-void
.end method

.method private putUninterruptibly(Ljava/util/concurrent/BlockingQueue;Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/BlockingQueue<",
            "TE;>;TE;)V"
        }
    .end annotation

    .line 281
    .local p0, "this":Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;, "Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture<TI;TO;>;"
    .local p1, "queue":Ljava/util/concurrent/BlockingQueue;, "Ljava/util/concurrent/BlockingQueue<TE;>;"
    .local p2, "element":Ljava/lang/Object;, "TE;"
    const/4 v0, 0x0

    .line 285
    .local v0, "interrupted":Z
    :goto_0
    :try_start_0
    invoke-interface {p1, p2}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 292
    if-eqz v0, :cond_0

    .line 293
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    .line 286
    :cond_0
    return-void

    .line 292
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_1

    .line 293
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->interrupt()V

    .line 295
    :cond_1
    throw v1

    .line 287
    :catch_0
    move-exception v1

    .line 288
    .local v1, "e":Ljava/lang/InterruptedException;
    const/4 v0, 0x1

    .line 289
    .end local v1    # "e":Ljava/lang/InterruptedException;
    goto :goto_0
.end method

.method private takeUninterruptibly(Ljava/util/concurrent/BlockingQueue;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/BlockingQueue<",
            "TE;>;)TE;"
        }
    .end annotation

    .line 260
    .local p0, "this":Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;, "Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture<TI;TO;>;"
    .local p1, "queue":Ljava/util/concurrent/BlockingQueue;, "Ljava/util/concurrent/BlockingQueue<TE;>;"
    const/4 v0, 0x0

    .line 264
    .local v0, "interrupted":Z
    :goto_0
    :try_start_0
    invoke-interface {p1}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 270
    if-eqz v0, :cond_0

    .line 271
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->interrupt()V

    .line 264
    :cond_0
    return-object v1

    .line 270
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_1

    .line 271
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->interrupt()V

    .line 273
    :cond_1
    throw v1

    .line 265
    :catch_0
    move-exception v1

    .line 266
    .local v1, "e":Ljava/lang/InterruptedException;
    const/4 v0, 0x1

    .line 267
    .end local v1    # "e":Ljava/lang/InterruptedException;
    goto :goto_0
.end method


# virtual methods
.method public cancel(Z)Z
    .locals 2
    .param p1, "mayInterruptIfRunning"    # Z

    .line 166
    .local p0, "this":Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;, "Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture<TI;TO;>;"
    invoke-super {p0, p1}, Landroidx/camera/core/impl/utils/futures/FutureChain;->cancel(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 169
    iget-object v0, p0, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->mMayInterruptIfRunningChannel:Ljava/util/concurrent/BlockingQueue;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->putUninterruptibly(Ljava/util/concurrent/BlockingQueue;Ljava/lang/Object;)V

    .line 170
    iget-object v0, p0, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->mInputFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    invoke-direct {p0, v0, p1}, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->cancel(Ljava/util/concurrent/Future;Z)V

    .line 171
    iget-object v0, p0, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->mOutputFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    invoke-direct {p0, v0, p1}, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->cancel(Ljava/util/concurrent/Future;Z)V

    .line 172
    const/4 v0, 0x1

    return v0

    .line 174
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public get()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TO;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .line 82
    .local p0, "this":Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;, "Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture<TI;TO;>;"
    invoke-virtual {p0}, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->isDone()Z

    move-result v0

    if-nez v0, :cond_1

    .line 87
    iget-object v0, p0, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->mInputFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 88
    .local v0, "inputFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<+TI;>;"
    if-eqz v0, :cond_0

    .line 89
    invoke-interface {v0}, Lcom/google/common/util/concurrent/ListenableFuture;->get()Ljava/lang/Object;

    .line 95
    :cond_0
    iget-object v1, p0, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->mOutputCreated:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->await()V

    .line 102
    iget-object v1, p0, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->mOutputFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 103
    .local v1, "outputFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<+TO;>;"
    if-eqz v1, :cond_1

    .line 104
    invoke-interface {v1}, Lcom/google/common/util/concurrent/ListenableFuture;->get()Ljava/lang/Object;

    .line 107
    .end local v0    # "inputFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<+TI;>;"
    .end local v1    # "outputFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<+TO;>;"
    :cond_1
    invoke-super {p0}, Landroidx/camera/core/impl/utils/futures/FutureChain;->get()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .locals 7
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TO;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/TimeoutException;,
            Ljava/util/concurrent/ExecutionException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 119
    .local p0, "this":Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;, "Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture<TI;TO;>;"
    invoke-virtual {p0}, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->isDone()Z

    move-result v0

    if-nez v0, :cond_3

    .line 122
    sget-object v0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    if-eq p3, v0, :cond_0

    .line 123
    sget-object v0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, p1, p2, p3}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide p1

    .line 124
    sget-object p3, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    .line 131
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->mInputFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 132
    .local v0, "inputFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<+TI;>;"
    const-wide/16 v1, 0x0

    if-eqz v0, :cond_1

    .line 133
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v3

    .line 134
    .local v3, "start":J
    invoke-interface {v0, p1, p2, p3}, Lcom/google/common/util/concurrent/ListenableFuture;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    .line 135
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v5

    sub-long/2addr v5, v3

    invoke-static {v1, v2, v5, v6}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v5

    sub-long/2addr p1, v5

    .line 141
    .end local v3    # "start":J
    :cond_1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v3

    .line 142
    .restart local v3    # "start":J
    iget-object v5, p0, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->mOutputCreated:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v5, p1, p2, p3}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 145
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v5

    sub-long/2addr v5, v3

    invoke-static {v1, v2, v5, v6}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    sub-long/2addr p1, v1

    .line 152
    iget-object v1, p0, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->mOutputFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 153
    .local v1, "outputFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<+TO;>;"
    if-eqz v1, :cond_3

    .line 154
    invoke-interface {v1, p1, p2, p3}, Lcom/google/common/util/concurrent/ListenableFuture;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    goto :goto_0

    .line 143
    .end local v1    # "outputFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<+TO;>;"
    :cond_2
    new-instance v1, Ljava/util/concurrent/TimeoutException;

    invoke-direct {v1}, Ljava/util/concurrent/TimeoutException;-><init>()V

    throw v1

    .line 157
    .end local v0    # "inputFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<+TI;>;"
    .end local v3    # "start":J
    :cond_3
    :goto_0
    invoke-super {p0, p1, p2, p3}, Landroidx/camera/core/impl/utils/futures/FutureChain;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public run()V
    .locals 5

    .line 189
    .local p0, "this":Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;, "Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture<TI;TO;>;"
    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->mInputFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    invoke-static {v1}, Landroidx/camera/core/impl/utils/futures/Futures;->getUninterruptibly(Ljava/util/concurrent/Future;)Ljava/lang/Object;

    move-result-object v1
    :try_end_0
    .catch Ljava/util/concurrent/CancellationException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/reflect/UndeclaredThrowableException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 200
    .local v1, "sourceResult":Ljava/lang/Object;, "TI;"
    nop

    .line 202
    :try_start_1
    iget-object v2, p0, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->mFunction:Landroidx/camera/core/impl/utils/futures/AsyncFunction;

    .line 203
    invoke-interface {v2, v1}, Landroidx/camera/core/impl/utils/futures/AsyncFunction;->apply(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v2

    iput-object v2, p0, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->mOutputFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 204
    .local v2, "outputFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<+TO;>;"
    invoke-virtual {p0}, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->isCancelled()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 210
    iget-object v3, p0, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->mMayInterruptIfRunningChannel:Ljava/util/concurrent/BlockingQueue;

    invoke-direct {p0, v3}, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->takeUninterruptibly(Ljava/util/concurrent/BlockingQueue;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-interface {v2, v3}, Lcom/google/common/util/concurrent/ListenableFuture;->cancel(Z)Z

    .line 211
    iput-object v0, p0, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->mOutputFuture:Lcom/google/common/util/concurrent/ListenableFuture;
    :try_end_1
    .catch Ljava/lang/reflect/UndeclaredThrowableException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Error; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 249
    iput-object v0, p0, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->mFunction:Landroidx/camera/core/impl/utils/futures/AsyncFunction;

    .line 250
    iput-object v0, p0, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->mInputFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 252
    iget-object v0, p0, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->mOutputCreated:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 212
    return-void

    .line 214
    :cond_0
    :try_start_2
    new-instance v3, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture$1;

    invoke-direct {v3, p0, v2}, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture$1;-><init>(Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;Lcom/google/common/util/concurrent/ListenableFuture;)V

    .line 236
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v4

    .line 214
    invoke-interface {v2, v3, v4}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 249
    .end local v1    # "sourceResult":Ljava/lang/Object;, "TI;"
    .end local v2    # "outputFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<+TO;>;"
    goto :goto_2

    :catchall_0
    move-exception v1

    goto :goto_5

    .line 244
    :catch_0
    move-exception v1

    goto :goto_0

    .line 240
    :catch_1
    move-exception v1

    goto :goto_1

    .line 237
    :catch_2
    move-exception v1

    goto :goto_3

    .line 196
    :catch_3
    move-exception v1

    .line 198
    .local v1, "e":Ljava/util/concurrent/ExecutionException;
    invoke-virtual {v1}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->setException(Ljava/lang/Throwable;)Z
    :try_end_2
    .catch Ljava/lang/reflect/UndeclaredThrowableException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Error; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 249
    iput-object v0, p0, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->mFunction:Landroidx/camera/core/impl/utils/futures/AsyncFunction;

    .line 250
    iput-object v0, p0, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->mInputFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 252
    iget-object v0, p0, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->mOutputCreated:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 199
    return-void

    .line 190
    .end local v1    # "e":Ljava/util/concurrent/ExecutionException;
    :catch_4
    move-exception v1

    .line 194
    .local v1, "e":Ljava/util/concurrent/CancellationException;
    const/4 v2, 0x0

    :try_start_3
    invoke-virtual {p0, v2}, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->cancel(Z)Z
    :try_end_3
    .catch Ljava/lang/reflect/UndeclaredThrowableException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Error; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 249
    iput-object v0, p0, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->mFunction:Landroidx/camera/core/impl/utils/futures/AsyncFunction;

    .line 250
    iput-object v0, p0, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->mInputFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 252
    iget-object v0, p0, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->mOutputCreated:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 195
    return-void

    .line 246
    .local v1, "e":Ljava/lang/Error;
    :goto_0
    :try_start_4
    invoke-virtual {p0, v1}, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->setException(Ljava/lang/Throwable;)Z

    .line 249
    nop

    .end local v1    # "e":Ljava/lang/Error;
    goto :goto_2

    .line 243
    .local v1, "e":Ljava/lang/Exception;
    :goto_1
    invoke-virtual {p0, v1}, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->setException(Ljava/lang/Throwable;)Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 249
    nop

    .end local v1    # "e":Ljava/lang/Exception;
    :goto_2
    iput-object v0, p0, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->mFunction:Landroidx/camera/core/impl/utils/futures/AsyncFunction;

    .line 250
    iput-object v0, p0, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->mInputFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 252
    iget-object v0, p0, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->mOutputCreated:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 253
    goto :goto_4

    .line 239
    .local v1, "e":Ljava/lang/reflect/UndeclaredThrowableException;
    :goto_3
    :try_start_5
    invoke-virtual {v1}, Ljava/lang/reflect/UndeclaredThrowableException;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->setException(Ljava/lang/Throwable;)Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 249
    nop

    .end local v1    # "e":Ljava/lang/reflect/UndeclaredThrowableException;
    goto :goto_2

    .line 254
    :goto_4
    return-void

    .line 249
    :goto_5
    iput-object v0, p0, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->mFunction:Landroidx/camera/core/impl/utils/futures/AsyncFunction;

    .line 250
    iput-object v0, p0, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->mInputFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 252
    iget-object v0, p0, Landroidx/camera/core/impl/utils/futures/ChainingListenableFuture;->mOutputCreated:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 253
    throw v1
.end method
