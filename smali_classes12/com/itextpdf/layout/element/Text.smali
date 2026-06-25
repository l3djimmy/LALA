.class public Lcom/itextpdf/layout/element/Text;
.super Lcom/itextpdf/layout/element/AbstractElement;
.source "Text.java"

# interfaces
.implements Lcom/itextpdf/layout/element/ILeafElement;
.implements Lcom/itextpdf/layout/tagging/IAccessibleElement;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/layout/element/AbstractElement<",
        "Lcom/itextpdf/layout/element/Text;",
        ">;",
        "Lcom/itextpdf/layout/element/ILeafElement;",
        "Lcom/itextpdf/layout/tagging/IAccessibleElement;"
    }
.end annotation


# instance fields
.field protected tagProperties:Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;

.field protected text:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;

    .line 46
    invoke-direct {p0}, Lcom/itextpdf/layout/element/AbstractElement;-><init>()V

    .line 47
    if-eqz p1, :cond_0

    .line 50
    iput-object p1, p0, Lcom/itextpdf/layout/element/Text;->text:Ljava/lang/String;

    .line 51
    return-void

    .line 48
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method


# virtual methods
.method public getAccessibilityProperties()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 2

    .line 128
    iget-object v0, p0, Lcom/itextpdf/layout/element/Text;->tagProperties:Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;

    if-nez v0, :cond_0

    .line 129
    new-instance v0, Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;

    const-string v1, "Span"

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/itextpdf/layout/element/Text;->tagProperties:Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;

    .line 131
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/element/Text;->tagProperties:Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;

    return-object v0
.end method

.method public getHorizontalScaling()Ljava/lang/Float;
    .locals 1

    .line 94
    const/16 v0, 0x1d

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/Text;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    return-object v0
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/itextpdf/layout/element/Text;->text:Ljava/lang/String;

    return-object v0
.end method

.method public getTextRise()F
    .locals 1

    .line 75
    const/16 v0, 0x48

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/Text;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    return v0
.end method

.method protected makeNewRenderer()Lcom/itextpdf/layout/renderer/IRenderer;
    .locals 2

    .line 146
    new-instance v0, Lcom/itextpdf/layout/renderer/TextRenderer;

    iget-object v1, p0, Lcom/itextpdf/layout/element/Text;->text:Ljava/lang/String;

    invoke-direct {v0, p0, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;-><init>(Lcom/itextpdf/layout/element/Text;Ljava/lang/String;)V

    return-object v0
.end method

.method public setHorizontalScaling(F)Lcom/itextpdf/layout/element/Text;
    .locals 2
    .param p1, "horizontalScaling"    # F

    .line 122
    const/16 v0, 0x1d

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/element/Text;->setProperty(ILjava/lang/Object;)V

    .line 123
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/element/Text;

    return-object v0
.end method

.method public setNeutralRole()Lcom/itextpdf/layout/element/Text;
    .locals 2

    .line 140
    invoke-virtual {p0}, Lcom/itextpdf/layout/element/Text;->getAccessibilityProperties()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->setRole(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    .line 141
    return-object p0
.end method

.method public setSkew(FF)Lcom/itextpdf/layout/element/Text;
    .locals 6
    .param p1, "alpha"    # F
    .param p2, "beta"    # F

    .line 107
    float-to-double v0, p1

    const-wide v2, 0x400921fb54442d18L    # Math.PI

    mul-double/2addr v0, v2

    const-wide v4, 0x4066800000000000L    # 180.0

    div-double/2addr v0, v4

    invoke-static {v0, v1}, Ljava/lang/Math;->tan(D)D

    move-result-wide v0

    double-to-float p1, v0

    .line 108
    float-to-double v0, p2

    mul-double/2addr v0, v2

    div-double/2addr v0, v4

    invoke-static {v0, v1}, Ljava/lang/Math;->tan(D)D

    move-result-wide v0

    double-to-float p2, v0

    .line 109
    const/4 v0, 0x2

    new-array v0, v0, [F

    const/4 v1, 0x0

    aput p1, v0, v1

    const/4 v1, 0x1

    aput p2, v0, v1

    const/16 v1, 0x41

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/element/Text;->setProperty(ILjava/lang/Object;)V

    .line 110
    return-object p0
.end method

.method public setText(Ljava/lang/String;)V
    .locals 0
    .param p1, "text"    # Ljava/lang/String;

    .line 67
    iput-object p1, p0, Lcom/itextpdf/layout/element/Text;->text:Ljava/lang/String;

    .line 68
    return-void
.end method

.method public setTextRise(F)Lcom/itextpdf/layout/element/Text;
    .locals 2
    .param p1, "textRise"    # F

    .line 84
    const/16 v0, 0x48

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/element/Text;->setProperty(ILjava/lang/Object;)V

    .line 85
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/element/Text;

    return-object v0
.end method
