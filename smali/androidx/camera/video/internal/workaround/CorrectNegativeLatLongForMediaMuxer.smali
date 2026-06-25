.class public final Landroidx/camera/video/internal/workaround/CorrectNegativeLatLongForMediaMuxer;
.super Ljava/lang/Object;
.source "CorrectNegativeLatLongForMediaMuxer.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    return-void
.end method

.method public static adjustGeoLocation(DD)Landroid/util/Pair;
    .locals 2
    .param p0, "latitude"    # D
    .param p2, "longitude"    # D
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(DD)",
            "Landroid/util/Pair<",
            "Ljava/lang/Double;",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation

    .line 59
    const-class v0, Landroidx/camera/video/internal/compat/quirk/NegativeLatLongSavesIncorrectlyQuirk;

    invoke-static {v0}, Landroidx/camera/video/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 60
    invoke-static {p0, p1}, Landroidx/camera/video/internal/workaround/CorrectNegativeLatLongForMediaMuxer;->adjustInternal(D)D

    move-result-wide p0

    .line 61
    invoke-static {p2, p3}, Landroidx/camera/video/internal/workaround/CorrectNegativeLatLongForMediaMuxer;->adjustInternal(D)D

    move-result-wide p2

    .line 63
    :cond_0
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v0

    return-object v0
.end method

.method private static adjustInternal(D)D
    .locals 6
    .param p0, "value"    # D

    .line 67
    const-wide/16 v0, 0x0

    cmpl-double v0, p0, v0

    if-ltz v0, :cond_0

    move-wide v2, p0

    goto :goto_0

    :cond_0
    const-wide v0, 0x40c3880000000000L    # 10000.0

    mul-double v2, p0, v0

    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    sub-double/2addr v2, v4

    div-double/2addr v2, v0

    :goto_0
    return-wide v2
.end method
