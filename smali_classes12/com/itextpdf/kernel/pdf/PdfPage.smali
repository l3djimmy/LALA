.class public Lcom/itextpdf/kernel/pdf/PdfPage;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfPage.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
        "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
        ">;"
    }
.end annotation


# static fields
.field private static final PAGE_EXCLUDED_KEYS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            ">;"
        }
    .end annotation
.end field

.field private static final XOBJECT_EXCLUDED_KEYS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private ignorePageRotationForContent:Z

.field private mcid:I

.field private pageRotationInverseMatrixWritten:Z

.field parentPages:Lcom/itextpdf/kernel/pdf/PdfPages;

.field private resources:Lcom/itextpdf/kernel/pdf/PdfResources;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 64
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x4

    new-array v2, v1, [Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Parent:Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Annots:Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v5, 0x1

    aput-object v3, v2, v5

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->StructParents:Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v6, 0x2

    aput-object v3, v2, v6

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->B:Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v7, 0x3

    aput-object v3, v2, v7

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfPage;->PAGE_EXCLUDED_KEYS:Ljava/util/List;

    .line 75
    new-instance v0, Ljava/util/ArrayList;

    new-array v1, v1, [Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->MediaBox:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v2, v1, v4

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->CropBox:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v2, v1, v5

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->TrimBox:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v2, v1, v6

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Contents:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v2, v1, v7

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfPage;->XOBJECT_EXCLUDED_KEYS:Ljava/util/List;

    .line 79
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfPage;->XOBJECT_EXCLUDED_KEYS:Ljava/util/List;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfPage;->PAGE_EXCLUDED_KEYS:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 80
    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 1
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 92
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 61
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPage;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    .line 62
    const/4 v0, -0x1

    iput v0, p0, Lcom/itextpdf/kernel/pdf/PdfPage;->mcid:I

    .line 85
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfPage;->ignorePageRotationForContent:Z

    .line 89
    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfPage;->pageRotationInverseMatrixWritten:Z

    .line 93
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->setForbidRelease()V

    .line 94
    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->ensureObjectIsAddedToDocument(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 95
    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 1
    .param p1, "pdfDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 110
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getDefaultPageSize()Lcom/itextpdf/kernel/geom/PageSize;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfPage;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/geom/PageSize;)V

    .line 111
    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/geom/PageSize;)V
    .locals 4
    .param p1, "pdfDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "pageSize"    # Lcom/itextpdf/kernel/geom/PageSize;

    .line 98
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfPage;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 99
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;-><init>()V

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfStream;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 100
    .local v0, "contentStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Contents:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 101
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Page:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 102
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->MediaBox:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v3, p2}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;)V

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 103
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->TrimBox:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v3, p2}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;)V

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 104
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->isTagged()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 105
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfPage;->setTabOrder(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 107
    :cond_0
    return-void
.end method

.method private copyAnnotations(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/utils/ICopyFilter;)V
    .locals 7
    .param p1, "toDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;
    .param p3, "copyFilter"    # Lcom/itextpdf/kernel/utils/ICopyFilter;

    .line 1359
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getAnnotations()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    .line 1360
    .local v1, "annot":Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    invoke-interface {p3, v2, v3, v4}, Lcom/itextpdf/kernel/utils/ICopyFilter;->shouldProcess(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1361
    nop

    .line 1362
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    const/4 v3, 0x2

    new-array v3, v3, [Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->P:Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Parent:Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v6, 0x1

    aput-object v4, v3, v6

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, p1, v3, v6, p3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/util/List;ZLcom/itextpdf/kernel/utils/ICopyFilter;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    .line 1361
    invoke-static {v2}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->makeAnnotation(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v2

    .line 1365
    .local v2, "newAnnot":Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Widget:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getSubtype()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1366
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {p0, v3, v4, p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->rebuildFormFieldParent(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 1369
    :cond_0
    const/4 v3, -0x1

    invoke-virtual {p2, v3, v2, v5}, Lcom/itextpdf/kernel/pdf/PdfPage;->addAnnotation(ILcom/itextpdf/kernel/pdf/annot/PdfAnnotation;Z)Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 1371
    .end local v1    # "annot":Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .end local v2    # "newAnnot":Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    :cond_1
    goto :goto_0

    .line 1372
    :cond_2
    return-void
.end method

.method private copyInheritedProperties(Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/utils/ICopyFilter;)V
    .locals 3
    .param p1, "copyPdfPage"    # Lcom/itextpdf/kernel/pdf/PdfPage;
    .param p2, "pdfDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p3, "copyFilter"    # Lcom/itextpdf/kernel/utils/ICopyFilter;

    .line 1431
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Resources:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    if-nez v0, :cond_0

    .line 1432
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getWriter()Lcom/itextpdf/kernel/pdf/PdfWriter;

    move-result-object v0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getResources()Lcom/itextpdf/kernel/pdf/PdfResources;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfResources;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p2, v2, p3}, Lcom/itextpdf/kernel/pdf/PdfWriter;->copyObject(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfDocument;ZLcom/itextpdf/kernel/utils/ICopyFilter;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 1434
    .local v0, "copyResource":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Resources:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1436
    .end local v0    # "copyResource":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->MediaBox:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    if-nez v0, :cond_1

    .line 1438
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getMediaBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfPage;->setMediaBox(Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 1440
    :cond_1
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->CropBox:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    if-nez v0, :cond_2

    .line 1442
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->CropBox:Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getInheritedValue(Lcom/itextpdf/kernel/pdf/PdfName;I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 1444
    .local v0, "cropBox":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-eqz v0, :cond_2

    .line 1445
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->CropBox:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, p2}, Lcom/itextpdf/kernel/pdf/PdfArray;->copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfPage;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 1448
    .end local v0    # "cropBox":Lcom/itextpdf/kernel/pdf/PdfArray;
    :cond_2
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Rotate:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    if-nez v0, :cond_3

    .line 1450
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Rotate:Lcom/itextpdf/kernel/pdf/PdfName;

    const/16 v1, 0x8

    invoke-direct {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getInheritedValue(Lcom/itextpdf/kernel/pdf/PdfName;I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfNumber;

    .line 1452
    .local v0, "rotate":Lcom/itextpdf/kernel/pdf/PdfNumber;
    if-eqz v0, :cond_3

    .line 1453
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Rotate:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, p2}, Lcom/itextpdf/kernel/pdf/PdfNumber;->copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfPage;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 1456
    .end local v0    # "rotate":Lcom/itextpdf/kernel/pdf/PdfNumber;
    :cond_3
    return-void
.end method

.method private copyTo(Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/IPdfPageExtraCopier;)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 4
    .param p1, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;
    .param p2, "toDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p3, "copier"    # Lcom/itextpdf/kernel/pdf/IPdfPageExtraCopier;

    .line 1277
    new-instance v0, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v1

    invoke-direct {v0, v1, p2}, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 1278
    .local v0, "copyFilter":Lcom/itextpdf/kernel/utils/ICopyFilter;
    invoke-static {}, Lcom/itextpdf/kernel/utils/NullCopyFilter;->getInstance()Lcom/itextpdf/kernel/utils/NullCopyFilter;

    move-result-object v1

    invoke-direct {p0, p1, p2, v1}, Lcom/itextpdf/kernel/pdf/PdfPage;->copyInheritedProperties(Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/utils/ICopyFilter;)V

    .line 1279
    invoke-direct {p0, p2, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfPage;->copyAnnotations(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/utils/ICopyFilter;)V

    .line 1281
    if-eqz p3, :cond_0

    .line 1282
    invoke-interface {p3, p0, p1}, Lcom/itextpdf/kernel/pdf/IPdfPageExtraCopier;->copy(Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;)V

    goto :goto_0

    .line 1284
    :cond_0
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getWriter()Lcom/itextpdf/kernel/pdf/PdfWriter;

    move-result-object v1

    iget-boolean v1, v1, Lcom/itextpdf/kernel/pdf/PdfWriter;->isUserWarnedAboutAcroFormCopying:Z

    if-nez v1, :cond_1

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->hasAcroForm()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1285
    const-class v1, Lcom/itextpdf/kernel/pdf/PdfPage;

    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    .line 1286
    .local v1, "logger":Lorg/slf4j/Logger;
    const-string v2, "Source document has AcroForm dictionary. The pages you are going to copy may have FormFields, but they will not be copied, because you have not used any IPdfPageExtraCopier"

    invoke-interface {v1, v2}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 1287
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getWriter()Lcom/itextpdf/kernel/pdf/PdfWriter;

    move-result-object v2

    const/4 v3, 0x1

    iput-boolean v3, v2, Lcom/itextpdf/kernel/pdf/PdfWriter;->isUserWarnedAboutAcroFormCopying:Z

    .line 1290
    .end local v1    # "logger":Lorg/slf4j/Logger;
    :cond_1
    :goto_0
    return-object p1
.end method

.method private flushAppearanceStreams(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 4
    .param p1, "appearanceStreamsDict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 1410
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->isFlushed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1411
    return-void

    .line 1413
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1414
    .local v1, "val":Lcom/itextpdf/kernel/pdf/PdfObject;
    instance-of v2, v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    if-eqz v2, :cond_2

    .line 1415
    move-object v2, v1

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 1416
    .local v2, "ap":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->isDictionary()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1417
    invoke-direct {p0, v2}, Lcom/itextpdf/kernel/pdf/PdfPage;->flushAppearanceStreams(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    goto :goto_1

    .line 1418
    :cond_1
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->isStream()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1419
    invoke-direct {p0, v2}, Lcom/itextpdf/kernel/pdf/PdfPage;->flushMustBeIndirectObject(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 1422
    .end local v1    # "val":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local v2    # "ap":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_2
    :goto_1
    goto :goto_0

    .line 1423
    :cond_3
    return-void
.end method

.method private flushMustBeIndirectObject(Lcom/itextpdf/kernel/pdf/PdfObject;)V
    .locals 1
    .param p1, "obj"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1427
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->flush()V

    .line 1428
    return-void
.end method

.method private flushResourcesContentStreams()V
    .locals 4

    .line 1375
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getResources()Lcom/itextpdf/kernel/pdf/PdfResources;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfResources;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfPage;->flushResourcesContentStreams(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 1377
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getAnnots(Z)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 1378
    .local v0, "annots":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->isFlushed()Z

    move-result v1

    if-nez v1, :cond_1

    .line 1379
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 1380
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsDictionary(I)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->AP:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    .line 1381
    .local v2, "apDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v2, :cond_0

    .line 1382
    invoke-direct {p0, v2}, Lcom/itextpdf/kernel/pdf/PdfPage;->flushAppearanceStreams(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 1379
    .end local v2    # "apDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1386
    .end local v1    # "i":I
    :cond_1
    return-void
.end method

.method private flushResourcesContentStreams(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 1
    .param p1, "resources"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 1389
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->isFlushed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1390
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->XObject:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfPage;->flushWithResources(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 1391
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Pattern:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfPage;->flushWithResources(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 1392
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Shading:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfPage;->flushWithResources(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 1394
    :cond_0
    return-void
.end method

.method private flushWithResources(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 4
    .param p1, "objsCollection"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 1397
    if-eqz p1, :cond_3

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->isFlushed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 1401
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1402
    .local v1, "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isFlushed()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1403
    goto :goto_0

    .line 1404
    :cond_1
    move-object v2, v1

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Resources:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/itextpdf/kernel/pdf/PdfPage;->flushResourcesContentStreams(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 1405
    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfPage;->flushMustBeIndirectObject(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 1406
    .end local v1    # "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    goto :goto_0

    .line 1407
    :cond_2
    return-void

    .line 1398
    :cond_3
    :goto_1
    return-void
.end method

.method private getAnnots(Z)Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2
    .param p1, "create"    # Z

    .line 1294
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Annots:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 1295
    .local v0, "annots":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-nez v0, :cond_0

    if-eqz p1, :cond_0

    .line 1296
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    move-object v0, v1

    .line 1297
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Annots:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/kernel/pdf/PdfPage;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 1299
    :cond_0
    return-object v0
.end method

.method private getInheritedValue(Lcom/itextpdf/kernel/pdf/PdfName;I)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 2
    .param p1, "pdfName"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "type"    # I

    .line 1303
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPage;->parentPages:Lcom/itextpdf/kernel/pdf/PdfPages;

    if-nez v0, :cond_0

    .line 1304
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPageTree()Lcom/itextpdf/kernel/pdf/PdfPagesTree;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/itextpdf/kernel/pdf/PdfPagesTree;->findPageParent(Lcom/itextpdf/kernel/pdf/PdfPage;)Lcom/itextpdf/kernel/pdf/PdfPages;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPage;->parentPages:Lcom/itextpdf/kernel/pdf/PdfPages;

    .line 1306
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPage;->parentPages:Lcom/itextpdf/kernel/pdf/PdfPages;

    invoke-static {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getInheritedValue(Lcom/itextpdf/kernel/pdf/PdfPages;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 1307
    .local v0, "val":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v1

    if-ne v1, p2, :cond_1

    move-object v1, v0

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method

.method private static getInheritedValue(Lcom/itextpdf/kernel/pdf/PdfPages;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 3
    .param p0, "parentPages"    # Lcom/itextpdf/kernel/pdf/PdfPages;
    .param p1, "pdfName"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 1311
    if-eqz p0, :cond_1

    .line 1312
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPages;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 1313
    .local v0, "parentDictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 1314
    .local v1, "value":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v1, :cond_0

    .line 1315
    return-object v1

    .line 1317
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPages;->getParent()Lcom/itextpdf/kernel/pdf/PdfPages;

    move-result-object v2

    invoke-static {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getInheritedValue(Lcom/itextpdf/kernel/pdf/PdfPages;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    return-object v2

    .line 1320
    .end local v0    # "parentDictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v1    # "value":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method private newContentStream(Z)Lcom/itextpdf/kernel/pdf/PdfStream;
    .locals 4
    .param p1, "before"    # Z

    .line 1324
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Contents:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 1326
    .local v0, "contents":Lcom/itextpdf/kernel/pdf/PdfObject;
    instance-of v1, v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    if-eqz v1, :cond_1

    .line 1327
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 1328
    .local v1, "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 1330
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    goto :goto_0

    .line 1332
    :cond_0
    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 1334
    :goto_0
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Contents:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v2, v1}, Lcom/itextpdf/kernel/pdf/PdfPage;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfPage;

    goto :goto_1

    .line 1335
    .end local v1    # "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    :cond_1
    instance-of v1, v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    if-eqz v1, :cond_2

    .line 1336
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    .restart local v1    # "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    goto :goto_1

    .line 1338
    .end local v1    # "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    :cond_2
    const/4 v1, 0x0

    .line 1340
    .restart local v1    # "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    :goto_1
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/PdfStream;-><init>()V

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfStream;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 1341
    .local v2, "contentStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    if-eqz v1, :cond_5

    .line 1342
    if-eqz p1, :cond_3

    .line 1343
    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(ILcom/itextpdf/kernel/pdf/PdfObject;)V

    goto :goto_2

    .line 1345
    :cond_3
    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 1347
    :goto_2
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v3

    if-eqz v3, :cond_4

    .line 1348
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->setModified()Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_3

    .line 1350
    :cond_4
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    goto :goto_3

    .line 1353
    :cond_5
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Contents:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v3, v2}, Lcom/itextpdf/kernel/pdf/PdfPage;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 1355
    :goto_3
    return-object v2
.end method

.method private rebuildFormFieldParent(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 7
    .param p1, "field"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "newField"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p3, "toDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 1459
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Parent:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p2, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1460
    return-void

    .line 1462
    :cond_0
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Parent:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 1463
    .local v0, "oldParent":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v0, :cond_4

    .line 1464
    const/4 v1, 0x3

    new-array v2, v1, [Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->P:Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Kids:Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v5, 0x1

    aput-object v3, v2, v5

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Parent:Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v6, 0x2

    aput-object v3, v2, v6

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    .line 1465
    invoke-static {}, Lcom/itextpdf/kernel/utils/NullCopyFilter;->getInstance()Lcom/itextpdf/kernel/utils/NullCopyFilter;

    move-result-object v3

    .line 1464
    invoke-virtual {v0, p3, v2, v4, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/util/List;ZLcom/itextpdf/kernel/utils/ICopyFilter;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    .line 1466
    .local v2, "newParent":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->isFlushed()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1467
    new-array v1, v1, [Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->P:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v3, v1, v4

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Kids:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v3, v1, v5

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Parent:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v3, v1, v6

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 1468
    invoke-static {}, Lcom/itextpdf/kernel/utils/NullCopyFilter;->getInstance()Lcom/itextpdf/kernel/utils/NullCopyFilter;

    move-result-object v3

    .line 1467
    invoke-virtual {v0, p3, v1, v5, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/util/List;ZLcom/itextpdf/kernel/utils/ICopyFilter;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    .line 1470
    :cond_1
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Parent:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    if-ne v0, v1, :cond_2

    .line 1471
    return-void

    .line 1473
    :cond_2
    invoke-direct {p0, v0, v2, p3}, Lcom/itextpdf/kernel/pdf/PdfPage;->rebuildFormFieldParent(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 1475
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Kids:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v1

    .line 1476
    .local v1, "kids":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-nez v1, :cond_3

    .line 1479
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Kids:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v4}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    invoke-virtual {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1481
    :cond_3
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Parent:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p2, v3, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1483
    .end local v1    # "kids":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v2    # "newParent":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_4
    return-void
.end method


# virtual methods
.method public addAnnotation(ILcom/itextpdf/kernel/pdf/annot/PdfAnnotation;Z)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 4
    .param p1, "index"    # I
    .param p2, "annotation"    # Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .param p3, "tagAnnotation"    # Z

    .line 860
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->isTagged()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 861
    if-eqz p3, :cond_2

    .line 862
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getTagStructureContext()Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getAutoTaggingPointer()Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    move-result-object v0

    .line 863
    .local v0, "tagPointer":Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getRole()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Annot"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfVersion;->PDF_1_4:Lcom/itextpdf/kernel/pdf/PdfVersion;

    .line 865
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPdfVersion()Lcom/itextpdf/kernel/pdf/PdfVersion;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/pdf/PdfVersion;->compareTo(Lcom/itextpdf/kernel/pdf/PdfVersion;)I

    move-result v1

    if-gez v1, :cond_1

    .line 867
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfVersion;->PDF_2_0:Lcom/itextpdf/kernel/pdf/PdfVersion;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPdfVersion()Lcom/itextpdf/kernel/pdf/PdfVersion;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/pdf/PdfVersion;->compareTo(Lcom/itextpdf/kernel/pdf/PdfVersion;)I

    move-result v1

    if-lez v1, :cond_0

    .line 868
    instance-of v1, p2, Lcom/itextpdf/kernel/pdf/annot/PdfWidgetAnnotation;

    if-nez v1, :cond_1

    instance-of v1, p2, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;

    if-nez v1, :cond_1

    instance-of v1, p2, Lcom/itextpdf/kernel/pdf/annot/PdfPrinterMarkAnnotation;

    if-nez v1, :cond_1

    .line 870
    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->addTag(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    goto :goto_0

    .line 872
    :cond_0
    instance-of v1, p2, Lcom/itextpdf/kernel/pdf/annot/PdfMarkupAnnotation;

    if-eqz v1, :cond_1

    .line 873
    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->addTag(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 876
    :cond_1
    :goto_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getCurrentPage()Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v1

    .line 877
    .local v1, "prevPage":Lcom/itextpdf/kernel/pdf/PdfPage;
    invoke-virtual {v0, p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->setPageForTagging(Lcom/itextpdf/kernel/pdf/PdfPage;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    move-result-object v2

    invoke-virtual {v2, p2}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->addAnnotationTag(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 878
    if-eqz v1, :cond_2

    .line 879
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->setPageForTagging(Lcom/itextpdf/kernel/pdf/PdfPage;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 882
    .end local v0    # "tagPointer":Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    .end local v1    # "prevPage":Lcom/itextpdf/kernel/pdf/PdfPage;
    :cond_2
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getTabOrder()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    if-nez v0, :cond_3

    .line 883
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfPage;->setTabOrder(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 887
    :cond_3
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getAnnots(Z)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 888
    .local v0, "annots":Lcom/itextpdf/kernel/pdf/PdfArray;
    const/4 v1, -0x1

    if-ne p1, v1, :cond_4

    .line 889
    invoke-virtual {p2, p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->setPage(Lcom/itextpdf/kernel/pdf/PdfPage;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    goto :goto_1

    .line 891
    :cond_4
    invoke-virtual {p2, p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->setPage(Lcom/itextpdf/kernel/pdf/PdfPage;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(ILcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 894
    :goto_1
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v1

    if-nez v1, :cond_5

    .line 896
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    goto :goto_2

    .line 899
    :cond_5
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->setModified()Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 902
    :goto_2
    return-object p0
.end method

.method public addAnnotation(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 2
    .param p1, "annotation"    # Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    .line 845
    const/4 v0, -0x1

    const/4 v1, 0x1

    invoke-virtual {p0, v0, p1, v1}, Lcom/itextpdf/kernel/pdf/PdfPage;->addAnnotation(ILcom/itextpdf/kernel/pdf/annot/PdfAnnotation;Z)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v0

    return-object v0
.end method

.method public addAssociatedFile(Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;)V
    .locals 1
    .param p1, "fs"    # Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    .line 1236
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->addAssociatedFile(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;)V

    .line 1237
    return-void
.end method

.method public addAssociatedFile(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;)V
    .locals 4
    .param p1, "description"    # Ljava/lang/String;
    .param p2, "fs"    # Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    .line 1207
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AFRelationship:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    if-nez v0, :cond_0

    .line 1208
    const-class v0, Lcom/itextpdf/kernel/pdf/PdfPage;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 1209
    .local v0, "logger":Lorg/slf4j/Logger;
    const-string v1, "For associated files their associated file specification dictionaries shall include the AFRelationship key."

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 1211
    .end local v0    # "logger":Lorg/slf4j/Logger;
    :cond_0
    if-eqz p1, :cond_1

    .line 1212
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    .line 1213
    .local v0, "key":Lcom/itextpdf/kernel/pdf/PdfString;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v1

    .line 1214
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->EmbeddedFiles:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v0, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->addNameToNameTree(Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfName;)V

    .line 1216
    .end local v0    # "key":Lcom/itextpdf/kernel/pdf/PdfString;
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 1217
    .local v0, "afArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-nez v0, :cond_2

    .line 1218
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    move-object v0, v1

    .line 1219
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/kernel/pdf/PdfPage;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 1221
    :cond_2
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 1222
    return-void
.end method

.method public addOutputIntent(Lcom/itextpdf/kernel/pdf/PdfOutputIntent;)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 2
    .param p1, "outputIntent"    # Lcom/itextpdf/kernel/pdf/PdfOutputIntent;

    .line 1128
    if-nez p1, :cond_0

    .line 1129
    return-object p0

    .line 1131
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->OutputIntents:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 1132
    .local v0, "outputIntents":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-nez v0, :cond_1

    .line 1133
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    move-object v0, v1

    .line 1134
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->OutputIntents:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/kernel/pdf/PdfPage;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 1136
    :cond_1
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfOutputIntent;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 1137
    return-object p0
.end method

.method public containsAnnotation(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;)Z
    .locals 4
    .param p1, "annotation"    # Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    .line 829
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getAnnotations()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    .line 830
    .local v1, "a":Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 831
    const/4 v0, 0x1

    return v0

    .line 833
    .end local v1    # "a":Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    :cond_0
    goto :goto_0

    .line 834
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public copyAsFormXObject(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;
    .locals 6
    .param p1, "toDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 430
    new-instance v0, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getCropBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 432
    .local v0, "xObject":Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfName;

    .line 433
    .local v2, "key":Lcom/itextpdf/kernel/pdf/PdfName;
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfPage;->XOBJECT_EXCLUDED_KEYS:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 434
    goto :goto_0

    .line 436
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    .line 437
    .local v3, "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v4, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 438
    const/4 v4, 0x0

    invoke-static {}, Lcom/itextpdf/kernel/utils/NullCopyFilter;->getInstance()Lcom/itextpdf/kernel/utils/NullCopyFilter;

    move-result-object v5

    invoke-virtual {v3, p1, v4, v5}, Lcom/itextpdf/kernel/pdf/PdfObject;->copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;ZLcom/itextpdf/kernel/utils/ICopyFilter;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    .line 439
    .local v4, "copyObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v5, v2, v4}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 441
    .end local v2    # "key":Lcom/itextpdf/kernel/pdf/PdfName;
    .end local v3    # "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local v4    # "copyObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_1
    goto :goto_0

    .line 442
    :cond_2
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v1

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getContentBytes()[B

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write([B)V

    .line 444
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfStream;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Resources:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 445
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getResources()Lcom/itextpdf/kernel/pdf/PdfResources;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfResources;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 446
    invoke-static {}, Lcom/itextpdf/kernel/utils/NullCopyFilter;->getInstance()Lcom/itextpdf/kernel/utils/NullCopyFilter;

    move-result-object v2

    .line 445
    const/4 v3, 0x1

    invoke-virtual {v1, p1, v3, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;ZLcom/itextpdf/kernel/utils/ICopyFilter;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 447
    .local v1, "copyResource":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfStream;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Resources:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 450
    .end local v1    # "copyResource":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_3
    return-object v0
.end method

.method public copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 1
    .param p1, "toDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 370
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfPage;->copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/IPdfPageExtraCopier;)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v0

    return-object v0
.end method

.method public copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/IPdfPageExtraCopier;)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 2
    .param p1, "toDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "copier"    # Lcom/itextpdf/kernel/pdf/IPdfPageExtraCopier;

    .line 385
    const/4 v0, 0x0

    const/4 v1, -0x1

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfPage;->copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/IPdfPageExtraCopier;ZI)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v0

    return-object v0
.end method

.method public copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/IPdfPageExtraCopier;ZI)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 4
    .param p1, "toDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "copier"    # Lcom/itextpdf/kernel/pdf/IPdfPageExtraCopier;
    .param p3, "addPageToDocument"    # Z
    .param p4, "pageInsertIndex"    # I

    .line 408
    new-instance v0, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 409
    .local v0, "copyFilter":Lcom/itextpdf/kernel/utils/ICopyFilter;
    nop

    .line 410
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfPage;->PAGE_EXCLUDED_KEYS:Ljava/util/List;

    const/4 v3, 0x1

    invoke-virtual {v1, p1, v2, v3, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/util/List;ZLcom/itextpdf/kernel/utils/ICopyFilter;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    .line 411
    .local v1, "dictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPageFactory()Lcom/itextpdf/kernel/pdf/IPdfPageFactory;

    move-result-object v2

    invoke-interface {v2, v1}, Lcom/itextpdf/kernel/pdf/IPdfPageFactory;->createPdfPage(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v2

    .line 412
    .local v2, "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    if-eqz p3, :cond_1

    .line 413
    const/4 v3, -0x1

    if-ne p4, v3, :cond_0

    .line 414
    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->addPage(Lcom/itextpdf/kernel/pdf/PdfPage;)Lcom/itextpdf/kernel/pdf/PdfPage;

    goto :goto_0

    .line 416
    :cond_0
    invoke-virtual {p1, p4, v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->addPage(ILcom/itextpdf/kernel/pdf/PdfPage;)Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 419
    :cond_1
    :goto_0
    invoke-direct {p0, v2, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfPage;->copyTo(Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/IPdfPageExtraCopier;)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v3

    return-object v3
.end method

.method public flush()V
    .locals 1

    .line 476
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfPage;->flush(Z)V

    .line 477
    return-void
.end method

.method public flush(Z)V
    .locals 7
    .param p1, "flushResourcesContentStreams"    # Z

    .line 499
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->isFlushed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 500
    return-void

    .line 502
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    new-instance v1, Lcom/itextpdf/kernel/events/PdfDocumentEvent;

    const-string v2, "EndPdfPage"

    invoke-direct {v1, v2, p0}, Lcom/itextpdf/kernel/events/PdfDocumentEvent;-><init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfPage;)V

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->dispatchEvent(Lcom/itextpdf/kernel/events/Event;)V

    .line 504
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->isTagged()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getStructTreeRoot()Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->isFlushed()Z

    move-result v0

    if-nez v0, :cond_1

    .line 505
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->tryFlushPageTags()V

    .line 508
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPage;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    const/4 v1, 0x0

    if-nez v0, :cond_2

    .line 510
    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfPage;->initResources(Z)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    goto :goto_0

    .line 511
    :cond_2
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPage;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfResources;->isModified()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPage;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfResources;->isReadOnly()Z

    move-result v0

    if-nez v0, :cond_3

    .line 512
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Resources:Lcom/itextpdf/kernel/pdf/PdfName;

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfPage;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfResources;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/itextpdf/kernel/pdf/PdfPage;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 514
    :cond_3
    :goto_0
    if-eqz p1, :cond_4

    .line 515
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    sget-object v2, Lcom/itextpdf/kernel/pdf/IsoKey;->PAGE:Lcom/itextpdf/kernel/pdf/IsoKey;

    invoke-virtual {v0, p0, v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkIsoConformance(Ljava/lang/Object;Lcom/itextpdf/kernel/pdf/IsoKey;)V

    .line 516
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->flushResourcesContentStreams()V

    .line 519
    :cond_4
    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getAnnots(Z)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 521
    .local v0, "annots":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-eqz v0, :cond_6

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->isFlushed()Z

    move-result v2

    if-nez v2, :cond_6

    .line 522
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v3

    if-ge v2, v3, :cond_6

    .line 523
    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    .line 524
    .local v3, "a":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v3, :cond_5

    .line 525
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfObject;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfObject;->flush()V

    .line 522
    .end local v3    # "a":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 530
    .end local v2    # "i":I
    :cond_6
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Thumb:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsStream(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v2

    .line 531
    .local v2, "thumb":Lcom/itextpdf/kernel/pdf/PdfStream;
    if-eqz v2, :cond_7

    .line 532
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->flush()V

    .line 535
    :cond_7
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Contents:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    .line 537
    .local v3, "contentsObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v3, :cond_9

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfObject;->isFlushed()Z

    move-result v4

    if-nez v4, :cond_9

    .line 538
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getContentStreamCount()I

    move-result v4

    .line 539
    .local v4, "contentStreamCount":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_2
    if-ge v5, v4, :cond_9

    .line 540
    invoke-virtual {p0, v5}, Lcom/itextpdf/kernel/pdf/PdfPage;->getContentStream(I)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v6

    .line 541
    .local v6, "contentStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    if-eqz v6, :cond_8

    .line 542
    invoke-virtual {v6, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->flush(Z)V

    .line 539
    .end local v6    # "contentStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    :cond_8
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 546
    .end local v4    # "contentStreamCount":I
    .end local v5    # "i":I
    :cond_9
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->releaseInstanceFields()V

    .line 548
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;->flush()V

    .line 549
    return-void
.end method

.method public getAnnotations()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;",
            ">;"
        }
    .end annotation

    .line 799
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 800
    .local v0, "annotations":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;>;"
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Annots:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v1

    .line 801
    .local v1, "annots":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-eqz v1, :cond_4

    .line 802
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v3

    if-ge v2, v3, :cond_4

    .line 803
    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsDictionary(I)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v3

    .line 804
    .local v3, "annot":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-nez v3, :cond_0

    .line 805
    goto :goto_2

    .line 807
    :cond_0
    invoke-static {v3}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->makeAnnotation(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v4

    .line 808
    .local v4, "annotation":Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    if-nez v4, :cond_1

    .line 809
    goto :goto_2

    .line 811
    :cond_1
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v5

    const/16 v6, 0x8

    if-eqz v5, :cond_2

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v5

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->checkState(S)Z

    move-result v5

    if-nez v5, :cond_2

    const/4 v5, 0x1

    goto :goto_1

    :cond_2
    const/4 v5, 0x0

    .line 812
    .local v5, "hasBeenNotModified":Z
    :goto_1
    invoke-virtual {v4, p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->setPage(Lcom/itextpdf/kernel/pdf/PdfPage;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v7

    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 813
    if-eqz v5, :cond_3

    .line 814
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v7

    invoke-virtual {v7, v6}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->clearState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 815
    const/16 v6, 0x80

    invoke-virtual {v3, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->clearState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 802
    .end local v3    # "annot":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v4    # "annotation":Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .end local v5    # "hasBeenNotModified":Z
    :cond_3
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 819
    .end local v2    # "i":I
    :cond_4
    return-object v0
.end method

.method public getAnnotsSize()I
    .locals 2

    .line 973
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getAnnots(Z)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v1

    .line 974
    .local v1, "annots":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-nez v1, :cond_0

    .line 975
    return v0

    .line 976
    :cond_0
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v0

    return v0
.end method

.method public getArtBox()Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 2

    .line 683
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ArtBox:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsRectangle(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    .line 684
    .local v0, "artBox":Lcom/itextpdf/kernel/geom/Rectangle;
    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getCropBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    return-object v1
.end method

.method public getAssociatedFiles(Z)Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2
    .param p1, "create"    # Z

    .line 1246
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 1247
    .local v0, "afArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-nez v0, :cond_0

    if-eqz p1, :cond_0

    .line 1248
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    move-object v0, v1

    .line 1249
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/kernel/pdf/PdfPage;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 1251
    :cond_0
    return-object v0
.end method

.method public getBleedBox()Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 2

    .line 659
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BleedBox:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsRectangle(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    .line 660
    .local v0, "bleedBox":Lcom/itextpdf/kernel/geom/Rectangle;
    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getCropBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    return-object v1
.end method

.method public getContentBytes()[B
    .locals 9

    .line 718
    :try_start_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/PdfDocument;->memoryLimitsAwareHandler:Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;

    .line 719
    .local v0, "handler":Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;
    if-nez v0, :cond_0

    const-wide/16 v1, -0x1

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->getAllMemoryUsedForDecompression()J

    move-result-wide v1

    .line 721
    .local v1, "usedMemory":J
    :goto_0
    new-instance v3, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareOutputStream;

    invoke-direct {v3}, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareOutputStream;-><init>()V

    .line 722
    .local v3, "baos":Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareOutputStream;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getContentStreamCount()I

    move-result v4

    .line 724
    .local v4, "streamCount":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1
    if-ge v5, v4, :cond_3

    .line 725
    invoke-virtual {p0, v5}, Lcom/itextpdf/kernel/pdf/PdfPage;->getStreamBytes(I)[B

    move-result-object v6

    .line 727
    .local v6, "streamBytes":[B
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->getAllMemoryUsedForDecompression()J

    move-result-wide v7

    cmp-long v7, v1, v7

    if-gez v7, :cond_1

    .line 728
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->getMaxSizeOfSingleDecompressedPdfStream()I

    move-result v7

    invoke-virtual {v3, v7}, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareOutputStream;->setMaxStreamSize(I)Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareOutputStream;

    .line 730
    :cond_1
    invoke-virtual {v3, v6}, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareOutputStream;->write([B)V

    .line 731
    array-length v7, v6

    if-eqz v7, :cond_2

    array-length v7, v6

    add-int/lit8 v7, v7, -0x1

    aget-byte v7, v6, v7

    int-to-char v7, v7

    invoke-static {v7}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v7

    if-nez v7, :cond_2

    .line 732
    const/16 v7, 0xa

    invoke-virtual {v3, v7}, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareOutputStream;->write(I)V

    .line 724
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 735
    .end local v5    # "i":I
    .end local v6    # "streamBytes":[B
    :cond_3
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareOutputStream;->toByteArray()[B

    move-result-object v5
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v5

    .line 736
    .end local v0    # "handler":Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;
    .end local v1    # "usedMemory":J
    .end local v3    # "baos":Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareOutputStream;
    .end local v4    # "streamCount":I
    :catch_0
    move-exception v0

    .line 737
    .local v0, "ioe":Ljava/io/IOException;
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Cannot get content bytes."

    invoke-direct {v1, v2, v0, p0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/Object;)V

    throw v1
.end method

.method public getContentStream(I)Lcom/itextpdf/kernel/pdf/PdfStream;
    .locals 4
    .param p1, "index"    # I

    .line 178
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getContentStreamCount()I

    move-result v0

    .line 179
    .local v0, "count":I
    if-ge p1, v0, :cond_2

    if-ltz p1, :cond_2

    .line 181
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Contents:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 182
    .local v1, "contents":Lcom/itextpdf/kernel/pdf/PdfObject;
    instance-of v2, v1, Lcom/itextpdf/kernel/pdf/PdfStream;

    if-eqz v2, :cond_0

    .line 183
    move-object v2, v1

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfStream;

    return-object v2

    .line 184
    :cond_0
    instance-of v2, v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    if-eqz v2, :cond_1

    .line 185
    move-object v2, v1

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 186
    .local v2, "a":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-virtual {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsStream(I)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v3

    return-object v3

    .line 188
    .end local v2    # "a":Lcom/itextpdf/kernel/pdf/PdfArray;
    :cond_1
    const/4 v2, 0x0

    return-object v2

    .line 180
    .end local v1    # "contents":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_2
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v2, v3}, [Ljava/lang/Object;

    move-result-object v2

    const-string v3, "Index: {0}, Size: {1}"

    invoke-static {v3, v2}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getContentStreamCount()I
    .locals 2

    .line 199
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Contents:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 200
    .local v0, "contents":Lcom/itextpdf/kernel/pdf/PdfObject;
    instance-of v1, v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    if-eqz v1, :cond_0

    .line 201
    const/4 v1, 0x1

    return v1

    .line 202
    :cond_0
    instance-of v1, v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    if-eqz v1, :cond_1

    .line 203
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v1

    return v1

    .line 205
    :cond_1
    const/4 v1, 0x0

    return v1
.end method

.method public getCropBox()Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 3

    .line 616
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->CropBox:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 617
    .local v0, "cropBox":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-nez v0, :cond_0

    .line 618
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->CropBox:Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfPage;->getInheritedValue(Lcom/itextpdf/kernel/pdf/PdfName;I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 619
    if-nez v0, :cond_0

    .line 620
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getMediaBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    return-object v1

    .line 623
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->toRectangle()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    return-object v1
.end method

.method public getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;
    .locals 1

    .line 459
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 460
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    return-object v0

    .line 461
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getFirstContentStream()Lcom/itextpdf/kernel/pdf/PdfStream;
    .locals 1

    .line 215
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getContentStreamCount()I

    move-result v0

    if-lez v0, :cond_0

    .line 216
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getContentStream(I)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v0

    return-object v0

    .line 217
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getLastContentStream()Lcom/itextpdf/kernel/pdf/PdfStream;
    .locals 2

    .line 226
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getContentStreamCount()I

    move-result v0

    .line 227
    .local v0, "count":I
    if-lez v0, :cond_0

    .line 228
    add-int/lit8 v1, v0, -0x1

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getContentStream(I)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v1

    return-object v1

    .line 229
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public getMediaBox()Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 12

    .line 559
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->MediaBox:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 560
    .local v0, "mediaBox":Lcom/itextpdf/kernel/pdf/PdfArray;
    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 561
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->MediaBox:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {p0, v2, v1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getInheritedValue(Lcom/itextpdf/kernel/pdf/PdfName;I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 563
    :cond_0
    if-eqz v0, :cond_5

    .line 567
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v2

    move v3, v2

    .local v3, "mediaBoxSize":I
    const/4 v4, 0x4

    if-eq v2, v4, :cond_3

    .line 568
    if-le v3, v4, :cond_1

    .line 569
    const-class v2, Lcom/itextpdf/kernel/pdf/PdfPage;

    invoke-static {v2}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v2

    .line 570
    .local v2, "logger":Lorg/slf4j/Logger;
    invoke-interface {v2}, Lorg/slf4j/Logger;->isErrorEnabled()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 571
    nop

    .line 572
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    .line 571
    const-string v6, "Wrong media box size: {0}. The arguments beyond the 4th will be ignored"

    invoke-static {v6, v5}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v5}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 576
    .end local v2    # "logger":Lorg/slf4j/Logger;
    :cond_1
    if-lt v3, v4, :cond_2

    goto :goto_0

    .line 577
    :cond_2
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Wrong media box size: {0}. Need at least 4 arguments"

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    .line 578
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/kernel/exceptions/PdfException;

    move-result-object v1

    throw v1

    .line 582
    :cond_3
    :goto_0
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v2

    .line 583
    .local v2, "llx":Lcom/itextpdf/kernel/pdf/PdfNumber;
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v1

    .line 584
    .local v1, "lly":Lcom/itextpdf/kernel/pdf/PdfNumber;
    const/4 v4, 0x2

    invoke-virtual {v0, v4}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v4

    .line 585
    .local v4, "urx":Lcom/itextpdf/kernel/pdf/PdfNumber;
    const/4 v5, 0x3

    invoke-virtual {v0, v5}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v5

    .line 586
    .local v5, "ury":Lcom/itextpdf/kernel/pdf/PdfNumber;
    if-eqz v2, :cond_4

    if-eqz v1, :cond_4

    if-eqz v4, :cond_4

    if-eqz v5, :cond_4

    .line 589
    new-instance v6, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v7

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v8

    invoke-static {v7, v8}, Ljava/lang/Math;->min(FF)F

    move-result v7

    .line 590
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v8

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v9

    invoke-static {v8, v9}, Ljava/lang/Math;->min(FF)F

    move-result v8

    .line 591
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v9

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v10

    sub-float/2addr v9, v10

    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    move-result v9

    .line 592
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v10

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v11

    sub-float/2addr v10, v11

    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v10

    invoke-direct {v6, v7, v8, v9, v10}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    .line 589
    return-object v6

    .line 587
    :cond_4
    new-instance v6, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v7, "Tne media box object has incorrect values."

    invoke-direct {v6, v7}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 564
    .end local v1    # "lly":Lcom/itextpdf/kernel/pdf/PdfNumber;
    .end local v2    # "llx":Lcom/itextpdf/kernel/pdf/PdfNumber;
    .end local v3    # "mediaBoxSize":I
    .end local v4    # "urx":Lcom/itextpdf/kernel/pdf/PdfNumber;
    .end local v5    # "ury":Lcom/itextpdf/kernel/pdf/PdfNumber;
    :cond_5
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Invalid PDF. There is no media box attribute for page or its parents."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getNextMcid()I
    .locals 2

    .line 759
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->isTagged()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 762
    iget v0, p0, Lcom/itextpdf/kernel/pdf/PdfPage;->mcid:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 763
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getStructTreeRoot()Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    move-result-object v0

    .line 764
    .local v0, "structTreeRoot":Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;
    invoke-virtual {v0, p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->getNextMcidForPage(Lcom/itextpdf/kernel/pdf/PdfPage;)I

    move-result v1

    iput v1, p0, Lcom/itextpdf/kernel/pdf/PdfPage;->mcid:I

    .line 766
    .end local v0    # "structTreeRoot":Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;
    :cond_0
    iget v0, p0, Lcom/itextpdf/kernel/pdf/PdfPage;->mcid:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/itextpdf/kernel/pdf/PdfPage;->mcid:I

    return v0

    .line 760
    :cond_1
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Must be a tagged document."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getOutlines(Z)Ljava/util/List;
    .locals 2
    .param p1, "updateOutlines"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfOutline;",
            ">;"
        }
    .end annotation

    .line 988
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getOutlines(Z)Lcom/itextpdf/kernel/pdf/PdfOutline;

    .line 989
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPagesWithOutlines()Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public getPageSize()Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 1

    .line 119
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getMediaBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    return-object v0
.end method

.method public getPageSizeWithRotation()Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 2

    .line 128
    new-instance v0, Lcom/itextpdf/kernel/geom/PageSize;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPageSize()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/geom/PageSize;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 129
    .local v0, "rect":Lcom/itextpdf/kernel/geom/PageSize;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getRotation()I

    move-result v1

    .line 130
    .local v1, "rotation":I
    :goto_0
    if-lez v1, :cond_0

    .line 131
    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/PageSize;->rotate()Lcom/itextpdf/kernel/geom/PageSize;

    move-result-object v0

    .line 132
    add-int/lit8 v1, v1, -0x5a

    goto :goto_0

    .line 134
    :cond_0
    return-object v0
.end method

.method public getResources()Lcom/itextpdf/kernel/pdf/PdfResources;
    .locals 1

    .line 266
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getResources(Z)Lcom/itextpdf/kernel/pdf/PdfResources;

    move-result-object v0

    return-object v0
.end method

.method getResources(Z)Lcom/itextpdf/kernel/pdf/PdfResources;
    .locals 1
    .param p1, "initResourcesField"    # Z

    .line 270
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPage;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    if-nez v0, :cond_0

    if-eqz p1, :cond_0

    .line 271
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfPage;->initResources(Z)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 273
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPage;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    return-object v0
.end method

.method public getRotation()I
    .locals 4

    .line 144
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Rotate:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    .line 145
    .local v0, "rotate":Lcom/itextpdf/kernel/pdf/PdfNumber;
    const/4 v1, 0x0

    .line 146
    .local v1, "rotateValue":I
    if-nez v0, :cond_0

    .line 147
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Rotate:Lcom/itextpdf/kernel/pdf/PdfName;

    const/16 v3, 0x8

    invoke-direct {p0, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfPage;->getInheritedValue(Lcom/itextpdf/kernel/pdf/PdfName;I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfNumber;

    .line 149
    :cond_0
    if-eqz v0, :cond_1

    .line 150
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v1

    .line 152
    :cond_1
    rem-int/lit16 v1, v1, 0x168

    .line 153
    if-gez v1, :cond_2

    add-int/lit16 v2, v1, 0x168

    goto :goto_0

    :cond_2
    move v2, v1

    :goto_0
    return v2
.end method

.method public getStreamBytes(I)[B
    .locals 1
    .param p1, "index"    # I

    .line 749
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getContentStream(I)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getBytes()[B

    move-result-object v0

    return-object v0
.end method

.method public getStructParentIndex()I
    .locals 2

    .line 776
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->StructParents:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->StructParents:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, -0x1

    :goto_0
    return v0
.end method

.method public getTabOrder()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 2

    .line 1094
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Tabs:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    return-object v0
.end method

.method public getThumbnailImage()Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;
    .locals 2

    .line 1115
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Thumb:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsStream(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v0

    .line 1116
    .local v0, "thumbStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    if-eqz v0, :cond_0

    new-instance v1, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;

    invoke-direct {v1, v0}, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;-><init>(Lcom/itextpdf/kernel/pdf/PdfStream;)V

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method

.method public getTrimBox()Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 2

    .line 706
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->TrimBox:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsRectangle(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    .line 707
    .local v0, "trimBox":Lcom/itextpdf/kernel/geom/Rectangle;
    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getCropBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    return-object v1
.end method

.method public getXmpMetadata()Lcom/itextpdf/kernel/pdf/PdfStream;
    .locals 2

    .line 358
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Metadata:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsStream(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v0

    return-object v0
.end method

.method initResources(Z)Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 4
    .param p1, "initResourcesField"    # Z

    .line 277
    const/4 v0, 0x0

    .line 278
    .local v0, "readOnly":Z
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Resources:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    .line 279
    .local v1, "resources":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-nez v1, :cond_0

    .line 280
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Resources:Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v3, 0x3

    invoke-direct {p0, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfPage;->getInheritedValue(Lcom/itextpdf/kernel/pdf/PdfName;I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    move-object v1, v2

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 281
    if-eqz v1, :cond_0

    .line 282
    const/4 v0, 0x1

    .line 285
    :cond_0
    if-nez v1, :cond_1

    .line 286
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    move-object v1, v2

    .line 288
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Resources:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 290
    :cond_1
    if-eqz p1, :cond_2

    .line 291
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfResources;

    invoke-direct {v2, v1}, Lcom/itextpdf/kernel/pdf/PdfResources;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    iput-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfPage;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    .line 292
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfPage;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    invoke-virtual {v2, v0}, Lcom/itextpdf/kernel/pdf/PdfResources;->setReadOnly(Z)V

    .line 294
    :cond_2
    return-object v1
.end method

.method public isIgnorePageRotationForContent()Z
    .locals 1

    .line 997
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfPage;->ignorePageRotationForContent:Z

    return v0
.end method

.method public isPageRotationInverseMatrixWritten()Z
    .locals 1

    .line 1179
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfPage;->pageRotationInverseMatrixWritten:Z

    return v0
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 1273
    const/4 v0, 0x1

    return v0
.end method

.method public newContentStreamAfter()Lcom/itextpdf/kernel/pdf/PdfStream;
    .locals 1

    .line 249
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfPage;->newContentStream(Z)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v0

    return-object v0
.end method

.method public newContentStreamBefore()Lcom/itextpdf/kernel/pdf/PdfStream;
    .locals 1

    .line 239
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfPage;->newContentStream(Z)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v0

    return-object v0
.end method

.method public put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 1
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "value"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1149
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1150
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 1151
    return-object p0
.end method

.method releaseInstanceFields()V
    .locals 1

    .line 1267
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPage;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    .line 1268
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPage;->parentPages:Lcom/itextpdf/kernel/pdf/PdfPages;

    .line 1269
    return-void
.end method

.method public remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 1
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 1163
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1164
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 1165
    return-object p0
.end method

.method public removeAnnotation(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 1
    .param p1, "annotation"    # Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    .line 918
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfPage;->removeAnnotation(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;Z)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v0

    return-object v0
.end method

.method public removeAnnotation(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;Z)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 5
    .param p1, "annotation"    # Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .param p2, "rememberTagPointer"    # Z

    .line 940
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getAnnots(Z)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v1

    .line 941
    .local v1, "annots":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-eqz v1, :cond_2

    .line 942
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->remove(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 944
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 945
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Annots:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/pdf/PdfPage;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfPage;

    goto :goto_0

    .line 946
    :cond_0
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v2

    if-nez v2, :cond_1

    .line 947
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    goto :goto_0

    .line 949
    :cond_1
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->setModified()Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 953
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->isTagged()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 954
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getTagStructureContext()Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    move-result-object v2

    .line 955
    invoke-virtual {v2, p1, p2}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->removeAnnotationTag(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;Z)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    move-result-object v2

    .line 956
    .local v2, "tagPointer":Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    if-eqz v2, :cond_5

    .line 957
    const-string v3, "Annot"

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getRole()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 958
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getRole()Ljava/lang/String;

    move-result-object v3

    const-string v4, "Form"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    :cond_3
    const/4 v0, 0x1

    .line 959
    .local v0, "standardAnnotTagRole":Z
    :cond_4
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getKidsRoles()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_5

    if-eqz v0, :cond_5

    .line 960
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->removeTag()Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 964
    .end local v0    # "standardAnnotTagRole":Z
    .end local v2    # "tagPointer":Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    :cond_5
    return-object p0
.end method

.method public setAdditionalAction(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/action/PdfAction;)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 0
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "action"    # Lcom/itextpdf/kernel/pdf/action/PdfAction;

    .line 788
    invoke-static {p0, p1, p2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->setAdditionalAction(Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/action/PdfAction;)V

    .line 789
    return-object p0
.end method

.method public setArtBox(Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 2
    .param p1, "rectangle"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 671
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->ArtBox:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfPage;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 672
    return-object p0
.end method

.method public setBleedBox(Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 2
    .param p1, "rectangle"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 647
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->BleedBox:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfPage;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 648
    return-object p0
.end method

.method public setCropBox(Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 2
    .param p1, "rectangle"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 635
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->CropBox:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfPage;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 636
    return-object p0
.end method

.method public setIgnorePageRotationForContent(Z)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 0
    .param p1, "ignorePageRotationForContent"    # Z

    .line 1009
    iput-boolean p1, p0, Lcom/itextpdf/kernel/pdf/PdfPage;->ignorePageRotationForContent:Z

    .line 1010
    return-object p0
.end method

.method public setMediaBox(Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 2
    .param p1, "rectangle"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 603
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->MediaBox:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfPage;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 604
    return-object p0
.end method

.method public setPageLabel(Lcom/itextpdf/kernel/pdf/PageLabelNumberingStyle;Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 1
    .param p1, "numberingStyle"    # Lcom/itextpdf/kernel/pdf/PageLabelNumberingStyle;
    .param p2, "labelPrefix"    # Ljava/lang/String;

    .line 1022
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lcom/itextpdf/kernel/pdf/PdfPage;->setPageLabel(Lcom/itextpdf/kernel/pdf/PageLabelNumberingStyle;Ljava/lang/String;I)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v0

    return-object v0
.end method

.method public setPageLabel(Lcom/itextpdf/kernel/pdf/PageLabelNumberingStyle;Ljava/lang/String;I)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 4
    .param p1, "numberingStyle"    # Lcom/itextpdf/kernel/pdf/PageLabelNumberingStyle;
    .param p2, "labelPrefix"    # Ljava/lang/String;
    .param p3, "firstPage"    # I

    .line 1036
    const/4 v0, 0x1

    if-lt p3, v0, :cond_3

    .line 1039
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 1040
    .local v1, "pageLabel":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz p1, :cond_0

    .line 1041
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfPage$1;->$SwitchMap$com$itextpdf$kernel$pdf$PageLabelNumberingStyle:[I

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PageLabelNumberingStyle;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    goto :goto_0

    .line 1055
    :pswitch_0
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->a:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1056
    goto :goto_0

    .line 1052
    :pswitch_1
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->A:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1053
    goto :goto_0

    .line 1049
    :pswitch_2
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->r:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1050
    goto :goto_0

    .line 1046
    :pswitch_3
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->R:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1047
    goto :goto_0

    .line 1043
    :pswitch_4
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1044
    nop

    .line 1060
    :cond_0
    :goto_0
    if-eqz p2, :cond_1

    .line 1061
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->P:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v3, p2}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1064
    :cond_1
    if-eq p3, v0, :cond_2

    .line 1065
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->St:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v3, p3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1067
    :cond_2
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPageLabelsTree(Z)Lcom/itextpdf/kernel/pdf/PdfNumTree;

    move-result-object v2

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v3

    invoke-virtual {v3, p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPageNumber(Lcom/itextpdf/kernel/pdf/PdfPage;)I

    move-result v3

    sub-int/2addr v3, v0

    invoke-virtual {v2, v3, v1}, Lcom/itextpdf/kernel/pdf/PdfNumTree;->addEntry(ILcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 1068
    return-object p0

    .line 1037
    .end local v1    # "pageLabel":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_3
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "In a page label the page numbers must be greater or equal to 1."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setPageRotationInverseMatrixWritten()V
    .locals 1

    .line 1191
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfPage;->pageRotationInverseMatrixWritten:Z

    .line 1192
    return-void
.end method

.method public setResources(Lcom/itextpdf/kernel/pdf/PdfResources;)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 2
    .param p1, "pdfResources"    # Lcom/itextpdf/kernel/pdf/PdfResources;

    .line 304
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Resources:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfResources;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfPage;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 305
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfPage;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    .line 306
    return-object p0
.end method

.method public setRotation(I)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 2
    .param p1, "degAngle"    # I

    .line 164
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Rotate:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfPage;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 165
    return-object p0
.end method

.method public setTabOrder(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 1
    .param p1, "tabOrder"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 1081
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Tabs:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 1082
    return-object p0
.end method

.method public setThumbnailImage(Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 2
    .param p1, "thumb"    # Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;

    .line 1105
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Thumb:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfPage;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v0

    return-object v0
.end method

.method public setTrimBox(Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 2
    .param p1, "rectangle"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 694
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->TrimBox:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfPage;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 695
    return-object p0
.end method

.method public setXmpMetadata(Lcom/itextpdf/kernel/xmp/XMPMeta;)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 2
    .param p1, "xmpMeta"    # Lcom/itextpdf/kernel/xmp/XMPMeta;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 347
    new-instance v0, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    invoke-direct {v0}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;-><init>()V

    .line 348
    .local v0, "serializeOptions":Lcom/itextpdf/kernel/xmp/options/SerializeOptions;
    const/16 v1, 0x7d0

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->setPadding(I)Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    .line 349
    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfPage;->setXmpMetadata(Lcom/itextpdf/kernel/xmp/XMPMeta;Lcom/itextpdf/kernel/xmp/options/SerializeOptions;)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v1

    return-object v1
.end method

.method public setXmpMetadata(Lcom/itextpdf/kernel/xmp/XMPMeta;Lcom/itextpdf/kernel/xmp/options/SerializeOptions;)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 1
    .param p1, "xmpMeta"    # Lcom/itextpdf/kernel/xmp/XMPMeta;
    .param p2, "serializeOptions"    # Lcom/itextpdf/kernel/xmp/options/SerializeOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 335
    invoke-static {p1, p2}, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->serializeToBuffer(Lcom/itextpdf/kernel/xmp/XMPMeta;Lcom/itextpdf/kernel/xmp/options/SerializeOptions;)[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfPage;->setXmpMetadata([B)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v0

    return-object v0
.end method

.method public setXmpMetadata([B)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 3
    .param p1, "xmpMetadata"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 317
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;-><init>()V

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 318
    .local v0, "xmp":Lcom/itextpdf/kernel/pdf/PdfStream;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write([B)V

    .line 319
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Metadata:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 320
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->XML:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 321
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Metadata:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/kernel/pdf/PdfPage;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 322
    return-object p0
.end method

.method tryFlushPageTags()V
    .locals 3

    .line 1256
    :try_start_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    iget-boolean v0, v0, Lcom/itextpdf/kernel/pdf/PdfDocument;->isClosing:Z

    if-nez v0, :cond_0

    .line 1257
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getTagStructureContext()Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->flushPageTags(Lcom/itextpdf/kernel/pdf/PdfPage;)Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    .line 1259
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getStructTreeRoot()Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->savePageStructParentIndexIfNeeded(Lcom/itextpdf/kernel/pdf/PdfPage;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1263
    nop

    .line 1264
    return-void

    .line 1260
    :catch_0
    move-exception v0

    .line 1261
    .local v0, "ex":Ljava/lang/Exception;
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Tag structure flushing failed: it might be corrupted."

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method
