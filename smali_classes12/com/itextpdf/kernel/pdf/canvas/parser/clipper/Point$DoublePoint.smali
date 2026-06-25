.class public Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$DoublePoint;
.super Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point;
.source "Point.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DoublePoint"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point<",
        "Ljava/lang/Double;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 177
    const-wide/16 v0, 0x0

    invoke-direct {p0, v0, v1, v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$DoublePoint;-><init>(DD)V

    .line 178
    return-void
.end method

.method public constructor <init>(DD)V
    .locals 7
    .param p1, "x"    # D
    .param p3, "y"    # D

    .line 181
    const-wide/16 v5, 0x0

    move-object v0, p0

    move-wide v1, p1

    move-wide v3, p3

    .end local p1    # "x":D
    .end local p3    # "y":D
    .local v1, "x":D
    .local v3, "y":D
    invoke-direct/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$DoublePoint;-><init>(DDD)V

    .line 182
    return-void
.end method

.method public constructor <init>(DDD)V
    .locals 3
    .param p1, "x"    # D
    .param p3, "y"    # D
    .param p5, "z"    # D

    .line 185
    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-static {p3, p4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-static {p5, p6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point;-><init>(Ljava/lang/Number;Ljava/lang/Number;Ljava/lang/Number;)V

    .line 186
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$DoublePoint;)V
    .locals 0
    .param p1, "other"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$DoublePoint;

    .line 189
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point;)V

    .line 190
    return-void
.end method


# virtual methods
.method public getX()D
    .locals 2

    .line 193
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$DoublePoint;->x:Ljava/lang/Number;

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    return-wide v0
.end method

.method public getY()D
    .locals 2

    .line 197
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$DoublePoint;->y:Ljava/lang/Number;

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    return-wide v0
.end method

.method public getZ()D
    .locals 2

    .line 201
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$DoublePoint;->z:Ljava/lang/Number;

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    return-wide v0
.end method
