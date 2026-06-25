.class final Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl$OutputConfigurationParamsApi21;
.super Ljava/lang/Object;
.source "OutputConfigurationCompatBaseImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "OutputConfigurationParamsApi21"
.end annotation


# static fields
.field private static final DETECT_SURFACE_TYPE_METHOD:Ljava/lang/String; = "detectSurfaceType"

.field private static final GET_GENERATION_ID_METHOD:Ljava/lang/String; = "getGenerationId"

.field private static final GET_SURFACE_SIZE_METHOD:Ljava/lang/String; = "getSurfaceSize"

.field private static final LEGACY_CAMERA_DEVICE_CLASS:Ljava/lang/String; = "android.hardware.camera2.legacy.LegacyCameraDevice"

.field static final MAX_SURFACES_COUNT:I = 0x1


# instance fields
.field final mConfiguredFormat:I

.field final mConfiguredGenerationId:I

.field final mConfiguredSize:Landroid/util/Size;

.field mDynamicRangeProfile:J

.field mIsShared:Z

.field mPhysicalCameraId:Ljava/lang/String;

.field final mSurfaces:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/Surface;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/view/Surface;)V
    .locals 2
    .param p1, "surface"    # Landroid/view/Surface;

    .line 246
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 243
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl$OutputConfigurationParamsApi21;->mIsShared:Z

    .line 244
    const-wide/16 v0, 0x1

    iput-wide v0, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl$OutputConfigurationParamsApi21;->mDynamicRangeProfile:J

    .line 247
    const-string/jumbo v0, "Surface must not be null"

    invoke-static {p1, v0}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 248
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl$OutputConfigurationParamsApi21;->mSurfaces:Ljava/util/List;

    .line 249
    invoke-static {p1}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl$OutputConfigurationParamsApi21;->getSurfaceSize(Landroid/view/Surface;)Landroid/util/Size;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl$OutputConfigurationParamsApi21;->mConfiguredSize:Landroid/util/Size;

    .line 250
    invoke-static {p1}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl$OutputConfigurationParamsApi21;->getSurfaceFormat(Landroid/view/Surface;)I

    move-result v0

    iput v0, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl$OutputConfigurationParamsApi21;->mConfiguredFormat:I

    .line 251
    invoke-static {p1}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl$OutputConfigurationParamsApi21;->getSurfaceGenerationId(Landroid/view/Surface;)I

    move-result v0

    iput v0, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl$OutputConfigurationParamsApi21;->mConfiguredGenerationId:I

    .line 252
    return-void
.end method

.method private static getSurfaceFormat(Landroid/view/Surface;)I
    .locals 5
    .param p0, "surface"    # Landroid/view/Surface;

    .line 278
    const/4 v0, 0x0

    :try_start_0
    const-string/jumbo v1, "android.hardware.camera2.legacy.LegacyCameraDevice"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 279
    .local v1, "legacyCameraDeviceClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string/jumbo v2, "detectSurfaceType"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const-class v4, Landroid/view/Surface;

    aput-object v4, v3, v0

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 281
    .local v2, "detectSurfaceType":Ljava/lang/reflect/Method;
    nop

    .line 286
    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v4, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 287
    .end local v1    # "legacyCameraDeviceClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "detectSurfaceType":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v1

    goto :goto_0

    :catch_1
    move-exception v1

    goto :goto_0

    :catch_2
    move-exception v1

    goto :goto_0

    :catch_3
    move-exception v1

    .line 291
    .local v1, "e":Ljava/lang/ReflectiveOperationException;
    :goto_0
    const-string/jumbo v2, "OutputConfigCompat"

    const-string/jumbo v3, "Unable to retrieve surface format."

    invoke-static {v2, v3, v1}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 292
    return v0
.end method

.method private static getSurfaceGenerationId(Landroid/view/Surface;)I
    .locals 4
    .param p0, "surface"    # Landroid/view/Surface;

    .line 302
    :try_start_0
    const-class v0, Landroid/view/Surface;

    const-string/jumbo v1, "getGenerationId"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 304
    .local v0, "getGenerationId":Ljava/lang/reflect/Method;
    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    return v1

    .line 305
    .end local v0    # "getGenerationId":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_0

    :catch_2
    move-exception v0

    .line 306
    .local v0, "e":Ljava/lang/ReflectiveOperationException;
    :goto_0
    const-string/jumbo v1, "OutputConfigCompat"

    const-string/jumbo v2, "Unable to retrieve surface generation id."

    invoke-static {v1, v2, v0}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 307
    const/4 v1, -0x1

    return v1
.end method

.method private static getSurfaceSize(Landroid/view/Surface;)Landroid/util/Size;
    .locals 7
    .param p0, "surface"    # Landroid/view/Surface;

    .line 261
    const/4 v0, 0x0

    :try_start_0
    const-string/jumbo v1, "android.hardware.camera2.legacy.LegacyCameraDevice"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 262
    .local v1, "legacyCameraDeviceClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string/jumbo v2, "getSurfaceSize"

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Landroid/view/Surface;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 264
    .local v2, "getSurfaceSize":Ljava/lang/reflect/Method;
    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 265
    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/util/Size;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v3

    .line 266
    .end local v1    # "legacyCameraDeviceClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "getSurfaceSize":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v1

    goto :goto_0

    :catch_1
    move-exception v1

    goto :goto_0

    :catch_2
    move-exception v1

    goto :goto_0

    :catch_3
    move-exception v1

    .line 270
    .local v1, "e":Ljava/lang/ReflectiveOperationException;
    :goto_0
    const-string/jumbo v2, "OutputConfigCompat"

    const-string/jumbo v3, "Unable to retrieve surface size."

    invoke-static {v2, v3, v1}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 271
    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 6
    .param p1, "obj"    # Ljava/lang/Object;

    .line 315
    instance-of v0, p1, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl$OutputConfigurationParamsApi21;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 316
    return v1

    .line 319
    :cond_0
    move-object v0, p1

    check-cast v0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl$OutputConfigurationParamsApi21;

    .line 321
    .local v0, "otherOutputConfig":Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl$OutputConfigurationParamsApi21;
    iget-object v2, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl$OutputConfigurationParamsApi21;->mConfiguredSize:Landroid/util/Size;

    iget-object v3, v0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl$OutputConfigurationParamsApi21;->mConfiguredSize:Landroid/util/Size;

    invoke-virtual {v2, v3}, Landroid/util/Size;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    iget v2, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl$OutputConfigurationParamsApi21;->mConfiguredFormat:I

    iget v3, v0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl$OutputConfigurationParamsApi21;->mConfiguredFormat:I

    if-ne v2, v3, :cond_4

    iget v2, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl$OutputConfigurationParamsApi21;->mConfiguredGenerationId:I

    iget v3, v0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl$OutputConfigurationParamsApi21;->mConfiguredGenerationId:I

    if-ne v2, v3, :cond_4

    iget-boolean v2, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl$OutputConfigurationParamsApi21;->mIsShared:Z

    iget-boolean v3, v0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl$OutputConfigurationParamsApi21;->mIsShared:Z

    if-ne v2, v3, :cond_4

    iget-wide v2, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl$OutputConfigurationParamsApi21;->mDynamicRangeProfile:J

    iget-wide v4, v0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl$OutputConfigurationParamsApi21;->mDynamicRangeProfile:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_4

    iget-object v2, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl$OutputConfigurationParamsApi21;->mPhysicalCameraId:Ljava/lang/String;

    iget-object v3, v0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl$OutputConfigurationParamsApi21;->mPhysicalCameraId:Ljava/lang/String;

    .line 326
    invoke-static {v2, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_1

    .line 330
    :cond_1
    iget-object v2, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl$OutputConfigurationParamsApi21;->mSurfaces:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    iget-object v3, v0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl$OutputConfigurationParamsApi21;->mSurfaces:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 331
    .local v2, "minLen":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v2, :cond_3

    .line 332
    iget-object v4, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl$OutputConfigurationParamsApi21;->mSurfaces:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    iget-object v5, v0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl$OutputConfigurationParamsApi21;->mSurfaces:Ljava/util/List;

    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    if-eq v4, v5, :cond_2

    .line 333
    return v1

    .line 331
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 337
    .end local v3    # "i":I
    :cond_3
    const/4 v1, 0x1

    return v1

    .line 327
    .end local v2    # "minLen":I
    :cond_4
    :goto_1
    return v1
.end method

.method public hashCode()I
    .locals 4

    .line 342
    const/4 v0, 0x1

    .line 344
    .local v0, "h":I
    shl-int/lit8 v1, v0, 0x5

    sub-int/2addr v1, v0

    iget-object v2, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl$OutputConfigurationParamsApi21;->mSurfaces:Ljava/util/List;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    xor-int v0, v1, v2

    .line 345
    shl-int/lit8 v1, v0, 0x5

    sub-int/2addr v1, v0

    iget v2, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl$OutputConfigurationParamsApi21;->mConfiguredGenerationId:I

    xor-int v0, v1, v2

    .line 346
    shl-int/lit8 v1, v0, 0x5

    sub-int/2addr v1, v0

    iget-object v2, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl$OutputConfigurationParamsApi21;->mConfiguredSize:Landroid/util/Size;

    .line 347
    invoke-virtual {v2}, Landroid/util/Size;->hashCode()I

    move-result v2

    xor-int v0, v1, v2

    .line 348
    shl-int/lit8 v1, v0, 0x5

    sub-int/2addr v1, v0

    iget v2, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl$OutputConfigurationParamsApi21;->mConfiguredFormat:I

    xor-int v0, v1, v2

    .line 349
    shl-int/lit8 v1, v0, 0x5

    sub-int/2addr v1, v0

    iget-boolean v2, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl$OutputConfigurationParamsApi21;->mIsShared:Z

    xor-int v0, v1, v2

    .line 351
    shl-int/lit8 v1, v0, 0x5

    sub-int/2addr v1, v0

    .line 352
    iget-object v2, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl$OutputConfigurationParamsApi21;->mPhysicalCameraId:Ljava/lang/String;

    if-nez v2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    iget-object v2, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl$OutputConfigurationParamsApi21;->mPhysicalCameraId:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_0
    xor-int v0, v1, v2

    .line 354
    shl-int/lit8 v1, v0, 0x5

    sub-int/2addr v1, v0

    iget-wide v2, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatBaseImpl$OutputConfigurationParamsApi21;->mDynamicRangeProfile:J

    invoke-static {v2, v3}, Ljava/lang/Long;->hashCode(J)I

    move-result v2

    xor-int v0, v1, v2

    .line 355
    return v0
.end method
