.class Lcom/itextpdf/kernel/pdf/PdfDictionaryValues;
.super Ljava/util/AbstractCollection;
.source "PdfDictionaryValues.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/pdf/PdfDictionaryValues$DirectIterator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractCollection<",
        "Lcom/itextpdf/kernel/pdf/PdfObject;",
        ">;"
    }
.end annotation


# instance fields
.field private final collection:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection<",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/Collection;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;)V"
        }
    .end annotation

    .line 33
    .local p1, "collection":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    invoke-direct {p0}, Ljava/util/AbstractCollection;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfDictionaryValues;->collection:Ljava/util/Collection;

    .line 35
    return-void
.end method


# virtual methods
.method public add(Lcom/itextpdf/kernel/pdf/PdfObject;)Z
    .locals 1
    .param p1, "object"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 39
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDictionaryValues;->collection:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic add(Ljava/lang/Object;)Z
    .locals 0

    .line 29
    check-cast p1, Lcom/itextpdf/kernel/pdf/PdfObject;

    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionaryValues;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)Z

    move-result p1

    return p1
.end method

.method public clear()V
    .locals 1

    .line 79
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDictionaryValues;->collection:Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->clear()V

    .line 80
    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 44
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDictionaryValues;->collection:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 45
    return v1

    .line 46
    :cond_0
    const/4 v0, 0x0

    if-nez p1, :cond_1

    .line 47
    return v0

    .line 48
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDictionaryValues;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 49
    .local v3, "pdfObject":Lcom/itextpdf/kernel/pdf/PdfObject;
    move-object v4, p1

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfObject;

    invoke-static {v4, v3}, Lcom/itextpdf/kernel/pdf/PdfObject;->equalContent(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfObject;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 50
    return v1

    .line 52
    .end local v3    # "pdfObject":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_2
    goto :goto_0

    .line 53
    :cond_3
    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;"
        }
    .end annotation

    .line 84
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionaryValues$DirectIterator;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDictionaryValues;->collection:Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionaryValues$DirectIterator;-><init>(Ljava/util/Iterator;)V

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 58
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDictionaryValues;->collection:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 59
    return v1

    .line 60
    :cond_0
    const/4 v0, 0x0

    if-nez p1, :cond_1

    .line 61
    return v0

    .line 62
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDictionaryValues;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 63
    .local v2, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 64
    move-object v3, p1

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfObject;

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfObject;

    invoke-static {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfObject;->equalContent(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfObject;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 65
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 66
    return v1

    .line 69
    :cond_3
    return v0
.end method

.method public size()I
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDictionaryValues;->collection:Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v0

    return v0
.end method
