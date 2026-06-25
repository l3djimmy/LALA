.class public abstract Lcom/itextpdf/layout/element/BlockElement;
.super Lcom/itextpdf/layout/element/AbstractElement;
.source "BlockElement.java"

# interfaces
.implements Lcom/itextpdf/layout/tagging/IAccessibleElement;
.implements Lcom/itextpdf/layout/element/IBlockElement;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/itextpdf/layout/element/IElement;",
        ">",
        "Lcom/itextpdf/layout/element/AbstractElement<",
        "TT;>;",
        "Lcom/itextpdf/layout/tagging/IAccessibleElement;",
        "Lcom/itextpdf/layout/element/IBlockElement;"
    }
.end annotation


# direct methods
.method protected constructor <init>()V
    .locals 0

    .line 45
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    invoke-direct {p0}, Lcom/itextpdf/layout/element/AbstractElement;-><init>()V

    .line 46
    return-void
.end method


# virtual methods
.method public getDefaultProperty(I)Ljava/lang/Object;
    .locals 1
    .param p1, "property"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            ">(I)TT1;"
        }
    .end annotation

    .line 50
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    packed-switch p1, :pswitch_data_0

    .line 55
    invoke-super {p0, p1}, Lcom/itextpdf/layout/element/AbstractElement;->getDefaultProperty(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 53
    :pswitch_0
    sget-object v0, Lcom/itextpdf/layout/properties/OverflowPropertyValue;->FIT:Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x67
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public getHeight()Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1

    .line 437
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    const/16 v0, 0x1b

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/BlockElement;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    return-object v0
.end method

.method public getMarginBottom()Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1

    .line 128
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    const/16 v0, 0x2b

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/BlockElement;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    return-object v0
.end method

.method public getMarginLeft()Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1

    .line 65
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    const/16 v0, 0x2c

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/BlockElement;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    return-object v0
.end method

.method public getMarginRight()Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1

    .line 86
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    const/16 v0, 0x2d

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/BlockElement;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    return-object v0
.end method

.method public getMarginTop()Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1

    .line 107
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    const/16 v0, 0x2e

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/BlockElement;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    return-object v0
.end method

.method public getPaddingBottom()Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1

    .line 239
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    const/16 v0, 0x2f

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/BlockElement;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    return-object v0
.end method

.method public getPaddingLeft()Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1

    .line 176
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    const/16 v0, 0x30

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/BlockElement;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    return-object v0
.end method

.method public getPaddingRight()Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1

    .line 197
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    const/16 v0, 0x31

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/BlockElement;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    return-object v0
.end method

.method public getPaddingTop()Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1

    .line 218
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    const/16 v0, 0x32

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/BlockElement;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    return-object v0
.end method

.method public getWidth()Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1

    .line 405
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    const/16 v0, 0x4d

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/BlockElement;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    return-object v0
.end method

.method public isKeepTogether()Ljava/lang/Boolean;
    .locals 1

    .line 316
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    const/16 v0, 0x20

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/BlockElement;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    return-object v0
.end method

.method public isKeepWithNext()Ljava/lang/Boolean;
    .locals 1

    .line 338
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    const/16 v0, 0x51

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/BlockElement;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    return-object v0
.end method

.method public setHeight(F)Lcom/itextpdf/layout/element/IElement;
    .locals 2
    .param p1, "height"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation

    .line 426
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 427
    .local v0, "heightAsUV":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v1, 0x1b

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/element/BlockElement;->setProperty(ILjava/lang/Object;)V

    .line 428
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/layout/element/IElement;

    return-object v1
.end method

.method public setHeight(Lcom/itextpdf/layout/properties/UnitValue;)Lcom/itextpdf/layout/element/IElement;
    .locals 1
    .param p1, "height"    # Lcom/itextpdf/layout/properties/UnitValue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/properties/UnitValue;",
            ")TT;"
        }
    .end annotation

    .line 415
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    const/16 v0, 0x1b

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/element/BlockElement;->setProperty(ILjava/lang/Object;)V

    .line 416
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/element/IElement;

    return-object v0
.end method

.method public setKeepTogether(Z)Lcom/itextpdf/layout/element/IElement;
    .locals 2
    .param p1, "keepTogether"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TT;"
        }
    .end annotation

    .line 327
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    const/16 v0, 0x20

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/element/BlockElement;->setProperty(ILjava/lang/Object;)V

    .line 328
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/element/IElement;

    return-object v0
.end method

.method public setKeepWithNext(Z)Lcom/itextpdf/layout/element/IElement;
    .locals 2
    .param p1, "keepWithNext"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TT;"
        }
    .end annotation

    .line 350
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    const/16 v0, 0x51

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/element/BlockElement;->setProperty(ILjava/lang/Object;)V

    .line 351
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/element/IElement;

    return-object v0
.end method

.method public setMargin(F)Lcom/itextpdf/layout/element/IElement;
    .locals 1
    .param p1, "commonMargin"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation

    .line 150
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    invoke-virtual {p0, p1, p1, p1, p1}, Lcom/itextpdf/layout/element/BlockElement;->setMargins(FFFF)Lcom/itextpdf/layout/element/IElement;

    move-result-object v0

    return-object v0
.end method

.method public setMarginBottom(F)Lcom/itextpdf/layout/element/IElement;
    .locals 2
    .param p1, "value"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation

    .line 138
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 139
    .local v0, "marginUV":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v1, 0x2b

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/element/BlockElement;->setProperty(ILjava/lang/Object;)V

    .line 140
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/layout/element/IElement;

    return-object v1
.end method

.method public setMarginLeft(F)Lcom/itextpdf/layout/element/IElement;
    .locals 2
    .param p1, "value"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation

    .line 75
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 76
    .local v0, "marginUV":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v1, 0x2c

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/element/BlockElement;->setProperty(ILjava/lang/Object;)V

    .line 77
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/layout/element/IElement;

    return-object v1
.end method

.method public setMarginRight(F)Lcom/itextpdf/layout/element/IElement;
    .locals 2
    .param p1, "value"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation

    .line 96
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 97
    .local v0, "marginUV":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v1, 0x2d

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/element/BlockElement;->setProperty(ILjava/lang/Object;)V

    .line 98
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/layout/element/IElement;

    return-object v1
.end method

.method public setMarginTop(F)Lcom/itextpdf/layout/element/IElement;
    .locals 2
    .param p1, "value"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation

    .line 117
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 118
    .local v0, "marginUV":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v1, 0x2e

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/element/BlockElement;->setProperty(ILjava/lang/Object;)V

    .line 119
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/layout/element/IElement;

    return-object v1
.end method

.method public setMargins(FFFF)Lcom/itextpdf/layout/element/IElement;
    .locals 1
    .param p1, "marginTop"    # F
    .param p2, "marginRight"    # F
    .param p3, "marginBottom"    # F
    .param p4, "marginLeft"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FFFF)TT;"
        }
    .end annotation

    .line 163
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/element/BlockElement;->setMarginTop(F)Lcom/itextpdf/layout/element/IElement;

    .line 164
    invoke-virtual {p0, p2}, Lcom/itextpdf/layout/element/BlockElement;->setMarginRight(F)Lcom/itextpdf/layout/element/IElement;

    .line 165
    invoke-virtual {p0, p3}, Lcom/itextpdf/layout/element/BlockElement;->setMarginBottom(F)Lcom/itextpdf/layout/element/IElement;

    .line 166
    invoke-virtual {p0, p4}, Lcom/itextpdf/layout/element/BlockElement;->setMarginLeft(F)Lcom/itextpdf/layout/element/IElement;

    .line 167
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/element/IElement;

    return-object v0
.end method

.method public setMaxHeight(F)Lcom/itextpdf/layout/element/IElement;
    .locals 2
    .param p1, "maxHeight"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation

    .line 447
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 448
    .local v0, "maxHeightAsUV":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v1, 0x54

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/element/BlockElement;->setProperty(ILjava/lang/Object;)V

    .line 449
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/layout/element/IElement;

    return-object v1
.end method

.method public setMaxHeight(Lcom/itextpdf/layout/properties/UnitValue;)Lcom/itextpdf/layout/element/IElement;
    .locals 1
    .param p1, "maxHeight"    # Lcom/itextpdf/layout/properties/UnitValue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/properties/UnitValue;",
            ")TT;"
        }
    .end annotation

    .line 459
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    const/16 v0, 0x54

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/element/BlockElement;->setProperty(ILjava/lang/Object;)V

    .line 460
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/element/IElement;

    return-object v0
.end method

.method public setMaxWidth(F)Lcom/itextpdf/layout/element/IElement;
    .locals 2
    .param p1, "maxWidth"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation

    .line 504
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    const/16 v0, 0x4f

    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/element/BlockElement;->setProperty(ILjava/lang/Object;)V

    .line 505
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/element/IElement;

    return-object v0
.end method

.method public setMaxWidth(Lcom/itextpdf/layout/properties/UnitValue;)Lcom/itextpdf/layout/element/IElement;
    .locals 1
    .param p1, "maxWidth"    # Lcom/itextpdf/layout/properties/UnitValue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/properties/UnitValue;",
            ")TT;"
        }
    .end annotation

    .line 493
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    const/16 v0, 0x4f

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/element/BlockElement;->setProperty(ILjava/lang/Object;)V

    .line 494
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/element/IElement;

    return-object v0
.end method

.method public setMinHeight(F)Lcom/itextpdf/layout/element/IElement;
    .locals 2
    .param p1, "minHeight"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation

    .line 481
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 482
    .local v0, "minHeightAsUV":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v1, 0x55

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/element/BlockElement;->setProperty(ILjava/lang/Object;)V

    .line 483
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/layout/element/IElement;

    return-object v1
.end method

.method public setMinHeight(Lcom/itextpdf/layout/properties/UnitValue;)Lcom/itextpdf/layout/element/IElement;
    .locals 1
    .param p1, "minHeight"    # Lcom/itextpdf/layout/properties/UnitValue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/properties/UnitValue;",
            ")TT;"
        }
    .end annotation

    .line 470
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    const/16 v0, 0x55

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/element/BlockElement;->setProperty(ILjava/lang/Object;)V

    .line 471
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/element/IElement;

    return-object v0
.end method

.method public setMinWidth(F)Lcom/itextpdf/layout/element/IElement;
    .locals 2
    .param p1, "minWidth"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation

    .line 526
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    const/16 v0, 0x50

    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/element/BlockElement;->setProperty(ILjava/lang/Object;)V

    .line 527
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/element/IElement;

    return-object v0
.end method

.method public setMinWidth(Lcom/itextpdf/layout/properties/UnitValue;)Lcom/itextpdf/layout/element/IElement;
    .locals 1
    .param p1, "minWidth"    # Lcom/itextpdf/layout/properties/UnitValue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/properties/UnitValue;",
            ")TT;"
        }
    .end annotation

    .line 515
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    const/16 v0, 0x50

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/element/BlockElement;->setProperty(ILjava/lang/Object;)V

    .line 516
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/element/IElement;

    return-object v0
.end method

.method public setNeutralRole()Lcom/itextpdf/layout/element/IElement;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 536
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    invoke-virtual {p0}, Lcom/itextpdf/layout/element/BlockElement;->getAccessibilityProperties()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->setRole(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    .line 538
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/element/IElement;

    return-object v0
.end method

.method public setPadding(F)Lcom/itextpdf/layout/element/IElement;
    .locals 1
    .param p1, "commonPadding"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation

    .line 261
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    invoke-virtual {p0, p1, p1, p1, p1}, Lcom/itextpdf/layout/element/BlockElement;->setPaddings(FFFF)Lcom/itextpdf/layout/element/IElement;

    move-result-object v0

    return-object v0
.end method

.method public setPaddingBottom(F)Lcom/itextpdf/layout/element/IElement;
    .locals 2
    .param p1, "value"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation

    .line 249
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 250
    .local v0, "paddingUV":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v1, 0x2f

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/element/BlockElement;->setProperty(ILjava/lang/Object;)V

    .line 251
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/layout/element/IElement;

    return-object v1
.end method

.method public setPaddingLeft(F)Lcom/itextpdf/layout/element/IElement;
    .locals 2
    .param p1, "value"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation

    .line 186
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 187
    .local v0, "paddingUV":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v1, 0x30

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/element/BlockElement;->setProperty(ILjava/lang/Object;)V

    .line 188
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/layout/element/IElement;

    return-object v1
.end method

.method public setPaddingRight(F)Lcom/itextpdf/layout/element/IElement;
    .locals 2
    .param p1, "value"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation

    .line 207
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 208
    .local v0, "paddingUV":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v1, 0x31

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/element/BlockElement;->setProperty(ILjava/lang/Object;)V

    .line 209
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/layout/element/IElement;

    return-object v1
.end method

.method public setPaddingTop(F)Lcom/itextpdf/layout/element/IElement;
    .locals 2
    .param p1, "value"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation

    .line 228
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 229
    .local v0, "paddingUV":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v1, 0x32

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/element/BlockElement;->setProperty(ILjava/lang/Object;)V

    .line 230
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/layout/element/IElement;

    return-object v1
.end method

.method public setPaddings(FFFF)Lcom/itextpdf/layout/element/IElement;
    .locals 1
    .param p1, "paddingTop"    # F
    .param p2, "paddingRight"    # F
    .param p3, "paddingBottom"    # F
    .param p4, "paddingLeft"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FFFF)TT;"
        }
    .end annotation

    .line 274
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/element/BlockElement;->setPaddingTop(F)Lcom/itextpdf/layout/element/IElement;

    .line 275
    invoke-virtual {p0, p2}, Lcom/itextpdf/layout/element/BlockElement;->setPaddingRight(F)Lcom/itextpdf/layout/element/IElement;

    .line 276
    invoke-virtual {p0, p3}, Lcom/itextpdf/layout/element/BlockElement;->setPaddingBottom(F)Lcom/itextpdf/layout/element/IElement;

    .line 277
    invoke-virtual {p0, p4}, Lcom/itextpdf/layout/element/BlockElement;->setPaddingLeft(F)Lcom/itextpdf/layout/element/IElement;

    .line 278
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/element/IElement;

    return-object v0
.end method

.method public setRotationAngle(D)Lcom/itextpdf/layout/element/IElement;
    .locals 2
    .param p1, "angleInRadians"    # D
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(D)TT;"
        }
    .end annotation

    .line 372
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    double-to-float v0, p1

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    const/16 v1, 0x37

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/element/BlockElement;->setProperty(ILjava/lang/Object;)V

    .line 373
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/element/IElement;

    return-object v0
.end method

.method public setRotationAngle(F)Lcom/itextpdf/layout/element/IElement;
    .locals 2
    .param p1, "angleInRadians"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation

    .line 361
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    const/16 v0, 0x37

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/element/BlockElement;->setProperty(ILjava/lang/Object;)V

    .line 362
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/element/IElement;

    return-object v0
.end method

.method public setSpacingRatio(F)Lcom/itextpdf/layout/element/IElement;
    .locals 2
    .param p1, "ratio"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation

    .line 305
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    const/16 v0, 0x3d

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/element/BlockElement;->setProperty(ILjava/lang/Object;)V

    .line 306
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/element/IElement;

    return-object v0
.end method

.method public setVerticalAlignment(Lcom/itextpdf/layout/properties/VerticalAlignment;)Lcom/itextpdf/layout/element/IElement;
    .locals 1
    .param p1, "verticalAlignment"    # Lcom/itextpdf/layout/properties/VerticalAlignment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/properties/VerticalAlignment;",
            ")TT;"
        }
    .end annotation

    .line 288
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    const/16 v0, 0x4b

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/element/BlockElement;->setProperty(ILjava/lang/Object;)V

    .line 289
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/element/IElement;

    return-object v0
.end method

.method public setWidth(F)Lcom/itextpdf/layout/element/IElement;
    .locals 2
    .param p1, "width"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation

    .line 383
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    const/16 v0, 0x4d

    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/element/BlockElement;->setProperty(ILjava/lang/Object;)V

    .line 384
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/element/IElement;

    return-object v0
.end method

.method public setWidth(Lcom/itextpdf/layout/properties/UnitValue;)Lcom/itextpdf/layout/element/IElement;
    .locals 1
    .param p1, "width"    # Lcom/itextpdf/layout/properties/UnitValue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/properties/UnitValue;",
            ")TT;"
        }
    .end annotation

    .line 394
    .local p0, "this":Lcom/itextpdf/layout/element/BlockElement;, "Lcom/itextpdf/layout/element/BlockElement<TT;>;"
    const/16 v0, 0x4d

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/element/BlockElement;->setProperty(ILjava/lang/Object;)V

    .line 395
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/element/IElement;

    return-object v0
.end method
