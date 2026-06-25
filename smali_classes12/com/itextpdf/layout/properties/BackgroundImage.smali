.class public Lcom/itextpdf/layout/properties/BackgroundImage;
.super Ljava/lang/Object;
.source "BackgroundImage.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/layout/properties/BackgroundImage$Builder;
    }
.end annotation


# static fields
.field private static final DEFAULT_BLEND_MODE:Lcom/itextpdf/layout/properties/BlendMode;


# instance fields
.field private final backgroundClip:Lcom/itextpdf/layout/properties/BackgroundBox;

.field private final backgroundOrigin:Lcom/itextpdf/layout/properties/BackgroundBox;

.field private final backgroundSize:Lcom/itextpdf/layout/properties/BackgroundSize;

.field private blendMode:Lcom/itextpdf/layout/properties/BlendMode;

.field protected image:Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

.field protected linearGradientBuilder:Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;

.field private final position:Lcom/itextpdf/layout/properties/BackgroundPosition;

.field private final repeat:Lcom/itextpdf/layout/properties/BackgroundRepeat;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 36
    sget-object v0, Lcom/itextpdf/layout/properties/BlendMode;->NORMAL:Lcom/itextpdf/layout/properties/BlendMode;

    sput-object v0, Lcom/itextpdf/layout/properties/BackgroundImage;->DEFAULT_BLEND_MODE:Lcom/itextpdf/layout/properties/BlendMode;

    return-void
.end method

.method private constructor <init>(Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;Lcom/itextpdf/layout/properties/BackgroundRepeat;Lcom/itextpdf/layout/properties/BackgroundPosition;Lcom/itextpdf/layout/properties/BackgroundSize;Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;Lcom/itextpdf/layout/properties/BlendMode;Lcom/itextpdf/layout/properties/BackgroundBox;Lcom/itextpdf/layout/properties/BackgroundBox;)V
    .locals 1
    .param p1, "image"    # Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;
    .param p2, "repeat"    # Lcom/itextpdf/layout/properties/BackgroundRepeat;
    .param p3, "position"    # Lcom/itextpdf/layout/properties/BackgroundPosition;
    .param p4, "backgroundSize"    # Lcom/itextpdf/layout/properties/BackgroundSize;
    .param p5, "linearGradientBuilder"    # Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;
    .param p6, "blendMode"    # Lcom/itextpdf/layout/properties/BlendMode;
    .param p7, "clip"    # Lcom/itextpdf/layout/properties/BackgroundBox;
    .param p8, "origin"    # Lcom/itextpdf/layout/properties/BackgroundBox;

    .line 102
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    sget-object v0, Lcom/itextpdf/layout/properties/BackgroundImage;->DEFAULT_BLEND_MODE:Lcom/itextpdf/layout/properties/BlendMode;

    iput-object v0, p0, Lcom/itextpdf/layout/properties/BackgroundImage;->blendMode:Lcom/itextpdf/layout/properties/BlendMode;

    .line 103
    iput-object p1, p0, Lcom/itextpdf/layout/properties/BackgroundImage;->image:Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    .line 104
    iput-object p2, p0, Lcom/itextpdf/layout/properties/BackgroundImage;->repeat:Lcom/itextpdf/layout/properties/BackgroundRepeat;

    .line 105
    iput-object p3, p0, Lcom/itextpdf/layout/properties/BackgroundImage;->position:Lcom/itextpdf/layout/properties/BackgroundPosition;

    .line 106
    iput-object p4, p0, Lcom/itextpdf/layout/properties/BackgroundImage;->backgroundSize:Lcom/itextpdf/layout/properties/BackgroundSize;

    .line 107
    iput-object p5, p0, Lcom/itextpdf/layout/properties/BackgroundImage;->linearGradientBuilder:Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;

    .line 108
    if-eqz p6, :cond_0

    .line 109
    iput-object p6, p0, Lcom/itextpdf/layout/properties/BackgroundImage;->blendMode:Lcom/itextpdf/layout/properties/BlendMode;

    .line 111
    :cond_0
    iput-object p7, p0, Lcom/itextpdf/layout/properties/BackgroundImage;->backgroundClip:Lcom/itextpdf/layout/properties/BackgroundBox;

    .line 112
    iput-object p8, p0, Lcom/itextpdf/layout/properties/BackgroundImage;->backgroundOrigin:Lcom/itextpdf/layout/properties/BackgroundBox;

    .line 113
    return-void
.end method

.method synthetic constructor <init>(Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;Lcom/itextpdf/layout/properties/BackgroundRepeat;Lcom/itextpdf/layout/properties/BackgroundPosition;Lcom/itextpdf/layout/properties/BackgroundSize;Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;Lcom/itextpdf/layout/properties/BlendMode;Lcom/itextpdf/layout/properties/BackgroundBox;Lcom/itextpdf/layout/properties/BackgroundBox;Lcom/itextpdf/layout/properties/BackgroundImage$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;
    .param p2, "x1"    # Lcom/itextpdf/layout/properties/BackgroundRepeat;
    .param p3, "x2"    # Lcom/itextpdf/layout/properties/BackgroundPosition;
    .param p4, "x3"    # Lcom/itextpdf/layout/properties/BackgroundSize;
    .param p5, "x4"    # Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;
    .param p6, "x5"    # Lcom/itextpdf/layout/properties/BlendMode;
    .param p7, "x6"    # Lcom/itextpdf/layout/properties/BackgroundBox;
    .param p8, "x7"    # Lcom/itextpdf/layout/properties/BackgroundBox;
    .param p9, "x8"    # Lcom/itextpdf/layout/properties/BackgroundImage$1;

    .line 34
    invoke-direct/range {p0 .. p8}, Lcom/itextpdf/layout/properties/BackgroundImage;-><init>(Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;Lcom/itextpdf/layout/properties/BackgroundRepeat;Lcom/itextpdf/layout/properties/BackgroundPosition;Lcom/itextpdf/layout/properties/BackgroundSize;Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;Lcom/itextpdf/layout/properties/BlendMode;Lcom/itextpdf/layout/properties/BackgroundBox;Lcom/itextpdf/layout/properties/BackgroundBox;)V

    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/layout/properties/BackgroundImage;)V
    .locals 10
    .param p1, "backgroundImage"    # Lcom/itextpdf/layout/properties/BackgroundImage;

    .line 60
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/BackgroundImage;->getImage()Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/BackgroundImage;->getForm()Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/BackgroundImage;->getImage()Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;

    move-result-object v0

    :goto_0
    move-object v2, v0

    .line 61
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/BackgroundImage;->getRepeat()Lcom/itextpdf/layout/properties/BackgroundRepeat;

    move-result-object v3

    .line 62
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/BackgroundImage;->getBackgroundPosition()Lcom/itextpdf/layout/properties/BackgroundPosition;

    move-result-object v4

    .line 63
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/BackgroundImage;->getBackgroundSize()Lcom/itextpdf/layout/properties/BackgroundSize;

    move-result-object v5

    .line 64
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/BackgroundImage;->getLinearGradientBuilder()Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;

    move-result-object v6

    .line 65
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/BackgroundImage;->getBlendMode()Lcom/itextpdf/layout/properties/BlendMode;

    move-result-object v7

    .line 66
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/BackgroundImage;->getBackgroundClip()Lcom/itextpdf/layout/properties/BackgroundBox;

    move-result-object v8

    .line 67
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/BackgroundImage;->getBackgroundOrigin()Lcom/itextpdf/layout/properties/BackgroundBox;

    move-result-object v9

    .line 60
    move-object v1, p0

    invoke-direct/range {v1 .. v9}, Lcom/itextpdf/layout/properties/BackgroundImage;-><init>(Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;Lcom/itextpdf/layout/properties/BackgroundRepeat;Lcom/itextpdf/layout/properties/BackgroundPosition;Lcom/itextpdf/layout/properties/BackgroundSize;Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;Lcom/itextpdf/layout/properties/BlendMode;Lcom/itextpdf/layout/properties/BackgroundBox;Lcom/itextpdf/layout/properties/BackgroundBox;)V

    .line 68
    return-void
.end method

.method static synthetic access$000()Lcom/itextpdf/layout/properties/BlendMode;
    .locals 1

    .line 34
    sget-object v0, Lcom/itextpdf/layout/properties/BackgroundImage;->DEFAULT_BLEND_MODE:Lcom/itextpdf/layout/properties/BlendMode;

    return-object v0
.end method


# virtual methods
.method public getBackgroundClip()Lcom/itextpdf/layout/properties/BackgroundBox;
    .locals 1

    .line 193
    iget-object v0, p0, Lcom/itextpdf/layout/properties/BackgroundImage;->backgroundClip:Lcom/itextpdf/layout/properties/BackgroundBox;

    return-object v0
.end method

.method public getBackgroundOrigin()Lcom/itextpdf/layout/properties/BackgroundBox;
    .locals 1

    .line 202
    iget-object v0, p0, Lcom/itextpdf/layout/properties/BackgroundImage;->backgroundOrigin:Lcom/itextpdf/layout/properties/BackgroundBox;

    return-object v0
.end method

.method public getBackgroundPosition()Lcom/itextpdf/layout/properties/BackgroundPosition;
    .locals 1

    .line 121
    iget-object v0, p0, Lcom/itextpdf/layout/properties/BackgroundImage;->position:Lcom/itextpdf/layout/properties/BackgroundPosition;

    return-object v0
.end method

.method public getBackgroundSize()Lcom/itextpdf/layout/properties/BackgroundSize;
    .locals 1

    .line 148
    iget-object v0, p0, Lcom/itextpdf/layout/properties/BackgroundImage;->backgroundSize:Lcom/itextpdf/layout/properties/BackgroundSize;

    return-object v0
.end method

.method public getBlendMode()Lcom/itextpdf/layout/properties/BlendMode;
    .locals 1

    .line 184
    iget-object v0, p0, Lcom/itextpdf/layout/properties/BackgroundImage;->blendMode:Lcom/itextpdf/layout/properties/BlendMode;

    return-object v0
.end method

.method public getForm()Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;
    .locals 1

    .line 85
    iget-object v0, p0, Lcom/itextpdf/layout/properties/BackgroundImage;->image:Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    instance-of v0, v0, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/layout/properties/BackgroundImage;->image:Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    check-cast v0, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getImage()Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;
    .locals 1

    .line 76
    iget-object v0, p0, Lcom/itextpdf/layout/properties/BackgroundImage;->image:Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    instance-of v0, v0, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/layout/properties/BackgroundImage;->image:Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    check-cast v0, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getImageHeight()F
    .locals 1

    .line 166
    iget-object v0, p0, Lcom/itextpdf/layout/properties/BackgroundImage;->image:Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;->getHeight()F

    move-result v0

    return v0
.end method

.method public getImageWidth()F
    .locals 1

    .line 157
    iget-object v0, p0, Lcom/itextpdf/layout/properties/BackgroundImage;->image:Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;->getWidth()F

    move-result v0

    return v0
.end method

.method public getLinearGradientBuilder()Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;
    .locals 1

    .line 130
    iget-object v0, p0, Lcom/itextpdf/layout/properties/BackgroundImage;->linearGradientBuilder:Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;

    return-object v0
.end method

.method public getRepeat()Lcom/itextpdf/layout/properties/BackgroundRepeat;
    .locals 1

    .line 175
    iget-object v0, p0, Lcom/itextpdf/layout/properties/BackgroundImage;->repeat:Lcom/itextpdf/layout/properties/BackgroundRepeat;

    return-object v0
.end method

.method public isBackgroundSpecified()Z
    .locals 1

    .line 139
    iget-object v0, p0, Lcom/itextpdf/layout/properties/BackgroundImage;->image:Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    instance-of v0, v0, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/itextpdf/layout/properties/BackgroundImage;->image:Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    instance-of v0, v0, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/itextpdf/layout/properties/BackgroundImage;->linearGradientBuilder:Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method
