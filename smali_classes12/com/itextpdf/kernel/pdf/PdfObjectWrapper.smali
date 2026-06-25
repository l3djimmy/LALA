.class public abstract Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.super Ljava/lang/Object;
.source "PdfObjectWrapper.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/itextpdf/kernel/pdf/PdfObject;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private pdfObject:Lcom/itextpdf/kernel/pdf/PdfObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 34
    .local p0, "this":Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;, "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<TT;>;"
    .local p1, "pdfObject":Lcom/itextpdf/kernel/pdf/PdfObject;, "TT;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;->pdfObject:Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 35
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;->pdfObject:Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 36
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;->isWrappedObjectMustBeIndirect()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 37
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;->pdfObject:Lcom/itextpdf/kernel/pdf/PdfObject;

    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;->markObjectAsIndirect(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 39
    :cond_0
    return-void
.end method

.method protected static ensureObjectIsAddedToDocument(Lcom/itextpdf/kernel/pdf/PdfObject;)V
    .locals 2
    .param p0, "object"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 136
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 139
    return-void

    .line 137
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Object must be indirect to work with this wrapper."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected static markObjectAsIndirect(Lcom/itextpdf/kernel/pdf/PdfObject;)V
    .locals 1
    .param p0, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 120
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    if-nez v0, :cond_0

    .line 121
    const/16 v0, 0x40

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->setState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 123
    :cond_0
    return-void
.end method


# virtual methods
.method protected ensureUnderlyingObjectHasIndirectReference()V
    .locals 2

    .line 113
    .local p0, "this":Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;, "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<TT;>;"
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 117
    return-void

    .line 114
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "To manually flush this wrapper, you have to ensure that the object behind this wrapper is added to the document, i.e. it has an indirect reference."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public flush()V
    .locals 1

    .line 73
    .local p0, "this":Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;, "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;->pdfObject:Lcom/itextpdf/kernel/pdf/PdfObject;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->flush()V

    .line 74
    return-void
.end method

.method public getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 42
    .local p0, "this":Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;, "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;->pdfObject:Lcom/itextpdf/kernel/pdf/PdfObject;

    return-object v0
.end method

.method public isFlushed()Z
    .locals 1

    .line 77
    .local p0, "this":Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;, "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;->pdfObject:Lcom/itextpdf/kernel/pdf/PdfObject;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isFlushed()Z

    move-result v0

    return v0
.end method

.method protected abstract isWrappedObjectMustBeIndirect()Z
.end method

.method public makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
    .locals 1
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            ")",
            "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
            "TT;>;"
        }
    .end annotation

    .line 64
    .local p0, "this":Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;, "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<TT;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    move-result-object v0

    return-object v0
.end method

.method public makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
    .locals 1
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "reference"    # Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            ")",
            "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
            "TT;>;"
        }
    .end annotation

    .line 53
    .local p0, "this":Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;, "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<TT;>;"
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfObject;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 54
    return-object p0
.end method

.method protected setForbidRelease()V
    .locals 2

    .line 101
    .local p0, "this":Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;, "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;->pdfObject:Lcom/itextpdf/kernel/pdf/PdfObject;

    if-eqz v0, :cond_0

    .line 102
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;->pdfObject:Lcom/itextpdf/kernel/pdf/PdfObject;

    const/16 v1, 0x80

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfObject;->setState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 104
    :cond_0
    return-void
.end method

.method public setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
            "TT;>;"
        }
    .end annotation

    .line 68
    .local p0, "this":Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;, "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;->pdfObject:Lcom/itextpdf/kernel/pdf/PdfObject;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->setModified()Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 69
    return-object p0
.end method

.method protected setPdfObject(Lcom/itextpdf/kernel/pdf/PdfObject;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 97
    .local p0, "this":Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;, "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<TT;>;"
    .local p1, "pdfObject":Lcom/itextpdf/kernel/pdf/PdfObject;, "TT;"
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;->pdfObject:Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 98
    return-void
.end method

.method protected unsetForbidRelease()V
    .locals 2

    .line 107
    .local p0, "this":Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;, "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;->pdfObject:Lcom/itextpdf/kernel/pdf/PdfObject;

    if-eqz v0, :cond_0

    .line 108
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;->pdfObject:Lcom/itextpdf/kernel/pdf/PdfObject;

    const/16 v1, 0x80

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfObject;->clearState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 110
    :cond_0
    return-void
.end method
