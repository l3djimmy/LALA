.class final Landroidx/camera/core/AutoValue_SurfaceRequest_TransformationInfo;
.super Landroidx/camera/core/SurfaceRequest$TransformationInfo;
.source "AutoValue_SurfaceRequest_TransformationInfo.java"


# instance fields
.field private final getCropRect:Landroid/graphics/Rect;

.field private final getMirroring:Z

.field private final getRotationDegrees:I

.field private final getSensorToBufferTransform:Landroid/graphics/Matrix;

.field private final getTargetRotation:I

.field private final hasCameraTransform:Z


# direct methods
.method constructor <init>(Landroid/graphics/Rect;IIZLandroid/graphics/Matrix;Z)V
    .locals 2
    .param p1, "getCropRect"    # Landroid/graphics/Rect;
    .param p2, "getRotationDegrees"    # I
    .param p3, "getTargetRotation"    # I
    .param p4, "hasCameraTransform"    # Z
    .param p5, "getSensorToBufferTransform"    # Landroid/graphics/Matrix;
    .param p6, "getMirroring"    # Z

    .line 32
    invoke-direct {p0}, Landroidx/camera/core/SurfaceRequest$TransformationInfo;-><init>()V

    .line 33
    if-eqz p1, :cond_1

    .line 36
    iput-object p1, p0, Landroidx/camera/core/AutoValue_SurfaceRequest_TransformationInfo;->getCropRect:Landroid/graphics/Rect;

    .line 37
    iput p2, p0, Landroidx/camera/core/AutoValue_SurfaceRequest_TransformationInfo;->getRotationDegrees:I

    .line 38
    iput p3, p0, Landroidx/camera/core/AutoValue_SurfaceRequest_TransformationInfo;->getTargetRotation:I

    .line 39
    iput-boolean p4, p0, Landroidx/camera/core/AutoValue_SurfaceRequest_TransformationInfo;->hasCameraTransform:Z

    .line 40
    if-eqz p5, :cond_0

    .line 43
    iput-object p5, p0, Landroidx/camera/core/AutoValue_SurfaceRequest_TransformationInfo;->getSensorToBufferTransform:Landroid/graphics/Matrix;

    .line 44
    iput-boolean p6, p0, Landroidx/camera/core/AutoValue_SurfaceRequest_TransformationInfo;->getMirroring:Z

    .line 45
    return-void

    .line 41
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null getSensorToBufferTransform"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 34
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null getCropRect"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 99
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    .line 100
    return v0

    .line 102
    :cond_0
    instance-of v1, p1, Landroidx/camera/core/SurfaceRequest$TransformationInfo;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 103
    move-object v1, p1

    check-cast v1, Landroidx/camera/core/SurfaceRequest$TransformationInfo;

    .line 104
    .local v1, "that":Landroidx/camera/core/SurfaceRequest$TransformationInfo;
    iget-object v3, p0, Landroidx/camera/core/AutoValue_SurfaceRequest_TransformationInfo;->getCropRect:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroidx/camera/core/SurfaceRequest$TransformationInfo;->getCropRect()Landroid/graphics/Rect;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget v3, p0, Landroidx/camera/core/AutoValue_SurfaceRequest_TransformationInfo;->getRotationDegrees:I

    .line 105
    invoke-virtual {v1}, Landroidx/camera/core/SurfaceRequest$TransformationInfo;->getRotationDegrees()I

    move-result v4

    if-ne v3, v4, :cond_1

    iget v3, p0, Landroidx/camera/core/AutoValue_SurfaceRequest_TransformationInfo;->getTargetRotation:I

    .line 106
    invoke-virtual {v1}, Landroidx/camera/core/SurfaceRequest$TransformationInfo;->getTargetRotation()I

    move-result v4

    if-ne v3, v4, :cond_1

    iget-boolean v3, p0, Landroidx/camera/core/AutoValue_SurfaceRequest_TransformationInfo;->hasCameraTransform:Z

    .line 107
    invoke-virtual {v1}, Landroidx/camera/core/SurfaceRequest$TransformationInfo;->hasCameraTransform()Z

    move-result v4

    if-ne v3, v4, :cond_1

    iget-object v3, p0, Landroidx/camera/core/AutoValue_SurfaceRequest_TransformationInfo;->getSensorToBufferTransform:Landroid/graphics/Matrix;

    .line 108
    invoke-virtual {v1}, Landroidx/camera/core/SurfaceRequest$TransformationInfo;->getSensorToBufferTransform()Landroid/graphics/Matrix;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/graphics/Matrix;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-boolean v3, p0, Landroidx/camera/core/AutoValue_SurfaceRequest_TransformationInfo;->getMirroring:Z

    .line 109
    invoke-virtual {v1}, Landroidx/camera/core/SurfaceRequest$TransformationInfo;->getMirroring()Z

    move-result v4

    if-ne v3, v4, :cond_1

    goto :goto_0

    :cond_1
    move v0, v2

    .line 104
    :goto_0
    return v0

    .line 111
    .end local v1    # "that":Landroidx/camera/core/SurfaceRequest$TransformationInfo;
    :cond_2
    return v2
.end method

.method public getCropRect()Landroid/graphics/Rect;
    .locals 1

    .line 50
    iget-object v0, p0, Landroidx/camera/core/AutoValue_SurfaceRequest_TransformationInfo;->getCropRect:Landroid/graphics/Rect;

    return-object v0
.end method

.method public getMirroring()Z
    .locals 1

    .line 82
    iget-boolean v0, p0, Landroidx/camera/core/AutoValue_SurfaceRequest_TransformationInfo;->getMirroring:Z

    return v0
.end method

.method public getRotationDegrees()I
    .locals 1

    .line 56
    iget v0, p0, Landroidx/camera/core/AutoValue_SurfaceRequest_TransformationInfo;->getRotationDegrees:I

    return v0
.end method

.method public getSensorToBufferTransform()Landroid/graphics/Matrix;
    .locals 1

    .line 76
    iget-object v0, p0, Landroidx/camera/core/AutoValue_SurfaceRequest_TransformationInfo;->getSensorToBufferTransform:Landroid/graphics/Matrix;

    return-object v0
.end method

.method public getTargetRotation()I
    .locals 1

    .line 63
    iget v0, p0, Landroidx/camera/core/AutoValue_SurfaceRequest_TransformationInfo;->getTargetRotation:I

    return v0
.end method

.method public hasCameraTransform()Z
    .locals 1

    .line 69
    iget-boolean v0, p0, Landroidx/camera/core/AutoValue_SurfaceRequest_TransformationInfo;->hasCameraTransform:Z

    return v0
.end method

.method public hashCode()I
    .locals 5

    .line 116
    const/4 v0, 0x1

    .line 117
    .local v0, "h$":I
    const v1, 0xf4243

    mul-int/2addr v0, v1

    .line 118
    iget-object v2, p0, Landroidx/camera/core/AutoValue_SurfaceRequest_TransformationInfo;->getCropRect:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    .line 119
    mul-int/2addr v0, v1

    .line 120
    iget v2, p0, Landroidx/camera/core/AutoValue_SurfaceRequest_TransformationInfo;->getRotationDegrees:I

    xor-int/2addr v0, v2

    .line 121
    mul-int/2addr v0, v1

    .line 122
    iget v2, p0, Landroidx/camera/core/AutoValue_SurfaceRequest_TransformationInfo;->getTargetRotation:I

    xor-int/2addr v0, v2

    .line 123
    mul-int/2addr v0, v1

    .line 124
    iget-boolean v2, p0, Landroidx/camera/core/AutoValue_SurfaceRequest_TransformationInfo;->hasCameraTransform:Z

    const/16 v3, 0x4cf

    const/16 v4, 0x4d5

    if-eqz v2, :cond_0

    move v2, v3

    goto :goto_0

    :cond_0
    move v2, v4

    :goto_0
    xor-int/2addr v0, v2

    .line 125
    mul-int/2addr v0, v1

    .line 126
    iget-object v2, p0, Landroidx/camera/core/AutoValue_SurfaceRequest_TransformationInfo;->getSensorToBufferTransform:Landroid/graphics/Matrix;

    invoke-virtual {v2}, Landroid/graphics/Matrix;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    .line 127
    mul-int/2addr v0, v1

    .line 128
    iget-boolean v1, p0, Landroidx/camera/core/AutoValue_SurfaceRequest_TransformationInfo;->getMirroring:Z

    if-eqz v1, :cond_1

    goto :goto_1

    :cond_1
    move v3, v4

    :goto_1
    xor-int/2addr v0, v3

    .line 129
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 87
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "TransformationInfo{getCropRect="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/AutoValue_SurfaceRequest_TransformationInfo;->getCropRect:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", getRotationDegrees="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/core/AutoValue_SurfaceRequest_TransformationInfo;->getRotationDegrees:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", getTargetRotation="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/core/AutoValue_SurfaceRequest_TransformationInfo;->getTargetRotation:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", hasCameraTransform="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Landroidx/camera/core/AutoValue_SurfaceRequest_TransformationInfo;->hasCameraTransform:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", getSensorToBufferTransform="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/AutoValue_SurfaceRequest_TransformationInfo;->getSensorToBufferTransform:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", getMirroring="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Landroidx/camera/core/AutoValue_SurfaceRequest_TransformationInfo;->getMirroring:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
