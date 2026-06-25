.class public Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
.super Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point;
.source "Point.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LongPoint"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point<",
        "Ljava/lang/Long;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 207
    const-wide/16 v0, 0x0

    invoke-direct {p0, v0, v1, v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;-><init>(JJ)V

    .line 208
    return-void
.end method

.method public constructor <init>(DD)V
    .locals 4
    .param p1, "x"    # D
    .param p3, "y"    # D

    .line 215
    double-to-long v0, p1

    double-to-long v2, p3

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;-><init>(JJ)V

    .line 216
    return-void
.end method

.method public constructor <init>(JJ)V
    .locals 7
    .param p1, "x"    # J
    .param p3, "y"    # J

    .line 211
    const-wide/16 v5, 0x0

    move-object v0, p0

    move-wide v1, p1

    move-wide v3, p3

    .end local p1    # "x":J
    .end local p3    # "y":J
    .local v1, "x":J
    .local v3, "y":J
    invoke-direct/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;-><init>(JJJ)V

    .line 212
    return-void
.end method

.method public constructor <init>(JJJ)V
    .locals 3
    .param p1, "x"    # J
    .param p3, "y"    # J
    .param p5, "z"    # J

    .line 219
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {p5, p6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point;-><init>(Ljava/lang/Number;Ljava/lang/Number;Ljava/lang/Number;)V

    .line 220
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V
    .locals 0
    .param p1, "other"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    .line 223
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point;)V

    .line 224
    return-void
.end method

.method public static getDeltaX(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)D
    .locals 6
    .param p0, "pt1"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    .param p1, "pt2"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    .line 227
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 228
    const-wide v0, -0x381006cc38732053L    # -3.4E38

    return-wide v0

    .line 230
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v2

    sub-long/2addr v0, v2

    long-to-double v0, v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v2

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v4

    sub-long/2addr v2, v4

    long-to-double v2, v2

    div-double/2addr v0, v2

    return-wide v0
.end method


# virtual methods
.method public getX()J
    .locals 2

    .line 235
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->x:Ljava/lang/Number;

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0
.end method

.method public getY()J
    .locals 2

    .line 239
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->y:Ljava/lang/Number;

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0
.end method

.method public getZ()J
    .locals 2

    .line 243
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->z:Ljava/lang/Number;

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0
.end method
