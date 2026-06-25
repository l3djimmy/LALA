.class public Lcom/itextpdf/kernel/pdf/PdfOutputIntent;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfOutputIntent.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
        "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 0
    .param p1, "outputIntentDict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 70
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 71
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V
    .locals 3
    .param p1, "outputConditionIdentifier"    # Ljava/lang/String;
    .param p2, "outputCondition"    # Ljava/lang/String;
    .param p3, "registryName"    # Ljava/lang/String;
    .param p4, "info"    # Ljava/lang/String;
    .param p5, "iccStream"    # Ljava/io/InputStream;

    .line 53
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 54
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->GTS_PDFA1:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfOutputIntent;->setOutputIntentSubtype(Lcom/itextpdf/kernel/pdf/PdfName;)V

    .line 55
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfOutputIntent;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->OutputIntent:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 56
    if-eqz p2, :cond_0

    .line 57
    invoke-virtual {p0, p2}, Lcom/itextpdf/kernel/pdf/PdfOutputIntent;->setOutputCondition(Ljava/lang/String;)V

    .line 58
    :cond_0
    if-eqz p1, :cond_1

    .line 59
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfOutputIntent;->setOutputConditionIdentifier(Ljava/lang/String;)V

    .line 60
    :cond_1
    if-eqz p3, :cond_2

    .line 61
    invoke-virtual {p0, p3}, Lcom/itextpdf/kernel/pdf/PdfOutputIntent;->setRegistryName(Ljava/lang/String;)V

    .line 62
    :cond_2
    if-eqz p4, :cond_3

    .line 63
    invoke-virtual {p0, p4}, Lcom/itextpdf/kernel/pdf/PdfOutputIntent;->setInfo(Ljava/lang/String;)V

    .line 64
    :cond_3
    if-eqz p5, :cond_4

    .line 65
    invoke-virtual {p0, p5}, Lcom/itextpdf/kernel/pdf/PdfOutputIntent;->setDestOutputProfile(Ljava/io/InputStream;)V

    .line 67
    :cond_4
    return-void
.end method


# virtual methods
.method public getDestOutputProfile()Lcom/itextpdf/kernel/pdf/PdfStream;
    .locals 2

    .line 74
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfOutputIntent;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->DestOutputProfile:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsStream(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v0

    return-object v0
.end method

.method public getInfo()Lcom/itextpdf/kernel/pdf/PdfString;
    .locals 2

    .line 83
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfOutputIntent;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Info:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    return-object v0
.end method

.method public getOutputCondition()Lcom/itextpdf/kernel/pdf/PdfString;
    .locals 2

    .line 107
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfOutputIntent;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->OutputCondition:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    return-object v0
.end method

.method public getOutputConditionIdentifier()Lcom/itextpdf/kernel/pdf/PdfString;
    .locals 2

    .line 99
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfOutputIntent;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->OutputConditionIdentifier:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    return-object v0
.end method

.method public getOutputIntentSubtype()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 2

    .line 115
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfOutputIntent;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    return-object v0
.end method

.method public getRegistryName()Lcom/itextpdf/kernel/pdf/PdfString;
    .locals 2

    .line 91
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfOutputIntent;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->RegistryName:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    return-object v0
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 124
    const/4 v0, 0x0

    return v0
.end method

.method public setDestOutputProfile(Ljava/io/InputStream;)V
    .locals 3
    .param p1, "iccStream"    # Ljava/io/InputStream;

    .line 78
    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$IccBased;->getIccProfileStream(Ljava/io/InputStream;)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v0

    .line 79
    .local v0, "stream":Lcom/itextpdf/kernel/pdf/PdfStream;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfOutputIntent;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->DestOutputProfile:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 80
    return-void
.end method

.method public setInfo(Ljava/lang/String;)V
    .locals 3
    .param p1, "info"    # Ljava/lang/String;

    .line 87
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfOutputIntent;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Info:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 88
    return-void
.end method

.method public setOutputCondition(Ljava/lang/String;)V
    .locals 3
    .param p1, "outputCondition"    # Ljava/lang/String;

    .line 111
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfOutputIntent;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->OutputCondition:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 112
    return-void
.end method

.method public setOutputConditionIdentifier(Ljava/lang/String;)V
    .locals 3
    .param p1, "outputConditionIdentifier"    # Ljava/lang/String;

    .line 103
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfOutputIntent;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->OutputConditionIdentifier:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 104
    return-void
.end method

.method public setOutputIntentSubtype(Lcom/itextpdf/kernel/pdf/PdfName;)V
    .locals 2
    .param p1, "subtype"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 119
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfOutputIntent;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 120
    return-void
.end method

.method public setRegistryName(Ljava/lang/String;)V
    .locals 3
    .param p1, "registryName"    # Ljava/lang/String;

    .line 95
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfOutputIntent;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->RegistryName:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 96
    return-void
.end method
