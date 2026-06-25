.class public abstract Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;
.super Ljava/lang/Object;
.source "VideoValidatedEncoderProfilesProxy.java"

# interfaces
.implements Landroidx/camera/core/impl/EncoderProfilesProxy;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(IILjava/util/List;Ljava/util/List;)Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;
    .locals 9
    .param p0, "defaultDurationSeconds"    # I
    .param p1, "recommendedFileFormat"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;",
            ">;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;",
            ">;)",
            "Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;"
        }
    .end annotation

    .line 58
    .local p2, "audioProfiles":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;>;"
    .local p3, "videoProfiles":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;>;"
    invoke-interface {p3}, Ljava/util/List;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    const-string/jumbo v1, "Should contain at least one VideoProfile."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 60
    const/4 v0, 0x0

    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    .line 62
    .local v8, "defaultVideoProfile":Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    const/4 v1, 0x0

    .line 63
    .local v1, "defaultAudioProfile":Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 64
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;

    move-object v7, v1

    goto :goto_0

    .line 63
    :cond_0
    move-object v7, v1

    .line 67
    .end local v1    # "defaultAudioProfile":Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;
    .local v7, "defaultAudioProfile":Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;
    :goto_0
    new-instance v2, Landroidx/camera/video/internal/AutoValue_VideoValidatedEncoderProfilesProxy;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 70
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v5

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 71
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v6

    move v3, p0

    move v4, p1

    .end local p0    # "defaultDurationSeconds":I
    .end local p1    # "recommendedFileFormat":I
    .local v3, "defaultDurationSeconds":I
    .local v4, "recommendedFileFormat":I
    invoke-direct/range {v2 .. v8}, Landroidx/camera/video/internal/AutoValue_VideoValidatedEncoderProfilesProxy;-><init>(IILjava/util/List;Ljava/util/List;Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;)V

    .line 67
    return-object v2
.end method

.method public static from(Landroidx/camera/core/impl/EncoderProfilesProxy;)Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;
    .locals 4
    .param p0, "profiles"    # Landroidx/camera/core/impl/EncoderProfilesProxy;

    .line 43
    nop

    .line 44
    invoke-interface {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy;->getDefaultDurationSeconds()I

    move-result v0

    .line 45
    invoke-interface {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy;->getRecommendedFileFormat()I

    move-result v1

    .line 46
    invoke-interface {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy;->getAudioProfiles()Ljava/util/List;

    move-result-object v2

    .line 47
    invoke-interface {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy;->getVideoProfiles()Ljava/util/List;

    move-result-object v3

    .line 43
    invoke-static {v0, v1, v2, v3}, Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;->create(IILjava/util/List;Ljava/util/List;)Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public abstract getDefaultAudioProfile()Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;
.end method

.method public abstract getDefaultVideoProfile()Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
.end method
