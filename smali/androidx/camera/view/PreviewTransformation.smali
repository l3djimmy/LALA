.class final Landroidx/camera/view/PreviewTransformation;
.super Ljava/lang/Object;
.source "PreviewTransformation.java"


# static fields
.field private static final DEFAULT_SCALE_TYPE:Landroidx/camera/view/PreviewView$ScaleType;

.field private static final TAG:Ljava/lang/String; = "PreviewTransform"


# instance fields
.field private mHasCameraTransform:Z

.field private mIsFrontCamera:Z

.field private mPreviewRotationDegrees:I

.field private mResolution:Landroid/util/Size;

.field private mScaleType:Landroidx/camera/view/PreviewView$ScaleType;

.field private mSensorToBufferTransform:Landroid/graphics/Matrix;

.field private mSurfaceCropRect:Landroid/graphics/Rect;

.field private mTargetRotation:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 99
    sget-object v0, Landroidx/camera/view/PreviewView$ScaleType;->FILL_CENTER:Landroidx/camera/view/PreviewView$ScaleType;

    sput-object v0, Landroidx/camera/view/PreviewTransformation;->DEFAULT_SCALE_TYPE:Landroidx/camera/view/PreviewView$ScaleType;

    return-void
.end method

.method constructor <init>()V
    .locals 1

    .line 119
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 117
    sget-object v0, Landroidx/camera/view/PreviewTransformation;->DEFAULT_SCALE_TYPE:Landroidx/camera/view/PreviewView$ScaleType;

    iput-object v0, p0, Landroidx/camera/view/PreviewTransformation;->mScaleType:Landroidx/camera/view/PreviewView$ScaleType;

    .line 120
    return-void
.end method

.method private static flipHorizontally(Landroid/graphics/RectF;F)Landroid/graphics/RectF;
    .locals 5
    .param p0, "original"    # Landroid/graphics/RectF;
    .param p1, "flipLineX"    # F

    .line 399
    new-instance v0, Landroid/graphics/RectF;

    add-float v1, p1, p1

    iget v2, p0, Landroid/graphics/RectF;->right:F

    sub-float/2addr v1, v2

    iget v2, p0, Landroid/graphics/RectF;->top:F

    add-float v3, p1, p1

    iget v4, p0, Landroid/graphics/RectF;->left:F

    sub-float/2addr v3, v4

    iget v4, p0, Landroid/graphics/RectF;->bottom:F

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    return-object v0
.end method

.method private getRemainingRotationDegrees()I
    .locals 1

    .line 184
    iget-boolean v0, p0, Landroidx/camera/view/PreviewTransformation;->mHasCameraTransform:Z

    if-nez v0, :cond_0

    .line 188
    iget v0, p0, Landroidx/camera/view/PreviewTransformation;->mPreviewRotationDegrees:I

    return v0

    .line 193
    :cond_0
    iget v0, p0, Landroidx/camera/view/PreviewTransformation;->mTargetRotation:I

    invoke-static {v0}, Landroidx/camera/core/impl/utils/CameraOrientationUtil;->surfaceRotationToDegrees(I)I

    move-result v0

    neg-int v0, v0

    return v0
.end method

.method private getRotatedViewportSize()Landroid/util/Size;
    .locals 3

    .line 410
    iget v0, p0, Landroidx/camera/view/PreviewTransformation;->mPreviewRotationDegrees:I

    invoke-static {v0}, Landroidx/camera/core/impl/utils/TransformUtils;->is90or270(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 411
    new-instance v0, Landroid/util/Size;

    iget-object v1, p0, Landroidx/camera/view/PreviewTransformation;->mSurfaceCropRect:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    iget-object v2, p0, Landroidx/camera/view/PreviewTransformation;->mSurfaceCropRect:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/util/Size;-><init>(II)V

    return-object v0

    .line 413
    :cond_0
    new-instance v0, Landroid/util/Size;

    iget-object v1, p0, Landroidx/camera/view/PreviewTransformation;->mSurfaceCropRect:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v1

    iget-object v2, p0, Landroidx/camera/view/PreviewTransformation;->mSurfaceCropRect:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/util/Size;-><init>(II)V

    return-object v0
.end method

.method private getTransformedSurfaceRect(Landroid/util/Size;I)Landroid/graphics/RectF;
    .locals 5
    .param p1, "previewViewSize"    # Landroid/util/Size;
    .param p2, "layoutDirection"    # I

    .line 259
    invoke-direct {p0}, Landroidx/camera/view/PreviewTransformation;->isTransformationInfoReady()Z

    move-result v0

    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkState(Z)V

    .line 260
    nop

    .line 261
    invoke-virtual {p0, p1, p2}, Landroidx/camera/view/PreviewTransformation;->getSurfaceToPreviewViewMatrix(Landroid/util/Size;I)Landroid/graphics/Matrix;

    move-result-object v0

    .line 262
    .local v0, "surfaceToPreviewView":Landroid/graphics/Matrix;
    new-instance v1, Landroid/graphics/RectF;

    iget-object v2, p0, Landroidx/camera/view/PreviewTransformation;->mResolution:Landroid/util/Size;

    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v2

    int-to-float v2, v2

    iget-object v3, p0, Landroidx/camera/view/PreviewTransformation;->mResolution:Landroid/util/Size;

    invoke-virtual {v3}, Landroid/util/Size;->getHeight()I

    move-result v3

    int-to-float v3, v3

    const/4 v4, 0x0

    invoke-direct {v1, v4, v4, v2, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 263
    .local v1, "rect":Landroid/graphics/RectF;
    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 264
    return-object v1
.end method

.method private isTransformationInfoReady()Z
    .locals 4

    .line 502
    iget-boolean v0, p0, Landroidx/camera/view/PreviewTransformation;->mHasCameraTransform:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    iget v0, p0, Landroidx/camera/view/PreviewTransformation;->mTargetRotation:I

    const/4 v3, -0x1

    if-eq v0, v3, :cond_0

    goto :goto_0

    :cond_0
    move v0, v1

    goto :goto_1

    :cond_1
    :goto_0
    move v0, v2

    .line 504
    .local v0, "isTargetRotationSpecified":Z
    :goto_1
    iget-object v3, p0, Landroidx/camera/view/PreviewTransformation;->mSurfaceCropRect:Landroid/graphics/Rect;

    if-eqz v3, :cond_2

    iget-object v3, p0, Landroidx/camera/view/PreviewTransformation;->mResolution:Landroid/util/Size;

    if-eqz v3, :cond_2

    if-eqz v0, :cond_2

    move v1, v2

    :cond_2
    return v1
.end method

.method private static setMatrixRectToRect(Landroid/graphics/Matrix;Landroid/graphics/RectF;Landroid/graphics/RectF;Landroidx/camera/view/PreviewView$ScaleType;)V
    .locals 2
    .param p0, "matrix"    # Landroid/graphics/Matrix;
    .param p1, "source"    # Landroid/graphics/RectF;
    .param p2, "destination"    # Landroid/graphics/RectF;
    .param p3, "scaleType"    # Landroidx/camera/view/PreviewView$ScaleType;

    .line 363
    sget-object v0, Landroidx/camera/view/PreviewTransformation$1;->$SwitchMap$androidx$camera$view$PreviewView$ScaleType:[I

    invoke-virtual {p3}, Landroidx/camera/view/PreviewView$ScaleType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 380
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Unexpected crop rect: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "PreviewTransform"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 381
    sget-object v0, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    .local v0, "matrixScaleType":Landroid/graphics/Matrix$ScaleToFit;
    goto :goto_0

    .line 377
    .end local v0    # "matrixScaleType":Landroid/graphics/Matrix$ScaleToFit;
    :pswitch_0
    sget-object v0, Landroid/graphics/Matrix$ScaleToFit;->START:Landroid/graphics/Matrix$ScaleToFit;

    .line 378
    .restart local v0    # "matrixScaleType":Landroid/graphics/Matrix$ScaleToFit;
    goto :goto_0

    .line 372
    .end local v0    # "matrixScaleType":Landroid/graphics/Matrix$ScaleToFit;
    :pswitch_1
    sget-object v0, Landroid/graphics/Matrix$ScaleToFit;->END:Landroid/graphics/Matrix$ScaleToFit;

    .line 373
    .restart local v0    # "matrixScaleType":Landroid/graphics/Matrix$ScaleToFit;
    goto :goto_0

    .line 367
    .end local v0    # "matrixScaleType":Landroid/graphics/Matrix$ScaleToFit;
    :pswitch_2
    sget-object v0, Landroid/graphics/Matrix$ScaleToFit;->CENTER:Landroid/graphics/Matrix$ScaleToFit;

    .line 368
    .restart local v0    # "matrixScaleType":Landroid/graphics/Matrix$ScaleToFit;
    nop

    .line 383
    :goto_0
    sget-object v1, Landroidx/camera/view/PreviewView$ScaleType;->FIT_CENTER:Landroidx/camera/view/PreviewView$ScaleType;

    if-eq p3, v1, :cond_1

    sget-object v1, Landroidx/camera/view/PreviewView$ScaleType;->FIT_START:Landroidx/camera/view/PreviewView$ScaleType;

    if-eq p3, v1, :cond_1

    sget-object v1, Landroidx/camera/view/PreviewView$ScaleType;->FIT_END:Landroidx/camera/view/PreviewView$ScaleType;

    if-ne p3, v1, :cond_0

    goto :goto_1

    :cond_0
    const/4 v1, 0x0

    goto :goto_2

    :cond_1
    :goto_1
    const/4 v1, 0x1

    .line 385
    .local v1, "isFitTypes":Z
    :goto_2
    if-eqz v1, :cond_2

    .line 386
    invoke-virtual {p0, p1, p2, v0}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    goto :goto_3

    .line 390
    :cond_2
    invoke-virtual {p0, p2, p1, v0}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 391
    invoke-virtual {p0, p0}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 393
    :goto_3
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method createTransformedBitmap(Landroid/graphics/Bitmap;Landroid/util/Size;I)Landroid/graphics/Bitmap;
    .locals 8
    .param p1, "original"    # Landroid/graphics/Bitmap;
    .param p2, "previewViewSize"    # Landroid/util/Size;
    .param p3, "layoutDirection"    # I

    .line 450
    invoke-direct {p0}, Landroidx/camera/view/PreviewTransformation;->isTransformationInfoReady()Z

    move-result v0

    if-nez v0, :cond_0

    .line 451
    return-object p1

    .line 453
    :cond_0
    invoke-virtual {p0}, Landroidx/camera/view/PreviewTransformation;->getTextureViewCorrectionMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    .line 454
    .local v0, "textureViewCorrection":Landroid/graphics/Matrix;
    invoke-direct {p0, p2, p3}, Landroidx/camera/view/PreviewTransformation;->getTransformedSurfaceRect(Landroid/util/Size;I)Landroid/graphics/RectF;

    move-result-object v1

    .line 457
    .local v1, "surfaceRectInPreviewView":Landroid/graphics/RectF;
    nop

    .line 458
    invoke-virtual {p2}, Landroid/util/Size;->getWidth()I

    move-result v2

    invoke-virtual {p2}, Landroid/util/Size;->getHeight()I

    move-result v3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v4

    .line 457
    invoke-static {v2, v3, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 459
    .local v2, "transformed":Landroid/graphics/Bitmap;
    new-instance v3, Landroid/graphics/Canvas;

    invoke-direct {v3, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 461
    .local v3, "canvas":Landroid/graphics/Canvas;
    new-instance v4, Landroid/graphics/Matrix;

    invoke-direct {v4}, Landroid/graphics/Matrix;-><init>()V

    .line 462
    .local v4, "canvasTransform":Landroid/graphics/Matrix;
    invoke-virtual {v4, v0}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 463
    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v5

    iget-object v6, p0, Landroidx/camera/view/PreviewTransformation;->mResolution:Landroid/util/Size;

    invoke-virtual {v6}, Landroid/util/Size;->getWidth()I

    move-result v6

    int-to-float v6, v6

    div-float/2addr v5, v6

    .line 464
    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v6

    iget-object v7, p0, Landroidx/camera/view/PreviewTransformation;->mResolution:Landroid/util/Size;

    invoke-virtual {v7}, Landroid/util/Size;->getHeight()I

    move-result v7

    int-to-float v7, v7

    div-float/2addr v6, v7

    .line 463
    invoke-virtual {v4, v5, v6}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 465
    iget v5, v1, Landroid/graphics/RectF;->left:F

    iget v6, v1, Landroid/graphics/RectF;->top:F

    invoke-virtual {v4, v5, v6}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 467
    new-instance v5, Landroid/graphics/Paint;

    const/4 v6, 0x7

    invoke-direct {v5, v6}, Landroid/graphics/Paint;-><init>(I)V

    invoke-virtual {v3, p1, v4, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    .line 469
    return-object v2
.end method

.method getPreviewViewToNormalizedSurfaceMatrix(Landroid/util/Size;I)Landroid/graphics/Matrix;
    .locals 6
    .param p1, "previewViewSize"    # Landroid/util/Size;
    .param p2, "layoutDirection"    # I

    .line 482
    invoke-direct {p0}, Landroidx/camera/view/PreviewTransformation;->isTransformationInfoReady()Z

    move-result v0

    if-nez v0, :cond_0

    .line 483
    const/4 v0, 0x0

    return-object v0

    .line 485
    :cond_0
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 488
    .local v0, "matrix":Landroid/graphics/Matrix;
    invoke-virtual {p0, p1, p2}, Landroidx/camera/view/PreviewTransformation;->getSurfaceToPreviewViewMatrix(Landroid/util/Size;I)Landroid/graphics/Matrix;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 491
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    .line 492
    .local v1, "normalization":Landroid/graphics/Matrix;
    new-instance v2, Landroid/graphics/RectF;

    iget-object v3, p0, Landroidx/camera/view/PreviewTransformation;->mResolution:Landroid/util/Size;

    .line 493
    invoke-virtual {v3}, Landroid/util/Size;->getWidth()I

    move-result v3

    int-to-float v3, v3

    iget-object v4, p0, Landroidx/camera/view/PreviewTransformation;->mResolution:Landroid/util/Size;

    invoke-virtual {v4}, Landroid/util/Size;->getHeight()I

    move-result v4

    int-to-float v4, v4

    const/4 v5, 0x0

    invoke-direct {v2, v5, v5, v3, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    new-instance v3, Landroid/graphics/RectF;

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v3, v5, v5, v4, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    sget-object v4, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    .line 492
    invoke-virtual {v1, v2, v3, v4}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 495
    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 497
    return-object v0
.end method

.method getPreviewViewViewportRectForMismatchedAspectRatios(Landroid/util/Size;I)Landroid/graphics/RectF;
    .locals 6
    .param p1, "previewViewSize"    # Landroid/util/Size;
    .param p2, "layoutDirection"    # I

    .line 340
    new-instance v0, Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v1

    int-to-float v1, v1

    .line 341
    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v2

    int-to-float v2, v2

    const/4 v3, 0x0

    invoke-direct {v0, v3, v3, v1, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 342
    .local v0, "previewViewRect":Landroid/graphics/RectF;
    invoke-direct {p0}, Landroidx/camera/view/PreviewTransformation;->getRotatedViewportSize()Landroid/util/Size;

    move-result-object v1

    .line 343
    .local v1, "rotatedViewportSize":Landroid/util/Size;
    new-instance v2, Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v4

    int-to-float v4, v4

    .line 344
    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v5

    int-to-float v5, v5

    invoke-direct {v2, v3, v3, v4, v5}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 345
    .local v2, "rotatedViewportRect":Landroid/graphics/RectF;
    new-instance v3, Landroid/graphics/Matrix;

    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    .line 346
    .local v3, "matrix":Landroid/graphics/Matrix;
    iget-object v4, p0, Landroidx/camera/view/PreviewTransformation;->mScaleType:Landroidx/camera/view/PreviewView$ScaleType;

    invoke-static {v3, v2, v0, v4}, Landroidx/camera/view/PreviewTransformation;->setMatrixRectToRect(Landroid/graphics/Matrix;Landroid/graphics/RectF;Landroid/graphics/RectF;Landroidx/camera/view/PreviewView$ScaleType;)V

    .line 347
    invoke-virtual {v3, v2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 348
    const/4 v4, 0x1

    if-ne p2, v4, :cond_0

    .line 349
    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v4

    int-to-float v4, v4

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v4, v5

    invoke-static {v2, v4}, Landroidx/camera/view/PreviewTransformation;->flipHorizontally(Landroid/graphics/RectF;F)Landroid/graphics/RectF;

    move-result-object v4

    return-object v4

    .line 351
    :cond_0
    return-object v2
.end method

.method getScaleType()Landroidx/camera/view/PreviewView$ScaleType;
    .locals 1

    .line 249
    iget-object v0, p0, Landroidx/camera/view/PreviewTransformation;->mScaleType:Landroidx/camera/view/PreviewView$ScaleType;

    return-object v0
.end method

.method getSensorToViewTransform(Landroid/util/Size;I)Landroid/graphics/Matrix;
    .locals 2
    .param p1, "previewViewSize"    # Landroid/util/Size;
    .param p2, "layoutDirection"    # I

    .line 274
    invoke-direct {p0}, Landroidx/camera/view/PreviewTransformation;->isTransformationInfoReady()Z

    move-result v0

    if-nez v0, :cond_0

    .line 275
    const/4 v0, 0x0

    return-object v0

    .line 279
    :cond_0
    new-instance v0, Landroid/graphics/Matrix;

    iget-object v1, p0, Landroidx/camera/view/PreviewTransformation;->mSensorToBufferTransform:Landroid/graphics/Matrix;

    invoke-direct {v0, v1}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    .line 280
    .local v0, "matrix":Landroid/graphics/Matrix;
    invoke-virtual {p0, p1, p2}, Landroidx/camera/view/PreviewTransformation;->getSurfaceToPreviewViewMatrix(Landroid/util/Size;I)Landroid/graphics/Matrix;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 281
    return-object v0
.end method

.method getSurfaceCropRect()Landroid/graphics/Rect;
    .locals 1

    .line 437
    iget-object v0, p0, Landroidx/camera/view/PreviewTransformation;->mSurfaceCropRect:Landroid/graphics/Rect;

    return-object v0
.end method

.method getSurfaceToPreviewViewMatrix(Landroid/util/Size;I)Landroid/graphics/Matrix;
    .locals 6
    .param p1, "previewViewSize"    # Landroid/util/Size;
    .param p2, "layoutDirection"    # I

    .line 291
    invoke-direct {p0}, Landroidx/camera/view/PreviewTransformation;->isTransformationInfoReady()Z

    move-result v0

    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkState(Z)V

    .line 295
    invoke-virtual {p0, p1}, Landroidx/camera/view/PreviewTransformation;->isViewportAspectRatioMatchPreviewView(Landroid/util/Size;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 299
    new-instance v0, Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v1

    int-to-float v1, v1

    .line 300
    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v2

    int-to-float v2, v2

    const/4 v3, 0x0

    invoke-direct {v0, v3, v3, v1, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    .local v0, "previewViewCropRect":Landroid/graphics/RectF;
    goto :goto_0

    .line 304
    .end local v0    # "previewViewCropRect":Landroid/graphics/RectF;
    :cond_0
    invoke-virtual {p0, p1, p2}, Landroidx/camera/view/PreviewTransformation;->getPreviewViewViewportRectForMismatchedAspectRatios(Landroid/util/Size;I)Landroid/graphics/RectF;

    move-result-object v0

    .line 307
    .restart local v0    # "previewViewCropRect":Landroid/graphics/RectF;
    :goto_0
    new-instance v1, Landroid/graphics/RectF;

    iget-object v2, p0, Landroidx/camera/view/PreviewTransformation;->mSurfaceCropRect:Landroid/graphics/Rect;

    invoke-direct {v1, v2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    iget v2, p0, Landroidx/camera/view/PreviewTransformation;->mPreviewRotationDegrees:I

    invoke-static {v1, v0, v2}, Landroidx/camera/core/impl/utils/TransformUtils;->getRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;I)Landroid/graphics/Matrix;

    move-result-object v1

    .line 309
    .local v1, "matrix":Landroid/graphics/Matrix;
    iget-boolean v2, p0, Landroidx/camera/view/PreviewTransformation;->mIsFrontCamera:Z

    if-eqz v2, :cond_2

    iget-boolean v2, p0, Landroidx/camera/view/PreviewTransformation;->mHasCameraTransform:Z

    if-eqz v2, :cond_2

    .line 314
    iget v2, p0, Landroidx/camera/view/PreviewTransformation;->mPreviewRotationDegrees:I

    invoke-static {v2}, Landroidx/camera/core/impl/utils/TransformUtils;->is90or270(I)Z

    move-result v2

    .line 325
    iget-object v3, p0, Landroidx/camera/view/PreviewTransformation;->mSurfaceCropRect:Landroid/graphics/Rect;

    .line 314
    const/high16 v4, 0x3f800000    # 1.0f

    const/high16 v5, -0x40800000    # -1.0f

    if-eqz v2, :cond_1

    .line 319
    invoke-virtual {v3}, Landroid/graphics/Rect;->centerX()I

    move-result v2

    int-to-float v2, v2

    iget-object v3, p0, Landroidx/camera/view/PreviewTransformation;->mSurfaceCropRect:Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Rect;->centerY()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v1, v4, v5, v2, v3}, Landroid/graphics/Matrix;->preScale(FFFF)Z

    goto :goto_1

    .line 325
    :cond_1
    invoke-virtual {v3}, Landroid/graphics/Rect;->centerX()I

    move-result v2

    int-to-float v2, v2

    iget-object v3, p0, Landroidx/camera/view/PreviewTransformation;->mSurfaceCropRect:Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Rect;->centerY()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v1, v5, v4, v2, v3}, Landroid/graphics/Matrix;->preScale(FFFF)Z

    .line 328
    :cond_2
    :goto_1
    return-object v1
.end method

.method getTextureViewCorrectionMatrix()Landroid/graphics/Matrix;
    .locals 4

    .line 169
    invoke-direct {p0}, Landroidx/camera/view/PreviewTransformation;->isTransformationInfoReady()Z

    move-result v0

    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkState(Z)V

    .line 170
    new-instance v0, Landroid/graphics/RectF;

    iget-object v1, p0, Landroidx/camera/view/PreviewTransformation;->mResolution:Landroid/util/Size;

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Landroidx/camera/view/PreviewTransformation;->mResolution:Landroid/util/Size;

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v2

    int-to-float v2, v2

    const/4 v3, 0x0

    invoke-direct {v0, v3, v3, v1, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 171
    .local v0, "surfaceRect":Landroid/graphics/RectF;
    invoke-direct {p0}, Landroidx/camera/view/PreviewTransformation;->getRemainingRotationDegrees()I

    move-result v1

    .line 172
    .local v1, "rotationDegrees":I
    invoke-static {v0, v0, v1}, Landroidx/camera/core/impl/utils/TransformUtils;->getRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;I)Landroid/graphics/Matrix;

    move-result-object v2

    return-object v2
.end method

.method isViewportAspectRatioMatchPreviewView(Landroid/util/Size;)Z
    .locals 3
    .param p1, "previewViewSize"    # Landroid/util/Size;

    .line 426
    invoke-direct {p0}, Landroidx/camera/view/PreviewTransformation;->getRotatedViewportSize()Landroid/util/Size;

    move-result-object v0

    .line 427
    .local v0, "rotatedViewportSize":Landroid/util/Size;
    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {p1, v1, v0, v2}, Landroidx/camera/core/impl/utils/TransformUtils;->isAspectRatioMatchingWithRoundingError(Landroid/util/Size;ZLandroid/util/Size;Z)Z

    move-result v1

    return v1
.end method

.method overrideWithDisplayRotation(II)V
    .locals 1
    .param p1, "rotationDegrees"    # I
    .param p2, "displayRotation"    # I

    .line 147
    iget-boolean v0, p0, Landroidx/camera/view/PreviewTransformation;->mHasCameraTransform:Z

    if-nez v0, :cond_0

    .line 150
    return-void

    .line 152
    :cond_0
    iput p1, p0, Landroidx/camera/view/PreviewTransformation;->mPreviewRotationDegrees:I

    .line 153
    iput p2, p0, Landroidx/camera/view/PreviewTransformation;->mTargetRotation:I

    .line 154
    return-void
.end method

.method setScaleType(Landroidx/camera/view/PreviewView$ScaleType;)V
    .locals 0
    .param p1, "scaleType"    # Landroidx/camera/view/PreviewView$ScaleType;

    .line 242
    iput-object p1, p0, Landroidx/camera/view/PreviewTransformation;->mScaleType:Landroidx/camera/view/PreviewView$ScaleType;

    .line 243
    return-void
.end method

.method setTransformationInfo(Landroidx/camera/core/SurfaceRequest$TransformationInfo;Landroid/util/Size;Z)V
    .locals 2
    .param p1, "transformationInfo"    # Landroidx/camera/core/SurfaceRequest$TransformationInfo;
    .param p2, "resolution"    # Landroid/util/Size;
    .param p3, "isFrontCamera"    # Z

    .line 129
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Transformation info set: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "PreviewTransform"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    invoke-virtual {p1}, Landroidx/camera/core/SurfaceRequest$TransformationInfo;->getCropRect()Landroid/graphics/Rect;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/view/PreviewTransformation;->mSurfaceCropRect:Landroid/graphics/Rect;

    .line 132
    invoke-virtual {p1}, Landroidx/camera/core/SurfaceRequest$TransformationInfo;->getRotationDegrees()I

    move-result v0

    iput v0, p0, Landroidx/camera/view/PreviewTransformation;->mPreviewRotationDegrees:I

    .line 133
    invoke-virtual {p1}, Landroidx/camera/core/SurfaceRequest$TransformationInfo;->getTargetRotation()I

    move-result v0

    iput v0, p0, Landroidx/camera/view/PreviewTransformation;->mTargetRotation:I

    .line 134
    iput-object p2, p0, Landroidx/camera/view/PreviewTransformation;->mResolution:Landroid/util/Size;

    .line 135
    iput-boolean p3, p0, Landroidx/camera/view/PreviewTransformation;->mIsFrontCamera:Z

    .line 136
    invoke-virtual {p1}, Landroidx/camera/core/SurfaceRequest$TransformationInfo;->hasCameraTransform()Z

    move-result v0

    iput-boolean v0, p0, Landroidx/camera/view/PreviewTransformation;->mHasCameraTransform:Z

    .line 137
    invoke-virtual {p1}, Landroidx/camera/core/SurfaceRequest$TransformationInfo;->getSensorToBufferTransform()Landroid/graphics/Matrix;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/view/PreviewTransformation;->mSensorToBufferTransform:Landroid/graphics/Matrix;

    .line 138
    return-void
.end method

.method transformView(Landroid/util/Size;ILandroid/view/View;)V
    .locals 6
    .param p1, "previewViewSize"    # Landroid/util/Size;
    .param p2, "layoutDirection"    # I
    .param p3, "preview"    # Landroid/view/View;

    .line 205
    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v0

    const-string/jumbo v1, "PreviewTransform"

    if-eqz v0, :cond_7

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_3

    .line 209
    :cond_0
    invoke-direct {p0}, Landroidx/camera/view/PreviewTransformation;->isTransformationInfoReady()Z

    move-result v0

    if-nez v0, :cond_1

    .line 210
    return-void

    .line 213
    :cond_1
    instance-of v0, p3, Landroid/view/TextureView;

    if-eqz v0, :cond_2

    .line 215
    move-object v0, p3

    check-cast v0, Landroid/view/TextureView;

    invoke-virtual {p0}, Landroidx/camera/view/PreviewTransformation;->getTextureViewCorrectionMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/TextureView;->setTransform(Landroid/graphics/Matrix;)V

    goto :goto_2

    .line 218
    :cond_2
    invoke-virtual {p3}, Landroid/view/View;->getDisplay()Landroid/view/Display;

    move-result-object v0

    .line 219
    .local v0, "display":Landroid/view/Display;
    iget-boolean v2, p0, Landroidx/camera/view/PreviewTransformation;->mHasCameraTransform:Z

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_3

    if-eqz v0, :cond_3

    .line 220
    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    move-result v2

    iget v5, p0, Landroidx/camera/view/PreviewTransformation;->mTargetRotation:I

    if-eq v2, v5, :cond_3

    move v2, v3

    goto :goto_0

    :cond_3
    move v2, v4

    .line 221
    .local v2, "mismatchedDisplayRotation":Z
    :goto_0
    iget-boolean v5, p0, Landroidx/camera/view/PreviewTransformation;->mHasCameraTransform:Z

    if-nez v5, :cond_4

    .line 222
    invoke-direct {p0}, Landroidx/camera/view/PreviewTransformation;->getRemainingRotationDegrees()I

    move-result v5

    if-eqz v5, :cond_4

    goto :goto_1

    :cond_4
    move v3, v4

    .line 223
    .local v3, "hasRemainingRotation":Z
    :goto_1
    if-nez v2, :cond_5

    if-eqz v3, :cond_6

    .line 224
    :cond_5
    const-string v4, "Custom rotation not supported with SurfaceView/PERFORMANCE mode."

    invoke-static {v1, v4}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 228
    .end local v0    # "display":Landroid/view/Display;
    .end local v2    # "mismatchedDisplayRotation":Z
    .end local v3    # "hasRemainingRotation":Z
    :cond_6
    :goto_2
    invoke-direct {p0, p1, p2}, Landroidx/camera/view/PreviewTransformation;->getTransformedSurfaceRect(Landroid/util/Size;I)Landroid/graphics/RectF;

    move-result-object v0

    .line 230
    .local v0, "surfaceRectInPreviewView":Landroid/graphics/RectF;
    const/4 v1, 0x0

    invoke-virtual {p3, v1}, Landroid/view/View;->setPivotX(F)V

    .line 231
    invoke-virtual {p3, v1}, Landroid/view/View;->setPivotY(F)V

    .line 232
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v1

    iget-object v2, p0, Landroidx/camera/view/PreviewTransformation;->mResolution:Landroid/util/Size;

    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v1, v2

    invoke-virtual {p3, v1}, Landroid/view/View;->setScaleX(F)V

    .line 233
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v1

    iget-object v2, p0, Landroidx/camera/view/PreviewTransformation;->mResolution:Landroid/util/Size;

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v1, v2

    invoke-virtual {p3, v1}, Landroid/view/View;->setScaleY(F)V

    .line 234
    iget v1, v0, Landroid/graphics/RectF;->left:F

    invoke-virtual {p3}, Landroid/view/View;->getLeft()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v1, v2

    invoke-virtual {p3, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 235
    iget v1, v0, Landroid/graphics/RectF;->top:F

    invoke-virtual {p3}, Landroid/view/View;->getTop()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v1, v2

    invoke-virtual {p3, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 236
    return-void

    .line 206
    .end local v0    # "surfaceRectInPreviewView":Landroid/graphics/RectF;
    :cond_7
    :goto_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Transform not applied due to PreviewView size: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 207
    return-void
.end method
