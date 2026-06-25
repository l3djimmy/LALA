.class public final Landroidx/camera/core/internal/utils/UseCaseConfigUtil;
.super Ljava/lang/Object;
.source "UseCaseConfigUtil.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static updateTargetRotationAndRelatedConfigs(Landroidx/camera/core/impl/UseCaseConfig$Builder;I)V
    .locals 9
    .param p1, "newRotation"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/UseCaseConfig$Builder<",
            "***>;I)V"
        }
    .end annotation

    .line 45
    .local p0, "builder":Landroidx/camera/core/impl/UseCaseConfig$Builder;, "Landroidx/camera/core/impl/UseCaseConfig$Builder<***>;"
    invoke-interface {p0}, Landroidx/camera/core/impl/UseCaseConfig$Builder;->getUseCaseConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/ImageOutputConfig;

    .line 46
    .local v0, "config":Landroidx/camera/core/impl/ImageOutputConfig;
    const/4 v1, -0x1

    invoke-interface {v0, v1}, Landroidx/camera/core/impl/ImageOutputConfig;->getTargetRotation(I)I

    move-result v2

    .line 48
    .local v2, "oldRotation":I
    if-eq v2, v1, :cond_0

    if-eq v2, p1, :cond_1

    .line 49
    :cond_0
    move-object v3, p0

    check-cast v3, Landroidx/camera/core/impl/ImageOutputConfig$Builder;

    invoke-interface {v3, p1}, Landroidx/camera/core/impl/ImageOutputConfig$Builder;->setTargetRotation(I)Ljava/lang/Object;

    .line 52
    :cond_1
    if-eq v2, v1, :cond_4

    if-eq p1, v1, :cond_4

    if-ne v2, p1, :cond_2

    goto :goto_0

    .line 58
    :cond_2
    invoke-static {v2}, Landroidx/camera/core/impl/utils/CameraOrientationUtil;->surfaceRotationToDegrees(I)I

    move-result v1

    .line 59
    .local v1, "oldRotationDegrees":I
    invoke-static {p1}, Landroidx/camera/core/impl/utils/CameraOrientationUtil;->surfaceRotationToDegrees(I)I

    move-result v3

    .line 68
    .local v3, "newRotationDegrees":I
    sub-int v4, v3, v1

    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v4

    rem-int/lit16 v4, v4, 0xb4

    const/16 v5, 0x5a

    if-ne v4, v5, :cond_3

    .line 69
    const/4 v4, 0x0

    invoke-interface {v0, v4}, Landroidx/camera/core/impl/ImageOutputConfig;->getTargetResolution(Landroid/util/Size;)Landroid/util/Size;

    move-result-object v4

    .line 71
    .local v4, "targetResolution":Landroid/util/Size;
    if-eqz v4, :cond_3

    .line 74
    move-object v5, p0

    check-cast v5, Landroidx/camera/core/impl/ImageOutputConfig$Builder;

    new-instance v6, Landroid/util/Size;

    .line 75
    invoke-virtual {v4}, Landroid/util/Size;->getHeight()I

    move-result v7

    .line 76
    invoke-virtual {v4}, Landroid/util/Size;->getWidth()I

    move-result v8

    invoke-direct {v6, v7, v8}, Landroid/util/Size;-><init>(II)V

    .line 74
    invoke-interface {v5, v6}, Landroidx/camera/core/impl/ImageOutputConfig$Builder;->setTargetResolution(Landroid/util/Size;)Ljava/lang/Object;

    .line 79
    .end local v4    # "targetResolution":Landroid/util/Size;
    :cond_3
    return-void

    .line 55
    .end local v1    # "oldRotationDegrees":I
    .end local v3    # "newRotationDegrees":I
    :cond_4
    :goto_0
    return-void
.end method
