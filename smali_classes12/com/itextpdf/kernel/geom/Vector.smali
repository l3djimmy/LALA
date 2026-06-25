.class public Lcom/itextpdf/kernel/geom/Vector;
.super Ljava/lang/Object;
.source "Vector.java"


# static fields
.field public static final I1:I = 0x0

.field public static final I2:I = 0x1

.field public static final I3:I = 0x2


# instance fields
.field private final vals:[F


# direct methods
.method public constructor <init>(FFF)V
    .locals 2
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "z"    # F

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    const/4 v0, 0x3

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    .line 63
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    const/4 v1, 0x0

    aput p1, v0, v1

    .line 64
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    const/4 v1, 0x1

    aput p2, v0, v1

    .line 65
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    const/4 v1, 0x2

    aput p3, v0, v1

    .line 66
    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
    .end array-data
.end method


# virtual methods
.method public cross(Lcom/itextpdf/kernel/geom/Matrix;)Lcom/itextpdf/kernel/geom/Vector;
    .locals 7
    .param p1, "by"    # Lcom/itextpdf/kernel/geom/Matrix;

    .line 85
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/geom/Matrix;->get(I)F

    move-result v2

    mul-float/2addr v0, v2

    iget-object v2, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    const/4 v3, 0x1

    aget v2, v2, v3

    const/4 v4, 0x3

    invoke-virtual {p1, v4}, Lcom/itextpdf/kernel/geom/Matrix;->get(I)F

    move-result v4

    mul-float/2addr v2, v4

    add-float/2addr v0, v2

    iget-object v2, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    const/4 v4, 0x2

    aget v2, v2, v4

    const/4 v5, 0x6

    invoke-virtual {p1, v5}, Lcom/itextpdf/kernel/geom/Matrix;->get(I)F

    move-result v5

    mul-float/2addr v2, v5

    add-float/2addr v0, v2

    .line 86
    .local v0, "x":F
    iget-object v2, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    aget v2, v2, v1

    invoke-virtual {p1, v3}, Lcom/itextpdf/kernel/geom/Matrix;->get(I)F

    move-result v5

    mul-float/2addr v2, v5

    iget-object v5, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    aget v5, v5, v3

    const/4 v6, 0x4

    invoke-virtual {p1, v6}, Lcom/itextpdf/kernel/geom/Matrix;->get(I)F

    move-result v6

    mul-float/2addr v5, v6

    add-float/2addr v2, v5

    iget-object v5, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    aget v5, v5, v4

    const/4 v6, 0x7

    invoke-virtual {p1, v6}, Lcom/itextpdf/kernel/geom/Matrix;->get(I)F

    move-result v6

    mul-float/2addr v5, v6

    add-float/2addr v2, v5

    .line 87
    .local v2, "y":F
    iget-object v5, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    aget v1, v5, v1

    invoke-virtual {p1, v4}, Lcom/itextpdf/kernel/geom/Matrix;->get(I)F

    move-result v5

    mul-float/2addr v1, v5

    iget-object v5, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    aget v3, v5, v3

    const/4 v5, 0x5

    invoke-virtual {p1, v5}, Lcom/itextpdf/kernel/geom/Matrix;->get(I)F

    move-result v5

    mul-float/2addr v3, v5

    add-float/2addr v1, v3

    iget-object v3, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    aget v3, v3, v4

    const/16 v4, 0x8

    invoke-virtual {p1, v4}, Lcom/itextpdf/kernel/geom/Matrix;->get(I)F

    move-result v4

    mul-float/2addr v3, v4

    add-float/2addr v1, v3

    .line 89
    .local v1, "z":F
    new-instance v3, Lcom/itextpdf/kernel/geom/Vector;

    invoke-direct {v3, v0, v2, v1}, Lcom/itextpdf/kernel/geom/Vector;-><init>(FFF)V

    return-object v3
.end method

.method public cross(Lcom/itextpdf/kernel/geom/Vector;)Lcom/itextpdf/kernel/geom/Vector;
    .locals 7
    .param p1, "with"    # Lcom/itextpdf/kernel/geom/Vector;

    .line 113
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    const/4 v1, 0x1

    aget v0, v0, v1

    iget-object v2, p1, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    const/4 v3, 0x2

    aget v2, v2, v3

    mul-float/2addr v0, v2

    iget-object v2, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    aget v2, v2, v3

    iget-object v4, p1, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    aget v4, v4, v1

    mul-float/2addr v2, v4

    sub-float/2addr v0, v2

    .line 114
    .local v0, "x":F
    iget-object v2, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    aget v2, v2, v3

    iget-object v4, p1, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    const/4 v5, 0x0

    aget v4, v4, v5

    mul-float/2addr v2, v4

    iget-object v4, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    aget v4, v4, v5

    iget-object v6, p1, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    aget v3, v6, v3

    mul-float/2addr v4, v3

    sub-float/2addr v2, v4

    .line 115
    .local v2, "y":F
    iget-object v3, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    aget v3, v3, v5

    iget-object v4, p1, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    aget v4, v4, v1

    mul-float/2addr v3, v4

    iget-object v4, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    aget v1, v4, v1

    iget-object v4, p1, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    aget v4, v4, v5

    mul-float/2addr v1, v4

    sub-float/2addr v3, v1

    .line 117
    .local v3, "z":F
    new-instance v1, Lcom/itextpdf/kernel/geom/Vector;

    invoke-direct {v1, v0, v2, v3}, Lcom/itextpdf/kernel/geom/Vector;-><init>(FFF)V

    return-object v1
.end method

.method public dot(Lcom/itextpdf/kernel/geom/Vector;)F
    .locals 4
    .param p1, "with"    # Lcom/itextpdf/kernel/geom/Vector;

    .line 153
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    iget-object v2, p1, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    aget v1, v2, v1

    mul-float/2addr v0, v1

    iget-object v1, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    const/4 v2, 0x1

    aget v1, v1, v2

    iget-object v3, p1, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    aget v2, v3, v2

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    iget-object v1, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    const/4 v2, 0x2

    aget v1, v1, v2

    iget-object v3, p1, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    aget v2, v3, v2

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .line 211
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    .line 212
    return v0

    .line 214
    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    .line 215
    return v1

    .line 217
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_2

    .line 218
    return v1

    .line 220
    :cond_2
    move-object v2, p1

    check-cast v2, Lcom/itextpdf/kernel/geom/Vector;

    .line 221
    .local v2, "other":Lcom/itextpdf/kernel/geom/Vector;
    iget-object v3, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    iget-object v4, v2, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    invoke-static {v3, v4}, Ljava/util/Arrays;->equals([F[F)Z

    move-result v3

    if-nez v3, :cond_3

    .line 222
    return v1

    .line 224
    :cond_3
    return v0
.end method

.method public get(I)F
    .locals 1
    .param p1, "index"    # I

    .line 75
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    aget v0, v0, p1

    return v0
.end method

.method public hashCode()I
    .locals 4

    .line 200
    const/16 v0, 0x1f

    .line 201
    .local v0, "prime":I
    const/4 v1, 0x1

    .line 202
    .local v1, "result":I
    mul-int/lit8 v2, v1, 0x1f

    iget-object v3, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    invoke-static {v3}, Ljava/util/Arrays;->hashCode([F)I

    move-result v3

    add-int/2addr v2, v3

    .line 203
    .end local v1    # "result":I
    .local v2, "result":I
    return v2
.end method

.method public length()F
    .locals 2

    .line 170
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Vector;->lengthSquared()F

    move-result v0

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method

.method public lengthSquared()F
    .locals 4

    .line 184
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    iget-object v2, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    aget v1, v2, v1

    mul-float/2addr v0, v1

    iget-object v1, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    const/4 v2, 0x1

    aget v1, v1, v2

    iget-object v3, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    aget v2, v3, v2

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    iget-object v1, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    const/4 v2, 0x2

    aget v1, v1, v2

    iget-object v3, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    aget v2, v3, v2

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    return v0
.end method

.method public multiply(F)Lcom/itextpdf/kernel/geom/Vector;
    .locals 4
    .param p1, "by"    # F

    .line 140
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    mul-float/2addr v0, p1

    .line 141
    .local v0, "x":F
    iget-object v1, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    const/4 v2, 0x1

    aget v1, v1, v2

    mul-float/2addr v1, p1

    .line 142
    .local v1, "y":F
    iget-object v2, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    const/4 v3, 0x2

    aget v2, v2, v3

    mul-float/2addr v2, p1

    .line 143
    .local v2, "z":F
    new-instance v3, Lcom/itextpdf/kernel/geom/Vector;

    invoke-direct {v3, v0, v1, v2}, Lcom/itextpdf/kernel/geom/Vector;-><init>(FFF)V

    return-object v3
.end method

.method public normalize()Lcom/itextpdf/kernel/geom/Vector;
    .locals 5

    .line 126
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Vector;->length()F

    move-result v0

    .line 127
    .local v0, "l":F
    iget-object v1, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    const/4 v2, 0x0

    aget v1, v1, v2

    div-float/2addr v1, v0

    .line 128
    .local v1, "x":F
    iget-object v2, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    const/4 v3, 0x1

    aget v2, v2, v3

    div-float/2addr v2, v0

    .line 129
    .local v2, "y":F
    iget-object v3, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    const/4 v4, 0x2

    aget v3, v3, v4

    div-float/2addr v3, v0

    .line 130
    .local v3, "z":F
    new-instance v4, Lcom/itextpdf/kernel/geom/Vector;

    invoke-direct {v4, v1, v2, v3}, Lcom/itextpdf/kernel/geom/Vector;-><init>(FFF)V

    return-object v4
.end method

.method public subtract(Lcom/itextpdf/kernel/geom/Vector;)Lcom/itextpdf/kernel/geom/Vector;
    .locals 5
    .param p1, "v"    # Lcom/itextpdf/kernel/geom/Vector;

    .line 99
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    iget-object v2, p1, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    aget v1, v2, v1

    sub-float/2addr v0, v1

    .line 100
    .local v0, "x":F
    iget-object v1, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    const/4 v2, 0x1

    aget v1, v1, v2

    iget-object v3, p1, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    aget v2, v3, v2

    sub-float/2addr v1, v2

    .line 101
    .local v1, "y":F
    iget-object v2, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    const/4 v3, 0x2

    aget v2, v2, v3

    iget-object v4, p1, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    aget v3, v4, v3

    sub-float/2addr v2, v3

    .line 103
    .local v2, "z":F
    new-instance v3, Lcom/itextpdf/kernel/geom/Vector;

    invoke-direct {v3, v0, v1, v2}, Lcom/itextpdf/kernel/geom/Vector;-><init>(FFF)V

    return-object v3
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 192
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    const/4 v2, 0x0

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    const/4 v3, 0x1

    aget v2, v2, v3

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/kernel/geom/Vector;->vals:[F

    const/4 v2, 0x2

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
