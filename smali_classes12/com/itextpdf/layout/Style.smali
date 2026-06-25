.class public Lcom/itextpdf/layout/Style;
.super Lcom/itextpdf/layout/ElementPropertyContainer;
.source "Style.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/layout/ElementPropertyContainer<",
        "Lcom/itextpdf/layout/Style;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 42
    invoke-direct {p0}, Lcom/itextpdf/layout/ElementPropertyContainer;-><init>()V

    .line 43
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/layout/Style;)V
    .locals 2
    .param p1, "style"    # Lcom/itextpdf/layout/Style;

    .line 45
    invoke-direct {p0}, Lcom/itextpdf/layout/ElementPropertyContainer;-><init>()V

    .line 46
    iget-object v0, p0, Lcom/itextpdf/layout/Style;->properties:Ljava/util/Map;

    iget-object v1, p1, Lcom/itextpdf/layout/Style;->properties:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 47
    return-void
.end method


# virtual methods
.method public getHeight()Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1

    .line 404
    const/16 v0, 0x1b

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/Style;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    return-object v0
.end method

.method public getMarginBottom()Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1

    .line 118
    const/16 v0, 0x2b

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/Style;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    return-object v0
.end method

.method public getMarginLeft()Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1

    .line 55
    const/16 v0, 0x2c

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/Style;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    return-object v0
.end method

.method public getMarginRight()Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1

    .line 76
    const/16 v0, 0x2d

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/Style;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    return-object v0
.end method

.method public getMarginTop()Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1

    .line 97
    const/16 v0, 0x2e

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/Style;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    return-object v0
.end method

.method public getPaddingBottom()Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1

    .line 229
    const/16 v0, 0x2f

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/Style;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    return-object v0
.end method

.method public getPaddingLeft()Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1

    .line 166
    const/16 v0, 0x30

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/Style;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    return-object v0
.end method

.method public getPaddingRight()Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1

    .line 187
    const/16 v0, 0x31

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/Style;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    return-object v0
.end method

.method public getPaddingTop()Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1

    .line 208
    const/16 v0, 0x32

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/Style;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    return-object v0
.end method

.method public getWidth()Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1

    .line 372
    const/16 v0, 0x4d

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/Style;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    return-object v0
.end method

.method public isKeepTogether()Ljava/lang/Boolean;
    .locals 1

    .line 306
    const/16 v0, 0x20

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/Style;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    return-object v0
.end method

.method public setHeight(F)Lcom/itextpdf/layout/Style;
    .locals 2
    .param p1, "height"    # F

    .line 393
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 394
    .local v0, "heightAsUV":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v1, 0x1b

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/Style;->setProperty(ILjava/lang/Object;)V

    .line 395
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/layout/Style;

    return-object v1
.end method

.method public setHeight(Lcom/itextpdf/layout/properties/UnitValue;)Lcom/itextpdf/layout/Style;
    .locals 1
    .param p1, "height"    # Lcom/itextpdf/layout/properties/UnitValue;

    .line 382
    const/16 v0, 0x1b

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/Style;->setProperty(ILjava/lang/Object;)V

    .line 383
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/Style;

    return-object v0
.end method

.method public setKeepTogether(Z)Lcom/itextpdf/layout/Style;
    .locals 2
    .param p1, "keepTogether"    # Z

    .line 317
    const/16 v0, 0x20

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/Style;->setProperty(ILjava/lang/Object;)V

    .line 318
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/Style;

    return-object v0
.end method

.method public setMargin(F)Lcom/itextpdf/layout/Style;
    .locals 1
    .param p1, "commonMargin"    # F

    .line 140
    invoke-virtual {p0, p1, p1, p1, p1}, Lcom/itextpdf/layout/Style;->setMargins(FFFF)Lcom/itextpdf/layout/Style;

    move-result-object v0

    return-object v0
.end method

.method public setMarginBottom(F)Lcom/itextpdf/layout/Style;
    .locals 2
    .param p1, "value"    # F

    .line 128
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 129
    .local v0, "marginUV":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v1, 0x2b

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/Style;->setProperty(ILjava/lang/Object;)V

    .line 130
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/layout/Style;

    return-object v1
.end method

.method public setMarginLeft(F)Lcom/itextpdf/layout/Style;
    .locals 2
    .param p1, "value"    # F

    .line 65
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 66
    .local v0, "marginUV":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v1, 0x2c

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/Style;->setProperty(ILjava/lang/Object;)V

    .line 67
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/layout/Style;

    return-object v1
.end method

.method public setMarginRight(F)Lcom/itextpdf/layout/Style;
    .locals 2
    .param p1, "value"    # F

    .line 86
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 87
    .local v0, "marginUV":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v1, 0x2d

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/Style;->setProperty(ILjava/lang/Object;)V

    .line 88
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/layout/Style;

    return-object v1
.end method

.method public setMarginTop(F)Lcom/itextpdf/layout/Style;
    .locals 2
    .param p1, "value"    # F

    .line 107
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 108
    .local v0, "marginUV":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v1, 0x2e

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/Style;->setProperty(ILjava/lang/Object;)V

    .line 109
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/layout/Style;

    return-object v1
.end method

.method public setMargins(FFFF)Lcom/itextpdf/layout/Style;
    .locals 1
    .param p1, "marginTop"    # F
    .param p2, "marginRight"    # F
    .param p3, "marginBottom"    # F
    .param p4, "marginLeft"    # F

    .line 153
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/Style;->setMarginTop(F)Lcom/itextpdf/layout/Style;

    .line 154
    invoke-virtual {p0, p2}, Lcom/itextpdf/layout/Style;->setMarginRight(F)Lcom/itextpdf/layout/Style;

    .line 155
    invoke-virtual {p0, p3}, Lcom/itextpdf/layout/Style;->setMarginBottom(F)Lcom/itextpdf/layout/Style;

    .line 156
    invoke-virtual {p0, p4}, Lcom/itextpdf/layout/Style;->setMarginLeft(F)Lcom/itextpdf/layout/Style;

    .line 157
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/Style;

    return-object v0
.end method

.method public setMaxHeight(F)Lcom/itextpdf/layout/Style;
    .locals 2
    .param p1, "maxHeight"    # F

    .line 414
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 415
    .local v0, "maxHeightAsUV":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v1, 0x54

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/Style;->setProperty(ILjava/lang/Object;)V

    .line 416
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/layout/Style;

    return-object v1
.end method

.method public setMaxHeight(Lcom/itextpdf/layout/properties/UnitValue;)Lcom/itextpdf/layout/Style;
    .locals 1
    .param p1, "maxHeight"    # Lcom/itextpdf/layout/properties/UnitValue;

    .line 426
    const/16 v0, 0x54

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/Style;->setProperty(ILjava/lang/Object;)V

    .line 427
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/Style;

    return-object v0
.end method

.method public setMaxWidth(F)Lcom/itextpdf/layout/Style;
    .locals 2
    .param p1, "maxWidth"    # F

    .line 471
    const/16 v0, 0x4f

    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/Style;->setProperty(ILjava/lang/Object;)V

    .line 472
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/Style;

    return-object v0
.end method

.method public setMaxWidth(Lcom/itextpdf/layout/properties/UnitValue;)Lcom/itextpdf/layout/Style;
    .locals 1
    .param p1, "maxWidth"    # Lcom/itextpdf/layout/properties/UnitValue;

    .line 460
    const/16 v0, 0x4f

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/Style;->setProperty(ILjava/lang/Object;)V

    .line 461
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/Style;

    return-object v0
.end method

.method public setMinHeight(F)Lcom/itextpdf/layout/Style;
    .locals 2
    .param p1, "minHeight"    # F

    .line 448
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 449
    .local v0, "minHeightAsUV":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v1, 0x55

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/Style;->setProperty(ILjava/lang/Object;)V

    .line 450
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/layout/Style;

    return-object v1
.end method

.method public setMinHeight(Lcom/itextpdf/layout/properties/UnitValue;)Lcom/itextpdf/layout/Style;
    .locals 1
    .param p1, "minHeight"    # Lcom/itextpdf/layout/properties/UnitValue;

    .line 437
    const/16 v0, 0x55

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/Style;->setProperty(ILjava/lang/Object;)V

    .line 438
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/Style;

    return-object v0
.end method

.method public setMinWidth(F)Lcom/itextpdf/layout/Style;
    .locals 2
    .param p1, "minWidth"    # F

    .line 493
    const/16 v0, 0x50

    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/Style;->setProperty(ILjava/lang/Object;)V

    .line 494
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/Style;

    return-object v0
.end method

.method public setMinWidth(Lcom/itextpdf/layout/properties/UnitValue;)Lcom/itextpdf/layout/Style;
    .locals 1
    .param p1, "minWidth"    # Lcom/itextpdf/layout/properties/UnitValue;

    .line 482
    const/16 v0, 0x50

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/Style;->setProperty(ILjava/lang/Object;)V

    .line 483
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/Style;

    return-object v0
.end method

.method public setPadding(F)Lcom/itextpdf/layout/Style;
    .locals 2
    .param p1, "commonPadding"    # F

    .line 251
    invoke-virtual {p0, p1, p1, p1, p1}, Lcom/itextpdf/layout/Style;->setPaddings(FFFF)Lcom/itextpdf/layout/Style;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lcom/itextpdf/layout/Style;

    return-object v0
.end method

.method public setPaddingBottom(F)Lcom/itextpdf/layout/Style;
    .locals 2
    .param p1, "value"    # F

    .line 239
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 240
    .local v0, "paddingUV":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v1, 0x2f

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/Style;->setProperty(ILjava/lang/Object;)V

    .line 241
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/layout/Style;

    return-object v1
.end method

.method public setPaddingLeft(F)Lcom/itextpdf/layout/Style;
    .locals 2
    .param p1, "value"    # F

    .line 176
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 177
    .local v0, "paddingUV":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v1, 0x30

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/Style;->setProperty(ILjava/lang/Object;)V

    .line 178
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/layout/Style;

    return-object v1
.end method

.method public setPaddingRight(F)Lcom/itextpdf/layout/Style;
    .locals 2
    .param p1, "value"    # F

    .line 197
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 198
    .local v0, "paddingUV":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v1, 0x31

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/Style;->setProperty(ILjava/lang/Object;)V

    .line 199
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/layout/Style;

    return-object v1
.end method

.method public setPaddingTop(F)Lcom/itextpdf/layout/Style;
    .locals 2
    .param p1, "value"    # F

    .line 218
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 219
    .local v0, "paddingUV":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v1, 0x32

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/Style;->setProperty(ILjava/lang/Object;)V

    .line 220
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/layout/Style;

    return-object v1
.end method

.method public setPaddings(FFFF)Lcom/itextpdf/layout/Style;
    .locals 1
    .param p1, "paddingTop"    # F
    .param p2, "paddingRight"    # F
    .param p3, "paddingBottom"    # F
    .param p4, "paddingLeft"    # F

    .line 264
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/Style;->setPaddingTop(F)Lcom/itextpdf/layout/Style;

    .line 265
    invoke-virtual {p0, p2}, Lcom/itextpdf/layout/Style;->setPaddingRight(F)Lcom/itextpdf/layout/Style;

    .line 266
    invoke-virtual {p0, p3}, Lcom/itextpdf/layout/Style;->setPaddingBottom(F)Lcom/itextpdf/layout/Style;

    .line 267
    invoke-virtual {p0, p4}, Lcom/itextpdf/layout/Style;->setPaddingLeft(F)Lcom/itextpdf/layout/Style;

    .line 268
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/Style;

    return-object v0
.end method

.method public setRotationAngle(D)Lcom/itextpdf/layout/Style;
    .locals 2
    .param p1, "angle"    # D

    .line 339
    double-to-float v0, p1

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    const/16 v1, 0x37

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/Style;->setProperty(ILjava/lang/Object;)V

    .line 340
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/Style;

    return-object v0
.end method

.method public setRotationAngle(F)Lcom/itextpdf/layout/Style;
    .locals 2
    .param p1, "radAngle"    # F

    .line 328
    const/16 v0, 0x37

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/Style;->setProperty(ILjava/lang/Object;)V

    .line 329
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/Style;

    return-object v0
.end method

.method public setSpacingRatio(F)Lcom/itextpdf/layout/Style;
    .locals 2
    .param p1, "ratio"    # F

    .line 295
    const/16 v0, 0x3d

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/Style;->setProperty(ILjava/lang/Object;)V

    .line 296
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/Style;

    return-object v0
.end method

.method public setVerticalAlignment(Lcom/itextpdf/layout/properties/VerticalAlignment;)Lcom/itextpdf/layout/Style;
    .locals 1
    .param p1, "verticalAlignment"    # Lcom/itextpdf/layout/properties/VerticalAlignment;

    .line 278
    const/16 v0, 0x4b

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/Style;->setProperty(ILjava/lang/Object;)V

    .line 279
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/Style;

    return-object v0
.end method

.method public setWidth(F)Lcom/itextpdf/layout/Style;
    .locals 2
    .param p1, "width"    # F

    .line 350
    const/16 v0, 0x4d

    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/Style;->setProperty(ILjava/lang/Object;)V

    .line 351
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/Style;

    return-object v0
.end method

.method public setWidth(Lcom/itextpdf/layout/properties/UnitValue;)Lcom/itextpdf/layout/Style;
    .locals 1
    .param p1, "width"    # Lcom/itextpdf/layout/properties/UnitValue;

    .line 361
    const/16 v0, 0x4d

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/Style;->setProperty(ILjava/lang/Object;)V

    .line 362
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/Style;

    return-object v0
.end method
