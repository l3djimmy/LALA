.class final Landroidx/camera/camera2/internal/AutoValue_Camera2CameraImpl_UseCaseInfo;
.super Landroidx/camera/camera2/internal/Camera2CameraImpl$UseCaseInfo;
.source "AutoValue_Camera2CameraImpl_UseCaseInfo.java"


# instance fields
.field private final sessionConfig:Landroidx/camera/core/impl/SessionConfig;

.field private final surfaceResolution:Landroid/util/Size;

.field private final useCaseConfig:Landroidx/camera/core/impl/UseCaseConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;"
        }
    .end annotation
.end field

.field private final useCaseId:Ljava/lang/String;

.field private final useCaseType:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/Class;Landroidx/camera/core/impl/SessionConfig;Landroidx/camera/core/impl/UseCaseConfig;Landroid/util/Size;)V
    .locals 2
    .param p1, "useCaseId"    # Ljava/lang/String;
    .param p3, "sessionConfig"    # Landroidx/camera/core/impl/SessionConfig;
    .param p5, "surfaceResolution"    # Landroid/util/Size;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "*>;",
            "Landroidx/camera/core/impl/SessionConfig;",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;",
            "Landroid/util/Size;",
            ")V"
        }
    .end annotation

    .line 29
    .local p2, "useCaseType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p4, "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    invoke-direct {p0}, Landroidx/camera/camera2/internal/Camera2CameraImpl$UseCaseInfo;-><init>()V

    .line 30
    if-eqz p1, :cond_3

    .line 33
    iput-object p1, p0, Landroidx/camera/camera2/internal/AutoValue_Camera2CameraImpl_UseCaseInfo;->useCaseId:Ljava/lang/String;

    .line 34
    if-eqz p2, :cond_2

    .line 37
    iput-object p2, p0, Landroidx/camera/camera2/internal/AutoValue_Camera2CameraImpl_UseCaseInfo;->useCaseType:Ljava/lang/Class;

    .line 38
    if-eqz p3, :cond_1

    .line 41
    iput-object p3, p0, Landroidx/camera/camera2/internal/AutoValue_Camera2CameraImpl_UseCaseInfo;->sessionConfig:Landroidx/camera/core/impl/SessionConfig;

    .line 42
    if-eqz p4, :cond_0

    .line 45
    iput-object p4, p0, Landroidx/camera/camera2/internal/AutoValue_Camera2CameraImpl_UseCaseInfo;->useCaseConfig:Landroidx/camera/core/impl/UseCaseConfig;

    .line 46
    iput-object p5, p0, Landroidx/camera/camera2/internal/AutoValue_Camera2CameraImpl_UseCaseInfo;->surfaceResolution:Landroid/util/Size;

    .line 47
    return-void

    .line 43
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null useCaseConfig"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 39
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null sessionConfig"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 35
    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null useCaseType"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 31
    :cond_3
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null useCaseId"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 92
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    .line 93
    return v0

    .line 95
    :cond_0
    instance-of v1, p1, Landroidx/camera/camera2/internal/Camera2CameraImpl$UseCaseInfo;

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    .line 96
    move-object v1, p1

    check-cast v1, Landroidx/camera/camera2/internal/Camera2CameraImpl$UseCaseInfo;

    .line 97
    .local v1, "that":Landroidx/camera/camera2/internal/Camera2CameraImpl$UseCaseInfo;
    iget-object v3, p0, Landroidx/camera/camera2/internal/AutoValue_Camera2CameraImpl_UseCaseInfo;->useCaseId:Ljava/lang/String;

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/Camera2CameraImpl$UseCaseInfo;->getUseCaseId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Landroidx/camera/camera2/internal/AutoValue_Camera2CameraImpl_UseCaseInfo;->useCaseType:Ljava/lang/Class;

    .line 98
    invoke-virtual {v1}, Landroidx/camera/camera2/internal/Camera2CameraImpl$UseCaseInfo;->getUseCaseType()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Landroidx/camera/camera2/internal/AutoValue_Camera2CameraImpl_UseCaseInfo;->sessionConfig:Landroidx/camera/core/impl/SessionConfig;

    .line 99
    invoke-virtual {v1}, Landroidx/camera/camera2/internal/Camera2CameraImpl$UseCaseInfo;->getSessionConfig()Landroidx/camera/core/impl/SessionConfig;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Landroidx/camera/camera2/internal/AutoValue_Camera2CameraImpl_UseCaseInfo;->useCaseConfig:Landroidx/camera/core/impl/UseCaseConfig;

    .line 100
    invoke-virtual {v1}, Landroidx/camera/camera2/internal/Camera2CameraImpl$UseCaseInfo;->getUseCaseConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Landroidx/camera/camera2/internal/AutoValue_Camera2CameraImpl_UseCaseInfo;->surfaceResolution:Landroid/util/Size;

    if-nez v3, :cond_1

    .line 101
    invoke-virtual {v1}, Landroidx/camera/camera2/internal/Camera2CameraImpl$UseCaseInfo;->getSurfaceResolution()Landroid/util/Size;

    move-result-object v3

    if-nez v3, :cond_2

    goto :goto_0

    :cond_1
    iget-object v3, p0, Landroidx/camera/camera2/internal/AutoValue_Camera2CameraImpl_UseCaseInfo;->surfaceResolution:Landroid/util/Size;

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/Camera2CameraImpl$UseCaseInfo;->getSurfaceResolution()Landroid/util/Size;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/util/Size;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    :goto_0
    goto :goto_1

    :cond_2
    move v0, v2

    .line 97
    :goto_1
    return v0

    .line 103
    .end local v1    # "that":Landroidx/camera/camera2/internal/Camera2CameraImpl$UseCaseInfo;
    :cond_3
    return v2
.end method

.method getSessionConfig()Landroidx/camera/core/impl/SessionConfig;
    .locals 1

    .line 64
    iget-object v0, p0, Landroidx/camera/camera2/internal/AutoValue_Camera2CameraImpl_UseCaseInfo;->sessionConfig:Landroidx/camera/core/impl/SessionConfig;

    return-object v0
.end method

.method getSurfaceResolution()Landroid/util/Size;
    .locals 1

    .line 76
    iget-object v0, p0, Landroidx/camera/camera2/internal/AutoValue_Camera2CameraImpl_UseCaseInfo;->surfaceResolution:Landroid/util/Size;

    return-object v0
.end method

.method getUseCaseConfig()Landroidx/camera/core/impl/UseCaseConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;"
        }
    .end annotation

    .line 70
    iget-object v0, p0, Landroidx/camera/camera2/internal/AutoValue_Camera2CameraImpl_UseCaseInfo;->useCaseConfig:Landroidx/camera/core/impl/UseCaseConfig;

    return-object v0
.end method

.method getUseCaseId()Ljava/lang/String;
    .locals 1

    .line 52
    iget-object v0, p0, Landroidx/camera/camera2/internal/AutoValue_Camera2CameraImpl_UseCaseInfo;->useCaseId:Ljava/lang/String;

    return-object v0
.end method

.method getUseCaseType()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 58
    iget-object v0, p0, Landroidx/camera/camera2/internal/AutoValue_Camera2CameraImpl_UseCaseInfo;->useCaseType:Ljava/lang/Class;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .line 108
    const/4 v0, 0x1

    .line 109
    .local v0, "h$":I
    const v1, 0xf4243

    mul-int/2addr v0, v1

    .line 110
    iget-object v2, p0, Landroidx/camera/camera2/internal/AutoValue_Camera2CameraImpl_UseCaseInfo;->useCaseId:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    .line 111
    mul-int/2addr v0, v1

    .line 112
    iget-object v2, p0, Landroidx/camera/camera2/internal/AutoValue_Camera2CameraImpl_UseCaseInfo;->useCaseType:Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    .line 113
    mul-int/2addr v0, v1

    .line 114
    iget-object v2, p0, Landroidx/camera/camera2/internal/AutoValue_Camera2CameraImpl_UseCaseInfo;->sessionConfig:Landroidx/camera/core/impl/SessionConfig;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    .line 115
    mul-int/2addr v0, v1

    .line 116
    iget-object v2, p0, Landroidx/camera/camera2/internal/AutoValue_Camera2CameraImpl_UseCaseInfo;->useCaseConfig:Landroidx/camera/core/impl/UseCaseConfig;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    .line 117
    mul-int/2addr v0, v1

    .line 118
    iget-object v1, p0, Landroidx/camera/camera2/internal/AutoValue_Camera2CameraImpl_UseCaseInfo;->surfaceResolution:Landroid/util/Size;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/AutoValue_Camera2CameraImpl_UseCaseInfo;->surfaceResolution:Landroid/util/Size;

    invoke-virtual {v1}, Landroid/util/Size;->hashCode()I

    move-result v1

    :goto_0
    xor-int/2addr v0, v1

    .line 119
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 81
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "UseCaseInfo{useCaseId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/camera2/internal/AutoValue_Camera2CameraImpl_UseCaseInfo;->useCaseId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", useCaseType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/camera2/internal/AutoValue_Camera2CameraImpl_UseCaseInfo;->useCaseType:Ljava/lang/Class;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", sessionConfig="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/camera2/internal/AutoValue_Camera2CameraImpl_UseCaseInfo;->sessionConfig:Landroidx/camera/core/impl/SessionConfig;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", useCaseConfig="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/camera2/internal/AutoValue_Camera2CameraImpl_UseCaseInfo;->useCaseConfig:Landroidx/camera/core/impl/UseCaseConfig;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", surfaceResolution="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/camera2/internal/AutoValue_Camera2CameraImpl_UseCaseInfo;->surfaceResolution:Landroid/util/Size;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
