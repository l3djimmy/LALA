.class public Landroidx/camera/video/internal/workaround/EncoderFinder;
.super Ljava/lang/Object;
.source "EncoderFinder.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "EncoderFinder"


# instance fields
.field private final mShouldRemoveKeyFrameRate:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    const-class v0, Landroidx/camera/video/internal/compat/quirk/MediaFormatMustNotUseFrameRateToFindEncoderQuirk;

    .line 56
    invoke-static {v0}, Landroidx/camera/video/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/internal/compat/quirk/MediaFormatMustNotUseFrameRateToFindEncoderQuirk;

    .line 58
    .local v0, "quirk":Landroidx/camera/video/internal/compat/quirk/MediaFormatMustNotUseFrameRateToFindEncoderQuirk;
    if-eqz v0, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    iput-boolean v1, p0, Landroidx/camera/video/internal/workaround/EncoderFinder;->mShouldRemoveKeyFrameRate:Z

    .line 59
    return-void
.end method

.method private findEncoderWithNearestCompatibleBitrate(Landroid/media/MediaFormat;[Landroid/media/MediaCodecInfo;)Ljava/lang/String;
    .locals 16
    .param p1, "mediaFormat"    # Landroid/media/MediaFormat;
    .param p2, "codecInfoList"    # [Landroid/media/MediaCodecInfo;

    .line 145
    move-object/from16 v1, p1

    move-object/from16 v2, p2

    const-string/jumbo v3, "bitrate"

    const-string/jumbo v0, "mime"

    invoke-virtual {v1, v0}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 146
    .local v4, "mime":Ljava/lang/String;
    const/4 v5, 0x0

    const-string v6, "EncoderFinder"

    if-nez v4, :cond_0

    .line 147
    const-string v0, "MediaFormat does not contain mime info."

    invoke-static {v6, v0}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    return-object v5

    .line 151
    :cond_0
    array-length v7, v2

    const/4 v8, 0x0

    move v9, v8

    :goto_0
    if-ge v9, v7, :cond_9

    aget-object v10, v2, v9

    .line 152
    .local v10, "info":Landroid/media/MediaCodecInfo;
    invoke-virtual {v10}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    move-result v0

    if-nez v0, :cond_1

    .line 153
    goto/16 :goto_4

    .line 155
    :cond_1
    const/4 v11, 0x0

    .line 157
    .local v11, "origBitrate":Ljava/lang/Integer;
    :try_start_0
    invoke-virtual {v10, v4}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    move-result-object v0

    .line 158
    .local v0, "caps":Landroid/media/MediaCodecInfo$CodecCapabilities;
    const/4 v12, 0x1

    if-eqz v0, :cond_2

    move v13, v12

    goto :goto_1

    :cond_2
    move v13, v8

    :goto_1
    const-string v14, "MIME type is not supported"

    invoke-static {v13, v14}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 160
    const/4 v13, -0x1

    .line 161
    .local v13, "newBitrate":I
    invoke-virtual {v1, v3}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_4

    .line 164
    invoke-virtual {v0}, Landroid/media/MediaCodecInfo$CodecCapabilities;->getVideoCapabilities()Landroid/media/MediaCodecInfo$VideoCapabilities;

    move-result-object v14

    .line 165
    .local v14, "videoCaps":Landroid/media/MediaCodecInfo$VideoCapabilities;
    if-eqz v14, :cond_3

    goto :goto_2

    :cond_3
    move v12, v8

    :goto_2
    const-string v15, "Not video codec"

    invoke-static {v12, v15}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 167
    invoke-virtual {v1, v3}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    move-object v11, v12

    .line 168
    invoke-virtual {v14}, Landroid/media/MediaCodecInfo$VideoCapabilities;->getBitrateRange()Landroid/util/Range;

    move-result-object v12

    invoke-virtual {v12, v11}, Landroid/util/Range;->clamp(Ljava/lang/Comparable;)Ljava/lang/Comparable;

    move-result-object v12

    check-cast v12, Ljava/lang/Integer;

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v12

    move v13, v12

    .line 169
    invoke-virtual {v1, v3, v13}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 171
    .end local v14    # "videoCaps":Landroid/media/MediaCodecInfo$VideoCapabilities;
    :cond_4
    invoke-virtual {v0, v1}, Landroid/media/MediaCodecInfo$CodecCapabilities;->isFormatSupported(Landroid/media/MediaFormat;)Z

    move-result v12

    if-eqz v12, :cond_6

    .line 172
    const-string v12, "No encoder found that supports requested bitrate. Adjusting bitrate to nearest supported bitrate [requested: %dbps, nearest: %dbps]"

    .line 174
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    filled-new-array {v11, v14}, [Ljava/lang/Object;

    move-result-object v14

    .line 172
    invoke-static {v12, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v6, v12}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 175
    invoke-virtual {v10}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    move-result-object v5
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 180
    if-eqz v11, :cond_5

    .line 181
    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual {v1, v3, v6}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 175
    :cond_5
    return-object v5

    .line 180
    .end local v0    # "caps":Landroid/media/MediaCodecInfo$CodecCapabilities;
    .end local v13    # "newBitrate":I
    :cond_6
    if-eqz v11, :cond_8

    .line 181
    goto :goto_3

    .line 180
    :catchall_0
    move-exception v0

    if-eqz v11, :cond_7

    .line 181
    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {v1, v3, v5}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 183
    :cond_7
    throw v0

    .line 177
    :catch_0
    move-exception v0

    .line 180
    if-eqz v11, :cond_8

    .line 181
    :goto_3
    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {v1, v3, v0}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 151
    .end local v10    # "info":Landroid/media/MediaCodecInfo;
    .end local v11    # "origBitrate":Ljava/lang/Integer;
    :cond_8
    :goto_4
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_0

    .line 185
    :cond_9
    return-object v5
.end method

.method private shouldCreateCodecByType(Landroid/media/MediaFormat;)Z
    .locals 2
    .param p1, "mediaFormat"    # Landroid/media/MediaFormat;

    .line 189
    const-class v0, Landroidx/camera/video/internal/compat/quirk/MediaCodecInfoReportIncorrectInfoQuirk;

    .line 190
    invoke-static {v0}, Landroidx/camera/video/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/internal/compat/quirk/MediaCodecInfoReportIncorrectInfoQuirk;

    .line 191
    .local v0, "quirk":Landroidx/camera/video/internal/compat/quirk/MediaCodecInfoReportIncorrectInfoQuirk;
    if-nez v0, :cond_0

    .line 192
    const/4 v1, 0x0

    return v1

    .line 194
    :cond_0
    invoke-virtual {v0, p1}, Landroidx/camera/video/internal/compat/quirk/MediaCodecInfoReportIncorrectInfoQuirk;->isUnSupportMediaCodecInfo(Landroid/media/MediaFormat;)Z

    move-result v1

    return v1
.end method


# virtual methods
.method public findEncoder(Landroid/media/MediaFormat;)Landroid/media/MediaCodec;
    .locals 8
    .param p1, "mediaFormat"    # Landroid/media/MediaFormat;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/video/internal/encoder/InvalidConfigException;
        }
    .end annotation

    .line 75
    new-instance v0, Landroid/media/MediaCodecList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/media/MediaCodecList;-><init>(I)V

    .line 76
    .local v0, "mediaCodecList":Landroid/media/MediaCodecList;
    invoke-virtual {p0, p1, v0}, Landroidx/camera/video/internal/workaround/EncoderFinder;->findEncoderForFormat(Landroid/media/MediaFormat;Landroid/media/MediaCodecList;)Ljava/lang/String;

    move-result-object v1

    .line 78
    .local v1, "encoderName":Ljava/lang/String;
    :try_start_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 79
    const-string/jumbo v2, "mime"

    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 80
    .local v2, "mimeType":Ljava/lang/String;
    invoke-static {v2}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v3

    .line 82
    .local v3, "codec":Landroid/media/MediaCodec;
    invoke-static {v2, v3, p1}, Landroidx/camera/video/internal/DebugUtils;->dumpCodecCapabilities(Ljava/lang/String;Landroid/media/MediaCodec;Landroid/media/MediaFormat;)Ljava/lang/String;

    move-result-object v4

    .line 83
    .local v4, "msg":Ljava/lang/String;
    const-string v5, "EncoderFinder"

    const-string v6, "No encoder found that supports requested MediaFormat %s. Create encoder by MIME type. Dump codec info:\n%s"

    filled-new-array {p1, v4}, [Ljava/lang/Object;

    move-result-object v7

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .end local v2    # "mimeType":Ljava/lang/String;
    .end local v4    # "msg":Ljava/lang/String;
    goto :goto_0

    .line 87
    .end local v3    # "codec":Landroid/media/MediaCodec;
    :cond_0
    invoke-static {v1}, Landroid/media/MediaCodec;->createByCodecName(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v3, v2

    .line 95
    .restart local v3    # "codec":Landroid/media/MediaCodec;
    :goto_0
    nop

    .line 96
    return-object v3

    .line 89
    .end local v3    # "codec":Landroid/media/MediaCodec;
    :catch_0
    move-exception v2

    goto :goto_1

    :catch_1
    move-exception v2

    goto :goto_1

    :catch_2
    move-exception v2

    .line 90
    .local v2, "e":Ljava/lang/Exception;
    :goto_1
    invoke-direct {p0, p1}, Landroidx/camera/video/internal/workaround/EncoderFinder;->shouldCreateCodecByType(Landroid/media/MediaFormat;)Z

    move-result v3

    .line 91
    .local v3, "isMediaFormatInQuirk":Z
    invoke-static {v0, p1}, Landroidx/camera/video/internal/DebugUtils;->dumpMediaCodecListForFormat(Landroid/media/MediaCodecList;Landroid/media/MediaFormat;)Ljava/lang/String;

    move-result-object v4

    .line 92
    .restart local v4    # "msg":Ljava/lang/String;
    new-instance v5, Landroidx/camera/video/internal/encoder/InvalidConfigException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Encoder cannot created: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", isMediaFormatInQuirk: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v2}, Landroidx/camera/video/internal/encoder/InvalidConfigException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5
.end method

.method findEncoderForFormat(Landroid/media/MediaFormat;Landroid/media/MediaCodecList;)Ljava/lang/String;
    .locals 6
    .param p1, "mediaFormat"    # Landroid/media/MediaFormat;
    .param p2, "mediaCodecList"    # Landroid/media/MediaCodecList;

    .line 103
    const-string/jumbo v0, "aac-profile"

    const-string/jumbo v1, "frame-rate"

    const/4 v2, 0x0

    .line 104
    .local v2, "tempFrameRate":Ljava/lang/Integer;
    const/4 v3, 0x0

    .line 107
    .local v3, "tempAacProfile":Ljava/lang/Integer;
    :try_start_0
    iget-boolean v4, p0, Landroidx/camera/video/internal/workaround/EncoderFinder;->mShouldRemoveKeyFrameRate:Z

    if-eqz v4, :cond_0

    invoke-virtual {p1, v1}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 108
    invoke-virtual {p1, v1}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object v2, v4

    .line 110
    const/4 v4, 0x0

    invoke-virtual {p1, v1, v4}, Landroid/media/MediaFormat;->setString(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    :cond_0
    nop

    .line 123
    invoke-virtual {p2, p1}, Landroid/media/MediaCodecList;->findEncoderForFormat(Landroid/media/MediaFormat;)Ljava/lang/String;

    move-result-object v4

    .line 124
    .local v4, "name":Ljava/lang/String;
    if-nez v4, :cond_1

    .line 125
    nop

    .line 126
    invoke-virtual {p2}, Landroid/media/MediaCodecList;->getCodecInfos()[Landroid/media/MediaCodecInfo;

    move-result-object v5

    .line 125
    invoke-direct {p0, p1, v5}, Landroidx/camera/video/internal/workaround/EncoderFinder;->findEncoderWithNearestCompatibleBitrate(Landroid/media/MediaFormat;[Landroid/media/MediaCodecInfo;)Ljava/lang/String;

    move-result-object v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v4, v5

    .line 128
    :cond_1
    nop

    .line 131
    if-eqz v2, :cond_2

    .line 132
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {p1, v1, v5}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 136
    :cond_2
    if-eqz v3, :cond_3

    .line 137
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 128
    :cond_3
    return-object v4

    .line 131
    .end local v4    # "name":Ljava/lang/String;
    :catchall_0
    move-exception v4

    if-eqz v2, :cond_4

    .line 132
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {p1, v1, v5}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 136
    :cond_4
    if-eqz v3, :cond_5

    .line 137
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 139
    :cond_5
    throw v4
.end method
