.class public Lcom/itextpdf/kernel/geom/Matrix;
.super Ljava/lang/Object;
.source "Matrix.java"


# static fields
.field public static final I11:I = 0x0

.field public static final I12:I = 0x1

.field public static final I13:I = 0x2

.field public static final I21:I = 0x3

.field public static final I22:I = 0x4

.field public static final I23:I = 0x5

.field public static final I31:I = 0x6

.field public static final I32:I = 0x7

.field public static final I33:I = 0x8


# instance fields
.field private final vals:[F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    const/16 v0, 0x9

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    .line 71
    return-void

    nop

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public constructor <init>(FF)V
    .locals 2
    .param p1, "tx"    # F
    .param p2, "ty"    # F

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    const/16 v0, 0x9

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    .line 80
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/4 v1, 0x6

    aput p1, v0, v1

    .line 81
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/4 v1, 0x7

    aput p2, v0, v1

    .line 82
    return-void

    nop

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public constructor <init>(FFFFFF)V
    .locals 3
    .param p1, "a"    # F
    .param p2, "b"    # F
    .param p3, "c"    # F
    .param p4, "d"    # F
    .param p5, "e"    # F
    .param p6, "f"    # F

    .line 121
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    const/16 v0, 0x9

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    .line 122
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/4 v1, 0x0

    aput p1, v0, v1

    .line 123
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/4 v1, 0x1

    aput p2, v0, v1

    .line 124
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/4 v1, 0x2

    const/4 v2, 0x0

    aput v2, v0, v1

    .line 125
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/4 v1, 0x3

    aput p3, v0, v1

    .line 126
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/4 v1, 0x4

    aput p4, v0, v1

    .line 127
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/4 v1, 0x5

    aput v2, v0, v1

    .line 128
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/4 v1, 0x6

    aput p5, v0, v1

    .line 129
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/4 v1, 0x7

    aput p6, v0, v1

    .line 130
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/16 v1, 0x8

    const/high16 v2, 0x3f800000    # 1.0f

    aput v2, v0, v1

    .line 131
    return-void

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public constructor <init>(FFFFFFFFF)V
    .locals 2
    .param p1, "e11"    # F
    .param p2, "e12"    # F
    .param p3, "e13"    # F
    .param p4, "e21"    # F
    .param p5, "e22"    # F
    .param p6, "e23"    # F
    .param p7, "e31"    # F
    .param p8, "e32"    # F
    .param p9, "e33"    # F

    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    const/16 v0, 0x9

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    .line 98
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/4 v1, 0x0

    aput p1, v0, v1

    .line 99
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/4 v1, 0x1

    aput p2, v0, v1

    .line 100
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/4 v1, 0x2

    aput p3, v0, v1

    .line 101
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/4 v1, 0x3

    aput p4, v0, v1

    .line 102
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/4 v1, 0x4

    aput p5, v0, v1

    .line 103
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/4 v1, 0x5

    aput p6, v0, v1

    .line 104
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/4 v1, 0x6

    aput p7, v0, v1

    .line 105
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/4 v1, 0x7

    aput p8, v0, v1

    .line 106
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/16 v1, 0x8

    aput p9, v0, v1

    .line 107
    return-void

    nop

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method public add(Lcom/itextpdf/kernel/geom/Matrix;)Lcom/itextpdf/kernel/geom/Matrix;
    .locals 7
    .param p1, "arg"    # Lcom/itextpdf/kernel/geom/Matrix;

    .line 183
    new-instance v0, Lcom/itextpdf/kernel/geom/Matrix;

    invoke-direct {v0}, Lcom/itextpdf/kernel/geom/Matrix;-><init>()V

    .line 185
    .local v0, "rslt":Lcom/itextpdf/kernel/geom/Matrix;
    iget-object v1, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    .line 186
    .local v1, "a":[F
    iget-object v2, p1, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    .line 187
    .local v2, "b":[F
    iget-object v3, v0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    .line 189
    .local v3, "c":[F
    const/4 v4, 0x0

    aget v5, v1, v4

    aget v6, v2, v4

    add-float/2addr v5, v6

    aput v5, v3, v4

    .line 190
    const/4 v4, 0x1

    aget v5, v1, v4

    aget v6, v2, v4

    add-float/2addr v5, v6

    aput v5, v3, v4

    .line 191
    const/4 v4, 0x2

    aget v5, v1, v4

    aget v6, v2, v4

    add-float/2addr v5, v6

    aput v5, v3, v4

    .line 192
    const/4 v4, 0x3

    aget v5, v1, v4

    aget v6, v2, v4

    add-float/2addr v5, v6

    aput v5, v3, v4

    .line 193
    const/4 v4, 0x4

    aget v5, v1, v4

    aget v6, v2, v4

    add-float/2addr v5, v6

    aput v5, v3, v4

    .line 194
    const/4 v4, 0x5

    aget v5, v1, v4

    aget v6, v2, v4

    add-float/2addr v5, v6

    aput v5, v3, v4

    .line 195
    const/4 v4, 0x6

    aget v5, v1, v4

    aget v6, v2, v4

    add-float/2addr v5, v6

    aput v5, v3, v4

    .line 196
    const/4 v4, 0x7

    aget v5, v1, v4

    aget v6, v2, v4

    add-float/2addr v5, v6

    aput v5, v3, v4

    .line 197
    const/16 v4, 0x8

    aget v5, v1, v4

    aget v6, v2, v4

    add-float/2addr v5, v6

    aput v5, v3, v4

    .line 200
    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "obj"    # Ljava/lang/Object;

    .line 255
    instance-of v0, p1, Lcom/itextpdf/kernel/geom/Matrix;

    if-nez v0, :cond_0

    .line 256
    const/4 v0, 0x0

    return v0

    .line 258
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    move-object v1, p1

    check-cast v1, Lcom/itextpdf/kernel/geom/Matrix;

    iget-object v1, v1, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([F[F)Z

    move-result v0

    return v0
.end method

.method public get(I)F
    .locals 1
    .param p1, "index"    # I

    .line 146
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    aget v0, v0, p1

    return v0
.end method

.method public getDeterminant()F
    .locals 12

    .line 238
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    iget-object v2, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/4 v3, 0x4

    aget v2, v2, v3

    mul-float/2addr v0, v2

    iget-object v2, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/16 v4, 0x8

    aget v2, v2, v4

    mul-float/2addr v0, v2

    iget-object v2, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/4 v5, 0x1

    aget v2, v2, v5

    iget-object v6, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/4 v7, 0x5

    aget v6, v6, v7

    mul-float/2addr v2, v6

    iget-object v6, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/4 v8, 0x6

    aget v6, v6, v8

    mul-float/2addr v2, v6

    add-float/2addr v0, v2

    iget-object v2, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/4 v6, 0x2

    aget v2, v2, v6

    iget-object v9, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/4 v10, 0x3

    aget v9, v9, v10

    mul-float/2addr v2, v9

    iget-object v9, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/4 v11, 0x7

    aget v9, v9, v11

    mul-float/2addr v2, v9

    add-float/2addr v0, v2

    iget-object v2, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    aget v1, v2, v1

    iget-object v2, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    aget v2, v2, v7

    mul-float/2addr v1, v2

    iget-object v2, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    aget v2, v2, v11

    mul-float/2addr v1, v2

    sub-float/2addr v0, v1

    iget-object v1, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    aget v1, v1, v5

    iget-object v2, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    aget v2, v2, v10

    mul-float/2addr v1, v2

    iget-object v2, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    aget v2, v2, v4

    mul-float/2addr v1, v2

    sub-float/2addr v0, v1

    iget-object v1, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    aget v1, v1, v6

    iget-object v2, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    aget v2, v2, v3

    mul-float/2addr v1, v2

    iget-object v2, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    aget v2, v2, v8

    mul-float/2addr v1, v2

    sub-float/2addr v0, v1

    return v0
.end method

.method public hashCode()I
    .locals 1

    .line 269
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([F)I

    move-result v0

    return v0
.end method

.method public multiply(Lcom/itextpdf/kernel/geom/Matrix;)Lcom/itextpdf/kernel/geom/Matrix;
    .locals 18
    .param p1, "by"    # Lcom/itextpdf/kernel/geom/Matrix;

    .line 157
    new-instance v0, Lcom/itextpdf/kernel/geom/Matrix;

    invoke-direct {v0}, Lcom/itextpdf/kernel/geom/Matrix;-><init>()V

    .line 159
    .local v0, "rslt":Lcom/itextpdf/kernel/geom/Matrix;
    move-object/from16 v1, p0

    iget-object v2, v1, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    .line 160
    .local v2, "a":[F
    move-object/from16 v3, p1

    iget-object v4, v3, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    .line 161
    .local v4, "b":[F
    iget-object v5, v0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    .line 163
    .local v5, "c":[F
    const/4 v6, 0x0

    aget v7, v2, v6

    aget v8, v4, v6

    mul-float/2addr v7, v8

    const/4 v8, 0x1

    aget v9, v2, v8

    const/4 v10, 0x3

    aget v11, v4, v10

    mul-float/2addr v9, v11

    add-float/2addr v7, v9

    const/4 v9, 0x2

    aget v11, v2, v9

    const/4 v12, 0x6

    aget v13, v4, v12

    mul-float/2addr v11, v13

    add-float/2addr v7, v11

    aput v7, v5, v6

    .line 164
    aget v7, v2, v6

    aget v11, v4, v8

    mul-float/2addr v7, v11

    aget v11, v2, v8

    const/4 v13, 0x4

    aget v14, v4, v13

    mul-float/2addr v11, v14

    add-float/2addr v7, v11

    aget v11, v2, v9

    const/4 v14, 0x7

    aget v15, v4, v14

    mul-float/2addr v11, v15

    add-float/2addr v7, v11

    aput v7, v5, v8

    .line 165
    aget v7, v2, v6

    aget v11, v4, v9

    mul-float/2addr v7, v11

    aget v11, v2, v8

    const/4 v15, 0x5

    aget v16, v4, v15

    mul-float v11, v11, v16

    add-float/2addr v7, v11

    aget v11, v2, v9

    const/16 v16, 0x8

    aget v17, v4, v16

    mul-float v11, v11, v17

    add-float/2addr v7, v11

    aput v7, v5, v9

    .line 166
    aget v7, v2, v10

    aget v11, v4, v6

    mul-float/2addr v7, v11

    aget v11, v2, v13

    aget v17, v4, v10

    mul-float v11, v11, v17

    add-float/2addr v7, v11

    aget v11, v2, v15

    aget v17, v4, v12

    mul-float v11, v11, v17

    add-float/2addr v7, v11

    aput v7, v5, v10

    .line 167
    aget v7, v2, v10

    aget v11, v4, v8

    mul-float/2addr v7, v11

    aget v11, v2, v13

    aget v17, v4, v13

    mul-float v11, v11, v17

    add-float/2addr v7, v11

    aget v11, v2, v15

    aget v17, v4, v14

    mul-float v11, v11, v17

    add-float/2addr v7, v11

    aput v7, v5, v13

    .line 168
    aget v7, v2, v10

    aget v11, v4, v9

    mul-float/2addr v7, v11

    aget v11, v2, v13

    aget v17, v4, v15

    mul-float v11, v11, v17

    add-float/2addr v7, v11

    aget v11, v2, v15

    aget v17, v4, v16

    mul-float v11, v11, v17

    add-float/2addr v7, v11

    aput v7, v5, v15

    .line 169
    aget v7, v2, v12

    aget v6, v4, v6

    mul-float/2addr v7, v6

    aget v6, v2, v14

    aget v10, v4, v10

    mul-float/2addr v6, v10

    add-float/2addr v7, v6

    aget v6, v2, v16

    aget v10, v4, v12

    mul-float/2addr v6, v10

    add-float/2addr v7, v6

    aput v7, v5, v12

    .line 170
    aget v6, v2, v12

    aget v7, v4, v8

    mul-float/2addr v6, v7

    aget v7, v2, v14

    aget v8, v4, v13

    mul-float/2addr v7, v8

    add-float/2addr v6, v7

    aget v7, v2, v16

    aget v8, v4, v14

    mul-float/2addr v7, v8

    add-float/2addr v6, v7

    aput v6, v5, v14

    .line 171
    aget v6, v2, v12

    aget v7, v4, v9

    mul-float/2addr v6, v7

    aget v7, v2, v14

    aget v8, v4, v15

    mul-float/2addr v7, v8

    add-float/2addr v6, v7

    aget v7, v2, v16

    aget v8, v4, v16

    mul-float/2addr v7, v8

    add-float/2addr v6, v7

    aput v6, v5, v16

    .line 173
    return-object v0
.end method

.method public subtract(Lcom/itextpdf/kernel/geom/Matrix;)Lcom/itextpdf/kernel/geom/Matrix;
    .locals 7
    .param p1, "arg"    # Lcom/itextpdf/kernel/geom/Matrix;

    .line 210
    new-instance v0, Lcom/itextpdf/kernel/geom/Matrix;

    invoke-direct {v0}, Lcom/itextpdf/kernel/geom/Matrix;-><init>()V

    .line 212
    .local v0, "rslt":Lcom/itextpdf/kernel/geom/Matrix;
    iget-object v1, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    .line 213
    .local v1, "a":[F
    iget-object v2, p1, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    .line 214
    .local v2, "b":[F
    iget-object v3, v0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    .line 216
    .local v3, "c":[F
    const/4 v4, 0x0

    aget v5, v1, v4

    aget v6, v2, v4

    sub-float/2addr v5, v6

    aput v5, v3, v4

    .line 217
    const/4 v4, 0x1

    aget v5, v1, v4

    aget v6, v2, v4

    sub-float/2addr v5, v6

    aput v5, v3, v4

    .line 218
    const/4 v4, 0x2

    aget v5, v1, v4

    aget v6, v2, v4

    sub-float/2addr v5, v6

    aput v5, v3, v4

    .line 219
    const/4 v4, 0x3

    aget v5, v1, v4

    aget v6, v2, v4

    sub-float/2addr v5, v6

    aput v5, v3, v4

    .line 220
    const/4 v4, 0x4

    aget v5, v1, v4

    aget v6, v2, v4

    sub-float/2addr v5, v6

    aput v5, v3, v4

    .line 221
    const/4 v4, 0x5

    aget v5, v1, v4

    aget v6, v2, v4

    sub-float/2addr v5, v6

    aput v5, v3, v4

    .line 222
    const/4 v4, 0x6

    aget v5, v1, v4

    aget v6, v2, v4

    sub-float/2addr v5, v6

    aput v5, v3, v4

    .line 223
    const/4 v4, 0x7

    aget v5, v1, v4

    aget v6, v2, v4

    sub-float/2addr v5, v6

    aput v5, v3, v4

    .line 224
    const/16 v4, 0x8

    aget v5, v1, v4

    aget v6, v2, v4

    sub-float/2addr v5, v6

    aput v5, v3, v4

    .line 226
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 280
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/4 v2, 0x0

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\t"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/4 v3, 0x1

    aget v2, v2, v3

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/4 v3, 0x2

    aget v2, v2, v3

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v3, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/4 v4, 0x3

    aget v3, v3, v4

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v3, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/4 v4, 0x4

    aget v3, v3, v4

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v3, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/4 v4, 0x5

    aget v3, v3, v4

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/4 v3, 0x6

    aget v2, v2, v3

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/4 v3, 0x7

    aget v2, v2, v3

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/kernel/geom/Matrix;->vals:[F

    const/16 v2, 0x8

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
