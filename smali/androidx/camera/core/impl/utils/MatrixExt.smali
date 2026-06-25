.class public final Landroidx/camera/core/impl/utils/MatrixExt;
.super Ljava/lang/Object;
.source "MatrixExt.java"


# static fields
.field private static final sTemp:[F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 29
    const/16 v0, 0x10

    new-array v0, v0, [F

    sput-object v0, Landroidx/camera/core/impl/utils/MatrixExt;->sTemp:[F

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    return-void
.end method

.method private static denormalize([FFF)V
    .locals 4
    .param p0, "matrix"    # [F
    .param p1, "px"    # F
    .param p2, "py"    # F

    .line 128
    neg-float v0, p1

    neg-float v1, p2

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {p0, v3, v0, v1, v2}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    .line 129
    return-void
.end method

.method private static normalize([FFF)V
    .locals 2
    .param p0, "matrix"    # [F
    .param p1, "px"    # F
    .param p2, "py"    # F

    .line 124
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, v0, p1, p2, v1}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    .line 125
    return-void
.end method

.method public static postRotate([FFFF)V
    .locals 11
    .param p0, "matrix"    # [F
    .param p1, "degrees"    # F
    .param p2, "px"    # F
    .param p3, "py"    # F

    .line 81
    sget-object v1, Landroidx/camera/core/impl/utils/MatrixExt;->sTemp:[F

    monitor-enter v1

    .line 82
    :try_start_0
    sget-object v0, Landroidx/camera/core/impl/utils/MatrixExt;->sTemp:[F

    const/4 v2, 0x0

    invoke-static {v0, v2}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 83
    sget-object v0, Landroidx/camera/core/impl/utils/MatrixExt;->sTemp:[F

    invoke-static {v0, p2, p3}, Landroidx/camera/core/impl/utils/MatrixExt;->normalize([FFF)V

    .line 84
    sget-object v2, Landroidx/camera/core/impl/utils/MatrixExt;->sTemp:[F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 v6, 0x0

    const/high16 v7, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    const/4 v5, 0x0

    move v4, p1

    .end local p1    # "degrees":F
    .local v4, "degrees":F
    :try_start_1
    invoke-static/range {v2 .. v7}, Landroid/opengl/Matrix;->rotateM([FIFFFF)V

    .line 85
    sget-object p1, Landroidx/camera/core/impl/utils/MatrixExt;->sTemp:[F

    invoke-static {p1, p2, p3}, Landroidx/camera/core/impl/utils/MatrixExt;->denormalize([FFF)V

    .line 86
    sget-object v7, Landroidx/camera/core/impl/utils/MatrixExt;->sTemp:[F
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 v8, 0x0

    const/4 v10, 0x0

    const/4 v6, 0x0

    move-object v9, p0

    move-object v5, p0

    .end local p0    # "matrix":[F
    .local v5, "matrix":[F
    :try_start_2
    invoke-static/range {v5 .. v10}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 87
    monitor-exit v1

    .line 88
    return-void

    .line 87
    .end local v5    # "matrix":[F
    .restart local p0    # "matrix":[F
    :catchall_0
    move-exception v0

    move-object v5, p0

    move-object p0, v0

    .end local p0    # "matrix":[F
    .restart local v5    # "matrix":[F
    goto :goto_0

    .end local v4    # "degrees":F
    .end local v5    # "matrix":[F
    .restart local p0    # "matrix":[F
    .restart local p1    # "degrees":F
    :catchall_1
    move-exception v0

    move-object v5, p0

    move v4, p1

    move-object p0, v0

    .end local p0    # "matrix":[F
    .end local p1    # "degrees":F
    .restart local v4    # "degrees":F
    .restart local v5    # "matrix":[F
    :goto_0
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    throw p0

    :catchall_2
    move-exception v0

    move-object p0, v0

    goto :goto_0
.end method

.method public static preRotate([FFFF)V
    .locals 6
    .param p0, "matrix"    # [F
    .param p1, "degrees"    # F
    .param p2, "px"    # F
    .param p3, "py"    # F

    .line 64
    invoke-static {p0, p2, p3}, Landroidx/camera/core/impl/utils/MatrixExt;->normalize([FFF)V

    .line 65
    const/4 v4, 0x0

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move v2, p1

    .end local p0    # "matrix":[F
    .end local p1    # "degrees":F
    .local v0, "matrix":[F
    .local v2, "degrees":F
    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->rotateM([FIFFFF)V

    .line 66
    invoke-static {v0, p2, p3}, Landroidx/camera/core/impl/utils/MatrixExt;->denormalize([FFF)V

    .line 67
    return-void
.end method

.method public static preVerticalFlip([FF)V
    .locals 4
    .param p0, "matrix"    # [F
    .param p1, "y"    # F

    .line 97
    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Landroidx/camera/core/impl/utils/MatrixExt;->normalize([FFF)V

    .line 98
    const/high16 v1, 0x3f800000    # 1.0f

    const/high16 v2, -0x40800000    # -1.0f

    const/4 v3, 0x0

    invoke-static {p0, v3, v1, v2, v1}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    .line 99
    invoke-static {p0, v0, p1}, Landroidx/camera/core/impl/utils/MatrixExt;->denormalize([FFF)V

    .line 100
    return-void
.end method

.method public static setRotate([FFFF)V
    .locals 1
    .param p0, "matrix"    # [F
    .param p1, "degrees"    # F
    .param p2, "px"    # F
    .param p3, "py"    # F

    .line 48
    const/4 v0, 0x0

    invoke-static {p0, v0}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 49
    invoke-static {p0, p1, p2, p3}, Landroidx/camera/core/impl/utils/MatrixExt;->preRotate([FFFF)V

    .line 50
    return-void
.end method

.method public static toString([FI)Ljava/lang/String;
    .locals 18
    .param p0, "matrix"    # [F
    .param p1, "offset"    # I

    .line 112
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    aget v1, p0, p1

    .line 117
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    add-int/lit8 v1, p1, 0x4

    aget v1, p0, v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    add-int/lit8 v1, p1, 0x8

    aget v1, p0, v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    add-int/lit8 v1, p1, 0xc

    aget v1, p0, v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    add-int/lit8 v1, p1, 0x1

    aget v1, p0, v1

    .line 118
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    add-int/lit8 v1, p1, 0x5

    aget v1, p0, v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    add-int/lit8 v1, p1, 0x9

    aget v1, p0, v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    add-int/lit8 v1, p1, 0xd

    aget v1, p0, v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v9

    add-int/lit8 v1, p1, 0x2

    aget v1, p0, v1

    .line 119
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    add-int/lit8 v1, p1, 0x6

    aget v1, p0, v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    add-int/lit8 v1, p1, 0xa

    aget v1, p0, v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v12

    add-int/lit8 v1, p1, 0xe

    aget v1, p0, v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v13

    add-int/lit8 v1, p1, 0x3

    aget v1, p0, v1

    .line 120
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v14

    add-int/lit8 v1, p1, 0x7

    aget v1, p0, v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v15

    add-int/lit8 v1, p1, 0xb

    aget v1, p0, v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v16

    add-int/lit8 v1, p1, 0xf

    aget v1, p0, v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v17

    filled-new-array/range {v2 .. v17}, [Ljava/lang/Object;

    move-result-object v1

    .line 112
    const-string v2, "Matrix:\n%2.1f %2.1f %2.1f %2.1f\n%2.1f %2.1f %2.1f %2.1f\n%2.1f %2.1f %2.1f %2.1f\n%2.1f %2.1f %2.1f %2.1f"

    invoke-static {v0, v2, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
