.class public final Landroidx/camera/core/impl/utils/AspectRatioUtil$CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace;
.super Ljava/lang/Object;
.source "AspectRatioUtil.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/core/impl/utils/AspectRatioUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Landroid/util/Rational;",
        ">;"
    }
.end annotation


# instance fields
.field private final mFullFovRatio:Landroid/util/Rational;

.field private final mTargetRatio:Landroid/util/Rational;

.field private final mTransformedMappingArea:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>(Landroid/util/Rational;Landroid/util/Rational;)V
    .locals 3
    .param p1, "targetRatio"    # Landroid/util/Rational;
    .param p2, "fullFovRatio"    # Landroid/util/Rational;

    .line 136
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 137
    iput-object p1, p0, Landroidx/camera/core/impl/utils/AspectRatioUtil$CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace;->mTargetRatio:Landroid/util/Rational;

    .line 138
    if-eqz p2, :cond_0

    move-object v0, p2

    goto :goto_0

    :cond_0
    new-instance v0, Landroid/util/Rational;

    const/4 v1, 0x4

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Landroid/util/Rational;-><init>(II)V

    :goto_0
    iput-object v0, p0, Landroidx/camera/core/impl/utils/AspectRatioUtil$CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace;->mFullFovRatio:Landroid/util/Rational;

    .line 139
    iget-object v0, p0, Landroidx/camera/core/impl/utils/AspectRatioUtil$CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace;->mTargetRatio:Landroid/util/Rational;

    invoke-direct {p0, v0}, Landroidx/camera/core/impl/utils/AspectRatioUtil$CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace;->getTransformedMappingArea(Landroid/util/Rational;)Landroid/graphics/RectF;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/impl/utils/AspectRatioUtil$CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace;->mTransformedMappingArea:Landroid/graphics/RectF;

    .line 140
    return-void
.end method

.method private getMappingAreaSize(Landroid/graphics/RectF;)F
    .locals 2
    .param p1, "mappingArea"    # Landroid/graphics/RectF;

    .line 210
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v1

    mul-float/2addr v0, v1

    return v0
.end method

.method private getOverlappingAreaSize(Landroid/graphics/RectF;Landroid/graphics/RectF;)F
    .locals 3
    .param p1, "mappingArea1"    # Landroid/graphics/RectF;
    .param p2, "mappingArea2"    # Landroid/graphics/RectF;

    .line 218
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v0

    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    move-result v1

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    .line 219
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v0

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    move-result v0

    .line 220
    .local v0, "overlappingAreaWidth":F
    :goto_0
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v1

    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    move-result v2

    cmpg-float v1, v1, v2

    if-gez v1, :cond_1

    .line 221
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v1

    goto :goto_1

    :cond_1
    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    move-result v1

    .line 222
    .local v1, "overlappingAreaHeight":F
    :goto_1
    mul-float v2, v0, v1

    return v2
.end method

.method private getTransformedMappingArea(Landroid/util/Rational;)Landroid/graphics/RectF;
    .locals 5
    .param p1, "ratio"    # Landroid/util/Rational;

    .line 183
    invoke-virtual {p1}, Landroid/util/Rational;->floatValue()F

    move-result v0

    iget-object v1, p0, Landroidx/camera/core/impl/utils/AspectRatioUtil$CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace;->mFullFovRatio:Landroid/util/Rational;

    invoke-virtual {v1}, Landroid/util/Rational;->floatValue()F

    move-result v1

    cmpl-float v0, v0, v1

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 184
    new-instance v0, Landroid/graphics/RectF;

    iget-object v2, p0, Landroidx/camera/core/impl/utils/AspectRatioUtil$CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace;->mFullFovRatio:Landroid/util/Rational;

    invoke-virtual {v2}, Landroid/util/Rational;->getNumerator()I

    move-result v2

    int-to-float v2, v2

    iget-object v3, p0, Landroidx/camera/core/impl/utils/AspectRatioUtil$CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace;->mFullFovRatio:Landroid/util/Rational;

    .line 185
    invoke-virtual {v3}, Landroid/util/Rational;->getDenominator()I

    move-result v3

    int-to-float v3, v3

    invoke-direct {v0, v1, v1, v2, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 184
    return-object v0

    .line 186
    :cond_0
    invoke-virtual {p1}, Landroid/util/Rational;->floatValue()F

    move-result v0

    iget-object v2, p0, Landroidx/camera/core/impl/utils/AspectRatioUtil$CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace;->mFullFovRatio:Landroid/util/Rational;

    invoke-virtual {v2}, Landroid/util/Rational;->floatValue()F

    move-result v2

    cmpl-float v0, v0, v2

    if-lez v0, :cond_1

    .line 187
    new-instance v0, Landroid/graphics/RectF;

    iget-object v2, p0, Landroidx/camera/core/impl/utils/AspectRatioUtil$CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace;->mFullFovRatio:Landroid/util/Rational;

    invoke-virtual {v2}, Landroid/util/Rational;->getNumerator()I

    move-result v2

    int-to-float v2, v2

    .line 188
    invoke-virtual {p1}, Landroid/util/Rational;->getDenominator()I

    move-result v3

    int-to-float v3, v3

    iget-object v4, p0, Landroidx/camera/core/impl/utils/AspectRatioUtil$CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace;->mFullFovRatio:Landroid/util/Rational;

    invoke-virtual {v4}, Landroid/util/Rational;->getNumerator()I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v3, v4

    .line 189
    invoke-virtual {p1}, Landroid/util/Rational;->getNumerator()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v3, v4

    invoke-direct {v0, v1, v1, v2, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 187
    return-object v0

    .line 191
    :cond_1
    new-instance v0, Landroid/graphics/RectF;

    .line 192
    invoke-virtual {p1}, Landroid/util/Rational;->getNumerator()I

    move-result v2

    int-to-float v2, v2

    iget-object v3, p0, Landroidx/camera/core/impl/utils/AspectRatioUtil$CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace;->mFullFovRatio:Landroid/util/Rational;

    invoke-virtual {v3}, Landroid/util/Rational;->getDenominator()I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v2, v3

    .line 193
    invoke-virtual {p1}, Landroid/util/Rational;->getDenominator()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v2, v3

    iget-object v3, p0, Landroidx/camera/core/impl/utils/AspectRatioUtil$CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace;->mFullFovRatio:Landroid/util/Rational;

    invoke-virtual {v3}, Landroid/util/Rational;->getDenominator()I

    move-result v3

    int-to-float v3, v3

    invoke-direct {v0, v1, v1, v2, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 191
    return-object v0
.end method

.method private isMappingAreaCovered(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z
    .locals 2
    .param p1, "sourceMappingArea"    # Landroid/graphics/RectF;
    .param p2, "targetMappingArea"    # Landroid/graphics/RectF;

    .line 202
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v0

    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    move-result v1

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_0

    .line 203
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v0

    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    move-result v1

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 202
    :goto_0
    return v0
.end method


# virtual methods
.method public compare(Landroid/util/Rational;Landroid/util/Rational;)I
    .locals 7
    .param p1, "lhs"    # Landroid/util/Rational;
    .param p2, "rhs"    # Landroid/util/Rational;

    .line 144
    invoke-virtual {p1, p2}, Landroid/util/Rational;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 145
    const/4 v0, 0x0

    return v0

    .line 148
    :cond_0
    invoke-direct {p0, p1}, Landroidx/camera/core/impl/utils/AspectRatioUtil$CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace;->getTransformedMappingArea(Landroid/util/Rational;)Landroid/graphics/RectF;

    move-result-object v0

    .line 149
    .local v0, "lhsMappingArea":Landroid/graphics/RectF;
    invoke-direct {p0, p2}, Landroidx/camera/core/impl/utils/AspectRatioUtil$CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace;->getTransformedMappingArea(Landroid/util/Rational;)Landroid/graphics/RectF;

    move-result-object v1

    .line 151
    .local v1, "rhsMappingArea":Landroid/graphics/RectF;
    iget-object v2, p0, Landroidx/camera/core/impl/utils/AspectRatioUtil$CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace;->mTransformedMappingArea:Landroid/graphics/RectF;

    invoke-direct {p0, v0, v2}, Landroidx/camera/core/impl/utils/AspectRatioUtil$CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace;->isMappingAreaCovered(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    move-result v2

    .line 153
    .local v2, "isCoveredByLhs":Z
    iget-object v3, p0, Landroidx/camera/core/impl/utils/AspectRatioUtil$CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace;->mTransformedMappingArea:Landroid/graphics/RectF;

    invoke-direct {p0, v1, v3}, Landroidx/camera/core/impl/utils/AspectRatioUtil$CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace;->isMappingAreaCovered(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    move-result v3

    .line 156
    .local v3, "isCoveredByRhs":Z
    if-eqz v2, :cond_1

    if-eqz v3, :cond_1

    .line 160
    nop

    .line 161
    invoke-direct {p0, v0}, Landroidx/camera/core/impl/utils/AspectRatioUtil$CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace;->getMappingAreaSize(Landroid/graphics/RectF;)F

    move-result v4

    invoke-direct {p0, v1}, Landroidx/camera/core/impl/utils/AspectRatioUtil$CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace;->getMappingAreaSize(Landroid/graphics/RectF;)F

    move-result v5

    sub-float/2addr v4, v5

    .line 160
    invoke-static {v4}, Ljava/lang/Math;->signum(F)F

    move-result v4

    float-to-int v4, v4

    return v4

    .line 162
    :cond_1
    if-eqz v2, :cond_2

    .line 163
    const/4 v4, -0x1

    return v4

    .line 164
    :cond_2
    if-eqz v3, :cond_3

    .line 165
    const/4 v4, 0x1

    return v4

    .line 170
    :cond_3
    iget-object v4, p0, Landroidx/camera/core/impl/utils/AspectRatioUtil$CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace;->mTransformedMappingArea:Landroid/graphics/RectF;

    invoke-direct {p0, v0, v4}, Landroidx/camera/core/impl/utils/AspectRatioUtil$CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace;->getOverlappingAreaSize(Landroid/graphics/RectF;Landroid/graphics/RectF;)F

    move-result v4

    .line 172
    .local v4, "lhsOverlappingArea":F
    iget-object v5, p0, Landroidx/camera/core/impl/utils/AspectRatioUtil$CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace;->mTransformedMappingArea:Landroid/graphics/RectF;

    invoke-direct {p0, v1, v5}, Landroidx/camera/core/impl/utils/AspectRatioUtil$CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace;->getOverlappingAreaSize(Landroid/graphics/RectF;Landroid/graphics/RectF;)F

    move-result v5

    .line 174
    .local v5, "rhsOverlappingArea":F
    sub-float v6, v4, v5

    invoke-static {v6}, Ljava/lang/Math;->signum(F)F

    move-result v6

    float-to-int v6, v6

    neg-int v6, v6

    return v6
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 128
    check-cast p1, Landroid/util/Rational;

    check-cast p2, Landroid/util/Rational;

    invoke-virtual {p0, p1, p2}, Landroidx/camera/core/impl/utils/AspectRatioUtil$CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace;->compare(Landroid/util/Rational;Landroid/util/Rational;)I

    move-result p1

    return p1
.end method
