.class public final Landroidx/camera/video/internal/DebugUtils;
.super Ljava/lang/Object;
.source "DebugUtils.java"


# static fields
.field private static final AUDIO_CAPS_PREFIX:Ljava/lang/String; = "[AudioCaps] "

.field private static final CODEC_CAPS_PREFIX:Ljava/lang/String; = "[CodecCaps] "

.field private static final ENCODER_CAPS_PREFIX:Ljava/lang/String; = "[EncoderCaps] "

.field private static final TAG:Ljava/lang/String; = "DebugUtils"

.field private static final VIDEO_CAPS_PREFIX:Ljava/lang/String; = "[VideoCaps] "


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static dumpAudioCapabilities(Ljava/lang/StringBuilder;Landroid/media/MediaCodecInfo$AudioCapabilities;Landroid/media/MediaFormat;)V
    .locals 3
    .param p0, "sb"    # Ljava/lang/StringBuilder;
    .param p1, "caps"    # Landroid/media/MediaCodecInfo$AudioCapabilities;
    .param p2, "mediaFormat"    # Landroid/media/MediaFormat;

    .line 293
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "[AudioCaps] getBitrateRange = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Landroid/media/MediaCodecInfo$AudioCapabilities;->getBitrateRange()Landroid/util/Range;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Landroidx/camera/video/internal/DebugUtils;->logToString(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 296
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "[AudioCaps] getMaxInputChannelCount = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 297
    invoke-virtual {p1}, Landroid/media/MediaCodecInfo$AudioCapabilities;->getMaxInputChannelCount()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 296
    invoke-static {p0, v0}, Landroidx/camera/video/internal/DebugUtils;->logToString(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 299
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_0

    .line 300
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "[AudioCaps] getMinInputChannelCount = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 301
    invoke-static {p1}, Landroidx/camera/video/internal/compat/Api31Impl;->getMinInputChannelCount(Landroid/media/MediaCodecInfo$AudioCapabilities;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 300
    invoke-static {p0, v0}, Landroidx/camera/video/internal/DebugUtils;->logToString(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 302
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "[AudioCaps] getInputChannelCountRanges = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 303
    invoke-static {p1}, Landroidx/camera/video/internal/compat/Api31Impl;->getInputChannelCountRanges(Landroid/media/MediaCodecInfo$AudioCapabilities;)[Landroid/util/Range;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 302
    invoke-static {p0, v0}, Landroidx/camera/video/internal/DebugUtils;->logToString(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 307
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "[AudioCaps] getSupportedSampleRateRanges = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 308
    invoke-virtual {p1}, Landroid/media/MediaCodecInfo$AudioCapabilities;->getSupportedSampleRateRanges()[Landroid/util/Range;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 307
    invoke-static {p0, v0}, Landroidx/camera/video/internal/DebugUtils;->logToString(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 309
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "[AudioCaps] getSupportedSampleRates = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 310
    invoke-virtual {p1}, Landroid/media/MediaCodecInfo$AudioCapabilities;->getSupportedSampleRates()[I

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 309
    invoke-static {p0, v0}, Landroidx/camera/video/internal/DebugUtils;->logToString(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 313
    :try_start_0
    const-string/jumbo v0, "sample-rate"

    invoke-virtual {p2, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v0

    .line 314
    .local v0, "sampleRate":I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "[AudioCaps] isSampleRateSupported for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 315
    invoke-virtual {p1, v0}, Landroid/media/MediaCodecInfo$AudioCapabilities;->isSampleRateSupported(I)Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 314
    invoke-static {p0, v1}, Landroidx/camera/video/internal/DebugUtils;->logToString(Ljava/lang/StringBuilder;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 318
    .end local v0    # "sampleRate":I
    goto :goto_1

    .line 316
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 317
    .local v0, "e":Ljava/lang/RuntimeException;
    :goto_0
    const-string/jumbo v1, "[AudioCaps] mediaFormat does not contain sample rate"

    invoke-static {p0, v1}, Landroidx/camera/video/internal/DebugUtils;->logToString(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 319
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :goto_1
    return-void
.end method

.method public static dumpCodecCapabilities(Ljava/lang/String;Landroid/media/MediaCodec;Landroid/media/MediaFormat;)Ljava/lang/String;
    .locals 4
    .param p0, "mimeType"    # Ljava/lang/String;
    .param p1, "codec"    # Landroid/media/MediaCodec;
    .param p2, "mediaFormat"    # Landroid/media/MediaFormat;

    .line 168
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 170
    .local v0, "sb":Ljava/lang/StringBuilder;
    :try_start_0
    invoke-virtual {p1}, Landroid/media/MediaCodec;->getCodecInfo()Landroid/media/MediaCodecInfo;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    move-result-object v1

    .line 172
    .local v1, "caps":Landroid/media/MediaCodecInfo$CodecCapabilities;
    if-eqz v1, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    invoke-static {v2}, Landroidx/core/util/Preconditions;->checkArgument(Z)V

    .line 173
    invoke-static {v0, v1, p2}, Landroidx/camera/video/internal/DebugUtils;->dumpCodecCapabilities(Ljava/lang/StringBuilder;Landroid/media/MediaCodecInfo$CodecCapabilities;Landroid/media/MediaFormat;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 176
    .end local v1    # "caps":Landroid/media/MediaCodecInfo$CodecCapabilities;
    goto :goto_1

    .line 174
    :catch_0
    move-exception v1

    .line 175
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Landroid/media/MediaCodec;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "] does not support mime "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroidx/camera/video/internal/DebugUtils;->logToString(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 178
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static dumpCodecCapabilities(Ljava/lang/StringBuilder;Landroid/media/MediaCodecInfo$CodecCapabilities;Landroid/media/MediaFormat;)V
    .locals 7
    .param p0, "sb"    # Ljava/lang/StringBuilder;
    .param p1, "caps"    # Landroid/media/MediaCodecInfo$CodecCapabilities;
    .param p2, "mediaFormat"    # Landroid/media/MediaFormat;

    .line 185
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "[CodecCaps] isFormatSupported = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 186
    invoke-virtual {p1, p2}, Landroid/media/MediaCodecInfo$CodecCapabilities;->isFormatSupported(Landroid/media/MediaFormat;)Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 185
    invoke-static {p0, v0}, Landroidx/camera/video/internal/DebugUtils;->logToString(Ljava/lang/StringBuilder;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 190
    goto :goto_0

    .line 188
    :catch_0
    move-exception v0

    .line 189
    .local v0, "e":Ljava/lang/ClassCastException;
    const-string/jumbo v1, "[CodecCaps] isFormatSupported=false"

    invoke-static {p0, v1}, Landroidx/camera/video/internal/DebugUtils;->logToString(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 192
    .end local v0    # "e":Ljava/lang/ClassCastException;
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "[CodecCaps] getDefaultFormat = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Landroid/media/MediaCodecInfo$CodecCapabilities;->getDefaultFormat()Landroid/media/MediaFormat;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Landroidx/camera/video/internal/DebugUtils;->logToString(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 193
    iget-object v0, p1, Landroid/media/MediaCodecInfo$CodecCapabilities;->profileLevels:[Landroid/media/MediaCodecInfo$CodecProfileLevel;

    if-eqz v0, :cond_1

    .line 194
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "["

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 195
    .local v0, "stringBuilder":Ljava/lang/StringBuilder;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 196
    .local v1, "profileLevelsStr":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v2, p1, Landroid/media/MediaCodecInfo$CodecCapabilities;->profileLevels:[Landroid/media/MediaCodecInfo$CodecProfileLevel;

    array-length v3, v2

    const/4 v4, 0x0

    :goto_1
    if-ge v4, v3, :cond_0

    aget-object v5, v2, v4

    .line 197
    .local v5, "profileLevel":Landroid/media/MediaCodecInfo$CodecProfileLevel;
    invoke-static {v5}, Landroidx/camera/video/internal/DebugUtils;->toString(Landroid/media/MediaCodecInfo$CodecProfileLevel;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 196
    .end local v5    # "profileLevel":Landroid/media/MediaCodecInfo$CodecProfileLevel;
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 199
    :cond_0
    const-string v2, ", "

    invoke-static {v2, v1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "[CodecCaps] profileLevels = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Landroidx/camera/video/internal/DebugUtils;->logToString(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 202
    .end local v0    # "stringBuilder":Ljava/lang/StringBuilder;
    .end local v1    # "profileLevelsStr":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_1
    iget-object v0, p1, Landroid/media/MediaCodecInfo$CodecCapabilities;->colorFormats:[I

    if-eqz v0, :cond_2

    .line 203
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "[CodecCaps] colorFormats = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Landroid/media/MediaCodecInfo$CodecCapabilities;->colorFormats:[I

    .line 204
    invoke-static {v1}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 203
    invoke-static {p0, v0}, Landroidx/camera/video/internal/DebugUtils;->logToString(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 207
    :cond_2
    invoke-virtual {p1}, Landroid/media/MediaCodecInfo$CodecCapabilities;->getVideoCapabilities()Landroid/media/MediaCodecInfo$VideoCapabilities;

    move-result-object v0

    .line 208
    .local v0, "videoCaps":Landroid/media/MediaCodecInfo$VideoCapabilities;
    if-eqz v0, :cond_3

    .line 209
    invoke-static {p0, v0, p2}, Landroidx/camera/video/internal/DebugUtils;->dumpVideoCapabilities(Ljava/lang/StringBuilder;Landroid/media/MediaCodecInfo$VideoCapabilities;Landroid/media/MediaFormat;)V

    .line 212
    :cond_3
    invoke-virtual {p1}, Landroid/media/MediaCodecInfo$CodecCapabilities;->getAudioCapabilities()Landroid/media/MediaCodecInfo$AudioCapabilities;

    move-result-object v1

    .line 213
    .local v1, "audioCaps":Landroid/media/MediaCodecInfo$AudioCapabilities;
    if-eqz v1, :cond_4

    .line 214
    invoke-static {p0, v1, p2}, Landroidx/camera/video/internal/DebugUtils;->dumpAudioCapabilities(Ljava/lang/StringBuilder;Landroid/media/MediaCodecInfo$AudioCapabilities;Landroid/media/MediaFormat;)V

    .line 217
    :cond_4
    invoke-virtual {p1}, Landroid/media/MediaCodecInfo$CodecCapabilities;->getEncoderCapabilities()Landroid/media/MediaCodecInfo$EncoderCapabilities;

    move-result-object v2

    .line 218
    .local v2, "encoderCaps":Landroid/media/MediaCodecInfo$EncoderCapabilities;
    if-eqz v2, :cond_5

    .line 219
    invoke-static {p0, v2, p2}, Landroidx/camera/video/internal/DebugUtils;->dumpEncoderCapabilities(Ljava/lang/StringBuilder;Landroid/media/MediaCodecInfo$EncoderCapabilities;Landroid/media/MediaFormat;)V

    .line 221
    :cond_5
    return-void
.end method

.method private static dumpEncoderCapabilities(Ljava/lang/StringBuilder;Landroid/media/MediaCodecInfo$EncoderCapabilities;Landroid/media/MediaFormat;)V
    .locals 3
    .param p0, "sb"    # Ljava/lang/StringBuilder;
    .param p1, "caps"    # Landroid/media/MediaCodecInfo$EncoderCapabilities;
    .param p2, "mediaFormat"    # Landroid/media/MediaFormat;

    .line 325
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "[EncoderCaps] getComplexityRange = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Landroid/media/MediaCodecInfo$EncoderCapabilities;->getComplexityRange()Landroid/util/Range;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Landroidx/camera/video/internal/DebugUtils;->logToString(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 327
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_0

    .line 328
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "[EncoderCaps] getQualityRange = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 329
    invoke-static {p1}, Landroidx/camera/video/internal/compat/Api28Impl;->getQualityRange(Landroid/media/MediaCodecInfo$EncoderCapabilities;)Landroid/util/Range;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 328
    invoke-static {p0, v0}, Landroidx/camera/video/internal/DebugUtils;->logToString(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 334
    :cond_0
    :try_start_0
    const-string/jumbo v0, "bitrate-mode"

    invoke-virtual {p2, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v0

    .line 335
    .local v0, "bitrateMode":I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "[EncoderCaps] isBitrateModeSupported = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 336
    invoke-virtual {p1, v0}, Landroid/media/MediaCodecInfo$EncoderCapabilities;->isBitrateModeSupported(I)Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 335
    invoke-static {p0, v1}, Landroidx/camera/video/internal/DebugUtils;->logToString(Ljava/lang/StringBuilder;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 340
    goto :goto_1

    .line 338
    .end local v0    # "bitrateMode":I
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 339
    .local v0, "e":Ljava/lang/RuntimeException;
    :goto_0
    const-string/jumbo v1, "[EncoderCaps] mediaFormat does not contain bitrate mode"

    invoke-static {p0, v1}, Landroidx/camera/video/internal/DebugUtils;->logToString(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 341
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :goto_1
    return-void
.end method

.method public static dumpMediaCodecListForFormat(Landroid/media/MediaCodecList;Landroid/media/MediaFormat;)Ljava/lang/String;
    .locals 11
    .param p0, "mediaCodecList"    # Landroid/media/MediaCodecList;
    .param p1, "mediaFormat"    # Landroid/media/MediaFormat;

    .line 135
    const-string/jumbo v0, "]"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 136
    .local v1, "sb":Ljava/lang/StringBuilder;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "[Start] Dump MediaCodecList for mediaFormat "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroidx/camera/video/internal/DebugUtils;->logToString(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 138
    const-string/jumbo v2, "mime"

    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 139
    .local v2, "mime":Ljava/lang/String;
    invoke-virtual {p0}, Landroid/media/MediaCodecList;->getCodecInfos()[Landroid/media/MediaCodecInfo;

    move-result-object v3

    array-length v4, v3

    const/4 v5, 0x0

    move v6, v5

    :goto_0
    if-ge v6, v4, :cond_3

    aget-object v7, v3, v6

    .line 140
    .local v7, "mediaCodecInfo":Landroid/media/MediaCodecInfo;
    invoke-virtual {v7}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    move-result v8

    if-nez v8, :cond_0

    .line 141
    goto/16 :goto_3

    .line 144
    :cond_0
    const/4 v8, 0x1

    if-eqz v2, :cond_1

    move v9, v8

    goto :goto_1

    :cond_1
    move v9, v5

    :goto_1
    :try_start_0
    invoke-static {v9}, Landroidx/core/util/Preconditions;->checkArgument(Z)V

    .line 145
    invoke-virtual {v7, v2}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    move-result-object v9

    .line 146
    .local v9, "caps":Landroid/media/MediaCodecInfo$CodecCapabilities;
    if-eqz v9, :cond_2

    goto :goto_2

    :cond_2
    move v8, v5

    :goto_2
    invoke-static {v8}, Landroidx/core/util/Preconditions;->checkArgument(Z)V

    .line 148
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "[Start] ["

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v7}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v1, v8}, Landroidx/camera/video/internal/DebugUtils;->logToString(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 149
    invoke-static {v1, v9, p1}, Landroidx/camera/video/internal/DebugUtils;->dumpCodecCapabilities(Ljava/lang/StringBuilder;Landroid/media/MediaCodecInfo$CodecCapabilities;Landroid/media/MediaFormat;)V

    .line 150
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "[End] ["

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v7}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v1, v8}, Landroidx/camera/video/internal/DebugUtils;->logToString(Ljava/lang/StringBuilder;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 153
    .end local v9    # "caps":Landroid/media/MediaCodecInfo$CodecCapabilities;
    goto :goto_3

    .line 151
    :catch_0
    move-exception v8

    .line 152
    .local v8, "e":Ljava/lang/IllegalArgumentException;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "["

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v7}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, "] does not support mime "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v1, v9}, Landroidx/camera/video/internal/DebugUtils;->logToString(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 139
    .end local v7    # "mediaCodecInfo":Landroid/media/MediaCodecInfo;
    .end local v8    # "e":Ljava/lang/IllegalArgumentException;
    :goto_3
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_0

    .line 155
    :cond_3
    const-string/jumbo v0, "[End] Dump MediaCodecList"

    invoke-static {v1, v0}, Landroidx/camera/video/internal/DebugUtils;->logToString(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 157
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 158
    .local v0, "log":Ljava/lang/String;
    invoke-static {v0}, Landroidx/camera/video/internal/DebugUtils;->stringToLog(Ljava/lang/String;)V

    .line 159
    return-object v0
.end method

.method private static dumpVideoCapabilities(Ljava/lang/StringBuilder;Landroid/media/MediaCodecInfo$VideoCapabilities;Landroid/media/MediaFormat;)V
    .locals 10
    .param p0, "sb"    # Ljava/lang/StringBuilder;
    .param p1, "caps"    # Landroid/media/MediaCodecInfo$VideoCapabilities;
    .param p2, "mediaFormat"    # Landroid/media/MediaFormat;

    .line 227
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "[VideoCaps] getBitrateRange = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Landroid/media/MediaCodecInfo$VideoCapabilities;->getBitrateRange()Landroid/util/Range;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Landroidx/camera/video/internal/DebugUtils;->logToString(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 230
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "[VideoCaps] getSupportedWidths = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Landroid/media/MediaCodecInfo$VideoCapabilities;->getSupportedWidths()Landroid/util/Range;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", getWidthAlignment = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 231
    invoke-virtual {p1}, Landroid/media/MediaCodecInfo$VideoCapabilities;->getWidthAlignment()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 230
    invoke-static {p0, v0}, Landroidx/camera/video/internal/DebugUtils;->logToString(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 232
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "[VideoCaps] getSupportedHeights = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Landroid/media/MediaCodecInfo$VideoCapabilities;->getSupportedHeights()Landroid/util/Range;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", getHeightAlignment = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 233
    invoke-virtual {p1}, Landroid/media/MediaCodecInfo$VideoCapabilities;->getHeightAlignment()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 232
    invoke-static {p0, v0}, Landroidx/camera/video/internal/DebugUtils;->logToString(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 235
    const/4 v0, 0x1

    .line 239
    .local v0, "hasSize":Z
    const/4 v1, 0x1

    const/4 v2, 0x0

    :try_start_0
    const-string/jumbo v3, "width"

    invoke-virtual {p2, v3}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v3

    .line 240
    .local v3, "width":I
    const-string/jumbo v4, "height"

    invoke-virtual {p2, v4}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v4

    .line 241
    .local v4, "height":I
    if-lez v3, :cond_0

    if-lez v4, :cond_0

    move v5, v1

    goto :goto_0

    :cond_0
    move v5, v2

    :goto_0
    invoke-static {v5}, Landroidx/core/util/Preconditions;->checkArgument(Z)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 247
    goto :goto_2

    .line 242
    .end local v3    # "width":I
    .end local v4    # "height":I
    :catch_0
    move-exception v3

    goto :goto_1

    :catch_1
    move-exception v3

    .line 243
    .local v3, "e":Ljava/lang/RuntimeException;
    :goto_1
    const-string/jumbo v4, "[VideoCaps] mediaFormat does not contain valid width and height"

    invoke-static {p0, v4}, Landroidx/camera/video/internal/DebugUtils;->logToString(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 245
    move v4, v2

    .restart local v4    # "height":I
    move v5, v2

    .line 246
    .local v5, "width":I
    const/4 v0, 0x0

    move v3, v5

    .line 249
    .end local v5    # "width":I
    .local v3, "width":I
    :goto_2
    const-string/jumbo v5, "x"

    const-string v6, " = "

    if-eqz v0, :cond_1

    .line 251
    :try_start_1
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "[VideoCaps] getSupportedHeightsFor "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 252
    invoke-virtual {p1, v3}, Landroid/media/MediaCodecInfo$VideoCapabilities;->getSupportedHeightsFor(I)Landroid/util/Range;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 251
    invoke-static {p0, v7}, Landroidx/camera/video/internal/DebugUtils;->logToString(Ljava/lang/StringBuilder;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_2

    .line 255
    goto :goto_3

    .line 253
    :catch_2
    move-exception v7

    .line 254
    .local v7, "e":Ljava/lang/IllegalArgumentException;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "[VideoCaps] could not getSupportedHeightsFor "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {p0, v8}, Landroidx/camera/video/internal/DebugUtils;->logToString(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 257
    .end local v7    # "e":Ljava/lang/IllegalArgumentException;
    :goto_3
    :try_start_2
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "[VideoCaps] getSupportedWidthsFor "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 258
    invoke-virtual {p1, v4}, Landroid/media/MediaCodecInfo$VideoCapabilities;->getSupportedWidthsFor(I)Landroid/util/Range;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 257
    invoke-static {p0, v7}, Landroidx/camera/video/internal/DebugUtils;->logToString(Ljava/lang/StringBuilder;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_3

    .line 261
    goto :goto_4

    .line 259
    :catch_3
    move-exception v7

    .line 260
    .restart local v7    # "e":Ljava/lang/IllegalArgumentException;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "[VideoCaps] could not getSupportedWidthsFor "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {p0, v8}, Landroidx/camera/video/internal/DebugUtils;->logToString(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 262
    .end local v7    # "e":Ljava/lang/IllegalArgumentException;
    :goto_4
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "[VideoCaps] isSizeSupported for "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 263
    invoke-virtual {p1, v3, v4}, Landroid/media/MediaCodecInfo$VideoCapabilities;->isSizeSupported(II)Z

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 262
    invoke-static {p0, v7}, Landroidx/camera/video/internal/DebugUtils;->logToString(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 267
    :cond_1
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "[VideoCaps] getSupportedFrameRates = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 268
    invoke-virtual {p1}, Landroid/media/MediaCodecInfo$VideoCapabilities;->getSupportedFrameRates()Landroid/util/Range;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 267
    invoke-static {p0, v7}, Landroidx/camera/video/internal/DebugUtils;->logToString(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 271
    :try_start_3
    const-string/jumbo v7, "frame-rate"

    invoke-virtual {p2, v7}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v7

    .line 272
    .local v7, "frameRate":I
    if-lez v7, :cond_2

    goto :goto_5

    :cond_2
    move v1, v2

    :goto_5
    invoke-static {v1}, Landroidx/core/util/Preconditions;->checkArgument(Z)V
    :try_end_3
    .catch Ljava/lang/NullPointerException; {:try_start_3 .. :try_end_3} :catch_5
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_4

    .line 276
    goto :goto_7

    .line 273
    .end local v7    # "frameRate":I
    :catch_4
    move-exception v1

    goto :goto_6

    :catch_5
    move-exception v1

    .line 274
    .local v1, "e":Ljava/lang/RuntimeException;
    :goto_6
    const-string/jumbo v2, "[VideoCaps] mediaFormat does not contain frame rate"

    invoke-static {p0, v2}, Landroidx/camera/video/internal/DebugUtils;->logToString(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 275
    const/4 v7, 0x0

    .line 277
    .end local v1    # "e":Ljava/lang/RuntimeException;
    .restart local v7    # "frameRate":I
    :goto_7
    if-eqz v0, :cond_3

    .line 278
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "[VideoCaps] getSupportedFrameRatesFor "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 280
    invoke-virtual {p1, v3, v4}, Landroid/media/MediaCodecInfo$VideoCapabilities;->getSupportedFrameRatesFor(II)Landroid/util/Range;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 278
    invoke-static {p0, v1}, Landroidx/camera/video/internal/DebugUtils;->logToString(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 282
    :cond_3
    if-eqz v0, :cond_4

    if-lez v7, :cond_4

    .line 283
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "[VideoCaps] areSizeAndRateSupported for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    int-to-double v5, v7

    .line 285
    invoke-virtual {p1, v3, v4, v5, v6}, Landroid/media/MediaCodecInfo$VideoCapabilities;->areSizeAndRateSupported(IID)Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 283
    invoke-static {p0, v1}, Landroidx/camera/video/internal/DebugUtils;->logToString(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 287
    :cond_4
    return-void
.end method

.method private static formatInterval(J)Ljava/lang/String;
    .locals 13
    .param p0, "millis"    # J

    .line 119
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, p0, p1}, Ljava/util/concurrent/TimeUnit;->toHours(J)J

    move-result-wide v0

    .line 120
    .local v0, "hr":J
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    sget-object v3, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v0, v1}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v3

    sub-long v3, p0, v3

    invoke-virtual {v2, v3, v4}, Ljava/util/concurrent/TimeUnit;->toMinutes(J)J

    move-result-wide v2

    .line 121
    .local v2, "min":J
    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    sget-object v5, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    .line 122
    invoke-virtual {v5, v0, v1}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v5

    sub-long v5, p0, v5

    sget-object v7, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v7, v2, v3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v7

    sub-long/2addr v5, v7

    .line 121
    invoke-virtual {v4, v5, v6}, Ljava/util/concurrent/TimeUnit;->toSeconds(J)J

    move-result-wide v4

    .line 123
    .local v4, "sec":J
    sget-object v6, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v6, v0, v1}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v6

    sub-long v6, p0, v6

    sget-object v8, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v8, v2, v3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v8

    sub-long/2addr v6, v8

    sget-object v8, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 124
    invoke-virtual {v8, v4, v5}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v8

    sub-long/2addr v6, v8

    .line 125
    .local v6, "ms":J
    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    filled-new-array {v9, v10, v11, v12}, [Ljava/lang/Object;

    move-result-object v9

    const-string v10, "%02d:%02d:%02d.%03d"

    invoke-static {v8, v10, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    return-object v8
.end method

.method private static logToString(Ljava/lang/StringBuilder;Ljava/lang/String;)V
    .locals 1
    .param p0, "sb"    # Ljava/lang/StringBuilder;
    .param p1, "message"    # Ljava/lang/String;

    .line 344
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 345
    const-string v0, "\n"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 346
    return-void
.end method

.method public static readableBufferInfo(Landroid/media/MediaCodec$BufferInfo;)Ljava/lang/String;
    .locals 6
    .param p0, "bufferInfo"    # Landroid/media/MediaCodec$BufferInfo;

    .line 89
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 90
    .local v0, "sb":Ljava/lang/StringBuilder;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Dump BufferInfo: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\toffset: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v3, p0, Landroid/media/MediaCodec$BufferInfo;->offset:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\tsize: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v3, p0, Landroid/media/MediaCodec$BufferInfo;->size:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\tflag: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v3, p0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 96
    .local v1, "flagList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget v3, p0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/lit8 v3, v3, 0x4

    if-eqz v3, :cond_0

    .line 97
    const-string v3, "EOS"

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 99
    :cond_0
    iget v3, p0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/lit8 v3, v3, 0x2

    if-eqz v3, :cond_1

    .line 100
    const-string v3, "CODEC_CONFIG"

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 102
    :cond_1
    iget v3, p0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/lit8 v3, v3, 0x1

    if-eqz v3, :cond_2

    .line 103
    const-string v3, "KEY_FRAME"

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 105
    :cond_2
    iget v3, p0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/lit8 v3, v3, 0x8

    if-eqz v3, :cond_3

    .line 106
    const-string/jumbo v3, "PARTIAL_FRAME"

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    :cond_3
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    const-string v4, " ("

    if-nez v3, :cond_4

    .line 109
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, " | "

    invoke-static {v5, v1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, ")"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    :cond_4
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .end local v1    # "flagList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\tpresentationTime: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 114
    invoke-static {v2, v3}, Landroidx/camera/video/internal/DebugUtils;->readableUs(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 113
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static readableMs(J)Ljava/lang/String;
    .locals 1
    .param p0, "time"    # J

    .line 77
    invoke-static {p0, p1}, Landroidx/camera/video/internal/DebugUtils;->formatInterval(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static readableUs(J)Ljava/lang/String;
    .locals 2
    .param p0, "time"    # J

    .line 65
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, p0, p1}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    invoke-static {v0, v1}, Landroidx/camera/video/internal/DebugUtils;->readableMs(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static stringToLog(Ljava/lang/String;)V
    .locals 3
    .param p0, "log"    # Ljava/lang/String;

    .line 349
    const-string v0, "DebugUtils"

    invoke-static {v0}, Landroidx/camera/core/Logger;->isInfoEnabled(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 350
    new-instance v1, Ljava/util/Scanner;

    invoke-direct {v1, p0}, Ljava/util/Scanner;-><init>(Ljava/lang/String;)V

    .line 351
    .local v1, "scan":Ljava/util/Scanner;
    :goto_0
    invoke-virtual {v1}, Ljava/util/Scanner;->hasNextLine()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 352
    invoke-virtual {v1}, Ljava/util/Scanner;->nextLine()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroidx/camera/core/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 355
    .end local v1    # "scan":Ljava/util/Scanner;
    :cond_0
    return-void
.end method

.method private static toString(Landroid/media/MediaCodecInfo$CodecProfileLevel;)Ljava/lang/String;
    .locals 2
    .param p0, "codecProfileLevel"    # Landroid/media/MediaCodecInfo$CodecProfileLevel;

    .line 359
    if-nez p0, :cond_0

    .line 360
    const-string/jumbo v0, "null"

    return-object v0

    .line 362
    :cond_0
    iget v0, p0, Landroid/media/MediaCodecInfo$CodecProfileLevel;->level:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget v1, p0, Landroid/media/MediaCodecInfo$CodecProfileLevel;->profile:I

    .line 363
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v0, v1}, [Ljava/lang/Object;

    move-result-object v0

    .line 362
    const-string/jumbo v1, "{level=%d, profile=%d}"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
