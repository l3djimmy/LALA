.class public Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;
.super Ljava/lang/Object;
.source "ObjectPath.java"


# instance fields
.field private baseCmpObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

.field private baseOutObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

.field private indirects:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack<",
            "Lcom/itextpdf/kernel/utils/objectpathitems/IndirectPathItem;",
            ">;"
        }
    .end annotation
.end field

.field protected path:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack<",
            "Lcom/itextpdf/kernel/utils/objectpathitems/LocalPathItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->path:Ljava/util/Stack;

    .line 51
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->indirects:Ljava/util/Stack;

    .line 57
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)V
    .locals 2
    .param p1, "baseCmpObject"    # Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .param p2, "baseOutObject"    # Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->path:Ljava/util/Stack;

    .line 51
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->indirects:Ljava/util/Stack;

    .line 78
    iput-object p1, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseCmpObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 79
    iput-object p2, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseOutObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 80
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->indirects:Ljava/util/Stack;

    new-instance v1, Lcom/itextpdf/kernel/utils/objectpathitems/IndirectPathItem;

    invoke-direct {v1, p1, p2}, Lcom/itextpdf/kernel/utils/objectpathitems/IndirectPathItem;-><init>(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)V

    invoke-virtual {v0, v1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;Lcom/itextpdf/kernel/pdf/PdfIndirectReference;Ljava/util/Stack;Ljava/util/Stack;)V
    .locals 1
    .param p1, "baseCmpObject"    # Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .param p2, "baseOutObject"    # Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            "Ljava/util/Stack<",
            "Lcom/itextpdf/kernel/utils/objectpathitems/LocalPathItem;",
            ">;",
            "Ljava/util/Stack<",
            "Lcom/itextpdf/kernel/utils/objectpathitems/IndirectPathItem;",
            ">;)V"
        }
    .end annotation

    .line 84
    .local p3, "path":Ljava/util/Stack;, "Ljava/util/Stack<Lcom/itextpdf/kernel/utils/objectpathitems/LocalPathItem;>;"
    .local p4, "indirects":Ljava/util/Stack;, "Ljava/util/Stack<Lcom/itextpdf/kernel/utils/objectpathitems/IndirectPathItem;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->path:Ljava/util/Stack;

    .line 51
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->indirects:Ljava/util/Stack;

    .line 85
    iput-object p1, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseCmpObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 86
    iput-object p2, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseOutObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 87
    invoke-virtual {p3}, Ljava/util/Stack;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Stack;

    iput-object v0, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->path:Ljava/util/Stack;

    .line 88
    invoke-virtual {p4}, Ljava/util/Stack;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Stack;

    iput-object v0, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->indirects:Ljava/util/Stack;

    .line 89
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;)V
    .locals 1
    .param p1, "objectPath"    # Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->path:Ljava/util/Stack;

    .line 51
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->indirects:Ljava/util/Stack;

    .line 65
    invoke-virtual {p1}, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->getBaseCmpObject()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseCmpObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 66
    invoke-virtual {p1}, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->getBaseOutObject()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseOutObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 67
    invoke-virtual {p1}, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->getLocalPath()Ljava/util/Stack;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->path:Ljava/util/Stack;

    .line 68
    invoke-virtual {p1}, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->getIndirectPath()Ljava/util/Stack;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->indirects:Ljava/util/Stack;

    .line 69
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .param p1, "obj"    # Ljava/lang/Object;

    .line 282
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    .line 283
    return v0

    .line 285
    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_b

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto/16 :goto_7

    .line 288
    :cond_1
    move-object v2, p1

    check-cast v2, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;

    .line 295
    .local v2, "that":Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;
    iget-object v3, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseCmpObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    iget-object v4, v2, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseCmpObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    if-ne v3, v4, :cond_2

    .line 296
    const/4 v3, 0x1

    .local v3, "isBaseCmpObjectEqual":Z
    goto :goto_2

    .line 297
    .end local v3    # "isBaseCmpObjectEqual":Z
    :cond_2
    iget-object v3, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseCmpObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    if-eqz v3, :cond_5

    iget-object v3, v2, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseCmpObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    if-eqz v3, :cond_5

    iget-object v3, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseCmpObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 299
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    iget-object v4, v2, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseCmpObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    goto :goto_1

    .line 302
    :cond_3
    iget-object v3, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseCmpObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getObjNumber()I

    move-result v3

    iget-object v4, v2, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseCmpObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getObjNumber()I

    move-result v4

    if-ne v3, v4, :cond_4

    iget-object v3, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseCmpObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 303
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getGenNumber()I

    move-result v3

    iget-object v4, v2, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseCmpObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getGenNumber()I

    move-result v4

    if-ne v3, v4, :cond_4

    move v3, v0

    goto :goto_0

    :cond_4
    move v3, v1

    .restart local v3    # "isBaseCmpObjectEqual":Z
    :goto_0
    goto :goto_2

    .line 300
    .end local v3    # "isBaseCmpObjectEqual":Z
    :cond_5
    :goto_1
    const/4 v3, 0x0

    .line 306
    .restart local v3    # "isBaseCmpObjectEqual":Z
    :goto_2
    iget-object v4, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseOutObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    iget-object v5, v2, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseOutObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    if-ne v4, v5, :cond_6

    .line 307
    const/4 v4, 0x1

    .local v4, "isBaseOutObjectEqual":Z
    goto :goto_5

    .line 308
    .end local v4    # "isBaseOutObjectEqual":Z
    :cond_6
    iget-object v4, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseOutObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    if-eqz v4, :cond_9

    iget-object v4, v2, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseOutObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    if-eqz v4, :cond_9

    iget-object v4, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseOutObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 310
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    iget-object v5, v2, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseOutObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    if-eq v4, v5, :cond_7

    goto :goto_4

    .line 313
    :cond_7
    iget-object v4, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseOutObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getObjNumber()I

    move-result v4

    iget-object v5, v2, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseOutObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getObjNumber()I

    move-result v5

    if-ne v4, v5, :cond_8

    iget-object v4, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseOutObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 314
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getGenNumber()I

    move-result v4

    iget-object v5, v2, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseOutObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getGenNumber()I

    move-result v5

    if-ne v4, v5, :cond_8

    move v4, v0

    goto :goto_3

    :cond_8
    move v4, v1

    .restart local v4    # "isBaseOutObjectEqual":Z
    :goto_3
    goto :goto_5

    .line 311
    .end local v4    # "isBaseOutObjectEqual":Z
    :cond_9
    :goto_4
    const/4 v4, 0x0

    .line 317
    .restart local v4    # "isBaseOutObjectEqual":Z
    :goto_5
    if-eqz v3, :cond_a

    if-eqz v4, :cond_a

    iget-object v5, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->path:Ljava/util/Stack;

    move-object v6, p1

    check-cast v6, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;

    iget-object v6, v6, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->path:Ljava/util/Stack;

    invoke-virtual {v5, v6}, Ljava/util/Stack;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_a

    goto :goto_6

    :cond_a
    move v0, v1

    :goto_6
    return v0

    .line 286
    .end local v2    # "that":Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;
    .end local v3    # "isBaseCmpObjectEqual":Z
    .end local v4    # "isBaseOutObjectEqual":Z
    :cond_b
    :goto_7
    return v1
.end method

.method public getBaseCmpObject()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .locals 1

    .line 185
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseCmpObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    return-object v0
.end method

.method public getBaseOutObject()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .locals 1

    .line 194
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseOutObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    return-object v0
.end method

.method public getIndirectPath()Ljava/util/Stack;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Stack<",
            "Lcom/itextpdf/kernel/utils/objectpathitems/IndirectPathItem;",
            ">;"
        }
    .end annotation

    .line 176
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->indirects:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Stack;

    return-object v0
.end method

.method public getLocalPath()Ljava/util/Stack;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Stack<",
            "Lcom/itextpdf/kernel/utils/objectpathitems/LocalPathItem;",
            ">;"
        }
    .end annotation

    .line 166
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->path:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Stack;

    return-object v0
.end method

.method public hashCode()I
    .locals 6

    .line 258
    const/4 v0, 0x0

    .line 259
    .local v0, "baseCmpObjectHashCode":I
    iget-object v1, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseCmpObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    if-eqz v1, :cond_0

    .line 260
    iget-object v1, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseCmpObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getObjNumber()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    iget-object v2, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseCmpObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getGenNumber()I

    move-result v2

    add-int v0, v1, v2

    .line 262
    :cond_0
    const/4 v1, 0x0

    .line 263
    .local v1, "baseOutObjectHashCode":I
    iget-object v2, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseOutObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    if-eqz v2, :cond_1

    .line 264
    iget-object v2, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseOutObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getObjNumber()I

    move-result v2

    mul-int/lit8 v2, v2, 0x1f

    iget-object v3, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseOutObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getGenNumber()I

    move-result v3

    add-int v1, v2, v3

    .line 267
    :cond_1
    mul-int/lit8 v2, v0, 0x1f

    add-int/2addr v2, v1

    .line 268
    .local v2, "hashCode":I
    iget-object v3, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->path:Ljava/util/Stack;

    invoke-virtual {v3}, Ljava/util/Stack;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/utils/objectpathitems/LocalPathItem;

    .line 269
    .local v4, "pathItem":Lcom/itextpdf/kernel/utils/objectpathitems/LocalPathItem;
    mul-int/lit8 v2, v2, 0x1f

    .line 270
    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    move-result v5

    add-int/2addr v2, v5

    .line 271
    .end local v4    # "pathItem":Lcom/itextpdf/kernel/utils/objectpathitems/LocalPathItem;
    goto :goto_0

    .line 272
    :cond_2
    return v2
.end method

.method public isComparing(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)Z
    .locals 2
    .param p1, "cmpObject"    # Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .param p2, "outObject"    # Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 122
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->indirects:Ljava/util/Stack;

    new-instance v1, Lcom/itextpdf/kernel/utils/objectpathitems/IndirectPathItem;

    invoke-direct {v1, p1, p2}, Lcom/itextpdf/kernel/utils/objectpathitems/IndirectPathItem;-><init>(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)V

    invoke-virtual {v0, v1}, Ljava/util/Stack;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public pop()V
    .locals 1

    .line 156
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->path:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    .line 157
    return-void
.end method

.method public pushArrayItemToPath(I)V
    .locals 2
    .param p1, "index"    # I

    .line 131
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->path:Ljava/util/Stack;

    new-instance v1, Lcom/itextpdf/kernel/utils/objectpathitems/ArrayPathItem;

    invoke-direct {v1, p1}, Lcom/itextpdf/kernel/utils/objectpathitems/ArrayPathItem;-><init>(I)V

    invoke-virtual {v0, v1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    return-void
.end method

.method public pushDictItemToPath(Lcom/itextpdf/kernel/pdf/PdfName;)V
    .locals 2
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 140
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->path:Ljava/util/Stack;

    new-instance v1, Lcom/itextpdf/kernel/utils/objectpathitems/DictPathItem;

    invoke-direct {v1, p1}, Lcom/itextpdf/kernel/utils/objectpathitems/DictPathItem;-><init>(Lcom/itextpdf/kernel/pdf/PdfName;)V

    invoke-virtual {v0, v1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    return-void
.end method

.method public pushOffsetToPath(I)V
    .locals 2
    .param p1, "offset"    # I

    .line 149
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->path:Ljava/util/Stack;

    new-instance v1, Lcom/itextpdf/kernel/utils/objectpathitems/OffsetPathItem;

    invoke-direct {v1, p1}, Lcom/itextpdf/kernel/utils/objectpathitems/OffsetPathItem;-><init>(I)V

    invoke-virtual {v0, v1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    return-void
.end method

.method public resetDirectPath(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;
    .locals 3
    .param p1, "baseCmpObject"    # Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .param p2, "baseOutObject"    # Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 106
    new-instance v0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;

    new-instance v1, Ljava/util/Stack;

    invoke-direct {v1}, Ljava/util/Stack;-><init>()V

    iget-object v2, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->indirects:Ljava/util/Stack;

    .line 107
    invoke-virtual {v2}, Ljava/util/Stack;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Stack;

    invoke-direct {v0, p1, p2, v1, v2}, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;-><init>(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;Lcom/itextpdf/kernel/pdf/PdfIndirectReference;Ljava/util/Stack;Ljava/util/Stack;)V

    .line 108
    .local v0, "newPath":Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;
    iget-object v1, v0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->indirects:Ljava/util/Stack;

    new-instance v2, Lcom/itextpdf/kernel/utils/objectpathitems/IndirectPathItem;

    invoke-direct {v2, p1, p2}, Lcom/itextpdf/kernel/utils/objectpathitems/IndirectPathItem;-><init>(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)V

    invoke-virtual {v1, v2}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 230
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 231
    .local v0, "sb":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseCmpObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    iget-object v2, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseOutObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "Base cmp object: {0} obj. Base out object: {1} obj"

    invoke-static {v2, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 234
    iget-object v1, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->path:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Stack;

    .line 235
    .local v1, "pathClone":Ljava/util/Stack;, "Ljava/util/Stack<Lcom/itextpdf/kernel/utils/objectpathitems/LocalPathItem;>;"
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->path:Ljava/util/Stack;

    invoke-virtual {v3}, Ljava/util/Stack;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 236
    .local v2, "localPathItems":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/utils/objectpathitems/LocalPathItem;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    iget-object v4, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->path:Ljava/util/Stack;

    invoke-virtual {v4}, Ljava/util/Stack;->size()I

    move-result v4

    if-ge v3, v4, :cond_0

    .line 237
    invoke-virtual {v1}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 236
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 239
    .end local v3    # "i":I
    :cond_0
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    .restart local v3    # "i":I
    :goto_1
    if-ltz v3, :cond_1

    .line 240
    const/16 v4, 0xa

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 241
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/utils/objectpathitems/LocalPathItem;

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 239
    add-int/lit8 v3, v3, -0x1

    goto :goto_1

    .line 243
    .end local v3    # "i":I
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public toXmlNode(Lorg/w3c/dom/Document;)Lorg/w3c/dom/Node;
    .locals 6
    .param p1, "document"    # Lorg/w3c/dom/Document;

    .line 204
    const-string/jumbo v0, "path"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 205
    .local v0, "element":Lorg/w3c/dom/Element;
    const-string v1, "base"

    invoke-interface {p1, v1}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    .line 206
    .local v1, "baseNode":Lorg/w3c/dom/Element;
    iget-object v2, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseCmpObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getObjNumber()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget-object v3, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseCmpObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 207
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getGenNumber()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v2, v3}, [Ljava/lang/Object;

    move-result-object v2

    .line 206
    const-string/jumbo v3, "{0} {1} obj"

    invoke-static {v3, v2}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const-string v4, "cmp"

    invoke-interface {v1, v4, v2}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    iget-object v2, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseOutObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getObjNumber()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget-object v4, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->baseOutObject:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 209
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getGenNumber()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v2, v4}, [Ljava/lang/Object;

    move-result-object v2

    .line 208
    invoke-static {v3, v2}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "out"

    invoke-interface {v1, v3, v2}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 210
    invoke-interface {v0, v1}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 211
    iget-object v2, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->path:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Stack;

    .line 212
    .local v2, "pathClone":Ljava/util/Stack;, "Ljava/util/Stack<Lcom/itextpdf/kernel/utils/objectpathitems/LocalPathItem;>;"
    new-instance v3, Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->path:Ljava/util/Stack;

    invoke-virtual {v4}, Ljava/util/Stack;->size()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 213
    .local v3, "localPathItems":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/utils/objectpathitems/LocalPathItem;>;"
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    iget-object v5, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->path:Ljava/util/Stack;

    invoke-virtual {v5}, Ljava/util/Stack;->size()I

    move-result v5

    if-ge v4, v5, :cond_0

    .line 214
    invoke-virtual {v2}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 213
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 217
    .end local v4    # "i":I
    :cond_0
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    .restart local v4    # "i":I
    :goto_1
    if-ltz v4, :cond_1

    .line 218
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/utils/objectpathitems/LocalPathItem;

    invoke-virtual {v5, p1}, Lcom/itextpdf/kernel/utils/objectpathitems/LocalPathItem;->toXmlNode(Lorg/w3c/dom/Document;)Lorg/w3c/dom/Node;

    move-result-object v5

    invoke-interface {v0, v5}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 217
    add-int/lit8 v4, v4, -0x1

    goto :goto_1

    .line 220
    .end local v4    # "i":I
    :cond_1
    return-object v0
.end method
