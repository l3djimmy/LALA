.class final Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_FeatureSettings;
.super Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;
.source "AutoValue_SupportedSurfaceCombination_FeatureSettings.java"


# instance fields
.field private final cameraMode:I

.field private final requiredMaxBitDepth:I


# direct methods
.method constructor <init>(II)V
    .locals 0
    .param p1, "cameraMode"    # I
    .param p2, "requiredMaxBitDepth"    # I

    .line 16
    invoke-direct {p0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;-><init>()V

    .line 17
    iput p1, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_FeatureSettings;->cameraMode:I

    .line 18
    iput p2, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_FeatureSettings;->requiredMaxBitDepth:I

    .line 19
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 43
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    .line 44
    return v0

    .line 46
    :cond_0
    instance-of v1, p1, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 47
    move-object v1, p1

    check-cast v1, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;

    .line 48
    .local v1, "that":Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;
    iget v3, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_FeatureSettings;->cameraMode:I

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->getCameraMode()I

    move-result v4

    if-ne v3, v4, :cond_1

    iget v3, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_FeatureSettings;->requiredMaxBitDepth:I

    .line 49
    invoke-virtual {v1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->getRequiredMaxBitDepth()I

    move-result v4

    if-ne v3, v4, :cond_1

    goto :goto_0

    :cond_1
    move v0, v2

    .line 48
    :goto_0
    return v0

    .line 51
    .end local v1    # "that":Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;
    :cond_2
    return v2
.end method

.method getCameraMode()I
    .locals 1

    .line 24
    iget v0, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_FeatureSettings;->cameraMode:I

    return v0
.end method

.method getRequiredMaxBitDepth()I
    .locals 1

    .line 30
    iget v0, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_FeatureSettings;->requiredMaxBitDepth:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    .line 56
    const/4 v0, 0x1

    .line 57
    .local v0, "h$":I
    const v1, 0xf4243

    mul-int/2addr v0, v1

    .line 58
    iget v2, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_FeatureSettings;->cameraMode:I

    xor-int/2addr v0, v2

    .line 59
    mul-int/2addr v0, v1

    .line 60
    iget v1, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_FeatureSettings;->requiredMaxBitDepth:I

    xor-int/2addr v0, v1

    .line 61
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 35
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "FeatureSettings{cameraMode="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_FeatureSettings;->cameraMode:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", requiredMaxBitDepth="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/camera2/internal/AutoValue_SupportedSurfaceCombination_FeatureSettings;->requiredMaxBitDepth:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
