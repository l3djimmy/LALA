.class public Landroidx/camera/core/internal/utils/ArrayRingBuffer;
.super Ljava/lang/Object;
.source "ArrayRingBuffer.java"

# interfaces
.implements Landroidx/camera/core/internal/utils/RingBuffer;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Landroidx/camera/core/internal/utils/RingBuffer<",
        "TT;>;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "ZslRingBuffer"


# instance fields
.field private final mBuffer:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final mLock:Ljava/lang/Object;

.field final mOnRemoveCallback:Landroidx/camera/core/internal/utils/RingBuffer$OnRemoveCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/internal/utils/RingBuffer$OnRemoveCallback<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final mRingBufferCapacity:I


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "ringBufferCapacity"    # I

    .line 44
    .local p0, "this":Landroidx/camera/core/internal/utils/ArrayRingBuffer;, "Landroidx/camera/core/internal/utils/ArrayRingBuffer<TT;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroidx/camera/core/internal/utils/ArrayRingBuffer;-><init>(ILandroidx/camera/core/internal/utils/RingBuffer$OnRemoveCallback;)V

    .line 45
    return-void
.end method

.method public constructor <init>(ILandroidx/camera/core/internal/utils/RingBuffer$OnRemoveCallback;)V
    .locals 2
    .param p1, "ringBufferCapacity"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroidx/camera/core/internal/utils/RingBuffer$OnRemoveCallback<",
            "TT;>;)V"
        }
    .end annotation

    .line 47
    .local p0, "this":Landroidx/camera/core/internal/utils/ArrayRingBuffer;, "Landroidx/camera/core/internal/utils/ArrayRingBuffer<TT;>;"
    .local p2, "onRemoveCallback":Landroidx/camera/core/internal/utils/RingBuffer$OnRemoveCallback;, "Landroidx/camera/core/internal/utils/RingBuffer$OnRemoveCallback<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/internal/utils/ArrayRingBuffer;->mLock:Ljava/lang/Object;

    .line 48
    iput p1, p0, Landroidx/camera/core/internal/utils/ArrayRingBuffer;->mRingBufferCapacity:I

    .line 49
    new-instance v0, Ljava/util/ArrayDeque;

    iget v1, p0, Landroidx/camera/core/internal/utils/ArrayRingBuffer;->mRingBufferCapacity:I

    invoke-direct {v0, v1}, Ljava/util/ArrayDeque;-><init>(I)V

    iput-object v0, p0, Landroidx/camera/core/internal/utils/ArrayRingBuffer;->mBuffer:Ljava/util/ArrayDeque;

    .line 50
    iput-object p2, p0, Landroidx/camera/core/internal/utils/ArrayRingBuffer;->mOnRemoveCallback:Landroidx/camera/core/internal/utils/RingBuffer$OnRemoveCallback;

    .line 51
    return-void
.end method


# virtual methods
.method public dequeue()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 70
    .local p0, "this":Landroidx/camera/core/internal/utils/ArrayRingBuffer;, "Landroidx/camera/core/internal/utils/ArrayRingBuffer<TT;>;"
    iget-object v0, p0, Landroidx/camera/core/internal/utils/ArrayRingBuffer;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 71
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/internal/utils/ArrayRingBuffer;->mBuffer:Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->removeLast()Ljava/lang/Object;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 72
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public enqueue(Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 55
    .local p0, "this":Landroidx/camera/core/internal/utils/ArrayRingBuffer;, "Landroidx/camera/core/internal/utils/ArrayRingBuffer<TT;>;"
    .local p1, "element":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x0

    .line 56
    .local v0, "removedItem":Ljava/lang/Object;, "TT;"
    iget-object v1, p0, Landroidx/camera/core/internal/utils/ArrayRingBuffer;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 57
    :try_start_0
    iget-object v2, p0, Landroidx/camera/core/internal/utils/ArrayRingBuffer;->mBuffer:Ljava/util/ArrayDeque;

    invoke-virtual {v2}, Ljava/util/ArrayDeque;->size()I

    move-result v2

    iget v3, p0, Landroidx/camera/core/internal/utils/ArrayRingBuffer;->mRingBufferCapacity:I

    if-lt v2, v3, :cond_0

    .line 58
    invoke-virtual {p0}, Landroidx/camera/core/internal/utils/ArrayRingBuffer;->dequeue()Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    .line 60
    :cond_0
    iget-object v2, p0, Landroidx/camera/core/internal/utils/ArrayRingBuffer;->mBuffer:Ljava/util/ArrayDeque;

    invoke-virtual {v2, p1}, Ljava/util/ArrayDeque;->addFirst(Ljava/lang/Object;)V

    .line 61
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    iget-object v1, p0, Landroidx/camera/core/internal/utils/ArrayRingBuffer;->mOnRemoveCallback:Landroidx/camera/core/internal/utils/RingBuffer$OnRemoveCallback;

    if-eqz v1, :cond_1

    if-eqz v0, :cond_1

    .line 64
    iget-object v1, p0, Landroidx/camera/core/internal/utils/ArrayRingBuffer;->mOnRemoveCallback:Landroidx/camera/core/internal/utils/RingBuffer$OnRemoveCallback;

    invoke-interface {v1, v0}, Landroidx/camera/core/internal/utils/RingBuffer$OnRemoveCallback;->onRemove(Ljava/lang/Object;)V

    .line 66
    :cond_1
    return-void

    .line 61
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method

.method public getMaxCapacity()I
    .locals 1

    .line 77
    .local p0, "this":Landroidx/camera/core/internal/utils/ArrayRingBuffer;, "Landroidx/camera/core/internal/utils/ArrayRingBuffer<TT;>;"
    iget v0, p0, Landroidx/camera/core/internal/utils/ArrayRingBuffer;->mRingBufferCapacity:I

    return v0
.end method

.method public isEmpty()Z
    .locals 2

    .line 82
    .local p0, "this":Landroidx/camera/core/internal/utils/ArrayRingBuffer;, "Landroidx/camera/core/internal/utils/ArrayRingBuffer<TT;>;"
    iget-object v0, p0, Landroidx/camera/core/internal/utils/ArrayRingBuffer;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 83
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/internal/utils/ArrayRingBuffer;->mBuffer:Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v1

    monitor-exit v0

    return v1

    .line 84
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
