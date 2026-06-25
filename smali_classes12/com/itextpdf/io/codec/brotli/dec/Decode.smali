.class final Lcom/itextpdf/io/codec/brotli/dec/Decode;
.super Ljava/lang/Object;
.source "Decode.java"


# static fields
.field private static final CODE_LENGTH_CODES:I = 0x12

.field private static final CODE_LENGTH_CODE_ORDER:[I

.field private static final CODE_LENGTH_REPEAT_CODE:I = 0x10

.field private static final DEFAULT_CODE_LENGTH:I = 0x8

.field private static final DISTANCE_CONTEXT_BITS:I = 0x2

.field private static final DISTANCE_SHORT_CODE_INDEX_OFFSET:[I

.field private static final DISTANCE_SHORT_CODE_VALUE_OFFSET:[I

.field private static final FIXED_TABLE:[I

.field private static final HUFFMAN_TABLE_BITS:I = 0x8

.field private static final HUFFMAN_TABLE_MASK:I = 0xff

.field private static final LITERAL_CONTEXT_BITS:I = 0x6

.field private static final NUM_BLOCK_LENGTH_CODES:I = 0x1a

.field private static final NUM_DISTANCE_SHORT_CODES:I = 0x10

.field private static final NUM_INSERT_AND_COPY_CODES:I = 0x2c0

.field private static final NUM_LITERAL_CODES:I = 0x100


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 26
    const/16 v0, 0x12

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/itextpdf/io/codec/brotli/dec/Decode;->CODE_LENGTH_CODE_ORDER:[I

    .line 31
    const/16 v0, 0x10

    new-array v1, v0, [I

    fill-array-data v1, :array_1

    sput-object v1, Lcom/itextpdf/io/codec/brotli/dec/Decode;->DISTANCE_SHORT_CODE_INDEX_OFFSET:[I

    .line 35
    new-array v1, v0, [I

    fill-array-data v1, :array_2

    sput-object v1, Lcom/itextpdf/io/codec/brotli/dec/Decode;->DISTANCE_SHORT_CODE_VALUE_OFFSET:[I

    .line 42
    new-array v0, v0, [I

    fill-array-data v0, :array_3

    sput-object v0, Lcom/itextpdf/io/codec/brotli/dec/Decode;->FIXED_TABLE:[I

    return-void

    nop

    :array_0
    .array-data 4
        0x1
        0x2
        0x3
        0x4
        0x0
        0x5
        0x11
        0x6
        0x10
        0x7
        0x8
        0x9
        0xa
        0xb
        0xc
        0xd
        0xe
        0xf
    .end array-data

    :array_1
    .array-data 4
        0x3
        0x2
        0x1
        0x0
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
    .end array-data

    :array_2
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        -0x1
        0x1
        -0x2
        0x2
        -0x3
        0x3
        -0x1
        0x1
        -0x2
        0x2
        -0x3
        0x3
    .end array-data

    :array_3
    .array-data 4
        0x20000
        0x20004
        0x20003
        0x30002
        0x20000
        0x20004
        0x20003
        0x40001
        0x20000
        0x20004
        0x20003
        0x30002
        0x20000
        0x20004
        0x20003
        0x40005
    .end array-data
.end method

.method constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static copyUncompressedData(Lcom/itextpdf/io/codec/brotli/dec/State;)V
    .locals 6
    .param p0, "state"    # Lcom/itextpdf/io/codec/brotli/dec/State;

    .line 531
    iget-object v0, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->br:Lcom/itextpdf/io/codec/brotli/dec/BitReader;

    .line 532
    .local v0, "br":Lcom/itextpdf/io/codec/brotli/dec/BitReader;
    iget-object v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->ringBuffer:[B

    .line 535
    .local v1, "ringBuffer":[B
    iget v2, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->metaBlockLength:I

    const/4 v3, 0x1

    if-gtz v2, :cond_0

    .line 536
    invoke-static {v0}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->reload(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 537
    iput v3, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->runningState:I

    .line 538
    return-void

    .line 541
    :cond_0
    iget v2, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->ringBufferSize:I

    iget v4, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->pos:I

    sub-int/2addr v2, v4

    iget v4, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->metaBlockLength:I

    invoke-static {v2, v4}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 542
    .local v2, "chunkLength":I
    iget v4, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->pos:I

    invoke-static {v0, v1, v4, v2}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->copyBytes(Lcom/itextpdf/io/codec/brotli/dec/BitReader;[BII)V

    .line 543
    iget v4, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->metaBlockLength:I

    sub-int/2addr v4, v2

    iput v4, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->metaBlockLength:I

    .line 544
    iget v4, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->pos:I

    add-int/2addr v4, v2

    iput v4, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->pos:I

    .line 545
    iget v4, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->pos:I

    iget v5, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->ringBufferSize:I

    if-ne v4, v5, :cond_1

    .line 546
    const/4 v3, 0x5

    iput v3, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->nextRunningState:I

    .line 547
    iget v3, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->ringBufferSize:I

    iput v3, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->bytesToWrite:I

    .line 548
    const/4 v3, 0x0

    iput v3, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->bytesWritten:I

    .line 549
    const/16 v3, 0xc

    iput v3, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->runningState:I

    .line 550
    return-void

    .line 553
    :cond_1
    invoke-static {v0}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->reload(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 554
    iput v3, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->runningState:I

    .line 555
    return-void
.end method

.method private static decodeBlockTypeAndLength(Lcom/itextpdf/io/codec/brotli/dec/State;I)V
    .locals 7
    .param p0, "state"    # Lcom/itextpdf/io/codec/brotli/dec/State;
    .param p1, "treeType"    # I

    .line 335
    iget-object v0, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->br:Lcom/itextpdf/io/codec/brotli/dec/BitReader;

    .line 336
    .local v0, "br":Lcom/itextpdf/io/codec/brotli/dec/BitReader;
    iget-object v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->blockTypeRb:[I

    .line 337
    .local v1, "ringBuffers":[I
    mul-int/lit8 v2, p1, 0x2

    .line 338
    .local v2, "offset":I
    invoke-static {v0}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->fillBitWindow(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 339
    iget-object v3, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->blockTypeTrees:[I

    mul-int/lit16 v4, p1, 0x438

    invoke-static {v3, v4, v0}, Lcom/itextpdf/io/codec/brotli/dec/Decode;->readSymbol([IILcom/itextpdf/io/codec/brotli/dec/BitReader;)I

    move-result v3

    .line 341
    .local v3, "blockType":I
    iget-object v4, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->blockLength:[I

    iget-object v5, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->blockLenTrees:[I

    mul-int/lit16 v6, p1, 0x438

    invoke-static {v5, v6, v0}, Lcom/itextpdf/io/codec/brotli/dec/Decode;->readBlockLength([IILcom/itextpdf/io/codec/brotli/dec/BitReader;)I

    move-result v5

    aput v5, v4, p1

    .line 344
    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 345
    add-int/lit8 v5, v2, 0x1

    aget v5, v1, v5

    add-int/2addr v5, v4

    .end local v3    # "blockType":I
    .local v5, "blockType":I
    goto :goto_0

    .line 346
    .end local v5    # "blockType":I
    .restart local v3    # "blockType":I
    :cond_0
    if-nez v3, :cond_1

    .line 347
    aget v5, v1, v2

    .end local v3    # "blockType":I
    .restart local v5    # "blockType":I
    goto :goto_0

    .line 349
    .end local v5    # "blockType":I
    .restart local v3    # "blockType":I
    :cond_1
    add-int/lit8 v5, v3, -0x2

    .line 351
    .end local v3    # "blockType":I
    .restart local v5    # "blockType":I
    :goto_0
    iget-object v3, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->numBlockTypes:[I

    aget v3, v3, p1

    if-lt v5, v3, :cond_2

    .line 352
    iget-object v3, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->numBlockTypes:[I

    aget v3, v3, p1

    sub-int/2addr v5, v3

    .line 354
    :cond_2
    add-int/lit8 v3, v2, 0x1

    aget v3, v1, v3

    aput v3, v1, v2

    .line 355
    add-int/lit8 v3, v2, 0x1

    aput v5, v1, v3

    .line 356
    return-void
.end method

.method private static decodeCommandBlockSwitch(Lcom/itextpdf/io/codec/brotli/dec/State;)V
    .locals 3
    .param p0, "state"    # Lcom/itextpdf/io/codec/brotli/dec/State;

    .line 370
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/itextpdf/io/codec/brotli/dec/Decode;->decodeBlockTypeAndLength(Lcom/itextpdf/io/codec/brotli/dec/State;I)V

    .line 371
    iget-object v0, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->hGroup1:Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;

    iget-object v0, v0, Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;->trees:[I

    iget-object v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->blockTypeRb:[I

    const/4 v2, 0x3

    aget v1, v1, v2

    aget v0, v0, v1

    iput v0, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->treeCommandOffset:I

    .line 372
    return-void
.end method

.method private static decodeContextMap(I[BLcom/itextpdf/io/codec/brotli/dec/BitReader;)I
    .locals 10
    .param p0, "contextMapSize"    # I
    .param p1, "contextMap"    # [B
    .param p2, "br"    # Lcom/itextpdf/io/codec/brotli/dec/BitReader;

    .line 291
    invoke-static {p2}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readMoreInput(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 292
    invoke-static {p2}, Lcom/itextpdf/io/codec/brotli/dec/Decode;->decodeVarLenUnsignedByte(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)I

    move-result v0

    const/4 v1, 0x1

    add-int/2addr v0, v1

    .line 294
    .local v0, "numTrees":I
    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    .line 295
    invoke-static {p1, v2, p0}, Lcom/itextpdf/io/codec/brotli/dec/Utils;->fillWithZeroes([BII)V

    .line 296
    return v0

    .line 299
    :cond_0
    invoke-static {p2, v1}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readBits(Lcom/itextpdf/io/codec/brotli/dec/BitReader;I)I

    move-result v3

    if-ne v3, v1, :cond_1

    move v3, v1

    goto :goto_0

    :cond_1
    move v3, v2

    .line 300
    .local v3, "useRleForZeros":Z
    :goto_0
    const/4 v4, 0x0

    .line 301
    .local v4, "maxRunLengthPrefix":I
    if-eqz v3, :cond_2

    .line 302
    const/4 v5, 0x4

    invoke-static {p2, v5}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readBits(Lcom/itextpdf/io/codec/brotli/dec/BitReader;I)I

    move-result v5

    add-int/lit8 v4, v5, 0x1

    .line 304
    :cond_2
    const/16 v5, 0x438

    new-array v5, v5, [I

    .line 305
    .local v5, "table":[I
    add-int v6, v0, v4

    invoke-static {v6, v5, v2, p2}, Lcom/itextpdf/io/codec/brotli/dec/Decode;->readHuffmanCode(I[IILcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 306
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    if-ge v6, p0, :cond_7

    .line 307
    invoke-static {p2}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readMoreInput(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 308
    invoke-static {p2}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->fillBitWindow(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 309
    invoke-static {v5, v2, p2}, Lcom/itextpdf/io/codec/brotli/dec/Decode;->readSymbol([IILcom/itextpdf/io/codec/brotli/dec/BitReader;)I

    move-result v7

    .line 310
    .local v7, "code":I
    if-nez v7, :cond_3

    .line 311
    aput-byte v2, p1, v6

    .line 312
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 313
    :cond_3
    if-gt v7, v4, :cond_6

    .line 314
    shl-int v8, v1, v7

    invoke-static {p2, v7}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readBits(Lcom/itextpdf/io/codec/brotli/dec/BitReader;I)I

    move-result v9

    add-int/2addr v8, v9

    .line 315
    .local v8, "reps":I
    :goto_2
    if-eqz v8, :cond_5

    .line 316
    if-ge v6, p0, :cond_4

    .line 319
    aput-byte v2, p1, v6

    .line 320
    add-int/lit8 v6, v6, 0x1

    .line 321
    add-int/lit8 v8, v8, -0x1

    goto :goto_2

    .line 317
    :cond_4
    new-instance v1, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;

    const-string v2, "Corrupted context map"

    invoke-direct {v1, v2}, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 323
    .end local v8    # "reps":I
    :cond_5
    goto :goto_3

    .line 324
    :cond_6
    sub-int v8, v7, v4

    int-to-byte v8, v8

    aput-byte v8, p1, v6

    .line 325
    add-int/lit8 v6, v6, 0x1

    .line 327
    .end local v7    # "code":I
    :goto_3
    goto :goto_1

    .line 328
    .end local v6    # "i":I
    :cond_7
    invoke-static {p2, v1}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readBits(Lcom/itextpdf/io/codec/brotli/dec/BitReader;I)I

    move-result v2

    if-ne v2, v1, :cond_8

    .line 329
    invoke-static {p1, p0}, Lcom/itextpdf/io/codec/brotli/dec/Decode;->inverseMoveToFrontTransform([BI)V

    .line 331
    :cond_8
    return v0
.end method

.method private static decodeDistanceBlockSwitch(Lcom/itextpdf/io/codec/brotli/dec/State;)V
    .locals 3
    .param p0, "state"    # Lcom/itextpdf/io/codec/brotli/dec/State;

    .line 375
    const/4 v0, 0x2

    invoke-static {p0, v0}, Lcom/itextpdf/io/codec/brotli/dec/Decode;->decodeBlockTypeAndLength(Lcom/itextpdf/io/codec/brotli/dec/State;I)V

    .line 376
    iget-object v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->blockTypeRb:[I

    const/4 v2, 0x5

    aget v1, v1, v2

    shl-int/lit8 v0, v1, 0x2

    iput v0, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->distContextMapSlice:I

    .line 377
    return-void
.end method

.method private static decodeLiteralBlockSwitch(Lcom/itextpdf/io/codec/brotli/dec/State;)V
    .locals 4
    .param p0, "state"    # Lcom/itextpdf/io/codec/brotli/dec/State;

    .line 359
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/itextpdf/io/codec/brotli/dec/Decode;->decodeBlockTypeAndLength(Lcom/itextpdf/io/codec/brotli/dec/State;I)V

    .line 360
    iget-object v0, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->blockTypeRb:[I

    const/4 v1, 0x1

    aget v0, v0, v1

    .line 361
    .local v0, "literalBlockType":I
    shl-int/lit8 v1, v0, 0x6

    iput v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->contextMapSlice:I

    .line 362
    iget-object v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->contextMap:[B

    iget v2, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->contextMapSlice:I

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    iput v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->literalTreeIndex:I

    .line 363
    iget-object v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->hGroup0:Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;

    iget-object v1, v1, Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;->trees:[I

    iget v2, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->literalTreeIndex:I

    aget v1, v1, v2

    iput v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->literalTree:I

    .line 364
    iget-object v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->contextModes:[B

    aget-byte v1, v1, v0

    .line 365
    .local v1, "contextMode":I
    sget-object v2, Lcom/itextpdf/io/codec/brotli/dec/Context;->LOOKUP_OFFSETS:[I

    aget v2, v2, v1

    iput v2, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->contextLookupOffset1:I

    .line 366
    sget-object v2, Lcom/itextpdf/io/codec/brotli/dec/Context;->LOOKUP_OFFSETS:[I

    add-int/lit8 v3, v1, 0x1

    aget v2, v2, v3

    iput v2, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->contextLookupOffset2:I

    .line 367
    return-void
.end method

.method private static decodeMetaBlockLength(Lcom/itextpdf/io/codec/brotli/dec/BitReader;Lcom/itextpdf/io/codec/brotli/dec/State;)V
    .locals 9
    .param p0, "br"    # Lcom/itextpdf/io/codec/brotli/dec/BitReader;
    .param p1, "state"    # Lcom/itextpdf/io/codec/brotli/dec/State;

    .line 63
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readBits(Lcom/itextpdf/io/codec/brotli/dec/BitReader;I)I

    move-result v1

    const/4 v2, 0x0

    if-ne v1, v0, :cond_0

    move v1, v0

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    iput-boolean v1, p1, Lcom/itextpdf/io/codec/brotli/dec/State;->inputEnd:Z

    .line 64
    iput v2, p1, Lcom/itextpdf/io/codec/brotli/dec/State;->metaBlockLength:I

    .line 65
    iput-boolean v2, p1, Lcom/itextpdf/io/codec/brotli/dec/State;->isUncompressed:Z

    .line 66
    iput-boolean v2, p1, Lcom/itextpdf/io/codec/brotli/dec/State;->isMetadata:Z

    .line 67
    iget-boolean v1, p1, Lcom/itextpdf/io/codec/brotli/dec/State;->inputEnd:Z

    if-eqz v1, :cond_1

    invoke-static {p0, v0}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readBits(Lcom/itextpdf/io/codec/brotli/dec/BitReader;I)I

    move-result v1

    if-eqz v1, :cond_1

    .line 68
    return-void

    .line 70
    :cond_1
    const/4 v1, 0x2

    invoke-static {p0, v1}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readBits(Lcom/itextpdf/io/codec/brotli/dec/BitReader;I)I

    move-result v3

    const/4 v4, 0x4

    add-int/2addr v3, v4

    .line 71
    .local v3, "sizeNibbles":I
    const/4 v5, 0x7

    const-string v6, "Exuberant nibble"

    if-ne v3, v5, :cond_7

    .line 72
    iput-boolean v0, p1, Lcom/itextpdf/io/codec/brotli/dec/State;->isMetadata:Z

    .line 73
    invoke-static {p0, v0}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readBits(Lcom/itextpdf/io/codec/brotli/dec/BitReader;I)I

    move-result v4

    if-nez v4, :cond_6

    .line 76
    invoke-static {p0, v1}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readBits(Lcom/itextpdf/io/codec/brotli/dec/BitReader;I)I

    move-result v1

    .line 77
    .local v1, "sizeBytes":I
    if-nez v1, :cond_2

    .line 78
    return-void

    .line 80
    :cond_2
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    if-ge v4, v1, :cond_5

    .line 81
    const/16 v5, 0x8

    invoke-static {p0, v5}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readBits(Lcom/itextpdf/io/codec/brotli/dec/BitReader;I)I

    move-result v5

    .line 82
    .local v5, "bits":I
    if-nez v5, :cond_4

    add-int/lit8 v7, v4, 0x1

    if-ne v7, v1, :cond_4

    if-gt v1, v0, :cond_3

    goto :goto_2

    .line 83
    :cond_3
    new-instance v0, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;

    invoke-direct {v0, v6}, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 85
    :cond_4
    :goto_2
    iget v7, p1, Lcom/itextpdf/io/codec/brotli/dec/State;->metaBlockLength:I

    mul-int/lit8 v8, v4, 0x8

    shl-int v8, v5, v8

    or-int/2addr v7, v8

    iput v7, p1, Lcom/itextpdf/io/codec/brotli/dec/State;->metaBlockLength:I

    .line 80
    .end local v5    # "bits":I
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 87
    .end local v1    # "sizeBytes":I
    .end local v4    # "i":I
    :cond_5
    goto :goto_5

    .line 74
    :cond_6
    new-instance v0, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;

    const-string v1, "Corrupted reserved bit"

    invoke-direct {v0, v1}, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 88
    :cond_7
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_3
    if-ge v1, v3, :cond_a

    .line 89
    invoke-static {p0, v4}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readBits(Lcom/itextpdf/io/codec/brotli/dec/BitReader;I)I

    move-result v5

    .line 90
    .restart local v5    # "bits":I
    if-nez v5, :cond_9

    add-int/lit8 v7, v1, 0x1

    if-ne v7, v3, :cond_9

    if-gt v3, v4, :cond_8

    goto :goto_4

    .line 91
    :cond_8
    new-instance v0, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;

    invoke-direct {v0, v6}, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 93
    :cond_9
    :goto_4
    iget v7, p1, Lcom/itextpdf/io/codec/brotli/dec/State;->metaBlockLength:I

    mul-int/lit8 v8, v1, 0x4

    shl-int v8, v5, v8

    or-int/2addr v7, v8

    iput v7, p1, Lcom/itextpdf/io/codec/brotli/dec/State;->metaBlockLength:I

    .line 88
    .end local v5    # "bits":I
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 96
    .end local v1    # "i":I
    :cond_a
    :goto_5
    iget v1, p1, Lcom/itextpdf/io/codec/brotli/dec/State;->metaBlockLength:I

    add-int/2addr v1, v0

    iput v1, p1, Lcom/itextpdf/io/codec/brotli/dec/State;->metaBlockLength:I

    .line 97
    iget-boolean v1, p1, Lcom/itextpdf/io/codec/brotli/dec/State;->inputEnd:Z

    if-nez v1, :cond_c

    .line 98
    invoke-static {p0, v0}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readBits(Lcom/itextpdf/io/codec/brotli/dec/BitReader;I)I

    move-result v1

    if-ne v1, v0, :cond_b

    goto :goto_6

    :cond_b
    move v0, v2

    :goto_6
    iput-boolean v0, p1, Lcom/itextpdf/io/codec/brotli/dec/State;->isUncompressed:Z

    .line 100
    :cond_c
    return-void
.end method

.method private static decodeVarLenUnsignedByte(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)I
    .locals 3
    .param p0, "br"    # Lcom/itextpdf/io/codec/brotli/dec/BitReader;

    .line 51
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readBits(Lcom/itextpdf/io/codec/brotli/dec/BitReader;I)I

    move-result v1

    if-eqz v1, :cond_1

    .line 52
    const/4 v1, 0x3

    invoke-static {p0, v1}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readBits(Lcom/itextpdf/io/codec/brotli/dec/BitReader;I)I

    move-result v1

    .line 53
    .local v1, "n":I
    if-nez v1, :cond_0

    .line 54
    return v0

    .line 56
    :cond_0
    invoke-static {p0, v1}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readBits(Lcom/itextpdf/io/codec/brotli/dec/BitReader;I)I

    move-result v2

    shl-int/2addr v0, v1

    add-int/2addr v2, v0

    return v2

    .line 59
    .end local v1    # "n":I
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method static decompress(Lcom/itextpdf/io/codec/brotli/dec/State;)V
    .locals 21
    .param p0, "state"    # Lcom/itextpdf/io/codec/brotli/dec/State;

    .line 583
    move-object/from16 v0, p0

    iget v1, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->runningState:I

    if-eqz v1, :cond_22

    .line 586
    iget v1, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->runningState:I

    const/16 v2, 0xb

    if-eq v1, v2, :cond_21

    .line 589
    iget-object v1, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->br:Lcom/itextpdf/io/codec/brotli/dec/BitReader;

    .line 590
    .local v1, "br":Lcom/itextpdf/io/codec/brotli/dec/BitReader;
    iget v2, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->ringBufferSize:I

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    .line 591
    .local v2, "ringBufferMask":I
    iget-object v4, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->ringBuffer:[B

    .line 593
    .local v4, "ringBuffer":[B
    :goto_0
    iget v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->runningState:I

    const-string v6, "Invalid metablock length"

    const/16 v7, 0xa

    if-eq v5, v7, :cond_1e

    .line 595
    iget v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->runningState:I

    const/16 v10, 0x8

    const-string v7, "Invalid backward reference"

    const/4 v8, 0x4

    const/16 v11, 0xc

    const/4 v9, 0x7

    const/4 v12, 0x6

    const/4 v13, 0x2

    const/4 v14, 0x3

    const/4 v15, 0x0

    packed-switch v5, :pswitch_data_0

    .line 845
    :pswitch_0
    new-instance v3, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unexpected state "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->runningState:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 833
    :pswitch_1
    invoke-static {v0}, Lcom/itextpdf/io/codec/brotli/dec/Decode;->writeRingBuffer(Lcom/itextpdf/io/codec/brotli/dec/State;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 835
    return-void

    .line 837
    :cond_0
    iget v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->pos:I

    iget v6, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->maxBackwardDistance:I

    if-lt v5, v6, :cond_1

    .line 838
    iget v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->maxBackwardDistance:I

    iput v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->maxDistance:I

    .line 840
    :cond_1
    iget v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->pos:I

    and-int/2addr v5, v2

    iput v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->pos:I

    .line 841
    iget v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->nextRunningState:I

    iput v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->runningState:I

    .line 842
    move/from16 v18, v3

    goto/16 :goto_a

    .line 779
    :pswitch_2
    iget v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->copyLength:I

    if-lt v5, v8, :cond_4

    iget v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->copyLength:I

    const/16 v6, 0x18

    if-gt v5, v6, :cond_4

    .line 781
    sget-object v5, Lcom/itextpdf/io/codec/brotli/dec/Dictionary;->OFFSETS_BY_LENGTH:[I

    iget v6, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->copyLength:I

    aget v5, v5, v6

    .line 782
    .local v5, "offset":I
    iget v6, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->distance:I

    iget v8, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->maxDistance:I

    sub-int/2addr v6, v8

    add-int/lit8 v12, v6, -0x1

    .line 783
    .local v12, "wordId":I
    sget-object v6, Lcom/itextpdf/io/codec/brotli/dec/Dictionary;->SIZE_BITS_BY_LENGTH:[I

    iget v8, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->copyLength:I

    aget v13, v6, v8

    .line 784
    .local v13, "shift":I
    shl-int v6, v3, v13

    add-int/lit8 v16, v6, -0x1

    .line 785
    .local v16, "mask":I
    and-int v17, v12, v16

    .line 786
    .local v17, "wordIdx":I
    ushr-int v6, v12, v13

    .line 787
    .local v6, "transformIdx":I
    iget v8, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->copyLength:I

    mul-int v8, v8, v17

    add-int/2addr v5, v8

    .line 788
    sget-object v8, Lcom/itextpdf/io/codec/brotli/dec/Transform;->TRANSFORMS:[Lcom/itextpdf/io/codec/brotli/dec/Transform;

    array-length v8, v8

    if-ge v6, v8, :cond_3

    .line 789
    move v7, v5

    .end local v5    # "offset":I
    .local v7, "offset":I
    iget v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->copyDst:I

    .line 790
    move v8, v6

    .end local v6    # "transformIdx":I
    .local v8, "transformIdx":I
    invoke-static {}, Lcom/itextpdf/io/codec/brotli/dec/Dictionary;->getData()Ljava/nio/ByteBuffer;

    move-result-object v6

    move v9, v8

    .end local v8    # "transformIdx":I
    .local v9, "transformIdx":I
    iget v8, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->copyLength:I

    sget-object v18, Lcom/itextpdf/io/codec/brotli/dec/Transform;->TRANSFORMS:[Lcom/itextpdf/io/codec/brotli/dec/Transform;

    aget-object v18, v18, v9

    .line 789
    move-object/from16 v20, v18

    move/from16 v18, v9

    move-object/from16 v9, v20

    .end local v9    # "transformIdx":I
    .local v18, "transformIdx":I
    invoke-static/range {v4 .. v9}, Lcom/itextpdf/io/codec/brotli/dec/Transform;->transformDictionaryWord([BILjava/nio/ByteBuffer;IILcom/itextpdf/io/codec/brotli/dec/Transform;)I

    move-result v5

    .line 792
    move v6, v7

    .end local v7    # "offset":I
    .local v5, "len":I
    .local v6, "offset":I
    iget v7, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->copyDst:I

    add-int/2addr v7, v5

    iput v7, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->copyDst:I

    .line 793
    iget v7, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->pos:I

    add-int/2addr v7, v5

    iput v7, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->pos:I

    .line 794
    iget v7, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->metaBlockLength:I

    sub-int/2addr v7, v5

    iput v7, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->metaBlockLength:I

    .line 795
    iget v7, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->copyDst:I

    iget v8, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->ringBufferSize:I

    if-lt v7, v8, :cond_2

    .line 796
    iput v10, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->nextRunningState:I

    .line 797
    iget v7, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->ringBufferSize:I

    iput v7, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->bytesToWrite:I

    .line 798
    iput v15, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->bytesWritten:I

    .line 799
    iput v11, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->runningState:I

    .line 800
    move/from16 v18, v3

    goto/16 :goto_a

    .line 802
    .end local v5    # "len":I
    :cond_2
    nop

    .line 805
    .end local v6    # "offset":I
    .end local v12    # "wordId":I
    .end local v13    # "shift":I
    .end local v16    # "mask":I
    .end local v17    # "wordIdx":I
    .end local v18    # "transformIdx":I
    nop

    .line 808
    iput v14, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->runningState:I

    .line 809
    move/from16 v18, v3

    goto/16 :goto_a

    .line 803
    .local v5, "offset":I
    .local v6, "transformIdx":I
    .restart local v12    # "wordId":I
    .restart local v13    # "shift":I
    .restart local v16    # "mask":I
    .restart local v17    # "wordIdx":I
    :cond_3
    new-instance v3, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;

    invoke-direct {v3, v7}, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 806
    .end local v5    # "offset":I
    .end local v6    # "transformIdx":I
    .end local v12    # "wordId":I
    .end local v13    # "shift":I
    .end local v16    # "mask":I
    .end local v17    # "wordIdx":I
    :cond_4
    new-instance v3, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;

    invoke-direct {v3, v7}, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 812
    :pswitch_3
    iget v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->ringBufferSize:I

    iget v6, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->copyDst:I

    iget v7, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->ringBufferSize:I

    sub-int/2addr v6, v7

    invoke-static {v4, v5, v4, v15, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 814
    iput v14, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->runningState:I

    .line 815
    move/from16 v18, v3

    goto/16 :goto_a

    .line 595
    :pswitch_4
    move/from16 v18, v3

    goto/16 :goto_7

    :pswitch_5
    move/from16 v18, v3

    move/from16 v19, v13

    goto/16 :goto_2

    .line 829
    :pswitch_6
    invoke-static {v0}, Lcom/itextpdf/io/codec/brotli/dec/Decode;->copyUncompressedData(Lcom/itextpdf/io/codec/brotli/dec/State;)V

    .line 830
    move/from16 v18, v3

    goto/16 :goto_a

    .line 818
    :goto_1
    :pswitch_7
    iget v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->metaBlockLength:I

    if-lez v5, :cond_5

    .line 819
    invoke-static {v1}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readMoreInput(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 821
    invoke-static {v1, v10}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readBits(Lcom/itextpdf/io/codec/brotli/dec/BitReader;I)I

    .line 822
    iget v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->metaBlockLength:I

    sub-int/2addr v5, v3

    iput v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->metaBlockLength:I

    goto :goto_1

    .line 824
    :cond_5
    iput v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->runningState:I

    .line 825
    move/from16 v18, v3

    goto/16 :goto_a

    .line 607
    :pswitch_8
    invoke-static {v0}, Lcom/itextpdf/io/codec/brotli/dec/Decode;->readMetablockHuffmanCodesAndContextMaps(Lcom/itextpdf/io/codec/brotli/dec/State;)V

    .line 608
    iput v14, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->runningState:I

    .line 612
    :pswitch_9
    iget v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->metaBlockLength:I

    if-gtz v5, :cond_6

    .line 613
    iput v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->runningState:I

    .line 614
    move/from16 v18, v3

    goto/16 :goto_a

    .line 616
    :cond_6
    invoke-static {v1}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readMoreInput(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 617
    iget-object v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->blockLength:[I

    aget v5, v5, v3

    if-nez v5, :cond_7

    .line 618
    invoke-static {v0}, Lcom/itextpdf/io/codec/brotli/dec/Decode;->decodeCommandBlockSwitch(Lcom/itextpdf/io/codec/brotli/dec/State;)V

    .line 620
    :cond_7
    iget-object v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->blockLength:[I

    aget v6, v5, v3

    sub-int/2addr v6, v3

    aput v6, v5, v3

    .line 621
    invoke-static {v1}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->fillBitWindow(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 622
    iget-object v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->hGroup1:Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;

    iget-object v5, v5, Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;->codes:[I

    iget v6, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->treeCommandOffset:I

    invoke-static {v5, v6, v1}, Lcom/itextpdf/io/codec/brotli/dec/Decode;->readSymbol([IILcom/itextpdf/io/codec/brotli/dec/BitReader;)I

    move-result v5

    .line 623
    .local v5, "cmdCode":I
    ushr-int/lit8 v6, v5, 0x6

    .line 624
    .local v6, "rangeIdx":I
    iput v15, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->distanceCode:I

    .line 625
    if-lt v6, v13, :cond_8

    .line 626
    add-int/lit8 v6, v6, -0x2

    .line 627
    const/4 v10, -0x1

    iput v10, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->distanceCode:I

    .line 629
    :cond_8
    sget-object v10, Lcom/itextpdf/io/codec/brotli/dec/Prefix;->INSERT_RANGE_LUT:[I

    aget v10, v10, v6

    ushr-int/lit8 v16, v5, 0x3

    and-int/lit8 v16, v16, 0x7

    add-int v10, v10, v16

    .line 630
    .local v10, "insertCode":I
    sget-object v16, Lcom/itextpdf/io/codec/brotli/dec/Prefix;->COPY_RANGE_LUT:[I

    aget v16, v16, v6

    and-int/lit8 v17, v5, 0x7

    add-int v16, v16, v17

    .line 631
    .local v16, "copyCode":I
    sget-object v17, Lcom/itextpdf/io/codec/brotli/dec/Prefix;->INSERT_LENGTH_OFFSET:[I

    aget v17, v17, v10

    sget-object v18, Lcom/itextpdf/io/codec/brotli/dec/Prefix;->INSERT_LENGTH_N_BITS:[I

    move/from16 v19, v13

    aget v13, v18, v10

    .line 632
    invoke-static {v1, v13}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readBits(Lcom/itextpdf/io/codec/brotli/dec/BitReader;I)I

    move-result v13

    add-int v13, v17, v13

    iput v13, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->insertLength:I

    .line 633
    sget-object v13, Lcom/itextpdf/io/codec/brotli/dec/Prefix;->COPY_LENGTH_OFFSET:[I

    aget v13, v13, v16

    sget-object v17, Lcom/itextpdf/io/codec/brotli/dec/Prefix;->COPY_LENGTH_N_BITS:[I

    move/from16 v18, v3

    aget v3, v17, v16

    .line 634
    invoke-static {v1, v3}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readBits(Lcom/itextpdf/io/codec/brotli/dec/BitReader;I)I

    move-result v3

    add-int/2addr v13, v3

    iput v13, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->copyLength:I

    .line 636
    iput v15, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->j:I

    .line 637
    iput v12, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->runningState:I

    .line 641
    .end local v5    # "cmdCode":I
    .end local v6    # "rangeIdx":I
    .end local v10    # "insertCode":I
    .end local v16    # "copyCode":I
    :goto_2
    iget-boolean v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->trivialLiteralContext:Z

    if-eqz v3, :cond_b

    .line 642
    :cond_9
    iget v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->j:I

    iget v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->insertLength:I

    if-ge v3, v5, :cond_e

    .line 643
    invoke-static {v1}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readMoreInput(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 644
    iget-object v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->blockLength:[I

    aget v3, v3, v15

    if-nez v3, :cond_a

    .line 645
    invoke-static {v0}, Lcom/itextpdf/io/codec/brotli/dec/Decode;->decodeLiteralBlockSwitch(Lcom/itextpdf/io/codec/brotli/dec/State;)V

    .line 647
    :cond_a
    iget-object v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->blockLength:[I

    aget v5, v3, v15

    add-int/lit8 v5, v5, -0x1

    aput v5, v3, v15

    .line 648
    invoke-static {v1}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->fillBitWindow(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 649
    iget v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->pos:I

    iget-object v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->hGroup0:Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;

    iget-object v5, v5, Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;->codes:[I

    iget v6, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->literalTree:I

    .line 650
    invoke-static {v5, v6, v1}, Lcom/itextpdf/io/codec/brotli/dec/Decode;->readSymbol([IILcom/itextpdf/io/codec/brotli/dec/BitReader;)I

    move-result v5

    int-to-byte v5, v5

    aput-byte v5, v4, v3

    .line 651
    iget v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->j:I

    add-int/lit8 v3, v3, 0x1

    iput v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->j:I

    .line 652
    iget v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->pos:I

    add-int/lit8 v5, v3, 0x1

    iput v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->pos:I

    if-ne v3, v2, :cond_9

    .line 653
    iput v12, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->nextRunningState:I

    .line 654
    iget v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->ringBufferSize:I

    iput v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->bytesToWrite:I

    .line 655
    iput v15, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->bytesWritten:I

    .line 656
    iput v11, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->runningState:I

    .line 657
    goto/16 :goto_4

    .line 661
    :cond_b
    iget v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->pos:I

    add-int/lit8 v3, v3, -0x1

    and-int/2addr v3, v2

    aget-byte v3, v4, v3

    and-int/lit16 v3, v3, 0xff

    .line 662
    .local v3, "prevByte1":I
    iget v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->pos:I

    add-int/lit8 v5, v5, -0x2

    and-int/2addr v5, v2

    aget-byte v5, v4, v5

    and-int/lit16 v5, v5, 0xff

    .line 663
    .local v5, "prevByte2":I
    :goto_3
    iget v6, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->j:I

    iget v10, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->insertLength:I

    if-ge v6, v10, :cond_e

    .line 664
    invoke-static {v1}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readMoreInput(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 665
    iget-object v6, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->blockLength:[I

    aget v6, v6, v15

    if-nez v6, :cond_c

    .line 666
    invoke-static {v0}, Lcom/itextpdf/io/codec/brotli/dec/Decode;->decodeLiteralBlockSwitch(Lcom/itextpdf/io/codec/brotli/dec/State;)V

    .line 668
    :cond_c
    iget-object v6, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->contextMap:[B

    iget v10, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->contextMapSlice:I

    sget-object v13, Lcom/itextpdf/io/codec/brotli/dec/Context;->LOOKUP:[I

    iget v9, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->contextLookupOffset1:I

    add-int/2addr v9, v3

    aget v9, v13, v9

    sget-object v13, Lcom/itextpdf/io/codec/brotli/dec/Context;->LOOKUP:[I

    iget v8, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->contextLookupOffset2:I

    add-int/2addr v8, v5

    aget v8, v13, v8

    or-int/2addr v8, v9

    add-int/2addr v10, v8

    aget-byte v6, v6, v10

    and-int/lit16 v6, v6, 0xff

    .line 671
    .local v6, "literalTreeIndex":I
    iget-object v8, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->blockLength:[I

    aget v9, v8, v15

    add-int/lit8 v9, v9, -0x1

    aput v9, v8, v15

    .line 672
    move v5, v3

    .line 673
    invoke-static {v1}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->fillBitWindow(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 674
    iget-object v8, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->hGroup0:Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;

    iget-object v8, v8, Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;->codes:[I

    iget-object v9, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->hGroup0:Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;

    iget-object v9, v9, Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;->trees:[I

    aget v9, v9, v6

    invoke-static {v8, v9, v1}, Lcom/itextpdf/io/codec/brotli/dec/Decode;->readSymbol([IILcom/itextpdf/io/codec/brotli/dec/BitReader;)I

    move-result v3

    .line 676
    iget v8, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->pos:I

    int-to-byte v9, v3

    aput-byte v9, v4, v8

    .line 677
    iget v8, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->j:I

    add-int/lit8 v8, v8, 0x1

    iput v8, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->j:I

    .line 678
    iget v8, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->pos:I

    add-int/lit8 v9, v8, 0x1

    iput v9, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->pos:I

    if-ne v8, v2, :cond_d

    .line 679
    iput v12, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->nextRunningState:I

    .line 680
    iget v8, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->ringBufferSize:I

    iput v8, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->bytesToWrite:I

    .line 681
    iput v15, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->bytesWritten:I

    .line 682
    iput v11, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->runningState:I

    .line 683
    goto :goto_4

    .line 685
    .end local v6    # "literalTreeIndex":I
    :cond_d
    const/4 v8, 0x4

    const/4 v9, 0x7

    goto :goto_3

    .line 687
    .end local v3    # "prevByte1":I
    .end local v5    # "prevByte2":I
    :cond_e
    :goto_4
    iget v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->runningState:I

    if-eq v3, v12, :cond_f

    .line 688
    goto/16 :goto_a

    .line 690
    :cond_f
    iget v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->metaBlockLength:I

    iget v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->insertLength:I

    sub-int/2addr v3, v5

    iput v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->metaBlockLength:I

    .line 691
    iget v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->metaBlockLength:I

    if-gtz v3, :cond_10

    .line 692
    iput v14, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->runningState:I

    .line 693
    goto/16 :goto_a

    .line 695
    :cond_10
    iget v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->distanceCode:I

    if-gez v3, :cond_13

    .line 696
    invoke-static {v1}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readMoreInput(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 697
    iget-object v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->blockLength:[I

    aget v3, v3, v19

    if-nez v3, :cond_11

    .line 698
    invoke-static {v0}, Lcom/itextpdf/io/codec/brotli/dec/Decode;->decodeDistanceBlockSwitch(Lcom/itextpdf/io/codec/brotli/dec/State;)V

    .line 700
    :cond_11
    iget-object v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->blockLength:[I

    aget v5, v3, v19

    add-int/lit8 v5, v5, -0x1

    aput v5, v3, v19

    .line 701
    invoke-static {v1}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->fillBitWindow(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 702
    iget-object v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->hGroup2:Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;

    iget-object v3, v3, Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;->codes:[I

    iget-object v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->hGroup2:Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;

    iget-object v5, v5, Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;->trees:[I

    iget-object v6, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->distContextMap:[B

    iget v8, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->distContextMapSlice:I

    iget v9, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->copyLength:I

    const/4 v10, 0x4

    if-le v9, v10, :cond_12

    move v9, v14

    goto :goto_5

    :cond_12
    iget v9, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->copyLength:I

    add-int/lit8 v9, v9, -0x2

    :goto_5
    add-int/2addr v8, v9

    aget-byte v6, v6, v8

    and-int/lit16 v6, v6, 0xff

    aget v5, v5, v6

    invoke-static {v3, v5, v1}, Lcom/itextpdf/io/codec/brotli/dec/Decode;->readSymbol([IILcom/itextpdf/io/codec/brotli/dec/BitReader;)I

    move-result v3

    iput v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->distanceCode:I

    .line 705
    iget v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->distanceCode:I

    iget v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->numDirectDistanceCodes:I

    if-lt v3, v5, :cond_13

    .line 706
    iget v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->distanceCode:I

    iget v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->numDirectDistanceCodes:I

    sub-int/2addr v3, v5

    iput v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->distanceCode:I

    .line 707
    iget v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->distanceCode:I

    iget v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->distancePostfixMask:I

    and-int/2addr v3, v5

    .line 708
    .local v3, "postfix":I
    iget v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->distanceCode:I

    iget v6, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->distancePostfixBits:I

    ushr-int/2addr v5, v6

    iput v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->distanceCode:I

    .line 709
    iget v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->distanceCode:I

    ushr-int/lit8 v5, v5, 0x1

    add-int/lit8 v5, v5, 0x1

    .line 710
    .local v5, "n":I
    iget v6, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->distanceCode:I

    and-int/lit8 v6, v6, 0x1

    add-int/lit8 v6, v6, 0x2

    shl-int/2addr v6, v5

    const/16 v17, 0x4

    add-int/lit8 v6, v6, -0x4

    .line 711
    .local v6, "offset":I
    iget v8, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->numDirectDistanceCodes:I

    add-int/2addr v8, v3

    .line 712
    invoke-static {v1, v5}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readBits(Lcom/itextpdf/io/codec/brotli/dec/BitReader;I)I

    move-result v9

    add-int/2addr v9, v6

    iget v10, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->distancePostfixBits:I

    shl-int/2addr v9, v10

    add-int/2addr v8, v9

    iput v8, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->distanceCode:I

    .line 718
    .end local v3    # "postfix":I
    .end local v5    # "n":I
    .end local v6    # "offset":I
    :cond_13
    iget v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->distanceCode:I

    iget-object v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->distRb:[I

    iget v6, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->distRbIdx:I

    invoke-static {v3, v5, v6}, Lcom/itextpdf/io/codec/brotli/dec/Decode;->translateShortCodes(I[II)I

    move-result v3

    iput v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->distance:I

    .line 719
    iget v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->distance:I

    if-ltz v3, :cond_1c

    .line 723
    iget v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->maxDistance:I

    iget v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->maxBackwardDistance:I

    if-eq v3, v5, :cond_14

    iget v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->pos:I

    iget v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->maxBackwardDistance:I

    if-ge v3, v5, :cond_14

    .line 725
    iget v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->pos:I

    iput v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->maxDistance:I

    goto :goto_6

    .line 727
    :cond_14
    iget v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->maxBackwardDistance:I

    iput v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->maxDistance:I

    .line 730
    :goto_6
    iget v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->pos:I

    iput v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->copyDst:I

    .line 731
    iget v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->distance:I

    iget v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->maxDistance:I

    if-le v3, v5, :cond_15

    .line 732
    const/16 v3, 0x9

    iput v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->runningState:I

    .line 733
    goto/16 :goto_a

    .line 736
    :cond_15
    iget v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->distanceCode:I

    if-lez v3, :cond_16

    .line 737
    iget-object v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->distRb:[I

    iget v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->distRbIdx:I

    and-int/2addr v5, v14

    iget v6, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->distance:I

    aput v6, v3, v5

    .line 738
    iget v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->distRbIdx:I

    add-int/lit8 v3, v3, 0x1

    iput v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->distRbIdx:I

    .line 741
    :cond_16
    iget v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->copyLength:I

    iget v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->metaBlockLength:I

    if-gt v3, v5, :cond_1b

    .line 744
    iput v15, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->j:I

    .line 745
    const/4 v3, 0x7

    iput v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->runningState:I

    .line 748
    :goto_7
    iget v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->pos:I

    iget v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->distance:I

    sub-int/2addr v3, v5

    and-int/2addr v3, v2

    .line 749
    .local v3, "src":I
    iget v5, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->pos:I

    .line 750
    .local v5, "dst":I
    iget v6, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->copyLength:I

    iget v7, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->j:I

    sub-int/2addr v6, v7

    .line 751
    .local v6, "copyLength":I
    add-int v7, v3, v6

    if-ge v7, v2, :cond_18

    add-int v7, v5, v6

    if-ge v7, v2, :cond_18

    .line 752
    const/4 v7, 0x0

    .local v7, "k":I
    :goto_8
    if-ge v7, v6, :cond_17

    .line 753
    add-int/lit8 v8, v5, 0x1

    .end local v5    # "dst":I
    .local v8, "dst":I
    add-int/lit8 v9, v3, 0x1

    .end local v3    # "src":I
    .local v9, "src":I
    aget-byte v3, v4, v3

    aput-byte v3, v4, v5

    .line 752
    add-int/lit8 v7, v7, 0x1

    move v5, v8

    move v3, v9

    goto :goto_8

    .line 755
    .end local v7    # "k":I
    .end local v8    # "dst":I
    .end local v9    # "src":I
    .restart local v3    # "src":I
    .restart local v5    # "dst":I
    :cond_17
    iget v7, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->j:I

    add-int/2addr v7, v6

    iput v7, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->j:I

    .line 756
    iget v7, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->metaBlockLength:I

    sub-int/2addr v7, v6

    iput v7, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->metaBlockLength:I

    .line 757
    iget v7, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->pos:I

    add-int/2addr v7, v6

    iput v7, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->pos:I

    goto :goto_9

    .line 759
    :cond_18
    iget v7, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->j:I

    iget v8, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->copyLength:I

    if-ge v7, v8, :cond_19

    .line 760
    iget v7, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->pos:I

    iget v8, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->pos:I

    iget v9, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->distance:I

    sub-int/2addr v8, v9

    and-int/2addr v8, v2

    aget-byte v8, v4, v8

    aput-byte v8, v4, v7

    .line 762
    iget v7, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->metaBlockLength:I

    add-int/lit8 v7, v7, -0x1

    iput v7, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->metaBlockLength:I

    .line 763
    iget v7, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->j:I

    add-int/lit8 v7, v7, 0x1

    iput v7, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->j:I

    .line 764
    iget v7, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->pos:I

    add-int/lit8 v8, v7, 0x1

    iput v8, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->pos:I

    if-ne v7, v2, :cond_18

    .line 765
    const/4 v7, 0x7

    iput v7, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->nextRunningState:I

    .line 766
    iget v7, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->ringBufferSize:I

    iput v7, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->bytesToWrite:I

    .line 767
    iput v15, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->bytesWritten:I

    .line 768
    iput v11, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->runningState:I

    .line 769
    nop

    .line 773
    :cond_19
    :goto_9
    iget v7, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->runningState:I

    const/4 v8, 0x7

    if-ne v7, v8, :cond_1a

    .line 774
    iput v14, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->runningState:I

    .line 593
    .end local v3    # "src":I
    .end local v5    # "dst":I
    .end local v6    # "copyLength":I
    :cond_1a
    :goto_a
    move/from16 v3, v18

    goto/16 :goto_0

    .line 742
    :cond_1b
    new-instance v3, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;

    invoke-direct {v3, v7}, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 720
    :cond_1c
    new-instance v3, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;

    const-string v5, "Negative distance"

    invoke-direct {v3, v5}, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 597
    :pswitch_a
    move/from16 v18, v3

    iget v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->metaBlockLength:I

    if-ltz v3, :cond_1d

    .line 600
    invoke-static {v0}, Lcom/itextpdf/io/codec/brotli/dec/Decode;->readMetablockInfo(Lcom/itextpdf/io/codec/brotli/dec/State;)V

    .line 602
    iget v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->ringBufferSize:I

    add-int/lit8 v2, v3, -0x1

    .line 603
    iget-object v4, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->ringBuffer:[B

    .line 604
    move/from16 v3, v18

    goto/16 :goto_0

    .line 598
    :cond_1d
    new-instance v3, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;

    invoke-direct {v3, v6}, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 848
    :cond_1e
    move/from16 v18, v3

    iget v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->runningState:I

    if-ne v3, v7, :cond_20

    .line 849
    iget v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->metaBlockLength:I

    if-ltz v3, :cond_1f

    .line 852
    invoke-static {v1}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->jumpToByteBoundary(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 853
    iget-object v3, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->br:Lcom/itextpdf/io/codec/brotli/dec/BitReader;

    move/from16 v5, v18

    invoke-static {v3, v5}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->checkHealth(Lcom/itextpdf/io/codec/brotli/dec/BitReader;Z)V

    goto :goto_b

    .line 850
    :cond_1f
    new-instance v3, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;

    invoke-direct {v3, v6}, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 855
    :cond_20
    :goto_b
    return-void

    .line 587
    .end local v1    # "br":Lcom/itextpdf/io/codec/brotli/dec/BitReader;
    .end local v2    # "ringBufferMask":I
    .end local v4    # "ringBuffer":[B
    :cond_21
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Can\'t decompress after close"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 584
    :cond_22
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Can\'t decompress until initialized"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_a
        :pswitch_8
        :pswitch_9
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private static inverseMoveToFrontTransform([BI)V
    .locals 4
    .param p0, "v"    # [B
    .param p1, "vLen"    # I

    .line 146
    const/16 v0, 0x100

    new-array v1, v0, [I

    .line 147
    .local v1, "mtf":[I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v0, :cond_0

    .line 148
    aput v2, v1, v2

    .line 147
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 150
    .end local v2    # "i":I
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, p1, :cond_2

    .line 151
    aget-byte v2, p0, v0

    and-int/lit16 v2, v2, 0xff

    .line 152
    .local v2, "index":I
    aget v3, v1, v2

    int-to-byte v3, v3

    aput-byte v3, p0, v0

    .line 153
    if-eqz v2, :cond_1

    .line 154
    invoke-static {v1, v2}, Lcom/itextpdf/io/codec/brotli/dec/Decode;->moveToFront([II)V

    .line 150
    .end local v2    # "index":I
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 157
    .end local v0    # "i":I
    :cond_2
    return-void
.end method

.method private static maybeReallocateRingBuffer(Lcom/itextpdf/io/codec/brotli/dec/State;)V
    .locals 7
    .param p0, "state"    # Lcom/itextpdf/io/codec/brotli/dec/State;

    .line 380
    iget v0, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->maxRingBufferSize:I

    .line 381
    .local v0, "newSize":I
    int-to-long v1, v0

    iget-wide v3, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->expectedTotalSize:J

    cmp-long v1, v1, v3

    if-lez v1, :cond_1

    .line 383
    iget-wide v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->expectedTotalSize:J

    long-to-int v1, v1

    iget-object v2, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->customDictionary:[B

    array-length v2, v2

    add-int/2addr v1, v2

    .line 384
    .local v1, "minimalNewSize":I
    :goto_0
    shr-int/lit8 v2, v0, 0x1

    if-le v2, v1, :cond_0

    .line 385
    shr-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 387
    :cond_0
    iget-boolean v2, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->inputEnd:Z

    if-nez v2, :cond_1

    const/16 v2, 0x4000

    if-ge v0, v2, :cond_1

    iget v3, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->maxRingBufferSize:I

    if-lt v3, v2, :cond_1

    .line 388
    const/16 v0, 0x4000

    .line 391
    .end local v1    # "minimalNewSize":I
    :cond_1
    iget v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->ringBufferSize:I

    if-gt v0, v1, :cond_2

    .line 392
    return-void

    .line 394
    :cond_2
    add-int/lit8 v1, v0, 0x25

    .line 395
    .local v1, "ringBufferSizeWithSlack":I
    new-array v2, v1, [B

    .line 396
    .local v2, "newBuffer":[B
    iget-object v3, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->ringBuffer:[B

    const/4 v4, 0x0

    if-eqz v3, :cond_3

    .line 397
    iget-object v3, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->ringBuffer:[B

    iget v5, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->ringBufferSize:I

    invoke-static {v3, v4, v2, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_1

    .line 400
    :cond_3
    iget-object v3, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->customDictionary:[B

    array-length v3, v3

    if-eqz v3, :cond_5

    .line 401
    iget-object v3, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->customDictionary:[B

    array-length v3, v3

    .line 402
    .local v3, "length":I
    const/4 v5, 0x0

    .line 403
    .local v5, "offset":I
    iget v6, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->maxBackwardDistance:I

    if-le v3, v6, :cond_4

    .line 404
    iget v6, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->maxBackwardDistance:I

    sub-int v5, v3, v6

    .line 405
    iget v3, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->maxBackwardDistance:I

    .line 407
    :cond_4
    iget-object v6, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->customDictionary:[B

    invoke-static {v6, v5, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 408
    iput v3, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->pos:I

    .line 409
    iput v3, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->bytesToIgnore:I

    .line 412
    .end local v3    # "length":I
    .end local v5    # "offset":I
    :cond_5
    :goto_1
    iput-object v2, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->ringBuffer:[B

    .line 413
    iput v0, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->ringBufferSize:I

    .line 414
    return-void
.end method

.method private static moveToFront([II)V
    .locals 2
    .param p0, "v"    # [I
    .param p1, "index"    # I

    .line 138
    aget v0, p0, p1

    .line 139
    .local v0, "value":I
    :goto_0
    if-lez p1, :cond_0

    .line 140
    add-int/lit8 v1, p1, -0x1

    aget v1, p0, v1

    aput v1, p0, p1

    .line 139
    add-int/lit8 p1, p1, -0x1

    goto :goto_0

    .line 142
    :cond_0
    const/4 v1, 0x0

    aput v0, p0, v1

    .line 143
    return-void
.end method

.method private static readBlockLength([IILcom/itextpdf/io/codec/brotli/dec/BitReader;)I
    .locals 4
    .param p0, "table"    # [I
    .param p1, "offset"    # I
    .param p2, "br"    # Lcom/itextpdf/io/codec/brotli/dec/BitReader;

    .line 122
    invoke-static {p2}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->fillBitWindow(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 123
    invoke-static {p0, p1, p2}, Lcom/itextpdf/io/codec/brotli/dec/Decode;->readSymbol([IILcom/itextpdf/io/codec/brotli/dec/BitReader;)I

    move-result v0

    .line 124
    .local v0, "code":I
    sget-object v1, Lcom/itextpdf/io/codec/brotli/dec/Prefix;->BLOCK_LENGTH_N_BITS:[I

    aget v1, v1, v0

    .line 125
    .local v1, "n":I
    sget-object v2, Lcom/itextpdf/io/codec/brotli/dec/Prefix;->BLOCK_LENGTH_OFFSET:[I

    aget v2, v2, v0

    invoke-static {p2, v1}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readBits(Lcom/itextpdf/io/codec/brotli/dec/BitReader;I)I

    move-result v3

    add-int/2addr v2, v3

    return v2
.end method

.method static readHuffmanCode(I[IILcom/itextpdf/io/codec/brotli/dec/BitReader;)V
    .locals 16
    .param p0, "alphabetSize"    # I
    .param p1, "table"    # [I
    .param p2, "offset"    # I
    .param p3, "br"    # Lcom/itextpdf/io/codec/brotli/dec/BitReader;

    .line 220
    move/from16 v0, p0

    move-object/from16 v1, p3

    const/4 v2, 0x1

    .line 222
    .local v2, "ok":Z
    invoke-static {v1}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readMoreInput(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 224
    new-array v3, v0, [I

    .line 225
    .local v3, "codeLengths":[I
    const/4 v4, 0x2

    invoke-static {v1, v4}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readBits(Lcom/itextpdf/io/codec/brotli/dec/BitReader;I)I

    move-result v5

    .line 226
    .local v5, "simpleCodeOrSkip":I
    const/4 v6, 0x0

    const/4 v7, 0x1

    if-ne v5, v7, :cond_6

    .line 227
    add-int/lit8 v8, v0, -0x1

    .line 228
    .local v8, "maxBitsCounter":I
    const/4 v9, 0x0

    .line 229
    .local v9, "maxBits":I
    const/4 v10, 0x4

    new-array v10, v10, [I

    .line 230
    .local v10, "symbols":[I
    invoke-static {v1, v4}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readBits(Lcom/itextpdf/io/codec/brotli/dec/BitReader;I)I

    move-result v11

    add-int/2addr v11, v7

    .line 231
    .local v11, "numSymbols":I
    :goto_0
    if-eqz v8, :cond_0

    .line 232
    shr-int/lit8 v8, v8, 0x1

    .line 233
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 237
    :cond_0
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_1
    if-ge v12, v11, :cond_1

    .line 238
    invoke-static {v1, v9}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readBits(Lcom/itextpdf/io/codec/brotli/dec/BitReader;I)I

    move-result v13

    rem-int/2addr v13, v0

    aput v13, v10, v12

    .line 239
    aget v13, v10, v12

    aput v4, v3, v13

    .line 237
    add-int/lit8 v12, v12, 0x1

    goto :goto_1

    .line 241
    .end local v12    # "i":I
    :cond_1
    aget v12, v10, v6

    aput v7, v3, v12

    .line 242
    packed-switch v11, :pswitch_data_0

    .line 254
    aget v12, v10, v6

    aget v13, v10, v7

    const/4 v14, 0x3

    if-eq v12, v13, :cond_4

    aget v12, v10, v6

    aget v13, v10, v4

    if-eq v12, v13, :cond_4

    aget v12, v10, v6

    aget v13, v10, v14

    if-eq v12, v13, :cond_4

    aget v12, v10, v7

    aget v13, v10, v4

    if-eq v12, v13, :cond_4

    aget v12, v10, v7

    aget v13, v10, v14

    if-eq v12, v13, :cond_4

    aget v12, v10, v4

    aget v13, v10, v14

    if-eq v12, v13, :cond_4

    move v12, v7

    goto :goto_2

    .line 250
    :pswitch_0
    aget v12, v10, v6

    aget v13, v10, v7

    if-eq v12, v13, :cond_2

    aget v12, v10, v6

    aget v13, v10, v4

    if-eq v12, v13, :cond_2

    aget v12, v10, v7

    aget v4, v10, v4

    if-eq v12, v4, :cond_2

    move v6, v7

    :cond_2
    move v2, v6

    .line 251
    goto :goto_3

    .line 246
    :pswitch_1
    aget v4, v10, v6

    aget v12, v10, v7

    if-eq v4, v12, :cond_3

    move v6, v7

    :cond_3
    move v2, v6

    .line 247
    aget v4, v10, v7

    aput v7, v3, v4

    .line 248
    goto :goto_3

    .line 244
    :pswitch_2
    goto :goto_3

    .line 254
    :cond_4
    move v12, v6

    :goto_2
    move v2, v12

    .line 256
    invoke-static {v1, v7}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readBits(Lcom/itextpdf/io/codec/brotli/dec/BitReader;I)I

    move-result v12

    if-ne v12, v7, :cond_5

    .line 257
    aget v4, v10, v4

    aput v14, v3, v4

    .line 258
    aget v4, v10, v14

    aput v14, v3, v4

    goto :goto_3

    .line 260
    :cond_5
    aget v6, v10, v6

    aput v4, v3, v6

    .line 264
    .end local v8    # "maxBitsCounter":I
    .end local v9    # "maxBits":I
    .end local v10    # "symbols":[I
    .end local v11    # "numSymbols":I
    :goto_3
    goto :goto_5

    .line 265
    :cond_6
    const/16 v4, 0x12

    new-array v8, v4, [I

    .line 266
    .local v8, "codeLengthCodeLengths":[I
    const/16 v9, 0x20

    .line 267
    .local v9, "space":I
    const/4 v10, 0x0

    .line 268
    .local v10, "numCodes":I
    move v11, v5

    .local v11, "i":I
    :goto_4
    if-ge v11, v4, :cond_8

    if-lez v9, :cond_8

    .line 269
    sget-object v12, Lcom/itextpdf/io/codec/brotli/dec/Decode;->CODE_LENGTH_CODE_ORDER:[I

    aget v12, v12, v11

    .line 270
    .local v12, "codeLenIdx":I
    invoke-static {v1}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->fillBitWindow(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 271
    iget-wide v13, v1, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->accumulator:J

    iget v15, v1, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->bitOffset:I

    ushr-long/2addr v13, v15

    long-to-int v13, v13

    and-int/lit8 v13, v13, 0xf

    .line 273
    .local v13, "p":I
    iget v14, v1, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->bitOffset:I

    sget-object v15, Lcom/itextpdf/io/codec/brotli/dec/Decode;->FIXED_TABLE:[I

    aget v15, v15, v13

    shr-int/lit8 v15, v15, 0x10

    add-int/2addr v14, v15

    iput v14, v1, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->bitOffset:I

    .line 274
    sget-object v14, Lcom/itextpdf/io/codec/brotli/dec/Decode;->FIXED_TABLE:[I

    aget v14, v14, v13

    const v15, 0xffff

    and-int/2addr v14, v15

    .line 275
    .local v14, "v":I
    aput v14, v8, v12

    .line 276
    if-eqz v14, :cond_7

    .line 277
    const/16 v15, 0x20

    shr-int/2addr v15, v14

    sub-int/2addr v9, v15

    .line 278
    add-int/lit8 v10, v10, 0x1

    .line 268
    .end local v12    # "codeLenIdx":I
    .end local v13    # "p":I
    .end local v14    # "v":I
    :cond_7
    add-int/lit8 v11, v11, 0x1

    goto :goto_4

    .line 281
    .end local v11    # "i":I
    :cond_8
    if-eq v10, v7, :cond_9

    if-nez v9, :cond_a

    :cond_9
    move v6, v7

    :cond_a
    move v2, v6

    .line 282
    invoke-static {v8, v0, v3, v1}, Lcom/itextpdf/io/codec/brotli/dec/Decode;->readHuffmanCodeLengths([II[ILcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 284
    .end local v8    # "codeLengthCodeLengths":[I
    .end local v9    # "space":I
    .end local v10    # "numCodes":I
    :goto_5
    if-eqz v2, :cond_b

    .line 287
    const/16 v4, 0x8

    move-object/from16 v6, p1

    move/from16 v7, p2

    invoke-static {v6, v7, v4, v3, v0}, Lcom/itextpdf/io/codec/brotli/dec/Huffman;->buildHuffmanTable([III[II)V

    .line 288
    return-void

    .line 285
    :cond_b
    move-object/from16 v6, p1

    move/from16 v7, p2

    new-instance v4, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;

    const-string v8, "Can\'t readHuffmanCode"

    invoke-direct {v4, v8}, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static readHuffmanCodeLengths([II[ILcom/itextpdf/io/codec/brotli/dec/BitReader;)V
    .locals 17
    .param p0, "codeLengthCodeLengths"    # [I
    .param p1, "numSymbols"    # I
    .param p2, "codeLengths"    # [I
    .param p3, "br"    # Lcom/itextpdf/io/codec/brotli/dec/BitReader;

    .line 161
    move/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    const/4 v3, 0x0

    .line 162
    .local v3, "symbol":I
    const/16 v4, 0x8

    .line 163
    .local v4, "prevCodeLen":I
    const/4 v5, 0x0

    .line 164
    .local v5, "repeat":I
    const/4 v6, 0x0

    .line 165
    .local v6, "repeatCodeLen":I
    const v7, 0x8000

    .line 166
    .local v7, "space":I
    const/16 v8, 0x20

    new-array v8, v8, [I

    .line 168
    .local v8, "table":[I
    const/4 v9, 0x5

    const/16 v10, 0x12

    const/4 v11, 0x0

    move-object/from16 v12, p0

    invoke-static {v8, v11, v9, v12, v10}, Lcom/itextpdf/io/codec/brotli/dec/Huffman;->buildHuffmanTable([III[II)V

    .line 170
    :goto_0
    if-ge v3, v0, :cond_8

    if-lez v7, :cond_8

    .line 171
    invoke-static {v2}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readMoreInput(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 172
    invoke-static {v2}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->fillBitWindow(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 173
    iget-wide v9, v2, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->accumulator:J

    iget v11, v2, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->bitOffset:I

    ushr-long/2addr v9, v11

    long-to-int v9, v9

    and-int/lit8 v9, v9, 0x1f

    .line 174
    .local v9, "p":I
    iget v10, v2, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->bitOffset:I

    aget v11, v8, v9

    const/16 v13, 0x10

    shr-int/2addr v11, v13

    add-int/2addr v10, v11

    iput v10, v2, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->bitOffset:I

    .line 175
    aget v10, v8, v9

    const v11, 0xffff

    and-int/2addr v10, v11

    .line 176
    .local v10, "codeLen":I
    if-ge v10, v13, :cond_1

    .line 177
    const/4 v5, 0x0

    .line 178
    add-int/lit8 v11, v3, 0x1

    .end local v3    # "symbol":I
    .local v11, "symbol":I
    aput v10, v1, v3

    .line 179
    if-eqz v10, :cond_0

    .line 180
    move v3, v10

    .line 181
    .end local v4    # "prevCodeLen":I
    .local v3, "prevCodeLen":I
    const v4, 0x8000

    shr-int/2addr v4, v10

    sub-int/2addr v7, v4

    move v4, v3

    move v3, v11

    goto :goto_2

    .line 179
    .end local v3    # "prevCodeLen":I
    .restart local v4    # "prevCodeLen":I
    :cond_0
    move v3, v11

    goto :goto_2

    .line 184
    .end local v11    # "symbol":I
    .local v3, "symbol":I
    :cond_1
    add-int/lit8 v11, v10, -0xe

    .line 185
    .local v11, "extraBits":I
    const/4 v14, 0x0

    .line 186
    .local v14, "newLen":I
    if-ne v10, v13, :cond_2

    .line 187
    move v14, v4

    .line 189
    :cond_2
    if-eq v6, v14, :cond_3

    .line 190
    const/4 v5, 0x0

    .line 191
    move v6, v14

    .line 193
    :cond_3
    move v13, v5

    .line 194
    .local v13, "oldRepeat":I
    if-lez v5, :cond_4

    .line 195
    add-int/lit8 v5, v5, -0x2

    .line 196
    shl-int/2addr v5, v11

    .line 198
    :cond_4
    invoke-static {v2, v11}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readBits(Lcom/itextpdf/io/codec/brotli/dec/BitReader;I)I

    move-result v15

    add-int/lit8 v15, v15, 0x3

    add-int/2addr v5, v15

    .line 199
    sub-int v15, v5, v13

    .line 200
    .local v15, "repeatDelta":I
    add-int v2, v3, v15

    if-gt v2, v0, :cond_7

    .line 203
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v15, :cond_5

    .line 204
    add-int/lit8 v16, v3, 0x1

    .end local v3    # "symbol":I
    .local v16, "symbol":I
    aput v6, v1, v3

    .line 203
    add-int/lit8 v2, v2, 0x1

    move/from16 v3, v16

    goto :goto_1

    .line 206
    .end local v2    # "i":I
    .end local v16    # "symbol":I
    .restart local v3    # "symbol":I
    :cond_5
    if-eqz v6, :cond_6

    .line 207
    rsub-int/lit8 v2, v6, 0xf

    shl-int v2, v15, v2

    sub-int/2addr v7, v2

    .line 210
    .end local v9    # "p":I
    .end local v10    # "codeLen":I
    .end local v11    # "extraBits":I
    .end local v13    # "oldRepeat":I
    .end local v14    # "newLen":I
    .end local v15    # "repeatDelta":I
    :cond_6
    :goto_2
    move-object/from16 v2, p3

    goto :goto_0

    .line 201
    .restart local v9    # "p":I
    .restart local v10    # "codeLen":I
    .restart local v11    # "extraBits":I
    .restart local v13    # "oldRepeat":I
    .restart local v14    # "newLen":I
    .restart local v15    # "repeatDelta":I
    :cond_7
    new-instance v2, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;

    const-string/jumbo v0, "symbol + repeatDelta > numSymbols"

    invoke-direct {v2, v0}, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 211
    .end local v9    # "p":I
    .end local v10    # "codeLen":I
    .end local v11    # "extraBits":I
    .end local v13    # "oldRepeat":I
    .end local v14    # "newLen":I
    .end local v15    # "repeatDelta":I
    :cond_8
    if-nez v7, :cond_9

    .line 215
    sub-int v0, p1, v3

    invoke-static {v1, v3, v0}, Lcom/itextpdf/io/codec/brotli/dec/Utils;->fillWithZeroes([III)V

    .line 216
    return-void

    .line 212
    :cond_9
    new-instance v0, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;

    const-string v2, "Unused space"

    invoke-direct {v0, v2}, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static readMetablockHuffmanCodesAndContextMaps(Lcom/itextpdf/io/codec/brotli/dec/State;)V
    .locals 12
    .param p0, "state"    # Lcom/itextpdf/io/codec/brotli/dec/State;

    .line 461
    iget-object v0, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->br:Lcom/itextpdf/io/codec/brotli/dec/BitReader;

    .line 463
    .local v0, "br":Lcom/itextpdf/io/codec/brotli/dec/BitReader;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/4 v2, 0x3

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-ge v1, v2, :cond_1

    .line 464
    iget-object v2, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->numBlockTypes:[I

    invoke-static {v0}, Lcom/itextpdf/io/codec/brotli/dec/Decode;->decodeVarLenUnsignedByte(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)I

    move-result v5

    add-int/2addr v5, v4

    aput v5, v2, v1

    .line 465
    iget-object v2, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->blockLength:[I

    const/high16 v5, 0x10000000

    aput v5, v2, v1

    .line 466
    iget-object v2, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->numBlockTypes:[I

    aget v2, v2, v1

    if-le v2, v4, :cond_0

    .line 467
    iget-object v2, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->numBlockTypes:[I

    aget v2, v2, v1

    add-int/2addr v2, v3

    iget-object v3, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->blockTypeTrees:[I

    mul-int/lit16 v4, v1, 0x438

    invoke-static {v2, v3, v4, v0}, Lcom/itextpdf/io/codec/brotli/dec/Decode;->readHuffmanCode(I[IILcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 469
    iget-object v2, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->blockLenTrees:[I

    mul-int/lit16 v3, v1, 0x438

    const/16 v4, 0x1a

    invoke-static {v4, v2, v3, v0}, Lcom/itextpdf/io/codec/brotli/dec/Decode;->readHuffmanCode(I[IILcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 471
    iget-object v2, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->blockLength:[I

    iget-object v3, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->blockLenTrees:[I

    mul-int/lit16 v4, v1, 0x438

    invoke-static {v3, v4, v0}, Lcom/itextpdf/io/codec/brotli/dec/Decode;->readBlockLength([IILcom/itextpdf/io/codec/brotli/dec/BitReader;)I

    move-result v3

    aput v3, v2, v1

    .line 463
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 476
    .end local v1    # "i":I
    :cond_1
    invoke-static {v0}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readMoreInput(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 477
    invoke-static {v0, v3}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readBits(Lcom/itextpdf/io/codec/brotli/dec/BitReader;I)I

    move-result v1

    iput v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->distancePostfixBits:I

    .line 478
    nop

    .line 479
    const/4 v1, 0x4

    invoke-static {v0, v1}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readBits(Lcom/itextpdf/io/codec/brotli/dec/BitReader;I)I

    move-result v5

    iget v6, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->distancePostfixBits:I

    shl-int/2addr v5, v6

    add-int/lit8 v5, v5, 0x10

    iput v5, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->numDirectDistanceCodes:I

    .line 480
    iget v5, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->distancePostfixBits:I

    shl-int v5, v4, v5

    sub-int/2addr v5, v4

    iput v5, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->distancePostfixMask:I

    .line 481
    iget v5, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->numDirectDistanceCodes:I

    const/16 v6, 0x30

    iget v7, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->distancePostfixBits:I

    shl-int/2addr v6, v7

    add-int/2addr v5, v6

    .line 483
    .local v5, "numDistanceCodes":I
    iget-object v6, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->numBlockTypes:[I

    const/4 v7, 0x0

    aget v6, v6, v7

    new-array v6, v6, [B

    iput-object v6, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->contextModes:[B

    .line 484
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    iget-object v8, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->numBlockTypes:[I

    aget v8, v8, v7

    if-ge v6, v8, :cond_3

    .line 486
    add-int/lit8 v8, v6, 0x60

    iget-object v9, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->numBlockTypes:[I

    aget v9, v9, v7

    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    move-result v8

    .line 487
    .local v8, "limit":I
    :goto_2
    if-ge v6, v8, :cond_2

    .line 488
    iget-object v9, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->contextModes:[B

    invoke-static {v0, v3}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readBits(Lcom/itextpdf/io/codec/brotli/dec/BitReader;I)I

    move-result v10

    shl-int/2addr v10, v4

    int-to-byte v10, v10

    aput-byte v10, v9, v6

    .line 487
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 490
    :cond_2
    invoke-static {v0}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readMoreInput(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 491
    .end local v8    # "limit":I
    goto :goto_1

    .line 494
    .end local v6    # "i":I
    :cond_3
    iget-object v6, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->numBlockTypes:[I

    aget v6, v6, v7

    shl-int/lit8 v6, v6, 0x6

    new-array v6, v6, [B

    iput-object v6, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->contextMap:[B

    .line 495
    iget-object v6, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->numBlockTypes:[I

    aget v6, v6, v7

    shl-int/lit8 v6, v6, 0x6

    iget-object v8, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->contextMap:[B

    invoke-static {v6, v8, v0}, Lcom/itextpdf/io/codec/brotli/dec/Decode;->decodeContextMap(I[BLcom/itextpdf/io/codec/brotli/dec/BitReader;)I

    move-result v6

    .line 497
    .local v6, "numLiteralTrees":I
    iput-boolean v4, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->trivialLiteralContext:Z

    .line 498
    const/4 v8, 0x0

    .local v8, "j":I
    :goto_3
    iget-object v9, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->numBlockTypes:[I

    aget v9, v9, v7

    shl-int/lit8 v9, v9, 0x6

    if-ge v8, v9, :cond_5

    .line 499
    iget-object v9, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->contextMap:[B

    aget-byte v9, v9, v8

    shr-int/lit8 v10, v8, 0x6

    if-eq v9, v10, :cond_4

    .line 500
    iput-boolean v7, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->trivialLiteralContext:Z

    .line 501
    goto :goto_4

    .line 498
    :cond_4
    add-int/lit8 v8, v8, 0x1

    goto :goto_3

    .line 506
    .end local v8    # "j":I
    :cond_5
    :goto_4
    iget-object v8, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->numBlockTypes:[I

    aget v8, v8, v3

    shl-int/2addr v8, v3

    new-array v8, v8, [B

    iput-object v8, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->distContextMap:[B

    .line 507
    iget-object v8, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->numBlockTypes:[I

    aget v8, v8, v3

    shl-int/2addr v8, v3

    iget-object v9, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->distContextMap:[B

    invoke-static {v8, v9, v0}, Lcom/itextpdf/io/codec/brotli/dec/Decode;->decodeContextMap(I[BLcom/itextpdf/io/codec/brotli/dec/BitReader;)I

    move-result v8

    .line 510
    .local v8, "numDistTrees":I
    iget-object v9, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->hGroup0:Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;

    const/16 v10, 0x100

    invoke-static {v9, v10, v6}, Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;->init(Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;II)V

    .line 511
    iget-object v9, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->hGroup1:Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;

    iget-object v10, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->numBlockTypes:[I

    aget v10, v10, v4

    const/16 v11, 0x2c0

    invoke-static {v9, v11, v10}, Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;->init(Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;II)V

    .line 512
    iget-object v9, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->hGroup2:Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;

    invoke-static {v9, v5, v8}, Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;->init(Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;II)V

    .line 514
    iget-object v9, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->hGroup0:Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;

    invoke-static {v9, v0}, Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;->decode(Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 515
    iget-object v9, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->hGroup1:Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;

    invoke-static {v9, v0}, Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;->decode(Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 516
    iget-object v9, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->hGroup2:Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;

    invoke-static {v9, v0}, Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;->decode(Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 518
    iput v7, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->contextMapSlice:I

    .line 519
    iput v7, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->distContextMapSlice:I

    .line 520
    sget-object v9, Lcom/itextpdf/io/codec/brotli/dec/Context;->LOOKUP_OFFSETS:[I

    iget-object v10, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->contextModes:[B

    aget-byte v10, v10, v7

    aget v9, v9, v10

    iput v9, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->contextLookupOffset1:I

    .line 521
    sget-object v9, Lcom/itextpdf/io/codec/brotli/dec/Context;->LOOKUP_OFFSETS:[I

    iget-object v10, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->contextModes:[B

    aget-byte v10, v10, v7

    add-int/2addr v10, v4

    aget v9, v9, v10

    iput v9, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->contextLookupOffset2:I

    .line 522
    iput v7, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->literalTreeIndex:I

    .line 523
    iget-object v9, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->hGroup0:Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;

    iget-object v9, v9, Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;->trees:[I

    aget v9, v9, v7

    iput v9, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->literalTree:I

    .line 524
    iget-object v9, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->hGroup1:Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;

    iget-object v9, v9, Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;->trees:[I

    aget v9, v9, v7

    iput v9, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->treeCommandOffset:I

    .line 526
    iget-object v9, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->blockTypeRb:[I

    iget-object v10, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->blockTypeRb:[I

    iget-object v11, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->blockTypeRb:[I

    aput v4, v11, v1

    aput v4, v10, v3

    aput v4, v9, v7

    .line 527
    iget-object v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->blockTypeRb:[I

    iget-object v3, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->blockTypeRb:[I

    iget-object v9, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->blockTypeRb:[I

    const/4 v10, 0x5

    aput v7, v9, v10

    aput v7, v3, v2

    aput v7, v1, v4

    .line 528
    return-void
.end method

.method private static readMetablockInfo(Lcom/itextpdf/io/codec/brotli/dec/State;)V
    .locals 5
    .param p0, "state"    # Lcom/itextpdf/io/codec/brotli/dec/State;

    .line 422
    iget-object v0, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->br:Lcom/itextpdf/io/codec/brotli/dec/BitReader;

    .line 424
    .local v0, "br":Lcom/itextpdf/io/codec/brotli/dec/BitReader;
    iget-boolean v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->inputEnd:Z

    if-eqz v1, :cond_0

    .line 425
    const/16 v1, 0xa

    iput v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->nextRunningState:I

    .line 426
    iget v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->pos:I

    iput v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->bytesToWrite:I

    .line 427
    const/4 v1, 0x0

    iput v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->bytesWritten:I

    .line 428
    const/16 v1, 0xc

    iput v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->runningState:I

    .line 429
    return-void

    .line 432
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->hGroup0:Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;

    const/4 v2, 0x0

    iput-object v2, v1, Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;->codes:[I

    .line 433
    iget-object v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->hGroup0:Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;

    iput-object v2, v1, Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;->trees:[I

    .line 434
    iget-object v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->hGroup1:Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;

    iput-object v2, v1, Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;->codes:[I

    .line 435
    iget-object v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->hGroup1:Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;

    iput-object v2, v1, Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;->trees:[I

    .line 436
    iget-object v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->hGroup2:Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;

    iput-object v2, v1, Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;->codes:[I

    .line 437
    iget-object v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->hGroup2:Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;

    iput-object v2, v1, Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;->trees:[I

    .line 439
    invoke-static {v0}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readMoreInput(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 440
    invoke-static {v0, p0}, Lcom/itextpdf/io/codec/brotli/dec/Decode;->decodeMetaBlockLength(Lcom/itextpdf/io/codec/brotli/dec/BitReader;Lcom/itextpdf/io/codec/brotli/dec/State;)V

    .line 441
    iget v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->metaBlockLength:I

    if-nez v1, :cond_1

    iget-boolean v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->isMetadata:Z

    if-nez v1, :cond_1

    .line 442
    return-void

    .line 444
    :cond_1
    iget-boolean v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->isUncompressed:Z

    if-nez v1, :cond_3

    iget-boolean v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->isMetadata:Z

    if-eqz v1, :cond_2

    goto :goto_0

    .line 448
    :cond_2
    const/4 v1, 0x2

    iput v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->runningState:I

    goto :goto_2

    .line 445
    :cond_3
    :goto_0
    invoke-static {v0}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->jumpToByteBoundary(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 446
    iget-boolean v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->isMetadata:Z

    if-eqz v1, :cond_4

    const/4 v1, 0x4

    goto :goto_1

    :cond_4
    const/4 v1, 0x5

    :goto_1
    iput v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->runningState:I

    .line 451
    :goto_2
    iget-boolean v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->isMetadata:Z

    if-eqz v1, :cond_5

    .line 452
    return-void

    .line 454
    :cond_5
    iget-wide v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->expectedTotalSize:J

    iget v3, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->metaBlockLength:I

    int-to-long v3, v3

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->expectedTotalSize:J

    .line 455
    iget v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->ringBufferSize:I

    iget v2, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->maxRingBufferSize:I

    if-ge v1, v2, :cond_6

    .line 456
    invoke-static {p0}, Lcom/itextpdf/io/codec/brotli/dec/Decode;->maybeReallocateRingBuffer(Lcom/itextpdf/io/codec/brotli/dec/State;)V

    .line 458
    :cond_6
    return-void
.end method

.method private static readSymbol([IILcom/itextpdf/io/codec/brotli/dec/BitReader;)I
    .locals 8
    .param p0, "table"    # [I
    .param p1, "offset"    # I
    .param p2, "br"    # Lcom/itextpdf/io/codec/brotli/dec/BitReader;

    .line 106
    iget-wide v0, p2, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->accumulator:J

    iget v2, p2, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->bitOffset:I

    ushr-long/2addr v0, v2

    long-to-int v0, v0

    .line 107
    .local v0, "val":I
    and-int/lit16 v1, v0, 0xff

    add-int/2addr p1, v1

    .line 108
    aget v1, p0, p1

    shr-int/lit8 v1, v1, 0x10

    .line 109
    .local v1, "bits":I
    aget v2, p0, p1

    const v3, 0xffff

    and-int/2addr v2, v3

    .line 110
    .local v2, "sym":I
    const/16 v4, 0x8

    if-gt v1, v4, :cond_0

    .line 111
    iget v3, p2, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->bitOffset:I

    add-int/2addr v3, v1

    iput v3, p2, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->bitOffset:I

    .line 112
    return v2

    .line 114
    :cond_0
    add-int/2addr p1, v2

    .line 115
    const/4 v5, 0x1

    shl-int v6, v5, v1

    sub-int/2addr v6, v5

    .line 116
    .local v6, "mask":I
    and-int v5, v0, v6

    ushr-int/2addr v5, v4

    add-int/2addr p1, v5

    .line 117
    iget v5, p2, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->bitOffset:I

    aget v7, p0, p1

    shr-int/lit8 v7, v7, 0x10

    add-int/2addr v7, v4

    add-int/2addr v5, v7

    iput v5, p2, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->bitOffset:I

    .line 118
    aget v4, p0, p1

    and-int/2addr v3, v4

    return v3
.end method

.method static setCustomDictionary(Lcom/itextpdf/io/codec/brotli/dec/State;[B)V
    .locals 1
    .param p0, "state"    # Lcom/itextpdf/io/codec/brotli/dec/State;
    .param p1, "data"    # [B

    .line 576
    if-nez p1, :cond_0

    const/4 v0, 0x0

    new-array v0, v0, [B

    goto :goto_0

    :cond_0
    move-object v0, p1

    :goto_0
    iput-object v0, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->customDictionary:[B

    .line 577
    return-void
.end method

.method private static translateShortCodes(I[II)I
    .locals 2
    .param p0, "code"    # I
    .param p1, "ringBuffer"    # [I
    .param p2, "index"    # I

    .line 129
    const/16 v0, 0x10

    if-ge p0, v0, :cond_0

    .line 130
    sget-object v0, Lcom/itextpdf/io/codec/brotli/dec/Decode;->DISTANCE_SHORT_CODE_INDEX_OFFSET:[I

    aget v0, v0, p0

    add-int/2addr p2, v0

    .line 131
    and-int/lit8 p2, p2, 0x3

    .line 132
    aget v0, p1, p2

    sget-object v1, Lcom/itextpdf/io/codec/brotli/dec/Decode;->DISTANCE_SHORT_CODE_VALUE_OFFSET:[I

    aget v1, v1, p0

    add-int/2addr v0, v1

    return v0

    .line 134
    :cond_0
    add-int/lit8 v0, p0, -0x10

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method private static writeRingBuffer(Lcom/itextpdf/io/codec/brotli/dec/State;)Z
    .locals 7
    .param p0, "state"    # Lcom/itextpdf/io/codec/brotli/dec/State;

    .line 559
    iget v0, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->bytesToIgnore:I

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 560
    iget v0, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->bytesWritten:I

    iget v2, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->bytesToIgnore:I

    add-int/2addr v0, v2

    iput v0, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->bytesWritten:I

    .line 561
    iput v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->bytesToIgnore:I

    .line 563
    :cond_0
    iget v0, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->outputLength:I

    iget v2, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->outputUsed:I

    sub-int/2addr v0, v2

    iget v2, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->bytesToWrite:I

    iget v3, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->bytesWritten:I

    sub-int/2addr v2, v3

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 565
    .local v0, "toWrite":I
    if-eqz v0, :cond_1

    .line 566
    iget-object v2, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->ringBuffer:[B

    iget v3, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->bytesWritten:I

    iget-object v4, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->output:[B

    iget v5, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->outputOffset:I

    iget v6, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->outputUsed:I

    add-int/2addr v5, v6

    invoke-static {v2, v3, v4, v5, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 568
    iget v2, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->outputUsed:I

    add-int/2addr v2, v0

    iput v2, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->outputUsed:I

    .line 569
    iget v2, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->bytesWritten:I

    add-int/2addr v2, v0

    iput v2, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->bytesWritten:I

    .line 572
    :cond_1
    iget v2, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->outputUsed:I

    iget v3, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->outputLength:I

    if-ge v2, v3, :cond_2

    const/4 v1, 0x1

    :cond_2
    return v1
.end method
