.class Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;
.super Ljava/lang/Object;
.source "RecorderVideoCapabilities.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/video/RecorderVideoCapabilities;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "CapabilitiesByQuality"
.end annotation


# instance fields
.field private final mAreaSortedSizeToQualityMap:Ljava/util/TreeMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/TreeMap<",
            "Landroid/util/Size;",
            "Landroidx/camera/video/Quality;",
            ">;"
        }
    .end annotation
.end field

.field private final mHighestProfiles:Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

.field private final mLowestProfiles:Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

.field private final mSupportedProfilesMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroidx/camera/video/Quality;",
            "Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroidx/camera/core/impl/EncoderProfilesProvider;)V
    .locals 8
    .param p1, "provider"    # Landroidx/camera/core/impl/EncoderProfilesProvider;

    .line 315
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 308
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;->mSupportedProfilesMap:Ljava/util/Map;

    .line 310
    new-instance v0, Ljava/util/TreeMap;

    new-instance v1, Landroidx/camera/core/impl/utils/CompareSizesByArea;

    invoke-direct {v1}, Landroidx/camera/core/impl/utils/CompareSizesByArea;-><init>()V

    invoke-direct {v0, v1}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    iput-object v0, p0, Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;->mAreaSortedSizeToQualityMap:Ljava/util/TreeMap;

    .line 317
    invoke-static {}, Landroidx/camera/video/Quality;->getSortedQualities()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const-string/jumbo v2, "RecorderVideoCapabilities"

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/video/Quality;

    .line 318
    .local v1, "quality":Landroidx/camera/video/Quality;
    invoke-direct {p0, v1, p1}, Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;->getEncoderProfiles(Landroidx/camera/video/Quality;Landroidx/camera/core/impl/EncoderProfilesProvider;)Landroidx/camera/core/impl/EncoderProfilesProxy;

    move-result-object v3

    .line 319
    .local v3, "profiles":Landroidx/camera/core/impl/EncoderProfilesProxy;
    if-nez v3, :cond_0

    .line 320
    goto :goto_0

    .line 324
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "profiles = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 325
    invoke-direct {p0, v3}, Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;->toValidatedProfiles(Landroidx/camera/core/impl/EncoderProfilesProxy;)Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    move-result-object v4

    .line 327
    .local v4, "validatedProfiles":Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;
    if-nez v4, :cond_1

    .line 328
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "EncoderProfiles of quality "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " has no video validated profiles."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 330
    goto :goto_0

    .line 333
    :cond_1
    nop

    .line 334
    invoke-virtual {v4}, Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;->getDefaultVideoProfile()Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    move-result-object v2

    .line 335
    .local v2, "videoProfile":Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    new-instance v5, Landroid/util/Size;

    invoke-virtual {v2}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getWidth()I

    move-result v6

    invoke-virtual {v2}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getHeight()I

    move-result v7

    invoke-direct {v5, v6, v7}, Landroid/util/Size;-><init>(II)V

    .line 336
    .local v5, "size":Landroid/util/Size;
    iget-object v6, p0, Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;->mAreaSortedSizeToQualityMap:Ljava/util/TreeMap;

    invoke-virtual {v6, v5, v1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 339
    iget-object v6, p0, Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;->mSupportedProfilesMap:Ljava/util/Map;

    invoke-interface {v6, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 340
    .end local v1    # "quality":Landroidx/camera/video/Quality;
    .end local v2    # "videoProfile":Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    .end local v3    # "profiles":Landroidx/camera/core/impl/EncoderProfilesProxy;
    .end local v4    # "validatedProfiles":Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;
    .end local v5    # "size":Landroid/util/Size;
    goto :goto_0

    .line 341
    :cond_2
    iget-object v0, p0, Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;->mSupportedProfilesMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 342
    const-string v0, "No supported EncoderProfiles"

    invoke-static {v2, v0}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 343
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;->mLowestProfiles:Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    .line 344
    iput-object v0, p0, Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;->mHighestProfiles:Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    goto :goto_1

    .line 346
    :cond_3
    new-instance v0, Ljava/util/ArrayDeque;

    iget-object v1, p0, Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;->mSupportedProfilesMap:Ljava/util/Map;

    .line 347
    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayDeque;-><init>(Ljava/util/Collection;)V

    .line 348
    .local v0, "profileQueue":Ljava/util/Deque;, "Ljava/util/Deque<Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;>;"
    invoke-interface {v0}, Ljava/util/Deque;->peekFirst()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    iput-object v1, p0, Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;->mHighestProfiles:Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    .line 349
    invoke-interface {v0}, Ljava/util/Deque;->peekLast()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    iput-object v1, p0, Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;->mLowestProfiles:Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    .line 351
    .end local v0    # "profileQueue":Ljava/util/Deque;, "Ljava/util/Deque<Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;>;"
    :goto_1
    return-void
.end method

.method private static checkQualityConstantsOrThrow(Landroidx/camera/video/Quality;)V
    .locals 3
    .param p0, "quality"    # Landroidx/camera/video/Quality;

    .line 436
    invoke-static {p0}, Landroidx/camera/video/Quality;->containsQuality(Landroidx/camera/video/Quality;)Z

    move-result v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Unknown quality: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 438
    return-void
.end method

.method private getEncoderProfiles(Landroidx/camera/video/Quality;Landroidx/camera/core/impl/EncoderProfilesProvider;)Landroidx/camera/core/impl/EncoderProfilesProxy;
    .locals 2
    .param p1, "quality"    # Landroidx/camera/video/Quality;
    .param p2, "provider"    # Landroidx/camera/core/impl/EncoderProfilesProvider;

    .line 415
    instance-of v0, p1, Landroidx/camera/video/Quality$ConstantQuality;

    const-string v1, "Currently only support ConstantQuality"

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 417
    move-object v0, p1

    check-cast v0, Landroidx/camera/video/Quality$ConstantQuality;

    invoke-virtual {v0}, Landroidx/camera/video/Quality$ConstantQuality;->getValue()I

    move-result v0

    .line 419
    .local v0, "qualityValue":I
    invoke-interface {p2, v0}, Landroidx/camera/core/impl/EncoderProfilesProvider;->getAll(I)Landroidx/camera/core/impl/EncoderProfilesProxy;

    move-result-object v1

    return-object v1
.end method

.method private toValidatedProfiles(Landroidx/camera/core/impl/EncoderProfilesProxy;)Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;
    .locals 2
    .param p1, "profiles"    # Landroidx/camera/core/impl/EncoderProfilesProxy;

    .line 426
    nop

    .line 427
    invoke-interface {p1}, Landroidx/camera/core/impl/EncoderProfilesProxy;->getVideoProfiles()Ljava/util/List;

    move-result-object v0

    .line 428
    .local v0, "videoProfiles":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 429
    const/4 v1, 0x0

    return-object v1

    .line 432
    :cond_0
    invoke-static {p1}, Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;->from(Landroidx/camera/core/impl/EncoderProfilesProxy;)Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public findHighestSupportedEncoderProfilesFor(Landroid/util/Size;)Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;
    .locals 4
    .param p1, "size"    # Landroid/util/Size;

    .line 377
    const/4 v0, 0x0

    .line 378
    .local v0, "encoderProfiles":Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;
    invoke-virtual {p0, p1}, Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;->findHighestSupportedQualityFor(Landroid/util/Size;)Landroidx/camera/video/Quality;

    move-result-object v1

    .line 379
    .local v1, "highestSupportedQuality":Landroidx/camera/video/Quality;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Using supported quality of "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " for size "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "RecorderVideoCapabilities"

    invoke-static {v3, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 381
    sget-object v2, Landroidx/camera/video/Quality;->NONE:Landroidx/camera/video/Quality;

    if-eq v1, v2, :cond_1

    .line 382
    invoke-virtual {p0, v1}, Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;->getProfiles(Landroidx/camera/video/Quality;)Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    move-result-object v0

    .line 383
    if-eqz v0, :cond_0

    goto :goto_0

    .line 384
    :cond_0
    new-instance v2, Ljava/lang/AssertionError;

    const-string v3, "Camera advertised available quality but did not produce EncoderProfiles for advertised quality."

    invoke-direct {v2, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2

    .line 388
    :cond_1
    :goto_0
    return-object v0
.end method

.method public findHighestSupportedQualityFor(Landroid/util/Size;)Landroidx/camera/video/Quality;
    .locals 3
    .param p1, "size"    # Landroid/util/Size;

    .line 393
    iget-object v0, p0, Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;->mAreaSortedSizeToQualityMap:Ljava/util/TreeMap;

    invoke-virtual {v0, p1}, Ljava/util/TreeMap;->ceilingEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object v0

    .line 395
    .local v0, "ceilEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroid/util/Size;Landroidx/camera/video/Quality;>;"
    if-eqz v0, :cond_0

    .line 398
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/video/Quality;

    return-object v1

    .line 402
    :cond_0
    iget-object v1, p0, Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;->mAreaSortedSizeToQualityMap:Ljava/util/TreeMap;

    invoke-virtual {v1, p1}, Ljava/util/TreeMap;->floorEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object v1

    .line 403
    .local v1, "floorEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroid/util/Size;Landroidx/camera/video/Quality;>;"
    if-eqz v1, :cond_1

    .line 404
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/video/Quality;

    return-object v2

    .line 409
    .end local v1    # "floorEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroid/util/Size;Landroidx/camera/video/Quality;>;"
    :cond_1
    sget-object v1, Landroidx/camera/video/Quality;->NONE:Landroidx/camera/video/Quality;

    return-object v1
.end method

.method public getProfiles(Landroidx/camera/video/Quality;)Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;
    .locals 1
    .param p1, "quality"    # Landroidx/camera/video/Quality;

    .line 365
    invoke-static {p1}, Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;->checkQualityConstantsOrThrow(Landroidx/camera/video/Quality;)V

    .line 366
    sget-object v0, Landroidx/camera/video/Quality;->HIGHEST:Landroidx/camera/video/Quality;

    if-ne p1, v0, :cond_0

    .line 367
    iget-object v0, p0, Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;->mHighestProfiles:Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    return-object v0

    .line 368
    :cond_0
    sget-object v0, Landroidx/camera/video/Quality;->LOWEST:Landroidx/camera/video/Quality;

    if-ne p1, v0, :cond_1

    .line 369
    iget-object v0, p0, Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;->mLowestProfiles:Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    return-object v0

    .line 371
    :cond_1
    iget-object v0, p0, Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;->mSupportedProfilesMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    return-object v0
.end method

.method public getSupportedQualities()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/camera/video/Quality;",
            ">;"
        }
    .end annotation

    .line 355
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;->mSupportedProfilesMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public isQualitySupported(Landroidx/camera/video/Quality;)Z
    .locals 1
    .param p1, "quality"    # Landroidx/camera/video/Quality;

    .line 359
    invoke-static {p1}, Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;->checkQualityConstantsOrThrow(Landroidx/camera/video/Quality;)V

    .line 360
    invoke-virtual {p0, p1}, Landroidx/camera/video/RecorderVideoCapabilities$CapabilitiesByQuality;->getProfiles(Landroidx/camera/video/Quality;)Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
