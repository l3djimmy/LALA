.class public Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfEncryptedPayload.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
        "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 38
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 39
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 3
    .param p1, "subtype"    # Ljava/lang/String;

    .line 32
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 33
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->EncryptedPayload:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 34
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;->setSubtype(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;

    .line 35
    return-void
.end method

.method public static extractFrom(Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;)Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;
    .locals 2
    .param p0, "fileSpec"    # Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    .line 43
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isDictionary()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 44
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->EP:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;->wrap(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;

    move-result-object v0

    return-object v0

    .line 46
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public static wrap(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;
    .locals 3
    .param p0, "dictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 50
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    .line 51
    .local v0, "type":Lcom/itextpdf/kernel/pdf/PdfName;
    if-eqz v0, :cond_1

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->EncryptedPayload:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 52
    :cond_0
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Encrypted payload dictionary shall have field \'Type\' equal to \'EncryptedPayload\' if present"

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 55
    :cond_1
    :goto_0
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 58
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;

    invoke-direct {v1, p0}, Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    return-object v1

    .line 56
    :cond_2
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Encrypted payload shall have \'Subtype\' field specifying crypto filter"

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public getSubtype()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 2

    .line 62
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    return-object v0
.end method

.method public getVersion()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 2

    .line 76
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Version:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    return-object v0
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 91
    const/4 v0, 0x0

    return v0
.end method

.method public setSubtype(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;
    .locals 2
    .param p1, "subtype"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 70
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 71
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 72
    return-object p0
.end method

.method public setSubtype(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;
    .locals 1
    .param p1, "subtype"    # Ljava/lang/String;

    .line 66
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;->setSubtype(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;

    move-result-object v0

    return-object v0
.end method

.method public setVersion(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;
    .locals 2
    .param p1, "version"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 84
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 85
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Version:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 86
    return-object p0
.end method

.method public setVersion(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;
    .locals 1
    .param p1, "version"    # Ljava/lang/String;

    .line 80
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;->setVersion(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;

    move-result-object v0

    return-object v0
.end method
