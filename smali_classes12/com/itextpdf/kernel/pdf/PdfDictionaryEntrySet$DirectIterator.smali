.class Lcom/itextpdf/kernel/pdf/PdfDictionaryEntrySet$DirectIterator;
.super Ljava/lang/Object;
.source "PdfDictionaryEntrySet.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/PdfDictionaryEntrySet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DirectIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Ljava/util/Map$Entry<",
        "Lcom/itextpdf/kernel/pdf/PdfName;",
        "Lcom/itextpdf/kernel/pdf/PdfObject;",
        ">;>;"
    }
.end annotation


# instance fields
.field parentIterator:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator<",
            "Ljava/util/Map$Entry<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Iterator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator<",
            "Ljava/util/Map$Entry<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;>;)V"
        }
    .end annotation

    .line 67
    .local p1, "parentIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfDictionaryEntrySet$DirectIterator;->parentIterator:Ljava/util/Iterator;

    .line 69
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .line 73
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDictionaryEntrySet$DirectIterator;->parentIterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .line 64
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDictionaryEntrySet$DirectIterator;->next()Ljava/util/Map$Entry;

    move-result-object v0

    return-object v0
.end method

.method public next()Ljava/util/Map$Entry;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;"
        }
    .end annotation

    .line 78
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionaryEntrySet$DirectEntry;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDictionaryEntrySet$DirectIterator;->parentIterator:Ljava/util/Iterator;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionaryEntrySet$DirectEntry;-><init>(Ljava/util/Map$Entry;)V

    return-object v0
.end method

.method public remove()V
    .locals 1

    .line 83
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDictionaryEntrySet$DirectIterator;->parentIterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 84
    return-void
.end method
