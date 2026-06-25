.class public Landroidx/camera/video/internal/compat/quirk/VideoEncoderCrashQuirk;
.super Ljava/lang/Object;
.source "VideoEncoderCrashQuirk.java"

# interfaces
.implements Landroidx/camera/video/internal/compat/quirk/VideoQualityQuirk;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static isPositivoTwist2Pro()Z
    .locals 2

    .line 44
    const-string/jumbo v0, "positivo"

    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "twist 2 pro"

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method static load()Z
    .locals 1

    .line 40
    invoke-static {}, Landroidx/camera/video/internal/compat/quirk/VideoEncoderCrashQuirk;->isPositivoTwist2Pro()Z

    move-result v0

    return v0
.end method


# virtual methods
.method public isProblematicVideoQuality(Landroidx/camera/core/impl/CameraInfoInternal;Landroidx/camera/video/Quality;)Z
    .locals 2
    .param p1, "cameraInfo"    # Landroidx/camera/core/impl/CameraInfoInternal;
    .param p2, "quality"    # Landroidx/camera/video/Quality;

    .line 52
    invoke-static {}, Landroidx/camera/video/internal/compat/quirk/VideoEncoderCrashQuirk;->isPositivoTwist2Pro()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 53
    invoke-interface {p1}, Landroidx/camera/core/impl/CameraInfoInternal;->getLensFacing()I

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Landroidx/camera/video/Quality;->SD:Landroidx/camera/video/Quality;

    if-ne p2, v0, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1

    .line 55
    :cond_1
    return v1
.end method

.method public workaroundBySurfaceProcessing()Z
    .locals 1

    .line 61
    const/4 v0, 0x0

    return v0
.end method
