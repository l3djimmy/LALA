.class public Lcom/itextpdf/io/font/cmap/CMapCidUni;
.super Lcom/itextpdf/io/font/cmap/AbstractCMap;
.source "CMapCidUni.java"


# instance fields
.field private map:Lcom/itextpdf/io/util/IntHashtable;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 28
    invoke-direct {p0}, Lcom/itextpdf/io/font/cmap/AbstractCMap;-><init>()V

    .line 30
    new-instance v0, Lcom/itextpdf/io/util/IntHashtable;

    const v1, 0x10001

    invoke-direct {v0, v1}, Lcom/itextpdf/io/util/IntHashtable;-><init>(I)V

    iput-object v0, p0, Lcom/itextpdf/io/font/cmap/CMapCidUni;->map:Lcom/itextpdf/io/util/IntHashtable;

    return-void
.end method


# virtual methods
.method addChar(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/CMapObject;)V
    .locals 4
    .param p1, "mark"    # Ljava/lang/String;
    .param p2, "code"    # Lcom/itextpdf/io/font/cmap/CMapObject;

    .line 34
    invoke-virtual {p2}, Lcom/itextpdf/io/font/cmap/CMapObject;->isNumber()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 36
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/io/font/cmap/CMapCidUni;->toUnicodeString(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 37
    .local v0, "s":Ljava/lang/String;
    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/itextpdf/io/util/TextUtil;->isSurrogatePair(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 38
    invoke-static {v0, v1}, Lcom/itextpdf/io/util/TextUtil;->convertToUtf32(Ljava/lang/String;I)I

    move-result v1

    .local v1, "codePoint":I
    goto :goto_0

    .line 40
    .end local v1    # "codePoint":I
    :cond_0
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 42
    .restart local v1    # "codePoint":I
    :goto_0
    iget-object v2, p0, Lcom/itextpdf/io/font/cmap/CMapCidUni;->map:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {p2}, Lcom/itextpdf/io/font/cmap/CMapObject;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v2, v3, v1}, Lcom/itextpdf/io/util/IntHashtable;->put(II)I

    .line 44
    .end local v0    # "s":Ljava/lang/String;
    .end local v1    # "codePoint":I
    :cond_1
    return-void
.end method

.method public getCids()[I
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/itextpdf/io/font/cmap/CMapCidUni;->map:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {v0}, Lcom/itextpdf/io/util/IntHashtable;->getKeys()[I

    move-result-object v0

    return-object v0
.end method

.method public lookup(I)I
    .locals 1
    .param p1, "character"    # I

    .line 47
    iget-object v0, p0, Lcom/itextpdf/io/font/cmap/CMapCidUni;->map:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/util/IntHashtable;->get(I)I

    move-result v0

    return v0
.end method
