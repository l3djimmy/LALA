.class Landroidx/camera/video/internal/compat/quirk/MediaCodecInfoReportIncorrectInfoQuirk$MediaFormatResolver;
.super Ljava/lang/Object;
.source "MediaCodecInfoReportIncorrectInfoQuirk.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/video/internal/compat/quirk/MediaCodecInfoReportIncorrectInfoQuirk;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MediaFormatResolver"
.end annotation


# instance fields
.field private final mMediaFormat:Landroid/media/MediaFormat;


# direct methods
.method constructor <init>(Landroid/media/MediaFormat;)V
    .locals 0
    .param p1, "mediaFormat"    # Landroid/media/MediaFormat;

    .line 176
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 177
    iput-object p1, p0, Landroidx/camera/video/internal/compat/quirk/MediaCodecInfoReportIncorrectInfoQuirk$MediaFormatResolver;->mMediaFormat:Landroid/media/MediaFormat;

    .line 178
    return-void
.end method

.method private getMime()Ljava/lang/String;
    .locals 2

    .line 201
    iget-object v0, p0, Landroidx/camera/video/internal/compat/quirk/MediaCodecInfoReportIncorrectInfoQuirk$MediaFormatResolver;->mMediaFormat:Landroid/media/MediaFormat;

    const-string/jumbo v1, "mime"

    invoke-virtual {v0, v1}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method isAvc()Z
    .locals 2

    .line 186
    const-string/jumbo v0, "video/avc"

    invoke-direct {p0}, Landroidx/camera/video/internal/compat/quirk/MediaCodecInfoReportIncorrectInfoQuirk$MediaFormatResolver;->getMime()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method isMpeg4()Z
    .locals 2

    .line 190
    const-string/jumbo v0, "video/mp4v-es"

    invoke-direct {p0}, Landroidx/camera/video/internal/compat/quirk/MediaCodecInfoReportIncorrectInfoQuirk$MediaFormatResolver;->getMime()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method isSize(II)Z
    .locals 3
    .param p1, "width"    # I
    .param p2, "height"    # I

    .line 194
    iget-object v0, p0, Landroidx/camera/video/internal/compat/quirk/MediaCodecInfoReportIncorrectInfoQuirk$MediaFormatResolver;->mMediaFormat:Landroid/media/MediaFormat;

    const-string/jumbo v1, "width"

    invoke-virtual {v0, v1}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v0

    .line 195
    .local v0, "formatWidth":I
    iget-object v1, p0, Landroidx/camera/video/internal/compat/quirk/MediaCodecInfoReportIncorrectInfoQuirk$MediaFormatResolver;->mMediaFormat:Landroid/media/MediaFormat;

    const-string/jumbo v2, "height"

    invoke-virtual {v1, v2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v1

    .line 196
    .local v1, "formatHeight":I
    if-ne v0, p1, :cond_0

    if-ne v1, p2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    return v2
.end method

.method isVideo()Z
    .locals 2

    .line 181
    invoke-direct {p0}, Landroidx/camera/video/internal/compat/quirk/MediaCodecInfoReportIncorrectInfoQuirk$MediaFormatResolver;->getMime()Ljava/lang/String;

    move-result-object v0

    .line 182
    .local v0, "mimeType":Ljava/lang/String;
    if-eqz v0, :cond_0

    const-string/jumbo v1, "video/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method
