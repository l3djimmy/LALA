.class public final Landroidx/camera/video/internal/config/AudioConfigUtil;
.super Ljava/lang/Object;
.source "AudioConfigUtil.java"


# static fields
.field static final AUDIO_CHANNEL_COUNT_DEFAULT:I = 0x1

.field static final AUDIO_SAMPLE_RATE_DEFAULT:I = 0xac44

.field static final AUDIO_SOURCE_DEFAULT:I = 0x5

.field static final AUDIO_SOURCE_FORMAT_DEFAULT:I = 0x2

.field private static final TAG:Ljava/lang/String; = "AudioConfigUtil"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    return-void
.end method

.method static synthetic lambda$selectSampleRateOrNearestSupported$0(ILjava/lang/Integer;Ljava/lang/Integer;)I
    .locals 3
    .param p0, "initialTargetSampleRate"    # I
    .param p1, "x"    # Ljava/lang/Integer;
    .param p2, "y"    # Ljava/lang/Integer;

    .line 227
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    sub-int/2addr v0, p0

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    .line 228
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sub-int/2addr v1, p0

    .line 227
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    sub-int/2addr v0, v1

    .line 231
    .local v0, "relativeDifference":I
    if-nez v0, :cond_0

    .line 232
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    invoke-static {v1}, Ljava/lang/Math;->signum(F)F

    move-result v1

    float-to-int v1, v1

    return v1

    .line 235
    :cond_0
    int-to-float v1, v0

    invoke-static {v1}, Ljava/lang/Math;->signum(F)F

    move-result v1

    float-to-int v1, v1

    return v1
.end method

.method public static resolveAudioEncoderConfig(Landroidx/camera/video/internal/config/AudioMimeInfo;Landroidx/camera/core/impl/Timebase;Landroidx/camera/video/internal/audio/AudioSettings;Landroidx/camera/video/AudioSpec;)Landroidx/camera/video/internal/encoder/AudioEncoderConfig;
    .locals 13
    .param p0, "audioMimeInfo"    # Landroidx/camera/video/internal/config/AudioMimeInfo;
    .param p1, "inputTimebase"    # Landroidx/camera/core/impl/Timebase;
    .param p2, "audioSettings"    # Landroidx/camera/video/internal/audio/AudioSettings;
    .param p3, "audioSpec"    # Landroidx/camera/video/AudioSpec;

    .line 157
    invoke-virtual {p0}, Landroidx/camera/video/internal/config/AudioMimeInfo;->getCompatibleAudioProfile()Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;

    move-result-object v6

    .line 158
    .local v6, "compatibleAudioProfile":Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;
    if-eqz v6, :cond_0

    .line 159
    new-instance v0, Landroidx/camera/video/internal/config/AudioEncoderConfigAudioProfileResolver;

    .line 160
    invoke-virtual {p0}, Landroidx/camera/video/internal/config/AudioMimeInfo;->getMimeType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Landroidx/camera/video/internal/config/AudioMimeInfo;->getProfile()I

    move-result v2

    move-object v3, p1

    move-object v5, p2

    move-object/from16 v4, p3

    invoke-direct/range {v0 .. v6}, Landroidx/camera/video/internal/config/AudioEncoderConfigAudioProfileResolver;-><init>(Ljava/lang/String;ILandroidx/camera/core/impl/Timebase;Landroidx/camera/video/AudioSpec;Landroidx/camera/video/internal/audio/AudioSettings;Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;)V

    .local v0, "configSupplier":Landroidx/core/util/Supplier;, "Landroidx/core/util/Supplier<Landroidx/camera/video/internal/encoder/AudioEncoderConfig;>;"
    goto :goto_0

    .line 163
    .end local v0    # "configSupplier":Landroidx/core/util/Supplier;, "Landroidx/core/util/Supplier<Landroidx/camera/video/internal/encoder/AudioEncoderConfig;>;"
    :cond_0
    new-instance v7, Landroidx/camera/video/internal/config/AudioEncoderConfigDefaultResolver;

    invoke-virtual {p0}, Landroidx/camera/video/internal/config/AudioMimeInfo;->getMimeType()Ljava/lang/String;

    move-result-object v8

    .line 164
    invoke-virtual {p0}, Landroidx/camera/video/internal/config/AudioMimeInfo;->getProfile()I

    move-result v9

    move-object v10, p1

    move-object v12, p2

    move-object/from16 v11, p3

    invoke-direct/range {v7 .. v12}, Landroidx/camera/video/internal/config/AudioEncoderConfigDefaultResolver;-><init>(Ljava/lang/String;ILandroidx/camera/core/impl/Timebase;Landroidx/camera/video/AudioSpec;Landroidx/camera/video/internal/audio/AudioSettings;)V

    move-object v0, v7

    .line 167
    .restart local v0    # "configSupplier":Landroidx/core/util/Supplier;, "Landroidx/core/util/Supplier<Landroidx/camera/video/internal/encoder/AudioEncoderConfig;>;"
    :goto_0
    invoke-interface {v0}, Landroidx/core/util/Supplier;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/video/internal/encoder/AudioEncoderConfig;

    return-object v1
.end method

.method public static resolveAudioMimeInfo(Landroidx/camera/video/MediaSpec;Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;)Landroidx/camera/video/internal/config/AudioMimeInfo;
    .locals 13
    .param p0, "mediaSpec"    # Landroidx/camera/video/MediaSpec;
    .param p1, "encoderProfiles"    # Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    .line 72
    invoke-virtual {p0}, Landroidx/camera/video/MediaSpec;->getOutputFormat()I

    move-result v0

    invoke-static {v0}, Landroidx/camera/video/MediaSpec;->outputFormatToAudioMime(I)Ljava/lang/String;

    move-result-object v0

    .line 73
    .local v0, "mediaSpecAudioMime":Ljava/lang/String;
    nop

    .line 74
    invoke-virtual {p0}, Landroidx/camera/video/MediaSpec;->getOutputFormat()I

    move-result v1

    invoke-static {v1}, Landroidx/camera/video/MediaSpec;->outputFormatToAudioProfile(I)I

    move-result v1

    .line 75
    .local v1, "mediaSpecAudioProfile":I
    move-object v2, v0

    .line 76
    .local v2, "resolvedAudioMime":Ljava/lang/String;
    move v3, v1

    .line 77
    .local v3, "resolvedAudioProfile":I
    const/4 v4, 0x0

    .line 78
    .local v4, "compatibleAudioProfile":Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;
    if-eqz p1, :cond_3

    invoke-virtual {p1}, Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;->getDefaultAudioProfile()Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;

    move-result-object v5

    if-eqz v5, :cond_3

    .line 79
    invoke-virtual {p1}, Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;->getDefaultAudioProfile()Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;

    move-result-object v5

    .line 80
    .local v5, "audioProfile":Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;
    invoke-virtual {v5}, Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;->getMediaType()Ljava/lang/String;

    move-result-object v6

    .line 81
    .local v6, "encoderProfileAudioMime":Ljava/lang/String;
    invoke-virtual {v5}, Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;->getProfile()I

    move-result v7

    .line 83
    .local v7, "encoderProfileAudioProfile":I
    const-string/jumbo v8, "audio/none"

    invoke-static {v6, v8}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    const-string v9, ")]"

    const-string v10, "AudioConfigUtil"

    const-string v11, "(profile: "

    if-eqz v8, :cond_0

    .line 84
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "EncoderProfiles contains undefined AUDIO mime type so cannot be used. May rely on fallback defaults to derive settings [chosen mime type: "

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v10, v8}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 88
    :cond_0
    invoke-virtual {p0}, Landroidx/camera/video/MediaSpec;->getOutputFormat()I

    move-result v8

    const/4 v12, -0x1

    if-ne v8, v12, :cond_1

    .line 89
    move-object v4, v5

    .line 90
    move-object v2, v6

    .line 91
    move v3, v7

    .line 92
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "MediaSpec contains OUTPUT_FORMAT_AUTO. Using EncoderProfiles to derive AUDIO settings [mime type: "

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v10, v8}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 95
    :cond_1
    invoke-static {v0, v6}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    if-ne v1, v7, :cond_2

    .line 97
    move-object v4, v5

    .line 98
    move-object v2, v6

    .line 99
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "MediaSpec audio mime/profile matches EncoderProfiles. Using EncoderProfiles to derive AUDIO settings [mime type: "

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v10, v8}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 103
    :cond_2
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "MediaSpec audio mime or profile does not match EncoderProfiles, so EncoderProfiles settings cannot be used. May rely on fallback defaults to derive AUDIO settings [EncoderProfiles mime type: "

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v12, "), chosen mime type: "

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v10, v8}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    .end local v5    # "audioProfile":Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;
    .end local v6    # "encoderProfileAudioMime":Ljava/lang/String;
    .end local v7    # "encoderProfileAudioProfile":I
    :cond_3
    :goto_0
    invoke-static {v2}, Landroidx/camera/video/internal/config/AudioMimeInfo;->builder(Ljava/lang/String;)Landroidx/camera/video/internal/config/AudioMimeInfo$Builder;

    move-result-object v5

    .line 113
    invoke-virtual {v5, v3}, Landroidx/camera/video/internal/config/AudioMimeInfo$Builder;->setProfile(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/camera/video/internal/config/AudioMimeInfo$Builder;

    .line 114
    .local v5, "mimeInfoBuilder":Landroidx/camera/video/internal/config/AudioMimeInfo$Builder;
    if-eqz v4, :cond_4

    .line 115
    invoke-virtual {v5, v4}, Landroidx/camera/video/internal/config/AudioMimeInfo$Builder;->setCompatibleAudioProfile(Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;)Landroidx/camera/video/internal/config/AudioMimeInfo$Builder;

    .line 118
    :cond_4
    invoke-virtual {v5}, Landroidx/camera/video/internal/config/AudioMimeInfo$Builder;->build()Landroidx/camera/video/internal/config/AudioMimeInfo;

    move-result-object v6

    return-object v6
.end method

.method public static resolveAudioSettings(Landroidx/camera/video/internal/config/AudioMimeInfo;Landroidx/camera/video/AudioSpec;)Landroidx/camera/video/internal/audio/AudioSettings;
    .locals 3
    .param p0, "audioMimeInfo"    # Landroidx/camera/video/internal/config/AudioMimeInfo;
    .param p1, "audioSpec"    # Landroidx/camera/video/AudioSpec;

    .line 132
    invoke-virtual {p0}, Landroidx/camera/video/internal/config/AudioMimeInfo;->getCompatibleAudioProfile()Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;

    move-result-object v0

    .line 133
    .local v0, "compatibleAudioProfile":Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;
    if-eqz v0, :cond_0

    .line 134
    new-instance v1, Landroidx/camera/video/internal/config/AudioSettingsAudioProfileResolver;

    invoke-direct {v1, p1, v0}, Landroidx/camera/video/internal/config/AudioSettingsAudioProfileResolver;-><init>(Landroidx/camera/video/AudioSpec;Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;)V

    .local v1, "settingsSupplier":Landroidx/core/util/Supplier;, "Landroidx/core/util/Supplier<Landroidx/camera/video/internal/audio/AudioSettings;>;"
    goto :goto_0

    .line 137
    .end local v1    # "settingsSupplier":Landroidx/core/util/Supplier;, "Landroidx/core/util/Supplier<Landroidx/camera/video/internal/audio/AudioSettings;>;"
    :cond_0
    new-instance v1, Landroidx/camera/video/internal/config/AudioSettingsDefaultResolver;

    invoke-direct {v1, p1}, Landroidx/camera/video/internal/config/AudioSettingsDefaultResolver;-><init>(Landroidx/camera/video/AudioSpec;)V

    .line 140
    .restart local v1    # "settingsSupplier":Landroidx/core/util/Supplier;, "Landroidx/core/util/Supplier<Landroidx/camera/video/internal/audio/AudioSettings;>;"
    :goto_0
    invoke-interface {v1}, Landroidx/core/util/Supplier;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/video/internal/audio/AudioSettings;

    return-object v2
.end method

.method static resolveAudioSource(Landroidx/camera/video/AudioSpec;)I
    .locals 4
    .param p0, "audioSpec"    # Landroidx/camera/video/AudioSpec;

    .line 171
    invoke-virtual {p0}, Landroidx/camera/video/AudioSpec;->getSource()I

    move-result v0

    .line 172
    .local v0, "resolvedAudioSource":I
    const/4 v1, -0x1

    const-string v2, "AudioConfigUtil"

    if-ne v0, v1, :cond_0

    .line 173
    const/4 v0, 0x5

    .line 174
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Using default AUDIO source: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 176
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Using provided AUDIO source: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 179
    :goto_0
    return v0
.end method

.method static resolveAudioSourceFormat(Landroidx/camera/video/AudioSpec;)I
    .locals 4
    .param p0, "audioSpec"    # Landroidx/camera/video/AudioSpec;

    .line 183
    invoke-virtual {p0}, Landroidx/camera/video/AudioSpec;->getSourceFormat()I

    move-result v0

    .line 184
    .local v0, "resolvedAudioSourceFormat":I
    const/4 v1, -0x1

    const-string v2, "AudioConfigUtil"

    if-ne v0, v1, :cond_0

    .line 187
    const/4 v0, 0x2

    .line 188
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Using default AUDIO source format: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 190
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Using provided AUDIO source format: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 194
    :goto_0
    return v0
.end method

.method static scaleAndClampBitrate(IIIIILandroid/util/Range;)I
    .locals 18
    .param p0, "baseBitrate"    # I
    .param p1, "actualChannelCount"    # I
    .param p2, "baseChannelCount"    # I
    .param p3, "actualSampleRate"    # I
    .param p4, "baseSampleRate"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIIII",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)I"
        }
    .end annotation

    .line 259
    .local p5, "clampedRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    move-object/from16 v0, p5

    new-instance v1, Landroid/util/Rational;

    move/from16 v2, p1

    move/from16 v3, p2

    invoke-direct {v1, v2, v3}, Landroid/util/Rational;-><init>(II)V

    .line 261
    .local v1, "channelCountRatio":Landroid/util/Rational;
    new-instance v4, Landroid/util/Rational;

    move/from16 v5, p3

    move/from16 v6, p4

    invoke-direct {v4, v5, v6}, Landroid/util/Rational;-><init>(II)V

    .line 263
    .local v4, "sampleRateRatio":Landroid/util/Rational;
    move/from16 v7, p0

    int-to-double v8, v7

    invoke-virtual {v1}, Landroid/util/Rational;->doubleValue()D

    move-result-wide v10

    mul-double/2addr v8, v10

    .line 264
    invoke-virtual {v4}, Landroid/util/Rational;->doubleValue()D

    move-result-wide v10

    mul-double/2addr v8, v10

    double-to-int v8, v8

    .line 266
    .local v8, "resolvedBitrate":I
    const-string v9, ""

    .line 267
    .local v9, "debugString":Ljava/lang/String;
    const-string v10, "AudioConfigUtil"

    invoke-static {v10}, Landroidx/camera/core/Logger;->isDebugEnabled(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 268
    nop

    .line 269
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    .line 270
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    filled-new-array/range {v12 .. v17}, [Ljava/lang/Object;

    move-result-object v11

    .line 268
    const-string v12, "Base Bitrate(%dbps) * Channel Count Ratio(%d / %d) * Sample Rate Ratio(%d / %d) = %d"

    invoke-static {v12, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .line 273
    :cond_0
    sget-object v11, Landroidx/camera/video/AudioSpec;->BITRATE_RANGE_AUTO:Landroid/util/Range;

    invoke-virtual {v11, v0}, Landroid/util/Range;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_1

    .line 274
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v0, v11}, Landroid/util/Range;->clamp(Ljava/lang/Comparable;)Ljava/lang/Comparable;

    move-result-object v11

    check-cast v11, Ljava/lang/Integer;

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v8

    .line 275
    invoke-static {v10}, Landroidx/camera/core/Logger;->isDebugEnabled(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 276
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    .line 277
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    filled-new-array {v0, v12}, [Ljava/lang/Object;

    move-result-object v12

    .line 276
    const-string v13, "\nClamped to range %s -> %dbps"

    invoke-static {v13, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 280
    :cond_1
    invoke-static {v10, v9}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 281
    return v8
.end method

.method static selectSampleRateOrNearestSupported(Landroid/util/Range;III)I
    .locals 6
    .param p1, "channelCount"    # I
    .param p2, "sourceFormat"    # I
    .param p3, "initialTargetSampleRate"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;III)I"
        }
    .end annotation

    .line 199
    .local p0, "targetRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    move v0, p3

    .line 201
    .local v0, "selectedSampleRate":I
    const/4 v1, 0x0

    .line 202
    .local v1, "sortedCommonSampleRates":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v2, 0x0

    .line 204
    .local v2, "i":I
    :goto_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p0, v3}, Landroid/util/Range;->contains(Ljava/lang/Comparable;)Z

    move-result v3

    const-string/jumbo v4, "Sample rate "

    const-string v5, "AudioConfigUtil"

    if-eqz v3, :cond_1

    .line 205
    invoke-static {v0, p1, p2}, Landroidx/camera/video/internal/audio/AudioSource;->isSettingsSupported(III)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 207
    return v0

    .line 209
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "Hz is not supported by audio source with channel count "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " and source format "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 214
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "Hz is not in target range "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 221
    :goto_1
    if-nez v1, :cond_2

    .line 222
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Trying common sample rates in proximity order to target "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "Hz"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 225
    new-instance v3, Ljava/util/ArrayList;

    sget-object v4, Landroidx/camera/video/internal/audio/AudioSettings;->COMMON_SAMPLE_RATES:Ljava/util/List;

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 226
    .end local v1    # "sortedCommonSampleRates":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v3, "sortedCommonSampleRates":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    new-instance v1, Landroidx/camera/video/internal/config/AudioConfigUtil$$ExternalSyntheticLambda0;

    invoke-direct {v1, p3}, Landroidx/camera/video/internal/config/AudioConfigUtil$$ExternalSyntheticLambda0;-><init>(I)V

    invoke-static {v3, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    move-object v1, v3

    .line 239
    .end local v3    # "sortedCommonSampleRates":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local v1    # "sortedCommonSampleRates":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :cond_2
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_3

    .line 240
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "i":I
    .local v3, "i":I
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    move v2, v3

    goto/16 :goto_0

    .line 249
    .end local v3    # "i":I
    .restart local v2    # "i":I
    :cond_3
    const-string v3, "No sample rate found in target range or supported by audio source. Falling back to default sample rate of 44100Hz"

    invoke-static {v5, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 251
    const v3, 0xac44

    return v3
.end method
