.class public Landroidx/camera/camera2/internal/compat/workaround/MeteringRegionCorrection;
.super Ljava/lang/Object;
.source "MeteringRegionCorrection.java"


# instance fields
.field private final mCameraQuirks:Landroidx/camera/core/impl/Quirks;


# direct methods
.method public constructor <init>(Landroidx/camera/core/impl/Quirks;)V
    .locals 0
    .param p1, "cameraQuirks"    # Landroidx/camera/core/impl/Quirks;

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Landroidx/camera/camera2/internal/compat/workaround/MeteringRegionCorrection;->mCameraQuirks:Landroidx/camera/core/impl/Quirks;

    .line 37
    return-void
.end method


# virtual methods
.method public getCorrectedPoint(Landroidx/camera/core/MeteringPoint;I)Landroid/graphics/PointF;
    .locals 3
    .param p1, "meteringPoint"    # Landroidx/camera/core/MeteringPoint;
    .param p2, "meteringMode"    # I

    .line 45
    const/4 v0, 0x1

    if-ne p2, v0, :cond_0

    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/workaround/MeteringRegionCorrection;->mCameraQuirks:Landroidx/camera/core/impl/Quirks;

    const-class v1, Landroidx/camera/camera2/internal/compat/quirk/AfRegionFlipHorizontallyQuirk;

    .line 46
    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/Quirks;->contains(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 47
    new-instance v0, Landroid/graphics/PointF;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {p1}, Landroidx/camera/core/MeteringPoint;->getX()F

    move-result v2

    sub-float/2addr v1, v2

    invoke-virtual {p1}, Landroidx/camera/core/MeteringPoint;->getY()F

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/graphics/PointF;-><init>(FF)V

    return-object v0

    .line 50
    :cond_0
    new-instance v0, Landroid/graphics/PointF;

    invoke-virtual {p1}, Landroidx/camera/core/MeteringPoint;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroidx/camera/core/MeteringPoint;->getY()F

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/graphics/PointF;-><init>(FF)V

    return-object v0
.end method
