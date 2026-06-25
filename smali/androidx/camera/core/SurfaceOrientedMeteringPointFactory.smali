.class public Landroidx/camera/core/SurfaceOrientedMeteringPointFactory;
.super Landroidx/camera/core/MeteringPointFactory;
.source "SurfaceOrientedMeteringPointFactory.java"


# instance fields
.field private final mHeight:F

.field private final mWidth:F


# direct methods
.method public constructor <init>(FF)V
    .locals 0
    .param p1, "width"    # F
    .param p2, "height"    # F

    .line 69
    invoke-direct {p0}, Landroidx/camera/core/MeteringPointFactory;-><init>()V

    .line 70
    iput p1, p0, Landroidx/camera/core/SurfaceOrientedMeteringPointFactory;->mWidth:F

    .line 71
    iput p2, p0, Landroidx/camera/core/SurfaceOrientedMeteringPointFactory;->mHeight:F

    .line 72
    return-void
.end method

.method public constructor <init>(FFLandroidx/camera/core/UseCase;)V
    .locals 1
    .param p1, "width"    # F
    .param p2, "height"    # F
    .param p3, "useCaseForAspectRatio"    # Landroidx/camera/core/UseCase;

    .line 93
    invoke-static {p3}, Landroidx/camera/core/SurfaceOrientedMeteringPointFactory;->getUseCaseAspectRatio(Landroidx/camera/core/UseCase;)Landroid/util/Rational;

    move-result-object v0

    invoke-direct {p0, v0}, Landroidx/camera/core/MeteringPointFactory;-><init>(Landroid/util/Rational;)V

    .line 94
    iput p1, p0, Landroidx/camera/core/SurfaceOrientedMeteringPointFactory;->mWidth:F

    .line 95
    iput p2, p0, Landroidx/camera/core/SurfaceOrientedMeteringPointFactory;->mHeight:F

    .line 96
    return-void
.end method

.method private static getUseCaseAspectRatio(Landroidx/camera/core/UseCase;)Landroid/util/Rational;
    .locals 4
    .param p0, "useCase"    # Landroidx/camera/core/UseCase;

    .line 100
    if-nez p0, :cond_0

    .line 101
    const/4 v0, 0x0

    return-object v0

    .line 104
    :cond_0
    invoke-virtual {p0}, Landroidx/camera/core/UseCase;->getAttachedSurfaceResolution()Landroid/util/Size;

    move-result-object v0

    .line 105
    .local v0, "resolution":Landroid/util/Size;
    if-eqz v0, :cond_1

    .line 110
    new-instance v1, Landroid/util/Rational;

    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v2

    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    move-result v3

    invoke-direct {v1, v2, v3}, Landroid/util/Rational;-><init>(II)V

    return-object v1

    .line 106
    :cond_1
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "UseCase "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is not bound."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method protected convertPoint(FF)Landroid/graphics/PointF;
    .locals 3
    .param p1, "x"    # F
    .param p2, "y"    # F

    .line 121
    new-instance v0, Landroid/graphics/PointF;

    iget v1, p0, Landroidx/camera/core/SurfaceOrientedMeteringPointFactory;->mWidth:F

    div-float v1, p1, v1

    iget v2, p0, Landroidx/camera/core/SurfaceOrientedMeteringPointFactory;->mHeight:F

    div-float v2, p2, v2

    invoke-direct {v0, v1, v2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 122
    .local v0, "pt":Landroid/graphics/PointF;
    return-object v0
.end method
