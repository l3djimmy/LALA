.class Lcom/itextpdf/kernel/pdf/PdfArrayDirectIterator;
.super Ljava/lang/Object;
.source "PdfArrayDirectIterator.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Lcom/itextpdf/kernel/pdf/PdfObject;",
        ">;"
    }
.end annotation


# instance fields
.field array:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator<",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;)V"
        }
    .end annotation

    .line 31
    .local p1, "array":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfArrayDirectIterator;->array:Ljava/util/Iterator;

    .line 33
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .line 37
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfArrayDirectIterator;->array:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public next()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 3

    .line 42
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfArrayDirectIterator;->array:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 43
    .local v0, "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isIndirectReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 44
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getRefersTo(Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 46
    :cond_0
    return-object v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .line 28
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfArrayDirectIterator;->next()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfArrayDirectIterator;->array:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 52
    return-void
.end method
