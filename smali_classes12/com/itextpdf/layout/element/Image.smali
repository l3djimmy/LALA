.class public Lcom/itextpdf/layout/element/Image;
.super Lcom/itextpdf/layout/element/AbstractElement;
.source "Image.java"

# interfaces
.implements Lcom/itextpdf/layout/element/ILeafElement;
.implements Lcom/itextpdf/layout/tagging/IAccessibleElement;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/layout/element/AbstractElement<",
        "Lcom/itextpdf/layout/element/Image;",
        ">;",
        "Lcom/itextpdf/layout/element/ILeafElement;",
        "Lcom/itextpdf/layout/tagging/IAccessibleElement;"
    }
.end annotation


# instance fields
.field protected tagProperties:Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;

.field protected xObject:Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;


# direct methods
.method public constructor <init>(Lcom/itextpdf/io/image/ImageData;)V
    .locals 2
    .param p1, "img"    # Lcom/itextpdf/io/image/ImageData;

    .line 141
    new-instance v0, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;

    invoke-static {p1}, Lcom/itextpdf/layout/element/Image;->checkImageType(Lcom/itextpdf/io/image/ImageData;)Lcom/itextpdf/io/image/ImageData;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;-><init>(Lcom/itextpdf/io/image/ImageData;)V

    invoke-direct {p0, v0}, Lcom/itextpdf/layout/element/Image;-><init>(Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;)V

    .line 142
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const/16 v1, 0x13

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 143
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/io/image/ImageData;FF)V
    .locals 2
    .param p1, "img"    # Lcom/itextpdf/io/image/ImageData;
    .param p2, "left"    # F
    .param p3, "bottom"    # F

    .line 154
    new-instance v0, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;

    invoke-static {p1}, Lcom/itextpdf/layout/element/Image;->checkImageType(Lcom/itextpdf/io/image/ImageData;)Lcom/itextpdf/io/image/ImageData;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;-><init>(Lcom/itextpdf/io/image/ImageData;)V

    invoke-direct {p0, v0, p2, p3}, Lcom/itextpdf/layout/element/Image;-><init>(Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;FF)V

    .line 155
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const/16 v1, 0x13

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 156
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/io/image/ImageData;FFF)V
    .locals 2
    .param p1, "img"    # Lcom/itextpdf/io/image/ImageData;
    .param p2, "left"    # F
    .param p3, "bottom"    # F
    .param p4, "width"    # F

    .line 168
    new-instance v0, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;

    invoke-static {p1}, Lcom/itextpdf/layout/element/Image;->checkImageType(Lcom/itextpdf/io/image/ImageData;)Lcom/itextpdf/io/image/ImageData;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;-><init>(Lcom/itextpdf/io/image/ImageData;)V

    invoke-direct {p0, v0, p2, p3, p4}, Lcom/itextpdf/layout/element/Image;-><init>(Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;FFF)V

    .line 169
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const/16 v1, 0x13

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 170
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;)V
    .locals 0
    .param p1, "xObject"    # Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;

    .line 71
    invoke-direct {p0}, Lcom/itextpdf/layout/element/AbstractElement;-><init>()V

    .line 72
    iput-object p1, p0, Lcom/itextpdf/layout/element/Image;->xObject:Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    .line 73
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;FF)V
    .locals 2
    .param p1, "xObject"    # Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;
    .param p2, "left"    # F
    .param p3, "bottom"    # F

    .line 127
    invoke-direct {p0}, Lcom/itextpdf/layout/element/AbstractElement;-><init>()V

    .line 128
    iput-object p1, p0, Lcom/itextpdf/layout/element/Image;->xObject:Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    .line 129
    const/16 v0, 0x22

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 130
    const/16 v0, 0xe

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 131
    const/4 v0, 0x4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/16 v1, 0x34

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 132
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;)V
    .locals 0
    .param p1, "xObject"    # Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;

    .line 61
    invoke-direct {p0}, Lcom/itextpdf/layout/element/AbstractElement;-><init>()V

    .line 62
    iput-object p1, p0, Lcom/itextpdf/layout/element/Image;->xObject:Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    .line 63
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;F)V
    .locals 0
    .param p1, "xObject"    # Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;
    .param p2, "width"    # F

    .line 82
    invoke-direct {p0}, Lcom/itextpdf/layout/element/AbstractElement;-><init>()V

    .line 83
    iput-object p1, p0, Lcom/itextpdf/layout/element/Image;->xObject:Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    .line 84
    invoke-virtual {p0, p2}, Lcom/itextpdf/layout/element/Image;->setWidth(F)Lcom/itextpdf/layout/element/Image;

    .line 85
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;FF)V
    .locals 2
    .param p1, "xObject"    # Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;
    .param p2, "left"    # F
    .param p3, "bottom"    # F

    .line 112
    invoke-direct {p0}, Lcom/itextpdf/layout/element/AbstractElement;-><init>()V

    .line 113
    iput-object p1, p0, Lcom/itextpdf/layout/element/Image;->xObject:Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    .line 114
    const/16 v0, 0x22

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 115
    const/16 v0, 0xe

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 116
    const/4 v0, 0x4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/16 v1, 0x34

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 117
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;FFF)V
    .locals 2
    .param p1, "xObject"    # Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;
    .param p2, "left"    # F
    .param p3, "bottom"    # F
    .param p4, "width"    # F

    .line 96
    invoke-direct {p0}, Lcom/itextpdf/layout/element/AbstractElement;-><init>()V

    .line 97
    iput-object p1, p0, Lcom/itextpdf/layout/element/Image;->xObject:Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    .line 98
    const/16 v0, 0x22

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 99
    const/16 v0, 0xe

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 100
    invoke-virtual {p0, p4}, Lcom/itextpdf/layout/element/Image;->setWidth(F)Lcom/itextpdf/layout/element/Image;

    .line 101
    const/4 v0, 0x4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/16 v1, 0x34

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 102
    return-void
.end method

.method private static checkImageType(Lcom/itextpdf/io/image/ImageData;)Lcom/itextpdf/io/image/ImageData;
    .locals 2
    .param p0, "image"    # Lcom/itextpdf/io/image/ImageData;

    .line 762
    instance-of v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/WmfImageData;

    if-nez v0, :cond_0

    .line 765
    return-object p0

    .line 763
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Cannot create layout image by WmfImage instance. First convert the image into FormXObject and then use the corresponding layout image constructor."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public getAccessibilityProperties()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 2

    .line 740
    iget-object v0, p0, Lcom/itextpdf/layout/element/Image;->tagProperties:Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;

    if-nez v0, :cond_0

    .line 741
    new-instance v0, Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;

    const-string v1, "Figure"

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/itextpdf/layout/element/Image;->tagProperties:Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;

    .line 743
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/element/Image;->tagProperties:Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;

    return-object v0
.end method

.method public getImageHeight()F
    .locals 1

    .line 540
    iget-object v0, p0, Lcom/itextpdf/layout/element/Image;->xObject:Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;->getHeight()F

    move-result v0

    return v0
.end method

.method public getImageScaledHeight()F
    .locals 3

    .line 708
    const/16 v0, 0x4c

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/Image;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    .line 709
    iget-object v2, p0, Lcom/itextpdf/layout/element/Image;->xObject:Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    .line 708
    if-nez v1, :cond_0

    .line 709
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;->getHeight()F

    move-result v0

    goto :goto_0

    :cond_0
    nop

    .line 710
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;->getHeight()F

    move-result v1

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/Image;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    mul-float/2addr v0, v1

    .line 708
    :goto_0
    return v0
.end method

.method public getImageScaledWidth()F
    .locals 3

    .line 697
    const/16 v0, 0x1d

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/Image;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    .line 698
    iget-object v2, p0, Lcom/itextpdf/layout/element/Image;->xObject:Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    .line 697
    if-nez v1, :cond_0

    .line 698
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;->getWidth()F

    move-result v0

    goto :goto_0

    :cond_0
    nop

    .line 699
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;->getWidth()F

    move-result v1

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/Image;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    mul-float/2addr v0, v1

    .line 697
    :goto_0
    return v0
.end method

.method public getImageWidth()F
    .locals 1

    .line 530
    iget-object v0, p0, Lcom/itextpdf/layout/element/Image;->xObject:Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;->getWidth()F

    move-result v0

    return v0
.end method

.method public getMarginBottom()Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1

    .line 261
    const/16 v0, 0x2b

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/Image;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    return-object v0
.end method

.method public getMarginLeft()Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1

    .line 198
    const/16 v0, 0x2c

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/Image;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    return-object v0
.end method

.method public getMarginRight()Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1

    .line 219
    const/16 v0, 0x2d

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/Image;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    return-object v0
.end method

.method public getMarginTop()Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1

    .line 240
    const/16 v0, 0x2e

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/Image;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    return-object v0
.end method

.method public getObjectFit()Lcom/itextpdf/layout/properties/ObjectFit;
    .locals 2

    .line 731
    const/16 v0, 0x7d

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/Image;->hasProperty(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 732
    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/Image;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/ObjectFit;

    return-object v0

    .line 734
    :cond_0
    sget-object v0, Lcom/itextpdf/layout/properties/ObjectFit;->FILL:Lcom/itextpdf/layout/properties/ObjectFit;

    return-object v0
.end method

.method public getPaddingBottom()Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1

    .line 358
    const/16 v0, 0x2f

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/Image;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    return-object v0
.end method

.method public getPaddingLeft()Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1

    .line 295
    const/16 v0, 0x30

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/Image;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    return-object v0
.end method

.method public getPaddingRight()Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1

    .line 316
    const/16 v0, 0x31

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/Image;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    return-object v0
.end method

.method public getPaddingTop()Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1

    .line 337
    const/16 v0, 0x32

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/Image;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    return-object v0
.end method

.method public getWidth()Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1

    .line 687
    const/16 v0, 0x4d

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/Image;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    return-object v0
.end method

.method public getXObject()Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;
    .locals 1

    .line 178
    iget-object v0, p0, Lcom/itextpdf/layout/element/Image;->xObject:Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    return-object v0
.end method

.method protected makeNewRenderer()Lcom/itextpdf/layout/renderer/IRenderer;
    .locals 1

    .line 758
    new-instance v0, Lcom/itextpdf/layout/renderer/ImageRenderer;

    invoke-direct {v0, p0}, Lcom/itextpdf/layout/renderer/ImageRenderer;-><init>(Lcom/itextpdf/layout/element/Image;)V

    return-object v0
.end method

.method public scale(FF)Lcom/itextpdf/layout/element/Image;
    .locals 2
    .param p1, "horizontalScaling"    # F
    .param p2, "verticalScaling"    # F

    .line 409
    const/16 v0, 0x1d

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 410
    const/16 v0, 0x4c

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 411
    return-object p0
.end method

.method public scaleAbsolute(FF)Lcom/itextpdf/layout/element/Image;
    .locals 3
    .param p1, "fitWidth"    # F
    .param p2, "fitHeight"    # F

    .line 437
    iget-object v0, p0, Lcom/itextpdf/layout/element/Image;->xObject:Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;->getWidth()F

    move-result v0

    div-float v0, p1, v0

    .line 438
    .local v0, "horizontalScaling":F
    iget-object v1, p0, Lcom/itextpdf/layout/element/Image;->xObject:Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;->getHeight()F

    move-result v1

    div-float v1, p2, v1

    .line 439
    .local v1, "verticalScaling":F
    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/element/Image;->scale(FF)Lcom/itextpdf/layout/element/Image;

    move-result-object v2

    return-object v2
.end method

.method public scaleToFit(FF)Lcom/itextpdf/layout/element/Image;
    .locals 4
    .param p1, "fitWidth"    # F
    .param p2, "fitHeight"    # F

    .line 423
    iget-object v0, p0, Lcom/itextpdf/layout/element/Image;->xObject:Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;->getWidth()F

    move-result v0

    div-float v0, p1, v0

    .line 424
    .local v0, "horizontalScaling":F
    iget-object v1, p0, Lcom/itextpdf/layout/element/Image;->xObject:Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;->getHeight()F

    move-result v1

    div-float v1, p2, v1

    .line 425
    .local v1, "verticalScaling":F
    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v2

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v3

    invoke-virtual {p0, v2, v3}, Lcom/itextpdf/layout/element/Image;->scale(FF)Lcom/itextpdf/layout/element/Image;

    move-result-object v2

    return-object v2
.end method

.method public setAutoScale(Z)Lcom/itextpdf/layout/element/Image;
    .locals 3
    .param p1, "autoScale"    # Z

    .line 449
    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/Image;->hasProperty(I)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x4

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/element/Image;->hasProperty(I)Z

    move-result v2

    if-eqz v2, :cond_1

    if-eqz p1, :cond_1

    .line 450
    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/Image;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    .line 451
    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/element/Image;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 452
    :cond_0
    const-class v0, Lcom/itextpdf/layout/element/Image;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 453
    .local v0, "logger":Lorg/slf4j/Logger;
    const-string v1, "The image cannot be auto scaled and scaled by a certain parameter simultaneously"

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 455
    .end local v0    # "logger":Lorg/slf4j/Logger;
    :cond_1
    const/4 v0, 0x3

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 456
    return-object p0
.end method

.method public setAutoScaleHeight(Z)Lcom/itextpdf/layout/element/Image;
    .locals 3
    .param p1, "autoScale"    # Z

    .line 467
    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/Image;->hasProperty(I)Z

    move-result v1

    if-eqz v1, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/Image;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 468
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 469
    const/4 v0, 0x4

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 470
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    goto :goto_0

    .line 472
    :cond_0
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 474
    :goto_0
    return-object p0
.end method

.method public setAutoScaleWidth(Z)Lcom/itextpdf/layout/element/Image;
    .locals 4
    .param p1, "autoScale"    # Z

    .line 484
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/Image;->hasProperty(I)Z

    move-result v1

    const/4 v2, 0x5

    if-eqz v1, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/Image;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 485
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 486
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 487
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    goto :goto_0

    .line 489
    :cond_0
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0, v2, v0}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 491
    :goto_0
    return-object p0
.end method

.method public setFixedPosition(FF)Lcom/itextpdf/layout/element/Image;
    .locals 1
    .param p1, "left"    # F
    .param p2, "bottom"    # F

    .line 504
    invoke-virtual {p0}, Lcom/itextpdf/layout/element/Image;->getWidth()Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/itextpdf/layout/element/Image;->setFixedPosition(FFLcom/itextpdf/layout/properties/UnitValue;)Lcom/itextpdf/layout/IPropertyContainer;

    .line 505
    return-object p0
.end method

.method public setFixedPosition(IFF)Lcom/itextpdf/layout/element/Image;
    .locals 1
    .param p1, "pageNumber"    # I
    .param p2, "left"    # F
    .param p3, "bottom"    # F

    .line 519
    invoke-virtual {p0}, Lcom/itextpdf/layout/element/Image;->getWidth()Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/itextpdf/layout/element/Image;->setFixedPosition(IFFLcom/itextpdf/layout/properties/UnitValue;)Lcom/itextpdf/layout/IPropertyContainer;

    .line 520
    return-object p0
.end method

.method public setHeight(F)Lcom/itextpdf/layout/element/Image;
    .locals 2
    .param p1, "height"    # F

    .line 550
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 551
    .local v0, "heightAsUV":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v1, 0x1b

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 552
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/layout/element/Image;

    return-object v1
.end method

.method public setHeight(Lcom/itextpdf/layout/properties/UnitValue;)Lcom/itextpdf/layout/element/Image;
    .locals 1
    .param p1, "height"    # Lcom/itextpdf/layout/properties/UnitValue;

    .line 562
    const/16 v0, 0x1b

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 563
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/element/Image;

    return-object v0
.end method

.method public setMarginBottom(F)Lcom/itextpdf/layout/element/Image;
    .locals 2
    .param p1, "value"    # F

    .line 271
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 272
    .local v0, "marginUV":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v1, 0x2b

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 273
    return-object p0
.end method

.method public setMarginLeft(F)Lcom/itextpdf/layout/element/Image;
    .locals 2
    .param p1, "value"    # F

    .line 208
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 209
    .local v0, "marginUV":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v1, 0x2c

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 210
    return-object p0
.end method

.method public setMarginRight(F)Lcom/itextpdf/layout/element/Image;
    .locals 2
    .param p1, "value"    # F

    .line 229
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 230
    .local v0, "marginUV":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v1, 0x2d

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 231
    return-object p0
.end method

.method public setMarginTop(F)Lcom/itextpdf/layout/element/Image;
    .locals 2
    .param p1, "value"    # F

    .line 250
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 251
    .local v0, "marginUV":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v1, 0x2e

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 252
    return-object p0
.end method

.method public setMargins(FFFF)Lcom/itextpdf/layout/element/Image;
    .locals 1
    .param p1, "marginTop"    # F
    .param p2, "marginRight"    # F
    .param p3, "marginBottom"    # F
    .param p4, "marginLeft"    # F

    .line 286
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/element/Image;->setMarginTop(F)Lcom/itextpdf/layout/element/Image;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/itextpdf/layout/element/Image;->setMarginRight(F)Lcom/itextpdf/layout/element/Image;

    move-result-object v0

    invoke-virtual {v0, p3}, Lcom/itextpdf/layout/element/Image;->setMarginBottom(F)Lcom/itextpdf/layout/element/Image;

    move-result-object v0

    invoke-virtual {v0, p4}, Lcom/itextpdf/layout/element/Image;->setMarginLeft(F)Lcom/itextpdf/layout/element/Image;

    move-result-object v0

    return-object v0
.end method

.method public setMaxHeight(F)Lcom/itextpdf/layout/element/Image;
    .locals 2
    .param p1, "maxHeight"    # F

    .line 573
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 574
    .local v0, "maxHeightAsUv":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v1, 0x54

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 575
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/layout/element/Image;

    return-object v1
.end method

.method public setMaxHeight(Lcom/itextpdf/layout/properties/UnitValue;)Lcom/itextpdf/layout/element/Image;
    .locals 1
    .param p1, "maxHeight"    # Lcom/itextpdf/layout/properties/UnitValue;

    .line 585
    const/16 v0, 0x54

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 586
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/element/Image;

    return-object v0
.end method

.method public setMaxWidth(F)Lcom/itextpdf/layout/element/Image;
    .locals 2
    .param p1, "maxWidth"    # F

    .line 619
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 620
    .local v0, "minHeightAsUv":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v1, 0x4f

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 621
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/layout/element/Image;

    return-object v1
.end method

.method public setMaxWidth(Lcom/itextpdf/layout/properties/UnitValue;)Lcom/itextpdf/layout/element/Image;
    .locals 1
    .param p1, "maxWidth"    # Lcom/itextpdf/layout/properties/UnitValue;

    .line 631
    const/16 v0, 0x4f

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 632
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/element/Image;

    return-object v0
.end method

.method public setMinHeight(F)Lcom/itextpdf/layout/element/Image;
    .locals 2
    .param p1, "minHeight"    # F

    .line 596
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 597
    .local v0, "minHeightAsUv":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v1, 0x55

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 598
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/layout/element/Image;

    return-object v1
.end method

.method public setMinHeight(Lcom/itextpdf/layout/properties/UnitValue;)Lcom/itextpdf/layout/element/Image;
    .locals 1
    .param p1, "minHeight"    # Lcom/itextpdf/layout/properties/UnitValue;

    .line 608
    const/16 v0, 0x55

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 609
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/element/Image;

    return-object v0
.end method

.method public setMinWidth(F)Lcom/itextpdf/layout/element/Image;
    .locals 2
    .param p1, "minWidth"    # F

    .line 642
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 643
    .local v0, "minHeightAsUv":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v1, 0x50

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 644
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/layout/element/Image;

    return-object v1
.end method

.method public setMinWidth(Lcom/itextpdf/layout/properties/UnitValue;)Lcom/itextpdf/layout/element/Image;
    .locals 1
    .param p1, "minWidth"    # Lcom/itextpdf/layout/properties/UnitValue;

    .line 654
    const/16 v0, 0x50

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 655
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/element/Image;

    return-object v0
.end method

.method public setNeutralRole()Lcom/itextpdf/layout/element/Image;
    .locals 2

    .line 752
    invoke-virtual {p0}, Lcom/itextpdf/layout/element/Image;->getAccessibilityProperties()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->setRole(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    .line 753
    return-object p0
.end method

.method public setObjectFit(Lcom/itextpdf/layout/properties/ObjectFit;)Lcom/itextpdf/layout/element/Image;
    .locals 1
    .param p1, "objectFit"    # Lcom/itextpdf/layout/properties/ObjectFit;

    .line 720
    const/16 v0, 0x7d

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 721
    return-object p0
.end method

.method public setPadding(F)Lcom/itextpdf/layout/element/Image;
    .locals 1
    .param p1, "commonPadding"    # F

    .line 380
    invoke-virtual {p0, p1, p1, p1, p1}, Lcom/itextpdf/layout/element/Image;->setPaddings(FFFF)Lcom/itextpdf/layout/element/Image;

    move-result-object v0

    return-object v0
.end method

.method public setPaddingBottom(F)Lcom/itextpdf/layout/element/Image;
    .locals 2
    .param p1, "value"    # F

    .line 368
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 369
    .local v0, "paddingUV":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v1, 0x2f

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 370
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/layout/element/Image;

    return-object v1
.end method

.method public setPaddingLeft(F)Lcom/itextpdf/layout/element/Image;
    .locals 2
    .param p1, "value"    # F

    .line 305
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 306
    .local v0, "paddingUV":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v1, 0x30

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 307
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/layout/element/Image;

    return-object v1
.end method

.method public setPaddingRight(F)Lcom/itextpdf/layout/element/Image;
    .locals 2
    .param p1, "value"    # F

    .line 326
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 327
    .local v0, "paddingUV":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v1, 0x31

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 328
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/layout/element/Image;

    return-object v1
.end method

.method public setPaddingTop(F)Lcom/itextpdf/layout/element/Image;
    .locals 2
    .param p1, "value"    # F

    .line 347
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 348
    .local v0, "paddingUV":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v1, 0x32

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 349
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/layout/element/Image;

    return-object v1
.end method

.method public setPaddings(FFFF)Lcom/itextpdf/layout/element/Image;
    .locals 0
    .param p1, "paddingTop"    # F
    .param p2, "paddingRight"    # F
    .param p3, "paddingBottom"    # F
    .param p4, "paddingLeft"    # F

    .line 393
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/element/Image;->setPaddingTop(F)Lcom/itextpdf/layout/element/Image;

    .line 394
    invoke-virtual {p0, p2}, Lcom/itextpdf/layout/element/Image;->setPaddingRight(F)Lcom/itextpdf/layout/element/Image;

    .line 395
    invoke-virtual {p0, p3}, Lcom/itextpdf/layout/element/Image;->setPaddingBottom(F)Lcom/itextpdf/layout/element/Image;

    .line 396
    invoke-virtual {p0, p4}, Lcom/itextpdf/layout/element/Image;->setPaddingLeft(F)Lcom/itextpdf/layout/element/Image;

    .line 397
    return-object p0
.end method

.method public setRotationAngle(D)Lcom/itextpdf/layout/element/Image;
    .locals 2
    .param p1, "radAngle"    # D

    .line 188
    const/16 v0, 0x37

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 189
    return-object p0
.end method

.method public setWidth(F)Lcom/itextpdf/layout/element/Image;
    .locals 2
    .param p1, "width"    # F

    .line 665
    const/16 v0, 0x4d

    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 666
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/element/Image;

    return-object v0
.end method

.method public setWidth(Lcom/itextpdf/layout/properties/UnitValue;)Lcom/itextpdf/layout/element/Image;
    .locals 1
    .param p1, "width"    # Lcom/itextpdf/layout/properties/UnitValue;

    .line 676
    const/16 v0, 0x4d

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/element/Image;->setProperty(ILjava/lang/Object;)V

    .line 677
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/element/Image;

    return-object v0
.end method
