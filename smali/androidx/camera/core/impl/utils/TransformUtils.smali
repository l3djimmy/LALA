.class public Landroidx/camera/core/impl/utils/TransformUtils;
.super Ljava/lang/Object;
.source "TransformUtils.java"


# static fields
.field public static final NORMALIZED_RECT:Landroid/graphics/RectF;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 47
    new-instance v0, Landroid/graphics/RectF;

    const/high16 v1, -0x40800000    # -1.0f

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v1, v2, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    sput-object v0, Landroidx/camera/core/impl/utils/TransformUtils;->NORMALIZED_RECT:Landroid/graphics/RectF;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    return-void
.end method

.method public static getExifTransform(III)Landroid/graphics/Matrix;
    .locals 8
    .param p0, "exifOrientation"    # I
    .param p1, "width"    # I
    .param p2, "height"    # I

    .line 376
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 381
    .local v0, "matrix":Landroid/graphics/Matrix;
    new-instance v1, Landroid/graphics/RectF;

    int-to-float v2, p1

    int-to-float v3, p2

    const/4 v4, 0x0

    invoke-direct {v1, v4, v4, v2, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 382
    .local v1, "rect":Landroid/graphics/RectF;
    sget-object v2, Landroidx/camera/core/impl/utils/TransformUtils;->NORMALIZED_RECT:Landroid/graphics/RectF;

    sget-object v3, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 385
    const/4 v2, 0x0

    .line 388
    .local v2, "isWidthHeightSwapped":Z
    const/high16 v3, 0x42b40000    # 90.0f

    const/high16 v5, 0x43870000    # 270.0f

    const/high16 v6, 0x3f800000    # 1.0f

    const/high16 v7, -0x40800000    # -1.0f

    packed-switch p0, :pswitch_data_0

    goto :goto_0

    .line 417
    :pswitch_0
    invoke-virtual {v0, v5}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 418
    const/4 v2, 0x1

    .line 419
    goto :goto_0

    .line 412
    :pswitch_1
    invoke-virtual {v0, v7, v6}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 413
    invoke-virtual {v0, v3}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 414
    const/4 v2, 0x1

    .line 415
    goto :goto_0

    .line 406
    :pswitch_2
    invoke-virtual {v0, v3}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 407
    const/4 v2, 0x1

    .line 408
    goto :goto_0

    .line 401
    :pswitch_3
    invoke-virtual {v0, v7, v6}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 402
    invoke-virtual {v0, v5}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 403
    const/4 v2, 0x1

    .line 404
    goto :goto_0

    .line 396
    :pswitch_4
    invoke-virtual {v0, v6, v7}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 397
    goto :goto_0

    .line 393
    :pswitch_5
    const/high16 v3, 0x43340000    # 180.0f

    invoke-virtual {v0, v3}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 394
    goto :goto_0

    .line 390
    :pswitch_6
    invoke-virtual {v0, v7, v6}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 391
    nop

    .line 430
    :goto_0
    if-eqz v2, :cond_0

    new-instance v3, Landroid/graphics/RectF;

    int-to-float v5, p2

    int-to-float v6, p1

    invoke-direct {v3, v4, v4, v5, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    goto :goto_1

    :cond_0
    move-object v3, v1

    .line 431
    .local v3, "restoredRect":Landroid/graphics/RectF;
    :goto_1
    new-instance v4, Landroid/graphics/Matrix;

    invoke-direct {v4}, Landroid/graphics/Matrix;-><init>()V

    .line 432
    .local v4, "restore":Landroid/graphics/Matrix;
    sget-object v5, Landroidx/camera/core/impl/utils/TransformUtils;->NORMALIZED_RECT:Landroid/graphics/RectF;

    sget-object v6, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v4, v5, v3, v6}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 433
    invoke-virtual {v0, v4}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 435
    return-object v0

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static getNormalizedToBuffer(Landroid/graphics/Rect;)Landroid/graphics/Matrix;
    .locals 1
    .param p0, "viewPortRect"    # Landroid/graphics/Rect;

    .line 346
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0, p0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    invoke-static {v0}, Landroidx/camera/core/impl/utils/TransformUtils;->getNormalizedToBuffer(Landroid/graphics/RectF;)Landroid/graphics/Matrix;

    move-result-object v0

    return-object v0
.end method

.method public static getNormalizedToBuffer(Landroid/graphics/RectF;)Landroid/graphics/Matrix;
    .locals 3
    .param p0, "viewPortRect"    # Landroid/graphics/RectF;

    .line 366
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 367
    .local v0, "normalizedToBuffer":Landroid/graphics/Matrix;
    sget-object v1, Landroidx/camera/core/impl/utils/TransformUtils;->NORMALIZED_RECT:Landroid/graphics/RectF;

    sget-object v2, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v0, v1, p0, v2}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 368
    return-object v0
.end method

.method public static getRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;I)Landroid/graphics/Matrix;
    .locals 1
    .param p0, "source"    # Landroid/graphics/RectF;
    .param p1, "target"    # Landroid/graphics/RectF;
    .param p2, "rotationDegrees"    # I

    .line 308
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Landroidx/camera/core/impl/utils/TransformUtils;->getRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;IZ)Landroid/graphics/Matrix;

    move-result-object v0

    return-object v0
.end method

.method public static getRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;IZ)Landroid/graphics/Matrix;
    .locals 3
    .param p0, "source"    # Landroid/graphics/RectF;
    .param p1, "target"    # Landroid/graphics/RectF;
    .param p2, "rotationDegrees"    # I
    .param p3, "mirroring"    # Z

    .line 329
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 330
    .local v0, "matrix":Landroid/graphics/Matrix;
    sget-object v1, Landroidx/camera/core/impl/utils/TransformUtils;->NORMALIZED_RECT:Landroid/graphics/RectF;

    sget-object v2, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v0, p0, v1, v2}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 332
    int-to-float v1, p2

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 333
    if-eqz p3, :cond_0

    .line 334
    const/high16 v1, -0x40800000    # -1.0f

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 337
    :cond_0
    invoke-static {p1}, Landroidx/camera/core/impl/utils/TransformUtils;->getNormalizedToBuffer(Landroid/graphics/RectF;)Landroid/graphics/Matrix;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 338
    return-object v0
.end method

.method public static getRotatedSize(Landroid/graphics/Rect;I)Landroid/util/Size;
    .locals 1
    .param p0, "cropRect"    # Landroid/graphics/Rect;
    .param p1, "rotationDegrees"    # I

    .line 167
    invoke-static {p0}, Landroidx/camera/core/impl/utils/TransformUtils;->rectToSize(Landroid/graphics/Rect;)Landroid/util/Size;

    move-result-object v0

    invoke-static {v0, p1}, Landroidx/camera/core/impl/utils/TransformUtils;->rotateSize(Landroid/util/Size;I)Landroid/util/Size;

    move-result-object v0

    return-object v0
.end method

.method public static hasCropping(Landroid/graphics/Rect;Landroid/util/Size;)Z
    .locals 2
    .param p0, "cropRect"    # Landroid/graphics/Rect;
    .param p1, "size"    # Landroid/util/Size;

    .line 86
    iget v0, p0, Landroid/graphics/Rect;->left:I

    if-nez v0, :cond_1

    iget v0, p0, Landroid/graphics/Rect;->top:I

    if-nez v0, :cond_1

    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    move-result v0

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v1

    if-ne v0, v1, :cond_1

    .line 87
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    move-result v0

    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v1

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 86
    :goto_1
    return v0
.end method

.method public static is90or270(I)Z
    .locals 3
    .param p0, "rotationDegrees"    # I

    .line 208
    const/16 v0, 0x5a

    if-eq p0, v0, :cond_3

    const/16 v0, 0x10e

    if-ne p0, v0, :cond_0

    goto :goto_1

    .line 211
    :cond_0
    if-eqz p0, :cond_2

    const/16 v0, 0xb4

    if-ne p0, v0, :cond_1

    goto :goto_0

    .line 214
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid rotation degrees: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 212
    :cond_2
    :goto_0
    const/4 v0, 0x0

    return v0

    .line 209
    :cond_3
    :goto_1
    const/4 v0, 0x1

    return v0
.end method

.method public static isAspectRatioMatchingWithRoundingError(Landroid/util/Size;Landroid/util/Size;)Z
    .locals 1
    .param p0, "size1"    # Landroid/util/Size;
    .param p1, "size2"    # Landroid/util/Size;

    .line 242
    const/4 v0, 0x0

    invoke-static {p0, v0, p1, v0}, Landroidx/camera/core/impl/utils/TransformUtils;->isAspectRatioMatchingWithRoundingError(Landroid/util/Size;ZLandroid/util/Size;Z)Z

    move-result v0

    return v0
.end method

.method public static isAspectRatioMatchingWithRoundingError(Landroid/util/Size;ZLandroid/util/Size;Z)Z
    .locals 7
    .param p0, "size1"    # Landroid/util/Size;
    .param p1, "isAccurate1"    # Z
    .param p2, "size2"    # Landroid/util/Size;
    .param p3, "isAccurate2"    # Z

    .line 271
    const/high16 v0, 0x3f800000    # 1.0f

    if-eqz p1, :cond_0

    .line 272
    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v1, v2

    .line 273
    .local v1, "ratio1UpperBound":F
    move v2, v1

    .local v2, "ratio1LowerBound":F
    goto :goto_0

    .line 275
    .end local v1    # "ratio1UpperBound":F
    .end local v2    # "ratio1LowerBound":F
    :cond_0
    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    move-result v1

    int-to-float v1, v1

    add-float/2addr v1, v0

    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v2, v0

    div-float/2addr v1, v2

    .line 276
    .restart local v1    # "ratio1UpperBound":F
    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v2, v0

    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result v3

    int-to-float v3, v3

    add-float/2addr v3, v0

    div-float/2addr v2, v3

    .line 280
    .restart local v2    # "ratio1LowerBound":F
    :goto_0
    if-eqz p3, :cond_1

    .line 281
    invoke-virtual {p2}, Landroid/util/Size;->getWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p2}, Landroid/util/Size;->getHeight()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v0, v3

    .line 282
    .local v0, "ratio2UpperBound":F
    move v3, v0

    .local v3, "ratio2LowerBound":F
    goto :goto_1

    .line 284
    .end local v0    # "ratio2UpperBound":F
    .end local v3    # "ratio2LowerBound":F
    :cond_1
    invoke-virtual {p2}, Landroid/util/Size;->getWidth()I

    move-result v3

    int-to-float v3, v3

    add-float/2addr v3, v0

    invoke-virtual {p2}, Landroid/util/Size;->getHeight()I

    move-result v4

    int-to-float v4, v4

    sub-float/2addr v4, v0

    div-float/2addr v3, v4

    .line 285
    .local v3, "ratio2UpperBound":F
    invoke-virtual {p2}, Landroid/util/Size;->getWidth()I

    move-result v4

    int-to-float v4, v4

    sub-float/2addr v4, v0

    invoke-virtual {p2}, Landroid/util/Size;->getHeight()I

    move-result v5

    int-to-float v5, v5

    add-float/2addr v5, v0

    div-float v0, v4, v5

    move v6, v3

    move v3, v0

    move v0, v6

    .line 288
    .restart local v0    # "ratio2UpperBound":F
    .local v3, "ratio2LowerBound":F
    :goto_1
    cmpl-float v4, v1, v3

    if-ltz v4, :cond_2

    cmpl-float v4, v0, v2

    if-ltz v4, :cond_2

    const/4 v4, 0x1

    goto :goto_2

    :cond_2
    const/4 v4, 0x0

    :goto_2
    return v4
.end method

.method public static max(FFFF)F
    .locals 2
    .param p0, "value1"    # F
    .param p1, "value2"    # F
    .param p2, "value3"    # F
    .param p3, "value4"    # F

    .line 194
    invoke-static {p0, p1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    invoke-static {p2, p3}, Ljava/lang/Math;->max(FF)F

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    return v0
.end method

.method public static min(FFFF)F
    .locals 2
    .param p0, "value1"    # F
    .param p1, "value2"    # F
    .param p2, "value3"    # F
    .param p3, "value4"    # F

    .line 201
    invoke-static {p0, p1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    invoke-static {p2, p3}, Ljava/lang/Math;->min(FF)F

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    return v0
.end method

.method public static rectToSize(Landroid/graphics/Rect;)Landroid/util/Size;
    .locals 3
    .param p0, "rect"    # Landroid/graphics/Rect;

    .line 57
    new-instance v0, Landroid/util/Size;

    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/util/Size;-><init>(II)V

    return-object v0
.end method

.method public static rectToString(Landroid/graphics/Rect;)Ljava/lang/String;
    .locals 3
    .param p0, "rect"    # Landroid/graphics/Rect;

    .line 63
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {p0, v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "%s(%dx%d)"

    invoke-static {v0, v2, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static rectToVertices(Landroid/graphics/RectF;)[F
    .locals 10
    .param p0, "rectF"    # Landroid/graphics/RectF;

    .line 231
    iget v0, p0, Landroid/graphics/RectF;->left:F

    iget v1, p0, Landroid/graphics/RectF;->top:F

    iget v2, p0, Landroid/graphics/RectF;->right:F

    iget v3, p0, Landroid/graphics/RectF;->top:F

    iget v4, p0, Landroid/graphics/RectF;->right:F

    iget v5, p0, Landroid/graphics/RectF;->bottom:F

    iget v6, p0, Landroid/graphics/RectF;->left:F

    iget v7, p0, Landroid/graphics/RectF;->bottom:F

    const/16 v8, 0x8

    new-array v8, v8, [F

    const/4 v9, 0x0

    aput v0, v8, v9

    const/4 v0, 0x1

    aput v1, v8, v0

    const/4 v0, 0x2

    aput v2, v8, v0

    const/4 v0, 0x3

    aput v3, v8, v0

    const/4 v0, 0x4

    aput v4, v8, v0

    const/4 v0, 0x5

    aput v5, v8, v0

    const/4 v0, 0x6

    aput v6, v8, v0

    const/4 v0, 0x7

    aput v7, v8, v0

    return-object v8
.end method

.method public static reverseSize(Landroid/util/Size;)Landroid/util/Size;
    .locals 3
    .param p0, "size"    # Landroid/util/Size;

    .line 114
    new-instance v0, Landroid/util/Size;

    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result v1

    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/util/Size;-><init>(II)V

    return-object v0
.end method

.method public static reverseSizeF(Landroid/util/SizeF;)Landroid/util/SizeF;
    .locals 3
    .param p0, "sizeF"    # Landroid/util/SizeF;

    .line 125
    new-instance v0, Landroid/util/SizeF;

    invoke-virtual {p0}, Landroid/util/SizeF;->getHeight()F

    move-result v1

    invoke-virtual {p0}, Landroid/util/SizeF;->getWidth()F

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/util/SizeF;-><init>(FF)V

    return-object v0
.end method

.method public static rotateRect(Landroid/graphics/RectF;I)Landroid/graphics/RectF;
    .locals 4
    .param p0, "rect"    # Landroid/graphics/RectF;
    .param p1, "rotationDegrees"    # I

    .line 150
    rem-int/lit8 v0, p1, 0x5a

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid rotation degrees: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 152
    invoke-static {p1}, Landroidx/camera/core/impl/utils/TransformUtils;->within360(I)I

    move-result v0

    invoke-static {v0}, Landroidx/camera/core/impl/utils/TransformUtils;->is90or270(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 153
    new-instance v0, Landroid/graphics/RectF;

    invoke-virtual {p0}, Landroid/graphics/RectF;->height()F

    move-result v1

    invoke-virtual {p0}, Landroid/graphics/RectF;->width()F

    move-result v2

    const/4 v3, 0x0

    invoke-direct {v0, v3, v3, v1, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    return-object v0

    .line 155
    :cond_1
    return-object p0
.end method

.method public static rotateSize(Landroid/util/Size;I)Landroid/util/Size;
    .locals 3
    .param p0, "size"    # Landroid/util/Size;
    .param p1, "rotationDegrees"    # I

    .line 138
    rem-int/lit8 v0, p1, 0x5a

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid rotation degrees: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 140
    invoke-static {p1}, Landroidx/camera/core/impl/utils/TransformUtils;->within360(I)I

    move-result v0

    invoke-static {v0}, Landroidx/camera/core/impl/utils/TransformUtils;->is90or270(I)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p0}, Landroidx/camera/core/impl/utils/TransformUtils;->reverseSize(Landroid/util/Size;)Landroid/util/Size;

    move-result-object v0

    goto :goto_1

    :cond_1
    move-object v0, p0

    :goto_1
    return-object v0
.end method

.method public static sizeToRect(Landroid/util/Size;)Landroid/graphics/Rect;
    .locals 1
    .param p0, "size"    # Landroid/util/Size;

    .line 71
    const/4 v0, 0x0

    invoke-static {p0, v0, v0}, Landroidx/camera/core/impl/utils/TransformUtils;->sizeToRect(Landroid/util/Size;II)Landroid/graphics/Rect;

    move-result-object v0

    return-object v0
.end method

.method public static sizeToRect(Landroid/util/Size;II)Landroid/graphics/Rect;
    .locals 3
    .param p0, "size"    # Landroid/util/Size;
    .param p1, "left"    # I
    .param p2, "top"    # I

    .line 79
    new-instance v0, Landroid/graphics/Rect;

    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    move-result v1

    add-int/2addr v1, p1

    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result v2

    add-int/2addr v2, p2

    invoke-direct {v0, p1, p2, v1, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    return-object v0
.end method

.method public static sizeToRectF(Landroid/util/Size;)Landroid/graphics/RectF;
    .locals 1
    .param p0, "size"    # Landroid/util/Size;

    .line 95
    const/4 v0, 0x0

    invoke-static {p0, v0, v0}, Landroidx/camera/core/impl/utils/TransformUtils;->sizeToRectF(Landroid/util/Size;II)Landroid/graphics/RectF;

    move-result-object v0

    return-object v0
.end method

.method public static sizeToRectF(Landroid/util/Size;II)Landroid/graphics/RectF;
    .locals 5
    .param p0, "size"    # Landroid/util/Size;
    .param p1, "left"    # I
    .param p2, "top"    # I

    .line 103
    new-instance v0, Landroid/graphics/RectF;

    int-to-float v1, p1

    int-to-float v2, p2

    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    move-result v3

    add-int/2addr v3, p1

    int-to-float v3, v3

    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result v4

    add-int/2addr v4, p2

    int-to-float v4, v4

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    return-object v0
.end method

.method public static sizeToVertices(Landroid/util/Size;)[F
    .locals 7
    .param p0, "size"    # Landroid/util/Size;

    .line 222
    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result v2

    int-to-float v2, v2

    .line 223
    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result v3

    int-to-float v3, v3

    const/16 v4, 0x8

    new-array v4, v4, [F

    const/4 v5, 0x0

    const/4 v6, 0x0

    aput v6, v4, v5

    const/4 v5, 0x1

    aput v6, v4, v5

    const/4 v5, 0x2

    aput v0, v4, v5

    const/4 v0, 0x3

    aput v6, v4, v0

    const/4 v0, 0x4

    aput v1, v4, v0

    const/4 v0, 0x5

    aput v2, v4, v0

    const/4 v0, 0x6

    aput v6, v4, v0

    const/4 v0, 0x7

    aput v3, v4, v0

    .line 222
    return-object v4
.end method

.method public static updateSensorToBufferTransform(Landroid/graphics/Matrix;Landroid/graphics/Rect;)Landroid/graphics/Matrix;
    .locals 3
    .param p0, "original"    # Landroid/graphics/Matrix;
    .param p1, "cropRect"    # Landroid/graphics/Rect;

    .line 356
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0, p0}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    .line 357
    .local v0, "matrix":Landroid/graphics/Matrix;
    iget v1, p1, Landroid/graphics/Rect;->left:I

    neg-int v1, v1

    int-to-float v1, v1

    iget v2, p1, Landroid/graphics/Rect;->top:I

    neg-int v2, v2

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 358
    return-object v0
.end method

.method public static verticesToRect([F)Landroid/graphics/RectF;
    .locals 14
    .param p0, "vertices"    # [F

    .line 182
    new-instance v0, Landroid/graphics/RectF;

    const/4 v1, 0x0

    aget v2, p0, v1

    const/4 v3, 0x2

    aget v4, p0, v3

    const/4 v5, 0x4

    aget v6, p0, v5

    const/4 v7, 0x6

    aget v8, p0, v7

    .line 183
    invoke-static {v2, v4, v6, v8}, Landroidx/camera/core/impl/utils/TransformUtils;->min(FFFF)F

    move-result v2

    const/4 v4, 0x1

    aget v6, p0, v4

    const/4 v8, 0x3

    aget v9, p0, v8

    const/4 v10, 0x5

    aget v11, p0, v10

    const/4 v12, 0x7

    aget v13, p0, v12

    .line 184
    invoke-static {v6, v9, v11, v13}, Landroidx/camera/core/impl/utils/TransformUtils;->min(FFFF)F

    move-result v6

    aget v1, p0, v1

    aget v3, p0, v3

    aget v5, p0, v5

    aget v7, p0, v7

    .line 185
    invoke-static {v1, v3, v5, v7}, Landroidx/camera/core/impl/utils/TransformUtils;->max(FFFF)F

    move-result v1

    aget v3, p0, v4

    aget v4, p0, v8

    aget v5, p0, v10

    aget v7, p0, v12

    .line 186
    invoke-static {v3, v4, v5, v7}, Landroidx/camera/core/impl/utils/TransformUtils;->max(FFFF)F

    move-result v3

    invoke-direct {v0, v2, v6, v1, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 182
    return-object v0
.end method

.method public static within360(I)I
    .locals 1
    .param p0, "degrees"    # I

    .line 174
    rem-int/lit16 v0, p0, 0x168

    add-int/lit16 v0, v0, 0x168

    rem-int/lit16 v0, v0, 0x168

    return v0
.end method
