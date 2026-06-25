.class public Landroidx/camera/video/internal/BackupHdrProfileEncoderProfilesProvider;
.super Ljava/lang/Object;
.source "BackupHdrProfileEncoderProfilesProvider.java"

# interfaces
.implements Landroidx/camera/core/impl/EncoderProfilesProvider;


# static fields
.field private static final DEFAULT_TIME_BASE:Landroidx/camera/core/impl/Timebase;

.field public static final DEFAULT_VALIDATOR:Landroidx/arch/core/util/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/arch/core/util/Function<",
            "Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;",
            "Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;",
            ">;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "BackupHdrProfileEncoderProfilesProvider"


# instance fields
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

.field private final mVideoProfileValidator:Landroidx/arch/core/util/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/arch/core/util/Function<",
            "Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;",
            "Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$67qTG3TxG2XAST9hOuskbf668jg(Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;)Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    .locals 0

    invoke-static {p0}, Landroidx/camera/video/internal/BackupHdrProfileEncoderProfilesProvider;->validateOrAdapt(Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;)Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 73
    new-instance v0, Landroidx/camera/video/internal/BackupHdrProfileEncoderProfilesProvider$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Landroidx/camera/video/internal/BackupHdrProfileEncoderProfilesProvider$$ExternalSyntheticLambda0;-><init>()V

    sput-object v0, Landroidx/camera/video/internal/BackupHdrProfileEncoderProfilesProvider;->DEFAULT_VALIDATOR:Landroidx/arch/core/util/Function;

    .line 77
    sget-object v0, Landroidx/camera/core/impl/Timebase;->UPTIME:Landroidx/camera/core/impl/Timebase;

    sput-object v0, Landroidx/camera/video/internal/BackupHdrProfileEncoderProfilesProvider;->DEFAULT_TIME_BASE:Landroidx/camera/core/impl/Timebase;

    return-void
.end method

.method public constructor <init>(Landroidx/camera/core/impl/EncoderProfilesProvider;Landroidx/arch/core/util/Function;)V
    .locals 1
    .param p1, "provider"    # Landroidx/camera/core/impl/EncoderProfilesProvider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/EncoderProfilesProvider;",
            "Landroidx/arch/core/util/Function<",
            "Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;",
            "Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;",
            ">;)V"
        }
    .end annotation

    .line 93
    .local p2, "validator":Landroidx/arch/core/util/Function;, "Landroidx/arch/core/util/Function<Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/camera/video/internal/BackupHdrProfileEncoderProfilesProvider;->mEncoderProfilesCache:Ljava/util/Map;

    .line 94
    iput-object p1, p0, Landroidx/camera/video/internal/BackupHdrProfileEncoderProfilesProvider;->mEncoderProfilesProvider:Landroidx/camera/core/impl/EncoderProfilesProvider;

    .line 95
    iput-object p2, p0, Landroidx/camera/video/internal/BackupHdrProfileEncoderProfilesProvider;->mVideoProfileValidator:Landroidx/arch/core/util/Function;

    .line 96
    return-void
.end method

.method private appendBackupVideoProfile(Landroidx/camera/core/impl/EncoderProfilesProxy;II)Landroidx/camera/core/impl/EncoderProfilesProxy;
    .locals 6
    .param p1, "baseProfiles"    # Landroidx/camera/core/impl/EncoderProfilesProxy;
    .param p2, "targetHdrFormat"    # I
    .param p3, "targetBitDepth"    # I

    .line 136
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 137
    return-object v0

    .line 140
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {p1}, Landroidx/camera/core/impl/EncoderProfilesProxy;->getVideoProfiles()Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 143
    .local v1, "videoProfiles":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;>;"
    const/4 v2, 0x0

    .line 144
    .local v2, "sdrProfile":Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    invoke-interface {p1}, Landroidx/camera/core/impl/EncoderProfilesProxy;->getVideoProfiles()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    .line 145
    .local v4, "videoProfile":Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    invoke-virtual {v4}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getHdrFormat()I

    move-result v5

    if-nez v5, :cond_1

    .line 146
    move-object v2, v4

    .line 147
    goto :goto_1

    .line 149
    .end local v4    # "videoProfile":Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    :cond_1
    goto :goto_0

    .line 150
    :cond_2
    :goto_1
    invoke-static {v2, p2, p3}, Landroidx/camera/video/internal/BackupHdrProfileEncoderProfilesProvider;->generateBackupProfile(Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;II)Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    move-result-object v3

    .line 155
    .local v3, "backupProfile":Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    iget-object v4, p0, Landroidx/camera/video/internal/BackupHdrProfileEncoderProfilesProvider;->mVideoProfileValidator:Landroidx/arch/core/util/Function;

    invoke-interface {v4, v3}, Landroidx/arch/core/util/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v3, v4

    check-cast v3, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    .line 157
    if-eqz v3, :cond_3

    .line 158
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 161
    :cond_3
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_4

    goto :goto_2

    .line 162
    :cond_4
    invoke-interface {p1}, Landroidx/camera/core/impl/EncoderProfilesProxy;->getDefaultDurationSeconds()I

    move-result v0

    .line 163
    invoke-interface {p1}, Landroidx/camera/core/impl/EncoderProfilesProxy;->getRecommendedFileFormat()I

    move-result v4

    .line 164
    invoke-interface {p1}, Landroidx/camera/core/impl/EncoderProfilesProxy;->getAudioProfiles()Ljava/util/List;

    move-result-object v5

    .line 161
    invoke-static {v0, v4, v5, v1}, Landroidx/camera/core/impl/EncoderProfilesProxy$ImmutableEncoderProfilesProxy;->create(IILjava/util/List;Ljava/util/List;)Landroidx/camera/core/impl/EncoderProfilesProxy$ImmutableEncoderProfilesProxy;

    move-result-object v0

    :goto_2
    return-object v0
.end method

.method private static deriveCodec(I)I
    .locals 3
    .param p0, "hdrFormat"    # I

    .line 205
    packed-switch p0, :pswitch_data_0

    .line 213
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Unexpected HDR format: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 211
    :pswitch_0
    const/4 v0, 0x5

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private static deriveMediaType(I)Ljava/lang/String;
    .locals 1
    .param p0, "codec"    # I

    .line 236
    invoke-static {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy;->getVideoCodecMimeType(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static deriveProfile(I)I
    .locals 3
    .param p0, "hdrFormat"    # I

    .line 218
    packed-switch p0, :pswitch_data_0

    .line 230
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Unexpected HDR format: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 228
    :pswitch_0
    const/4 v0, -0x1

    return v0

    .line 226
    :pswitch_1
    const/16 v0, 0x2000

    return v0

    .line 224
    :pswitch_2
    const/16 v0, 0x1000

    return v0

    .line 222
    :pswitch_3
    const/4 v0, 0x2

    return v0

    .line 220
    :pswitch_4
    const/4 v0, 0x1

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static generateBackupProfile(Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;II)Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    .locals 13
    .param p0, "baseProfile"    # Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    .param p1, "targetHdrFormat"    # I
    .param p2, "targetBitDepth"    # I

    .line 172
    if-nez p0, :cond_0

    .line 173
    const/4 v0, 0x0

    return-object v0

    .line 177
    :cond_0
    invoke-virtual {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getCodec()I

    move-result v0

    .line 178
    .local v0, "derivedCodec":I
    invoke-virtual {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getMediaType()Ljava/lang/String;

    move-result-object v1

    .line 179
    .local v1, "derivedMediaType":Ljava/lang/String;
    invoke-virtual {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getProfile()I

    move-result v2

    .line 180
    .local v2, "derivedProfile":I
    invoke-virtual {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getHdrFormat()I

    move-result v3

    if-eq p1, v3, :cond_1

    .line 181
    invoke-static {p1}, Landroidx/camera/video/internal/BackupHdrProfileEncoderProfilesProvider;->deriveCodec(I)I

    move-result v0

    .line 182
    invoke-static {v0}, Landroidx/camera/video/internal/BackupHdrProfileEncoderProfilesProvider;->deriveMediaType(I)Ljava/lang/String;

    move-result-object v1

    .line 183
    invoke-static {p1}, Landroidx/camera/video/internal/BackupHdrProfileEncoderProfilesProvider;->deriveProfile(I)I

    move-result v2

    move v3, v0

    move-object v4, v1

    move v9, v2

    goto :goto_0

    .line 180
    :cond_1
    move v3, v0

    move-object v4, v1

    move v9, v2

    .line 187
    .end local v0    # "derivedCodec":I
    .end local v1    # "derivedMediaType":Ljava/lang/String;
    .end local v2    # "derivedProfile":I
    .local v3, "derivedCodec":I
    .local v4, "derivedMediaType":Ljava/lang/String;
    .local v9, "derivedProfile":I
    :goto_0
    invoke-virtual {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getBitrate()I

    move-result v0

    .line 188
    invoke-virtual {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getBitDepth()I

    move-result v1

    .line 187
    invoke-static {v0, p2, v1}, Landroidx/camera/video/internal/BackupHdrProfileEncoderProfilesProvider;->scaleBitrate(III)I

    move-result v5

    .line 190
    .local v5, "derivedBitrate":I
    nop

    .line 194
    invoke-virtual {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getFrameRate()I

    move-result v6

    .line 195
    invoke-virtual {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getWidth()I

    move-result v7

    .line 196
    invoke-virtual {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getHeight()I

    move-result v8

    .line 199
    invoke-virtual {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getChromaSubsampling()I

    move-result v11

    .line 190
    move v12, p1

    move v10, p2

    .end local p1    # "targetHdrFormat":I
    .end local p2    # "targetBitDepth":I
    .local v10, "targetBitDepth":I
    .local v12, "targetHdrFormat":I
    invoke-static/range {v3 .. v12}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->create(ILjava/lang/String;IIIIIIII)Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    move-result-object p1

    return-object p1
.end method

.method private getProfilesInternal(I)Landroidx/camera/core/impl/EncoderProfilesProxy;
    .locals 4
    .param p1, "quality"    # I

    .line 117
    iget-object v0, p0, Landroidx/camera/video/internal/BackupHdrProfileEncoderProfilesProvider;->mEncoderProfilesCache:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 118
    iget-object v0, p0, Landroidx/camera/video/internal/BackupHdrProfileEncoderProfilesProvider;->mEncoderProfilesCache:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/EncoderProfilesProxy;

    return-object v0

    .line 121
    :cond_0
    const/4 v0, 0x0

    .line 122
    .local v0, "profiles":Landroidx/camera/core/impl/EncoderProfilesProxy;
    iget-object v1, p0, Landroidx/camera/video/internal/BackupHdrProfileEncoderProfilesProvider;->mEncoderProfilesProvider:Landroidx/camera/core/impl/EncoderProfilesProvider;

    invoke-interface {v1, p1}, Landroidx/camera/core/impl/EncoderProfilesProvider;->hasProfile(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 123
    iget-object v1, p0, Landroidx/camera/video/internal/BackupHdrProfileEncoderProfilesProvider;->mEncoderProfilesProvider:Landroidx/camera/core/impl/EncoderProfilesProvider;

    invoke-interface {v1, p1}, Landroidx/camera/core/impl/EncoderProfilesProvider;->getAll(I)Landroidx/camera/core/impl/EncoderProfilesProxy;

    move-result-object v1

    .line 126
    .local v1, "baseProfiles":Landroidx/camera/core/impl/EncoderProfilesProxy;
    const/4 v2, 0x1

    const/16 v3, 0xa

    invoke-direct {p0, v1, v2, v3}, Landroidx/camera/video/internal/BackupHdrProfileEncoderProfilesProvider;->appendBackupVideoProfile(Landroidx/camera/core/impl/EncoderProfilesProxy;II)Landroidx/camera/core/impl/EncoderProfilesProxy;

    move-result-object v0

    .line 127
    iget-object v2, p0, Landroidx/camera/video/internal/BackupHdrProfileEncoderProfilesProvider;->mEncoderProfilesCache:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    .end local v1    # "baseProfiles":Landroidx/camera/core/impl/EncoderProfilesProxy;
    :cond_1
    return-object v0
.end method

.method private static modifyBitrate(Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;I)Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    .locals 10
    .param p0, "baseProfile"    # Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    .param p1, "newBitrate"    # I

    .line 297
    nop

    .line 298
    invoke-virtual {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getCodec()I

    move-result v0

    .line 299
    invoke-virtual {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getMediaType()Ljava/lang/String;

    move-result-object v1

    .line 301
    invoke-virtual {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getFrameRate()I

    move-result v3

    .line 302
    invoke-virtual {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getWidth()I

    move-result v4

    .line 303
    invoke-virtual {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getHeight()I

    move-result v5

    .line 304
    invoke-virtual {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getProfile()I

    move-result v6

    .line 305
    invoke-virtual {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getBitDepth()I

    move-result v7

    .line 306
    invoke-virtual {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getChromaSubsampling()I

    move-result v8

    .line 307
    invoke-virtual {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getHdrFormat()I

    move-result v9

    .line 297
    move v2, p1

    .end local p1    # "newBitrate":I
    .local v2, "newBitrate":I
    invoke-static/range {v0 .. v9}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->create(ILjava/lang/String;IIIIIIII)Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    move-result-object p1

    return-object p1
.end method

.method private static scaleBitrate(III)I
    .locals 7
    .param p0, "baseBitrate"    # I
    .param p1, "actualBitDepth"    # I
    .param p2, "baseBitDepth"    # I

    .line 243
    if-ne p1, p2, :cond_0

    .line 244
    return p0

    .line 247
    :cond_0
    new-instance v0, Landroid/util/Rational;

    invoke-direct {v0, p1, p2}, Landroid/util/Rational;-><init>(II)V

    .line 248
    .local v0, "bitDepthRatio":Landroid/util/Rational;
    int-to-double v1, p0

    invoke-virtual {v0}, Landroid/util/Rational;->doubleValue()D

    move-result-wide v3

    mul-double/2addr v1, v3

    double-to-int v1, v1

    .line 250
    .local v1, "resolvedBitrate":I
    const-string v2, "BackupHdrProfileEncoderProfilesProvider"

    invoke-static {v2}, Landroidx/camera/core/Logger;->isDebugEnabled(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 251
    nop

    .line 252
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    filled-new-array {v3, v4, v5, v6}, [Ljava/lang/Object;

    move-result-object v3

    .line 251
    const-string v4, "Base Bitrate(%dbps) * Bit Depth Ratio (%d / %d) = %d"

    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 253
    .local v3, "debugString":Ljava/lang/String;
    invoke-static {v2, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 256
    .end local v3    # "debugString":Ljava/lang/String;
    :cond_1
    return v1
.end method

.method static toVideoEncoderConfig(Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;)Landroidx/camera/video/internal/encoder/VideoEncoderConfig;
    .locals 4
    .param p0, "videoProfile"    # Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    .line 284
    invoke-static {}, Landroidx/camera/video/internal/encoder/VideoEncoderConfig;->builder()Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;

    move-result-object v0

    .line 285
    invoke-virtual {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getMediaType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;->setMimeType(Ljava/lang/String;)Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;

    move-result-object v0

    .line 286
    invoke-virtual {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getProfile()I

    move-result v1

    invoke-virtual {v0, v1}, Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;->setProfile(I)Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;

    move-result-object v0

    new-instance v1, Landroid/util/Size;

    .line 287
    invoke-virtual {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getHeight()I

    move-result v3

    invoke-direct {v1, v2, v3}, Landroid/util/Size;-><init>(II)V

    invoke-virtual {v0, v1}, Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;->setResolution(Landroid/util/Size;)Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;

    move-result-object v0

    .line 288
    invoke-virtual {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getFrameRate()I

    move-result v1

    invoke-virtual {v0, v1}, Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;->setFrameRate(I)Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;

    move-result-object v0

    .line 289
    invoke-virtual {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getBitrate()I

    move-result v1

    invoke-virtual {v0, v1}, Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;->setBitrate(I)Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;

    move-result-object v0

    sget-object v1, Landroidx/camera/video/internal/BackupHdrProfileEncoderProfilesProvider;->DEFAULT_TIME_BASE:Landroidx/camera/core/impl/Timebase;

    .line 290
    invoke-virtual {v0, v1}, Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;->setInputTimebase(Landroidx/camera/core/impl/Timebase;)Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;

    move-result-object v0

    .line 291
    invoke-virtual {v0}, Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;->build()Landroidx/camera/video/internal/encoder/VideoEncoderConfig;

    move-result-object v0

    .line 284
    return-object v0
.end method

.method private static validateOrAdapt(Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;)Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    .locals 6
    .param p0, "profile"    # Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    .line 265
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 266
    return-object v0

    .line 269
    :cond_0
    invoke-static {p0}, Landroidx/camera/video/internal/BackupHdrProfileEncoderProfilesProvider;->toVideoEncoderConfig(Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;)Landroidx/camera/video/internal/encoder/VideoEncoderConfig;

    move-result-object v1

    .line 271
    .local v1, "videoEncoderConfig":Landroidx/camera/video/internal/encoder/VideoEncoderConfig;
    :try_start_0
    invoke-static {v1}, Landroidx/camera/video/internal/encoder/VideoEncoderInfoImpl;->from(Landroidx/camera/video/internal/encoder/VideoEncoderConfig;)Landroidx/camera/video/internal/encoder/VideoEncoderInfoImpl;

    move-result-object v2

    .line 272
    .local v2, "videoEncoderInfo":Landroidx/camera/video/internal/encoder/VideoEncoderInfo;
    invoke-virtual {v1}, Landroidx/camera/video/internal/encoder/VideoEncoderConfig;->getBitrate()I

    move-result v3

    .line 273
    .local v3, "baseBitrate":I
    invoke-interface {v2}, Landroidx/camera/video/internal/encoder/VideoEncoderInfo;->getSupportedBitrateRange()Landroid/util/Range;

    move-result-object v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/util/Range;->clamp(Ljava/lang/Comparable;)Ljava/lang/Comparable;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 274
    .local v4, "newBitrate":I
    if-ne v4, v3, :cond_1

    move-object v0, p0

    goto :goto_0

    :cond_1
    invoke-static {p0, v4}, Landroidx/camera/video/internal/BackupHdrProfileEncoderProfilesProvider;->modifyBitrate(Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;I)Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    move-result-object v0
    :try_end_0
    .catch Landroidx/camera/video/internal/encoder/InvalidConfigException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-object v0

    .line 275
    .end local v2    # "videoEncoderInfo":Landroidx/camera/video/internal/encoder/VideoEncoderInfo;
    .end local v3    # "baseBitrate":I
    .end local v4    # "newBitrate":I
    :catch_0
    move-exception v2

    .line 277
    .local v2, "e":Landroidx/camera/video/internal/encoder/InvalidConfigException;
    return-object v0
.end method


# virtual methods
.method public getAll(I)Landroidx/camera/core/impl/EncoderProfilesProxy;
    .locals 1
    .param p1, "quality"    # I

    .line 112
    invoke-direct {p0, p1}, Landroidx/camera/video/internal/BackupHdrProfileEncoderProfilesProvider;->getProfilesInternal(I)Landroidx/camera/core/impl/EncoderProfilesProxy;

    move-result-object v0

    return-object v0
.end method

.method public hasProfile(I)Z
    .locals 2
    .param p1, "quality"    # I

    .line 101
    iget-object v0, p0, Landroidx/camera/video/internal/BackupHdrProfileEncoderProfilesProvider;->mEncoderProfilesProvider:Landroidx/camera/core/impl/EncoderProfilesProvider;

    invoke-interface {v0, p1}, Landroidx/camera/core/impl/EncoderProfilesProvider;->hasProfile(I)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 102
    return v1

    .line 105
    :cond_0
    invoke-direct {p0, p1}, Landroidx/camera/video/internal/BackupHdrProfileEncoderProfilesProvider;->getProfilesInternal(I)Landroidx/camera/core/impl/EncoderProfilesProxy;

    move-result-object v0

    if-eqz v0, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method
