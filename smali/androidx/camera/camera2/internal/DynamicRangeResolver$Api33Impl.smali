.class final Landroidx/camera/camera2/internal/DynamicRangeResolver$Api33Impl;
.super Ljava/lang/Object;
.source "DynamicRangeResolver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/camera2/internal/DynamicRangeResolver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Api33Impl"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 409
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 411
    return-void
.end method

.method static getRecommended10BitDynamicRange(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Landroidx/camera/core/DynamicRange;
    .locals 3
    .param p0, "characteristics"    # Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 417
    sget-object v0, Landroid/hardware/camera2/CameraCharacteristics;->REQUEST_RECOMMENDED_TEN_BIT_DYNAMIC_RANGE_PROFILE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 418
    invoke-virtual {p0, v0}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    .line 419
    .local v0, "recommendedProfile":Ljava/lang/Long;
    if-eqz v0, :cond_0

    .line 420
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-static {v1, v2}, Landroidx/camera/camera2/internal/compat/params/DynamicRangeConversions;->profileToDynamicRange(J)Landroidx/camera/core/DynamicRange;

    move-result-object v1

    return-object v1

    .line 422
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method
