.class public Lcom/itextpdf/kernel/geom/LineSegment;
.super Ljava/lang/Object;
.source "LineSegment.java"


# instance fields
.field private final endPoint:Lcom/itextpdf/kernel/geom/Vector;

.field private final startPoint:Lcom/itextpdf/kernel/geom/Vector;


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/geom/Vector;Lcom/itextpdf/kernel/geom/Vector;)V
    .locals 0
    .param p1, "startPoint"    # Lcom/itextpdf/kernel/geom/Vector;
    .param p2, "endPoint"    # Lcom/itextpdf/kernel/geom/Vector;

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lcom/itextpdf/kernel/geom/LineSegment;->startPoint:Lcom/itextpdf/kernel/geom/Vector;

    .line 42
    iput-object p2, p0, Lcom/itextpdf/kernel/geom/LineSegment;->endPoint:Lcom/itextpdf/kernel/geom/Vector;

    .line 43
    return-void
.end method


# virtual methods
.method public containsPoint(Lcom/itextpdf/kernel/geom/Vector;)Z
    .locals 7
    .param p1, "point"    # Lcom/itextpdf/kernel/geom/Vector;

    .line 108
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 109
    return v0

    .line 112
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/kernel/geom/LineSegment;->startPoint:Lcom/itextpdf/kernel/geom/Vector;

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/geom/Vector;->subtract(Lcom/itextpdf/kernel/geom/Vector;)Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v1

    .line 113
    .local v1, "diff1":Lcom/itextpdf/kernel/geom/Vector;
    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v2

    const/4 v3, 0x0

    cmpg-float v2, v2, v3

    if-ltz v2, :cond_4

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v4

    cmpg-float v4, v4, v3

    if-ltz v4, :cond_4

    const/4 v4, 0x2

    invoke-virtual {v1, v4}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v5

    cmpg-float v5, v5, v3

    if-gez v5, :cond_1

    goto :goto_1

    .line 117
    :cond_1
    iget-object v5, p0, Lcom/itextpdf/kernel/geom/LineSegment;->endPoint:Lcom/itextpdf/kernel/geom/Vector;

    invoke-virtual {v5, p1}, Lcom/itextpdf/kernel/geom/Vector;->subtract(Lcom/itextpdf/kernel/geom/Vector;)Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v5

    .line 118
    .local v5, "diff2":Lcom/itextpdf/kernel/geom/Vector;
    invoke-virtual {v5, v0}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v6

    cmpg-float v6, v6, v3

    if-ltz v6, :cond_3

    invoke-virtual {v5, v2}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v6

    cmpg-float v6, v6, v3

    if-ltz v6, :cond_3

    invoke-virtual {v5, v4}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v4

    cmpg-float v3, v4, v3

    if-gez v3, :cond_2

    goto :goto_0

    .line 122
    :cond_2
    return v2

    .line 119
    :cond_3
    :goto_0
    return v0

    .line 114
    .end local v5    # "diff2":Lcom/itextpdf/kernel/geom/Vector;
    :cond_4
    :goto_1
    return v0
.end method

.method public containsSegment(Lcom/itextpdf/kernel/geom/LineSegment;)Z
    .locals 1
    .param p1, "other"    # Lcom/itextpdf/kernel/geom/LineSegment;

    .line 98
    if-eqz p1, :cond_0

    iget-object v0, p1, Lcom/itextpdf/kernel/geom/LineSegment;->startPoint:Lcom/itextpdf/kernel/geom/Vector;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/geom/LineSegment;->containsPoint(Lcom/itextpdf/kernel/geom/Vector;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/itextpdf/kernel/geom/LineSegment;->endPoint:Lcom/itextpdf/kernel/geom/Vector;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/geom/LineSegment;->containsPoint(Lcom/itextpdf/kernel/geom/Vector;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getBoundingRectangle()Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 9

    .line 74
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/LineSegment;->getStartPoint()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v0

    .line 75
    .local v0, "x1":F
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/LineSegment;->getStartPoint()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v2

    .line 76
    .local v2, "y1":F
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/LineSegment;->getEndPoint()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v4

    invoke-virtual {v4, v1}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v1

    .line 77
    .local v1, "x2":F
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/LineSegment;->getEndPoint()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v3

    .line 78
    .local v3, "y2":F
    new-instance v4, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v5

    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v6

    sub-float v7, v1, v0

    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v7

    sub-float v8, v3, v2

    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    move-result v8

    invoke-direct {v4, v5, v6, v7, v8}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    return-object v4
.end method

.method public getEndPoint()Lcom/itextpdf/kernel/geom/Vector;
    .locals 1

    .line 56
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/LineSegment;->endPoint:Lcom/itextpdf/kernel/geom/Vector;

    return-object v0
.end method

.method public getLength()F
    .locals 2

    .line 63
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/LineSegment;->endPoint:Lcom/itextpdf/kernel/geom/Vector;

    iget-object v1, p0, Lcom/itextpdf/kernel/geom/LineSegment;->startPoint:Lcom/itextpdf/kernel/geom/Vector;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/geom/Vector;->subtract(Lcom/itextpdf/kernel/geom/Vector;)Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Vector;->length()F

    move-result v0

    return v0
.end method

.method public getStartPoint()Lcom/itextpdf/kernel/geom/Vector;
    .locals 1

    .line 49
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/LineSegment;->startPoint:Lcom/itextpdf/kernel/geom/Vector;

    return-object v0
.end method

.method public transformBy(Lcom/itextpdf/kernel/geom/Matrix;)Lcom/itextpdf/kernel/geom/LineSegment;
    .locals 3
    .param p1, "m"    # Lcom/itextpdf/kernel/geom/Matrix;

    .line 87
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/LineSegment;->startPoint:Lcom/itextpdf/kernel/geom/Vector;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/geom/Vector;->cross(Lcom/itextpdf/kernel/geom/Matrix;)Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v0

    .line 88
    .local v0, "newStart":Lcom/itextpdf/kernel/geom/Vector;
    iget-object v1, p0, Lcom/itextpdf/kernel/geom/LineSegment;->endPoint:Lcom/itextpdf/kernel/geom/Vector;

    invoke-virtual {v1, p1}, Lcom/itextpdf/kernel/geom/Vector;->cross(Lcom/itextpdf/kernel/geom/Matrix;)Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v1

    .line 89
    .local v1, "newEnd":Lcom/itextpdf/kernel/geom/Vector;
    new-instance v2, Lcom/itextpdf/kernel/geom/LineSegment;

    invoke-direct {v2, v0, v1}, Lcom/itextpdf/kernel/geom/LineSegment;-><init>(Lcom/itextpdf/kernel/geom/Vector;Lcom/itextpdf/kernel/geom/Vector;)V

    return-object v2
.end method
