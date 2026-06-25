.class public Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;
.super Ljava/lang/Object;
.source "PdfDocumentInfo.java"


# static fields
.field static final PDF20_DEPRECATED_KEYS:[Lcom/itextpdf/kernel/pdf/PdfName;


# instance fields
.field private infoDictionary:Lcom/itextpdf/kernel/pdf/PdfDictionary;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 31
    const/4 v0, 0x7

    new-array v0, v0, [Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v1, 0x0

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Title:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Author:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Subject:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Keywords:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Creator:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Producer:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Trapped:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v2, v0, v1

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->PDF20_DEPRECATED_KEYS:[Lcom/itextpdf/kernel/pdf/PdfName;

    return-void
.end method

.method constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 1
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "pdfDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->infoDictionary:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 44
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getWriter()Lcom/itextpdf/kernel/pdf/PdfWriter;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 45
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->infoDictionary:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0, p2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 47
    :cond_0
    return-void
.end method

.method constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 1
    .param p1, "pdfDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 55
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    invoke-direct {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 56
    return-void
.end method

.method private getStringValue(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/String;
    .locals 2
    .param p1, "name"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 174
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->infoDictionary:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    .line 175
    .local v0, "pdfString":Lcom/itextpdf/kernel/pdf/PdfString;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfString;->toUnicodeString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method


# virtual methods
.method public addCreationDate()Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;
    .locals 2

    .line 122
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->CreationDate:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDate;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfDate;-><init>()V

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDate;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    move-result-object v0

    return-object v0
.end method

.method public addModDate()Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;
    .locals 2

    .line 136
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->ModDate:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDate;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfDate;-><init>()V

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDate;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    move-result-object v0

    return-object v0
.end method

.method public getAuthor()Ljava/lang/String;
    .locals 1

    .line 98
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Author:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->getStringValue(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCreator()Ljava/lang/String;
    .locals 1

    .line 110
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Creator:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->getStringValue(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getKeywords()Ljava/lang/String;
    .locals 1

    .line 106
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Keywords:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->getStringValue(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMoreInfo(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .line 160
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->getStringValue(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getPdfObject()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 1

    .line 164
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->infoDictionary:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    return-object v0
.end method

.method public getProducer()Ljava/lang/String;
    .locals 1

    .line 114
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Producer:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->getStringValue(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSubject()Ljava/lang/String;
    .locals 1

    .line 102
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Subject:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->getStringValue(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .line 94
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Title:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->getStringValue(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTrapped()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 2

    .line 118
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->infoDictionary:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Trapped:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    return-object v0
.end method

.method put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;
    .locals 1
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "value"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 168
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 169
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->setModified()Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 170
    return-object p0
.end method

.method public removeCreationDate()Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;
    .locals 2

    .line 131
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->infoDictionary:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->CreationDate:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 132
    return-object p0
.end method

.method public setAuthor(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;
    .locals 3
    .param p1, "author"    # Ljava/lang/String;

    .line 63
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Author:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfString;

    const-string v2, "UnicodeBig"

    invoke-direct {v1, p1, v2}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    move-result-object v0

    return-object v0
.end method

.method public setCreator(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;
    .locals 3
    .param p1, "creator"    # Ljava/lang/String;

    .line 75
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Creator:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfString;

    const-string v2, "UnicodeBig"

    invoke-direct {v1, p1, v2}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    move-result-object v0

    return-object v0
.end method

.method public setKeywords(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;
    .locals 3
    .param p1, "keywords"    # Ljava/lang/String;

    .line 71
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Keywords:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfString;

    const-string v2, "UnicodeBig"

    invoke-direct {v1, p1, v2}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    move-result-object v0

    return-object v0
.end method

.method public setMoreInfo(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 150
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    .line 151
    .local v0, "keyName":Lcom/itextpdf/kernel/pdf/PdfName;
    if-nez p2, :cond_0

    .line 152
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->infoDictionary:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 153
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->infoDictionary:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->setModified()Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_0

    .line 155
    :cond_0
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfString;

    const-string v2, "UnicodeBig"

    invoke-direct {v1, p2, v2}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    .line 157
    :goto_0
    return-void
.end method

.method public setMoreInfo(Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 140
    .local p1, "moreInfo":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p1, :cond_0

    .line 141
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 142
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 143
    .local v2, "key":Ljava/lang/String;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 144
    .local v3, "value":Ljava/lang/String;
    invoke-virtual {p0, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->setMoreInfo(Ljava/lang/String;Ljava/lang/String;)V

    .line 145
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/String;
    goto :goto_0

    .line 147
    :cond_0
    return-void
.end method

.method public setProducer(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;
    .locals 4
    .param p1, "producer"    # Ljava/lang/String;

    .line 85
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Producer:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfString;

    const-string v3, "UnicodeBig"

    invoke-direct {v2, p1, v3}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 86
    return-object p0
.end method

.method public setSubject(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;
    .locals 3
    .param p1, "subject"    # Ljava/lang/String;

    .line 67
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Subject:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfString;

    const-string v2, "UnicodeBig"

    invoke-direct {v1, p1, v2}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    move-result-object v0

    return-object v0
.end method

.method public setTitle(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;
    .locals 3
    .param p1, "title"    # Ljava/lang/String;

    .line 59
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Title:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfString;

    const-string v2, "UnicodeBig"

    invoke-direct {v1, p1, v2}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    move-result-object v0

    return-object v0
.end method

.method public setTrapped(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;
    .locals 1
    .param p1, "trapped"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 90
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Trapped:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    move-result-object v0

    return-object v0
.end method
