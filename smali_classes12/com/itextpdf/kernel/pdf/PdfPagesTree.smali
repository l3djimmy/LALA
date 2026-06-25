.class Lcom/itextpdf/kernel/pdf/PdfPagesTree;
.super Ljava/lang/Object;
.source "PdfPagesTree.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;
    }
.end annotation


# static fields
.field static final DEFAULT_LEAF_SIZE:I = 0xa

.field private static final LOGGER:Lorg/slf4j/Logger;


# instance fields
.field private document:Lcom/itextpdf/kernel/pdf/PdfDocument;

.field private generated:Z

.field private final leafSize:I

.field private pageRefs:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList<",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            ">;"
        }
    .end annotation
.end field

.field private pages:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList<",
            "Lcom/itextpdf/kernel/pdf/PdfPage;",
            ">;"
        }
    .end annotation
.end field

.field private parents:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfPages;",
            ">;"
        }
    .end annotation
.end field

.field private root:Lcom/itextpdf/kernel/pdf/PdfPages;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 55
    const-class v0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->LOGGER:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfCatalog;)V
    .locals 5
    .param p1, "pdfCatalog"    # Lcom/itextpdf/kernel/pdf/PdfCatalog;

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    const/16 v0, 0xa

    iput v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->leafSize:I

    .line 52
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->generated:Z

    .line 63
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 64
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;-><init>()V

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->pageRefs:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    .line 65
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->parents:Ljava/util/List;

    .line 66
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;-><init>()V

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->pages:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    .line 67
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Pages:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 68
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Pages:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    .line 69
    .local v1, "pages":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v1, :cond_1

    .line 73
    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfPages;

    const v4, 0x7fffffff

    invoke-direct {v3, v0, v4, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfPages;-><init>(IILcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfPages;)V

    iput-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->root:Lcom/itextpdf/kernel/pdf/PdfPages;

    .line 74
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->parents:Ljava/util/List;

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->root:Lcom/itextpdf/kernel/pdf/PdfPages;

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->root:Lcom/itextpdf/kernel/pdf/PdfPages;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfPages;->getCount()I

    move-result v3

    if-ge v0, v3, :cond_0

    .line 76
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->pageRefs:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->add(Ljava/lang/Object;)V

    .line 77
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->pages:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->add(Ljava/lang/Object;)V

    .line 75
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 79
    .end local v0    # "i":I
    .end local v1    # "pages":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_0
    goto :goto_1

    .line 70
    .restart local v1    # "pages":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_1
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Invalid page structure. /Pages must be PdfDictionary."

    invoke-direct {v0, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 80
    .end local v1    # "pages":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_2
    iput-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->root:Lcom/itextpdf/kernel/pdf/PdfPages;

    .line 81
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->parents:Ljava/util/List;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfPages;

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-direct {v2, v0, v3}, Lcom/itextpdf/kernel/pdf/PdfPages;-><init>(ILcom/itextpdf/kernel/pdf/PdfDocument;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    :goto_1
    return-void
.end method

.method private correctPdfPagesFromProperty(II)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "correction"    # I

    .line 509
    move v0, p1

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->parents:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 510
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->parents:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 511
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->parents:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfPages;

    invoke-virtual {v1, p2}, Lcom/itextpdf/kernel/pdf/PdfPages;->correctFrom(I)V

    .line 509
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 514
    .end local v0    # "i":I
    :cond_1
    return-void
.end method

.method private findPageParent(I)I
    .locals 4
    .param p1, "pageNum"    # I

    .line 495
    const/4 v0, 0x0

    .line 496
    .local v0, "low":I
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->parents:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    .line 497
    .local v1, "high":I
    :goto_0
    if-eq v0, v1, :cond_1

    .line 498
    add-int v2, v0, v1

    add-int/lit8 v2, v2, 0x1

    div-int/lit8 v2, v2, 0x2

    .line 499
    .local v2, "middle":I
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->parents:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfPages;

    invoke-virtual {v3, p1}, Lcom/itextpdf/kernel/pdf/PdfPages;->compareTo(I)I

    move-result v3

    if-lez v3, :cond_0

    .line 500
    add-int/lit8 v1, v2, -0x1

    goto :goto_1

    .line 502
    :cond_0
    move v0, v2

    .line 504
    .end local v2    # "middle":I
    :goto_1
    goto :goto_0

    .line 505
    :cond_1
    return v0
.end method

.method private internalRemovePage(I)Z
    .locals 6
    .param p1, "pageNum"    # I

    .line 471
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->findPageParent(I)I

    move-result v0

    .line 472
    .local v0, "parentIndex":I
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->parents:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfPages;

    .line 473
    .local v1, "pdfPages":Lcom/itextpdf/kernel/pdf/PdfPages;
    invoke-virtual {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfPages;->removePage(I)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_2

    .line 474
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfPages;->getCount()I

    move-result v2

    if-nez v2, :cond_0

    .line 475
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->parents:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 476
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfPages;->removeFromParent()V

    .line 477
    add-int/lit8 v0, v0, -0x1

    .line 479
    :cond_0
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->parents:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_1

    .line 480
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->root:Lcom/itextpdf/kernel/pdf/PdfPages;

    .line 481
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->parents:Ljava/util/List;

    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfPages;

    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-direct {v4, v3, v5}, Lcom/itextpdf/kernel/pdf/PdfPages;-><init>(ILcom/itextpdf/kernel/pdf/PdfDocument;)V

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 483
    :cond_1
    add-int/lit8 v2, v0, 0x1

    const/4 v3, -0x1

    invoke-direct {p0, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->correctPdfPagesFromProperty(II)V

    .line 485
    :goto_0
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->pageRefs:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    invoke-virtual {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->remove(I)V

    .line 486
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->pages:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    invoke-virtual {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->remove(I)V

    .line 487
    const/4 v2, 0x1

    return v2

    .line 489
    :cond_2
    return v3
.end method

.method private loadPage(I)V
    .locals 1
    .param p1, "pageNum"    # I

    .line 333
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->loadPage(ILjava/util/Set;)V

    .line 334
    return-void
.end method

.method private loadPage(ILjava/util/Set;)V
    .locals 16
    .param p1, "pageNum"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            ">;)V"
        }
    .end annotation

    .line 344
    .local p2, "processedParents":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p2

    iget-object v3, v0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->pageRefs:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    invoke-virtual {v3, v1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 345
    .local v3, "targetPage":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    if-eqz v3, :cond_0

    .line 346
    return-void

    .line 350
    :cond_0
    invoke-direct/range {p0 .. p1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->findPageParent(I)I

    move-result v4

    .line 351
    .local v4, "parentIndex":I
    iget-object v5, v0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->parents:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfPages;

    .line 352
    .local v5, "parent":Lcom/itextpdf/kernel/pdf/PdfPages;
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfPages;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v6

    .line 353
    .local v6, "parentIndirectReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    const-string v7, "Invalid page structure {0}."

    if-eqz v6, :cond_2

    .line 354
    invoke-interface {v2, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 358
    invoke-interface {v2, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 355
    :cond_1
    new-instance v8, Lcom/itextpdf/kernel/exceptions/PdfException;

    invoke-direct {v8, v7}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    add-int/lit8 v7, v1, 0x1

    .line 356
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v8, v7}, Lcom/itextpdf/kernel/exceptions/PdfException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/kernel/exceptions/PdfException;

    move-result-object v7

    throw v7

    .line 361
    :cond_2
    :goto_0
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfPages;->getKids()Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v8

    .line 362
    .local v8, "kids":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-eqz v8, :cond_10

    .line 365
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfPages;->getCount()I

    move-result v9

    .line 369
    .local v9, "kidsCount":I
    const/4 v10, 0x0

    .line 372
    .local v10, "findPdfPages":Z
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_1
    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v12

    if-ge v11, v12, :cond_7

    .line 373
    invoke-virtual {v8, v11}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsDictionary(I)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v12

    .line 376
    .local v12, "page":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v12, :cond_6

    .line 380
    sget-object v13, Lcom/itextpdf/kernel/pdf/PdfName;->Kids:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v12, v13}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v13

    .line 381
    .local v13, "pageKids":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v13, :cond_4

    .line 382
    invoke-virtual {v13}, Lcom/itextpdf/kernel/pdf/PdfObject;->isArray()Z

    move-result v14

    if-eqz v14, :cond_3

    .line 383
    const/4 v10, 0x1

    goto :goto_2

    .line 386
    :cond_3
    new-instance v14, Lcom/itextpdf/kernel/exceptions/PdfException;

    invoke-direct {v14, v7}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    add-int/lit8 v7, v1, 0x1

    .line 387
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v14, v7}, Lcom/itextpdf/kernel/exceptions/PdfException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/kernel/exceptions/PdfException;

    move-result-object v7

    throw v7

    .line 390
    :cond_4
    :goto_2
    iget-object v14, v0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v14}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getReader()Lcom/itextpdf/kernel/pdf/PdfReader;

    move-result-object v14

    invoke-virtual {v14}, Lcom/itextpdf/kernel/pdf/PdfReader;->isMemorySavingMode()Z

    move-result v14

    if-eqz v14, :cond_5

    if-nez v10, :cond_5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfPages;->getFrom()I

    move-result v14

    add-int/2addr v14, v11

    if-eq v14, v1, :cond_5

    .line 391
    invoke-virtual {v12}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->release()V

    .line 372
    .end local v12    # "page":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v13    # "pageKids":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_5
    add-int/lit8 v11, v11, 0x1

    goto :goto_1

    .line 377
    .restart local v12    # "page":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_6
    new-instance v13, Lcom/itextpdf/kernel/exceptions/PdfException;

    invoke-direct {v13, v7}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    add-int/lit8 v7, v1, 0x1

    .line 378
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v13, v7}, Lcom/itextpdf/kernel/exceptions/PdfException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/kernel/exceptions/PdfException;

    move-result-object v7

    throw v7

    .line 394
    .end local v11    # "i":I
    .end local v12    # "page":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_7
    if-eqz v10, :cond_d

    .line 398
    new-instance v7, Ljava/util/ArrayList;

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v11

    invoke-direct {v7, v11}, Ljava/util/ArrayList;-><init>(I)V

    .line 399
    .local v7, "newParents":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfPages;>;"
    const/4 v11, 0x0

    .line 400
    .local v11, "lastPdfPages":Lcom/itextpdf/kernel/pdf/PdfPages;
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_3
    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v13

    if-ge v12, v13, :cond_b

    if-lez v9, :cond_b

    .line 412
    invoke-virtual {v8, v12}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsDictionary(I)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v13

    .line 413
    .local v13, "pdfPagesObject":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v14, Lcom/itextpdf/kernel/pdf/PdfName;->Kids:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v13, v14}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v14

    if-nez v14, :cond_9

    .line 417
    if-nez v11, :cond_8

    .line 419
    new-instance v14, Lcom/itextpdf/kernel/pdf/PdfPages;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfPages;->getFrom()I

    move-result v15

    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-direct {v14, v15, v1, v5}, Lcom/itextpdf/kernel/pdf/PdfPages;-><init>(ILcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfPages;)V

    move-object v11, v14

    .line 420
    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/PdfPages;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {v8, v12, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->set(ILcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 421
    invoke-interface {v7, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 425
    :cond_8
    invoke-virtual {v8, v12}, Lcom/itextpdf/kernel/pdf/PdfArray;->remove(I)V

    .line 426
    add-int/lit8 v12, v12, -0x1

    .line 430
    :goto_4
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfPages;->decrementCount()V

    .line 431
    invoke-virtual {v11, v13}, Lcom/itextpdf/kernel/pdf/PdfPages;->addPage(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 432
    add-int/lit8 v9, v9, -0x1

    goto :goto_6

    .line 436
    :cond_9
    if-nez v11, :cond_a

    .line 437
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfPages;->getFrom()I

    move-result v1

    goto :goto_5

    .line 438
    :cond_a
    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/PdfPages;->getFrom()I

    move-result v1

    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/PdfPages;->getCount()I

    move-result v14

    add-int/2addr v1, v14

    :goto_5
    nop

    .line 439
    .local v1, "from":I
    new-instance v14, Lcom/itextpdf/kernel/pdf/PdfPages;

    invoke-direct {v14, v1, v9, v13, v5}, Lcom/itextpdf/kernel/pdf/PdfPages;-><init>(IILcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfPages;)V

    .line 440
    .end local v11    # "lastPdfPages":Lcom/itextpdf/kernel/pdf/PdfPages;
    .local v14, "lastPdfPages":Lcom/itextpdf/kernel/pdf/PdfPages;
    invoke-interface {v7, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 441
    invoke-virtual {v14}, Lcom/itextpdf/kernel/pdf/PdfPages;->getCount()I

    move-result v11

    sub-int/2addr v9, v11

    move-object v11, v14

    .line 400
    .end local v1    # "from":I
    .end local v13    # "pdfPagesObject":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v14    # "lastPdfPages":Lcom/itextpdf/kernel/pdf/PdfPages;
    .restart local v11    # "lastPdfPages":Lcom/itextpdf/kernel/pdf/PdfPages;
    :goto_6
    add-int/lit8 v12, v12, 0x1

    move/from16 v1, p1

    goto :goto_3

    .line 444
    .end local v12    # "i":I
    :cond_b
    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->parents:Ljava/util/List;

    invoke-interface {v1, v4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 445
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    .local v1, "i":I
    :goto_7
    if-ltz v1, :cond_c

    .line 446
    iget-object v12, v0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->parents:Ljava/util/List;

    invoke-interface {v7, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    invoke-interface {v12, v4, v13}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 445
    add-int/lit8 v1, v1, -0x1

    goto :goto_7

    .line 451
    .end local v1    # "i":I
    :cond_c
    invoke-direct/range {p0 .. p2}, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->loadPage(ILjava/util/Set;)V

    .line 452
    .end local v7    # "newParents":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfPages;>;"
    .end local v11    # "lastPdfPages":Lcom/itextpdf/kernel/pdf/PdfPages;
    goto :goto_a

    .line 453
    :cond_d
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfPages;->getFrom()I

    move-result v1

    .line 456
    .local v1, "from":I
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfPages;->getCount()I

    move-result v7

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v11

    invoke-static {v7, v11}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 457
    .local v7, "pageCount":I
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_8
    if-ge v11, v7, :cond_f

    .line 458
    const/4 v12, 0x0

    invoke-virtual {v8, v11, v12}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(IZ)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v12

    .line 459
    .local v12, "kid":Lcom/itextpdf/kernel/pdf/PdfObject;
    instance-of v13, v12, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 462
    iget-object v14, v0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->pageRefs:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    .line 459
    if-eqz v13, :cond_e

    .line 460
    add-int v13, v1, v11

    move-object v15, v12

    check-cast v15, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v14, v13, v15}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->set(ILjava/lang/Object;)V

    goto :goto_9

    .line 462
    :cond_e
    add-int v13, v1, v11

    invoke-virtual {v12}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v15

    invoke-virtual {v14, v13, v15}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->set(ILjava/lang/Object;)V

    .line 457
    .end local v12    # "kid":Lcom/itextpdf/kernel/pdf/PdfObject;
    :goto_9
    add-int/lit8 v11, v11, 0x1

    goto :goto_8

    .line 467
    .end local v1    # "from":I
    .end local v7    # "pageCount":I
    .end local v11    # "i":I
    :cond_f
    :goto_a
    return-void

    .line 363
    .end local v9    # "kidsCount":I
    .end local v10    # "findPdfPages":Z
    :cond_10
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    invoke-direct {v1, v7}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    add-int/lit8 v7, p1, 0x1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v1, v7}, Lcom/itextpdf/kernel/exceptions/PdfException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/kernel/exceptions/PdfException;

    move-result-object v1

    throw v1
.end method


# virtual methods
.method public addPage(ILcom/itextpdf/kernel/pdf/PdfPage;)V
    .locals 4
    .param p1, "index"    # I
    .param p2, "pdfPage"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 220
    add-int/lit8 p1, p1, -0x1

    .line 221
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->pageRefs:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->size()I

    move-result v0

    if-gt p1, v0, :cond_1

    .line 224
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->pageRefs:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->size()I

    move-result v0

    if-ne p1, v0, :cond_0

    .line 225
    invoke-virtual {p0, p2}, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->addPage(Lcom/itextpdf/kernel/pdf/PdfPage;)V

    .line 226
    return-void

    .line 228
    :cond_0
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->loadPage(I)V

    .line 229
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {p2, v0}, Lcom/itextpdf/kernel/pdf/PdfPage;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 230
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->findPageParent(I)I

    move-result v0

    .line 231
    .local v0, "parentIndex":I
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->parents:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfPages;

    .line 232
    .local v1, "parentPages":Lcom/itextpdf/kernel/pdf/PdfPages;
    invoke-virtual {v1, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfPages;->addPage(ILcom/itextpdf/kernel/pdf/PdfPage;)Z

    .line 233
    iput-object v1, p2, Lcom/itextpdf/kernel/pdf/PdfPage;->parentPages:Lcom/itextpdf/kernel/pdf/PdfPages;

    .line 234
    add-int/lit8 v2, v0, 0x1

    const/4 v3, 0x1

    invoke-direct {p0, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->correctPdfPagesFromProperty(II)V

    .line 235
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->pageRefs:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v3

    invoke-virtual {v2, p1, v3}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->add(ILjava/lang/Object;)V

    .line 236
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->pages:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    invoke-virtual {v2, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->add(ILjava/lang/Object;)V

    .line 237
    return-void

    .line 222
    .end local v0    # "parentIndex":I
    .end local v1    # "parentPages":Lcom/itextpdf/kernel/pdf/PdfPages;
    :cond_1
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    const-string v1, "index"

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public addPage(Lcom/itextpdf/kernel/pdf/PdfPage;)V
    .locals 4
    .param p1, "pdfPage"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 189
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->root:Lcom/itextpdf/kernel/pdf/PdfPages;

    if-eqz v0, :cond_1

    .line 192
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->pageRefs:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 193
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->root:Lcom/itextpdf/kernel/pdf/PdfPages;

    .local v0, "pdfPages":Lcom/itextpdf/kernel/pdf/PdfPages;
    goto :goto_0

    .line 195
    .end local v0    # "pdfPages":Lcom/itextpdf/kernel/pdf/PdfPages;
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->pageRefs:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->loadPage(I)V

    .line 196
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->parents:Ljava/util/List;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->parents:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfPages;

    .restart local v0    # "pdfPages":Lcom/itextpdf/kernel/pdf/PdfPages;
    goto :goto_0

    .line 199
    .end local v0    # "pdfPages":Lcom/itextpdf/kernel/pdf/PdfPages;
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->parents:Ljava/util/List;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->parents:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfPages;

    .line 200
    .restart local v0    # "pdfPages":Lcom/itextpdf/kernel/pdf/PdfPages;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfPages;->getCount()I

    move-result v1

    rem-int/lit8 v1, v1, 0xa

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->pageRefs:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->size()I

    move-result v1

    if-lez v1, :cond_2

    .line 201
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfPages;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfPages;->getFrom()I

    move-result v2

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfPages;->getCount()I

    move-result v3

    add-int/2addr v2, v3

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfPages;-><init>(ILcom/itextpdf/kernel/pdf/PdfDocument;)V

    move-object v0, v1

    .line 202
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->parents:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 206
    :cond_2
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfPage;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 207
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfPages;->addPage(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 208
    iput-object v0, p1, Lcom/itextpdf/kernel/pdf/PdfPage;->parentPages:Lcom/itextpdf/kernel/pdf/PdfPages;

    .line 209
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->pageRefs:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->add(Ljava/lang/Object;)V

    .line 210
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->pages:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    invoke-virtual {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->add(Ljava/lang/Object;)V

    .line 211
    return-void
.end method

.method protected clearPageRefs()V
    .locals 1

    .line 314
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->pageRefs:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    .line 315
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->pages:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    .line 316
    return-void
.end method

.method protected findPageParent(Lcom/itextpdf/kernel/pdf/PdfPage;)Lcom/itextpdf/kernel/pdf/PdfPages;
    .locals 3
    .param p1, "pdfPage"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 327
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->getPageNumber(Lcom/itextpdf/kernel/pdf/PdfPage;)I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .line 328
    .local v0, "pageNum":I
    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->findPageParent(I)I

    move-result v1

    .line 329
    .local v1, "parentIndex":I
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->parents:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfPages;

    return-object v2
.end method

.method protected generateTree()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 10

    .line 277
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->pageRefs:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 278
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->LOGGER:Lorg/slf4j/Logger;

    const-string v1, "Attempt to generate PDF pages tree without any pages, so a new page will be added."

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    .line 279
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->addNewPage()Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 281
    :cond_0
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->generated:Z

    if-nez v0, :cond_6

    .line 285
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->root:Lcom/itextpdf/kernel/pdf/PdfPages;

    const/4 v1, 0x1

    if-nez v0, :cond_5

    .line 286
    :goto_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->parents:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-eq v0, v1, :cond_4

    .line 287
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 289
    .local v0, "nextParents":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfPages;>;"
    const/16 v2, 0xa

    .line 290
    .local v2, "dynamicLeafSize":I
    const/4 v3, 0x0

    .line 291
    .local v3, "current":Lcom/itextpdf/kernel/pdf/PdfPages;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->parents:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-ge v4, v5, :cond_3

    .line 292
    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->parents:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfPages;

    .line 293
    .local v5, "pages":Lcom/itextpdf/kernel/pdf/PdfPages;
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfPages;->getCount()I

    move-result v6

    .line 294
    .local v6, "pageCount":I
    rem-int v7, v4, v2

    if-nez v7, :cond_2

    .line 295
    if-gt v6, v1, :cond_1

    .line 296
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 298
    :cond_1
    new-instance v7, Lcom/itextpdf/kernel/pdf/PdfPages;

    const/4 v8, -0x1

    iget-object v9, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-direct {v7, v8, v9}, Lcom/itextpdf/kernel/pdf/PdfPages;-><init>(ILcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 299
    .end local v3    # "current":Lcom/itextpdf/kernel/pdf/PdfPages;
    .local v7, "current":Lcom/itextpdf/kernel/pdf/PdfPages;
    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 300
    const/16 v2, 0xa

    move-object v3, v7

    .line 303
    .end local v7    # "current":Lcom/itextpdf/kernel/pdf/PdfPages;
    .restart local v3    # "current":Lcom/itextpdf/kernel/pdf/PdfPages;
    :cond_2
    :goto_2
    invoke-virtual {v3, v5}, Lcom/itextpdf/kernel/pdf/PdfPages;->addPages(Lcom/itextpdf/kernel/pdf/PdfPages;)V

    .line 291
    .end local v5    # "pages":Lcom/itextpdf/kernel/pdf/PdfPages;
    .end local v6    # "pageCount":I
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 305
    .end local v4    # "i":I
    :cond_3
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->parents:Ljava/util/List;

    .line 306
    .end local v0    # "nextParents":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfPages;>;"
    .end local v2    # "dynamicLeafSize":I
    .end local v3    # "current":Lcom/itextpdf/kernel/pdf/PdfPages;
    goto :goto_0

    .line 307
    :cond_4
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->parents:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfPages;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->root:Lcom/itextpdf/kernel/pdf/PdfPages;

    .line 309
    :cond_5
    iput-boolean v1, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->generated:Z

    .line 310
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->root:Lcom/itextpdf/kernel/pdf/PdfPages;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfPages;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0

    .line 282
    :cond_6
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "PdfPages tree could be generated only once."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getNumberOfPages()I
    .locals 1

    .line 150
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->pageRefs:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->size()I

    move-result v0

    return v0
.end method

.method public getPage(I)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 6
    .param p1, "pageNum"    # I

    .line 95
    const/4 v0, 0x1

    if-lt p1, v0, :cond_4

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->getNumberOfPages()I

    move-result v0

    if-gt p1, v0, :cond_4

    .line 99
    add-int/lit8 p1, p1, -0x1

    .line 100
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->pages:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 101
    .local v0, "pdfPage":Lcom/itextpdf/kernel/pdf/PdfPage;
    const-string v1, "Page tree is broken. Failed to retrieve page number {0}. Null will be returned."

    if-nez v0, :cond_2

    .line 102
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->loadPage(I)V

    .line 103
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->pageRefs:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    invoke-virtual {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 104
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->findPageParent(I)I

    move-result v2

    .line 105
    .local v2, "parentIndex":I
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->pageRefs:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    invoke-virtual {v3, p1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getRefersTo()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    .line 106
    .local v3, "pageObject":Lcom/itextpdf/kernel/pdf/PdfObject;
    instance-of v4, v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    if-eqz v4, :cond_0

    .line 107
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPageFactory()Lcom/itextpdf/kernel/pdf/IPdfPageFactory;

    move-result-object v4

    move-object v5, v3

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-interface {v4, v5}, Lcom/itextpdf/kernel/pdf/IPdfPageFactory;->createPdfPage(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v0

    .line 108
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->parents:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfPages;

    iput-object v4, v0, Lcom/itextpdf/kernel/pdf/PdfPage;->parentPages:Lcom/itextpdf/kernel/pdf/PdfPages;

    goto :goto_0

    .line 110
    :cond_0
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->LOGGER:Lorg/slf4j/Logger;

    add-int/lit8 v5, p1, 0x1

    .line 112
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    .line 111
    invoke-static {v1, v5}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 110
    invoke-interface {v4, v5}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 114
    .end local v2    # "parentIndex":I
    .end local v3    # "pageObject":Lcom/itextpdf/kernel/pdf/PdfObject;
    :goto_0
    goto :goto_1

    .line 115
    :cond_1
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->LOGGER:Lorg/slf4j/Logger;

    add-int/lit8 v3, p1, 0x1

    .line 116
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    .line 115
    invoke-static {v1, v3}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 118
    :goto_1
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->pages:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    invoke-virtual {v2, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->set(ILjava/lang/Object;)V

    .line 120
    :cond_2
    if-eqz v0, :cond_3

    .line 125
    return-object v0

    .line 121
    :cond_3
    new-instance v2, Lcom/itextpdf/kernel/exceptions/PdfException;

    add-int/lit8 v3, p1, 0x1

    .line 123
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    .line 122
    invoke-static {v1, v3}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 96
    .end local v0    # "pdfPage":Lcom/itextpdf/kernel/pdf/PdfPage;
    :cond_4
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    .line 97
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    .line 96
    const-string v2, "Requested page number {0} is out of bounds."

    invoke-static {v2, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getPage(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 2
    .param p1, "pageDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 136
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->getPageNumber(Lcom/itextpdf/kernel/pdf/PdfDictionary;)I

    move-result v0

    .line 137
    .local v0, "pageNum":I
    if-lez v0, :cond_0

    .line 138
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->getPage(I)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v1

    return-object v1

    .line 141
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public getPageNumber(Lcom/itextpdf/kernel/pdf/PdfDictionary;)I
    .locals 4
    .param p1, "pageDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 166
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->pageRefs:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 167
    .local v0, "pageNum":I
    if-ltz v0, :cond_0

    .line 168
    add-int/lit8 v1, v0, 0x1

    return v1

    .line 170
    :cond_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->pageRefs:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->size()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 171
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->pageRefs:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_1

    .line 172
    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->loadPage(I)V

    .line 174
    :cond_1
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->pageRefs:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 175
    add-int/lit8 v2, v1, 0x1

    return v2

    .line 170
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 179
    .end local v1    # "i":I
    :cond_3
    const/4 v1, 0x0

    return v1
.end method

.method public getPageNumber(Lcom/itextpdf/kernel/pdf/PdfPage;)I
    .locals 1
    .param p1, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 158
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->pages:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method protected getParents()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfPages;",
            ">;"
        }
    .end annotation

    .line 319
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->parents:Ljava/util/List;

    return-object v0
.end method

.method protected getRoot()Lcom/itextpdf/kernel/pdf/PdfPages;
    .locals 1

    .line 323
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->root:Lcom/itextpdf/kernel/pdf/PdfPages;

    return-object v0
.end method

.method releasePage(I)V
    .locals 4
    .param p1, "pageNumber"    # I

    .line 261
    add-int/lit8 p1, p1, -0x1

    .line 262
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->pageRefs:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->pageRefs:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->checkState(S)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->pageRefs:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    .line 263
    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->checkState(S)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->pageRefs:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    .line 264
    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getOffset()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->pageRefs:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getIndex()I

    move-result v0

    if-ltz v0, :cond_1

    .line 265
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->pages:Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->set(ILjava/lang/Object;)V

    .line 267
    :cond_1
    return-void
.end method

.method public removePage(I)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 3
    .param p1, "pageNum"    # I

    .line 249
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->getPage(I)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v0

    .line 250
    .local v0, "pdfPage":Lcom/itextpdf/kernel/pdf/PdfPage;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfPage;->isFlushed()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 251
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->LOGGER:Lorg/slf4j/Logger;

    const-string v2, "The page requested to be removed has already been flushed."

    invoke-interface {v1, v2}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 253
    :cond_0
    add-int/lit8 p1, p1, -0x1

    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->internalRemovePage(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 254
    return-object v0

    .line 256
    :cond_1
    const/4 v1, 0x0

    return-object v1
.end method
