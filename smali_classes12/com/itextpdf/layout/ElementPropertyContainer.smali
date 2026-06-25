.class public abstract Lcom/itextpdf/layout/ElementPropertyContainer;
.super Lcom/itextpdf/commons/actions/sequence/AbstractIdentifiableElement;
.source "ElementPropertyContainer.java"

# interfaces
.implements Lcom/itextpdf/layout/IPropertyContainer;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/itextpdf/layout/IPropertyContainer;",
        ">",
        "Lcom/itextpdf/commons/actions/sequence/AbstractIdentifiableElement;",
        "Lcom/itextpdf/layout/IPropertyContainer;"
    }
.end annotation


# instance fields
.field protected properties:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 57
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    invoke-direct {p0}, Lcom/itextpdf/commons/actions/sequence/AbstractIdentifiableElement;-><init>()V

    .line 60
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/ElementPropertyContainer;->properties:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public deleteOwnProperty(I)V
    .locals 2
    .param p1, "property"    # I

    .line 79
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/layout/ElementPropertyContainer;->properties:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    return-void
.end method

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

    .line 94
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    packed-switch p1, :pswitch_data_0

    .line 105
    const/4 v0, 0x0

    return-object v0

    .line 103
    :pswitch_0
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x2b
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public getOwnProperty(I)Ljava/lang/Object;
    .locals 2
    .param p1, "property"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            ">(I)TT1;"
        }
    .end annotation

    .line 89
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/layout/ElementPropertyContainer;->properties:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getProperty(I)Ljava/lang/Object;
    .locals 1
    .param p1, "property"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            ">(I)TT1;"
        }
    .end annotation

    .line 84
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/ElementPropertyContainer;->getOwnProperty(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getSplitCharacters()Lcom/itextpdf/layout/splitting/ISplitCharacters;
    .locals 1

    .line 567
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/16 v0, 0x3e

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/ElementPropertyContainer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/splitting/ISplitCharacters;

    return-object v0
.end method

.method public getStrokeColor()Lcom/itextpdf/kernel/colors/Color;
    .locals 1

    .line 603
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/16 v0, 0x3f

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/ElementPropertyContainer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/colors/Color;

    return-object v0
.end method

.method public getStrokeWidth()Ljava/lang/Float;
    .locals 1

    .line 625
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/16 v0, 0x40

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/ElementPropertyContainer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    return-object v0
.end method

.method public getTextRenderingMode()Ljava/lang/Integer;
    .locals 1

    .line 579
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/16 v0, 0x47

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/ElementPropertyContainer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    return-object v0
.end method

.method public hasOwnProperty(I)Z
    .locals 2
    .param p1, "property"    # I

    .line 74
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/layout/ElementPropertyContainer;->properties:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public hasProperty(I)Z
    .locals 1
    .param p1, "property"    # I

    .line 69
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/ElementPropertyContainer;->hasOwnProperty(I)Z

    move-result v0

    return v0
.end method

.method public setBackgroundColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 1
    .param p1, "backgroundColor"    # Lcom/itextpdf/kernel/colors/Color;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/colors/Color;",
            ")TT;"
        }
    .end annotation

    .line 369
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/layout/ElementPropertyContainer;->setBackgroundColor(Lcom/itextpdf/kernel/colors/Color;F)Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v0

    return-object v0
.end method

.method public setBackgroundColor(Lcom/itextpdf/kernel/colors/Color;F)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 7
    .param p1, "backgroundColor"    # Lcom/itextpdf/kernel/colors/Color;
    .param p2, "opacity"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/colors/Color;",
            "F)TT;"
        }
    .end annotation

    .line 380
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    .end local p1    # "backgroundColor":Lcom/itextpdf/kernel/colors/Color;
    .end local p2    # "opacity":F
    .local v1, "backgroundColor":Lcom/itextpdf/kernel/colors/Color;
    .local v2, "opacity":F
    invoke-virtual/range {v0 .. v6}, Lcom/itextpdf/layout/ElementPropertyContainer;->setBackgroundColor(Lcom/itextpdf/kernel/colors/Color;FFFFF)Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object p1

    return-object p1
.end method

.method public setBackgroundColor(Lcom/itextpdf/kernel/colors/Color;FFFF)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 7
    .param p1, "backgroundColor"    # Lcom/itextpdf/kernel/colors/Color;
    .param p2, "extraLeft"    # F
    .param p3, "extraTop"    # F
    .param p4, "extraRight"    # F
    .param p5, "extraBottom"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/colors/Color;",
            "FFFF)TT;"
        }
    .end annotation

    .line 395
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/high16 v2, 0x3f800000    # 1.0f

    move-object v0, p0

    move-object v1, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    .end local p1    # "backgroundColor":Lcom/itextpdf/kernel/colors/Color;
    .end local p2    # "extraLeft":F
    .end local p3    # "extraTop":F
    .end local p4    # "extraRight":F
    .end local p5    # "extraBottom":F
    .local v1, "backgroundColor":Lcom/itextpdf/kernel/colors/Color;
    .local v3, "extraLeft":F
    .local v4, "extraTop":F
    .local v5, "extraRight":F
    .local v6, "extraBottom":F
    invoke-virtual/range {v0 .. v6}, Lcom/itextpdf/layout/ElementPropertyContainer;->setBackgroundColor(Lcom/itextpdf/kernel/colors/Color;FFFFF)Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object p1

    return-object p1
.end method

.method public setBackgroundColor(Lcom/itextpdf/kernel/colors/Color;FFFFF)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 7
    .param p1, "backgroundColor"    # Lcom/itextpdf/kernel/colors/Color;
    .param p2, "opacity"    # F
    .param p3, "extraLeft"    # F
    .param p4, "extraTop"    # F
    .param p5, "extraRight"    # F
    .param p6, "extraBottom"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/colors/Color;",
            "FFFFF)TT;"
        }
    .end annotation

    .line 411
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    if-eqz p1, :cond_0

    new-instance v0, Lcom/itextpdf/layout/properties/Background;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    .end local p1    # "backgroundColor":Lcom/itextpdf/kernel/colors/Color;
    .end local p2    # "opacity":F
    .end local p3    # "extraLeft":F
    .end local p4    # "extraTop":F
    .end local p5    # "extraRight":F
    .end local p6    # "extraBottom":F
    .local v1, "backgroundColor":Lcom/itextpdf/kernel/colors/Color;
    .local v2, "opacity":F
    .local v3, "extraLeft":F
    .local v4, "extraTop":F
    .local v5, "extraRight":F
    .local v6, "extraBottom":F
    invoke-direct/range {v0 .. v6}, Lcom/itextpdf/layout/properties/Background;-><init>(Lcom/itextpdf/kernel/colors/Color;FFFFF)V

    goto :goto_0

    .end local v1    # "backgroundColor":Lcom/itextpdf/kernel/colors/Color;
    .end local v2    # "opacity":F
    .end local v3    # "extraLeft":F
    .end local v4    # "extraTop":F
    .end local v5    # "extraRight":F
    .end local v6    # "extraBottom":F
    .restart local p1    # "backgroundColor":Lcom/itextpdf/kernel/colors/Color;
    .restart local p2    # "opacity":F
    .restart local p3    # "extraLeft":F
    .restart local p4    # "extraTop":F
    .restart local p5    # "extraRight":F
    .restart local p6    # "extraBottom":F
    :cond_0
    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    .end local p1    # "backgroundColor":Lcom/itextpdf/kernel/colors/Color;
    .end local p2    # "opacity":F
    .end local p3    # "extraLeft":F
    .end local p4    # "extraTop":F
    .end local p5    # "extraRight":F
    .end local p6    # "extraBottom":F
    .restart local v1    # "backgroundColor":Lcom/itextpdf/kernel/colors/Color;
    .restart local v2    # "opacity":F
    .restart local v3    # "extraLeft":F
    .restart local v4    # "extraTop":F
    .restart local v5    # "extraRight":F
    .restart local v6    # "extraBottom":F
    const/4 v0, 0x0

    :goto_0
    const/4 p1, 0x6

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 412
    move-object p1, p0

    check-cast p1, Lcom/itextpdf/layout/IPropertyContainer;

    return-object p1
.end method

.method public setBackgroundImage(Lcom/itextpdf/layout/properties/BackgroundImage;)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 2
    .param p1, "image"    # Lcom/itextpdf/layout/properties/BackgroundImage;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/properties/BackgroundImage;",
            ")TT;"
        }
    .end annotation

    .line 422
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 423
    .local v0, "backgroundImages":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/properties/BackgroundImage;>;"
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 424
    const/16 v1, 0x5a

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 425
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v1
.end method

.method public setBackgroundImage(Ljava/util/List;)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/properties/BackgroundImage;",
            ">;)TT;"
        }
    .end annotation

    .line 435
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    .local p1, "imagesList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/properties/BackgroundImage;>;"
    const/16 v0, 0x5a

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 436
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method

.method public setBaseDirection(Lcom/itextpdf/layout/properties/BaseDirection;)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 1
    .param p1, "baseDirection"    # Lcom/itextpdf/layout/properties/BaseDirection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/properties/BaseDirection;",
            ")TT;"
        }
    .end annotation

    .line 762
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/4 v0, 0x7

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 763
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method

.method public setBold()Lcom/itextpdf/layout/IPropertyContainer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 647
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 648
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method

.method public setBorder(Lcom/itextpdf/layout/borders/Border;)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 1
    .param p1, "border"    # Lcom/itextpdf/layout/borders/Border;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/borders/Border;",
            ")TT;"
        }
    .end annotation

    .line 446
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/16 v0, 0x9

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 447
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method

.method public setBorderBottom(Lcom/itextpdf/layout/borders/Border;)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 1
    .param p1, "border"    # Lcom/itextpdf/layout/borders/Border;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/borders/Border;",
            ")TT;"
        }
    .end annotation

    .line 479
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/16 v0, 0xa

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 480
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method

.method public setBorderBottomLeftRadius(Lcom/itextpdf/layout/properties/BorderRadius;)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 1
    .param p1, "borderRadius"    # Lcom/itextpdf/layout/properties/BorderRadius;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/properties/BorderRadius;",
            ")TT;"
        }
    .end annotation

    .line 512
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/16 v0, 0x71

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 513
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method

.method public setBorderBottomRightRadius(Lcom/itextpdf/layout/properties/BorderRadius;)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 1
    .param p1, "borderRadius"    # Lcom/itextpdf/layout/properties/BorderRadius;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/properties/BorderRadius;",
            ")TT;"
        }
    .end annotation

    .line 523
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/16 v0, 0x70

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 524
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method

.method public setBorderLeft(Lcom/itextpdf/layout/borders/Border;)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 1
    .param p1, "border"    # Lcom/itextpdf/layout/borders/Border;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/borders/Border;",
            ")TT;"
        }
    .end annotation

    .line 490
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/16 v0, 0xb

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 491
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method

.method public setBorderRadius(Lcom/itextpdf/layout/properties/BorderRadius;)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 1
    .param p1, "borderRadius"    # Lcom/itextpdf/layout/properties/BorderRadius;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/properties/BorderRadius;",
            ")TT;"
        }
    .end annotation

    .line 501
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/16 v0, 0x65

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 502
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method

.method public setBorderRight(Lcom/itextpdf/layout/borders/Border;)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 1
    .param p1, "border"    # Lcom/itextpdf/layout/borders/Border;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/borders/Border;",
            ")TT;"
        }
    .end annotation

    .line 468
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/16 v0, 0xc

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 469
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method

.method public setBorderTop(Lcom/itextpdf/layout/borders/Border;)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 1
    .param p1, "border"    # Lcom/itextpdf/layout/borders/Border;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/borders/Border;",
            ")TT;"
        }
    .end annotation

    .line 457
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/16 v0, 0xd

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 458
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method

.method public setBorderTopLeftRadius(Lcom/itextpdf/layout/properties/BorderRadius;)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 1
    .param p1, "borderRadius"    # Lcom/itextpdf/layout/properties/BorderRadius;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/properties/BorderRadius;",
            ")TT;"
        }
    .end annotation

    .line 534
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/16 v0, 0x6e

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 535
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method

.method public setBorderTopRightRadius(Lcom/itextpdf/layout/properties/BorderRadius;)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 1
    .param p1, "borderRadius"    # Lcom/itextpdf/layout/properties/BorderRadius;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/properties/BorderRadius;",
            ")TT;"
        }
    .end annotation

    .line 545
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/16 v0, 0x6f

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 546
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method

.method public setCharacterSpacing(F)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 2
    .param p1, "charSpacing"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation

    .line 333
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/16 v0, 0xf

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 334
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method

.method public setDestination(Ljava/lang/String;)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 1
    .param p1, "destination"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .line 796
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/16 v0, 0x11

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 797
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method

.method public setFixedPosition(FFF)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 1
    .param p1, "left"    # F
    .param p2, "bottom"    # F
    .param p3, "width"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FFF)TT;"
        }
    .end annotation

    .line 148
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    invoke-static {p3}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/itextpdf/layout/ElementPropertyContainer;->setFixedPosition(FFLcom/itextpdf/layout/properties/UnitValue;)Lcom/itextpdf/layout/IPropertyContainer;

    .line 149
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method

.method public setFixedPosition(FFLcom/itextpdf/layout/properties/UnitValue;)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 2
    .param p1, "left"    # F
    .param p2, "bottom"    # F
    .param p3, "width"    # Lcom/itextpdf/layout/properties/UnitValue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FF",
            "Lcom/itextpdf/layout/properties/UnitValue;",
            ")TT;"
        }
    .end annotation

    .line 165
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/4 v0, 0x4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/16 v1, 0x34

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 166
    const/16 v0, 0x22

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 167
    const/16 v0, 0xe

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 168
    const/16 v0, 0x4d

    invoke-virtual {p0, v0, p3}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 169
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method

.method public setFixedPosition(IFFF)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 2
    .param p1, "pageNumber"    # I
    .param p2, "left"    # F
    .param p3, "bottom"    # F
    .param p4, "width"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IFFF)TT;"
        }
    .end annotation

    .line 186
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    invoke-virtual {p0, p2, p3, p4}, Lcom/itextpdf/layout/ElementPropertyContainer;->setFixedPosition(FFF)Lcom/itextpdf/layout/IPropertyContainer;

    .line 187
    const/16 v0, 0x33

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 188
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method

.method public setFixedPosition(IFFLcom/itextpdf/layout/properties/UnitValue;)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 2
    .param p1, "pageNumber"    # I
    .param p2, "left"    # F
    .param p3, "bottom"    # F
    .param p4, "width"    # Lcom/itextpdf/layout/properties/UnitValue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IFF",
            "Lcom/itextpdf/layout/properties/UnitValue;",
            ")TT;"
        }
    .end annotation

    .line 205
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    invoke-virtual {p0, p2, p3, p4}, Lcom/itextpdf/layout/ElementPropertyContainer;->setFixedPosition(FFLcom/itextpdf/layout/properties/UnitValue;)Lcom/itextpdf/layout/IPropertyContainer;

    .line 206
    const/16 v0, 0x33

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 207
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method

.method public setFont(Lcom/itextpdf/kernel/font/PdfFont;)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 1
    .param p1, "font"    # Lcom/itextpdf/kernel/font/PdfFont;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/font/PdfFont;",
            ")TT;"
        }
    .end annotation

    .line 230
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/16 v0, 0x14

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 231
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method

.method public setFontColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 1
    .param p1, "fontColor"    # Lcom/itextpdf/kernel/colors/Color;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/colors/Color;",
            ")TT;"
        }
    .end annotation

    .line 282
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/layout/ElementPropertyContainer;->setFontColor(Lcom/itextpdf/kernel/colors/Color;F)Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v0

    return-object v0
.end method

.method public setFontColor(Lcom/itextpdf/kernel/colors/Color;F)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 2
    .param p1, "fontColor"    # Lcom/itextpdf/kernel/colors/Color;
    .param p2, "opacity"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/colors/Color;",
            "F)TT;"
        }
    .end annotation

    .line 293
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    if-eqz p1, :cond_0

    new-instance v0, Lcom/itextpdf/layout/properties/TransparentColor;

    invoke-direct {v0, p1, p2}, Lcom/itextpdf/layout/properties/TransparentColor;-><init>(Lcom/itextpdf/kernel/colors/Color;F)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const/16 v1, 0x15

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 294
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method

.method public setFontColor(Lcom/itextpdf/layout/properties/TransparentColor;)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 1
    .param p1, "transparentColor"    # Lcom/itextpdf/layout/properties/TransparentColor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/properties/TransparentColor;",
            ")TT;"
        }
    .end annotation

    .line 298
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/16 v0, 0x15

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 299
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method

.method public setFontFamily(Ljava/util/List;)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)TT;"
        }
    .end annotation

    .line 272
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    .local p1, "fontFamilyNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/ElementPropertyContainer;->setFontFamily([Ljava/lang/String;)Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v0

    return-object v0
.end method

.method public varargs setFontFamily([Ljava/lang/String;)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 1
    .param p1, "fontFamilyNames"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .line 251
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/16 v0, 0x14

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 252
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method

.method public setFontKerning(Lcom/itextpdf/layout/properties/FontKerning;)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 1
    .param p1, "fontKerning"    # Lcom/itextpdf/layout/properties/FontKerning;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/properties/FontKerning;",
            ")TT;"
        }
    .end annotation

    .line 358
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/16 v0, 0x16

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 359
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method

.method public setFontScript(Ljava/lang/Character$UnicodeScript;)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 1
    .param p1, "script"    # Ljava/lang/Character$UnicodeScript;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Character$UnicodeScript;",
            ")TT;"
        }
    .end annotation

    .line 785
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/16 v0, 0x17

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 786
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method

.method public setFontSize(F)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 2
    .param p1, "fontSize"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation

    .line 309
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 310
    .local v0, "fontSizeAsUV":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v1, 0x18

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 311
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v1
.end method

.method public setHorizontalAlignment(Lcom/itextpdf/layout/properties/HorizontalAlignment;)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 1
    .param p1, "horizontalAlignment"    # Lcom/itextpdf/layout/properties/HorizontalAlignment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/properties/HorizontalAlignment;",
            ")TT;"
        }
    .end annotation

    .line 217
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/16 v0, 0x1c

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 218
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method

.method public setHyphenation(Lcom/itextpdf/layout/hyphenation/HyphenationConfig;)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 1
    .param p1, "hyphenationConfig"    # Lcom/itextpdf/layout/hyphenation/HyphenationConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/hyphenation/HyphenationConfig;",
            ")TT;"
        }
    .end annotation

    .line 774
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/16 v0, 0x1e

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 775
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method

.method public setItalic()Lcom/itextpdf/layout/IPropertyContainer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 658
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const/16 v1, 0x1f

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 659
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method

.method public setLineThrough()Lcom/itextpdf/layout/IPropertyContainer;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 670
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const v5, 0x3e955555

    const/4 v6, 0x0

    const/4 v1, 0x0

    const/high16 v2, 0x3f400000    # 0.75f

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/itextpdf/layout/ElementPropertyContainer;->setUnderline(Lcom/itextpdf/kernel/colors/Color;FFFFI)Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v1

    return-object v1
.end method

.method public setOpacity(Ljava/lang/Float;)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 1
    .param p1, "opacity"    # Ljava/lang/Float;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Float;",
            ")TT;"
        }
    .end annotation

    .line 808
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/16 v0, 0x5c

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 809
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method

.method public setProperty(ILjava/lang/Object;)V
    .locals 2
    .param p1, "property"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .line 64
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/layout/ElementPropertyContainer;->properties:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    return-void
.end method

.method public setRelativePosition(FFFF)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 2
    .param p1, "left"    # F
    .param p2, "top"    # F
    .param p3, "right"    # F
    .param p4, "bottom"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FFFF)TT;"
        }
    .end annotation

    .line 127
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/4 v0, 0x2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/16 v1, 0x34

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 128
    const/16 v0, 0x22

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 129
    const/16 v0, 0x36

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 130
    const/16 v0, 0x49

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 131
    const/16 v0, 0xe

    invoke-static {p4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 132
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method

.method public setSplitCharacters(Lcom/itextpdf/layout/splitting/ISplitCharacters;)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 1
    .param p1, "splitCharacters"    # Lcom/itextpdf/layout/splitting/ISplitCharacters;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/splitting/ISplitCharacters;",
            ")TT;"
        }
    .end annotation

    .line 557
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/16 v0, 0x3e

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 558
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method

.method public setStrokeColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 1
    .param p1, "strokeColor"    # Lcom/itextpdf/kernel/colors/Color;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/colors/Color;",
            ")TT;"
        }
    .end annotation

    .line 614
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/16 v0, 0x3f

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 615
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method

.method public setStrokeWidth(F)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 2
    .param p1, "strokeWidth"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation

    .line 636
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/16 v0, 0x40

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 637
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method

.method public setTextAlignment(Lcom/itextpdf/layout/properties/TextAlignment;)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 1
    .param p1, "alignment"    # Lcom/itextpdf/layout/properties/TextAlignment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/properties/TextAlignment;",
            ")TT;"
        }
    .end annotation

    .line 321
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/16 v0, 0x46

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 322
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method

.method public setTextRenderingMode(I)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 2
    .param p1, "textRenderingMode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .line 592
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/16 v0, 0x47

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 593
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method

.method public setUnderline()Lcom/itextpdf/layout/IPropertyContainer;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 680
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/high16 v5, -0x42000000    # -0.125f

    const/4 v6, 0x0

    const/4 v1, 0x0

    const/high16 v2, 0x3f400000    # 0.75f

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/itextpdf/layout/ElementPropertyContainer;->setUnderline(Lcom/itextpdf/kernel/colors/Color;FFFFI)Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v1

    return-object v1
.end method

.method public setUnderline(FF)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 7
    .param p1, "thickness"    # F
    .param p2, "yPosition"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FF)TT;"
        }
    .end annotation

    .line 693
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v1, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move v2, p1

    move v4, p2

    .end local p1    # "thickness":F
    .end local p2    # "yPosition":F
    .local v2, "thickness":F
    .local v4, "yPosition":F
    invoke-virtual/range {v0 .. v6}, Lcom/itextpdf/layout/ElementPropertyContainer;->setUnderline(Lcom/itextpdf/kernel/colors/Color;FFFFI)Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object p1

    return-object p1
.end method

.method public setUnderline(Lcom/itextpdf/kernel/colors/Color;FFFFFI)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 8
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/Color;
    .param p2, "opacity"    # F
    .param p3, "thickness"    # F
    .param p4, "thicknessMul"    # F
    .param p5, "yPosition"    # F
    .param p6, "yPositionMul"    # F
    .param p7, "lineCapStyle"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/colors/Color;",
            "FFFFFI)TT;"
        }
    .end annotation

    .line 738
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    new-instance v0, Lcom/itextpdf/layout/properties/Underline;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    move v7, p7

    .end local p1    # "color":Lcom/itextpdf/kernel/colors/Color;
    .end local p2    # "opacity":F
    .end local p3    # "thickness":F
    .end local p4    # "thicknessMul":F
    .end local p5    # "yPosition":F
    .end local p6    # "yPositionMul":F
    .end local p7    # "lineCapStyle":I
    .local v1, "color":Lcom/itextpdf/kernel/colors/Color;
    .local v2, "opacity":F
    .local v3, "thickness":F
    .local v4, "thicknessMul":F
    .local v5, "yPosition":F
    .local v6, "yPositionMul":F
    .local v7, "lineCapStyle":I
    invoke-direct/range {v0 .. v7}, Lcom/itextpdf/layout/properties/Underline;-><init>(Lcom/itextpdf/kernel/colors/Color;FFFFFI)V

    .line 739
    .local v0, "newUnderline":Lcom/itextpdf/layout/properties/Underline;
    const/16 p1, 0x4a

    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/ElementPropertyContainer;->getProperty(I)Ljava/lang/Object;

    move-result-object p2

    .line 740
    .local p2, "currentProperty":Ljava/lang/Object;
    instance-of p3, p2, Ljava/util/List;

    if-eqz p3, :cond_0

    .line 741
    move-object p1, p2

    check-cast p1, Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 742
    :cond_0
    instance-of p3, p2, Lcom/itextpdf/layout/properties/Underline;

    if-eqz p3, :cond_1

    .line 743
    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 744
    .local p3, "mergedUnderlines":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/properties/Underline;>;"
    move-object p4, p2

    check-cast p4, Lcom/itextpdf/layout/properties/Underline;

    invoke-interface {p3, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 745
    invoke-interface {p3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 746
    invoke-virtual {p0, p1, p3}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 747
    .end local p3    # "mergedUnderlines":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/properties/Underline;>;"
    goto :goto_0

    .line 748
    :cond_1
    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 750
    :goto_0
    move-object p1, p0

    check-cast p1, Lcom/itextpdf/layout/IPropertyContainer;

    return-object p1
.end method

.method public setUnderline(Lcom/itextpdf/kernel/colors/Color;FFFFI)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 8
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/Color;
    .param p2, "thickness"    # F
    .param p3, "thicknessMul"    # F
    .param p4, "yPosition"    # F
    .param p5, "yPositionMul"    # F
    .param p6, "lineCapStyle"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/colors/Color;",
            "FFFFI)TT;"
        }
    .end annotation

    .line 715
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/high16 v2, 0x3f800000    # 1.0f

    move-object v0, p0

    move-object v1, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    .end local p1    # "color":Lcom/itextpdf/kernel/colors/Color;
    .end local p2    # "thickness":F
    .end local p3    # "thicknessMul":F
    .end local p4    # "yPosition":F
    .end local p5    # "yPositionMul":F
    .end local p6    # "lineCapStyle":I
    .local v1, "color":Lcom/itextpdf/kernel/colors/Color;
    .local v3, "thickness":F
    .local v4, "thicknessMul":F
    .local v5, "yPosition":F
    .local v6, "yPositionMul":F
    .local v7, "lineCapStyle":I
    invoke-virtual/range {v0 .. v7}, Lcom/itextpdf/layout/ElementPropertyContainer;->setUnderline(Lcom/itextpdf/kernel/colors/Color;FFFFFI)Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object p1

    return-object p1
.end method

.method public setWordSpacing(F)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 2
    .param p1, "wordSpacing"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation

    .line 345
    .local p0, "this":Lcom/itextpdf/layout/ElementPropertyContainer;, "Lcom/itextpdf/layout/ElementPropertyContainer<TT;>;"
    const/16 v0, 0x4e

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/ElementPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 346
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method
