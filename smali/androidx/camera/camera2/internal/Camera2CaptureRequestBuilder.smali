.class Landroidx/camera/camera2/internal/Camera2CaptureRequestBuilder;
.super Ljava/lang/Object;
.source "Camera2CaptureRequestBuilder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/camera2/internal/Camera2CaptureRequestBuilder$Api23Impl;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Camera2CaptureRequestBuilder"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    return-void
.end method

.method private static applyAeFpsRange(Landroidx/camera/core/impl/CaptureConfig;Landroid/hardware/camera2/CaptureRequest$Builder;)V
    .locals 3
    .param p0, "captureConfig"    # Landroidx/camera/core/impl/CaptureConfig;
    .param p1, "builder"    # Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 102
    nop

    .line 103
    invoke-virtual {p0}, Landroidx/camera/core/impl/CaptureConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v0

    .line 102
    invoke-static {v0}, Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;->from(Landroidx/camera/core/impl/Config;)Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;

    move-result-object v0

    .line 103
    invoke-virtual {v0}, Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;->build()Landroidx/camera/camera2/interop/CaptureRequestOptions;

    move-result-object v0

    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_TARGET_FPS_RANGE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 104
    invoke-static {v1}, Landroidx/camera/camera2/impl/Camera2ImplConfig;->createCaptureRequestOption(Landroid/hardware/camera2/CaptureRequest$Key;)Landroidx/camera/core/impl/Config$Option;

    move-result-object v1

    .line 103
    invoke-virtual {v0, v1}, Landroidx/camera/camera2/interop/CaptureRequestOptions;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v0

    .line 106
    .local v0, "containsTargetFpsRange":Z
    if-nez v0, :cond_0

    invoke-virtual {p0}, Landroidx/camera/core/impl/CaptureConfig;->getExpectedFrameRateRange()Landroid/util/Range;

    move-result-object v1

    sget-object v2, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    invoke-virtual {v1, v2}, Landroid/util/Range;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 108
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_TARGET_FPS_RANGE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 109
    invoke-virtual {p0}, Landroidx/camera/core/impl/CaptureConfig;->getExpectedFrameRateRange()Landroid/util/Range;

    move-result-object v2

    .line 108
    invoke-virtual {p1, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 112
    :cond_0
    return-void
.end method

.method private static applyImplementationOptionToCaptureBuilder(Landroid/hardware/camera2/CaptureRequest$Builder;Landroidx/camera/core/impl/Config;)V
    .locals 7
    .param p0, "builder"    # Landroid/hardware/camera2/CaptureRequest$Builder;
    .param p1, "config"    # Landroidx/camera/core/impl/Config;

    .line 83
    invoke-static {p1}, Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;->from(Landroidx/camera/core/impl/Config;)Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;->build()Landroidx/camera/camera2/interop/CaptureRequestOptions;

    move-result-object v0

    .line 84
    .local v0, "bundle":Landroidx/camera/camera2/interop/CaptureRequestOptions;
    invoke-virtual {v0}, Landroidx/camera/camera2/interop/CaptureRequestOptions;->listOptions()Ljava/util/Set;

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

    .line 86
    .local v2, "option":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<*>;"
    invoke-virtual {v2}, Landroidx/camera/core/impl/Config$Option;->getToken()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/hardware/camera2/CaptureRequest$Key;

    .line 92
    .local v3, "key":Landroid/hardware/camera2/CaptureRequest$Key;, "Landroid/hardware/camera2/CaptureRequest$Key<Ljava/lang/Object;>;"
    :try_start_0
    invoke-virtual {v0, v2}, Landroidx/camera/camera2/interop/CaptureRequestOptions;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 95
    goto :goto_1

    .line 93
    :catch_0
    move-exception v4

    .line 94
    .local v4, "e":Ljava/lang/IllegalArgumentException;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "CaptureRequest.Key is not supported: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "Camera2CaptureRequestBuilder"

    invoke-static {v6, v5}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    .end local v2    # "option":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<*>;"
    .end local v3    # "key":Landroid/hardware/camera2/CaptureRequest$Key;, "Landroid/hardware/camera2/CaptureRequest$Key<Ljava/lang/Object;>;"
    .end local v4    # "e":Ljava/lang/IllegalArgumentException;
    :goto_1
    goto :goto_0

    .line 97
    :cond_0
    return-void
.end method

.method public static build(Landroidx/camera/core/impl/CaptureConfig;Landroid/hardware/camera2/CameraDevice;Ljava/util/Map;)Landroid/hardware/camera2/CaptureRequest;
    .locals 6
    .param p0, "captureConfig"    # Landroidx/camera/core/impl/CaptureConfig;
    .param p1, "device"    # Landroid/hardware/camera2/CameraDevice;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/CaptureConfig;",
            "Landroid/hardware/camera2/CameraDevice;",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/DeferrableSurface;",
            "Landroid/view/Surface;",
            ">;)",
            "Landroid/hardware/camera2/CaptureRequest;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;
        }
    .end annotation

    .line 129
    .local p2, "configuredSurfaceMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/DeferrableSurface;Landroid/view/Surface;>;"
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 130
    return-object v0

    .line 133
    :cond_0
    invoke-virtual {p0}, Landroidx/camera/core/impl/CaptureConfig;->getSurfaces()Ljava/util/List;

    move-result-object v1

    invoke-static {v1, p2}, Landroidx/camera/camera2/internal/Camera2CaptureRequestBuilder;->getConfiguredSurfaces(Ljava/util/List;Ljava/util/Map;)Ljava/util/List;

    move-result-object v1

    .line 135
    .local v1, "surfaceList":Ljava/util/List;, "Ljava/util/List<Landroid/view/Surface;>;"
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 136
    return-object v0

    .line 140
    :cond_1
    invoke-virtual {p0}, Landroidx/camera/core/impl/CaptureConfig;->getCameraCaptureResult()Landroidx/camera/core/impl/CameraCaptureResult;

    move-result-object v0

    .line 141
    .local v0, "cameraCaptureResult":Landroidx/camera/core/impl/CameraCaptureResult;
    nop

    .line 142
    invoke-virtual {p0}, Landroidx/camera/core/impl/CaptureConfig;->getTemplateType()I

    move-result v2

    const/4 v3, 0x5

    const-string v4, "Camera2CaptureRequestBuilder"

    if-ne v2, v3, :cond_2

    if-eqz v0, :cond_2

    .line 144
    invoke-interface {v0}, Landroidx/camera/core/impl/CameraCaptureResult;->getCaptureResult()Landroid/hardware/camera2/CaptureResult;

    move-result-object v2

    instance-of v2, v2, Landroid/hardware/camera2/TotalCaptureResult;

    if-eqz v2, :cond_2

    .line 145
    const-string/jumbo v2, "createReprocessCaptureRequest"

    invoke-static {v4, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    nop

    .line 147
    invoke-interface {v0}, Landroidx/camera/core/impl/CameraCaptureResult;->getCaptureResult()Landroid/hardware/camera2/CaptureResult;

    move-result-object v2

    check-cast v2, Landroid/hardware/camera2/TotalCaptureResult;

    .line 146
    invoke-static {p1, v2}, Landroidx/camera/camera2/internal/Camera2CaptureRequestBuilder$Api23Impl;->createReprocessCaptureRequest(Landroid/hardware/camera2/CameraDevice;Landroid/hardware/camera2/TotalCaptureResult;)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v2

    .local v2, "builder":Landroid/hardware/camera2/CaptureRequest$Builder;
    goto :goto_0

    .line 149
    .end local v2    # "builder":Landroid/hardware/camera2/CaptureRequest$Builder;
    :cond_2
    const-string/jumbo v2, "createCaptureRequest"

    invoke-static {v4, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    invoke-virtual {p0}, Landroidx/camera/core/impl/CaptureConfig;->getTemplateType()I

    move-result v2

    invoke-virtual {p1, v2}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v2

    .line 153
    .restart local v2    # "builder":Landroid/hardware/camera2/CaptureRequest$Builder;
    :goto_0
    nop

    .line 154
    invoke-virtual {p0}, Landroidx/camera/core/impl/CaptureConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v3

    .line 153
    invoke-static {v2, v3}, Landroidx/camera/camera2/internal/Camera2CaptureRequestBuilder;->applyImplementationOptionToCaptureBuilder(Landroid/hardware/camera2/CaptureRequest$Builder;Landroidx/camera/core/impl/Config;)V

    .line 156
    invoke-static {p0, v2}, Landroidx/camera/camera2/internal/Camera2CaptureRequestBuilder;->applyAeFpsRange(Landroidx/camera/core/impl/CaptureConfig;Landroid/hardware/camera2/CaptureRequest$Builder;)V

    .line 158
    invoke-virtual {p0}, Landroidx/camera/core/impl/CaptureConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v3

    sget-object v4, Landroidx/camera/core/impl/CaptureConfig;->OPTION_ROTATION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v3, v4}, Landroidx/camera/core/impl/Config;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 160
    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->JPEG_ORIENTATION:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 161
    invoke-virtual {p0}, Landroidx/camera/core/impl/CaptureConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v4

    sget-object v5, Landroidx/camera/core/impl/CaptureConfig;->OPTION_ROTATION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v4, v5}, Landroidx/camera/core/impl/Config;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    .line 160
    invoke-virtual {v2, v3, v4}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 165
    :cond_3
    invoke-virtual {p0}, Landroidx/camera/core/impl/CaptureConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v3

    sget-object v4, Landroidx/camera/core/impl/CaptureConfig;->OPTION_JPEG_QUALITY:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v3, v4}, Landroidx/camera/core/impl/Config;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 167
    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->JPEG_QUALITY:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 168
    invoke-virtual {p0}, Landroidx/camera/core/impl/CaptureConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v4

    sget-object v5, Landroidx/camera/core/impl/CaptureConfig;->OPTION_JPEG_QUALITY:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v4, v5}, Landroidx/camera/core/impl/Config;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    .line 169
    invoke-virtual {v4}, Ljava/lang/Integer;->byteValue()B

    move-result v4

    .line 168
    invoke-static {v4}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v4

    .line 167
    invoke-virtual {v2, v3, v4}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 172
    :cond_4
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/Surface;

    .line 173
    .local v4, "surface":Landroid/view/Surface;
    invoke-virtual {v2, v4}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    .line 174
    .end local v4    # "surface":Landroid/view/Surface;
    goto :goto_1

    .line 176
    :cond_5
    invoke-virtual {p0}, Landroidx/camera/core/impl/CaptureConfig;->getTagBundle()Landroidx/camera/core/impl/TagBundle;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->setTag(Ljava/lang/Object;)V

    .line 178
    invoke-virtual {v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v3

    return-object v3
.end method

.method public static buildWithoutTarget(Landroidx/camera/core/impl/CaptureConfig;Landroid/hardware/camera2/CameraDevice;)Landroid/hardware/camera2/CaptureRequest;
    .locals 2
    .param p0, "captureConfig"    # Landroidx/camera/core/impl/CaptureConfig;
    .param p1, "device"    # Landroid/hardware/camera2/CameraDevice;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;
        }
    .end annotation

    .line 191
    if-nez p1, :cond_0

    .line 192
    const/4 v0, 0x0

    return-object v0

    .line 194
    :cond_0
    nop

    .line 195
    invoke-virtual {p0}, Landroidx/camera/core/impl/CaptureConfig;->getTemplateType()I

    move-result v0

    .line 194
    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    .line 197
    .local v0, "builder":Landroid/hardware/camera2/CaptureRequest$Builder;
    nop

    .line 198
    invoke-virtual {p0}, Landroidx/camera/core/impl/CaptureConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v1

    .line 197
    invoke-static {v0, v1}, Landroidx/camera/camera2/internal/Camera2CaptureRequestBuilder;->applyImplementationOptionToCaptureBuilder(Landroid/hardware/camera2/CaptureRequest$Builder;Landroidx/camera/core/impl/Config;)V

    .line 200
    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v1

    return-object v1
.end method

.method private static getConfiguredSurfaces(Ljava/util/List;Ljava/util/Map;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/DeferrableSurface;",
            ">;",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/DeferrableSurface;",
            "Landroid/view/Surface;",
            ">;)",
            "Ljava/util/List<",
            "Landroid/view/Surface;",
            ">;"
        }
    .end annotation

    .line 66
    .local p0, "deferrableSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/DeferrableSurface;>;"
    .local p1, "configuredSurfaceMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/DeferrableSurface;Landroid/view/Surface;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 67
    .local v0, "surfaceList":Ljava/util/List;, "Ljava/util/List<Landroid/view/Surface;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/DeferrableSurface;

    .line 68
    .local v2, "deferrableSurface":Landroidx/camera/core/impl/DeferrableSurface;
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/Surface;

    .line 70
    .local v3, "surface":Landroid/view/Surface;
    if-eqz v3, :cond_0

    .line 74
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    .end local v2    # "deferrableSurface":Landroidx/camera/core/impl/DeferrableSurface;
    .end local v3    # "surface":Landroid/view/Surface;
    goto :goto_0

    .line 71
    .restart local v2    # "deferrableSurface":Landroidx/camera/core/impl/DeferrableSurface;
    .restart local v3    # "surface":Landroid/view/Surface;
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v4, "DeferrableSurface not in configuredSurfaceMap"

    invoke-direct {v1, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 77
    .end local v2    # "deferrableSurface":Landroidx/camera/core/impl/DeferrableSurface;
    .end local v3    # "surface":Landroid/view/Surface;
    :cond_1
    return-object v0
.end method
