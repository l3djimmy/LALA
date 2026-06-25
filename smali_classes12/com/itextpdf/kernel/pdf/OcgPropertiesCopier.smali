.class final Lcom/itextpdf/kernel/pdf/OcgPropertiesCopier;
.super Ljava/lang/Object;
.source "OcgPropertiesCopier.java"


# static fields
.field private static final LOGGER:Lorg/slf4j/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 43
    const-class v0, Lcom/itextpdf/kernel/pdf/OcgPropertiesCopier;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/OcgPropertiesCopier;->LOGGER:Lorg/slf4j/Logger;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    return-void
.end method

.method private static attemptToAddObjectToArray(Ljava/util/Set;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 2
    .param p1, "fromObj"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p2, "toArray"    # Lcom/itextpdf/kernel/pdf/PdfArray;
    .param p3, "toDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            ">;",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            "Lcom/itextpdf/kernel/pdf/PdfArray;",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            ")V"
        }
    .end annotation

    .line 280
    .local p0, "fromOcgsToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    .line 281
    .local v0, "fromObjRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    if-eqz v0, :cond_0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 282
    const/4 v1, 0x0

    invoke-virtual {p1, p3, v1}, Lcom/itextpdf/kernel/pdf/PdfObject;->copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {p2, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 284
    :cond_0
    return-void
.end method

.method private static copyDArrayField(Lcom/itextpdf/kernel/pdf/PdfName;Ljava/util/Set;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 11
    .param p0, "fieldToCopy"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "fromDict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p3, "toDict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p4, "toDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            ">;",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            ")V"
        }
    .end annotation

    .line 320
    .local p1, "fromOcgsToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    invoke-virtual {p2, p0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    if-nez v0, :cond_0

    .line 321
    return-void

    .line 323
    :cond_0
    invoke-virtual {p2, p0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v2

    .line 325
    .local v2, "fromArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-virtual {p3, p0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    if-nez v0, :cond_1

    .line 326
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    invoke-virtual {p3, p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 328
    :cond_1
    invoke-virtual {p3, p0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v4

    .line 330
    .local v4, "toArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    .line 331
    .local v6, "toOcgsToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v9, 0x0

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 332
    .local v1, "fromRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getRefersTo()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    invoke-virtual {v3, p4, v9}, Lcom/itextpdf/kernel/pdf/PdfObject;->copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v3

    invoke-interface {v6, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 333
    .end local v1    # "fromRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    goto :goto_0

    .line 334
    :cond_2
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Order:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, p0}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, -0x1

    if-eqz v0, :cond_8

    .line 336
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 337
    .local v0, "removeIndex":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v3, 0x0

    move v5, v3

    .local v5, "i":I
    :goto_1
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v3

    if-ge v5, v3, :cond_4

    .line 338
    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    .line 339
    .local v3, "toOrderItem":Lcom/itextpdf/kernel/pdf/PdfObject;
    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-static/range {v3 .. v8}, Lcom/itextpdf/kernel/pdf/OcgPropertiesCopier;->orderBranchContainsSetElements(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfArray;ILjava/util/Set;Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/PdfDocument;)Z

    move-result v7

    move-object v8, v4

    move-object v10, v6

    .end local v4    # "toArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v6    # "toOcgsToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .local v8, "toArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    .local v10, "toOcgsToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    if-eqz v7, :cond_3

    .line 340
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 337
    .end local v3    # "toOrderItem":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_3
    add-int/lit8 v5, v5, 0x1

    move-object v4, v8

    move-object v6, v10

    goto :goto_1

    .end local v8    # "toArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v10    # "toOcgsToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .restart local v4    # "toArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    .restart local v6    # "toOcgsToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    :cond_4
    move-object v8, v4

    move-object v10, v6

    .line 343
    .end local v4    # "toArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v5    # "i":I
    .end local v6    # "toOcgsToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .restart local v8    # "toArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    .restart local v10    # "toOcgsToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    .local v3, "i":I
    :goto_2
    if-le v3, v1, :cond_5

    .line 344
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {v8, v4}, Lcom/itextpdf/kernel/pdf/PdfArray;->remove(I)V

    .line 343
    add-int/lit8 v3, v3, -0x1

    goto :goto_2

    .line 347
    .end local v3    # "i":I
    :cond_5
    invoke-virtual {p4}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->OCProperties:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->OCGs:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v5

    .line 349
    .local v5, "toOcgs":Lcom/itextpdf/kernel/pdf/PdfArray;
    const/4 v1, 0x0

    move v3, v1

    .restart local v3    # "i":I
    :goto_3
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v1

    if-ge v3, v1, :cond_7

    .line 350
    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 351
    .local v1, "fromOrderItem":Lcom/itextpdf/kernel/pdf/PdfObject;
    move-object v4, p1

    move-object v6, p4

    .end local p1    # "fromOcgsToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .end local p4    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .local v4, "fromOcgsToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .local v6, "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    invoke-static/range {v1 .. v6}, Lcom/itextpdf/kernel/pdf/OcgPropertiesCopier;->orderBranchContainsSetElements(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfArray;ILjava/util/Set;Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/PdfDocument;)Z

    move-result p1

    if-eqz p1, :cond_6

    .line 352
    invoke-virtual {v1, v6, v9}, Lcom/itextpdf/kernel/pdf/PdfObject;->copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object p1

    invoke-virtual {v8, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 349
    .end local v1    # "fromOrderItem":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_6
    add-int/lit8 v3, v3, 0x1

    move-object p1, v4

    move-object p4, v6

    goto :goto_3

    .end local v4    # "fromOcgsToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .end local v6    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local p1    # "fromOcgsToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .restart local p4    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    :cond_7
    move-object v4, p1

    move-object v6, p4

    .line 359
    .end local v0    # "removeIndex":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v3    # "i":I
    .end local v5    # "toOcgs":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local p1    # "fromOcgsToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .end local p4    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v4    # "fromOcgsToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .restart local v6    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    goto/16 :goto_b

    .end local v8    # "toArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v10    # "toOcgsToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .local v4, "toArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    .local v6, "toOcgsToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .restart local p1    # "fromOcgsToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .restart local p4    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    :cond_8
    move-object v8, v4

    move-object v10, v6

    move-object v4, p1

    move-object v6, p4

    .end local p1    # "fromOcgsToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .end local p4    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .local v4, "fromOcgsToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .local v6, "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v8    # "toArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    .restart local v10    # "toOcgsToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    sget-object p1, Lcom/itextpdf/kernel/pdf/PdfName;->RBGroups:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, p0}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_f

    .line 361
    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    .local p1, "i":I
    :goto_4
    if-le p1, v1, :cond_b

    .line 362
    invoke-virtual {v8, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object p4

    check-cast p4, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 363
    .local p4, "toRbGroup":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-virtual {p4}, Lcom/itextpdf/kernel/pdf/PdfArray;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_5
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 364
    .local v3, "toRbGroupItemObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v5

    invoke-interface {v10, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 365
    invoke-virtual {v8, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->remove(I)V

    .line 366
    goto :goto_6

    .line 368
    .end local v3    # "toRbGroupItemObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_9
    goto :goto_5

    .line 361
    .end local p4    # "toRbGroup":Lcom/itextpdf/kernel/pdf/PdfArray;
    :cond_a
    :goto_6
    add-int/lit8 p1, p1, -0x1

    goto :goto_4

    .line 372
    .end local p1    # "i":I
    :cond_b
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_7
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p4

    if-eqz p4, :cond_e

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 373
    .local p4, "fromRbGroupObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    move-object v0, p4

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 374
    .local v0, "fromRbGroup":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 375
    .local v3, "fromRbGroupItemObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_c

    .line 376
    invoke-virtual {v0, v6, v9}, Lcom/itextpdf/kernel/pdf/PdfArray;->copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {v8, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 377
    goto :goto_9

    .line 379
    .end local v3    # "fromRbGroupItemObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_c
    goto :goto_8

    .line 380
    .end local v0    # "fromRbGroup":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local p4    # "fromRbGroupObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_d
    :goto_9
    goto :goto_7

    :cond_e
    goto :goto_b

    .line 385
    :cond_f
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_a
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p4

    if-eqz p4, :cond_10

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 386
    .local p4, "fromObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-static {v4, p4, v8, v6}, Lcom/itextpdf/kernel/pdf/OcgPropertiesCopier;->attemptToAddObjectToArray(Ljava/util/Set;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 387
    .end local p4    # "fromObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    goto :goto_a

    .line 390
    :cond_10
    :goto_b
    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfArray;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_11

    .line 391
    invoke-virtual {p3, p0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 393
    :cond_11
    return-void
.end method

.method private static copyDDictionary(Ljava/util/Set;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 2
    .param p1, "fromDDict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "toOcProperties"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p3, "toDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            ">;",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            ")V"
        }
    .end annotation

    .line 257
    .local p0, "fromOcgsToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p2, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    if-nez v0, :cond_0

    .line 258
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    invoke-virtual {p2, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 261
    :cond_0
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p2, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 263
    .local v0, "toDDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Name:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v1, p1, v0}, Lcom/itextpdf/kernel/pdf/OcgPropertiesCopier;->copyDStringField(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 265
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Creator:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 266
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BaseState:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v1, p1, v0}, Lcom/itextpdf/kernel/pdf/OcgPropertiesCopier;->copyDNameField(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 267
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ON:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v1, p0, p1, v0, p3}, Lcom/itextpdf/kernel/pdf/OcgPropertiesCopier;->copyDArrayField(Lcom/itextpdf/kernel/pdf/PdfName;Ljava/util/Set;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 268
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->OFF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v1, p0, p1, v0, p3}, Lcom/itextpdf/kernel/pdf/OcgPropertiesCopier;->copyDArrayField(Lcom/itextpdf/kernel/pdf/PdfName;Ljava/util/Set;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 269
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Intent:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v1, p1, v0}, Lcom/itextpdf/kernel/pdf/OcgPropertiesCopier;->copyDNameField(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 271
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Order:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v1, p0, p1, v0, p3}, Lcom/itextpdf/kernel/pdf/OcgPropertiesCopier;->copyDArrayField(Lcom/itextpdf/kernel/pdf/PdfName;Ljava/util/Set;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 273
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ListMode:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v1, p1, v0}, Lcom/itextpdf/kernel/pdf/OcgPropertiesCopier;->copyDNameField(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 274
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->RBGroups:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v1, p0, p1, v0, p3}, Lcom/itextpdf/kernel/pdf/OcgPropertiesCopier;->copyDArrayField(Lcom/itextpdf/kernel/pdf/PdfName;Ljava/util/Set;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 275
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Locked:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v1, p0, p1, v0, p3}, Lcom/itextpdf/kernel/pdf/OcgPropertiesCopier;->copyDArrayField(Lcom/itextpdf/kernel/pdf/PdfName;Ljava/util/Set;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 276
    return-void
.end method

.method private static copyDNameField(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 4
    .param p0, "fieldToCopy"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p1, "fromDict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "toDict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 287
    invoke-virtual {p1, p0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    .line 288
    .local v0, "fromName":Lcom/itextpdf/kernel/pdf/PdfName;
    if-eqz v0, :cond_2

    invoke-virtual {p2, p0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v1

    if-eqz v1, :cond_0

    goto :goto_1

    .line 292
    :cond_0
    invoke-static {p0, v0}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->checkDDictonaryFieldValue(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 293
    invoke-virtual {p2, p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_0

    .line 295
    :cond_1
    const-class v1, Lcom/itextpdf/kernel/pdf/OcgPropertiesCopier;

    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    .line 296
    .local v1, "logger":Lorg/slf4j/Logger;
    const-string v2, "The default configuration dictionary field {0} has a value of {1}, which is not the required value for this field. The field will not be processed."

    filled-new-array {p0, v0}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 298
    .local v2, "warnText":Ljava/lang/String;
    invoke-interface {v1, v2}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 300
    .end local v1    # "logger":Lorg/slf4j/Logger;
    .end local v2    # "warnText":Ljava/lang/String;
    :goto_0
    return-void

    .line 289
    :cond_2
    :goto_1
    return-void
.end method

.method private static copyDStringField(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 4
    .param p0, "fieldToCopy"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p1, "fromDict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "toDict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 303
    invoke-virtual {p1, p0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    .line 304
    .local v0, "fromString":Lcom/itextpdf/kernel/pdf/PdfString;
    if-eqz v0, :cond_2

    invoke-virtual {p2, p0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v1

    if-eqz v1, :cond_0

    goto :goto_1

    .line 308
    :cond_0
    invoke-static {p0, v0}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->checkDDictonaryFieldValue(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 309
    invoke-virtual {p2, p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_0

    .line 311
    :cond_1
    const-class v1, Lcom/itextpdf/kernel/pdf/OcgPropertiesCopier;

    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    .line 312
    .local v1, "logger":Lorg/slf4j/Logger;
    const-string v2, "The default configuration dictionary field {0} has a value of {1}, which is not the required value for this field. The field will not be processed."

    filled-new-array {p0, v0}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 314
    .local v2, "warnText":Ljava/lang/String;
    invoke-interface {v1, v2}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 316
    .end local v1    # "logger":Lorg/slf4j/Logger;
    .end local v2    # "warnText":Ljava/lang/String;
    :goto_0
    return-void

    .line 305
    :cond_2
    :goto_1
    return-void
.end method

.method public static copyOCGProperties(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/util/Map;)V
    .locals 4
    .param p0, "fromDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p1, "toDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfPage;",
            "Lcom/itextpdf/kernel/pdf/PdfPage;",
            ">;)V"
        }
    .end annotation

    .line 53
    .local p2, "page2page":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    :try_start_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->OCProperties:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 54
    .local v0, "toOcProperties":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    nop

    .line 55
    invoke-static {p2, v0}, Lcom/itextpdf/kernel/pdf/OcgPropertiesCopier;->getAllUsedNonFlushedOCGs(Ljava/util/Map;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Ljava/util/Set;

    move-result-object v1

    .line 56
    .local v1, "fromOcgsToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 57
    return-void

    .line 62
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->fillAndGetOcPropertiesDictionary()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    .line 63
    .end local v0    # "toOcProperties":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .local v2, "toOcProperties":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->OCProperties:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 64
    invoke-virtual {v0, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 66
    .local v0, "fromOcProperties":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-static {v1, v2, p1}, Lcom/itextpdf/kernel/pdf/OcgPropertiesCopier;->copyOCGs(Ljava/util/Set;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 68
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v3

    invoke-static {v1, v3, v2, p1}, Lcom/itextpdf/kernel/pdf/OcgPropertiesCopier;->copyDDictionary(Ljava/util/Set;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 72
    .end local v0    # "fromOcProperties":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v1    # "fromOcgsToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .end local v2    # "toOcProperties":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    goto :goto_0

    .line 70
    :catch_0
    move-exception v0

    .line 71
    .local v0, "ex":Ljava/lang/Exception;
    sget-object v1, Lcom/itextpdf/kernel/pdf/OcgPropertiesCopier;->LOGGER:Lorg/slf4j/Logger;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const-string v3, "OCG copying caused the following exception: {0}."

    invoke-static {v3, v2}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 73
    .end local v0    # "ex":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method private static copyOCGs(Ljava/util/Set;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 10
    .param p1, "toOcProperties"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "toDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            ">;",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            ")V"
        }
    .end annotation

    .line 201
    .local p0, "fromOcgsToCopy":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 202
    .local v0, "layerNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->OCGs:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 203
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->OCGs:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v1

    .line 204
    .local v1, "toOcgs":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 205
    .local v3, "toOcgObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfObject;->isDictionary()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 206
    move-object v4, v3

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->Name:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfString;->toUnicodeString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 208
    .end local v3    # "toOcgObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_0
    goto :goto_0

    .line 211
    .end local v1    # "toOcgs":Lcom/itextpdf/kernel/pdf/PdfArray;
    :cond_1
    const/4 v1, 0x0

    .line 212
    .local v1, "hasConflictingNames":Z
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 213
    .local v3, "fromOcgRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getRefersTo()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, p2, v5}, Lcom/itextpdf/kernel/pdf/PdfObject;->copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 215
    .local v4, "toOcg":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->Name:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfString;->toUnicodeString()Ljava/lang/String;

    move-result-object v5

    .line 219
    .local v5, "currentLayerName":Ljava/lang/String;
    invoke-interface {v0, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 220
    const/4 v1, 0x1

    .line 221
    const/4 v6, 0x0

    .line 222
    .local v6, "i":I
    :goto_2
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "_"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v0, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 223
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 225
    :cond_2
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 226
    sget-object v7, Lcom/itextpdf/kernel/pdf/PdfName;->Name:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v8, Lcom/itextpdf/kernel/pdf/PdfString;

    const-string v9, "UnicodeBig"

    invoke-direct {v8, v5, v9}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v7, v8}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 229
    .end local v6    # "i":I
    :cond_3
    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->OCGs:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v6

    if-nez v6, :cond_4

    .line 230
    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->OCGs:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v7, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v7}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    invoke-virtual {p1, v6, v7}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 232
    :cond_4
    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->OCGs:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v6

    invoke-virtual {v6, v4}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 233
    .end local v3    # "fromOcgRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .end local v4    # "toOcg":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v5    # "currentLayerName":Ljava/lang/String;
    goto/16 :goto_1

    .line 235
    :cond_5
    if-eqz v1, :cond_6

    .line 236
    sget-object v2, Lcom/itextpdf/kernel/pdf/OcgPropertiesCopier;->LOGGER:Lorg/slf4j/Logger;

    const-string v3, "Document has conflicting names for optional content groups. Groups with conflicting names will be renamed"

    invoke-interface {v2, v3}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 238
    :cond_6
    return-void
.end method

.method private static getAllUsedNonFlushedOCGs(Ljava/util/Map;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Ljava/util/Set;
    .locals 17
    .param p1, "toOcProperties"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfPage;",
            "Lcom/itextpdf/kernel/pdf/PdfPage;",
            ">;",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            ")",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            ">;"
        }
    .end annotation

    .line 77
    .local p0, "page2page":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfPage;>;"
    move-object/from16 v0, p1

    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    .line 79
    .local v1, "fromUsedOcgs":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    invoke-interface/range {p0 .. p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    const/4 v3, 0x0

    new-array v4, v3, [Lcom/itextpdf/kernel/pdf/PdfPage;

    invoke-interface {v2, v4}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 80
    .local v2, "fromPages":[Lcom/itextpdf/kernel/pdf/PdfPage;
    invoke-interface/range {p0 .. p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v4

    new-array v3, v3, [Lcom/itextpdf/kernel/pdf/PdfPage;

    invoke-interface {v4, v3}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 81
    .local v3, "toPages":[Lcom/itextpdf/kernel/pdf/PdfPage;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v5, v3

    if-ge v4, v5, :cond_3

    .line 82
    aget-object v5, v2, v4

    .line 83
    .local v5, "fromPage":Lcom/itextpdf/kernel/pdf/PdfPage;
    aget-object v6, v3, v4

    .line 86
    .local v6, "toPage":Lcom/itextpdf/kernel/pdf/PdfPage;
    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfPage;->getAnnotations()Ljava/util/List;

    move-result-object v7

    .line 87
    .local v7, "toAnnotations":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;>;"
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfPage;->getAnnotations()Ljava/util/List;

    move-result-object v8

    .line 88
    .local v8, "fromAnnotations":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;>;"
    const/4 v9, 0x0

    .local v9, "j":I
    :goto_1
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v10

    if-ge v9, v10, :cond_2

    .line 89
    invoke-interface {v7, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->isFlushed()Z

    move-result v10

    if-nez v10, :cond_1

    .line 90
    invoke-interface {v7, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v10

    check-cast v10, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 91
    .local v10, "toAnnotDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v11

    check-cast v11, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 92
    .local v11, "fromAnnotDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-interface {v7, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    .line 93
    .local v12, "toAnnot":Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    .line 94
    .local v13, "fromAnnot":Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->isFlushed()Z

    move-result v14

    if-nez v14, :cond_0

    .line 95
    sget-object v14, Lcom/itextpdf/kernel/pdf/PdfName;->OC:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v10, v14}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v14

    sget-object v15, Lcom/itextpdf/kernel/pdf/PdfName;->OC:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 96
    invoke-virtual {v11, v15}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v15

    .line 95
    invoke-static {v14, v15, v1, v0}, Lcom/itextpdf/kernel/pdf/OcgPropertiesCopier;->getUsedNonFlushedOCGsFromOcDict(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfObject;Ljava/util/Set;Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 98
    invoke-virtual {v12}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getNormalAppearanceObject()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v14

    .line 99
    invoke-virtual {v13}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getNormalAppearanceObject()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v15

    move-object/from16 v16, v2

    .end local v2    # "fromPages":[Lcom/itextpdf/kernel/pdf/PdfPage;
    .local v16, "fromPages":[Lcom/itextpdf/kernel/pdf/PdfPage;
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 98
    invoke-static {v14, v15, v1, v0, v2}, Lcom/itextpdf/kernel/pdf/OcgPropertiesCopier;->getUsedNonFlushedOCGsFromXObject(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/util/Set;Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/util/Set;)V

    .line 100
    invoke-virtual {v12}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getRolloverAppearanceObject()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    .line 101
    invoke-virtual {v13}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getRolloverAppearanceObject()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v14

    new-instance v15, Ljava/util/HashSet;

    invoke-direct {v15}, Ljava/util/HashSet;-><init>()V

    .line 100
    invoke-static {v2, v14, v1, v0, v15}, Lcom/itextpdf/kernel/pdf/OcgPropertiesCopier;->getUsedNonFlushedOCGsFromXObject(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/util/Set;Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/util/Set;)V

    .line 102
    invoke-virtual {v12}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getDownAppearanceObject()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    .line 103
    invoke-virtual {v13}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getDownAppearanceObject()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v14

    new-instance v15, Ljava/util/HashSet;

    invoke-direct {v15}, Ljava/util/HashSet;-><init>()V

    .line 102
    invoke-static {v2, v14, v1, v0, v15}, Lcom/itextpdf/kernel/pdf/OcgPropertiesCopier;->getUsedNonFlushedOCGsFromXObject(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/util/Set;Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/util/Set;)V

    goto :goto_2

    .line 94
    .end local v16    # "fromPages":[Lcom/itextpdf/kernel/pdf/PdfPage;
    .restart local v2    # "fromPages":[Lcom/itextpdf/kernel/pdf/PdfPage;
    :cond_0
    move-object/from16 v16, v2

    .end local v2    # "fromPages":[Lcom/itextpdf/kernel/pdf/PdfPage;
    .restart local v16    # "fromPages":[Lcom/itextpdf/kernel/pdf/PdfPage;
    goto :goto_2

    .line 89
    .end local v10    # "toAnnotDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v11    # "fromAnnotDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v12    # "toAnnot":Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .end local v13    # "fromAnnot":Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .end local v16    # "fromPages":[Lcom/itextpdf/kernel/pdf/PdfPage;
    .restart local v2    # "fromPages":[Lcom/itextpdf/kernel/pdf/PdfPage;
    :cond_1
    move-object/from16 v16, v2

    .line 88
    .end local v2    # "fromPages":[Lcom/itextpdf/kernel/pdf/PdfPage;
    .restart local v16    # "fromPages":[Lcom/itextpdf/kernel/pdf/PdfPage;
    :goto_2
    add-int/lit8 v9, v9, 0x1

    move-object/from16 v2, v16

    goto/16 :goto_1

    .end local v16    # "fromPages":[Lcom/itextpdf/kernel/pdf/PdfPage;
    .restart local v2    # "fromPages":[Lcom/itextpdf/kernel/pdf/PdfPage;
    :cond_2
    move-object/from16 v16, v2

    .line 108
    .end local v2    # "fromPages":[Lcom/itextpdf/kernel/pdf/PdfPage;
    .end local v9    # "j":I
    .restart local v16    # "fromPages":[Lcom/itextpdf/kernel/pdf/PdfPage;
    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v9, Lcom/itextpdf/kernel/pdf/PdfName;->Resources:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v9}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    .line 109
    .local v2, "toResources":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v10, Lcom/itextpdf/kernel/pdf/PdfName;->Resources:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v9, v10}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v9

    .line 110
    .local v9, "fromResources":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    new-instance v10, Ljava/util/HashSet;

    invoke-direct {v10}, Ljava/util/HashSet;-><init>()V

    invoke-static {v2, v9, v1, v0, v10}, Lcom/itextpdf/kernel/pdf/OcgPropertiesCopier;->getUsedNonFlushedOCGsFromResources(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/util/Set;Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/util/Set;)V

    .line 81
    .end local v2    # "toResources":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v5    # "fromPage":Lcom/itextpdf/kernel/pdf/PdfPage;
    .end local v6    # "toPage":Lcom/itextpdf/kernel/pdf/PdfPage;
    .end local v7    # "toAnnotations":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;>;"
    .end local v8    # "fromAnnotations":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;>;"
    .end local v9    # "fromResources":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    add-int/lit8 v4, v4, 0x1

    move-object/from16 v2, v16

    goto/16 :goto_0

    .line 113
    .end local v4    # "i":I
    .end local v16    # "fromPages":[Lcom/itextpdf/kernel/pdf/PdfPage;
    .local v2, "fromPages":[Lcom/itextpdf/kernel/pdf/PdfPage;
    :cond_3
    return-object v1
.end method

.method private static getUsedNonFlushedOCGsFromOcDict(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfObject;Ljava/util/Set;Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 8
    .param p0, "toObj"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p1, "fromObj"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p3, "toOcProperties"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            ">;",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            ")V"
        }
    .end annotation

    .line 171
    .local p2, "fromUsedOcgs":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    if-eqz p0, :cond_3

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isDictionary()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isFlushed()Z

    move-result v0

    if-nez v0, :cond_3

    .line 172
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 173
    .local v0, "toCurrDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    move-object v1, p1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 174
    .local v1, "fromCurrDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v2

    .line 175
    .local v2, "typeName":Lcom/itextpdf/kernel/pdf/PdfName;
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->OCG:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v3

    invoke-static {v3, p3}, Lcom/itextpdf/kernel/pdf/OcgPropertiesCopier;->ocgAlreadyInOCGs(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 176
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v3

    invoke-interface {p2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 177
    :cond_0
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->OCMD:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 178
    const/4 v3, 0x0

    .line 179
    .local v3, "toOcgs":Lcom/itextpdf/kernel/pdf/PdfArray;
    const/4 v4, 0x0

    .line 180
    .local v4, "fromOcgs":Lcom/itextpdf/kernel/pdf/PdfArray;
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->OCGs:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 181
    new-instance v5, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v5}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    move-object v3, v5

    .line 182
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->OCGs:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 184
    new-instance v5, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v5}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    move-object v4, v5

    .line 185
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->OCGs:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    goto :goto_0

    .line 186
    :cond_1
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->OCGs:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v5

    if-eqz v5, :cond_2

    .line 187
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->OCGs:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v3

    .line 188
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->OCGs:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v4

    .line 191
    :cond_2
    :goto_0
    if-eqz v3, :cond_3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->isFlushed()Z

    move-result v5

    if-nez v5, :cond_3

    .line 192
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v6

    if-ge v5, v6, :cond_3

    .line 193
    invoke-virtual {v3, v5}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v6

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v7

    invoke-static {v6, v7, p2, p3}, Lcom/itextpdf/kernel/pdf/OcgPropertiesCopier;->getUsedNonFlushedOCGsFromOcDict(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfObject;Ljava/util/Set;Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 192
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 198
    .end local v0    # "toCurrDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v1    # "fromCurrDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v2    # "typeName":Lcom/itextpdf/kernel/pdf/PdfName;
    .end local v3    # "toOcgs":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v4    # "fromOcgs":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v5    # "i":I
    :cond_3
    :goto_2
    return-void
.end method

.method private static getUsedNonFlushedOCGsFromResources(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/util/Set;Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/util/Set;)V
    .locals 6
    .param p0, "toResources"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p1, "fromResources"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p3, "toOcProperties"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            ">;",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;)V"
        }
    .end annotation

    .line 118
    .local p2, "fromUsedOcgs":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .local p4, "visitedObjects":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    if-eqz p0, :cond_1

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->isFlushed()Z

    move-result v0

    if-nez v0, :cond_1

    .line 120
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Properties:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 121
    .local v0, "toProperties":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Properties:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    .line 122
    .local v1, "fromProperties":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->isFlushed()Z

    move-result v2

    if-nez v2, :cond_0

    .line 123
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfName;

    .line 124
    .local v3, "name":Lcom/itextpdf/kernel/pdf/PdfName;
    invoke-virtual {v0, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    .line 125
    .local v4, "toCurrObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v5

    .line 126
    .local v5, "fromCurrObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-static {v4, v5, p2, p3}, Lcom/itextpdf/kernel/pdf/OcgPropertiesCopier;->getUsedNonFlushedOCGsFromOcDict(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfObject;Ljava/util/Set;Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 127
    .end local v3    # "name":Lcom/itextpdf/kernel/pdf/PdfName;
    .end local v4    # "toCurrObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local v5    # "fromCurrObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    goto :goto_0

    .line 131
    :cond_0
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->XObject:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    .line 132
    .local v2, "toXObject":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->XObject:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v3

    .line 133
    .local v3, "fromXObject":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-static {v2, v3, p2, p3, p4}, Lcom/itextpdf/kernel/pdf/OcgPropertiesCopier;->getUsedNonFlushedOCGsFromXObject(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/util/Set;Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/util/Set;)V

    .line 136
    .end local v0    # "toProperties":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v1    # "fromProperties":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v2    # "toXObject":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v3    # "fromXObject":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_1
    return-void
.end method

.method private static getUsedNonFlushedOCGsFromXObject(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/util/Set;Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/util/Set;)V
    .locals 6
    .param p0, "toXObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p1, "fromXObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p3, "toOcProperties"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            ">;",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;)V"
        }
    .end annotation

    .line 141
    .local p2, "fromUsedOcgs":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .local p4, "visitedObjects":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    invoke-interface {p4, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 142
    return-void

    .line 144
    :cond_0
    invoke-interface {p4, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 146
    if-eqz p0, :cond_3

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->isFlushed()Z

    move-result v0

    if-nez v0, :cond_3

    .line 147
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->isStream()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->isFlushed()Z

    move-result v0

    if-nez v0, :cond_1

    .line 148
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 149
    .local v0, "toStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    move-object v1, p1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 150
    .local v1, "fromStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->OC:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->OC:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 151
    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v3

    .line 150
    invoke-static {v2, v3, p2, p3}, Lcom/itextpdf/kernel/pdf/OcgPropertiesCopier;->getUsedNonFlushedOCGsFromOcDict(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfObject;Ljava/util/Set;Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 152
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Resources:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Resources:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 153
    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v3

    .line 152
    invoke-static {v2, v3, p2, p3, p4}, Lcom/itextpdf/kernel/pdf/OcgPropertiesCopier;->getUsedNonFlushedOCGsFromResources(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/util/Set;Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/util/Set;)V

    .line 154
    .end local v0    # "toStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    .end local v1    # "fromStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    goto :goto_1

    .line 155
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfName;

    .line 156
    .local v1, "name":Lcom/itextpdf/kernel/pdf/PdfName;
    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    .line 157
    .local v2, "toCurrObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    .line 158
    .local v3, "fromCurrObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfObject;->isStream()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfObject;->isFlushed()Z

    move-result v4

    if-nez v4, :cond_2

    .line 159
    move-object v4, v2

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 160
    .local v4, "toStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    move-object v5, v3

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 161
    .local v5, "fromStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    invoke-static {v4, v5, p2, p3, p4}, Lcom/itextpdf/kernel/pdf/OcgPropertiesCopier;->getUsedNonFlushedOCGsFromXObject(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/util/Set;Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/util/Set;)V

    .line 164
    .end local v1    # "name":Lcom/itextpdf/kernel/pdf/PdfName;
    .end local v2    # "toCurrObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local v3    # "fromCurrObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local v4    # "toStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    .end local v5    # "fromStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    :cond_2
    goto :goto_0

    .line 167
    :cond_3
    :goto_1
    return-void
.end method

.method private static ocgAlreadyInOCGs(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Z
    .locals 5
    .param p0, "toOcgRef"    # Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .param p1, "toOcProperties"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 241
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 242
    return v0

    .line 244
    :cond_0
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->OCGs:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v1

    .line 245
    .local v1, "toOcgs":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-eqz v1, :cond_2

    .line 246
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 247
    .local v3, "toOcg":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 248
    const/4 v0, 0x1

    return v0

    .line 250
    .end local v3    # "toOcg":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_1
    goto :goto_0

    .line 252
    :cond_2
    return v0
.end method

.method private static orderBranchContainsSetElements(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfArray;ILjava/util/Set;Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/PdfDocument;)Z
    .locals 10
    .param p0, "arrayObj"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p1, "array"    # Lcom/itextpdf/kernel/pdf/PdfArray;
    .param p2, "currentIndex"    # I
    .param p4, "toOcgs"    # Lcom/itextpdf/kernel/pdf/PdfArray;
    .param p5, "toDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            "Lcom/itextpdf/kernel/pdf/PdfArray;",
            "I",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            ">;",
            "Lcom/itextpdf/kernel/pdf/PdfArray;",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            ")Z"
        }
    .end annotation

    .line 397
    .local p3, "ocgs":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isDictionary()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_4

    .line 398
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    invoke-interface {p3, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 399
    return v2

    .line 401
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v0

    sub-int/2addr v0, v2

    if-ge p2, v0, :cond_3

    add-int/lit8 v0, p2, 0x1

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isArray()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 402
    add-int/lit8 v0, p2, 0x1

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsArray(I)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v2

    .line 403
    .local v2, "nextArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isString()Z

    move-result v0

    if-nez v0, :cond_2

    .line 404
    add-int/lit8 v4, p2, 0x1

    move-object v3, p1

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    .end local p1    # "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local p3    # "ocgs":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .end local p4    # "toOcgs":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local p5    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .local v3, "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    .local v5, "ocgs":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .local v6, "toOcgs":Lcom/itextpdf/kernel/pdf/PdfArray;
    .local v7, "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    invoke-static/range {v2 .. v7}, Lcom/itextpdf/kernel/pdf/OcgPropertiesCopier;->orderBranchContainsSetElements(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfArray;ILjava/util/Set;Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/PdfDocument;)Z

    move-result p1

    .line 406
    .local p1, "result":Z
    if-eqz p1, :cond_1

    if-eqz v6, :cond_1

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object p3

    invoke-interface {v5, p3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_1

    .line 410
    invoke-virtual {p0, v7, v1}, Lcom/itextpdf/kernel/pdf/PdfObject;->copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object p3

    invoke-virtual {v6, p3}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 413
    :cond_1
    return p1

    .line 403
    .end local v3    # "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v5    # "ocgs":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .end local v6    # "toOcgs":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v7    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .local p1, "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    .restart local p3    # "ocgs":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .restart local p4    # "toOcgs":Lcom/itextpdf/kernel/pdf/PdfArray;
    .restart local p5    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    :cond_2
    move-object v3, p1

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    .line 415
    .end local v2    # "nextArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local p1    # "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local p3    # "ocgs":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .end local p4    # "toOcgs":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local p5    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v3    # "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    .restart local v5    # "ocgs":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .restart local v6    # "toOcgs":Lcom/itextpdf/kernel/pdf/PdfArray;
    .restart local v7    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    goto/16 :goto_1

    .line 401
    .end local v3    # "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v5    # "ocgs":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .end local v6    # "toOcgs":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v7    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local p1    # "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    .restart local p3    # "ocgs":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .restart local p4    # "toOcgs":Lcom/itextpdf/kernel/pdf/PdfArray;
    .restart local p5    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    :cond_3
    move-object v3, p1

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    .end local p1    # "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local p3    # "ocgs":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .end local p4    # "toOcgs":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local p5    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v3    # "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    .restart local v5    # "ocgs":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .restart local v6    # "toOcgs":Lcom/itextpdf/kernel/pdf/PdfArray;
    .restart local v7    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    goto/16 :goto_1

    .line 417
    .end local v3    # "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v5    # "ocgs":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .end local v6    # "toOcgs":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v7    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local p1    # "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    .restart local p3    # "ocgs":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .restart local p4    # "toOcgs":Lcom/itextpdf/kernel/pdf/PdfArray;
    .restart local p5    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    :cond_4
    move-object v3, p1

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    .end local p1    # "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local p3    # "ocgs":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .end local p4    # "toOcgs":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local p5    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v3    # "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    .restart local v5    # "ocgs":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .restart local v6    # "toOcgs":Lcom/itextpdf/kernel/pdf/PdfArray;
    .restart local v7    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isArray()Z

    move-result p1

    if-eqz p1, :cond_7

    .line 418
    move-object v9, v7

    move-object v7, v5

    .end local v5    # "ocgs":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .local v7, "ocgs":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .local v9, "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    move-object v5, p0

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 419
    .local v5, "arrayItem":Lcom/itextpdf/kernel/pdf/PdfArray;
    const/4 p1, 0x0

    .local p1, "i":I
    :goto_0
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result p3

    if-ge p1, p3, :cond_6

    .line 420
    invoke-virtual {v5, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    .line 421
    .local v4, "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    move-object v8, v6

    move v6, p1

    .end local p1    # "i":I
    .local v6, "i":I
    .local v8, "toOcgs":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-static/range {v4 .. v9}, Lcom/itextpdf/kernel/pdf/OcgPropertiesCopier;->orderBranchContainsSetElements(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfArray;ILjava/util/Set;Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/PdfDocument;)Z

    move-result p1

    move-object p3, v5

    move p4, v6

    move-object v5, v7

    move-object v6, v8

    move-object v7, v9

    .end local v8    # "toOcgs":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v9    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .local v5, "ocgs":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .local v6, "toOcgs":Lcom/itextpdf/kernel/pdf/PdfArray;
    .local v7, "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .local p3, "arrayItem":Lcom/itextpdf/kernel/pdf/PdfArray;
    .local p4, "i":I
    if-eqz p1, :cond_5

    .line 422
    return v2

    .line 419
    .end local v4    # "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_5
    add-int/lit8 p1, p4, 0x1

    move-object v9, v7

    move-object v7, v5

    move-object v5, p3

    .end local p4    # "i":I
    .restart local p1    # "i":I
    goto :goto_0

    .end local p3    # "arrayItem":Lcom/itextpdf/kernel/pdf/PdfArray;
    .local v5, "arrayItem":Lcom/itextpdf/kernel/pdf/PdfArray;
    .local v7, "ocgs":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .restart local v9    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    :cond_6
    move p4, p1

    move-object p3, v5

    move-object v5, v7

    move-object v7, v9

    .line 426
    .end local v9    # "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p1    # "i":I
    .local v5, "ocgs":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .local v7, "toDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local p3    # "arrayItem":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-virtual {p3}, Lcom/itextpdf/kernel/pdf/PdfArray;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_7

    invoke-virtual {p3, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object p1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isString()Z

    move-result p1

    if-nez p1, :cond_7

    .line 427
    if-lez p2, :cond_7

    add-int/lit8 p1, p2, -0x1

    invoke-virtual {v3, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object p1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isDictionary()Z

    move-result p1

    if-eqz p1, :cond_7

    .line 428
    add-int/lit8 p1, p2, -0x1

    invoke-virtual {v3, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object p1

    check-cast p1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 429
    .local p1, "previousDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object p4

    invoke-interface {v5, p4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p4

    return p4

    .line 433
    .end local p1    # "previousDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local p3    # "arrayItem":Lcom/itextpdf/kernel/pdf/PdfArray;
    :cond_7
    :goto_1
    return v1
.end method
