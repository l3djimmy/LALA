.class final Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi26Impl$OutputConfigurationParamsApi26;
.super Ljava/lang/Object;
.source "OutputConfigurationCompatApi26Impl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi26Impl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "OutputConfigurationParamsApi26"
.end annotation


# instance fields
.field mDynamicRangeProfile:J

.field final mOutputConfiguration:Landroid/hardware/camera2/params/OutputConfiguration;

.field mPhysicalCameraId:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/hardware/camera2/params/OutputConfiguration;)V
    .locals 2
    .param p1, "configuration"    # Landroid/hardware/camera2/params/OutputConfiguration;

    .line 193
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 191
    const-wide/16 v0, 0x1

    iput-wide v0, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi26Impl$OutputConfigurationParamsApi26;->mDynamicRangeProfile:J

    .line 194
    iput-object p1, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi26Impl$OutputConfigurationParamsApi26;->mOutputConfiguration:Landroid/hardware/camera2/params/OutputConfiguration;

    .line 195
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 6
    .param p1, "obj"    # Ljava/lang/Object;

    .line 199
    instance-of v0, p1, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi26Impl$OutputConfigurationParamsApi26;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 200
    return v1

    .line 203
    :cond_0
    move-object v0, p1

    check-cast v0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi26Impl$OutputConfigurationParamsApi26;

    .line 205
    .local v0, "otherOutputConfig":Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi26Impl$OutputConfigurationParamsApi26;
    iget-object v2, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi26Impl$OutputConfigurationParamsApi26;->mOutputConfiguration:Landroid/hardware/camera2/params/OutputConfiguration;

    iget-object v3, v0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi26Impl$OutputConfigurationParamsApi26;->mOutputConfiguration:Landroid/hardware/camera2/params/OutputConfiguration;

    invoke-static {v2, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-wide v2, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi26Impl$OutputConfigurationParamsApi26;->mDynamicRangeProfile:J

    iget-wide v4, v0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi26Impl$OutputConfigurationParamsApi26;->mDynamicRangeProfile:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_1

    iget-object v2, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi26Impl$OutputConfigurationParamsApi26;->mPhysicalCameraId:Ljava/lang/String;

    iget-object v3, v0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi26Impl$OutputConfigurationParamsApi26;->mPhysicalCameraId:Ljava/lang/String;

    .line 207
    invoke-static {v2, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    nop

    .line 205
    :goto_0
    return v1
.end method

.method public hashCode()I
    .locals 4

    .line 213
    const/4 v0, 0x1

    .line 216
    .local v0, "h":I
    shl-int/lit8 v1, v0, 0x5

    sub-int/2addr v1, v0

    iget-object v2, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi26Impl$OutputConfigurationParamsApi26;->mOutputConfiguration:Landroid/hardware/camera2/params/OutputConfiguration;

    invoke-virtual {v2}, Landroid/hardware/camera2/params/OutputConfiguration;->hashCode()I

    move-result v2

    xor-int v0, v1, v2

    .line 218
    shl-int/lit8 v1, v0, 0x5

    sub-int/2addr v1, v0

    .line 219
    iget-object v2, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi26Impl$OutputConfigurationParamsApi26;->mPhysicalCameraId:Ljava/lang/String;

    if-nez v2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    iget-object v2, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi26Impl$OutputConfigurationParamsApi26;->mPhysicalCameraId:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_0
    xor-int v0, v1, v2

    .line 221
    shl-int/lit8 v1, v0, 0x5

    sub-int/2addr v1, v0

    iget-wide v2, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi26Impl$OutputConfigurationParamsApi26;->mDynamicRangeProfile:J

    invoke-static {v2, v3}, Ljava/lang/Long;->hashCode(J)I

    move-result v2

    xor-int v0, v1, v2

    .line 222
    return v0
.end method
