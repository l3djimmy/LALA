.class public final Lcom/itextpdf/kernel/actions/events/LinkDocumentIdEvent;
.super Lcom/itextpdf/commons/actions/AbstractITextConfigurationEvent;
.source "LinkDocumentIdEvent.java"


# instance fields
.field private final document:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            ">;"
        }
    .end annotation
.end field

.field private final sequenceId:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/itextpdf/commons/actions/sequence/SequenceId;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/commons/actions/sequence/AbstractIdentifiableElement;)V
    .locals 1
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "identifiableElement"    # Lcom/itextpdf/commons/actions/sequence/AbstractIdentifiableElement;

    .line 63
    if-nez p2, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-static {p2}, Lcom/itextpdf/commons/actions/sequence/SequenceIdManager;->getSequenceId(Lcom/itextpdf/commons/actions/sequence/AbstractIdentifiableElement;)Lcom/itextpdf/commons/actions/sequence/SequenceId;

    move-result-object v0

    :goto_0
    invoke-direct {p0, p1, v0}, Lcom/itextpdf/kernel/actions/events/LinkDocumentIdEvent;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/commons/actions/sequence/SequenceId;)V

    .line 64
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/commons/actions/sequence/SequenceId;)V
    .locals 1
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "sequenceId"    # Lcom/itextpdf/commons/actions/sequence/SequenceId;

    .line 50
    invoke-direct {p0}, Lcom/itextpdf/commons/actions/AbstractITextConfigurationEvent;-><init>()V

    .line 51
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/itextpdf/kernel/actions/events/LinkDocumentIdEvent;->document:Ljava/lang/ref/WeakReference;

    .line 52
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/itextpdf/kernel/actions/events/LinkDocumentIdEvent;->sequenceId:Ljava/lang/ref/WeakReference;

    .line 53
    return-void
.end method


# virtual methods
.method public doAction()V
    .locals 8

    .line 71
    iget-object v0, p0, Lcom/itextpdf/kernel/actions/events/LinkDocumentIdEvent;->sequenceId:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/commons/actions/sequence/SequenceId;

    .line 72
    .local v0, "storedSequenceId":Lcom/itextpdf/commons/actions/sequence/SequenceId;
    iget-object v1, p0, Lcom/itextpdf/kernel/actions/events/LinkDocumentIdEvent;->document:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 74
    .local v1, "storedPdfDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    if-eqz v0, :cond_3

    if-nez v1, :cond_0

    goto :goto_1

    .line 78
    :cond_0
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/actions/events/LinkDocumentIdEvent;->getEvents(Lcom/itextpdf/commons/actions/sequence/SequenceId;)Ljava/util/List;

    move-result-object v2

    .line 80
    .local v2, "anonymousEvents":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;>;"
    if-eqz v2, :cond_2

    .line 81
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getDocumentIdWrapper()Lcom/itextpdf/commons/actions/sequence/SequenceId;

    move-result-object v3

    .line 82
    .local v3, "documentId":Lcom/itextpdf/commons/actions/sequence/SequenceId;
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;

    .line 83
    .local v5, "event":Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;
    invoke-virtual {p0, v3}, Lcom/itextpdf/kernel/actions/events/LinkDocumentIdEvent;->getEvents(Lcom/itextpdf/commons/actions/sequence/SequenceId;)Ljava/util/List;

    move-result-object v6

    .line 84
    .local v6, "storedEvents":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;>;"
    invoke-interface {v6, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 85
    invoke-virtual {p0, v3, v5}, Lcom/itextpdf/kernel/actions/events/LinkDocumentIdEvent;->addEvent(Lcom/itextpdf/commons/actions/sequence/SequenceId;Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;)V

    .line 87
    .end local v5    # "event":Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;
    .end local v6    # "storedEvents":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;>;"
    :cond_1
    goto :goto_0

    .line 89
    .end local v3    # "documentId":Lcom/itextpdf/commons/actions/sequence/SequenceId;
    :cond_2
    return-void

    .line 75
    .end local v2    # "anonymousEvents":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;>;"
    :cond_3
    :goto_1
    return-void
.end method
