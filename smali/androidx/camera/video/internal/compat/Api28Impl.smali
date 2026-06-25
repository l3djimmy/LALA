.class public final Landroidx/camera/video/internal/compat/Api28Impl;
.super Ljava/lang/Object;
.source "Api28Impl.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    return-void
.end method

.method public static getQualityRange(Landroid/media/MediaCodecInfo$EncoderCapabilities;)Landroid/util/Range;
    .locals 1
    .param p0, "caps"    # Landroid/media/MediaCodecInfo$EncoderCapabilities;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/media/MediaCodecInfo$EncoderCapabilities;",
            ")",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 42
    invoke-virtual {p0}, Landroid/media/MediaCodecInfo$EncoderCapabilities;->getQualityRange()Landroid/util/Range;

    move-result-object v0

    return-object v0
.end method
