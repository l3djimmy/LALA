.class public Landroidx/camera/camera2/internal/compat/workaround/MaxPreviewSize;
.super Ljava/lang/Object;
.source "MaxPreviewSize.java"


# instance fields
.field private final mExtraCroppingQuirk:Landroidx/camera/camera2/internal/compat/quirk/ExtraCroppingQuirk;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 44
    const-class v0, Landroidx/camera/camera2/internal/compat/quirk/ExtraCroppingQuirk;

    invoke-static {v0}, Landroidx/camera/camera2/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v0

    check-cast v0, Landroidx/camera/camera2/internal/compat/quirk/ExtraCroppingQuirk;

    invoke-direct {p0, v0}, Landroidx/camera/camera2/internal/compat/workaround/MaxPreviewSize;-><init>(Landroidx/camera/camera2/internal/compat/quirk/ExtraCroppingQuirk;)V

    .line 45
    return-void
.end method

.method constructor <init>(Landroidx/camera/camera2/internal/compat/quirk/ExtraCroppingQuirk;)V
    .locals 0
    .param p1, "extraCroppingQuirk"    # Landroidx/camera/camera2/internal/compat/quirk/ExtraCroppingQuirk;

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object p1, p0, Landroidx/camera/camera2/internal/compat/workaround/MaxPreviewSize;->mExtraCroppingQuirk:Landroidx/camera/camera2/internal/compat/quirk/ExtraCroppingQuirk;

    .line 53
    return-void
.end method


# virtual methods
.method public getMaxPreviewResolution(Landroid/util/Size;)Landroid/util/Size;
    .locals 4
    .param p1, "defaultMaxPreviewResolution"    # Landroid/util/Size;

    .line 64
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/workaround/MaxPreviewSize;->mExtraCroppingQuirk:Landroidx/camera/camera2/internal/compat/quirk/ExtraCroppingQuirk;

    if-nez v0, :cond_0

    .line 65
    return-object p1

    .line 67
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/workaround/MaxPreviewSize;->mExtraCroppingQuirk:Landroidx/camera/camera2/internal/compat/quirk/ExtraCroppingQuirk;

    sget-object v1, Landroidx/camera/core/impl/SurfaceConfig$ConfigType;->PRIV:Landroidx/camera/core/impl/SurfaceConfig$ConfigType;

    invoke-virtual {v0, v1}, Landroidx/camera/camera2/internal/compat/quirk/ExtraCroppingQuirk;->getVerifiedResolution(Landroidx/camera/core/impl/SurfaceConfig$ConfigType;)Landroid/util/Size;

    move-result-object v0

    .line 69
    .local v0, "selectResolution":Landroid/util/Size;
    if-nez v0, :cond_1

    .line 70
    return-object p1

    .line 72
    :cond_1
    nop

    .line 73
    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v1

    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    move-result v2

    mul-int/2addr v1, v2

    .line 74
    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v2

    .line 75
    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v3

    mul-int/2addr v2, v3

    if-le v1, v2, :cond_2

    const/4 v1, 0x1

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    .line 76
    .local v1, "isSelectResolutionLarger":Z
    :goto_0
    if-eqz v1, :cond_3

    move-object v2, v0

    goto :goto_1

    :cond_3
    move-object v2, p1

    :goto_1
    return-object v2
.end method
