.class public Lcom/itextpdf/kernel/geom/AffineTransform;
.super Ljava/lang/Object;
.source "AffineTransform.java"

# interfaces
.implements Ljava/lang/Cloneable;


# static fields
.field public static final TYPE_FLIP:I = 0x40

.field public static final TYPE_GENERAL_ROTATION:I = 0x10

.field public static final TYPE_GENERAL_SCALE:I = 0x4

.field public static final TYPE_GENERAL_TRANSFORM:I = 0x20

.field public static final TYPE_IDENTITY:I = 0x0

.field public static final TYPE_MASK_ROTATION:I = 0x18

.field public static final TYPE_MASK_SCALE:I = 0x6

.field public static final TYPE_QUADRANT_ROTATION:I = 0x8

.field public static final TYPE_TRANSLATION:I = 0x1

.field public static final TYPE_UNIFORM_SCALE:I = 0x2

.field static final TYPE_UNKNOWN:I = -0x1

.field static final ZERO:D = 1.0E-10


# instance fields
.field m00:D

.field m01:D

.field m02:D

.field m10:D

.field m11:D

.field m12:D

.field type:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 106
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->type:I

    .line 107
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    .line 108
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m12:D

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m02:D

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    .line 109
    return-void
.end method

.method public constructor <init>(DDDDDD)V
    .locals 1
    .param p1, "m00"    # D
    .param p3, "m10"    # D
    .param p5, "m01"    # D
    .param p7, "m11"    # D
    .param p9, "m02"    # D
    .param p11, "m12"    # D

    .line 121
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 122
    const/4 v0, -0x1

    iput v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->type:I

    .line 123
    iput-wide p1, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    .line 124
    iput-wide p3, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    .line 125
    iput-wide p5, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    .line 126
    iput-wide p7, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    .line 127
    iput-wide p9, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m02:D

    .line 128
    iput-wide p11, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m12:D

    .line 129
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/geom/AffineTransform;)V
    .locals 2
    .param p1, "t"    # Lcom/itextpdf/kernel/geom/AffineTransform;

    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 112
    iget v0, p1, Lcom/itextpdf/kernel/geom/AffineTransform;->type:I

    iput v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->type:I

    .line 113
    iget-wide v0, p1, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    .line 114
    iget-wide v0, p1, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    .line 115
    iget-wide v0, p1, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    .line 116
    iget-wide v0, p1, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    .line 117
    iget-wide v0, p1, Lcom/itextpdf/kernel/geom/AffineTransform;->m02:D

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m02:D

    .line 118
    iget-wide v0, p1, Lcom/itextpdf/kernel/geom/AffineTransform;->m12:D

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m12:D

    .line 119
    return-void
.end method

.method public constructor <init>([D)V
    .locals 2
    .param p1, "matrix"    # [D

    .line 143
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 144
    const/4 v0, -0x1

    iput v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->type:I

    .line 145
    const/4 v0, 0x0

    aget-wide v0, p1, v0

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    .line 146
    const/4 v0, 0x1

    aget-wide v0, p1, v0

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    .line 147
    const/4 v0, 0x2

    aget-wide v0, p1, v0

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    .line 148
    const/4 v0, 0x3

    aget-wide v0, p1, v0

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    .line 149
    array-length v0, p1

    const/4 v1, 0x4

    if-le v0, v1, :cond_0

    .line 150
    aget-wide v0, p1, v1

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m02:D

    .line 151
    const/4 v0, 0x5

    aget-wide v0, p1, v0

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m12:D

    .line 153
    :cond_0
    return-void
.end method

.method public constructor <init>([F)V
    .locals 2
    .param p1, "matrix"    # [F

    .line 131
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 132
    const/4 v0, -0x1

    iput v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->type:I

    .line 133
    const/4 v0, 0x0

    aget v0, p1, v0

    float-to-double v0, v0

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    .line 134
    const/4 v0, 0x1

    aget v0, p1, v0

    float-to-double v0, v0

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    .line 135
    const/4 v0, 0x2

    aget v0, p1, v0

    float-to-double v0, v0

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    .line 136
    const/4 v0, 0x3

    aget v0, p1, v0

    float-to-double v0, v0

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    .line 137
    array-length v0, p1

    const/4 v1, 0x4

    if-le v0, v1, :cond_0

    .line 138
    aget v0, p1, v1

    float-to-double v0, v0

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m02:D

    .line 139
    const/4 v0, 0x5

    aget v0, p1, v0

    float-to-double v0, v0

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m12:D

    .line 141
    :cond_0
    return-void
.end method

.method public static getRotateInstance(D)Lcom/itextpdf/kernel/geom/AffineTransform;
    .locals 1
    .param p0, "angle"    # D

    .line 401
    new-instance v0, Lcom/itextpdf/kernel/geom/AffineTransform;

    invoke-direct {v0}, Lcom/itextpdf/kernel/geom/AffineTransform;-><init>()V

    .line 402
    .local v0, "t":Lcom/itextpdf/kernel/geom/AffineTransform;
    invoke-virtual {v0, p0, p1}, Lcom/itextpdf/kernel/geom/AffineTransform;->setToRotation(D)V

    .line 403
    return-object v0
.end method

.method public static getRotateInstance(DDD)Lcom/itextpdf/kernel/geom/AffineTransform;
    .locals 8
    .param p0, "angle"    # D
    .param p2, "x"    # D
    .param p4, "y"    # D

    .line 416
    new-instance v0, Lcom/itextpdf/kernel/geom/AffineTransform;

    invoke-direct {v0}, Lcom/itextpdf/kernel/geom/AffineTransform;-><init>()V

    move-object v1, v0

    .line 417
    .local v1, "t":Lcom/itextpdf/kernel/geom/AffineTransform;
    move-wide v2, p0

    move-wide v4, p2

    move-wide v6, p4

    .end local p0    # "angle":D
    .end local p2    # "x":D
    .end local p4    # "y":D
    .local v2, "angle":D
    .local v4, "x":D
    .local v6, "y":D
    invoke-virtual/range {v1 .. v7}, Lcom/itextpdf/kernel/geom/AffineTransform;->setToRotation(DDD)V

    .line 418
    return-object v1
.end method

.method public static getScaleInstance(DD)Lcom/itextpdf/kernel/geom/AffineTransform;
    .locals 1
    .param p0, "scx"    # D
    .param p2, "scY"    # D

    .line 383
    new-instance v0, Lcom/itextpdf/kernel/geom/AffineTransform;

    invoke-direct {v0}, Lcom/itextpdf/kernel/geom/AffineTransform;-><init>()V

    .line 384
    .local v0, "t":Lcom/itextpdf/kernel/geom/AffineTransform;
    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/itextpdf/kernel/geom/AffineTransform;->setToScale(DD)V

    .line 385
    return-object v0
.end method

.method public static getShearInstance(DD)Lcom/itextpdf/kernel/geom/AffineTransform;
    .locals 1
    .param p0, "shx"    # D
    .param p2, "shy"    # D

    .line 389
    new-instance v0, Lcom/itextpdf/kernel/geom/AffineTransform;

    invoke-direct {v0}, Lcom/itextpdf/kernel/geom/AffineTransform;-><init>()V

    .line 390
    .local v0, "m":Lcom/itextpdf/kernel/geom/AffineTransform;
    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/itextpdf/kernel/geom/AffineTransform;->setToShear(DD)V

    .line 391
    return-object v0
.end method

.method public static getTranslateInstance(DD)Lcom/itextpdf/kernel/geom/AffineTransform;
    .locals 1
    .param p0, "mx"    # D
    .param p2, "my"    # D

    .line 377
    new-instance v0, Lcom/itextpdf/kernel/geom/AffineTransform;

    invoke-direct {v0}, Lcom/itextpdf/kernel/geom/AffineTransform;-><init>()V

    .line 378
    .local v0, "t":Lcom/itextpdf/kernel/geom/AffineTransform;
    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/itextpdf/kernel/geom/AffineTransform;->setToTranslation(DD)V

    .line 379
    return-object v0
.end method


# virtual methods
.method public clone()Lcom/itextpdf/kernel/geom/AffineTransform;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 656
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/geom/AffineTransform;

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 27
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/AffineTransform;->clone()Lcom/itextpdf/kernel/geom/AffineTransform;

    move-result-object v0

    return-object v0
.end method

.method public concatenate(Lcom/itextpdf/kernel/geom/AffineTransform;)V
    .locals 1
    .param p1, "t"    # Lcom/itextpdf/kernel/geom/AffineTransform;

    .line 471
    invoke-virtual {p0, p1, p0}, Lcom/itextpdf/kernel/geom/AffineTransform;->multiply(Lcom/itextpdf/kernel/geom/AffineTransform;Lcom/itextpdf/kernel/geom/AffineTransform;)Lcom/itextpdf/kernel/geom/AffineTransform;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/geom/AffineTransform;->setTransform(Lcom/itextpdf/kernel/geom/AffineTransform;)V

    .line 472
    return-void
.end method

.method public createInverse()Lcom/itextpdf/kernel/geom/AffineTransform;
    .locals 21
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/geom/NoninvertibleTransformException;
        }
    .end annotation

    .line 479
    move-object/from16 v0, p0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/AffineTransform;->getDeterminant()D

    move-result-wide v1

    .line 480
    .local v1, "det":D
    invoke-static {v1, v2}, Ljava/lang/Math;->abs(D)D

    move-result-wide v3

    const-wide v5, 0x3ddb7cdfd9d7bdbbL    # 1.0E-10

    cmpg-double v3, v3, v5

    if-ltz v3, :cond_0

    .line 485
    new-instance v4, Lcom/itextpdf/kernel/geom/AffineTransform;

    iget-wide v5, v0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    div-double/2addr v5, v1

    iget-wide v7, v0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    neg-double v7, v7

    div-double/2addr v7, v1

    iget-wide v9, v0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    neg-double v9, v9

    div-double/2addr v9, v1

    iget-wide v11, v0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    div-double/2addr v11, v1

    iget-wide v13, v0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    move-wide/from16 v17, v1

    .end local v1    # "det":D
    .local v17, "det":D
    iget-wide v1, v0, Lcom/itextpdf/kernel/geom/AffineTransform;->m12:D

    mul-double/2addr v13, v1

    iget-wide v1, v0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    move-wide v15, v1

    iget-wide v1, v0, Lcom/itextpdf/kernel/geom/AffineTransform;->m02:D

    mul-double/2addr v1, v15

    sub-double/2addr v13, v1

    div-double v13, v13, v17

    iget-wide v1, v0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    move-wide v15, v1

    iget-wide v1, v0, Lcom/itextpdf/kernel/geom/AffineTransform;->m02:D

    mul-double/2addr v1, v15

    move-wide v15, v1

    iget-wide v1, v0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    move-wide/from16 v19, v1

    iget-wide v1, v0, Lcom/itextpdf/kernel/geom/AffineTransform;->m12:D

    mul-double v1, v1, v19

    sub-double v1, v15, v1

    div-double v15, v1, v17

    invoke-direct/range {v4 .. v16}, Lcom/itextpdf/kernel/geom/AffineTransform;-><init>(DDDDDD)V

    return-object v4

    .line 483
    .end local v17    # "det":D
    .restart local v1    # "det":D
    :cond_0
    move-wide/from16 v17, v1

    .end local v1    # "det":D
    .restart local v17    # "det":D
    new-instance v1, Lcom/itextpdf/kernel/geom/NoninvertibleTransformException;

    const-string v2, "Determinant is zero. Cannot invert transformation."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/geom/NoninvertibleTransformException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public deltaTransform(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;
    .locals 10
    .param p1, "src"    # Lcom/itextpdf/kernel/geom/Point;
    .param p2, "dst"    # Lcom/itextpdf/kernel/geom/Point;

    .line 574
    if-nez p2, :cond_0

    .line 575
    new-instance v0, Lcom/itextpdf/kernel/geom/Point;

    invoke-direct {v0}, Lcom/itextpdf/kernel/geom/Point;-><init>()V

    move-object p2, v0

    .line 578
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v0

    .line 579
    .local v0, "x":D
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v2

    .line 581
    .local v2, "y":D
    iget-wide v4, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    mul-double/2addr v4, v0

    iget-wide v6, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    mul-double/2addr v6, v2

    add-double/2addr v4, v6

    iget-wide v6, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    mul-double/2addr v6, v0

    iget-wide v8, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    mul-double/2addr v8, v2

    add-double/2addr v6, v8

    invoke-virtual {p2, v4, v5, v6, v7}, Lcom/itextpdf/kernel/geom/Point;->setLocation(DD)V

    .line 582
    return-object p2
.end method

.method public deltaTransform([DI[DII)V
    .locals 9
    .param p1, "src"    # [D
    .param p2, "srcOff"    # I
    .param p3, "dst"    # [D
    .param p4, "dstOff"    # I
    .param p5, "length"    # I

    .line 586
    nop

    :goto_0
    add-int/lit8 p5, p5, -0x1

    if-ltz p5, :cond_0

    .line 587
    add-int/lit8 v0, p2, 0x1

    .end local p2    # "srcOff":I
    .local v0, "srcOff":I
    aget-wide v1, p1, p2

    .line 588
    .local v1, "x":D
    add-int/lit8 p2, v0, 0x1

    .end local v0    # "srcOff":I
    .restart local p2    # "srcOff":I
    aget-wide v3, p1, v0

    .line 589
    .local v3, "y":D
    add-int/lit8 v0, p4, 0x1

    .end local p4    # "dstOff":I
    .local v0, "dstOff":I
    iget-wide v5, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    mul-double/2addr v5, v1

    iget-wide v7, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    mul-double/2addr v7, v3

    add-double/2addr v5, v7

    aput-wide v5, p3, p4

    .line 590
    add-int/lit8 p4, v0, 0x1

    .end local v0    # "dstOff":I
    .restart local p4    # "dstOff":I
    iget-wide v5, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    mul-double/2addr v5, v1

    iget-wide v7, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    mul-double/2addr v7, v3

    add-double/2addr v5, v7

    aput-wide v5, p3, v0

    .line 591
    .end local v1    # "x":D
    .end local v3    # "y":D
    goto :goto_0

    .line 592
    :cond_0
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .param p1, "o"    # Ljava/lang/Object;

    .line 662
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    .line 663
    return v0

    .line 665
    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_1

    .line 668
    :cond_1
    move-object v2, p1

    check-cast v2, Lcom/itextpdf/kernel/geom/AffineTransform;

    .line 670
    .local v2, "that":Lcom/itextpdf/kernel/geom/AffineTransform;
    iget-wide v3, v2, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    iget-wide v5, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Double;->compare(DD)I

    move-result v3

    if-nez v3, :cond_2

    iget-wide v3, v2, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    iget-wide v5, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    .line 671
    invoke-static {v3, v4, v5, v6}, Ljava/lang/Double;->compare(DD)I

    move-result v3

    if-nez v3, :cond_2

    iget-wide v3, v2, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    iget-wide v5, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    .line 672
    invoke-static {v3, v4, v5, v6}, Ljava/lang/Double;->compare(DD)I

    move-result v3

    if-nez v3, :cond_2

    iget-wide v3, v2, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    iget-wide v5, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    .line 673
    invoke-static {v3, v4, v5, v6}, Ljava/lang/Double;->compare(DD)I

    move-result v3

    if-nez v3, :cond_2

    iget-wide v3, v2, Lcom/itextpdf/kernel/geom/AffineTransform;->m02:D

    iget-wide v5, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m02:D

    .line 674
    invoke-static {v3, v4, v5, v6}, Ljava/lang/Double;->compare(DD)I

    move-result v3

    if-nez v3, :cond_2

    iget-wide v3, v2, Lcom/itextpdf/kernel/geom/AffineTransform;->m12:D

    iget-wide v5, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m12:D

    .line 675
    invoke-static {v3, v4, v5, v6}, Ljava/lang/Double;->compare(DD)I

    move-result v3

    if-nez v3, :cond_2

    goto :goto_0

    :cond_2
    move v0, v1

    .line 670
    :goto_0
    return v0

    .line 666
    .end local v2    # "that":Lcom/itextpdf/kernel/geom/AffineTransform;
    :cond_3
    :goto_1
    return v1
.end method

.method public getDeterminant()D
    .locals 6

    .line 270
    iget-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    iget-wide v2, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    mul-double/2addr v0, v2

    iget-wide v2, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    iget-wide v4, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    mul-double/2addr v2, v4

    sub-double/2addr v0, v2

    return-wide v0
.end method

.method public getMatrix([D)V
    .locals 4
    .param p1, "matrix"    # [D

    .line 259
    const/4 v0, 0x0

    iget-wide v1, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    aput-wide v1, p1, v0

    .line 260
    const/4 v0, 0x1

    iget-wide v1, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    aput-wide v1, p1, v0

    .line 261
    const/4 v0, 0x2

    iget-wide v1, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    aput-wide v1, p1, v0

    .line 262
    const/4 v0, 0x3

    iget-wide v1, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    aput-wide v1, p1, v0

    .line 263
    array-length v0, p1

    const/4 v1, 0x4

    if-le v0, v1, :cond_0

    .line 264
    iget-wide v2, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m02:D

    aput-wide v2, p1, v1

    .line 265
    const/4 v0, 0x5

    iget-wide v1, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m12:D

    aput-wide v1, p1, v0

    .line 267
    :cond_0
    return-void
.end method

.method public getMatrix([F)V
    .locals 4
    .param p1, "matrix"    # [F

    .line 248
    iget-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    double-to-float v0, v0

    const/4 v1, 0x0

    aput v0, p1, v1

    .line 249
    iget-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    double-to-float v0, v0

    const/4 v1, 0x1

    aput v0, p1, v1

    .line 250
    iget-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    double-to-float v0, v0

    const/4 v1, 0x2

    aput v0, p1, v1

    .line 251
    iget-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    double-to-float v0, v0

    const/4 v1, 0x3

    aput v0, p1, v1

    .line 252
    array-length v0, p1

    const/4 v1, 0x4

    if-le v0, v1, :cond_0

    .line 253
    iget-wide v2, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m02:D

    double-to-float v0, v2

    aput v0, p1, v1

    .line 254
    iget-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m12:D

    double-to-float v0, v0

    const/4 v1, 0x5

    aput v0, p1, v1

    .line 256
    :cond_0
    return-void
.end method

.method public getScaleX()D
    .locals 2

    .line 220
    iget-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    return-wide v0
.end method

.method public getScaleY()D
    .locals 2

    .line 224
    iget-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    return-wide v0
.end method

.method public getShearX()D
    .locals 2

    .line 228
    iget-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    return-wide v0
.end method

.method public getShearY()D
    .locals 2

    .line 232
    iget-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    return-wide v0
.end method

.method public getTranslateX()D
    .locals 2

    .line 236
    iget-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m02:D

    return-wide v0
.end method

.method public getTranslateY()D
    .locals 2

    .line 240
    iget-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m12:D

    return-wide v0
.end method

.method public getType()I
    .locals 13

    .line 179
    iget v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->type:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 180
    iget v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->type:I

    return v0

    .line 183
    :cond_0
    const/4 v0, 0x0

    .line 185
    .local v0, "type":I
    iget-wide v1, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    iget-wide v3, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    mul-double/2addr v1, v3

    iget-wide v3, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    iget-wide v5, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    mul-double/2addr v3, v5

    add-double/2addr v1, v3

    const-wide/16 v3, 0x0

    cmpl-double v1, v1, v3

    if-eqz v1, :cond_1

    .line 186
    or-int/lit8 v0, v0, 0x20

    .line 187
    return v0

    .line 190
    :cond_1
    iget-wide v1, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m02:D

    cmpl-double v1, v1, v3

    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    if-nez v1, :cond_3

    iget-wide v1, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m12:D

    cmpl-double v1, v1, v3

    if-eqz v1, :cond_2

    goto :goto_0

    .line 192
    :cond_2
    iget-wide v1, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    cmpl-double v1, v1, v5

    if-nez v1, :cond_4

    iget-wide v1, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    cmpl-double v1, v1, v5

    if-nez v1, :cond_4

    iget-wide v1, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    cmpl-double v1, v1, v3

    if-nez v1, :cond_4

    iget-wide v1, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    cmpl-double v1, v1, v3

    if-nez v1, :cond_4

    .line 193
    const/4 v0, 0x0

    .line 194
    return v0

    .line 191
    :cond_3
    :goto_0
    or-int/lit8 v0, v0, 0x1

    .line 197
    :cond_4
    iget-wide v1, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    iget-wide v7, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    mul-double/2addr v1, v7

    iget-wide v7, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    iget-wide v9, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    mul-double/2addr v7, v9

    sub-double/2addr v1, v7

    cmpg-double v1, v1, v3

    if-gez v1, :cond_5

    .line 198
    or-int/lit8 v0, v0, 0x40

    .line 201
    :cond_5
    iget-wide v1, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    iget-wide v7, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    mul-double/2addr v1, v7

    iget-wide v7, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    iget-wide v9, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    mul-double/2addr v7, v9

    add-double/2addr v1, v7

    .line 202
    .local v1, "dx":D
    iget-wide v7, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    iget-wide v9, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    mul-double/2addr v7, v9

    iget-wide v9, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    iget-wide v11, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    mul-double/2addr v9, v11

    add-double/2addr v7, v9

    .line 203
    .local v7, "dy":D
    cmpl-double v9, v1, v7

    if-eqz v9, :cond_6

    .line 204
    or-int/lit8 v0, v0, 0x4

    goto :goto_1

    .line 205
    :cond_6
    cmpl-double v5, v1, v5

    if-eqz v5, :cond_7

    .line 206
    or-int/lit8 v0, v0, 0x2

    .line 209
    :cond_7
    :goto_1
    iget-wide v5, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    cmpl-double v5, v5, v3

    if-nez v5, :cond_8

    iget-wide v5, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    cmpl-double v5, v5, v3

    if-eqz v5, :cond_9

    :cond_8
    iget-wide v5, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    cmpl-double v5, v5, v3

    if-nez v5, :cond_a

    iget-wide v5, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    cmpl-double v5, v5, v3

    if-nez v5, :cond_a

    iget-wide v5, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    cmpg-double v5, v5, v3

    if-ltz v5, :cond_9

    iget-wide v5, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    cmpg-double v5, v5, v3

    if-gez v5, :cond_a

    .line 211
    :cond_9
    or-int/lit8 v0, v0, 0x8

    goto :goto_2

    .line 212
    :cond_a
    iget-wide v5, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    cmpl-double v5, v5, v3

    if-nez v5, :cond_b

    iget-wide v5, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    cmpl-double v3, v5, v3

    if-eqz v3, :cond_c

    .line 213
    :cond_b
    or-int/lit8 v0, v0, 0x10

    .line 216
    :cond_c
    :goto_2
    return v0
.end method

.method public hashCode()I
    .locals 8

    .line 680
    iget-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    iget-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    iget-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    iget-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    iget-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m02:D

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    iget-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m12:D

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v7

    filled-new-array/range {v2 .. v7}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public inverseTransform(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;
    .locals 12
    .param p1, "src"    # Lcom/itextpdf/kernel/geom/Point;
    .param p2, "dst"    # Lcom/itextpdf/kernel/geom/Point;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/geom/NoninvertibleTransformException;
        }
    .end annotation

    .line 595
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/AffineTransform;->getDeterminant()D

    move-result-wide v0

    .line 596
    .local v0, "det":D
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v2

    const-wide v4, 0x3ddb7cdfd9d7bdbbL    # 1.0E-10

    cmpg-double v2, v2, v4

    if-ltz v2, :cond_1

    .line 602
    if-nez p2, :cond_0

    .line 603
    new-instance v2, Lcom/itextpdf/kernel/geom/Point;

    invoke-direct {v2}, Lcom/itextpdf/kernel/geom/Point;-><init>()V

    move-object p2, v2

    .line 606
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v2

    iget-wide v4, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m02:D

    sub-double/2addr v2, v4

    .line 607
    .local v2, "x":D
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v4

    iget-wide v6, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m12:D

    sub-double/2addr v4, v6

    .line 609
    .local v4, "y":D
    iget-wide v6, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    mul-double/2addr v6, v2

    iget-wide v8, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    mul-double/2addr v8, v4

    sub-double/2addr v6, v8

    div-double/2addr v6, v0

    iget-wide v8, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    mul-double/2addr v8, v4

    iget-wide v10, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    mul-double/2addr v10, v2

    sub-double/2addr v8, v10

    div-double/2addr v8, v0

    invoke-virtual {p2, v6, v7, v8, v9}, Lcom/itextpdf/kernel/geom/Point;->setLocation(DD)V

    .line 610
    return-object p2

    .line 599
    .end local v2    # "x":D
    .end local v4    # "y":D
    :cond_1
    new-instance v2, Lcom/itextpdf/kernel/geom/NoninvertibleTransformException;

    const-string v3, "Determinant is zero. Cannot invert transformation."

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/geom/NoninvertibleTransformException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public inverseTransform([DI[DII)V
    .locals 14
    .param p1, "src"    # [D
    .param p2, "srcOff"    # I
    .param p3, "dst"    # [D
    .param p4, "dstOff"    # I
    .param p5, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/geom/NoninvertibleTransformException;
        }
    .end annotation

    .line 615
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/AffineTransform;->getDeterminant()D

    move-result-wide v0

    .line 616
    .local v0, "det":D
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v2

    const-wide v4, 0x3ddb7cdfd9d7bdbbL    # 1.0E-10

    cmpg-double v2, v2, v4

    if-ltz v2, :cond_1

    move/from16 v2, p2

    move/from16 v3, p4

    move/from16 v4, p5

    .line 622
    .end local p2    # "srcOff":I
    .end local p4    # "dstOff":I
    .end local p5    # "length":I
    .local v2, "srcOff":I
    .local v3, "dstOff":I
    .local v4, "length":I
    :goto_0
    add-int/lit8 v4, v4, -0x1

    if-ltz v4, :cond_0

    .line 623
    add-int/lit8 v5, v2, 0x1

    .end local v2    # "srcOff":I
    .local v5, "srcOff":I
    aget-wide v6, p1, v2

    iget-wide v8, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m02:D

    sub-double/2addr v6, v8

    .line 624
    .local v6, "x":D
    add-int/lit8 v2, v5, 0x1

    .end local v5    # "srcOff":I
    .restart local v2    # "srcOff":I
    aget-wide v8, p1, v5

    iget-wide v10, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m12:D

    sub-double/2addr v8, v10

    .line 625
    .local v8, "y":D
    add-int/lit8 v5, v3, 0x1

    .end local v3    # "dstOff":I
    .local v5, "dstOff":I
    iget-wide v10, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    mul-double/2addr v10, v6

    iget-wide v12, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    mul-double/2addr v12, v8

    sub-double/2addr v10, v12

    div-double/2addr v10, v0

    aput-wide v10, p3, v3

    .line 626
    add-int/lit8 v3, v5, 0x1

    .end local v5    # "dstOff":I
    .restart local v3    # "dstOff":I
    iget-wide v10, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    mul-double/2addr v10, v8

    iget-wide v12, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    mul-double/2addr v12, v6

    sub-double/2addr v10, v12

    div-double/2addr v10, v0

    aput-wide v10, p3, v5

    .line 627
    .end local v6    # "x":D
    .end local v8    # "y":D
    goto :goto_0

    .line 628
    :cond_0
    return-void

    .line 619
    .end local v2    # "srcOff":I
    .end local v3    # "dstOff":I
    .end local v4    # "length":I
    .restart local p2    # "srcOff":I
    .restart local p4    # "dstOff":I
    .restart local p5    # "length":I
    :cond_1
    new-instance v2, Lcom/itextpdf/kernel/geom/NoninvertibleTransformException;

    const-string v3, "Determinant is zero. Cannot invert transformation."

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/geom/NoninvertibleTransformException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public inverseTransform([FI[FII)V
    .locals 10
    .param p1, "src"    # [F
    .param p2, "srcOff"    # I
    .param p3, "dst"    # [F
    .param p4, "dstOff"    # I
    .param p5, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/geom/NoninvertibleTransformException;
        }
    .end annotation

    .line 632
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/AffineTransform;->getDeterminant()D

    move-result-wide v0

    double-to-float v0, v0

    .line 633
    .local v0, "det":F
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v1

    float-to-double v1, v1

    const-wide v3, 0x3ddb7cdfd9d7bdbbL    # 1.0E-10

    cmpg-double v1, v1, v3

    if-ltz v1, :cond_1

    .line 639
    :goto_0
    add-int/lit8 p5, p5, -0x1

    if-ltz p5, :cond_0

    .line 640
    add-int/lit8 v1, p2, 0x1

    .end local p2    # "srcOff":I
    .local v1, "srcOff":I
    aget p2, p1, p2

    float-to-double v2, p2

    iget-wide v4, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m02:D

    sub-double/2addr v2, v4

    double-to-float p2, v2

    .line 641
    .local p2, "x":F
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "srcOff":I
    .local v2, "srcOff":I
    aget v1, p1, v1

    float-to-double v3, v1

    iget-wide v5, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m12:D

    sub-double/2addr v3, v5

    double-to-float v1, v3

    .line 642
    .local v1, "y":F
    add-int/lit8 v3, p4, 0x1

    .end local p4    # "dstOff":I
    .local v3, "dstOff":I
    float-to-double v4, p2

    iget-wide v6, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    mul-double/2addr v4, v6

    float-to-double v6, v1

    iget-wide v8, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    mul-double/2addr v6, v8

    sub-double/2addr v4, v6

    float-to-double v6, v0

    div-double/2addr v4, v6

    double-to-float v4, v4

    aput v4, p3, p4

    .line 643
    add-int/lit8 p4, v3, 0x1

    .end local v3    # "dstOff":I
    .restart local p4    # "dstOff":I
    float-to-double v4, v1

    iget-wide v6, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    mul-double/2addr v4, v6

    float-to-double v6, p2

    iget-wide v8, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    mul-double/2addr v6, v8

    sub-double/2addr v4, v6

    float-to-double v6, v0

    div-double/2addr v4, v6

    double-to-float v4, v4

    aput v4, p3, v3

    .line 644
    .end local v1    # "y":F
    .end local p2    # "x":F
    move p2, v2

    goto :goto_0

    .line 645
    .end local v2    # "srcOff":I
    .local p2, "srcOff":I
    :cond_0
    return-void

    .line 636
    :cond_1
    new-instance v1, Lcom/itextpdf/kernel/geom/NoninvertibleTransformException;

    const-string v2, "Determinant is zero. Cannot invert transformation."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/geom/NoninvertibleTransformException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public isIdentity()Z
    .locals 1

    .line 244
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/AffineTransform;->getType()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method multiply(Lcom/itextpdf/kernel/geom/AffineTransform;Lcom/itextpdf/kernel/geom/AffineTransform;)Lcom/itextpdf/kernel/geom/AffineTransform;
    .locals 20
    .param p1, "t1"    # Lcom/itextpdf/kernel/geom/AffineTransform;
    .param p2, "t2"    # Lcom/itextpdf/kernel/geom/AffineTransform;

    .line 461
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    new-instance v2, Lcom/itextpdf/kernel/geom/AffineTransform;

    iget-wide v3, v0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    iget-wide v5, v1, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    mul-double/2addr v3, v5

    iget-wide v5, v0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    iget-wide v7, v1, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    mul-double/2addr v5, v7

    add-double/2addr v3, v5

    iget-wide v5, v0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    iget-wide v7, v1, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    mul-double/2addr v5, v7

    iget-wide v7, v0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    iget-wide v9, v1, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    mul-double/2addr v7, v9

    add-double/2addr v5, v7

    iget-wide v7, v0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    iget-wide v9, v1, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    mul-double/2addr v7, v9

    iget-wide v9, v0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    iget-wide v11, v1, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    mul-double/2addr v9, v11

    add-double/2addr v7, v9

    iget-wide v9, v0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    iget-wide v11, v1, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    mul-double/2addr v9, v11

    iget-wide v11, v0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    iget-wide v13, v1, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    mul-double/2addr v11, v13

    add-double/2addr v9, v11

    iget-wide v11, v0, Lcom/itextpdf/kernel/geom/AffineTransform;->m02:D

    iget-wide v13, v1, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    mul-double/2addr v11, v13

    iget-wide v13, v0, Lcom/itextpdf/kernel/geom/AffineTransform;->m12:D

    move-object v15, v2

    move-wide/from16 v16, v3

    iget-wide v2, v1, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    mul-double/2addr v13, v2

    add-double/2addr v11, v13

    iget-wide v2, v1, Lcom/itextpdf/kernel/geom/AffineTransform;->m02:D

    add-double/2addr v11, v2

    iget-wide v2, v0, Lcom/itextpdf/kernel/geom/AffineTransform;->m02:D

    iget-wide v13, v1, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    mul-double/2addr v2, v13

    iget-wide v13, v0, Lcom/itextpdf/kernel/geom/AffineTransform;->m12:D

    move-wide/from16 v18, v2

    iget-wide v2, v1, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    mul-double/2addr v13, v2

    add-double v2, v18, v13

    iget-wide v13, v1, Lcom/itextpdf/kernel/geom/AffineTransform;->m12:D

    add-double/2addr v13, v2

    move-object v2, v15

    move-wide/from16 v3, v16

    invoke-direct/range {v2 .. v14}, Lcom/itextpdf/kernel/geom/AffineTransform;-><init>(DDDDDD)V

    return-object v15
.end method

.method public preConcatenate(Lcom/itextpdf/kernel/geom/AffineTransform;)V
    .locals 1
    .param p1, "t"    # Lcom/itextpdf/kernel/geom/AffineTransform;

    .line 475
    invoke-virtual {p0, p0, p1}, Lcom/itextpdf/kernel/geom/AffineTransform;->multiply(Lcom/itextpdf/kernel/geom/AffineTransform;Lcom/itextpdf/kernel/geom/AffineTransform;)Lcom/itextpdf/kernel/geom/AffineTransform;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/geom/AffineTransform;->setTransform(Lcom/itextpdf/kernel/geom/AffineTransform;)V

    .line 476
    return-void
.end method

.method public rotate(D)V
    .locals 1
    .param p1, "angle"    # D

    .line 439
    invoke-static {p1, p2}, Lcom/itextpdf/kernel/geom/AffineTransform;->getRotateInstance(D)Lcom/itextpdf/kernel/geom/AffineTransform;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/geom/AffineTransform;->concatenate(Lcom/itextpdf/kernel/geom/AffineTransform;)V

    .line 440
    return-void
.end method

.method public rotate(DDD)V
    .locals 1
    .param p1, "angle"    # D
    .param p3, "px"    # D
    .param p5, "py"    # D

    .line 450
    invoke-static/range {p1 .. p6}, Lcom/itextpdf/kernel/geom/AffineTransform;->getRotateInstance(DDD)Lcom/itextpdf/kernel/geom/AffineTransform;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/geom/AffineTransform;->concatenate(Lcom/itextpdf/kernel/geom/AffineTransform;)V

    .line 451
    return-void
.end method

.method public scale(DD)V
    .locals 1
    .param p1, "scx"    # D
    .param p3, "scy"    # D

    .line 426
    invoke-static {p1, p2, p3, p4}, Lcom/itextpdf/kernel/geom/AffineTransform;->getScaleInstance(DD)Lcom/itextpdf/kernel/geom/AffineTransform;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/geom/AffineTransform;->concatenate(Lcom/itextpdf/kernel/geom/AffineTransform;)V

    .line 427
    return-void
.end method

.method public setToIdentity()V
    .locals 2

    .line 299
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->type:I

    .line 300
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    .line 301
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m12:D

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m02:D

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    .line 302
    return-void
.end method

.method public setToRotation(D)V
    .locals 14
    .param p1, "angle"    # D

    .line 345
    invoke-static/range {p1 .. p2}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    .line 346
    .local v0, "sin":D
    invoke-static/range {p1 .. p2}, Ljava/lang/Math;->cos(D)D

    move-result-wide v2

    .line 347
    .local v2, "cos":D
    invoke-static {v2, v3}, Ljava/lang/Math;->abs(D)D

    move-result-wide v4

    const-wide v6, 0x3ddb7cdfd9d7bdbbL    # 1.0E-10

    cmpg-double v4, v4, v6

    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    const-wide/high16 v10, -0x4010000000000000L    # -1.0

    const-wide/16 v12, 0x0

    if-gez v4, :cond_1

    .line 348
    const-wide/16 v2, 0x0

    .line 349
    cmpl-double v4, v0, v12

    if-lez v4, :cond_0

    goto :goto_0

    :cond_0
    move-wide v8, v10

    :goto_0
    move-wide v0, v8

    goto :goto_2

    .line 350
    :cond_1
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v4

    cmpg-double v4, v4, v6

    if-gez v4, :cond_3

    .line 351
    const-wide/16 v0, 0x0

    .line 352
    cmpl-double v4, v2, v12

    if-lez v4, :cond_2

    goto :goto_1

    :cond_2
    move-wide v8, v10

    :goto_1
    move-wide v2, v8

    .line 354
    :cond_3
    :goto_2
    double-to-float v4, v2

    float-to-double v4, v4

    iput-wide v4, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    iput-wide v4, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    .line 355
    neg-double v4, v0

    double-to-float v4, v4

    float-to-double v4, v4

    iput-wide v4, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    .line 356
    double-to-float v4, v0

    float-to-double v4, v4

    iput-wide v4, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    .line 357
    iput-wide v12, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m12:D

    iput-wide v12, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m02:D

    .line 358
    const/4 v4, -0x1

    iput v4, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->type:I

    .line 359
    return-void
.end method

.method public setToRotation(DDD)V
    .locals 6
    .param p1, "angle"    # D
    .param p3, "px"    # D
    .param p5, "py"    # D

    .line 370
    invoke-virtual {p0, p1, p2}, Lcom/itextpdf/kernel/geom/AffineTransform;->setToRotation(D)V

    .line 371
    iget-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    sub-double v0, v2, v0

    mul-double/2addr v0, p3

    iget-wide v4, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    mul-double/2addr v4, p5

    add-double/2addr v0, v4

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m02:D

    .line 372
    iget-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    sub-double/2addr v2, v0

    mul-double/2addr v2, p5

    iget-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    mul-double/2addr v0, p3

    sub-double/2addr v2, v0

    iput-wide v2, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m12:D

    .line 373
    const/4 v0, -0x1

    iput v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->type:I

    .line 374
    return-void
.end method

.method public setToScale(DD)V
    .locals 3
    .param p1, "scx"    # D
    .param p3, "scy"    # D

    .line 317
    iput-wide p1, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    .line 318
    iput-wide p3, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    .line 319
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m12:D

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m02:D

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    .line 320
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    cmpl-double v2, p1, v0

    if-nez v2, :cond_1

    cmpl-double v0, p3, v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 323
    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->type:I

    goto :goto_1

    .line 321
    :cond_1
    :goto_0
    const/4 v0, -0x1

    iput v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->type:I

    .line 325
    :goto_1
    return-void
.end method

.method public setToShear(DD)V
    .locals 3
    .param p1, "shx"    # D
    .param p3, "shy"    # D

    .line 328
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    .line 329
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m12:D

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m02:D

    .line 330
    iput-wide p1, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    .line 331
    iput-wide p3, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    .line 332
    cmpl-double v2, p1, v0

    if-nez v2, :cond_1

    cmpl-double v0, p3, v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 335
    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->type:I

    goto :goto_1

    .line 333
    :cond_1
    :goto_0
    const/4 v0, -0x1

    iput v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->type:I

    .line 337
    :goto_1
    return-void
.end method

.method public setToTranslation(DD)V
    .locals 3
    .param p1, "mx"    # D
    .param p3, "my"    # D

    .line 305
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    .line 306
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    .line 307
    iput-wide p1, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m02:D

    .line 308
    iput-wide p3, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m12:D

    .line 309
    cmpl-double v2, p1, v0

    if-nez v2, :cond_0

    cmpl-double v0, p3, v0

    if-nez v0, :cond_0

    .line 310
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->type:I

    goto :goto_0

    .line 312
    :cond_0
    const/4 v0, 0x1

    iput v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->type:I

    .line 314
    :goto_0
    return-void
.end method

.method public setTransform(DDDDDD)V
    .locals 1
    .param p1, "m00"    # D
    .param p3, "m10"    # D
    .param p5, "m01"    # D
    .param p7, "m11"    # D
    .param p9, "m02"    # D
    .param p11, "m12"    # D

    .line 284
    const/4 v0, -0x1

    iput v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->type:I

    .line 285
    iput-wide p1, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    .line 286
    iput-wide p3, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    .line 287
    iput-wide p5, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    .line 288
    iput-wide p7, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    .line 289
    iput-wide p9, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m02:D

    .line 290
    iput-wide p11, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m12:D

    .line 291
    return-void
.end method

.method public setTransform(FFFFFF)V
    .locals 2
    .param p1, "m00"    # F
    .param p2, "m10"    # F
    .param p3, "m01"    # F
    .param p4, "m11"    # F
    .param p5, "m02"    # F
    .param p6, "m12"    # F

    .line 274
    const/4 v0, -0x1

    iput v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->type:I

    .line 275
    float-to-double v0, p1

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    .line 276
    float-to-double v0, p2

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    .line 277
    float-to-double v0, p3

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    .line 278
    float-to-double v0, p4

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    .line 279
    float-to-double v0, p5

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m02:D

    .line 280
    float-to-double v0, p6

    iput-wide v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m12:D

    .line 281
    return-void
.end method

.method public setTransform(Lcom/itextpdf/kernel/geom/AffineTransform;)V
    .locals 14
    .param p1, "t"    # Lcom/itextpdf/kernel/geom/AffineTransform;

    .line 294
    iget v0, p1, Lcom/itextpdf/kernel/geom/AffineTransform;->type:I

    iput v0, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->type:I

    .line 295
    iget-wide v2, p1, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    iget-wide v4, p1, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    iget-wide v6, p1, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    iget-wide v8, p1, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    iget-wide v10, p1, Lcom/itextpdf/kernel/geom/AffineTransform;->m02:D

    iget-wide v12, p1, Lcom/itextpdf/kernel/geom/AffineTransform;->m12:D

    move-object v1, p0

    invoke-virtual/range {v1 .. v13}, Lcom/itextpdf/kernel/geom/AffineTransform;->setTransform(DDDDDD)V

    .line 296
    return-void
.end method

.method public shear(DD)V
    .locals 1
    .param p1, "shx"    # D
    .param p3, "shy"    # D

    .line 430
    invoke-static {p1, p2, p3, p4}, Lcom/itextpdf/kernel/geom/AffineTransform;->getShearInstance(DD)Lcom/itextpdf/kernel/geom/AffineTransform;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/geom/AffineTransform;->concatenate(Lcom/itextpdf/kernel/geom/AffineTransform;)V

    .line 431
    return-void
.end method

.method public transform(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;
    .locals 10
    .param p1, "src"    # Lcom/itextpdf/kernel/geom/Point;
    .param p2, "dst"    # Lcom/itextpdf/kernel/geom/Point;

    .line 496
    if-nez p2, :cond_0

    .line 497
    new-instance v0, Lcom/itextpdf/kernel/geom/Point;

    invoke-direct {v0}, Lcom/itextpdf/kernel/geom/Point;-><init>()V

    move-object p2, v0

    .line 500
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v0

    .line 501
    .local v0, "x":D
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v2

    .line 503
    .local v2, "y":D
    iget-wide v4, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    mul-double/2addr v4, v0

    iget-wide v6, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    mul-double/2addr v6, v2

    add-double/2addr v4, v6

    iget-wide v6, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m02:D

    add-double/2addr v4, v6

    iget-wide v6, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    mul-double/2addr v6, v0

    iget-wide v8, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    mul-double/2addr v8, v2

    add-double/2addr v6, v8

    iget-wide v8, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m12:D

    add-double/2addr v6, v8

    invoke-virtual {p2, v4, v5, v6, v7}, Lcom/itextpdf/kernel/geom/Point;->setLocation(DD)V

    .line 504
    return-object p2
.end method

.method public transform([DI[DII)V
    .locals 10
    .param p1, "src"    # [D
    .param p2, "srcOff"    # I
    .param p3, "dst"    # [D
    .param p4, "dstOff"    # I
    .param p5, "length"    # I

    .line 522
    const/4 v0, 0x2

    .line 523
    .local v0, "step":I
    if-ne p1, p3, :cond_0

    if-ge p2, p4, :cond_0

    mul-int/lit8 v1, p5, 0x2

    add-int/2addr v1, p2

    if-ge p4, v1, :cond_0

    .line 524
    mul-int/lit8 v1, p5, 0x2

    add-int/2addr v1, p2

    add-int/lit8 p2, v1, -0x2

    .line 525
    mul-int/lit8 v1, p5, 0x2

    add-int/2addr v1, p4

    add-int/lit8 p4, v1, -0x2

    .line 526
    const/4 v0, -0x2

    .line 528
    :cond_0
    :goto_0
    add-int/lit8 p5, p5, -0x1

    if-ltz p5, :cond_1

    .line 529
    add-int/lit8 v1, p2, 0x0

    aget-wide v1, p1, v1

    .line 530
    .local v1, "x":D
    add-int/lit8 v3, p2, 0x1

    aget-wide v3, p1, v3

    .line 531
    .local v3, "y":D
    add-int/lit8 v5, p4, 0x0

    iget-wide v6, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    mul-double/2addr v6, v1

    iget-wide v8, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    mul-double/2addr v8, v3

    add-double/2addr v6, v8

    iget-wide v8, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m02:D

    add-double/2addr v6, v8

    aput-wide v6, p3, v5

    .line 532
    add-int/lit8 v5, p4, 0x1

    iget-wide v6, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    mul-double/2addr v6, v1

    iget-wide v8, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    mul-double/2addr v8, v3

    add-double/2addr v6, v8

    iget-wide v8, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m12:D

    add-double/2addr v6, v8

    aput-wide v6, p3, v5

    .line 533
    add-int/2addr p2, v0

    .line 534
    add-int/2addr p4, v0

    .line 535
    .end local v1    # "x":D
    .end local v3    # "y":D
    goto :goto_0

    .line 536
    :cond_1
    return-void
.end method

.method public transform([DI[FII)V
    .locals 9
    .param p1, "src"    # [D
    .param p2, "srcOff"    # I
    .param p3, "dst"    # [F
    .param p4, "dstOff"    # I
    .param p5, "length"    # I

    .line 565
    nop

    :goto_0
    add-int/lit8 p5, p5, -0x1

    if-ltz p5, :cond_0

    .line 566
    add-int/lit8 v0, p2, 0x1

    .end local p2    # "srcOff":I
    .local v0, "srcOff":I
    aget-wide v1, p1, p2

    .line 567
    .local v1, "x":D
    add-int/lit8 p2, v0, 0x1

    .end local v0    # "srcOff":I
    .restart local p2    # "srcOff":I
    aget-wide v3, p1, v0

    .line 568
    .local v3, "y":D
    add-int/lit8 v0, p4, 0x1

    .end local p4    # "dstOff":I
    .local v0, "dstOff":I
    iget-wide v5, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    mul-double/2addr v5, v1

    iget-wide v7, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    mul-double/2addr v7, v3

    add-double/2addr v5, v7

    iget-wide v7, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m02:D

    add-double/2addr v5, v7

    double-to-float v5, v5

    aput v5, p3, p4

    .line 569
    add-int/lit8 p4, v0, 0x1

    .end local v0    # "dstOff":I
    .restart local p4    # "dstOff":I
    iget-wide v5, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    mul-double/2addr v5, v1

    iget-wide v7, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    mul-double/2addr v7, v3

    add-double/2addr v5, v7

    iget-wide v7, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m12:D

    add-double/2addr v5, v7

    double-to-float v5, v5

    aput v5, p3, v0

    .line 570
    .end local v1    # "x":D
    .end local v3    # "y":D
    goto :goto_0

    .line 571
    :cond_0
    return-void
.end method

.method public transform([FI[DII)V
    .locals 9
    .param p1, "src"    # [F
    .param p2, "srcOff"    # I
    .param p3, "dst"    # [D
    .param p4, "dstOff"    # I
    .param p5, "length"    # I

    .line 556
    nop

    :goto_0
    add-int/lit8 p5, p5, -0x1

    if-ltz p5, :cond_0

    .line 557
    add-int/lit8 v0, p2, 0x1

    .end local p2    # "srcOff":I
    .local v0, "srcOff":I
    aget p2, p1, p2

    .line 558
    .local p2, "x":F
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "srcOff":I
    .local v1, "srcOff":I
    aget v0, p1, v0

    .line 559
    .local v0, "y":F
    add-int/lit8 v2, p4, 0x1

    .end local p4    # "dstOff":I
    .local v2, "dstOff":I
    float-to-double v3, p2

    iget-wide v5, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    mul-double/2addr v3, v5

    float-to-double v5, v0

    iget-wide v7, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    mul-double/2addr v5, v7

    add-double/2addr v3, v5

    iget-wide v5, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m02:D

    add-double/2addr v3, v5

    aput-wide v3, p3, p4

    .line 560
    add-int/lit8 p4, v2, 0x1

    .end local v2    # "dstOff":I
    .restart local p4    # "dstOff":I
    float-to-double v3, p2

    iget-wide v5, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    mul-double/2addr v3, v5

    float-to-double v5, v0

    iget-wide v7, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    mul-double/2addr v5, v7

    add-double/2addr v3, v5

    iget-wide v5, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m12:D

    add-double/2addr v3, v5

    aput-wide v3, p3, v2

    .line 561
    .end local v0    # "y":F
    .end local p2    # "x":F
    move p2, v1

    goto :goto_0

    .line 562
    .end local v1    # "srcOff":I
    .local p2, "srcOff":I
    :cond_0
    return-void
.end method

.method public transform([FI[FII)V
    .locals 10
    .param p1, "src"    # [F
    .param p2, "srcOff"    # I
    .param p3, "dst"    # [F
    .param p4, "dstOff"    # I
    .param p5, "length"    # I

    .line 539
    const/4 v0, 0x2

    .line 540
    .local v0, "step":I
    if-ne p1, p3, :cond_0

    if-ge p2, p4, :cond_0

    mul-int/lit8 v1, p5, 0x2

    add-int/2addr v1, p2

    if-ge p4, v1, :cond_0

    .line 541
    mul-int/lit8 v1, p5, 0x2

    add-int/2addr v1, p2

    add-int/lit8 p2, v1, -0x2

    .line 542
    mul-int/lit8 v1, p5, 0x2

    add-int/2addr v1, p4

    add-int/lit8 p4, v1, -0x2

    .line 543
    const/4 v0, -0x2

    .line 545
    :cond_0
    :goto_0
    add-int/lit8 p5, p5, -0x1

    if-ltz p5, :cond_1

    .line 546
    add-int/lit8 v1, p2, 0x0

    aget v1, p1, v1

    .line 547
    .local v1, "x":F
    add-int/lit8 v2, p2, 0x1

    aget v2, p1, v2

    .line 548
    .local v2, "y":F
    add-int/lit8 v3, p4, 0x0

    float-to-double v4, v1

    iget-wide v6, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    mul-double/2addr v4, v6

    float-to-double v6, v2

    iget-wide v8, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    mul-double/2addr v6, v8

    add-double/2addr v4, v6

    iget-wide v6, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m02:D

    add-double/2addr v4, v6

    double-to-float v4, v4

    aput v4, p3, v3

    .line 549
    add-int/lit8 v3, p4, 0x1

    float-to-double v4, v1

    iget-wide v6, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    mul-double/2addr v4, v6

    float-to-double v6, v2

    iget-wide v8, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    mul-double/2addr v6, v8

    add-double/2addr v4, v6

    iget-wide v6, p0, Lcom/itextpdf/kernel/geom/AffineTransform;->m12:D

    add-double/2addr v4, v6

    double-to-float v4, v4

    aput v4, p3, v3

    .line 550
    add-int/2addr p2, v0

    .line 551
    add-int/2addr p4, v0

    .line 552
    .end local v1    # "x":F
    .end local v2    # "y":F
    goto :goto_0

    .line 553
    :cond_1
    return-void
.end method

.method public transform([Lcom/itextpdf/kernel/geom/Point;I[Lcom/itextpdf/kernel/geom/Point;II)V
    .locals 16
    .param p1, "src"    # [Lcom/itextpdf/kernel/geom/Point;
    .param p2, "srcOff"    # I
    .param p3, "dst"    # [Lcom/itextpdf/kernel/geom/Point;
    .param p4, "dstOff"    # I
    .param p5, "length"    # I

    .line 508
    move-object/from16 v0, p0

    move/from16 v1, p2

    move/from16 v2, p4

    move/from16 v3, p5

    .end local p2    # "srcOff":I
    .end local p4    # "dstOff":I
    .end local p5    # "length":I
    .local v1, "srcOff":I
    .local v2, "dstOff":I
    .local v3, "length":I
    :goto_0
    add-int/lit8 v3, v3, -0x1

    if-ltz v3, :cond_1

    .line 509
    add-int/lit8 v4, v1, 0x1

    .end local v1    # "srcOff":I
    .local v4, "srcOff":I
    aget-object v1, p1, v1

    .line 510
    .local v1, "srcPoint":Lcom/itextpdf/kernel/geom/Point;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v5

    .line 511
    .local v5, "x":D
    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v7

    .line 512
    .local v7, "y":D
    aget-object v9, p3, v2

    .line 513
    .local v9, "dstPoint":Lcom/itextpdf/kernel/geom/Point;
    if-nez v9, :cond_0

    .line 514
    new-instance v10, Lcom/itextpdf/kernel/geom/Point;

    invoke-direct {v10}, Lcom/itextpdf/kernel/geom/Point;-><init>()V

    move-object v9, v10

    .line 516
    :cond_0
    iget-wide v10, v0, Lcom/itextpdf/kernel/geom/AffineTransform;->m00:D

    mul-double/2addr v10, v5

    iget-wide v12, v0, Lcom/itextpdf/kernel/geom/AffineTransform;->m01:D

    mul-double/2addr v12, v7

    add-double/2addr v10, v12

    iget-wide v12, v0, Lcom/itextpdf/kernel/geom/AffineTransform;->m02:D

    add-double/2addr v10, v12

    iget-wide v12, v0, Lcom/itextpdf/kernel/geom/AffineTransform;->m10:D

    mul-double/2addr v12, v5

    iget-wide v14, v0, Lcom/itextpdf/kernel/geom/AffineTransform;->m11:D

    mul-double/2addr v14, v7

    add-double/2addr v12, v14

    iget-wide v14, v0, Lcom/itextpdf/kernel/geom/AffineTransform;->m12:D

    add-double/2addr v12, v14

    invoke-virtual {v9, v10, v11, v12, v13}, Lcom/itextpdf/kernel/geom/Point;->setLocation(DD)V

    .line 517
    add-int/lit8 v10, v2, 0x1

    .end local v2    # "dstOff":I
    .local v10, "dstOff":I
    aput-object v9, p3, v2

    .line 518
    .end local v1    # "srcPoint":Lcom/itextpdf/kernel/geom/Point;
    .end local v5    # "x":D
    .end local v7    # "y":D
    .end local v9    # "dstPoint":Lcom/itextpdf/kernel/geom/Point;
    move v1, v4

    move v2, v10

    goto :goto_0

    .line 519
    .end local v4    # "srcOff":I
    .end local v10    # "dstOff":I
    .local v1, "srcOff":I
    .restart local v2    # "dstOff":I
    :cond_1
    return-void
.end method

.method public translate(DD)V
    .locals 1
    .param p1, "mx"    # D
    .param p3, "my"    # D

    .line 422
    invoke-static {p1, p2, p3, p4}, Lcom/itextpdf/kernel/geom/AffineTransform;->getTranslateInstance(DD)Lcom/itextpdf/kernel/geom/AffineTransform;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/geom/AffineTransform;->concatenate(Lcom/itextpdf/kernel/geom/AffineTransform;)V

    .line 423
    return-void
.end method
