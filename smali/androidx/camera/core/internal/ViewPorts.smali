.class public Landroidx/camera/core/internal/ViewPorts;
.super Ljava/lang/Object;
.source "ViewPorts.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    return-void
.end method

.method public static calculateViewPortRects(Landroid/graphics/Rect;ZLandroid/util/Rational;IIILjava/util/Map;)Ljava/util/Map;
    .locals 12
    .param p0, "fullSensorRect"    # Landroid/graphics/Rect;
    .param p1, "isFrontCamera"    # Z
    .param p2, "viewPortAspectRatio"    # Landroid/util/Rational;
    .param p3, "outputRotationDegrees"    # I
    .param p4, "scaleType"    # I
    .param p5, "layoutDirection"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Rect;",
            "Z",
            "Landroid/util/Rational;",
            "III",
            "Ljava/util/Map<",
            "Landroidx/camera/core/UseCase;",
            "Landroidx/camera/core/impl/StreamSpec;",
            ">;)",
            "Ljava/util/Map<",
            "Landroidx/camera/core/UseCase;",
            "Landroid/graphics/Rect;",
            ">;"
        }
    .end annotation

    .line 72
    .local p6, "useCaseStreamSpecs":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/UseCase;Landroidx/camera/core/impl/StreamSpec;>;"
    nop

    .line 73
    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 72
    :goto_0
    const-string v1, "Cannot compute viewport crop rects zero sized sensor rect."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 82
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0, p0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 83
    .local v0, "fullSensorRectF":Landroid/graphics/RectF;
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 84
    .local v1, "useCaseToSensorTransformations":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/UseCase;Landroid/graphics/Matrix;>;"
    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2, p0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    move-object v3, v2

    .line 85
    .local v3, "sensorIntersectionRect":Landroid/graphics/RectF;
    invoke-interface/range {p6 .. p6}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 87
    .local v4, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/UseCase;Landroidx/camera/core/impl/StreamSpec;>;"
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 88
    .local v5, "useCaseToSensorTransformation":Landroid/graphics/Matrix;
    new-instance v6, Landroid/graphics/RectF;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroidx/camera/core/impl/StreamSpec;

    invoke-virtual {v7}, Landroidx/camera/core/impl/StreamSpec;->getResolution()Landroid/util/Size;

    move-result-object v7

    invoke-virtual {v7}, Landroid/util/Size;->getWidth()I

    move-result v7

    int-to-float v7, v7

    .line 89
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroidx/camera/core/impl/StreamSpec;

    invoke-virtual {v8}, Landroidx/camera/core/impl/StreamSpec;->getResolution()Landroid/util/Size;

    move-result-object v8

    invoke-virtual {v8}, Landroid/util/Size;->getHeight()I

    move-result v8

    int-to-float v8, v8

    const/4 v9, 0x0

    invoke-direct {v6, v9, v9, v7, v8}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 90
    .local v6, "srcRect":Landroid/graphics/RectF;
    sget-object v7, Landroid/graphics/Matrix$ScaleToFit;->CENTER:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v5, v6, v0, v7}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 92
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroidx/camera/core/UseCase;

    invoke-interface {v1, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    new-instance v7, Landroid/graphics/RectF;

    invoke-direct {v7}, Landroid/graphics/RectF;-><init>()V

    .line 96
    .local v7, "useCaseSensorRect":Landroid/graphics/RectF;
    invoke-virtual {v5, v7, v6}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    .line 97
    invoke-virtual {v3, v7}, Landroid/graphics/RectF;->intersect(Landroid/graphics/RectF;)Z

    .line 98
    .end local v4    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/UseCase;Landroidx/camera/core/impl/StreamSpec;>;"
    .end local v5    # "useCaseToSensorTransformation":Landroid/graphics/Matrix;
    .end local v6    # "srcRect":Landroid/graphics/RectF;
    .end local v7    # "useCaseSensorRect":Landroid/graphics/RectF;
    goto :goto_1

    .line 101
    :cond_1
    invoke-static {p3, p2}, Landroidx/camera/core/internal/utils/ImageUtil;->getRotatedAspectRatio(ILandroid/util/Rational;)Landroid/util/Rational;

    move-result-object v4

    .line 103
    .local v4, "rotatedViewPortAspectRatio":Landroid/util/Rational;
    move v6, p1

    move v8, p3

    move/from16 v5, p4

    move/from16 v7, p5

    invoke-static/range {v3 .. v8}, Landroidx/camera/core/internal/ViewPorts;->getScaledRect(Landroid/graphics/RectF;Landroid/util/Rational;IZII)Landroid/graphics/RectF;

    move-result-object v2

    .line 108
    .local v2, "viewPortRect":Landroid/graphics/RectF;
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 109
    .local v5, "useCaseOutputRects":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/UseCase;Landroid/graphics/Rect;>;"
    new-instance v6, Landroid/graphics/RectF;

    invoke-direct {v6}, Landroid/graphics/RectF;-><init>()V

    .line 110
    .local v6, "useCaseOutputRect":Landroid/graphics/RectF;
    new-instance v7, Landroid/graphics/Matrix;

    invoke-direct {v7}, Landroid/graphics/Matrix;-><init>()V

    .line 111
    .local v7, "sensorToUseCaseTransformation":Landroid/graphics/Matrix;
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_2
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Map$Entry;

    .line 113
    .local v9, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/UseCase;Landroid/graphics/Matrix;>;"
    invoke-interface {v9}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/graphics/Matrix;

    invoke-virtual {v10, v7}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 114
    invoke-virtual {v7, v6, v2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    .line 115
    new-instance v10, Landroid/graphics/Rect;

    invoke-direct {v10}, Landroid/graphics/Rect;-><init>()V

    .line 116
    .local v10, "outputCropRect":Landroid/graphics/Rect;
    invoke-virtual {v6, v10}, Landroid/graphics/RectF;->round(Landroid/graphics/Rect;)V

    .line 117
    invoke-interface {v9}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroidx/camera/core/UseCase;

    invoke-interface {v5, v11, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    .end local v9    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/UseCase;Landroid/graphics/Matrix;>;"
    .end local v10    # "outputCropRect":Landroid/graphics/Rect;
    goto :goto_2

    .line 119
    :cond_2
    return-object v5
.end method

.method private static correctStartOrEnd(ZILandroid/graphics/RectF;Landroid/graphics/RectF;)Landroid/graphics/RectF;
    .locals 11
    .param p0, "isMirrored"    # Z
    .param p1, "rotationDegrees"    # I
    .param p2, "containerRect"    # Landroid/graphics/RectF;
    .param p3, "cropRect"    # Landroid/graphics/RectF;

    .line 204
    const/4 v0, 0x1

    const/4 v1, 0x0

    if-nez p1, :cond_0

    if-nez p0, :cond_0

    move v2, v0

    goto :goto_0

    :cond_0
    move v2, v1

    .line 210
    .local v2, "ltrRotation0":Z
    :goto_0
    const/16 v3, 0x5a

    if-ne p1, v3, :cond_1

    if-eqz p0, :cond_1

    move v4, v0

    goto :goto_1

    :cond_1
    move v4, v1

    .line 211
    .local v4, "rtlRotation90":Z
    :goto_1
    if-nez v2, :cond_f

    if-eqz v4, :cond_2

    goto/16 :goto_b

    .line 220
    :cond_2
    if-nez p1, :cond_3

    if-eqz p0, :cond_3

    move v5, v0

    goto :goto_2

    :cond_3
    move v5, v1

    .line 226
    .local v5, "rtlRotation0":Z
    :goto_2
    const/16 v6, 0x10e

    if-ne p1, v6, :cond_4

    if-nez p0, :cond_4

    move v7, v0

    goto :goto_3

    :cond_4
    move v7, v1

    .line 227
    .local v7, "ltrRotation270":Z
    :goto_3
    if-nez v5, :cond_e

    if-eqz v7, :cond_5

    goto/16 :goto_a

    .line 236
    :cond_5
    if-ne p1, v3, :cond_6

    if-nez p0, :cond_6

    move v3, v0

    goto :goto_4

    :cond_6
    move v3, v1

    .line 242
    .local v3, "ltrRotation90":Z
    :goto_4
    const/16 v8, 0xb4

    if-ne p1, v8, :cond_7

    if-eqz p0, :cond_7

    move v9, v0

    goto :goto_5

    :cond_7
    move v9, v1

    .line 243
    .local v9, "rtlRotation180":Z
    :goto_5
    if-nez v3, :cond_d

    if-eqz v9, :cond_8

    goto :goto_9

    .line 252
    :cond_8
    if-ne p1, v8, :cond_9

    if-nez p0, :cond_9

    move v8, v0

    goto :goto_6

    :cond_9
    move v8, v1

    .line 258
    .local v8, "ltrRotation180":Z
    :goto_6
    if-ne p1, v6, :cond_a

    if-eqz p0, :cond_a

    goto :goto_7

    :cond_a
    move v0, v1

    .line 259
    .local v0, "rtlRotation270":Z
    :goto_7
    if-nez v8, :cond_c

    if-eqz v0, :cond_b

    goto :goto_8

    .line 264
    :cond_b
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Invalid argument: mirrored "

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v10, " rotation "

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v1, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 260
    :cond_c
    :goto_8
    invoke-virtual {p2}, Landroid/graphics/RectF;->centerY()F

    move-result v1

    invoke-static {p3, v1}, Landroidx/camera/core/internal/ViewPorts;->flipVertically(Landroid/graphics/RectF;F)Landroid/graphics/RectF;

    move-result-object v1

    .line 261
    invoke-virtual {p2}, Landroid/graphics/RectF;->centerX()F

    move-result v6

    .line 260
    invoke-static {v1, v6}, Landroidx/camera/core/internal/ViewPorts;->flipHorizontally(Landroid/graphics/RectF;F)Landroid/graphics/RectF;

    move-result-object v1

    return-object v1

    .line 244
    .end local v0    # "rtlRotation270":Z
    .end local v8    # "ltrRotation180":Z
    :cond_d
    :goto_9
    invoke-virtual {p2}, Landroid/graphics/RectF;->centerY()F

    move-result v0

    invoke-static {p3, v0}, Landroidx/camera/core/internal/ViewPorts;->flipVertically(Landroid/graphics/RectF;F)Landroid/graphics/RectF;

    move-result-object v0

    return-object v0

    .line 228
    .end local v3    # "ltrRotation90":Z
    .end local v9    # "rtlRotation180":Z
    :cond_e
    :goto_a
    invoke-virtual {p2}, Landroid/graphics/RectF;->centerX()F

    move-result v0

    invoke-static {p3, v0}, Landroidx/camera/core/internal/ViewPorts;->flipHorizontally(Landroid/graphics/RectF;F)Landroid/graphics/RectF;

    move-result-object v0

    return-object v0

    .line 212
    .end local v5    # "rtlRotation0":Z
    .end local v7    # "ltrRotation270":Z
    :cond_f
    :goto_b
    return-object p3
.end method

.method private static flipHorizontally(Landroid/graphics/RectF;F)Landroid/graphics/RectF;
    .locals 5
    .param p0, "original"    # Landroid/graphics/RectF;
    .param p1, "flipLineX"    # F

    .line 280
    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Landroid/graphics/RectF;->right:F

    .line 281
    invoke-static {v1, p1}, Landroidx/camera/core/internal/ViewPorts;->flipX(FF)F

    move-result v1

    iget v2, p0, Landroid/graphics/RectF;->top:F

    iget v3, p0, Landroid/graphics/RectF;->left:F

    .line 283
    invoke-static {v3, p1}, Landroidx/camera/core/internal/ViewPorts;->flipX(FF)F

    move-result v3

    iget v4, p0, Landroid/graphics/RectF;->bottom:F

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 280
    return-object v0
.end method

.method private static flipVertically(Landroid/graphics/RectF;F)Landroid/graphics/RectF;
    .locals 5
    .param p0, "original"    # Landroid/graphics/RectF;
    .param p1, "flipLineY"    # F

    .line 288
    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Landroid/graphics/RectF;->left:F

    iget v2, p0, Landroid/graphics/RectF;->bottom:F

    .line 290
    invoke-static {v2, p1}, Landroidx/camera/core/internal/ViewPorts;->flipY(FF)F

    move-result v2

    iget v3, p0, Landroid/graphics/RectF;->right:F

    iget v4, p0, Landroid/graphics/RectF;->top:F

    .line 292
    invoke-static {v4, p1}, Landroidx/camera/core/internal/ViewPorts;->flipY(FF)F

    move-result v4

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 288
    return-object v0
.end method

.method private static flipX(FF)F
    .locals 1
    .param p0, "x"    # F
    .param p1, "flipLineX"    # F

    .line 296
    add-float v0, p1, p1

    sub-float/2addr v0, p0

    return v0
.end method

.method private static flipY(FF)F
    .locals 1
    .param p0, "y"    # F
    .param p1, "flipLineY"    # F

    .line 300
    add-float v0, p1, p1

    sub-float/2addr v0, p0

    return v0
.end method

.method public static getScaledRect(Landroid/graphics/RectF;Landroid/util/Rational;IZII)Landroid/graphics/RectF;
    .locals 5
    .param p0, "fittingRect"    # Landroid/graphics/RectF;
    .param p1, "containerAspectRatio"    # Landroid/util/Rational;
    .param p2, "scaleType"    # I
    .param p3, "isFrontCamera"    # Z
    .param p4, "layoutDirection"    # I
    .param p5, "rotationDegrees"    # I

    .line 140
    const/4 v0, 0x3

    if-ne p2, v0, :cond_0

    .line 142
    return-object p0

    .line 150
    :cond_0
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 151
    .local v0, "viewPortToSurfaceTransformation":Landroid/graphics/Matrix;
    new-instance v1, Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/util/Rational;->getNumerator()I

    move-result v2

    int-to-float v2, v2

    .line 152
    invoke-virtual {p1}, Landroid/util/Rational;->getDenominator()I

    move-result v3

    int-to-float v3, v3

    const/4 v4, 0x0

    invoke-direct {v1, v4, v4, v2, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 153
    .local v1, "viewPortRect":Landroid/graphics/RectF;
    packed-switch p2, :pswitch_data_0

    .line 167
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Unexpected scale type: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 163
    :pswitch_0
    sget-object v2, Landroid/graphics/Matrix$ScaleToFit;->END:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v0, v1, p0, v2}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 165
    goto :goto_0

    .line 155
    :pswitch_1
    sget-object v2, Landroid/graphics/Matrix$ScaleToFit;->CENTER:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v0, v1, p0, v2}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 157
    goto :goto_0

    .line 159
    :pswitch_2
    sget-object v2, Landroid/graphics/Matrix$ScaleToFit;->START:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v0, v1, p0, v2}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 161
    nop

    .line 170
    :goto_0
    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    .line 171
    .local v2, "viewPortRectInSurfaceCoordinates":Landroid/graphics/RectF;
    invoke-virtual {v0, v2, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    .line 174
    nop

    .line 175
    invoke-static {p3, p4}, Landroidx/camera/core/internal/ViewPorts;->shouldMirrorStartAndEnd(ZI)Z

    move-result v3

    .line 174
    invoke-static {v3, p5, p0, v2}, Landroidx/camera/core/internal/ViewPorts;->correctStartOrEnd(ZILandroid/graphics/RectF;Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v3

    return-object v3

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static shouldMirrorStartAndEnd(ZI)Z
    .locals 1
    .param p0, "isFrontCamera"    # Z
    .param p1, "layoutDirection"    # I

    .line 276
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    xor-int/2addr v0, p0

    return v0
.end method
