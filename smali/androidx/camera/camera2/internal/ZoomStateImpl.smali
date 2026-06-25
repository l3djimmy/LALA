.class Landroidx/camera/camera2/internal/ZoomStateImpl;
.super Ljava/lang/Object;
.source "ZoomStateImpl.java"

# interfaces
.implements Landroidx/camera/core/ZoomState;


# instance fields
.field private mLinearZoom:F

.field private final mMaxZoomRatio:F

.field private final mMinZoomRatio:F

.field private mZoomRatio:F


# direct methods
.method constructor <init>(FF)V
    .locals 0
    .param p1, "maxZoomRatio"    # F
    .param p2, "minZoomRatio"    # F

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput p1, p0, Landroidx/camera/camera2/internal/ZoomStateImpl;->mMaxZoomRatio:F

    .line 33
    iput p2, p0, Landroidx/camera/camera2/internal/ZoomStateImpl;->mMinZoomRatio:F

    .line 34
    return-void
.end method

.method private getPercentageByRatio(F)F
    .locals 5
    .param p1, "ratio"    # F

    .line 101
    iget v0, p0, Landroidx/camera/camera2/internal/ZoomStateImpl;->mMaxZoomRatio:F

    iget v1, p0, Landroidx/camera/camera2/internal/ZoomStateImpl;->mMinZoomRatio:F

    cmpl-float v0, v0, v1

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 102
    return v1

    .line 107
    :cond_0
    iget v0, p0, Landroidx/camera/camera2/internal/ZoomStateImpl;->mMaxZoomRatio:F

    cmpl-float v0, p1, v0

    const/high16 v2, 0x3f800000    # 1.0f

    if-nez v0, :cond_1

    .line 108
    return v2

    .line 109
    :cond_1
    iget v0, p0, Landroidx/camera/camera2/internal/ZoomStateImpl;->mMinZoomRatio:F

    cmpl-float v0, p1, v0

    if-nez v0, :cond_2

    .line 110
    return v1

    .line 113
    :cond_2
    div-float v0, v2, p1

    .line 114
    .local v0, "cropWidth":F
    iget v1, p0, Landroidx/camera/camera2/internal/ZoomStateImpl;->mMaxZoomRatio:F

    div-float v1, v2, v1

    .line 115
    .local v1, "cropWidthInMaxZoom":F
    iget v3, p0, Landroidx/camera/camera2/internal/ZoomStateImpl;->mMinZoomRatio:F

    div-float/2addr v2, v3

    .line 117
    .local v2, "cropWidthInMinZoom":F
    sub-float v3, v0, v2

    sub-float v4, v1, v2

    div-float/2addr v3, v4

    return v3
.end method

.method private getRatioByPercentage(F)F
    .locals 17
    .param p1, "percentage"    # F

    .line 80
    move-object/from16 v0, p0

    move/from16 v1, p1

    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float v3, v1, v2

    if-nez v3, :cond_0

    .line 81
    iget v2, v0, Landroidx/camera/camera2/internal/ZoomStateImpl;->mMaxZoomRatio:F

    return v2

    .line 82
    :cond_0
    const/4 v3, 0x0

    cmpl-float v3, v1, v3

    if-nez v3, :cond_1

    .line 83
    iget v2, v0, Landroidx/camera/camera2/internal/ZoomStateImpl;->mMinZoomRatio:F

    return v2

    .line 88
    :cond_1
    iget v3, v0, Landroidx/camera/camera2/internal/ZoomStateImpl;->mMaxZoomRatio:F

    div-float v3, v2, v3

    float-to-double v3, v3

    .line 89
    .local v3, "cropWidthInMaxZoom":D
    iget v5, v0, Landroidx/camera/camera2/internal/ZoomStateImpl;->mMinZoomRatio:F

    div-float/2addr v2, v5

    float-to-double v5, v2

    .line 91
    .local v5, "cropWidthInMinZoom":D
    sub-double v7, v3, v5

    float-to-double v9, v1

    mul-double/2addr v7, v9

    add-double/2addr v7, v5

    .line 94
    .local v7, "cropWidth":D
    const-wide/high16 v9, 0x3ff0000000000000L    # 1.0

    div-double v11, v9, v7

    .line 96
    .local v11, "ratio":D
    iget v2, v0, Landroidx/camera/camera2/internal/ZoomStateImpl;->mMinZoomRatio:F

    float-to-double v13, v2

    iget v2, v0, Landroidx/camera/camera2/internal/ZoomStateImpl;->mMaxZoomRatio:F

    float-to-double v9, v2

    move-wide v15, v9

    invoke-static/range {v11 .. v16}, Landroidx/core/math/MathUtils;->clamp(DDD)D

    move-result-wide v9

    double-to-float v2, v9

    return v2
.end method


# virtual methods
.method public getLinearZoom()F
    .locals 1

    .line 75
    iget v0, p0, Landroidx/camera/camera2/internal/ZoomStateImpl;->mLinearZoom:F

    return v0
.end method

.method public getMaxZoomRatio()F
    .locals 1

    .line 65
    iget v0, p0, Landroidx/camera/camera2/internal/ZoomStateImpl;->mMaxZoomRatio:F

    return v0
.end method

.method public getMinZoomRatio()F
    .locals 1

    .line 70
    iget v0, p0, Landroidx/camera/camera2/internal/ZoomStateImpl;->mMinZoomRatio:F

    return v0
.end method

.method public getZoomRatio()F
    .locals 1

    .line 60
    iget v0, p0, Landroidx/camera/camera2/internal/ZoomStateImpl;->mZoomRatio:F

    return v0
.end method

.method setLinearZoom(F)V
    .locals 2
    .param p1, "linearZoom"    # F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 49
    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v0, p1, v0

    if-gtz v0, :cond_0

    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-ltz v0, :cond_0

    .line 54
    iput p1, p0, Landroidx/camera/camera2/internal/ZoomStateImpl;->mLinearZoom:F

    .line 55
    iget v0, p0, Landroidx/camera/camera2/internal/ZoomStateImpl;->mLinearZoom:F

    invoke-direct {p0, v0}, Landroidx/camera/camera2/internal/ZoomStateImpl;->getRatioByPercentage(F)F

    move-result v0

    iput v0, p0, Landroidx/camera/camera2/internal/ZoomStateImpl;->mZoomRatio:F

    .line 56
    return-void

    .line 50
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Requested linearZoom "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " is not within valid range [0..1]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 52
    .local v0, "outOfRangeDesc":Ljava/lang/String;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method setZoomRatio(F)V
    .locals 2
    .param p1, "zoomRatio"    # F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 37
    iget v0, p0, Landroidx/camera/camera2/internal/ZoomStateImpl;->mMaxZoomRatio:F

    cmpl-float v0, p1, v0

    if-gtz v0, :cond_0

    iget v0, p0, Landroidx/camera/camera2/internal/ZoomStateImpl;->mMinZoomRatio:F

    cmpg-float v0, p1, v0

    if-ltz v0, :cond_0

    .line 44
    iput p1, p0, Landroidx/camera/camera2/internal/ZoomStateImpl;->mZoomRatio:F

    .line 45
    iget v0, p0, Landroidx/camera/camera2/internal/ZoomStateImpl;->mZoomRatio:F

    invoke-direct {p0, v0}, Landroidx/camera/camera2/internal/ZoomStateImpl;->getPercentageByRatio(F)F

    move-result v0

    iput v0, p0, Landroidx/camera/camera2/internal/ZoomStateImpl;->mLinearZoom:F

    .line 46
    return-void

    .line 38
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Requested zoomRatio "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " is not within valid range ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/camera2/internal/ZoomStateImpl;->mMinZoomRatio:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " , "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/camera2/internal/ZoomStateImpl;->mMaxZoomRatio:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 42
    .local v0, "outOfRangeDesc":Ljava/lang/String;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
