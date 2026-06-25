.class public Lcom/itextpdf/kernel/utils/PdfMerger;
.super Ljava/lang/Object;
.source "PdfMerger.java"


# instance fields
.field private pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

.field private properties:Lcom/itextpdf/kernel/utils/PdfMergerProperties;


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 1
    .param p1, "pdfDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 44
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0, v0}, Lcom/itextpdf/kernel/utils/PdfMerger;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;ZZ)V

    .line 45
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/utils/PdfMergerProperties;)V
    .locals 1
    .param p1, "pdfDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "properties"    # Lcom/itextpdf/kernel/utils/PdfMergerProperties;

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    iput-object p1, p0, Lcom/itextpdf/kernel/utils/PdfMerger;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 75
    if-eqz p2, :cond_0

    move-object v0, p2

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/utils/PdfMergerProperties;

    invoke-direct {v0}, Lcom/itextpdf/kernel/utils/PdfMergerProperties;-><init>()V

    :goto_0
    iput-object v0, p0, Lcom/itextpdf/kernel/utils/PdfMerger;->properties:Lcom/itextpdf/kernel/utils/PdfMergerProperties;

    .line 76
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;ZZ)V
    .locals 1
    .param p1, "pdfDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "mergeTags"    # Z
    .param p3, "mergeOutlines"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    iput-object p1, p0, Lcom/itextpdf/kernel/utils/PdfMerger;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 63
    new-instance v0, Lcom/itextpdf/kernel/utils/PdfMergerProperties;

    invoke-direct {v0}, Lcom/itextpdf/kernel/utils/PdfMergerProperties;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/utils/PdfMerger;->properties:Lcom/itextpdf/kernel/utils/PdfMergerProperties;

    .line 64
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/PdfMerger;->properties:Lcom/itextpdf/kernel/utils/PdfMergerProperties;

    invoke-virtual {v0, p2}, Lcom/itextpdf/kernel/utils/PdfMergerProperties;->setMergeTags(Z)Lcom/itextpdf/kernel/utils/PdfMergerProperties;

    move-result-object v0

    invoke-virtual {v0, p3}, Lcom/itextpdf/kernel/utils/PdfMergerProperties;->setMergeOutlines(Z)Lcom/itextpdf/kernel/utils/PdfMergerProperties;

    .line 65
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    .line 170
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/PdfMerger;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->close()V

    .line 171
    return-void
.end method

.method public merge(Lcom/itextpdf/kernel/pdf/PdfDocument;II)Lcom/itextpdf/kernel/utils/PdfMerger;
    .locals 3
    .param p1, "from"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "fromPage"    # I
    .param p3, "toPage"    # I

    .line 105
    new-instance v0, Ljava/util/ArrayList;

    sub-int v1, p3, p2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 106
    .local v0, "pages":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    move v1, p2

    .local v1, "pageNum":I
    :goto_0
    if-gt v1, p3, :cond_0

    .line 107
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 106
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 109
    .end local v1    # "pageNum":I
    :cond_0
    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/utils/PdfMerger;->merge(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/util/List;)Lcom/itextpdf/kernel/utils/PdfMerger;

    move-result-object v1

    return-object v1
.end method

.method public merge(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/util/List;)Lcom/itextpdf/kernel/utils/PdfMerger;
    .locals 1
    .param p1, "from"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)",
            "Lcom/itextpdf/kernel/utils/PdfMerger;"
        }
    .end annotation

    .line 125
    .local p2, "pages":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/itextpdf/kernel/utils/PdfMerger;->merge(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/util/List;Lcom/itextpdf/kernel/pdf/IPdfPageExtraCopier;)Lcom/itextpdf/kernel/utils/PdfMerger;

    move-result-object v0

    return-object v0
.end method

.method public merge(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/util/List;Lcom/itextpdf/kernel/pdf/IPdfPageExtraCopier;)Lcom/itextpdf/kernel/utils/PdfMerger;
    .locals 1
    .param p1, "from"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p3, "copier"    # Lcom/itextpdf/kernel/pdf/IPdfPageExtraCopier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/itextpdf/kernel/pdf/IPdfPageExtraCopier;",
            ")",
            "Lcom/itextpdf/kernel/utils/PdfMerger;"
        }
    .end annotation

    .line 144
    .local p2, "pages":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/PdfMerger;->properties:Lcom/itextpdf/kernel/utils/PdfMergerProperties;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/utils/PdfMergerProperties;->isMergeTags()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->isTagged()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 145
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/PdfMerger;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->setTagged()Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 147
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/PdfMerger;->properties:Lcom/itextpdf/kernel/utils/PdfMergerProperties;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/utils/PdfMergerProperties;->isMergeOutlines()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->hasOutlines()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 148
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/PdfMerger;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->initializeOutlines()V

    .line 150
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/PdfMerger;->properties:Lcom/itextpdf/kernel/utils/PdfMergerProperties;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/utils/PdfMergerProperties;->isMergeScripts()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 151
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/PdfMerger;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-static {p1, v0}, Lcom/itextpdf/kernel/utils/PdfScriptMerger;->mergeScripts(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 154
    :cond_2
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/PdfMerger;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {p1, p2, v0, p3}, Lcom/itextpdf/kernel/pdf/PdfDocument;->copyPagesTo(Ljava/util/List;Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/IPdfPageExtraCopier;)Ljava/util/List;

    .line 155
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/PdfMerger;->properties:Lcom/itextpdf/kernel/utils/PdfMergerProperties;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/utils/PdfMergerProperties;->isCloseSrcDocuments()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 156
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->close()V

    .line 158
    :cond_3
    return-object p0
.end method

.method public setCloseSourceDocuments(Z)Lcom/itextpdf/kernel/utils/PdfMerger;
    .locals 1
    .param p1, "closeSourceDocuments"    # Z

    .line 87
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/PdfMerger;->properties:Lcom/itextpdf/kernel/utils/PdfMergerProperties;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/utils/PdfMergerProperties;->setCloseSrcDocuments(Z)Lcom/itextpdf/kernel/utils/PdfMergerProperties;

    .line 88
    return-object p0
.end method
