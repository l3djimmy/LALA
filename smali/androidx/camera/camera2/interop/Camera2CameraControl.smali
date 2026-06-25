.class public final Landroidx/camera/camera2/interop/Camera2CameraControl;
.super Ljava/lang/Object;
.source "Camera2CameraControl.java"


# static fields
.field public static final TAG_KEY:Ljava/lang/String; = "Camera2CameraControl"


# instance fields
.field private mBuilder:Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

.field private final mCamera2CameraControlImpl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

.field private final mCaptureResultListener:Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CaptureResultListener;

.field mCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field final mExecutor:Ljava/util/concurrent/Executor;

.field private mIsActive:Z

.field final mLock:Ljava/lang/Object;

.field private mPendingUpdate:Z


# direct methods
.method public constructor <init>(Landroidx/camera/camera2/internal/Camera2CameraControlImpl;Ljava/util/concurrent/Executor;)V
    .locals 1
    .param p1, "camera2CameraControlImpl"    # Landroidx/camera/camera2/internal/Camera2CameraControlImpl;
    .param p2, "executor"    # Ljava/util/concurrent/Executor;

    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mIsActive:Z

    .line 59
    iput-boolean v0, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mPendingUpdate:Z

    .line 64
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mLock:Ljava/lang/Object;

    .line 66
    new-instance v0, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    invoke-direct {v0}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mBuilder:Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    .line 70
    new-instance v0, Landroidx/camera/camera2/interop/Camera2CameraControl$$ExternalSyntheticLambda5;

    invoke-direct {v0, p0}, Landroidx/camera/camera2/interop/Camera2CameraControl$$ExternalSyntheticLambda5;-><init>(Landroidx/camera/camera2/interop/Camera2CameraControl;)V

    iput-object v0, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mCaptureResultListener:Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CaptureResultListener;

    .line 100
    iput-object p1, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mCamera2CameraControlImpl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    .line 101
    iput-object p2, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mExecutor:Ljava/util/concurrent/Executor;

    .line 102
    return-void
.end method

.method private addCaptureRequestOptionsInternal(Landroidx/camera/camera2/interop/CaptureRequestOptions;)V
    .locals 6
    .param p1, "bundle"    # Landroidx/camera/camera2/interop/CaptureRequestOptions;

    .line 258
    iget-object v0, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 259
    :try_start_0
    invoke-virtual {p1}, Landroidx/camera/camera2/interop/CaptureRequestOptions;->listOptions()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/Config$Option;

    .line 261
    .local v2, "option":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<*>;"
    move-object v3, v2

    .line 262
    .local v3, "objectOpt":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<Ljava/lang/Object;>;"
    iget-object v4, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mBuilder:Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    invoke-virtual {v4}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v4

    .line 263
    invoke-virtual {p1, v3}, Landroidx/camera/camera2/interop/CaptureRequestOptions;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v5

    .line 262
    invoke-interface {v4, v3, v5}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 264
    .end local v2    # "option":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<*>;"
    .end local v3    # "objectOpt":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<Ljava/lang/Object;>;"
    goto :goto_0

    .line 265
    :cond_0
    monitor-exit v0

    .line 266
    return-void

    .line 265
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private clearCaptureRequestOptionsInternal()V
    .locals 2

    .line 269
    iget-object v0, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 270
    :try_start_0
    new-instance v1, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    invoke-direct {v1}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;-><init>()V

    iput-object v1, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mBuilder:Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    .line 271
    monitor-exit v0

    .line 272
    return-void

    .line 271
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static from(Landroidx/camera/core/CameraControl;)Landroidx/camera/camera2/interop/Camera2CameraControl;
    .locals 3
    .param p0, "cameraControl"    # Landroidx/camera/core/CameraControl;

    .line 129
    move-object v0, p0

    check-cast v0, Landroidx/camera/core/impl/CameraControlInternal;

    .line 130
    invoke-interface {v0}, Landroidx/camera/core/impl/CameraControlInternal;->getImplementation()Landroidx/camera/core/impl/CameraControlInternal;

    move-result-object v0

    .line 131
    .local v0, "cameraControlImpl":Landroidx/camera/core/impl/CameraControlInternal;
    instance-of v1, v0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    const-string v2, "CameraControl doesn\'t contain Camera2 implementation."

    invoke-static {v1, v2}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 133
    move-object v1, v0

    check-cast v1, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->getCamera2CameraControl()Landroidx/camera/camera2/interop/Camera2CameraControl;

    move-result-object v1

    return-object v1
.end method

.method private setActiveInternal(Z)V
    .locals 3
    .param p1, "isActive"    # Z

    .line 313
    iget-boolean v0, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mIsActive:Z

    if-ne v0, p1, :cond_0

    .line 314
    return-void

    .line 317
    :cond_0
    iput-boolean p1, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mIsActive:Z

    .line 319
    iget-boolean v0, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mIsActive:Z

    if-eqz v0, :cond_1

    .line 320
    iget-boolean v0, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mPendingUpdate:Z

    if-eqz v0, :cond_2

    .line 321
    invoke-direct {p0}, Landroidx/camera/camera2/interop/Camera2CameraControl;->updateSession()V

    goto :goto_0

    .line 324
    :cond_1
    iget-object v0, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    if-eqz v0, :cond_2

    .line 325
    iget-object v0, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    new-instance v1, Landroidx/camera/core/CameraControl$OperationCanceledException;

    const-string/jumbo v2, "The camera control has became inactive."

    invoke-direct {v1, v2}, Landroidx/camera/core/CameraControl$OperationCanceledException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z

    .line 327
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 330
    :cond_2
    :goto_0
    return-void
.end method

.method private updateConfig(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 276
    .local p1, "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;, "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Ljava/lang/Void;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mPendingUpdate:Z

    .line 278
    const/4 v0, 0x0

    .line 279
    .local v0, "completerToCancel":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;, "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Ljava/lang/Void;>;"
    iget-object v1, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    if-eqz v1, :cond_0

    .line 280
    iget-object v0, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 282
    :cond_0
    iput-object p1, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 283
    iget-boolean v1, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mIsActive:Z

    if-eqz v1, :cond_1

    .line 284
    invoke-direct {p0}, Landroidx/camera/camera2/interop/Camera2CameraControl;->updateSession()V

    .line 286
    :cond_1
    if-eqz v0, :cond_2

    .line 287
    new-instance v1, Landroidx/camera/core/CameraControl$OperationCanceledException;

    const-string v2, "Camera2CameraControl was updated with new options."

    invoke-direct {v1, v2}, Landroidx/camera/core/CameraControl$OperationCanceledException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z

    .line 290
    :cond_2
    return-void
.end method

.method private updateSession()V
    .locals 1

    .line 294
    iget-object v0, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mCamera2CameraControlImpl:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->updateSessionConfig()V

    .line 295
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mPendingUpdate:Z

    .line 296
    return-void
.end method


# virtual methods
.method public addCaptureRequestOptions(Landroidx/camera/camera2/interop/CaptureRequestOptions;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .param p1, "bundle"    # Landroidx/camera/camera2/interop/CaptureRequestOptions;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/camera2/interop/CaptureRequestOptions;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 191
    invoke-direct {p0, p1}, Landroidx/camera/camera2/interop/Camera2CameraControl;->addCaptureRequestOptionsInternal(Landroidx/camera/camera2/interop/CaptureRequestOptions;)V

    .line 193
    new-instance v0, Landroidx/camera/camera2/interop/Camera2CameraControl$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Landroidx/camera/camera2/interop/Camera2CameraControl$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/camera2/interop/Camera2CameraControl;)V

    invoke-static {v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->nonCancellationPropagating(Lcom/google/common/util/concurrent/ListenableFuture;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method public clearCaptureRequestOptions()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 229
    invoke-direct {p0}, Landroidx/camera/camera2/interop/Camera2CameraControl;->clearCaptureRequestOptionsInternal()V

    .line 231
    new-instance v0, Landroidx/camera/camera2/interop/Camera2CameraControl$$ExternalSyntheticLambda6;

    invoke-direct {v0, p0}, Landroidx/camera/camera2/interop/Camera2CameraControl$$ExternalSyntheticLambda6;-><init>(Landroidx/camera/camera2/interop/Camera2CameraControl;)V

    invoke-static {v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->nonCancellationPropagating(Lcom/google/common/util/concurrent/ListenableFuture;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method public getCamera2ImplConfig()Landroidx/camera/camera2/impl/Camera2ImplConfig;
    .locals 4

    .line 247
    iget-object v0, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 248
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    if-eqz v1, :cond_0

    .line 249
    iget-object v1, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mBuilder:Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    invoke-virtual {v1}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v1

    sget-object v2, Landroidx/camera/camera2/impl/Camera2ImplConfig;->CAPTURE_REQUEST_TAG_OPTION:Landroidx/camera/core/impl/Config$Option;

    iget-object v3, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 251
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 249
    invoke-interface {v1, v2, v3}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 253
    :cond_0
    iget-object v1, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mBuilder:Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    invoke-virtual {v1}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;->build()Landroidx/camera/camera2/impl/Camera2ImplConfig;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 254
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getCaptureRequestListener()Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CaptureResultListener;
    .locals 1

    .line 107
    iget-object v0, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mCaptureResultListener:Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CaptureResultListener;

    return-object v0
.end method

.method public getCaptureRequestOptions()Landroidx/camera/camera2/interop/CaptureRequestOptions;
    .locals 2

    .line 212
    iget-object v0, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 213
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mBuilder:Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    invoke-virtual {v1}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;->build()Landroidx/camera/camera2/impl/Camera2ImplConfig;

    move-result-object v1

    invoke-static {v1}, Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;->from(Landroidx/camera/core/impl/Config;)Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;->build()Landroidx/camera/camera2/interop/CaptureRequestOptions;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 214
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method synthetic lambda$addCaptureRequestOptions$3$androidx-camera-camera2-interop-Camera2CameraControl(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V
    .locals 0
    .param p1, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 195
    invoke-direct {p0, p1}, Landroidx/camera/camera2/interop/Camera2CameraControl;->updateConfig(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V

    .line 196
    return-void
.end method

.method synthetic lambda$addCaptureRequestOptions$4$androidx-camera-camera2-interop-Camera2CameraControl(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 2
    .param p1, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 194
    iget-object v0, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/camera2/interop/Camera2CameraControl$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1}, Landroidx/camera/camera2/interop/Camera2CameraControl$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/camera2/interop/Camera2CameraControl;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 197
    const-string/jumbo v0, "addCaptureRequestOptions"

    return-object v0
.end method

.method synthetic lambda$clearCaptureRequestOptions$5$androidx-camera-camera2-interop-Camera2CameraControl(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V
    .locals 0
    .param p1, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 233
    invoke-direct {p0, p1}, Landroidx/camera/camera2/interop/Camera2CameraControl;->updateConfig(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V

    .line 234
    return-void
.end method

.method synthetic lambda$clearCaptureRequestOptions$6$androidx-camera-camera2-interop-Camera2CameraControl(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 2
    .param p1, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 232
    iget-object v0, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/camera2/interop/Camera2CameraControl$$ExternalSyntheticLambda7;

    invoke-direct {v1, p0, p1}, Landroidx/camera/camera2/interop/Camera2CameraControl$$ExternalSyntheticLambda7;-><init>(Landroidx/camera/camera2/interop/Camera2CameraControl;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 235
    const-string/jumbo v0, "clearCaptureRequestOptions"

    return-object v0
.end method

.method synthetic lambda$new$0$androidx-camera-camera2-interop-Camera2CameraControl(Landroid/hardware/camera2/TotalCaptureResult;)Z
    .locals 6
    .param p1, "captureResult"    # Landroid/hardware/camera2/TotalCaptureResult;

    .line 72
    const/4 v0, 0x0

    .line 73
    .local v0, "completerToSet":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;, "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Ljava/lang/Void;>;"
    iget-object v1, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 74
    invoke-virtual {p1}, Landroid/hardware/camera2/TotalCaptureResult;->getRequest()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v1

    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest;->getTag()Ljava/lang/Object;

    move-result-object v1

    .line 75
    .local v1, "tag":Ljava/lang/Object;
    instance-of v3, v1, Landroidx/camera/core/impl/TagBundle;

    if-eqz v3, :cond_0

    .line 76
    move-object v3, v1

    check-cast v3, Landroidx/camera/core/impl/TagBundle;

    .line 77
    .local v3, "tagBundle":Landroidx/camera/core/impl/TagBundle;
    const-string v4, "Camera2CameraControl"

    invoke-virtual {v3, v4}, Landroidx/camera/core/impl/TagBundle;->getTag(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    .line 78
    .local v4, "tagInteger":Ljava/lang/Integer;
    if-eqz v4, :cond_0

    iget-object v5, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    invoke-virtual {v5}, Ljava/lang/Object;->hashCode()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 79
    iget-object v0, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 80
    iput-object v2, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 84
    .end local v1    # "tag":Ljava/lang/Object;
    .end local v3    # "tagBundle":Landroidx/camera/core/impl/TagBundle;
    .end local v4    # "tagInteger":Ljava/lang/Integer;
    :cond_0
    if-eqz v0, :cond_1

    .line 85
    invoke-virtual {v0, v2}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    .line 88
    :cond_1
    const/4 v1, 0x0

    return v1
.end method

.method synthetic lambda$setActive$7$androidx-camera-camera2-interop-Camera2CameraControl(Z)V
    .locals 0
    .param p1, "isActive"    # Z

    .line 308
    invoke-direct {p0, p1}, Landroidx/camera/camera2/interop/Camera2CameraControl;->setActiveInternal(Z)V

    return-void
.end method

.method synthetic lambda$setCaptureRequestOptions$1$androidx-camera-camera2-interop-Camera2CameraControl(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V
    .locals 0
    .param p1, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 163
    invoke-direct {p0, p1}, Landroidx/camera/camera2/interop/Camera2CameraControl;->updateConfig(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V

    .line 164
    return-void
.end method

.method synthetic lambda$setCaptureRequestOptions$2$androidx-camera-camera2-interop-Camera2CameraControl(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 2
    .param p1, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 162
    iget-object v0, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/camera2/interop/Camera2CameraControl$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0, p1}, Landroidx/camera/camera2/interop/Camera2CameraControl$$ExternalSyntheticLambda3;-><init>(Landroidx/camera/camera2/interop/Camera2CameraControl;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 165
    const-string/jumbo v0, "setCaptureRequestOptions"

    return-object v0
.end method

.method public setActive(Z)V
    .locals 2
    .param p1, "isActive"    # Z

    .line 308
    iget-object v0, p0, Landroidx/camera/camera2/interop/Camera2CameraControl;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/camera2/interop/Camera2CameraControl$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0, p1}, Landroidx/camera/camera2/interop/Camera2CameraControl$$ExternalSyntheticLambda2;-><init>(Landroidx/camera/camera2/interop/Camera2CameraControl;Z)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 309
    return-void
.end method

.method public setCaptureRequestOptions(Landroidx/camera/camera2/interop/CaptureRequestOptions;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .param p1, "bundle"    # Landroidx/camera/camera2/interop/CaptureRequestOptions;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/camera2/interop/CaptureRequestOptions;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 158
    invoke-direct {p0}, Landroidx/camera/camera2/interop/Camera2CameraControl;->clearCaptureRequestOptionsInternal()V

    .line 159
    invoke-direct {p0, p1}, Landroidx/camera/camera2/interop/Camera2CameraControl;->addCaptureRequestOptionsInternal(Landroidx/camera/camera2/interop/CaptureRequestOptions;)V

    .line 161
    new-instance v0, Landroidx/camera/camera2/interop/Camera2CameraControl$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0}, Landroidx/camera/camera2/interop/Camera2CameraControl$$ExternalSyntheticLambda4;-><init>(Landroidx/camera/camera2/interop/Camera2CameraControl;)V

    invoke-static {v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->nonCancellationPropagating(Lcom/google/common/util/concurrent/ListenableFuture;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method
