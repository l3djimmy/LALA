.class public Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter;
.super Ljava/lang/Object;
.source "DestinationResolverCopyFilter.java"

# interfaces
.implements Lcom/itextpdf/kernel/utils/ICopyFilter;


# static fields
.field private static final EXCLUDE_KEYS_ACTIONCOPY:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final fromDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

.field private final targetDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 37
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter;->EXCLUDE_KEYS_ACTIONCOPY:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 0
    .param p1, "fromDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "targetDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter;->fromDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 53
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter;->targetDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 54
    return-void
.end method

.method private static getDirectPdfObject(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 2
    .param p0, "value"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 127
    move-object v0, p0

    .line 128
    .local v0, "workRef":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isIndirectReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 129
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getRefersTo()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 131
    :cond_0
    return-object v0
.end method

.method static synthetic lambda$processAction$5(Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;)V
    .locals 0
    .param p0, "od"    # Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;

    .line 123
    return-void
.end method

.method static synthetic lambda$processLinkAnnotion$1(Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;)V
    .locals 0
    .param p0, "od"    # Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;

    .line 84
    return-void
.end method

.method static synthetic lambda$processLinkAnnotion$3(Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;)V
    .locals 0
    .param p0, "od"    # Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;

    .line 99
    return-void
.end method

.method private processAction(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 5
    .param p1, "newParent"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p2, "name"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p3, "dict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 106
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p3, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 107
    .local v0, "destination":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v0, :cond_1

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfNull;->PDF_NULL:Lcom/itextpdf/kernel/pdf/PdfNull;

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfNull;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 110
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter;->fromDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 111
    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;->makeDestination(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;

    move-result-object v2

    new-instance v3, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0, p3, p1, p2}, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter$$ExternalSyntheticLambda0;-><init>(Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfName;)V

    new-instance v4, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter$$ExternalSyntheticLambda1;

    invoke-direct {v4}, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter$$ExternalSyntheticLambda1;-><init>()V

    .line 110
    invoke-virtual {v1, v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDocument;->storeDestinationToReaddress(Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;Ljava/util/function/Consumer;Ljava/util/function/Consumer;)V

    .line 124
    return-void

    .line 108
    :cond_1
    :goto_0
    return-void
.end method

.method private processLinkAnnotion(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Z
    .locals 6
    .param p1, "newParent"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p2, "value"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p3, "dict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 75
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Dest:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p3, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 76
    .local v0, "destination":Lcom/itextpdf/kernel/pdf/PdfObject;
    const/4 v1, 0x0

    if-eqz v0, :cond_0

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfNull;->PDF_NULL:Lcom/itextpdf/kernel/pdf/PdfNull;

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 77
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter;->fromDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 78
    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;->makeDestination(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;

    move-result-object v3

    new-instance v4, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter$$ExternalSyntheticLambda2;

    invoke-direct {v4, p0, p2, p1}, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter$$ExternalSyntheticLambda2;-><init>(Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfObject;)V

    new-instance v5, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter$$ExternalSyntheticLambda3;

    invoke-direct {v5}, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter$$ExternalSyntheticLambda3;-><init>()V

    .line 77
    invoke-virtual {v2, v3, v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDocument;->storeDestinationToReaddress(Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;Ljava/util/function/Consumer;Ljava/util/function/Consumer;)V

    .line 85
    return v1

    .line 87
    :cond_0
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->A:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p3, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    if-eqz v2, :cond_1

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->A:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p3, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    if-eqz v2, :cond_1

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfNull;->PDF_NULL:Lcom/itextpdf/kernel/pdf/PdfNull;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->A:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 88
    invoke-virtual {p3, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v3

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNull;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->GoToR:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->A:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 89
    invoke-virtual {p3, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v3

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 90
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter;->fromDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->A:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 91
    invoke-virtual {p3, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v3

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    invoke-static {v3}, Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;->makeDestination(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;

    move-result-object v3

    new-instance v4, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter$$ExternalSyntheticLambda4;

    invoke-direct {v4, p0, p2, p1}, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter$$ExternalSyntheticLambda4;-><init>(Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfObject;)V

    new-instance v5, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter$$ExternalSyntheticLambda5;

    invoke-direct {v5}, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter$$ExternalSyntheticLambda5;-><init>()V

    .line 90
    invoke-virtual {v2, v3, v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDocument;->storeDestinationToReaddress(Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;Ljava/util/function/Consumer;Ljava/util/function/Consumer;)V

    .line 100
    return v1

    .line 102
    :cond_1
    const/4 v1, 0x1

    return v1
.end method


# virtual methods
.method synthetic lambda$processAction$4$com-itextpdf-kernel-pdf-DestinationResolverCopyFilter(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;)V
    .locals 4
    .param p1, "dict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "newParent"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p3, "name"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p4, "nd"    # Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;

    .line 113
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter;->targetDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    sget-object v1, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter;->EXCLUDE_KEYS_ACTIONCOPY:Ljava/util/List;

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/util/List;Z)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 114
    .local v0, "newVal":Lcom/itextpdf/kernel/pdf/PdfObject;
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p4}, Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 116
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_0

    .line 117
    move-object v1, p2

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v1, p3, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_0

    .line 119
    :cond_0
    move-object v1, p2

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 121
    :goto_0
    return-void
.end method

.method synthetic lambda$processLinkAnnotion$0$com-itextpdf-kernel-pdf-DestinationResolverCopyFilter(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;)V
    .locals 5
    .param p1, "value"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p2, "newParent"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p3, "nd"    # Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;

    .line 79
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter;->targetDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {p1, v0, p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/utils/ICopyFilter;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 80
    .local v0, "newVal":Lcom/itextpdf/kernel/pdf/PdfObject;
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfPage;

    move-object v2, p2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfPage;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 81
    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->makeAnnotation(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, -0x1

    invoke-virtual {v1, v4, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfPage;->addAnnotation(ILcom/itextpdf/kernel/pdf/annot/PdfAnnotation;Z)Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 82
    return-void
.end method

.method synthetic lambda$processLinkAnnotion$2$com-itextpdf-kernel-pdf-DestinationResolverCopyFilter(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;)V
    .locals 5
    .param p1, "value"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p2, "newParent"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p3, "nd"    # Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;

    .line 93
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter;->targetDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 94
    .local v0, "newAnnot":Lcom/itextpdf/kernel/pdf/PdfObject;
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->A:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p3}, Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 95
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfPage;

    move-object v2, p2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfPage;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 96
    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->makeAnnotation(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, -0x1

    invoke-virtual {v1, v4, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfPage;->addAnnotation(ILcom/itextpdf/kernel/pdf/annot/PdfAnnotation;Z)Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 97
    return-void
.end method

.method public shouldProcess(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Z
    .locals 4
    .param p1, "newParent"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p2, "name"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p3, "value"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 58
    invoke-static {p3}, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter;->getDirectPdfObject(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 59
    .local v0, "workRef":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_1

    .line 60
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 62
    .local v1, "dict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v2

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->GoTo:Lcom/itextpdf/kernel/pdf/PdfName;

    if-ne v2, v3, :cond_0

    .line 63
    invoke-direct {p0, p1, p2, v1}, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter;->processAction(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 64
    const/4 v2, 0x0

    return v2

    .line 67
    :cond_0
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Link:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isDictionary()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 68
    invoke-direct {p0, p1, p3, v1}, Lcom/itextpdf/kernel/pdf/DestinationResolverCopyFilter;->processLinkAnnotion(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Z

    move-result v2

    return v2

    .line 71
    .end local v1    # "dict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_1
    const/4 v1, 0x1

    return v1
.end method
