.class public interface abstract Landroidx/camera/core/impl/EncoderProfilesProxy;
.super Ljava/lang/Object;
.source "EncoderProfilesProxy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;,
        Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;,
        Landroidx/camera/core/impl/EncoderProfilesProxy$ImmutableEncoderProfilesProxy;
    }
.end annotation


# static fields
.field public static final CODEC_PROFILE_NONE:I = -0x1


# direct methods
.method public static getAudioCodecMimeType(I)Ljava/lang/String;
    .locals 1
    .param p0, "codec"    # I

    .line 284
    packed-switch p0, :pswitch_data_0

    .line 301
    const-string/jumbo v0, "audio/none"

    return-object v0

    .line 294
    :pswitch_0
    const-string/jumbo v0, "audio/opus"

    return-object v0

    .line 296
    :pswitch_1
    const-string/jumbo v0, "audio/vorbis"

    return-object v0

    .line 288
    :pswitch_2
    const-string/jumbo v0, "audio/mp4a-latm"

    return-object v0

    .line 292
    :pswitch_3
    const-string/jumbo v0, "audio/amr-wb"

    return-object v0

    .line 290
    :pswitch_4
    const-string/jumbo v0, "audio/3gpp"

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static getRequiredAudioProfile(I)I
    .locals 1
    .param p0, "codec"    # I

    .line 317
    packed-switch p0, :pswitch_data_0

    .line 325
    const/4 v0, -0x1

    return v0

    .line 321
    :pswitch_0
    const/16 v0, 0x27

    return v0

    .line 323
    :pswitch_1
    const/4 v0, 0x5

    return v0

    .line 319
    :pswitch_2
    const/4 v0, 0x2

    return v0

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static getVideoCodecMimeType(I)Ljava/lang/String;
    .locals 1
    .param p0, "codec"    # I

    .line 247
    packed-switch p0, :pswitch_data_0

    .line 270
    const-string/jumbo v0, "video/none"

    return-object v0

    .line 265
    :pswitch_0
    const-string/jumbo v0, "video/av01"

    return-object v0

    .line 263
    :pswitch_1
    const-string/jumbo v0, "video/dolby-vision"

    return-object v0

    .line 261
    :pswitch_2
    const-string/jumbo v0, "video/x-vnd.on2.vp9"

    return-object v0

    .line 255
    :pswitch_3
    const-string/jumbo v0, "video/hevc"

    return-object v0

    .line 257
    :pswitch_4
    const-string/jumbo v0, "video/x-vnd.on2.vp8"

    return-object v0

    .line 259
    :pswitch_5
    const-string/jumbo v0, "video/mp4v-es"

    return-object v0

    .line 253
    :pswitch_6
    const-string/jumbo v0, "video/avc"

    return-object v0

    .line 251
    :pswitch_7
    const-string/jumbo v0, "video/3gpp"

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public abstract getAudioProfiles()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getDefaultDurationSeconds()I
.end method

.method public abstract getRecommendedFileFormat()I
.end method

.method public abstract getVideoProfiles()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;",
            ">;"
        }
    .end annotation
.end method
