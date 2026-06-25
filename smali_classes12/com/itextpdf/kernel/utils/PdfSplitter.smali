.class public Lcom/itextpdf/kernel/utils/PdfSplitter;
.super Ljava/lang/Object;
.source "PdfSplitter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/utils/PdfSplitter$SplitReadyListener;,
        Lcom/itextpdf/kernel/utils/PdfSplitter$IDocumentReadyListener;
    }
.end annotation


# instance fields
.field private metaInfo:Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

.field private pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

.field private preserveOutlines:Z

.field private preserveTagged:Z


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 2
    .param p1, "pdfDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getWriter()Lcom/itextpdf/kernel/pdf/PdfWriter;

    move-result-object v0

    if-nez v0, :cond_0

    .line 58
    iput-object p1, p0, Lcom/itextpdf/kernel/utils/PdfSplitter;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 59
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/utils/PdfSplitter;->preserveTagged:Z

    .line 60
    iput-boolean v0, p0, Lcom/itextpdf/kernel/utils/PdfSplitter;->preserveOutlines:Z

    .line 61
    return-void

    .line 56
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Cannot split document that is being written."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private createPdfDocument(Lcom/itextpdf/kernel/utils/PageRange;)Lcom/itextpdf/kernel/pdf/PdfDocument;
    .locals 4
    .param p1, "currentPageRange"    # Lcom/itextpdf/kernel/utils/PageRange;

    .line 240
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/utils/PdfSplitter;->getNextPdfWriter(Lcom/itextpdf/kernel/utils/PageRange;)Lcom/itextpdf/kernel/pdf/PdfWriter;

    move-result-object v1

    new-instance v2, Lcom/itextpdf/kernel/pdf/DocumentProperties;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/DocumentProperties;-><init>()V

    iget-object v3, p0, Lcom/itextpdf/kernel/utils/PdfSplitter;->metaInfo:Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/DocumentProperties;->setEventCountingMetaInfo(Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)Lcom/itextpdf/kernel/pdf/DocumentProperties;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;-><init>(Lcom/itextpdf/kernel/pdf/PdfWriter;Lcom/itextpdf/kernel/pdf/DocumentProperties;)V

    .line 241
    .local v0, "newDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    iget-object v1, p0, Lcom/itextpdf/kernel/utils/PdfSplitter;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->isTagged()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/itextpdf/kernel/utils/PdfSplitter;->preserveTagged:Z

    if-eqz v1, :cond_0

    .line 242
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->setTagged()Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 243
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/kernel/utils/PdfSplitter;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->hasOutlines()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/itextpdf/kernel/utils/PdfSplitter;->preserveOutlines:Z

    if-eqz v1, :cond_1

    .line 244
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->initializeOutlines()V

    .line 245
    :cond_1
    return-object v0
.end method

.method private getAbsoluteTreeNextOutline(Lcom/itextpdf/kernel/pdf/PdfOutline;)Lcom/itextpdf/kernel/pdf/PdfOutline;
    .locals 6
    .param p1, "outline"    # Lcom/itextpdf/kernel/pdf/PdfOutline;

    .line 338
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfOutline;->getContent()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Next:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 339
    .local v0, "nextPdfObject":Lcom/itextpdf/kernel/pdf/PdfObject;
    const/4 v1, 0x0

    .line 341
    .local v1, "nextPdfOutline":Lcom/itextpdf/kernel/pdf/PdfOutline;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfOutline;->getParent()Lcom/itextpdf/kernel/pdf/PdfOutline;

    move-result-object v2

    if-eqz v2, :cond_1

    if-eqz v0, :cond_1

    .line 342
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfOutline;->getParent()Lcom/itextpdf/kernel/pdf/PdfOutline;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfOutline;->getAllChildren()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfOutline;

    .line 343
    .local v3, "pdfOutline":Lcom/itextpdf/kernel/pdf/PdfOutline;
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfOutline;->getContent()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v4

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 344
    move-object v1, v3

    .line 345
    goto :goto_1

    .line 347
    .end local v3    # "pdfOutline":Lcom/itextpdf/kernel/pdf/PdfOutline;
    :cond_0
    goto :goto_0

    .line 349
    :cond_1
    :goto_1
    if-nez v1, :cond_2

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfOutline;->getParent()Lcom/itextpdf/kernel/pdf/PdfOutline;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 350
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfOutline;->getParent()Lcom/itextpdf/kernel/pdf/PdfOutline;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/itextpdf/kernel/utils/PdfSplitter;->getAbsoluteTreeNextOutline(Lcom/itextpdf/kernel/pdf/PdfOutline;)Lcom/itextpdf/kernel/pdf/PdfOutline;

    move-result-object v1

    .line 352
    :cond_2
    return-object v1
.end method

.method private getNextRange(IIJ)Lcom/itextpdf/kernel/utils/PageRange;
    .locals 10
    .param p1, "startPage"    # I
    .param p2, "endPage"    # I
    .param p3, "size"    # J

    .line 356
    new-instance v0, Lcom/itextpdf/kernel/utils/PdfResourceCounter;

    iget-object v1, p0, Lcom/itextpdf/kernel/utils/PdfSplitter;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getTrailer()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/utils/PdfResourceCounter;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 357
    .local v0, "counter":Lcom/itextpdf/kernel/utils/PdfResourceCounter;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/utils/PdfResourceCounter;->getResources()Ljava/util/Map;

    move-result-object v1

    .line 359
    .local v1, "resources":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/utils/PdfResourceCounter;->getLength(Ljava/util/Map;)J

    move-result-wide v2

    .line 360
    .local v2, "lengthWithoutXref":J
    move v4, p1

    .line 361
    .local v4, "currentPage":I
    const/4 v5, 0x0

    .line 364
    .local v5, "oversized":Z
    :goto_0
    iget-object v6, p0, Lcom/itextpdf/kernel/utils/PdfSplitter;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    add-int/lit8 v7, v4, 0x1

    .end local v4    # "currentPage":I
    .local v7, "currentPage":I
    invoke-virtual {v6, v4}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPage(I)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v4

    .line 365
    .local v4, "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    new-instance v6, Lcom/itextpdf/kernel/utils/PdfResourceCounter;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v8

    invoke-direct {v6, v8}, Lcom/itextpdf/kernel/utils/PdfResourceCounter;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    move-object v0, v6

    .line 366
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/utils/PdfResourceCounter;->getLength(Ljava/util/Map;)J

    move-result-wide v8

    add-long/2addr v2, v8

    .line 367
    invoke-virtual {v0}, Lcom/itextpdf/kernel/utils/PdfResourceCounter;->getResources()Ljava/util/Map;

    move-result-object v6

    invoke-interface {v1, v6}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 369
    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v6

    invoke-direct {p0, v6}, Lcom/itextpdf/kernel/utils/PdfSplitter;->xrefLength(I)J

    move-result-wide v8

    add-long/2addr v8, v2

    cmp-long v6, v8, p3

    if-lez v6, :cond_0

    .line 370
    const/4 v5, 0x1

    .line 372
    .end local v4    # "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    :cond_0
    if-gt v7, p2, :cond_2

    if-eqz v5, :cond_1

    goto :goto_1

    :cond_1
    move v4, v7

    goto :goto_0

    .line 375
    :cond_2
    :goto_1
    if-eqz v5, :cond_3

    add-int/lit8 v4, v7, -0x1

    if-eq v4, p1, :cond_3

    .line 378
    add-int/lit8 v7, v7, -0x1

    .line 381
    :cond_3
    new-instance v4, Lcom/itextpdf/kernel/utils/PageRange;

    invoke-direct {v4}, Lcom/itextpdf/kernel/utils/PageRange;-><init>()V

    add-int/lit8 v6, v7, -0x1

    invoke-virtual {v4, p1, v6}, Lcom/itextpdf/kernel/utils/PageRange;->addPageSequence(II)Lcom/itextpdf/kernel/utils/PageRange;

    move-result-object v4

    return-object v4
.end method

.method private getPageByOutline(ILcom/itextpdf/kernel/pdf/PdfOutline;)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 7
    .param p1, "fromPage"    # I
    .param p2, "outline"    # Lcom/itextpdf/kernel/pdf/PdfOutline;

    .line 316
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/PdfSplitter;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPages()I

    move-result v0

    .line 317
    .local v0, "size":I
    move v1, p1

    .local v1, "i":I
    :goto_0
    if-gt v1, v0, :cond_2

    .line 318
    iget-object v2, p0, Lcom/itextpdf/kernel/utils/PdfSplitter;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPage(I)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v2

    .line 319
    .local v2, "pdfPage":Lcom/itextpdf/kernel/pdf/PdfPage;
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfPage;->getOutlines(Z)Ljava/util/List;

    move-result-object v3

    .line 320
    .local v3, "outlineList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfOutline;>;"
    if-eqz v3, :cond_1

    .line 321
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfOutline;

    .line 322
    .local v5, "pdfOutline":Lcom/itextpdf/kernel/pdf/PdfOutline;
    invoke-virtual {v5, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 323
    return-object v2

    .line 325
    .end local v5    # "pdfOutline":Lcom/itextpdf/kernel/pdf/PdfOutline;
    :cond_0
    goto :goto_1

    .line 317
    .end local v2    # "pdfPage":Lcom/itextpdf/kernel/pdf/PdfPage;
    .end local v3    # "outlineList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfOutline;>;"
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 328
    .end local v1    # "i":I
    :cond_2
    const/4 v1, 0x0

    return-object v1
.end method

.method private splitByOutline(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfDocument;
    .locals 13
    .param p1, "outlineTitle"    # Ljava/lang/String;

    .line 278
    const/4 v0, -0x1

    .line 279
    .local v0, "startPage":I
    const/4 v1, -0x1

    .line 281
    .local v1, "endPage":I
    const/4 v2, 0x0

    invoke-direct {p0, v2}, Lcom/itextpdf/kernel/utils/PdfSplitter;->createPdfDocument(Lcom/itextpdf/kernel/utils/PageRange;)Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v3

    .line 283
    .local v3, "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    iget-object v4, p0, Lcom/itextpdf/kernel/utils/PdfSplitter;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPages()I

    move-result v4

    .line 284
    .local v4, "size":I
    const/4 v5, 0x1

    .local v5, "i":I
    :goto_0
    if-gt v5, v4, :cond_4

    .line 285
    iget-object v6, p0, Lcom/itextpdf/kernel/utils/PdfSplitter;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v6, v5}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPage(I)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v6

    .line 286
    .local v6, "pdfPage":Lcom/itextpdf/kernel/pdf/PdfPage;
    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Lcom/itextpdf/kernel/pdf/PdfPage;->getOutlines(Z)Ljava/util/List;

    move-result-object v7

    .line 287
    .local v7, "outlineList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfOutline;>;"
    if-eqz v7, :cond_3

    .line 288
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_3

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/kernel/pdf/PdfOutline;

    .line 289
    .local v9, "pdfOutline":Lcom/itextpdf/kernel/pdf/PdfOutline;
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/PdfOutline;->getTitle()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 290
    iget-object v8, p0, Lcom/itextpdf/kernel/utils/PdfSplitter;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v8, v6}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPageNumber(Lcom/itextpdf/kernel/pdf/PdfPage;)I

    move-result v0

    .line 291
    invoke-direct {p0, v9}, Lcom/itextpdf/kernel/utils/PdfSplitter;->getAbsoluteTreeNextOutline(Lcom/itextpdf/kernel/pdf/PdfOutline;)Lcom/itextpdf/kernel/pdf/PdfOutline;

    move-result-object v8

    .line 292
    .local v8, "nextOutLine":Lcom/itextpdf/kernel/pdf/PdfOutline;
    const/4 v10, 0x1

    if-eqz v8, :cond_0

    .line 293
    iget-object v11, p0, Lcom/itextpdf/kernel/utils/PdfSplitter;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-direct {p0, v5, v8}, Lcom/itextpdf/kernel/utils/PdfSplitter;->getPageByOutline(ILcom/itextpdf/kernel/pdf/PdfOutline;)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPageNumber(Lcom/itextpdf/kernel/pdf/PdfPage;)I

    move-result v11

    sub-int/2addr v11, v10

    .end local v1    # "endPage":I
    .local v11, "endPage":I
    goto :goto_2

    .line 295
    .end local v11    # "endPage":I
    .restart local v1    # "endPage":I
    :cond_0
    move v11, v4

    .line 298
    .end local v1    # "endPage":I
    .restart local v11    # "endPage":I
    :goto_2
    sub-int v1, v0, v11

    if-ne v1, v10, :cond_1

    .line 299
    move v1, v0

    .end local v11    # "endPage":I
    .restart local v1    # "endPage":I
    goto :goto_3

    .line 298
    .end local v1    # "endPage":I
    .restart local v11    # "endPage":I
    :cond_1
    move v1, v11

    goto :goto_3

    .line 303
    .end local v8    # "nextOutLine":Lcom/itextpdf/kernel/pdf/PdfOutline;
    .end local v9    # "pdfOutline":Lcom/itextpdf/kernel/pdf/PdfOutline;
    .end local v11    # "endPage":I
    .restart local v1    # "endPage":I
    :cond_2
    goto :goto_1

    .line 284
    .end local v6    # "pdfPage":Lcom/itextpdf/kernel/pdf/PdfPage;
    .end local v7    # "outlineList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfOutline;>;"
    :cond_3
    :goto_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 307
    .end local v5    # "i":I
    :cond_4
    const/4 v5, -0x1

    if-eq v0, v5, :cond_6

    if-ne v1, v5, :cond_5

    goto :goto_4

    .line 310
    :cond_5
    iget-object v2, p0, Lcom/itextpdf/kernel/utils/PdfSplitter;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v2, v0, v1, v3}, Lcom/itextpdf/kernel/pdf/PdfDocument;->copyPagesTo(IILcom/itextpdf/kernel/pdf/PdfDocument;)Ljava/util/List;

    .line 312
    return-object v3

    .line 308
    :cond_6
    :goto_4
    return-object v2
.end method

.method private xrefLength(I)J
    .locals 4
    .param p1, "size"    # I

    .line 385
    add-int/lit8 v0, p1, 0x1

    int-to-long v0, v0

    const-wide/16 v2, 0x14

    mul-long/2addr v0, v2

    return-wide v0
.end method


# virtual methods
.method public extractPageRange(Lcom/itextpdf/kernel/utils/PageRange;)Lcom/itextpdf/kernel/pdf/PdfDocument;
    .locals 2
    .param p1, "pageRange"    # Lcom/itextpdf/kernel/utils/PageRange;

    .line 219
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/utils/PdfSplitter;->extractPageRanges(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDocument;

    return-object v0
.end method

.method public extractPageRanges(Ljava/util/List;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/utils/PageRange;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            ">;"
        }
    .end annotation

    .line 199
    .local p1, "pageRanges":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/utils/PageRange;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 201
    .local v0, "splitDocuments":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfDocument;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/utils/PageRange;

    .line 202
    .local v2, "currentPageRange":Lcom/itextpdf/kernel/utils/PageRange;
    invoke-direct {p0, v2}, Lcom/itextpdf/kernel/utils/PdfSplitter;->createPdfDocument(Lcom/itextpdf/kernel/utils/PageRange;)Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v3

    .line 203
    .local v3, "currentPdfDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 204
    iget-object v4, p0, Lcom/itextpdf/kernel/utils/PdfSplitter;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    iget-object v5, p0, Lcom/itextpdf/kernel/utils/PdfSplitter;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPages()I

    move-result v5

    invoke-virtual {v2, v5}, Lcom/itextpdf/kernel/utils/PageRange;->getQualifyingPageNums(I)Ljava/util/List;

    move-result-object v5

    invoke-virtual {v4, v5, v3}, Lcom/itextpdf/kernel/pdf/PdfDocument;->copyPagesTo(Ljava/util/List;Lcom/itextpdf/kernel/pdf/PdfDocument;)Ljava/util/List;

    .line 205
    .end local v2    # "currentPageRange":Lcom/itextpdf/kernel/utils/PageRange;
    .end local v3    # "currentPdfDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    goto :goto_0

    .line 207
    :cond_0
    return-object v0
.end method

.method protected getNextPdfWriter(Lcom/itextpdf/kernel/utils/PageRange;)Lcom/itextpdf/kernel/pdf/PdfWriter;
    .locals 2
    .param p1, "documentPageRange"    # Lcom/itextpdf/kernel/utils/PageRange;

    .line 236
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfWriter;

    new-instance v1, Lcom/itextpdf/io/source/ByteArrayOutputStream;

    invoke-direct {v1}, Lcom/itextpdf/io/source/ByteArrayOutputStream;-><init>()V

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfWriter;-><init>(Ljava/io/OutputStream;)V

    return-object v0
.end method

.method public getPdfDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;
    .locals 1

    .line 223
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/PdfSplitter;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    return-object v0
.end method

.method public setEventCountingMetaInfo(Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)V
    .locals 0
    .param p1, "metaInfo"    # Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    .line 69
    iput-object p1, p0, Lcom/itextpdf/kernel/utils/PdfSplitter;->metaInfo:Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    .line 70
    return-void
.end method

.method public setPreserveOutlines(Z)V
    .locals 0
    .param p1, "preserveOutlines"    # Z

    .line 91
    iput-boolean p1, p0, Lcom/itextpdf/kernel/utils/PdfSplitter;->preserveOutlines:Z

    .line 92
    return-void
.end method

.method public setPreserveTagged(Z)V
    .locals 0
    .param p1, "preserveTagged"    # Z

    .line 80
    iput-boolean p1, p0, Lcom/itextpdf/kernel/utils/PdfSplitter;->preserveTagged:Z

    .line 81
    return-void
.end method

.method public splitByOutlines(Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            ">;"
        }
    .end annotation

    .line 261
    .local p1, "outlineTitles":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz p1, :cond_3

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 265
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 266
    .local v0, "documentList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfDocument;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 267
    .local v2, "title":Ljava/lang/String;
    invoke-direct {p0, v2}, Lcom/itextpdf/kernel/utils/PdfSplitter;->splitByOutline(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v3

    .line 268
    .local v3, "document":Lcom/itextpdf/kernel/pdf/PdfDocument;
    if-eqz v3, :cond_1

    .line 269
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 271
    .end local v2    # "title":Ljava/lang/String;
    .end local v3    # "document":Lcom/itextpdf/kernel/pdf/PdfDocument;
    :cond_1
    goto :goto_0

    .line 273
    :cond_2
    return-object v0

    .line 262
    .end local v0    # "documentList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfDocument;>;"
    :cond_3
    :goto_1
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public splitByPageCount(I)Ljava/util/List;
    .locals 2
    .param p1, "pageCount"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            ">;"
        }
    .end annotation

    .line 183
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 185
    .local v0, "splitDocuments":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfDocument;>;"
    new-instance v1, Lcom/itextpdf/kernel/utils/PdfSplitter$SplitReadyListener;

    invoke-direct {v1, v0}, Lcom/itextpdf/kernel/utils/PdfSplitter$SplitReadyListener;-><init>(Ljava/util/List;)V

    invoke-virtual {p0, p1, v1}, Lcom/itextpdf/kernel/utils/PdfSplitter;->splitByPageCount(ILcom/itextpdf/kernel/utils/PdfSplitter$IDocumentReadyListener;)V

    .line 187
    return-object v0
.end method

.method public splitByPageCount(ILcom/itextpdf/kernel/utils/PdfSplitter$IDocumentReadyListener;)V
    .locals 5
    .param p1, "pageCount"    # I
    .param p2, "documentReady"    # Lcom/itextpdf/kernel/utils/PdfSplitter$IDocumentReadyListener;

    .line 165
    const/4 v0, 0x1

    .local v0, "startPage":I
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/kernel/utils/PdfSplitter;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPages()I

    move-result v1

    if-gt v0, v1, :cond_0

    .line 166
    add-int v1, v0, p1

    add-int/lit8 v1, v1, -0x1

    iget-object v2, p0, Lcom/itextpdf/kernel/utils/PdfSplitter;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPages()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 168
    .local v1, "endPage":I
    new-instance v2, Lcom/itextpdf/kernel/utils/PageRange;

    invoke-direct {v2}, Lcom/itextpdf/kernel/utils/PageRange;-><init>()V

    invoke-virtual {v2, v0, v1}, Lcom/itextpdf/kernel/utils/PageRange;->addPageSequence(II)Lcom/itextpdf/kernel/utils/PageRange;

    move-result-object v2

    .line 169
    .local v2, "currentPageRange":Lcom/itextpdf/kernel/utils/PageRange;
    invoke-direct {p0, v2}, Lcom/itextpdf/kernel/utils/PdfSplitter;->createPdfDocument(Lcom/itextpdf/kernel/utils/PageRange;)Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v3

    .line 170
    .local v3, "currentDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    iget-object v4, p0, Lcom/itextpdf/kernel/utils/PdfSplitter;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v4, v0, v1, v3}, Lcom/itextpdf/kernel/pdf/PdfDocument;->copyPagesTo(IILcom/itextpdf/kernel/pdf/PdfDocument;)Ljava/util/List;

    .line 171
    invoke-interface {p2, v3, v2}, Lcom/itextpdf/kernel/utils/PdfSplitter$IDocumentReadyListener;->documentReady(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/utils/PageRange;)V

    .line 165
    .end local v1    # "endPage":I
    .end local v2    # "currentPageRange":Lcom/itextpdf/kernel/utils/PageRange;
    .end local v3    # "currentDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    add-int/2addr v0, p1

    goto :goto_0

    .line 173
    .end local v0    # "startPage":I
    :cond_0
    return-void
.end method

.method public splitByPageNumbers(Ljava/util/List;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            ">;"
        }
    .end annotation

    .line 150
    .local p1, "pageNumbers":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 152
    .local v0, "splitDocuments":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfDocument;>;"
    new-instance v1, Lcom/itextpdf/kernel/utils/PdfSplitter$SplitReadyListener;

    invoke-direct {v1, v0}, Lcom/itextpdf/kernel/utils/PdfSplitter$SplitReadyListener;-><init>(Ljava/util/List;)V

    invoke-virtual {p0, p1, v1}, Lcom/itextpdf/kernel/utils/PdfSplitter;->splitByPageNumbers(Ljava/util/List;Lcom/itextpdf/kernel/utils/PdfSplitter$IDocumentReadyListener;)V

    .line 154
    return-object v0
.end method

.method public splitByPageNumbers(Ljava/util/List;Lcom/itextpdf/kernel/utils/PdfSplitter$IDocumentReadyListener;)V
    .locals 7
    .param p2, "documentReady"    # Lcom/itextpdf/kernel/utils/PdfSplitter$IDocumentReadyListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/itextpdf/kernel/utils/PdfSplitter$IDocumentReadyListener;",
            ")V"
        }
    .end annotation

    .line 126
    .local p1, "pageNumbers":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v0, 0x1

    .line 128
    .local v0, "currentPageNumber":I
    const/4 v1, 0x0

    .local v1, "ind":I
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-gt v1, v2, :cond_2

    .line 129
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x1

    if-ne v1, v2, :cond_0

    iget-object v2, p0, Lcom/itextpdf/kernel/utils/PdfSplitter;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPages()I

    move-result v2

    add-int/2addr v2, v3

    goto :goto_1

    :cond_0
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 130
    .local v2, "nextPageNumber":I
    :goto_1
    if-nez v1, :cond_1

    if-ne v2, v3, :cond_1

    .line 131
    goto :goto_2

    .line 133
    :cond_1
    new-instance v3, Lcom/itextpdf/kernel/utils/PageRange;

    invoke-direct {v3}, Lcom/itextpdf/kernel/utils/PageRange;-><init>()V

    add-int/lit8 v4, v2, -0x1

    invoke-virtual {v3, v0, v4}, Lcom/itextpdf/kernel/utils/PageRange;->addPageSequence(II)Lcom/itextpdf/kernel/utils/PageRange;

    move-result-object v3

    .line 134
    .local v3, "currentPageRange":Lcom/itextpdf/kernel/utils/PageRange;
    invoke-direct {p0, v3}, Lcom/itextpdf/kernel/utils/PdfSplitter;->createPdfDocument(Lcom/itextpdf/kernel/utils/PageRange;)Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v4

    .line 135
    .local v4, "currentDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    iget-object v5, p0, Lcom/itextpdf/kernel/utils/PdfSplitter;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    add-int/lit8 v6, v2, -0x1

    invoke-virtual {v5, v0, v6, v4}, Lcom/itextpdf/kernel/pdf/PdfDocument;->copyPagesTo(IILcom/itextpdf/kernel/pdf/PdfDocument;)Ljava/util/List;

    .line 136
    invoke-interface {p2, v4, v3}, Lcom/itextpdf/kernel/utils/PdfSplitter$IDocumentReadyListener;->documentReady(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/utils/PageRange;)V

    .line 138
    move v0, v2

    .line 128
    .end local v2    # "nextPageNumber":I
    .end local v3    # "currentPageRange":Lcom/itextpdf/kernel/utils/PageRange;
    .end local v4    # "currentDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 140
    .end local v1    # "ind":I
    :cond_2
    return-void
.end method

.method public splitBySize(J)Ljava/util/List;
    .locals 6
    .param p1, "size"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            ">;"
        }
    .end annotation

    .line 103
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 104
    .local v0, "splitRanges":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/utils/PageRange;>;"
    const/4 v1, 0x1

    .line 105
    .local v1, "currentPage":I
    iget-object v2, p0, Lcom/itextpdf/kernel/utils/PdfSplitter;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPages()I

    move-result v2

    .line 107
    .local v2, "numOfPages":I
    :goto_0
    if-gt v1, v2, :cond_0

    .line 108
    invoke-direct {p0, v1, v2, p1, p2}, Lcom/itextpdf/kernel/utils/PdfSplitter;->getNextRange(IIJ)Lcom/itextpdf/kernel/utils/PageRange;

    move-result-object v3

    .line 109
    .local v3, "nextRange":Lcom/itextpdf/kernel/utils/PageRange;
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 110
    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/utils/PageRange;->getQualifyingPageNums(I)Ljava/util/List;

    move-result-object v4

    .line 111
    .local v4, "allPages":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    add-int/lit8 v1, v5, 0x1

    .line 112
    .end local v3    # "nextRange":Lcom/itextpdf/kernel/utils/PageRange;
    .end local v4    # "allPages":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    goto :goto_0

    .line 114
    :cond_0
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/utils/PdfSplitter;->extractPageRanges(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    return-object v3
.end method
