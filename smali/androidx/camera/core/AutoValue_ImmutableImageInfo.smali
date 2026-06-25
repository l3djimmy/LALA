.class final Landroidx/camera/core/AutoValue_ImmutableImageInfo;
.super Landroidx/camera/core/ImmutableImageInfo;
.source "AutoValue_ImmutableImageInfo.java"


# instance fields
.field private final rotationDegrees:I

.field private final sensorToBufferTransformMatrix:Landroid/graphics/Matrix;

.field private final tagBundle:Landroidx/camera/core/impl/TagBundle;

.field private final timestamp:J


# direct methods
.method constructor <init>(Landroidx/camera/core/impl/TagBundle;JILandroid/graphics/Matrix;)V
    .locals 2
    .param p1, "tagBundle"    # Landroidx/camera/core/impl/TagBundle;
    .param p2, "timestamp"    # J
    .param p4, "rotationDegrees"    # I
    .param p5, "sensorToBufferTransformMatrix"    # Landroid/graphics/Matrix;

    .line 24
    invoke-direct {p0}, Landroidx/camera/core/ImmutableImageInfo;-><init>()V

    .line 25
    if-eqz p1, :cond_1

    .line 28
    iput-object p1, p0, Landroidx/camera/core/AutoValue_ImmutableImageInfo;->tagBundle:Landroidx/camera/core/impl/TagBundle;

    .line 29
    iput-wide p2, p0, Landroidx/camera/core/AutoValue_ImmutableImageInfo;->timestamp:J

    .line 30
    iput p4, p0, Landroidx/camera/core/AutoValue_ImmutableImageInfo;->rotationDegrees:I

    .line 31
    if-eqz p5, :cond_0

    .line 34
    iput-object p5, p0, Landroidx/camera/core/AutoValue_ImmutableImageInfo;->sensorToBufferTransformMatrix:Landroid/graphics/Matrix;

    .line 35
    return-void

    .line 32
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null sensorToBufferTransformMatrix"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 26
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null tagBundle"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .param p1, "o"    # Ljava/lang/Object;

    .line 71
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    .line 72
    return v0

    .line 74
    :cond_0
    instance-of v1, p1, Landroidx/camera/core/ImmutableImageInfo;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 75
    move-object v1, p1

    check-cast v1, Landroidx/camera/core/ImmutableImageInfo;

    .line 76
    .local v1, "that":Landroidx/camera/core/ImmutableImageInfo;
    iget-object v3, p0, Landroidx/camera/core/AutoValue_ImmutableImageInfo;->tagBundle:Landroidx/camera/core/impl/TagBundle;

    invoke-virtual {v1}, Landroidx/camera/core/ImmutableImageInfo;->getTagBundle()Landroidx/camera/core/impl/TagBundle;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-wide v3, p0, Landroidx/camera/core/AutoValue_ImmutableImageInfo;->timestamp:J

    .line 77
    invoke-virtual {v1}, Landroidx/camera/core/ImmutableImageInfo;->getTimestamp()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-nez v3, :cond_1

    iget v3, p0, Landroidx/camera/core/AutoValue_ImmutableImageInfo;->rotationDegrees:I

    .line 78
    invoke-virtual {v1}, Landroidx/camera/core/ImmutableImageInfo;->getRotationDegrees()I

    move-result v4

    if-ne v3, v4, :cond_1

    iget-object v3, p0, Landroidx/camera/core/AutoValue_ImmutableImageInfo;->sensorToBufferTransformMatrix:Landroid/graphics/Matrix;

    .line 79
    invoke-virtual {v1}, Landroidx/camera/core/ImmutableImageInfo;->getSensorToBufferTransformMatrix()Landroid/graphics/Matrix;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/graphics/Matrix;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    :cond_1
    move v0, v2

    .line 76
    :goto_0
    return v0

    .line 81
    .end local v1    # "that":Landroidx/camera/core/ImmutableImageInfo;
    :cond_2
    return v2
.end method

.method public getRotationDegrees()I
    .locals 1

    .line 50
    iget v0, p0, Landroidx/camera/core/AutoValue_ImmutableImageInfo;->rotationDegrees:I

    return v0
.end method

.method public getSensorToBufferTransformMatrix()Landroid/graphics/Matrix;
    .locals 1

    .line 56
    iget-object v0, p0, Landroidx/camera/core/AutoValue_ImmutableImageInfo;->sensorToBufferTransformMatrix:Landroid/graphics/Matrix;

    return-object v0
.end method

.method public getTagBundle()Landroidx/camera/core/impl/TagBundle;
    .locals 1

    .line 40
    iget-object v0, p0, Landroidx/camera/core/AutoValue_ImmutableImageInfo;->tagBundle:Landroidx/camera/core/impl/TagBundle;

    return-object v0
.end method

.method public getTimestamp()J
    .locals 2

    .line 45
    iget-wide v0, p0, Landroidx/camera/core/AutoValue_ImmutableImageInfo;->timestamp:J

    return-wide v0
.end method

.method public hashCode()I
    .locals 6

    .line 86
    const/4 v0, 0x1

    .line 87
    .local v0, "h$":I
    const v1, 0xf4243

    mul-int/2addr v0, v1

    .line 88
    iget-object v2, p0, Landroidx/camera/core/AutoValue_ImmutableImageInfo;->tagBundle:Landroidx/camera/core/impl/TagBundle;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    .line 89
    mul-int/2addr v0, v1

    .line 90
    iget-wide v2, p0, Landroidx/camera/core/AutoValue_ImmutableImageInfo;->timestamp:J

    const/16 v4, 0x20

    ushr-long/2addr v2, v4

    iget-wide v4, p0, Landroidx/camera/core/AutoValue_ImmutableImageInfo;->timestamp:J

    xor-long/2addr v2, v4

    long-to-int v2, v2

    xor-int/2addr v0, v2

    .line 91
    mul-int/2addr v0, v1

    .line 92
    iget v2, p0, Landroidx/camera/core/AutoValue_ImmutableImageInfo;->rotationDegrees:I

    xor-int/2addr v0, v2

    .line 93
    mul-int/2addr v0, v1

    .line 94
    iget-object v1, p0, Landroidx/camera/core/AutoValue_ImmutableImageInfo;->sensorToBufferTransformMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1}, Landroid/graphics/Matrix;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    .line 95
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 61
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ImmutableImageInfo{tagBundle="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/AutoValue_ImmutableImageInfo;->tagBundle:Landroidx/camera/core/impl/TagBundle;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", timestamp="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Landroidx/camera/core/AutoValue_ImmutableImageInfo;->timestamp:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", rotationDegrees="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/core/AutoValue_ImmutableImageInfo;->rotationDegrees:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", sensorToBufferTransformMatrix="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/AutoValue_ImmutableImageInfo;->sensorToBufferTransformMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
