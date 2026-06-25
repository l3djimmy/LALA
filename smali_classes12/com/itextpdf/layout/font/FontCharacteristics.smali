.class public final Lcom/itextpdf/layout/font/FontCharacteristics;
.super Ljava/lang/Object;
.source "FontCharacteristics.java"


# instance fields
.field private fontWeight:S

.field private isBold:Z

.field private isItalic:Z

.field private isMonospace:Z

.field private undefined:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/layout/font/FontCharacteristics;->isItalic:Z

    .line 28
    iput-boolean v0, p0, Lcom/itextpdf/layout/font/FontCharacteristics;->isBold:Z

    .line 29
    const/16 v1, 0x190

    iput-short v1, p0, Lcom/itextpdf/layout/font/FontCharacteristics;->fontWeight:S

    .line 30
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/itextpdf/layout/font/FontCharacteristics;->undefined:Z

    .line 31
    iput-boolean v0, p0, Lcom/itextpdf/layout/font/FontCharacteristics;->isMonospace:Z

    .line 34
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/layout/font/FontCharacteristics;)V
    .locals 1
    .param p1, "other"    # Lcom/itextpdf/layout/font/FontCharacteristics;

    .line 37
    invoke-direct {p0}, Lcom/itextpdf/layout/font/FontCharacteristics;-><init>()V

    .line 38
    iget-boolean v0, p1, Lcom/itextpdf/layout/font/FontCharacteristics;->isItalic:Z

    iput-boolean v0, p0, Lcom/itextpdf/layout/font/FontCharacteristics;->isItalic:Z

    .line 39
    iget-boolean v0, p1, Lcom/itextpdf/layout/font/FontCharacteristics;->isBold:Z

    iput-boolean v0, p0, Lcom/itextpdf/layout/font/FontCharacteristics;->isBold:Z

    .line 40
    iget-short v0, p1, Lcom/itextpdf/layout/font/FontCharacteristics;->fontWeight:S

    iput-short v0, p0, Lcom/itextpdf/layout/font/FontCharacteristics;->fontWeight:S

    .line 41
    iget-boolean v0, p1, Lcom/itextpdf/layout/font/FontCharacteristics;->undefined:Z

    iput-boolean v0, p0, Lcom/itextpdf/layout/font/FontCharacteristics;->undefined:Z

    .line 42
    return-void
.end method

.method private modified()V
    .locals 1

    .line 120
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/layout/font/FontCharacteristics;->undefined:Z

    .line 121
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 125
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 126
    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_1

    .line 128
    :cond_1
    move-object v2, p1

    check-cast v2, Lcom/itextpdf/layout/font/FontCharacteristics;

    .line 130
    .local v2, "that":Lcom/itextpdf/layout/font/FontCharacteristics;
    iget-boolean v3, p0, Lcom/itextpdf/layout/font/FontCharacteristics;->isItalic:Z

    iget-boolean v4, v2, Lcom/itextpdf/layout/font/FontCharacteristics;->isItalic:Z

    if-ne v3, v4, :cond_2

    iget-boolean v3, p0, Lcom/itextpdf/layout/font/FontCharacteristics;->isBold:Z

    iget-boolean v4, v2, Lcom/itextpdf/layout/font/FontCharacteristics;->isBold:Z

    if-ne v3, v4, :cond_2

    iget-short v3, p0, Lcom/itextpdf/layout/font/FontCharacteristics;->fontWeight:S

    iget-short v4, v2, Lcom/itextpdf/layout/font/FontCharacteristics;->fontWeight:S

    if-ne v3, v4, :cond_2

    goto :goto_0

    :cond_2
    move v0, v1

    :goto_0
    return v0

    .line 126
    .end local v2    # "that":Lcom/itextpdf/layout/font/FontCharacteristics;
    :cond_3
    :goto_1
    return v1
.end method

.method public getFontWeight()S
    .locals 1

    .line 112
    iget-short v0, p0, Lcom/itextpdf/layout/font/FontCharacteristics;->fontWeight:S

    return v0
.end method

.method public hashCode()I
    .locals 3

    .line 137
    iget-boolean v0, p0, Lcom/itextpdf/layout/font/FontCharacteristics;->isItalic:Z

    .line 138
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-boolean v2, p0, Lcom/itextpdf/layout/font/FontCharacteristics;->isBold:Z

    add-int/2addr v1, v2

    .line 139
    .end local v0    # "result":I
    .local v1, "result":I
    mul-int/lit8 v0, v1, 0x1f

    iget-short v2, p0, Lcom/itextpdf/layout/font/FontCharacteristics;->fontWeight:S

    add-int/2addr v0, v2

    .line 140
    .end local v1    # "result":I
    .restart local v0    # "result":I
    return v0
.end method

.method public isBold()Z
    .locals 2

    .line 104
    iget-boolean v0, p0, Lcom/itextpdf/layout/font/FontCharacteristics;->isBold:Z

    if-nez v0, :cond_1

    iget-short v0, p0, Lcom/itextpdf/layout/font/FontCharacteristics;->fontWeight:S

    const/16 v1, 0x1f4

    if-le v0, v1, :cond_0

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

.method public isItalic()Z
    .locals 1

    .line 100
    iget-boolean v0, p0, Lcom/itextpdf/layout/font/FontCharacteristics;->isItalic:Z

    return v0
.end method

.method public isMonospace()Z
    .locals 1

    .line 108
    iget-boolean v0, p0, Lcom/itextpdf/layout/font/FontCharacteristics;->isMonospace:Z

    return v0
.end method

.method public isUndefined()Z
    .locals 1

    .line 116
    iget-boolean v0, p0, Lcom/itextpdf/layout/font/FontCharacteristics;->undefined:Z

    return v0
.end method

.method public setBoldFlag(Z)Lcom/itextpdf/layout/font/FontCharacteristics;
    .locals 1
    .param p1, "isBold"    # Z

    .line 64
    iput-boolean p1, p0, Lcom/itextpdf/layout/font/FontCharacteristics;->isBold:Z

    .line 65
    iget-boolean v0, p0, Lcom/itextpdf/layout/font/FontCharacteristics;->isBold:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/itextpdf/layout/font/FontCharacteristics;->modified()V

    .line 66
    :cond_0
    return-object p0
.end method

.method public setFontStyle(Ljava/lang/String;)Lcom/itextpdf/layout/font/FontCharacteristics;
    .locals 1
    .param p1, "fs"    # Ljava/lang/String;

    .line 87
    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_2

    .line 88
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 89
    const-string/jumbo v0, "normal"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 90
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/layout/font/FontCharacteristics;->isItalic:Z

    goto :goto_0

    .line 91
    :cond_0
    const-string v0, "italic"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string/jumbo v0, "oblique"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 92
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/layout/font/FontCharacteristics;->isItalic:Z

    .line 95
    :cond_2
    :goto_0
    iget-boolean v0, p0, Lcom/itextpdf/layout/font/FontCharacteristics;->isItalic:Z

    if-eqz v0, :cond_3

    invoke-direct {p0}, Lcom/itextpdf/layout/font/FontCharacteristics;->modified()V

    .line 96
    :cond_3
    return-object p0
.end method

.method public setFontWeight(Ljava/lang/String;)Lcom/itextpdf/layout/font/FontCharacteristics;
    .locals 1
    .param p1, "fw"    # Ljava/lang/String;

    .line 60
    invoke-static {p1}, Lcom/itextpdf/layout/font/FontCharacteristicsUtils;->parseFontWeight(Ljava/lang/String;)S

    move-result v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/font/FontCharacteristics;->setFontWeight(S)Lcom/itextpdf/layout/font/FontCharacteristics;

    move-result-object v0

    return-object v0
.end method

.method public setFontWeight(S)Lcom/itextpdf/layout/font/FontCharacteristics;
    .locals 1
    .param p1, "fw"    # S

    .line 52
    if-lez p1, :cond_0

    .line 53
    invoke-static {p1}, Lcom/itextpdf/layout/font/FontCharacteristicsUtils;->normalizeFontWeight(S)S

    move-result v0

    iput-short v0, p0, Lcom/itextpdf/layout/font/FontCharacteristics;->fontWeight:S

    .line 54
    invoke-direct {p0}, Lcom/itextpdf/layout/font/FontCharacteristics;->modified()V

    .line 56
    :cond_0
    return-object p0
.end method

.method public setItalicFlag(Z)Lcom/itextpdf/layout/font/FontCharacteristics;
    .locals 1
    .param p1, "isItalic"    # Z

    .line 70
    iput-boolean p1, p0, Lcom/itextpdf/layout/font/FontCharacteristics;->isItalic:Z

    .line 71
    iget-boolean v0, p0, Lcom/itextpdf/layout/font/FontCharacteristics;->isItalic:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/itextpdf/layout/font/FontCharacteristics;->modified()V

    .line 72
    :cond_0
    return-object p0
.end method

.method public setMonospaceFlag(Z)Lcom/itextpdf/layout/font/FontCharacteristics;
    .locals 1
    .param p1, "isMonospace"    # Z

    .line 76
    iput-boolean p1, p0, Lcom/itextpdf/layout/font/FontCharacteristics;->isMonospace:Z

    .line 77
    iget-boolean v0, p0, Lcom/itextpdf/layout/font/FontCharacteristics;->isMonospace:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/itextpdf/layout/font/FontCharacteristics;->modified()V

    .line 78
    :cond_0
    return-object p0
.end method
