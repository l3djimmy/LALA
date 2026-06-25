.class public final Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathParser;
.super Ljava/lang/Object;
.source "XMPPathParser.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    return-void
.end method

.method public static expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;
    .locals 11
    .param p0, "schemaNS"    # Ljava/lang/String;
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 107
    if-eqz p0, :cond_9

    if-eqz p1, :cond_9

    .line 112
    new-instance v0, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;

    invoke-direct {v0}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;-><init>()V

    .line 113
    .local v0, "expandedXPath":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;
    new-instance v1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;

    invoke-direct {v1}, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;-><init>()V

    .line 114
    .local v1, "pos":Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;
    iput-object p1, v1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->path:Ljava/lang/String;

    .line 118
    invoke-static {p0, v1, v0}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathParser;->parseRootNode(Ljava/lang/String;Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;)V

    .line 121
    :goto_0
    iget v2, v1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_8

    .line 123
    iget v2, v1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    iput v2, v1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepBegin:I

    .line 125
    invoke-static {p1, v1}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathParser;->skipPathDelimiter(Ljava/lang/String;Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;)V

    .line 127
    iget v2, v1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepBegin:I

    iput v2, v1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    .line 131
    iget v2, v1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepBegin:I

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x5b

    if-eq v2, v3, :cond_0

    .line 134
    invoke-static {v1}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathParser;->parseStructSegment(Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;

    move-result-object v2

    .local v2, "segment":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;
    goto :goto_1

    .line 139
    .end local v2    # "segment":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;
    :cond_0
    invoke-static {v1}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathParser;->parseIndexSegment(Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;

    move-result-object v2

    .line 143
    .restart local v2    # "segment":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;
    :goto_1
    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->getKind()I

    move-result v3

    const/16 v4, 0x66

    const-string v5, "Only xml:lang allowed with \'@\'"

    const/4 v6, 0x2

    const/16 v7, 0x3f

    const/16 v8, 0x40

    const/4 v9, 0x1

    if-ne v3, v9, :cond_4

    .line 145
    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->getName()Ljava/lang/String;

    move-result-object v3

    const/4 v10, 0x0

    invoke-virtual {v3, v10}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v8, :cond_2

    .line 147
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "?"

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->setName(Ljava/lang/String;)V

    .line 148
    const-string v3, "?xml:lang"

    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_2

    .line 150
    :cond_1
    new-instance v3, Lcom/itextpdf/kernel/xmp/XMPException;

    invoke-direct {v3, v5, v4}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v3

    .line 154
    :cond_2
    :goto_2
    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v10}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v7, :cond_3

    .line 156
    iget v3, v1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->nameStart:I

    add-int/2addr v3, v9

    iput v3, v1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->nameStart:I

    .line 157
    invoke-virtual {v2, v6}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->setKind(I)V

    .line 160
    :cond_3
    iget-object v3, v1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->path:Ljava/lang/String;

    iget v4, v1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->nameStart:I

    iget v5, v1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->nameEnd:I

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathParser;->verifyQualName(Ljava/lang/String;)V

    goto :goto_4

    .line 162
    :cond_4
    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->getKind()I

    move-result v3

    const/4 v10, 0x6

    if-ne v3, v10, :cond_7

    .line 164
    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v9}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v8, :cond_6

    .line 166
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "[?"

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->setName(Ljava/lang/String;)V

    .line 167
    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v6, "[?xml:lang="

    invoke-virtual {v3, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    goto :goto_3

    .line 169
    :cond_5
    new-instance v3, Lcom/itextpdf/kernel/xmp/XMPException;

    invoke-direct {v3, v5, v4}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v3

    .line 174
    :cond_6
    :goto_3
    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v9}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v7, :cond_7

    .line 176
    iget v3, v1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->nameStart:I

    add-int/2addr v3, v9

    iput v3, v1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->nameStart:I

    .line 177
    const/4 v3, 0x5

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->setKind(I)V

    .line 178
    iget-object v3, v1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->path:Ljava/lang/String;

    iget v4, v1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->nameStart:I

    iget v5, v1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->nameEnd:I

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathParser;->verifyQualName(Ljava/lang/String;)V

    .line 182
    :cond_7
    :goto_4
    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;->add(Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;)V

    .line 183
    .end local v2    # "segment":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;
    goto/16 :goto_0

    .line 184
    :cond_8
    return-object v0

    .line 109
    .end local v0    # "expandedXPath":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;
    .end local v1    # "pos":Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;
    :cond_9
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Parameter must not be null"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method private static parseIndexSegment(Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;
    .locals 7
    .param p0, "pos"    # Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 259
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    .line 261
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->path:Ljava/lang/String;

    iget v1, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/4 v1, 0x0

    const/16 v2, 0x5d

    const/16 v3, 0x66

    const/16 v4, 0x30

    if-gt v4, v0, :cond_1

    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->path:Ljava/lang/String;

    iget v5, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v5, 0x39

    if-gt v0, v5, :cond_1

    .line 264
    :goto_0
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    iget-object v6, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->path:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v0, v6, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->path:Ljava/lang/String;

    iget v6, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-gt v4, v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->path:Ljava/lang/String;

    iget v6, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    .line 265
    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-gt v0, v5, :cond_0

    .line 267
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    goto :goto_0

    .line 270
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;

    const/4 v4, 0x3

    invoke-direct {v0, v1, v4}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;-><init>(Ljava/lang/String;I)V

    .local v0, "segment":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;
    goto/16 :goto_5

    .line 276
    .end local v0    # "segment":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;
    :cond_1
    :goto_1
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    iget-object v4, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->path:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v0, v4, :cond_2

    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->path:Ljava/lang/String;

    iget v4, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-eq v0, v2, :cond_2

    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->path:Ljava/lang/String;

    iget v4, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    .line 277
    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v4, 0x3d

    if-eq v0, v4, :cond_2

    .line 279
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    goto :goto_1

    .line 282
    :cond_2
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    iget-object v4, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->path:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v0, v4, :cond_c

    .line 287
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->path:Ljava/lang/String;

    iget v4, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ne v0, v2, :cond_4

    .line 289
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->path:Ljava/lang/String;

    iget v4, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepBegin:I

    iget v5, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    invoke-virtual {v0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    const-string v4, "[last()"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 294
    new-instance v0, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;

    const/4 v4, 0x4

    invoke-direct {v0, v1, v4}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;-><init>(Ljava/lang/String;I)V

    .restart local v0    # "segment":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;
    goto/16 :goto_5

    .line 291
    .end local v0    # "segment":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;
    :cond_3
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Invalid non-numeric array index"

    invoke-direct {v0, v1, v3}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 298
    :cond_4
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepBegin:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->nameStart:I

    .line 299
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->nameEnd:I

    .line 300
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    .line 301
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->path:Ljava/lang/String;

    iget v4, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 302
    .local v0, "quote":C
    const/16 v4, 0x27

    if-eq v0, v4, :cond_6

    const/16 v4, 0x22

    if-ne v0, v4, :cond_5

    goto :goto_2

    .line 304
    :cond_5
    new-instance v1, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v2, "Invalid quote in array selector"

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 308
    :cond_6
    :goto_2
    iget v4, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    .line 309
    :goto_3
    iget v4, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    iget-object v5, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->path:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v4, v5, :cond_9

    .line 311
    iget-object v4, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->path:Ljava/lang/String;

    iget v5, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    invoke-virtual {v4, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v0, :cond_8

    .line 314
    iget v4, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    add-int/lit8 v4, v4, 0x1

    iget-object v5, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->path:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v4, v5, :cond_9

    iget-object v4, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->path:Ljava/lang/String;

    iget v5, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    add-int/lit8 v5, v5, 0x1

    .line 315
    invoke-virtual {v4, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-eq v4, v0, :cond_7

    .line 317
    goto :goto_4

    .line 319
    :cond_7
    iget v4, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    .line 321
    :cond_8
    iget v4, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    goto :goto_3

    .line 324
    :cond_9
    :goto_4
    iget v4, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    iget-object v5, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->path:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v4, v5, :cond_b

    .line 329
    iget v4, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    .line 332
    new-instance v4, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;

    const/4 v5, 0x6

    invoke-direct {v4, v1, v5}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;-><init>(Ljava/lang/String;I)V

    move-object v0, v4

    .line 337
    .local v0, "segment":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;
    :goto_5
    iget v1, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    iget-object v4, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->path:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v1, v4, :cond_a

    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->path:Ljava/lang/String;

    iget v4, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-ne v1, v2, :cond_a

    .line 341
    iget v1, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    .line 342
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->path:Ljava/lang/String;

    iget v2, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepBegin:I

    iget v3, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->setName(Ljava/lang/String;)V

    .line 344
    return-object v0

    .line 339
    :cond_a
    new-instance v1, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v2, "Missing \']\' for array index"

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 326
    .local v0, "quote":C
    :cond_b
    new-instance v1, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v2, "No terminating quote for array selector"

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 284
    .end local v0    # "quote":C
    :cond_c
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Missing \']\' or \'=\' for array index"

    invoke-direct {v0, v1, v3}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method private static parseRootNode(Ljava/lang/String;Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;)V
    .locals 7
    .param p0, "schemaNS"    # Ljava/lang/String;
    .param p1, "pos"    # Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;
    .param p2, "expandedXPath"    # Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 359
    nop

    :goto_0
    iget v0, p1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    iget-object v1, p1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->path:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x1

    if-ge v0, v1, :cond_0

    iget-object v0, p1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->path:Ljava/lang/String;

    iget v1, p1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const-string v1, "/[*"

    invoke-virtual {v1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_0

    .line 361
    iget v0, p1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    add-int/2addr v0, v2

    iput v0, p1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    goto :goto_0

    .line 364
    :cond_0
    iget v0, p1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    iget v1, p1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepBegin:I

    if-eq v0, v1, :cond_4

    .line 369
    iget-object v0, p1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->path:Ljava/lang/String;

    iget v1, p1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepBegin:I

    iget v3, p1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    invoke-virtual {v0, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathParser;->verifyXPathRoot(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 370
    .local v0, "rootProp":Ljava/lang/String;
    invoke-static {}, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->getSchemaRegistry()Lcom/itextpdf/kernel/xmp/XMPSchemaRegistry;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/itextpdf/kernel/xmp/XMPSchemaRegistry;->findAlias(Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;

    move-result-object v1

    .line 371
    .local v1, "aliasInfo":Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;
    const/high16 v3, -0x80000000

    if-nez v1, :cond_1

    .line 374
    new-instance v4, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;

    invoke-direct {v4, p0, v3}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;-><init>(Ljava/lang/String;I)V

    invoke-virtual {p2, v4}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;->add(Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;)V

    .line 375
    new-instance v3, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;

    invoke-direct {v3, v0, v2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;-><init>(Ljava/lang/String;I)V

    .line 376
    .local v3, "rootStep":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;
    invoke-virtual {p2, v3}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;->add(Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;)V

    .line 377
    .end local v3    # "rootStep":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;
    goto :goto_1

    .line 381
    :cond_1
    new-instance v4, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;

    invoke-interface {v1}, Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;->getNamespace()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v3}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;-><init>(Ljava/lang/String;I)V

    invoke-virtual {p2, v4}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;->add(Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;)V

    .line 382
    new-instance v3, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;

    invoke-interface {v1}, Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;->getNamespace()Ljava/lang/String;

    move-result-object v4

    .line 383
    invoke-interface {v1}, Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;->getPropName()Ljava/lang/String;

    move-result-object v5

    .line 382
    invoke-static {v4, v5}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathParser;->verifyXPathRoot(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;-><init>(Ljava/lang/String;I)V

    .line 385
    .restart local v3    # "rootStep":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;
    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->setAlias(Z)V

    .line 386
    invoke-interface {v1}, Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;->getAliasForm()Lcom/itextpdf/kernel/xmp/options/AliasOptions;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/xmp/options/AliasOptions;->getOptions()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->setAliasForm(I)V

    .line 387
    invoke-virtual {p2, v3}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;->add(Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;)V

    .line 389
    invoke-interface {v1}, Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;->getAliasForm()Lcom/itextpdf/kernel/xmp/options/AliasOptions;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/xmp/options/AliasOptions;->isArrayAltText()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 391
    new-instance v4, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;

    const-string v5, "[?xml:lang=\'x-default\']"

    const/4 v6, 0x5

    invoke-direct {v4, v5, v6}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;-><init>(Ljava/lang/String;I)V

    .line 393
    .local v4, "qualSelectorStep":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;
    invoke-virtual {v4, v2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->setAlias(Z)V

    .line 394
    invoke-interface {v1}, Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;->getAliasForm()Lcom/itextpdf/kernel/xmp/options/AliasOptions;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/options/AliasOptions;->getOptions()I

    move-result v2

    invoke-virtual {v4, v2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->setAliasForm(I)V

    .line 395
    invoke-virtual {p2, v4}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;->add(Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;)V

    .line 396
    .end local v4    # "qualSelectorStep":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;
    goto :goto_1

    .line 397
    :cond_2
    invoke-interface {v1}, Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;->getAliasForm()Lcom/itextpdf/kernel/xmp/options/AliasOptions;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/xmp/options/AliasOptions;->isArray()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 399
    new-instance v4, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;

    const-string v5, "[1]"

    const/4 v6, 0x3

    invoke-direct {v4, v5, v6}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;-><init>(Ljava/lang/String;I)V

    .line 401
    .local v4, "indexStep":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;
    invoke-virtual {v4, v2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->setAlias(Z)V

    .line 402
    invoke-interface {v1}, Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;->getAliasForm()Lcom/itextpdf/kernel/xmp/options/AliasOptions;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/options/AliasOptions;->getOptions()I

    move-result v2

    invoke-virtual {v4, v2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->setAliasForm(I)V

    .line 403
    invoke-virtual {p2, v4}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;->add(Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;)V

    .line 406
    .end local v3    # "rootStep":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;
    .end local v4    # "indexStep":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;
    :cond_3
    :goto_1
    return-void

    .line 366
    .end local v0    # "rootProp":Ljava/lang/String;
    .end local v1    # "aliasInfo":Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;
    :cond_4
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Empty initial XMPPath step"

    const/16 v2, 0x66

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method private static parseStructSegment(Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;
    .locals 5
    .param p0, "pos"    # Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 229
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepBegin:I

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->nameStart:I

    .line 230
    :goto_0
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->path:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x1

    if-ge v0, v1, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->path:Ljava/lang/String;

    iget v1, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const-string v1, "/[*"

    invoke-virtual {v1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_0

    .line 232
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    add-int/2addr v0, v2

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    goto :goto_0

    .line 234
    :cond_0
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->nameEnd:I

    .line 236
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    iget v1, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepBegin:I

    if-eq v0, v1, :cond_1

    .line 242
    new-instance v0, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;

    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->path:Ljava/lang/String;

    iget v3, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepBegin:I

    iget v4, p0, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepEnd:I

    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;-><init>(Ljava/lang/String;I)V

    .line 244
    .local v0, "segment":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;
    return-object v0

    .line 238
    .end local v0    # "segment":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;
    :cond_1
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Empty XMPPath segment"

    const/16 v2, 0x66

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method private static skipPathDelimiter(Ljava/lang/String;Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;)V
    .locals 3
    .param p0, "path"    # Ljava/lang/String;
    .param p1, "pos"    # Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 195
    iget v0, p1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepBegin:I

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x2f

    const/16 v2, 0x66

    if-ne v0, v1, :cond_1

    .line 199
    iget v0, p1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepBegin:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepBegin:I

    .line 202
    iget v0, p1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepBegin:I

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    goto :goto_0

    .line 204
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Empty XMPPath segment"

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 208
    :cond_1
    :goto_0
    iget v0, p1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepBegin:I

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x2a

    if-ne v0, v1, :cond_3

    .line 212
    iget v0, p1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepBegin:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepBegin:I

    .line 213
    iget v0, p1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepBegin:I

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_2

    iget v0, p1, Lcom/itextpdf/kernel/xmp/impl/xpath/PathPosition;->stepBegin:I

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x5b

    if-ne v0, v1, :cond_2

    goto :goto_1

    .line 215
    :cond_2
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Missing \'[\' after \'*\'"

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 218
    :cond_3
    :goto_1
    return-void
.end method

.method private static verifyQualName(Ljava/lang/String;)V
    .locals 6
    .param p0, "qualName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 420
    const/16 v0, 0x3a

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 421
    .local v0, "colonPos":I
    const/16 v1, 0x66

    if-lez v0, :cond_1

    .line 423
    const/4 v2, 0x0

    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 424
    .local v2, "prefix":Ljava/lang/String;
    invoke-static {v2}, Lcom/itextpdf/kernel/xmp/impl/Utils;->isXMLNameNS(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 426
    invoke-static {}, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->getSchemaRegistry()Lcom/itextpdf/kernel/xmp/XMPSchemaRegistry;

    move-result-object v3

    invoke-interface {v3, v2}, Lcom/itextpdf/kernel/xmp/XMPSchemaRegistry;->getNamespaceURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 428
    .local v3, "regURI":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 430
    return-void

    .line 433
    :cond_0
    new-instance v4, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v5, "Unknown namespace prefix for qualified name"

    invoke-direct {v4, v5, v1}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v4

    .line 438
    .end local v2    # "prefix":Ljava/lang/String;
    .end local v3    # "regURI":Ljava/lang/String;
    :cond_1
    new-instance v2, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v3, "Ill-formed qualified name"

    invoke-direct {v2, v3, v1}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v2
.end method

.method private static verifySimpleXMLName(Ljava/lang/String;)V
    .locals 3
    .param p0, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 452
    invoke-static {p0}, Lcom/itextpdf/kernel/xmp/impl/Utils;->isXMLName(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 456
    return-void

    .line 454
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Bad XML name"

    const/16 v2, 0x66

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method private static verifyXPathRoot(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "schemaNS"    # Ljava/lang/String;
    .param p1, "rootProp"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 479
    const/16 v0, 0x65

    if-eqz p0, :cond_6

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_6

    .line 485
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x3f

    const/16 v4, 0x66

    if-eq v2, v3, :cond_5

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x40

    if-eq v2, v3, :cond_5

    .line 490
    const/16 v2, 0x2f

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-gez v2, :cond_4

    const/16 v2, 0x5b

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-gez v2, :cond_4

    .line 495
    invoke-static {}, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->getSchemaRegistry()Lcom/itextpdf/kernel/xmp/XMPSchemaRegistry;

    move-result-object v2

    invoke-interface {v2, p0}, Lcom/itextpdf/kernel/xmp/XMPSchemaRegistry;->getNamespacePrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 496
    .local v2, "prefix":Ljava/lang/String;
    if-eqz v2, :cond_3

    .line 503
    const/16 v3, 0x3a

    invoke-virtual {p1, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    .line 504
    .local v3, "colonPos":I
    if-gez v3, :cond_0

    .line 508
    invoke-static {p1}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathParser;->verifySimpleXMLName(Ljava/lang/String;)V

    .line 509
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 517
    :cond_0
    invoke-virtual {p1, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathParser;->verifySimpleXMLName(Ljava/lang/String;)V

    .line 518
    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathParser;->verifySimpleXMLName(Ljava/lang/String;)V

    .line 520
    add-int/lit8 v4, v3, 0x1

    invoke-virtual {p1, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 522
    .end local v2    # "prefix":Ljava/lang/String;
    .local v1, "prefix":Ljava/lang/String;
    invoke-static {}, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->getSchemaRegistry()Lcom/itextpdf/kernel/xmp/XMPSchemaRegistry;

    move-result-object v2

    invoke-interface {v2, p0}, Lcom/itextpdf/kernel/xmp/XMPSchemaRegistry;->getNamespacePrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 523
    .local v2, "regPrefix":Ljava/lang/String;
    if-eqz v2, :cond_2

    .line 527
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 533
    return-object p1

    .line 529
    :cond_1
    new-instance v4, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v5, "Schema namespace URI and prefix mismatch"

    invoke-direct {v4, v5, v0}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v4

    .line 525
    :cond_2
    new-instance v4, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v5, "Unknown schema namespace prefix"

    invoke-direct {v4, v5, v0}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v4

    .line 498
    .end local v1    # "prefix":Ljava/lang/String;
    .end local v3    # "colonPos":I
    .local v2, "prefix":Ljava/lang/String;
    :cond_3
    new-instance v1, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v3, "Unregistered schema namespace URI"

    invoke-direct {v1, v3, v0}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 492
    .end local v2    # "prefix":Ljava/lang/String;
    :cond_4
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Top level name must be simple"

    invoke-direct {v0, v1, v4}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 487
    :cond_5
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Top level name must not be a qualifier"

    invoke-direct {v0, v1, v4}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 481
    :cond_6
    new-instance v1, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v2, "Schema namespace URI is required"

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1
.end method
