.class public Landroidx/camera/camera2/internal/compat/quirk/ImageCaptureWashedOutImageQuirk;
.super Ljava/lang/Object;
.source "ImageCaptureWashedOutImageQuirk.java"

# interfaces
.implements Landroidx/camera/camera2/internal/compat/quirk/UseTorchAsFlashQuirk;


# static fields
.field public static final BUILD_MODELS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 46
    const/16 v0, 0x10

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "SM-G9300"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "SM-G930R"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "SM-G930A"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "SM-G930V"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "SM-G930T"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string/jumbo v2, "SM-G930U"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string/jumbo v2, "SM-G930P"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string/jumbo v2, "SM-SC02H"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string/jumbo v2, "SM-SCV33"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string/jumbo v2, "SM-G9350"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string/jumbo v2, "SM-G935R"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string/jumbo v2, "SM-G935A"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string/jumbo v2, "SM-G935V"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string/jumbo v2, "SM-G935T"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string/jumbo v2, "SM-G935U"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string/jumbo v2, "SM-G935P"

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Landroidx/camera/camera2/internal/compat/quirk/ImageCaptureWashedOutImageQuirk;->BUILD_MODELS:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static load(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Z
    .locals 3
    .param p0, "cameraCharacteristics"    # Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 69
    sget-object v0, Landroidx/camera/camera2/internal/compat/quirk/ImageCaptureWashedOutImageQuirk;->BUILD_MODELS:Ljava/util/List;

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Landroid/hardware/camera2/CameraCharacteristics;->LENS_FACING:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 70
    invoke-virtual {p0, v0}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 69
    :goto_0
    return v1
.end method
