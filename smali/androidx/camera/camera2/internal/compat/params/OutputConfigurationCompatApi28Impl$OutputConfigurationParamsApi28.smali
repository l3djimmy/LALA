.class final Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi28Impl$OutputConfigurationParamsApi28;
.super Ljava/lang/Object;
.source "OutputConfigurationCompatApi28Impl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi28Impl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "OutputConfigurationParamsApi28"
.end annotation


# instance fields
.field mDynamicRangeProfile:J

.field final mOutputConfiguration:Landroid/hardware/camera2/params/OutputConfiguration;


# direct methods
.method constructor <init>(Landroid/hardware/camera2/params/OutputConfiguration;)V
    .locals 2
    .param p1, "configuration"    # Landroid/hardware/camera2/params/OutputConfiguration;

    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 107
    const-wide/16 v0, 0x1

    iput-wide v0, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi28Impl$OutputConfigurationParamsApi28;->mDynamicRangeProfile:J

    .line 110
    iput-object p1, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi28Impl$OutputConfigurationParamsApi28;->mOutputConfiguration:Landroid/hardware/camera2/params/OutputConfiguration;

    .line 111
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 6
    .param p1, "obj"    # Ljava/lang/Object;

    .line 115
    instance-of v0, p1, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi28Impl$OutputConfigurationParamsApi28;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 116
    return v1

    .line 119
    :cond_0
    move-object v0, p1

    check-cast v0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi28Impl$OutputConfigurationParamsApi28;

    .line 121
    .local v0, "otherOutputConfig":Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi28Impl$OutputConfigurationParamsApi28;
    iget-object v2, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi28Impl$OutputConfigurationParamsApi28;->mOutputConfiguration:Landroid/hardware/camera2/params/OutputConfiguration;

    iget-object v3, v0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi28Impl$OutputConfigurationParamsApi28;->mOutputConfiguration:Landroid/hardware/camera2/params/OutputConfiguration;

    invoke-static {v2, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-wide v2, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi28Impl$OutputConfigurationParamsApi28;->mDynamicRangeProfile:J

    iget-wide v4, v0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi28Impl$OutputConfigurationParamsApi28;->mDynamicRangeProfile:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method public hashCode()I
    .locals 4

    .line 128
    const/4 v0, 0x1

    .line 131
    .local v0, "h":I
    shl-int/lit8 v1, v0, 0x5

    sub-int/2addr v1, v0

    iget-object v2, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi28Impl$OutputConfigurationParamsApi28;->mOutputConfiguration:Landroid/hardware/camera2/params/OutputConfiguration;

    invoke-virtual {v2}, Landroid/hardware/camera2/params/OutputConfiguration;->hashCode()I

    move-result v2

    xor-int v0, v1, v2

    .line 133
    shl-int/lit8 v1, v0, 0x5

    sub-int/2addr v1, v0

    iget-wide v2, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi28Impl$OutputConfigurationParamsApi28;->mDynamicRangeProfile:J

    invoke-static {v2, v3}, Ljava/lang/Long;->hashCode(J)I

    move-result v2

    xor-int v0, v1, v2

    .line 134
    return v0
.end method
