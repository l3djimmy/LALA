.class public Lcom/itextpdf/io/font/FontNames;
.super Ljava/lang/Object;
.source "FontNames.java"


# instance fields
.field protected allNames:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/List<",
            "[",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private allowEmbedding:Z

.field private cidFontName:Ljava/lang/String;

.field private familyName:[[Ljava/lang/String;

.field private familyName2:[[Ljava/lang/String;

.field private fontName:Ljava/lang/String;

.field private fontStretch:Ljava/lang/String;

.field private fullName:[[Ljava/lang/String;

.field private macStyle:I

.field private style:Ljava/lang/String;

.field private subfamily:[[Ljava/lang/String;

.field private weight:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    const-string v0, ""

    iput-object v0, p0, Lcom/itextpdf/io/font/FontNames;->style:Ljava/lang/String;

    .line 52
    const/16 v0, 0x190

    iput v0, p0, Lcom/itextpdf/io/font/FontNames;->weight:I

    .line 54
    const-string v0, "Normal"

    iput-object v0, p0, Lcom/itextpdf/io/font/FontNames;->fontStretch:Ljava/lang/String;

    return-void
.end method

.method private listToArray(Ljava/util/List;)[[Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "[",
            "Ljava/lang/String;",
            ">;)[[",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 234
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<[Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [[Ljava/lang/String;

    .line 235
    .local v0, "array":[[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 236
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    aput-object v2, v0, v1

    .line 235
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 238
    .end local v1    # "i":I
    :cond_0
    return-object v0
.end method


# virtual methods
.method public allowEmbedding()Z
    .locals 1

    .line 135
    iget-boolean v0, p0, Lcom/itextpdf/io/font/FontNames;->allowEmbedding:Z

    return v0
.end method

.method public getCidFontName()Ljava/lang/String;
    .locals 1

    .line 80
    iget-object v0, p0, Lcom/itextpdf/io/font/FontNames;->cidFontName:Ljava/lang/String;

    return-object v0
.end method

.method public getFamilyName()[[Ljava/lang/String;
    .locals 1

    .line 84
    iget-object v0, p0, Lcom/itextpdf/io/font/FontNames;->familyName:[[Ljava/lang/String;

    return-object v0
.end method

.method public getFamilyName2()[[Ljava/lang/String;
    .locals 1

    .line 93
    iget-object v0, p0, Lcom/itextpdf/io/font/FontNames;->familyName2:[[Ljava/lang/String;

    return-object v0
.end method

.method public getFontName()Ljava/lang/String;
    .locals 1

    .line 76
    iget-object v0, p0, Lcom/itextpdf/io/font/FontNames;->fontName:Ljava/lang/String;

    return-object v0
.end method

.method public getFontStretch()Ljava/lang/String;
    .locals 1

    .line 122
    iget-object v0, p0, Lcom/itextpdf/io/font/FontNames;->fontStretch:Ljava/lang/String;

    return-object v0
.end method

.method public getFontWeight()I
    .locals 1

    .line 105
    iget v0, p0, Lcom/itextpdf/io/font/FontNames;->weight:I

    return v0
.end method

.method public getFullName()[[Ljava/lang/String;
    .locals 1

    .line 72
    iget-object v0, p0, Lcom/itextpdf/io/font/FontNames;->fullName:[[Ljava/lang/String;

    return-object v0
.end method

.method protected getMacStyle()I
    .locals 1

    .line 226
    iget v0, p0, Lcom/itextpdf/io/font/FontNames;->macStyle:I

    return v0
.end method

.method public getNames(I)[[Ljava/lang/String;
    .locals 3
    .param p1, "id"    # I

    .line 67
    iget-object v0, p0, Lcom/itextpdf/io/font/FontNames;->allNames:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 68
    .local v0, "names":Ljava/util/List;, "Ljava/util/List<[Ljava/lang/String;>;"
    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    invoke-direct {p0, v0}, Lcom/itextpdf/io/font/FontNames;->listToArray(Ljava/util/List;)[[Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    move-object v2, v1

    check-cast v2, [[Ljava/lang/String;

    :goto_0
    return-object v1
.end method

.method public getStyle()Ljava/lang/String;
    .locals 1

    .line 97
    iget-object v0, p0, Lcom/itextpdf/io/font/FontNames;->style:Ljava/lang/String;

    return-object v0
.end method

.method public getSubfamily()Ljava/lang/String;
    .locals 2

    .line 101
    iget-object v0, p0, Lcom/itextpdf/io/font/FontNames;->subfamily:[[Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/io/font/FontNames;->subfamily:[[Ljava/lang/String;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    const/4 v1, 0x3

    aget-object v0, v0, v1

    goto :goto_0

    :cond_0
    const-string v0, ""

    :goto_0
    return-object v0
.end method

.method public isBold()Z
    .locals 2

    .line 139
    iget v0, p0, Lcom/itextpdf/io/font/FontNames;->macStyle:I

    const/4 v1, 0x1

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public isCondensed()Z
    .locals 1

    .line 159
    iget v0, p0, Lcom/itextpdf/io/font/FontNames;->macStyle:I

    and-int/lit8 v0, v0, 0x20

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isExtended()Z
    .locals 1

    .line 163
    iget v0, p0, Lcom/itextpdf/io/font/FontNames;->macStyle:I

    and-int/lit8 v0, v0, 0x40

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isItalic()Z
    .locals 1

    .line 143
    iget v0, p0, Lcom/itextpdf/io/font/FontNames;->macStyle:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isOutline()Z
    .locals 1

    .line 151
    iget v0, p0, Lcom/itextpdf/io/font/FontNames;->macStyle:I

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isShadow()Z
    .locals 1

    .line 155
    iget v0, p0, Lcom/itextpdf/io/font/FontNames;->macStyle:I

    and-int/lit8 v0, v0, 0x10

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isUnderline()Z
    .locals 1

    .line 147
    iget v0, p0, Lcom/itextpdf/io/font/FontNames;->macStyle:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected setAllNames(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/List<",
            "[",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .line 167
    .local p1, "allNames":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<[Ljava/lang/String;>;>;"
    iput-object p1, p0, Lcom/itextpdf/io/font/FontNames;->allNames:Ljava/util/Map;

    .line 168
    return-void
.end method

.method protected setAllowEmbedding(Z)V
    .locals 0
    .param p1, "allowEmbedding"    # Z

    .line 230
    iput-boolean p1, p0, Lcom/itextpdf/io/font/FontNames;->allowEmbedding:Z

    .line 231
    return-void
.end method

.method protected setCidFontName(Ljava/lang/String;)V
    .locals 0
    .param p1, "cidFontName"    # Ljava/lang/String;

    .line 183
    iput-object p1, p0, Lcom/itextpdf/io/font/FontNames;->cidFontName:Ljava/lang/String;

    .line 184
    return-void
.end method

.method protected setFamilyName(Ljava/lang/String;)V
    .locals 5
    .param p1, "familyName"    # Ljava/lang/String;

    .line 200
    const/4 v0, 0x1

    new-array v1, v0, [[Ljava/lang/String;

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, ""

    aput-object v4, v2, v3

    aput-object v4, v2, v0

    const/4 v0, 0x2

    aput-object v4, v2, v0

    const/4 v0, 0x3

    aput-object p1, v2, v0

    aput-object v2, v1, v3

    iput-object v1, p0, Lcom/itextpdf/io/font/FontNames;->familyName:[[Ljava/lang/String;

    .line 201
    return-void
.end method

.method protected setFamilyName([[Ljava/lang/String;)V
    .locals 0
    .param p1, "familyName"    # [[Ljava/lang/String;

    .line 187
    iput-object p1, p0, Lcom/itextpdf/io/font/FontNames;->familyName:[[Ljava/lang/String;

    .line 188
    return-void
.end method

.method protected setFamilyName2([[Ljava/lang/String;)V
    .locals 0
    .param p1, "familyName2"    # [[Ljava/lang/String;

    .line 196
    iput-object p1, p0, Lcom/itextpdf/io/font/FontNames;->familyName2:[[Ljava/lang/String;

    .line 197
    return-void
.end method

.method protected setFontName(Ljava/lang/String;)V
    .locals 0
    .param p1, "psFontName"    # Ljava/lang/String;

    .line 179
    iput-object p1, p0, Lcom/itextpdf/io/font/FontNames;->fontName:Ljava/lang/String;

    .line 180
    return-void
.end method

.method protected setFontStretch(Ljava/lang/String;)V
    .locals 0
    .param p1, "fontStretch"    # Ljava/lang/String;

    .line 131
    iput-object p1, p0, Lcom/itextpdf/io/font/FontNames;->fontStretch:Ljava/lang/String;

    .line 132
    return-void
.end method

.method protected setFontWeight(I)V
    .locals 1
    .param p1, "weight"    # I

    .line 113
    invoke-static {p1}, Lcom/itextpdf/io/font/constants/FontWeights;->normalizeFontWeight(I)I

    move-result v0

    iput v0, p0, Lcom/itextpdf/io/font/FontNames;->weight:I

    .line 114
    return-void
.end method

.method protected setFullName(Ljava/lang/String;)V
    .locals 5
    .param p1, "fullName"    # Ljava/lang/String;

    .line 175
    const/4 v0, 0x1

    new-array v1, v0, [[Ljava/lang/String;

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, ""

    aput-object v4, v2, v3

    aput-object v4, v2, v0

    const/4 v0, 0x2

    aput-object v4, v2, v0

    const/4 v0, 0x3

    aput-object p1, v2, v0

    aput-object v2, v1, v3

    iput-object v1, p0, Lcom/itextpdf/io/font/FontNames;->fullName:[[Ljava/lang/String;

    .line 176
    return-void
.end method

.method protected setFullName([[Ljava/lang/String;)V
    .locals 0
    .param p1, "fullName"    # [[Ljava/lang/String;

    .line 171
    iput-object p1, p0, Lcom/itextpdf/io/font/FontNames;->fullName:[[Ljava/lang/String;

    .line 172
    return-void
.end method

.method protected setMacStyle(I)V
    .locals 0
    .param p1, "macStyle"    # I

    .line 222
    iput p1, p0, Lcom/itextpdf/io/font/FontNames;->macStyle:I

    .line 223
    return-void
.end method

.method protected setStyle(Ljava/lang/String;)V
    .locals 0
    .param p1, "style"    # Ljava/lang/String;

    .line 204
    iput-object p1, p0, Lcom/itextpdf/io/font/FontNames;->style:Ljava/lang/String;

    .line 205
    return-void
.end method

.method protected setSubfamily(Ljava/lang/String;)V
    .locals 5
    .param p1, "subfamily"    # Ljava/lang/String;

    .line 208
    const/4 v0, 0x1

    new-array v1, v0, [[Ljava/lang/String;

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, ""

    aput-object v4, v2, v3

    aput-object v4, v2, v0

    const/4 v0, 0x2

    aput-object v4, v2, v0

    const/4 v0, 0x3

    aput-object p1, v2, v0

    aput-object v2, v1, v3

    iput-object v1, p0, Lcom/itextpdf/io/font/FontNames;->subfamily:[[Ljava/lang/String;

    .line 209
    return-void
.end method

.method protected setSubfamily([[Ljava/lang/String;)V
    .locals 0
    .param p1, "subfamily"    # [[Ljava/lang/String;

    .line 212
    iput-object p1, p0, Lcom/itextpdf/io/font/FontNames;->subfamily:[[Ljava/lang/String;

    .line 213
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 243
    invoke-virtual {p0}, Lcom/itextpdf/io/font/FontNames;->getFontName()Ljava/lang/String;

    move-result-object v0

    .line 244
    .local v0, "name":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    move-object v1, v0

    goto :goto_0

    :cond_0
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    return-object v1
.end method
