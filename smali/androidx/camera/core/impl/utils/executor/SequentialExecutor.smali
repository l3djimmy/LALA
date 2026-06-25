.class final Landroidx/camera/core/impl/utils/executor/SequentialExecutor;
.super Ljava/lang/Object;
.source "SequentialExecutor.java"

# interfaces
.implements Ljava/util/concurrent/Executor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/impl/utils/executor/SequentialExecutor$QueueWorker;,
        Landroidx/camera/core/impl/utils/executor/SequentialExecutor$WorkerRunningState;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "SequentialExecutor"


# instance fields
.field private final mExecutor:Ljava/util/concurrent/Executor;

.field final mQueue:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private final mWorker:Landroidx/camera/core/impl/utils/executor/SequentialExecutor$QueueWorker;

.field mWorkerRunCount:J

.field mWorkerRunningState:Landroidx/camera/core/impl/utils/executor/SequentialExecutor$WorkerRunningState;


# direct methods
.method constructor <init>(Ljava/util/concurrent/Executor;)V
    .locals 2
    .param p1, "executor"    # Ljava/util/concurrent/Executor;

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/impl/utils/executor/SequentialExecutor;->mQueue:Ljava/util/Deque;

    .line 58
    new-instance v0, Landroidx/camera/core/impl/utils/executor/SequentialExecutor$QueueWorker;

    invoke-direct {v0, p0}, Landroidx/camera/core/impl/utils/executor/SequentialExecutor$QueueWorker;-><init>(Landroidx/camera/core/impl/utils/executor/SequentialExecutor;)V

    iput-object v0, p0, Landroidx/camera/core/impl/utils/executor/SequentialExecutor;->mWorker:Landroidx/camera/core/impl/utils/executor/SequentialExecutor$QueueWorker;

    .line 60
    sget-object v0, Landroidx/camera/core/impl/utils/executor/SequentialExecutor$WorkerRunningState;->IDLE:Landroidx/camera/core/impl/utils/executor/SequentialExecutor$WorkerRunningState;

    iput-object v0, p0, Landroidx/camera/core/impl/utils/executor/SequentialExecutor;->mWorkerRunningState:Landroidx/camera/core/impl/utils/executor/SequentialExecutor$WorkerRunningState;

    .line 71
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Landroidx/camera/core/impl/utils/executor/SequentialExecutor;->mWorkerRunCount:J

    .line 77
    invoke-static {p1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/Executor;

    iput-object v0, p0, Landroidx/camera/core/impl/utils/executor/SequentialExecutor;->mExecutor:Ljava/util/concurrent/Executor;

    .line 78
    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/Runnable;)V
    .locals 9
    .param p1, "task"    # Ljava/lang/Runnable;

    .line 88
    invoke-static {p1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    iget-object v0, p0, Landroidx/camera/core/impl/utils/executor/SequentialExecutor;->mQueue:Ljava/util/Deque;

    monitor-enter v0

    .line 95
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/impl/utils/executor/SequentialExecutor;->mWorkerRunningState:Landroidx/camera/core/impl/utils/executor/SequentialExecutor$WorkerRunningState;

    sget-object v2, Landroidx/camera/core/impl/utils/executor/SequentialExecutor$WorkerRunningState;->RUNNING:Landroidx/camera/core/impl/utils/executor/SequentialExecutor$WorkerRunningState;

    if-eq v1, v2, :cond_7

    iget-object v1, p0, Landroidx/camera/core/impl/utils/executor/SequentialExecutor;->mWorkerRunningState:Landroidx/camera/core/impl/utils/executor/SequentialExecutor$WorkerRunningState;

    sget-object v2, Landroidx/camera/core/impl/utils/executor/SequentialExecutor$WorkerRunningState;->QUEUED:Landroidx/camera/core/impl/utils/executor/SequentialExecutor$WorkerRunningState;

    if-ne v1, v2, :cond_0

    goto/16 :goto_3

    .line 100
    :cond_0
    iget-wide v1, p0, Landroidx/camera/core/impl/utils/executor/SequentialExecutor;->mWorkerRunCount:J

    .line 107
    .local v1, "oldRunCount":J
    new-instance v3, Landroidx/camera/core/impl/utils/executor/SequentialExecutor$1;

    invoke-direct {v3, p0, p1}, Landroidx/camera/core/impl/utils/executor/SequentialExecutor$1;-><init>(Landroidx/camera/core/impl/utils/executor/SequentialExecutor;Ljava/lang/Runnable;)V

    .line 114
    .local v3, "submittedTask":Ljava/lang/Runnable;
    iget-object v4, p0, Landroidx/camera/core/impl/utils/executor/SequentialExecutor;->mQueue:Ljava/util/Deque;

    invoke-interface {v4, v3}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 115
    sget-object v4, Landroidx/camera/core/impl/utils/executor/SequentialExecutor$WorkerRunningState;->QUEUING:Landroidx/camera/core/impl/utils/executor/SequentialExecutor$WorkerRunningState;

    iput-object v4, p0, Landroidx/camera/core/impl/utils/executor/SequentialExecutor;->mWorkerRunningState:Landroidx/camera/core/impl/utils/executor/SequentialExecutor$WorkerRunningState;

    .line 116
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 119
    const/4 v0, 0x1

    const/4 v4, 0x0

    :try_start_1
    iget-object v5, p0, Landroidx/camera/core/impl/utils/executor/SequentialExecutor;->mExecutor:Ljava/util/concurrent/Executor;

    iget-object v6, p0, Landroidx/camera/core/impl/utils/executor/SequentialExecutor;->mWorker:Landroidx/camera/core/impl/utils/executor/SequentialExecutor$QueueWorker;

    invoke-interface {v5, v6}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Error; {:try_start_1 .. :try_end_1} :catch_0

    .line 133
    nop

    .line 146
    iget-object v5, p0, Landroidx/camera/core/impl/utils/executor/SequentialExecutor;->mWorkerRunningState:Landroidx/camera/core/impl/utils/executor/SequentialExecutor$WorkerRunningState;

    sget-object v6, Landroidx/camera/core/impl/utils/executor/SequentialExecutor$WorkerRunningState;->QUEUING:Landroidx/camera/core/impl/utils/executor/SequentialExecutor$WorkerRunningState;

    if-eq v5, v6, :cond_1

    goto :goto_0

    :cond_1
    move v0, v4

    :goto_0
    move v5, v0

    .line 147
    .local v5, "alreadyMarkedQueued":Z
    if-eqz v5, :cond_2

    .line 148
    return-void

    .line 150
    :cond_2
    iget-object v6, p0, Landroidx/camera/core/impl/utils/executor/SequentialExecutor;->mQueue:Ljava/util/Deque;

    monitor-enter v6

    .line 151
    :try_start_2
    iget-wide v7, p0, Landroidx/camera/core/impl/utils/executor/SequentialExecutor;->mWorkerRunCount:J

    cmp-long v0, v7, v1

    if-nez v0, :cond_3

    iget-object v0, p0, Landroidx/camera/core/impl/utils/executor/SequentialExecutor;->mWorkerRunningState:Landroidx/camera/core/impl/utils/executor/SequentialExecutor$WorkerRunningState;

    sget-object v4, Landroidx/camera/core/impl/utils/executor/SequentialExecutor$WorkerRunningState;->QUEUING:Landroidx/camera/core/impl/utils/executor/SequentialExecutor$WorkerRunningState;

    if-ne v0, v4, :cond_3

    .line 152
    sget-object v0, Landroidx/camera/core/impl/utils/executor/SequentialExecutor$WorkerRunningState;->QUEUED:Landroidx/camera/core/impl/utils/executor/SequentialExecutor$WorkerRunningState;

    iput-object v0, p0, Landroidx/camera/core/impl/utils/executor/SequentialExecutor;->mWorkerRunningState:Landroidx/camera/core/impl/utils/executor/SequentialExecutor$WorkerRunningState;

    .line 154
    :cond_3
    monitor-exit v6

    .line 155
    return-void

    .line 154
    :catchall_0
    move-exception v0

    monitor-exit v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 120
    .end local v5    # "alreadyMarkedQueued":Z
    :catch_0
    move-exception v5

    goto :goto_1

    :catch_1
    move-exception v5

    .line 121
    .local v5, "t":Ljava/lang/Throwable;
    :goto_1
    iget-object v6, p0, Landroidx/camera/core/impl/utils/executor/SequentialExecutor;->mQueue:Ljava/util/Deque;

    monitor-enter v6

    .line 122
    :try_start_3
    iget-object v7, p0, Landroidx/camera/core/impl/utils/executor/SequentialExecutor;->mWorkerRunningState:Landroidx/camera/core/impl/utils/executor/SequentialExecutor$WorkerRunningState;

    sget-object v8, Landroidx/camera/core/impl/utils/executor/SequentialExecutor$WorkerRunningState;->IDLE:Landroidx/camera/core/impl/utils/executor/SequentialExecutor$WorkerRunningState;

    if-eq v7, v8, :cond_4

    iget-object v7, p0, Landroidx/camera/core/impl/utils/executor/SequentialExecutor;->mWorkerRunningState:Landroidx/camera/core/impl/utils/executor/SequentialExecutor$WorkerRunningState;

    sget-object v8, Landroidx/camera/core/impl/utils/executor/SequentialExecutor$WorkerRunningState;->QUEUING:Landroidx/camera/core/impl/utils/executor/SequentialExecutor$WorkerRunningState;

    if-ne v7, v8, :cond_5

    :cond_4
    iget-object v7, p0, Landroidx/camera/core/impl/utils/executor/SequentialExecutor;->mQueue:Ljava/util/Deque;

    .line 124
    invoke-interface {v7, v3}, Ljava/util/Deque;->removeLastOccurrence(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    goto :goto_2

    :cond_5
    move v0, v4

    .line 128
    .local v0, "removed":Z
    :goto_2
    instance-of v4, v5, Ljava/util/concurrent/RejectedExecutionException;

    if-eqz v4, :cond_6

    if-nez v0, :cond_6

    .line 131
    .end local v0    # "removed":Z
    monitor-exit v6

    .line 132
    return-void

    .line 129
    .restart local v0    # "removed":Z
    :cond_6
    nop

    .end local v1    # "oldRunCount":J
    .end local v3    # "submittedTask":Ljava/lang/Runnable;
    .end local p1    # "task":Ljava/lang/Runnable;
    throw v5

    .line 131
    .end local v0    # "removed":Z
    .restart local v1    # "oldRunCount":J
    .restart local v3    # "submittedTask":Ljava/lang/Runnable;
    .restart local p1    # "task":Ljava/lang/Runnable;
    :catchall_1
    move-exception v0

    monitor-exit v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v0

    .line 96
    .end local v1    # "oldRunCount":J
    .end local v3    # "submittedTask":Ljava/lang/Runnable;
    .end local v5    # "t":Ljava/lang/Throwable;
    :cond_7
    :goto_3
    :try_start_4
    iget-object v1, p0, Landroidx/camera/core/impl/utils/executor/SequentialExecutor;->mQueue:Ljava/util/Deque;

    invoke-interface {v1, p1}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 97
    monitor-exit v0

    return-void

    .line 116
    :catchall_2
    move-exception v1

    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    throw v1
.end method
