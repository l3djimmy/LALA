.class public final Landroidx/camera/video/internal/SharedByteBuffer;
.super Ljava/lang/Object;
.source "SharedByteBuffer.java"

# interfaces
.implements Ljava/io/Closeable;


# static fields
.field private static final TAG:Ljava/lang/String; = "SharedByteBuffer"


# instance fields
.field private final mCloseLock:Ljava/lang/Object;

.field private mClosed:Z

.field private final mFinalCloseAction:Landroidx/core/util/Pair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/core/util/Pair<",
            "Ljava/util/concurrent/Executor;",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private final mShareId:I

.field private final mSharedByteBuffer:Ljava/nio/ByteBuffer;

.field private final mSharedRefCount:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method private constructor <init>(Ljava/nio/ByteBuffer;Ljava/util/concurrent/atomic/AtomicInteger;Landroidx/core/util/Pair;I)V
    .locals 5
    .param p1, "sharedBuf"    # Ljava/nio/ByteBuffer;
    .param p2, "sharedRefCount"    # Ljava/util/concurrent/atomic/AtomicInteger;
    .param p4, "shareId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/nio/ByteBuffer;",
            "Ljava/util/concurrent/atomic/AtomicInteger;",
            "Landroidx/core/util/Pair<",
            "Ljava/util/concurrent/Executor;",
            "Ljava/lang/Runnable;",
            ">;I)V"
        }
    .end annotation

    .line 99
    .local p3, "finalCloseAction":Landroidx/core/util/Pair;, "Landroidx/core/util/Pair<Ljava/util/concurrent/Executor;Ljava/lang/Runnable;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/camera/video/internal/SharedByteBuffer;->mCloseLock:Ljava/lang/Object;

    .line 62
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/video/internal/SharedByteBuffer;->mClosed:Z

    .line 101
    iput-object p1, p0, Landroidx/camera/video/internal/SharedByteBuffer;->mSharedByteBuffer:Ljava/nio/ByteBuffer;

    .line 102
    iput-object p2, p0, Landroidx/camera/video/internal/SharedByteBuffer;->mSharedRefCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 103
    iput-object p3, p0, Landroidx/camera/video/internal/SharedByteBuffer;->mFinalCloseAction:Landroidx/core/util/Pair;

    .line 104
    iput p4, p0, Landroidx/camera/video/internal/SharedByteBuffer;->mShareId:I

    .line 106
    const-string/jumbo v0, "SharedByteBuffer"

    invoke-static {v0}, Landroidx/camera/core/Logger;->isDebugEnabled(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 107
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    .line 108
    .local v0, "refCount":I
    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    goto :goto_0

    .line 109
    :cond_0
    new-instance v1, Ljava/lang/AssertionError;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 111
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p0}, Landroidx/camera/video/internal/SharedByteBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    filled-new-array {v3, v4}, [Ljava/lang/Object;

    move-result-object v3

    .line 109
    const-string v4, "Cannot create new instance of SharedByteBuffer with invalid ref count %d. Ref count must be >= 1. [%s]"

    invoke-static {v2, v4, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 114
    .end local v0    # "refCount":I
    :cond_1
    :goto_0
    return-void
.end method

.method private checkNotClosed(Ljava/lang/String;)V
    .locals 3
    .param p1, "caller"    # Ljava/lang/String;

    .line 184
    iget-boolean v0, p0, Landroidx/camera/video/internal/SharedByteBuffer;->mClosed:Z

    if-nez v0, :cond_0

    .line 188
    return-void

    .line 185
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot call "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " on a closed SharedByteBuffer."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private closeInternal()Z
    .locals 7

    .line 218
    iget-object v0, p0, Landroidx/camera/video/internal/SharedByteBuffer;->mCloseLock:Ljava/lang/Object;

    monitor-enter v0

    .line 219
    :try_start_0
    iget-boolean v1, p0, Landroidx/camera/video/internal/SharedByteBuffer;->mClosed:Z

    if-eqz v1, :cond_0

    .line 221
    monitor-exit v0

    const/4 v0, 0x0

    return v0

    .line 223
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Landroidx/camera/video/internal/SharedByteBuffer;->mClosed:Z

    .line 225
    iget-object v2, p0, Landroidx/camera/video/internal/SharedByteBuffer;->mSharedRefCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v2

    .line 226
    .local v2, "newRefCount":I
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 228
    const-string/jumbo v0, "SharedByteBuffer"

    invoke-static {v0}, Landroidx/camera/core/Logger;->isDebugEnabled(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 229
    if-ltz v2, :cond_1

    .line 237
    const-string/jumbo v0, "SharedByteBuffer"

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v4, "Ref count decremented: %d [%s]"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 238
    invoke-virtual {p0}, Landroidx/camera/video/internal/SharedByteBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    filled-new-array {v5, v6}, [Ljava/lang/Object;

    move-result-object v5

    .line 237
    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 230
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Invalid ref count. close() should never produce a ref count below 0"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 241
    :cond_2
    :goto_0
    if-nez v2, :cond_4

    .line 242
    const-string/jumbo v0, "SharedByteBuffer"

    invoke-static {v0}, Landroidx/camera/core/Logger;->isDebugEnabled(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 243
    const-string/jumbo v0, "SharedByteBuffer"

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "Final reference released. Running final close action. [%s]"

    .line 244
    invoke-virtual {p0}, Landroidx/camera/video/internal/SharedByteBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    .line 243
    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 248
    :cond_3
    :try_start_1
    iget-object v0, p0, Landroidx/camera/video/internal/SharedByteBuffer;->mFinalCloseAction:Landroidx/core/util/Pair;

    iget-object v0, v0, Landroidx/core/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/Executor;

    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/Executor;

    .line 249
    .local v0, "executor":Ljava/util/concurrent/Executor;
    iget-object v3, p0, Landroidx/camera/video/internal/SharedByteBuffer;->mFinalCloseAction:Landroidx/core/util/Pair;

    iget-object v3, v3, Landroidx/core/util/Pair;->second:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Runnable;

    invoke-static {v3}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Runnable;

    .line 250
    .local v3, "runnable":Ljava/lang/Runnable;
    invoke-interface {v0, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_1 .. :try_end_1} :catch_0

    .line 254
    .end local v0    # "executor":Ljava/util/concurrent/Executor;
    .end local v3    # "runnable":Ljava/lang/Runnable;
    goto :goto_1

    .line 251
    :catch_0
    move-exception v0

    .line 252
    .local v0, "e":Ljava/util/concurrent/RejectedExecutionException;
    const-string/jumbo v3, "SharedByteBuffer"

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v5, "Unable to execute final close action. [%s]"

    .line 253
    invoke-virtual {p0}, Landroidx/camera/video/internal/SharedByteBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    .line 252
    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v0}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 257
    .end local v0    # "e":Ljava/util/concurrent/RejectedExecutionException;
    :cond_4
    :goto_1
    return v1

    .line 226
    .end local v2    # "newRefCount":I
    :catchall_0
    move-exception v1

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method static newSharedInstance(Ljava/nio/ByteBuffer;Ljava/util/concurrent/Executor;Ljava/lang/Runnable;)Landroidx/camera/video/internal/SharedByteBuffer;
    .locals 7
    .param p0, "sharedBuf"    # Ljava/nio/ByteBuffer;
    .param p1, "closeActionExecutor"    # Ljava/util/concurrent/Executor;
    .param p2, "finalCloseAction"    # Ljava/lang/Runnable;

    .line 85
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 86
    .local v0, "sharedRefCount":Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    .line 87
    .local v1, "shareId":I
    invoke-static {p0}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->asReadOnlyBuffer()Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 88
    .local v2, "readOnlyBuf":Ljava/nio/ByteBuffer;
    new-instance v3, Landroidx/camera/video/internal/SharedByteBuffer;

    new-instance v4, Landroidx/core/util/Pair;

    .line 89
    invoke-static {p1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/concurrent/Executor;

    .line 90
    invoke-static {p2}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Runnable;

    invoke-direct {v4, v5, v6}, Landroidx/core/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {v3, v2, v0, v4, v1}, Landroidx/camera/video/internal/SharedByteBuffer;-><init>(Ljava/nio/ByteBuffer;Ljava/util/concurrent/atomic/AtomicInteger;Landroidx/core/util/Pair;I)V

    .line 88
    return-object v3
.end method


# virtual methods
.method public close()V
    .locals 0

    .line 160
    invoke-direct {p0}, Landroidx/camera/video/internal/SharedByteBuffer;->closeInternal()Z

    .line 161
    return-void
.end method

.method protected finalize()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 202
    :try_start_0
    invoke-direct {p0}, Landroidx/camera/video/internal/SharedByteBuffer;->closeInternal()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 203
    const-string/jumbo v0, "SharedByteBuffer"

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v2, "SharedByteBuffer closed by finalizer, but should have been closed manually with SharedByteBuffer.close() [%s]"

    .line 206
    invoke-virtual {p0}, Landroidx/camera/video/internal/SharedByteBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    .line 203
    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 209
    :cond_0
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 210
    nop

    .line 212
    return-void

    .line 209
    :catchall_0
    move-exception v0

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 210
    throw v0
.end method

.method public get()Ljava/nio/ByteBuffer;
    .locals 2

    .line 176
    iget-object v0, p0, Landroidx/camera/video/internal/SharedByteBuffer;->mCloseLock:Ljava/lang/Object;

    monitor-enter v0

    .line 177
    :try_start_0
    const-string/jumbo v1, "get()"

    invoke-direct {p0, v1}, Landroidx/camera/video/internal/SharedByteBuffer;->checkNotClosed(Ljava/lang/String;)V

    .line 178
    iget-object v1, p0, Landroidx/camera/video/internal/SharedByteBuffer;->mSharedByteBuffer:Ljava/nio/ByteBuffer;

    monitor-exit v0

    return-object v1

    .line 179
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method share()Landroidx/camera/video/internal/SharedByteBuffer;
    .locals 7

    .line 128
    iget-object v0, p0, Landroidx/camera/video/internal/SharedByteBuffer;->mCloseLock:Ljava/lang/Object;

    monitor-enter v0

    .line 129
    :try_start_0
    const-string/jumbo v1, "share()"

    invoke-direct {p0, v1}, Landroidx/camera/video/internal/SharedByteBuffer;->checkNotClosed(Ljava/lang/String;)V

    .line 130
    iget-object v1, p0, Landroidx/camera/video/internal/SharedByteBuffer;->mSharedRefCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v1

    .line 131
    .local v1, "newRefCount":I
    iget-object v2, p0, Landroidx/camera/video/internal/SharedByteBuffer;->mSharedRefCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 132
    .local v2, "sharedRefCountLocal":Ljava/util/concurrent/atomic/AtomicInteger;
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 134
    const-string/jumbo v0, "SharedByteBuffer"

    invoke-static {v0}, Landroidx/camera/core/Logger;->isDebugEnabled(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 135
    const/4 v0, 0x1

    if-le v1, v0, :cond_0

    .line 139
    const-string/jumbo v0, "SharedByteBuffer"

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v4, "Ref count incremented: %d [%s]"

    .line 140
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {p0}, Landroidx/camera/video/internal/SharedByteBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    filled-new-array {v5, v6}, [Ljava/lang/Object;

    move-result-object v5

    .line 139
    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 136
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    const-string v3, "Invalid ref count. share() should always produce a ref count of 2 or more."

    invoke-direct {v0, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 143
    :cond_1
    :goto_0
    new-instance v0, Landroidx/camera/video/internal/SharedByteBuffer;

    iget-object v3, p0, Landroidx/camera/video/internal/SharedByteBuffer;->mSharedByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->asReadOnlyBuffer()Ljava/nio/ByteBuffer;

    move-result-object v3

    iget-object v4, p0, Landroidx/camera/video/internal/SharedByteBuffer;->mFinalCloseAction:Landroidx/core/util/Pair;

    iget v5, p0, Landroidx/camera/video/internal/SharedByteBuffer;->mShareId:I

    invoke-direct {v0, v3, v2, v4, v5}, Landroidx/camera/video/internal/SharedByteBuffer;-><init>(Ljava/nio/ByteBuffer;Ljava/util/concurrent/atomic/AtomicInteger;Landroidx/core/util/Pair;I)V

    return-object v0

    .line 132
    .end local v1    # "newRefCount":I
    .end local v2    # "sharedRefCountLocal":Ljava/util/concurrent/atomic/AtomicInteger;
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 193
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    iget-object v1, p0, Landroidx/camera/video/internal/SharedByteBuffer;->mSharedByteBuffer:Ljava/nio/ByteBuffer;

    iget v2, p0, Landroidx/camera/video/internal/SharedByteBuffer;->mShareId:I

    .line 194
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v1, v2, v3}, [Ljava/lang/Object;

    move-result-object v1

    .line 193
    const-string/jumbo v2, "SharedByteBuffer[buf: %s, shareId: 0x%x, instanceId:0x%x]"

    invoke-static {v0, v2, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
