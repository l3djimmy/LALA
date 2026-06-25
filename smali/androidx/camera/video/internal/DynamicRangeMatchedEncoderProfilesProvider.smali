.class public Landroidx/camera/video/internal/DynamicRangeMatchedEncoderProfilesProvider;
.super Ljava/lang/Object;
.source "DynamicRangeMatchedEncoderProfilesProvider.java"

# interfaces
.implements Landroidx/camera/core/impl/EncoderProfilesProvider;


# instance fields
.field private final mDynamicRange:Landroidx/camera/core/DynamicRange;

.field private final mEncoderProfilesCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Landroidx/camera/core/impl/EncoderProfilesProxy;",
            ">;"
        }
    .end annotation
.end field

.field private final mEncoderProfilesProvider:Landroidx/camera/core/impl/EncoderProfilesProvider;


# direct methods
.method public constructor <init>(Landroidx/camera/core/impl/EncoderProfilesProvider;Landroidx/camera/core/DynamicRange;)V
    .locals 1
    .param p1, "provider"    # Landroidx/camera/core/impl/EncoderProfilesProvider;
    .param p2, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/camera/video/internal/DynamicRangeMatchedEncoderProfilesProvider;->mEncoderProfilesCache:Ljava/util/Map;

    .line 50
    iput-object p1, p0, Landroidx/camera/video/internal/DynamicRangeMatchedEncoderProfilesProvider;->mEncoderProfilesProvider:Landroidx/camera/core/impl/EncoderProfilesProvider;

    .line 51
    iput-object p2, p0, Landroidx/camera/video/internal/DynamicRangeMatchedEncoderProfilesProvider;->mDynamicRange:Landroidx/camera/core/DynamicRange;

    .line 52
    return-void
.end method

.method private static filterUnmatchedDynamicRange(Landroidx/camera/core/impl/EncoderProfilesProxy;Landroidx/camera/core/DynamicRange;)Landroidx/camera/core/impl/EncoderProfilesProxy;
    .locals 5
    .param p0, "encoderProfiles"    # Landroidx/camera/core/impl/EncoderProfilesProxy;
    .param p1, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 90
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 91
    return-object v0

    .line 94
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 95
    .local v1, "validVideoProfiles":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;>;"
    invoke-interface {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy;->getVideoProfiles()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    .line 96
    .local v3, "videoProfile":Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    invoke-static {v3, p1}, Landroidx/camera/video/internal/DynamicRangeMatchedEncoderProfilesProvider;->isBitDepthMatched(Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;Landroidx/camera/core/DynamicRange;)Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-static {v3, p1}, Landroidx/camera/video/internal/DynamicRangeMatchedEncoderProfilesProvider;->isHdrEncodingMatched(Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;Landroidx/camera/core/DynamicRange;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 98
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 100
    .end local v3    # "videoProfile":Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    :cond_1
    goto :goto_0

    .line 102
    :cond_2
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_3

    goto :goto_1

    .line 103
    :cond_3
    invoke-interface {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy;->getDefaultDurationSeconds()I

    move-result v0

    .line 104
    invoke-interface {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy;->getRecommendedFileFormat()I

    move-result v2

    .line 105
    invoke-interface {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy;->getAudioProfiles()Ljava/util/List;

    move-result-object v3

    .line 102
    invoke-static {v0, v2, v3, v1}, Landroidx/camera/core/impl/EncoderProfilesProxy$ImmutableEncoderProfilesProxy;->create(IILjava/util/List;Ljava/util/List;)Landroidx/camera/core/impl/EncoderProfilesProxy$ImmutableEncoderProfilesProxy;

    move-result-object v0

    :goto_1
    return-object v0
.end method

.method private getProfilesInternal(I)Landroidx/camera/core/impl/EncoderProfilesProxy;
    .locals 4
    .param p1, "quality"    # I

    .line 73
    iget-object v0, p0, Landroidx/camera/video/internal/DynamicRangeMatchedEncoderProfilesProvider;->mEncoderProfilesCache:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 74
    iget-object v0, p0, Landroidx/camera/video/internal/DynamicRangeMatchedEncoderProfilesProvider;->mEncoderProfilesCache:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/EncoderProfilesProxy;

    return-object v0

    .line 77
    :cond_0
    const/4 v0, 0x0

    .line 78
    .local v0, "profiles":Landroidx/camera/core/impl/EncoderProfilesProxy;
    iget-object v1, p0, Landroidx/camera/video/internal/DynamicRangeMatchedEncoderProfilesProvider;->mEncoderProfilesProvider:Landroidx/camera/core/impl/EncoderProfilesProvider;

    invoke-interface {v1, p1}, Landroidx/camera/core/impl/EncoderProfilesProvider;->hasProfile(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 79
    iget-object v1, p0, Landroidx/camera/video/internal/DynamicRangeMatchedEncoderProfilesProvider;->mEncoderProfilesProvider:Landroidx/camera/core/impl/EncoderProfilesProvider;

    invoke-interface {v1, p1}, Landroidx/camera/core/impl/EncoderProfilesProvider;->getAll(I)Landroidx/camera/core/impl/EncoderProfilesProxy;

    move-result-object v1

    .line 80
    .local v1, "baseProfiles":Landroidx/camera/core/impl/EncoderProfilesProxy;
    iget-object v2, p0, Landroidx/camera/video/internal/DynamicRangeMatchedEncoderProfilesProvider;->mDynamicRange:Landroidx/camera/core/DynamicRange;

    invoke-static {v1, v2}, Landroidx/camera/video/internal/DynamicRangeMatchedEncoderProfilesProvider;->filterUnmatchedDynamicRange(Landroidx/camera/core/impl/EncoderProfilesProxy;Landroidx/camera/core/DynamicRange;)Landroidx/camera/core/impl/EncoderProfilesProxy;

    move-result-object v0

    .line 81
    iget-object v2, p0, Landroidx/camera/video/internal/DynamicRangeMatchedEncoderProfilesProvider;->mEncoderProfilesCache:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    .end local v1    # "baseProfiles":Landroidx/camera/core/impl/EncoderProfilesProxy;
    :cond_1
    return-object v0
.end method

.method private static isBitDepthMatched(Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;Landroidx/camera/core/DynamicRange;)Z
    .locals 2
    .param p0, "videoProfile"    # Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    .param p1, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 112
    sget-object v0, Landroidx/camera/video/internal/utils/DynamicRangeUtil;->DR_TO_VP_BIT_DEPTH_MAP:Ljava/util/Map;

    invoke-virtual {p1}, Landroidx/camera/core/DynamicRange;->getBitDepth()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    .line 114
    .local v0, "matchedBitDepths":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getBitDepth()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method private static isHdrEncodingMatched(Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;Landroidx/camera/core/DynamicRange;)Z
    .locals 2
    .param p0, "videoProfile"    # Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    .param p1, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 119
    sget-object v0, Landroidx/camera/video/internal/utils/DynamicRangeUtil;->DR_TO_VP_FORMAT_MAP:Ljava/util/Map;

    invoke-virtual {p1}, Landroidx/camera/core/DynamicRange;->getEncoding()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    .line 121
    .local v0, "matchedHdrEncodings":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    if-eqz v0, :cond_0

    .line 122
    invoke-virtual {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getHdrFormat()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 121
    :goto_0
    return v1
.end method


# virtual methods
.method public getAll(I)Landroidx/camera/core/impl/EncoderProfilesProxy;
    .locals 1
    .param p1, "quality"    # I

    .line 68
    invoke-direct {p0, p1}, Landroidx/camera/video/internal/DynamicRangeMatchedEncoderProfilesProvider;->getProfilesInternal(I)Landroidx/camera/core/impl/EncoderProfilesProxy;

    move-result-object v0

    return-object v0
.end method

.method public hasProfile(I)Z
    .locals 2
    .param p1, "quality"    # I

    .line 57
    iget-object v0, p0, Landroidx/camera/video/internal/DynamicRangeMatchedEncoderProfilesProvider;->mEncoderProfilesProvider:Landroidx/camera/core/impl/EncoderProfilesProvider;

    invoke-interface {v0, p1}, Landroidx/camera/core/impl/EncoderProfilesProvider;->hasProfile(I)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 58
    return v1

    .line 61
    :cond_0
    invoke-direct {p0, p1}, Landroidx/camera/video/internal/DynamicRangeMatchedEncoderProfilesProvider;->getProfilesInternal(I)Landroidx/camera/core/impl/EncoderProfilesProxy;

    move-result-object v0

    if-eqz v0, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method
