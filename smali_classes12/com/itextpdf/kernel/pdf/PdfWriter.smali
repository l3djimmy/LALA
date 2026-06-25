.class public Lcom/itextpdf/kernel/pdf/PdfWriter;
.super Lcom/itextpdf/kernel/pdf/PdfOutputStream;
.source "PdfWriter.java"


# static fields
.field private static final endobj:[B

.field private static final obj:[B


# instance fields
.field private copiedObjects:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            ">;"
        }
    .end annotation
.end field

.field protected isUserWarnedAboutAcroFormCopying:Z

.field objectStream:Lcom/itextpdf/kernel/pdf/PdfObjectStream;

.field protected properties:Lcom/itextpdf/kernel/pdf/WriterProperties;

.field private smartModeSerializer:Lcom/itextpdf/kernel/pdf/SmartModePdfObjectsSerializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 41
    const-string v0, " obj\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfWriter;->obj:[B

    .line 42
    const-string v0, "\nendobj\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfWriter;->endobj:[B

    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .locals 1
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 73
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfWriter;-><init>(Ljava/lang/String;)V

    .line 74
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "os"    # Ljava/io/OutputStream;

    .line 82
    new-instance v0, Lcom/itextpdf/kernel/pdf/WriterProperties;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/WriterProperties;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfWriter;-><init>(Ljava/io/OutputStream;Lcom/itextpdf/kernel/pdf/WriterProperties;)V

    .line 83
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;Lcom/itextpdf/kernel/pdf/WriterProperties;)V
    .locals 2
    .param p1, "os"    # Ljava/io/OutputStream;
    .param p2, "properties"    # Lcom/itextpdf/kernel/pdf/WriterProperties;

    .line 86
    new-instance v0, Lcom/itextpdf/kernel/pdf/CountOutputStream;

    invoke-static {p1}, Lcom/itextpdf/commons/utils/FileUtil;->wrapWithBufferedOutputStream(Ljava/io/OutputStream;)Ljava/io/OutputStream;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/CountOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 51
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->objectStream:Lcom/itextpdf/kernel/pdf/PdfObjectStream;

    .line 57
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->copiedObjects:Ljava/util/Map;

    .line 61
    new-instance v0, Lcom/itextpdf/kernel/pdf/SmartModePdfObjectsSerializer;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/SmartModePdfObjectsSerializer;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->smartModeSerializer:Lcom/itextpdf/kernel/pdf/SmartModePdfObjectsSerializer;

    .line 87
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->properties:Lcom/itextpdf/kernel/pdf/WriterProperties;

    .line 88
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 100
    new-instance v0, Lcom/itextpdf/kernel/pdf/WriterProperties;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/WriterProperties;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfWriter;-><init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/WriterProperties;)V

    .line 101
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/WriterProperties;)V
    .locals 1
    .param p1, "filename"    # Ljava/lang/String;
    .param p2, "properties"    # Lcom/itextpdf/kernel/pdf/WriterProperties;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 114
    invoke-static {p1}, Lcom/itextpdf/commons/utils/FileUtil;->getBufferedOutputStream(Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lcom/itextpdf/kernel/pdf/PdfWriter;-><init>(Ljava/io/OutputStream;Lcom/itextpdf/kernel/pdf/WriterProperties;)V

    .line 115
    return-void
.end method

.method private static checkTypeOfPdfDictionary(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfName;)Z
    .locals 2
    .param p0, "dictionary"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p1, "expectedType"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 459
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isDictionary()Z

    move-result v0

    if-eqz v0, :cond_0

    move-object v0, p0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private markArrayContentToFlush(Lcom/itextpdf/kernel/pdf/PdfArray;)V
    .locals 2
    .param p1, "array"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 426
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 427
    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(IZ)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfWriter;->markObjectToFlush(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 426
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 429
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method private markDictionaryContentToFlush(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 2
    .param p1, "dictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 432
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->values(Z)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 433
    .local v1, "item":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfWriter;->markObjectToFlush(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 434
    .end local v1    # "item":Lcom/itextpdf/kernel/pdf/PdfObject;
    goto :goto_0

    .line 435
    :cond_0
    return-void
.end method

.method private markObjectToFlush(Lcom/itextpdf/kernel/pdf/PdfObject;)V
    .locals 5
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 438
    if-eqz p1, :cond_3

    .line 439
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    .line 440
    .local v0, "indirectReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    const/16 v1, 0x20

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    .line 441
    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->checkState(S)Z

    move-result v2

    if-nez v2, :cond_3

    .line 442
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_0

    .line 445
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v3

    const/4 v4, 0x5

    if-ne v3, v4, :cond_1

    .line 446
    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/pdf/PdfObject;->checkState(S)Z

    move-result v2

    if-nez v2, :cond_3

    .line 447
    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfObject;->setState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_0

    .line 449
    :cond_1
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v1

    if-ne v1, v2, :cond_2

    .line 450
    move-object v1, p1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfWriter;->markArrayContentToFlush(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    goto :goto_0

    .line 451
    :cond_2
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_3

    .line 452
    move-object v1, p1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfWriter;->markDictionaryContentToFlush(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 456
    .end local v0    # "indirectReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    :cond_3
    :goto_0
    return-void
.end method


# virtual methods
.method protected copyObject(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfDocument;Z)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1
    .param p1, "obj"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p2, "documentTo"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p3, "allowDuplicating"    # Z

    .line 239
    invoke-static {}, Lcom/itextpdf/kernel/utils/NullCopyFilter;->getInstance()Lcom/itextpdf/kernel/utils/NullCopyFilter;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/itextpdf/kernel/pdf/PdfWriter;->copyObject(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfDocument;ZLcom/itextpdf/kernel/utils/ICopyFilter;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0
.end method

.method protected copyObject(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfDocument;ZLcom/itextpdf/kernel/utils/ICopyFilter;)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 6
    .param p1, "obj"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p2, "documentTo"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p3, "allowDuplicating"    # Z
    .param p4, "copyFilter"    # Lcom/itextpdf/kernel/utils/ICopyFilter;

    .line 255
    instance-of v0, p1, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    if-eqz v0, :cond_0

    .line 256
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getRefersTo()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object p1

    .line 258
    :cond_0
    if-nez p1, :cond_1

    .line 259
    sget-object p1, Lcom/itextpdf/kernel/pdf/PdfNull;->PDF_NULL:Lcom/itextpdf/kernel/pdf/PdfNull;

    .line 261
    :cond_1
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Catalog:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfWriter;->checkTypeOfPdfDictionary(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 262
    const-class v0, Lcom/itextpdf/kernel/pdf/PdfReader;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 263
    .local v0, "logger":Lorg/slf4j/Logger;
    const-string v1, "Make copy of Catalog dictionary is forbidden."

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 264
    sget-object p1, Lcom/itextpdf/kernel/pdf/PdfNull;->PDF_NULL:Lcom/itextpdf/kernel/pdf/PdfNull;

    .line 267
    .end local v0    # "logger":Lorg/slf4j/Logger;
    :cond_2
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    .line 268
    .local v0, "indirectReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    if-nez p3, :cond_3

    if-eqz v0, :cond_3

    const/4 v1, 0x1

    goto :goto_0

    :cond_3
    const/4 v1, 0x0

    .line 270
    .local v1, "tryToFindDuplicate":Z
    :goto_0
    if-eqz v1, :cond_4

    .line 271
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->copiedObjects:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 272
    .local v2, "copiedIndirectReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    if-eqz v2, :cond_4

    .line 273
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getRefersTo()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    return-object v3

    .line 277
    .end local v2    # "copiedIndirectReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    :cond_4
    const/4 v2, 0x0

    .line 278
    .local v2, "serializedContent":Lcom/itextpdf/kernel/pdf/SerializedObjectContent;
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->properties:Lcom/itextpdf/kernel/pdf/WriterProperties;

    iget-boolean v3, v3, Lcom/itextpdf/kernel/pdf/WriterProperties;->smartMode:Z

    if-eqz v3, :cond_5

    if-eqz v1, :cond_5

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Page:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {p1, v3}, Lcom/itextpdf/kernel/pdf/PdfWriter;->checkTypeOfPdfDictionary(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v3

    if-nez v3, :cond_5

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->OCG:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 279
    invoke-static {p1, v3}, Lcom/itextpdf/kernel/pdf/PdfWriter;->checkTypeOfPdfDictionary(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v3

    if-nez v3, :cond_5

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->OCMD:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {p1, v3}, Lcom/itextpdf/kernel/pdf/PdfWriter;->checkTypeOfPdfDictionary(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v3

    if-nez v3, :cond_5

    .line 280
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->smartModeSerializer:Lcom/itextpdf/kernel/pdf/SmartModePdfObjectsSerializer;

    invoke-virtual {v3, p1}, Lcom/itextpdf/kernel/pdf/SmartModePdfObjectsSerializer;->serializeObject(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/SerializedObjectContent;

    move-result-object v2

    .line 281
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->smartModeSerializer:Lcom/itextpdf/kernel/pdf/SmartModePdfObjectsSerializer;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/SmartModePdfObjectsSerializer;->getSavedSerializedObject(Lcom/itextpdf/kernel/pdf/SerializedObjectContent;)Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v3

    .line 282
    .local v3, "objectRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    if-eqz v3, :cond_5

    .line 283
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->copiedObjects:Ljava/util/Map;

    invoke-interface {v4, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 284
    iget-object v4, v3, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->refersTo:Lcom/itextpdf/kernel/pdf/PdfObject;

    return-object v4

    .line 288
    .end local v3    # "objectRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    :cond_5
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->newInstance()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    .line 289
    .local v3, "newObject":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v0, :cond_7

    .line 290
    invoke-virtual {v3, p2}, Lcom/itextpdf/kernel/pdf/PdfObject;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v4

    .line 291
    .local v4, "indRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    if-eqz v2, :cond_6

    .line 292
    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->smartModeSerializer:Lcom/itextpdf/kernel/pdf/SmartModePdfObjectsSerializer;

    invoke-virtual {v5, v2, v4}, Lcom/itextpdf/kernel/pdf/SmartModePdfObjectsSerializer;->saveSerializedObject(Lcom/itextpdf/kernel/pdf/SerializedObjectContent;Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)V

    .line 294
    :cond_6
    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->copiedObjects:Ljava/util/Map;

    invoke-interface {v5, v0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 296
    .end local v4    # "indRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    :cond_7
    invoke-virtual {v3, p1, p2, p4}, Lcom/itextpdf/kernel/pdf/PdfObject;->copyContent(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/utils/ICopyFilter;)V

    .line 298
    return-object v3
.end method

.method flushCopiedObjects(J)V
    .locals 6
    .param p1, "docId"    # J

    .line 410
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 411
    .local v0, "remove":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->copiedObjects:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 412
    .local v2, "copiedObject":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v3

    .line 413
    .local v3, "document":Lcom/itextpdf/kernel/pdf/PdfDocument;
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getDocumentId()J

    move-result-wide v4

    cmp-long v4, v4, p1

    if-nez v4, :cond_0

    .line 414
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    iget-object v4, v4, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->refersTo:Lcom/itextpdf/kernel/pdf/PdfObject;

    if-eqz v4, :cond_0

    .line 415
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    iget-object v4, v4, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->refersTo:Lcom/itextpdf/kernel/pdf/PdfObject;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfObject;->flush()V

    .line 416
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 419
    .end local v2    # "copiedObject":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    .end local v3    # "document":Lcom/itextpdf/kernel/pdf/PdfDocument;
    :cond_0
    goto :goto_0

    .line 420
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 421
    .local v2, "ird":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->copiedObjects:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 422
    .end local v2    # "ird":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    goto :goto_1

    .line 423
    :cond_2
    return-void
.end method

.method protected flushModifiedWaitingObjects(Ljava/util/Set;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            ">;)V"
        }
    .end annotation

    .line 364
    .local p1, "forbiddenToFlush":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getXref()Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    move-result-object v0

    .line 365
    .local v0, "xref":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 366
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->get(I)Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v2

    .line 367
    .local v2, "indirectReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->isFree()Z

    move-result v3

    if-nez v3, :cond_0

    invoke-interface {p1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 369
    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->checkState(S)Z

    move-result v3

    .line 370
    .local v3, "isModified":Z
    if-eqz v3, :cond_0

    .line 371
    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getRefersTo(Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    .line 372
    .local v4, "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v4, :cond_0

    .line 373
    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->objectStream:Lcom/itextpdf/kernel/pdf/PdfObjectStream;

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 374
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfObject;->flush()V

    .line 365
    .end local v2    # "indirectReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .end local v3    # "isModified":Z
    .end local v4    # "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 380
    .end local v1    # "i":I
    :cond_1
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->objectStream:Lcom/itextpdf/kernel/pdf/PdfObjectStream;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->objectStream:Lcom/itextpdf/kernel/pdf/PdfObjectStream;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->getSize()I

    move-result v1

    if-lez v1, :cond_2

    .line 381
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->objectStream:Lcom/itextpdf/kernel/pdf/PdfObjectStream;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->flush()V

    .line 382
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->objectStream:Lcom/itextpdf/kernel/pdf/PdfObjectStream;

    .line 384
    :cond_2
    return-void
.end method

.method protected flushObject(Lcom/itextpdf/kernel/pdf/PdfObject;Z)V
    .locals 3
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p2, "canBeInObjStm"    # Z

    .line 196
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    .line 197
    .local v0, "indirectReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfWriter;->isFullCompression()Z

    move-result v1

    if-eqz v1, :cond_0

    if-eqz p2, :cond_0

    .line 198
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfWriter;->getObjectStream()Lcom/itextpdf/kernel/pdf/PdfObjectStream;

    move-result-object v1

    .line 199
    .local v1, "objectStream":Lcom/itextpdf/kernel/pdf/PdfObjectStream;
    invoke-virtual {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->addObject(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 200
    .end local v1    # "objectStream":Lcom/itextpdf/kernel/pdf/PdfObjectStream;
    goto :goto_0

    .line 201
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfWriter;->getCurrentPos()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setOffset(J)V

    .line 202
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfWriter;->writeToBody(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 204
    :goto_0
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    const/16 v2, 0x20

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfObject;->clearState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 205
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v1

    packed-switch v1, :pswitch_data_0

    :pswitch_0
    goto :goto_1

    .line 225
    :pswitch_1
    move-object v1, p1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getRefersTo(Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfWriter;->markObjectToFlush(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    goto :goto_1

    .line 220
    :pswitch_2
    move-object v1, p1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 221
    .local v1, "dictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfWriter;->markDictionaryContentToFlush(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 222
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->releaseContent()V

    .line 223
    goto :goto_1

    .line 211
    .end local v1    # "dictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :pswitch_3
    move-object v1, p1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;

    const/4 v2, 0x0

    iput-object v2, v1, Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;->content:[B

    .line 212
    goto :goto_1

    .line 214
    :pswitch_4
    move-object v1, p1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 215
    .local v1, "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfWriter;->markArrayContentToFlush(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 216
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->releaseContent()V

    .line 217
    nop

    .line 227
    .end local v1    # "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    :goto_1
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_1
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method protected flushWaitingObjects(Ljava/util/Set;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            ">;)V"
        }
    .end annotation

    .line 334
    .local p1, "forbiddenToFlush":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;>;"
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getXref()Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    move-result-object v0

    .line 335
    .local v0, "xref":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    const/4 v1, 0x1

    .line 336
    .local v1, "needFlush":Z
    :goto_0
    if-eqz v1, :cond_2

    .line 337
    const/4 v1, 0x0

    .line 338
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_1
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 339
    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->get(I)Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v3

    .line 340
    .local v3, "indirectReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->isFree()Z

    move-result v4

    if-nez v4, :cond_0

    .line 341
    const/16 v4, 0x20

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->checkState(S)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 342
    invoke-interface {p1, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 343
    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getRefersTo(Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    .line 344
    .local v4, "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v4, :cond_0

    .line 345
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfObject;->flush()V

    .line 346
    const/4 v1, 0x1

    .line 338
    .end local v3    # "indirectReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .end local v4    # "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .end local v2    # "i":I
    :cond_1
    goto :goto_0

    .line 351
    :cond_2
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->objectStream:Lcom/itextpdf/kernel/pdf/PdfObjectStream;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->objectStream:Lcom/itextpdf/kernel/pdf/PdfObjectStream;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->getSize()I

    move-result v2

    if-lez v2, :cond_3

    .line 352
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->objectStream:Lcom/itextpdf/kernel/pdf/PdfObjectStream;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->flush()V

    .line 353
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->objectStream:Lcom/itextpdf/kernel/pdf/PdfObjectStream;

    .line 355
    :cond_3
    return-void
.end method

.method public getCompressionLevel()I
    .locals 1

    .line 133
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->properties:Lcom/itextpdf/kernel/pdf/WriterProperties;

    iget v0, v0, Lcom/itextpdf/kernel/pdf/WriterProperties;->compressionLevel:I

    return v0
.end method

.method getObjectStream()Lcom/itextpdf/kernel/pdf/PdfObjectStream;
    .locals 2

    .line 392
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfWriter;->isFullCompression()Z

    move-result v0

    if-nez v0, :cond_0

    .line 393
    const/4 v0, 0x0

    return-object v0

    .line 395
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->objectStream:Lcom/itextpdf/kernel/pdf/PdfObjectStream;

    if-nez v0, :cond_1

    .line 396
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfObjectStream;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfObjectStream;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->objectStream:Lcom/itextpdf/kernel/pdf/PdfObjectStream;

    goto :goto_0

    .line 397
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->objectStream:Lcom/itextpdf/kernel/pdf/PdfObjectStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->getSize()I

    move-result v0

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_2

    .line 398
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->objectStream:Lcom/itextpdf/kernel/pdf/PdfObjectStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->flush()V

    .line 399
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfObjectStream;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->objectStream:Lcom/itextpdf/kernel/pdf/PdfObjectStream;

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfObjectStream;-><init>(Lcom/itextpdf/kernel/pdf/PdfObjectStream;)V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->objectStream:Lcom/itextpdf/kernel/pdf/PdfObjectStream;

    .line 401
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->objectStream:Lcom/itextpdf/kernel/pdf/PdfObjectStream;

    return-object v0
.end method

.method public getProperties()Lcom/itextpdf/kernel/pdf/WriterProperties;
    .locals 1

    .line 155
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->properties:Lcom/itextpdf/kernel/pdf/WriterProperties;

    return-object v0
.end method

.method protected initCryptoIfSpecified(Lcom/itextpdf/kernel/pdf/PdfVersion;)V
    .locals 9
    .param p1, "version"    # Lcom/itextpdf/kernel/pdf/PdfVersion;

    .line 177
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->properties:Lcom/itextpdf/kernel/pdf/WriterProperties;

    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/WriterProperties;->encryptionProperties:Lcom/itextpdf/kernel/pdf/EncryptionProperties;

    .line 178
    .local v0, "encryptProps":Lcom/itextpdf/kernel/pdf/EncryptionProperties;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->properties:Lcom/itextpdf/kernel/pdf/WriterProperties;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/WriterProperties;->isStandardEncryptionUsed()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 179
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfEncryption;

    iget-object v3, v0, Lcom/itextpdf/kernel/pdf/EncryptionProperties;->userPassword:[B

    iget-object v4, v0, Lcom/itextpdf/kernel/pdf/EncryptionProperties;->ownerPassword:[B

    iget v5, v0, Lcom/itextpdf/kernel/pdf/EncryptionProperties;->standardEncryptPermissions:I

    iget v6, v0, Lcom/itextpdf/kernel/pdf/EncryptionProperties;->encryptionAlgorithm:I

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 182
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getOriginalDocumentId()Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfString;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v7

    move-object v8, p1

    .end local p1    # "version":Lcom/itextpdf/kernel/pdf/PdfVersion;
    .local v8, "version":Lcom/itextpdf/kernel/pdf/PdfVersion;
    invoke-direct/range {v2 .. v8}, Lcom/itextpdf/kernel/pdf/PdfEncryption;-><init>([B[BII[BLcom/itextpdf/kernel/pdf/PdfVersion;)V

    iput-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->crypto:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    goto :goto_0

    .line 183
    .end local v8    # "version":Lcom/itextpdf/kernel/pdf/PdfVersion;
    .restart local p1    # "version":Lcom/itextpdf/kernel/pdf/PdfVersion;
    :cond_0
    move-object v8, p1

    .end local p1    # "version":Lcom/itextpdf/kernel/pdf/PdfVersion;
    .restart local v8    # "version":Lcom/itextpdf/kernel/pdf/PdfVersion;
    iget-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->properties:Lcom/itextpdf/kernel/pdf/WriterProperties;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/WriterProperties;->isPublicKeyEncryptionUsed()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 184
    new-instance p1, Lcom/itextpdf/kernel/pdf/PdfEncryption;

    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/EncryptionProperties;->publicCertificates:[Ljava/security/cert/Certificate;

    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/EncryptionProperties;->publicKeyEncryptPermissions:[I

    iget v3, v0, Lcom/itextpdf/kernel/pdf/EncryptionProperties;->encryptionAlgorithm:I

    invoke-direct {p1, v1, v2, v3, v8}, Lcom/itextpdf/kernel/pdf/PdfEncryption;-><init>([Ljava/security/cert/Certificate;[IILcom/itextpdf/kernel/pdf/PdfVersion;)V

    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->crypto:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    .line 187
    :cond_1
    :goto_0
    return-void
.end method

.method public isFullCompression()Z
    .locals 1

    .line 123
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->properties:Lcom/itextpdf/kernel/pdf/WriterProperties;

    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/WriterProperties;->isFullCompression:Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->properties:Lcom/itextpdf/kernel/pdf/WriterProperties;

    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/WriterProperties;->isFullCompression:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public setCompressionLevel(I)Lcom/itextpdf/kernel/pdf/PdfWriter;
    .locals 1
    .param p1, "compressionLevel"    # I

    .line 145
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->properties:Lcom/itextpdf/kernel/pdf/WriterProperties;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/WriterProperties;->setCompressionLevel(I)Lcom/itextpdf/kernel/pdf/WriterProperties;

    .line 146
    return-object p0
.end method

.method public setSmartMode(Z)Lcom/itextpdf/kernel/pdf/PdfWriter;
    .locals 1
    .param p1, "smartMode"    # Z

    .line 172
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->properties:Lcom/itextpdf/kernel/pdf/WriterProperties;

    iput-boolean p1, v0, Lcom/itextpdf/kernel/pdf/WriterProperties;->smartMode:Z

    .line 173
    return-object p0
.end method

.method protected writeHeader()V
    .locals 2

    .line 322
    const/16 v0, 0x25

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfWriter;->writeByte(I)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 323
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPdfVersion()Lcom/itextpdf/kernel/pdf/PdfVersion;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfVersion;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeString(Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 324
    const-string v1, "\n%\u00e2\u00e3\u00cf\u00d3\n"

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeString(Ljava/lang/String;)Ljava/io/OutputStream;

    .line 325
    return-void
.end method

.method protected writeToBody(Lcom/itextpdf/kernel/pdf/PdfObject;)V
    .locals 3
    .param p1, "pdfObj"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 307
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->crypto:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    if-eqz v0, :cond_0

    .line 308
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfWriter;->crypto:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getObjNumber()I

    move-result v1

    .line 309
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getGenNumber()I

    move-result v2

    .line 308
    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->setHashKeyForNextObject(II)V

    .line 311
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getObjNumber()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfWriter;->writeInteger(I)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 312
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 313
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getGenNumber()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeInteger(I)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfWriter;->obj:[B

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 314
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfWriter;->write(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 315
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfWriter;->endobj:[B

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfWriter;->writeBytes([B)Ljava/io/OutputStream;

    .line 316
    return-void
.end method
