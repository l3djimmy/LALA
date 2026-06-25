.class public Lcom/itextpdf/io/codec/Jbig2SegmentReader;
.super Ljava/lang/Object;
.source "Jbig2SegmentReader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Page;,
        Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;
    }
.end annotation


# static fields
.field public static final END_OF_FILE:I = 0x33

.field public static final END_OF_PAGE:I = 0x31

.field public static final END_OF_STRIPE:I = 0x32

.field public static final EXTENSION:I = 0x3e

.field public static final IMMEDIATE_GENERIC_REFINEMENT_REGION:I = 0x2a

.field public static final IMMEDIATE_GENERIC_REGION:I = 0x26

.field public static final IMMEDIATE_HALFTONE_REGION:I = 0x16

.field public static final IMMEDIATE_LOSSLESS_GENERIC_REFINEMENT_REGION:I = 0x2b

.field public static final IMMEDIATE_LOSSLESS_GENERIC_REGION:I = 0x27

.field public static final IMMEDIATE_LOSSLESS_HALFTONE_REGION:I = 0x17

.field public static final IMMEDIATE_LOSSLESS_TEXT_REGION:I = 0x7

.field public static final IMMEDIATE_TEXT_REGION:I = 0x6

.field public static final INTERMEDIATE_GENERIC_REFINEMENT_REGION:I = 0x28

.field public static final INTERMEDIATE_GENERIC_REGION:I = 0x24

.field public static final INTERMEDIATE_HALFTONE_REGION:I = 0x14

.field public static final INTERMEDIATE_TEXT_REGION:I = 0x4

.field public static final PAGE_INFORMATION:I = 0x30

.field public static final PATTERN_DICTIONARY:I = 0x10

.field public static final PROFILES:I = 0x34

.field public static final SYMBOL_DICTIONARY:I = 0x0

.field public static final TABLES:I = 0x35


# instance fields
.field private final globals:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;",
            ">;"
        }
    .end annotation
.end field

.field private number_of_pages:I

.field private number_of_pages_known:Z

.field private final pages:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Page;",
            ">;"
        }
    .end annotation
.end field

.field private ra:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

.field private read:Z

.field private final segments:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;",
            ">;"
        }
    .end annotation
.end field

.field private sequential:Z


# direct methods
.method public constructor <init>(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)V
    .locals 1
    .param p1, "ra"    # Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    .line 192
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->segments:Ljava/util/Map;

    .line 92
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->pages:Ljava/util/Map;

    .line 93
    new-instance v0, Ljava/util/TreeSet;

    invoke-direct {v0}, Ljava/util/TreeSet;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->globals:Ljava/util/Set;

    .line 97
    const/4 v0, -0x1

    iput v0, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->number_of_pages:I

    .line 98
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->read:Z

    .line 193
    iput-object p1, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->ra:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    .line 194
    return-void
.end method

.method public static copyByteArray([B)[B
    .locals 3
    .param p0, "b"    # [B

    .line 197
    array-length v0, p0

    new-array v0, v0, [B

    .line 198
    .local v0, "bc":[B
    const/4 v1, 0x0

    array-length v2, p0

    invoke-static {p0, v1, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 199
    return-object v0
.end method


# virtual methods
.method public getGlobal(Z)[B
    .locals 7
    .param p1, "for_embedding"    # Z

    .line 407
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 408
    .local v0, "os":Ljava/io/ByteArrayOutputStream;
    const/4 v1, 0x0

    .line 410
    .local v1, "streamBytes":[B
    :try_start_0
    iget-object v2, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->globals:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 411
    .local v3, "element":Ljava/lang/Object;
    move-object v4, v3

    check-cast v4, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;

    .line 412
    .local v4, "s":Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;
    if-eqz p1, :cond_1

    iget v5, v4, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->type:I

    const/16 v6, 0x33

    if-eq v5, v6, :cond_0

    iget v5, v4, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->type:I

    const/16 v6, 0x31

    if-ne v5, v6, :cond_1

    .line 414
    goto :goto_0

    .line 416
    :cond_1
    iget-object v5, v4, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->headerData:[B

    invoke-virtual {v0, v5}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 417
    iget-object v5, v4, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->data:[B

    invoke-virtual {v0, v5}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 418
    .end local v3    # "element":Ljava/lang/Object;
    .end local v4    # "s":Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;
    goto :goto_0

    .line 420
    :cond_2
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v2

    if-lez v2, :cond_3

    .line 421
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    move-object v1, v2

    .line 423
    :cond_3
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 427
    goto :goto_1

    .line 424
    :catch_0
    move-exception v2

    .line 425
    .local v2, "e":Ljava/io/IOException;
    const-class v3, Lcom/itextpdf/io/codec/Jbig2SegmentReader;

    invoke-static {v3}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v3

    .line 426
    .local v3, "logger":Lorg/slf4j/Logger;
    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    .line 429
    .end local v2    # "e":Ljava/io/IOException;
    .end local v3    # "logger":Lorg/slf4j/Logger;
    :goto_1
    return-object v1
.end method

.method public getPage(I)Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Page;
    .locals 2
    .param p1, "page"    # I

    .line 403
    iget-object v0, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->pages:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Page;

    return-object v0
.end method

.method public getPageHeight(I)I
    .locals 2
    .param p1, "i"    # I

    .line 395
    iget-object v0, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->pages:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Page;

    iget v0, v0, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Page;->pageBitmapHeight:I

    return v0
.end method

.method public getPageWidth(I)I
    .locals 2
    .param p1, "i"    # I

    .line 399
    iget-object v0, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->pages:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Page;

    iget v0, v0, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Page;->pageBitmapWidth:I

    return v0
.end method

.method public numberOfPages()I
    .locals 1

    .line 391
    iget-object v0, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->pages:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public read()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 203
    iget-boolean v0, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->read:Z

    if-nez v0, :cond_3

    .line 206
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->read:Z

    .line 208
    invoke-virtual {p0}, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->readFileHeader()V

    .line 210
    iget-boolean v0, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->sequential:Z

    if-eqz v0, :cond_1

    .line 213
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->readHeader()Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;

    move-result-object v0

    .line 214
    .local v0, "tmp":Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;
    invoke-virtual {p0, v0}, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->readSegment(Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;)V

    .line 215
    iget-object v1, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->segments:Ljava/util/Map;

    iget v2, v0, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->segmentNumber:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 216
    .end local v0    # "tmp":Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;
    iget-object v0, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->ra:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->getPosition()J

    move-result-wide v0

    iget-object v2, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->ra:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->length()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    goto :goto_1

    .line 221
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->readHeader()Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;

    move-result-object v0

    .line 222
    .restart local v0    # "tmp":Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;
    iget-object v1, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->segments:Ljava/util/Map;

    iget v2, v0, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->segmentNumber:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    iget v1, v0, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->type:I

    const/16 v2, 0x33

    if-ne v1, v2, :cond_1

    .line 224
    iget-object v1, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->segments:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 225
    .local v2, "integer":I
    iget-object v3, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->segments:Ljava/util/Map;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;

    invoke-virtual {p0, v3}, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->readSegment(Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;)V

    .line 226
    .end local v2    # "integer":I
    goto :goto_0

    .line 228
    .end local v0    # "tmp":Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;
    :cond_2
    :goto_1
    return-void

    .line 204
    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "already.attempted.a.read.on.this.jbig2.file"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method readFileHeader()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 364
    iget-object v0, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->ra:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 365
    const/16 v0, 0x8

    new-array v1, v0, [B

    .line 366
    .local v1, "idstring":[B
    iget-object v2, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->ra:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2, v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read([B)I

    .line 368
    new-array v0, v0, [B

    fill-array-data v0, :array_0

    .line 370
    .local v0, "refidstring":[B
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_1

    .line 371
    aget-byte v3, v1, v2

    aget-byte v4, v0, v2

    if-ne v3, v4, :cond_0

    .line 370
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 372
    :cond_0
    new-instance v3, Lcom/itextpdf/io/exceptions/IOException;

    const-string v4, "File header idstring is not good at byte {0}"

    invoke-direct {v3, v4}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v3

    throw v3

    .line 376
    .end local v2    # "i":I
    :cond_1
    iget-object v2, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->ra:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v2

    .line 378
    .local v2, "fileheaderflags":I
    and-int/lit8 v3, v2, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-ne v3, v5, :cond_2

    move v3, v5

    goto :goto_1

    :cond_2
    move v3, v4

    :goto_1
    iput-boolean v3, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->sequential:Z

    .line 379
    and-int/lit8 v3, v2, 0x2

    if-nez v3, :cond_3

    move v4, v5

    :cond_3
    iput-boolean v4, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->number_of_pages_known:Z

    .line 381
    and-int/lit16 v3, v2, 0xfc

    if-nez v3, :cond_5

    .line 385
    iget-boolean v3, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->number_of_pages_known:Z

    if-eqz v3, :cond_4

    .line 386
    iget-object v3, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->ra:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readInt()I

    move-result v3

    iput v3, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->number_of_pages:I

    .line 388
    :cond_4
    return-void

    .line 382
    :cond_5
    new-instance v3, Lcom/itextpdf/io/exceptions/IOException;

    const-string v4, "File header flags bits from 2 to 7 should be 0, some not"

    invoke-direct {v3, v4}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    nop

    :array_0
    .array-data 1
        -0x69t
        0x4at
        0x42t
        0x32t
        0xdt
        0xat
        0x1at
        0xat
    .end array-data
.end method

.method readHeader()Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;
    .locals 21
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 259
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->ra:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->getPosition()J

    move-result-wide v1

    long-to-int v1, v1

    .line 261
    .local v1, "ptr":I
    iget-object v2, v0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->ra:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readInt()I

    move-result v2

    .line 262
    .local v2, "segment_number":I
    new-instance v3, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;

    invoke-direct {v3, v2}, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;-><init>(I)V

    .line 265
    .local v3, "s":Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;
    iget-object v4, v0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->ra:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v4

    .line 266
    .local v4, "segment_header_flags":I
    and-int/lit16 v5, v4, 0x80

    const/16 v8, 0x80

    if-ne v5, v8, :cond_0

    const/4 v5, 0x1

    goto :goto_0

    :cond_0
    const/4 v5, 0x0

    .line 267
    .local v5, "deferred_non_retain":Z
    :goto_0
    iput-boolean v5, v3, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->deferredNonRetain:Z

    .line 268
    and-int/lit8 v8, v4, 0x40

    const/16 v9, 0x40

    if-ne v8, v9, :cond_1

    const/4 v8, 0x1

    goto :goto_1

    :cond_1
    const/4 v8, 0x0

    .line 269
    .local v8, "page_association_size":Z
    :goto_1
    and-int/lit8 v9, v4, 0x3f

    .line 270
    .local v9, "segment_type":I
    iput v9, v3, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->type:I

    .line 273
    iget-object v10, v0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->ra:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v10}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v10

    .line 274
    .local v10, "referred_to_byte0":I
    and-int/lit16 v11, v10, 0xe0

    const/4 v12, 0x5

    shr-int/2addr v11, v12

    .line 275
    .local v11, "count_of_referred_to_segments":I
    const/4 v13, 0x0

    .line 276
    .local v13, "referred_to_segment_numbers":[I
    const/4 v14, 0x0

    .line 278
    .local v14, "segment_retention_flags":[Z
    const/4 v15, 0x7

    if-ne v11, v15, :cond_5

    .line 280
    iget-object v12, v0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->ra:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget-object v15, v0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->ra:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v15}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->getPosition()J

    move-result-wide v15

    const-wide/16 v17, 0x1

    const/16 v20, 0x1

    sub-long v6, v15, v17

    invoke-virtual {v12, v6, v7}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 281
    iget-object v6, v0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->ra:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v6}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readInt()I

    move-result v6

    const v7, 0x1fffffff

    and-int/2addr v6, v7

    .line 282
    .end local v11    # "count_of_referred_to_segments":I
    .local v6, "count_of_referred_to_segments":I
    add-int/lit8 v7, v6, 0x1

    new-array v7, v7, [Z

    .line 283
    .end local v14    # "segment_retention_flags":[Z
    .local v7, "segment_retention_flags":[Z
    const/4 v11, 0x0

    .line 284
    .local v11, "i":I
    const/4 v12, 0x0

    .line 286
    .local v12, "referred_to_current_byte":I
    :goto_2
    rem-int/lit8 v14, v11, 0x8

    .line 287
    .local v14, "j":I
    if-nez v14, :cond_2

    .line 288
    iget-object v15, v0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->ra:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v15}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v12

    .line 290
    :cond_2
    shl-int v15, v20, v14

    and-int/2addr v15, v12

    shr-int/2addr v15, v14

    move/from16 v16, v4

    move/from16 v4, v20

    .end local v4    # "segment_header_flags":I
    .local v16, "segment_header_flags":I
    if-ne v15, v4, :cond_3

    const/4 v4, 0x1

    goto :goto_3

    :cond_3
    const/4 v4, 0x0

    :goto_3
    aput-boolean v4, v7, v11

    .line 291
    nop

    .end local v14    # "j":I
    add-int/lit8 v11, v11, 0x1

    .line 292
    if-le v11, v6, :cond_4

    .line 294
    .end local v11    # "i":I
    .end local v12    # "referred_to_current_byte":I
    move v11, v6

    move-object v14, v7

    goto :goto_6

    .line 292
    .restart local v11    # "i":I
    .restart local v12    # "referred_to_current_byte":I
    :cond_4
    move/from16 v4, v16

    const/16 v20, 0x1

    goto :goto_2

    .line 294
    .end local v6    # "count_of_referred_to_segments":I
    .end local v7    # "segment_retention_flags":[Z
    .end local v12    # "referred_to_current_byte":I
    .end local v16    # "segment_header_flags":I
    .restart local v4    # "segment_header_flags":I
    .local v11, "count_of_referred_to_segments":I
    .local v14, "segment_retention_flags":[Z
    :cond_5
    move/from16 v16, v4

    .end local v4    # "segment_header_flags":I
    .restart local v16    # "segment_header_flags":I
    const/4 v4, 0x4

    if-gt v11, v4, :cond_8

    .line 296
    add-int/lit8 v4, v11, 0x1

    new-array v14, v4, [Z

    .line 297
    and-int/lit8 v10, v10, 0x1f

    .line 298
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_4
    if-gt v4, v11, :cond_7

    .line 299
    const/4 v6, 0x1

    shl-int v7, v6, v4

    and-int/2addr v7, v10

    shr-int/2addr v7, v4

    if-ne v7, v6, :cond_6

    move v7, v6

    goto :goto_5

    :cond_6
    const/4 v7, 0x0

    :goto_5
    aput-boolean v7, v14, v4

    .line 298
    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    .end local v4    # "i":I
    :cond_7
    goto :goto_6

    .line 302
    :cond_8
    if-eq v11, v12, :cond_10

    const/4 v4, 0x6

    if-eq v11, v4, :cond_10

    .line 307
    :goto_6
    iput-object v14, v3, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->segmentRetentionFlags:[Z

    .line 308
    iput v11, v3, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->countOfReferredToSegments:I

    .line 311
    add-int/lit8 v4, v11, 0x1

    new-array v4, v4, [I

    .line 312
    .end local v13    # "referred_to_segment_numbers":[I
    .local v4, "referred_to_segment_numbers":[I
    const/4 v6, 0x1

    .local v6, "i":I
    :goto_7
    if-gt v6, v11, :cond_b

    .line 313
    const/16 v7, 0x100

    if-gt v2, v7, :cond_9

    .line 314
    iget-object v7, v0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->ra:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v7}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v7

    aput v7, v4, v6

    goto :goto_8

    .line 315
    :cond_9
    nop

    .line 318
    iget-object v7, v0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->ra:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    .line 315
    const/high16 v12, 0x10000

    if-gt v2, v12, :cond_a

    .line 316
    invoke-virtual {v7}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v7

    aput v7, v4, v6

    goto :goto_8

    .line 318
    :cond_a
    invoke-virtual {v7}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedInt()J

    move-result-wide v12

    long-to-int v7, v12

    aput v7, v4, v6

    .line 312
    :goto_8
    add-int/lit8 v6, v6, 0x1

    goto :goto_7

    .line 321
    .end local v6    # "i":I
    :cond_b
    iput-object v4, v3, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->referredToSegmentNumbers:[I

    .line 325
    iget-object v6, v0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->ra:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v6}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->getPosition()J

    move-result-wide v6

    long-to-int v6, v6

    sub-int/2addr v6, v1

    .line 326
    .local v6, "page_association_offset":I
    nop

    .line 329
    iget-object v7, v0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->ra:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    .line 326
    if-eqz v8, :cond_c

    .line 327
    invoke-virtual {v7}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readInt()I

    move-result v7

    .local v7, "segment_page_association":I
    goto :goto_9

    .line 329
    .end local v7    # "segment_page_association":I
    :cond_c
    invoke-virtual {v7}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v7

    .line 331
    .restart local v7    # "segment_page_association":I
    :goto_9
    if-ltz v7, :cond_f

    .line 335
    iput v7, v3, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->page:I

    .line 337
    iput-boolean v8, v3, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->page_association_size:Z

    .line 338
    iput v6, v3, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->page_association_offset:I

    .line 340
    if-lez v7, :cond_d

    iget-object v12, v0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->pages:Ljava/util/Map;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-interface {v12, v13}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_d

    .line 341
    iget-object v12, v0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->pages:Ljava/util/Map;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    new-instance v15, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Page;

    invoke-direct {v15, v7, v0}, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Page;-><init>(ILcom/itextpdf/io/codec/Jbig2SegmentReader;)V

    invoke-interface {v12, v13, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 343
    :cond_d
    if-lez v7, :cond_e

    .line 344
    iget-object v12, v0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->pages:Ljava/util/Map;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-interface {v12, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Page;

    invoke-virtual {v12, v3}, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Page;->addSegment(Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;)V

    goto :goto_a

    .line 346
    :cond_e
    iget-object v12, v0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->globals:Ljava/util/Set;

    invoke-interface {v12, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 350
    :goto_a
    iget-object v12, v0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->ra:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v12}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedInt()J

    move-result-wide v12

    .line 352
    .local v12, "segment_data_length":J
    iput-wide v12, v3, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->dataLength:J

    .line 354
    iget-object v15, v0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->ra:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    move-object/from16 v18, v4

    move/from16 v17, v5

    .end local v4    # "referred_to_segment_numbers":[I
    .end local v5    # "deferred_non_retain":Z
    .local v17, "deferred_non_retain":Z
    .local v18, "referred_to_segment_numbers":[I
    invoke-virtual {v15}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->getPosition()J

    move-result-wide v4

    long-to-int v4, v4

    .line 355
    .local v4, "end_ptr":I
    iget-object v5, v0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->ra:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    move v15, v6

    move/from16 v19, v7

    .end local v6    # "page_association_offset":I
    .end local v7    # "segment_page_association":I
    .local v15, "page_association_offset":I
    .local v19, "segment_page_association":I
    int-to-long v6, v1

    invoke-virtual {v5, v6, v7}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 356
    sub-int v5, v4, v1

    new-array v5, v5, [B

    .line 357
    .local v5, "header_data":[B
    iget-object v6, v0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->ra:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v6, v5}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read([B)I

    .line 358
    iput-object v5, v3, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->headerData:[B

    .line 360
    return-object v3

    .line 332
    .end local v12    # "segment_data_length":J
    .end local v15    # "page_association_offset":I
    .end local v17    # "deferred_non_retain":Z
    .end local v18    # "referred_to_segment_numbers":[I
    .end local v19    # "segment_page_association":I
    .local v4, "referred_to_segment_numbers":[I
    .local v5, "deferred_non_retain":Z
    .restart local v6    # "page_association_offset":I
    .restart local v7    # "segment_page_association":I
    :cond_f
    move-object/from16 v18, v4

    move/from16 v17, v5

    move v15, v6

    move/from16 v19, v7

    .end local v4    # "referred_to_segment_numbers":[I
    .end local v5    # "deferred_non_retain":Z
    .end local v6    # "page_association_offset":I
    .end local v7    # "segment_page_association":I
    .restart local v15    # "page_association_offset":I
    .restart local v17    # "deferred_non_retain":Z
    .restart local v18    # "referred_to_segment_numbers":[I
    .restart local v19    # "segment_page_association":I
    new-instance v4, Lcom/itextpdf/io/exceptions/IOException;

    const-string v5, "Page {0} is invalid for segment {1} starting at {2}"

    invoke-direct {v4, v5}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    .line 333
    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    filled-new-array {v5, v6, v7}, [Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v4

    throw v4

    .line 302
    .end local v15    # "page_association_offset":I
    .end local v17    # "deferred_non_retain":Z
    .end local v18    # "referred_to_segment_numbers":[I
    .end local v19    # "segment_page_association":I
    .restart local v5    # "deferred_non_retain":Z
    .restart local v13    # "referred_to_segment_numbers":[I
    :cond_10
    move/from16 v17, v5

    .line 303
    .end local v5    # "deferred_non_retain":Z
    .restart local v17    # "deferred_non_retain":Z
    new-instance v4, Lcom/itextpdf/io/exceptions/IOException;

    const-string v5, "Count of referred-to segments has forbidden value in the header for segment {0} starting at {1}"

    invoke-direct {v4, v5}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    .line 304
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    filled-new-array {v5, v6}, [Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v4

    throw v4
.end method

.method readSegment(Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;)V
    .locals 8
    .param p1, "s"    # Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 231
    iget-object v0, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->ra:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->getPosition()J

    move-result-wide v0

    long-to-int v0, v0

    .line 234
    .local v0, "ptr":I
    iget-wide v1, p1, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->dataLength:J

    const-wide v3, 0xffffffffL

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    .line 235
    return-void

    .line 238
    :cond_0
    iget-wide v1, p1, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->dataLength:J

    long-to-int v1, v1

    new-array v1, v1, [B

    .line 239
    .local v1, "data":[B
    iget-object v2, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->ra:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2, v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read([B)I

    .line 240
    iput-object v1, p1, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->data:[B

    .line 242
    iget v2, p1, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->type:I

    const/16 v3, 0x30

    if-ne v2, v3, :cond_2

    .line 243
    iget-object v2, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->ra:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->getPosition()J

    move-result-wide v2

    long-to-int v2, v2

    .line 244
    .local v2, "last":I
    iget-object v3, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->ra:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    int-to-long v4, v0

    invoke-virtual {v3, v4, v5}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 245
    iget-object v3, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->ra:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readInt()I

    move-result v3

    .line 246
    .local v3, "page_bitmap_width":I
    iget-object v4, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->ra:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readInt()I

    move-result v4

    .line 247
    .local v4, "page_bitmap_height":I
    iget-object v5, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->ra:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    int-to-long v6, v2

    invoke-virtual {v5, v6, v7}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 248
    iget-object v5, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->pages:Ljava/util/Map;

    iget v6, p1, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->page:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Page;

    .line 249
    .local v5, "p":Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Page;
    if-eqz v5, :cond_1

    .line 253
    iput v3, v5, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Page;->pageBitmapWidth:I

    .line 254
    iput v4, v5, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Page;->pageBitmapHeight:I

    goto :goto_0

    .line 250
    :cond_1
    new-instance v6, Lcom/itextpdf/io/exceptions/IOException;

    const-string v7, "Referring to widht or height of a page we haven\'t seen yet: {0}"

    invoke-direct {v6, v7}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    iget v7, p1, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->page:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v6

    throw v6

    .line 256
    .end local v2    # "last":I
    .end local v3    # "page_bitmap_width":I
    .end local v4    # "page_bitmap_height":I
    .end local v5    # "p":Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Page;
    :cond_2
    :goto_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 434
    iget-boolean v0, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->read:Z

    if-eqz v0, :cond_0

    .line 435
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Jbig2SegmentReader: number of pages: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->numberOfPages()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 437
    :cond_0
    const-string v0, "Jbig2SegmentReader in indeterminate state."

    return-object v0
.end method
