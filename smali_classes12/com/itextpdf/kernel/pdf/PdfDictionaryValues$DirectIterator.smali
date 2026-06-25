.class Lcom/itextpdf/kernel/pdf/PdfDictionaryValues$DirectIterator;
.super Ljava/lang/Object;
.source "PdfDictionaryValues.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/PdfDictionaryValues;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DirectIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Lcom/itextpdf/kernel/pdf/PdfObject;",
        ">;"
    }
.end annotation


# instance fields
.field parentIterator:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator<",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/Iterator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator<",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;)V"
        }
    .end annotation

    .line 90
    .local p1, "parentIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfDictionaryValues$DirectIterator;->parentIterator:Ljava/util/Iterator;

    .line 92
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .line 96
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDictionaryValues$DirectIterator;->parentIterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public next()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 3

    .line 101
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDictionaryValues$DirectIterator;->parentIterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 102
    .local v0, "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isIndirectReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 103
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getRefersTo(Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 105
    :cond_0
    return-object v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .line 87
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDictionaryValues$DirectIterator;->next()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 1

    .line 110
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDictionaryValues$DirectIterator;->parentIterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 111
    return-void
.end method
