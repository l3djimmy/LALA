.class public Lcom/itextpdf/kernel/geom/Point;
.super Ljava/lang/Object;
.source "Point.java"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field public x:D

.field public y:D


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0}, Lcom/itextpdf/kernel/geom/Point;->setLocation(II)V

    .line 37
    return-void
.end method

.method public constructor <init>(DD)V
    .locals 0
    .param p1, "x"    # D
    .param p3, "y"    # D

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/itextpdf/kernel/geom/Point;->setLocation(DD)V

    .line 45
    return-void
.end method

.method public constructor <init>(II)V
    .locals 0
    .param p1, "x"    # I
    .param p2, "y"    # I

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    invoke-virtual {p0, p1, p2}, Lcom/itextpdf/kernel/geom/Point;->setLocation(II)V

    .line 41
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/geom/Point;)V
    .locals 4
    .param p1, "p"    # Lcom/itextpdf/kernel/geom/Point;

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iget-wide v0, p1, Lcom/itextpdf/kernel/geom/Point;->x:D

    iget-wide v2, p1, Lcom/itextpdf/kernel/geom/Point;->y:D

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/itextpdf/kernel/geom/Point;->setLocation(DD)V

    .line 49
    return-void
.end method

.method public static distance(DDDD)D
    .locals 2
    .param p0, "x1"    # D
    .param p2, "y1"    # D
    .param p4, "x2"    # D
    .param p6, "y2"    # D

    .line 127
    invoke-static/range {p0 .. p7}, Lcom/itextpdf/kernel/geom/Point;->distanceSq(DDDD)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    return-wide v0
.end method

.method public static distanceSq(DDDD)D
    .locals 4
    .param p0, "x1"    # D
    .param p2, "y1"    # D
    .param p4, "x2"    # D
    .param p6, "y2"    # D

    .line 113
    sub-double/2addr p4, p0

    .line 114
    sub-double/2addr p6, p2

    .line 115
    mul-double v0, p4, p4

    mul-double v2, p6, p6

    add-double/2addr v0, v2

    return-wide v0
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 5

    .line 141
    new-instance v0, Lcom/itextpdf/kernel/geom/Point;

    iget-wide v1, p0, Lcom/itextpdf/kernel/geom/Point;->x:D

    iget-wide v3, p0, Lcom/itextpdf/kernel/geom/Point;->y:D

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    return-object v0
.end method

.method public distance(DD)D
    .locals 2
    .param p1, "px"    # D
    .param p3, "py"    # D

    .line 131
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/itextpdf/kernel/geom/Point;->distanceSq(DD)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    return-wide v0
.end method

.method public distance(Lcom/itextpdf/kernel/geom/Point;)D
    .locals 2
    .param p1, "p"    # Lcom/itextpdf/kernel/geom/Point;

    .line 135
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/geom/Point;->distanceSq(Lcom/itextpdf/kernel/geom/Point;)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    return-wide v0
.end method

.method public distanceSq(DD)D
    .locals 8
    .param p1, "px"    # D
    .param p3, "py"    # D

    .line 119
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v2

    move-wide v4, p1

    move-wide v6, p3

    .end local p1    # "px":D
    .end local p3    # "py":D
    .local v4, "px":D
    .local v6, "py":D
    invoke-static/range {v0 .. v7}, Lcom/itextpdf/kernel/geom/Point;->distanceSq(DDDD)D

    move-result-wide p1

    return-wide p1
.end method

.method public distanceSq(Lcom/itextpdf/kernel/geom/Point;)D
    .locals 8
    .param p1, "p"    # Lcom/itextpdf/kernel/geom/Point;

    .line 123
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v2

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v4

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v6

    invoke-static/range {v0 .. v7}, Lcom/itextpdf/kernel/geom/Point;->distanceSq(DDDD)D

    move-result-wide v0

    return-wide v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .param p1, "obj"    # Ljava/lang/Object;

    .line 53
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    .line 54
    return v0

    .line 56
    :cond_0
    instance-of v1, p1, Lcom/itextpdf/kernel/geom/Point;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 57
    move-object v1, p1

    check-cast v1, Lcom/itextpdf/kernel/geom/Point;

    .line 58
    .local v1, "p":Lcom/itextpdf/kernel/geom/Point;
    iget-wide v3, p0, Lcom/itextpdf/kernel/geom/Point;->x:D

    iget-wide v5, v1, Lcom/itextpdf/kernel/geom/Point;->x:D

    cmpl-double v3, v3, v5

    if-nez v3, :cond_1

    iget-wide v3, p0, Lcom/itextpdf/kernel/geom/Point;->y:D

    iget-wide v5, v1, Lcom/itextpdf/kernel/geom/Point;->y:D

    cmpl-double v3, v3, v5

    if-nez v3, :cond_1

    goto :goto_0

    :cond_1
    move v0, v2

    :goto_0
    return v0

    .line 60
    .end local v1    # "p":Lcom/itextpdf/kernel/geom/Point;
    :cond_2
    return v2
.end method

.method public getLocation()Lcom/itextpdf/kernel/geom/Point;
    .locals 5

    .line 78
    new-instance v0, Lcom/itextpdf/kernel/geom/Point;

    iget-wide v1, p0, Lcom/itextpdf/kernel/geom/Point;->x:D

    iget-wide v3, p0, Lcom/itextpdf/kernel/geom/Point;->y:D

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    return-object v0
.end method

.method public getX()D
    .locals 2

    .line 70
    iget-wide v0, p0, Lcom/itextpdf/kernel/geom/Point;->x:D

    return-wide v0
.end method

.method public getY()D
    .locals 2

    .line 74
    iget-wide v0, p0, Lcom/itextpdf/kernel/geom/Point;->y:D

    return-wide v0
.end method

.method public hashCode()I
    .locals 3

    .line 106
    new-instance v0, Lcom/itextpdf/io/util/HashCode;

    invoke-direct {v0}, Lcom/itextpdf/io/util/HashCode;-><init>()V

    .line 107
    .local v0, "hash":Lcom/itextpdf/io/util/HashCode;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/io/util/HashCode;->append(D)Lcom/itextpdf/io/util/HashCode;

    .line 108
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/io/util/HashCode;->append(D)Lcom/itextpdf/io/util/HashCode;

    .line 109
    invoke-virtual {v0}, Lcom/itextpdf/io/util/HashCode;->hashCode()I

    move-result v1

    return v1
.end method

.method public move(DD)V
    .locals 0
    .param p1, "x"    # D
    .param p3, "y"    # D

    .line 95
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/itextpdf/kernel/geom/Point;->setLocation(DD)V

    .line 96
    return-void
.end method

.method public setLocation(DD)V
    .locals 0
    .param p1, "x"    # D
    .param p3, "y"    # D

    .line 90
    iput-wide p1, p0, Lcom/itextpdf/kernel/geom/Point;->x:D

    .line 91
    iput-wide p3, p0, Lcom/itextpdf/kernel/geom/Point;->y:D

    .line 92
    return-void
.end method

.method public setLocation(II)V
    .locals 4
    .param p1, "x"    # I
    .param p2, "y"    # I

    .line 86
    int-to-double v0, p1

    int-to-double v2, p2

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/itextpdf/kernel/geom/Point;->setLocation(DD)V

    .line 87
    return-void
.end method

.method public setLocation(Lcom/itextpdf/kernel/geom/Point;)V
    .locals 4
    .param p1, "p"    # Lcom/itextpdf/kernel/geom/Point;

    .line 82
    iget-wide v0, p1, Lcom/itextpdf/kernel/geom/Point;->x:D

    iget-wide v2, p1, Lcom/itextpdf/kernel/geom/Point;->y:D

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/itextpdf/kernel/geom/Point;->setLocation(DD)V

    .line 83
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 66
    iget-wide v0, p0, Lcom/itextpdf/kernel/geom/Point;->x:D

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iget-wide v1, p0, Lcom/itextpdf/kernel/geom/Point;->y:D

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    filled-new-array {v0, v1}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "Point: [x={0},y={1}]"

    invoke-static {v1, v0}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public translate(DD)V
    .locals 2
    .param p1, "dx"    # D
    .param p3, "dy"    # D

    .line 99
    iget-wide v0, p0, Lcom/itextpdf/kernel/geom/Point;->x:D

    add-double/2addr v0, p1

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/Point;->x:D

    .line 100
    iget-wide v0, p0, Lcom/itextpdf/kernel/geom/Point;->y:D

    add-double/2addr v0, p3

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/Point;->y:D

    .line 101
    return-void
.end method
