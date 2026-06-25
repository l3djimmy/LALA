.class public Landroidx/camera/core/impl/SessionConfig$Builder;
.super Landroidx/camera/core/impl/SessionConfig$BaseBuilder;
.source "SessionConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/core/impl/SessionConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 372
    invoke-direct {p0}, Landroidx/camera/core/impl/SessionConfig$BaseBuilder;-><init>()V

    return-void
.end method

.method public static createFrom(Landroidx/camera/core/impl/UseCaseConfig;Landroid/util/Size;)Landroidx/camera/core/impl/SessionConfig$Builder;
    .locals 4
    .param p1, "resolution"    # Landroid/util/Size;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;",
            "Landroid/util/Size;",
            ")",
            "Landroidx/camera/core/impl/SessionConfig$Builder;"
        }
    .end annotation

    .line 382
    .local p0, "config":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    const/4 v0, 0x0

    invoke-interface {p0, v0}, Landroidx/camera/core/impl/UseCaseConfig;->getSessionOptionUnpacker(Landroidx/camera/core/impl/SessionConfig$OptionUnpacker;)Landroidx/camera/core/impl/SessionConfig$OptionUnpacker;

    move-result-object v0

    .line 383
    .local v0, "unpacker":Landroidx/camera/core/impl/SessionConfig$OptionUnpacker;
    if-eqz v0, :cond_0

    .line 389
    new-instance v1, Landroidx/camera/core/impl/SessionConfig$Builder;

    invoke-direct {v1}, Landroidx/camera/core/impl/SessionConfig$Builder;-><init>()V

    .line 392
    .local v1, "builder":Landroidx/camera/core/impl/SessionConfig$Builder;
    invoke-interface {v0, p1, p0, v1}, Landroidx/camera/core/impl/SessionConfig$OptionUnpacker;->unpack(Landroid/util/Size;Landroidx/camera/core/impl/UseCaseConfig;Landroidx/camera/core/impl/SessionConfig$Builder;)V

    .line 393
    return-object v1

    .line 384
    .end local v1    # "builder":Landroidx/camera/core/impl/SessionConfig$Builder;
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Implementation is missing option unpacker for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 386
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p0, v3}, Landroidx/camera/core/impl/UseCaseConfig;->getTargetName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public addAllCameraCaptureCallbacks(Ljava/util/Collection;)Landroidx/camera/core/impl/SessionConfig$Builder;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/impl/CameraCaptureCallback;",
            ">;)",
            "Landroidx/camera/core/impl/SessionConfig$Builder;"
        }
    .end annotation

    .line 541
    .local p1, "cameraCaptureCallbacks":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/impl/CameraCaptureCallback;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/CameraCaptureCallback;

    .line 542
    .local v1, "c":Landroidx/camera/core/impl/CameraCaptureCallback;
    iget-object v2, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mCaptureConfigBuilder:Landroidx/camera/core/impl/CaptureConfig$Builder;

    invoke-virtual {v2, v1}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addCameraCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;)V

    .line 543
    iget-object v2, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mSingleCameraCaptureCallbacks:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 544
    iget-object v2, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mSingleCameraCaptureCallbacks:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 546
    .end local v1    # "c":Landroidx/camera/core/impl/CameraCaptureCallback;
    :cond_0
    goto :goto_0

    .line 547
    :cond_1
    return-object p0
.end method

.method public addAllDeviceStateCallbacks(Ljava/util/Collection;)Landroidx/camera/core/impl/SessionConfig$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Landroid/hardware/camera2/CameraDevice$StateCallback;",
            ">;)",
            "Landroidx/camera/core/impl/SessionConfig$Builder;"
        }
    .end annotation

    .line 462
    .local p1, "deviceStateCallbacks":Ljava/util/Collection;, "Ljava/util/Collection<Landroid/hardware/camera2/CameraDevice$StateCallback;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/camera2/CameraDevice$StateCallback;

    .line 463
    .local v1, "callback":Landroid/hardware/camera2/CameraDevice$StateCallback;
    invoke-virtual {p0, v1}, Landroidx/camera/core/impl/SessionConfig$Builder;->addDeviceStateCallback(Landroid/hardware/camera2/CameraDevice$StateCallback;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 464
    .end local v1    # "callback":Landroid/hardware/camera2/CameraDevice$StateCallback;
    goto :goto_0

    .line 465
    :cond_0
    return-object p0
.end method

.method public addAllRepeatingCameraCaptureCallbacks(Ljava/util/Collection;)Landroidx/camera/core/impl/SessionConfig$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/impl/CameraCaptureCallback;",
            ">;)",
            "Landroidx/camera/core/impl/SessionConfig$Builder;"
        }
    .end annotation

    .line 512
    .local p1, "cameraCaptureCallbacks":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/impl/CameraCaptureCallback;>;"
    iget-object v0, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mCaptureConfigBuilder:Landroidx/camera/core/impl/CaptureConfig$Builder;

    invoke-virtual {v0, p1}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addAllCameraCaptureCallbacks(Ljava/util/Collection;)V

    .line 513
    return-object p0
.end method

.method public addAllSessionStateCallbacks(Ljava/util/List;)Landroidx/camera/core/impl/SessionConfig$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/hardware/camera2/CameraCaptureSession$StateCallback;",
            ">;)",
            "Landroidx/camera/core/impl/SessionConfig$Builder;"
        }
    .end annotation

    .line 488
    .local p1, "sessionStateCallbacks":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/CameraCaptureSession$StateCallback;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/camera2/CameraCaptureSession$StateCallback;

    .line 489
    .local v1, "callback":Landroid/hardware/camera2/CameraCaptureSession$StateCallback;
    invoke-virtual {p0, v1}, Landroidx/camera/core/impl/SessionConfig$Builder;->addSessionStateCallback(Landroid/hardware/camera2/CameraCaptureSession$StateCallback;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 490
    .end local v1    # "callback":Landroid/hardware/camera2/CameraCaptureSession$StateCallback;
    goto :goto_0

    .line 491
    :cond_0
    return-object p0
.end method

.method public addCameraCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;)Landroidx/camera/core/impl/SessionConfig$Builder;
    .locals 1
    .param p1, "cameraCaptureCallback"    # Landroidx/camera/core/impl/CameraCaptureCallback;

    .line 525
    iget-object v0, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mCaptureConfigBuilder:Landroidx/camera/core/impl/CaptureConfig$Builder;

    invoke-virtual {v0, p1}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addCameraCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;)V

    .line 526
    iget-object v0, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mSingleCameraCaptureCallbacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 527
    iget-object v0, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mSingleCameraCaptureCallbacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 529
    :cond_0
    return-object p0
.end method

.method public addDeviceStateCallback(Landroid/hardware/camera2/CameraDevice$StateCallback;)Landroidx/camera/core/impl/SessionConfig$Builder;
    .locals 1
    .param p1, "deviceStateCallback"    # Landroid/hardware/camera2/CameraDevice$StateCallback;

    .line 449
    iget-object v0, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mDeviceStateCallbacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 450
    return-object p0

    .line 452
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mDeviceStateCallbacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 453
    return-object p0
.end method

.method public addErrorListener(Landroidx/camera/core/impl/SessionConfig$ErrorListener;)Landroidx/camera/core/impl/SessionConfig$Builder;
    .locals 1
    .param p1, "errorListener"    # Landroidx/camera/core/impl/SessionConfig$ErrorListener;

    .line 578
    iget-object v0, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mErrorListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 579
    return-object p0
.end method

.method public addImplementationOptions(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/SessionConfig$Builder;
    .locals 1
    .param p1, "config"    # Landroidx/camera/core/impl/Config;

    .line 685
    iget-object v0, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mCaptureConfigBuilder:Landroidx/camera/core/impl/CaptureConfig$Builder;

    invoke-virtual {v0, p1}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addImplementationOptions(Landroidx/camera/core/impl/Config;)V

    .line 686
    return-object p0
.end method

.method public addNonRepeatingSurface(Landroidx/camera/core/impl/DeferrableSurface;)Landroidx/camera/core/impl/SessionConfig$Builder;
    .locals 1
    .param p1, "surface"    # Landroidx/camera/core/impl/DeferrableSurface;

    .line 632
    sget-object v0, Landroidx/camera/core/DynamicRange;->SDR:Landroidx/camera/core/DynamicRange;

    invoke-virtual {p0, p1, v0}, Landroidx/camera/core/impl/SessionConfig$Builder;->addNonRepeatingSurface(Landroidx/camera/core/impl/DeferrableSurface;Landroidx/camera/core/DynamicRange;)Landroidx/camera/core/impl/SessionConfig$Builder;

    move-result-object v0

    return-object v0
.end method

.method public addNonRepeatingSurface(Landroidx/camera/core/impl/DeferrableSurface;Landroidx/camera/core/DynamicRange;)Landroidx/camera/core/impl/SessionConfig$Builder;
    .locals 2
    .param p1, "surface"    # Landroidx/camera/core/impl/DeferrableSurface;
    .param p2, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 642
    invoke-static {p1}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->builder(Landroidx/camera/core/impl/DeferrableSurface;)Landroidx/camera/core/impl/SessionConfig$OutputConfig$Builder;

    move-result-object v0

    .line 643
    invoke-virtual {v0, p2}, Landroidx/camera/core/impl/SessionConfig$OutputConfig$Builder;->setDynamicRange(Landroidx/camera/core/DynamicRange;)Landroidx/camera/core/impl/SessionConfig$OutputConfig$Builder;

    move-result-object v0

    .line 644
    invoke-virtual {v0}, Landroidx/camera/core/impl/SessionConfig$OutputConfig$Builder;->build()Landroidx/camera/core/impl/SessionConfig$OutputConfig;

    move-result-object v0

    .line 645
    .local v0, "outputConfig":Landroidx/camera/core/impl/SessionConfig$OutputConfig;
    iget-object v1, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mOutputConfigs:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 646
    return-object p0
.end method

.method public addOutputConfig(Landroidx/camera/core/impl/SessionConfig$OutputConfig;)Landroidx/camera/core/impl/SessionConfig$Builder;
    .locals 3
    .param p1, "outputConfig"    # Landroidx/camera/core/impl/SessionConfig$OutputConfig;

    .line 615
    iget-object v0, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mOutputConfigs:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 616
    iget-object v0, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mCaptureConfigBuilder:Landroidx/camera/core/impl/CaptureConfig$Builder;

    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addSurface(Landroidx/camera/core/impl/DeferrableSurface;)V

    .line 617
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getSharedSurfaces()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/DeferrableSurface;

    .line 618
    .local v1, "sharedSurface":Landroidx/camera/core/impl/DeferrableSurface;
    iget-object v2, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mCaptureConfigBuilder:Landroidx/camera/core/impl/CaptureConfig$Builder;

    invoke-virtual {v2, v1}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addSurface(Landroidx/camera/core/impl/DeferrableSurface;)V

    .line 619
    .end local v1    # "sharedSurface":Landroidx/camera/core/impl/DeferrableSurface;
    goto :goto_0

    .line 620
    :cond_0
    return-object p0
.end method

.method public addRepeatingCameraCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;)Landroidx/camera/core/impl/SessionConfig$Builder;
    .locals 1
    .param p1, "cameraCaptureCallback"    # Landroidx/camera/core/impl/CameraCaptureCallback;

    .line 501
    iget-object v0, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mCaptureConfigBuilder:Landroidx/camera/core/impl/CaptureConfig$Builder;

    invoke-virtual {v0, p1}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addCameraCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;)V

    .line 502
    return-object p0
.end method

.method public addSessionStateCallback(Landroid/hardware/camera2/CameraCaptureSession$StateCallback;)Landroidx/camera/core/impl/SessionConfig$Builder;
    .locals 1
    .param p1, "sessionStateCallback"    # Landroid/hardware/camera2/CameraCaptureSession$StateCallback;

    .line 475
    iget-object v0, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mSessionStateCallbacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 476
    return-object p0

    .line 478
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mSessionStateCallbacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 479
    return-object p0
.end method

.method public addSurface(Landroidx/camera/core/impl/DeferrableSurface;)Landroidx/camera/core/impl/SessionConfig$Builder;
    .locals 1
    .param p1, "surface"    # Landroidx/camera/core/impl/DeferrableSurface;

    .line 591
    sget-object v0, Landroidx/camera/core/DynamicRange;->SDR:Landroidx/camera/core/DynamicRange;

    invoke-virtual {p0, p1, v0}, Landroidx/camera/core/impl/SessionConfig$Builder;->addSurface(Landroidx/camera/core/impl/DeferrableSurface;Landroidx/camera/core/DynamicRange;)Landroidx/camera/core/impl/SessionConfig$Builder;

    move-result-object v0

    return-object v0
.end method

.method public addSurface(Landroidx/camera/core/impl/DeferrableSurface;Landroidx/camera/core/DynamicRange;)Landroidx/camera/core/impl/SessionConfig$Builder;
    .locals 2
    .param p1, "surface"    # Landroidx/camera/core/impl/DeferrableSurface;
    .param p2, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 601
    invoke-static {p1}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->builder(Landroidx/camera/core/impl/DeferrableSurface;)Landroidx/camera/core/impl/SessionConfig$OutputConfig$Builder;

    move-result-object v0

    .line 602
    invoke-virtual {v0, p2}, Landroidx/camera/core/impl/SessionConfig$OutputConfig$Builder;->setDynamicRange(Landroidx/camera/core/DynamicRange;)Landroidx/camera/core/impl/SessionConfig$OutputConfig$Builder;

    move-result-object v0

    .line 603
    invoke-virtual {v0}, Landroidx/camera/core/impl/SessionConfig$OutputConfig$Builder;->build()Landroidx/camera/core/impl/SessionConfig$OutputConfig;

    move-result-object v0

    .line 604
    .local v0, "outputConfig":Landroidx/camera/core/impl/SessionConfig$OutputConfig;
    iget-object v1, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mOutputConfigs:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 605
    iget-object v1, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mCaptureConfigBuilder:Landroidx/camera/core/impl/CaptureConfig$Builder;

    invoke-virtual {v1, p1}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addSurface(Landroidx/camera/core/impl/DeferrableSurface;)V

    .line 606
    return-object p0
.end method

.method public addTag(Ljava/lang/String;Ljava/lang/Object;)Landroidx/camera/core/impl/SessionConfig$Builder;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "tag"    # Ljava/lang/Object;

    .line 438
    iget-object v0, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mCaptureConfigBuilder:Landroidx/camera/core/impl/CaptureConfig$Builder;

    invoke-virtual {v0, p1, p2}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addTag(Ljava/lang/String;Ljava/lang/Object;)V

    .line 439
    return-object p0
.end method

.method public build()Landroidx/camera/core/impl/SessionConfig;
    .locals 8

    .line 695
    new-instance v0, Landroidx/camera/core/impl/SessionConfig;

    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mOutputConfigs:Ljava/util/Set;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mDeviceStateCallbacks:Ljava/util/List;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v3, Ljava/util/ArrayList;

    iget-object v4, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mSessionStateCallbacks:Ljava/util/List;

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v4, Ljava/util/ArrayList;

    iget-object v5, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mSingleCameraCaptureCallbacks:Ljava/util/List;

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v5, Ljava/util/ArrayList;

    iget-object v6, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mErrorListeners:Ljava/util/List;

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iget-object v6, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mCaptureConfigBuilder:Landroidx/camera/core/impl/CaptureConfig$Builder;

    .line 701
    invoke-virtual {v6}, Landroidx/camera/core/impl/CaptureConfig$Builder;->build()Landroidx/camera/core/impl/CaptureConfig;

    move-result-object v6

    iget-object v7, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mInputConfiguration:Landroid/hardware/camera2/params/InputConfiguration;

    invoke-direct/range {v0 .. v7}, Landroidx/camera/core/impl/SessionConfig;-><init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Landroidx/camera/core/impl/CaptureConfig;Landroid/hardware/camera2/params/InputConfiguration;)V

    .line 695
    return-object v0
.end method

.method public clearSurfaces()Landroidx/camera/core/impl/SessionConfig$Builder;
    .locals 1

    .line 670
    iget-object v0, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mOutputConfigs:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 671
    iget-object v0, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mCaptureConfigBuilder:Landroidx/camera/core/impl/CaptureConfig$Builder;

    invoke-virtual {v0}, Landroidx/camera/core/impl/CaptureConfig$Builder;->clearSurfaces()V

    .line 672
    return-object p0
.end method

.method public getSingleCameraCaptureCallbacks()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/CameraCaptureCallback;",
            ">;"
        }
    .end annotation

    .line 570
    iget-object v0, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mSingleCameraCaptureCallbacks:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public removeCameraCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;)Z
    .locals 3
    .param p1, "cameraCaptureCallback"    # Landroidx/camera/core/impl/CameraCaptureCallback;

    .line 560
    iget-object v0, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mCaptureConfigBuilder:Landroidx/camera/core/impl/CaptureConfig$Builder;

    .line 561
    invoke-virtual {v0, p1}, Landroidx/camera/core/impl/CaptureConfig$Builder;->removeCameraCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;)Z

    move-result v0

    .line 562
    .local v0, "removedFromRepeating":Z
    iget-object v1, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mSingleCameraCaptureCallbacks:Ljava/util/List;

    .line 563
    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v1

    .line 564
    .local v1, "removedFromSingle":Z
    if-nez v0, :cond_1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v2, 0x1

    :goto_1
    return v2
.end method

.method public removeSurface(Landroidx/camera/core/impl/DeferrableSurface;)Landroidx/camera/core/impl/SessionConfig$Builder;
    .locals 4
    .param p1, "surface"    # Landroidx/camera/core/impl/DeferrableSurface;

    .line 652
    const/4 v0, 0x0

    .line 653
    .local v0, "outputConfigToRemove":Landroidx/camera/core/impl/SessionConfig$OutputConfig;
    iget-object v1, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mOutputConfigs:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/SessionConfig$OutputConfig;

    .line 654
    .local v2, "config":Landroidx/camera/core/impl/SessionConfig$OutputConfig;
    invoke-virtual {v2}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 655
    move-object v0, v2

    .line 656
    goto :goto_1

    .line 658
    .end local v2    # "config":Landroidx/camera/core/impl/SessionConfig$OutputConfig;
    :cond_0
    goto :goto_0

    .line 660
    :cond_1
    :goto_1
    if-eqz v0, :cond_2

    .line 661
    iget-object v1, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mOutputConfigs:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 663
    :cond_2
    iget-object v1, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mCaptureConfigBuilder:Landroidx/camera/core/impl/CaptureConfig$Builder;

    invoke-virtual {v1, p1}, Landroidx/camera/core/impl/CaptureConfig$Builder;->removeSurface(Landroidx/camera/core/impl/DeferrableSurface;)V

    .line 664
    return-object p0
.end method

.method public setExpectedFrameRateRange(Landroid/util/Range;)Landroidx/camera/core/impl/SessionConfig$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)",
            "Landroidx/camera/core/impl/SessionConfig$Builder;"
        }
    .end annotation

    .line 429
    .local p1, "expectedFrameRateRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    iget-object v0, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mCaptureConfigBuilder:Landroidx/camera/core/impl/CaptureConfig$Builder;

    invoke-virtual {v0, p1}, Landroidx/camera/core/impl/CaptureConfig$Builder;->setExpectedFrameRateRange(Landroid/util/Range;)V

    .line 430
    return-object p0
.end method

.method public setImplementationOptions(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/SessionConfig$Builder;
    .locals 1
    .param p1, "config"    # Landroidx/camera/core/impl/Config;

    .line 678
    iget-object v0, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mCaptureConfigBuilder:Landroidx/camera/core/impl/CaptureConfig$Builder;

    invoke-virtual {v0, p1}, Landroidx/camera/core/impl/CaptureConfig$Builder;->setImplementationOptions(Landroidx/camera/core/impl/Config;)V

    .line 679
    return-object p0
.end method

.method public setInputConfiguration(Landroid/hardware/camera2/params/InputConfiguration;)Landroidx/camera/core/impl/SessionConfig$Builder;
    .locals 0
    .param p1, "inputConfiguration"    # Landroid/hardware/camera2/params/InputConfiguration;

    .line 403
    iput-object p1, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mInputConfiguration:Landroid/hardware/camera2/params/InputConfiguration;

    .line 404
    return-object p0
.end method

.method public setTemplateType(I)Landroidx/camera/core/impl/SessionConfig$Builder;
    .locals 1
    .param p1, "templateType"    # I

    .line 417
    iget-object v0, p0, Landroidx/camera/core/impl/SessionConfig$Builder;->mCaptureConfigBuilder:Landroidx/camera/core/impl/CaptureConfig$Builder;

    invoke-virtual {v0, p1}, Landroidx/camera/core/impl/CaptureConfig$Builder;->setTemplateType(I)V

    .line 418
    return-object p0
.end method
