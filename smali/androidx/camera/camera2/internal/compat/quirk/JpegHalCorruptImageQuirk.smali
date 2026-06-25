.class public final Landroidx/camera/camera2/internal/compat/quirk/JpegHalCorruptImageQuirk;
.super Ljava/lang/Object;
.source "JpegHalCorruptImageQuirk.java"

# interfaces
.implements Landroidx/camera/core/internal/compat/quirk/SoftwareJpegEncodingPreferredQuirk;


# static fields
.field private static final KNOWN_AFFECTED_DEVICES:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 51
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string/jumbo v3, "heroqltevzw"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string/jumbo v3, "heroqltetmo"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string/jumbo v3, "k61v1_basic_ref"

    aput-object v3, v1, v2

    .line 52
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Landroidx/camera/camera2/internal/compat/quirk/JpegHalCorruptImageQuirk;->KNOWN_AFFECTED_DEVICES:Ljava/util/Set;

    .line 51
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static load(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Z
    .locals 3
    .param p0, "characteristicsCompat"    # Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 59
    sget-object v0, Landroidx/camera/camera2/internal/compat/quirk/JpegHalCorruptImageQuirk;->KNOWN_AFFECTED_DEVICES:Ljava/util/Set;

    sget-object v1, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
