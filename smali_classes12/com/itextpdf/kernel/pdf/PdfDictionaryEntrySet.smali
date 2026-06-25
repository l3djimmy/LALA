.class Lcom/itextpdf/kernel/pdf/PdfDictionaryEntrySet;
.super Ljava/util/AbstractSet;
.source "PdfDictionaryEntrySet.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/pdf/PdfDictionaryEntrySet$DirectEntry;,
        Lcom/itextpdf/kernel/pdf/PdfDictionaryEntrySet$DirectIterator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractSet<",
        "Ljava/util/Map$Entry<",
        "Lcom/itextpdf/kernel/pdf/PdfName;",
        "Lcom/itextpdf/kernel/pdf/PdfObject;",
        ">;>;"
    }
.end annotation


# instance fields
.field private final set:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/util/Map$Entry<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/Set;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/util/Map$Entry<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;>;)V"
        }
    .end annotation

    .line 35
    .local p1, "set":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;>;>;"
    invoke-direct {p0}, Ljava/util/AbstractSet;-><init>()V

    .line 36
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfDictionaryEntrySet;->set:Ljava/util/Set;

    .line 37
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .line 61
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDictionaryEntrySet;->set:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 62
    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .line 41
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDictionaryEntrySet;->set:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-super {p0, p1}, Ljava/util/AbstractSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Ljava/util/Map$Entry<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;>;"
        }
    .end annotation

    .line 51
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionaryEntrySet$DirectIterator;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDictionaryEntrySet;->set:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionaryEntrySet$DirectIterator;-><init>(Ljava/util/Iterator;)V

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .line 46
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDictionaryEntrySet;->set:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-super {p0, p1}, Ljava/util/AbstractSet;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public size()I
    .locals 1

    .line 56
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDictionaryEntrySet;->set:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    return v0
.end method
