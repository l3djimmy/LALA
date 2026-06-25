.class Lcom/itextpdf/kernel/pdf/PdfRevisionsReader$RevisionsXrefProcessor;
.super Lcom/itextpdf/kernel/pdf/PdfReader$XrefProcessor;
.source "PdfRevisionsReader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/PdfRevisionsReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "RevisionsXrefProcessor"
.end annotation


# instance fields
.field private final documentRevisions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/DocumentRevision;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    .line 83
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/PdfReader$XrefProcessor;-><init>()V

    .line 84
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfRevisionsReader$RevisionsXrefProcessor;->documentRevisions:Ljava/util/List;

    return-void
.end method


# virtual methods
.method getDocumentRevisions()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/DocumentRevision;",
            ">;"
        }
    .end annotation

    .line 100
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfRevisionsReader$RevisionsXrefProcessor;->documentRevisions:Ljava/util/List;

    return-object v0
.end method

.method processXref(Lcom/itextpdf/kernel/pdf/PdfXrefTable;Lcom/itextpdf/io/source/PdfTokenizer;)V
    .locals 5
    .param p1, "xrefTable"    # Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    .param p2, "tokenizer"    # Lcom/itextpdf/io/source/PdfTokenizer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 88
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 89
    .local v0, "modifiedObjects":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 90
    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->get(I)Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 91
    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->get(I)Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 89
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 94
    .end local v1    # "i":I
    :cond_1
    invoke-virtual {p2}, Lcom/itextpdf/io/source/PdfTokenizer;->getNextEof()J

    move-result-wide v1

    .line 95
    .local v1, "eofOffset":J
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfRevisionsReader$RevisionsXrefProcessor;->documentRevisions:Ljava/util/List;

    new-instance v4, Lcom/itextpdf/kernel/pdf/DocumentRevision;

    invoke-direct {v4, v1, v2, v0}, Lcom/itextpdf/kernel/pdf/DocumentRevision;-><init>(JLjava/util/Set;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 96
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->clearAllReferences()V

    .line 97
    return-void
.end method
