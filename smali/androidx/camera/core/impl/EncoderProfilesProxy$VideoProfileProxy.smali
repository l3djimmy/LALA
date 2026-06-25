.class public abstract Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
.super Ljava/lang/Object;
.source "EncoderProfilesProxy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/core/impl/EncoderProfilesProxy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "VideoProfileProxy"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy$VideoEncoder;
    }
.end annotation


# static fields
.field public static final BIT_DEPTH_10:I = 0xa

.field public static final BIT_DEPTH_8:I = 0x8

.field public static final MEDIA_TYPE_NONE:Ljava/lang/String; = "video/none"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(ILjava/lang/String;IIIIIIII)Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    .locals 11
    .param p0, "codec"    # I
    .param p1, "mediaType"    # Ljava/lang/String;
    .param p2, "bitrate"    # I
    .param p3, "frameRate"    # I
    .param p4, "width"    # I
    .param p5, "height"    # I
    .param p6, "profile"    # I
    .param p7, "bitDepth"    # I
    .param p8, "chromaSubsampling"    # I
    .param p9, "hdrFormat"    # I

    .line 112
    new-instance v0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;

    move v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p8

    move/from16 v10, p9

    invoke-direct/range {v0 .. v10}, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;-><init>(ILjava/lang/String;IIIIIIII)V

    return-object v0
.end method


# virtual methods
.method public abstract getBitDepth()I
.end method

.method public abstract getBitrate()I
.end method

.method public abstract getChromaSubsampling()I
.end method

.method public abstract getCodec()I
.end method

.method public abstract getFrameRate()I
.end method

.method public abstract getHdrFormat()I
.end method

.method public abstract getHeight()I
.end method

.method public abstract getMediaType()Ljava/lang/String;
.end method

.method public abstract getProfile()I
.end method

.method public abstract getWidth()I
.end method
