.class final Lcom/itextpdf/io/codec/brotli/dec/State;
.super Ljava/lang/Object;
.source "State.java"


# instance fields
.field final blockLenTrees:[I

.field final blockLength:[I

.field final blockTypeRb:[I

.field final blockTypeTrees:[I

.field final br:Lcom/itextpdf/io/codec/brotli/dec/BitReader;

.field bytesToIgnore:I

.field bytesToWrite:I

.field bytesWritten:I

.field contextLookupOffset1:I

.field contextLookupOffset2:I

.field contextMap:[B

.field contextMapSlice:I

.field contextModes:[B

.field copyDst:I

.field copyLength:I

.field customDictionary:[B

.field distContextMap:[B

.field distContextMapSlice:I

.field final distRb:[I

.field distRbIdx:I

.field distance:I

.field distanceCode:I

.field distancePostfixBits:I

.field distancePostfixMask:I

.field expectedTotalSize:J

.field final hGroup0:Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;

.field final hGroup1:Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;

.field final hGroup2:Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;

.field inputEnd:Z

.field insertLength:I

.field isMetadata:Z

.field isUncompressed:Z

.field j:I

.field literalTree:I

.field literalTreeIndex:I

.field maxBackwardDistance:I

.field maxDistance:I

.field maxRingBufferSize:I

.field metaBlockLength:I

.field nextRunningState:I

.field final numBlockTypes:[I

.field numDirectDistanceCodes:I

.field output:[B

.field outputLength:I

.field outputOffset:I

.field outputUsed:I

.field pos:I

.field ringBuffer:[B

.field ringBufferSize:I

.field runningState:I

.field treeCommandOffset:I

.field trivialLiteralContext:Z


# direct methods
.method constructor <init>()V
    .locals 5

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->runningState:I

    .line 15
    new-instance v1, Lcom/itextpdf/io/codec/brotli/dec/BitReader;

    invoke-direct {v1}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;-><init>()V

    iput-object v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->br:Lcom/itextpdf/io/codec/brotli/dec/BitReader;

    .line 17
    const/16 v1, 0xca8

    new-array v2, v1, [I

    iput-object v2, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->blockTypeTrees:[I

    .line 18
    new-array v1, v1, [I

    iput-object v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->blockLenTrees:[I

    .line 26
    new-instance v1, Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;

    invoke-direct {v1}, Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;-><init>()V

    iput-object v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->hGroup0:Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;

    .line 27
    new-instance v1, Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;

    invoke-direct {v1}, Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;-><init>()V

    iput-object v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->hGroup1:Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;

    .line 28
    new-instance v1, Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;

    invoke-direct {v1}, Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;-><init>()V

    iput-object v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->hGroup2:Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;

    .line 29
    const/4 v1, 0x3

    new-array v2, v1, [I

    iput-object v2, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->blockLength:[I

    .line 30
    new-array v1, v1, [I

    iput-object v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->numBlockTypes:[I

    .line 31
    const/4 v1, 0x6

    new-array v1, v1, [I

    iput-object v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->blockTypeRb:[I

    .line 32
    const/16 v1, 0xb

    const/4 v2, 0x4

    const/16 v3, 0x10

    const/16 v4, 0xf

    filled-new-array {v3, v4, v1, v2}, [I

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->distRb:[I

    .line 33
    iput v0, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->pos:I

    .line 34
    iput v0, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->maxDistance:I

    .line 35
    iput v0, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->distRbIdx:I

    .line 36
    iput-boolean v0, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->trivialLiteralContext:Z

    .line 37
    iput v0, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->literalTreeIndex:I

    .line 58
    iput v0, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->ringBufferSize:I

    .line 59
    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->expectedTotalSize:J

    .line 60
    new-array v1, v0, [B

    iput-object v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->customDictionary:[B

    .line 61
    iput v0, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->bytesToIgnore:I

    return-void
.end method

.method static close(Lcom/itextpdf/io/codec/brotli/dec/State;)V
    .locals 2
    .param p0, "state"    # Lcom/itextpdf/io/codec/brotli/dec/State;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 107
    iget v0, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->runningState:I

    if-eqz v0, :cond_1

    .line 110
    iget v0, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->runningState:I

    const/16 v1, 0xb

    if-ne v0, v1, :cond_0

    .line 111
    return-void

    .line 113
    :cond_0
    iput v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->runningState:I

    .line 114
    iget-object v0, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->br:Lcom/itextpdf/io/codec/brotli/dec/BitReader;

    invoke-static {v0}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->close(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 115
    return-void

    .line 108
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "State MUST be initialized"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static decodeWindowBits(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)I
    .locals 2
    .param p0, "br"    # Lcom/itextpdf/io/codec/brotli/dec/BitReader;

    .line 72
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readBits(Lcom/itextpdf/io/codec/brotli/dec/BitReader;I)I

    move-result v0

    if-nez v0, :cond_0

    .line 73
    const/16 v0, 0x10

    return v0

    .line 75
    :cond_0
    const/4 v0, 0x3

    invoke-static {p0, v0}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readBits(Lcom/itextpdf/io/codec/brotli/dec/BitReader;I)I

    move-result v1

    .line 76
    .local v1, "n":I
    if-eqz v1, :cond_1

    .line 77
    add-int/lit8 v0, v1, 0x11

    return v0

    .line 79
    :cond_1
    invoke-static {p0, v0}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readBits(Lcom/itextpdf/io/codec/brotli/dec/BitReader;I)I

    move-result v0

    .line 80
    .end local v1    # "n":I
    .local v0, "n":I
    if-eqz v0, :cond_2

    .line 81
    add-int/lit8 v1, v0, 0x8

    return v1

    .line 83
    :cond_2
    const/16 v1, 0x11

    return v1
.end method

.method static setInput(Lcom/itextpdf/io/codec/brotli/dec/State;Ljava/io/InputStream;)V
    .locals 3
    .param p0, "state"    # Lcom/itextpdf/io/codec/brotli/dec/State;
    .param p1, "input"    # Ljava/io/InputStream;

    .line 93
    iget v0, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->runningState:I

    if-nez v0, :cond_1

    .line 96
    iget-object v0, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->br:Lcom/itextpdf/io/codec/brotli/dec/BitReader;

    invoke-static {v0, p1}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->init(Lcom/itextpdf/io/codec/brotli/dec/BitReader;Ljava/io/InputStream;)V

    .line 97
    iget-object v0, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->br:Lcom/itextpdf/io/codec/brotli/dec/BitReader;

    invoke-static {v0}, Lcom/itextpdf/io/codec/brotli/dec/State;->decodeWindowBits(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)I

    move-result v0

    .line 98
    .local v0, "windowBits":I
    const/16 v1, 0x9

    if-eq v0, v1, :cond_0

    .line 101
    const/4 v1, 0x1

    shl-int v2, v1, v0

    iput v2, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->maxRingBufferSize:I

    .line 102
    iget v2, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->maxRingBufferSize:I

    add-int/lit8 v2, v2, -0x10

    iput v2, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->maxBackwardDistance:I

    .line 103
    iput v1, p0, Lcom/itextpdf/io/codec/brotli/dec/State;->runningState:I

    .line 104
    return-void

    .line 99
    :cond_0
    new-instance v1, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;

    const-string v2, "Invalid \'windowBits\' code"

    invoke-direct {v1, v2}, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 94
    .end local v0    # "windowBits":I
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "State MUST be uninitialized"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
