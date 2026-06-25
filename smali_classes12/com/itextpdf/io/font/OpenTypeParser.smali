.class Lcom/itextpdf/io/font/OpenTypeParser;
.super Ljava/lang/Object;
.source "OpenTypeParser.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/io/font/OpenTypeParser$CmapTable;,
        Lcom/itextpdf/io/font/OpenTypeParser$PostTable;,
        Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;,
        Lcom/itextpdf/io/font/OpenTypeParser$HorizontalHeader;,
        Lcom/itextpdf/io/font/OpenTypeParser$HeaderTable;
    }
.end annotation


# static fields
.field private static final HEAD_LOCA_FORMAT_OFFSET:I = 0x33


# instance fields
.field protected allNameEntries:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/List<",
            "[",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field protected cff:Z

.field protected cffLength:I

.field protected cffOffset:I

.field protected cmaps:Lcom/itextpdf/io/font/OpenTypeParser$CmapTable;

.field protected directoryOffset:I

.field protected fileName:Ljava/lang/String;

.field protected fontName:Ljava/lang/String;

.field private glyphWidthsByIndex:[I

.field protected head:Lcom/itextpdf/io/font/OpenTypeParser$HeaderTable;

.field protected hhea:Lcom/itextpdf/io/font/OpenTypeParser$HorizontalHeader;

.field protected os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

.field protected post:Lcom/itextpdf/io/font/OpenTypeParser$PostTable;

.field protected raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

.field protected tables:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "[I>;"
        }
    .end annotation
.end field

.field protected ttcIndex:I


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 215
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 154
    const/4 v0, -0x1

    iput v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->ttcIndex:I

    .line 172
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->cff:Z

    .line 216
    invoke-static {p1}, Lcom/itextpdf/io/font/OpenTypeParser;->getTTCName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 217
    .local v0, "ttcName":Ljava/lang/String;
    iput-object v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->fileName:Ljava/lang/String;

    .line 218
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 219
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->ttcIndex:I

    .line 221
    :cond_0
    new-instance v1, Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    new-instance v2, Lcom/itextpdf/io/source/RandomAccessSourceFactory;

    invoke-direct {v2}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;-><init>()V

    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->fileName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->createBestSource(Ljava/lang/String;)Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    iput-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    .line 222
    invoke-direct {p0}, Lcom/itextpdf/io/font/OpenTypeParser;->initializeSfntTables()V

    .line 223
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 2
    .param p1, "ttcPath"    # Ljava/lang/String;
    .param p2, "ttcIndex"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 209
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 154
    const/4 v0, -0x1

    iput v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->ttcIndex:I

    .line 172
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->cff:Z

    .line 210
    iput p2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->ttcIndex:I

    .line 211
    new-instance v0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    new-instance v1, Lcom/itextpdf/io/source/RandomAccessSourceFactory;

    invoke-direct {v1}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;-><init>()V

    invoke-virtual {v1, p1}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->createBestSource(Ljava/lang/String;)Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    iput-object v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    .line 212
    invoke-direct {p0}, Lcom/itextpdf/io/font/OpenTypeParser;->initializeSfntTables()V

    .line 213
    return-void
.end method

.method public constructor <init>([B)V
    .locals 2
    .param p1, "ttf"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 198
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 154
    const/4 v0, -0x1

    iput v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->ttcIndex:I

    .line 172
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->cff:Z

    .line 199
    new-instance v0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    new-instance v1, Lcom/itextpdf/io/source/RandomAccessSourceFactory;

    invoke-direct {v1}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;-><init>()V

    invoke-virtual {v1, p1}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->createSource([B)Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    iput-object v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    .line 200
    invoke-direct {p0}, Lcom/itextpdf/io/font/OpenTypeParser;->initializeSfntTables()V

    .line 201
    return-void
.end method

.method public constructor <init>([BI)V
    .locals 2
    .param p1, "ttc"    # [B
    .param p2, "ttcIndex"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 203
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 154
    const/4 v0, -0x1

    iput v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->ttcIndex:I

    .line 172
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->cff:Z

    .line 204
    iput p2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->ttcIndex:I

    .line 205
    new-instance v0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    new-instance v1, Lcom/itextpdf/io/source/RandomAccessSourceFactory;

    invoke-direct {v1}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;-><init>()V

    invoke-virtual {v1, p1}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->createSource([B)Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    iput-object v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    .line 206
    invoke-direct {p0}, Lcom/itextpdf/io/font/OpenTypeParser;->initializeSfntTables()V

    .line 207
    return-void
.end method

.method protected static getTTCName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "name"    # Ljava/lang/String;

    .line 445
    if-nez p0, :cond_0

    .line 446
    const/4 v0, 0x0

    return-object v0

    .line 448
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, ".ttc,"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 449
    .local v0, "idx":I
    if-gez v0, :cond_1

    .line 450
    return-object p0

    .line 452
    :cond_1
    add-int/lit8 v1, v0, 0x4

    const/4 v2, 0x0

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private initializeSfntTables()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 366
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->tables:Ljava/util/Map;

    .line 367
    iget v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->ttcIndex:I

    const/4 v1, 0x4

    if-ltz v0, :cond_6

    .line 368
    iget v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->ttcIndex:I

    .line 369
    .local v0, "dirIdx":I
    if-gez v0, :cond_1

    .line 370
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->fileName:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 371
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v2, "The font index for {0} must be positive."

    invoke-direct {v1, v2}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->fileName:Ljava/lang/String;

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v1

    throw v1

    .line 373
    :cond_0
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v2, "The font index must be positive."

    invoke-direct {v1, v2}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 376
    :cond_1
    invoke-direct {p0, v1}, Lcom/itextpdf/io/font/OpenTypeParser;->readStandardString(I)Ljava/lang/String;

    move-result-object v2

    .line 377
    .local v2, "mainTag":Ljava/lang/String;
    const-string/jumbo v3, "ttcf"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 378
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->fileName:Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 379
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string/jumbo v3, "{0} is not a valid ttc file."

    invoke-direct {v1, v3}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->fileName:Ljava/lang/String;

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v1

    throw v1

    .line 381
    :cond_2
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v3, "Not a valid ttc file."

    invoke-direct {v1, v3}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 384
    :cond_3
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v3, v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->skipBytes(I)I

    .line 385
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readInt()I

    move-result v3

    .line 386
    .local v3, "dirCount":I
    if-lt v0, v3, :cond_5

    .line 387
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->fileName:Ljava/lang/String;

    if-eqz v1, :cond_4

    .line 388
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v4, "The font index for {0} must be between 0 and {1}. It is {2}."

    invoke-direct {v1, v4}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->fileName:Ljava/lang/String;

    add-int/lit8 v5, v3, -0x1

    .line 389
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    filled-new-array {v4, v5, v6}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v1

    throw v1

    .line 391
    :cond_4
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v4, "The font index must be between 0 and {0}. It is {1}."

    invoke-direct {v1, v4}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    add-int/lit8 v4, v3, -0x1

    .line 392
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {v4, v5}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v1

    throw v1

    .line 395
    :cond_5
    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    mul-int/lit8 v5, v0, 0x4

    invoke-virtual {v4, v5}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->skipBytes(I)I

    .line 396
    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readInt()I

    move-result v4

    iput v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->directoryOffset:I

    .line 398
    .end local v0    # "dirIdx":I
    .end local v2    # "mainTag":Ljava/lang/String;
    .end local v3    # "dirCount":I
    :cond_6
    iget-object v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->directoryOffset:I

    int-to-long v2, v2

    invoke-virtual {v0, v2, v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 399
    iget-object v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readInt()I

    move-result v0

    .line 400
    .local v0, "ttId":I
    const/high16 v2, 0x10000

    if-eq v0, v2, :cond_8

    const v2, 0x4f54544f    # 3.562295E9f

    if-eq v0, v2, :cond_8

    .line 401
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->fileName:Ljava/lang/String;

    if-eqz v1, :cond_7

    .line 402
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string/jumbo v2, "{0} is not a valid ttf or otf file."

    invoke-direct {v1, v2}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->fileName:Ljava/lang/String;

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v1

    throw v1

    .line 404
    :cond_7
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v2, "Not a valid ttf or otf file."

    invoke-direct {v1, v2}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 407
    :cond_8
    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v2

    .line 408
    .local v2, "num_tables":I
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    const/4 v4, 0x6

    invoke-virtual {v3, v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->skipBytes(I)I

    .line 409
    const/4 v3, 0x0

    .local v3, "k":I
    :goto_0
    if-ge v3, v2, :cond_9

    .line 410
    invoke-direct {p0, v1}, Lcom/itextpdf/io/font/OpenTypeParser;->readStandardString(I)Ljava/lang/String;

    move-result-object v4

    .line 411
    .local v4, "tag":Ljava/lang/String;
    iget-object v5, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v5, v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->skipBytes(I)I

    .line 412
    const/4 v5, 0x2

    new-array v5, v5, [I

    .line 413
    .local v5, "table_location":[I
    iget-object v6, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v6}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readInt()I

    move-result v6

    const/4 v7, 0x0

    aput v6, v5, v7

    .line 414
    iget-object v6, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v6}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readInt()I

    move-result v6

    const/4 v7, 0x1

    aput v6, v5, v7

    .line 415
    iget-object v6, p0, Lcom/itextpdf/io/font/OpenTypeParser;->tables:Ljava/util/Map;

    invoke-interface {v6, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 409
    .end local v4    # "tag":Ljava/lang/String;
    .end local v5    # "table_location":[I
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 417
    .end local v3    # "k":I
    :cond_9
    return-void
.end method

.method private readCmapTable()V
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 807
    iget-object v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->tables:Ljava/util/Map;

    const-string v1, "cmap"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    .line 808
    .local v0, "table_location":[I
    if-nez v0, :cond_1

    .line 809
    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->fileName:Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 810
    new-instance v2, Lcom/itextpdf/io/exceptions/IOException;

    const-string v3, "Table {0} does not exist in {1}"

    invoke-direct {v2, v3}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->fileName:Ljava/lang/String;

    filled-new-array {v1, v3}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v1

    throw v1

    .line 812
    :cond_0
    new-instance v2, Lcom/itextpdf/io/exceptions/IOException;

    const-string v3, "Table {0} does not exist."

    invoke-direct {v2, v3}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v1

    throw v1

    .line 815
    :cond_1
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    const/4 v2, 0x0

    aget v3, v0, v2

    int-to-long v3, v3

    invoke-virtual {v1, v3, v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 816
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    const/4 v3, 0x2

    invoke-virtual {v1, v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->skipBytes(I)I

    .line 817
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v1

    .line 818
    .local v1, "num_tables":I
    const/4 v3, 0x0

    .line 819
    .local v3, "map10":I
    const/4 v4, 0x0

    .line 820
    .local v4, "map31":I
    const/4 v5, 0x0

    .line 821
    .local v5, "map30":I
    const/4 v6, 0x0

    .line 822
    .local v6, "mapExt":I
    new-instance v7, Lcom/itextpdf/io/font/OpenTypeParser$CmapTable;

    invoke-direct {v7}, Lcom/itextpdf/io/font/OpenTypeParser$CmapTable;-><init>()V

    iput-object v7, p0, Lcom/itextpdf/io/font/OpenTypeParser;->cmaps:Lcom/itextpdf/io/font/OpenTypeParser$CmapTable;

    .line 823
    const/4 v7, 0x0

    .local v7, "k":I
    :goto_0
    if-ge v7, v1, :cond_6

    .line 824
    iget-object v8, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v8}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v8

    .line 825
    .local v8, "platId":I
    iget-object v9, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v9}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v9

    .line 826
    .local v9, "platSpecId":I
    iget-object v10, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v10}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readInt()I

    move-result v10

    .line 827
    .local v10, "offset":I
    const/4 v11, 0x3

    const/4 v12, 0x1

    if-ne v8, v11, :cond_2

    if-nez v9, :cond_2

    .line 828
    iget-object v11, p0, Lcom/itextpdf/io/font/OpenTypeParser;->cmaps:Lcom/itextpdf/io/font/OpenTypeParser$CmapTable;

    iput-boolean v12, v11, Lcom/itextpdf/io/font/OpenTypeParser$CmapTable;->fontSpecific:Z

    .line 829
    move v5, v10

    goto :goto_1

    .line 830
    :cond_2
    if-ne v8, v11, :cond_3

    if-ne v9, v12, :cond_3

    .line 831
    move v4, v10

    goto :goto_1

    .line 832
    :cond_3
    if-ne v8, v11, :cond_4

    const/16 v11, 0xa

    if-ne v9, v11, :cond_4

    .line 833
    move v6, v10

    goto :goto_1

    .line 834
    :cond_4
    if-ne v8, v12, :cond_5

    if-nez v9, :cond_5

    .line 835
    move v3, v10

    .line 823
    .end local v8    # "platId":I
    .end local v9    # "platSpecId":I
    .end local v10    # "offset":I
    :cond_5
    :goto_1
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 838
    .end local v7    # "k":I
    :cond_6
    if-lez v3, :cond_7

    .line 839
    iget-object v7, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    aget v8, v0, v2

    add-int/2addr v8, v3

    int-to-long v8, v8

    invoke-virtual {v7, v8, v9}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 840
    iget-object v7, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v7}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v7

    .line 841
    .local v7, "format":I
    sparse-switch v7, :sswitch_data_0

    goto :goto_2

    .line 849
    :sswitch_0
    iget-object v8, p0, Lcom/itextpdf/io/font/OpenTypeParser;->cmaps:Lcom/itextpdf/io/font/OpenTypeParser$CmapTable;

    invoke-direct {p0}, Lcom/itextpdf/io/font/OpenTypeParser;->readFormat6()Ljava/util/Map;

    move-result-object v9

    iput-object v9, v8, Lcom/itextpdf/io/font/OpenTypeParser$CmapTable;->cmap10:Ljava/util/Map;

    goto :goto_2

    .line 846
    :sswitch_1
    iget-object v8, p0, Lcom/itextpdf/io/font/OpenTypeParser;->cmaps:Lcom/itextpdf/io/font/OpenTypeParser$CmapTable;

    invoke-direct {p0, v2}, Lcom/itextpdf/io/font/OpenTypeParser;->readFormat4(Z)Ljava/util/Map;

    move-result-object v9

    iput-object v9, v8, Lcom/itextpdf/io/font/OpenTypeParser$CmapTable;->cmap10:Ljava/util/Map;

    .line 847
    goto :goto_2

    .line 843
    :sswitch_2
    iget-object v8, p0, Lcom/itextpdf/io/font/OpenTypeParser;->cmaps:Lcom/itextpdf/io/font/OpenTypeParser$CmapTable;

    invoke-direct {p0}, Lcom/itextpdf/io/font/OpenTypeParser;->readFormat0()Ljava/util/Map;

    move-result-object v9

    iput-object v9, v8, Lcom/itextpdf/io/font/OpenTypeParser$CmapTable;->cmap10:Ljava/util/Map;

    .line 844
    nop

    .line 853
    .end local v7    # "format":I
    :cond_7
    :goto_2
    const/4 v7, 0x4

    if-lez v4, :cond_8

    .line 854
    iget-object v8, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    aget v9, v0, v2

    add-int/2addr v9, v4

    int-to-long v9, v9

    invoke-virtual {v8, v9, v10}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 855
    iget-object v8, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v8}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v8

    .line 856
    .local v8, "format":I
    if-ne v8, v7, :cond_8

    .line 857
    iget-object v9, p0, Lcom/itextpdf/io/font/OpenTypeParser;->cmaps:Lcom/itextpdf/io/font/OpenTypeParser$CmapTable;

    invoke-direct {p0, v2}, Lcom/itextpdf/io/font/OpenTypeParser;->readFormat4(Z)Ljava/util/Map;

    move-result-object v10

    iput-object v10, v9, Lcom/itextpdf/io/font/OpenTypeParser$CmapTable;->cmap31:Ljava/util/Map;

    .line 860
    .end local v8    # "format":I
    :cond_8
    if-lez v5, :cond_a

    .line 861
    iget-object v8, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    aget v9, v0, v2

    add-int/2addr v9, v5

    int-to-long v9, v9

    invoke-virtual {v8, v9, v10}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 862
    iget-object v8, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v8}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v8

    .line 863
    .restart local v8    # "format":I
    nop

    .line 866
    iget-object v9, p0, Lcom/itextpdf/io/font/OpenTypeParser;->cmaps:Lcom/itextpdf/io/font/OpenTypeParser$CmapTable;

    .line 863
    if-ne v8, v7, :cond_9

    .line 864
    iget-object v7, p0, Lcom/itextpdf/io/font/OpenTypeParser;->cmaps:Lcom/itextpdf/io/font/OpenTypeParser$CmapTable;

    iget-boolean v7, v7, Lcom/itextpdf/io/font/OpenTypeParser$CmapTable;->fontSpecific:Z

    invoke-direct {p0, v7}, Lcom/itextpdf/io/font/OpenTypeParser;->readFormat4(Z)Ljava/util/Map;

    move-result-object v7

    iput-object v7, v9, Lcom/itextpdf/io/font/OpenTypeParser$CmapTable;->cmap10:Ljava/util/Map;

    goto :goto_3

    .line 866
    :cond_9
    iput-boolean v2, v9, Lcom/itextpdf/io/font/OpenTypeParser$CmapTable;->fontSpecific:Z

    .line 869
    .end local v8    # "format":I
    :cond_a
    :goto_3
    if-lez v6, :cond_b

    .line 870
    iget-object v7, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    aget v8, v0, v2

    add-int/2addr v8, v6

    int-to-long v8, v8

    invoke-virtual {v7, v8, v9}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 871
    iget-object v7, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v7}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v7

    .line 872
    .restart local v7    # "format":I
    sparse-switch v7, :sswitch_data_1

    goto :goto_4

    .line 883
    :sswitch_3
    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->cmaps:Lcom/itextpdf/io/font/OpenTypeParser$CmapTable;

    invoke-direct {p0}, Lcom/itextpdf/io/font/OpenTypeParser;->readFormat12()Ljava/util/Map;

    move-result-object v8

    iput-object v8, v2, Lcom/itextpdf/io/font/OpenTypeParser$CmapTable;->cmapExt:Ljava/util/Map;

    goto :goto_4

    .line 880
    :sswitch_4
    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->cmaps:Lcom/itextpdf/io/font/OpenTypeParser$CmapTable;

    invoke-direct {p0}, Lcom/itextpdf/io/font/OpenTypeParser;->readFormat6()Ljava/util/Map;

    move-result-object v8

    iput-object v8, v2, Lcom/itextpdf/io/font/OpenTypeParser$CmapTable;->cmapExt:Ljava/util/Map;

    .line 881
    goto :goto_4

    .line 877
    :sswitch_5
    iget-object v8, p0, Lcom/itextpdf/io/font/OpenTypeParser;->cmaps:Lcom/itextpdf/io/font/OpenTypeParser$CmapTable;

    invoke-direct {p0, v2}, Lcom/itextpdf/io/font/OpenTypeParser;->readFormat4(Z)Ljava/util/Map;

    move-result-object v2

    iput-object v2, v8, Lcom/itextpdf/io/font/OpenTypeParser$CmapTable;->cmapExt:Ljava/util/Map;

    .line 878
    goto :goto_4

    .line 874
    :sswitch_6
    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->cmaps:Lcom/itextpdf/io/font/OpenTypeParser$CmapTable;

    invoke-direct {p0}, Lcom/itextpdf/io/font/OpenTypeParser;->readFormat0()Ljava/util/Map;

    move-result-object v8

    iput-object v8, v2, Lcom/itextpdf/io/font/OpenTypeParser$CmapTable;->cmapExt:Ljava/util/Map;

    .line 875
    nop

    .line 887
    .end local v7    # "format":I
    :cond_b
    :goto_4
    return-void

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_2
        0x4 -> :sswitch_1
        0x6 -> :sswitch_0
    .end sparse-switch

    :sswitch_data_1
    .sparse-switch
        0x0 -> :sswitch_6
        0x4 -> :sswitch_5
        0x6 -> :sswitch_4
        0xc -> :sswitch_3
    .end sparse-switch
.end method

.method private readFormat0()Ljava/util/Map;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "[I>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 937
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 938
    .local v0, "h":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;[I>;"
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->skipBytes(I)I

    .line 939
    const/4 v1, 0x0

    .local v1, "k":I
    :goto_0
    const/16 v2, 0x100

    if-ge v1, v2, :cond_0

    .line 940
    const/4 v2, 0x2

    new-array v2, v2, [I

    .line 941
    .local v2, "r":[I
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedByte()I

    move-result v3

    const/4 v4, 0x0

    aput v3, v2, v4

    .line 942
    aget v3, v2, v4

    invoke-virtual {p0, v3}, Lcom/itextpdf/io/font/OpenTypeParser;->getGlyphWidth(I)I

    move-result v3

    const/4 v4, 0x1

    aput v3, v2, v4

    .line 943
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 939
    .end local v2    # "r":[I
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 945
    .end local v1    # "k":I
    :cond_0
    return-object v0
.end method

.method private readFormat12()Ljava/util/Map;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "[I>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1032
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 1033
    .local v0, "h":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;[I>;"
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->skipBytes(I)I

    .line 1035
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readInt()I

    move-result v1

    .line 1036
    .local v1, "table_length":I
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    const/4 v4, 0x4

    invoke-virtual {v3, v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->skipBytes(I)I

    .line 1037
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readInt()I

    move-result v3

    .line 1038
    .local v3, "nGroups":I
    const/4 v4, 0x0

    .local v4, "k":I
    :goto_0
    if-ge v4, v3, :cond_1

    .line 1039
    iget-object v5, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v5}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readInt()I

    move-result v5

    .line 1040
    .local v5, "startCharCode":I
    iget-object v6, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v6}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readInt()I

    move-result v6

    .line 1041
    .local v6, "endCharCode":I
    iget-object v7, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v7}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readInt()I

    move-result v7

    .line 1042
    .local v7, "startGlyphID":I
    move v8, v5

    .local v8, "i":I
    :goto_1
    if-gt v8, v6, :cond_0

    .line 1043
    new-array v9, v2, [I

    .line 1044
    .local v9, "r":[I
    const/4 v10, 0x0

    aput v7, v9, v10

    .line 1045
    aget v10, v9, v10

    invoke-virtual {p0, v10}, Lcom/itextpdf/io/font/OpenTypeParser;->getGlyphWidth(I)I

    move-result v10

    const/4 v11, 0x1

    aput v10, v9, v11

    .line 1046
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-interface {v0, v10, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1047
    nop

    .end local v9    # "r":[I
    add-int/lit8 v7, v7, 0x1

    .line 1042
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 1038
    .end local v5    # "startCharCode":I
    .end local v6    # "endCharCode":I
    .end local v7    # "startGlyphID":I
    .end local v8    # "i":I
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1050
    .end local v4    # "k":I
    :cond_1
    return-object v0
.end method

.method private readFormat4(Z)Ljava/util/Map;
    .locals 16
    .param p1, "fontSpecific"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "[I>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 956
    move-object/from16 v0, p0

    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 957
    .local v1, "h":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;[I>;"
    iget-object v2, v0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v2

    .line 958
    .local v2, "table_lenght":I
    iget-object v3, v0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    const/4 v4, 0x2

    invoke-virtual {v3, v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->skipBytes(I)I

    .line 959
    iget-object v3, v0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v3

    div-int/2addr v3, v4

    .line 960
    .local v3, "segCount":I
    iget-object v5, v0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    const/4 v6, 0x6

    invoke-virtual {v5, v6}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->skipBytes(I)I

    .line 961
    new-array v5, v3, [I

    .line 962
    .local v5, "endCount":[I
    const/4 v6, 0x0

    .line 965
    .local v6, "k":I
    :goto_0
    iget-object v7, v0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    .line 962
    if-ge v6, v3, :cond_0

    .line 963
    invoke-virtual {v7}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v7

    aput v7, v5, v6

    .line 962
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 965
    .end local v6    # "k":I
    :cond_0
    invoke-virtual {v7, v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->skipBytes(I)I

    .line 966
    new-array v6, v3, [I

    .line 967
    .local v6, "startCount":[I
    const/4 v7, 0x0

    .local v7, "k":I
    :goto_1
    if-ge v7, v3, :cond_1

    .line 968
    iget-object v8, v0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v8}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v8

    aput v8, v6, v7

    .line 967
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 970
    .end local v7    # "k":I
    :cond_1
    new-array v7, v3, [I

    .line 971
    .local v7, "idDelta":[I
    const/4 v8, 0x0

    .local v8, "k":I
    :goto_2
    if-ge v8, v3, :cond_2

    .line 972
    iget-object v9, v0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v9}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v9

    aput v9, v7, v8

    .line 971
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    .line 974
    .end local v8    # "k":I
    :cond_2
    new-array v8, v3, [I

    .line 975
    .local v8, "idRO":[I
    const/4 v9, 0x0

    .local v9, "k":I
    :goto_3
    if-ge v9, v3, :cond_3

    .line 976
    iget-object v10, v0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v10}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v10

    aput v10, v8, v9

    .line 975
    add-int/lit8 v9, v9, 0x1

    goto :goto_3

    .line 978
    .end local v9    # "k":I
    :cond_3
    div-int/lit8 v9, v2, 0x2

    add-int/lit8 v9, v9, -0x8

    mul-int/lit8 v10, v3, 0x4

    sub-int/2addr v9, v10

    new-array v9, v9, [I

    .line 979
    .local v9, "glyphId":[I
    const/4 v10, 0x0

    .local v10, "k":I
    :goto_4
    array-length v11, v9

    if-ge v10, v11, :cond_4

    .line 980
    iget-object v11, v0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v11}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v11

    aput v11, v9, v10

    .line 979
    add-int/lit8 v10, v10, 0x1

    goto :goto_4

    .line 982
    .end local v10    # "k":I
    :cond_4
    const/4 v10, 0x0

    .restart local v10    # "k":I
    :goto_5
    if-ge v10, v3, :cond_9

    .line 984
    aget v11, v6, v10

    .local v11, "j":I
    :goto_6
    aget v12, v5, v10

    if-gt v11, v12, :cond_8

    const v12, 0xffff

    if-eq v11, v12, :cond_8

    .line 985
    aget v13, v8, v10

    if-nez v13, :cond_5

    .line 986
    aget v13, v7, v10

    add-int/2addr v13, v11

    and-int/2addr v12, v13

    .local v12, "glyph":I
    goto :goto_7

    .line 988
    .end local v12    # "glyph":I
    :cond_5
    aget v13, v8, v10

    div-int/2addr v13, v4

    add-int/2addr v13, v10

    sub-int/2addr v13, v3

    add-int/2addr v13, v11

    aget v14, v6, v10

    sub-int/2addr v13, v14

    .line 989
    .local v13, "idx":I
    array-length v14, v9

    if-lt v13, v14, :cond_6

    .line 990
    goto :goto_8

    .line 991
    :cond_6
    aget v14, v9, v13

    aget v15, v7, v10

    add-int/2addr v14, v15

    and-int/2addr v12, v14

    .line 993
    .end local v13    # "idx":I
    .restart local v12    # "glyph":I
    :goto_7
    new-array v13, v4, [I

    .line 994
    .local v13, "r":[I
    const/4 v14, 0x0

    aput v12, v13, v14

    .line 995
    aget v14, v13, v14

    invoke-virtual {v0, v14}, Lcom/itextpdf/io/font/OpenTypeParser;->getGlyphWidth(I)I

    move-result v14

    const/4 v15, 0x1

    aput v14, v13, v15

    .line 1000
    if-eqz p1, :cond_7

    const v14, 0xff00

    and-int/2addr v14, v11

    const v15, 0xf000

    if-ne v14, v15, :cond_7

    .line 1001
    and-int/lit16 v14, v11, 0xff

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-interface {v1, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1003
    :cond_7
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-interface {v1, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 984
    .end local v12    # "glyph":I
    .end local v13    # "r":[I
    :goto_8
    add-int/lit8 v11, v11, 0x1

    goto :goto_6

    .line 982
    .end local v11    # "j":I
    :cond_8
    add-int/lit8 v10, v10, 0x1

    goto :goto_5

    .line 1006
    .end local v10    # "k":I
    :cond_9
    return-object v1
.end method

.method private readFormat6()Ljava/util/Map;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "[I>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1018
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 1019
    .local v0, "h":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;[I>;"
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->skipBytes(I)I

    .line 1020
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v1

    .line 1021
    .local v1, "start_code":I
    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v2

    .line 1022
    .local v2, "code_count":I
    const/4 v3, 0x0

    .local v3, "k":I
    :goto_0
    if-ge v3, v2, :cond_0

    .line 1023
    const/4 v4, 0x2

    new-array v4, v4, [I

    .line 1024
    .local v4, "r":[I
    iget-object v5, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v5}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v5

    const/4 v6, 0x0

    aput v5, v4, v6

    .line 1025
    aget v5, v4, v6

    invoke-virtual {p0, v5}, Lcom/itextpdf/io/font/OpenTypeParser;->getGlyphWidth(I)I

    move-result v5

    const/4 v6, 0x1

    aput v5, v4, v6

    .line 1026
    add-int v5, v3, v1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1022
    .end local v4    # "r":[I
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1028
    .end local v3    # "k":I
    :cond_0
    return-object v0
.end method

.method private readHeadTable()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 697
    iget-object v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->tables:Ljava/util/Map;

    const-string v1, "head"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    .line 698
    .local v0, "table_location":[I
    if-nez v0, :cond_1

    .line 699
    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->fileName:Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 700
    new-instance v2, Lcom/itextpdf/io/exceptions/IOException;

    const-string v3, "Table {0} does not exist in {1}"

    invoke-direct {v2, v3}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->fileName:Ljava/lang/String;

    filled-new-array {v1, v3}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v1

    throw v1

    .line 702
    :cond_0
    new-instance v2, Lcom/itextpdf/io/exceptions/IOException;

    const-string v3, "Table {0} does not exist."

    invoke-direct {v2, v3}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v1

    throw v1

    .line 705
    :cond_1
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    const/4 v2, 0x0

    aget v2, v0, v2

    const/16 v3, 0x10

    add-int/2addr v2, v3

    int-to-long v4, v2

    invoke-virtual {v1, v4, v5}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 706
    new-instance v1, Lcom/itextpdf/io/font/OpenTypeParser$HeaderTable;

    invoke-direct {v1}, Lcom/itextpdf/io/font/OpenTypeParser$HeaderTable;-><init>()V

    iput-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->head:Lcom/itextpdf/io/font/OpenTypeParser$HeaderTable;

    .line 707
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->head:Lcom/itextpdf/io/font/OpenTypeParser$HeaderTable;

    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v2

    iput v2, v1, Lcom/itextpdf/io/font/OpenTypeParser$HeaderTable;->flags:I

    .line 708
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->head:Lcom/itextpdf/io/font/OpenTypeParser$HeaderTable;

    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v2

    iput v2, v1, Lcom/itextpdf/io/font/OpenTypeParser$HeaderTable;->unitsPerEm:I

    .line 709
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1, v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->skipBytes(I)I

    .line 710
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->head:Lcom/itextpdf/io/font/OpenTypeParser$HeaderTable;

    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v2

    iput-short v2, v1, Lcom/itextpdf/io/font/OpenTypeParser$HeaderTable;->xMin:S

    .line 711
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->head:Lcom/itextpdf/io/font/OpenTypeParser$HeaderTable;

    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v2

    iput-short v2, v1, Lcom/itextpdf/io/font/OpenTypeParser$HeaderTable;->yMin:S

    .line 712
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->head:Lcom/itextpdf/io/font/OpenTypeParser$HeaderTable;

    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v2

    iput-short v2, v1, Lcom/itextpdf/io/font/OpenTypeParser$HeaderTable;->xMax:S

    .line 713
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->head:Lcom/itextpdf/io/font/OpenTypeParser$HeaderTable;

    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v2

    iput-short v2, v1, Lcom/itextpdf/io/font/OpenTypeParser$HeaderTable;->yMax:S

    .line 714
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->head:Lcom/itextpdf/io/font/OpenTypeParser$HeaderTable;

    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v2

    iput v2, v1, Lcom/itextpdf/io/font/OpenTypeParser$HeaderTable;->macStyle:I

    .line 715
    return-void
.end method

.method private readHheaTable()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 667
    iget-object v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->tables:Ljava/util/Map;

    const-string v1, "hhea"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    .line 668
    .local v0, "table_location":[I
    if-nez v0, :cond_1

    .line 669
    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->fileName:Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 670
    new-instance v2, Lcom/itextpdf/io/exceptions/IOException;

    const-string v3, "Table {0} does not exist in {1}"

    invoke-direct {v2, v3}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->fileName:Ljava/lang/String;

    filled-new-array {v1, v3}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v1

    throw v1

    .line 672
    :cond_0
    new-instance v2, Lcom/itextpdf/io/exceptions/IOException;

    const-string v3, "Table {0} does not exist."

    invoke-direct {v2, v3}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v1

    throw v1

    .line 675
    :cond_1
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    const/4 v2, 0x0

    aget v2, v0, v2

    add-int/lit8 v2, v2, 0x4

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 676
    new-instance v1, Lcom/itextpdf/io/font/OpenTypeParser$HorizontalHeader;

    invoke-direct {v1}, Lcom/itextpdf/io/font/OpenTypeParser$HorizontalHeader;-><init>()V

    iput-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->hhea:Lcom/itextpdf/io/font/OpenTypeParser$HorizontalHeader;

    .line 677
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->hhea:Lcom/itextpdf/io/font/OpenTypeParser$HorizontalHeader;

    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v2

    iput-short v2, v1, Lcom/itextpdf/io/font/OpenTypeParser$HorizontalHeader;->Ascender:S

    .line 678
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->hhea:Lcom/itextpdf/io/font/OpenTypeParser$HorizontalHeader;

    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v2

    iput-short v2, v1, Lcom/itextpdf/io/font/OpenTypeParser$HorizontalHeader;->Descender:S

    .line 679
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->hhea:Lcom/itextpdf/io/font/OpenTypeParser$HorizontalHeader;

    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v2

    iput-short v2, v1, Lcom/itextpdf/io/font/OpenTypeParser$HorizontalHeader;->LineGap:S

    .line 680
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->hhea:Lcom/itextpdf/io/font/OpenTypeParser$HorizontalHeader;

    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v2

    iput v2, v1, Lcom/itextpdf/io/font/OpenTypeParser$HorizontalHeader;->advanceWidthMax:I

    .line 681
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->hhea:Lcom/itextpdf/io/font/OpenTypeParser$HorizontalHeader;

    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v2

    iput-short v2, v1, Lcom/itextpdf/io/font/OpenTypeParser$HorizontalHeader;->minLeftSideBearing:S

    .line 682
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->hhea:Lcom/itextpdf/io/font/OpenTypeParser$HorizontalHeader;

    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v2

    iput-short v2, v1, Lcom/itextpdf/io/font/OpenTypeParser$HorizontalHeader;->minRightSideBearing:S

    .line 683
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->hhea:Lcom/itextpdf/io/font/OpenTypeParser$HorizontalHeader;

    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v2

    iput-short v2, v1, Lcom/itextpdf/io/font/OpenTypeParser$HorizontalHeader;->xMaxExtent:S

    .line 684
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->hhea:Lcom/itextpdf/io/font/OpenTypeParser$HorizontalHeader;

    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v2

    iput-short v2, v1, Lcom/itextpdf/io/font/OpenTypeParser$HorizontalHeader;->caretSlopeRise:S

    .line 685
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->hhea:Lcom/itextpdf/io/font/OpenTypeParser$HorizontalHeader;

    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v2

    iput-short v2, v1, Lcom/itextpdf/io/font/OpenTypeParser$HorizontalHeader;->caretSlopeRun:S

    .line 686
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    const/16 v2, 0xc

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->skipBytes(I)I

    .line 687
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->hhea:Lcom/itextpdf/io/font/OpenTypeParser$HorizontalHeader;

    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v2

    iput v2, v1, Lcom/itextpdf/io/font/OpenTypeParser$HorizontalHeader;->numberOfHMetrics:I

    .line 688
    return-void
.end method

.method private readNameTable()V
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 617
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/itextpdf/io/font/OpenTypeParser;->tables:Ljava/util/Map;

    const-string v2, "name"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    .line 618
    .local v1, "table_location":[I
    if-nez v1, :cond_1

    .line 619
    iget-object v3, v0, Lcom/itextpdf/io/font/OpenTypeParser;->fileName:Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 620
    new-instance v3, Lcom/itextpdf/io/exceptions/IOException;

    const-string v4, "Table {0} does not exist in {1}"

    invoke-direct {v3, v4}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    iget-object v4, v0, Lcom/itextpdf/io/font/OpenTypeParser;->fileName:Ljava/lang/String;

    filled-new-array {v2, v4}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v2

    throw v2

    .line 622
    :cond_0
    new-instance v3, Lcom/itextpdf/io/exceptions/IOException;

    const-string v4, "Table {0} does not exist."

    invoke-direct {v3, v4}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v2

    throw v2

    .line 625
    :cond_1
    new-instance v2, Ljava/util/LinkedHashMap;

    invoke-direct {v2}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v2, v0, Lcom/itextpdf/io/font/OpenTypeParser;->allNameEntries:Ljava/util/Map;

    .line 626
    iget-object v2, v0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    const/4 v3, 0x0

    aget v4, v1, v3

    const/4 v5, 0x2

    add-int/2addr v4, v5

    int-to-long v6, v4

    invoke-virtual {v2, v6, v7}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 627
    iget-object v2, v0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v2

    .line 628
    .local v2, "numRecords":I
    iget-object v4, v0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v4

    .line 629
    .local v4, "startOfStorage":I
    const/4 v6, 0x0

    .local v6, "k":I
    :goto_0
    if-ge v6, v2, :cond_5

    .line 630
    iget-object v7, v0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v7}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v7

    .line 631
    .local v7, "platformID":I
    iget-object v8, v0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v8}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v8

    .line 632
    .local v8, "platformEncodingID":I
    iget-object v9, v0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v9}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v9

    .line 633
    .local v9, "languageID":I
    iget-object v10, v0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v10}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v10

    .line 634
    .local v10, "nameID":I
    iget-object v11, v0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v11}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v11

    .line 635
    .local v11, "length":I
    iget-object v12, v0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v12}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v12

    .line 637
    .local v12, "offset":I
    iget-object v13, v0, Lcom/itextpdf/io/font/OpenTypeParser;->allNameEntries:Ljava/util/Map;

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-interface {v13, v14}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v13

    .line 640
    iget-object v14, v0, Lcom/itextpdf/io/font/OpenTypeParser;->allNameEntries:Ljava/util/Map;

    .line 637
    if-eqz v13, :cond_2

    .line 638
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-interface {v14, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/List;

    .local v13, "names":Ljava/util/List;, "Ljava/util/List<[Ljava/lang/String;>;"
    goto :goto_1

    .line 640
    .end local v13    # "names":Ljava/util/List;, "Ljava/util/List<[Ljava/lang/String;>;"
    :cond_2
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v16, v15

    .local v16, "names":Ljava/util/List;, "Ljava/util/List<[Ljava/lang/String;>;"
    invoke-interface {v14, v13, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 v13, v16

    .line 642
    .end local v16    # "names":Ljava/util/List;, "Ljava/util/List<[Ljava/lang/String;>;"
    .restart local v13    # "names":Ljava/util/List;, "Ljava/util/List<[Ljava/lang/String;>;"
    :goto_1
    iget-object v14, v0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v14}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->getPosition()J

    move-result-wide v14

    long-to-int v14, v14

    .line 643
    .local v14, "pos":I
    iget-object v15, v0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    aget v16, v1, v3

    add-int v16, v16, v4

    move/from16 v17, v3

    add-int v3, v16, v12

    move/from16 v18, v6

    .end local v6    # "k":I
    .local v18, "k":I
    int-to-long v5, v3

    invoke-virtual {v15, v5, v6}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 645
    const/4 v3, 0x3

    const/4 v5, 0x1

    if-eqz v7, :cond_4

    if-eq v7, v3, :cond_4

    const/4 v6, 0x2

    if-ne v7, v6, :cond_3

    if-ne v8, v5, :cond_3

    goto :goto_2

    .line 648
    :cond_3
    invoke-direct {v0, v11}, Lcom/itextpdf/io/font/OpenTypeParser;->readStandardString(I)Ljava/lang/String;

    move-result-object v6

    .local v6, "name":Ljava/lang/String;
    goto :goto_3

    .line 646
    .end local v6    # "name":Ljava/lang/String;
    :cond_4
    :goto_2
    invoke-direct {v0, v11}, Lcom/itextpdf/io/font/OpenTypeParser;->readUnicodeString(I)Ljava/lang/String;

    move-result-object v6

    .line 650
    .restart local v6    # "name":Ljava/lang/String;
    :goto_3
    const/4 v15, 0x4

    new-array v15, v15, [Ljava/lang/String;

    .line 651
    invoke-static {v7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v19

    aput-object v19, v15, v17

    .line 652
    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v19

    aput-object v19, v15, v5

    .line 653
    invoke-static {v9}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    const/16 v16, 0x2

    aput-object v5, v15, v16

    aput-object v6, v15, v3

    .line 650
    invoke-interface {v13, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 656
    iget-object v3, v0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    move-object v5, v1

    .end local v1    # "table_location":[I
    .local v5, "table_location":[I
    int-to-long v0, v14

    invoke-virtual {v3, v0, v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 629
    .end local v6    # "name":Ljava/lang/String;
    .end local v7    # "platformID":I
    .end local v8    # "platformEncodingID":I
    .end local v9    # "languageID":I
    .end local v10    # "nameID":I
    .end local v11    # "length":I
    .end local v12    # "offset":I
    .end local v13    # "names":Ljava/util/List;, "Ljava/util/List<[Ljava/lang/String;>;"
    .end local v14    # "pos":I
    add-int/lit8 v6, v18, 0x1

    move-object/from16 v0, p0

    move-object v1, v5

    move/from16 v5, v16

    move/from16 v3, v17

    .end local v18    # "k":I
    .local v6, "k":I
    goto/16 :goto_0

    .line 658
    .end local v5    # "table_location":[I
    .end local v6    # "k":I
    .restart local v1    # "table_location":[I
    :cond_5
    return-void
.end method

.method private readOs_2Table()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 725
    iget-object v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->tables:Ljava/util/Map;

    const-string v1, "OS/2"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    .line 726
    .local v0, "table_location":[I
    if-nez v0, :cond_1

    .line 727
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->fileName:Ljava/lang/String;

    const-string/jumbo v2, "os/2"

    if-eqz v1, :cond_0

    .line 728
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v3, "Table {0} does not exist in {1}"

    invoke-direct {v1, v3}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->fileName:Ljava/lang/String;

    filled-new-array {v2, v3}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v1

    throw v1

    .line 730
    :cond_0
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v3, "Table {0} does not exist."

    invoke-direct {v1, v3}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v1

    throw v1

    .line 733
    :cond_1
    new-instance v1, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    invoke-direct {v1}, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;-><init>()V

    iput-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    .line 734
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    const/4 v2, 0x0

    aget v3, v0, v2

    int-to-long v3, v3

    invoke-virtual {v1, v3, v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 735
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v1

    .line 736
    .local v1, "version":I
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v4

    iput-short v4, v3, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->xAvgCharWidth:S

    .line 737
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v4

    iput v4, v3, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->usWeightClass:I

    .line 738
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v4

    iput v4, v3, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->usWidthClass:I

    .line 739
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v4

    iput-short v4, v3, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->fsType:S

    .line 740
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v4

    iput-short v4, v3, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->ySubscriptXSize:S

    .line 741
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v4

    iput-short v4, v3, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->ySubscriptYSize:S

    .line 742
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v4

    iput-short v4, v3, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->ySubscriptXOffset:S

    .line 743
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v4

    iput-short v4, v3, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->ySubscriptYOffset:S

    .line 744
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v4

    iput-short v4, v3, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->ySuperscriptXSize:S

    .line 745
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v4

    iput-short v4, v3, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->ySuperscriptYSize:S

    .line 746
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v4

    iput-short v4, v3, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->ySuperscriptXOffset:S

    .line 747
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v4

    iput-short v4, v3, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->ySuperscriptYOffset:S

    .line 748
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v4

    iput-short v4, v3, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->yStrikeoutSize:S

    .line 749
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v4

    iput-short v4, v3, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->yStrikeoutPosition:S

    .line 750
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v4

    iput-short v4, v3, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->sFamilyClass:S

    .line 751
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget-object v4, v4, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->panose:[B

    invoke-virtual {v3, v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readFully([B)V

    .line 752
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    const/16 v4, 0x10

    invoke-virtual {v3, v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->skipBytes(I)I

    .line 753
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget-object v4, v4, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->achVendID:[B

    invoke-virtual {v3, v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readFully([B)V

    .line 754
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v4

    iput v4, v3, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->fsSelection:I

    .line 755
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v4

    iput v4, v3, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->usFirstCharIndex:I

    .line 756
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v4

    iput v4, v3, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->usLastCharIndex:I

    .line 757
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v4

    iput-short v4, v3, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->sTypoAscender:S

    .line 758
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v4

    iput-short v4, v3, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->sTypoDescender:S

    .line 759
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget-short v3, v3, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->sTypoDescender:S

    if-lez v3, :cond_2

    .line 760
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget-short v4, v4, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->sTypoDescender:S

    neg-int v4, v4

    int-to-short v4, v4

    iput-short v4, v3, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->sTypoDescender:S

    .line 762
    :cond_2
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v4

    iput-short v4, v3, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->sTypoLineGap:S

    .line 763
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v4

    iput v4, v3, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->usWinAscent:I

    .line 764
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v4

    iput v4, v3, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->usWinDescent:I

    .line 765
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget v3, v3, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->usWinDescent:I

    if-lez v3, :cond_3

    .line 766
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget v4, v4, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->usWinDescent:I

    neg-int v4, v4

    int-to-short v4, v4

    iput v4, v3, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->usWinDescent:I

    .line 768
    :cond_3
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iput v2, v3, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->ulCodePageRange1:I

    .line 769
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iput v2, v3, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->ulCodePageRange2:I

    .line 770
    if-lez v1, :cond_4

    .line 771
    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readInt()I

    move-result v3

    iput v3, v2, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->ulCodePageRange1:I

    .line 772
    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readInt()I

    move-result v3

    iput v3, v2, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->ulCodePageRange2:I

    .line 774
    :cond_4
    const/4 v2, 0x1

    if-le v1, v2, :cond_5

    .line 775
    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->skipBytes(I)I

    .line 776
    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v3

    iput v3, v2, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->sCapHeight:I

    goto :goto_0

    .line 778
    :cond_5
    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->head:Lcom/itextpdf/io/font/OpenTypeParser$HeaderTable;

    iget v3, v3, Lcom/itextpdf/io/font/OpenTypeParser$HeaderTable;->unitsPerEm:I

    int-to-double v3, v3

    const-wide v5, 0x3fe6666666666666L    # 0.7

    mul-double/2addr v3, v5

    double-to-int v3, v3

    iput v3, v2, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->sCapHeight:I

    .line 780
    :goto_0
    return-void
.end method

.method private readPostTable()V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 783
    iget-object v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->tables:Ljava/util/Map;

    const-string/jumbo v1, "post"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    .line 784
    .local v0, "table_location":[I
    if-eqz v0, :cond_1

    .line 785
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    const/4 v2, 0x0

    aget v3, v0, v2

    add-int/lit8 v3, v3, 0x4

    int-to-long v3, v3

    invoke-virtual {v1, v3, v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 786
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v1

    .line 787
    .local v1, "mantissa":S
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v3

    .line 788
    .local v3, "fraction":I
    new-instance v4, Lcom/itextpdf/io/font/OpenTypeParser$PostTable;

    invoke-direct {v4}, Lcom/itextpdf/io/font/OpenTypeParser$PostTable;-><init>()V

    iput-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->post:Lcom/itextpdf/io/font/OpenTypeParser$PostTable;

    .line 789
    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->post:Lcom/itextpdf/io/font/OpenTypeParser$PostTable;

    int-to-double v5, v1

    int-to-double v7, v3

    const-wide/high16 v9, 0x40d0000000000000L    # 16384.0

    div-double/2addr v7, v9

    add-double/2addr v5, v7

    double-to-float v5, v5

    iput v5, v4, Lcom/itextpdf/io/font/OpenTypeParser$PostTable;->italicAngle:F

    .line 790
    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->post:Lcom/itextpdf/io/font/OpenTypeParser$PostTable;

    iget-object v5, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v5}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v5

    iput v5, v4, Lcom/itextpdf/io/font/OpenTypeParser$PostTable;->underlinePosition:I

    .line 791
    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->post:Lcom/itextpdf/io/font/OpenTypeParser$PostTable;

    iget-object v5, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v5}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v5

    iput v5, v4, Lcom/itextpdf/io/font/OpenTypeParser$PostTable;->underlineThickness:I

    .line 792
    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->post:Lcom/itextpdf/io/font/OpenTypeParser$PostTable;

    iget-object v5, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v5}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readInt()I

    move-result v5

    if-eqz v5, :cond_0

    const/4 v2, 0x1

    :cond_0
    iput-boolean v2, v4, Lcom/itextpdf/io/font/OpenTypeParser$PostTable;->isFixedPitch:Z

    .line 793
    .end local v1    # "mantissa":S
    .end local v3    # "fraction":I
    goto :goto_0

    .line 794
    :cond_1
    new-instance v1, Lcom/itextpdf/io/font/OpenTypeParser$PostTable;

    invoke-direct {v1}, Lcom/itextpdf/io/font/OpenTypeParser$PostTable;-><init>()V

    iput-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->post:Lcom/itextpdf/io/font/OpenTypeParser$PostTable;

    .line 795
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->post:Lcom/itextpdf/io/font/OpenTypeParser$PostTable;

    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->hhea:Lcom/itextpdf/io/font/OpenTypeParser$HorizontalHeader;

    iget-short v2, v2, Lcom/itextpdf/io/font/OpenTypeParser$HorizontalHeader;->caretSlopeRun:S

    int-to-double v2, v2

    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->hhea:Lcom/itextpdf/io/font/OpenTypeParser$HorizontalHeader;

    iget-short v4, v4, Lcom/itextpdf/io/font/OpenTypeParser$HorizontalHeader;->caretSlopeRise:S

    int-to-double v4, v4

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v2

    neg-double v2, v2

    const-wide v4, 0x4066800000000000L    # 180.0

    mul-double/2addr v2, v4

    const-wide v4, 0x400921fb54442d18L    # Math.PI

    div-double/2addr v2, v4

    double-to-float v2, v2

    iput v2, v1, Lcom/itextpdf/io/font/OpenTypeParser$PostTable;->italicAngle:F

    .line 797
    :goto_0
    return-void
.end method

.method private readStandardString(I)Ljava/lang/String;
    .locals 2
    .param p1, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 898
    iget-object v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    const-string v1, "Cp1252"

    invoke-virtual {v0, p1, v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readString(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private readUnicodeString(I)Ljava/lang/String;
    .locals 3
    .param p1, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 909
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 910
    .local v0, "buf":Ljava/lang/StringBuilder;
    div-int/lit8 p1, p1, 0x2

    .line 911
    const/4 v1, 0x0

    .local v1, "k":I
    :goto_0
    if-ge v1, p1, :cond_0

    .line 912
    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readChar()C

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 911
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 914
    .end local v1    # "k":I
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method protected checkCff()V
    .locals 3

    .line 457
    iget-object v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->tables:Ljava/util/Map;

    const-string v1, "CFF "

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    .line 458
    .local v0, "table_location":[I
    if-eqz v0, :cond_0

    .line 459
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->cff:Z

    .line 460
    const/4 v2, 0x0

    aget v2, v0, v2

    iput v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->cffOffset:I

    .line 461
    aget v1, v0, v1

    iput v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->cffLength:I

    .line 463
    :cond_0
    return-void
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 359
    iget-object v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    if-eqz v0, :cond_0

    .line 360
    iget-object v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->close()V

    .line 362
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    .line 363
    return-void
.end method

.method public getAllNameEntries()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/List<",
            "[",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 241
    iget-object v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->allNameEntries:Ljava/util/Map;

    return-object v0
.end method

.method public getCmapTable()Lcom/itextpdf/io/font/OpenTypeParser$CmapTable;
    .locals 1

    .line 261
    iget-object v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->cmaps:Lcom/itextpdf/io/font/OpenTypeParser$CmapTable;

    return-object v0
.end method

.method public getFontNames()Lcom/itextpdf/io/font/FontNames;
    .locals 11

    .line 269
    new-instance v0, Lcom/itextpdf/io/font/FontNames;

    invoke-direct {v0}, Lcom/itextpdf/io/font/FontNames;-><init>()V

    .line 270
    .local v0, "fontNames":Lcom/itextpdf/io/font/FontNames;
    invoke-virtual {p0}, Lcom/itextpdf/io/font/OpenTypeParser;->getAllNameEntries()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/font/FontNames;->setAllNames(Ljava/util/Map;)V

    .line 271
    invoke-virtual {p0}, Lcom/itextpdf/io/font/OpenTypeParser;->getPsFontName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/font/FontNames;->setFontName(Ljava/lang/String;)V

    .line 272
    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/font/FontNames;->getNames(I)[[Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/font/FontNames;->setFullName([[Ljava/lang/String;)V

    .line 273
    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/font/FontNames;->getNames(I)[[Ljava/lang/String;

    move-result-object v1

    .line 274
    .local v1, "otfFamilyName":[[Ljava/lang/String;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/itextpdf/io/font/FontNames;->getNames(I)[[Ljava/lang/String;

    move-result-object v3

    .line 275
    .local v3, "familyName":[[Ljava/lang/String;
    invoke-virtual {v0, v3}, Lcom/itextpdf/io/font/FontNames;->setFamilyName2([[Ljava/lang/String;)V

    .line 276
    if-eqz v1, :cond_0

    .line 277
    invoke-virtual {v0, v1}, Lcom/itextpdf/io/font/FontNames;->setFamilyName([[Ljava/lang/String;)V

    goto :goto_0

    .line 279
    :cond_0
    invoke-virtual {v0, v3}, Lcom/itextpdf/io/font/FontNames;->setFamilyName([[Ljava/lang/String;)V

    .line 281
    :goto_0
    const/4 v4, 0x2

    invoke-virtual {v0, v4}, Lcom/itextpdf/io/font/FontNames;->getNames(I)[[Ljava/lang/String;

    move-result-object v5

    .line 282
    .local v5, "subfamily":[[Ljava/lang/String;
    const/4 v6, 0x3

    const/4 v7, 0x0

    if-eqz v5, :cond_1

    .line 283
    aget-object v8, v5, v7

    aget-object v8, v8, v6

    invoke-virtual {v0, v8}, Lcom/itextpdf/io/font/FontNames;->setStyle(Ljava/lang/String;)V

    .line 285
    :cond_1
    const/16 v8, 0x11

    invoke-virtual {v0, v8}, Lcom/itextpdf/io/font/FontNames;->getNames(I)[[Ljava/lang/String;

    move-result-object v8

    .line 286
    .local v8, "otfSubFamily":[[Ljava/lang/String;
    if-eqz v1, :cond_2

    .line 287
    invoke-virtual {v0, v8}, Lcom/itextpdf/io/font/FontNames;->setSubfamily([[Ljava/lang/String;)V

    goto :goto_1

    .line 289
    :cond_2
    invoke-virtual {v0, v5}, Lcom/itextpdf/io/font/FontNames;->setSubfamily([[Ljava/lang/String;)V

    .line 291
    :goto_1
    const/16 v9, 0x14

    invoke-virtual {v0, v9}, Lcom/itextpdf/io/font/FontNames;->getNames(I)[[Ljava/lang/String;

    move-result-object v9

    .line 292
    .local v9, "cidName":[[Ljava/lang/String;
    if-eqz v9, :cond_3

    .line 293
    aget-object v10, v9, v7

    aget-object v6, v10, v6

    invoke-virtual {v0, v6}, Lcom/itextpdf/io/font/FontNames;->setCidFontName(Ljava/lang/String;)V

    .line 295
    :cond_3
    iget-object v6, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget v6, v6, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->usWeightClass:I

    invoke-virtual {v0, v6}, Lcom/itextpdf/io/font/FontNames;->setFontWeight(I)V

    .line 296
    iget-object v6, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget v6, v6, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->usWidthClass:I

    invoke-static {v6}, Lcom/itextpdf/io/font/constants/FontStretches;->fromOpenTypeWidthClass(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Lcom/itextpdf/io/font/FontNames;->setFontStretch(Ljava/lang/String;)V

    .line 297
    iget-object v6, p0, Lcom/itextpdf/io/font/OpenTypeParser;->head:Lcom/itextpdf/io/font/OpenTypeParser$HeaderTable;

    iget v6, v6, Lcom/itextpdf/io/font/OpenTypeParser$HeaderTable;->macStyle:I

    invoke-virtual {v0, v6}, Lcom/itextpdf/io/font/FontNames;->setMacStyle(I)V

    .line 298
    iget-object v6, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    iget-short v6, v6, Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;->fsType:S

    if-eq v6, v4, :cond_4

    goto :goto_2

    :cond_4
    move v2, v7

    :goto_2
    invoke-virtual {v0, v2}, Lcom/itextpdf/io/font/FontNames;->setAllowEmbedding(Z)V

    .line 299
    return-object v0
.end method

.method public getFullFont()[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 307
    const/4 v0, 0x0

    .line 309
    .local v0, "rf2":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    :try_start_0
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->createView()Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    move-result-object v1

    move-object v0, v1

    .line 310
    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->length()J

    move-result-wide v1

    long-to-int v1, v1

    new-array v1, v1, [B

    .line 311
    .local v1, "b":[B
    invoke-virtual {v0, v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readFully([B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 312
    nop

    .line 315
    if-eqz v0, :cond_0

    .line 316
    :try_start_1
    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 318
    :catch_0
    move-exception v2

    goto :goto_1

    .line 319
    :cond_0
    :goto_0
    nop

    .line 312
    :goto_1
    return-object v1

    .line 314
    .end local v1    # "b":[B
    :catchall_0
    move-exception v1

    .line 315
    if-eqz v0, :cond_1

    .line 316
    :try_start_2
    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2

    .line 318
    :catch_1
    move-exception v2

    goto :goto_3

    .line 319
    :cond_1
    :goto_2
    nop

    .line 320
    :goto_3
    throw v1
.end method

.method protected getGlyphWidth(I)I
    .locals 1
    .param p1, "glyph"    # I

    .line 924
    iget-object v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->glyphWidthsByIndex:[I

    array-length v0, v0

    if-lt p1, v0, :cond_0

    .line 925
    iget-object v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->glyphWidthsByIndex:[I

    array-length v0, v0

    add-int/lit8 p1, v0, -0x1

    .line 926
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->glyphWidthsByIndex:[I

    aget v0, v0, p1

    return v0
.end method

.method public getGlyphWidthsByIndex()[I
    .locals 1

    .line 265
    iget-object v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->glyphWidthsByIndex:[I

    return-object v0
.end method

.method public getHeadTable()Lcom/itextpdf/io/font/OpenTypeParser$HeaderTable;
    .locals 1

    .line 257
    iget-object v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->head:Lcom/itextpdf/io/font/OpenTypeParser$HeaderTable;

    return-object v0
.end method

.method public getHheaTable()Lcom/itextpdf/io/font/OpenTypeParser$HorizontalHeader;
    .locals 1

    .line 253
    iget-object v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->hhea:Lcom/itextpdf/io/font/OpenTypeParser$HorizontalHeader;

    return-object v0
.end method

.method public getOs_2Table()Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;
    .locals 1

    .line 249
    iget-object v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->os_2:Lcom/itextpdf/io/font/OpenTypeParser$WindowsMetrics;

    return-object v0
.end method

.method public getPostTable()Lcom/itextpdf/io/font/OpenTypeParser$PostTable;
    .locals 1

    .line 245
    iget-object v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->post:Lcom/itextpdf/io/font/OpenTypeParser$PostTable;

    return-object v0
.end method

.method public getPsFontName()Ljava/lang/String;
    .locals 4

    .line 229
    iget-object v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->fontName:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 230
    iget-object v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->allNameEntries:Ljava/util/Map;

    const/4 v1, 0x6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 231
    .local v0, "names":Ljava/util/List;, "Ljava/util/List<[Ljava/lang/String;>;"
    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 232
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    const/4 v2, 0x3

    aget-object v1, v1, v2

    iput-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->fontName:Ljava/lang/String;

    goto :goto_0

    .line 234
    :cond_0
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->fileName:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x20

    const/16 v3, 0x2d

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->fontName:Ljava/lang/String;

    .line 237
    .end local v0    # "names":Ljava/util/List;, "Ljava/util/List<[Ljava/lang/String;>;"
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->fontName:Ljava/lang/String;

    return-object v0
.end method

.method getSubset(Ljava/util/Set;Z)[B
    .locals 6
    .param p2, "subset"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;Z)[B"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 352
    .local p1, "glyphs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    new-instance v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;

    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->fileName:Ljava/lang/String;

    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    .line 353
    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->createView()Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    move-result-object v2

    iget v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->directoryOffset:I

    move-object v3, p1

    move v5, p2

    .end local p1    # "glyphs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .end local p2    # "subset":Z
    .local v3, "glyphs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .local v5, "subset":Z
    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/io/font/TrueTypeFontSubset;-><init>(Ljava/lang/String;Lcom/itextpdf/io/source/RandomAccessFileOrArray;Ljava/util/Set;IZ)V

    .line 354
    .local v0, "sb":Lcom/itextpdf/io/font/TrueTypeFontSubset;
    invoke-virtual {v0}, Lcom/itextpdf/io/font/TrueTypeFontSubset;->process()[B

    move-result-object p1

    return-object p1
.end method

.method public isCff()Z
    .locals 1

    .line 303
    iget-boolean v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->cff:Z

    return v0
.end method

.method protected loadTables(Z)V
    .locals 0
    .param p1, "all"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 424
    invoke-direct {p0}, Lcom/itextpdf/io/font/OpenTypeParser;->readNameTable()V

    .line 425
    invoke-direct {p0}, Lcom/itextpdf/io/font/OpenTypeParser;->readHeadTable()V

    .line 426
    invoke-direct {p0}, Lcom/itextpdf/io/font/OpenTypeParser;->readOs_2Table()V

    .line 427
    invoke-direct {p0}, Lcom/itextpdf/io/font/OpenTypeParser;->readPostTable()V

    .line 428
    if-eqz p1, :cond_0

    .line 429
    invoke-virtual {p0}, Lcom/itextpdf/io/font/OpenTypeParser;->checkCff()V

    .line 430
    invoke-direct {p0}, Lcom/itextpdf/io/font/OpenTypeParser;->readHheaTable()V

    .line 431
    invoke-virtual {p0}, Lcom/itextpdf/io/font/OpenTypeParser;->readGlyphWidths()V

    .line 432
    invoke-direct {p0}, Lcom/itextpdf/io/font/OpenTypeParser;->readCmapTable()V

    .line 434
    :cond_0
    return-void
.end method

.method protected readBbox(I)[[I
    .locals 12
    .param p1, "unitsPerEm"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 545
    iget-object v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->tables:Ljava/util/Map;

    const-string v1, "head"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    .line 546
    .local v0, "tableLocation":[I
    const-string v2, "Table {0} does not exist in {1}"

    const-string v3, "Table {0} does not exist."

    if-nez v0, :cond_1

    .line 547
    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->fileName:Ljava/lang/String;

    if-eqz v4, :cond_0

    .line 548
    new-instance v3, Lcom/itextpdf/io/exceptions/IOException;

    invoke-direct {v3, v2}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->fileName:Ljava/lang/String;

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v3, v1}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v1

    throw v1

    .line 550
    :cond_0
    new-instance v2, Lcom/itextpdf/io/exceptions/IOException;

    invoke-direct {v2, v3}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v1

    throw v1

    .line 553
    :cond_1
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    const/4 v4, 0x0

    aget v5, v0, v4

    add-int/lit8 v5, v5, 0x33

    int-to-long v5, v5

    invoke-virtual {v1, v5, v6}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 554
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v1

    const/4 v5, 0x1

    if-nez v1, :cond_2

    move v1, v5

    goto :goto_0

    :cond_2
    move v1, v4

    .line 555
    .local v1, "locaShortTable":Z
    :goto_0
    iget-object v6, p0, Lcom/itextpdf/io/font/OpenTypeParser;->tables:Ljava/util/Map;

    const-string v7, "loca"

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    move-object v0, v6

    check-cast v0, [I

    .line 556
    if-nez v0, :cond_3

    .line 557
    const/4 v2, 0x0

    move-object v3, v2

    check-cast v3, [[I

    return-object v2

    .line 559
    :cond_3
    iget-object v6, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    aget v7, v0, v4

    int-to-long v7, v7

    invoke-virtual {v6, v7, v8}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 561
    if-eqz v1, :cond_5

    .line 562
    aget v6, v0, v5

    div-int/lit8 v6, v6, 0x2

    .line 563
    .local v6, "entries":I
    new-array v7, v6, [I

    .line 564
    .local v7, "locaTable":[I
    const/4 v8, 0x0

    .local v8, "k":I
    :goto_1
    if-ge v8, v6, :cond_4

    .line 565
    iget-object v9, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v9}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v9

    mul-int/lit8 v9, v9, 0x2

    aput v9, v7, v8

    .line 564
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 567
    .end local v6    # "entries":I
    .end local v8    # "k":I
    :cond_4
    goto :goto_3

    .line 568
    .end local v7    # "locaTable":[I
    :cond_5
    aget v6, v0, v5

    div-int/lit8 v6, v6, 0x4

    .line 569
    .restart local v6    # "entries":I
    new-array v7, v6, [I

    .line 570
    .restart local v7    # "locaTable":[I
    const/4 v8, 0x0

    .restart local v8    # "k":I
    :goto_2
    if-ge v8, v6, :cond_6

    .line 571
    iget-object v9, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v9}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readInt()I

    move-result v9

    aput v9, v7, v8

    .line 570
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    .line 575
    .end local v6    # "entries":I
    .end local v8    # "k":I
    :cond_6
    :goto_3
    iget-object v6, p0, Lcom/itextpdf/io/font/OpenTypeParser;->tables:Ljava/util/Map;

    const-string v8, "glyf"

    invoke-interface {v6, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    move-object v0, v6

    check-cast v0, [I

    .line 576
    if-nez v0, :cond_8

    .line 577
    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->fileName:Ljava/lang/String;

    if-eqz v4, :cond_7

    .line 578
    new-instance v3, Lcom/itextpdf/io/exceptions/IOException;

    invoke-direct {v3, v2}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->fileName:Ljava/lang/String;

    filled-new-array {v8, v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v2

    throw v2

    .line 580
    :cond_7
    new-instance v2, Lcom/itextpdf/io/exceptions/IOException;

    invoke-direct {v2, v3}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    filled-new-array {v8}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v2

    throw v2

    .line 583
    :cond_8
    aget v2, v0, v4

    .line 584
    .local v2, "tableGlyphOffset":I
    array-length v3, v7

    sub-int/2addr v3, v5

    new-array v3, v3, [[I

    .line 585
    .local v3, "bboxes":[[I
    const/4 v4, 0x0

    .local v4, "glyph":I
    :goto_4
    array-length v6, v7

    sub-int/2addr v6, v5

    if-ge v4, v6, :cond_a

    .line 586
    aget v6, v7, v4

    .line 587
    .local v6, "start":I
    add-int/lit8 v8, v4, 0x1

    aget v8, v7, v8

    if-eq v6, v8, :cond_9

    .line 588
    iget-object v8, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    add-int v9, v2, v6

    add-int/lit8 v9, v9, 0x2

    int-to-long v9, v9

    invoke-virtual {v8, v9, v10}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 589
    iget-object v8, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    .line 590
    invoke-virtual {v8}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v8

    invoke-static {v8}, Lcom/itextpdf/io/font/FontProgram;->convertGlyphSpaceToTextSpace(I)I

    move-result v8

    div-int/2addr v8, p1

    iget-object v9, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    .line 591
    invoke-virtual {v9}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v9

    invoke-static {v9}, Lcom/itextpdf/io/font/FontProgram;->convertGlyphSpaceToTextSpace(I)I

    move-result v9

    div-int/2addr v9, p1

    iget-object v10, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    .line 592
    invoke-virtual {v10}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v10

    invoke-static {v10}, Lcom/itextpdf/io/font/FontProgram;->convertGlyphSpaceToTextSpace(I)I

    move-result v10

    div-int/2addr v10, p1

    iget-object v11, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    .line 593
    invoke-virtual {v11}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v11

    invoke-static {v11}, Lcom/itextpdf/io/font/FontProgram;->convertGlyphSpaceToTextSpace(I)I

    move-result v11

    div-int/2addr v11, p1

    filled-new-array {v8, v9, v10, v11}, [I

    move-result-object v8

    aput-object v8, v3, v4

    .line 585
    .end local v6    # "start":I
    :cond_9
    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    .line 597
    .end local v4    # "glyph":I
    :cond_a
    return-object v3
.end method

.method public readCffFont()[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 331
    invoke-virtual {p0}, Lcom/itextpdf/io/font/OpenTypeParser;->isCff()Z

    move-result v0

    if-nez v0, :cond_0

    .line 332
    const/4 v0, 0x0

    return-object v0

    .line 334
    :cond_0
    const/4 v0, 0x0

    .line 336
    .local v0, "rf2":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    :try_start_0
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->createView()Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    move-result-object v1

    move-object v0, v1

    .line 337
    iget v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->cffOffset:I

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 338
    iget v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->cffLength:I

    new-array v1, v1, [B

    .line 339
    .local v1, "cff":[B
    invoke-virtual {v0, v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readFully([B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 340
    nop

    .line 343
    if-eqz v0, :cond_1

    .line 344
    :try_start_1
    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 346
    :catch_0
    move-exception v2

    goto :goto_1

    .line 347
    :cond_1
    :goto_0
    nop

    .line 340
    :goto_1
    return-object v1

    .line 342
    .end local v1    # "cff":[B
    :catchall_0
    move-exception v1

    .line 343
    if-eqz v0, :cond_2

    .line 344
    :try_start_2
    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2

    .line 346
    :catch_1
    move-exception v2

    goto :goto_3

    .line 347
    :cond_2
    :goto_2
    nop

    .line 348
    :goto_3
    throw v1
.end method

.method protected readGlyphWidths()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 473
    iget-object v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->hhea:Lcom/itextpdf/io/font/OpenTypeParser$HorizontalHeader;

    iget v0, v0, Lcom/itextpdf/io/font/OpenTypeParser$HorizontalHeader;->numberOfHMetrics:I

    .line 474
    .local v0, "numberOfHMetrics":I
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->head:Lcom/itextpdf/io/font/OpenTypeParser$HeaderTable;

    iget v1, v1, Lcom/itextpdf/io/font/OpenTypeParser$HeaderTable;->unitsPerEm:I

    .line 476
    .local v1, "unitsPerEm":I
    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->tables:Ljava/util/Map;

    const-string v3, "hmtx"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [I

    .line 477
    .local v2, "table_location":[I
    if-nez v2, :cond_1

    .line 478
    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->fileName:Ljava/lang/String;

    if-eqz v4, :cond_0

    .line 479
    new-instance v4, Lcom/itextpdf/io/exceptions/IOException;

    const-string v5, "Table {0} does not exist in {1}"

    invoke-direct {v4, v5}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    iget-object v5, p0, Lcom/itextpdf/io/font/OpenTypeParser;->fileName:Ljava/lang/String;

    filled-new-array {v3, v5}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v3

    throw v3

    .line 481
    :cond_0
    new-instance v4, Lcom/itextpdf/io/exceptions/IOException;

    const-string v5, "Table {0} does not exist."

    invoke-direct {v4, v5}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v3

    throw v3

    .line 484
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/io/font/OpenTypeParser;->readNumGlyphs()I

    move-result v3

    new-array v3, v3, [I

    iput-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->glyphWidthsByIndex:[I

    .line 485
    iget-object v3, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    const/4 v4, 0x0

    aget v4, v2, v4

    int-to-long v4, v4

    invoke-virtual {v3, v4, v5}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 486
    const/4 v3, 0x0

    .local v3, "k":I
    :goto_0
    if-ge v3, v0, :cond_2

    .line 487
    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->glyphWidthsByIndex:[I

    iget-object v5, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v5}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v5

    invoke-static {v5}, Lcom/itextpdf/io/font/FontProgram;->convertGlyphSpaceToTextSpace(I)I

    move-result v5

    div-int/2addr v5, v1

    aput v5, v4, v3

    .line 488
    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    .line 489
    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v4

    invoke-static {v4}, Lcom/itextpdf/io/font/FontProgram;->convertGlyphSpaceToTextSpace(I)I

    move-result v4

    div-int/2addr v4, v1

    .line 486
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 493
    .end local v3    # "k":I
    :cond_2
    if-lez v0, :cond_3

    .line 494
    move v3, v0

    .restart local v3    # "k":I
    :goto_1
    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->glyphWidthsByIndex:[I

    array-length v4, v4

    if-ge v3, v4, :cond_3

    .line 495
    iget-object v4, p0, Lcom/itextpdf/io/font/OpenTypeParser;->glyphWidthsByIndex:[I

    iget-object v5, p0, Lcom/itextpdf/io/font/OpenTypeParser;->glyphWidthsByIndex:[I

    add-int/lit8 v6, v0, -0x1

    aget v5, v5, v6

    aput v5, v4, v3

    .line 494
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 498
    .end local v3    # "k":I
    :cond_3
    return-void
.end method

.method protected readKerning(I)Lcom/itextpdf/io/util/IntHashtable;
    .locals 12
    .param p1, "unitsPerEm"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 508
    iget-object v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->tables:Ljava/util/Map;

    const-string v1, "kern"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    .line 509
    .local v0, "table_location":[I
    new-instance v1, Lcom/itextpdf/io/util/IntHashtable;

    invoke-direct {v1}, Lcom/itextpdf/io/util/IntHashtable;-><init>()V

    .line 510
    .local v1, "kerning":Lcom/itextpdf/io/util/IntHashtable;
    if-nez v0, :cond_0

    .line 511
    return-object v1

    .line 513
    :cond_0
    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    const/4 v3, 0x0

    aget v4, v0, v3

    const/4 v5, 0x2

    add-int/2addr v4, v5

    int-to-long v6, v4

    invoke-virtual {v2, v6, v7}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 514
    iget-object v2, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v2

    .line 515
    .local v2, "nTables":I
    aget v3, v0, v3

    add-int/lit8 v3, v3, 0x4

    .line 516
    .local v3, "checkpoint":I
    const/4 v4, 0x0

    .line 517
    .local v4, "length":I
    const/4 v6, 0x0

    .local v6, "k":I
    :goto_0
    if-ge v6, v2, :cond_2

    .line 518
    add-int/2addr v3, v4

    .line 519
    iget-object v7, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    int-to-long v8, v3

    invoke-virtual {v7, v8, v9}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 520
    iget-object v7, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v7, v5}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->skipBytes(I)I

    .line 521
    iget-object v7, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v7}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v4

    .line 522
    iget-object v7, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v7}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v7

    .line 523
    .local v7, "coverage":I
    const v8, 0xfff7

    and-int/2addr v8, v7

    const/4 v9, 0x1

    if-ne v8, v9, :cond_1

    .line 524
    iget-object v8, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v8}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v8

    .line 525
    .local v8, "nPairs":I
    iget-object v9, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    const/4 v10, 0x6

    invoke-virtual {v9, v10}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->skipBytes(I)I

    .line 526
    const/4 v9, 0x0

    .local v9, "j":I
    :goto_1
    if-ge v9, v8, :cond_1

    .line 527
    iget-object v10, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v10}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readInt()I

    move-result v10

    .line 528
    .local v10, "pair":I
    iget-object v11, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v11}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v11

    invoke-static {v11}, Lcom/itextpdf/io/font/FontProgram;->convertGlyphSpaceToTextSpace(I)I

    move-result v11

    div-int/2addr v11, p1

    .line 529
    .local v11, "value":I
    invoke-virtual {v1, v10, v11}, Lcom/itextpdf/io/util/IntHashtable;->put(II)I

    .line 526
    .end local v10    # "pair":I
    .end local v11    # "value":I
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 517
    .end local v7    # "coverage":I
    .end local v8    # "nPairs":I
    .end local v9    # "j":I
    :cond_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 533
    .end local v6    # "k":I
    :cond_2
    return-object v1
.end method

.method protected readNumGlyphs()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 601
    iget-object v0, p0, Lcom/itextpdf/io/font/OpenTypeParser;->tables:Ljava/util/Map;

    const-string v1, "maxp"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    .line 602
    .local v0, "table_location":[I
    if-nez v0, :cond_0

    .line 603
    const/high16 v1, 0x10000

    return v1

    .line 605
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    const/4 v2, 0x0

    aget v2, v0, v2

    add-int/lit8 v2, v2, 0x4

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 606
    iget-object v1, p0, Lcom/itextpdf/io/font/OpenTypeParser;->raf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v1

    return v1
.end method
