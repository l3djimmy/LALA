.class public Lcom/itextpdf/kernel/pdf/PdfNumTree;
.super Ljava/lang/Object;
.source "PdfNumTree.java"


# static fields
.field private static final NODE_SIZE:I = 0x28


# instance fields
.field private catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

.field private items:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;"
        }
    .end annotation
.end field

.field private treeType:Lcom/itextpdf/kernel/pdf/PdfName;


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfCatalog;Lcom/itextpdf/kernel/pdf/PdfName;)V
    .locals 1
    .param p1, "catalog"    # Lcom/itextpdf/kernel/pdf/PdfCatalog;
    .param p2, "treeType"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfNumTree;->items:Ljava/util/Map;

    .line 47
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/PdfNumTree;->treeType:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 48
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfNumTree;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    .line 49
    return-void
.end method

.method private iterateItems(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfNumber;)Lcom/itextpdf/kernel/pdf/PdfNumber;
    .locals 7
    .param p1, "dictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "leftOver"    # Lcom/itextpdf/kernel/pdf/PdfNumber;

    .line 147
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Nums:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 148
    .local v0, "nums":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-eqz v0, :cond_3

    .line 149
    const/4 v1, 0x0

    .local v1, "k":I
    :goto_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 151
    if-nez p2, :cond_0

    .line 152
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "k":I
    .local v2, "k":I
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v1

    move v6, v2

    move-object v2, v1

    move v1, v6

    .local v1, "number":Lcom/itextpdf/kernel/pdf/PdfNumber;
    goto :goto_1

    .line 154
    .end local v2    # "k":I
    .local v1, "k":I
    :cond_0
    move-object v2, p2

    .line 155
    .local v2, "number":Lcom/itextpdf/kernel/pdf/PdfNumber;
    const/4 p2, 0x0

    .line 157
    :goto_1
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v3

    if-ge v1, v3, :cond_1

    .line 158
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfNumTree;->items:Ljava/util/Map;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    .end local v2    # "number":Lcom/itextpdf/kernel/pdf/PdfNumber;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 160
    .restart local v2    # "number":Lcom/itextpdf/kernel/pdf/PdfNumber;
    :cond_1
    return-object v2

    .line 149
    .end local v1    # "k":I
    .end local v2    # "number":Lcom/itextpdf/kernel/pdf/PdfNumber;
    :cond_2
    goto :goto_3

    .line 163
    :cond_3
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Kids:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v1

    move-object v0, v1

    if-eqz v1, :cond_4

    .line 164
    const/4 v1, 0x0

    .restart local v1    # "k":I
    :goto_2
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_4

    .line 165
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsDictionary(I)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    .line 166
    .local v2, "kid":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-direct {p0, v2, p2}, Lcom/itextpdf/kernel/pdf/PdfNumTree;->iterateItems(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfNumber;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object p2

    .line 164
    .end local v2    # "kid":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 169
    .end local v1    # "k":I
    :cond_4
    :goto_3
    const/4 v1, 0x0

    return-object v1
.end method

.method private readTree(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 1
    .param p1, "dictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 141
    if-eqz p1, :cond_0

    .line 142
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfNumTree;->iterateItems(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfNumber;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    .line 144
    :cond_0
    return-void
.end method


# virtual methods
.method public addEntry(ILcom/itextpdf/kernel/pdf/PdfObject;)V
    .locals 2
    .param p1, "key"    # I
    .param p2, "value"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 74
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfNumTree;->items:Ljava/util/Map;

    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, p1}, Ljava/lang/Integer;-><init>(I)V

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public buildTree()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 14

    .line 77
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfNumTree;->items:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/Integer;

    .line 78
    .local v0, "numbers":[Ljava/lang/Integer;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfNumTree;->items:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    check-cast v0, [Ljava/lang/Integer;

    .line 79
    invoke-static {v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 80
    array-length v1, v0

    const/16 v2, 0x28

    if-gt v1, v2, :cond_1

    .line 81
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 82
    .local v1, "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 83
    .local v2, "ar":Lcom/itextpdf/kernel/pdf/PdfArray;
    const/4 v3, 0x0

    .local v3, "k":I
    :goto_0
    array-length v4, v0

    if-ge v3, v4, :cond_0

    .line 84
    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfNumber;

    aget-object v5, v0, v3

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-direct {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v2, v4}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 85
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfNumTree;->items:Ljava/util/Map;

    aget-object v5, v0, v3

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfObject;

    invoke-virtual {v2, v4}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 83
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 87
    .end local v3    # "k":I
    :cond_0
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Nums:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v3, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 88
    return-object v1

    .line 90
    .end local v1    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v2    # "ar":Lcom/itextpdf/kernel/pdf/PdfArray;
    :cond_1
    const/16 v1, 0x28

    .line 91
    .local v1, "skip":I
    array-length v3, v0

    add-int/2addr v3, v2

    add-int/lit8 v3, v3, -0x1

    div-int/2addr v3, v2

    new-array v3, v3, [Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 92
    .local v3, "kids":[Lcom/itextpdf/kernel/pdf/PdfDictionary;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    array-length v5, v3

    if-ge v4, v5, :cond_3

    .line 93
    mul-int/lit8 v5, v4, 0x28

    .line 94
    .local v5, "offset":I
    add-int/lit8 v6, v5, 0x28

    array-length v7, v0

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 95
    .local v6, "end":I
    new-instance v7, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v7}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 96
    .local v7, "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    new-instance v8, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v8}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 97
    .local v8, "arr":Lcom/itextpdf/kernel/pdf/PdfArray;
    new-instance v9, Lcom/itextpdf/kernel/pdf/PdfNumber;

    aget-object v10, v0, v5

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    invoke-direct {v9, v10}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v8, v9}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 98
    new-instance v9, Lcom/itextpdf/kernel/pdf/PdfNumber;

    add-int/lit8 v10, v6, -0x1

    aget-object v10, v0, v10

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    invoke-direct {v9, v10}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v8, v9}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 99
    sget-object v9, Lcom/itextpdf/kernel/pdf/PdfName;->Limits:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v7, v9, v8}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 100
    new-instance v9, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v9}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 101
    .end local v8    # "arr":Lcom/itextpdf/kernel/pdf/PdfArray;
    .local v9, "arr":Lcom/itextpdf/kernel/pdf/PdfArray;
    :goto_2
    if-ge v5, v6, :cond_2

    .line 102
    new-instance v8, Lcom/itextpdf/kernel/pdf/PdfNumber;

    aget-object v10, v0, v5

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    invoke-direct {v8, v10}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v9, v8}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 103
    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfNumTree;->items:Ljava/util/Map;

    aget-object v10, v0, v5

    invoke-interface {v8, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/kernel/pdf/PdfObject;

    invoke-virtual {v9, v8}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 101
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 105
    :cond_2
    sget-object v8, Lcom/itextpdf/kernel/pdf/PdfName;->Nums:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v7, v8, v9}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 106
    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfNumTree;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 107
    aput-object v7, v3, v4

    .line 92
    .end local v5    # "offset":I
    .end local v6    # "end":I
    .end local v7    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v9    # "arr":Lcom/itextpdf/kernel/pdf/PdfArray;
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 109
    .end local v4    # "i":I
    :cond_3
    array-length v4, v3

    .line 111
    .local v4, "top":I
    :goto_3
    if-gt v4, v2, :cond_5

    .line 112
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 113
    .local v2, "arr":Lcom/itextpdf/kernel/pdf/PdfArray;
    const/4 v5, 0x0

    .local v5, "k":I
    :goto_4
    if-ge v5, v4, :cond_4

    .line 114
    aget-object v6, v3, v5

    invoke-virtual {v2, v6}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 113
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    .line 115
    .end local v5    # "k":I
    :cond_4
    new-instance v5, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 116
    .local v5, "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->Kids:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v5, v6, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 117
    return-object v5

    .line 119
    .end local v2    # "arr":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v5    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_5
    mul-int/lit8 v1, v1, 0x28

    .line 120
    array-length v5, v0

    add-int/2addr v5, v1

    add-int/lit8 v5, v5, -0x1

    div-int/2addr v5, v1

    .line 121
    .local v5, "tt":I
    const/4 v6, 0x0

    .local v6, "k":I
    :goto_5
    if-ge v6, v5, :cond_7

    .line 122
    mul-int/lit8 v7, v6, 0x28

    .line 123
    .local v7, "offset":I
    add-int/lit8 v8, v7, 0x28

    invoke-static {v8, v4}, Ljava/lang/Math;->min(II)I

    move-result v8

    .line 124
    .local v8, "end":I
    new-instance v9, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v9}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    iget-object v10, p0, Lcom/itextpdf/kernel/pdf/PdfNumTree;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 125
    .local v9, "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    new-instance v10, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v10}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 126
    .local v10, "arr":Lcom/itextpdf/kernel/pdf/PdfArray;
    new-instance v11, Lcom/itextpdf/kernel/pdf/PdfNumber;

    mul-int v12, v6, v1

    aget-object v12, v0, v12

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v12

    invoke-direct {v11, v12}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v10, v11}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 127
    new-instance v11, Lcom/itextpdf/kernel/pdf/PdfNumber;

    add-int/lit8 v12, v6, 0x1

    mul-int/2addr v12, v1

    array-length v13, v0

    invoke-static {v12, v13}, Ljava/lang/Math;->min(II)I

    move-result v12

    add-int/lit8 v12, v12, -0x1

    aget-object v12, v0, v12

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v12

    invoke-direct {v11, v12}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v10, v11}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 128
    sget-object v11, Lcom/itextpdf/kernel/pdf/PdfName;->Limits:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v9, v11, v10}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 129
    new-instance v11, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v11}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 130
    .end local v10    # "arr":Lcom/itextpdf/kernel/pdf/PdfArray;
    .local v11, "arr":Lcom/itextpdf/kernel/pdf/PdfArray;
    :goto_6
    if-ge v7, v8, :cond_6

    .line 131
    aget-object v10, v3, v7

    invoke-virtual {v11, v10}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 130
    add-int/lit8 v7, v7, 0x1

    goto :goto_6

    .line 133
    :cond_6
    sget-object v10, Lcom/itextpdf/kernel/pdf/PdfName;->Kids:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v9, v10, v11}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 134
    aput-object v9, v3, v6

    .line 121
    .end local v7    # "offset":I
    .end local v8    # "end":I
    .end local v9    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v11    # "arr":Lcom/itextpdf/kernel/pdf/PdfArray;
    add-int/lit8 v6, v6, 0x1

    goto :goto_5

    .line 136
    .end local v6    # "k":I
    :cond_7
    move v4, v5

    .line 137
    .end local v5    # "tt":I
    goto/16 :goto_3
.end method

.method public getNumbers()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;"
        }
    .end annotation

    .line 53
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfNumTree;->items:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 54
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfNumTree;->items:Ljava/util/Map;

    return-object v0

    .line 57
    :cond_0
    const/4 v0, 0x0

    .line 58
    .local v0, "numbers":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfNumTree;->treeType:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->PageLabels:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 59
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfNumTree;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->PageLabels:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    goto :goto_0

    .line 60
    :cond_1
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfNumTree;->treeType:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->ParentTree:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 61
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfNumTree;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->StructTreeRoot:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    .line 62
    .local v1, "structTreeRoot":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v1, :cond_2

    .line 63
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->ParentTree:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 67
    .end local v1    # "structTreeRoot":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_2
    :goto_0
    if-eqz v0, :cond_3

    .line 68
    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfNumTree;->readTree(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 71
    :cond_3
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfNumTree;->items:Ljava/util/Map;

    return-object v1
.end method
