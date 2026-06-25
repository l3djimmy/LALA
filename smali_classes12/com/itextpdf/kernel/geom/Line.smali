.class public Lcom/itextpdf/kernel/geom/Line;
.super Ljava/lang/Object;
.source "Line.java"

# interfaces
.implements Lcom/itextpdf/kernel/geom/IShape;


# instance fields
.field private final p1:Lcom/itextpdf/kernel/geom/Point;

.field private final p2:Lcom/itextpdf/kernel/geom/Point;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 40
    const/4 v0, 0x0

    invoke-direct {p0, v0, v0, v0, v0}, Lcom/itextpdf/kernel/geom/Line;-><init>(FFFF)V

    .line 41
    return-void
.end method

.method public constructor <init>(FFFF)V
    .locals 5
    .param p1, "x1"    # F
    .param p2, "y1"    # F
    .param p3, "x2"    # F
    .param p4, "y2"    # F

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    new-instance v0, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v1, p1

    float-to-double v3, p2

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    iput-object v0, p0, Lcom/itextpdf/kernel/geom/Line;->p1:Lcom/itextpdf/kernel/geom/Point;

    .line 52
    new-instance v0, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v1, p3

    float-to-double v3, p4

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    iput-object v0, p0, Lcom/itextpdf/kernel/geom/Line;->p2:Lcom/itextpdf/kernel/geom/Point;

    .line 53
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)V
    .locals 5
    .param p1, "p1"    # Lcom/itextpdf/kernel/geom/Point;
    .param p2, "p2"    # Lcom/itextpdf/kernel/geom/Point;

    .line 61
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v0

    double-to-float v0, v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v1

    double-to-float v1, v1

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v2

    double-to-float v2, v2

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v3

    double-to-float v3, v3

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/itextpdf/kernel/geom/Line;-><init>(FFFF)V

    .line 62
    return-void
.end method


# virtual methods
.method public getBasePoints()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Point;",
            ">;"
        }
    .end annotation

    .line 65
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 66
    .local v0, "basePoints":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Point;>;"
    iget-object v1, p0, Lcom/itextpdf/kernel/geom/Line;->p1:Lcom/itextpdf/kernel/geom/Point;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 67
    iget-object v1, p0, Lcom/itextpdf/kernel/geom/Line;->p2:Lcom/itextpdf/kernel/geom/Point;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    return-object v0
.end method
