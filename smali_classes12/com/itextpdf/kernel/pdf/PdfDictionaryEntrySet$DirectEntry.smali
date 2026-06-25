.class Lcom/itextpdf/kernel/pdf/PdfDictionaryEntrySet$DirectEntry;
.super Ljava/lang/Object;
.source "PdfDictionaryEntrySet.java"

# interfaces
.implements Ljava/util/Map$Entry;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/PdfDictionaryEntrySet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DirectEntry"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Map$Entry<",
        "Lcom/itextpdf/kernel/pdf/PdfName;",
        "Lcom/itextpdf/kernel/pdf/PdfObject;",
        ">;"
    }
.end annotation


# instance fields
.field entry:Ljava/util/Map$Entry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map$Entry<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/Map$Entry;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;)V"
        }
    .end annotation

    .line 91
    .local p1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 92
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfDictionaryEntrySet$DirectEntry;->entry:Ljava/util/Map$Entry;

    .line 93
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .param p1, "o"    # Ljava/lang/Object;

    .line 116
    instance-of v0, p1, Ljava/util/Map$Entry;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 117
    return v1

    .line 118
    :cond_0
    move-object v0, p1

    check-cast v0, Ljava/util/Map$Entry;

    .line 119
    .local v0, "e":Ljava/util/Map$Entry;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDictionaryEntrySet$DirectEntry;->getKey()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v2

    .line 120
    .local v2, "k1":Ljava/lang/Object;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    .line 121
    .local v3, "k2":Ljava/lang/Object;
    if-eqz v2, :cond_1

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 122
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDictionaryEntrySet$DirectEntry;->getValue()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    .line 123
    .local v4, "v1":Ljava/lang/Object;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    .line 124
    .local v5, "v2":Ljava/lang/Object;
    if-eqz v4, :cond_1

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 125
    const/4 v1, 0x1

    return v1

    .line 127
    .end local v4    # "v1":Ljava/lang/Object;
    .end local v5    # "v2":Ljava/lang/Object;
    :cond_1
    return v1
.end method

.method public getKey()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 1

    .line 97
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDictionaryEntrySet$DirectEntry;->entry:Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0
.end method

.method public bridge synthetic getKey()Ljava/lang/Object;
    .locals 1

    .line 87
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDictionaryEntrySet$DirectEntry;->getKey()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    return-object v0
.end method

.method public getValue()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 3

    .line 102
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDictionaryEntrySet$DirectEntry;->entry:Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 103
    .local v0, "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isIndirectReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 104
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getRefersTo(Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 106
    :cond_0
    return-object v0
.end method

.method public bridge synthetic getValue()Ljava/lang/Object;
    .locals 1

    .line 87
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDictionaryEntrySet$DirectEntry;->getValue()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .line 132
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDictionaryEntrySet$DirectEntry;->getKey()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->hashCode(Ljava/lang/Object;)I

    move-result v0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDictionaryEntrySet$DirectEntry;->getValue()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Objects;->hashCode(Ljava/lang/Object;)I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method

.method public setValue(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1
    .param p1, "value"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 111
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDictionaryEntrySet$DirectEntry;->entry:Ljava/util/Map$Entry;

    invoke-interface {v0, p1}, Ljava/util/Map$Entry;->setValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfObject;

    return-object v0
.end method

.method public bridge synthetic setValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 87
    check-cast p1, Lcom/itextpdf/kernel/pdf/PdfObject;

    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionaryEntrySet$DirectEntry;->setValue(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object p1

    return-object p1
.end method
