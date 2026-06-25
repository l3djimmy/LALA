.class final Landroidx/camera/core/processing/AutoValue_Packet;
.super Landroidx/camera/core/processing/Packet;
.source "AutoValue_Packet.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Landroidx/camera/core/processing/Packet<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final cameraCaptureResult:Landroidx/camera/core/impl/CameraCaptureResult;

.field private final cropRect:Landroid/graphics/Rect;

.field private final data:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final exif:Landroidx/camera/core/impl/utils/Exif;

.field private final format:I

.field private final rotationDegrees:I

.field private final sensorToBufferTransform:Landroid/graphics/Matrix;

.field private final size:Landroid/util/Size;


# direct methods
.method constructor <init>(Ljava/lang/Object;Landroidx/camera/core/impl/utils/Exif;ILandroid/util/Size;Landroid/graphics/Rect;ILandroid/graphics/Matrix;Landroidx/camera/core/impl/CameraCaptureResult;)V
    .locals 2
    .param p2, "exif"    # Landroidx/camera/core/impl/utils/Exif;
    .param p3, "format"    # I
    .param p4, "size"    # Landroid/util/Size;
    .param p5, "cropRect"    # Landroid/graphics/Rect;
    .param p6, "rotationDegrees"    # I
    .param p7, "sensorToBufferTransform"    # Landroid/graphics/Matrix;
    .param p8, "cameraCaptureResult"    # Landroidx/camera/core/impl/CameraCaptureResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Landroidx/camera/core/impl/utils/Exif;",
            "I",
            "Landroid/util/Size;",
            "Landroid/graphics/Rect;",
            "I",
            "Landroid/graphics/Matrix;",
            "Landroidx/camera/core/impl/CameraCaptureResult;",
            ")V"
        }
    .end annotation

    .line 40
    .local p0, "this":Landroidx/camera/core/processing/AutoValue_Packet;, "Landroidx/camera/core/processing/AutoValue_Packet<TT;>;"
    .local p1, "data":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Landroidx/camera/core/processing/Packet;-><init>()V

    .line 41
    if-eqz p1, :cond_4

    .line 44
    iput-object p1, p0, Landroidx/camera/core/processing/AutoValue_Packet;->data:Ljava/lang/Object;

    .line 45
    iput-object p2, p0, Landroidx/camera/core/processing/AutoValue_Packet;->exif:Landroidx/camera/core/impl/utils/Exif;

    .line 46
    iput p3, p0, Landroidx/camera/core/processing/AutoValue_Packet;->format:I

    .line 47
    if-eqz p4, :cond_3

    .line 50
    iput-object p4, p0, Landroidx/camera/core/processing/AutoValue_Packet;->size:Landroid/util/Size;

    .line 51
    if-eqz p5, :cond_2

    .line 54
    iput-object p5, p0, Landroidx/camera/core/processing/AutoValue_Packet;->cropRect:Landroid/graphics/Rect;

    .line 55
    iput p6, p0, Landroidx/camera/core/processing/AutoValue_Packet;->rotationDegrees:I

    .line 56
    if-eqz p7, :cond_1

    .line 59
    iput-object p7, p0, Landroidx/camera/core/processing/AutoValue_Packet;->sensorToBufferTransform:Landroid/graphics/Matrix;

    .line 60
    if-eqz p8, :cond_0

    .line 63
    iput-object p8, p0, Landroidx/camera/core/processing/AutoValue_Packet;->cameraCaptureResult:Landroidx/camera/core/impl/CameraCaptureResult;

    .line 64
    return-void

    .line 61
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null cameraCaptureResult"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 57
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null sensorToBufferTransform"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 52
    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null cropRect"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 48
    :cond_3
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null size"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 42
    :cond_4
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null data"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 128
    .local p0, "this":Landroidx/camera/core/processing/AutoValue_Packet;, "Landroidx/camera/core/processing/AutoValue_Packet<TT;>;"
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    .line 129
    return v0

    .line 131
    :cond_0
    instance-of v1, p1, Landroidx/camera/core/processing/Packet;

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    .line 132
    move-object v1, p1

    check-cast v1, Landroidx/camera/core/processing/Packet;

    .line 133
    .local v1, "that":Landroidx/camera/core/processing/Packet;, "Landroidx/camera/core/processing/Packet<*>;"
    iget-object v3, p0, Landroidx/camera/core/processing/AutoValue_Packet;->data:Ljava/lang/Object;

    invoke-virtual {v1}, Landroidx/camera/core/processing/Packet;->getData()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Landroidx/camera/core/processing/AutoValue_Packet;->exif:Landroidx/camera/core/impl/utils/Exif;

    if-nez v3, :cond_1

    .line 134
    invoke-virtual {v1}, Landroidx/camera/core/processing/Packet;->getExif()Landroidx/camera/core/impl/utils/Exif;

    move-result-object v3

    if-nez v3, :cond_2

    goto :goto_0

    :cond_1
    iget-object v3, p0, Landroidx/camera/core/processing/AutoValue_Packet;->exif:Landroidx/camera/core/impl/utils/Exif;

    invoke-virtual {v1}, Landroidx/camera/core/processing/Packet;->getExif()Landroidx/camera/core/impl/utils/Exif;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    :goto_0
    iget v3, p0, Landroidx/camera/core/processing/AutoValue_Packet;->format:I

    .line 135
    invoke-virtual {v1}, Landroidx/camera/core/processing/Packet;->getFormat()I

    move-result v4

    if-ne v3, v4, :cond_2

    iget-object v3, p0, Landroidx/camera/core/processing/AutoValue_Packet;->size:Landroid/util/Size;

    .line 136
    invoke-virtual {v1}, Landroidx/camera/core/processing/Packet;->getSize()Landroid/util/Size;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/util/Size;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Landroidx/camera/core/processing/AutoValue_Packet;->cropRect:Landroid/graphics/Rect;

    .line 137
    invoke-virtual {v1}, Landroidx/camera/core/processing/Packet;->getCropRect()Landroid/graphics/Rect;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget v3, p0, Landroidx/camera/core/processing/AutoValue_Packet;->rotationDegrees:I

    .line 138
    invoke-virtual {v1}, Landroidx/camera/core/processing/Packet;->getRotationDegrees()I

    move-result v4

    if-ne v3, v4, :cond_2

    iget-object v3, p0, Landroidx/camera/core/processing/AutoValue_Packet;->sensorToBufferTransform:Landroid/graphics/Matrix;

    .line 139
    invoke-virtual {v1}, Landroidx/camera/core/processing/Packet;->getSensorToBufferTransform()Landroid/graphics/Matrix;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/graphics/Matrix;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Landroidx/camera/core/processing/AutoValue_Packet;->cameraCaptureResult:Landroidx/camera/core/impl/CameraCaptureResult;

    .line 140
    invoke-virtual {v1}, Landroidx/camera/core/processing/Packet;->getCameraCaptureResult()Landroidx/camera/core/impl/CameraCaptureResult;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_1

    :cond_2
    move v0, v2

    .line 133
    :goto_1
    return v0

    .line 142
    .end local v1    # "that":Landroidx/camera/core/processing/Packet;, "Landroidx/camera/core/processing/Packet<*>;"
    :cond_3
    return v2
.end method

.method public getCameraCaptureResult()Landroidx/camera/core/impl/CameraCaptureResult;
    .locals 1

    .line 109
    .local p0, "this":Landroidx/camera/core/processing/AutoValue_Packet;, "Landroidx/camera/core/processing/AutoValue_Packet<TT;>;"
    iget-object v0, p0, Landroidx/camera/core/processing/AutoValue_Packet;->cameraCaptureResult:Landroidx/camera/core/impl/CameraCaptureResult;

    return-object v0
.end method

.method public getCropRect()Landroid/graphics/Rect;
    .locals 1

    .line 92
    .local p0, "this":Landroidx/camera/core/processing/AutoValue_Packet;, "Landroidx/camera/core/processing/AutoValue_Packet<TT;>;"
    iget-object v0, p0, Landroidx/camera/core/processing/AutoValue_Packet;->cropRect:Landroid/graphics/Rect;

    return-object v0
.end method

.method public getData()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 69
    .local p0, "this":Landroidx/camera/core/processing/AutoValue_Packet;, "Landroidx/camera/core/processing/AutoValue_Packet<TT;>;"
    iget-object v0, p0, Landroidx/camera/core/processing/AutoValue_Packet;->data:Ljava/lang/Object;

    return-object v0
.end method

.method public getExif()Landroidx/camera/core/impl/utils/Exif;
    .locals 1

    .line 75
    .local p0, "this":Landroidx/camera/core/processing/AutoValue_Packet;, "Landroidx/camera/core/processing/AutoValue_Packet<TT;>;"
    iget-object v0, p0, Landroidx/camera/core/processing/AutoValue_Packet;->exif:Landroidx/camera/core/impl/utils/Exif;

    return-object v0
.end method

.method public getFormat()I
    .locals 1

    .line 80
    .local p0, "this":Landroidx/camera/core/processing/AutoValue_Packet;, "Landroidx/camera/core/processing/AutoValue_Packet<TT;>;"
    iget v0, p0, Landroidx/camera/core/processing/AutoValue_Packet;->format:I

    return v0
.end method

.method public getRotationDegrees()I
    .locals 1

    .line 97
    .local p0, "this":Landroidx/camera/core/processing/AutoValue_Packet;, "Landroidx/camera/core/processing/AutoValue_Packet<TT;>;"
    iget v0, p0, Landroidx/camera/core/processing/AutoValue_Packet;->rotationDegrees:I

    return v0
.end method

.method public getSensorToBufferTransform()Landroid/graphics/Matrix;
    .locals 1

    .line 103
    .local p0, "this":Landroidx/camera/core/processing/AutoValue_Packet;, "Landroidx/camera/core/processing/AutoValue_Packet<TT;>;"
    iget-object v0, p0, Landroidx/camera/core/processing/AutoValue_Packet;->sensorToBufferTransform:Landroid/graphics/Matrix;

    return-object v0
.end method

.method public getSize()Landroid/util/Size;
    .locals 1

    .line 86
    .local p0, "this":Landroidx/camera/core/processing/AutoValue_Packet;, "Landroidx/camera/core/processing/AutoValue_Packet<TT;>;"
    iget-object v0, p0, Landroidx/camera/core/processing/AutoValue_Packet;->size:Landroid/util/Size;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .line 147
    .local p0, "this":Landroidx/camera/core/processing/AutoValue_Packet;, "Landroidx/camera/core/processing/AutoValue_Packet<TT;>;"
    const/4 v0, 0x1

    .line 148
    .local v0, "h$":I
    const v1, 0xf4243

    mul-int/2addr v0, v1

    .line 149
    iget-object v2, p0, Landroidx/camera/core/processing/AutoValue_Packet;->data:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    .line 150
    mul-int/2addr v0, v1

    .line 151
    iget-object v2, p0, Landroidx/camera/core/processing/AutoValue_Packet;->exif:Landroidx/camera/core/impl/utils/Exif;

    if-nez v2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    iget-object v2, p0, Landroidx/camera/core/processing/AutoValue_Packet;->exif:Landroidx/camera/core/impl/utils/Exif;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :goto_0
    xor-int/2addr v0, v2

    .line 152
    mul-int/2addr v0, v1

    .line 153
    iget v2, p0, Landroidx/camera/core/processing/AutoValue_Packet;->format:I

    xor-int/2addr v0, v2

    .line 154
    mul-int/2addr v0, v1

    .line 155
    iget-object v2, p0, Landroidx/camera/core/processing/AutoValue_Packet;->size:Landroid/util/Size;

    invoke-virtual {v2}, Landroid/util/Size;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    .line 156
    mul-int/2addr v0, v1

    .line 157
    iget-object v2, p0, Landroidx/camera/core/processing/AutoValue_Packet;->cropRect:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    .line 158
    mul-int/2addr v0, v1

    .line 159
    iget v2, p0, Landroidx/camera/core/processing/AutoValue_Packet;->rotationDegrees:I

    xor-int/2addr v0, v2

    .line 160
    mul-int/2addr v0, v1

    .line 161
    iget-object v2, p0, Landroidx/camera/core/processing/AutoValue_Packet;->sensorToBufferTransform:Landroid/graphics/Matrix;

    invoke-virtual {v2}, Landroid/graphics/Matrix;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    .line 162
    mul-int/2addr v0, v1

    .line 163
    iget-object v1, p0, Landroidx/camera/core/processing/AutoValue_Packet;->cameraCaptureResult:Landroidx/camera/core/impl/CameraCaptureResult;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    .line 164
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 114
    .local p0, "this":Landroidx/camera/core/processing/AutoValue_Packet;, "Landroidx/camera/core/processing/AutoValue_Packet<TT;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Packet{data="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/processing/AutoValue_Packet;->data:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", exif="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/processing/AutoValue_Packet;->exif:Landroidx/camera/core/impl/utils/Exif;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", format="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/core/processing/AutoValue_Packet;->format:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", size="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/processing/AutoValue_Packet;->size:Landroid/util/Size;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", cropRect="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/processing/AutoValue_Packet;->cropRect:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", rotationDegrees="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/core/processing/AutoValue_Packet;->rotationDegrees:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", sensorToBufferTransform="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/processing/AutoValue_Packet;->sensorToBufferTransform:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", cameraCaptureResult="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/processing/AutoValue_Packet;->cameraCaptureResult:Landroidx/camera/core/impl/CameraCaptureResult;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
