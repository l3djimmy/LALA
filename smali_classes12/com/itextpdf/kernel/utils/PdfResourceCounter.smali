.class public Lcom/itextpdf/kernel/utils/PdfResourceCounter;
.super Ljava/lang/Object;
.source "PdfResourceCounter.java"


# instance fields
.field private resources:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V
    .locals 1
    .param p1, "obj"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/utils/PdfResourceCounter;->resources:Ljava/util/Map;

    .line 55
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/utils/PdfResourceCounter;->process(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 56
    return-void
.end method


# virtual methods
.method public getLength(Ljava/util/Map;)J
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;)J"
        }
    .end annotation

    .line 125
    .local p1, "res":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    const-wide/16 v0, 0x0

    .line 127
    .local v0, "length":J
    iget-object v2, p0, Lcom/itextpdf/kernel/utils/PdfResourceCounter;->resources:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 128
    .local v3, "ref":I
    if-eqz p1, :cond_0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {p1, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 129
    goto :goto_0

    .line 132
    :cond_0
    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    new-instance v5, Lcom/itextpdf/kernel/utils/IdleOutputStream;

    invoke-direct {v5}, Lcom/itextpdf/kernel/utils/IdleOutputStream;-><init>()V

    invoke-direct {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 134
    .local v4, "os":Lcom/itextpdf/kernel/pdf/PdfOutputStream;
    iget-object v5, p0, Lcom/itextpdf/kernel/utils/PdfResourceCounter;->resources:Ljava/util/Map;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfObject;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfObject;->clone()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 135
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->getCurrentPos()J

    move-result-wide v5

    add-long/2addr v0, v5

    .line 136
    .end local v3    # "ref":I
    .end local v4    # "os":Lcom/itextpdf/kernel/pdf/PdfOutputStream;
    goto :goto_0

    .line 138
    :cond_1
    return-wide v0
.end method

.method public getResources()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;"
        }
    .end annotation

    .line 112
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/PdfResourceCounter;->resources:Ljava/util/Map;

    return-object v0
.end method

.method protected final loopOver(Lcom/itextpdf/kernel/pdf/PdfObject;)V
    .locals 4
    .param p1, "obj"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 81
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v0

    sparse-switch v0, :sswitch_data_0

    goto :goto_2

    .line 92
    :sswitch_0
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 94
    .local v0, "dict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Pages:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 95
    goto :goto_2

    .line 98
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfName;

    .line 99
    .local v2, "name":Lcom/itextpdf/kernel/pdf/PdfName;
    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/itextpdf/kernel/utils/PdfResourceCounter;->process(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 100
    .end local v2    # "name":Lcom/itextpdf/kernel/pdf/PdfName;
    goto :goto_0

    .line 83
    .end local v0    # "dict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :sswitch_1
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 85
    .local v0, "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 86
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/utils/PdfResourceCounter;->process(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 85
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 89
    .end local v1    # "i":I
    :cond_1
    nop

    .line 104
    .end local v0    # "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    :cond_2
    :goto_2
    return-void

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_1
        0x3 -> :sswitch_0
        0x9 -> :sswitch_0
    .end sparse-switch
.end method

.method protected final process(Lcom/itextpdf/kernel/pdf/PdfObject;)V
    .locals 3
    .param p1, "obj"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 65
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    .line 66
    .local v0, "ref":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    if-nez v0, :cond_0

    .line 67
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/utils/PdfResourceCounter;->loopOver(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    goto :goto_0

    .line 68
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/kernel/utils/PdfResourceCounter;->resources:Ljava/util/Map;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getObjNumber()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 69
    iget-object v1, p0, Lcom/itextpdf/kernel/utils/PdfResourceCounter;->resources:Ljava/util/Map;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getObjNumber()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/utils/PdfResourceCounter;->loopOver(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 72
    :cond_1
    :goto_0
    return-void
.end method
