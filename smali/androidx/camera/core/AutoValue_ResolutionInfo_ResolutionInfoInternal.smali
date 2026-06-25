.class final Landroidx/camera/core/AutoValue_ResolutionInfo_ResolutionInfoInternal;
.super Landroidx/camera/core/ResolutionInfo$ResolutionInfoInternal;
.source "AutoValue_ResolutionInfo_ResolutionInfoInternal.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/AutoValue_ResolutionInfo_ResolutionInfoInternal$Builder;
    }
.end annotation


# instance fields
.field private final cropRect:Landroid/graphics/Rect;

.field private final resolution:Landroid/util/Size;

.field private final rotationDegrees:I


# direct methods
.method private constructor <init>(Landroid/util/Size;Landroid/graphics/Rect;I)V
    .locals 0
    .param p1, "resolution"    # Landroid/util/Size;
    .param p2, "cropRect"    # Landroid/graphics/Rect;
    .param p3, "rotationDegrees"    # I

    .line 22
    invoke-direct {p0}, Landroidx/camera/core/ResolutionInfo$ResolutionInfoInternal;-><init>()V

    .line 23
    iput-object p1, p0, Landroidx/camera/core/AutoValue_ResolutionInfo_ResolutionInfoInternal;->resolution:Landroid/util/Size;

    .line 24
    iput-object p2, p0, Landroidx/camera/core/AutoValue_ResolutionInfo_ResolutionInfoInternal;->cropRect:Landroid/graphics/Rect;

    .line 25
    iput p3, p0, Landroidx/camera/core/AutoValue_ResolutionInfo_ResolutionInfoInternal;->rotationDegrees:I

    .line 26
    return-void
.end method

.method synthetic constructor <init>(Landroid/util/Size;Landroid/graphics/Rect;ILandroidx/camera/core/AutoValue_ResolutionInfo_ResolutionInfoInternal$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/util/Size;
    .param p2, "x1"    # Landroid/graphics/Rect;
    .param p3, "x2"    # I
    .param p4, "x3"    # Landroidx/camera/core/AutoValue_ResolutionInfo_ResolutionInfoInternal$1;

    .line 11
    invoke-direct {p0, p1, p2, p3}, Landroidx/camera/core/AutoValue_ResolutionInfo_ResolutionInfoInternal;-><init>(Landroid/util/Size;Landroid/graphics/Rect;I)V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 57
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    .line 58
    return v0

    .line 60
    :cond_0
    instance-of v1, p1, Landroidx/camera/core/ResolutionInfo$ResolutionInfoInternal;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 61
    move-object v1, p1

    check-cast v1, Landroidx/camera/core/ResolutionInfo$ResolutionInfoInternal;

    .line 62
    .local v1, "that":Landroidx/camera/core/ResolutionInfo$ResolutionInfoInternal;
    iget-object v3, p0, Landroidx/camera/core/AutoValue_ResolutionInfo_ResolutionInfoInternal;->resolution:Landroid/util/Size;

    invoke-virtual {v1}, Landroidx/camera/core/ResolutionInfo$ResolutionInfoInternal;->getResolution()Landroid/util/Size;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/util/Size;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, p0, Landroidx/camera/core/AutoValue_ResolutionInfo_ResolutionInfoInternal;->cropRect:Landroid/graphics/Rect;

    .line 63
    invoke-virtual {v1}, Landroidx/camera/core/ResolutionInfo$ResolutionInfoInternal;->getCropRect()Landroid/graphics/Rect;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget v3, p0, Landroidx/camera/core/AutoValue_ResolutionInfo_ResolutionInfoInternal;->rotationDegrees:I

    .line 64
    invoke-virtual {v1}, Landroidx/camera/core/ResolutionInfo$ResolutionInfoInternal;->getRotationDegrees()I

    move-result v4

    if-ne v3, v4, :cond_1

    goto :goto_0

    :cond_1
    move v0, v2

    .line 62
    :goto_0
    return v0

    .line 66
    .end local v1    # "that":Landroidx/camera/core/ResolutionInfo$ResolutionInfoInternal;
    :cond_2
    return v2
.end method

.method getCropRect()Landroid/graphics/Rect;
    .locals 1

    .line 37
    iget-object v0, p0, Landroidx/camera/core/AutoValue_ResolutionInfo_ResolutionInfoInternal;->cropRect:Landroid/graphics/Rect;

    return-object v0
.end method

.method getResolution()Landroid/util/Size;
    .locals 1

    .line 31
    iget-object v0, p0, Landroidx/camera/core/AutoValue_ResolutionInfo_ResolutionInfoInternal;->resolution:Landroid/util/Size;

    return-object v0
.end method

.method getRotationDegrees()I
    .locals 1

    .line 43
    iget v0, p0, Landroidx/camera/core/AutoValue_ResolutionInfo_ResolutionInfoInternal;->rotationDegrees:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    .line 71
    const/4 v0, 0x1

    .line 72
    .local v0, "h$":I
    const v1, 0xf4243

    mul-int/2addr v0, v1

    .line 73
    iget-object v2, p0, Landroidx/camera/core/AutoValue_ResolutionInfo_ResolutionInfoInternal;->resolution:Landroid/util/Size;

    invoke-virtual {v2}, Landroid/util/Size;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    .line 74
    mul-int/2addr v0, v1

    .line 75
    iget-object v2, p0, Landroidx/camera/core/AutoValue_ResolutionInfo_ResolutionInfoInternal;->cropRect:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    .line 76
    mul-int/2addr v0, v1

    .line 77
    iget v1, p0, Landroidx/camera/core/AutoValue_ResolutionInfo_ResolutionInfoInternal;->rotationDegrees:I

    xor-int/2addr v0, v1

    .line 78
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 48
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "ResolutionInfoInternal{resolution="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/AutoValue_ResolutionInfo_ResolutionInfoInternal;->resolution:Landroid/util/Size;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", cropRect="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/AutoValue_ResolutionInfo_ResolutionInfoInternal;->cropRect:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", rotationDegrees="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/core/AutoValue_ResolutionInfo_ResolutionInfoInternal;->rotationDegrees:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
