.class public final Landroidx/camera/video/internal/config/AudioSettingsAudioProfileResolver;
.super Ljava/lang/Object;
.source "AudioSettingsAudioProfileResolver.java"

# interfaces
.implements Landroidx/core/util/Supplier;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/core/util/Supplier<",
        "Landroidx/camera/video/internal/audio/AudioSettings;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "AudioSrcAdPrflRslvr"


# instance fields
.field private final mAudioProfile:Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;

.field private final mAudioSpec:Landroidx/camera/video/AudioSpec;


# direct methods
.method public constructor <init>(Landroidx/camera/video/AudioSpec;Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;)V
    .locals 0
    .param p1, "audioSpec"    # Landroidx/camera/video/AudioSpec;
    .param p2, "audioProfile"    # Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p1, p0, Landroidx/camera/video/internal/config/AudioSettingsAudioProfileResolver;->mAudioSpec:Landroidx/camera/video/AudioSpec;

    .line 52
    iput-object p2, p0, Landroidx/camera/video/internal/config/AudioSettingsAudioProfileResolver;->mAudioProfile:Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;

    .line 53
    return-void
.end method


# virtual methods
.method public get()Landroidx/camera/video/internal/audio/AudioSettings;
    .locals 11

    .line 59
    iget-object v0, p0, Landroidx/camera/video/internal/config/AudioSettingsAudioProfileResolver;->mAudioSpec:Landroidx/camera/video/AudioSpec;

    invoke-static {v0}, Landroidx/camera/video/internal/config/AudioConfigUtil;->resolveAudioSource(Landroidx/camera/video/AudioSpec;)I

    move-result v0

    .line 62
    .local v0, "resolvedAudioSource":I
    iget-object v1, p0, Landroidx/camera/video/internal/config/AudioSettingsAudioProfileResolver;->mAudioSpec:Landroidx/camera/video/AudioSpec;

    invoke-static {v1}, Landroidx/camera/video/internal/config/AudioConfigUtil;->resolveAudioSourceFormat(Landroidx/camera/video/AudioSpec;)I

    move-result v1

    .line 64
    .local v1, "resolvedSourceFormat":I
    iget-object v2, p0, Landroidx/camera/video/internal/config/AudioSettingsAudioProfileResolver;->mAudioSpec:Landroidx/camera/video/AudioSpec;

    invoke-virtual {v2}, Landroidx/camera/video/AudioSpec;->getChannelCount()I

    move-result v2

    .line 65
    .local v2, "audioSpecChannelCount":I
    iget-object v3, p0, Landroidx/camera/video/internal/config/AudioSettingsAudioProfileResolver;->mAudioSpec:Landroidx/camera/video/AudioSpec;

    invoke-virtual {v3}, Landroidx/camera/video/AudioSpec;->getSampleRate()Landroid/util/Range;

    move-result-object v3

    .line 68
    .local v3, "audioSpecSampleRate":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    iget-object v4, p0, Landroidx/camera/video/internal/config/AudioSettingsAudioProfileResolver;->mAudioProfile:Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;

    invoke-virtual {v4}, Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;->getChannels()I

    move-result v4

    .line 69
    .local v4, "audioProfileChannelCount":I
    const/4 v5, -0x1

    const-string v6, "AudioSrcAdPrflRslvr"

    if-ne v2, v5, :cond_0

    .line 70
    move v5, v4

    .line 71
    .local v5, "resolvedChannelCount":I
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Resolved AUDIO channel count from AudioProfile: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 74
    .end local v5    # "resolvedChannelCount":I
    :cond_0
    move v5, v2

    .line 75
    .restart local v5    # "resolvedChannelCount":I
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Media spec AUDIO channel count overrides AudioProfile [AudioProfile channel count: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", Resolved Channel Count: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "]"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    :goto_0
    iget-object v7, p0, Landroidx/camera/video/internal/config/AudioSettingsAudioProfileResolver;->mAudioProfile:Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;

    invoke-virtual {v7}, Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;->getSampleRate()I

    move-result v7

    .line 81
    .local v7, "audioProfileSampleRate":I
    invoke-static {v3, v5, v1, v7}, Landroidx/camera/video/internal/config/AudioConfigUtil;->selectSampleRateOrNearestSupported(Landroid/util/Range;III)I

    move-result v8

    .line 84
    .local v8, "resolvedSampleRate":I
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "Using resolved AUDIO sample rate or nearest supported from AudioProfile: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "Hz. [AudioProfile sample rate: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "Hz]"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v6, v9}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    invoke-static {}, Landroidx/camera/video/internal/audio/AudioSettings;->builder()Landroidx/camera/video/internal/audio/AudioSettings$Builder;

    move-result-object v6

    .line 89
    invoke-virtual {v6, v0}, Landroidx/camera/video/internal/audio/AudioSettings$Builder;->setAudioSource(I)Landroidx/camera/video/internal/audio/AudioSettings$Builder;

    move-result-object v6

    .line 90
    invoke-virtual {v6, v1}, Landroidx/camera/video/internal/audio/AudioSettings$Builder;->setAudioFormat(I)Landroidx/camera/video/internal/audio/AudioSettings$Builder;

    move-result-object v6

    .line 91
    invoke-virtual {v6, v5}, Landroidx/camera/video/internal/audio/AudioSettings$Builder;->setChannelCount(I)Landroidx/camera/video/internal/audio/AudioSettings$Builder;

    move-result-object v6

    .line 92
    invoke-virtual {v6, v8}, Landroidx/camera/video/internal/audio/AudioSettings$Builder;->setSampleRate(I)Landroidx/camera/video/internal/audio/AudioSettings$Builder;

    move-result-object v6

    .line 93
    invoke-virtual {v6}, Landroidx/camera/video/internal/audio/AudioSettings$Builder;->build()Landroidx/camera/video/internal/audio/AudioSettings;

    move-result-object v6

    .line 88
    return-object v6
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 1

    .line 33
    invoke-virtual {p0}, Landroidx/camera/video/internal/config/AudioSettingsAudioProfileResolver;->get()Landroidx/camera/video/internal/audio/AudioSettings;

    move-result-object v0

    return-object v0
.end method
