.class public Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfFileSpec.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
        "Lcom/itextpdf/kernel/pdf/PdfObject;",
        ">;"
    }
.end annotation


# direct methods
.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 49
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 50
    return-void
.end method

.method private static createEmbeddedFileSpec(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfStream;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .locals 6
    .param p0, "doc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p1, "stream"    # Lcom/itextpdf/kernel/pdf/PdfStream;
    .param p2, "description"    # Ljava/lang/String;
    .param p3, "fileDisplay"    # Ljava/lang/String;
    .param p4, "afRelationshipValue"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 385
    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p4

    .end local p0    # "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p1    # "stream":Lcom/itextpdf/kernel/pdf/PdfStream;
    .end local p2    # "description":Ljava/lang/String;
    .end local p3    # "fileDisplay":Ljava/lang/String;
    .end local p4    # "afRelationshipValue":Lcom/itextpdf/kernel/pdf/PdfName;
    .local v0, "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .local v1, "stream":Lcom/itextpdf/kernel/pdf/PdfStream;
    .local v2, "description":Ljava/lang/String;
    .local v3, "fileDisplay":Ljava/lang/String;
    .local v5, "afRelationshipValue":Lcom/itextpdf/kernel/pdf/PdfName;
    invoke-static/range {v0 .. v5}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->createEmbeddedFileSpec(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfStream;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    move-result-object p0

    return-object p0
.end method

.method private static createEmbeddedFileSpec(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfStream;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .locals 4
    .param p0, "doc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p1, "stream"    # Lcom/itextpdf/kernel/pdf/PdfStream;
    .param p2, "description"    # Ljava/lang/String;
    .param p3, "fileDisplay"    # Ljava/lang/String;
    .param p4, "mimeType"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p5, "afRelationshipValue"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 343
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 344
    .local v0, "dict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->EmbeddedFile:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 345
    if-eqz p5, :cond_0

    .line 346
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AFRelationship:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, p5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_0

    .line 348
    :cond_0
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AFRelationship:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Unspecified:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 351
    :goto_0
    if-eqz p4, :cond_1

    .line 352
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1, p4}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_1

    .line 354
    :cond_1
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->ApplicationOctetStream:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 357
    :goto_1
    if-eqz p2, :cond_2

    .line 358
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Desc:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v2, p2}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 360
    :cond_2
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Filespec:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 361
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->F:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v2, p3}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 362
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->UF:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfString;

    const-string v3, "UnicodeBig"

    invoke-direct {v2, p3, v3}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 364
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 365
    .local v1, "ef":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->F:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 366
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->UF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 367
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->EF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v2, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 368
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->markStreamAsEmbeddedFile(Lcom/itextpdf/kernel/pdf/PdfStream;)V

    .line 370
    new-instance v2, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    invoke-direct {v2, v0}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    invoke-virtual {v2, p0}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    return-object v2
.end method

.method public static createEmbeddedFileSpec(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/io/InputStream;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .locals 7
    .param p0, "doc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "description"    # Ljava/lang/String;
    .param p3, "fileDisplay"    # Ljava/lang/String;
    .param p4, "mimeType"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p5, "fileParameter"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p6, "afRelationshipValue"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 298
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-direct {v0, p0, p1}, Lcom/itextpdf/kernel/pdf/PdfStream;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/io/InputStream;)V

    move-object v2, v0

    .line 299
    .local v2, "stream":Lcom/itextpdf/kernel/pdf/PdfStream;
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 300
    .local v0, "params":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz p5, :cond_0

    .line 301
    invoke-virtual {v0, p5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->mergeDifferent(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 303
    :cond_0
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ModDate:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 304
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ModDate:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfDate;

    invoke-direct {v3}, Lcom/itextpdf/kernel/pdf/PdfDate;-><init>()V

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfDate;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 306
    :cond_1
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Params:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v1, v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 307
    move-object v1, p0

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p6

    .end local p0    # "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p2    # "description":Ljava/lang/String;
    .end local p3    # "fileDisplay":Ljava/lang/String;
    .end local p4    # "mimeType":Lcom/itextpdf/kernel/pdf/PdfName;
    .end local p6    # "afRelationshipValue":Lcom/itextpdf/kernel/pdf/PdfName;
    .local v1, "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .local v3, "description":Ljava/lang/String;
    .local v4, "fileDisplay":Ljava/lang/String;
    .local v5, "mimeType":Lcom/itextpdf/kernel/pdf/PdfName;
    .local v6, "afRelationshipValue":Lcom/itextpdf/kernel/pdf/PdfName;
    invoke-static/range {v1 .. v6}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->createEmbeddedFileSpec(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfStream;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    move-result-object p0

    return-object p0
.end method

.method public static createEmbeddedFileSpec(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/io/InputStream;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .locals 7
    .param p0, "doc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "description"    # Ljava/lang/String;
    .param p3, "fileDisplay"    # Ljava/lang/String;
    .param p4, "mimeType"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p5, "afRelationshipValue"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 325
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v6, p5

    .end local p0    # "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p1    # "is":Ljava/io/InputStream;
    .end local p2    # "description":Ljava/lang/String;
    .end local p3    # "fileDisplay":Ljava/lang/String;
    .end local p4    # "mimeType":Lcom/itextpdf/kernel/pdf/PdfName;
    .end local p5    # "afRelationshipValue":Lcom/itextpdf/kernel/pdf/PdfName;
    .local v0, "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .local v1, "is":Ljava/io/InputStream;
    .local v2, "description":Ljava/lang/String;
    .local v3, "fileDisplay":Ljava/lang/String;
    .local v4, "mimeType":Lcom/itextpdf/kernel/pdf/PdfName;
    .local v6, "afRelationshipValue":Lcom/itextpdf/kernel/pdf/PdfName;
    invoke-static/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->createEmbeddedFileSpec(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/io/InputStream;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    move-result-object p0

    return-object p0
.end method

.method public static createEmbeddedFileSpec(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .locals 7
    .param p0, "doc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p1, "filePath"    # Ljava/lang/String;
    .param p2, "fileDisplay"    # Ljava/lang/String;
    .param p3, "afRelationshipValue"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 279
    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v2, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v6, p3

    .end local p0    # "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p1    # "filePath":Ljava/lang/String;
    .end local p2    # "fileDisplay":Ljava/lang/String;
    .end local p3    # "afRelationshipValue":Lcom/itextpdf/kernel/pdf/PdfName;
    .local v0, "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .local v1, "filePath":Ljava/lang/String;
    .local v3, "fileDisplay":Ljava/lang/String;
    .local v6, "afRelationshipValue":Lcom/itextpdf/kernel/pdf/PdfName;
    invoke-static/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->createEmbeddedFileSpec(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    move-result-object p0

    return-object p0
.end method

.method public static createEmbeddedFileSpec(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .locals 7
    .param p0, "doc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p1, "filePath"    # Ljava/lang/String;
    .param p2, "description"    # Ljava/lang/String;
    .param p3, "fileDisplay"    # Ljava/lang/String;
    .param p4, "afRelationshipValue"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 263
    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v6, p4

    .end local p0    # "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p1    # "filePath":Ljava/lang/String;
    .end local p2    # "description":Ljava/lang/String;
    .end local p3    # "fileDisplay":Ljava/lang/String;
    .end local p4    # "afRelationshipValue":Lcom/itextpdf/kernel/pdf/PdfName;
    .local v0, "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .local v1, "filePath":Ljava/lang/String;
    .local v2, "description":Ljava/lang/String;
    .local v3, "fileDisplay":Ljava/lang/String;
    .local v6, "afRelationshipValue":Lcom/itextpdf/kernel/pdf/PdfName;
    invoke-static/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->createEmbeddedFileSpec(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    move-result-object p0

    return-object p0
.end method

.method public static createEmbeddedFileSpec(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .locals 8
    .param p0, "doc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p1, "filePath"    # Ljava/lang/String;
    .param p2, "description"    # Ljava/lang/String;
    .param p3, "fileDisplay"    # Ljava/lang/String;
    .param p4, "mimeType"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p5, "fileParameter"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p6, "afRelationshipValue"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 218
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-static {p1}, Lcom/itextpdf/io/util/UrlUtil;->toURL(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/io/InputStream;)V

    move-object v3, v0

    .line 219
    .local v3, "stream":Lcom/itextpdf/kernel/pdf/PdfStream;
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 220
    .local v0, "params":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz p5, :cond_0

    .line 221
    invoke-virtual {v0, p5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->mergeDifferent(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 223
    :cond_0
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ModDate:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 224
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ModDate:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfDate;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/PdfDate;-><init>()V

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDate;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 226
    :cond_1
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Params:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v1, v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 227
    move-object v2, p0

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p6

    .end local p0    # "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p2    # "description":Ljava/lang/String;
    .end local p3    # "fileDisplay":Ljava/lang/String;
    .end local p4    # "mimeType":Lcom/itextpdf/kernel/pdf/PdfName;
    .end local p6    # "afRelationshipValue":Lcom/itextpdf/kernel/pdf/PdfName;
    .local v2, "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .local v4, "description":Ljava/lang/String;
    .local v5, "fileDisplay":Ljava/lang/String;
    .local v6, "mimeType":Lcom/itextpdf/kernel/pdf/PdfName;
    .local v7, "afRelationshipValue":Lcom/itextpdf/kernel/pdf/PdfName;
    invoke-static/range {v2 .. v7}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->createEmbeddedFileSpec(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfStream;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    move-result-object p0

    return-object p0
.end method

.method public static createEmbeddedFileSpec(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .locals 7
    .param p0, "doc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p1, "filePath"    # Ljava/lang/String;
    .param p2, "description"    # Ljava/lang/String;
    .param p3, "fileDisplay"    # Ljava/lang/String;
    .param p4, "mimeType"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p5, "afRelationshipValue"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 246
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v6, p5

    .end local p0    # "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p1    # "filePath":Ljava/lang/String;
    .end local p2    # "description":Ljava/lang/String;
    .end local p3    # "fileDisplay":Ljava/lang/String;
    .end local p4    # "mimeType":Lcom/itextpdf/kernel/pdf/PdfName;
    .end local p5    # "afRelationshipValue":Lcom/itextpdf/kernel/pdf/PdfName;
    .local v0, "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .local v1, "filePath":Ljava/lang/String;
    .local v2, "description":Ljava/lang/String;
    .local v3, "fileDisplay":Ljava/lang/String;
    .local v4, "mimeType":Lcom/itextpdf/kernel/pdf/PdfName;
    .local v6, "afRelationshipValue":Lcom/itextpdf/kernel/pdf/PdfName;
    invoke-static/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->createEmbeddedFileSpec(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    move-result-object p0

    return-object p0
.end method

.method public static createEmbeddedFileSpec(Lcom/itextpdf/kernel/pdf/PdfDocument;[BLjava/lang/String;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .locals 7
    .param p0, "doc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p1, "fileStore"    # [B
    .param p2, "fileDisplay"    # Ljava/lang/String;
    .param p3, "fileParameter"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p4, "afRelationshipValue"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 166
    const/4 v2, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v5, p3

    move-object v6, p4

    .end local p0    # "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p1    # "fileStore":[B
    .end local p2    # "fileDisplay":Ljava/lang/String;
    .end local p3    # "fileParameter":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local p4    # "afRelationshipValue":Lcom/itextpdf/kernel/pdf/PdfName;
    .local v0, "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .local v1, "fileStore":[B
    .local v3, "fileDisplay":Ljava/lang/String;
    .local v5, "fileParameter":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .local v6, "afRelationshipValue":Lcom/itextpdf/kernel/pdf/PdfName;
    invoke-static/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->createEmbeddedFileSpec(Lcom/itextpdf/kernel/pdf/PdfDocument;[BLjava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    move-result-object p0

    return-object p0
.end method

.method public static createEmbeddedFileSpec(Lcom/itextpdf/kernel/pdf/PdfDocument;[BLjava/lang/String;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .locals 7
    .param p0, "doc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p1, "fileStore"    # [B
    .param p2, "fileDisplay"    # Ljava/lang/String;
    .param p3, "afRelationshipValue"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 181
    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v2, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v6, p3

    .end local p0    # "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p1    # "fileStore":[B
    .end local p2    # "fileDisplay":Ljava/lang/String;
    .end local p3    # "afRelationshipValue":Lcom/itextpdf/kernel/pdf/PdfName;
    .local v0, "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .local v1, "fileStore":[B
    .local v3, "fileDisplay":Ljava/lang/String;
    .local v6, "afRelationshipValue":Lcom/itextpdf/kernel/pdf/PdfName;
    invoke-static/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->createEmbeddedFileSpec(Lcom/itextpdf/kernel/pdf/PdfDocument;[BLjava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    move-result-object p0

    return-object p0
.end method

.method public static createEmbeddedFileSpec(Lcom/itextpdf/kernel/pdf/PdfDocument;[BLjava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .locals 7
    .param p0, "doc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p1, "fileStore"    # [B
    .param p2, "description"    # Ljava/lang/String;
    .param p3, "fileDisplay"    # Ljava/lang/String;
    .param p4, "fileParameter"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p5, "afRelationshipValue"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 149
    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p4

    move-object v6, p5

    .end local p0    # "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p1    # "fileStore":[B
    .end local p2    # "description":Ljava/lang/String;
    .end local p3    # "fileDisplay":Ljava/lang/String;
    .end local p4    # "fileParameter":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local p5    # "afRelationshipValue":Lcom/itextpdf/kernel/pdf/PdfName;
    .local v0, "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .local v1, "fileStore":[B
    .local v2, "description":Ljava/lang/String;
    .local v3, "fileDisplay":Ljava/lang/String;
    .local v5, "fileParameter":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .local v6, "afRelationshipValue":Lcom/itextpdf/kernel/pdf/PdfName;
    invoke-static/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->createEmbeddedFileSpec(Lcom/itextpdf/kernel/pdf/PdfDocument;[BLjava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    move-result-object p0

    return-object p0
.end method

.method public static createEmbeddedFileSpec(Lcom/itextpdf/kernel/pdf/PdfDocument;[BLjava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .locals 7
    .param p0, "doc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p1, "fileStore"    # [B
    .param p2, "description"    # Ljava/lang/String;
    .param p3, "fileDisplay"    # Ljava/lang/String;
    .param p4, "afRelationshipValue"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 197
    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v6, p4

    .end local p0    # "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p1    # "fileStore":[B
    .end local p2    # "description":Ljava/lang/String;
    .end local p3    # "fileDisplay":Ljava/lang/String;
    .end local p4    # "afRelationshipValue":Lcom/itextpdf/kernel/pdf/PdfName;
    .local v0, "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .local v1, "fileStore":[B
    .local v2, "description":Ljava/lang/String;
    .local v3, "fileDisplay":Ljava/lang/String;
    .local v6, "afRelationshipValue":Lcom/itextpdf/kernel/pdf/PdfName;
    invoke-static/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->createEmbeddedFileSpec(Lcom/itextpdf/kernel/pdf/PdfDocument;[BLjava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    move-result-object p0

    return-object p0
.end method

.method public static createEmbeddedFileSpec(Lcom/itextpdf/kernel/pdf/PdfDocument;[BLjava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .locals 7
    .param p0, "doc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p1, "fileStore"    # [B
    .param p2, "description"    # Ljava/lang/String;
    .param p3, "fileDisplay"    # Ljava/lang/String;
    .param p4, "mimeType"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p5, "fileParameter"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p6, "afRelationshipValue"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 120
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfStream;-><init>([B)V

    invoke-virtual {v0, p0}, Lcom/itextpdf/kernel/pdf/PdfStream;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 121
    .local v2, "stream":Lcom/itextpdf/kernel/pdf/PdfStream;
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 122
    .local v0, "params":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz p5, :cond_0

    .line 123
    invoke-virtual {v0, p5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->mergeDifferent(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 125
    :cond_0
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ModDate:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 126
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ModDate:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfDate;

    invoke-direct {v3}, Lcom/itextpdf/kernel/pdf/PdfDate;-><init>()V

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfDate;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 128
    :cond_1
    if-eqz p1, :cond_2

    .line 129
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Size:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->getBytes()[B

    move-result-object v4

    array-length v4, v4

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v1, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 131
    :cond_2
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Params:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v1, v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 132
    move-object v1, p0

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p6

    .end local p0    # "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p2    # "description":Ljava/lang/String;
    .end local p3    # "fileDisplay":Ljava/lang/String;
    .end local p4    # "mimeType":Lcom/itextpdf/kernel/pdf/PdfName;
    .end local p6    # "afRelationshipValue":Lcom/itextpdf/kernel/pdf/PdfName;
    .local v1, "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .local v3, "description":Ljava/lang/String;
    .local v4, "fileDisplay":Ljava/lang/String;
    .local v5, "mimeType":Lcom/itextpdf/kernel/pdf/PdfName;
    .local v6, "afRelationshipValue":Lcom/itextpdf/kernel/pdf/PdfName;
    invoke-static/range {v1 .. v6}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->createEmbeddedFileSpec(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfStream;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    move-result-object p0

    return-object p0
.end method

.method public static createExternalFileSpec(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .locals 1
    .param p0, "doc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p1, "filePath"    # Ljava/lang/String;

    .line 101
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->createExternalFileSpec(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    move-result-object v0

    return-object v0
.end method

.method public static createExternalFileSpec(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .locals 4
    .param p0, "doc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p1, "filePath"    # Ljava/lang/String;
    .param p2, "afRelationshipValue"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 81
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 82
    .local v0, "dict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Filespec:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 83
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->F:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 84
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->UF:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfString;

    const-string v3, "UnicodeBig"

    invoke-direct {v2, p1, v3}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 85
    if-eqz p2, :cond_0

    .line 86
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AFRelationship:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, p2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_0

    .line 88
    :cond_0
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AFRelationship:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Unspecified:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 90
    :goto_0
    new-instance v1, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    invoke-direct {v1, v0}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    invoke-virtual {v1, p0}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    return-object v1
.end method

.method public static wrapFileSpecObject(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .locals 2
    .param p0, "fileSpecObject"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 60
    if-eqz p0, :cond_1

    .line 61
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isString()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 62
    new-instance v0, Lcom/itextpdf/kernel/pdf/filespec/PdfStringFS;

    move-object v1, p0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/filespec/PdfStringFS;-><init>(Lcom/itextpdf/kernel/pdf/PdfString;)V

    return-object v0

    .line 63
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isDictionary()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 64
    new-instance v0, Lcom/itextpdf/kernel/pdf/filespec/PdfDictionaryFS;

    move-object v1, p0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/filespec/PdfDictionaryFS;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    return-object v0

    .line 67
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method public getFileIdentifier()Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2

    .line 393
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ID:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    return-object v0
.end method

.method public getThumbnailImage()Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;
    .locals 2

    .line 424
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Thumb:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsStream(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v0

    .line 425
    .local v0, "thumbnailStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    if-eqz v0, :cond_0

    new-instance v1, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;

    invoke-direct {v1, v0}, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;-><init>(Lcom/itextpdf/kernel/pdf/PdfStream;)V

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method

.method public isVolatile()Lcom/itextpdf/kernel/pdf/PdfBoolean;
    .locals 2

    .line 401
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Volatile:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsBoolean(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v0

    return-object v0
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 436
    const/4 v0, 0x1

    return v0
.end method

.method public put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .locals 1
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "value"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 429
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 430
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 431
    return-object p0
.end method

.method public setCollectionItem(Lcom/itextpdf/kernel/pdf/collection/PdfCollectionItem;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .locals 2
    .param p1, "item"    # Lcom/itextpdf/kernel/pdf/collection/PdfCollectionItem;

    .line 405
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->CI:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionItem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    move-result-object v0

    return-object v0
.end method

.method public setFileIdentifier(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .locals 1
    .param p1, "fileIdentifier"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 389
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->ID:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    move-result-object v0

    return-object v0
.end method

.method public setThumbnailImage(Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .locals 2
    .param p1, "thumbnailImage"    # Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;

    .line 415
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Thumb:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    move-result-object v0

    return-object v0
.end method

.method public setVolatile(Lcom/itextpdf/kernel/pdf/PdfBoolean;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .locals 1
    .param p1, "isVolatile"    # Lcom/itextpdf/kernel/pdf/PdfBoolean;

    .line 397
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Volatile:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    move-result-object v0

    return-object v0
.end method
