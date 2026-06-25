.class public Lcom/itextpdf/io/source/RandomAccessFileOrArray;
.super Ljava/lang/Object;
.source "RandomAccessFileOrArray.java"

# interfaces
.implements Ljava/io/DataInput;


# static fields
.field public static plainRandomAccess:Z


# instance fields
.field private back:B

.field private byteSource:Lcom/itextpdf/io/source/IRandomAccessSource;

.field private byteSourcePosition:J

.field private isBack:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 40
    const/4 v0, 0x0

    sput-boolean v0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->plainRandomAccess:Z

    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V
    .locals 1
    .param p1, "byteSource"    # Lcom/itextpdf/io/source/IRandomAccessSource;

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->isBack:Z

    .line 68
    iput-object p1, p0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->byteSource:Lcom/itextpdf/io/source/IRandomAccessSource;

    .line 69
    return-void
.end method

.method private ensureByteSourceIsThreadSafe()V
    .locals 2

    .line 580
    iget-object v0, p0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->byteSource:Lcom/itextpdf/io/source/IRandomAccessSource;

    instance-of v0, v0, Lcom/itextpdf/io/source/ThreadSafeRandomAccessSource;

    if-nez v0, :cond_0

    .line 581
    new-instance v0, Lcom/itextpdf/io/source/ThreadSafeRandomAccessSource;

    iget-object v1, p0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->byteSource:Lcom/itextpdf/io/source/IRandomAccessSource;

    invoke-direct {v0, v1}, Lcom/itextpdf/io/source/ThreadSafeRandomAccessSource;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    iput-object v0, p0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->byteSource:Lcom/itextpdf/io/source/IRandomAccessSource;

    .line 583
    :cond_0
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 229
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->isBack:Z

    .line 231
    iget-object v0, p0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->byteSource:Lcom/itextpdf/io/source/IRandomAccessSource;

    invoke-interface {v0}, Lcom/itextpdf/io/source/IRandomAccessSource;->close()V

    .line 232
    return-void
.end method

.method public createSourceView()Lcom/itextpdf/io/source/IRandomAccessSource;
    .locals 2

    .line 89
    invoke-direct {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->ensureByteSourceIsThreadSafe()V

    .line 90
    new-instance v0, Lcom/itextpdf/io/source/IndependentRandomAccessSource;

    iget-object v1, p0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->byteSource:Lcom/itextpdf/io/source/IRandomAccessSource;

    invoke-direct {v0, v1}, Lcom/itextpdf/io/source/IndependentRandomAccessSource;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    return-object v0
.end method

.method public createView()Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .locals 3

    .line 78
    invoke-direct {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->ensureByteSourceIsThreadSafe()V

    .line 79
    new-instance v0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    new-instance v1, Lcom/itextpdf/io/source/IndependentRandomAccessSource;

    iget-object v2, p0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->byteSource:Lcom/itextpdf/io/source/IRandomAccessSource;

    invoke-direct {v1, v2}, Lcom/itextpdf/io/source/IndependentRandomAccessSource;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    invoke-direct {v0, v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    return-object v0
.end method

.method public getPosition()J
    .locals 4

    .line 260
    iget-wide v0, p0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->byteSourcePosition:J

    iget-boolean v2, p0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->isBack:Z

    int-to-long v2, v2

    sub-long/2addr v0, v2

    return-wide v0
.end method

.method public length()J
    .locals 2

    .line 240
    iget-object v0, p0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->byteSource:Lcom/itextpdf/io/source/IRandomAccessSource;

    invoke-interface {v0}, Lcom/itextpdf/io/source/IRandomAccessSource;->length()J

    move-result-wide v0

    return-wide v0
.end method

.method public pushBack(B)V
    .locals 1
    .param p1, "b"    # B

    .line 99
    iput-byte p1, p0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->back:B

    .line 100
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->isBack:Z

    .line 101
    return-void
.end method

.method public read()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 110
    iget-boolean v0, p0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->isBack:Z

    if-eqz v0, :cond_0

    .line 111
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->isBack:Z

    .line 112
    iget-byte v0, p0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->back:B

    and-int/lit16 v0, v0, 0xff

    return v0

    .line 115
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->byteSource:Lcom/itextpdf/io/source/IRandomAccessSource;

    iget-wide v1, p0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->byteSourcePosition:J

    const-wide/16 v3, 0x1

    add-long/2addr v3, v1

    iput-wide v3, p0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->byteSourcePosition:J

    invoke-interface {v0, v1, v2}, Lcom/itextpdf/io/source/IRandomAccessSource;->get(J)I

    move-result v0

    return v0
.end method

.method public read([B)I
    .locals 2
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 157
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read([BII)I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .locals 8
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 128
    const/4 v0, 0x0

    if-nez p3, :cond_0

    .line 129
    return v0

    .line 130
    :cond_0
    const/4 v1, 0x0

    .line 131
    .local v1, "count":I
    iget-boolean v2, p0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->isBack:Z

    if-eqz v2, :cond_1

    if-lez p3, :cond_1

    .line 132
    iput-boolean v0, p0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->isBack:Z

    .line 133
    add-int/lit8 v0, p2, 0x1

    .end local p2    # "off":I
    .local v0, "off":I
    iget-byte v2, p0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->back:B

    aput-byte v2, p1, p2

    .line 134
    add-int/lit8 p3, p3, -0x1

    .line 135
    add-int/lit8 v1, v1, 0x1

    move v6, v0

    move v7, p3

    goto :goto_0

    .line 137
    .end local v0    # "off":I
    .restart local p2    # "off":I
    :cond_1
    move v6, p2

    move v7, p3

    .end local p2    # "off":I
    .end local p3    # "len":I
    .local v6, "off":I
    .local v7, "len":I
    :goto_0
    if-lez v7, :cond_2

    .line 138
    iget-object v2, p0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->byteSource:Lcom/itextpdf/io/source/IRandomAccessSource;

    iget-wide v3, p0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->byteSourcePosition:J

    move-object v5, p1

    .end local p1    # "b":[B
    .local v5, "b":[B
    invoke-interface/range {v2 .. v7}, Lcom/itextpdf/io/source/IRandomAccessSource;->get(J[BII)I

    move-result p1

    .line 139
    .local p1, "byteSourceCount":I
    if-lez p1, :cond_3

    .line 140
    add-int/2addr v1, p1

    .line 141
    iget-wide p2, p0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->byteSourcePosition:J

    int-to-long v2, p1

    add-long/2addr p2, v2

    iput-wide p2, p0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->byteSourcePosition:J

    goto :goto_1

    .line 137
    .end local v5    # "b":[B
    .local p1, "b":[B
    :cond_2
    move-object v5, p1

    .line 144
    .end local p1    # "b":[B
    .restart local v5    # "b":[B
    :cond_3
    :goto_1
    if-nez v1, :cond_4

    .line 145
    const/4 p1, -0x1

    return p1

    .line 146
    :cond_4
    return v1
.end method

.method public readBoolean()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 267
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v0

    .line 268
    .local v0, "ch":I
    if-ltz v0, :cond_1

    .line 270
    if-eqz v0, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1

    .line 269
    :cond_1
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1
.end method

.method public readByte()B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 277
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v0

    .line 278
    .local v0, "ch":I
    if-ltz v0, :cond_0

    .line 280
    int-to-byte v1, v0

    return v1

    .line 279
    :cond_0
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1
.end method

.method public readChar()C
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 376
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v0

    .line 377
    .local v0, "ch1":I
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v1

    .line 378
    .local v1, "ch2":I
    or-int v2, v0, v1

    if-ltz v2, :cond_0

    .line 380
    shl-int/lit8 v2, v0, 0x8

    add-int/2addr v2, v1

    int-to-char v2, v2

    return v2

    .line 379
    :cond_0
    new-instance v2, Ljava/io/EOFException;

    invoke-direct {v2}, Ljava/io/EOFException;-><init>()V

    throw v2
.end method

.method public final readCharLE()C
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 403
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v0

    .line 404
    .local v0, "ch1":I
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v1

    .line 405
    .local v1, "ch2":I
    or-int v2, v0, v1

    if-ltz v2, :cond_0

    .line 407
    shl-int/lit8 v2, v1, 0x8

    add-int/2addr v2, v1

    int-to-char v2, v2

    return v2

    .line 406
    :cond_0
    new-instance v2, Ljava/io/EOFException;

    invoke-direct {v2}, Ljava/io/EOFException;-><init>()V

    throw v2
.end method

.method public readDouble()D
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 518
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readLong()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v0

    return-wide v0
.end method

.method public final readDoubleLE()D
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 522
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readLongLE()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v0

    return-wide v0
.end method

.method public readFloat()F
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 507
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readInt()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v0

    return v0
.end method

.method public final readFloatLE()F
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 511
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readIntLE()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v0

    return v0
.end method

.method public readFully([B)V
    .locals 2
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 164
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readFully([BII)V

    .line 165
    return-void
.end method

.method public readFully([BII)V
    .locals 3
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 171
    const/4 v0, 0x0

    .line 173
    .local v0, "n":I
    :cond_0
    add-int v1, p2, v0

    sub-int v2, p3, v0

    invoke-virtual {p0, p1, v1, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read([BII)I

    move-result v1

    .line 174
    .local v1, "count":I
    if-ltz v1, :cond_1

    .line 176
    add-int/2addr v0, v1

    .line 177
    .end local v1    # "count":I
    if-lt v0, p3, :cond_0

    .line 178
    return-void

    .line 175
    .restart local v1    # "count":I
    :cond_1
    new-instance v2, Ljava/io/EOFException;

    invoke-direct {v2}, Ljava/io/EOFException;-><init>()V

    throw v2
.end method

.method public readInt()I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 414
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v0

    .line 415
    .local v0, "ch1":I
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v1

    .line 416
    .local v1, "ch2":I
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v2

    .line 417
    .local v2, "ch3":I
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v3

    .line 418
    .local v3, "ch4":I
    or-int v4, v0, v1

    or-int/2addr v4, v2

    or-int/2addr v4, v3

    if-ltz v4, :cond_0

    .line 420
    shl-int/lit8 v4, v0, 0x18

    shl-int/lit8 v5, v1, 0x10

    add-int/2addr v4, v5

    shl-int/lit8 v5, v2, 0x8

    add-int/2addr v4, v5

    add-int/2addr v4, v3

    return v4

    .line 419
    :cond_0
    new-instance v4, Ljava/io/EOFException;

    invoke-direct {v4}, Ljava/io/EOFException;-><init>()V

    throw v4
.end method

.method public final readIntLE()I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 443
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v0

    .line 444
    .local v0, "ch1":I
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v1

    .line 445
    .local v1, "ch2":I
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v2

    .line 446
    .local v2, "ch3":I
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v3

    .line 447
    .local v3, "ch4":I
    or-int v4, v0, v1

    or-int/2addr v4, v2

    or-int/2addr v4, v3

    if-ltz v4, :cond_0

    .line 449
    shl-int/lit8 v4, v3, 0x18

    shl-int/lit8 v5, v2, 0x10

    add-int/2addr v4, v5

    shl-int/lit8 v5, v1, 0x8

    add-int/2addr v4, v5

    add-int/2addr v4, v0

    return v4

    .line 448
    :cond_0
    new-instance v4, Ljava/io/EOFException;

    invoke-direct {v4}, Ljava/io/EOFException;-><init>()V

    throw v4
.end method

.method public readLine()Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 529
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 530
    .local v0, "input":Ljava/lang/StringBuilder;
    const/4 v1, -0x1

    .line 531
    .local v1, "c":I
    const/4 v2, 0x0

    .line 533
    .local v2, "eol":Z
    :cond_0
    :goto_0
    if-nez v2, :cond_1

    .line 534
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v3

    move v1, v3

    sparse-switch v3, :sswitch_data_0

    .line 547
    int-to-char v3, v1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 548
    goto :goto_0

    .line 540
    :sswitch_0
    const/4 v2, 0x1

    .line 541
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->getPosition()J

    move-result-wide v3

    .line 542
    .local v3, "cur":J
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v5

    const/16 v6, 0xa

    if-eq v5, v6, :cond_0

    .line 543
    invoke-virtual {p0, v3, v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    goto :goto_0

    .line 537
    .end local v3    # "cur":J
    :sswitch_1
    const/4 v2, 0x1

    .line 538
    goto :goto_0

    .line 552
    :cond_1
    const/4 v3, -0x1

    if-ne v1, v3, :cond_2

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-nez v3, :cond_2

    .line 553
    const/4 v3, 0x0

    return-object v3

    .line 555
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    nop

    :sswitch_data_0
    .sparse-switch
        -0x1 -> :sswitch_1
        0xa -> :sswitch_1
        0xd -> :sswitch_0
    .end sparse-switch
.end method

.method public readLong()J
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 494
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readInt()I

    move-result v0

    int-to-long v0, v0

    const/16 v2, 0x20

    shl-long/2addr v0, v2

    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readInt()I

    move-result v2

    int-to-long v2, v2

    const-wide v4, 0xffffffffL

    and-long/2addr v2, v4

    add-long/2addr v0, v2

    return-wide v0
.end method

.method public final readLongLE()J
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 498
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readIntLE()I

    move-result v0

    .line 499
    .local v0, "i1":I
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readIntLE()I

    move-result v1

    .line 500
    .local v1, "i2":I
    int-to-long v2, v1

    const/16 v4, 0x20

    shl-long/2addr v2, v4

    int-to-long v4, v0

    const-wide v6, 0xffffffffL

    and-long/2addr v4, v6

    add-long/2addr v2, v4

    return-wide v2
.end method

.method public readShort()S
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 297
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v0

    .line 298
    .local v0, "ch1":I
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v1

    .line 299
    .local v1, "ch2":I
    or-int v2, v0, v1

    if-ltz v2, :cond_0

    .line 301
    shl-int/lit8 v2, v0, 0x8

    add-int/2addr v2, v1

    int-to-short v2, v2

    return v2

    .line 300
    :cond_0
    new-instance v2, Ljava/io/EOFException;

    invoke-direct {v2}, Ljava/io/EOFException;-><init>()V

    throw v2
.end method

.method public final readShortLE()S
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 326
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v0

    .line 327
    .local v0, "ch1":I
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v1

    .line 328
    .local v1, "ch2":I
    or-int v2, v0, v1

    if-ltz v2, :cond_0

    .line 330
    shl-int/lit8 v2, v1, 0x8

    add-int/2addr v2, v0

    int-to-short v2, v2

    return v2

    .line 329
    :cond_0
    new-instance v2, Ljava/io/EOFException;

    invoke-direct {v2}, Ljava/io/EOFException;-><init>()V

    throw v2
.end method

.method public readString(ILjava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "length"    # I
    .param p2, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 574
    new-array v0, p1, [B

    .line 575
    .local v0, "buf":[B
    invoke-virtual {p0, v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readFully([B)V

    .line 576
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0, p2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    return-object v1
.end method

.method public readUTF()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 562
    invoke-static {p0}, Ljava/io/DataInputStream;->readUTF(Ljava/io/DataInput;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public readUnsignedByte()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 287
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v0

    .line 288
    .local v0, "ch":I
    if-ltz v0, :cond_0

    .line 290
    return v0

    .line 289
    :cond_0
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1
.end method

.method public final readUnsignedInt()J
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 471
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v0

    int-to-long v0, v0

    .line 472
    .local v0, "ch1":J
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v2

    int-to-long v2, v2

    .line 473
    .local v2, "ch2":J
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v4

    int-to-long v4, v4

    .line 474
    .local v4, "ch3":J
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v6

    int-to-long v6, v6

    .line 475
    .local v6, "ch4":J
    or-long v8, v0, v2

    or-long/2addr v8, v4

    or-long/2addr v8, v6

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-ltz v8, :cond_0

    .line 477
    const/16 v8, 0x18

    shl-long v8, v0, v8

    const/16 v10, 0x10

    shl-long v10, v2, v10

    add-long/2addr v8, v10

    const/16 v10, 0x8

    shl-long v10, v4, v10

    add-long/2addr v8, v10

    add-long/2addr v8, v6

    return-wide v8

    .line 476
    :cond_0
    new-instance v8, Ljava/io/EOFException;

    invoke-direct {v8}, Ljava/io/EOFException;-><init>()V

    throw v8
.end method

.method public final readUnsignedIntLE()J
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 481
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v0

    int-to-long v0, v0

    .line 482
    .local v0, "ch1":J
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v2

    int-to-long v2, v2

    .line 483
    .local v2, "ch2":J
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v4

    int-to-long v4, v4

    .line 484
    .local v4, "ch3":J
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v6

    int-to-long v6, v6

    .line 485
    .local v6, "ch4":J
    or-long v8, v0, v2

    or-long/2addr v8, v4

    or-long/2addr v8, v6

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-ltz v8, :cond_0

    .line 487
    const/16 v8, 0x18

    shl-long v8, v6, v8

    const/16 v10, 0x10

    shl-long v10, v4, v10

    add-long/2addr v8, v10

    const/16 v10, 0x8

    shl-long v10, v2, v10

    add-long/2addr v8, v10

    add-long/2addr v8, v0

    return-wide v8

    .line 486
    :cond_0
    new-instance v8, Ljava/io/EOFException;

    invoke-direct {v8}, Ljava/io/EOFException;-><init>()V

    throw v8
.end method

.method public readUnsignedShort()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 337
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v0

    .line 338
    .local v0, "ch1":I
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v1

    .line 339
    .local v1, "ch2":I
    or-int v2, v0, v1

    if-ltz v2, :cond_0

    .line 341
    shl-int/lit8 v2, v0, 0x8

    add-int/2addr v2, v1

    return v2

    .line 340
    :cond_0
    new-instance v2, Ljava/io/EOFException;

    invoke-direct {v2}, Ljava/io/EOFException;-><init>()V

    throw v2
.end method

.method public final readUnsignedShortLE()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 365
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v0

    .line 366
    .local v0, "ch1":I
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v1

    .line 367
    .local v1, "ch2":I
    or-int v2, v0, v1

    if-ltz v2, :cond_0

    .line 369
    shl-int/lit8 v2, v1, 0x8

    add-int/2addr v2, v0

    return v2

    .line 368
    :cond_0
    new-instance v2, Ljava/io/EOFException;

    invoke-direct {v2}, Ljava/io/EOFException;-><init>()V

    throw v2
.end method

.method public seek(J)V
    .locals 1
    .param p1, "pos"    # J

    .line 249
    iput-wide p1, p0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->byteSourcePosition:J

    .line 250
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->isBack:Z

    .line 251
    return-void
.end method

.method public skip(J)J
    .locals 11
    .param p1, "n"    # J

    .line 188
    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-gtz v2, :cond_0

    .line 189
    return-wide v0

    .line 191
    :cond_0
    const/4 v0, 0x0

    .line 192
    .local v0, "adj":I
    iget-boolean v1, p0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->isBack:Z

    if-eqz v1, :cond_2

    .line 193
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->isBack:Z

    .line 194
    const-wide/16 v1, 0x1

    cmp-long v3, p1, v1

    if-nez v3, :cond_1

    .line 195
    return-wide v1

    .line 197
    :cond_1
    sub-long/2addr p1, v1

    .line 198
    const/4 v0, 0x1

    .line 205
    :cond_2
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->getPosition()J

    move-result-wide v1

    .line 206
    .local v1, "pos":J
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->length()J

    move-result-wide v3

    .line 207
    .local v3, "len":J
    add-long v5, v1, p1

    .line 208
    .local v5, "newpos":J
    cmp-long v7, v5, v3

    if-lez v7, :cond_3

    .line 209
    move-wide v5, v3

    .line 211
    :cond_3
    invoke-virtual {p0, v5, v6}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 213
    sub-long v7, v5, v1

    int-to-long v9, v0

    add-long/2addr v7, v9

    return-wide v7
.end method

.method public skipBytes(I)I
    .locals 2
    .param p1, "n"    # I

    .line 220
    int-to-long v0, p1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->skip(J)J

    move-result-wide v0

    long-to-int v0, v0

    return v0
.end method
