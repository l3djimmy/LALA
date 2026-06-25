.class public final Landroidx/camera/video/RecorderVideoCapabilities;
.super Ljava/lang/Object;
.source "RecorderVideoCapabilities.java"

# interfaces
.implements Landroidx/camera/video/VideoCapabilities;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "RecorderVideoCapabilities"


# instance fields
.field private final mCapabilitiesMapForFullySpecifiedDynamicRange:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroidx/camera/core/DynamicRange;",
            "Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;",
            ">;"
        }
    .end annotation
.end field

.field private final mCapabilitiesMapForNonFullySpecifiedDynamicRange:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroidx/camera/core/DynamicRange;",
            "Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;",
            ">;"
        }
    .end annotation
.end field

.field private final mProfilesProvider:Landroidx/camera/core/impl/EncoderProfilesProvider;


# direct methods
.method constructor <init>(Landroidx/camera/core/impl/CameraInfoInternal;Landroidx/arch/core/util/Function;)V
    .locals 8
    .param p1, "cameraInfoInternal"    # Landroidx/camera/core/impl/CameraInfoInternal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/CameraInfoInternal;",
            "Landroidx/arch/core/util/Function<",
            "Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;",
            "Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;",
            ">;)V"
        }
    .end annotation

    .line 100
    .local p2, "backupVideoProfileValidator":Landroidx/arch/core/util/Function;, "Landroidx/arch/core/util/Function<Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/camera/video/RecorderVideoCapabilities;->mCapabilitiesMapForFullySpecifiedDynamicRange:Ljava/util/Map;

    .line 86
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/camera/video/RecorderVideoCapabilities;->mCapabilitiesMapForNonFullySpecifiedDynamicRange:Ljava/util/Map;

    .line 101
    nop

    .line 102
    invoke-interface {p1}, Landroidx/camera/core/impl/CameraInfoInternal;->getEncoderProfilesProvider()Landroidx/camera/core/impl/EncoderProfilesProvider;

    move-result-object v0

    .line 105
    .local v0, "encoderProfilesProvider":Landroidx/camera/core/impl/EncoderProfilesProvider;
    invoke-static {p1}, Landroidx/camera/video/RecorderVideoCapabilities;->isHlg10SupportedByCamera(Landroidx/camera/core/impl/CameraInfoInternal;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 106
    new-instance v1, Landroidx/camera/video/internal/BackupHdrProfileEncoderProfilesProvider;

    invoke-direct {v1, v0, p2}, Landroidx/camera/video/internal/BackupHdrProfileEncoderProfilesProvider;-><init>(Landroidx/camera/core/impl/EncoderProfilesProvider;Landroidx/arch/core/util/Function;)V

    move-object v0, v1

    .line 111
    :cond_0
    invoke-interface {p1}, Landroidx/camera/core/impl/CameraInfoInternal;->getCameraQuirks()Landroidx/camera/core/impl/Quirks;

    move-result-object v1

    .line 112
    .local v1, "cameraQuirks":Landroidx/camera/core/impl/Quirks;
    new-instance v2, Landroidx/camera/core/impl/ResolutionValidatedEncoderProfilesProvider;

    invoke-direct {v2, v0, v1}, Landroidx/camera/core/impl/ResolutionValidatedEncoderProfilesProvider;-><init>(Landroidx/camera/core/impl/EncoderProfilesProvider;Landroidx/camera/core/impl/Quirks;)V

    .line 116
    .end local v0    # "encoderProfilesProvider":Landroidx/camera/core/impl/EncoderProfilesProvider;
    .local v2, "encoderProfilesProvider":Landroidx/camera/core/impl/EncoderProfilesProvider;
    invoke-static {}, Landroidx/camera/video/internal/compat/quirk/DeviceQuirks;->getAll()Landroidx/camera/core/impl/Quirks;

    move-result-object v0

    .line 117
    .local v0, "deviceQuirks":Landroidx/camera/core/impl/Quirks;
    new-instance v3, Landroidx/camera/video/internal/workaround/QualityValidatedEncoderProfilesProvider;

    invoke-direct {v3, v2, p1, v0}, Landroidx/camera/video/internal/workaround/QualityValidatedEncoderProfilesProvider;-><init>(Landroidx/camera/core/impl/EncoderProfilesProvider;Landroidx/camera/core/impl/CameraInfoInternal;Landroidx/camera/core/impl/Quirks;)V

    .line 119
    .end local v2    # "encoderProfilesProvider":Landroidx/camera/core/impl/EncoderProfilesProvider;
    .local v3, "encoderProfilesProvider":Landroidx/camera/core/impl/EncoderProfilesProvider;
    iput-object v3, p0, Landroidx/camera/video/RecorderVideoCapabilities;->mProfilesProvider:Landroidx/camera/core/impl/EncoderProfilesProvider;

    .line 122
    invoke-interface {p1}, Landroidx/camera/core/impl/CameraInfoInternal;->getSupportedDynamicRanges()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/core/DynamicRange;

    .line 125
    .local v4, "dynamicRange":Landroidx/camera/core/DynamicRange;
    new-instance v5, Landroidx/camera/video/internal/DynamicRangeMatchedEncoderProfilesProvider;

    iget-object v6, p0, Landroidx/camera/video/RecorderVideoCapabilities;->mProfilesProvider:Landroidx/camera/core/impl/EncoderProfilesProvider;

    invoke-direct {v5, v6, v4}, Landroidx/camera/video/internal/DynamicRangeMatchedEncoderProfilesProvider;-><init>(Landroidx/camera/core/impl/EncoderProfilesProvider;Landroidx/camera/core/DynamicRange;)V

    .line 127
    .local v5, "constrainedProvider":Landroidx/camera/core/impl/EncoderProfilesProvider;
    new-instance v6, Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;

    invoke-direct {v6, v5}, Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;-><init>(Landroidx/camera/core/impl/EncoderProfilesProvider;)V

    .line 129
    .local v6, "capabilities":Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;
    invoke-virtual {v6}, Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;->getSupportedQualities()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_1

    .line 130
    iget-object v7, p0, Landroidx/camera/video/RecorderVideoCapabilities;->mCapabilitiesMapForFullySpecifiedDynamicRange:Ljava/util/Map;

    invoke-interface {v7, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    .end local v4    # "dynamicRange":Landroidx/camera/core/DynamicRange;
    .end local v5    # "constrainedProvider":Landroidx/camera/core/impl/EncoderProfilesProvider;
    .end local v6    # "capabilities":Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;
    :cond_1
    goto :goto_0

    .line 133
    :cond_2
    return-void
.end method

.method private static canMatchBitDepth(Landroidx/camera/core/DynamicRange;Landroidx/camera/core/DynamicRange;)Z
    .locals 3
    .param p0, "dynamicRangeToTest"    # Landroidx/camera/core/DynamicRange;
    .param p1, "fullySpecifiedDynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 266
    invoke-static {p1}, Landroidx/camera/video/RecorderVideoCapabilities;->isFullySpecified(Landroidx/camera/core/DynamicRange;)Z

    move-result v0

    const-string v1, "Fully specified range is not actually fully specified."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 268
    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->getBitDepth()I

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 269
    return v1

    .line 272
    :cond_0
    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->getBitDepth()I

    move-result v0

    invoke-virtual {p1}, Landroidx/camera/core/DynamicRange;->getBitDepth()I

    move-result v2

    if-ne v0, v2, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method private static canMatchEncoding(Landroidx/camera/core/DynamicRange;Landroidx/camera/core/DynamicRange;)Z
    .locals 4
    .param p0, "dynamicRangeToTest"    # Landroidx/camera/core/DynamicRange;
    .param p1, "fullySpecifiedDynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 277
    invoke-static {p1}, Landroidx/camera/video/RecorderVideoCapabilities;->isFullySpecified(Landroidx/camera/core/DynamicRange;)Z

    move-result v0

    const-string v1, "Fully specified range is not actually fully specified."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 279
    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->getEncoding()I

    move-result v0

    .line 280
    .local v0, "encodingToTest":I
    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 281
    return v1

    .line 284
    :cond_0
    invoke-virtual {p1}, Landroidx/camera/core/DynamicRange;->getEncoding()I

    move-result v2

    .line 285
    .local v2, "fullySpecifiedEncoding":I
    const/4 v3, 0x2

    if-ne v0, v3, :cond_1

    if-eq v2, v1, :cond_1

    .line 286
    return v1

    .line 289
    :cond_1
    if-ne v0, v2, :cond_2

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method private static canResolve(Landroidx/camera/core/DynamicRange;Ljava/util/Set;)Z
    .locals 3
    .param p0, "dynamicRangeToTest"    # Landroidx/camera/core/DynamicRange;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/DynamicRange;",
            "Ljava/util/Set<",
            "Landroidx/camera/core/DynamicRange;",
            ">;)Z"
        }
    .end annotation

    .line 250
    .local p1, "fullySpecifiedDynamicRanges":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    invoke-static {p0}, Landroidx/camera/video/RecorderVideoCapabilities;->isFullySpecified(Landroidx/camera/core/DynamicRange;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 251
    invoke-interface {p1, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0

    .line 253
    :cond_0
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/DynamicRange;

    .line 254
    .local v1, "fullySpecifiedDynamicRange":Landroidx/camera/core/DynamicRange;
    invoke-static {p0, v1}, Landroidx/camera/video/RecorderVideoCapabilities;->canMatchBitDepth(Landroidx/camera/core/DynamicRange;Landroidx/camera/core/DynamicRange;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 255
    invoke-static {p0, v1}, Landroidx/camera/video/RecorderVideoCapabilities;->canMatchEncoding(Landroidx/camera/core/DynamicRange;Landroidx/camera/core/DynamicRange;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 256
    const/4 v0, 0x1

    return v0

    .line 258
    .end local v1    # "fullySpecifiedDynamicRange":Landroidx/camera/core/DynamicRange;
    :cond_1
    goto :goto_0

    .line 260
    :cond_2
    const/4 v0, 0x0

    return v0
.end method

.method static from(Landroidx/camera/core/CameraInfo;)Landroidx/camera/video/RecorderVideoCapabilities;
    .locals 3
    .param p0, "cameraInfo"    # Landroidx/camera/core/CameraInfo;

    .line 146
    new-instance v0, Landroidx/camera/video/RecorderVideoCapabilities;

    move-object v1, p0

    check-cast v1, Landroidx/camera/core/impl/CameraInfoInternal;

    sget-object v2, Landroidx/camera/video/internal/BackupHdrProfileEncoderProfilesProvider;->DEFAULT_VALIDATOR:Landroidx/arch/core/util/Function;

    invoke-direct {v0, v1, v2}, Landroidx/camera/video/RecorderVideoCapabilities;-><init>(Landroidx/camera/core/impl/CameraInfoInternal;Landroidx/arch/core/util/Function;)V

    return-object v0
.end method

.method private generateCapabilitiesForNonFullySpecifiedDynamicRange(Landroidx/camera/core/DynamicRange;)Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;
    .locals 2
    .param p1, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 229
    invoke-virtual {p0}, Landroidx/camera/video/RecorderVideoCapabilities;->getSupportedDynamicRanges()Ljava/util/Set;

    move-result-object v0

    invoke-static {p1, v0}, Landroidx/camera/video/RecorderVideoCapabilities;->canResolve(Landroidx/camera/core/DynamicRange;Ljava/util/Set;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 230
    const/4 v0, 0x0

    return-object v0

    .line 235
    :cond_0
    new-instance v0, Landroidx/camera/video/internal/DynamicRangeMatchedEncoderProfilesProvider;

    iget-object v1, p0, Landroidx/camera/video/RecorderVideoCapabilities;->mProfilesProvider:Landroidx/camera/core/impl/EncoderProfilesProvider;

    invoke-direct {v0, v1, p1}, Landroidx/camera/video/internal/DynamicRangeMatchedEncoderProfilesProvider;-><init>(Landroidx/camera/core/impl/EncoderProfilesProvider;Landroidx/camera/core/DynamicRange;)V

    .line 237
    .local v0, "constrainedProvider":Landroidx/camera/core/impl/EncoderProfilesProvider;
    new-instance v1, Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;

    invoke-direct {v1, v0}, Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;-><init>(Landroidx/camera/core/impl/EncoderProfilesProvider;)V

    return-object v1
.end method

.method private getCapabilities(Landroidx/camera/core/DynamicRange;)Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;
    .locals 2
    .param p1, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 197
    invoke-static {p1}, Landroidx/camera/video/RecorderVideoCapabilities;->isFullySpecified(Landroidx/camera/core/DynamicRange;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 198
    iget-object v0, p0, Landroidx/camera/video/RecorderVideoCapabilities;->mCapabilitiesMapForFullySpecifiedDynamicRange:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;

    return-object v0

    .line 202
    :cond_0
    iget-object v0, p0, Landroidx/camera/video/RecorderVideoCapabilities;->mCapabilitiesMapForNonFullySpecifiedDynamicRange:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 203
    iget-object v0, p0, Landroidx/camera/video/RecorderVideoCapabilities;->mCapabilitiesMapForNonFullySpecifiedDynamicRange:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;

    return-object v0

    .line 205
    :cond_1
    nop

    .line 206
    invoke-direct {p0, p1}, Landroidx/camera/video/RecorderVideoCapabilities;->generateCapabilitiesForNonFullySpecifiedDynamicRange(Landroidx/camera/core/DynamicRange;)Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;

    move-result-object v0

    .line 207
    .local v0, "capabilities":Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;
    iget-object v1, p0, Landroidx/camera/video/RecorderVideoCapabilities;->mCapabilitiesMapForNonFullySpecifiedDynamicRange:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    return-object v0
.end method

.method private static isFullySpecified(Landroidx/camera/core/DynamicRange;)Z
    .locals 2
    .param p0, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 293
    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->getEncoding()I

    move-result v0

    if-eqz v0, :cond_0

    .line 294
    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->getEncoding()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    .line 295
    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->getBitDepth()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 293
    :goto_0
    return v0
.end method

.method private static isHlg10SupportedByCamera(Landroidx/camera/core/impl/CameraInfoInternal;)Z
    .locals 6
    .param p0, "cameraInfoInternal"    # Landroidx/camera/core/impl/CameraInfoInternal;

    .line 214
    invoke-interface {p0}, Landroidx/camera/core/impl/CameraInfoInternal;->getSupportedDynamicRanges()Ljava/util/Set;

    move-result-object v0

    .line 215
    .local v0, "dynamicRanges":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/DynamicRange;

    .line 216
    .local v2, "dynamicRange":Landroidx/camera/core/DynamicRange;
    invoke-virtual {v2}, Landroidx/camera/core/DynamicRange;->getEncoding()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 217
    .local v3, "encoding":Ljava/lang/Integer;
    invoke-virtual {v2}, Landroidx/camera/core/DynamicRange;->getBitDepth()I

    move-result v4

    .line 218
    .local v4, "bitDepth":I
    const/4 v5, 0x3

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/16 v5, 0xa

    if-ne v4, v5, :cond_0

    .line 219
    const/4 v1, 0x1

    return v1

    .line 221
    .end local v2    # "dynamicRange":Landroidx/camera/core/DynamicRange;
    .end local v3    # "encoding":Ljava/lang/Integer;
    .end local v4    # "bitDepth":I
    :cond_0
    goto :goto_0

    .line 223
    :cond_1
    const/4 v1, 0x0

    return v1
.end method


# virtual methods
.method public findHighestSupportedEncoderProfilesFor(Landroid/util/Size;Landroidx/camera/core/DynamicRange;)Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;
    .locals 2
    .param p1, "size"    # Landroid/util/Size;
    .param p2, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 181
    invoke-direct {p0, p2}, Landroidx/camera/video/RecorderVideoCapabilities;->getCapabilities(Landroidx/camera/core/DynamicRange;)Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;

    move-result-object v0

    .line 182
    .local v0, "capabilities":Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0, p1}, Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;->findHighestSupportedEncoderProfilesFor(Landroid/util/Size;)Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    move-result-object v1

    :goto_0
    return-object v1
.end method

.method public findHighestSupportedQualityFor(Landroid/util/Size;Landroidx/camera/core/DynamicRange;)Landroidx/camera/video/Quality;
    .locals 2
    .param p1, "size"    # Landroid/util/Size;
    .param p2, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 190
    invoke-direct {p0, p2}, Landroidx/camera/video/RecorderVideoCapabilities;->getCapabilities(Landroidx/camera/core/DynamicRange;)Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;

    move-result-object v0

    .line 191
    .local v0, "capabilities":Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;
    if-nez v0, :cond_0

    sget-object v1, Landroidx/camera/video/Quality;->NONE:Landroidx/camera/video/Quality;

    goto :goto_0

    :cond_0
    invoke-virtual {v0, p1}, Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;->findHighestSupportedQualityFor(Landroid/util/Size;)Landroidx/camera/video/Quality;

    move-result-object v1

    :goto_0
    return-object v1
.end method

.method public getProfiles(Landroidx/camera/video/Quality;Landroidx/camera/core/DynamicRange;)Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;
    .locals 2
    .param p1, "quality"    # Landroidx/camera/video/Quality;
    .param p2, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 173
    invoke-direct {p0, p2}, Landroidx/camera/video/RecorderVideoCapabilities;->getCapabilities(Landroidx/camera/core/DynamicRange;)Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;

    move-result-object v0

    .line 174
    .local v0, "capabilities":Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0, p1}, Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;->getProfiles(Landroidx/camera/video/Quality;)Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    move-result-object v1

    :goto_0
    return-object v1
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

    .line 152
    iget-object v0, p0, Landroidx/camera/video/RecorderVideoCapabilities;->mCapabilitiesMapForFullySpecifiedDynamicRange:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getSupportedQualities(Landroidx/camera/core/DynamicRange;)Ljava/util/List;
    .locals 2
    .param p1, "dynamicRange"    # Landroidx/camera/core/DynamicRange;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/DynamicRange;",
            ")",
            "Ljava/util/List<",
            "Landroidx/camera/video/Quality;",
            ">;"
        }
    .end annotation

    .line 158
    invoke-direct {p0, p1}, Landroidx/camera/video/RecorderVideoCapabilities;->getCapabilities(Landroidx/camera/core/DynamicRange;)Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;

    move-result-object v0

    .line 159
    .local v0, "capabilities":Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;
    if-nez v0, :cond_0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;->getSupportedQualities()Ljava/util/List;

    move-result-object v1

    :goto_0
    return-object v1
.end method

.method public isQualitySupported(Landroidx/camera/video/Quality;Landroidx/camera/core/DynamicRange;)Z
    .locals 2
    .param p1, "quality"    # Landroidx/camera/video/Quality;
    .param p2, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 165
    invoke-direct {p0, p2}, Landroidx/camera/video/RecorderVideoCapabilities;->getCapabilities(Landroidx/camera/core/DynamicRange;)Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;

    move-result-object v0

    .line 166
    .local v0, "capabilities":Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;
    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;->isQualitySupported(Landroidx/camera/video/Quality;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method
