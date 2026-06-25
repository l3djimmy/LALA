.class public Lcom/itextpdf/kernel/xmp/XmlDomWriter;
.super Ljava/lang/Object;
.source "XmlDomWriter.java"


# instance fields
.field protected fCanonical:Z

.field protected fOut:Ljava/io/PrintWriter;

.field protected fXML11:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 0
    .param p1, "canonical"    # Z

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput-boolean p1, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fCanonical:Z

    .line 67
    return-void
.end method


# virtual methods
.method protected normalizeAndPrint(CZ)V
    .locals 3
    .param p1, "c"    # C
    .param p2, "isAttValue"    # Z

    .line 313
    sparse-switch p1, :sswitch_data_0

    goto :goto_0

    .line 319
    :sswitch_0
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    const-string v1, "&gt;"

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 320
    goto/16 :goto_1

    .line 315
    :sswitch_1
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    const-string v1, "&lt;"

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 316
    goto/16 :goto_1

    .line 323
    :sswitch_2
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    const-string v1, "&amp;"

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 324
    goto/16 :goto_1

    .line 329
    :sswitch_3
    nop

    .line 332
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    .line 329
    if-eqz p2, :cond_0

    .line 330
    const-string v1, "&quot;"

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_1

    .line 332
    :cond_0
    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 334
    goto :goto_1

    .line 341
    :sswitch_4
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    const-string v1, "&#xD;"

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 342
    goto :goto_1

    .line 345
    :sswitch_5
    iget-boolean v0, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fCanonical:Z

    if-eqz v0, :cond_1

    .line 346
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    const-string v1, "&#xA;"

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 347
    goto :goto_1

    .line 360
    :cond_1
    :goto_0
    iget-boolean v0, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fXML11:Z

    const/16 v1, 0xa

    const/16 v2, 0x9

    if-eqz v0, :cond_4

    const/4 v0, 0x1

    if-lt p1, v0, :cond_2

    const/16 v0, 0x1f

    if-gt p1, v0, :cond_2

    if-eq p1, v2, :cond_2

    if-ne p1, v1, :cond_5

    :cond_2
    const/16 v0, 0x7f

    if-lt p1, v0, :cond_3

    const/16 v0, 0x9f

    if-le p1, v0, :cond_5

    :cond_3
    const/16 v0, 0x2028

    if-eq p1, v0, :cond_5

    :cond_4
    if-eqz p2, :cond_6

    if-eq p1, v2, :cond_5

    if-ne p1, v1, :cond_6

    .line 363
    :cond_5
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    const-string v1, "&#x"

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 364
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 365
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    const-string v1, ";"

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_1

    .line 367
    :cond_6
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    invoke-virtual {v0, p1}, Ljava/io/PrintWriter;->print(C)V

    .line 371
    :goto_1
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        0xa -> :sswitch_5
        0xd -> :sswitch_4
        0x22 -> :sswitch_3
        0x26 -> :sswitch_2
        0x3c -> :sswitch_1
        0x3e -> :sswitch_0
    .end sparse-switch
.end method

.method protected normalizeAndPrint(Ljava/lang/String;Z)V
    .locals 3
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "isAttValue"    # Z

    .line 297
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 298
    .local v0, "len":I
    :goto_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, v0, :cond_1

    .line 299
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 300
    .local v2, "c":C
    invoke-virtual {p0, v2, p2}, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->normalizeAndPrint(CZ)V

    .line 298
    .end local v2    # "c":C
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 303
    .end local v1    # "i":I
    :cond_1
    return-void
.end method

.method public setCanonical(Z)V
    .locals 0
    .param p1, "canonical"    # Z

    .line 79
    iput-boolean p1, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fCanonical:Z

    .line 80
    return-void
.end method

.method public setOutput(Ljava/io/OutputStream;Ljava/lang/String;)V
    .locals 2
    .param p1, "stream"    # Ljava/io/OutputStream;
    .param p2, "encoding"    # Ljava/lang/String;

    .line 90
    if-nez p2, :cond_0

    .line 91
    const-string p2, "UTF8"

    .line 94
    :cond_0
    new-instance v0, Ljava/io/OutputStreamWriter;

    invoke-static {p2}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    .line 95
    .local v0, "osw":Ljava/io/OutputStreamWriter;
    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    iput-object v1, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    .line 97
    return-void
.end method

.method protected sortAttributes(Lorg/w3c/dom/NamedNodeMap;)[Lorg/w3c/dom/Attr;
    .locals 8
    .param p1, "attrs"    # Lorg/w3c/dom/NamedNodeMap;

    .line 259
    if-eqz p1, :cond_0

    invoke-interface {p1}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 260
    .local v0, "len":I
    :goto_0
    new-array v1, v0, [Lorg/w3c/dom/Attr;

    .line 261
    .local v1, "array":[Lorg/w3c/dom/Attr;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v0, :cond_1

    .line 262
    invoke-interface {p1, v2}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v3

    check-cast v3, Lorg/w3c/dom/Attr;

    aput-object v3, v1, v2

    .line 261
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 264
    .end local v2    # "i":I
    :cond_1
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_2
    add-int/lit8 v3, v0, -0x1

    if-ge v2, v3, :cond_5

    .line 265
    aget-object v3, v1, v2

    invoke-interface {v3}, Lorg/w3c/dom/Attr;->getNodeName()Ljava/lang/String;

    move-result-object v3

    .line 266
    .local v3, "name":Ljava/lang/String;
    move v4, v2

    .line 267
    .local v4, "index":I
    add-int/lit8 v5, v2, 0x1

    .local v5, "j":I
    :goto_3
    if-ge v5, v0, :cond_3

    .line 268
    aget-object v6, v1, v5

    invoke-interface {v6}, Lorg/w3c/dom/Attr;->getNodeName()Ljava/lang/String;

    move-result-object v6

    .line 269
    .local v6, "curName":Ljava/lang/String;
    invoke-virtual {v6, v3}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v7

    if-gez v7, :cond_2

    .line 270
    move-object v3, v6

    .line 271
    move v4, v5

    .line 267
    .end local v6    # "curName":Ljava/lang/String;
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 274
    .end local v5    # "j":I
    :cond_3
    if-eq v4, v2, :cond_4

    .line 275
    aget-object v5, v1, v2

    .line 276
    .local v5, "temp":Lorg/w3c/dom/Attr;
    aget-object v6, v1, v4

    aput-object v6, v1, v2

    .line 277
    aput-object v5, v1, v4

    .line 264
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "index":I
    .end local v5    # "temp":Lorg/w3c/dom/Attr;
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 281
    .end local v2    # "i":I
    :cond_5
    return-object v1
.end method

.method public write(Lorg/w3c/dom/Node;)V
    .locals 10
    .param p1, "node"    # Lorg/w3c/dom/Node;

    .line 107
    if-nez p1, :cond_0

    .line 108
    return-void

    .line 111
    :cond_0
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v0

    .line 112
    .local v0, "type":S
    const/16 v1, 0x20

    const/16 v2, 0x3e

    const/4 v3, 0x0

    const/4 v4, 0x1

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    goto/16 :goto_6

    .line 131
    :pswitch_1
    move-object v1, p1

    check-cast v1, Lorg/w3c/dom/DocumentType;

    .line 132
    .local v1, "doctype":Lorg/w3c/dom/DocumentType;
    iget-object v3, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    const-string v5, "<!DOCTYPE "

    invoke-virtual {v3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 133
    iget-object v3, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    invoke-interface {v1}, Lorg/w3c/dom/DocumentType;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 134
    invoke-interface {v1}, Lorg/w3c/dom/DocumentType;->getPublicId()Ljava/lang/String;

    move-result-object v3

    .line 135
    .local v3, "publicId":Ljava/lang/String;
    invoke-interface {v1}, Lorg/w3c/dom/DocumentType;->getSystemId()Ljava/lang/String;

    move-result-object v5

    .line 136
    .local v5, "systemId":Ljava/lang/String;
    const/16 v6, 0x27

    if-eqz v3, :cond_1

    .line 137
    iget-object v7, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    const-string v8, " PUBLIC \'"

    invoke-virtual {v7, v8}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 138
    iget-object v7, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    invoke-virtual {v7, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 139
    iget-object v7, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    const-string v8, "\' \'"

    invoke-virtual {v7, v8}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 140
    iget-object v7, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    invoke-virtual {v7, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 141
    iget-object v7, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    invoke-virtual {v7, v6}, Ljava/io/PrintWriter;->print(C)V

    goto :goto_0

    .line 142
    :cond_1
    if-eqz v5, :cond_2

    .line 143
    iget-object v7, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    const-string v8, " SYSTEM \'"

    invoke-virtual {v7, v8}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 144
    iget-object v7, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    invoke-virtual {v7, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 145
    iget-object v7, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    invoke-virtual {v7, v6}, Ljava/io/PrintWriter;->print(C)V

    .line 147
    :cond_2
    :goto_0
    invoke-interface {v1}, Lorg/w3c/dom/DocumentType;->getInternalSubset()Ljava/lang/String;

    move-result-object v6

    .line 148
    .local v6, "internalSubset":Ljava/lang/String;
    const/16 v7, 0xa

    if-eqz v6, :cond_3

    .line 149
    iget-object v8, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    const-string v9, " ["

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 150
    iget-object v8, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    invoke-virtual {v8, v7}, Ljava/io/PrintWriter;->print(C)V

    .line 151
    iget-object v8, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    invoke-virtual {v8, v6}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 152
    iget-object v8, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    const/16 v9, 0x5d

    invoke-virtual {v8, v9}, Ljava/io/PrintWriter;->print(C)V

    .line 154
    :cond_3
    iget-object v8, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    invoke-virtual {v8, v2}, Ljava/io/PrintWriter;->print(C)V

    .line 155
    iget-object v8, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    invoke-virtual {v8, v7}, Ljava/io/PrintWriter;->print(C)V

    .line 156
    goto/16 :goto_6

    .line 114
    .end local v1    # "doctype":Lorg/w3c/dom/DocumentType;
    .end local v3    # "publicId":Ljava/lang/String;
    .end local v5    # "systemId":Ljava/lang/String;
    .end local v6    # "internalSubset":Ljava/lang/String;
    :pswitch_2
    move-object v1, p1

    check-cast v1, Lorg/w3c/dom/Document;

    .line 115
    .local v1, "document":Lorg/w3c/dom/Document;
    iput-boolean v3, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fXML11:Z

    .line 116
    iget-boolean v3, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fCanonical:Z

    if-nez v3, :cond_5

    .line 117
    iget-boolean v3, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fXML11:Z

    .line 120
    iget-object v5, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    .line 117
    if-eqz v3, :cond_4

    .line 118
    const-string v3, "<?xml version=\"1.1\" encoding=\"UTF-8\"?>"

    invoke-virtual {v5, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_1

    .line 120
    :cond_4
    const-string v3, "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"

    invoke-virtual {v5, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 122
    :goto_1
    iget-object v3, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    const-string v5, "\n"

    invoke-virtual {v3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 123
    iget-object v3, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    invoke-virtual {v3}, Ljava/io/PrintWriter;->flush()V

    .line 124
    invoke-interface {v1}, Lorg/w3c/dom/Document;->getDoctype()Lorg/w3c/dom/DocumentType;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->write(Lorg/w3c/dom/Node;)V

    .line 126
    :cond_5
    invoke-interface {v1}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->write(Lorg/w3c/dom/Node;)V

    .line 127
    goto/16 :goto_6

    .line 230
    .end local v1    # "document":Lorg/w3c/dom/Document;
    :pswitch_3
    iget-boolean v1, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fCanonical:Z

    if-nez v1, :cond_c

    .line 231
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    const-string v3, "<!--"

    invoke-virtual {v1, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 232
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v1

    .line 233
    .local v1, "comment":Ljava/lang/String;
    if-eqz v1, :cond_6

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_6

    .line 234
    iget-object v3, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    invoke-virtual {v3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 236
    :cond_6
    iget-object v3, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    const-string v5, "-->"

    invoke-virtual {v3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 237
    iget-object v3, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    invoke-virtual {v3}, Ljava/io/PrintWriter;->flush()V

    goto/16 :goto_6

    .line 217
    .end local v1    # "comment":Ljava/lang/String;
    :pswitch_4
    iget-object v3, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    const-string v5, "<?"

    invoke-virtual {v3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 218
    iget-object v3, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 219
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v3

    .line 220
    .local v3, "data":Ljava/lang/String;
    if-eqz v3, :cond_7

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_7

    .line 221
    iget-object v5, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    invoke-virtual {v5, v1}, Ljava/io/PrintWriter;->print(C)V

    .line 222
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    invoke-virtual {v1, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 224
    :cond_7
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    const-string v5, "?>"

    invoke-virtual {v1, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 225
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    invoke-virtual {v1}, Ljava/io/PrintWriter;->flush()V

    .line 226
    goto/16 :goto_6

    .line 183
    .end local v3    # "data":Ljava/lang/String;
    :pswitch_5
    iget-boolean v1, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fCanonical:Z

    if-eqz v1, :cond_9

    .line 184
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v1

    .line 185
    .local v1, "child":Lorg/w3c/dom/Node;
    :goto_2
    if-eqz v1, :cond_8

    .line 186
    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->write(Lorg/w3c/dom/Node;)V

    .line 187
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object v1

    goto :goto_2

    .line 189
    .end local v1    # "child":Lorg/w3c/dom/Node;
    :cond_8
    goto/16 :goto_6

    .line 190
    :cond_9
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    const/16 v3, 0x26

    invoke-virtual {v1, v3}, Ljava/io/PrintWriter;->print(C)V

    .line 191
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 192
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    const/16 v3, 0x3b

    invoke-virtual {v1, v3}, Ljava/io/PrintWriter;->print(C)V

    .line 193
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    invoke-virtual {v1}, Ljava/io/PrintWriter;->flush()V

    .line 195
    goto/16 :goto_6

    .line 199
    :pswitch_6
    iget-boolean v1, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fCanonical:Z

    if-eqz v1, :cond_a

    .line 200
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v3}, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->normalizeAndPrint(Ljava/lang/String;Z)V

    goto :goto_3

    .line 202
    :cond_a
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    const-string v3, "<![CDATA["

    invoke-virtual {v1, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 203
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 204
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    const-string v3, "]]>"

    invoke-virtual {v1, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 206
    :goto_3
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    invoke-virtual {v1}, Ljava/io/PrintWriter;->flush()V

    .line 207
    goto :goto_6

    .line 211
    :pswitch_7
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v3}, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->normalizeAndPrint(Ljava/lang/String;Z)V

    .line 212
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    invoke-virtual {v1}, Ljava/io/PrintWriter;->flush()V

    .line 213
    goto :goto_6

    .line 160
    :pswitch_8
    iget-object v3, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    const/16 v5, 0x3c

    invoke-virtual {v3, v5}, Ljava/io/PrintWriter;->print(C)V

    .line 161
    iget-object v3, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 162
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->sortAttributes(Lorg/w3c/dom/NamedNodeMap;)[Lorg/w3c/dom/Attr;

    move-result-object v3

    .line 163
    .local v3, "attrs":[Lorg/w3c/dom/Attr;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_4
    array-length v6, v3

    if-ge v5, v6, :cond_b

    .line 164
    aget-object v6, v3, v5

    .line 165
    .local v6, "attr":Lorg/w3c/dom/Attr;
    iget-object v7, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    invoke-virtual {v7, v1}, Ljava/io/PrintWriter;->print(C)V

    .line 166
    iget-object v7, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    invoke-interface {v6}, Lorg/w3c/dom/Attr;->getNodeName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 167
    iget-object v7, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    const-string v8, "=\""

    invoke-virtual {v7, v8}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 168
    invoke-interface {v6}, Lorg/w3c/dom/Attr;->getNodeValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7, v4}, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->normalizeAndPrint(Ljava/lang/String;Z)V

    .line 169
    iget-object v7, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    const/16 v8, 0x22

    invoke-virtual {v7, v8}, Ljava/io/PrintWriter;->print(C)V

    .line 163
    .end local v6    # "attr":Lorg/w3c/dom/Attr;
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    .line 171
    .end local v5    # "i":I
    :cond_b
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    invoke-virtual {v1, v2}, Ljava/io/PrintWriter;->print(C)V

    .line 172
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    invoke-virtual {v1}, Ljava/io/PrintWriter;->flush()V

    .line 174
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v1

    .line 175
    .restart local v1    # "child":Lorg/w3c/dom/Node;
    :goto_5
    if-eqz v1, :cond_c

    .line 176
    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->write(Lorg/w3c/dom/Node;)V

    .line 177
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object v1

    goto :goto_5

    .line 242
    .end local v1    # "child":Lorg/w3c/dom/Node;
    .end local v3    # "attrs":[Lorg/w3c/dom/Attr;
    :cond_c
    :goto_6
    if-ne v0, v4, :cond_d

    .line 243
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    const-string v3, "</"

    invoke-virtual {v1, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 244
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 245
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    invoke-virtual {v1, v2}, Ljava/io/PrintWriter;->print(C)V

    .line 246
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/XmlDomWriter;->fOut:Ljava/io/PrintWriter;

    invoke-virtual {v1}, Ljava/io/PrintWriter;->flush()V

    .line 249
    :cond_d
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_8
        :pswitch_0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method
