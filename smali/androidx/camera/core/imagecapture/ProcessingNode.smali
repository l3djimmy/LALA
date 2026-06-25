.class public Landroidx/camera/core/imagecapture/ProcessingNode;
.super Ljava/lang/Object;
.source "ProcessingNode.java"

# interfaces
.implements Landroidx/camera/core/processing/Node;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/imagecapture/ProcessingNode$In;,
        Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/camera/core/processing/Node<",
        "Landroidx/camera/core/imagecapture/ProcessingNode$In;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private mBitmap2JpegBytes:Landroidx/camera/core/processing/Operation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/processing/Operation<",
            "Landroidx/camera/core/imagecapture/Bitmap2JpegBytes$In;",
            "Landroidx/camera/core/processing/Packet<",
            "[B>;>;"
        }
    .end annotation
.end field

.field private mBitmapEffect:Landroidx/camera/core/processing/Operation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/processing/Operation<",
            "Landroidx/camera/core/processing/Packet<",
            "Landroid/graphics/Bitmap;",
            ">;",
            "Landroidx/camera/core/processing/Packet<",
            "Landroid/graphics/Bitmap;",
            ">;>;"
        }
    .end annotation
.end field

.field final mBlockingExecutor:Ljava/util/concurrent/Executor;

.field private final mHasIncorrectJpegMetadataQuirk:Z

.field private mImage2JpegBytes:Landroidx/camera/core/processing/Operation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/processing/Operation<",
            "Landroidx/camera/core/imagecapture/Image2JpegBytes$In;",
            "Landroidx/camera/core/processing/Packet<",
            "[B>;>;"
        }
    .end annotation
.end field

.field final mImageProcessor:Landroidx/camera/core/processing/InternalImageProcessor;

.field private mInput2Packet:Landroidx/camera/core/processing/Operation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/processing/Operation<",
            "Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;",
            "Landroidx/camera/core/processing/Packet<",
            "Landroidx/camera/core/ImageProxy;",
            ">;>;"
        }
    .end annotation
.end field

.field private mInputEdge:Landroidx/camera/core/imagecapture/ProcessingNode$In;

.field private mJpegBytes2CroppedBitmap:Landroidx/camera/core/processing/Operation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/processing/Operation<",
            "Landroidx/camera/core/processing/Packet<",
            "[B>;",
            "Landroidx/camera/core/processing/Packet<",
            "Landroid/graphics/Bitmap;",
            ">;>;"
        }
    .end annotation
.end field

.field private mJpegBytes2Disk:Landroidx/camera/core/processing/Operation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/processing/Operation<",
            "Landroidx/camera/core/imagecapture/JpegBytes2Disk$In;",
            "Landroidx/camera/core/ImageCapture$OutputFileResults;",
            ">;"
        }
    .end annotation
.end field

.field private mJpegBytes2Image:Landroidx/camera/core/processing/Operation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/processing/Operation<",
            "Landroidx/camera/core/processing/Packet<",
            "[B>;",
            "Landroidx/camera/core/processing/Packet<",
            "Landroidx/camera/core/ImageProxy;",
            ">;>;"
        }
    .end annotation
.end field

.field private mJpegImage2Result:Landroidx/camera/core/processing/Operation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/processing/Operation<",
            "Landroidx/camera/core/processing/Packet<",
            "Landroidx/camera/core/ImageProxy;",
            ">;",
            "Landroidx/camera/core/ImageProxy;",
            ">;"
        }
    .end annotation
.end field

.field private final mQuirks:Landroidx/camera/core/impl/Quirks;


# direct methods
.method constructor <init>(Ljava/util/concurrent/Executor;)V
    .locals 2
    .param p1, "blockingExecutor"    # Ljava/util/concurrent/Executor;

    .line 89
    const/4 v0, 0x0

    invoke-static {}, Landroidx/camera/core/internal/compat/quirk/DeviceQuirks;->getAll()Landroidx/camera/core/impl/Quirks;

    move-result-object v1

    invoke-direct {p0, p1, v0, v1}, Landroidx/camera/core/imagecapture/ProcessingNode;-><init>(Ljava/util/concurrent/Executor;Landroidx/camera/core/processing/InternalImageProcessor;Landroidx/camera/core/impl/Quirks;)V

    .line 90
    return-void
.end method

.method constructor <init>(Ljava/util/concurrent/Executor;Landroidx/camera/core/impl/Quirks;)V
    .locals 1
    .param p1, "blockingExecutor"    # Ljava/util/concurrent/Executor;
    .param p2, "quirks"    # Landroidx/camera/core/impl/Quirks;

    .line 94
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Landroidx/camera/core/imagecapture/ProcessingNode;-><init>(Ljava/util/concurrent/Executor;Landroidx/camera/core/processing/InternalImageProcessor;Landroidx/camera/core/impl/Quirks;)V

    .line 95
    return-void
.end method

.method constructor <init>(Ljava/util/concurrent/Executor;Landroidx/camera/core/processing/InternalImageProcessor;)V
    .locals 1
    .param p1, "blockingExecutor"    # Ljava/util/concurrent/Executor;
    .param p2, "imageProcessor"    # Landroidx/camera/core/processing/InternalImageProcessor;

    .line 99
    invoke-static {}, Landroidx/camera/core/internal/compat/quirk/DeviceQuirks;->getAll()Landroidx/camera/core/impl/Quirks;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Landroidx/camera/core/imagecapture/ProcessingNode;-><init>(Ljava/util/concurrent/Executor;Landroidx/camera/core/processing/InternalImageProcessor;Landroidx/camera/core/impl/Quirks;)V

    .line 100
    return-void
.end method

.method constructor <init>(Ljava/util/concurrent/Executor;Landroidx/camera/core/processing/InternalImageProcessor;Landroidx/camera/core/impl/Quirks;)V
    .locals 2
    .param p1, "blockingExecutor"    # Ljava/util/concurrent/Executor;
    .param p2, "imageProcessor"    # Landroidx/camera/core/processing/InternalImageProcessor;
    .param p3, "quirks"    # Landroidx/camera/core/impl/Quirks;

    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 110
    const-class v0, Landroidx/camera/core/internal/compat/quirk/LowMemoryQuirk;

    invoke-static {v0}, Landroidx/camera/core/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 111
    .local v0, "isLowMemoryDevice":Z
    :goto_0
    if-eqz v0, :cond_1

    .line 112
    invoke-static {p1}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->newSequentialExecutor(Ljava/util/concurrent/Executor;)Ljava/util/concurrent/Executor;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mBlockingExecutor:Ljava/util/concurrent/Executor;

    goto :goto_1

    .line 114
    :cond_1
    iput-object p1, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mBlockingExecutor:Ljava/util/concurrent/Executor;

    .line 116
    :goto_1
    iput-object p2, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mImageProcessor:Landroidx/camera/core/processing/InternalImageProcessor;

    .line 117
    iput-object p3, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mQuirks:Landroidx/camera/core/impl/Quirks;

    .line 118
    const-class v1, Landroidx/camera/core/internal/compat/quirk/IncorrectJpegMetadataQuirk;

    invoke-virtual {p3, v1}, Landroidx/camera/core/impl/Quirks;->contains(Ljava/lang/Class;)Z

    move-result v1

    iput-boolean v1, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mHasIncorrectJpegMetadataQuirk:Z

    .line 119
    return-void
.end method

.method private cropAndMaybeApplyEffect(Landroidx/camera/core/processing/Packet;I)Landroidx/camera/core/processing/Packet;
    .locals 3
    .param p2, "jpegQuality"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/processing/Packet<",
            "[B>;I)",
            "Landroidx/camera/core/processing/Packet<",
            "[B>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 226
    .local p1, "jpegPacket":Landroidx/camera/core/processing/Packet;, "Landroidx/camera/core/processing/Packet<[B>;"
    invoke-virtual {p1}, Landroidx/camera/core/processing/Packet;->getFormat()I

    move-result v0

    const/16 v1, 0x100

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkState(Z)V

    .line 227
    iget-object v0, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mJpegBytes2CroppedBitmap:Landroidx/camera/core/processing/Operation;

    invoke-interface {v0, p1}, Landroidx/camera/core/processing/Operation;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/processing/Packet;

    .line 228
    .local v0, "bitmapPacket":Landroidx/camera/core/processing/Packet;, "Landroidx/camera/core/processing/Packet<Landroid/graphics/Bitmap;>;"
    iget-object v1, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mBitmapEffect:Landroidx/camera/core/processing/Operation;

    if-eqz v1, :cond_1

    .line 230
    iget-object v1, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mBitmapEffect:Landroidx/camera/core/processing/Operation;

    invoke-interface {v1, v0}, Landroidx/camera/core/processing/Operation;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Landroidx/camera/core/processing/Packet;

    .line 232
    :cond_1
    iget-object v1, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mBitmap2JpegBytes:Landroidx/camera/core/processing/Operation;

    .line 233
    invoke-static {v0, p2}, Landroidx/camera/core/imagecapture/Bitmap2JpegBytes$In;->of(Landroidx/camera/core/processing/Packet;I)Landroidx/camera/core/imagecapture/Bitmap2JpegBytes$In;

    move-result-object v2

    .line 232
    invoke-interface {v1, v2}, Landroidx/camera/core/processing/Operation;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/processing/Packet;

    return-object v1
.end method

.method static synthetic lambda$processInputPacket$2(Landroidx/camera/core/imagecapture/ProcessingRequest;Landroidx/camera/core/ImageProxy;)V
    .locals 0
    .param p0, "request"    # Landroidx/camera/core/imagecapture/ProcessingRequest;
    .param p1, "result"    # Landroidx/camera/core/ImageProxy;

    .line 168
    invoke-virtual {p0, p1}, Landroidx/camera/core/imagecapture/ProcessingRequest;->onFinalResult(Landroidx/camera/core/ImageProxy;)V

    return-void
.end method

.method static synthetic lambda$processInputPacket$3(Landroidx/camera/core/imagecapture/ProcessingRequest;Landroidx/camera/core/ImageCapture$OutputFileResults;)V
    .locals 0
    .param p0, "request"    # Landroidx/camera/core/imagecapture/ProcessingRequest;
    .param p1, "result"    # Landroidx/camera/core/ImageCapture$OutputFileResults;

    .line 171
    invoke-virtual {p0, p1}, Landroidx/camera/core/imagecapture/ProcessingRequest;->onFinalResult(Landroidx/camera/core/ImageCapture$OutputFileResults;)V

    return-void
.end method

.method static synthetic lambda$sendError$4(Landroidx/camera/core/imagecapture/ProcessingRequest;Landroidx/camera/core/ImageCaptureException;)V
    .locals 0
    .param p0, "request"    # Landroidx/camera/core/imagecapture/ProcessingRequest;
    .param p1, "e"    # Landroidx/camera/core/ImageCaptureException;

    .line 241
    invoke-virtual {p0, p1}, Landroidx/camera/core/imagecapture/ProcessingRequest;->onProcessFailure(Landroidx/camera/core/ImageCaptureException;)V

    return-void
.end method

.method private static sendError(Landroidx/camera/core/imagecapture/ProcessingRequest;Landroidx/camera/core/ImageCaptureException;)V
    .locals 2
    .param p0, "request"    # Landroidx/camera/core/imagecapture/ProcessingRequest;
    .param p1, "e"    # Landroidx/camera/core/ImageCaptureException;

    .line 241
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    new-instance v1, Landroidx/camera/core/imagecapture/ProcessingNode$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1}, Landroidx/camera/core/imagecapture/ProcessingNode$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/core/imagecapture/ProcessingRequest;Landroidx/camera/core/ImageCaptureException;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 242
    return-void
.end method


# virtual methods
.method injectProcessingInput2Packet(Landroidx/camera/core/processing/Operation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/processing/Operation<",
            "Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;",
            "Landroidx/camera/core/processing/Packet<",
            "Landroidx/camera/core/ImageProxy;",
            ">;>;)V"
        }
    .end annotation

    .line 294
    .local p1, "input2Packet":Landroidx/camera/core/processing/Operation;, "Landroidx/camera/core/processing/Operation<Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;Landroidx/camera/core/processing/Packet<Landroidx/camera/core/ImageProxy;>;>;"
    iput-object p1, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mInput2Packet:Landroidx/camera/core/processing/Operation;

    .line 295
    return-void
.end method

.method synthetic lambda$transform$0$androidx-camera-core-imagecapture-ProcessingNode(Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;)V
    .locals 0
    .param p1, "inputPacket"    # Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;

    .line 132
    invoke-virtual {p0, p1}, Landroidx/camera/core/imagecapture/ProcessingNode;->processInputPacket(Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;)V

    return-void
.end method

.method synthetic lambda$transform$1$androidx-camera-core-imagecapture-ProcessingNode(Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;)V
    .locals 2
    .param p1, "inputPacket"    # Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;

    .line 128
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;->getProcessingRequest()Landroidx/camera/core/imagecapture/ProcessingRequest;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/imagecapture/ProcessingRequest;->isAborted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 130
    return-void

    .line 132
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mBlockingExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/core/imagecapture/ProcessingNode$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0, p1}, Landroidx/camera/core/imagecapture/ProcessingNode$$ExternalSyntheticLambda4;-><init>(Landroidx/camera/core/imagecapture/ProcessingNode;Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 133
    return-void
.end method

.method processInMemoryCapture(Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;)Landroidx/camera/core/ImageProxy;
    .locals 4
    .param p1, "inputPacket"    # Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 206
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;->getProcessingRequest()Landroidx/camera/core/imagecapture/ProcessingRequest;

    move-result-object v0

    .line 207
    .local v0, "request":Landroidx/camera/core/imagecapture/ProcessingRequest;
    iget-object v1, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mInput2Packet:Landroidx/camera/core/processing/Operation;

    invoke-interface {v1, p1}, Landroidx/camera/core/processing/Operation;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/processing/Packet;

    .line 208
    .local v1, "image":Landroidx/camera/core/processing/Packet;, "Landroidx/camera/core/processing/Packet<Landroidx/camera/core/ImageProxy;>;"
    invoke-virtual {v1}, Landroidx/camera/core/processing/Packet;->getFormat()I

    move-result v2

    const/16 v3, 0x23

    if-eq v2, v3, :cond_0

    iget-object v2, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mBitmapEffect:Landroidx/camera/core/processing/Operation;

    if-nez v2, :cond_0

    iget-boolean v2, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mHasIncorrectJpegMetadataQuirk:Z

    if-eqz v2, :cond_2

    :cond_0
    iget-object v2, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mInputEdge:Landroidx/camera/core/imagecapture/ProcessingNode$In;

    .line 210
    invoke-virtual {v2}, Landroidx/camera/core/imagecapture/ProcessingNode$In;->getOutputFormat()I

    move-result v2

    const/16 v3, 0x100

    if-ne v2, v3, :cond_2

    .line 211
    iget-object v2, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mImage2JpegBytes:Landroidx/camera/core/processing/Operation;

    .line 212
    invoke-virtual {v0}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getJpegQuality()I

    move-result v3

    invoke-static {v1, v3}, Landroidx/camera/core/imagecapture/Image2JpegBytes$In;->of(Landroidx/camera/core/processing/Packet;I)Landroidx/camera/core/imagecapture/Image2JpegBytes$In;

    move-result-object v3

    .line 211
    invoke-interface {v2, v3}, Landroidx/camera/core/processing/Operation;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/processing/Packet;

    .line 213
    .local v2, "jpegBytes":Landroidx/camera/core/processing/Packet;, "Landroidx/camera/core/processing/Packet<[B>;"
    iget-object v3, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mBitmapEffect:Landroidx/camera/core/processing/Operation;

    if-eqz v3, :cond_1

    .line 214
    invoke-virtual {v0}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getJpegQuality()I

    move-result v3

    invoke-direct {p0, v2, v3}, Landroidx/camera/core/imagecapture/ProcessingNode;->cropAndMaybeApplyEffect(Landroidx/camera/core/processing/Packet;I)Landroidx/camera/core/processing/Packet;

    move-result-object v2

    .line 216
    :cond_1
    iget-object v3, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mJpegBytes2Image:Landroidx/camera/core/processing/Operation;

    invoke-interface {v3, v2}, Landroidx/camera/core/processing/Operation;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object v1, v3

    check-cast v1, Landroidx/camera/core/processing/Packet;

    .line 218
    .end local v2    # "jpegBytes":Landroidx/camera/core/processing/Packet;, "Landroidx/camera/core/processing/Packet<[B>;"
    :cond_2
    iget-object v2, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mJpegImage2Result:Landroidx/camera/core/processing/Operation;

    invoke-interface {v2, v1}, Landroidx/camera/core/processing/Operation;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/ImageProxy;

    return-object v2
.end method

.method processInputPacket(Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;)V
    .locals 5
    .param p1, "inputPacket"    # Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;

    .line 164
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;->getProcessingRequest()Landroidx/camera/core/imagecapture/ProcessingRequest;

    move-result-object v0

    .line 166
    .local v0, "request":Landroidx/camera/core/imagecapture/ProcessingRequest;
    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;->getProcessingRequest()Landroidx/camera/core/imagecapture/ProcessingRequest;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/camera/core/imagecapture/ProcessingRequest;->isInMemoryCapture()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 167
    invoke-virtual {p0, p1}, Landroidx/camera/core/imagecapture/ProcessingNode;->processInMemoryCapture(Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;)Landroidx/camera/core/ImageProxy;

    move-result-object v2

    .line 168
    .local v2, "result":Landroidx/camera/core/ImageProxy;
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v3

    new-instance v4, Landroidx/camera/core/imagecapture/ProcessingNode$$ExternalSyntheticLambda2;

    invoke-direct {v4, v0, v2}, Landroidx/camera/core/imagecapture/ProcessingNode$$ExternalSyntheticLambda2;-><init>(Landroidx/camera/core/imagecapture/ProcessingRequest;Landroidx/camera/core/ImageProxy;)V

    invoke-interface {v3, v4}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 169
    .end local v2    # "result":Landroidx/camera/core/ImageProxy;
    goto :goto_0

    .line 170
    :cond_0
    invoke-virtual {p0, p1}, Landroidx/camera/core/imagecapture/ProcessingNode;->processOnDiskCapture(Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;)Landroidx/camera/core/ImageCapture$OutputFileResults;

    move-result-object v2

    .line 171
    .local v2, "result":Landroidx/camera/core/ImageCapture$OutputFileResults;
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v3

    new-instance v4, Landroidx/camera/core/imagecapture/ProcessingNode$$ExternalSyntheticLambda3;

    invoke-direct {v4, v0, v2}, Landroidx/camera/core/imagecapture/ProcessingNode$$ExternalSyntheticLambda3;-><init>(Landroidx/camera/core/imagecapture/ProcessingRequest;Landroidx/camera/core/ImageCapture$OutputFileResults;)V

    invoke-interface {v3, v4}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Landroidx/camera/core/ImageCaptureException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 178
    .end local v2    # "result":Landroidx/camera/core/ImageCapture$OutputFileResults;
    :catch_0
    move-exception v2

    .line 180
    .local v2, "e":Ljava/lang/RuntimeException;
    new-instance v3, Landroidx/camera/core/ImageCaptureException;

    const-string/jumbo v4, "Processing failed."

    invoke-direct {v3, v1, v4, v2}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {v0, v3}, Landroidx/camera/core/imagecapture/ProcessingNode;->sendError(Landroidx/camera/core/imagecapture/ProcessingRequest;Landroidx/camera/core/ImageCaptureException;)V

    goto :goto_1

    .line 175
    .end local v2    # "e":Ljava/lang/RuntimeException;
    :catch_1
    move-exception v2

    .line 176
    .local v2, "e":Ljava/lang/OutOfMemoryError;
    new-instance v3, Landroidx/camera/core/ImageCaptureException;

    const-string/jumbo v4, "Processing failed due to low memory."

    invoke-direct {v3, v1, v4, v2}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {v0, v3}, Landroidx/camera/core/imagecapture/ProcessingNode;->sendError(Landroidx/camera/core/imagecapture/ProcessingRequest;Landroidx/camera/core/ImageCaptureException;)V

    .end local v2    # "e":Ljava/lang/OutOfMemoryError;
    goto :goto_0

    .line 173
    :catch_2
    move-exception v1

    .line 174
    .local v1, "e":Landroidx/camera/core/ImageCaptureException;
    invoke-static {v0, v1}, Landroidx/camera/core/imagecapture/ProcessingNode;->sendError(Landroidx/camera/core/imagecapture/ProcessingRequest;Landroidx/camera/core/ImageCaptureException;)V

    .line 181
    .end local v1    # "e":Landroidx/camera/core/ImageCaptureException;
    :goto_0
    nop

    .line 182
    :goto_1
    return-void
.end method

.method processOnDiskCapture(Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;)Landroidx/camera/core/ImageCapture$OutputFileResults;
    .locals 5
    .param p1, "inputPacket"    # Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 188
    iget-object v0, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mInputEdge:Landroidx/camera/core/imagecapture/ProcessingNode$In;

    invoke-virtual {v0}, Landroidx/camera/core/imagecapture/ProcessingNode$In;->getOutputFormat()I

    move-result v0

    const/16 v1, 0x100

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mInputEdge:Landroidx/camera/core/imagecapture/ProcessingNode$In;

    .line 190
    invoke-virtual {v1}, Landroidx/camera/core/imagecapture/ProcessingNode$In;->getOutputFormat()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    .line 189
    const-string v2, "On-disk capture only support JPEG output format. Output format: %s"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 188
    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 191
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/ProcessingNode$InputPacket;->getProcessingRequest()Landroidx/camera/core/imagecapture/ProcessingRequest;

    move-result-object v0

    .line 192
    .local v0, "request":Landroidx/camera/core/imagecapture/ProcessingRequest;
    iget-object v1, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mInput2Packet:Landroidx/camera/core/processing/Operation;

    invoke-interface {v1, p1}, Landroidx/camera/core/processing/Operation;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/processing/Packet;

    .line 193
    .local v1, "originalImage":Landroidx/camera/core/processing/Packet;, "Landroidx/camera/core/processing/Packet<Landroidx/camera/core/ImageProxy;>;"
    iget-object v2, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mImage2JpegBytes:Landroidx/camera/core/processing/Operation;

    .line 194
    invoke-virtual {v0}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getJpegQuality()I

    move-result v3

    invoke-static {v1, v3}, Landroidx/camera/core/imagecapture/Image2JpegBytes$In;->of(Landroidx/camera/core/processing/Packet;I)Landroidx/camera/core/imagecapture/Image2JpegBytes$In;

    move-result-object v3

    .line 193
    invoke-interface {v2, v3}, Landroidx/camera/core/processing/Operation;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/processing/Packet;

    .line 195
    .local v2, "jpegBytes":Landroidx/camera/core/processing/Packet;, "Landroidx/camera/core/processing/Packet<[B>;"
    invoke-virtual {v2}, Landroidx/camera/core/processing/Packet;->hasCropping()Z

    move-result v3

    if-nez v3, :cond_1

    iget-object v3, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mBitmapEffect:Landroidx/camera/core/processing/Operation;

    if-eqz v3, :cond_2

    .line 196
    :cond_1
    invoke-virtual {v0}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getJpegQuality()I

    move-result v3

    invoke-direct {p0, v2, v3}, Landroidx/camera/core/imagecapture/ProcessingNode;->cropAndMaybeApplyEffect(Landroidx/camera/core/processing/Packet;I)Landroidx/camera/core/processing/Packet;

    move-result-object v2

    .line 198
    :cond_2
    iget-object v3, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mJpegBytes2Disk:Landroidx/camera/core/processing/Operation;

    .line 199
    invoke-virtual {v0}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getOutputFileOptions()Landroidx/camera/core/ImageCapture$OutputFileOptions;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/core/ImageCapture$OutputFileOptions;

    invoke-static {v2, v4}, Landroidx/camera/core/imagecapture/JpegBytes2Disk$In;->of(Landroidx/camera/core/processing/Packet;Landroidx/camera/core/ImageCapture$OutputFileOptions;)Landroidx/camera/core/imagecapture/JpegBytes2Disk$In;

    move-result-object v4

    .line 198
    invoke-interface {v3, v4}, Landroidx/camera/core/processing/Operation;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/ImageCapture$OutputFileResults;

    return-object v3
.end method

.method public release()V
    .locals 0

    .line 157
    return-void
.end method

.method public bridge synthetic transform(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 63
    check-cast p1, Landroidx/camera/core/imagecapture/ProcessingNode$In;

    invoke-virtual {p0, p1}, Landroidx/camera/core/imagecapture/ProcessingNode;->transform(Landroidx/camera/core/imagecapture/ProcessingNode$In;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public transform(Landroidx/camera/core/imagecapture/ProcessingNode$In;)Ljava/lang/Void;
    .locals 2
    .param p1, "inputEdge"    # Landroidx/camera/core/imagecapture/ProcessingNode$In;

    .line 124
    iput-object p1, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mInputEdge:Landroidx/camera/core/imagecapture/ProcessingNode$In;

    .line 126
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/ProcessingNode$In;->getEdge()Landroidx/camera/core/processing/Edge;

    move-result-object v0

    new-instance v1, Landroidx/camera/core/imagecapture/ProcessingNode$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Landroidx/camera/core/imagecapture/ProcessingNode$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/core/imagecapture/ProcessingNode;)V

    invoke-virtual {v0, v1}, Landroidx/camera/core/processing/Edge;->setListener(Landroidx/core/util/Consumer;)V

    .line 135
    new-instance v0, Landroidx/camera/core/imagecapture/ProcessingInput2Packet;

    invoke-direct {v0}, Landroidx/camera/core/imagecapture/ProcessingInput2Packet;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mInput2Packet:Landroidx/camera/core/processing/Operation;

    .line 136
    new-instance v0, Landroidx/camera/core/imagecapture/Image2JpegBytes;

    iget-object v1, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mQuirks:Landroidx/camera/core/impl/Quirks;

    invoke-direct {v0, v1}, Landroidx/camera/core/imagecapture/Image2JpegBytes;-><init>(Landroidx/camera/core/impl/Quirks;)V

    iput-object v0, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mImage2JpegBytes:Landroidx/camera/core/processing/Operation;

    .line 137
    new-instance v0, Landroidx/camera/core/imagecapture/JpegBytes2CroppedBitmap;

    invoke-direct {v0}, Landroidx/camera/core/imagecapture/JpegBytes2CroppedBitmap;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mJpegBytes2CroppedBitmap:Landroidx/camera/core/processing/Operation;

    .line 138
    new-instance v0, Landroidx/camera/core/imagecapture/Bitmap2JpegBytes;

    invoke-direct {v0}, Landroidx/camera/core/imagecapture/Bitmap2JpegBytes;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mBitmap2JpegBytes:Landroidx/camera/core/processing/Operation;

    .line 139
    new-instance v0, Landroidx/camera/core/imagecapture/JpegBytes2Disk;

    invoke-direct {v0}, Landroidx/camera/core/imagecapture/JpegBytes2Disk;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mJpegBytes2Disk:Landroidx/camera/core/processing/Operation;

    .line 140
    new-instance v0, Landroidx/camera/core/imagecapture/JpegImage2Result;

    invoke-direct {v0}, Landroidx/camera/core/imagecapture/JpegImage2Result;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mJpegImage2Result:Landroidx/camera/core/processing/Operation;

    .line 141
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/ProcessingNode$In;->getInputFormat()I

    move-result v0

    const/16 v1, 0x23

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mImageProcessor:Landroidx/camera/core/processing/InternalImageProcessor;

    if-nez v0, :cond_0

    iget-boolean v0, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mHasIncorrectJpegMetadataQuirk:Z

    if-eqz v0, :cond_1

    .line 146
    :cond_0
    new-instance v0, Landroidx/camera/core/imagecapture/JpegBytes2Image;

    invoke-direct {v0}, Landroidx/camera/core/imagecapture/JpegBytes2Image;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mJpegBytes2Image:Landroidx/camera/core/processing/Operation;

    .line 148
    :cond_1
    iget-object v0, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mImageProcessor:Landroidx/camera/core/processing/InternalImageProcessor;

    if-eqz v0, :cond_2

    .line 149
    new-instance v0, Landroidx/camera/core/imagecapture/BitmapEffect;

    iget-object v1, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mImageProcessor:Landroidx/camera/core/processing/InternalImageProcessor;

    invoke-direct {v0, v1}, Landroidx/camera/core/imagecapture/BitmapEffect;-><init>(Landroidx/camera/core/processing/InternalImageProcessor;)V

    iput-object v0, p0, Landroidx/camera/core/imagecapture/ProcessingNode;->mBitmapEffect:Landroidx/camera/core/processing/Operation;

    .line 152
    :cond_2
    const/4 v0, 0x0

    return-object v0
.end method
