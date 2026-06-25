.class public Lcom/itextpdf/kernel/pdf/PdfXrefTable;
.super Ljava/lang/Object;
.source "PdfXrefTable.java"


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final INITIAL_CAPACITY:I = 0x20

.field private static final MAX_GENERATION:I = 0xffff

.field private static final MAX_OFFSET_IN_CROSS_REFERENCE_STREAM:J = 0x2540be3ffL

.field private static final freeXRefEntry:[B

.field private static final inUseXRefEntry:[B


# instance fields
.field private count:I

.field private final freeReferencesLinkedList:Ljava/util/TreeMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/TreeMap<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            ">;"
        }
    .end annotation
.end field

.field private memoryLimitsAwareHandler:Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;

.field private readingCompleted:Z

.field private xref:[Lcom/itextpdf/kernel/pdf/PdfIndirectReference;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 47
    nop

    .line 62
    const-string v0, "f \n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->freeXRefEntry:[B

    .line 63
    const-string v0, "n \n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->inUseXRefEntry:[B

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 82
    const/16 v0, 0x20

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;-><init>(I)V

    .line 83
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "capacity"    # I

    .line 91
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;-><init>(ILcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;)V

    .line 92
    return-void
.end method

.method public constructor <init>(ILcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;)V
    .locals 7
    .param p1, "capacity"    # I
    .param p2, "memoryLimitsAwareHandler"    # Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;

    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->count:I

    .line 110
    const/4 v0, 0x1

    if-ge p1, v0, :cond_1

    .line 111
    const/16 v0, 0x20

    if-nez p2, :cond_0

    goto :goto_0

    .line 112
    :cond_0
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->getMaxNumberOfElementsInXrefStructure()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    :goto_0
    move p1, v0

    .line 114
    :cond_1
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->memoryLimitsAwareHandler:Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;

    .line 115
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->memoryLimitsAwareHandler:Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;

    if-eqz v0, :cond_2

    .line 116
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->memoryLimitsAwareHandler:Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->checkIfXrefStructureExceedsTheLimit(I)V

    .line 118
    :cond_2
    new-array v0, p1, [Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->xref:[Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 119
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->freeReferencesLinkedList:Ljava/util/TreeMap;

    .line 120
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    const v4, 0xffff

    const-wide/16 v5, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct/range {v1 .. v6}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;IIJ)V

    const/4 v0, 0x2

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->add(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 121
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;)V
    .locals 1
    .param p1, "memoryLimitsAwareHandler"    # Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;

    .line 100
    const/16 v0, 0x20

    invoke-direct {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;-><init>(ILcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;)V

    .line 101
    return-void
.end method

.method private appendNewRefToFreeList(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)V
    .locals 5
    .param p1, "reference"    # Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 591
    const-wide/16 v0, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setOffset(J)V

    .line 592
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->freeReferencesLinkedList:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 597
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->freeReferencesLinkedList:Ljava/util/TreeMap;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 598
    .local v0, "lastFreeRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getObjNumber()I

    move-result v3

    int-to-long v3, v3

    invoke-virtual {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setOffset(J)V

    .line 599
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->freeReferencesLinkedList:Ljava/util/TreeMap;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getObjNumber()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3, v0}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 600
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->freeReferencesLinkedList:Ljava/util/TreeMap;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v2, v1, p1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 601
    return-void

    .line 593
    .end local v0    # "lastFreeRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method private createSections(Lcom/itextpdf/kernel/pdf/PdfDocument;Z)Ljava/util/List;
    .locals 6
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "dropObjectsFromObjectStream"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            "Z)",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 540
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 541
    .local v0, "sections":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v1, 0x0

    .line 542
    .local v1, "first":I
    const/4 v2, 0x0

    .line 543
    .local v2, "len":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->size()I

    move-result v4

    if-ge v3, v4, :cond_5

    .line 544
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->xref:[Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    aget-object v4, v4, v3

    .line 545
    .local v4, "reference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    iget-object v5, p1, Lcom/itextpdf/kernel/pdf/PdfDocument;->properties:Lcom/itextpdf/kernel/pdf/StampingProperties;

    iget-boolean v5, v5, Lcom/itextpdf/kernel/pdf/StampingProperties;->appendMode:Z

    if-eqz v5, :cond_1

    if-eqz v4, :cond_1

    .line 546
    const/16 v5, 0x8

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->checkState(S)Z

    move-result v5

    if-eqz v5, :cond_0

    if-eqz p2, :cond_1

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getObjStreamNumber()I

    move-result v5

    if-eqz v5, :cond_1

    .line 547
    :cond_0
    const/4 v4, 0x0

    .line 550
    :cond_1
    if-nez v4, :cond_3

    .line 551
    if-lez v2, :cond_2

    .line 552
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 553
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 555
    :cond_2
    const/4 v2, 0x0

    goto :goto_1

    .line 557
    :cond_3
    if-lez v2, :cond_4

    .line 558
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 560
    :cond_4
    move v1, v3

    .line 561
    const/4 v2, 0x1

    .line 543
    .end local v4    # "reference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 565
    .end local v3    # "i":I
    :cond_5
    if-lez v2, :cond_6

    .line 566
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 567
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 570
    :cond_6
    return-object v0
.end method

.method private ensureCount(I)V
    .locals 1
    .param p1, "count"    # I

    .line 651
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->xref:[Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    array-length v0, v0

    if-lt p1, v0, :cond_0

    .line 652
    shl-int/lit8 v0, p1, 0x1

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->extendXref(I)V

    .line 654
    :cond_0
    return-void
.end method

.method private extendXref(I)V
    .locals 4
    .param p1, "capacity"    # I

    .line 657
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->memoryLimitsAwareHandler:Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;

    if-eqz v0, :cond_0

    .line 658
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->memoryLimitsAwareHandler:Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->checkIfXrefStructureExceedsTheLimit(I)V

    .line 660
    :cond_0
    new-array v0, p1, [Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 661
    .local v0, "newXref":[Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->xref:[Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->xref:[Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    array-length v2, v2

    const/4 v3, 0x0

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 662
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->xref:[Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 663
    return-void
.end method

.method private getOffsetSize(J)I
    .locals 7
    .param p1, "startxref"    # J

    .line 577
    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-ltz v2, :cond_2

    const-wide v2, 0x10000000000L

    cmp-long v2, p1, v2

    if-gez v2, :cond_2

    .line 579
    const/4 v2, 0x5

    .line 580
    .local v2, "size":I
    const-wide v3, 0xff00000000L

    .line 581
    .local v3, "mask":J
    :goto_0
    const/4 v5, 0x1

    if-le v2, v5, :cond_1

    .line 582
    and-long v5, v3, p1

    cmp-long v5, v5, v0

    if-eqz v5, :cond_0

    .line 583
    goto :goto_1

    .line 585
    :cond_0
    const/16 v5, 0x8

    shr-long/2addr v3, v5

    .line 581
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 587
    :cond_1
    :goto_1
    return v2

    .line 577
    .end local v2    # "size":I
    .end local v3    # "mask":J
    :cond_2
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method private removeFreeRefFromList(I)Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .locals 6
    .param p1, "freeRefObjNr"    # I

    .line 613
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->freeReferencesLinkedList:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_8

    .line 618
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 619
    return-object v0

    .line 621
    :cond_0
    if-gez p1, :cond_5

    .line 622
    const/4 v1, 0x0

    .line 623
    .local v1, "leastFreeRefObjNum":Ljava/lang/Integer;
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->freeReferencesLinkedList:Ljava/util/TreeMap;

    invoke-virtual {v2}, Ljava/util/TreeMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 624
    .local v3, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-lez v4, :cond_1

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->xref:[Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    aget-object v4, v4, v5

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getGenNumber()I

    move-result v4

    const v5, 0xffff

    if-lt v4, v5, :cond_2

    .line 625
    goto :goto_0

    .line 627
    :cond_2
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    move-object v1, v2

    check-cast v1, Ljava/lang/Integer;

    .line 628
    nop

    .line 630
    .end local v3    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    :cond_3
    if-nez v1, :cond_4

    .line 631
    return-object v0

    .line 633
    :cond_4
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 636
    .end local v1    # "leastFreeRefObjNum":Ljava/lang/Integer;
    :cond_5
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->xref:[Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    aget-object v1, v1, p1

    .line 637
    .local v1, "freeRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->isFree()Z

    move-result v2

    if-nez v2, :cond_6

    .line 638
    return-object v0

    .line 641
    :cond_6
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->freeReferencesLinkedList:Ljava/util/TreeMap;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getObjNumber()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/TreeMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 642
    .local v0, "prevFreeRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    if-eqz v0, :cond_7

    .line 643
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->freeReferencesLinkedList:Ljava/util/TreeMap;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getOffset()J

    move-result-wide v3

    long-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3, v0}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 644
    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getOffset()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setOffset(J)V

    .line 647
    :cond_7
    return-object v1

    .line 614
    .end local v0    # "prevFreeRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .end local v1    # "freeRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    :cond_8
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method protected static writeKeyInfo(Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 6
    .param p0, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 196
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getWriter()Lcom/itextpdf/kernel/pdf/PdfWriter;

    move-result-object v0

    .line 198
    .local v0, "writer":Lcom/itextpdf/kernel/pdf/PdfWriter;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getFingerPrint()Lcom/itextpdf/kernel/pdf/FingerPrint;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/FingerPrint;->getProducts()Ljava/util/Collection;

    move-result-object v1

    .line 199
    .local v1, "products":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/itextpdf/commons/actions/data/ProductData;>;"
    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 200
    nop

    .line 201
    invoke-static {}, Lcom/itextpdf/kernel/actions/data/ITextCoreProductData;->getInstance()Lcom/itextpdf/commons/actions/data/ProductData;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/commons/actions/data/ProductData;->getVersion()Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const-string v3, "%iText-{0}-no-registered-products\n"

    invoke-static {v3, v2}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 200
    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfWriter;->writeString(Ljava/lang/String;)Ljava/io/OutputStream;

    goto :goto_1

    .line 203
    :cond_0
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/commons/actions/data/ProductData;

    .line 204
    .local v3, "productData":Lcom/itextpdf/commons/actions/data/ProductData;
    nop

    .line 205
    invoke-virtual {v3}, Lcom/itextpdf/commons/actions/data/ProductData;->getPublicProductName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3}, Lcom/itextpdf/commons/actions/data/ProductData;->getVersion()Ljava/lang/String;

    move-result-object v5

    filled-new-array {v4, v5}, [Ljava/lang/Object;

    move-result-object v4

    const-string v5, "%iText-{0}-{1}\n"

    invoke-static {v5, v4}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 204
    invoke-virtual {v0, v4}, Lcom/itextpdf/kernel/pdf/PdfWriter;->writeString(Ljava/lang/String;)Ljava/io/OutputStream;

    .line 206
    .end local v3    # "productData":Lcom/itextpdf/commons/actions/data/ProductData;
    goto :goto_0

    .line 208
    :cond_1
    :goto_1
    return-void
.end method


# virtual methods
.method public add(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .locals 2
    .param p1, "reference"    # Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 139
    if-nez p1, :cond_0

    .line 140
    const/4 v0, 0x0

    return-object v0

    .line 142
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getObjNumber()I

    move-result v0

    .line 143
    .local v0, "objNr":I
    iget v1, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->count:I

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->count:I

    .line 144
    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->ensureCount(I)V

    .line 145
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->xref:[Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    aput-object p1, v1, v0

    .line 146
    return-object p1
.end method

.method clear()V
    .locals 3

    .line 520
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    iget v1, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->count:I

    if-gt v0, v1, :cond_1

    .line 521
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->xref:[Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    aget-object v1, v1, v0

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->xref:[Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->isFree()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 522
    goto :goto_1

    .line 524
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->xref:[Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    const/4 v2, 0x0

    aput-object v2, v1, v0

    .line 520
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 526
    .end local v0    # "i":I
    :cond_1
    const/4 v0, 0x1

    iput v0, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->count:I

    .line 527
    return-void
.end method

.method clearAllReferences()V
    .locals 3

    .line 533
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    iget v1, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->count:I

    if-gt v0, v1, :cond_0

    .line 534
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->xref:[Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    const/4 v2, 0x0

    aput-object v2, v1, v0

    .line 533
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 536
    .end local v0    # "i":I
    :cond_0
    const/4 v0, 0x1

    iput v0, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->count:I

    .line 537
    return-void
.end method

.method createNewIndirectReference(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .locals 2
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 511
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    iget v1, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->count:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->count:I

    invoke-direct {v0, p1, v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;I)V

    .line 512
    .local v0, "reference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->add(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 513
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    return-object v1
.end method

.method protected createNextIndirectReference(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .locals 2
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 217
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    iget v1, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->count:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->count:I

    invoke-direct {v0, p1, v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;I)V

    .line 218
    .local v0, "reference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->add(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 219
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    return-object v1
.end method

.method protected freeReference(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)V
    .locals 3
    .param p1, "reference"    # Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 228
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->isFree()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 229
    return-void

    .line 231
    :cond_0
    const/16 v0, 0x20

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->checkState(S)Z

    move-result v0

    const-class v1, Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    if-eqz v0, :cond_1

    .line 232
    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 233
    .local v0, "logger":Lorg/slf4j/Logger;
    const-string v1, "An attempt is made to free an indirect reference which was already used in the flushed object. Indirect reference wasn\'t freed."

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 234
    return-void

    .line 236
    .end local v0    # "logger":Lorg/slf4j/Logger;
    :cond_1
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->checkState(S)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 237
    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 238
    .restart local v0    # "logger":Lorg/slf4j/Logger;
    const-string v1, "An attempt is made to free already flushed indirect object reference. Indirect reference wasn\'t freed."

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 239
    return-void

    .line 242
    .end local v0    # "logger":Lorg/slf4j/Logger;
    :cond_2
    const/4 v1, 0x2

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfObject;->setState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 244
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->appendNewRefToFreeList(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)V

    .line 246
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getGenNumber()I

    move-result v1

    const v2, 0xffff

    if-ge v1, v2, :cond_3

    .line 247
    iget v1, p1, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->genNr:I

    add-int/2addr v1, v0

    iput v1, p1, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->genNr:I

    .line 250
    :cond_3
    return-void
.end method

.method public get(I)Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .locals 1
    .param p1, "index"    # I

    .line 182
    iget v0, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->count:I

    if-le p1, v0, :cond_0

    .line 183
    const/4 v0, 0x0

    return-object v0

    .line 185
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->xref:[Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    aget-object v0, v0, p1

    return-object v0
.end method

.method protected getCapacity()I
    .locals 1

    .line 258
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->xref:[Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    array-length v0, v0

    return v0
.end method

.method public getCountOfIndirectObjects()I
    .locals 6

    .line 164
    const/4 v0, 0x0

    .line 166
    .local v0, "countOfIndirectObjects":I
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->xref:[Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, v1, v3

    .line 167
    .local v4, "ref":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    if-eqz v4, :cond_0

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->isFree()Z

    move-result v5

    if-nez v5, :cond_0

    .line 168
    add-int/lit8 v0, v0, 0x1

    .line 166
    .end local v4    # "ref":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 172
    :cond_1
    return v0
.end method

.method initFreeReferencesList(Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 10
    .param p1, "pdfDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 454
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->freeReferencesLinkedList:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->clear()V

    .line 457
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->xref:[Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 458
    new-instance v0, Ljava/util/TreeSet;

    invoke-direct {v0}, Ljava/util/TreeSet;-><init>()V

    .line 459
    .local v0, "freeReferences":Ljava/util/TreeSet;, "Ljava/util/TreeSet<Ljava/lang/Integer;>;"
    const/4 v3, 0x1

    .local v3, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->size()I

    move-result v4

    if-ge v3, v4, :cond_2

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->xref:[Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    array-length v4, v4

    if-ge v3, v4, :cond_2

    .line 460
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->xref:[Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    aget-object v4, v4, v3

    .line 461
    .local v4, "ref":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    if-eqz v4, :cond_0

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->isFree()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 462
    :cond_0
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    .line 459
    .end local v4    # "ref":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 466
    .end local v3    # "i":I
    :cond_2
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->xref:[Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    aget-object v3, v3, v1

    .line 467
    .local v3, "prevFreeRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    :goto_1
    invoke-virtual {v0}, Ljava/util/TreeSet;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_5

    .line 468
    const/4 v4, -0x1

    .line 469
    .local v4, "currFreeRefObjNr":I
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getOffset()J

    move-result-wide v5

    const-wide/32 v7, 0x7fffffff

    cmp-long v5, v5, v7

    if-gtz v5, :cond_3

    .line 470
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getOffset()J

    move-result-wide v5

    long-to-int v4, v5

    .line 472
    :cond_3
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/TreeSet;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->xref:[Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    aget-object v5, v5, v4

    if-nez v5, :cond_4

    .line 473
    goto :goto_2

    .line 476
    :cond_4
    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->freeReferencesLinkedList:Ljava/util/TreeMap;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6, v3}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 477
    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->xref:[Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    aget-object v3, v5, v4

    .line 478
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/TreeSet;->remove(Ljava/lang/Object;)Z

    .line 479
    .end local v4    # "currFreeRefObjNr":I
    goto :goto_1

    .line 481
    :cond_5
    :goto_2
    invoke-virtual {v0}, Ljava/util/TreeSet;->isEmpty()Z

    move-result v4

    const/16 v5, 0x8

    const-wide/16 v6, 0x0

    if-nez v4, :cond_a

    .line 482
    invoke-virtual {v0}, Ljava/util/TreeSet;->pollFirst()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 483
    .local v4, "next":I
    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->xref:[Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    aget-object v8, v8, v4

    if-nez v8, :cond_7

    .line 484
    iget-object v6, p1, Lcom/itextpdf/kernel/pdf/PdfDocument;->properties:Lcom/itextpdf/kernel/pdf/StampingProperties;

    iget-boolean v6, v6, Lcom/itextpdf/kernel/pdf/StampingProperties;->appendMode:Z

    if-eqz v6, :cond_6

    .line 485
    goto :goto_2

    .line 487
    :cond_6
    iget-object v6, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->xref:[Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    new-instance v7, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-direct {v7, p1, v4, v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;II)V

    invoke-virtual {v7, v2}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v7

    invoke-virtual {v7, v5}, Lcom/itextpdf/kernel/pdf/PdfObject;->setState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    aput-object v7, v6, v4

    goto :goto_3

    .line 488
    :cond_7
    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->xref:[Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    aget-object v8, v8, v4

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getGenNumber()I

    move-result v8

    const v9, 0xffff

    if-ne v8, v9, :cond_8

    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->xref:[Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    aget-object v8, v8, v4

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getOffset()J

    move-result-wide v8

    cmp-long v6, v8, v6

    if-nez v6, :cond_8

    .line 489
    goto :goto_2

    .line 491
    :cond_8
    :goto_3
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getOffset()J

    move-result-wide v6

    int-to-long v8, v4

    cmp-long v6, v6, v8

    if-eqz v6, :cond_9

    .line 492
    invoke-virtual {v3, v5}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    int-to-long v6, v4

    invoke-virtual {v5, v6, v7}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setOffset(J)V

    .line 494
    :cond_9
    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->freeReferencesLinkedList:Ljava/util/TreeMap;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6, v3}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 495
    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->xref:[Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    aget-object v3, v5, v4

    .line 496
    .end local v4    # "next":I
    goto :goto_2

    .line 498
    :cond_a
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getOffset()J

    move-result-wide v8

    cmp-long v2, v8, v6

    if-eqz v2, :cond_b

    .line 499
    invoke-virtual {v3, v5}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v2, v6, v7}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setOffset(J)V

    .line 501
    :cond_b
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->freeReferencesLinkedList:Ljava/util/TreeMap;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v2, v1, v3}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 502
    return-void
.end method

.method isReadingCompleted()Z
    .locals 1

    .line 445
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->readingCompleted:Z

    return v0
.end method

.method markReadingCompleted()V
    .locals 1

    .line 428
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->readingCompleted:Z

    .line 429
    return-void
.end method

.method protected setCapacity(I)V
    .locals 1
    .param p1, "capacity"    # I

    .line 267
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->xref:[Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    array-length v0, v0

    if-le p1, v0, :cond_0

    .line 268
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->extendXref(I)V

    .line 270
    :cond_0
    return-void
.end method

.method public setMemoryLimitsAwareHandler(Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;)V
    .locals 0
    .param p1, "memoryLimitsAwareHandler"    # Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;

    .line 129
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->memoryLimitsAwareHandler:Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;

    .line 130
    return-void
.end method

.method public size()I
    .locals 1

    .line 155
    iget v0, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->count:I

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method unmarkReadingCompleted()V
    .locals 1

    .line 436
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->readingCompleted:Z

    .line 437
    return-void
.end method

.method protected writeXrefTableAndTrailer(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfObject;)V
    .locals 27
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "fileId"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p3, "crypto"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 281
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getWriter()Lcom/itextpdf/kernel/pdf/PdfWriter;

    move-result-object v4

    .line 283
    .local v4, "writer":Lcom/itextpdf/kernel/pdf/PdfWriter;
    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/PdfDocument;->properties:Lcom/itextpdf/kernel/pdf/StampingProperties;

    iget-boolean v5, v5, Lcom/itextpdf/kernel/pdf/StampingProperties;->appendMode:Z

    const/4 v6, 0x1

    if-nez v5, :cond_1

    .line 284
    iget v5, v0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->count:I

    .local v5, "i":I
    :goto_0
    if-lez v5, :cond_1

    .line 285
    iget-object v7, v0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->xref:[Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    aget-object v7, v7, v5

    .line 286
    .local v7, "lastRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    if-eqz v7, :cond_0

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->isFree()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 287
    :cond_0
    invoke-direct {v0, v5}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->removeFreeRefFromList(I)Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 288
    iget v8, v0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->count:I

    sub-int/2addr v8, v6

    iput v8, v0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->count:I

    .line 284
    .end local v7    # "lastRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    add-int/lit8 v5, v5, -0x1

    goto :goto_0

    .line 295
    .end local v5    # "i":I
    :cond_1
    const/4 v5, 0x0

    .line 296
    .local v5, "xrefStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfWriter;->isFullCompression()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 297
    new-instance v7, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-direct {v7}, Lcom/itextpdf/kernel/pdf/PdfStream;-><init>()V

    move-object v5, v7

    .line 298
    invoke-virtual {v5, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 300
    :cond_2
    const/4 v7, 0x0

    invoke-direct {v0, v1, v7}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->createSections(Lcom/itextpdf/kernel/pdf/PdfDocument;Z)Ljava/util/List;

    move-result-object v8

    .line 301
    .local v8, "sections":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v9

    const/4 v10, 0x2

    if-eqz v9, :cond_4

    if-eqz v5, :cond_3

    .line 302
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v9

    if-ne v9, v10, :cond_3

    invoke-interface {v8, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    iget v11, v0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->count:I

    if-ne v9, v11, :cond_3

    invoke-interface {v8, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    if-ne v9, v6, :cond_3

    goto :goto_1

    :cond_3
    move v9, v7

    goto :goto_2

    :cond_4
    :goto_1
    move v9, v6

    .line 303
    .local v9, "noModifiedObjects":Z
    :goto_2
    iget-object v11, v1, Lcom/itextpdf/kernel/pdf/PdfDocument;->properties:Lcom/itextpdf/kernel/pdf/StampingProperties;

    iget-boolean v11, v11, Lcom/itextpdf/kernel/pdf/StampingProperties;->appendMode:Z

    const/4 v12, 0x0

    if-eqz v11, :cond_5

    if-eqz v9, :cond_5

    .line 305
    iput-object v12, v0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->xref:[Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 306
    return-void

    .line 309
    :cond_5
    sget-object v11, Lcom/itextpdf/kernel/pdf/IsoKey;->XREF_TABLE:Lcom/itextpdf/kernel/pdf/IsoKey;

    invoke-virtual {v1, v0, v11}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkIsoConformance(Ljava/lang/Object;Lcom/itextpdf/kernel/pdf/IsoKey;)V

    .line 311
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfWriter;->getCurrentPos()J

    move-result-wide v13

    .line 312
    .local v13, "startxref":J
    const-wide/16 v15, -0x1

    .line 313
    .local v15, "xRefStmPos":J
    if-eqz v5, :cond_d

    .line 314
    sget-object v11, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v12, Lcom/itextpdf/kernel/pdf/PdfName;->XRef:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v5, v11, v12}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 315
    sget-object v11, Lcom/itextpdf/kernel/pdf/PdfName;->ID:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v5, v11, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 316
    if-eqz v3, :cond_6

    .line 317
    sget-object v11, Lcom/itextpdf/kernel/pdf/PdfName;->Encrypt:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v5, v11, v3}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 318
    :cond_6
    sget-object v11, Lcom/itextpdf/kernel/pdf/PdfName;->Size:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v12, Lcom/itextpdf/kernel/pdf/PdfNumber;

    move/from16 v17, v7

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->size()I

    move-result v7

    invoke-direct {v12, v7}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v5, v11, v12}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 320
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->size()I

    move-result v7

    int-to-long v11, v7

    invoke-static {v13, v14, v11, v12}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v11

    invoke-direct {v0, v11, v12}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->getOffsetSize(J)I

    move-result v7

    .line 321
    .local v7, "offsetSize":I
    sget-object v11, Lcom/itextpdf/kernel/pdf/PdfName;->W:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v12, Lcom/itextpdf/kernel/pdf/PdfArray;

    const/4 v10, 0x3

    new-array v10, v10, [Lcom/itextpdf/kernel/pdf/PdfObject;

    move/from16 v19, v9

    .end local v9    # "noModifiedObjects":Z
    .local v19, "noModifiedObjects":Z
    new-instance v9, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v9, v6}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    aput-object v9, v10, v17

    new-instance v9, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v9, v7}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    aput-object v9, v10, v6

    new-instance v9, Lcom/itextpdf/kernel/pdf/PdfNumber;

    const/4 v6, 0x2

    invoke-direct {v9, v6}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    aput-object v9, v10, v6

    .line 322
    invoke-static {v10}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    invoke-direct {v12, v6}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>(Ljava/util/List;)V

    .line 321
    invoke-virtual {v5, v11, v12}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 323
    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->Info:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getDocumentInfo()Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    move-result-object v9

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v9

    invoke-virtual {v5, v6, v9}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 324
    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->Root:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v9

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v9

    invoke-virtual {v5, v6, v9}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 325
    new-instance v6, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v6}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 326
    .local v6, "index":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_3
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_7

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    .line 327
    .local v10, "section":Ljava/lang/Integer;
    new-instance v11, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v12

    invoke-direct {v11, v12}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v6, v11}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 328
    .end local v10    # "section":Ljava/lang/Integer;
    goto :goto_3

    .line 329
    :cond_7
    iget-object v9, v1, Lcom/itextpdf/kernel/pdf/PdfDocument;->properties:Lcom/itextpdf/kernel/pdf/StampingProperties;

    iget-boolean v9, v9, Lcom/itextpdf/kernel/pdf/StampingProperties;->appendMode:Z

    if-eqz v9, :cond_8

    iget-object v9, v1, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    iget-boolean v9, v9, Lcom/itextpdf/kernel/pdf/PdfReader;->hybridXref:Z

    if-nez v9, :cond_8

    .line 331
    new-instance v9, Lcom/itextpdf/kernel/pdf/PdfNumber;

    iget-object v10, v1, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfReader;->getLastXref()J

    move-result-wide v10

    long-to-double v10, v10

    invoke-direct {v9, v10, v11}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    .line 332
    .local v9, "lastXref":Lcom/itextpdf/kernel/pdf/PdfNumber;
    sget-object v10, Lcom/itextpdf/kernel/pdf/PdfName;->Prev:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v5, v10, v9}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 334
    .end local v9    # "lastXref":Lcom/itextpdf/kernel/pdf/PdfNumber;
    :cond_8
    sget-object v9, Lcom/itextpdf/kernel/pdf/PdfName;->Index:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v5, v9, v6}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 335
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfStream;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v9

    invoke-virtual {v9, v13, v14}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setOffset(J)V

    .line 336
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getXref()Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    move-result-object v9

    .line 337
    .local v9, "xrefTable":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    const/4 v10, 0x0

    .local v10, "k":I
    :goto_4
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v11

    if-ge v10, v11, :cond_c

    .line 338
    invoke-interface {v8, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Integer;

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    .line 339
    .local v11, "first":I
    add-int/lit8 v12, v10, 0x1

    invoke-interface {v8, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Integer;

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v12

    .line 340
    .local v12, "len":I
    move/from16 v21, v11

    move-object/from16 v22, v5

    move/from16 v5, v21

    .local v5, "i":I
    .local v22, "xrefStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    :goto_5
    move-object/from16 v21, v6

    .end local v6    # "index":Lcom/itextpdf/kernel/pdf/PdfArray;
    .local v21, "index":Lcom/itextpdf/kernel/pdf/PdfArray;
    add-int v6, v11, v12

    if-ge v5, v6, :cond_b

    .line 341
    invoke-virtual {v9, v5}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->get(I)Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v6

    .line 342
    .local v6, "reference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->isFree()Z

    move-result v23

    if-eqz v23, :cond_9

    .line 343
    move/from16 v23, v5

    .end local v5    # "i":I
    .local v23, "i":I
    invoke-virtual/range {v22 .. v22}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v5

    move-object/from16 v24, v6

    move/from16 v6, v17

    .end local v6    # "reference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .local v24, "reference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(I)V

    .line 344
    invoke-virtual/range {v22 .. v22}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v5

    move-object/from16 v17, v8

    move-object/from16 v25, v9

    .end local v8    # "sections":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v9    # "xrefTable":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    .local v17, "sections":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v25, "xrefTable":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    invoke-virtual/range {v24 .. v24}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getOffset()J

    move-result-wide v8

    invoke-virtual {v5, v8, v9, v7}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(JI)V

    .line 345
    invoke-virtual/range {v22 .. v22}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v5

    invoke-virtual/range {v24 .. v24}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getGenNumber()I

    move-result v8

    const/4 v9, 0x2

    invoke-virtual {v5, v8, v9}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(II)V

    goto :goto_6

    .line 346
    .end local v17    # "sections":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v23    # "i":I
    .end local v24    # "reference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .end local v25    # "xrefTable":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    .restart local v5    # "i":I
    .restart local v6    # "reference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .restart local v8    # "sections":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local v9    # "xrefTable":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    :cond_9
    move/from16 v23, v5

    move-object/from16 v24, v6

    move-object/from16 v25, v9

    move/from16 v6, v17

    move-object/from16 v17, v8

    .end local v5    # "i":I
    .end local v6    # "reference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .end local v8    # "sections":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v9    # "xrefTable":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    .restart local v17    # "sections":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local v23    # "i":I
    .restart local v24    # "reference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .restart local v25    # "xrefTable":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    invoke-virtual/range {v24 .. v24}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getObjStreamNumber()I

    move-result v5

    if-nez v5, :cond_a

    .line 347
    invoke-virtual/range {v22 .. v22}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v5

    const/4 v8, 0x1

    invoke-virtual {v5, v8}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(I)V

    .line 348
    invoke-virtual/range {v22 .. v22}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v5

    invoke-virtual/range {v24 .. v24}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getOffset()J

    move-result-wide v8

    invoke-virtual {v5, v8, v9, v7}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(JI)V

    .line 349
    invoke-virtual/range {v22 .. v22}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v5

    invoke-virtual/range {v24 .. v24}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getGenNumber()I

    move-result v8

    const/4 v9, 0x2

    invoke-virtual {v5, v8, v9}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(II)V

    goto :goto_6

    .line 351
    :cond_a
    const/4 v9, 0x2

    invoke-virtual/range {v22 .. v22}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v5

    invoke-virtual {v5, v9}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(I)V

    .line 352
    invoke-virtual/range {v22 .. v22}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v5

    invoke-virtual/range {v24 .. v24}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getObjStreamNumber()I

    move-result v8

    invoke-virtual {v5, v8, v7}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(II)V

    .line 353
    invoke-virtual/range {v22 .. v22}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v5

    invoke-virtual/range {v24 .. v24}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getIndex()I

    move-result v8

    invoke-virtual {v5, v8, v9}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(II)V

    .line 340
    .end local v24    # "reference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    :goto_6
    add-int/lit8 v5, v23, 0x1

    move-object/from16 v8, v17

    move-object/from16 v9, v25

    move/from16 v17, v6

    move-object/from16 v6, v21

    .end local v23    # "i":I
    .restart local v5    # "i":I
    goto/16 :goto_5

    .end local v17    # "sections":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v25    # "xrefTable":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    .restart local v8    # "sections":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local v9    # "xrefTable":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    :cond_b
    move/from16 v23, v5

    move-object/from16 v25, v9

    move/from16 v6, v17

    const/4 v9, 0x2

    move-object/from16 v17, v8

    .line 337
    .end local v5    # "i":I
    .end local v8    # "sections":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v9    # "xrefTable":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    .end local v11    # "first":I
    .end local v12    # "len":I
    .restart local v17    # "sections":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local v25    # "xrefTable":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    add-int/lit8 v10, v10, 0x2

    move-object/from16 v5, v22

    move-object/from16 v9, v25

    move/from16 v17, v6

    move-object/from16 v6, v21

    goto/16 :goto_4

    .end local v17    # "sections":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v21    # "index":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v22    # "xrefStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    .end local v25    # "xrefTable":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    .local v5, "xrefStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    .local v6, "index":Lcom/itextpdf/kernel/pdf/PdfArray;
    .restart local v8    # "sections":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local v9    # "xrefTable":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    :cond_c
    move-object/from16 v22, v5

    move-object/from16 v21, v6

    move-object/from16 v25, v9

    move/from16 v6, v17

    move-object/from16 v17, v8

    .line 357
    .end local v5    # "xrefStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    .end local v6    # "index":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v8    # "sections":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v9    # "xrefTable":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    .end local v10    # "k":I
    .restart local v17    # "sections":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local v21    # "index":Lcom/itextpdf/kernel/pdf/PdfArray;
    .restart local v22    # "xrefStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    .restart local v25    # "xrefTable":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    invoke-virtual/range {v22 .. v22}, Lcom/itextpdf/kernel/pdf/PdfStream;->flush()V

    .line 358
    move-wide v15, v13

    move-wide v7, v15

    goto :goto_7

    .line 313
    .end local v7    # "offsetSize":I
    .end local v17    # "sections":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v19    # "noModifiedObjects":Z
    .end local v21    # "index":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v22    # "xrefStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    .end local v25    # "xrefTable":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    .restart local v5    # "xrefStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    .restart local v8    # "sections":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v9, "noModifiedObjects":Z
    :cond_d
    move-object/from16 v22, v5

    move v6, v7

    move-object/from16 v17, v8

    move/from16 v19, v9

    .end local v5    # "xrefStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    .end local v8    # "sections":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v9    # "noModifiedObjects":Z
    .restart local v17    # "sections":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local v19    # "noModifiedObjects":Z
    .restart local v22    # "xrefStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    move-wide v7, v15

    .line 364
    .end local v15    # "xRefStmPos":J
    .local v7, "xRefStmPos":J
    :goto_7
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfWriter;->isFullCompression()Z

    move-result v5

    if-eqz v5, :cond_e

    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/PdfDocument;->properties:Lcom/itextpdf/kernel/pdf/StampingProperties;

    iget-boolean v5, v5, Lcom/itextpdf/kernel/pdf/StampingProperties;->appendMode:Z

    if-eqz v5, :cond_f

    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    iget-boolean v5, v5, Lcom/itextpdf/kernel/pdf/PdfReader;->hybridXref:Z

    if-eqz v5, :cond_f

    :cond_e
    const/4 v6, 0x1

    .line 366
    .local v6, "needsRegularXref":Z
    :cond_f
    if-eqz v6, :cond_18

    .line 367
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfWriter;->getCurrentPos()J

    move-result-wide v13

    .line 368
    const-string/jumbo v5, "xref\n"

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfWriter;->writeString(Ljava/lang/String;)Ljava/io/OutputStream;

    .line 369
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getXref()Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    move-result-object v5

    .line 370
    .local v5, "xrefTable":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    const-wide/16 v9, -0x1

    cmp-long v11, v7, v9

    if-eqz v11, :cond_10

    .line 372
    const/4 v11, 0x1

    invoke-direct {v0, v1, v11}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->createSections(Lcom/itextpdf/kernel/pdf/PdfDocument;Z)Ljava/util/List;

    move-result-object v11

    .end local v17    # "sections":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v11, "sections":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    goto :goto_8

    .line 370
    .end local v11    # "sections":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local v17    # "sections":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :cond_10
    move-object/from16 v11, v17

    .line 374
    .end local v17    # "sections":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local v11    # "sections":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :goto_8
    const/4 v12, 0x0

    .local v12, "k":I
    :goto_9
    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v15

    move-wide/from16 v20, v9

    if-ge v12, v15, :cond_14

    .line 375
    invoke-interface {v11, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    .line 376
    .local v10, "first":I
    add-int/lit8 v15, v12, 0x1

    invoke-interface {v11, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/Integer;

    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    move-result v15

    .line 377
    .local v15, "len":I
    invoke-virtual {v4, v10}, Lcom/itextpdf/kernel/pdf/PdfWriter;->writeInteger(I)Ljava/io/OutputStream;

    move-result-object v16

    check-cast v16, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual/range {v16 .. v16}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v16

    move-object/from16 v9, v16

    check-cast v9, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v9, v15}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeInteger(I)Ljava/io/OutputStream;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move/from16 v16, v6

    const/16 v6, 0xa

    .end local v6    # "needsRegularXref":Z
    .local v16, "needsRegularXref":Z
    invoke-virtual {v9, v6}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeByte(B)V

    .line 378
    move v6, v10

    .local v6, "i":I
    :goto_a
    add-int v9, v10, v15

    if-ge v6, v9, :cond_13

    .line 379
    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->get(I)Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v9

    .line 380
    .local v9, "reference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getOffset()J

    move-result-wide v23

    const-wide v25, 0x2540be3ffL

    cmp-long v18, v23, v25

    if-gtz v18, :cond_12

    .line 383
    move-object/from16 v18, v5

    .end local v5    # "xrefTable":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    .local v18, "xrefTable":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    new-instance v5, Ljava/lang/StringBuilder;

    move/from16 v23, v6

    .end local v6    # "i":I
    .restart local v23    # "i":I
    const-string v6, "0000000000"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v24, v9

    move v6, v10

    .end local v9    # "reference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .end local v10    # "first":I
    .local v6, "first":I
    .restart local v24    # "reference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    invoke-virtual/range {v24 .. v24}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getOffset()J

    move-result-wide v9

    invoke-virtual {v5, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 384
    .local v5, "off":Ljava/lang/StringBuilder;
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "00000"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v24 .. v24}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getGenNumber()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 385
    .local v9, "gen":Ljava/lang/StringBuilder;
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    move-result v10

    const/16 v17, 0xa

    add-int/lit8 v10, v10, -0xa

    move/from16 v25, v6

    .end local v6    # "first":I
    .local v25, "first":I
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    invoke-virtual {v5, v10, v6}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Lcom/itextpdf/kernel/pdf/PdfWriter;->writeString(Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 386
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->length()I

    move-result v10

    add-int/lit8 v10, v10, -0x5

    move-object/from16 v26, v5

    .end local v5    # "off":Ljava/lang/StringBuilder;
    .local v26, "off":Ljava/lang/StringBuilder;
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    invoke-virtual {v9, v10, v5}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeString(Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    .line 387
    invoke-virtual/range {v24 .. v24}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->isFree()Z

    move-result v5

    if-eqz v5, :cond_11

    .line 388
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->freeXRefEntry:[B

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfWriter;->writeBytes([B)Ljava/io/OutputStream;

    goto :goto_b

    .line 390
    :cond_11
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->inUseXRefEntry:[B

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfWriter;->writeBytes([B)Ljava/io/OutputStream;

    .line 378
    .end local v9    # "gen":Ljava/lang/StringBuilder;
    .end local v24    # "reference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .end local v26    # "off":Ljava/lang/StringBuilder;
    :goto_b
    add-int/lit8 v6, v23, 0x1

    move-object/from16 v5, v18

    move/from16 v10, v25

    .end local v23    # "i":I
    .local v6, "i":I
    goto/16 :goto_a

    .line 381
    .end local v18    # "xrefTable":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    .end local v25    # "first":I
    .local v5, "xrefTable":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    .local v9, "reference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .restart local v10    # "first":I
    :cond_12
    move-object/from16 v18, v5

    move/from16 v23, v6

    .end local v5    # "xrefTable":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    .end local v6    # "i":I
    .restart local v18    # "xrefTable":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    .restart local v23    # "i":I
    new-instance v5, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v6, "Pdf document is to large to use normal cross reference table. Use cross reference streams instead. To enable feature use com.itextpdf.kernel.pdf.WriterProperties#setFullCompressionMode(true). "

    invoke-direct {v5, v6}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 378
    .end local v9    # "reference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .end local v18    # "xrefTable":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    .end local v23    # "i":I
    .restart local v5    # "xrefTable":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    .restart local v6    # "i":I
    :cond_13
    move-object/from16 v18, v5

    move/from16 v23, v6

    move/from16 v25, v10

    .line 374
    .end local v5    # "xrefTable":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    .end local v6    # "i":I
    .end local v10    # "first":I
    .end local v15    # "len":I
    .restart local v18    # "xrefTable":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    add-int/lit8 v12, v12, 0x2

    move/from16 v6, v16

    move-wide/from16 v9, v20

    goto/16 :goto_9

    .end local v16    # "needsRegularXref":Z
    .end local v18    # "xrefTable":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    .restart local v5    # "xrefTable":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    .local v6, "needsRegularXref":Z
    :cond_14
    move-object/from16 v18, v5

    move/from16 v16, v6

    .line 394
    .end local v5    # "xrefTable":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    .end local v6    # "needsRegularXref":Z
    .end local v12    # "k":I
    .restart local v16    # "needsRegularXref":Z
    .restart local v18    # "xrefTable":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getTrailer()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v5

    .line 396
    .local v5, "trailer":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->W:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 397
    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->Index:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 398
    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 399
    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->Length:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 400
    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->Size:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v9, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->size()I

    move-result v10

    invoke-direct {v9, v10}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v5, v6, v9}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 401
    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->ID:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v5, v6, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 402
    cmp-long v6, v7, v20

    if-eqz v6, :cond_15

    .line 403
    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->XRefStm:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v9, Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-object v12, v11

    .end local v11    # "sections":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v12, "sections":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    long-to-double v10, v7

    invoke-direct {v9, v10, v11}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {v5, v6, v9}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_c

    .line 402
    .end local v12    # "sections":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local v11    # "sections":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :cond_15
    move-object v12, v11

    .line 405
    .end local v11    # "sections":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local v12    # "sections":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :goto_c
    if-eqz v3, :cond_16

    .line 406
    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->Encrypt:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v5, v6, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 407
    :cond_16
    const-string/jumbo v6, "trailer\n"

    invoke-virtual {v4, v6}, Lcom/itextpdf/kernel/pdf/PdfWriter;->writeString(Ljava/lang/String;)Ljava/io/OutputStream;

    .line 408
    iget-object v6, v1, Lcom/itextpdf/kernel/pdf/PdfDocument;->properties:Lcom/itextpdf/kernel/pdf/StampingProperties;

    iget-boolean v6, v6, Lcom/itextpdf/kernel/pdf/StampingProperties;->appendMode:Z

    if-eqz v6, :cond_17

    .line 409
    new-instance v6, Lcom/itextpdf/kernel/pdf/PdfNumber;

    iget-object v9, v1, Lcom/itextpdf/kernel/pdf/PdfDocument;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/PdfReader;->getLastXref()J

    move-result-wide v9

    long-to-double v9, v9

    invoke-direct {v6, v9, v10}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    .line 410
    .local v6, "lastXref":Lcom/itextpdf/kernel/pdf/PdfNumber;
    sget-object v9, Lcom/itextpdf/kernel/pdf/PdfName;->Prev:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v5, v9, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 412
    .end local v6    # "lastXref":Lcom/itextpdf/kernel/pdf/PdfNumber;
    :cond_17
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getTrailer()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v6

    invoke-virtual {v4, v6}, Lcom/itextpdf/kernel/pdf/PdfWriter;->write(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 413
    const/16 v6, 0xa

    invoke-virtual {v4, v6}, Lcom/itextpdf/kernel/pdf/PdfWriter;->write(I)V

    goto :goto_d

    .line 366
    .end local v5    # "trailer":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v12    # "sections":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v16    # "needsRegularXref":Z
    .end local v18    # "xrefTable":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    .local v6, "needsRegularXref":Z
    .restart local v17    # "sections":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :cond_18
    move/from16 v16, v6

    .end local v6    # "needsRegularXref":Z
    .restart local v16    # "needsRegularXref":Z
    move-object/from16 v12, v17

    .line 415
    .end local v17    # "sections":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local v12    # "sections":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :goto_d
    invoke-static {v1}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->writeKeyInfo(Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 416
    const-string/jumbo v5, "startxref\n"

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfWriter;->writeString(Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 417
    invoke-virtual {v5, v13, v14}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeLong(J)Ljava/io/OutputStream;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 418
    const-string v6, "\n%%EOF\n"

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeString(Ljava/lang/String;)Ljava/io/OutputStream;

    .line 419
    const/4 v5, 0x0

    iput-object v5, v0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->xref:[Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 420
    iget-object v5, v0, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->freeReferencesLinkedList:Ljava/util/TreeMap;

    invoke-virtual {v5}, Ljava/util/TreeMap;->clear()V

    .line 421
    return-void
.end method
