.class public abstract Lcom/itextpdf/io/font/cmap/AbstractCMap;
.super Ljava/lang/Object;
.source "AbstractCMap.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private cmapName:Ljava/lang/String;

.field private ordering:Ljava/lang/String;

.field private registry:Ljava/lang/String;

.field private supplement:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 30
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static byteArrayToInt([B)I
    .locals 3
    .param p0, "b"    # [B

    .line 142
    const/4 v0, 0x0

    .line 143
    .local v0, "n":I
    const/4 v1, 0x0

    .local v1, "k":I
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_0

    .line 144
    shl-int/lit8 v0, v0, 0x8

    .line 145
    aget-byte v2, p0, v1

    and-int/lit16 v2, v2, 0xff

    or-int/2addr v0, v2

    .line 143
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 147
    .end local v1    # "k":I
    :cond_0
    return v0
.end method

.method public static decodeStringToByte(Ljava/lang/String;)[B
    .locals 3
    .param p0, "range"    # Ljava/lang/String;

    .line 114
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    new-array v0, v0, [B

    .line 115
    .local v0, "bytes":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 116
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 115
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 118
    .end local v1    # "i":I
    :cond_0
    return-object v0
.end method

.method private static intToByteArray(I[B)V
    .locals 2
    .param p0, "n"    # I
    .param p1, "b"    # [B

    .line 135
    array-length v0, p1

    add-int/lit8 v0, v0, -0x1

    .local v0, "k":I
    :goto_0
    if-ltz v0, :cond_0

    .line 136
    int-to-byte v1, p0

    aput-byte v1, p1, v0

    .line 137
    ushr-int/lit8 p0, p0, 0x8

    .line 135
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 139
    .end local v0    # "k":I
    :cond_0
    return-void
.end method


# virtual methods
.method abstract addChar(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/CMapObject;)V
.end method

.method addCodeSpaceRange([B[B)V
    .locals 0
    .param p1, "low"    # [B
    .param p2, "high"    # [B

    .line 73
    return-void
.end method

.method addRange(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/io/font/cmap/CMapObject;)V
    .locals 11
    .param p1, "from"    # Ljava/lang/String;
    .param p2, "to"    # Ljava/lang/String;
    .param p3, "code"    # Lcom/itextpdf/io/font/cmap/CMapObject;

    .line 76
    invoke-static {p1}, Lcom/itextpdf/io/font/cmap/AbstractCMap;->decodeStringToByte(Ljava/lang/String;)[B

    move-result-object v0

    .line 77
    .local v0, "a1":[B
    invoke-static {p2}, Lcom/itextpdf/io/font/cmap/AbstractCMap;->decodeStringToByte(Ljava/lang/String;)[B

    move-result-object v1

    .line 78
    .local v1, "a2":[B
    array-length v2, v0

    array-length v3, v1

    if-ne v2, v3, :cond_6

    array-length v2, v0

    if-eqz v2, :cond_6

    .line 81
    const/4 v2, 0x0

    .line 82
    .local v2, "sout":[B
    invoke-virtual {p3}, Lcom/itextpdf/io/font/cmap/CMapObject;->isString()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 83
    invoke-virtual {p3}, Lcom/itextpdf/io/font/cmap/CMapObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/itextpdf/io/font/cmap/AbstractCMap;->decodeStringToByte(Ljava/lang/String;)[B

    move-result-object v2

    .line 85
    :cond_0
    invoke-static {v0}, Lcom/itextpdf/io/font/cmap/AbstractCMap;->byteArrayToInt([B)I

    move-result v3

    .line 86
    .local v3, "start":I
    invoke-static {v1}, Lcom/itextpdf/io/font/cmap/AbstractCMap;->byteArrayToInt([B)I

    move-result v4

    .line 87
    .local v4, "end":I
    move v5, v3

    .local v5, "k":I
    :goto_0
    if-gt v5, v4, :cond_5

    .line 88
    invoke-static {v5, v0}, Lcom/itextpdf/io/font/cmap/AbstractCMap;->intToByteArray(I[B)V

    .line 89
    const/4 v6, 0x0

    invoke-static {v0, v6}, Lcom/itextpdf/io/font/PdfEncodings;->convertToString([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 90
    .local v6, "mark":Ljava/lang/String;
    invoke-virtual {p3}, Lcom/itextpdf/io/font/cmap/CMapObject;->isArray()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 91
    invoke-virtual {p3}, Lcom/itextpdf/io/font/cmap/CMapObject;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/ArrayList;

    .line 92
    .local v7, "codes":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/cmap/CMapObject;>;"
    sub-int v8, v5, v3

    invoke-interface {v7, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/io/font/cmap/CMapObject;

    invoke-virtual {p0, v6, v8}, Lcom/itextpdf/io/font/cmap/AbstractCMap;->addChar(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/CMapObject;)V

    .line 93
    .end local v7    # "codes":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/cmap/CMapObject;>;"
    goto :goto_2

    :cond_1
    invoke-virtual {p3}, Lcom/itextpdf/io/font/cmap/CMapObject;->isNumber()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 94
    invoke-virtual {p3}, Lcom/itextpdf/io/font/cmap/CMapObject;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    add-int/2addr v7, v5

    sub-int/2addr v7, v3

    .line 95
    .local v7, "nn":I
    new-instance v8, Lcom/itextpdf/io/font/cmap/CMapObject;

    const/4 v9, 0x4

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-direct {v8, v9, v10}, Lcom/itextpdf/io/font/cmap/CMapObject;-><init>(ILjava/lang/Object;)V

    invoke-virtual {p0, v6, v8}, Lcom/itextpdf/io/font/cmap/AbstractCMap;->addChar(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/CMapObject;)V

    .end local v7    # "nn":I
    goto :goto_1

    .line 96
    :cond_2
    invoke-virtual {p3}, Lcom/itextpdf/io/font/cmap/CMapObject;->isString()Z

    move-result v7

    if-eqz v7, :cond_4

    .line 97
    new-instance v7, Lcom/itextpdf/io/font/cmap/CMapObject;

    const/4 v8, 0x2

    invoke-direct {v7, v8, v2}, Lcom/itextpdf/io/font/cmap/CMapObject;-><init>(ILjava/lang/Object;)V

    .line 98
    .local v7, "s1":Lcom/itextpdf/io/font/cmap/CMapObject;
    invoke-virtual {p0, v6, v7}, Lcom/itextpdf/io/font/cmap/AbstractCMap;->addChar(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/CMapObject;)V

    .line 99
    if-eqz v2, :cond_3

    .line 100
    invoke-static {v2}, Lcom/itextpdf/io/font/cmap/AbstractCMap;->byteArrayToInt([B)I

    move-result v8

    add-int/lit8 v8, v8, 0x1

    invoke-static {v8, v2}, Lcom/itextpdf/io/font/cmap/AbstractCMap;->intToByteArray(I[B)V

    goto :goto_2

    .line 99
    :cond_3
    new-instance v8, Ljava/lang/AssertionError;

    invoke-direct {v8}, Ljava/lang/AssertionError;-><init>()V

    throw v8

    .line 96
    .end local v7    # "s1":Lcom/itextpdf/io/font/cmap/CMapObject;
    :cond_4
    :goto_1
    nop

    .line 87
    .end local v6    # "mark":Ljava/lang/String;
    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 103
    .end local v5    # "k":I
    :cond_5
    return-void

    .line 79
    .end local v2    # "sout":[B
    .end local v3    # "start":I
    .end local v4    # "end":I
    :cond_6
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Invalid map."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 39
    iget-object v0, p0, Lcom/itextpdf/io/font/cmap/AbstractCMap;->cmapName:Ljava/lang/String;

    return-object v0
.end method

.method public getOrdering()Ljava/lang/String;
    .locals 1

    .line 47
    iget-object v0, p0, Lcom/itextpdf/io/font/cmap/AbstractCMap;->ordering:Ljava/lang/String;

    return-object v0
.end method

.method public getRegistry()Ljava/lang/String;
    .locals 1

    .line 55
    iget-object v0, p0, Lcom/itextpdf/io/font/cmap/AbstractCMap;->registry:Ljava/lang/String;

    return-object v0
.end method

.method public getSupplement()I
    .locals 1

    .line 63
    iget v0, p0, Lcom/itextpdf/io/font/cmap/AbstractCMap;->supplement:I

    return v0
.end method

.method setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "cmapName"    # Ljava/lang/String;

    .line 43
    iput-object p1, p0, Lcom/itextpdf/io/font/cmap/AbstractCMap;->cmapName:Ljava/lang/String;

    .line 44
    return-void
.end method

.method setOrdering(Ljava/lang/String;)V
    .locals 0
    .param p1, "ordering"    # Ljava/lang/String;

    .line 51
    iput-object p1, p0, Lcom/itextpdf/io/font/cmap/AbstractCMap;->ordering:Ljava/lang/String;

    .line 52
    return-void
.end method

.method setRegistry(Ljava/lang/String;)V
    .locals 0
    .param p1, "registry"    # Ljava/lang/String;

    .line 59
    iput-object p1, p0, Lcom/itextpdf/io/font/cmap/AbstractCMap;->registry:Ljava/lang/String;

    .line 60
    return-void
.end method

.method setSupplement(I)V
    .locals 0
    .param p1, "supplement"    # I

    .line 67
    iput p1, p0, Lcom/itextpdf/io/font/cmap/AbstractCMap;->supplement:I

    .line 68
    return-void
.end method

.method protected toUnicodeString(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 3
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "isHexWriting"    # Z

    .line 122
    invoke-static {p1}, Lcom/itextpdf/io/font/cmap/AbstractCMap;->decodeStringToByte(Ljava/lang/String;)[B

    move-result-object v0

    .line 123
    .local v0, "bytes":[B
    if-eqz p2, :cond_0

    .line 124
    const-string v1, "UnicodeBigUnmarked"

    invoke-static {v0, v1}, Lcom/itextpdf/io/font/PdfEncodings;->convertToString([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 126
    :cond_0
    array-length v1, v0

    const/4 v2, 0x2

    if-lt v1, v2, :cond_1

    const/4 v1, 0x0

    aget-byte v1, v0, v1

    const/4 v2, -0x2

    if-ne v1, v2, :cond_1

    const/4 v1, 0x1

    aget-byte v1, v0, v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_1

    .line 127
    const-string v1, "UnicodeBig"

    invoke-static {v0, v1}, Lcom/itextpdf/io/font/PdfEncodings;->convertToString([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 129
    :cond_1
    const-string v1, "PDF"

    invoke-static {v0, v1}, Lcom/itextpdf/io/font/PdfEncodings;->convertToString([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
