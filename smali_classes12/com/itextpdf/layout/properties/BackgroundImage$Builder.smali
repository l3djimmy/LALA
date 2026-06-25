.class public Lcom/itextpdf/layout/properties/BackgroundImage$Builder;
.super Ljava/lang/Object;
.source "BackgroundImage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/layout/properties/BackgroundImage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private backgroundSize:Lcom/itextpdf/layout/properties/BackgroundSize;

.field private blendMode:Lcom/itextpdf/layout/properties/BlendMode;

.field private clip:Lcom/itextpdf/layout/properties/BackgroundBox;

.field private image:Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

.field private linearGradientBuilder:Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;

.field private origin:Lcom/itextpdf/layout/properties/BackgroundBox;

.field private position:Lcom/itextpdf/layout/properties/BackgroundPosition;

.field private repeat:Lcom/itextpdf/layout/properties/BackgroundRepeat;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 222
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 212
    new-instance v0, Lcom/itextpdf/layout/properties/BackgroundPosition;

    invoke-direct {v0}, Lcom/itextpdf/layout/properties/BackgroundPosition;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/properties/BackgroundImage$Builder;->position:Lcom/itextpdf/layout/properties/BackgroundPosition;

    .line 213
    new-instance v0, Lcom/itextpdf/layout/properties/BackgroundRepeat;

    invoke-direct {v0}, Lcom/itextpdf/layout/properties/BackgroundRepeat;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/properties/BackgroundImage$Builder;->repeat:Lcom/itextpdf/layout/properties/BackgroundRepeat;

    .line 214
    invoke-static {}, Lcom/itextpdf/layout/properties/BackgroundImage;->access$000()Lcom/itextpdf/layout/properties/BlendMode;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/layout/properties/BackgroundImage$Builder;->blendMode:Lcom/itextpdf/layout/properties/BlendMode;

    .line 215
    new-instance v0, Lcom/itextpdf/layout/properties/BackgroundSize;

    invoke-direct {v0}, Lcom/itextpdf/layout/properties/BackgroundSize;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/properties/BackgroundImage$Builder;->backgroundSize:Lcom/itextpdf/layout/properties/BackgroundSize;

    .line 216
    sget-object v0, Lcom/itextpdf/layout/properties/BackgroundBox;->BORDER_BOX:Lcom/itextpdf/layout/properties/BackgroundBox;

    iput-object v0, p0, Lcom/itextpdf/layout/properties/BackgroundImage$Builder;->clip:Lcom/itextpdf/layout/properties/BackgroundBox;

    .line 217
    sget-object v0, Lcom/itextpdf/layout/properties/BackgroundBox;->PADDING_BOX:Lcom/itextpdf/layout/properties/BackgroundBox;

    iput-object v0, p0, Lcom/itextpdf/layout/properties/BackgroundImage$Builder;->origin:Lcom/itextpdf/layout/properties/BackgroundBox;

    .line 223
    return-void
.end method


# virtual methods
.method public build()Lcom/itextpdf/layout/properties/BackgroundImage;
    .locals 10

    .line 330
    new-instance v0, Lcom/itextpdf/layout/properties/BackgroundImage;

    iget-object v1, p0, Lcom/itextpdf/layout/properties/BackgroundImage$Builder;->image:Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    iget-object v2, p0, Lcom/itextpdf/layout/properties/BackgroundImage$Builder;->repeat:Lcom/itextpdf/layout/properties/BackgroundRepeat;

    iget-object v3, p0, Lcom/itextpdf/layout/properties/BackgroundImage$Builder;->position:Lcom/itextpdf/layout/properties/BackgroundPosition;

    iget-object v4, p0, Lcom/itextpdf/layout/properties/BackgroundImage$Builder;->backgroundSize:Lcom/itextpdf/layout/properties/BackgroundSize;

    iget-object v5, p0, Lcom/itextpdf/layout/properties/BackgroundImage$Builder;->linearGradientBuilder:Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;

    iget-object v6, p0, Lcom/itextpdf/layout/properties/BackgroundImage$Builder;->blendMode:Lcom/itextpdf/layout/properties/BlendMode;

    iget-object v7, p0, Lcom/itextpdf/layout/properties/BackgroundImage$Builder;->clip:Lcom/itextpdf/layout/properties/BackgroundBox;

    iget-object v8, p0, Lcom/itextpdf/layout/properties/BackgroundImage$Builder;->origin:Lcom/itextpdf/layout/properties/BackgroundBox;

    const/4 v9, 0x0

    invoke-direct/range {v0 .. v9}, Lcom/itextpdf/layout/properties/BackgroundImage;-><init>(Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;Lcom/itextpdf/layout/properties/BackgroundRepeat;Lcom/itextpdf/layout/properties/BackgroundPosition;Lcom/itextpdf/layout/properties/BackgroundSize;Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;Lcom/itextpdf/layout/properties/BlendMode;Lcom/itextpdf/layout/properties/BackgroundBox;Lcom/itextpdf/layout/properties/BackgroundBox;Lcom/itextpdf/layout/properties/BackgroundImage$1;)V

    return-object v0
.end method

.method public setBackgroundBlendMode(Lcom/itextpdf/layout/properties/BlendMode;)Lcom/itextpdf/layout/properties/BackgroundImage$Builder;
    .locals 0
    .param p1, "blendMode"    # Lcom/itextpdf/layout/properties/BlendMode;

    .line 283
    if-eqz p1, :cond_0

    .line 284
    iput-object p1, p0, Lcom/itextpdf/layout/properties/BackgroundImage$Builder;->blendMode:Lcom/itextpdf/layout/properties/BlendMode;

    .line 286
    :cond_0
    return-object p0
.end method

.method public setBackgroundClip(Lcom/itextpdf/layout/properties/BackgroundBox;)Lcom/itextpdf/layout/properties/BackgroundImage$Builder;
    .locals 0
    .param p1, "clip"    # Lcom/itextpdf/layout/properties/BackgroundBox;

    .line 309
    iput-object p1, p0, Lcom/itextpdf/layout/properties/BackgroundImage$Builder;->clip:Lcom/itextpdf/layout/properties/BackgroundBox;

    .line 310
    return-object p0
.end method

.method public setBackgroundOrigin(Lcom/itextpdf/layout/properties/BackgroundBox;)Lcom/itextpdf/layout/properties/BackgroundImage$Builder;
    .locals 0
    .param p1, "origin"    # Lcom/itextpdf/layout/properties/BackgroundBox;

    .line 320
    iput-object p1, p0, Lcom/itextpdf/layout/properties/BackgroundImage$Builder;->origin:Lcom/itextpdf/layout/properties/BackgroundBox;

    .line 321
    return-object p0
.end method

.method public setBackgroundPosition(Lcom/itextpdf/layout/properties/BackgroundPosition;)Lcom/itextpdf/layout/properties/BackgroundImage$Builder;
    .locals 0
    .param p1, "position"    # Lcom/itextpdf/layout/properties/BackgroundPosition;

    .line 272
    iput-object p1, p0, Lcom/itextpdf/layout/properties/BackgroundImage$Builder;->position:Lcom/itextpdf/layout/properties/BackgroundPosition;

    .line 273
    return-object p0
.end method

.method public setBackgroundRepeat(Lcom/itextpdf/layout/properties/BackgroundRepeat;)Lcom/itextpdf/layout/properties/BackgroundImage$Builder;
    .locals 0
    .param p1, "repeat"    # Lcom/itextpdf/layout/properties/BackgroundRepeat;

    .line 261
    iput-object p1, p0, Lcom/itextpdf/layout/properties/BackgroundImage$Builder;->repeat:Lcom/itextpdf/layout/properties/BackgroundRepeat;

    .line 262
    return-object p0
.end method

.method public setBackgroundSize(Lcom/itextpdf/layout/properties/BackgroundSize;)Lcom/itextpdf/layout/properties/BackgroundImage$Builder;
    .locals 0
    .param p1, "backgroundSize"    # Lcom/itextpdf/layout/properties/BackgroundSize;

    .line 296
    if-eqz p1, :cond_0

    .line 297
    iput-object p1, p0, Lcom/itextpdf/layout/properties/BackgroundImage$Builder;->backgroundSize:Lcom/itextpdf/layout/properties/BackgroundSize;

    .line 299
    :cond_0
    return-object p0
.end method

.method public setImage(Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;)Lcom/itextpdf/layout/properties/BackgroundImage$Builder;
    .locals 1
    .param p1, "image"    # Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    .line 234
    iput-object p1, p0, Lcom/itextpdf/layout/properties/BackgroundImage$Builder;->image:Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    .line 235
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/layout/properties/BackgroundImage$Builder;->linearGradientBuilder:Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;

    .line 236
    return-object p0
.end method

.method public setLinearGradientBuilder(Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;)Lcom/itextpdf/layout/properties/BackgroundImage$Builder;
    .locals 2
    .param p1, "linearGradientBuilder"    # Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;

    .line 248
    iput-object p1, p0, Lcom/itextpdf/layout/properties/BackgroundImage$Builder;->linearGradientBuilder:Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;

    .line 249
    new-instance v0, Lcom/itextpdf/layout/properties/BackgroundRepeat;

    sget-object v1, Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;->NO_REPEAT:Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    invoke-direct {v0, v1}, Lcom/itextpdf/layout/properties/BackgroundRepeat;-><init>(Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;)V

    iput-object v0, p0, Lcom/itextpdf/layout/properties/BackgroundImage$Builder;->repeat:Lcom/itextpdf/layout/properties/BackgroundRepeat;

    .line 250
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/layout/properties/BackgroundImage$Builder;->image:Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    .line 251
    return-object p0
.end method
