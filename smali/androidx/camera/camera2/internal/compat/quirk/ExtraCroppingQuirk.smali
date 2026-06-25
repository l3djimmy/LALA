.class public Landroidx/camera/camera2/internal/compat/quirk/ExtraCroppingQuirk;
.super Ljava/lang/Object;
.source "ExtraCroppingQuirk.java"

# interfaces
.implements Landroidx/camera/core/impl/Quirk;


# static fields
.field private static final SAMSUNG_DISTORTION_MODELS_TO_API_LEVEL_MAP:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 54
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Landroidx/camera/camera2/internal/compat/quirk/ExtraCroppingQuirk;->SAMSUNG_DISTORTION_MODELS_TO_API_LEVEL_MAP:Ljava/util/Map;

    .line 58
    sget-object v0, Landroidx/camera/camera2/internal/compat/quirk/ExtraCroppingQuirk;->SAMSUNG_DISTORTION_MODELS_TO_API_LEVEL_MAP:Ljava/util/Map;

    const-string/jumbo v1, "SM-T580"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    sget-object v0, Landroidx/camera/camera2/internal/compat/quirk/ExtraCroppingQuirk;->SAMSUNG_DISTORTION_MODELS_TO_API_LEVEL_MAP:Ljava/util/Map;

    new-instance v1, Landroid/util/Range;

    const/16 v3, 0x15

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/16 v4, 0x1a

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {v1, v3, v4}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    const-string/jumbo v5, "SM-J710MN"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    sget-object v0, Landroidx/camera/camera2/internal/compat/quirk/ExtraCroppingQuirk;->SAMSUNG_DISTORTION_MODELS_TO_API_LEVEL_MAP:Ljava/util/Map;

    const-string/jumbo v1, "SM-A320FL"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    sget-object v0, Landroidx/camera/camera2/internal/compat/quirk/ExtraCroppingQuirk;->SAMSUNG_DISTORTION_MODELS_TO_API_LEVEL_MAP:Ljava/util/Map;

    const-string/jumbo v1, "SM-G570M"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    sget-object v0, Landroidx/camera/camera2/internal/compat/quirk/ExtraCroppingQuirk;->SAMSUNG_DISTORTION_MODELS_TO_API_LEVEL_MAP:Ljava/util/Map;

    const-string/jumbo v1, "SM-G610F"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    sget-object v0, Landroidx/camera/camera2/internal/compat/quirk/ExtraCroppingQuirk;->SAMSUNG_DISTORTION_MODELS_TO_API_LEVEL_MAP:Ljava/util/Map;

    new-instance v1, Landroid/util/Range;

    invoke-direct {v1, v3, v4}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    const-string/jumbo v2, "SM-G610M"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static isSamsungDistortion()Z
    .locals 5

    .line 101
    const-string/jumbo v0, "samsung"

    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    sget-object v0, Landroidx/camera/camera2/internal/compat/quirk/ExtraCroppingQuirk;->SAMSUNG_DISTORTION_MODELS_TO_API_LEVEL_MAP:Ljava/util/Map;

    sget-object v3, Landroid/os/Build;->MODEL:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 103
    invoke-virtual {v3, v4}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    .line 102
    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    .line 105
    .local v0, "isDeviceModelContained":Z
    :goto_0
    if-nez v0, :cond_1

    .line 106
    return v2

    .line 109
    :cond_1
    sget-object v2, Landroidx/camera/camera2/internal/compat/quirk/ExtraCroppingQuirk;->SAMSUNG_DISTORTION_MODELS_TO_API_LEVEL_MAP:Ljava/util/Map;

    sget-object v3, Landroid/os/Build;->MODEL:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 110
    invoke-virtual {v3, v4}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Range;

    .line 112
    .local v2, "apiLevelRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    if-nez v2, :cond_2

    goto :goto_1

    :cond_2
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/util/Range;->contains(Ljava/lang/Comparable;)Z

    move-result v1

    :goto_1
    return v1
.end method

.method static load()Z
    .locals 1

    .line 67
    invoke-static {}, Landroidx/camera/camera2/internal/compat/quirk/ExtraCroppingQuirk;->isSamsungDistortion()Z

    move-result v0

    return v0
.end method


# virtual methods
.method public getVerifiedResolution(Landroidx/camera/core/impl/SurfaceConfig$ConfigType;)Landroid/util/Size;
    .locals 3
    .param p1, "configType"    # Landroidx/camera/core/impl/SurfaceConfig$ConfigType;

    .line 81
    invoke-static {}, Landroidx/camera/camera2/internal/compat/quirk/ExtraCroppingQuirk;->isSamsungDistortion()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 83
    sget-object v0, Landroidx/camera/camera2/internal/compat/quirk/ExtraCroppingQuirk$1;->$SwitchMap$androidx$camera$core$impl$SurfaceConfig$ConfigType:[I

    invoke-virtual {p1}, Landroidx/camera/core/impl/SurfaceConfig$ConfigType;->ordinal()I

    move-result v2

    aget v0, v0, v2

    packed-switch v0, :pswitch_data_0

    .line 91
    return-object v1

    .line 89
    :pswitch_0
    new-instance v0, Landroid/util/Size;

    const/16 v1, 0xcc0

    const/16 v2, 0x72c

    invoke-direct {v0, v1, v2}, Landroid/util/Size;-><init>(II)V

    return-object v0

    .line 87
    :pswitch_1
    new-instance v0, Landroid/util/Size;

    const/16 v1, 0x500

    const/16 v2, 0x2d0

    invoke-direct {v0, v1, v2}, Landroid/util/Size;-><init>(II)V

    return-object v0

    .line 85
    :pswitch_2
    new-instance v0, Landroid/util/Size;

    const/16 v1, 0x780

    const/16 v2, 0x438

    invoke-direct {v0, v1, v2}, Landroid/util/Size;-><init>(II)V

    return-object v0

    .line 94
    :cond_0
    return-object v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
