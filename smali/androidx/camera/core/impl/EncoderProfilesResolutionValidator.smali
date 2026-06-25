.class public Landroidx/camera/core/impl/EncoderProfilesResolutionValidator;
.super Ljava/lang/Object;
.source "EncoderProfilesResolutionValidator.java"


# instance fields
.field private final mQuirks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/quirk/ProfileResolutionQuirk;",
            ">;"
        }
    .end annotation
.end field

.field private final mSupportedResolutions:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/quirk/ProfileResolutionQuirk;",
            ">;)V"
        }
    .end annotation

    .line 48
    .local p1, "quirks":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/quirk/ProfileResolutionQuirk;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/impl/EncoderProfilesResolutionValidator;->mQuirks:Ljava/util/List;

    .line 50
    if-eqz p1, :cond_0

    .line 51
    iget-object v0, p0, Landroidx/camera/core/impl/EncoderProfilesResolutionValidator;->mQuirks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 54
    :cond_0
    invoke-direct {p0, p1}, Landroidx/camera/core/impl/EncoderProfilesResolutionValidator;->generateSupportedResolutions(Ljava/util/List;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/impl/EncoderProfilesResolutionValidator;->mSupportedResolutions:Ljava/util/Set;

    .line 55
    return-void
.end method

.method private generateSupportedResolutions(Ljava/util/List;)Ljava/util/Set;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/quirk/ProfileResolutionQuirk;",
            ">;)",
            "Ljava/util/Set<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 59
    .local p1, "quirks":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/quirk/ProfileResolutionQuirk;>;"
    if-eqz p1, :cond_2

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 63
    :cond_0
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x0

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/quirk/ProfileResolutionQuirk;

    invoke-interface {v1}, Landroidx/camera/core/impl/quirk/ProfileResolutionQuirk;->getSupportedResolutions()Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 64
    .local v0, "supportedResolutions":Ljava/util/Set;, "Ljava/util/Set<Landroid/util/Size;>;"
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 65
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/quirk/ProfileResolutionQuirk;

    invoke-interface {v2}, Landroidx/camera/core/impl/quirk/ProfileResolutionQuirk;->getSupportedResolutions()Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Set;->retainAll(Ljava/util/Collection;)Z

    .line 64
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 68
    .end local v1    # "i":I
    :cond_1
    return-object v0

    .line 60
    .end local v0    # "supportedResolutions":Ljava/util/Set;, "Ljava/util/Set<Landroid/util/Size;>;"
    :cond_2
    :goto_1
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public filterInvalidVideoResolution(Landroidx/camera/core/impl/EncoderProfilesProxy;)Landroidx/camera/core/impl/EncoderProfilesProxy;
    .locals 7
    .param p1, "profiles"    # Landroidx/camera/core/impl/EncoderProfilesProxy;

    .line 102
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 103
    return-object v0

    .line 106
    :cond_0
    invoke-virtual {p0}, Landroidx/camera/core/impl/EncoderProfilesResolutionValidator;->hasQuirk()Z

    move-result v1

    if-nez v1, :cond_1

    .line 107
    return-object p1

    .line 110
    :cond_1
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 111
    .local v1, "validVideoProfiles":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;>;"
    invoke-interface {p1}, Landroidx/camera/core/impl/EncoderProfilesProxy;->getVideoProfiles()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    .line 112
    .local v3, "videoProfile":Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    new-instance v4, Landroid/util/Size;

    invoke-virtual {v3}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getWidth()I

    move-result v5

    invoke-virtual {v3}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getHeight()I

    move-result v6

    invoke-direct {v4, v5, v6}, Landroid/util/Size;-><init>(II)V

    .line 113
    .local v4, "videoSize":Landroid/util/Size;
    iget-object v5, p0, Landroidx/camera/core/impl/EncoderProfilesResolutionValidator;->mSupportedResolutions:Ljava/util/Set;

    invoke-interface {v5, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 114
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 116
    .end local v3    # "videoProfile":Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    .end local v4    # "videoSize":Landroid/util/Size;
    :cond_2
    goto :goto_0

    .line 118
    :cond_3
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_4

    goto :goto_1

    .line 119
    :cond_4
    invoke-interface {p1}, Landroidx/camera/core/impl/EncoderProfilesProxy;->getDefaultDurationSeconds()I

    move-result v0

    .line 120
    invoke-interface {p1}, Landroidx/camera/core/impl/EncoderProfilesProxy;->getRecommendedFileFormat()I

    move-result v2

    .line 121
    invoke-interface {p1}, Landroidx/camera/core/impl/EncoderProfilesProxy;->getAudioProfiles()Ljava/util/List;

    move-result-object v3

    .line 118
    invoke-static {v0, v2, v3, v1}, Landroidx/camera/core/impl/EncoderProfilesProxy$ImmutableEncoderProfilesProxy;->create(IILjava/util/List;Ljava/util/List;)Landroidx/camera/core/impl/EncoderProfilesProxy$ImmutableEncoderProfilesProxy;

    move-result-object v0

    :goto_1
    return-object v0
.end method

.method public hasQuirk()Z
    .locals 1

    .line 73
    iget-object v0, p0, Landroidx/camera/core/impl/EncoderProfilesResolutionValidator;->mQuirks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public hasValidVideoResolution(Landroidx/camera/core/impl/EncoderProfilesProxy;)Z
    .locals 6
    .param p1, "profiles"    # Landroidx/camera/core/impl/EncoderProfilesProxy;

    .line 78
    if-nez p1, :cond_0

    .line 79
    const/4 v0, 0x0

    return v0

    .line 82
    :cond_0
    invoke-virtual {p0}, Landroidx/camera/core/impl/EncoderProfilesResolutionValidator;->hasQuirk()Z

    move-result v0

    if-nez v0, :cond_1

    .line 83
    invoke-interface {p1}, Landroidx/camera/core/impl/EncoderProfilesProxy;->getVideoProfiles()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0

    .line 86
    :cond_1
    const/4 v0, 0x0

    .line 87
    .local v0, "hasValidResolution":Z
    invoke-interface {p1}, Landroidx/camera/core/impl/EncoderProfilesProxy;->getVideoProfiles()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    .line 88
    .local v2, "videoProfile":Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    new-instance v3, Landroid/util/Size;

    invoke-virtual {v2}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getWidth()I

    move-result v4

    invoke-virtual {v2}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getHeight()I

    move-result v5

    invoke-direct {v3, v4, v5}, Landroid/util/Size;-><init>(II)V

    .line 89
    .local v3, "videoSize":Landroid/util/Size;
    iget-object v4, p0, Landroidx/camera/core/impl/EncoderProfilesResolutionValidator;->mSupportedResolutions:Ljava/util/Set;

    invoke-interface {v4, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 90
    const/4 v0, 0x1

    .line 91
    goto :goto_1

    .line 93
    .end local v2    # "videoProfile":Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    .end local v3    # "videoSize":Landroid/util/Size;
    :cond_2
    goto :goto_0

    .line 95
    :cond_3
    :goto_1
    return v0
.end method
