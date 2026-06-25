.class public Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfOCProperties.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
        "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
        ">;"
    }
.end annotation


# static fields
.field static final OC_CONFIG_NAME_PATTERN:Ljava/lang/String; = "OCConfigName"


# instance fields
.field private layers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/layer/PdfLayer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 1
    .param p1, "ocPropertiesDict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 68
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 50
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->layers:Ljava/util/List;

    .line 69
    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->ensureObjectIsAddedToDocument(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 70
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->readLayersFromDictionary()V

    .line 71
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 1
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 58
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 59
    return-void
.end method

.method private addASEvent(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfName;)V
    .locals 6
    .param p1, "event"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "category"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 330
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 331
    .local v0, "arr":Lcom/itextpdf/kernel/pdf/PdfArray;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->layers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;

    .line 332
    .local v2, "layer":Lcom/itextpdf/kernel/pdf/layer/PdfLayer;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getTitle()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_0

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->isFlushed()Z

    move-result v3

    if-nez v3, :cond_0

    .line 333
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Usage:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v3

    .line 334
    .local v3, "usage":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v3, :cond_0

    invoke-virtual {v3, p2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 335
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 337
    .end local v2    # "layer":Lcom/itextpdf/kernel/pdf/layer/PdfLayer;
    .end local v3    # "usage":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_0
    goto :goto_0

    .line 338
    :cond_1
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v1

    if-nez v1, :cond_2

    .line 339
    return-void

    .line 340
    :cond_2
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    .line 341
    .local v1, "d":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->AS:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v2

    .line 342
    .local v2, "arras":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-nez v2, :cond_3

    .line 343
    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v3}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    move-object v2, v3

    .line 344
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->AS:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v3, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 346
    :cond_3
    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 347
    .local v3, "as":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Event:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v4, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 348
    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v4}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 349
    .local v4, "categoryArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-virtual {v4, p2}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 350
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->Category:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v5, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 351
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->OCGs:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v5, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 352
    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 353
    return-void
.end method

.method public static checkDDictonaryFieldValue(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Z
    .locals 2
    .param p0, "field"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p1, "value"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 211
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->BaseState:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, p0}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->ON:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 212
    return v1

    .line 214
    :cond_0
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Intent:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, p0}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->View:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 215
    return v1

    .line 217
    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method private static copyDDictionaryField(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 4
    .param p0, "fieldToAdd"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p1, "fromDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "toDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 285
    invoke-virtual {p1, p0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 286
    .local v0, "value":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v0, :cond_1

    .line 287
    invoke-static {p0, v0}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->checkDDictonaryFieldValue(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 288
    invoke-virtual {p2, p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_0

    .line 290
    :cond_0
    const-class v1, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;

    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    .line 291
    .local v1, "logger":Lorg/slf4j/Logger;
    const-string v2, "The default configuration dictionary field {0} has a value of {1}, which is not the required value for this field. The field will not be processed."

    filled-new-array {p0, v0}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 293
    .local v2, "warnText":Ljava/lang/String;
    invoke-interface {v1, v2}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 296
    .end local v1    # "logger":Lorg/slf4j/Logger;
    .end local v2    # "warnText":Ljava/lang/String;
    :cond_1
    :goto_0
    return-void
.end method

.method private createUniqueName()Ljava/lang/String;
    .locals 6

    .line 449
    const/4 v0, 0x0

    .line 450
    .local v0, "uniqueID":I
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 451
    .local v1, "usedNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Configs:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v2

    .line 452
    .local v2, "configs":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-eqz v2, :cond_1

    .line 453
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v4

    if-ge v3, v4, :cond_1

    .line 454
    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsDictionary(I)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v4

    .line 455
    .local v4, "alternateDictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v4, :cond_0

    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->Name:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 456
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->Name:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfString;->toUnicodeString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 453
    .end local v4    # "alternateDictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 460
    .end local v3    # "i":I
    :cond_1
    :goto_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "OCConfigName"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 461
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 463
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private static getOCGOrder(Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/layer/PdfLayer;)V
    .locals 5
    .param p0, "order"    # Lcom/itextpdf/kernel/pdf/PdfArray;
    .param p1, "layer"    # Lcom/itextpdf/kernel/pdf/layer/PdfLayer;

    .line 267
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->isOnPanel()Z

    move-result v0

    if-nez v0, :cond_0

    .line 268
    return-void

    .line 269
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getTitle()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    .line 270
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 271
    :cond_1
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getChildren()Ljava/util/List;

    move-result-object v0

    .line 272
    .local v0, "children":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/layer/PdfLayer;>;"
    if-nez v0, :cond_2

    .line 273
    return-void

    .line 274
    :cond_2
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 275
    .local v1, "kids":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getTitle()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 276
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getTitle()Ljava/lang/String;

    move-result-object v3

    const-string v4, "UnicodeBig"

    invoke-direct {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 277
    :cond_3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;

    .line 278
    .local v3, "child":Lcom/itextpdf/kernel/pdf/layer/PdfLayer;
    invoke-static {v1, v3}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->getOCGOrder(Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/layer/PdfLayer;)V

    .line 279
    .end local v3    # "child":Lcom/itextpdf/kernel/pdf/layer/PdfLayer;
    goto :goto_0

    .line 280
    :cond_4
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v2

    if-lez v2, :cond_5

    .line 281
    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 282
    :cond_5
    return-void
.end method

.method private readLayersFromDictionary()V
    .locals 10

    .line 359
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->OCGs:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 360
    .local v0, "ocgs":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-eqz v0, :cond_9

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto/16 :goto_6

    .line 363
    :cond_0
    new-instance v1, Ljava/util/TreeMap;

    invoke-direct {v1}, Ljava/util/TreeMap;-><init>()V

    .line 364
    .local v1, "layerMap":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;Lcom/itextpdf/kernel/pdf/layer/PdfLayer;>;"
    const/4 v2, 0x0

    .local v2, "ind":I
    :goto_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v3

    const/4 v4, 0x0

    if-ge v2, v3, :cond_1

    .line 365
    new-instance v3, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsDictionary(I)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v5

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v3, v5}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 367
    .local v3, "currentLayer":Lcom/itextpdf/kernel/pdf/layer/PdfLayer;
    iput-boolean v4, v3, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->onPanel:Z

    .line 368
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v4

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 364
    .end local v3    # "currentLayer":Lcom/itextpdf/kernel/pdf/layer/PdfLayer;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 371
    .end local v2    # "ind":I
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    .line 372
    .local v2, "d":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v2, :cond_6

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_6

    .line 373
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->OFF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v3

    .line 374
    .local v3, "off":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-eqz v3, :cond_3

    .line 375
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v6

    if-ge v5, v6, :cond_3

    .line 376
    invoke-virtual {v3, v5, v4}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(IZ)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v6

    .line 377
    .local v6, "offLayer":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfObject;->isIndirectReference()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 378
    move-object v7, v6

    check-cast v7, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-interface {v1, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;

    iput-boolean v4, v7, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->on:Z

    goto :goto_2

    .line 380
    :cond_2
    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v7

    invoke-interface {v1, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;

    iput-boolean v4, v7, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->on:Z

    .line 375
    .end local v6    # "offLayer":Lcom/itextpdf/kernel/pdf/PdfObject;
    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 385
    .end local v5    # "i":I
    :cond_3
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->Locked:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v5

    .line 386
    .local v5, "locked":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-eqz v5, :cond_5

    .line 387
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_3
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v7

    if-ge v6, v7, :cond_5

    .line 388
    invoke-virtual {v5, v6, v4}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(IZ)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v7

    .line 389
    .local v7, "lockedLayer":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfObject;->isIndirectReference()Z

    move-result v8

    const/4 v9, 0x1

    if-eqz v8, :cond_4

    .line 390
    move-object v8, v7

    check-cast v8, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-interface {v1, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;

    iput-boolean v9, v8, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->locked:Z

    goto :goto_4

    .line 392
    :cond_4
    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v8

    invoke-interface {v1, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;

    iput-boolean v9, v8, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->locked:Z

    .line 387
    .end local v7    # "lockedLayer":Lcom/itextpdf/kernel/pdf/PdfObject;
    :goto_4
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 397
    .end local v6    # "i":I
    :cond_5
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Order:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v4

    .line 398
    .local v4, "orderArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-eqz v4, :cond_6

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfArray;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_6

    .line 399
    const/4 v6, 0x0

    invoke-direct {p0, v6, v4, v1}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->readOrderFromDictionary(Lcom/itextpdf/kernel/pdf/layer/PdfLayer;Lcom/itextpdf/kernel/pdf/PdfArray;Ljava/util/Map;)V

    .line 403
    .end local v3    # "off":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v4    # "orderArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v5    # "locked":Lcom/itextpdf/kernel/pdf/PdfArray;
    :cond_6
    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_5
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_8

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;

    .line 404
    .local v4, "layer":Lcom/itextpdf/kernel/pdf/layer/PdfLayer;
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->isOnPanel()Z

    move-result v5

    if-nez v5, :cond_7

    .line 405
    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->layers:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 406
    .end local v4    # "layer":Lcom/itextpdf/kernel/pdf/layer/PdfLayer;
    :cond_7
    goto :goto_5

    .line 407
    :cond_8
    return-void

    .line 361
    .end local v1    # "layerMap":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;Lcom/itextpdf/kernel/pdf/layer/PdfLayer;>;"
    .end local v2    # "d":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_9
    :goto_6
    return-void
.end method

.method private readOrderFromDictionary(Lcom/itextpdf/kernel/pdf/layer/PdfLayer;Lcom/itextpdf/kernel/pdf/PdfArray;Ljava/util/Map;)V
    .locals 8
    .param p1, "parent"    # Lcom/itextpdf/kernel/pdf/layer/PdfLayer;
    .param p2, "orderArray"    # Lcom/itextpdf/kernel/pdf/PdfArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/layer/PdfLayer;",
            "Lcom/itextpdf/kernel/pdf/PdfArray;",
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            "Lcom/itextpdf/kernel/pdf/layer/PdfLayer;",
            ">;)V"
        }
    .end annotation

    .line 413
    .local p3, "layerMap":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;Lcom/itextpdf/kernel/pdf/layer/PdfLayer;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_6

    .line 414
    invoke-virtual {p2, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 415
    .local v1, "item":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v2

    const/4 v3, 0x3

    const/16 v4, 0xa

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-ne v2, v3, :cond_2

    .line 416
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v2

    invoke-interface {p3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;

    .line 417
    .local v2, "layer":Lcom/itextpdf/kernel/pdf/layer/PdfLayer;
    if-eqz v2, :cond_1

    .line 418
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->layers:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 419
    iput-boolean v6, v2, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->onPanel:Z

    .line 420
    if-eqz p1, :cond_0

    .line 421
    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->addChild(Lcom/itextpdf/kernel/pdf/layer/PdfLayer;)V

    .line 422
    :cond_0
    add-int/lit8 v3, v0, 0x1

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v7

    if-ge v3, v7, :cond_1

    add-int/lit8 v3, v0, 0x1

    invoke-virtual {p2, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v3

    if-ne v3, v6, :cond_1

    .line 423
    add-int/lit8 v3, v0, 0x1

    invoke-virtual {p2, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsArray(I)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v3

    .line 424
    .local v3, "nextArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v7

    if-lez v7, :cond_1

    invoke-virtual {v3, v5}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v5

    if-eq v5, v4, :cond_1

    .line 425
    add-int/lit8 v4, v0, 0x1

    invoke-virtual {p2, v4}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsArray(I)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v4

    invoke-direct {p0, v2, v4, p3}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->readOrderFromDictionary(Lcom/itextpdf/kernel/pdf/layer/PdfLayer;Lcom/itextpdf/kernel/pdf/PdfArray;Ljava/util/Map;)V

    .line 426
    add-int/lit8 v0, v0, 0x1

    .line 430
    .end local v2    # "layer":Lcom/itextpdf/kernel/pdf/layer/PdfLayer;
    .end local v3    # "nextArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    :cond_1
    goto :goto_1

    :cond_2
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v2

    if-ne v2, v6, :cond_1

    .line 431
    move-object v2, v1

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 432
    .local v2, "subArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_3

    goto :goto_1

    .line 433
    :cond_3
    invoke-virtual {v2, v5}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    .line 434
    .local v3, "firstObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v5

    if-ne v5, v4, :cond_5

    .line 435
    move-object v4, v3

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfString;->toUnicodeString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->createTitleSilent(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/layer/PdfLayer;

    move-result-object v4

    .line 436
    .local v4, "titleLayer":Lcom/itextpdf/kernel/pdf/layer/PdfLayer;
    iput-boolean v6, v4, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->onPanel:Z

    .line 437
    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->layers:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 438
    if-eqz p1, :cond_4

    .line 439
    invoke-virtual {p1, v4}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->addChild(Lcom/itextpdf/kernel/pdf/layer/PdfLayer;)V

    .line 440
    :cond_4
    new-instance v5, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v7

    invoke-virtual {v2, v6, v7}, Lcom/itextpdf/kernel/pdf/PdfArray;->subList(II)Ljava/util/List;

    move-result-object v7

    invoke-direct {v5, v7}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>(Ljava/util/List;)V

    invoke-direct {p0, v4, v5, p3}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->readOrderFromDictionary(Lcom/itextpdf/kernel/pdf/layer/PdfLayer;Lcom/itextpdf/kernel/pdf/PdfArray;Ljava/util/Map;)V

    .line 441
    .end local v4    # "titleLayer":Lcom/itextpdf/kernel/pdf/layer/PdfLayer;
    goto :goto_1

    .line 442
    :cond_5
    invoke-direct {p0, p1, v2, p3}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->readOrderFromDictionary(Lcom/itextpdf/kernel/pdf/layer/PdfLayer;Lcom/itextpdf/kernel/pdf/PdfArray;Ljava/util/Map;)V

    .line 413
    .end local v1    # "item":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local v2    # "subArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v3    # "firstObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    :goto_1
    add-int/2addr v0, v6

    goto/16 :goto_0

    .line 446
    .end local v0    # "i":I
    :cond_6
    return-void
.end method

.method private removeNotRegisteredOcgs()V
    .locals 9

    .line 299
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 301
    .local v0, "dDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->OCProperties:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    .line 302
    .local v1, "ocProperties":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 303
    .local v2, "ocgsFromDocument":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->OCGs:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 304
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->OCGs:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v3

    .line 305
    .local v3, "ocgs":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 306
    .local v5, "ocgObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfObject;->isDictionary()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 307
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v6

    invoke-interface {v2, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 309
    .end local v5    # "ocgObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_0
    goto :goto_0

    .line 313
    .end local v3    # "ocgs":Lcom/itextpdf/kernel/pdf/PdfArray;
    :cond_1
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->RBGroups:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v3

    .line 314
    .local v3, "rbGroups":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-eqz v3, :cond_4

    .line 315
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 316
    .local v5, "rbGroupObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    move-object v6, v5

    check-cast v6, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 317
    .local v6, "rbGroup":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    .local v7, "i":I
    :goto_2
    const/4 v8, -0x1

    if-le v7, v8, :cond_3

    .line 318
    invoke-virtual {v6, v7}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v8

    invoke-interface {v2, v8}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_2

    .line 319
    invoke-virtual {v6, v7}, Lcom/itextpdf/kernel/pdf/PdfArray;->remove(I)V

    .line 317
    :cond_2
    add-int/lit8 v7, v7, -0x1

    goto :goto_2

    .line 322
    .end local v5    # "rbGroupObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local v6    # "rbGroup":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v7    # "i":I
    :cond_3
    goto :goto_1

    .line 324
    :cond_4
    return-void
.end method


# virtual methods
.method public addOCGRadioGroup(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/layer/PdfLayer;",
            ">;)V"
        }
    .end annotation

    .line 83
    .local p1, "group":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/layer/PdfLayer;>;"
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 84
    .local v0, "ar":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;

    .line 85
    .local v2, "layer":Lcom/itextpdf/kernel/pdf/layer/PdfLayer;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getTitle()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_0

    .line 86
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 87
    .end local v2    # "layer":Lcom/itextpdf/kernel/pdf/layer/PdfLayer;
    :cond_0
    goto :goto_0

    .line 88
    :cond_1
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v1

    if-eqz v1, :cond_4

    .line 89
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    .line 90
    .local v1, "d":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-nez v1, :cond_2

    .line 91
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    move-object v1, v2

    .line 92
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 94
    :cond_2
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->RBGroups:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v2

    .line 95
    .local v2, "radioButtonGroups":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-nez v2, :cond_3

    .line 96
    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v3}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    move-object v2, v3

    .line 97
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->RBGroups:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v3, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 98
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->setModified()Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_1

    .line 100
    :cond_3
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->setModified()Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 102
    :goto_1
    invoke-virtual {v2, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 104
    .end local v1    # "d":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v2    # "radioButtonGroups":Lcom/itextpdf/kernel/pdf/PdfArray;
    :cond_4
    return-void
.end method

.method public fillDictionary()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1

    .line 114
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->fillDictionary(Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0
.end method

.method public fillDictionary(Z)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 10
    .param p1, "removeNonDocumentOcgs"    # Z

    .line 127
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 128
    .local v0, "gr":Lcom/itextpdf/kernel/pdf/PdfArray;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->layers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;

    .line 129
    .local v2, "layer":Lcom/itextpdf/kernel/pdf/layer/PdfLayer;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getTitle()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_0

    .line 130
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 131
    .end local v2    # "layer":Lcom/itextpdf/kernel/pdf/layer/PdfLayer;
    :cond_0
    goto :goto_0

    .line 132
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->OCGs:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 134
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 137
    .local v1, "filledDDictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    .line 138
    .local v2, "dDictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v2, :cond_2

    .line 139
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->RBGroups:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v3, v2, v1}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->copyDDictionaryField(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 140
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Name:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v3, v2, v1}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->copyDDictionaryField(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 141
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->BaseState:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v3, v2, v1}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->copyDDictionaryField(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 142
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Intent:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v3, v2, v1}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->copyDDictionaryField(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 143
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->ListMode:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v3, v2, v1}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->copyDDictionaryField(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 146
    :cond_2
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Name:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    if-nez v3, :cond_3

    .line 147
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Name:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->createUniqueName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "UnicodeBig"

    invoke-direct {v4, v5, v6}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 150
    :cond_3
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v4, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 152
    new-instance v3, Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->layers:Ljava/util/List;

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 153
    .local v3, "docOrder":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/layer/PdfLayer;>;"
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    if-ge v4, v5, :cond_5

    .line 154
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;

    .line 155
    .local v5, "layer":Lcom/itextpdf/kernel/pdf/layer/PdfLayer;
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getParent()Lcom/itextpdf/kernel/pdf/layer/PdfLayer;

    move-result-object v6

    if-eqz v6, :cond_4

    .line 156
    invoke-interface {v3, v5}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 157
    add-int/lit8 v4, v4, -0x1

    .line 153
    .end local v5    # "layer":Lcom/itextpdf/kernel/pdf/layer/PdfLayer;
    :cond_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 161
    .end local v4    # "i":I
    :cond_5
    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v4}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 162
    .local v4, "order":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_6

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    .line 163
    .local v6, "element":Ljava/lang/Object;
    move-object v7, v6

    check-cast v7, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;

    .line 164
    .local v7, "layer":Lcom/itextpdf/kernel/pdf/layer/PdfLayer;
    invoke-static {v4, v7}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->getOCGOrder(Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/layer/PdfLayer;)V

    .line 165
    .end local v6    # "element":Ljava/lang/Object;
    .end local v7    # "layer":Lcom/itextpdf/kernel/pdf/layer/PdfLayer;
    goto :goto_2

    .line 166
    :cond_6
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->Order:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v5, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 168
    new-instance v5, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v5}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 169
    .local v5, "off":Lcom/itextpdf/kernel/pdf/PdfArray;
    iget-object v6, p0, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->layers:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_3
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_8

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    .line 170
    .local v7, "element":Ljava/lang/Object;
    move-object v8, v7

    check-cast v8, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;

    .line 171
    .local v8, "layer":Lcom/itextpdf/kernel/pdf/layer/PdfLayer;
    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getTitle()Ljava/lang/String;

    move-result-object v9

    if-nez v9, :cond_7

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->isOn()Z

    move-result v9

    if-nez v9, :cond_7

    .line 172
    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v9

    invoke-virtual {v5, v9}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 173
    .end local v7    # "element":Ljava/lang/Object;
    .end local v8    # "layer":Lcom/itextpdf/kernel/pdf/layer/PdfLayer;
    :cond_7
    goto :goto_3

    .line 175
    :cond_8
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v6

    if-lez v6, :cond_9

    .line 176
    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->OFF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v6, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 179
    :cond_9
    new-instance v6, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v6}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 180
    .local v6, "locked":Lcom/itextpdf/kernel/pdf/PdfArray;
    iget-object v7, p0, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->layers:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_4
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_b

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;

    .line 181
    .restart local v8    # "layer":Lcom/itextpdf/kernel/pdf/layer/PdfLayer;
    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getTitle()Ljava/lang/String;

    move-result-object v9

    if-nez v9, :cond_a

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->isLocked()Z

    move-result v9

    if-eqz v9, :cond_a

    .line 182
    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v9

    invoke-virtual {v6, v9}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 183
    .end local v8    # "layer":Lcom/itextpdf/kernel/pdf/layer/PdfLayer;
    :cond_a
    goto :goto_4

    .line 184
    :cond_b
    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v7

    if-lez v7, :cond_c

    .line 185
    sget-object v7, Lcom/itextpdf/kernel/pdf/PdfName;->Locked:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v7, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 188
    :cond_c
    sget-object v7, Lcom/itextpdf/kernel/pdf/PdfName;->View:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v8, Lcom/itextpdf/kernel/pdf/PdfName;->Zoom:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {p0, v7, v8}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->addASEvent(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfName;)V

    .line 189
    sget-object v7, Lcom/itextpdf/kernel/pdf/PdfName;->View:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v8, Lcom/itextpdf/kernel/pdf/PdfName;->View:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {p0, v7, v8}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->addASEvent(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfName;)V

    .line 190
    sget-object v7, Lcom/itextpdf/kernel/pdf/PdfName;->Print:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v8, Lcom/itextpdf/kernel/pdf/PdfName;->Print:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {p0, v7, v8}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->addASEvent(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfName;)V

    .line 191
    sget-object v7, Lcom/itextpdf/kernel/pdf/PdfName;->Export:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v8, Lcom/itextpdf/kernel/pdf/PdfName;->Export:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {p0, v7, v8}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->addASEvent(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfName;)V

    .line 193
    if-eqz p1, :cond_d

    .line 194
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->removeNotRegisteredOcgs()V

    .line 197
    :cond_d
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v7

    return-object v7
.end method

.method public flush()V
    .locals 0

    .line 222
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->fillDictionary()Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 223
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;->flush()V

    .line 224
    return-void
.end method

.method protected getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;
    .locals 1

    .line 259
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    return-object v0
.end method

.method public getLayers()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/layer/PdfLayer;",
            ">;"
        }
    .end annotation

    .line 233
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->layers:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 238
    const/4 v0, 0x1

    return v0
.end method

.method protected registerLayer(Lcom/itextpdf/kernel/pdf/layer/PdfLayer;)V
    .locals 2
    .param p1, "layer"    # Lcom/itextpdf/kernel/pdf/layer/PdfLayer;

    .line 248
    if-eqz p1, :cond_0

    .line 250
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->layers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 251
    return-void

    .line 249
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "layer argument is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
