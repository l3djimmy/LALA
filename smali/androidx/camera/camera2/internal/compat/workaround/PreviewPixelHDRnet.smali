.class public Landroidx/camera/camera2/internal/compat/workaround/PreviewPixelHDRnet;
.super Ljava/lang/Object;
.source "PreviewPixelHDRnet.java"


# static fields
.field public static final ASPECT_RATIO_16_9:Landroid/util/Rational;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 40
    new-instance v0, Landroid/util/Rational;

    const/16 v1, 0x10

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Landroid/util/Rational;-><init>(II)V

    sput-object v0, Landroidx/camera/camera2/internal/compat/workaround/PreviewPixelHDRnet;->ASPECT_RATIO_16_9:Landroid/util/Rational;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    return-void
.end method

.method private static isAspectRatioMatch(Landroid/util/Size;Landroid/util/Rational;)Z
    .locals 3
    .param p0, "resolution"    # Landroid/util/Size;
    .param p1, "aspectRatio"    # Landroid/util/Rational;

    .line 70
    new-instance v0, Landroid/util/Rational;

    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/util/Rational;-><init>(II)V

    invoke-virtual {p1, v0}, Landroid/util/Rational;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static setHDRnet(Landroid/util/Size;Landroidx/camera/core/impl/SessionConfig$Builder;)V
    .locals 4
    .param p0, "resolution"    # Landroid/util/Size;
    .param p1, "sessionBuilder"    # Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 52
    const-class v0, Landroidx/camera/camera2/internal/compat/quirk/PreviewPixelHDRnetQuirk;

    invoke-static {v0}, Landroidx/camera/camera2/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v0

    check-cast v0, Landroidx/camera/camera2/internal/compat/quirk/PreviewPixelHDRnetQuirk;

    .line 53
    .local v0, "quirk":Landroidx/camera/camera2/internal/compat/quirk/PreviewPixelHDRnetQuirk;
    if-nez v0, :cond_0

    .line 54
    return-void

    .line 57
    :cond_0
    sget-object v1, Landroidx/camera/camera2/internal/compat/workaround/PreviewPixelHDRnet;->ASPECT_RATIO_16_9:Landroid/util/Rational;

    invoke-static {p0, v1}, Landroidx/camera/camera2/internal/compat/workaround/PreviewPixelHDRnet;->isAspectRatioMatch(Landroid/util/Size;Landroid/util/Rational;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 58
    return-void

    .line 61
    :cond_1
    new-instance v1, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    invoke-direct {v1}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;-><init>()V

    .line 62
    .local v1, "camera2ConfigBuilder":Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->TONEMAP_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 63
    const/4 v3, 0x2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 62
    invoke-virtual {v1, v2, v3}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;->setCaptureRequestOption(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    .line 64
    invoke-virtual {v1}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;->build()Landroidx/camera/camera2/impl/Camera2ImplConfig;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroidx/camera/core/impl/SessionConfig$Builder;->addImplementationOptions(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 65
    return-void
.end method
