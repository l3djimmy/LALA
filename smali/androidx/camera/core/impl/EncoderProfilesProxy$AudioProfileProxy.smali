.class public abstract Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;
.super Ljava/lang/Object;
.source "EncoderProfilesProxy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/core/impl/EncoderProfilesProxy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "AudioProfileProxy"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy$AudioEncoder;
    }
.end annotation


# static fields
.field public static final MEDIA_TYPE_NONE:Ljava/lang/String; = "audio/none"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 164
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(ILjava/lang/String;IIII)Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;
    .locals 7
    .param p0, "codec"    # I
    .param p1, "mediaType"    # Ljava/lang/String;
    .param p2, "bitRate"    # I
    .param p3, "sampleRate"    # I
    .param p4, "channels"    # I
    .param p5, "profile"    # I

    .line 184
    new-instance v0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_AudioProfileProxy;

    move v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    .end local p0    # "codec":I
    .end local p1    # "mediaType":Ljava/lang/String;
    .end local p2    # "bitRate":I
    .end local p3    # "sampleRate":I
    .end local p4    # "channels":I
    .end local p5    # "profile":I
    .local v1, "codec":I
    .local v2, "mediaType":Ljava/lang/String;
    .local v3, "bitRate":I
    .local v4, "sampleRate":I
    .local v5, "channels":I
    .local v6, "profile":I
    invoke-direct/range {v0 .. v6}, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_AudioProfileProxy;-><init>(ILjava/lang/String;IIII)V

    return-object v0
.end method


# virtual methods
.method public abstract getBitrate()I
.end method

.method public abstract getChannels()I
.end method

.method public abstract getCodec()I
.end method

.method public abstract getMediaType()Ljava/lang/String;
.end method

.method public abstract getProfile()I
.end method

.method public abstract getSampleRate()I
.end method
