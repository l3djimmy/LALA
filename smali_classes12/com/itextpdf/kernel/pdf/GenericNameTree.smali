.class public Lcom/itextpdf/kernel/pdf/GenericNameTree;
.super Ljava/lang/Object;
.source "GenericNameTree.java"

# interfaces
.implements Lcom/itextpdf/kernel/pdf/IPdfNameTreeAccess;


# static fields
.field private static final LOGGER:Lorg/slf4j/Logger;

.field private static final NODE_SIZE:I = 0x28


# instance fields
.field private items:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Lcom/itextpdf/kernel/pdf/PdfString;",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;"
        }
    .end annotation
.end field

.field private modified:Z

.field private final pdfDoc:Lcom/itextpdf/kernel/pdf/PdfDocument;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 44
    const-class v0, Lcom/itextpdf/kernel/pdf/GenericNameTree;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/GenericNameTree;->LOGGER:Lorg/slf4j/Logger;

    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 1
    .param p1, "pdfDoc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/GenericNameTree;->items:Ljava/util/LinkedHashMap;

    .line 57
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/GenericNameTree;->pdfDoc:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 58
    return-void
.end method

.method private constructLeafArr([Lcom/itextpdf/kernel/pdf/PdfString;)[Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 8
    .param p1, "names"    # [Lcom/itextpdf/kernel/pdf/PdfString;

    .line 250
    array-length v0, p1

    add-int/lit8 v0, v0, 0x28

    add-int/lit8 v0, v0, -0x1

    div-int/lit8 v0, v0, 0x28

    new-array v0, v0, [Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 251
    .local v0, "leaves":[Lcom/itextpdf/kernel/pdf/PdfDictionary;
    const/4 v1, 0x0

    .local v1, "k":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_1

    .line 252
    mul-int/lit8 v2, v1, 0x28

    .line 253
    .local v2, "offset":I
    add-int/lit8 v3, v2, 0x28

    array-length v4, p1

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 254
    .local v3, "end":I
    add-int/lit8 v4, v3, -0x1

    invoke-direct {p0, p1, v2, v4}, Lcom/itextpdf/kernel/pdf/GenericNameTree;->formatNodeWithLimits([Lcom/itextpdf/kernel/pdf/PdfString;II)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v4

    .line 255
    .local v4, "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    new-instance v5, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v5}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 256
    .local v5, "namesArr":Lcom/itextpdf/kernel/pdf/PdfArray;
    :goto_1
    if-ge v2, v3, :cond_0

    .line 257
    aget-object v6, p1, v2

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 258
    iget-object v6, p0, Lcom/itextpdf/kernel/pdf/GenericNameTree;->items:Ljava/util/LinkedHashMap;

    aget-object v7, p1, v2

    invoke-virtual {v6, v7}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/kernel/pdf/PdfObject;

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 256
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 260
    :cond_0
    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->Names:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4, v6, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 261
    iget-object v6, p0, Lcom/itextpdf/kernel/pdf/GenericNameTree;->pdfDoc:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v4, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 262
    aput-object v4, v0, v1

    .line 251
    .end local v2    # "offset":I
    .end local v3    # "end":I
    .end local v4    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v5    # "namesArr":Lcom/itextpdf/kernel/pdf/PdfArray;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 264
    .end local v1    # "k":I
    :cond_1
    return-object v0
.end method

.method private formatNodeWithLimits([Lcom/itextpdf/kernel/pdf/PdfString;II)Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 3
    .param p1, "names"    # [Lcom/itextpdf/kernel/pdf/PdfString;
    .param p2, "lower"    # I
    .param p3, "upper"    # I

    .line 205
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 206
    .local v0, "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/GenericNameTree;->pdfDoc:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 207
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 208
    .local v1, "limitsArr":Lcom/itextpdf/kernel/pdf/PdfArray;
    aget-object v2, p1, p2

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 209
    aget-object v2, p1, p3

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 210
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Limits:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v2, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 211
    return-object v0
.end method

.method private static iterateItems(Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/util/Map;Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/kernel/pdf/PdfString;
    .locals 7
    .param p0, "dictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "leftOver"    # Lcom/itextpdf/kernel/pdf/PdfString;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfString;",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;",
            "Lcom/itextpdf/kernel/pdf/PdfString;",
            ")",
            "Lcom/itextpdf/kernel/pdf/PdfString;"
        }
    .end annotation

    .line 275
    .local p1, "items":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Names:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 276
    .local v0, "names":Lcom/itextpdf/kernel/pdf/PdfArray;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Kids:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v1

    .line 277
    .local v1, "kids":Lcom/itextpdf/kernel/pdf/PdfArray;
    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v4

    if-lez v4, :cond_0

    move v4, v3

    goto :goto_0

    :cond_0
    move v4, v2

    .line 278
    .local v4, "isLeafNode":Z
    :goto_0
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v5

    if-lez v5, :cond_1

    move v2, v3

    .line 279
    .local v2, "isIntermNode":Z
    :cond_1
    if-eqz v4, :cond_2

    .line 280
    invoke-static {v0, p1, p2}, Lcom/itextpdf/kernel/pdf/GenericNameTree;->iterateLeafNode(Lcom/itextpdf/kernel/pdf/PdfArray;Ljava/util/Map;Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v3

    return-object v3

    .line 281
    :cond_2
    if-eqz v2, :cond_4

    .line 283
    move-object v3, p2

    .line 284
    .local v3, "curLeftOver":Lcom/itextpdf/kernel/pdf/PdfString;
    const/4 v5, 0x0

    .local v5, "k":I
    :goto_1
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v6

    if-ge v5, v6, :cond_3

    .line 285
    invoke-virtual {v1, v5}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsDictionary(I)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v6

    .line 286
    .local v6, "kid":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-static {v6, p1, v3}, Lcom/itextpdf/kernel/pdf/GenericNameTree;->iterateItems(Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/util/Map;Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v3

    .line 284
    .end local v6    # "kid":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 288
    .end local v5    # "k":I
    :cond_3
    return-object v3

    .line 290
    .end local v3    # "curLeftOver":Lcom/itextpdf/kernel/pdf/PdfString;
    :cond_4
    return-object p2
.end method

.method private static iterateLeafNode(Lcom/itextpdf/kernel/pdf/PdfArray;Ljava/util/Map;Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/kernel/pdf/PdfString;
    .locals 3
    .param p0, "names"    # Lcom/itextpdf/kernel/pdf/PdfArray;
    .param p2, "leftOver"    # Lcom/itextpdf/kernel/pdf/PdfString;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfArray;",
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfString;",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;",
            "Lcom/itextpdf/kernel/pdf/PdfString;",
            ")",
            "Lcom/itextpdf/kernel/pdf/PdfString;"
        }
    .end annotation

    .line 300
    .local p1, "items":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    const/4 v0, 0x0

    .line 301
    .local v0, "k":I
    if-eqz p2, :cond_0

    .line 305
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-interface {p1, p2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 307
    add-int/lit8 v0, v0, 0x1

    .line 310
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_3

    .line 311
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsString(I)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v1

    .line 312
    .local v1, "name":Lcom/itextpdf/kernel/pdf/PdfString;
    add-int/lit8 v0, v0, 0x1

    .line 313
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v2

    if-ne v0, v2, :cond_1

    .line 315
    return-object v1

    .line 317
    :cond_1
    if-eqz v1, :cond_2

    .line 318
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-interface {p1, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 320
    :cond_2
    nop

    .end local v1    # "name":Lcom/itextpdf/kernel/pdf/PdfString;
    add-int/lit8 v0, v0, 0x1

    .line 321
    goto :goto_0

    .line 322
    :cond_3
    const/4 v1, 0x0

    return-object v1
.end method

.method protected static readTree(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Ljava/util/LinkedHashMap;
    .locals 2
    .param p0, "dictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            ")",
            "Ljava/util/LinkedHashMap<",
            "Lcom/itextpdf/kernel/pdf/PdfString;",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;"
        }
    .end annotation

    .line 197
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 198
    .local v0, "items":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    if-eqz p0, :cond_0

    .line 199
    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/GenericNameTree;->iterateItems(Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/util/Map;Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/kernel/pdf/PdfString;

    .line 201
    :cond_0
    return-object v0
.end method

.method private reduceTree([Lcom/itextpdf/kernel/pdf/PdfString;[Lcom/itextpdf/kernel/pdf/PdfDictionary;II)Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 9
    .param p1, "names"    # [Lcom/itextpdf/kernel/pdf/PdfString;
    .param p2, "topLayer"    # [Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p3, "topLayerLen"    # I
    .param p4, "curNodeSpan"    # I

    .line 218
    const/16 v0, 0x28

    if-gt p3, v0, :cond_1

    .line 220
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 221
    .local v0, "kidsArr":Lcom/itextpdf/kernel/pdf/PdfArray;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, p3, :cond_0

    .line 222
    aget-object v2, p2, v1

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 221
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 224
    .end local v1    # "i":I
    :cond_0
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 225
    .local v1, "root":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Kids:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 226
    return-object v1

    .line 231
    .end local v0    # "kidsArr":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v1    # "root":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_1
    array-length v0, p1

    add-int/2addr v0, p4

    add-int/lit8 v0, v0, -0x1

    div-int/2addr v0, p4

    .line 232
    .local v0, "nextLayerLen":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, v0, :cond_3

    .line 233
    mul-int v2, v1, p4

    .line 234
    .local v2, "lowerLimit":I
    add-int/lit8 v3, v1, 0x1

    mul-int/2addr v3, p4

    array-length v4, p1

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    .line 235
    .local v3, "upperLimit":I
    invoke-direct {p0, p1, v2, v3}, Lcom/itextpdf/kernel/pdf/GenericNameTree;->formatNodeWithLimits([Lcom/itextpdf/kernel/pdf/PdfString;II)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v4

    .line 236
    .local v4, "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    new-instance v5, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v5}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 237
    .local v5, "kidsArr":Lcom/itextpdf/kernel/pdf/PdfArray;
    mul-int/lit8 v6, v1, 0x28

    .line 238
    .local v6, "offset":I
    add-int/lit8 v7, v6, 0x28

    invoke-static {v7, p3}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 239
    .local v7, "end":I
    :goto_2
    if-ge v6, v7, :cond_2

    .line 240
    aget-object v8, p2, v6

    invoke-virtual {v5, v8}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 239
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 242
    :cond_2
    sget-object v8, Lcom/itextpdf/kernel/pdf/PdfName;->Kids:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4, v8, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 243
    aput-object v4, p2, v1

    .line 232
    .end local v2    # "lowerLimit":I
    .end local v3    # "upperLimit":I
    .end local v4    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v5    # "kidsArr":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v6    # "offset":I
    .end local v7    # "end":I
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 246
    .end local v1    # "i":I
    :cond_3
    mul-int/lit8 v1, p4, 0x28

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/itextpdf/kernel/pdf/GenericNameTree;->reduceTree([Lcom/itextpdf/kernel/pdf/PdfString;[Lcom/itextpdf/kernel/pdf/PdfDictionary;II)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public addEntry(Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfObject;)V
    .locals 1
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfString;
    .param p2, "value"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 67
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/itextpdf/kernel/pdf/GenericNameTree;->addEntry(Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfObject;Ljava/util/function/Consumer;)V

    .line 68
    return-void
.end method

.method protected addEntry(Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfObject;Ljava/util/function/Consumer;)V
    .locals 5
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfString;
    .param p2, "value"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfString;",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            "Ljava/util/function/Consumer<",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            ">;)V"
        }
    .end annotation

    .line 165
    .local p3, "onErrorAction":Ljava/util/function/Consumer;, "Ljava/util/function/Consumer<Lcom/itextpdf/kernel/pdf/PdfDocument;>;"
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/GenericNameTree;->items:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 166
    .local v0, "existingVal":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v0, :cond_1

    .line 167
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v1

    .line 168
    .local v1, "valueRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 169
    return-void

    .line 171
    :cond_0
    sget-object v2, Lcom/itextpdf/kernel/pdf/GenericNameTree;->LOGGER:Lorg/slf4j/Logger;

    const-string v3, "Name \"{0}\" already exists in the name tree; old value will be replaced by the new one."

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 172
    if-eqz p3, :cond_1

    .line 173
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/GenericNameTree;->pdfDoc:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-interface {p3, v2}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 177
    .end local v1    # "valueRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    :cond_1
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/itextpdf/kernel/pdf/GenericNameTree;->modified:Z

    .line 178
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/GenericNameTree;->items:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p1, p2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    return-void
.end method

.method public addEntry(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfObject;)V
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 77
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfString;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0, p2}, Lcom/itextpdf/kernel/pdf/GenericNameTree;->addEntry(Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 78
    return-void
.end method

.method public buildTree()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 7

    .line 138
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/GenericNameTree;->items:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    const/4 v1, 0x0

    new-array v2, v1, [Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-interface {v0, v2}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/itextpdf/kernel/pdf/PdfString;

    .line 140
    .local v0, "names":[Lcom/itextpdf/kernel/pdf/PdfString;
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfStringComparator;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/PdfStringComparator;-><init>()V

    invoke-static {v0, v2}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 141
    array-length v2, v0

    const/16 v3, 0x28

    if-gt v2, v3, :cond_1

    .line 143
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 144
    .local v2, "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v3}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 145
    .local v3, "ar":Lcom/itextpdf/kernel/pdf/PdfArray;
    array-length v4, v0

    :goto_0
    if-ge v1, v4, :cond_0

    aget-object v5, v0, v1

    .line 146
    .local v5, "name":Lcom/itextpdf/kernel/pdf/PdfString;
    invoke-virtual {v3, v5}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 147
    iget-object v6, p0, Lcom/itextpdf/kernel/pdf/GenericNameTree;->items:Ljava/util/LinkedHashMap;

    invoke-virtual {v6, v5}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/kernel/pdf/PdfObject;

    invoke-virtual {v3, v6}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 145
    .end local v5    # "name":Lcom/itextpdf/kernel/pdf/PdfString;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 149
    :cond_0
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Names:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v1, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 150
    return-object v2

    .line 152
    .end local v2    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v3    # "ar":Lcom/itextpdf/kernel/pdf/PdfArray;
    :cond_1
    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/GenericNameTree;->constructLeafArr([Lcom/itextpdf/kernel/pdf/PdfString;)[Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    .line 154
    .local v1, "leaves":[Lcom/itextpdf/kernel/pdf/PdfDictionary;
    array-length v2, v1

    const/16 v3, 0x640

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/itextpdf/kernel/pdf/GenericNameTree;->reduceTree([Lcom/itextpdf/kernel/pdf/PdfString;[Lcom/itextpdf/kernel/pdf/PdfDictionary;II)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    return-object v2
.end method

.method public getEntry(Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 98
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/GenericNameTree;->items:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfObject;

    return-object v0
.end method

.method public getEntry(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .line 106
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/GenericNameTree;->getEntry(Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0
.end method

.method protected final getItems()Ljava/util/LinkedHashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/LinkedHashMap<",
            "Lcom/itextpdf/kernel/pdf/PdfString;",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;"
        }
    .end annotation

    .line 186
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/GenericNameTree;->items:Ljava/util/LinkedHashMap;

    return-object v0
.end method

.method public getKeys()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfString;",
            ">;"
        }
    .end annotation

    .line 112
    new-instance v0, Ljava/util/LinkedHashSet;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/GenericNameTree;->items:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public isModified()Z
    .locals 1

    .line 121
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/GenericNameTree;->modified:Z

    return v0
.end method

.method public removeEntry(Lcom/itextpdf/kernel/pdf/PdfString;)V
    .locals 2
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 86
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/GenericNameTree;->items:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 88
    .local v0, "existingVal":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v0, :cond_0

    .line 89
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/itextpdf/kernel/pdf/GenericNameTree;->modified:Z

    .line 91
    :cond_0
    return-void
.end method

.method protected final setItems(Ljava/util/LinkedHashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/LinkedHashMap<",
            "Lcom/itextpdf/kernel/pdf/PdfString;",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;)V"
        }
    .end annotation

    .line 182
    .local p1, "items":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/GenericNameTree;->items:Ljava/util/LinkedHashMap;

    .line 183
    return-void
.end method

.method public setModified()V
    .locals 1

    .line 128
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/GenericNameTree;->modified:Z

    .line 129
    return-void
.end method
