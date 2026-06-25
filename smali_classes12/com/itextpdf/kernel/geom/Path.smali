.class public Lcom/itextpdf/kernel/geom/Path;
.super Ljava/lang/Object;
.source "Path.java"


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final START_PATH_ERR_MSG:Ljava/lang/String; = "Path shall start with \"re\" or \"m\" operator"


# instance fields
.field private currentPoint:Lcom/itextpdf/kernel/geom/Point;

.field private subpaths:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Subpath;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 35
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/geom/Path;->subpaths:Ljava/util/List;

    .line 43
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/geom/Path;)V
    .locals 1
    .param p1, "path"    # Lcom/itextpdf/kernel/geom/Path;

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/geom/Path;->subpaths:Ljava/util/List;

    .line 50
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Path;->getSubpaths()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/geom/Path;->addSubpaths(Ljava/util/List;)V

    .line 51
    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/itextpdf/kernel/geom/Subpath;",
            ">;)V"
        }
    .end annotation

    .line 45
    .local p1, "subpaths":Ljava/util/List;, "Ljava/util/List<+Lcom/itextpdf/kernel/geom/Subpath;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/geom/Path;->subpaths:Ljava/util/List;

    .line 46
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/geom/Path;->addSubpaths(Ljava/util/List;)V

    .line 47
    return-void
.end method

.method private getLastSubpath()Lcom/itextpdf/kernel/geom/Subpath;
    .locals 2

    .line 262
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Path;->subpaths:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 263
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Path;->subpaths:Ljava/util/List;

    iget-object v1, p0, Lcom/itextpdf/kernel/geom/Path;->subpaths:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/geom/Subpath;

    return-object v0

    .line 262
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method


# virtual methods
.method public addSubpath(Lcom/itextpdf/kernel/geom/Subpath;)V
    .locals 1
    .param p1, "subpath"    # Lcom/itextpdf/kernel/geom/Subpath;

    .line 66
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Path;->subpaths:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 67
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Subpath;->getLastPoint()Lcom/itextpdf/kernel/geom/Point;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/geom/Path;->currentPoint:Lcom/itextpdf/kernel/geom/Point;

    .line 68
    return-void
.end method

.method public addSubpaths(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/itextpdf/kernel/geom/Subpath;",
            ">;)V"
        }
    .end annotation

    .line 76
    .local p1, "subpaths":Ljava/util/List;, "Ljava/util/List<+Lcom/itextpdf/kernel/geom/Subpath;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 77
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/geom/Subpath;

    .line 78
    .local v1, "subpath":Lcom/itextpdf/kernel/geom/Subpath;
    iget-object v2, p0, Lcom/itextpdf/kernel/geom/Path;->subpaths:Ljava/util/List;

    new-instance v3, Lcom/itextpdf/kernel/geom/Subpath;

    invoke-direct {v3, v1}, Lcom/itextpdf/kernel/geom/Subpath;-><init>(Lcom/itextpdf/kernel/geom/Subpath;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 79
    .end local v1    # "subpath":Lcom/itextpdf/kernel/geom/Subpath;
    goto :goto_0

    .line 80
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Path;->subpaths:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/geom/Subpath;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Subpath;->getLastPoint()Lcom/itextpdf/kernel/geom/Point;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/geom/Path;->currentPoint:Lcom/itextpdf/kernel/geom/Point;

    .line 82
    :cond_1
    return-void
.end method

.method public closeAllSubpaths()V
    .locals 3

    .line 222
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Path;->subpaths:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/geom/Subpath;

    .line 223
    .local v1, "subpath":Lcom/itextpdf/kernel/geom/Subpath;
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/geom/Subpath;->setClosed(Z)V

    .line 224
    .end local v1    # "subpath":Lcom/itextpdf/kernel/geom/Subpath;
    goto :goto_0

    .line 225
    :cond_0
    return-void
.end method

.method public closeSubpath()V
    .locals 5

    .line 209
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Path;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 210
    invoke-direct {p0}, Lcom/itextpdf/kernel/geom/Path;->getLastSubpath()Lcom/itextpdf/kernel/geom/Subpath;

    move-result-object v0

    .line 211
    .local v0, "lastSubpath":Lcom/itextpdf/kernel/geom/Subpath;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/geom/Subpath;->setClosed(Z)V

    .line 213
    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Subpath;->getStartPoint()Lcom/itextpdf/kernel/geom/Point;

    move-result-object v1

    .line 214
    .local v1, "startPoint":Lcom/itextpdf/kernel/geom/Point;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v2

    double-to-float v2, v2

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v3

    double-to-float v3, v3

    invoke-virtual {p0, v2, v3}, Lcom/itextpdf/kernel/geom/Path;->moveTo(FF)V

    .line 216
    .end local v0    # "lastSubpath":Lcom/itextpdf/kernel/geom/Subpath;
    .end local v1    # "startPoint":Lcom/itextpdf/kernel/geom/Point;
    :cond_0
    return-void
.end method

.method public curveFromTo(FFFF)V
    .locals 8
    .param p1, "x1"    # F
    .param p2, "y1"    # F
    .param p3, "x3"    # F
    .param p4, "y3"    # F

    .line 176
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Path;->currentPoint:Lcom/itextpdf/kernel/geom/Point;

    if-eqz v0, :cond_0

    .line 179
    move v6, p3

    move v7, p4

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    .end local p1    # "x1":F
    .end local p2    # "y1":F
    .end local p3    # "x3":F
    .end local p4    # "y3":F
    .local v2, "x1":F
    .local v3, "y1":F
    .local v4, "x3":F
    .local v5, "y3":F
    invoke-virtual/range {v1 .. v7}, Lcom/itextpdf/kernel/geom/Path;->curveTo(FFFFFF)V

    .line 180
    return-void

    .line 177
    .end local v2    # "x1":F
    .end local v3    # "y1":F
    .end local v4    # "x3":F
    .end local v5    # "y3":F
    .restart local p1    # "x1":F
    .restart local p2    # "y1":F
    .restart local p3    # "x3":F
    .restart local p4    # "y3":F
    :cond_0
    move v2, p1

    move v3, p2

    .end local p1    # "x1":F
    .end local p2    # "y1":F
    .restart local v2    # "x1":F
    .restart local v3    # "y1":F
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "Path shall start with \"re\" or \"m\" operator"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public curveTo(FFFF)V
    .locals 9
    .param p1, "x2"    # F
    .param p2, "y2"    # F
    .param p3, "x3"    # F
    .param p4, "y3"    # F

    .line 159
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Path;->currentPoint:Lcom/itextpdf/kernel/geom/Point;

    if-eqz v0, :cond_0

    .line 162
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Path;->currentPoint:Lcom/itextpdf/kernel/geom/Point;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v0

    double-to-float v3, v0

    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Path;->currentPoint:Lcom/itextpdf/kernel/geom/Point;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v0

    double-to-float v4, v0

    move-object v2, p0

    move v5, p1

    move v6, p2

    move v7, p3

    move v8, p4

    .end local p1    # "x2":F
    .end local p2    # "y2":F
    .end local p3    # "x3":F
    .end local p4    # "y3":F
    .local v5, "x2":F
    .local v6, "y2":F
    .local v7, "x3":F
    .local v8, "y3":F
    invoke-virtual/range {v2 .. v8}, Lcom/itextpdf/kernel/geom/Path;->curveTo(FFFFFF)V

    .line 163
    return-void

    .line 160
    .end local v5    # "x2":F
    .end local v6    # "y2":F
    .end local v7    # "x3":F
    .end local v8    # "y3":F
    .restart local p1    # "x2":F
    .restart local p2    # "y2":F
    .restart local p3    # "x3":F
    .restart local p4    # "y3":F
    :cond_0
    move v5, p1

    move v6, p2

    .end local p1    # "x2":F
    .end local p2    # "y2":F
    .restart local v5    # "x2":F
    .restart local v6    # "y2":F
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "Path shall start with \"re\" or \"m\" operator"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public curveTo(FFFFFF)V
    .locals 7
    .param p1, "x1"    # F
    .param p2, "y1"    # F
    .param p3, "x2"    # F
    .param p4, "y2"    # F
    .param p5, "x3"    # F
    .param p6, "y3"    # F

    .line 134
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Path;->currentPoint:Lcom/itextpdf/kernel/geom/Point;

    if-eqz v0, :cond_0

    .line 138
    new-instance v0, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v1, p1

    float-to-double v3, p2

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    .line 139
    .local v0, "secondPoint":Lcom/itextpdf/kernel/geom/Point;
    new-instance v1, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v2, p3

    float-to-double v4, p4

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    .line 140
    .local v1, "thirdPoint":Lcom/itextpdf/kernel/geom/Point;
    new-instance v2, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v3, p5

    float-to-double v5, p6

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    .line 142
    .local v2, "fourthPoint":Lcom/itextpdf/kernel/geom/Point;
    new-instance v3, Ljava/util/ArrayList;

    const/4 v4, 0x4

    new-array v4, v4, [Lcom/itextpdf/kernel/geom/Point;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/itextpdf/kernel/geom/Path;->currentPoint:Lcom/itextpdf/kernel/geom/Point;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    aput-object v0, v4, v5

    const/4 v5, 0x2

    aput-object v1, v4, v5

    const/4 v5, 0x3

    aput-object v2, v4, v5

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 143
    .local v3, "controlPoints":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Point;>;"
    invoke-direct {p0}, Lcom/itextpdf/kernel/geom/Path;->getLastSubpath()Lcom/itextpdf/kernel/geom/Subpath;

    move-result-object v4

    new-instance v5, Lcom/itextpdf/kernel/geom/BezierCurve;

    invoke-direct {v5, v3}, Lcom/itextpdf/kernel/geom/BezierCurve;-><init>(Ljava/util/List;)V

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/geom/Subpath;->addSegment(Lcom/itextpdf/kernel/geom/IShape;)V

    .line 145
    iput-object v2, p0, Lcom/itextpdf/kernel/geom/Path;->currentPoint:Lcom/itextpdf/kernel/geom/Point;

    .line 146
    return-void

    .line 135
    .end local v0    # "secondPoint":Lcom/itextpdf/kernel/geom/Point;
    .end local v1    # "thirdPoint":Lcom/itextpdf/kernel/geom/Point;
    .end local v2    # "fourthPoint":Lcom/itextpdf/kernel/geom/Point;
    .end local v3    # "controlPoints":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Point;>;"
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Path shall start with \"re\" or \"m\" operator"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getCurrentPoint()Lcom/itextpdf/kernel/geom/Point;
    .locals 1

    .line 90
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Path;->currentPoint:Lcom/itextpdf/kernel/geom/Point;

    return-object v0
.end method

.method public getSubpaths()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Subpath;",
            ">;"
        }
    .end annotation

    .line 57
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Path;->subpaths:Ljava/util/List;

    return-object v0
.end method

.method public isEmpty()Z
    .locals 1

    .line 258
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Path;->subpaths:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public lineTo(FF)V
    .locals 5
    .param p1, "x"    # F
    .param p2, "y"    # F

    .line 115
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Path;->currentPoint:Lcom/itextpdf/kernel/geom/Point;

    if-eqz v0, :cond_0

    .line 118
    new-instance v0, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v1, p1

    float-to-double v3, p2

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    .line 119
    .local v0, "targetPoint":Lcom/itextpdf/kernel/geom/Point;
    invoke-direct {p0}, Lcom/itextpdf/kernel/geom/Path;->getLastSubpath()Lcom/itextpdf/kernel/geom/Subpath;

    move-result-object v1

    new-instance v2, Lcom/itextpdf/kernel/geom/Line;

    iget-object v3, p0, Lcom/itextpdf/kernel/geom/Path;->currentPoint:Lcom/itextpdf/kernel/geom/Point;

    invoke-direct {v2, v3, v0}, Lcom/itextpdf/kernel/geom/Line;-><init>(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)V

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/geom/Subpath;->addSegment(Lcom/itextpdf/kernel/geom/IShape;)V

    .line 120
    iput-object v0, p0, Lcom/itextpdf/kernel/geom/Path;->currentPoint:Lcom/itextpdf/kernel/geom/Point;

    .line 121
    return-void

    .line 116
    .end local v0    # "targetPoint":Lcom/itextpdf/kernel/geom/Point;
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Path shall start with \"re\" or \"m\" operator"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public moveTo(FF)V
    .locals 5
    .param p1, "x"    # F
    .param p2, "y"    # F

    .line 99
    new-instance v0, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v1, p1

    float-to-double v3, p2

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    iput-object v0, p0, Lcom/itextpdf/kernel/geom/Path;->currentPoint:Lcom/itextpdf/kernel/geom/Point;

    .line 100
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Path;->subpaths:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Path;->subpaths:Ljava/util/List;

    iget-object v1, p0, Lcom/itextpdf/kernel/geom/Path;->subpaths:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/geom/Subpath;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 102
    .local v0, "lastSubpath":Lcom/itextpdf/kernel/geom/Subpath;
    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Subpath;->isSinglePointOpen()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 103
    iget-object v1, p0, Lcom/itextpdf/kernel/geom/Path;->currentPoint:Lcom/itextpdf/kernel/geom/Point;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/geom/Subpath;->setStartPoint(Lcom/itextpdf/kernel/geom/Point;)V

    goto :goto_1

    .line 105
    :cond_1
    iget-object v1, p0, Lcom/itextpdf/kernel/geom/Path;->subpaths:Ljava/util/List;

    new-instance v2, Lcom/itextpdf/kernel/geom/Subpath;

    iget-object v3, p0, Lcom/itextpdf/kernel/geom/Path;->currentPoint:Lcom/itextpdf/kernel/geom/Point;

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/geom/Subpath;-><init>(Lcom/itextpdf/kernel/geom/Point;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 107
    :goto_1
    return-void
.end method

.method public rectangle(FFFF)V
    .locals 2
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "w"    # F
    .param p4, "h"    # F

    .line 198
    invoke-virtual {p0, p1, p2}, Lcom/itextpdf/kernel/geom/Path;->moveTo(FF)V

    .line 199
    add-float v0, p1, p3

    invoke-virtual {p0, v0, p2}, Lcom/itextpdf/kernel/geom/Path;->lineTo(FF)V

    .line 200
    add-float v0, p1, p3

    add-float v1, p2, p4

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/geom/Path;->lineTo(FF)V

    .line 201
    add-float v0, p2, p4

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/geom/Path;->lineTo(FF)V

    .line 202
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Path;->closeSubpath()V

    .line 203
    return-void
.end method

.method public rectangle(Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 4
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 187
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v2

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v3

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/itextpdf/kernel/geom/Path;->rectangle(FFFF)V

    .line 188
    return-void
.end method

.method public replaceCloseWithLine()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 234
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 235
    .local v0, "modifiedSubpathsIndices":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v1, 0x0

    .line 241
    .local v1, "i":I
    iget-object v2, p0, Lcom/itextpdf/kernel/geom/Path;->subpaths:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/geom/Subpath;

    .line 242
    .local v3, "subpath":Lcom/itextpdf/kernel/geom/Subpath;
    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Subpath;->isClosed()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 243
    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/geom/Subpath;->setClosed(Z)V

    .line 244
    new-instance v4, Lcom/itextpdf/kernel/geom/Line;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Subpath;->getLastPoint()Lcom/itextpdf/kernel/geom/Point;

    move-result-object v5

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Subpath;->getStartPoint()Lcom/itextpdf/kernel/geom/Point;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lcom/itextpdf/kernel/geom/Line;-><init>(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)V

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/geom/Subpath;->addSegment(Lcom/itextpdf/kernel/geom/IShape;)V

    .line 245
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 247
    :cond_0
    nop

    .end local v3    # "subpath":Lcom/itextpdf/kernel/geom/Subpath;
    add-int/lit8 v1, v1, 0x1

    .line 248
    goto :goto_0

    .line 250
    :cond_1
    return-object v0
.end method
