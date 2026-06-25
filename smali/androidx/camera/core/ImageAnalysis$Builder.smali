.class public final Landroidx/camera/core/ImageAnalysis$Builder;
.super Ljava/lang/Object;
.source "ImageAnalysis.java"

# interfaces
.implements Landroidx/camera/core/impl/ImageOutputConfig$Builder;
.implements Landroidx/camera/core/internal/ThreadConfig$Builder;
.implements Landroidx/camera/core/impl/UseCaseConfig$Builder;
.implements Landroidx/camera/core/impl/ImageInputConfig$Builder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/core/ImageAnalysis;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/camera/core/impl/ImageOutputConfig$Builder<",
        "Landroidx/camera/core/ImageAnalysis$Builder;",
        ">;",
        "Landroidx/camera/core/internal/ThreadConfig$Builder<",
        "Landroidx/camera/core/ImageAnalysis$Builder;",
        ">;",
        "Landroidx/camera/core/impl/UseCaseConfig$Builder<",
        "Landroidx/camera/core/ImageAnalysis;",
        "Landroidx/camera/core/impl/ImageAnalysisConfig;",
        "Landroidx/camera/core/ImageAnalysis$Builder;",
        ">;",
        "Landroidx/camera/core/impl/ImageInputConfig$Builder<",
        "Landroidx/camera/core/ImageAnalysis$Builder;",
        ">;"
    }
.end annotation


# instance fields
.field private final mMutableConfig:Landroidx/camera/core/impl/MutableOptionsBundle;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1039
    invoke-static {}, Landroidx/camera/core/impl/MutableOptionsBundle;->create()Landroidx/camera/core/impl/MutableOptionsBundle;

    move-result-object v0

    invoke-direct {p0, v0}, Landroidx/camera/core/ImageAnalysis$Builder;-><init>(Landroidx/camera/core/impl/MutableOptionsBundle;)V

    .line 1040
    return-void
.end method

.method private constructor <init>(Landroidx/camera/core/impl/MutableOptionsBundle;)V
    .locals 4
    .param p1, "mutableConfig"    # Landroidx/camera/core/impl/MutableOptionsBundle;

    .line 1042
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1043
    iput-object p1, p0, Landroidx/camera/core/ImageAnalysis$Builder;->mMutableConfig:Landroidx/camera/core/impl/MutableOptionsBundle;

    .line 1045
    sget-object v0, Landroidx/camera/core/internal/TargetConfig;->OPTION_TARGET_CLASS:Landroidx/camera/core/impl/Config$Option;

    .line 1046
    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroidx/camera/core/impl/MutableOptionsBundle;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    .line 1047
    .local v0, "oldConfigClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v0, :cond_1

    const-class v1, Landroidx/camera/core/ImageAnalysis;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 1048
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid target class configuration for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1055
    :cond_1
    :goto_0
    const-class v1, Landroidx/camera/core/ImageAnalysis;

    invoke-virtual {p0, v1}, Landroidx/camera/core/ImageAnalysis$Builder;->setTargetClass(Ljava/lang/Class;)Landroidx/camera/core/ImageAnalysis$Builder;

    .line 1056
    return-void
.end method

.method static fromConfig(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/ImageAnalysis$Builder;
    .locals 2
    .param p0, "configuration"    # Landroidx/camera/core/impl/Config;

    .line 1067
    new-instance v0, Landroidx/camera/core/ImageAnalysis$Builder;

    invoke-static {p0}, Landroidx/camera/core/impl/MutableOptionsBundle;->from(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/MutableOptionsBundle;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/camera/core/ImageAnalysis$Builder;-><init>(Landroidx/camera/core/impl/MutableOptionsBundle;)V

    return-object v0
.end method

.method public static fromConfig(Landroidx/camera/core/impl/ImageAnalysisConfig;)Landroidx/camera/core/ImageAnalysis$Builder;
    .locals 2
    .param p0, "configuration"    # Landroidx/camera/core/impl/ImageAnalysisConfig;

    .line 1079
    new-instance v0, Landroidx/camera/core/ImageAnalysis$Builder;

    invoke-static {p0}, Landroidx/camera/core/impl/MutableOptionsBundle;->from(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/MutableOptionsBundle;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/camera/core/ImageAnalysis$Builder;-><init>(Landroidx/camera/core/impl/MutableOptionsBundle;)V

    return-object v0
.end method


# virtual methods
.method public build()Landroidx/camera/core/ImageAnalysis;
    .locals 2

    .line 1226
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis$Builder;->getUseCaseConfig()Landroidx/camera/core/impl/ImageAnalysisConfig;

    move-result-object v0

    .line 1227
    .local v0, "imageAnalysisConfig":Landroidx/camera/core/impl/ImageAnalysisConfig;
    invoke-static {v0}, Landroidx/camera/core/impl/ImageOutputConfig;->validateConfig(Landroidx/camera/core/impl/ImageOutputConfig;)V

    .line 1228
    new-instance v1, Landroidx/camera/core/ImageAnalysis;

    invoke-direct {v1, v0}, Landroidx/camera/core/ImageAnalysis;-><init>(Landroidx/camera/core/impl/ImageAnalysisConfig;)V

    return-object v1
.end method

.method public bridge synthetic build()Ljava/lang/Object;
    .locals 1

    .line 1028
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis$Builder;->build()Landroidx/camera/core/ImageAnalysis;

    move-result-object v0

    return-object v0
.end method

.method public getMutableConfig()Landroidx/camera/core/impl/MutableConfig;
    .locals 1

    .line 1202
    iget-object v0, p0, Landroidx/camera/core/ImageAnalysis$Builder;->mMutableConfig:Landroidx/camera/core/impl/MutableOptionsBundle;

    return-object v0
.end method

.method public getUseCaseConfig()Landroidx/camera/core/impl/ImageAnalysisConfig;
    .locals 2

    .line 1213
    new-instance v0, Landroidx/camera/core/impl/ImageAnalysisConfig;

    iget-object v1, p0, Landroidx/camera/core/ImageAnalysis$Builder;->mMutableConfig:Landroidx/camera/core/impl/MutableOptionsBundle;

    invoke-static {v1}, Landroidx/camera/core/impl/OptionsBundle;->from(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/OptionsBundle;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/camera/core/impl/ImageAnalysisConfig;-><init>(Landroidx/camera/core/impl/OptionsBundle;)V

    return-object v0
.end method

.method public bridge synthetic getUseCaseConfig()Landroidx/camera/core/impl/UseCaseConfig;
    .locals 1

    .line 1028
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis$Builder;->getUseCaseConfig()Landroidx/camera/core/impl/ImageAnalysisConfig;

    move-result-object v0

    return-object v0
.end method

.method public setBackgroundExecutor(Ljava/util/concurrent/Executor;)Landroidx/camera/core/ImageAnalysis$Builder;
    .locals 2
    .param p1, "executor"    # Ljava/util/concurrent/Executor;

    .line 1505
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/internal/ThreadConfig;->OPTION_BACKGROUND_EXECUTOR:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v0, v1, p1}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 1506
    return-object p0
.end method

.method public bridge synthetic setBackgroundExecutor(Ljava/util/concurrent/Executor;)Ljava/lang/Object;
    .locals 0

    .line 1028
    invoke-virtual {p0, p1}, Landroidx/camera/core/ImageAnalysis$Builder;->setBackgroundExecutor(Ljava/util/concurrent/Executor;)Landroidx/camera/core/ImageAnalysis$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setBackpressureStrategy(I)Landroidx/camera/core/ImageAnalysis$Builder;
    .locals 3
    .param p1, "strategy"    # I

    .line 1097
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/impl/ImageAnalysisConfig;->OPTION_BACKPRESSURE_STRATEGY:Landroidx/camera/core/impl/Config$Option;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 1098
    return-object p0
.end method

.method public setCameraSelector(Landroidx/camera/core/CameraSelector;)Landroidx/camera/core/ImageAnalysis$Builder;
    .locals 2
    .param p1, "cameraSelector"    # Landroidx/camera/core/CameraSelector;

    .line 1557
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_CAMERA_SELECTOR:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v0, v1, p1}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 1558
    return-object p0
.end method

.method public bridge synthetic setCameraSelector(Landroidx/camera/core/CameraSelector;)Ljava/lang/Object;
    .locals 0

    .line 1028
    invoke-virtual {p0, p1}, Landroidx/camera/core/ImageAnalysis$Builder;->setCameraSelector(Landroidx/camera/core/CameraSelector;)Landroidx/camera/core/ImageAnalysis$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setCaptureOptionUnpacker(Landroidx/camera/core/impl/CaptureConfig$OptionUnpacker;)Landroidx/camera/core/ImageAnalysis$Builder;
    .locals 2
    .param p1, "optionUnpacker"    # Landroidx/camera/core/impl/CaptureConfig$OptionUnpacker;

    .line 1541
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_CAPTURE_CONFIG_UNPACKER:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v0, v1, p1}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 1542
    return-object p0
.end method

.method public bridge synthetic setCaptureOptionUnpacker(Landroidx/camera/core/impl/CaptureConfig$OptionUnpacker;)Ljava/lang/Object;
    .locals 0

    .line 1028
    invoke-virtual {p0, p1}, Landroidx/camera/core/ImageAnalysis$Builder;->setCaptureOptionUnpacker(Landroidx/camera/core/impl/CaptureConfig$OptionUnpacker;)Landroidx/camera/core/ImageAnalysis$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setCaptureType(Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;)Landroidx/camera/core/ImageAnalysis$Builder;
    .locals 2
    .param p1, "captureType"    # Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    .line 1599
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_CAPTURE_TYPE:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v0, v1, p1}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 1600
    return-object p0
.end method

.method public bridge synthetic setCaptureType(Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;)Ljava/lang/Object;
    .locals 0

    .line 1028
    invoke-virtual {p0, p1}, Landroidx/camera/core/ImageAnalysis$Builder;->setCaptureType(Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;)Landroidx/camera/core/ImageAnalysis$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setCustomOrderedResolutions(Ljava/util/List;)Landroidx/camera/core/ImageAnalysis$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;)",
            "Landroidx/camera/core/ImageAnalysis$Builder;"
        }
    .end annotation

    .line 1437
    .local p1, "resolutions":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_CUSTOM_ORDERED_RESOLUTIONS:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v0, v1, p1}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 1438
    return-object p0
.end method

.method public bridge synthetic setCustomOrderedResolutions(Ljava/util/List;)Ljava/lang/Object;
    .locals 0

    .line 1028
    invoke-virtual {p0, p1}, Landroidx/camera/core/ImageAnalysis$Builder;->setCustomOrderedResolutions(Ljava/util/List;)Landroidx/camera/core/ImageAnalysis$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setDefaultCaptureConfig(Landroidx/camera/core/impl/CaptureConfig;)Landroidx/camera/core/ImageAnalysis$Builder;
    .locals 2
    .param p1, "captureConfig"    # Landroidx/camera/core/impl/CaptureConfig;

    .line 1523
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_DEFAULT_CAPTURE_CONFIG:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v0, v1, p1}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 1524
    return-object p0
.end method

.method public bridge synthetic setDefaultCaptureConfig(Landroidx/camera/core/impl/CaptureConfig;)Ljava/lang/Object;
    .locals 0

    .line 1028
    invoke-virtual {p0, p1}, Landroidx/camera/core/ImageAnalysis$Builder;->setDefaultCaptureConfig(Landroidx/camera/core/impl/CaptureConfig;)Landroidx/camera/core/ImageAnalysis$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setDefaultResolution(Landroid/util/Size;)Landroidx/camera/core/ImageAnalysis$Builder;
    .locals 2
    .param p1, "resolution"    # Landroid/util/Size;

    .line 1412
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_DEFAULT_RESOLUTION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v0, v1, p1}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 1414
    return-object p0
.end method

.method public bridge synthetic setDefaultResolution(Landroid/util/Size;)Ljava/lang/Object;
    .locals 0

    .line 1028
    invoke-virtual {p0, p1}, Landroidx/camera/core/ImageAnalysis$Builder;->setDefaultResolution(Landroid/util/Size;)Landroidx/camera/core/ImageAnalysis$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setDefaultSessionConfig(Landroidx/camera/core/impl/SessionConfig;)Landroidx/camera/core/ImageAnalysis$Builder;
    .locals 2
    .param p1, "sessionConfig"    # Landroidx/camera/core/impl/SessionConfig;

    .line 1515
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_DEFAULT_SESSION_CONFIG:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v0, v1, p1}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 1516
    return-object p0
.end method

.method public bridge synthetic setDefaultSessionConfig(Landroidx/camera/core/impl/SessionConfig;)Ljava/lang/Object;
    .locals 0

    .line 1028
    invoke-virtual {p0, p1}, Landroidx/camera/core/ImageAnalysis$Builder;->setDefaultSessionConfig(Landroidx/camera/core/impl/SessionConfig;)Landroidx/camera/core/ImageAnalysis$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setDynamicRange(Landroidx/camera/core/DynamicRange;)Landroidx/camera/core/ImageAnalysis$Builder;
    .locals 2
    .param p1, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 1619
    sget-object v0, Landroidx/camera/core/DynamicRange;->SDR:Landroidx/camera/core/DynamicRange;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1623
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/impl/ImageInputConfig;->OPTION_INPUT_DYNAMIC_RANGE:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v0, v1, p1}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 1624
    return-object p0

    .line 1620
    :cond_0
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "ImageAnalysis currently only supports SDR"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic setDynamicRange(Landroidx/camera/core/DynamicRange;)Ljava/lang/Object;
    .locals 0

    .line 1028
    invoke-virtual {p0, p1}, Landroidx/camera/core/ImageAnalysis$Builder;->setDynamicRange(Landroidx/camera/core/DynamicRange;)Landroidx/camera/core/ImageAnalysis$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setHighResolutionDisabled(Z)Landroidx/camera/core/ImageAnalysis$Builder;
    .locals 3
    .param p1, "disabled"    # Z

    .line 1591
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_HIGH_RESOLUTION_DISABLED:Landroidx/camera/core/impl/Config$Option;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 1592
    return-object p0
.end method

.method public bridge synthetic setHighResolutionDisabled(Z)Ljava/lang/Object;
    .locals 0

    .line 1028
    invoke-virtual {p0, p1}, Landroidx/camera/core/ImageAnalysis$Builder;->setHighResolutionDisabled(Z)Landroidx/camera/core/ImageAnalysis$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setImageQueueDepth(I)Landroidx/camera/core/ImageAnalysis$Builder;
    .locals 3
    .param p1, "depth"    # I

    .line 1128
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/impl/ImageAnalysisConfig;->OPTION_IMAGE_QUEUE_DEPTH:Landroidx/camera/core/impl/Config$Option;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 1129
    return-object p0
.end method

.method public setImageReaderProxyProvider(Landroidx/camera/core/ImageReaderProxyProvider;)Landroidx/camera/core/ImageAnalysis$Builder;
    .locals 2
    .param p1, "imageReaderProxyProvider"    # Landroidx/camera/core/ImageReaderProxyProvider;

    .line 1574
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/impl/ImageAnalysisConfig;->OPTION_IMAGE_READER_PROXY_PROVIDER:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v0, v1, p1}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 1576
    return-object p0
.end method

.method public setMaxResolution(Landroid/util/Size;)Landroidx/camera/core/ImageAnalysis$Builder;
    .locals 2
    .param p1, "resolution"    # Landroid/util/Size;

    .line 1421
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_MAX_RESOLUTION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v0, v1, p1}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 1422
    return-object p0
.end method

.method public bridge synthetic setMaxResolution(Landroid/util/Size;)Ljava/lang/Object;
    .locals 0

    .line 1028
    invoke-virtual {p0, p1}, Landroidx/camera/core/ImageAnalysis$Builder;->setMaxResolution(Landroid/util/Size;)Landroidx/camera/core/ImageAnalysis$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setMirrorMode(I)Landroidx/camera/core/ImageAnalysis$Builder;
    .locals 2
    .param p1, "mirrorMode"    # I

    .line 1340
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "setMirrorMode is not supported."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic setMirrorMode(I)Ljava/lang/Object;
    .locals 0

    .line 1028
    invoke-virtual {p0, p1}, Landroidx/camera/core/ImageAnalysis$Builder;->setMirrorMode(I)Landroidx/camera/core/ImageAnalysis$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setOnePixelShiftEnabled(Z)Landroidx/camera/core/ImageAnalysis$Builder;
    .locals 3
    .param p1, "onePixelShiftEnabled"    # Z

    .line 1189
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/impl/ImageAnalysisConfig;->OPTION_ONE_PIXEL_SHIFT_ENABLED:Landroidx/camera/core/impl/Config$Option;

    .line 1190
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    .line 1189
    invoke-interface {v0, v1, v2}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 1191
    return-object p0
.end method

.method public setOutputImageFormat(I)Landroidx/camera/core/ImageAnalysis$Builder;
    .locals 3
    .param p1, "outputImageFormat"    # I

    .line 1149
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/impl/ImageAnalysisConfig;->OPTION_OUTPUT_IMAGE_FORMAT:Landroidx/camera/core/impl/Config$Option;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 1150
    return-object p0
.end method

.method public setOutputImageRotationEnabled(Z)Landroidx/camera/core/ImageAnalysis$Builder;
    .locals 3
    .param p1, "outputImageRotationEnabled"    # Z

    .line 1181
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/impl/ImageAnalysisConfig;->OPTION_OUTPUT_IMAGE_ROTATION_ENABLED:Landroidx/camera/core/impl/Config$Option;

    .line 1182
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    .line 1181
    invoke-interface {v0, v1, v2}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 1183
    return-object p0
.end method

.method public setResolutionSelector(Landroidx/camera/core/resolutionselector/ResolutionSelector;)Landroidx/camera/core/ImageAnalysis$Builder;
    .locals 2
    .param p1, "resolutionSelector"    # Landroidx/camera/core/resolutionselector/ResolutionSelector;

    .line 1487
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_RESOLUTION_SELECTOR:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v0, v1, p1}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 1488
    return-object p0
.end method

.method public bridge synthetic setResolutionSelector(Landroidx/camera/core/resolutionselector/ResolutionSelector;)Ljava/lang/Object;
    .locals 0

    .line 1028
    invoke-virtual {p0, p1}, Landroidx/camera/core/ImageAnalysis$Builder;->setResolutionSelector(Landroidx/camera/core/resolutionselector/ResolutionSelector;)Landroidx/camera/core/ImageAnalysis$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setSessionOptionUnpacker(Landroidx/camera/core/impl/SessionConfig$OptionUnpacker;)Landroidx/camera/core/ImageAnalysis$Builder;
    .locals 2
    .param p1, "optionUnpacker"    # Landroidx/camera/core/impl/SessionConfig$OptionUnpacker;

    .line 1532
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_SESSION_CONFIG_UNPACKER:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v0, v1, p1}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 1533
    return-object p0
.end method

.method public bridge synthetic setSessionOptionUnpacker(Landroidx/camera/core/impl/SessionConfig$OptionUnpacker;)Ljava/lang/Object;
    .locals 0

    .line 1028
    invoke-virtual {p0, p1}, Landroidx/camera/core/ImageAnalysis$Builder;->setSessionOptionUnpacker(Landroidx/camera/core/impl/SessionConfig$OptionUnpacker;)Landroidx/camera/core/ImageAnalysis$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setSupportedResolutions(Ljava/util/List;)Landroidx/camera/core/ImageAnalysis$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "[",
            "Landroid/util/Size;",
            ">;>;)",
            "Landroidx/camera/core/ImageAnalysis$Builder;"
        }
    .end annotation

    .line 1429
    .local p1, "resolutions":Ljava/util/List;, "Ljava/util/List<Landroid/util/Pair<Ljava/lang/Integer;[Landroid/util/Size;>;>;"
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_SUPPORTED_RESOLUTIONS:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v0, v1, p1}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 1430
    return-object p0
.end method

.method public bridge synthetic setSupportedResolutions(Ljava/util/List;)Ljava/lang/Object;
    .locals 0

    .line 1028
    invoke-virtual {p0, p1}, Landroidx/camera/core/ImageAnalysis$Builder;->setSupportedResolutions(Ljava/util/List;)Landroidx/camera/core/ImageAnalysis$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setSurfaceOccupancyPriority(I)Landroidx/camera/core/ImageAnalysis$Builder;
    .locals 3
    .param p1, "priority"    # I

    .line 1549
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_SURFACE_OCCUPANCY_PRIORITY:Landroidx/camera/core/impl/Config$Option;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 1550
    return-object p0
.end method

.method public bridge synthetic setSurfaceOccupancyPriority(I)Ljava/lang/Object;
    .locals 0

    .line 1028
    invoke-virtual {p0, p1}, Landroidx/camera/core/ImageAnalysis$Builder;->setSurfaceOccupancyPriority(I)Landroidx/camera/core/ImageAnalysis$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setTargetAspectRatio(I)Landroidx/camera/core/ImageAnalysis$Builder;
    .locals 3
    .param p1, "aspectRatio"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1293
    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    .line 1294
    const/4 p1, 0x0

    .line 1296
    :cond_0
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_TARGET_ASPECT_RATIO:Landroidx/camera/core/impl/Config$Option;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 1297
    return-object p0
.end method

.method public bridge synthetic setTargetAspectRatio(I)Ljava/lang/Object;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1028
    invoke-virtual {p0, p1}, Landroidx/camera/core/ImageAnalysis$Builder;->setTargetAspectRatio(I)Landroidx/camera/core/ImageAnalysis$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setTargetClass(Ljava/lang/Class;)Landroidx/camera/core/ImageAnalysis$Builder;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "Landroidx/camera/core/ImageAnalysis;",
            ">;)",
            "Landroidx/camera/core/ImageAnalysis$Builder;"
        }
    .end annotation

    .line 1237
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<Landroidx/camera/core/ImageAnalysis;>;"
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_TARGET_CLASS:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v0, v1, p1}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 1240
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_TARGET_NAME:Landroidx/camera/core/impl/Config$Option;

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroidx/camera/core/impl/MutableConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    .line 1241
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1242
    .local v0, "targetName":Ljava/lang/String;
    invoke-virtual {p0, v0}, Landroidx/camera/core/ImageAnalysis$Builder;->setTargetName(Ljava/lang/String;)Landroidx/camera/core/ImageAnalysis$Builder;

    .line 1245
    .end local v0    # "targetName":Ljava/lang/String;
    :cond_0
    return-object p0
.end method

.method public bridge synthetic setTargetClass(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 0

    .line 1028
    invoke-virtual {p0, p1}, Landroidx/camera/core/ImageAnalysis$Builder;->setTargetClass(Ljava/lang/Class;)Landroidx/camera/core/ImageAnalysis$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setTargetName(Ljava/lang/String;)Landroidx/camera/core/ImageAnalysis$Builder;
    .locals 2
    .param p1, "targetName"    # Ljava/lang/String;

    .line 1264
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_TARGET_NAME:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v0, v1, p1}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 1265
    return-object p0
.end method

.method public bridge synthetic setTargetName(Ljava/lang/String;)Ljava/lang/Object;
    .locals 0

    .line 1028
    invoke-virtual {p0, p1}, Landroidx/camera/core/ImageAnalysis$Builder;->setTargetName(Ljava/lang/String;)Landroidx/camera/core/ImageAnalysis$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setTargetResolution(Landroid/util/Size;)Landroidx/camera/core/ImageAnalysis$Builder;
    .locals 2
    .param p1, "resolution"    # Landroid/util/Size;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1397
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_TARGET_RESOLUTION:Landroidx/camera/core/impl/Config$Option;

    .line 1398
    invoke-interface {v0, v1, p1}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 1399
    return-object p0
.end method

.method public bridge synthetic setTargetResolution(Landroid/util/Size;)Ljava/lang/Object;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1028
    invoke-virtual {p0, p1}, Landroidx/camera/core/ImageAnalysis$Builder;->setTargetResolution(Landroid/util/Size;)Landroidx/camera/core/ImageAnalysis$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setTargetRotation(I)Landroidx/camera/core/ImageAnalysis$Builder;
    .locals 3
    .param p1, "rotation"    # I

    .line 1328
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_TARGET_ROTATION:Landroidx/camera/core/impl/Config$Option;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 1329
    return-object p0
.end method

.method public bridge synthetic setTargetRotation(I)Ljava/lang/Object;
    .locals 0

    .line 1028
    invoke-virtual {p0, p1}, Landroidx/camera/core/ImageAnalysis$Builder;->setTargetRotation(I)Landroidx/camera/core/ImageAnalysis$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setUseCaseEventCallback(Landroidx/camera/core/UseCase$EventCallback;)Landroidx/camera/core/ImageAnalysis$Builder;
    .locals 2
    .param p1, "useCaseEventCallback"    # Landroidx/camera/core/UseCase$EventCallback;

    .line 1566
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_USE_CASE_EVENT_CALLBACK:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v0, v1, p1}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 1567
    return-object p0
.end method

.method public bridge synthetic setUseCaseEventCallback(Landroidx/camera/core/UseCase$EventCallback;)Ljava/lang/Object;
    .locals 0

    .line 1028
    invoke-virtual {p0, p1}, Landroidx/camera/core/ImageAnalysis$Builder;->setUseCaseEventCallback(Landroidx/camera/core/UseCase$EventCallback;)Landroidx/camera/core/ImageAnalysis$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setZslDisabled(Z)Landroidx/camera/core/ImageAnalysis$Builder;
    .locals 3
    .param p1, "disabled"    # Z

    .line 1583
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysis$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_ZSL_DISABLED:Landroidx/camera/core/impl/Config$Option;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 1584
    return-object p0
.end method

.method public bridge synthetic setZslDisabled(Z)Ljava/lang/Object;
    .locals 0

    .line 1028
    invoke-virtual {p0, p1}, Landroidx/camera/core/ImageAnalysis$Builder;->setZslDisabled(Z)Landroidx/camera/core/ImageAnalysis$Builder;

    move-result-object p1

    return-object p1
.end method
