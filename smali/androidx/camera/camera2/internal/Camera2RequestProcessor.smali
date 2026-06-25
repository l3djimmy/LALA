.class public Landroidx/camera/camera2/internal/Camera2RequestProcessor;
.super Ljava/lang/Object;
.source "Camera2RequestProcessor.java"

# interfaces
.implements Landroidx/camera/core/impl/RequestProcessor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/camera2/internal/Camera2RequestProcessor$Camera2CallbackWrapper;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Camera2RequestProcessor"


# instance fields
.field private final mCaptureSession:Landroidx/camera/camera2/internal/CaptureSession;

.field private volatile mIsClosed:Z

.field private final mProcessorSurfaces:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SessionProcessorSurface;",
            ">;"
        }
    .end annotation
.end field

.field private volatile mSessionConfig:Landroidx/camera/core/impl/SessionConfig;


# direct methods
.method public constructor <init>(Landroidx/camera/camera2/internal/CaptureSession;Ljava/util/List;)V
    .locals 3
    .param p1, "captureSession"    # Landroidx/camera/camera2/internal/CaptureSession;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/camera2/internal/CaptureSession;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SessionProcessorSurface;",
            ">;)V"
        }
    .end annotation

    .line 74
    .local p2, "processorSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SessionProcessorSurface;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mIsClosed:Z

    .line 75
    iget-object v1, p1, Landroidx/camera/camera2/internal/CaptureSession;->mState:Landroidx/camera/camera2/internal/CaptureSession$State;

    sget-object v2, Landroidx/camera/camera2/internal/CaptureSession$State;->OPENED:Landroidx/camera/camera2/internal/CaptureSession$State;

    if-ne v1, v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "CaptureSession state must be OPENED. Current state:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p1, Landroidx/camera/camera2/internal/CaptureSession;->mState:Landroidx/camera/camera2/internal/CaptureSession$State;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 77
    iput-object p1, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mCaptureSession:Landroidx/camera/camera2/internal/CaptureSession;

    .line 78
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mProcessorSurfaces:Ljava/util/List;

    .line 79
    return-void
.end method

.method private areRequestsValid(Ljava/util/List;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/RequestProcessor$Request;",
            ">;)Z"
        }
    .end annotation

    .line 97
    .local p1, "requests":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/RequestProcessor$Request;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/RequestProcessor$Request;

    .line 98
    .local v1, "request":Landroidx/camera/core/impl/RequestProcessor$Request;
    invoke-direct {p0, v1}, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->isRequestValid(Landroidx/camera/core/impl/RequestProcessor$Request;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 99
    const/4 v0, 0x0

    return v0

    .line 101
    .end local v1    # "request":Landroidx/camera/core/impl/RequestProcessor$Request;
    :cond_0
    goto :goto_0

    .line 102
    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method private findSurface(I)Landroidx/camera/core/impl/DeferrableSurface;
    .locals 3
    .param p1, "outputConfigId"    # I

    .line 298
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mProcessorSurfaces:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/SessionProcessorSurface;

    .line 299
    .local v1, "sessionProcessorSurface":Landroidx/camera/core/impl/SessionProcessorSurface;
    invoke-virtual {v1}, Landroidx/camera/core/impl/SessionProcessorSurface;->getOutputConfigId()I

    move-result v2

    if-ne v2, p1, :cond_0

    .line 300
    return-object v1

    .line 302
    .end local v1    # "sessionProcessorSurface":Landroidx/camera/core/impl/SessionProcessorSurface;
    :cond_0
    goto :goto_0

    .line 303
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method private isRequestValid(Landroidx/camera/core/impl/RequestProcessor$Request;)Z
    .locals 5
    .param p1, "request"    # Landroidx/camera/core/impl/RequestProcessor$Request;

    .line 106
    invoke-interface {p1}, Landroidx/camera/core/impl/RequestProcessor$Request;->getTargetOutputConfigIds()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    const-string v2, "Camera2RequestProcessor"

    if-eqz v0, :cond_0

    .line 107
    const-string/jumbo v0, "Unable to submit the RequestProcessor.Request: empty targetOutputConfigIds"

    invoke-static {v2, v0}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    return v1

    .line 111
    :cond_0
    invoke-interface {p1}, Landroidx/camera/core/impl/RequestProcessor$Request;->getTargetOutputConfigIds()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    .line 112
    .local v3, "outputConfigId":Ljava/lang/Integer;
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-direct {p0, v4}, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->findSurface(I)Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v4

    if-nez v4, :cond_1

    .line 113
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Unable to submit the RequestProcessor.Request: targetOutputConfigId("

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, ") is not a valid id"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    return v1

    .line 117
    .end local v3    # "outputConfigId":Ljava/lang/Integer;
    :cond_1
    goto :goto_0

    .line 119
    :cond_2
    const/4 v0, 0x1

    return v0
.end method


# virtual methods
.method public abortCaptures()V
    .locals 1

    .line 197
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mIsClosed:Z

    if-eqz v0, :cond_0

    .line 198
    return-void

    .line 200
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mCaptureSession:Landroidx/camera/camera2/internal/CaptureSession;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/CaptureSession;->abortCaptures()V

    .line 201
    return-void
.end method

.method public close()V
    .locals 1

    .line 85
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mIsClosed:Z

    .line 86
    return-void
.end method

.method findOutputConfigId(Landroid/view/Surface;)I
    .locals 3
    .param p1, "surface"    # Landroid/view/Surface;

    .line 282
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mProcessorSurfaces:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/SessionProcessorSurface;

    .line 284
    .local v1, "sessionProcessorSurface":Landroidx/camera/core/impl/SessionProcessorSurface;
    :try_start_0
    invoke-virtual {v1}, Landroidx/camera/core/impl/SessionProcessorSurface;->getSurface()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v2

    invoke-interface {v2}, Lcom/google/common/util/concurrent/ListenableFuture;->get()Ljava/lang/Object;

    move-result-object v2

    if-ne v2, p1, :cond_0

    .line 285
    invoke-virtual {v1}, Landroidx/camera/core/impl/SessionProcessorSurface;->getOutputConfigId()I

    move-result v0
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 290
    :cond_0
    goto :goto_1

    .line 287
    :catch_0
    move-exception v2

    goto :goto_1

    :catch_1
    move-exception v2

    .line 291
    .end local v1    # "sessionProcessorSurface":Landroidx/camera/core/impl/SessionProcessorSurface;
    :goto_1
    goto :goto_0

    .line 293
    :cond_1
    const/4 v0, -0x1

    return v0
.end method

.method public setRepeating(Landroidx/camera/core/impl/RequestProcessor$Request;Landroidx/camera/core/impl/RequestProcessor$Callback;)I
    .locals 5
    .param p1, "request"    # Landroidx/camera/core/impl/RequestProcessor$Request;
    .param p2, "callback"    # Landroidx/camera/core/impl/RequestProcessor$Callback;

    .line 163
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mIsClosed:Z

    if-nez v0, :cond_4

    invoke-direct {p0, p1}, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->isRequestValid(Landroidx/camera/core/impl/RequestProcessor$Request;)Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_3

    .line 167
    :cond_0
    new-instance v0, Landroidx/camera/core/impl/SessionConfig$Builder;

    invoke-direct {v0}, Landroidx/camera/core/impl/SessionConfig$Builder;-><init>()V

    .line 168
    .local v0, "sessionConfigBuilder":Landroidx/camera/core/impl/SessionConfig$Builder;
    invoke-interface {p1}, Landroidx/camera/core/impl/RequestProcessor$Request;->getTemplateId()I

    move-result v1

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/SessionConfig$Builder;->setTemplateType(I)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 169
    invoke-interface {p1}, Landroidx/camera/core/impl/RequestProcessor$Request;->getParameters()Landroidx/camera/core/impl/Config;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/SessionConfig$Builder;->setImplementationOptions(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 170
    new-instance v1, Landroidx/camera/camera2/internal/Camera2RequestProcessor$Camera2CallbackWrapper;

    const/4 v2, 0x1

    invoke-direct {v1, p0, p1, p2, v2}, Landroidx/camera/camera2/internal/Camera2RequestProcessor$Camera2CallbackWrapper;-><init>(Landroidx/camera/camera2/internal/Camera2RequestProcessor;Landroidx/camera/core/impl/RequestProcessor$Request;Landroidx/camera/core/impl/RequestProcessor$Callback;Z)V

    invoke-static {v1}, Landroidx/camera/camera2/internal/CaptureCallbackContainer;->create(Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;)Landroidx/camera/camera2/internal/CaptureCallbackContainer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/SessionConfig$Builder;->addCameraCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 173
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mSessionConfig:Landroidx/camera/core/impl/SessionConfig;

    if-eqz v1, :cond_2

    .line 177
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mSessionConfig:Landroidx/camera/core/impl/SessionConfig;

    invoke-virtual {v1}, Landroidx/camera/core/impl/SessionConfig;->getRepeatingCameraCaptureCallbacks()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/CameraCaptureCallback;

    .line 178
    .local v2, "cameraCaptureCallback":Landroidx/camera/core/impl/CameraCaptureCallback;
    invoke-virtual {v0, v2}, Landroidx/camera/core/impl/SessionConfig$Builder;->addCameraCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 179
    .end local v2    # "cameraCaptureCallback":Landroidx/camera/core/impl/CameraCaptureCallback;
    goto :goto_0

    .line 182
    :cond_1
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mSessionConfig:Landroidx/camera/core/impl/SessionConfig;

    invoke-virtual {v1}, Landroidx/camera/core/impl/SessionConfig;->getRepeatingCaptureConfig()Landroidx/camera/core/impl/CaptureConfig;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/camera/core/impl/CaptureConfig;->getTagBundle()Landroidx/camera/core/impl/TagBundle;

    move-result-object v1

    .line 183
    .local v1, "tagBundle":Landroidx/camera/core/impl/TagBundle;
    invoke-virtual {v1}, Landroidx/camera/core/impl/TagBundle;->listKeys()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 184
    .local v3, "key":Ljava/lang/String;
    invoke-virtual {v1, v3}, Landroidx/camera/core/impl/TagBundle;->getTag(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroidx/camera/core/impl/SessionConfig$Builder;->addTag(Ljava/lang/String;Ljava/lang/Object;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 185
    .end local v3    # "key":Ljava/lang/String;
    goto :goto_1

    .line 188
    .end local v1    # "tagBundle":Landroidx/camera/core/impl/TagBundle;
    :cond_2
    invoke-interface {p1}, Landroidx/camera/core/impl/RequestProcessor$Request;->getTargetOutputConfigIds()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 189
    .local v2, "outputConfigId":Ljava/lang/Integer;
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-direct {p0, v3}, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->findSurface(I)Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroidx/camera/core/impl/SessionConfig$Builder;->addSurface(Landroidx/camera/core/impl/DeferrableSurface;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 190
    .end local v2    # "outputConfigId":Ljava/lang/Integer;
    goto :goto_2

    .line 192
    :cond_3
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mCaptureSession:Landroidx/camera/camera2/internal/CaptureSession;

    invoke-virtual {v0}, Landroidx/camera/core/impl/SessionConfig$Builder;->build()Landroidx/camera/core/impl/SessionConfig;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroidx/camera/camera2/internal/CaptureSession;->issueRepeatingCaptureRequests(Landroidx/camera/core/impl/SessionConfig;)I

    move-result v1

    return v1

    .line 164
    .end local v0    # "sessionConfigBuilder":Landroidx/camera/core/impl/SessionConfig$Builder;
    :cond_4
    :goto_3
    const/4 v0, -0x1

    return v0
.end method

.method public stopRepeating()V
    .locals 1

    .line 205
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mIsClosed:Z

    if-eqz v0, :cond_0

    .line 206
    return-void

    .line 208
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mCaptureSession:Landroidx/camera/camera2/internal/CaptureSession;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/CaptureSession;->stopRepeating()V

    .line 209
    return-void
.end method

.method public submit(Landroidx/camera/core/impl/RequestProcessor$Request;Landroidx/camera/core/impl/RequestProcessor$Callback;)I
    .locals 2
    .param p1, "request"    # Landroidx/camera/core/impl/RequestProcessor$Request;
    .param p2, "callback"    # Landroidx/camera/core/impl/RequestProcessor$Callback;

    .line 126
    const/4 v0, 0x1

    new-array v0, v0, [Landroidx/camera/core/impl/RequestProcessor$Request;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->submit(Ljava/util/List;Landroidx/camera/core/impl/RequestProcessor$Callback;)I

    move-result v0

    return v0
.end method

.method public submit(Ljava/util/List;Landroidx/camera/core/impl/RequestProcessor$Callback;)I
    .locals 8
    .param p2, "callback"    # Landroidx/camera/core/impl/RequestProcessor$Callback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/RequestProcessor$Request;",
            ">;",
            "Landroidx/camera/core/impl/RequestProcessor$Callback;",
            ")I"
        }
    .end annotation

    .line 133
    .local p1, "requests":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/RequestProcessor$Request;>;"
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mIsClosed:Z

    if-nez v0, :cond_3

    invoke-direct {p0, p1}, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->areRequestsValid(Ljava/util/List;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_2

    .line 137
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 138
    .local v0, "captureConfigs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/camera/core/impl/CaptureConfig;>;"
    const/4 v1, 0x1

    .line 139
    .local v1, "shouldInvokeSequenceCallback":Z
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/RequestProcessor$Request;

    .line 140
    .local v3, "request":Landroidx/camera/core/impl/RequestProcessor$Request;
    new-instance v4, Landroidx/camera/core/impl/CaptureConfig$Builder;

    invoke-direct {v4}, Landroidx/camera/core/impl/CaptureConfig$Builder;-><init>()V

    .line 141
    .local v4, "builder":Landroidx/camera/core/impl/CaptureConfig$Builder;
    invoke-interface {v3}, Landroidx/camera/core/impl/RequestProcessor$Request;->getTemplateId()I

    move-result v5

    invoke-virtual {v4, v5}, Landroidx/camera/core/impl/CaptureConfig$Builder;->setTemplateType(I)V

    .line 142
    invoke-interface {v3}, Landroidx/camera/core/impl/RequestProcessor$Request;->getParameters()Landroidx/camera/core/impl/Config;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroidx/camera/core/impl/CaptureConfig$Builder;->setImplementationOptions(Landroidx/camera/core/impl/Config;)V

    .line 143
    new-instance v5, Landroidx/camera/camera2/internal/Camera2RequestProcessor$Camera2CallbackWrapper;

    invoke-direct {v5, p0, v3, p2, v1}, Landroidx/camera/camera2/internal/Camera2RequestProcessor$Camera2CallbackWrapper;-><init>(Landroidx/camera/camera2/internal/Camera2RequestProcessor;Landroidx/camera/core/impl/RequestProcessor$Request;Landroidx/camera/core/impl/RequestProcessor$Callback;Z)V

    .line 144
    invoke-static {v5}, Landroidx/camera/camera2/internal/CaptureCallbackContainer;->create(Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;)Landroidx/camera/camera2/internal/CaptureCallbackContainer;

    move-result-object v5

    .line 143
    invoke-virtual {v4, v5}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addCameraCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;)V

    .line 149
    const/4 v1, 0x0

    .line 151
    invoke-interface {v3}, Landroidx/camera/core/impl/RequestProcessor$Request;->getTargetOutputConfigIds()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    .line 152
    .local v6, "outputConfigId":Ljava/lang/Integer;
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-direct {p0, v7}, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->findSurface(I)Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v7

    invoke-virtual {v4, v7}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addSurface(Landroidx/camera/core/impl/DeferrableSurface;)V

    .line 153
    .end local v6    # "outputConfigId":Ljava/lang/Integer;
    goto :goto_1

    .line 154
    :cond_1
    invoke-virtual {v4}, Landroidx/camera/core/impl/CaptureConfig$Builder;->build()Landroidx/camera/core/impl/CaptureConfig;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 155
    .end local v3    # "request":Landroidx/camera/core/impl/RequestProcessor$Request;
    .end local v4    # "builder":Landroidx/camera/core/impl/CaptureConfig$Builder;
    goto :goto_0

    .line 156
    :cond_2
    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mCaptureSession:Landroidx/camera/camera2/internal/CaptureSession;

    invoke-virtual {v2, v0}, Landroidx/camera/camera2/internal/CaptureSession;->issueBurstCaptureRequest(Ljava/util/List;)I

    move-result v2

    return v2

    .line 134
    .end local v0    # "captureConfigs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/camera/core/impl/CaptureConfig;>;"
    .end local v1    # "shouldInvokeSequenceCallback":Z
    :cond_3
    :goto_2
    const/4 v0, -0x1

    return v0
.end method

.method public updateSessionConfig(Landroidx/camera/core/impl/SessionConfig;)V
    .locals 0
    .param p1, "sessionConfig"    # Landroidx/camera/core/impl/SessionConfig;

    .line 93
    iput-object p1, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->mSessionConfig:Landroidx/camera/core/impl/SessionConfig;

    .line 94
    return-void
.end method
