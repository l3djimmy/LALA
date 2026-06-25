.class public final Landroidx/camera/video/internal/compat/Api31Impl;
.super Ljava/lang/Object;
.source "Api31Impl.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    return-void
.end method

.method public static getInputChannelCountRanges(Landroid/media/MediaCodecInfo$AudioCapabilities;)[Landroid/util/Range;
    .locals 1
    .param p0, "caps"    # Landroid/media/MediaCodecInfo$AudioCapabilities;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/media/MediaCodecInfo$AudioCapabilities;",
            ")[",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 54
    invoke-virtual {p0}, Landroid/media/MediaCodecInfo$AudioCapabilities;->getInputChannelCountRanges()[Landroid/util/Range;

    move-result-object v0

    return-object v0
.end method

.method public static getMinInputChannelCount(Landroid/media/MediaCodecInfo$AudioCapabilities;)I
    .locals 1
    .param p0, "caps"    # Landroid/media/MediaCodecInfo$AudioCapabilities;

    .line 43
    invoke-virtual {p0}, Landroid/media/MediaCodecInfo$AudioCapabilities;->getMinInputChannelCount()I

    move-result v0

    return v0
.end method

.method public static setContext(Landroid/media/AudioRecord$Builder;Landroid/content/Context;)V
    .locals 0
    .param p0, "builder"    # Landroid/media/AudioRecord$Builder;
    .param p1, "context"    # Landroid/content/Context;

    .line 62
    invoke-virtual {p0, p1}, Landroid/media/AudioRecord$Builder;->setContext(Landroid/content/Context;)Landroid/media/AudioRecord$Builder;

    .line 63
    return-void
.end method
