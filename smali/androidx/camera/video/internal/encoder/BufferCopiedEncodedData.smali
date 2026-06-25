.class public Landroidx/camera/video/internal/encoder/BufferCopiedEncodedData;
.super Ljava/lang/Object;
.source "BufferCopiedEncodedData.java"

# interfaces
.implements Landroidx/camera/video/internal/encoder/EncodedData;


# instance fields
.field private final mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

.field private final mByteBuffer:Ljava/nio/ByteBuffer;

.field private final mClosedCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private final mClosedFuture:Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroidx/camera/video/internal/encoder/EncodedData;)V
    .locals 2
    .param p1, "encodedData"    # Landroidx/camera/video/internal/encoder/EncodedData;

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    invoke-direct {p0, p1}, Landroidx/camera/video/internal/encoder/BufferCopiedEncodedData;->generateCopiedByteInfo(Landroidx/camera/video/internal/encoder/EncodedData;)Landroid/media/MediaCodec$BufferInfo;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/BufferCopiedEncodedData;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 49
    invoke-direct {p0, p1}, Landroidx/camera/video/internal/encoder/BufferCopiedEncodedData;->generateCopiedByteBuffer(Landroidx/camera/video/internal/encoder/EncodedData;)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/BufferCopiedEncodedData;->mByteBuffer:Ljava/nio/ByteBuffer;

    .line 52
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 53
    .local v0, "ref":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Ljava/lang/Void;>;>;"
    new-instance v1, Landroidx/camera/video/internal/encoder/BufferCopiedEncodedData$$ExternalSyntheticLambda0;

    invoke-direct {v1, v0}, Landroidx/camera/video/internal/encoder/BufferCopiedEncodedData$$ExternalSyntheticLambda0;-><init>(Ljava/util/concurrent/atomic/AtomicReference;)V

    invoke-static {v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/video/internal/encoder/BufferCopiedEncodedData;->mClosedFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 57
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    invoke-static {v1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    iput-object v1, p0, Landroidx/camera/video/internal/encoder/BufferCopiedEncodedData;->mClosedCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 58
    return-void
.end method

.method private generateCopiedByteBuffer(Landroidx/camera/video/internal/encoder/EncodedData;)Ljava/nio/ByteBuffer;
    .locals 4
    .param p1, "encodedData"    # Landroidx/camera/video/internal/encoder/EncodedData;

    .line 77
    invoke-interface {p1}, Landroidx/camera/video/internal/encoder/EncodedData;->getByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 78
    .local v0, "byteBuffer":Ljava/nio/ByteBuffer;
    invoke-interface {p1}, Landroidx/camera/video/internal/encoder/EncodedData;->getBufferInfo()Landroid/media/MediaCodec$BufferInfo;

    move-result-object v1

    .line 79
    .local v1, "bufferInfo":Landroid/media/MediaCodec$BufferInfo;
    iget v2, v1, Landroid/media/MediaCodec$BufferInfo;->offset:I

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 80
    iget v2, v1, Landroid/media/MediaCodec$BufferInfo;->offset:I

    iget v3, v1, Landroid/media/MediaCodec$BufferInfo;->size:I

    add-int/2addr v2, v3

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 83
    iget v2, v1, Landroid/media/MediaCodec$BufferInfo;->size:I

    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 84
    .local v2, "copiedByteBuffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 85
    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 86
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 88
    return-object v2
.end method

.method private generateCopiedByteInfo(Landroidx/camera/video/internal/encoder/EncodedData;)Landroid/media/MediaCodec$BufferInfo;
    .locals 8
    .param p1, "encodedData"    # Landroidx/camera/video/internal/encoder/EncodedData;

    .line 62
    invoke-interface {p1}, Landroidx/camera/video/internal/encoder/EncodedData;->getBufferInfo()Landroid/media/MediaCodec$BufferInfo;

    move-result-object v0

    .line 64
    .local v0, "bufferInfo":Landroid/media/MediaCodec$BufferInfo;
    new-instance v1, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v1}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    move-object v2, v1

    .line 65
    .local v2, "copiedBufferInfo":Landroid/media/MediaCodec$BufferInfo;
    iget v4, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    iget-wide v5, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    iget v7, v0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    const/4 v3, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/media/MediaCodec$BufferInfo;->set(IIJI)V

    .line 72
    return-object v2
.end method

.method static synthetic lambda$new$0(Ljava/util/concurrent/atomic/AtomicReference;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 1
    .param p0, "ref"    # Ljava/util/concurrent/atomic/AtomicReference;
    .param p1, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 54
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 55
    const-string v0, "Data closed"

    return-object v0
.end method


# virtual methods
.method public close()V
    .locals 2

    .line 128
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/BufferCopiedEncodedData;->mClosedCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    .line 129
    return-void
.end method

.method public getBufferInfo()Landroid/media/MediaCodec$BufferInfo;
    .locals 1

    .line 102
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/BufferCopiedEncodedData;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    return-object v0
.end method

.method public getByteBuffer()Ljava/nio/ByteBuffer;
    .locals 1

    .line 95
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/BufferCopiedEncodedData;->mByteBuffer:Ljava/nio/ByteBuffer;

    return-object v0
.end method

.method public getClosedFuture()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 137
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/BufferCopiedEncodedData;->mClosedFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->nonCancellationPropagating(Lcom/google/common/util/concurrent/ListenableFuture;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method public getPresentationTimeUs()J
    .locals 2

    .line 108
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/BufferCopiedEncodedData;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget-wide v0, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    return-wide v0
.end method

.method public isKeyFrame()Z
    .locals 2

    .line 120
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/BufferCopiedEncodedData;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    const/4 v1, 0x1

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public size()J
    .locals 2

    .line 114
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/BufferCopiedEncodedData;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    int-to-long v0, v0

    return-wide v0
.end method
