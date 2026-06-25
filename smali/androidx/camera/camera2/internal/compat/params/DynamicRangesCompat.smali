.class public final Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;
.super Ljava/lang/Object;
.source "DynamicRangesCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat$DynamicRangeProfilesCompatImpl;
    }
.end annotation


# instance fields
.field private final mImpl:Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat$DynamicRangeProfilesCompatImpl;


# direct methods
.method constructor <init>(Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat$DynamicRangeProfilesCompatImpl;)V
    .locals 0
    .param p1, "impl"    # Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat$DynamicRangeProfilesCompatImpl;

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;->mImpl:Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat$DynamicRangeProfilesCompatImpl;

    .line 42
    return-void
.end method

.method public static fromCameraCharacteristics(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;
    .locals 3
    .param p0, "characteristics"    # Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 109
    const/4 v0, 0x0

    .line 110
    .local v0, "rangesCompat":Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x21

    if-lt v1, v2, :cond_0

    .line 111
    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->REQUEST_AVAILABLE_DYNAMIC_RANGE_PROFILES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {p0, v1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/camera2/params/DynamicRangeProfiles;

    invoke-static {v1}, Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;->toDynamicRangesCompat(Landroid/hardware/camera2/params/DynamicRangeProfiles;)Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;

    move-result-object v0

    .line 115
    :cond_0
    if-nez v0, :cond_1

    sget-object v1, Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompatBaseImpl;->COMPAT_INSTANCE:Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;

    goto :goto_0

    :cond_1
    move-object v1, v0

    :goto_0
    return-object v1
.end method

.method public static toDynamicRangesCompat(Landroid/hardware/camera2/params/DynamicRangeProfiles;)Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;
    .locals 2
    .param p0, "dynamicRangeProfiles"    # Landroid/hardware/camera2/params/DynamicRangeProfiles;

    .line 129
    if-nez p0, :cond_0

    .line 130
    const/4 v0, 0x0

    return-object v0

    .line 133
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    if-lt v0, v1, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    const-string v1, "DynamicRangeProfiles can only be converted to DynamicRangesCompat on API 33 or higher."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 136
    new-instance v0, Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;

    new-instance v1, Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompatApi33Impl;

    invoke-direct {v1, p0}, Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompatApi33Impl;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1}, Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;-><init>(Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat$DynamicRangeProfilesCompatImpl;)V

    return-object v0
.end method


# virtual methods
.method public getDynamicRangeCaptureRequestConstraints(Landroidx/camera/core/DynamicRange;)Ljava/util/Set;
    .locals 1
    .param p1, "dynamicRange"    # Landroidx/camera/core/DynamicRange;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/DynamicRange;",
            ")",
            "Ljava/util/Set<",
            "Landroidx/camera/core/DynamicRange;",
            ">;"
        }
    .end annotation

    .line 67
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;->mImpl:Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat$DynamicRangeProfilesCompatImpl;

    invoke-interface {v0, p1}, Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat$DynamicRangeProfilesCompatImpl;->getDynamicRangeCaptureRequestConstraints(Landroidx/camera/core/DynamicRange;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getSupportedDynamicRanges()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Landroidx/camera/core/DynamicRange;",
            ">;"
        }
    .end annotation

    .line 77
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;->mImpl:Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat$DynamicRangeProfilesCompatImpl;

    invoke-interface {v0}, Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat$DynamicRangeProfilesCompatImpl;->getSupportedDynamicRanges()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public isExtraLatencyPresent(Landroidx/camera/core/DynamicRange;)Z
    .locals 1
    .param p1, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 96
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;->mImpl:Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat$DynamicRangeProfilesCompatImpl;

    invoke-interface {v0, p1}, Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat$DynamicRangeProfilesCompatImpl;->isExtraLatencyPresent(Landroidx/camera/core/DynamicRange;)Z

    move-result v0

    return v0
.end method

.method public toDynamicRangeProfiles()Landroid/hardware/camera2/params/DynamicRangeProfiles;
    .locals 2

    .line 149
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "DynamicRangesCompat can only be converted to DynamicRangeProfiles on API 33 or higher."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 151
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;->mImpl:Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat$DynamicRangeProfilesCompatImpl;

    invoke-interface {v0}, Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat$DynamicRangeProfilesCompatImpl;->unwrap()Landroid/hardware/camera2/params/DynamicRangeProfiles;

    move-result-object v0

    return-object v0
.end method
