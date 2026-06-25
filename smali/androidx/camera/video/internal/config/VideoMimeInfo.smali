.class public abstract Landroidx/camera/video/internal/config/VideoMimeInfo;
.super Landroidx/camera/video/internal/config/MimeInfo;
.source "VideoMimeInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/video/internal/config/VideoMimeInfo$Builder;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Landroidx/camera/video/internal/config/MimeInfo;-><init>()V

    return-void
.end method

.method public static builder(Ljava/lang/String;)Landroidx/camera/video/internal/config/VideoMimeInfo$Builder;
    .locals 2
    .param p0, "mimeType"    # Ljava/lang/String;

    .line 51
    new-instance v0, Landroidx/camera/video/internal/config/AutoValue_VideoMimeInfo$Builder;

    invoke-direct {v0}, Landroidx/camera/video/internal/config/AutoValue_VideoMimeInfo$Builder;-><init>()V

    .line 52
    invoke-virtual {v0, p0}, Landroidx/camera/video/internal/config/AutoValue_VideoMimeInfo$Builder;->setMimeType(Ljava/lang/String;)Landroidx/camera/video/internal/config/VideoMimeInfo$Builder;

    move-result-object v0

    .line 53
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroidx/camera/video/internal/config/VideoMimeInfo$Builder;->setProfile(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/internal/config/VideoMimeInfo$Builder;

    .line 51
    return-object v0
.end method


# virtual methods
.method public abstract getCompatibleVideoProfile()Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
.end method
