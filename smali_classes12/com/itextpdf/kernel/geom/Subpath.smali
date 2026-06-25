.class public Lcom/itextpdf/kernel/geom/Subpath;
.super Ljava/lang/Object;
.source "Subpath.java"


# instance fields
.field private closed:Z

.field private segments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/IShape;",
            ">;"
        }
    .end annotation
.end field

.field private startPoint:Lcom/itextpdf/kernel/geom/Point;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/geom/Subpath;->segments:Ljava/util/List;

    .line 43
    return-void
.end method

.method public constructor <init>(FF)V
    .locals 5
    .param p1, "startPointX"    # F
    .param p2, "startPointY"    # F

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/geom/Subpath;->segments:Ljava/util/List;

    .line 72
    new-instance v0, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v1, p1

    float-to-double v3, p2

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    iput-object v0, p0, Lcom/itextpdf/kernel/geom/Subpath;->startPoint:Lcom/itextpdf/kernel/geom/Point;

    .line 73
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/geom/Point;)V
    .locals 3
    .param p1, "startPoint"    # Lcom/itextpdf/kernel/geom/Point;

    .line 62
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v0

    double-to-float v0, v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v1

    double-to-float v1, v1

    invoke-direct {p0, v0, v1}, Lcom/itextpdf/kernel/geom/Subpath;-><init>(FF)V

    .line 63
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/geom/Subpath;)V
    .locals 2
    .param p1, "subpath"    # Lcom/itextpdf/kernel/geom/Subpath;

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/geom/Subpath;->segments:Ljava/util/List;

    .line 51
    iget-object v0, p1, Lcom/itextpdf/kernel/geom/Subpath;->startPoint:Lcom/itextpdf/kernel/geom/Point;

    iput-object v0, p0, Lcom/itextpdf/kernel/geom/Subpath;->startPoint:Lcom/itextpdf/kernel/geom/Point;

    .line 52
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Subpath;->segments:Ljava/util/List;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Subpath;->getSegments()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 53
    iget-boolean v0, p1, Lcom/itextpdf/kernel/geom/Subpath;->closed:Z

    iput-boolean v0, p0, Lcom/itextpdf/kernel/geom/Subpath;->closed:Z

    .line 54
    return-void
.end method


# virtual methods
.method public addSegment(Lcom/itextpdf/kernel/geom/IShape;)V
    .locals 2
    .param p1, "segment"    # Lcom/itextpdf/kernel/geom/IShape;

    .line 119
    iget-boolean v0, p0, Lcom/itextpdf/kernel/geom/Subpath;->closed:Z

    if-eqz v0, :cond_0

    .line 120
    return-void

    .line 123
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Subpath;->isSinglePointOpen()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 124
    invoke-interface {p1}, Lcom/itextpdf/kernel/geom/IShape;->getBasePoints()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/geom/Point;

    iput-object v0, p0, Lcom/itextpdf/kernel/geom/Subpath;->startPoint:Lcom/itextpdf/kernel/geom/Point;

    .line 127
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Subpath;->segments:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 128
    return-void
.end method

.method public getLastPoint()Lcom/itextpdf/kernel/geom/Point;
    .locals 4

    .line 103
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Subpath;->startPoint:Lcom/itextpdf/kernel/geom/Point;

    .line 105
    .local v0, "lastPoint":Lcom/itextpdf/kernel/geom/Point;
    iget-object v1, p0, Lcom/itextpdf/kernel/geom/Subpath;->segments:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    iget-boolean v1, p0, Lcom/itextpdf/kernel/geom/Subpath;->closed:Z

    if-nez v1, :cond_0

    .line 106
    iget-object v1, p0, Lcom/itextpdf/kernel/geom/Subpath;->segments:Ljava/util/List;

    iget-object v2, p0, Lcom/itextpdf/kernel/geom/Subpath;->segments:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/geom/IShape;

    .line 107
    .local v1, "shape":Lcom/itextpdf/kernel/geom/IShape;
    invoke-interface {v1}, Lcom/itextpdf/kernel/geom/IShape;->getBasePoints()Ljava/util/List;

    move-result-object v2

    invoke-interface {v1}, Lcom/itextpdf/kernel/geom/IShape;->getBasePoints()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Lcom/itextpdf/kernel/geom/Point;

    .line 110
    .end local v1    # "shape":Lcom/itextpdf/kernel/geom/IShape;
    :cond_0
    return-object v0
.end method

.method public getPiecewiseLinearApproximation()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Point;",
            ">;"
        }
    .end annotation

    .line 212
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 214
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Point;>;"
    iget-object v1, p0, Lcom/itextpdf/kernel/geom/Subpath;->segments:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_0

    .line 215
    return-object v0

    .line 218
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/kernel/geom/Subpath;->segments:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Lcom/itextpdf/kernel/geom/BezierCurve;

    .line 221
    iget-object v3, p0, Lcom/itextpdf/kernel/geom/Subpath;->segments:Ljava/util/List;

    .line 218
    if-eqz v1, :cond_1

    .line 219
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/geom/BezierCurve;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/BezierCurve;->getPiecewiseLinearApproximation()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    .line 221
    :cond_1
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/geom/IShape;

    invoke-interface {v1}, Lcom/itextpdf/kernel/geom/IShape;->getBasePoints()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 224
    :goto_0
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_1
    iget-object v2, p0, Lcom/itextpdf/kernel/geom/Subpath;->segments:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 227
    iget-object v2, p0, Lcom/itextpdf/kernel/geom/Subpath;->segments:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Lcom/itextpdf/kernel/geom/BezierCurve;

    .line 231
    iget-object v3, p0, Lcom/itextpdf/kernel/geom/Subpath;->segments:Ljava/util/List;

    .line 227
    const/4 v4, 0x1

    if-eqz v2, :cond_2

    .line 228
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/geom/BezierCurve;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/BezierCurve;->getPiecewiseLinearApproximation()Ljava/util/List;

    move-result-object v2

    .line 229
    .local v2, "segApprox":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Point;>;"
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    invoke-interface {v2, v4, v3}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v2

    goto :goto_2

    .line 231
    .end local v2    # "segApprox":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Point;>;"
    :cond_2
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/geom/IShape;

    invoke-interface {v2}, Lcom/itextpdf/kernel/geom/IShape;->getBasePoints()Ljava/util/List;

    move-result-object v2

    .line 232
    .restart local v2    # "segApprox":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Point;>;"
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    invoke-interface {v2, v4, v3}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v2

    .line 235
    :goto_2
    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 224
    .end local v2    # "segApprox":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Point;>;"
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 238
    .end local v1    # "i":I
    :cond_3
    return-object v0
.end method

.method public getSegments()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/IShape;",
            ">;"
        }
    .end annotation

    .line 135
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Subpath;->segments:Ljava/util/List;

    return-object v0
.end method

.method public getStartPoint()Lcom/itextpdf/kernel/geom/Point;
    .locals 1

    .line 96
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Subpath;->startPoint:Lcom/itextpdf/kernel/geom/Point;

    return-object v0
.end method

.method public isClosed()Z
    .locals 1

    .line 170
    iget-boolean v0, p0, Lcom/itextpdf/kernel/geom/Subpath;->closed:Z

    return v0
.end method

.method public isDegenerate()Z
    .locals 6

    .line 190
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Subpath;->segments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_0

    iget-boolean v0, p0, Lcom/itextpdf/kernel/geom/Subpath;->closed:Z

    if-eqz v0, :cond_0

    .line 191
    return v1

    .line 194
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Subpath;->segments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/geom/IShape;

    .line 195
    .local v2, "segment":Lcom/itextpdf/kernel/geom/IShape;
    new-instance v4, Ljava/util/HashSet;

    invoke-interface {v2}, Lcom/itextpdf/kernel/geom/IShape;->getBasePoints()Ljava/util/List;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 198
    .local v4, "points":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/geom/Point;>;"
    invoke-interface {v4}, Ljava/util/Set;->size()I

    move-result v5

    if-eq v5, v3, :cond_1

    .line 199
    return v1

    .line 201
    .end local v2    # "segment":Lcom/itextpdf/kernel/geom/IShape;
    .end local v4    # "points":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/geom/Point;>;"
    :cond_1
    goto :goto_0

    .line 204
    :cond_2
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Subpath;->segments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_3

    iget-boolean v0, p0, Lcom/itextpdf/kernel/geom/Subpath;->closed:Z

    if-eqz v0, :cond_4

    :cond_3
    move v1, v3

    :cond_4
    return v1
.end method

.method public isEmpty()Z
    .locals 1

    .line 143
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Subpath;->startPoint:Lcom/itextpdf/kernel/geom/Point;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isSinglePointClosed()Z
    .locals 1

    .line 159
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Subpath;->segments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/itextpdf/kernel/geom/Subpath;->closed:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isSinglePointOpen()Z
    .locals 1

    .line 151
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Subpath;->segments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/itextpdf/kernel/geom/Subpath;->closed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public setClosed(Z)V
    .locals 0
    .param p1, "closed"    # Z

    .line 179
    iput-boolean p1, p0, Lcom/itextpdf/kernel/geom/Subpath;->closed:Z

    .line 180
    return-void
.end method

.method public setStartPoint(FF)V
    .locals 5
    .param p1, "x"    # F
    .param p2, "y"    # F

    .line 89
    new-instance v0, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v1, p1

    float-to-double v3, p2

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    iput-object v0, p0, Lcom/itextpdf/kernel/geom/Subpath;->startPoint:Lcom/itextpdf/kernel/geom/Point;

    .line 90
    return-void
.end method

.method public setStartPoint(Lcom/itextpdf/kernel/geom/Point;)V
    .locals 3
    .param p1, "startPoint"    # Lcom/itextpdf/kernel/geom/Point;

    .line 80
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v0

    double-to-float v0, v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v1

    double-to-float v1, v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/geom/Subpath;->setStartPoint(FF)V

    .line 81
    return-void
.end method
