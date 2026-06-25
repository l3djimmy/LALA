.class public Lcom/itextpdf/kernel/utils/PdfAnnotationFlattener;
.super Ljava/lang/Object;
.source "PdfAnnotationFlattener.java"


# instance fields
.field private final pdfAnnotationFlattenFactory:Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    new-instance v0, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;

    invoke-direct {v0}, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/utils/PdfAnnotationFlattener;->pdfAnnotationFlattenFactory:Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;

    .line 61
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;)V
    .locals 0
    .param p1, "pdfAnnotationFlattenFactory"    # Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object p1, p0, Lcom/itextpdf/kernel/utils/PdfAnnotationFlattener;->pdfAnnotationFlattenFactory:Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;

    .line 53
    return-void
.end method


# virtual methods
.method public flatten(Lcom/itextpdf/kernel/pdf/PdfDocument;)Ljava/util/List;
    .locals 5
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            ")",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;",
            ">;"
        }
    .end annotation

    .line 106
    if-eqz p1, :cond_1

    .line 110
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 112
    .local v0, "annotations":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;>;"
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPages()I

    move-result v1

    .line 113
    .local v1, "documentNumberOfPages":I
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_0
    if-gt v2, v1, :cond_0

    .line 114
    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPage(I)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v3

    .line 115
    .local v3, "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfPage;->getAnnotations()Ljava/util/List;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/itextpdf/kernel/utils/PdfAnnotationFlattener;->flatten(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    .line 116
    .local v4, "failedFlatteningAnnotations":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;>;"
    invoke-interface {v0, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 113
    .end local v3    # "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    .end local v4    # "failedFlatteningAnnotations":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;>;"
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 118
    .end local v2    # "i":I
    :cond_0
    return-object v0

    .line 107
    .end local v0    # "annotations":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;>;"
    .end local v1    # "documentNumberOfPages":I
    :cond_1
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "document"

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    .line 108
    const-string/jumbo v2, "{0} should not be null."

    invoke-static {v2, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public flatten(Ljava/util/List;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;",
            ">;"
        }
    .end annotation

    .line 72
    .local p1, "annotationsToFlatten":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;>;"
    if-eqz p1, :cond_4

    .line 77
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 78
    .local v0, "unFlattenedAnnotations":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    .line 79
    .local v2, "pdfAnnotation":Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    if-nez v2, :cond_0

    .line 80
    goto :goto_0

    .line 82
    :cond_0
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPage()Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v3

    .line 83
    .local v3, "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    if-nez v3, :cond_1

    .line 84
    goto :goto_0

    .line 86
    :cond_1
    iget-object v4, p0, Lcom/itextpdf/kernel/utils/PdfAnnotationFlattener;->pdfAnnotationFlattenFactory:Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;

    .line 87
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getSubtype()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v5

    .line 86
    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/utils/annotationsflattening/PdfAnnotationFlattenFactory;->getAnnotationFlattenWorker(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;

    move-result-object v4

    .line 88
    .local v4, "worker":Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;
    invoke-interface {v4, v2, v3}, Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;->flatten(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;Lcom/itextpdf/kernel/pdf/PdfPage;)Z

    move-result v5

    .line 89
    .local v5, "flattenedSuccessfully":Z
    if-nez v5, :cond_2

    .line 90
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 93
    .end local v2    # "pdfAnnotation":Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .end local v3    # "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    .end local v4    # "worker":Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;
    .end local v5    # "flattenedSuccessfully":Z
    :cond_2
    goto :goto_0

    .line 94
    :cond_3
    return-object v0

    .line 73
    .end local v0    # "unFlattenedAnnotations":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;>;"
    :cond_4
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "annotationsToFlatten"

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    .line 74
    const-string/jumbo v2, "{0} should not be null."

    invoke-static {v2, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
