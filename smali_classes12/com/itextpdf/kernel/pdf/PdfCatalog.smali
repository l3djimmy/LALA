.class public Lcom/itextpdf/kernel/pdf/PdfCatalog;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfCatalog.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
        "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
        ">;"
    }
.end annotation


# static fields
.field private static final LOGGER:Lorg/slf4j/Logger;

.field private static final PAGE_LAYOUTS:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            ">;"
        }
    .end annotation
.end field

.field private static final PAGE_MODES:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            ">;"
        }
    .end annotation
.end field

.field private static final ROOT_OUTLINE_TITLE:Ljava/lang/String; = "Outlines"


# instance fields
.field protected nameTrees:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            "Lcom/itextpdf/kernel/pdf/PdfNameTree;",
            ">;"
        }
    .end annotation
.end field

.field protected ocProperties:Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;

.field private ocgCopied:Z

.field private outlineMode:Z

.field private outlines:Lcom/itextpdf/kernel/pdf/PdfOutline;

.field protected pageLabels:Lcom/itextpdf/kernel/pdf/PdfNumTree;

.field private final pageTree:Lcom/itextpdf/kernel/pdf/PdfPagesTree;

.field private final pagesWithOutlines:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfOutline;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 55
    const-class v0, Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->LOGGER:Lorg/slf4j/Logger;

    .line 57
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x6

    new-array v2, v1, [Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->UseNone:Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->UseOutlines:Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v5, 0x1

    aput-object v3, v2, v5

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->UseThumbs:Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v6, 0x2

    aput-object v3, v2, v6

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->FullScreen:Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v7, 0x3

    aput-object v3, v2, v7

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->UseOC:Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v8, 0x4

    aput-object v3, v2, v8

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->UseAttachments:Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v9, 0x5

    aput-object v3, v2, v9

    .line 58
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 57
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->PAGE_MODES:Ljava/util/Set;

    .line 60
    new-instance v0, Ljava/util/HashSet;

    new-array v1, v1, [Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->SinglePage:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v2, v1, v4

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->OneColumn:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v2, v1, v5

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->TwoColumnLeft:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v2, v1, v6

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->TwoColumnRight:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v2, v1, v7

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->TwoPageLeft:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v2, v1, v8

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->TwoPageRight:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v2, v1, v9

    .line 61
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 60
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->PAGE_LAYOUTS:Ljava/util/Set;

    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 3
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 92
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 67
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->nameTrees:Ljava/util/Map;

    .line 78
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->pagesWithOutlines:Ljava/util/Map;

    .line 83
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->ocgCopied:Z

    .line 93
    if-eqz p1, :cond_0

    .line 96
    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->ensureObjectIsAddedToDocument(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 97
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Catalog:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 98
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->setForbidRelease()V

    .line 99
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfPagesTree;

    invoke-direct {v0, p0}, Lcom/itextpdf/kernel/pdf/PdfPagesTree;-><init>(Lcom/itextpdf/kernel/pdf/PdfCatalog;)V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->pageTree:Lcom/itextpdf/kernel/pdf/PdfPagesTree;

    .line 100
    return-void

    .line 94
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Document has no PDF Catalog object."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 1
    .param p1, "pdfDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 109
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 110
    return-void
.end method

.method private addOutlineToPage(Lcom/itextpdf/kernel/pdf/PdfOutline;Lcom/itextpdf/kernel/pdf/IPdfNameTreeAccess;)V
    .locals 6
    .param p1, "outline"    # Lcom/itextpdf/kernel/pdf/PdfOutline;
    .param p2, "names"    # Lcom/itextpdf/kernel/pdf/IPdfNameTreeAccess;

    .line 754
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfOutline;->getDestination()Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;->getDestinationPage(Lcom/itextpdf/kernel/pdf/IPdfNameTreeAccess;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 755
    .local v0, "pageObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    instance-of v1, v0, Lcom/itextpdf/kernel/pdf/PdfNumber;

    if-eqz v1, :cond_0

    .line 756
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    .line 758
    .local v1, "pageNumber":I
    :try_start_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPage(I)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v2

    .line 764
    goto :goto_0

    .line 759
    :catch_0
    move-exception v2

    .line 760
    .local v2, "ex":Ljava/lang/IndexOutOfBoundsException;
    const/4 v0, 0x0

    .line 761
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfCatalog;->LOGGER:Lorg/slf4j/Logger;

    .line 762
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    .line 761
    const-string v5, "Outline destination page number {0} is out of bounds"

    invoke-static {v5, v4}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 767
    .end local v1    # "pageNumber":I
    .end local v2    # "ex":Ljava/lang/IndexOutOfBoundsException;
    :cond_0
    :goto_0
    if-eqz v0, :cond_2

    .line 768
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->pagesWithOutlines:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 769
    .local v1, "outs":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfOutline;>;"
    if-nez v1, :cond_1

    .line 770
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    move-object v1, v2

    .line 771
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->pagesWithOutlines:Ljava/util/Map;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 773
    :cond_1
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 775
    .end local v1    # "outs":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfOutline;>;"
    :cond_2
    return-void
.end method

.method private addOutlineToPage(Lcom/itextpdf/kernel/pdf/PdfOutline;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/IPdfNameTreeAccess;)V
    .locals 5
    .param p1, "outline"    # Lcom/itextpdf/kernel/pdf/PdfOutline;
    .param p2, "item"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p3, "names"    # Lcom/itextpdf/kernel/pdf/IPdfNameTreeAccess;

    .line 778
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Dest:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p2, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 779
    .local v0, "dest":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v0, :cond_0

    .line 780
    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;->makeDestination(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;

    move-result-object v1

    .line 781
    .local v1, "destination":Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;
    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfOutline;->setDestination(Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;)V

    .line 782
    invoke-direct {p0, p1, p3}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->addOutlineToPage(Lcom/itextpdf/kernel/pdf/PdfOutline;Lcom/itextpdf/kernel/pdf/IPdfNameTreeAccess;)V

    .line 783
    .end local v1    # "destination":Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;
    goto :goto_0

    .line 785
    :cond_0
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->A:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p2, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    .line 786
    .local v1, "action":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v1, :cond_1

    .line 787
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v2

    .line 789
    .local v2, "actionType":Lcom/itextpdf/kernel/pdf/PdfName;
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->GoTo:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 791
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    .line 792
    .local v3, "destObject":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v3, :cond_1

    .line 794
    invoke-static {v3}, Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;->makeDestination(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;

    move-result-object v4

    .line 795
    .local v4, "destination":Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;
    invoke-virtual {p1, v4}, Lcom/itextpdf/kernel/pdf/PdfOutline;->setDestination(Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;)V

    .line 796
    invoke-direct {p0, p1, p3}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->addOutlineToPage(Lcom/itextpdf/kernel/pdf/PdfOutline;Lcom/itextpdf/kernel/pdf/IPdfNameTreeAccess;)V

    .line 801
    .end local v1    # "action":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v2    # "actionType":Lcom/itextpdf/kernel/pdf/PdfName;
    .end local v3    # "destObject":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local v4    # "destination":Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;
    :cond_1
    :goto_0
    return-void
.end method

.method private isEqualSameNameDestExist(Ljava/util/Map;Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/PdfPage;)Z
    .locals 9
    .param p2, "toDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p3, "srcDestName"    # Lcom/itextpdf/kernel/pdf/PdfString;
    .param p4, "srcDestArray"    # Lcom/itextpdf/kernel/pdf/PdfArray;
    .param p5, "oldPage"    # Lcom/itextpdf/kernel/pdf/PdfPage;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfPage;",
            "Lcom/itextpdf/kernel/pdf/PdfPage;",
            ">;",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            "Lcom/itextpdf/kernel/pdf/PdfString;",
            "Lcom/itextpdf/kernel/pdf/PdfArray;",
            "Lcom/itextpdf/kernel/pdf/PdfPage;",
            ")Z"
        }
    .end annotation

    .line 736
    .local p1, "page2page":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Dests:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getNameTree(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNameTree;

    move-result-object v0

    .line 737
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNameTree;->getNames()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 738
    .local v0, "sameNameDest":Lcom/itextpdf/kernel/pdf/PdfArray;
    const/4 v1, 0x0

    .line 739
    .local v1, "equalSameNameDestExists":Z
    if-eqz v0, :cond_2

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsDictionary(I)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 740
    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsDictionary(I)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v3

    .line 741
    .local v3, "existingDestPageRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    invoke-interface {p1, p5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfPage;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v4

    .line 742
    .local v4, "newDestPageRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->equals(Ljava/lang/Object;)Z

    move-result v5

    const/4 v6, 0x1

    if-eqz v5, :cond_0

    .line 743
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v5

    invoke-virtual {p4}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v7

    if-ne v5, v7, :cond_0

    move v5, v6

    goto :goto_0

    :cond_0
    move v5, v2

    :goto_0
    move v1, v5

    if-eqz v5, :cond_2

    .line 744
    const/4 v5, 0x1

    .local v5, "i":I
    :goto_1
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v7

    if-ge v5, v7, :cond_2

    .line 745
    if-eqz v1, :cond_1

    .line 746
    invoke-virtual {v0, v5}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v7

    invoke-virtual {p4, v5}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    move v7, v6

    goto :goto_2

    :cond_1
    move v7, v2

    :goto_2
    move v1, v7

    .line 744
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 750
    .end local v3    # "existingDestPageRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .end local v4    # "newDestPageRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .end local v5    # "i":I
    :cond_2
    return v1
.end method


# virtual methods
.method public addDeveloperExtension(Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;)V
    .locals 6
    .param p1, "extension"    # Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;

    .line 358
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Extensions:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 360
    .local v0, "extensions":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-nez v0, :cond_0

    .line 361
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    move-object v0, v1

    .line 362
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Extensions:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfCatalog;

    .line 365
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;->isMultiValued()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 368
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;->getPrefix()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v1

    .line 369
    .local v1, "existingExtensionArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-nez v1, :cond_1

    .line 370
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    move-object v1, v2

    .line 371
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;->getPrefix()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v2

    invoke-virtual {v0, v2, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_1

    .line 373
    :cond_1
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v3

    if-ge v2, v3, :cond_3

    .line 374
    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsDictionary(I)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v3

    .line 376
    .local v3, "pdfDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->ExtensionLevel:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v4

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;->getExtensionLevel()I

    move-result v5

    if-ne v4, v5, :cond_2

    .line 377
    return-void

    .line 373
    .end local v3    # "pdfDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 381
    .end local v2    # "i":I
    :cond_3
    :goto_1
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;->getDeveloperExtensions()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 382
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->setModified()Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 383
    .end local v1    # "existingExtensionArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    goto :goto_2

    .line 385
    :cond_4
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;->getPrefix()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    .line 386
    .local v1, "existingExtensionDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v1, :cond_6

    .line 387
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;->getBaseVersion()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v2

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->BaseVersion:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfName;->compareTo(Lcom/itextpdf/kernel/pdf/PdfName;)I

    move-result v2

    .line 388
    .local v2, "diff":I
    if-gez v2, :cond_5

    .line 389
    return-void

    .line 390
    :cond_5
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;->getExtensionLevel()I

    move-result v3

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->ExtensionLevel:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 391
    invoke-virtual {v1, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v4

    sub-int/2addr v3, v4

    .line 392
    .end local v2    # "diff":I
    .local v3, "diff":I
    if-gtz v3, :cond_6

    .line 393
    return-void

    .line 395
    .end local v3    # "diff":I
    :cond_6
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;->getPrefix()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v2

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDeveloperExtension;->getDeveloperExtensions()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 397
    .end local v1    # "existingExtensionDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :goto_2
    return-void
.end method

.method addNameToNameTree(Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfName;)V
    .locals 1
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfString;
    .param p2, "value"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p3, "treeType"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 498
    invoke-virtual {p0, p3}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getNameTree(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNameTree;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfNameTree;->addEntry(Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 499
    return-void
.end method

.method addNamedDestination(Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfObject;)V
    .locals 1
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfString;
    .param p2, "value"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 487
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Dests:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, p1, p2, v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->addNameToNameTree(Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfName;)V

    .line 488
    return-void
.end method

.method addRootOutline(Lcom/itextpdf/kernel/pdf/PdfOutline;)V
    .locals 2
    .param p1, "outline"    # Lcom/itextpdf/kernel/pdf/PdfOutline;

    .line 580
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->outlineMode:Z

    if-nez v0, :cond_0

    .line 581
    return-void

    .line 583
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->pagesWithOutlines:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-nez v0, :cond_1

    .line 584
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Outlines:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfOutline;->getContent()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfCatalog;

    .line 586
    :cond_1
    return-void
.end method

.method constructOutlines(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/IPdfNameTreeAccess;)V
    .locals 17
    .param p1, "outlineRoot"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "names"    # Lcom/itextpdf/kernel/pdf/IPdfNameTreeAccess;

    .line 597
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    if-nez v1, :cond_0

    .line 598
    return-void

    .line 601
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getReader()Lcom/itextpdf/kernel/pdf/PdfReader;

    move-result-object v2

    .line 602
    .local v2, "reader":Lcom/itextpdf/kernel/pdf/PdfReader;
    if-eqz v2, :cond_2

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;->CONSERVATIVE:Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;

    .line 603
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfReader;->getStrictnessLevel()Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;->isStricter(Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 v3, 0x1

    .line 604
    .local v3, "isLenientLevel":Z
    :goto_1
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->First:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v4

    .line 606
    .local v4, "current":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    new-instance v5, Lcom/itextpdf/kernel/pdf/PdfOutline;

    const-string v6, "Outlines"

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v7

    invoke-direct {v5, v6, v1, v7}, Lcom/itextpdf/kernel/pdf/PdfOutline;-><init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    iput-object v5, v0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->outlines:Lcom/itextpdf/kernel/pdf/PdfOutline;

    .line 607
    iget-object v5, v0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->outlines:Lcom/itextpdf/kernel/pdf/PdfOutline;

    .line 609
    .local v5, "parentOutline":Lcom/itextpdf/kernel/pdf/PdfOutline;
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 610
    .local v6, "nextUnprocessedChildForParentMap":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfOutline;Lcom/itextpdf/kernel/pdf/PdfDictionary;>;"
    new-instance v7, Ljava/util/HashSet;

    invoke-direct {v7}, Ljava/util/HashSet;-><init>()V

    .line 612
    .local v7, "alreadyVisitedOutlinesSet":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfDictionary;>;"
    :goto_2
    if-eqz v4, :cond_e

    .line 613
    sget-object v8, Lcom/itextpdf/kernel/pdf/PdfName;->Parent:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4, v8}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v8

    .line 614
    .local v8, "parent":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-nez v8, :cond_4

    if-eqz v3, :cond_3

    goto :goto_3

    .line 615
    :cond_3
    new-instance v9, Lcom/itextpdf/kernel/exceptions/PdfException;

    iget-object v10, v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;->indirectReference:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    filled-new-array {v10}, [Ljava/lang/Object;

    move-result-object v10

    .line 616
    const-string v11, "Document outline is corrupted: some outline (PDF object: \"{0}\") lacks the required parent entry."

    invoke-static {v11, v10}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 620
    :cond_4
    :goto_3
    sget-object v9, Lcom/itextpdf/kernel/pdf/PdfName;->Title:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4, v9}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v9

    .line 621
    .local v9, "title":Lcom/itextpdf/kernel/pdf/PdfString;
    if-eqz v9, :cond_d

    .line 627
    new-instance v10, Lcom/itextpdf/kernel/pdf/PdfOutline;

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/PdfString;->toUnicodeString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11, v4, v5}, Lcom/itextpdf/kernel/pdf/PdfOutline;-><init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfOutline;)V

    .line 628
    .local v10, "currentOutline":Lcom/itextpdf/kernel/pdf/PdfOutline;
    invoke-interface {v7, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 629
    move-object/from16 v11, p2

    invoke-direct {v0, v10, v4, v11}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->addOutlineToPage(Lcom/itextpdf/kernel/pdf/PdfOutline;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/IPdfNameTreeAccess;)V

    .line 630
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfOutline;->getAllChildren()Ljava/util/List;

    move-result-object v12

    invoke-interface {v12, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 632
    sget-object v12, Lcom/itextpdf/kernel/pdf/PdfName;->First:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4, v12}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v12

    .line 633
    .local v12, "first":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v13, Lcom/itextpdf/kernel/pdf/PdfName;->Next:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4, v13}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v13

    .line 634
    .local v13, "next":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    const-string v14, "Document outline dictionary is corrupted: some outline (PDF object: \"{0}\") has wrong first/next link entry."

    const-string v15, "Document outline dictionary is corrupted: some outline (PDF object: \"{0}\") has wrong first/next link entry. Next outlines in this dictionary will be unprocessed."

    if-eqz v12, :cond_7

    .line 635
    invoke-interface {v7, v12}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_6

    .line 636
    if-eqz v3, :cond_5

    .line 640
    sget-object v14, Lcom/itextpdf/kernel/pdf/PdfCatalog;->LOGGER:Lorg/slf4j/Logger;

    filled-new-array {v12}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {v15, v0}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v14, v0}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 642
    return-void

    .line 637
    :cond_5
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    filled-new-array {v12}, [Ljava/lang/Object;

    move-result-object v15

    invoke-static {v14, v15}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v0, v14}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 645
    :cond_6
    invoke-interface {v6, v5, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 646
    move-object v0, v10

    .line 647
    .end local v5    # "parentOutline":Lcom/itextpdf/kernel/pdf/PdfOutline;
    .local v0, "parentOutline":Lcom/itextpdf/kernel/pdf/PdfOutline;
    move-object v4, v12

    move-object v5, v0

    goto :goto_5

    .line 648
    .end local v0    # "parentOutline":Lcom/itextpdf/kernel/pdf/PdfOutline;
    .restart local v5    # "parentOutline":Lcom/itextpdf/kernel/pdf/PdfOutline;
    :cond_7
    if-eqz v13, :cond_a

    .line 649
    invoke-interface {v7, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 650
    if-eqz v3, :cond_8

    .line 654
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->LOGGER:Lorg/slf4j/Logger;

    filled-new-array {v13}, [Ljava/lang/Object;

    move-result-object v14

    invoke-static {v15, v14}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-interface {v0, v14}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 656
    return-void

    .line 651
    :cond_8
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    filled-new-array {v13}, [Ljava/lang/Object;

    move-result-object v15

    invoke-static {v14, v15}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v0, v14}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 659
    :cond_9
    move-object v0, v13

    move-object v4, v0

    .end local v4    # "current":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .local v0, "current":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    goto :goto_5

    .line 662
    .end local v0    # "current":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .restart local v4    # "current":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_a
    const/4 v0, 0x0

    .line 663
    .end local v4    # "current":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .restart local v0    # "current":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_b
    :goto_4
    if-nez v0, :cond_c

    if-eqz v5, :cond_c

    .line 664
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfOutline;->getParent()Lcom/itextpdf/kernel/pdf/PdfOutline;

    move-result-object v5

    .line 665
    if-eqz v5, :cond_b

    .line 666
    invoke-interface {v6, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    goto :goto_4

    .line 670
    .end local v8    # "parent":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v9    # "title":Lcom/itextpdf/kernel/pdf/PdfString;
    .end local v10    # "currentOutline":Lcom/itextpdf/kernel/pdf/PdfOutline;
    .end local v12    # "first":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v13    # "next":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_c
    move-object v4, v0

    .end local v0    # "current":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .restart local v4    # "current":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :goto_5
    move-object/from16 v0, p0

    goto/16 :goto_2

    .line 622
    .restart local v8    # "parent":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .restart local v9    # "title":Lcom/itextpdf/kernel/pdf/PdfString;
    :cond_d
    move-object/from16 v11, p2

    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    iget-object v10, v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;->indirectReference:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    filled-new-array {v10}, [Ljava/lang/Object;

    move-result-object v10

    .line 623
    const-string v12, "Document outline is corrupted: some outline (PDF object: \"{0}\") lacks the required title entry."

    invoke-static {v12, v10}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v0, v10}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 671
    .end local v8    # "parent":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v9    # "title":Lcom/itextpdf/kernel/pdf/PdfString;
    :cond_e
    move-object/from16 v11, p2

    return-void
.end method

.method copyDestination(Lcom/itextpdf/kernel/pdf/PdfObject;Ljava/util/Map;Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;
    .locals 11
    .param p1, "dest"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p3, "toDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfPage;",
            "Lcom/itextpdf/kernel/pdf/PdfPage;",
            ">;",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            ")",
            "Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;"
        }
    .end annotation

    .line 674
    .local p2, "page2page":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    if-nez p1, :cond_0

    .line 675
    const/4 v0, 0x0

    return-object v0

    .line 677
    :cond_0
    const/4 v0, 0x0

    .line 678
    .local v0, "d":Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isArray()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    .line 679
    move-object v1, p1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 680
    .local v1, "pageObject":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-interface {p2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 681
    .local v4, "oldPage":Lcom/itextpdf/kernel/pdf/PdfPage;
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v5

    if-ne v5, v1, :cond_1

    .line 684
    nop

    .line 685
    invoke-static {}, Lcom/itextpdf/kernel/utils/NullCopyFilter;->getInstance()Lcom/itextpdf/kernel/utils/NullCopyFilter;

    move-result-object v3

    .line 684
    invoke-virtual {p1, p3, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfObject;->copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;ZLcom/itextpdf/kernel/utils/ICopyFilter;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 686
    .local v2, "copiedArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    new-instance v3, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;

    invoke-direct {v3, v2}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;-><init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    move-object v0, v3

    .line 687
    goto :goto_1

    .line 689
    .end local v2    # "copiedArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v4    # "oldPage":Lcom/itextpdf/kernel/pdf/PdfPage;
    :cond_1
    goto :goto_0

    .line 690
    .end local v1    # "pageObject":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_2
    :goto_1
    move-object v6, p2

    move-object v7, p3

    goto/16 :goto_4

    :cond_3
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isString()Z

    move-result v1

    if-nez v1, :cond_4

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isName()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 691
    :cond_4
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Dests:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getNameTree(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNameTree;

    move-result-object v1

    .line 692
    .local v1, "destsTree":Lcom/itextpdf/kernel/pdf/PdfNameTree;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfNameTree;->getNames()Ljava/util/Map;

    move-result-object v3

    .line 693
    .local v3, "dests":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isString()Z

    move-result v4

    if-eqz v4, :cond_5

    move-object v4, p1

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfString;

    goto :goto_2

    :cond_5
    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfString;

    move-object v5, p1

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    :goto_2
    move-object v8, v4

    .line 694
    .local v8, "srcDestName":Lcom/itextpdf/kernel/pdf/PdfString;
    invoke-interface {v3, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v9, v4

    check-cast v9, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 695
    .local v9, "srcDestArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-eqz v9, :cond_9

    .line 696
    invoke-virtual {v9, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    .line 697
    .local v4, "pageObject":Lcom/itextpdf/kernel/pdf/PdfObject;
    instance-of v5, v4, Lcom/itextpdf/kernel/pdf/PdfNumber;

    if-eqz v5, :cond_6

    .line 698
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v5

    move-object v6, v4

    check-cast v6, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v6

    add-int/lit8 v6, v6, 0x1

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPage(I)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    .line 699
    :cond_6
    invoke-interface {p2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_8

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    move-object v10, v6

    check-cast v10, Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 700
    .local v10, "oldPage":Lcom/itextpdf/kernel/pdf/PdfPage;
    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v6

    if-ne v6, v4, :cond_7

    .line 701
    new-instance v5, Lcom/itextpdf/kernel/pdf/navigation/PdfStringDestination;

    invoke-direct {v5, v8}, Lcom/itextpdf/kernel/pdf/navigation/PdfStringDestination;-><init>(Lcom/itextpdf/kernel/pdf/PdfString;)V

    move-object v0, v5

    .line 702
    move-object v5, p0

    move-object v6, p2

    move-object v7, p3

    .end local p2    # "page2page":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    .end local p3    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .local v6, "page2page":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    .local v7, "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    invoke-direct/range {v5 .. v10}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->isEqualSameNameDestExist(Ljava/util/Map;Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/PdfPage;)Z

    move-result p2

    if-nez p2, :cond_a

    .line 705
    invoke-virtual {v9, v7, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object p2

    check-cast p2, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 709
    .local p2, "copiedArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-interface {v6, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/itextpdf/kernel/pdf/PdfPage;

    invoke-virtual {p3}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object p3

    invoke-virtual {p2, v2, p3}, Lcom/itextpdf/kernel/pdf/PdfArray;->set(ILcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 710
    invoke-virtual {v7, v8, p2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->addNamedDestination(Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 711
    .end local p2    # "copiedArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    goto :goto_4

    .line 700
    .end local v6    # "page2page":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    .end local v7    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .local p2, "page2page":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    .restart local p3    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    :cond_7
    move-object v6, p2

    move-object v7, p3

    .line 714
    .end local v10    # "oldPage":Lcom/itextpdf/kernel/pdf/PdfPage;
    .end local p2    # "page2page":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    .end local p3    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v6    # "page2page":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    .restart local v7    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    goto :goto_3

    .line 699
    .end local v6    # "page2page":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    .end local v7    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local p2    # "page2page":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    .restart local p3    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    :cond_8
    move-object v6, p2

    move-object v7, p3

    .end local p2    # "page2page":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    .end local p3    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v6    # "page2page":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    .restart local v7    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    goto :goto_4

    .line 695
    .end local v4    # "pageObject":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local v6    # "page2page":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    .end local v7    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local p2    # "page2page":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    .restart local p3    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    :cond_9
    move-object v6, p2

    move-object v7, p3

    .line 717
    .end local v1    # "destsTree":Lcom/itextpdf/kernel/pdf/PdfNameTree;
    .end local v3    # "dests":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    .end local v8    # "srcDestName":Lcom/itextpdf/kernel/pdf/PdfString;
    .end local v9    # "srcDestArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local p2    # "page2page":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    .end local p3    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v6    # "page2page":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    .restart local v7    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    :cond_a
    :goto_4
    return-object v0
.end method

.method fillAndGetOcPropertiesDictionary()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 3

    .line 721
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->ocProperties:Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;

    if-eqz v0, :cond_0

    .line 722
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->ocProperties:Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->fillDictionary(Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 723
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->OCProperties:Lcom/itextpdf/kernel/pdf/PdfName;

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->ocProperties:Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 724
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->ocProperties:Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;

    .line 726
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->OCProperties:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    if-nez v0, :cond_1

    .line 727
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 728
    .local v0, "pdfDictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 729
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->OCProperties:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 731
    .end local v0    # "pdfDictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->OCProperties:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    return-object v0
.end method

.method public flush()V
    .locals 2

    .line 163
    const-class v0, Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 164
    .local v0, "logger":Lorg/slf4j/Logger;
    const-string v1, "PdfCatalog cannot be flushed manually"

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 165
    return-void
.end method

.method public getCollection()Lcom/itextpdf/kernel/pdf/collection/PdfCollection;
    .locals 2

    .line 406
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Collection:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 407
    .local v0, "collectionDictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v0, :cond_0

    .line 408
    new-instance v1, Lcom/itextpdf/kernel/pdf/collection/PdfCollection;

    invoke-direct {v1, v0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollection;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    return-object v1

    .line 410
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;
    .locals 1

    .line 155
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    return-object v0
.end method

.method public getLang()Lcom/itextpdf/kernel/pdf/PdfString;
    .locals 2

    .line 335
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Lang:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    return-object v0
.end method

.method public getNameTree(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNameTree;
    .locals 2
    .param p1, "treeType"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 293
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->nameTrees:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfNameTree;

    .line 294
    .local v0, "tree":Lcom/itextpdf/kernel/pdf/PdfNameTree;
    if-nez v0, :cond_0

    .line 295
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNameTree;

    invoke-direct {v1, p0, p1}, Lcom/itextpdf/kernel/pdf/PdfNameTree;-><init>(Lcom/itextpdf/kernel/pdf/PdfCatalog;Lcom/itextpdf/kernel/pdf/PdfName;)V

    move-object v0, v1

    .line 296
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->nameTrees:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 299
    :cond_0
    return-object v0
.end method

.method public getOCProperties(Z)Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;
    .locals 3
    .param p1, "createIfNotExists"    # Z

    .line 133
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->ocProperties:Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;

    if-eqz v0, :cond_0

    .line 134
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->ocProperties:Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;

    return-object v0

    .line 136
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->OCProperties:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 137
    .local v0, "ocPropertiesDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v0, :cond_2

    .line 138
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getWriter()Lcom/itextpdf/kernel/pdf/PdfWriter;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 139
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 141
    :cond_1
    new-instance v1, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;

    invoke-direct {v1, v0}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->ocProperties:Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;

    goto :goto_0

    .line 142
    :cond_2
    if-eqz p1, :cond_3

    .line 143
    new-instance v1, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->ocProperties:Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;

    .line 146
    .end local v0    # "ocPropertiesDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->ocProperties:Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;

    return-object v0
.end method

.method getOutlines(Z)Lcom/itextpdf/kernel/pdf/PdfOutline;
    .locals 4
    .param p1, "updateOutlines"    # Z

    .line 511
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->outlines:Lcom/itextpdf/kernel/pdf/PdfOutline;

    if-eqz v0, :cond_0

    if-nez p1, :cond_0

    .line 512
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->outlines:Lcom/itextpdf/kernel/pdf/PdfOutline;

    return-object v0

    .line 513
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->outlines:Lcom/itextpdf/kernel/pdf/PdfOutline;

    if-eqz v0, :cond_1

    .line 514
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->outlines:Lcom/itextpdf/kernel/pdf/PdfOutline;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutline;->clear()V

    .line 515
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->pagesWithOutlines:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 518
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->outlineMode:Z

    .line 519
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Dests:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getNameTree(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNameTree;

    move-result-object v0

    .line 521
    .local v0, "destsTree":Lcom/itextpdf/kernel/pdf/PdfNameTree;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Outlines:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    .line 522
    .local v1, "outlineRoot":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-nez v1, :cond_3

    .line 523
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getWriter()Lcom/itextpdf/kernel/pdf/PdfWriter;

    move-result-object v2

    if-nez v2, :cond_2

    .line 524
    const/4 v2, 0x0

    return-object v2

    .line 526
    :cond_2
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfOutline;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfOutline;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    iput-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->outlines:Lcom/itextpdf/kernel/pdf/PdfOutline;

    goto :goto_0

    .line 528
    :cond_3
    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->constructOutlines(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/IPdfNameTreeAccess;)V

    .line 531
    :goto_0
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->outlines:Lcom/itextpdf/kernel/pdf/PdfOutline;

    return-object v2
.end method

.method public getPageLabelsTree(Z)Lcom/itextpdf/kernel/pdf/PdfNumTree;
    .locals 2
    .param p1, "createIfNotExists"    # Z

    .line 322
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->pageLabels:Lcom/itextpdf/kernel/pdf/PdfNumTree;

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->PageLabels:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v0

    if-nez v0, :cond_0

    if-eqz p1, :cond_1

    .line 323
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfNumTree;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->PageLabels:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {v0, p0, v1}, Lcom/itextpdf/kernel/pdf/PdfNumTree;-><init>(Lcom/itextpdf/kernel/pdf/PdfCatalog;Lcom/itextpdf/kernel/pdf/PdfName;)V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->pageLabels:Lcom/itextpdf/kernel/pdf/PdfNumTree;

    .line 326
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->pageLabels:Lcom/itextpdf/kernel/pdf/PdfNumTree;

    return-object v0
.end method

.method public getPageLayout()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 2

    .line 242
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->PageLayout:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    return-object v0
.end method

.method public getPageMode()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 2

    .line 216
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->PageMode:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    return-object v0
.end method

.method getPageTree()Lcom/itextpdf/kernel/pdf/PdfPagesTree;
    .locals 1

    .line 467
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->pageTree:Lcom/itextpdf/kernel/pdf/PdfPagesTree;

    return-object v0
.end method

.method getPagesWithOutlines()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfOutline;",
            ">;>;"
        }
    .end annotation

    .line 476
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->pagesWithOutlines:Ljava/util/Map;

    return-object v0
.end method

.method public getViewerPreferences()Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;
    .locals 2

    .line 265
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ViewerPreferences:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 266
    .local v0, "viewerPreferences":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v0, :cond_0

    .line 267
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;

    invoke-direct {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    return-object v1

    .line 269
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method hasOutlines()Z
    .locals 2

    .line 540
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Outlines:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v0

    return v0
.end method

.method protected isOCPropertiesMayHaveChanged()Z
    .locals 1

    .line 460
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->ocProperties:Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->ocgCopied:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method isOutlineMode()Z
    .locals 1

    .line 550
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->outlineMode:Z

    return v0
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 169
    const/4 v0, 0x1

    return v0
.end method

.method public nameTreeContainsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z
    .locals 1
    .param p1, "treeType"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 310
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->nameTrees:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfCatalog;
    .locals 1
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "value"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 435
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 436
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 437
    return-object p0
.end method

.method public remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfCatalog;
    .locals 1
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 448
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 449
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 450
    return-object p0
.end method

.method removeOutlines(Lcom/itextpdf/kernel/pdf/PdfPage;)V
    .locals 2
    .param p1, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 559
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getWriter()Lcom/itextpdf/kernel/pdf/PdfWriter;

    move-result-object v0

    if-nez v0, :cond_0

    .line 560
    return-void

    .line 562
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->hasOutlines()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 563
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getOutlines(Z)Lcom/itextpdf/kernel/pdf/PdfOutline;

    .line 564
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->pagesWithOutlines:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 565
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->pagesWithOutlines:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 566
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->pagesWithOutlines:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfOutline;

    .line 567
    .local v1, "outline":Lcom/itextpdf/kernel/pdf/PdfOutline;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfOutline;->removeOutline()V

    .line 568
    .end local v1    # "outline":Lcom/itextpdf/kernel/pdf/PdfOutline;
    goto :goto_0

    .line 572
    :cond_1
    return-void
.end method

.method public setAdditionalAction(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/action/PdfAction;)Lcom/itextpdf/kernel/pdf/PdfCatalog;
    .locals 0
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "action"    # Lcom/itextpdf/kernel/pdf/action/PdfAction;

    .line 206
    invoke-static {p0, p1, p2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->setAdditionalAction(Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/action/PdfAction;)V

    .line 207
    return-object p0
.end method

.method public setCollection(Lcom/itextpdf/kernel/pdf/collection/PdfCollection;)Lcom/itextpdf/kernel/pdf/PdfCatalog;
    .locals 2
    .param p1, "collection"    # Lcom/itextpdf/kernel/pdf/collection/PdfCollection;

    .line 422
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Collection:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/collection/PdfCollection;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfCatalog;

    .line 423
    return-object p0
.end method

.method public setLang(Lcom/itextpdf/kernel/pdf/PdfString;)V
    .locals 1
    .param p1, "lang"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 346
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Lang:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfCatalog;

    .line 347
    return-void
.end method

.method setOcgCopied(Z)V
    .locals 0
    .param p1, "ocgCopied"    # Z

    .line 464
    iput-boolean p1, p0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->ocgCopied:Z

    .line 465
    return-void
.end method

.method public setOpenAction(Lcom/itextpdf/kernel/pdf/action/PdfAction;)Lcom/itextpdf/kernel/pdf/PdfCatalog;
    .locals 2
    .param p1, "action"    # Lcom/itextpdf/kernel/pdf/action/PdfAction;

    .line 193
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->OpenAction:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v0

    return-object v0
.end method

.method public setOpenAction(Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;)Lcom/itextpdf/kernel/pdf/PdfCatalog;
    .locals 2
    .param p1, "destination"    # Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;

    .line 181
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->OpenAction:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v0

    return-object v0
.end method

.method public setPageLayout(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfCatalog;
    .locals 1
    .param p1, "pageLayout"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 253
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->PAGE_LAYOUTS:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 254
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->PageLayout:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v0

    return-object v0

    .line 256
    :cond_0
    return-object p0
.end method

.method public setPageMode(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfCatalog;
    .locals 1
    .param p1, "pageMode"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 230
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfCatalog;->PAGE_MODES:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 231
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->PageMode:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v0

    return-object v0

    .line 233
    :cond_0
    return-object p0
.end method

.method public setViewerPreferences(Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;)Lcom/itextpdf/kernel/pdf/PdfCatalog;
    .locals 2
    .param p1, "preferences"    # Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;

    .line 282
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->ViewerPreferences:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v0

    return-object v0
.end method
