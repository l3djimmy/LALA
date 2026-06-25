.class public Lcom/itextpdf/layout/properties/BackgroundSize;
.super Ljava/lang/Object;
.source "BackgroundSize.java"


# instance fields
.field private backgroundHeightSize:Lcom/itextpdf/layout/properties/UnitValue;

.field private backgroundWidthSize:Lcom/itextpdf/layout/properties/UnitValue;

.field private contain:Z

.field private cover:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/layout/properties/BackgroundSize;->cover:Z

    .line 53
    iput-boolean v0, p0, Lcom/itextpdf/layout/properties/BackgroundSize;->contain:Z

    .line 54
    return-void
.end method

.method private clear()V
    .locals 1

    .line 142
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/layout/properties/BackgroundSize;->contain:Z

    .line 143
    iput-boolean v0, p0, Lcom/itextpdf/layout/properties/BackgroundSize;->cover:Z

    .line 144
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/layout/properties/BackgroundSize;->backgroundWidthSize:Lcom/itextpdf/layout/properties/UnitValue;

    .line 145
    iput-object v0, p0, Lcom/itextpdf/layout/properties/BackgroundSize;->backgroundHeightSize:Lcom/itextpdf/layout/properties/UnitValue;

    .line 146
    return-void
.end method


# virtual methods
.method public getBackgroundHeightSize()Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1

    .line 109
    iget-object v0, p0, Lcom/itextpdf/layout/properties/BackgroundSize;->backgroundHeightSize:Lcom/itextpdf/layout/properties/UnitValue;

    return-object v0
.end method

.method public getBackgroundWidthSize()Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1

    .line 99
    iget-object v0, p0, Lcom/itextpdf/layout/properties/BackgroundSize;->backgroundWidthSize:Lcom/itextpdf/layout/properties/UnitValue;

    return-object v0
.end method

.method public isContain()Z
    .locals 1

    .line 128
    iget-boolean v0, p0, Lcom/itextpdf/layout/properties/BackgroundSize;->contain:Z

    return v0
.end method

.method public isCover()Z
    .locals 1

    .line 138
    iget-boolean v0, p0, Lcom/itextpdf/layout/properties/BackgroundSize;->cover:Z

    return v0
.end method

.method public isSpecificSize()Z
    .locals 1

    .line 118
    iget-boolean v0, p0, Lcom/itextpdf/layout/properties/BackgroundSize;->contain:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/itextpdf/layout/properties/BackgroundSize;->cover:Z

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

.method public setBackgroundSizeToContain()V
    .locals 1

    .line 78
    invoke-direct {p0}, Lcom/itextpdf/layout/properties/BackgroundSize;->clear()V

    .line 79
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/layout/properties/BackgroundSize;->contain:Z

    .line 80
    return-void
.end method

.method public setBackgroundSizeToCover()V
    .locals 1

    .line 88
    invoke-direct {p0}, Lcom/itextpdf/layout/properties/BackgroundSize;->clear()V

    .line 89
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/layout/properties/BackgroundSize;->cover:Z

    .line 90
    return-void
.end method

.method public setBackgroundSizeToValues(Lcom/itextpdf/layout/properties/UnitValue;Lcom/itextpdf/layout/properties/UnitValue;)V
    .locals 0
    .param p1, "width"    # Lcom/itextpdf/layout/properties/UnitValue;
    .param p2, "height"    # Lcom/itextpdf/layout/properties/UnitValue;

    .line 67
    invoke-direct {p0}, Lcom/itextpdf/layout/properties/BackgroundSize;->clear()V

    .line 68
    iput-object p1, p0, Lcom/itextpdf/layout/properties/BackgroundSize;->backgroundWidthSize:Lcom/itextpdf/layout/properties/UnitValue;

    .line 69
    iput-object p2, p0, Lcom/itextpdf/layout/properties/BackgroundSize;->backgroundHeightSize:Lcom/itextpdf/layout/properties/UnitValue;

    .line 70
    return-void
.end method
