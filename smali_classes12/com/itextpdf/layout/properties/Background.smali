.class public Lcom/itextpdf/layout/properties/Background;
.super Ljava/lang/Object;
.source "Background.java"


# instance fields
.field private backgroundClip:Lcom/itextpdf/layout/properties/BackgroundBox;

.field protected extraBottom:F

.field protected extraLeft:F

.field protected extraRight:F

.field protected extraTop:F

.field protected transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/colors/Color;)V
    .locals 7
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/Color;

    .line 48
    const/4 v5, 0x0

    const/4 v6, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    .end local p1    # "color":Lcom/itextpdf/kernel/colors/Color;
    .local v1, "color":Lcom/itextpdf/kernel/colors/Color;
    invoke-direct/range {v0 .. v6}, Lcom/itextpdf/layout/properties/Background;-><init>(Lcom/itextpdf/kernel/colors/Color;FFFFF)V

    .line 49
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/colors/Color;F)V
    .locals 7
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/Color;
    .param p2, "opacity"    # F

    .line 57
    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    .end local p1    # "color":Lcom/itextpdf/kernel/colors/Color;
    .end local p2    # "opacity":F
    .local v1, "color":Lcom/itextpdf/kernel/colors/Color;
    .local v2, "opacity":F
    invoke-direct/range {v0 .. v6}, Lcom/itextpdf/layout/properties/Background;-><init>(Lcom/itextpdf/kernel/colors/Color;FFFFF)V

    .line 58
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/colors/Color;FFFF)V
    .locals 7
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/Color;
    .param p2, "extraLeft"    # F
    .param p3, "extraTop"    # F
    .param p4, "extraRight"    # F
    .param p5, "extraBottom"    # F

    .line 71
    const/high16 v2, 0x3f800000    # 1.0f

    move-object v0, p0

    move-object v1, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    .end local p1    # "color":Lcom/itextpdf/kernel/colors/Color;
    .end local p2    # "extraLeft":F
    .end local p3    # "extraTop":F
    .end local p4    # "extraRight":F
    .end local p5    # "extraBottom":F
    .local v1, "color":Lcom/itextpdf/kernel/colors/Color;
    .local v3, "extraLeft":F
    .local v4, "extraTop":F
    .local v5, "extraRight":F
    .local v6, "extraBottom":F
    invoke-direct/range {v0 .. v6}, Lcom/itextpdf/layout/properties/Background;-><init>(Lcom/itextpdf/kernel/colors/Color;FFFFF)V

    .line 72
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/colors/Color;FFFFF)V
    .locals 1
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/Color;
    .param p2, "opacity"    # F
    .param p3, "extraLeft"    # F
    .param p4, "extraTop"    # F
    .param p5, "extraRight"    # F
    .param p6, "extraBottom"    # F

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    sget-object v0, Lcom/itextpdf/layout/properties/BackgroundBox;->BORDER_BOX:Lcom/itextpdf/layout/properties/BackgroundBox;

    iput-object v0, p0, Lcom/itextpdf/layout/properties/Background;->backgroundClip:Lcom/itextpdf/layout/properties/BackgroundBox;

    .line 86
    new-instance v0, Lcom/itextpdf/layout/properties/TransparentColor;

    invoke-direct {v0, p1, p2}, Lcom/itextpdf/layout/properties/TransparentColor;-><init>(Lcom/itextpdf/kernel/colors/Color;F)V

    iput-object v0, p0, Lcom/itextpdf/layout/properties/Background;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    .line 87
    iput p3, p0, Lcom/itextpdf/layout/properties/Background;->extraLeft:F

    .line 88
    iput p5, p0, Lcom/itextpdf/layout/properties/Background;->extraRight:F

    .line 89
    iput p4, p0, Lcom/itextpdf/layout/properties/Background;->extraTop:F

    .line 90
    iput p6, p0, Lcom/itextpdf/layout/properties/Background;->extraBottom:F

    .line 91
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/colors/Color;FLcom/itextpdf/layout/properties/BackgroundBox;)V
    .locals 0
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/Color;
    .param p2, "opacity"    # F
    .param p3, "clip"    # Lcom/itextpdf/layout/properties/BackgroundBox;

    .line 102
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/layout/properties/Background;-><init>(Lcom/itextpdf/kernel/colors/Color;F)V

    .line 103
    iput-object p3, p0, Lcom/itextpdf/layout/properties/Background;->backgroundClip:Lcom/itextpdf/layout/properties/BackgroundBox;

    .line 104
    return-void
.end method


# virtual methods
.method public getBackgroundClip()Lcom/itextpdf/layout/properties/BackgroundBox;
    .locals 1

    .line 160
    iget-object v0, p0, Lcom/itextpdf/layout/properties/Background;->backgroundClip:Lcom/itextpdf/layout/properties/BackgroundBox;

    return-object v0
.end method

.method public getColor()Lcom/itextpdf/kernel/colors/Color;
    .locals 1

    .line 111
    iget-object v0, p0, Lcom/itextpdf/layout/properties/Background;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/TransparentColor;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v0

    return-object v0
.end method

.method public getExtraBottom()F
    .locals 1

    .line 151
    iget v0, p0, Lcom/itextpdf/layout/properties/Background;->extraBottom:F

    return v0
.end method

.method public getExtraLeft()F
    .locals 1

    .line 127
    iget v0, p0, Lcom/itextpdf/layout/properties/Background;->extraLeft:F

    return v0
.end method

.method public getExtraRight()F
    .locals 1

    .line 135
    iget v0, p0, Lcom/itextpdf/layout/properties/Background;->extraRight:F

    return v0
.end method

.method public getExtraTop()F
    .locals 1

    .line 143
    iget v0, p0, Lcom/itextpdf/layout/properties/Background;->extraTop:F

    return v0
.end method

.method public getOpacity()F
    .locals 1

    .line 119
    iget-object v0, p0, Lcom/itextpdf/layout/properties/Background;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/TransparentColor;->getOpacity()F

    move-result v0

    return v0
.end method
