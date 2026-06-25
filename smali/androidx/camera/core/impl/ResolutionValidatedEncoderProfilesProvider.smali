.class public Landroidx/camera/core/impl/ResolutionValidatedEncoderProfilesProvider;
.super Ljava/lang/Object;
.source "ResolutionValidatedEncoderProfilesProvider.java"

# interfaces
.implements Landroidx/camera/core/impl/EncoderProfilesProvider;


# instance fields
.field private final mEncoderProfilesResolutionValidator:Landroidx/camera/core/impl/EncoderProfilesResolutionValidator;

.field private final mProvider:Landroidx/camera/core/impl/EncoderProfilesProvider;


# direct methods
.method public constructor <init>(Landroidx/camera/core/impl/EncoderProfilesProvider;Landroidx/camera/core/impl/Quirks;)V
    .locals 2
    .param p1, "provider"    # Landroidx/camera/core/impl/EncoderProfilesProvider;
    .param p2, "quirks"    # Landroidx/camera/core/impl/Quirks;

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Landroidx/camera/core/impl/ResolutionValidatedEncoderProfilesProvider;->mProvider:Landroidx/camera/core/impl/EncoderProfilesProvider;

    .line 39
    const-class v0, Landroidx/camera/core/impl/quirk/ProfileResolutionQuirk;

    invoke-virtual {p2, v0}, Landroidx/camera/core/impl/Quirks;->getAll(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    .line 40
    .local v0, "resolutionQuirks":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/quirk/ProfileResolutionQuirk;>;"
    new-instance v1, Landroidx/camera/core/impl/EncoderProfilesResolutionValidator;

    invoke-direct {v1, v0}, Landroidx/camera/core/impl/EncoderProfilesResolutionValidator;-><init>(Ljava/util/List;)V

    iput-object v1, p0, Landroidx/camera/core/impl/ResolutionValidatedEncoderProfilesProvider;->mEncoderProfilesResolutionValidator:Landroidx/camera/core/impl/EncoderProfilesResolutionValidator;

    .line 42
    return-void
.end method


# virtual methods
.method public getAll(I)Landroidx/camera/core/impl/EncoderProfilesProxy;
    .locals 2
    .param p1, "quality"    # I

    .line 63
    iget-object v0, p0, Landroidx/camera/core/impl/ResolutionValidatedEncoderProfilesProvider;->mProvider:Landroidx/camera/core/impl/EncoderProfilesProvider;

    invoke-interface {v0, p1}, Landroidx/camera/core/impl/EncoderProfilesProvider;->hasProfile(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 64
    const/4 v0, 0x0

    return-object v0

    .line 67
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/impl/ResolutionValidatedEncoderProfilesProvider;->mProvider:Landroidx/camera/core/impl/EncoderProfilesProvider;

    invoke-interface {v0, p1}, Landroidx/camera/core/impl/EncoderProfilesProvider;->getAll(I)Landroidx/camera/core/impl/EncoderProfilesProxy;

    move-result-object v0

    .line 68
    .local v0, "profiles":Landroidx/camera/core/impl/EncoderProfilesProxy;
    iget-object v1, p0, Landroidx/camera/core/impl/ResolutionValidatedEncoderProfilesProvider;->mEncoderProfilesResolutionValidator:Landroidx/camera/core/impl/EncoderProfilesResolutionValidator;

    invoke-virtual {v1}, Landroidx/camera/core/impl/EncoderProfilesResolutionValidator;->hasQuirk()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 69
    iget-object v1, p0, Landroidx/camera/core/impl/ResolutionValidatedEncoderProfilesProvider;->mEncoderProfilesResolutionValidator:Landroidx/camera/core/impl/EncoderProfilesResolutionValidator;

    invoke-virtual {v1, v0}, Landroidx/camera/core/impl/EncoderProfilesResolutionValidator;->filterInvalidVideoResolution(Landroidx/camera/core/impl/EncoderProfilesProxy;)Landroidx/camera/core/impl/EncoderProfilesProxy;

    move-result-object v0

    .line 72
    :cond_1
    return-object v0
.end method

.method public hasProfile(I)Z
    .locals 2
    .param p1, "quality"    # I

    .line 47
    iget-object v0, p0, Landroidx/camera/core/impl/ResolutionValidatedEncoderProfilesProvider;->mProvider:Landroidx/camera/core/impl/EncoderProfilesProvider;

    invoke-interface {v0, p1}, Landroidx/camera/core/impl/EncoderProfilesProvider;->hasProfile(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 48
    const/4 v0, 0x0

    return v0

    .line 51
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/impl/ResolutionValidatedEncoderProfilesProvider;->mEncoderProfilesResolutionValidator:Landroidx/camera/core/impl/EncoderProfilesResolutionValidator;

    invoke-virtual {v0}, Landroidx/camera/core/impl/EncoderProfilesResolutionValidator;->hasQuirk()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 52
    iget-object v0, p0, Landroidx/camera/core/impl/ResolutionValidatedEncoderProfilesProvider;->mProvider:Landroidx/camera/core/impl/EncoderProfilesProvider;

    invoke-interface {v0, p1}, Landroidx/camera/core/impl/EncoderProfilesProvider;->getAll(I)Landroidx/camera/core/impl/EncoderProfilesProxy;

    move-result-object v0

    .line 53
    .local v0, "profiles":Landroidx/camera/core/impl/EncoderProfilesProxy;
    iget-object v1, p0, Landroidx/camera/core/impl/ResolutionValidatedEncoderProfilesProvider;->mEncoderProfilesResolutionValidator:Landroidx/camera/core/impl/EncoderProfilesResolutionValidator;

    invoke-virtual {v1, v0}, Landroidx/camera/core/impl/EncoderProfilesResolutionValidator;->hasValidVideoResolution(Landroidx/camera/core/impl/EncoderProfilesProxy;)Z

    move-result v1

    return v1

    .line 56
    .end local v0    # "profiles":Landroidx/camera/core/impl/EncoderProfilesProxy;
    :cond_1
    const/4 v0, 0x1

    return v0
.end method
