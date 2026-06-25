.class final Landroidx/camera/camera2/internal/DynamicRangeResolver;
.super Ljava/lang/Object;
.source "DynamicRangeResolver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/camera2/internal/DynamicRangeResolver$Api33Impl;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "DynamicRangeResolver"


# instance fields
.field private final mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

.field private final mDynamicRangesInfo:Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;

.field private final mIs10BitSupported:Z


# direct methods
.method constructor <init>(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)V
    .locals 6
    .param p1, "characteristics"    # Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    iput-object p1, p0, Landroidx/camera/camera2/internal/DynamicRangeResolver;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 65
    invoke-static {p1}, Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;->fromCameraCharacteristics(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/camera2/internal/DynamicRangeResolver;->mDynamicRangesInfo:Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;

    .line 67
    iget-object v0, p0, Landroidx/camera/camera2/internal/DynamicRangeResolver;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->REQUEST_AVAILABLE_CAPABILITIES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 68
    invoke-virtual {v0, v1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    .line 69
    .local v0, "availableCapabilities":[I
    const/4 v1, 0x0

    .line 70
    .local v1, "is10BitSupported":Z
    if-eqz v0, :cond_1

    .line 71
    array-length v2, v0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget v4, v0, v3

    .line 72
    .local v4, "capability":I
    const/16 v5, 0x12

    if-ne v4, v5, :cond_0

    .line 74
    const/4 v1, 0x1

    .line 75
    goto :goto_1

    .line 71
    .end local v4    # "capability":I
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 79
    :cond_1
    :goto_1
    iput-boolean v1, p0, Landroidx/camera/camera2/internal/DynamicRangeResolver;->mIs10BitSupported:Z

    .line 80
    return-void
.end method

.method private static canResolve(Landroidx/camera/core/DynamicRange;Landroidx/camera/core/DynamicRange;)Z
    .locals 4
    .param p0, "testRange"    # Landroidx/camera/core/DynamicRange;
    .param p1, "fullySpecifiedRange"    # Landroidx/camera/core/DynamicRange;

    .line 479
    invoke-virtual {p1}, Landroidx/camera/core/DynamicRange;->isFullySpecified()Z

    move-result v0

    const-string v1, "Fully specified range is not actually fully specified."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 481
    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->getEncoding()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x2

    if-ne v0, v3, :cond_0

    .line 482
    invoke-virtual {p1}, Landroidx/camera/core/DynamicRange;->getEncoding()I

    move-result v0

    if-ne v0, v1, :cond_0

    .line 483
    return v2

    .line 486
    :cond_0
    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->getEncoding()I

    move-result v0

    if-eq v0, v3, :cond_1

    .line 487
    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->getEncoding()I

    move-result v0

    if-eqz v0, :cond_1

    .line 488
    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->getEncoding()I

    move-result v0

    invoke-virtual {p1}, Landroidx/camera/core/DynamicRange;->getEncoding()I

    move-result v3

    if-eq v0, v3, :cond_1

    .line 489
    return v2

    .line 492
    :cond_1
    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->getBitDepth()I

    move-result v0

    if-eqz v0, :cond_3

    .line 493
    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->getBitDepth()I

    move-result v0

    invoke-virtual {p1}, Landroidx/camera/core/DynamicRange;->getBitDepth()I

    move-result v3

    if-ne v0, v3, :cond_2

    goto :goto_0

    :cond_2
    move v1, v2

    goto :goto_1

    :cond_3
    :goto_0
    nop

    .line 492
    :goto_1
    return v1
.end method

.method private static canResolveWithinConstraints(Landroidx/camera/core/DynamicRange;Landroidx/camera/core/DynamicRange;Ljava/util/Set;)Z
    .locals 2
    .param p0, "rangeToResolve"    # Landroidx/camera/core/DynamicRange;
    .param p1, "candidateRange"    # Landroidx/camera/core/DynamicRange;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/DynamicRange;",
            "Landroidx/camera/core/DynamicRange;",
            "Ljava/util/Set<",
            "Landroidx/camera/core/DynamicRange;",
            ">;)Z"
        }
    .end annotation

    .line 456
    .local p2, "constraints":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    invoke-interface {p2, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 457
    const-string v0, "Candidate Dynamic range is not within constraints.\nDynamic range to resolve:\n  %s\nCandidate dynamic range:\n  %s"

    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "DynamicRangeResolver"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 463
    const/4 v0, 0x0

    return v0

    .line 466
    :cond_0
    invoke-static {p0, p1}, Landroidx/camera/camera2/internal/DynamicRangeResolver;->canResolve(Landroidx/camera/core/DynamicRange;Landroidx/camera/core/DynamicRange;)Z

    move-result v0

    return v0
.end method

.method private static findSupportedHdrMatch(Landroidx/camera/core/DynamicRange;Ljava/util/Collection;Ljava/util/Set;)Landroidx/camera/core/DynamicRange;
    .locals 7
    .param p0, "rangeToMatch"    # Landroidx/camera/core/DynamicRange;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/DynamicRange;",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/DynamicRange;",
            ">;",
            "Ljava/util/Set<",
            "Landroidx/camera/core/DynamicRange;",
            ">;)",
            "Landroidx/camera/core/DynamicRange;"
        }
    .end annotation

    .line 385
    .local p1, "fullySpecifiedCandidateRanges":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/DynamicRange;>;"
    .local p2, "constraints":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->getEncoding()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    .line 386
    return-object v1

    .line 389
    :cond_0
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/DynamicRange;

    .line 390
    .local v3, "candidateRange":Landroidx/camera/core/DynamicRange;
    const-string v4, "Fully specified DynamicRange cannot be null."

    invoke-static {v3, v4}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 392
    invoke-virtual {v3}, Landroidx/camera/core/DynamicRange;->getEncoding()I

    move-result v4

    .line 393
    .local v4, "candidateEncoding":I
    invoke-virtual {v3}, Landroidx/camera/core/DynamicRange;->isFullySpecified()Z

    move-result v5

    const-string v6, "Fully specified DynamicRange must have fully defined encoding."

    invoke-static {v5, v6}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 395
    if-ne v4, v2, :cond_1

    .line 397
    goto :goto_0

    .line 400
    :cond_1
    invoke-static {p0, v3, p2}, Landroidx/camera/camera2/internal/DynamicRangeResolver;->canResolveWithinConstraints(Landroidx/camera/core/DynamicRange;Landroidx/camera/core/DynamicRange;Ljava/util/Set;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 401
    return-object v3

    .line 403
    .end local v3    # "candidateRange":Landroidx/camera/core/DynamicRange;
    .end local v4    # "candidateEncoding":I
    :cond_2
    goto :goto_0

    .line 404
    :cond_3
    return-object v1
.end method

.method private static isFullyUnspecified(Landroidx/camera/core/DynamicRange;)Z
    .locals 1
    .param p0, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 430
    sget-object v0, Landroidx/camera/core/DynamicRange;->UNSPECIFIED:Landroidx/camera/core/DynamicRange;

    invoke-static {p0, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private static isPartiallySpecified(Landroidx/camera/core/DynamicRange;)Z
    .locals 2
    .param p0, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 438
    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->getEncoding()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2

    .line 439
    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->getEncoding()I

    move-result v0

    if-eqz v0, :cond_0

    .line 440
    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->getBitDepth()I

    move-result v0

    if-eqz v0, :cond_2

    .line 441
    :cond_0
    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->getEncoding()I

    move-result v0

    if-nez v0, :cond_1

    .line 442
    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->getBitDepth()I

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 v0, 0x1

    .line 438
    :goto_1
    return v0
.end method

.method private resolveDynamicRange(Landroidx/camera/core/DynamicRange;Ljava/util/Set;Ljava/util/Set;Ljava/util/Set;Ljava/lang/String;)Landroidx/camera/core/DynamicRange;
    .locals 9
    .param p1, "requestedDynamicRange"    # Landroidx/camera/core/DynamicRange;
    .param p5, "rangeOwnerLabel"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/DynamicRange;",
            "Ljava/util/Set<",
            "Landroidx/camera/core/DynamicRange;",
            ">;",
            "Ljava/util/Set<",
            "Landroidx/camera/core/DynamicRange;",
            ">;",
            "Ljava/util/Set<",
            "Landroidx/camera/core/DynamicRange;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Landroidx/camera/core/DynamicRange;"
        }
    .end annotation

    .line 224
    .local p2, "combinedConstraints":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    .local p3, "orderedExistingDynamicRanges":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    .local p4, "orderedNewDynamicRanges":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    invoke-virtual {p1}, Landroidx/camera/core/DynamicRange;->isFullySpecified()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 225
    invoke-interface {p2, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 226
    return-object p1

    .line 230
    :cond_0
    return-object v1

    .line 235
    :cond_1
    invoke-virtual {p1}, Landroidx/camera/core/DynamicRange;->getEncoding()I

    move-result v0

    .line 236
    .local v0, "requestedEncoding":I
    invoke-virtual {p1}, Landroidx/camera/core/DynamicRange;->getBitDepth()I

    move-result v2

    .line 237
    .local v2, "requestedBitDepth":I
    const/4 v3, 0x1

    if-ne v0, v3, :cond_3

    if-nez v2, :cond_3

    .line 238
    sget-object v3, Landroidx/camera/core/DynamicRange;->SDR:Landroidx/camera/core/DynamicRange;

    invoke-interface {p2, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 239
    sget-object v1, Landroidx/camera/core/DynamicRange;->SDR:Landroidx/camera/core/DynamicRange;

    return-object v1

    .line 242
    :cond_2
    return-object v1

    .line 247
    :cond_3
    invoke-static {p1, p3, p2}, Landroidx/camera/camera2/internal/DynamicRangeResolver;->findSupportedHdrMatch(Landroidx/camera/core/DynamicRange;Ljava/util/Collection;Ljava/util/Set;)Landroidx/camera/core/DynamicRange;

    move-result-object v3

    .line 249
    .local v3, "resolvedDynamicRange":Landroidx/camera/core/DynamicRange;
    const-string v4, "DynamicRangeResolver"

    if-eqz v3, :cond_4

    .line 250
    const-string/jumbo v1, "Resolved dynamic range for use case %s from existing attached surface.\n%s\n->\n%s"

    filled-new-array {p5, p1, v3}, [Ljava/lang/Object;

    move-result-object v5

    invoke-static {v1, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v4, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 253
    return-object v3

    .line 258
    :cond_4
    invoke-static {p1, p4, p2}, Landroidx/camera/camera2/internal/DynamicRangeResolver;->findSupportedHdrMatch(Landroidx/camera/core/DynamicRange;Ljava/util/Collection;Ljava/util/Set;)Landroidx/camera/core/DynamicRange;

    move-result-object v3

    .line 260
    if-eqz v3, :cond_5

    .line 261
    const-string/jumbo v1, "Resolved dynamic range for use case %s from concurrently bound use case.\n%s\n->\n%s"

    filled-new-array {p5, p1, v3}, [Ljava/lang/Object;

    move-result-object v5

    invoke-static {v1, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v4, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 264
    return-object v3

    .line 271
    :cond_5
    sget-object v5, Landroidx/camera/core/DynamicRange;->SDR:Landroidx/camera/core/DynamicRange;

    invoke-static {p1, v5, p2}, Landroidx/camera/camera2/internal/DynamicRangeResolver;->canResolveWithinConstraints(Landroidx/camera/core/DynamicRange;Landroidx/camera/core/DynamicRange;Ljava/util/Set;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 273
    sget-object v1, Landroidx/camera/core/DynamicRange;->SDR:Landroidx/camera/core/DynamicRange;

    filled-new-array {p5, p1, v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string/jumbo v5, "Resolved dynamic range for use case %s to no compatible HDR dynamic ranges.\n%s\n->\n%s"

    invoke-static {v5, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v4, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 277
    sget-object v1, Landroidx/camera/core/DynamicRange;->SDR:Landroidx/camera/core/DynamicRange;

    return-object v1

    .line 282
    :cond_6
    const/4 v5, 0x2

    if-ne v0, v5, :cond_a

    const/16 v5, 0xa

    if-eq v2, v5, :cond_7

    if-nez v2, :cond_a

    .line 285
    :cond_7
    new-instance v5, Ljava/util/LinkedHashSet;

    invoke-direct {v5}, Ljava/util/LinkedHashSet;-><init>()V

    .line 288
    .local v5, "hdrDefaultRanges":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    const/4 v6, 0x0

    .line 289
    .local v6, "recommendedRange":Landroidx/camera/core/DynamicRange;
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0x21

    if-lt v7, v8, :cond_8

    .line 290
    iget-object v7, p0, Landroidx/camera/camera2/internal/DynamicRangeResolver;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    invoke-static {v7}, Landroidx/camera/camera2/internal/DynamicRangeResolver$Api33Impl;->getRecommended10BitDynamicRange(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Landroidx/camera/core/DynamicRange;

    move-result-object v6

    .line 291
    if-eqz v6, :cond_8

    .line 292
    invoke-interface {v5, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 297
    :cond_8
    sget-object v7, Landroidx/camera/core/DynamicRange;->HLG_10_BIT:Landroidx/camera/core/DynamicRange;

    invoke-interface {v5, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 298
    invoke-static {p1, v5, p2}, Landroidx/camera/camera2/internal/DynamicRangeResolver;->findSupportedHdrMatch(Landroidx/camera/core/DynamicRange;Ljava/util/Collection;Ljava/util/Set;)Landroidx/camera/core/DynamicRange;

    move-result-object v3

    .line 300
    if-eqz v3, :cond_a

    .line 301
    nop

    .line 305
    invoke-static {v3, v6}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    const-string/jumbo v1, "recommended"

    goto :goto_0

    .line 306
    :cond_9
    const-string/jumbo v1, "required"

    :goto_0
    filled-new-array {p5, v1, p1, v3}, [Ljava/lang/Object;

    move-result-object v1

    .line 301
    const-string/jumbo v7, "Resolved dynamic range for use case %s from %s 10-bit supported dynamic range.\n%s\n->\n%s"

    invoke-static {v7, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v4, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 308
    return-object v3

    .line 317
    .end local v5    # "hdrDefaultRanges":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    .end local v6    # "recommendedRange":Landroidx/camera/core/DynamicRange;
    :cond_a
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_d

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/camera/core/DynamicRange;

    .line 318
    .local v6, "candidateRange":Landroidx/camera/core/DynamicRange;
    invoke-virtual {v6}, Landroidx/camera/core/DynamicRange;->isFullySpecified()Z

    move-result v7

    const-string v8, "Candidate dynamic range must be fully specified."

    invoke-static {v7, v8}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 322
    sget-object v7, Landroidx/camera/core/DynamicRange;->SDR:Landroidx/camera/core/DynamicRange;

    invoke-virtual {v6, v7}, Landroidx/camera/core/DynamicRange;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_b

    .line 323
    goto :goto_1

    .line 326
    :cond_b
    invoke-static {p1, v6}, Landroidx/camera/camera2/internal/DynamicRangeResolver;->canResolve(Landroidx/camera/core/DynamicRange;Landroidx/camera/core/DynamicRange;)Z

    move-result v7

    if-eqz v7, :cond_c

    .line 327
    const-string/jumbo v1, "Resolved dynamic range for use case %s from validated dynamic range constraints or supported HDR dynamic ranges.\n%s\n->\n%s"

    filled-new-array {p5, p1, v6}, [Ljava/lang/Object;

    move-result-object v5

    invoke-static {v1, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v4, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 332
    return-object v6

    .line 334
    .end local v6    # "candidateRange":Landroidx/camera/core/DynamicRange;
    :cond_c
    goto :goto_1

    .line 337
    :cond_d
    return-object v1
.end method

.method private resolveDynamicRangeAndUpdateConstraints(Ljava/util/Set;Ljava/util/Set;Ljava/util/Set;Landroidx/camera/core/impl/UseCaseConfig;Ljava/util/Set;)Landroidx/camera/core/DynamicRange;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Landroidx/camera/core/DynamicRange;",
            ">;",
            "Ljava/util/Set<",
            "Landroidx/camera/core/DynamicRange;",
            ">;",
            "Ljava/util/Set<",
            "Landroidx/camera/core/DynamicRange;",
            ">;",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;",
            "Ljava/util/Set<",
            "Landroidx/camera/core/DynamicRange;",
            ">;)",
            "Landroidx/camera/core/DynamicRange;"
        }
    .end annotation

    .line 174
    .local p1, "supportedDynamicRanges":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    .local p2, "orderedExistingDynamicRanges":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    .local p3, "orderedNewDynamicRanges":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    .local p4, "config":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    .local p5, "outCombinedConstraints":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    invoke-interface {p4}, Landroidx/camera/core/impl/UseCaseConfig;->getDynamicRange()Landroidx/camera/core/DynamicRange;

    move-result-object v1

    .line 175
    .local v1, "requestedDynamicRange":Landroidx/camera/core/DynamicRange;
    nop

    .line 177
    invoke-interface {p4}, Landroidx/camera/core/impl/UseCaseConfig;->getTargetName()Ljava/lang/String;

    move-result-object v5

    .line 175
    move-object v0, p0

    move-object v3, p2

    move-object v4, p3

    move-object v2, p5

    .end local p2    # "orderedExistingDynamicRanges":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    .end local p3    # "orderedNewDynamicRanges":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    .end local p5    # "outCombinedConstraints":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    .local v2, "outCombinedConstraints":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    .local v3, "orderedExistingDynamicRanges":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    .local v4, "orderedNewDynamicRanges":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    invoke-direct/range {v0 .. v5}, Landroidx/camera/camera2/internal/DynamicRangeResolver;->resolveDynamicRange(Landroidx/camera/core/DynamicRange;Ljava/util/Set;Ljava/util/Set;Ljava/util/Set;Ljava/lang/String;)Landroidx/camera/core/DynamicRange;

    move-result-object p2

    .line 179
    .local p2, "resolvedDynamicRange":Landroidx/camera/core/DynamicRange;
    if-eqz p2, :cond_0

    .line 180
    iget-object p3, p0, Landroidx/camera/camera2/internal/DynamicRangeResolver;->mDynamicRangesInfo:Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;

    invoke-static {v2, p2, p3}, Landroidx/camera/camera2/internal/DynamicRangeResolver;->updateConstraints(Ljava/util/Set;Landroidx/camera/core/DynamicRange;Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;)V

    .line 198
    return-object p2

    .line 182
    :cond_0
    new-instance p3, Ljava/lang/IllegalArgumentException;

    .line 193
    invoke-interface {p4}, Landroidx/camera/core/impl/UseCaseConfig;->getTargetName()Ljava/lang/String;

    move-result-object p5

    .line 194
    const-string v0, "\n  "

    invoke-static {v0, p1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v5

    .line 195
    invoke-static {v0, v2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v0

    filled-new-array {p5, v1, v5, v0}, [Ljava/lang/Object;

    move-result-object p5

    .line 182
    const-string/jumbo v0, "Unable to resolve supported dynamic range. The dynamic range may not be supported on the device or may not be allowed concurrently with other attached use cases.\nUse case:\n  %s\nRequested dynamic range:\n  %s\nSupported dynamic ranges:\n  %s\nConstrained set of concurrent dynamic ranges:\n  %s"

    invoke-static {v0, p5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p5

    invoke-direct {p3, p5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p3
.end method

.method private static updateConstraints(Ljava/util/Set;Landroidx/camera/core/DynamicRange;Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;)V
    .locals 5
    .param p1, "newDynamicRange"    # Landroidx/camera/core/DynamicRange;
    .param p2, "dynamicRangesInfo"    # Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Landroidx/camera/core/DynamicRange;",
            ">;",
            "Landroidx/camera/core/DynamicRange;",
            "Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;",
            ")V"
        }
    .end annotation

    .line 352
    .local p0, "combinedConstraints":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    invoke-interface {p0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    const-string v1, "Cannot update already-empty constraints."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 354
    nop

    .line 355
    invoke-virtual {p2, p1}, Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;->getDynamicRangeCaptureRequestConstraints(Landroidx/camera/core/DynamicRange;)Ljava/util/Set;

    move-result-object v0

    .line 356
    .local v0, "newConstraints":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 358
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1, p0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 360
    .local v1, "previousConstraints":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    invoke-interface {p0, v0}, Ljava/util/Set;->retainAll(Ljava/util/Collection;)Z

    .line 361
    invoke-interface {p0}, Ljava/util/Set;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_0

    .line 366
    :cond_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    .line 374
    const-string v3, "\n  "

    invoke-static {v3, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v4

    .line 375
    invoke-static {v3, v1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v3

    filled-new-array {p1, v4, v3}, [Ljava/lang/Object;

    move-result-object v3

    .line 366
    const-string v4, "Constraints of dynamic range cannot be combined with existing constraints.\nDynamic range:\n  %s\nConstraints:\n  %s\nExisting constraints:\n  %s"

    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 378
    .end local v1    # "previousConstraints":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method is10BitDynamicRangeSupported()Z
    .locals 1

    .line 86
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/DynamicRangeResolver;->mIs10BitSupported:Z

    return v0
.end method

.method resolveAndValidateDynamicRanges(Ljava/util/List;Ljava/util/List;Ljava/util/List;)Ljava/util/Map;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
            ">;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;>;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;",
            "Landroidx/camera/core/DynamicRange;",
            ">;"
        }
    .end annotation

    .line 102
    .local p1, "existingSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local p2, "newUseCaseConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .local p3, "useCasePriorityOrder":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    move-object v3, v0

    .line 103
    .local v3, "orderedExistingDynamicRanges":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/AttachedSurfaceInfo;

    .line 104
    .local v1, "asi":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    invoke-virtual {v1}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->getDynamicRange()Landroidx/camera/core/DynamicRange;

    move-result-object v2

    invoke-interface {v3, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 105
    .end local v1    # "asi":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    goto :goto_0

    .line 108
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/DynamicRangeResolver;->mDynamicRangesInfo:Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;->getSupportedDynamicRanges()Ljava/util/Set;

    move-result-object v2

    .line 113
    .local v2, "supportedDynamicRanges":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 114
    .local v6, "combinedConstraints":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/DynamicRange;

    .line 115
    .local v1, "dynamicRange":Landroidx/camera/core/DynamicRange;
    iget-object v4, p0, Landroidx/camera/camera2/internal/DynamicRangeResolver;->mDynamicRangesInfo:Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;

    invoke-static {v6, v1, v4}, Landroidx/camera/camera2/internal/DynamicRangeResolver;->updateConstraints(Ljava/util/Set;Landroidx/camera/core/DynamicRange;Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;)V

    .line 116
    .end local v1    # "dynamicRange":Landroidx/camera/core/DynamicRange;
    goto :goto_1

    .line 129
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 130
    .local v0, "orderedFullyDefinedUseCaseConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    move-object v7, v1

    .line 131
    .local v7, "orderedPartiallyDefinedUseCaseConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    move-object v8, v1

    .line 132
    .local v8, "orderedUndefinedUseCaseConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 133
    .local v4, "priorityIdx":I
    move-object/from16 v9, p2

    invoke-interface {v9, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/camera/core/impl/UseCaseConfig;

    .line 134
    .local v5, "config":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    invoke-interface {v5}, Landroidx/camera/core/impl/UseCaseConfig;->getDynamicRange()Landroidx/camera/core/DynamicRange;

    move-result-object v10

    .line 135
    .local v10, "requestedDynamicRange":Landroidx/camera/core/DynamicRange;
    invoke-static {v10}, Landroidx/camera/camera2/internal/DynamicRangeResolver;->isFullyUnspecified(Landroidx/camera/core/DynamicRange;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 136
    invoke-interface {v8, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 137
    :cond_2
    invoke-static {v10}, Landroidx/camera/camera2/internal/DynamicRangeResolver;->isPartiallySpecified(Landroidx/camera/core/DynamicRange;)Z

    move-result v11

    if-eqz v11, :cond_3

    .line 138
    invoke-interface {v7, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 140
    :cond_3
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 142
    .end local v4    # "priorityIdx":I
    .end local v5    # "config":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    .end local v10    # "requestedDynamicRange":Landroidx/camera/core/DynamicRange;
    :goto_3
    goto :goto_2

    .line 144
    :cond_4
    move-object/from16 v9, p2

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    move-object v10, v1

    .line 148
    .local v10, "resolvedDynamicRanges":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/DynamicRange;>;"
    new-instance v4, Ljava/util/LinkedHashSet;

    invoke-direct {v4}, Ljava/util/LinkedHashSet;-><init>()V

    .line 151
    .local v4, "orderedNewDynamicRanges":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    move-object v11, v1

    .line 152
    .local v11, "orderedUseCaseConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    invoke-interface {v11, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 153
    invoke-interface {v11, v7}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 154
    invoke-interface {v11, v8}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 155
    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_4
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Landroidx/camera/core/impl/UseCaseConfig;

    .line 156
    .restart local v5    # "config":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Landroidx/camera/camera2/internal/DynamicRangeResolver;->resolveDynamicRangeAndUpdateConstraints(Ljava/util/Set;Ljava/util/Set;Ljava/util/Set;Landroidx/camera/core/impl/UseCaseConfig;Ljava/util/Set;)Landroidx/camera/core/DynamicRange;

    move-result-object v13

    .line 159
    .local v13, "resolvedDynamicRange":Landroidx/camera/core/DynamicRange;
    invoke-interface {v10, v5, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    invoke-interface {v3, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 161
    invoke-interface {v4, v13}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 163
    .end local v5    # "config":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    .end local v13    # "resolvedDynamicRange":Landroidx/camera/core/DynamicRange;
    :cond_5
    goto :goto_4

    .line 165
    :cond_6
    return-object v10
.end method
