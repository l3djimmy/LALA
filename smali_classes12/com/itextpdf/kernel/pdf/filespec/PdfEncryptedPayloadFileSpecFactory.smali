.class public Lcom/itextpdf/kernel/pdf/filespec/PdfEncryptedPayloadFileSpecFactory;
.super Ljava/lang/Object;
.source "PdfEncryptedPayloadFileSpecFactory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static addEncryptedPayloadDictionary(Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .locals 3
    .param p0, "fs"    # Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .param p1, "ep"    # Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;

    .line 202
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->EP:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 203
    return-object p0
.end method

.method public static create(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/io/InputStream;Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .locals 1
    .param p0, "doc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "encryptedPayload"    # Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;

    .line 156
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0, v0}, Lcom/itextpdf/kernel/pdf/filespec/PdfEncryptedPayloadFileSpecFactory;->create(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/io/InputStream;Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    move-result-object v0

    return-object v0
.end method

.method public static create(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/io/InputStream;Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .locals 1
    .param p0, "doc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "encryptedPayload"    # Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;
    .param p3, "mimeType"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 144
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, p3, v0}, Lcom/itextpdf/kernel/pdf/filespec/PdfEncryptedPayloadFileSpecFactory;->create(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/io/InputStream;Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    move-result-object v0

    return-object v0
.end method

.method public static create(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/io/InputStream;Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .locals 7
    .param p0, "doc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "encryptedPayload"    # Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;
    .param p3, "mimeType"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p4, "fileParameter"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 131
    invoke-static {p2}, Lcom/itextpdf/kernel/pdf/filespec/PdfEncryptedPayloadFileSpecFactory;->generateDescription(Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p2}, Lcom/itextpdf/kernel/pdf/filespec/PdfEncryptedPayloadFileSpecFactory;->generateFileDisplay(Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;)Ljava/lang/String;

    move-result-object v3

    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->EncryptedPayload:Lcom/itextpdf/kernel/pdf/PdfName;

    move-object v0, p0

    move-object v1, p1

    move-object v4, p3

    move-object v5, p4

    .end local p0    # "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p1    # "is":Ljava/io/InputStream;
    .end local p3    # "mimeType":Lcom/itextpdf/kernel/pdf/PdfName;
    .end local p4    # "fileParameter":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .local v0, "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .local v1, "is":Ljava/io/InputStream;
    .local v4, "mimeType":Lcom/itextpdf/kernel/pdf/PdfName;
    .local v5, "fileParameter":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-static/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->createEmbeddedFileSpec(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/io/InputStream;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    move-result-object p0

    invoke-static {p0, p2}, Lcom/itextpdf/kernel/pdf/filespec/PdfEncryptedPayloadFileSpecFactory;->addEncryptedPayloadDictionary(Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    move-result-object p0

    return-object p0
.end method

.method public static create(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .locals 1
    .param p0, "doc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p1, "filePath"    # Ljava/lang/String;
    .param p2, "encryptedPayload"    # Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 117
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0, v0}, Lcom/itextpdf/kernel/pdf/filespec/PdfEncryptedPayloadFileSpecFactory;->create(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    move-result-object v0

    return-object v0
.end method

.method public static create(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .locals 1
    .param p0, "doc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p1, "filePath"    # Ljava/lang/String;
    .param p2, "encryptedPayload"    # Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;
    .param p3, "mimeType"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 104
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, p3, v0}, Lcom/itextpdf/kernel/pdf/filespec/PdfEncryptedPayloadFileSpecFactory;->create(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    move-result-object v0

    return-object v0
.end method

.method public static create(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .locals 7
    .param p0, "doc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p1, "filePath"    # Ljava/lang/String;
    .param p2, "encryptedPayload"    # Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;
    .param p3, "mimeType"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p4, "fileParameter"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 90
    invoke-static {p2}, Lcom/itextpdf/kernel/pdf/filespec/PdfEncryptedPayloadFileSpecFactory;->generateDescription(Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p2}, Lcom/itextpdf/kernel/pdf/filespec/PdfEncryptedPayloadFileSpecFactory;->generateFileDisplay(Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;)Ljava/lang/String;

    move-result-object v3

    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->EncryptedPayload:Lcom/itextpdf/kernel/pdf/PdfName;

    move-object v0, p0

    move-object v1, p1

    move-object v4, p3

    move-object v5, p4

    .end local p0    # "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p1    # "filePath":Ljava/lang/String;
    .end local p3    # "mimeType":Lcom/itextpdf/kernel/pdf/PdfName;
    .end local p4    # "fileParameter":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .local v0, "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .local v1, "filePath":Ljava/lang/String;
    .local v4, "mimeType":Lcom/itextpdf/kernel/pdf/PdfName;
    .local v5, "fileParameter":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-static/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->createEmbeddedFileSpec(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    move-result-object p0

    invoke-static {p0, p2}, Lcom/itextpdf/kernel/pdf/filespec/PdfEncryptedPayloadFileSpecFactory;->addEncryptedPayloadDictionary(Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    move-result-object p0

    return-object p0
.end method

.method public static create(Lcom/itextpdf/kernel/pdf/PdfDocument;[BLcom/itextpdf/kernel/pdf/PdfEncryptedPayload;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .locals 1
    .param p0, "doc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p1, "fileStore"    # [B
    .param p2, "encryptedPayload"    # Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;

    .line 75
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0, v0}, Lcom/itextpdf/kernel/pdf/filespec/PdfEncryptedPayloadFileSpecFactory;->create(Lcom/itextpdf/kernel/pdf/PdfDocument;[BLcom/itextpdf/kernel/pdf/PdfEncryptedPayload;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    move-result-object v0

    return-object v0
.end method

.method public static create(Lcom/itextpdf/kernel/pdf/PdfDocument;[BLcom/itextpdf/kernel/pdf/PdfEncryptedPayload;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .locals 1
    .param p0, "doc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p1, "fileStore"    # [B
    .param p2, "encryptedPayload"    # Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;
    .param p3, "fileParameter"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 63
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0, p3}, Lcom/itextpdf/kernel/pdf/filespec/PdfEncryptedPayloadFileSpecFactory;->create(Lcom/itextpdf/kernel/pdf/PdfDocument;[BLcom/itextpdf/kernel/pdf/PdfEncryptedPayload;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    move-result-object v0

    return-object v0
.end method

.method public static create(Lcom/itextpdf/kernel/pdf/PdfDocument;[BLcom/itextpdf/kernel/pdf/PdfEncryptedPayload;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .locals 7
    .param p0, "doc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p1, "fileStore"    # [B
    .param p2, "encryptedPayload"    # Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;
    .param p3, "mimeType"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p4, "fileParameter"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 50
    invoke-static {p2}, Lcom/itextpdf/kernel/pdf/filespec/PdfEncryptedPayloadFileSpecFactory;->generateDescription(Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p2}, Lcom/itextpdf/kernel/pdf/filespec/PdfEncryptedPayloadFileSpecFactory;->generateFileDisplay(Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;)Ljava/lang/String;

    move-result-object v3

    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->EncryptedPayload:Lcom/itextpdf/kernel/pdf/PdfName;

    move-object v0, p0

    move-object v1, p1

    move-object v4, p3

    move-object v5, p4

    .end local p0    # "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p1    # "fileStore":[B
    .end local p3    # "mimeType":Lcom/itextpdf/kernel/pdf/PdfName;
    .end local p4    # "fileParameter":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .local v0, "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .local v1, "fileStore":[B
    .local v4, "mimeType":Lcom/itextpdf/kernel/pdf/PdfName;
    .local v5, "fileParameter":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-static/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->createEmbeddedFileSpec(Lcom/itextpdf/kernel/pdf/PdfDocument;[BLjava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    move-result-object p0

    invoke-static {p0, p2}, Lcom/itextpdf/kernel/pdf/filespec/PdfEncryptedPayloadFileSpecFactory;->addEncryptedPayloadDictionary(Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    move-result-object p0

    return-object p0
.end method

.method public static generateDescription(Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;)Ljava/lang/String;
    .locals 4
    .param p0, "ep"    # Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;

    .line 189
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "This embedded file is encrypted using "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;->getSubtype()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 190
    .local v0, "result":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;->getVersion()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v1

    .line 191
    .local v1, "version":Lcom/itextpdf/kernel/pdf/PdfName;
    if-eqz v1, :cond_0

    .line 192
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " , version: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 194
    :cond_0
    return-object v0
.end method

.method public static generateFileDisplay(Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;)Ljava/lang/String;
    .locals 2
    .param p0, "ep"    # Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;

    .line 198
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;->getSubtype()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "Protected.pdf"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static wrap(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .locals 4
    .param p0, "dictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 160
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->EncryptedPayload:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AFRelationship:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 161
    const-class v0, Lcom/itextpdf/kernel/pdf/filespec/PdfEncryptedPayloadFileSpecFactory;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 162
    const-string v1, "Encrypted payload file spec shall have \'AFRelationship\' filed equal to \'EncryptedPayload\'"

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 164
    :cond_0
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->EF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 165
    .local v0, "ef":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v0, :cond_5

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->F:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsStream(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v1

    if-nez v1, :cond_1

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->UF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsStream(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 168
    :cond_1
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Filespec:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 172
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->isIndirect()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 175
    invoke-static {p0}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->wrapFileSpecObject(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    move-result-object v1

    .line 176
    .local v1, "fileSpec":Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    invoke-static {v1}, Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;->extractFrom(Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;)Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 180
    return-object v1

    .line 177
    :cond_2
    new-instance v2, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v3, "Encrypted payload file spec shall have encrypted payload dictionary."

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 173
    .end local v1    # "fileSpec":Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    :cond_3
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Encrypted payload file spec shall be indirect."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 169
    :cond_4
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Encrypted payload file spec shall have \'Type\' key. The value of such key shall be \'Filespec\'."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 166
    :cond_5
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Encrypted payload file spec shall have \'EF\' key. The value of such key shall be a dictionary that contains embedded file stream."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
