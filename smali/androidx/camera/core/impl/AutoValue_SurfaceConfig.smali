.class final Landroidx/camera/core/impl/AutoValue_SurfaceConfig;
.super Landroidx/camera/core/impl/SurfaceConfig;
.source "AutoValue_SurfaceConfig.java"


# instance fields
.field private final configSize:Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;

.field private final configType:Landroidx/camera/core/impl/SurfaceConfig$ConfigType;

.field private final streamUseCase:J


# direct methods
.method constructor <init>(Landroidx/camera/core/impl/SurfaceConfig$ConfigType;Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;J)V
    .locals 2
    .param p1, "configType"    # Landroidx/camera/core/impl/SurfaceConfig$ConfigType;
    .param p2, "configSize"    # Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;
    .param p3, "streamUseCase"    # J

    .line 19
    invoke-direct {p0}, Landroidx/camera/core/impl/SurfaceConfig;-><init>()V

    .line 20
    if-eqz p1, :cond_1

    .line 23
    iput-object p1, p0, Landroidx/camera/core/impl/AutoValue_SurfaceConfig;->configType:Landroidx/camera/core/impl/SurfaceConfig$ConfigType;

    .line 24
    if-eqz p2, :cond_0

    .line 27
    iput-object p2, p0, Landroidx/camera/core/impl/AutoValue_SurfaceConfig;->configSize:Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;

    .line 28
    iput-wide p3, p0, Landroidx/camera/core/impl/AutoValue_SurfaceConfig;->streamUseCase:J

    .line 29
    return-void

    .line 25
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null configSize"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 21
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null configType"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .param p1, "o"    # Ljava/lang/Object;

    .line 59
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    .line 60
    return v0

    .line 62
    :cond_0
    instance-of v1, p1, Landroidx/camera/core/impl/SurfaceConfig;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 63
    move-object v1, p1

    check-cast v1, Landroidx/camera/core/impl/SurfaceConfig;

    .line 64
    .local v1, "that":Landroidx/camera/core/impl/SurfaceConfig;
    iget-object v3, p0, Landroidx/camera/core/impl/AutoValue_SurfaceConfig;->configType:Landroidx/camera/core/impl/SurfaceConfig$ConfigType;

    invoke-virtual {v1}, Landroidx/camera/core/impl/SurfaceConfig;->getConfigType()Landroidx/camera/core/impl/SurfaceConfig$ConfigType;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroidx/camera/core/impl/SurfaceConfig$ConfigType;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, p0, Landroidx/camera/core/impl/AutoValue_SurfaceConfig;->configSize:Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;

    .line 65
    invoke-virtual {v1}, Landroidx/camera/core/impl/SurfaceConfig;->getConfigSize()Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-wide v3, p0, Landroidx/camera/core/impl/AutoValue_SurfaceConfig;->streamUseCase:J

    .line 66
    invoke-virtual {v1}, Landroidx/camera/core/impl/SurfaceConfig;->getStreamUseCase()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-nez v3, :cond_1

    goto :goto_0

    :cond_1
    move v0, v2

    .line 64
    :goto_0
    return v0

    .line 68
    .end local v1    # "that":Landroidx/camera/core/impl/SurfaceConfig;
    :cond_2
    return v2
.end method

.method public getConfigSize()Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;
    .locals 1

    .line 40
    iget-object v0, p0, Landroidx/camera/core/impl/AutoValue_SurfaceConfig;->configSize:Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;

    return-object v0
.end method

.method public getConfigType()Landroidx/camera/core/impl/SurfaceConfig$ConfigType;
    .locals 1

    .line 34
    iget-object v0, p0, Landroidx/camera/core/impl/AutoValue_SurfaceConfig;->configType:Landroidx/camera/core/impl/SurfaceConfig$ConfigType;

    return-object v0
.end method

.method public getStreamUseCase()J
    .locals 2

    .line 45
    iget-wide v0, p0, Landroidx/camera/core/impl/AutoValue_SurfaceConfig;->streamUseCase:J

    return-wide v0
.end method

.method public hashCode()I
    .locals 5

    .line 73
    const/4 v0, 0x1

    .line 74
    .local v0, "h$":I
    const v1, 0xf4243

    mul-int/2addr v0, v1

    .line 75
    iget-object v2, p0, Landroidx/camera/core/impl/AutoValue_SurfaceConfig;->configType:Landroidx/camera/core/impl/SurfaceConfig$ConfigType;

    invoke-virtual {v2}, Landroidx/camera/core/impl/SurfaceConfig$ConfigType;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    .line 76
    mul-int/2addr v0, v1

    .line 77
    iget-object v2, p0, Landroidx/camera/core/impl/AutoValue_SurfaceConfig;->configSize:Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;

    invoke-virtual {v2}, Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    .line 78
    mul-int/2addr v0, v1

    .line 79
    iget-wide v1, p0, Landroidx/camera/core/impl/AutoValue_SurfaceConfig;->streamUseCase:J

    const/16 v3, 0x20

    ushr-long/2addr v1, v3

    iget-wide v3, p0, Landroidx/camera/core/impl/AutoValue_SurfaceConfig;->streamUseCase:J

    xor-long/2addr v1, v3

    long-to-int v1, v1

    xor-int/2addr v0, v1

    .line 80
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 50
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "SurfaceConfig{configType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/impl/AutoValue_SurfaceConfig;->configType:Landroidx/camera/core/impl/SurfaceConfig$ConfigType;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", configSize="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/impl/AutoValue_SurfaceConfig;->configSize:Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", streamUseCase="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Landroidx/camera/core/impl/AutoValue_SurfaceConfig;->streamUseCase:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
