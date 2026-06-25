.class public Lcom/itextpdf/io/font/cmap/CMapContentParser;
.super Ljava/lang/Object;
.source "CMapContentParser.java"


# static fields
.field public static final COMMAND_TYPE:I = 0xc8


# instance fields
.field private tokeniser:Lcom/itextpdf/io/source/PdfTokenizer;


# direct methods
.method public constructor <init>(Lcom/itextpdf/io/source/PdfTokenizer;)V
    .locals 0
    .param p1, "tokeniser"    # Lcom/itextpdf/io/source/PdfTokenizer;

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput-object p1, p0, Lcom/itextpdf/io/font/cmap/CMapContentParser;->tokeniser:Lcom/itextpdf/io/source/PdfTokenizer;

    .line 55
    return-void
.end method

.method public static decodeCMapObject(Lcom/itextpdf/io/font/cmap/CMapObject;)Ljava/lang/String;
    .locals 2
    .param p0, "cMapObject"    # Lcom/itextpdf/io/font/cmap/CMapObject;

    .line 218
    invoke-virtual {p0}, Lcom/itextpdf/io/font/cmap/CMapObject;->isHexString()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 219
    invoke-virtual {p0}, Lcom/itextpdf/io/font/cmap/CMapObject;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    const-string v1, "UnicodeBigUnmarked"

    invoke-static {v0, v1}, Lcom/itextpdf/io/font/PdfEncodings;->convertToString([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 221
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/io/font/cmap/CMapObject;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method protected static decodeName([B)Ljava/lang/String;
    .locals 1
    .param p0, "content"    # [B
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 194
    invoke-static {p0}, Lcom/itextpdf/io/util/PdfNameUtil;->decodeName([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toHex(I)Ljava/lang/String;
    .locals 4
    .param p0, "n"    # I

    .line 209
    const/high16 v0, 0x10000

    if-ge p0, v0, :cond_0

    .line 210
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/itextpdf/io/font/cmap/CMapContentParser;->toHex4(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 211
    :cond_0
    sub-int/2addr p0, v0

    .line 212
    div-int/lit16 v0, p0, 0x400

    const v1, 0xd800

    add-int/2addr v0, v1

    .line 213
    .local v0, "high":I
    rem-int/lit16 v1, p0, 0x400

    const v2, 0xdc00

    add-int/2addr v1, v2

    .line 214
    .local v1, "low":I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[<"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v0}, Lcom/itextpdf/io/font/cmap/CMapContentParser;->toHex4(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v1}, Lcom/itextpdf/io/font/cmap/CMapContentParser;->toHex4(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ">]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private static toHex4(I)Ljava/lang/String;
    .locals 2
    .param p0, "n"    # I

    .line 198
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "0000"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 199
    .local v0, "s":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x4

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public nextValidToken()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 177
    nop

    :goto_0
    iget-object v0, p0, Lcom/itextpdf/io/font/cmap/CMapContentParser;->tokeniser:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/PdfTokenizer;->nextToken()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 178
    iget-object v0, p0, Lcom/itextpdf/io/font/cmap/CMapContentParser;->tokeniser:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/PdfTokenizer;->getTokenType()Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Comment:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    if-ne v0, v1, :cond_0

    .line 179
    goto :goto_0

    .line 180
    :cond_0
    const/4 v0, 0x1

    return v0

    .line 182
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public parse(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/cmap/CMapObject;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 65
    .local p1, "ls":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/cmap/CMapObject;>;"
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 67
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/io/font/cmap/CMapContentParser;->readObject()Lcom/itextpdf/io/font/cmap/CMapObject;

    move-result-object v0

    move-object v1, v0

    .local v1, "ob":Lcom/itextpdf/io/font/cmap/CMapObject;
    if-eqz v0, :cond_1

    .line 68
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    invoke-virtual {v1}, Lcom/itextpdf/io/font/cmap/CMapObject;->isLiteral()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 71
    nop

    .line 73
    :cond_1
    return-void
.end method

.method public readArray()Lcom/itextpdf/io/font/cmap/CMapObject;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 112
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 114
    .local v0, "array":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/cmap/CMapObject;>;"
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/io/font/cmap/CMapContentParser;->readObject()Lcom/itextpdf/io/font/cmap/CMapObject;

    move-result-object v1

    .line 115
    .local v1, "obj":Lcom/itextpdf/io/font/cmap/CMapObject;
    invoke-virtual {v1}, Lcom/itextpdf/io/font/cmap/CMapObject;->isToken()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 116
    invoke-virtual {v1}, Lcom/itextpdf/io/font/cmap/CMapObject;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 117
    nop

    .line 125
    .end local v1    # "obj":Lcom/itextpdf/io/font/cmap/CMapObject;
    new-instance v1, Lcom/itextpdf/io/font/cmap/CMapObject;

    const/4 v2, 0x6

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/io/font/cmap/CMapObject;-><init>(ILjava/lang/Object;)V

    return-object v1

    .line 119
    .restart local v1    # "obj":Lcom/itextpdf/io/font/cmap/CMapObject;
    :cond_0
    invoke-virtual {v1}, Lcom/itextpdf/io/font/cmap/CMapObject;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, ">>"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 120
    iget-object v2, p0, Lcom/itextpdf/io/font/cmap/CMapContentParser;->tokeniser:Lcom/itextpdf/io/source/PdfTokenizer;

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    const-string v4, "Unexpected \'>>\'."

    invoke-virtual {v2, v4, v3}, Lcom/itextpdf/io/source/PdfTokenizer;->throwError(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 123
    :cond_1
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 124
    .end local v1    # "obj":Lcom/itextpdf/io/font/cmap/CMapObject;
    goto :goto_0
.end method

.method public readDictionary()Lcom/itextpdf/io/font/cmap/CMapObject;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 81
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 83
    .local v0, "dic":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/itextpdf/io/font/cmap/CMapObject;>;"
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/io/font/cmap/CMapContentParser;->nextValidToken()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 85
    iget-object v1, p0, Lcom/itextpdf/io/font/cmap/CMapContentParser;->tokeniser:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/PdfTokenizer;->getTokenType()Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    move-result-object v1

    sget-object v2, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->EndDic:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    if-ne v1, v2, :cond_0

    .line 86
    nop

    .line 103
    new-instance v1, Lcom/itextpdf/io/font/cmap/CMapObject;

    const/4 v2, 0x7

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/io/font/cmap/CMapObject;-><init>(ILjava/lang/Object;)V

    return-object v1

    .line 87
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/io/font/cmap/CMapContentParser;->tokeniser:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/PdfTokenizer;->getTokenType()Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    move-result-object v1

    sget-object v2, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Other:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    if-ne v1, v2, :cond_1

    iget-object v1, p0, Lcom/itextpdf/io/font/cmap/CMapContentParser;->tokeniser:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/PdfTokenizer;->getStringValue()Ljava/lang/String;

    move-result-object v1

    const-string v2, "def"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 88
    goto :goto_0

    .line 89
    :cond_1
    iget-object v1, p0, Lcom/itextpdf/io/font/cmap/CMapContentParser;->tokeniser:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/PdfTokenizer;->getTokenType()Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    move-result-object v1

    sget-object v2, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Name:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    if-ne v1, v2, :cond_4

    .line 91
    iget-object v1, p0, Lcom/itextpdf/io/font/cmap/CMapContentParser;->tokeniser:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/PdfTokenizer;->getStringValue()Ljava/lang/String;

    move-result-object v1

    .line 92
    .local v1, "name":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/itextpdf/io/font/cmap/CMapContentParser;->readObject()Lcom/itextpdf/io/font/cmap/CMapObject;

    move-result-object v2

    .line 93
    .local v2, "obj":Lcom/itextpdf/io/font/cmap/CMapObject;
    invoke-virtual {v2}, Lcom/itextpdf/io/font/cmap/CMapObject;->isToken()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 94
    invoke-virtual {v2}, Lcom/itextpdf/io/font/cmap/CMapObject;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, ">>"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_2

    .line 95
    iget-object v3, p0, Lcom/itextpdf/io/font/cmap/CMapContentParser;->tokeniser:Lcom/itextpdf/io/source/PdfTokenizer;

    const-string v5, "Unexpected \'>>\'."

    new-array v6, v4, [Ljava/lang/Object;

    invoke-virtual {v3, v5, v6}, Lcom/itextpdf/io/source/PdfTokenizer;->throwError(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 97
    :cond_2
    invoke-virtual {v2}, Lcom/itextpdf/io/font/cmap/CMapObject;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v5, "]"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 98
    iget-object v3, p0, Lcom/itextpdf/io/font/cmap/CMapContentParser;->tokeniser:Lcom/itextpdf/io/source/PdfTokenizer;

    const-string v5, "Unexpected close bracket."

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v3, v5, v4}, Lcom/itextpdf/io/source/PdfTokenizer;->throwError(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 101
    :cond_3
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    .end local v1    # "name":Ljava/lang/String;
    .end local v2    # "obj":Lcom/itextpdf/io/font/cmap/CMapObject;
    goto :goto_0

    .line 90
    :cond_4
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v2, "Dictionary key {0} is not a name."

    invoke-direct {v1, v2}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/itextpdf/io/font/cmap/CMapContentParser;->tokeniser:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/PdfTokenizer;->getStringValue()Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v1

    throw v1

    .line 84
    :cond_5
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v2, "Unexpected end of file."

    invoke-direct {v1, v2}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public readObject()Lcom/itextpdf/io/font/cmap/CMapObject;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 134
    invoke-virtual {p0}, Lcom/itextpdf/io/font/cmap/CMapContentParser;->nextValidToken()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 135
    return-object v1

    .line 136
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/font/cmap/CMapContentParser;->tokeniser:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/PdfTokenizer;->getTokenType()Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    move-result-object v0

    .line 137
    .local v0, "type":Lcom/itextpdf/io/source/PdfTokenizer$TokenType;
    sget-object v2, Lcom/itextpdf/io/font/cmap/CMapContentParser$1;->$SwitchMap$com$itextpdf$io$source$PdfTokenizer$TokenType:[I

    invoke-virtual {v0}, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->ordinal()I

    move-result v3

    aget v2, v2, v3

    const/4 v3, 0x0

    const/16 v4, 0x8

    packed-switch v2, :pswitch_data_0

    .line 167
    new-instance v1, Lcom/itextpdf/io/font/cmap/CMapObject;

    const-string v2, ""

    invoke-direct {v1, v3, v2}, Lcom/itextpdf/io/font/cmap/CMapObject;-><init>(ILjava/lang/Object;)V

    return-object v1

    .line 165
    :pswitch_0
    new-instance v1, Lcom/itextpdf/io/font/cmap/CMapObject;

    const-string v2, ">>"

    invoke-direct {v1, v4, v2}, Lcom/itextpdf/io/font/cmap/CMapObject;-><init>(ILjava/lang/Object;)V

    return-object v1

    .line 163
    :pswitch_1
    new-instance v1, Lcom/itextpdf/io/font/cmap/CMapObject;

    const-string v2, "]"

    invoke-direct {v1, v4, v2}, Lcom/itextpdf/io/font/cmap/CMapObject;-><init>(ILjava/lang/Object;)V

    return-object v1

    .line 161
    :pswitch_2
    new-instance v1, Lcom/itextpdf/io/font/cmap/CMapObject;

    iget-object v2, p0, Lcom/itextpdf/io/font/cmap/CMapContentParser;->tokeniser:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/PdfTokenizer;->getStringValue()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x5

    invoke-direct {v1, v3, v2}, Lcom/itextpdf/io/font/cmap/CMapObject;-><init>(ILjava/lang/Object;)V

    return-object v1

    .line 153
    :pswitch_3
    new-instance v2, Lcom/itextpdf/io/font/cmap/CMapObject;

    const/4 v3, 0x4

    invoke-direct {v2, v3, v1}, Lcom/itextpdf/io/font/cmap/CMapObject;-><init>(ILjava/lang/Object;)V

    .line 155
    .local v2, "numObject":Lcom/itextpdf/io/font/cmap/CMapObject;
    :try_start_0
    iget-object v1, p0, Lcom/itextpdf/io/font/cmap/CMapContentParser;->tokeniser:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/PdfTokenizer;->getStringValue()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v3

    double-to-int v1, v3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/itextpdf/io/font/cmap/CMapObject;->setValue(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 158
    goto :goto_0

    .line 156
    :catch_0
    move-exception v1

    .line 157
    .local v1, "e":Ljava/lang/NumberFormatException;
    const/high16 v3, -0x80000000

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/io/font/cmap/CMapObject;->setValue(Ljava/lang/Object;)V

    .line 159
    .end local v1    # "e":Ljava/lang/NumberFormatException;
    :goto_0
    return-object v2

    .line 151
    .end local v2    # "numObject":Lcom/itextpdf/io/font/cmap/CMapObject;
    :pswitch_4
    new-instance v1, Lcom/itextpdf/io/font/cmap/CMapObject;

    iget-object v2, p0, Lcom/itextpdf/io/font/cmap/CMapContentParser;->tokeniser:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/PdfTokenizer;->getByteContent()[B

    move-result-object v2

    invoke-static {v2}, Lcom/itextpdf/io/util/PdfNameUtil;->decodeName([B)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x3

    invoke-direct {v1, v3, v2}, Lcom/itextpdf/io/font/cmap/CMapObject;-><init>(ILjava/lang/Object;)V

    return-object v1

    .line 144
    :pswitch_5
    iget-object v1, p0, Lcom/itextpdf/io/font/cmap/CMapContentParser;->tokeniser:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/PdfTokenizer;->isHexString()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    .line 145
    new-instance v1, Lcom/itextpdf/io/font/cmap/CMapObject;

    iget-object v3, p0, Lcom/itextpdf/io/font/cmap/CMapContentParser;->tokeniser:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v3}, Lcom/itextpdf/io/source/PdfTokenizer;->getByteContent()[B

    move-result-object v3

    invoke-static {v3, v2}, Lcom/itextpdf/io/source/PdfTokenizer;->decodeStringContent([BZ)[B

    move-result-object v2

    const/4 v3, 0x2

    invoke-direct {v1, v3, v2}, Lcom/itextpdf/io/font/cmap/CMapObject;-><init>(ILjava/lang/Object;)V

    .local v1, "obj":Lcom/itextpdf/io/font/cmap/CMapObject;
    goto :goto_1

    .line 147
    .end local v1    # "obj":Lcom/itextpdf/io/font/cmap/CMapObject;
    :cond_1
    new-instance v1, Lcom/itextpdf/io/font/cmap/CMapObject;

    iget-object v4, p0, Lcom/itextpdf/io/font/cmap/CMapContentParser;->tokeniser:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/PdfTokenizer;->getByteContent()[B

    move-result-object v4

    invoke-static {v4, v3}, Lcom/itextpdf/io/source/PdfTokenizer;->decodeStringContent([BZ)[B

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/io/font/cmap/CMapObject;-><init>(ILjava/lang/Object;)V

    .line 149
    .restart local v1    # "obj":Lcom/itextpdf/io/font/cmap/CMapObject;
    :goto_1
    return-object v1

    .line 141
    .end local v1    # "obj":Lcom/itextpdf/io/font/cmap/CMapObject;
    :pswitch_6
    invoke-virtual {p0}, Lcom/itextpdf/io/font/cmap/CMapContentParser;->readArray()Lcom/itextpdf/io/font/cmap/CMapObject;

    move-result-object v1

    return-object v1

    .line 139
    :pswitch_7
    invoke-virtual {p0}, Lcom/itextpdf/io/font/cmap/CMapContentParser;->readDictionary()Lcom/itextpdf/io/font/cmap/CMapObject;

    move-result-object v1

    return-object v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
