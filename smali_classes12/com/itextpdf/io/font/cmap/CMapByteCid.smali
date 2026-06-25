.class public Lcom/itextpdf/io/font/cmap/CMapByteCid;
.super Lcom/itextpdf/io/font/cmap/AbstractCMap;
.source "CMapByteCid.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/io/font/cmap/CMapByteCid$Cursor;
    }
.end annotation


# instance fields
.field private planes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[I>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 46
    invoke-direct {p0}, Lcom/itextpdf/io/font/cmap/AbstractCMap;-><init>()V

    .line 44
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/cmap/CMapByteCid;->planes:Ljava/util/List;

    .line 47
    iget-object v0, p0, Lcom/itextpdf/io/font/cmap/CMapByteCid;->planes:Ljava/util/List;

    const/16 v1, 0x100

    new-array v1, v1, [I

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    return-void
.end method

.method private encodeSequence([BI)V
    .locals 9
    .param p1, "seq"    # [B
    .param p2, "cid"    # I

    .line 93
    array-length v0, p1

    add-int/lit8 v0, v0, -0x1

    .line 94
    .local v0, "size":I
    const/4 v1, 0x0

    .line 95
    .local v1, "nextPlane":I
    const/4 v2, 0x0

    .line 108
    .local v2, "idx":I
    :goto_0
    iget-object v3, p0, Lcom/itextpdf/io/font/cmap/CMapByteCid;->planes:Ljava/util/List;

    .line 95
    const-string v4, "Inconsistent mapping."

    const v5, 0x8000

    if-ge v2, v0, :cond_3

    .line 96
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [I

    .line 97
    .local v3, "plane":[I
    aget-byte v6, p1, v2

    and-int/lit16 v6, v6, 0xff

    .line 98
    .local v6, "one":I
    aget v7, v3, v6

    .line 99
    .local v7, "c":I
    if-eqz v7, :cond_1

    and-int v8, v7, v5

    if-eqz v8, :cond_0

    goto :goto_1

    .line 100
    :cond_0
    new-instance v5, Lcom/itextpdf/io/exceptions/IOException;

    invoke-direct {v5, v4}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 101
    :cond_1
    :goto_1
    if-nez v7, :cond_2

    .line 102
    iget-object v4, p0, Lcom/itextpdf/io/font/cmap/CMapByteCid;->planes:Ljava/util/List;

    const/16 v8, 0x100

    new-array v8, v8, [I

    invoke-interface {v4, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 103
    iget-object v4, p0, Lcom/itextpdf/io/font/cmap/CMapByteCid;->planes:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    or-int v7, v4, v5

    .line 104
    aput v7, v3, v6

    .line 106
    :cond_2
    and-int/lit16 v1, v7, 0x7fff

    .line 95
    .end local v3    # "plane":[I
    .end local v6    # "one":I
    .end local v7    # "c":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 108
    .end local v2    # "idx":I
    :cond_3
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [I

    .line 109
    .local v2, "plane":[I
    aget-byte v3, p1, v0

    and-int/lit16 v3, v3, 0xff

    .line 110
    .local v3, "one":I
    aget v6, v2, v3

    .line 111
    .local v6, "c":I
    and-int/2addr v5, v6

    if-nez v5, :cond_4

    .line 113
    aput p2, v2, v3

    .line 114
    return-void

    .line 112
    :cond_4
    new-instance v5, Lcom/itextpdf/io/exceptions/IOException;

    invoke-direct {v5, v4}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v5
.end method


# virtual methods
.method addChar(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/CMapObject;)V
    .locals 2
    .param p1, "mark"    # Ljava/lang/String;
    .param p2, "code"    # Lcom/itextpdf/io/font/cmap/CMapObject;

    .line 52
    invoke-virtual {p2}, Lcom/itextpdf/io/font/cmap/CMapObject;->isNumber()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 53
    invoke-static {p1}, Lcom/itextpdf/io/font/cmap/CMapByteCid;->decodeStringToByte(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p2}, Lcom/itextpdf/io/font/cmap/CMapObject;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/itextpdf/io/font/cmap/CMapByteCid;->encodeSequence([BI)V

    .line 55
    :cond_0
    return-void
.end method

.method public decodeSequence([BII)Ljava/lang/String;
    .locals 4
    .param p1, "cidBytes"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .line 66
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 67
    .local v0, "sb":Ljava/lang/StringBuilder;
    new-instance v1, Lcom/itextpdf/io/font/cmap/CMapByteCid$Cursor;

    invoke-direct {v1, p2, p3}, Lcom/itextpdf/io/font/cmap/CMapByteCid$Cursor;-><init>(II)V

    .line 69
    .local v1, "cursor":Lcom/itextpdf/io/font/cmap/CMapByteCid$Cursor;
    :goto_0
    invoke-virtual {p0, p1, v1}, Lcom/itextpdf/io/font/cmap/CMapByteCid;->decodeSingle([BLcom/itextpdf/io/font/cmap/CMapByteCid$Cursor;)I

    move-result v2

    move v3, v2

    .local v3, "cid":I
    if-ltz v2, :cond_0

    .line 70
    int-to-char v2, v3

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 72
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method protected decodeSingle([BLcom/itextpdf/io/font/cmap/CMapByteCid$Cursor;)I
    .locals 6
    .param p1, "cidBytes"    # [B
    .param p2, "cursor"    # Lcom/itextpdf/io/font/cmap/CMapByteCid$Cursor;

    .line 76
    iget v0, p2, Lcom/itextpdf/io/font/cmap/CMapByteCid$Cursor;->offset:I

    iget v1, p2, Lcom/itextpdf/io/font/cmap/CMapByteCid$Cursor;->length:I

    add-int/2addr v0, v1

    .line 77
    .local v0, "end":I
    const/4 v1, 0x0

    .line 78
    .local v1, "currentPlane":I
    :goto_0
    iget v2, p2, Lcom/itextpdf/io/font/cmap/CMapByteCid$Cursor;->offset:I

    if-ge v2, v0, :cond_1

    .line 79
    iget v2, p2, Lcom/itextpdf/io/font/cmap/CMapByteCid$Cursor;->offset:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p2, Lcom/itextpdf/io/font/cmap/CMapByteCid$Cursor;->offset:I

    aget-byte v2, p1, v2

    and-int/lit16 v2, v2, 0xff

    .line 80
    .local v2, "one":I
    iget v3, p2, Lcom/itextpdf/io/font/cmap/CMapByteCid$Cursor;->length:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p2, Lcom/itextpdf/io/font/cmap/CMapByteCid$Cursor;->length:I

    .line 81
    iget-object v3, p0, Lcom/itextpdf/io/font/cmap/CMapByteCid;->planes:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [I

    .line 82
    .local v3, "plane":[I
    aget v4, v3, v2

    .line 83
    .local v4, "cid":I
    const v5, 0x8000

    and-int/2addr v5, v4

    if-nez v5, :cond_0

    .line 84
    return v4

    .line 86
    :cond_0
    and-int/lit16 v1, v4, 0x7fff

    .line 88
    .end local v2    # "one":I
    .end local v3    # "plane":[I
    .end local v4    # "cid":I
    goto :goto_0

    .line 89
    :cond_1
    const/4 v2, -0x1

    return v2
.end method
