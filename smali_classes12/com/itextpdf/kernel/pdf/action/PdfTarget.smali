.class public Lcom/itextpdf/kernel/pdf/action/PdfTarget;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfTarget.java"


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

    .line 56
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 57
    return-void
.end method

.method public static create(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/action/PdfTarget;
    .locals 1
    .param p0, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 66
    new-instance v0, Lcom/itextpdf/kernel/pdf/action/PdfTarget;

    invoke-direct {v0, p0}, Lcom/itextpdf/kernel/pdf/action/PdfTarget;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    return-object v0
.end method

.method private static create(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/action/PdfTarget;
    .locals 2
    .param p0, "r"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 77
    new-instance v0, Lcom/itextpdf/kernel/pdf/action/PdfTarget;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/action/PdfTarget;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 78
    .local v0, "pdfTarget":Lcom/itextpdf/kernel/pdf/action/PdfTarget;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->R:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, p0}, Lcom/itextpdf/kernel/pdf/action/PdfTarget;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfTarget;

    .line 79
    return-object v0
.end method

.method public static createChildTarget()Lcom/itextpdf/kernel/pdf/action/PdfTarget;
    .locals 1

    .line 97
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->C:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/action/PdfTarget;->create(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/action/PdfTarget;

    move-result-object v0

    return-object v0
.end method

.method public static createChildTarget(II)Lcom/itextpdf/kernel/pdf/action/PdfTarget;
    .locals 4
    .param p0, "pageNumber"    # I
    .param p1, "annotationIndex"    # I

    .line 133
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->C:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/action/PdfTarget;->create(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/action/PdfTarget;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->P:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    add-int/lit8 v3, p0, -0x1

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    .line 134
    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfTarget;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfTarget;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->A:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    .line 135
    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfTarget;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfTarget;

    move-result-object v0

    .line 133
    return-object v0
.end method

.method public static createChildTarget(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/action/PdfTarget;
    .locals 3
    .param p0, "embeddedFileName"    # Ljava/lang/String;

    .line 107
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->C:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/action/PdfTarget;->create(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/action/PdfTarget;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->N:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v2, p0}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    .line 108
    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfTarget;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfTarget;

    move-result-object v0

    .line 107
    return-object v0
.end method

.method public static createChildTarget(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/action/PdfTarget;
    .locals 3
    .param p0, "namedDestination"    # Ljava/lang/String;
    .param p1, "annotationIdentifier"    # Ljava/lang/String;

    .line 120
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->C:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/action/PdfTarget;->create(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/action/PdfTarget;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->P:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v2, p0}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    .line 121
    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfTarget;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfTarget;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->A:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    .line 122
    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfTarget;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfTarget;

    move-result-object v0

    .line 120
    return-object v0
.end method

.method public static createParentTarget()Lcom/itextpdf/kernel/pdf/action/PdfTarget;
    .locals 1

    .line 88
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->P:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/action/PdfTarget;->create(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/action/PdfTarget;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getAnnotation(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/annot/PdfFileAttachmentAnnotation;
    .locals 8
    .param p1, "pdfDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 193
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/action/PdfTarget;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->P:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 194
    .local v0, "pValue":Lcom/itextpdf/kernel/pdf/PdfObject;
    const/4 v1, 0x0

    .line 195
    .local v1, "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    instance-of v2, v0, Lcom/itextpdf/kernel/pdf/PdfNumber;

    if-eqz v2, :cond_0

    .line 197
    move-object v2, v0

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPage(I)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v1

    goto :goto_0

    .line 198
    :cond_0
    instance-of v2, v0, Lcom/itextpdf/kernel/pdf/PdfString;

    if-eqz v2, :cond_2

    .line 199
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v2

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Dests:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getNameTree(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNameTree;

    move-result-object v2

    .line 200
    .local v2, "destsTree":Lcom/itextpdf/kernel/pdf/PdfNameTree;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfNameTree;->getNames()Ljava/util/Map;

    move-result-object v3

    .line 201
    .local v3, "dests":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    move-object v4, v0

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 202
    .local v4, "pdfArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-eqz v4, :cond_2

    .line 203
    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v6

    instance-of v6, v6, Lcom/itextpdf/kernel/pdf/PdfNumber;

    if-eqz v6, :cond_1

    .line 204
    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v5

    invoke-virtual {p1, v5}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPage(I)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v1

    goto :goto_0

    .line 206
    :cond_1
    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {p1, v5}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPage(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v1

    .line 211
    .end local v2    # "destsTree":Lcom/itextpdf/kernel/pdf/PdfNameTree;
    .end local v3    # "dests":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    .end local v4    # "pdfArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    :cond_2
    :goto_0
    const/4 v2, 0x0

    .line 212
    .local v2, "pageAnnotations":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;>;"
    if-eqz v1, :cond_3

    .line 213
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getAnnotations()Ljava/util/List;

    move-result-object v2

    .line 215
    :cond_3
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/action/PdfTarget;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->A:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    .line 216
    .local v3, "aValue":Lcom/itextpdf/kernel/pdf/PdfObject;
    const/4 v4, 0x0

    .line 217
    .local v4, "resultAnnotation":Lcom/itextpdf/kernel/pdf/annot/PdfFileAttachmentAnnotation;
    if-eqz v2, :cond_6

    .line 218
    instance-of v5, v3, Lcom/itextpdf/kernel/pdf/PdfNumber;

    if-eqz v5, :cond_4

    .line 219
    move-object v5, v3

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v5

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    move-object v4, v5

    check-cast v4, Lcom/itextpdf/kernel/pdf/annot/PdfFileAttachmentAnnotation;

    goto :goto_2

    .line 220
    :cond_4
    instance-of v5, v3, Lcom/itextpdf/kernel/pdf/PdfString;

    if-eqz v5, :cond_6

    .line 221
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_6

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    .line 222
    .local v6, "annotation":Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getName()Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 223
    move-object v4, v6

    check-cast v4, Lcom/itextpdf/kernel/pdf/annot/PdfFileAttachmentAnnotation;

    .line 224
    goto :goto_2

    .line 226
    .end local v6    # "annotation":Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    :cond_5
    goto :goto_1

    .line 229
    :cond_6
    :goto_2
    if-nez v4, :cond_7

    .line 230
    const-class v5, Lcom/itextpdf/kernel/pdf/action/PdfTarget;

    invoke-static {v5}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v5

    .line 231
    .local v5, "logger":Lorg/slf4j/Logger;
    const-string v6, "Some fields in target dictionary are not set or incorrect. Null will be returned."

    invoke-interface {v5, v6}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 233
    .end local v5    # "logger":Lorg/slf4j/Logger;
    :cond_7
    return-object v4
.end method

.method public getName()Ljava/lang/String;
    .locals 2

    .line 156
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/action/PdfTarget;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->N:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfString;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTarget()Lcom/itextpdf/kernel/pdf/action/PdfTarget;
    .locals 2

    .line 254
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/action/PdfTarget;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->T:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 255
    .local v0, "targetDictObject":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v0, :cond_0

    new-instance v1, Lcom/itextpdf/kernel/pdf/action/PdfTarget;

    invoke-direct {v1, v0}, Lcom/itextpdf/kernel/pdf/action/PdfTarget;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 275
    const/4 v0, 0x0

    return v0
.end method

.method public put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfTarget;
    .locals 1
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "value"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 266
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/action/PdfTarget;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 267
    return-object p0
.end method

.method public setAnnotation(Lcom/itextpdf/kernel/pdf/annot/PdfFileAttachmentAnnotation;Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/action/PdfTarget;
    .locals 6
    .param p1, "pdfAnnotation"    # Lcom/itextpdf/kernel/pdf/annot/PdfFileAttachmentAnnotation;
    .param p2, "pdfDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 167
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/annot/PdfFileAttachmentAnnotation;->getPage()Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v0

    .line 168
    .local v0, "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    if-eqz v0, :cond_2

    .line 171
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->P:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {p2, v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPageNumber(Lcom/itextpdf/kernel/pdf/PdfPage;)I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {p0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfTarget;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfTarget;

    .line 172
    const/4 v1, -0x1

    .line 173
    .local v1, "indexOfAnnotation":I
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getAnnotations()Ljava/util/List;

    move-result-object v2

    .line 174
    .local v2, "annots":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_1

    .line 175
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 176
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/annot/PdfFileAttachmentAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 177
    move v1, v3

    .line 178
    goto :goto_1

    .line 174
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 181
    .end local v3    # "i":I
    :cond_1
    :goto_1
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->A:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v4, v1}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {p0, v3, v4}, Lcom/itextpdf/kernel/pdf/action/PdfTarget;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfTarget;

    .line 183
    .end local v1    # "indexOfAnnotation":I
    .end local v2    # "annots":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;>;"
    return-object p0

    .line 169
    :cond_2
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Annotation shall have reference to page."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public setName(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/action/PdfTarget;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .line 146
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->N:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/action/PdfTarget;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfTarget;

    move-result-object v0

    return-object v0
.end method

.method public setTarget(Lcom/itextpdf/kernel/pdf/action/PdfTarget;)Lcom/itextpdf/kernel/pdf/action/PdfTarget;
    .locals 2
    .param p1, "target"    # Lcom/itextpdf/kernel/pdf/action/PdfTarget;

    .line 244
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->T:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/action/PdfTarget;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/action/PdfTarget;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfTarget;

    move-result-object v0

    return-object v0
.end method
