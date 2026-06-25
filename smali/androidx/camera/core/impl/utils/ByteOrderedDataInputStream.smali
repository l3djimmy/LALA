.class final Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;
.super Ljava/io/InputStream;
.source "ByteOrderedDataInputStream.java"

# interfaces
.implements Ljava/io/DataInput;


# static fields
.field private static final BIG_ENDIAN:Ljava/nio/ByteOrder;

.field private static final LITTLE_ENDIAN:Ljava/nio/ByteOrder;


# instance fields
.field private mByteOrder:Ljava/nio/ByteOrder;

.field private final mDataInputStream:Ljava/io/DataInputStream;

.field final mLength:I

.field mPosition:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 36
    sget-object v0, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    sput-object v0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 37
    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    sput-object v0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    return-void
.end method

.method constructor <init>(Ljava/io/InputStream;)V
    .locals 1
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 47
    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-direct {p0, p1, v0}, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;-><init>(Ljava/io/InputStream;Ljava/nio/ByteOrder;)V

    .line 48
    return-void
.end method

.method constructor <init>(Ljava/io/InputStream;Ljava/nio/ByteOrder;)V
    .locals 2
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "byteOrder"    # Ljava/nio/ByteOrder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 50
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 40
    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    iput-object v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mByteOrder:Ljava/nio/ByteOrder;

    .line 51
    new-instance v0, Ljava/io/DataInputStream;

    invoke-direct {v0, p1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    .line 52
    iget-object v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v0}, Ljava/io/DataInputStream;->available()I

    move-result v0

    iput v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mLength:I

    .line 53
    const/4 v0, 0x0

    iput v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    .line 55
    iget-object v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    iget v1, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mLength:I

    invoke-virtual {v0, v1}, Ljava/io/DataInputStream;->mark(I)V

    .line 56
    iput-object p2, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mByteOrder:Ljava/nio/ByteOrder;

    .line 57
    return-void
.end method

.method constructor <init>([B)V
    .locals 1
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 60
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {p0, v0}, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 61
    return-void
.end method


# virtual methods
.method public available()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 88
    iget-object v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v0}, Ljava/io/DataInputStream;->available()I

    move-result v0

    return v0
.end method

.method public getLength()I
    .locals 1

    .line 289
    iget v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mLength:I

    return v0
.end method

.method public mark(I)V
    .locals 2
    .param p1, "readlimit"    # I

    .line 283
    iget-object v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    monitor-enter v0

    .line 284
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v1, p1}, Ljava/io/DataInputStream;->mark(I)V

    .line 285
    monitor-exit v0

    .line 286
    return-void

    .line 285
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public peek()I
    .locals 1

    .line 83
    iget v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    return v0
.end method

.method public read()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 93
    iget v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    .line 94
    iget-object v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v0}, Ljava/io/DataInputStream;->read()I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .locals 2
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 99
    iget-object v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/DataInputStream;->read([BII)I

    move-result v0

    .line 100
    .local v0, "bytesRead":I
    iget v1, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    add-int/2addr v1, v0

    iput v1, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    .line 101
    return v0
.end method

.method public readBoolean()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 117
    iget v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    .line 118
    iget-object v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readBoolean()Z

    move-result v0

    return v0
.end method

.method public readByte()B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 157
    iget v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    .line 158
    iget v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    iget v1, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mLength:I

    if-gt v0, v1, :cond_1

    .line 161
    iget-object v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v0}, Ljava/io/DataInputStream;->read()I

    move-result v0

    .line 162
    .local v0, "ch":I
    if-ltz v0, :cond_0

    .line 165
    int-to-byte v1, v0

    return v1

    .line 163
    :cond_0
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1

    .line 159
    .end local v0    # "ch":I
    :cond_1
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0
.end method

.method public readChar()C
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 123
    iget v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    add-int/lit8 v0, v0, 0x2

    iput v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    .line 124
    iget-object v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readChar()C

    move-result v0

    return v0
.end method

.method public readDouble()D
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 278
    invoke-virtual {p0}, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->readLong()J

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

    .line 273
    invoke-virtual {p0}, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->readInt()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v0

    return v0
.end method

.method public readFully([B)V
    .locals 3
    .param p1, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 146
    iget v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    array-length v1, p1

    add-int/2addr v0, v1

    iput v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    .line 147
    iget v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    iget v1, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mLength:I

    if-gt v0, v1, :cond_1

    .line 150
    iget-object v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    const/4 v1, 0x0

    array-length v2, p1

    invoke-virtual {v0, p1, v1, v2}, Ljava/io/DataInputStream;->read([BII)I

    move-result v0

    array-length v1, p1

    if-ne v0, v1, :cond_0

    .line 153
    return-void

    .line 151
    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Couldn\'t read up to the length of buffer"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 148
    :cond_1
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0
.end method

.method public readFully([BII)V
    .locals 2
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 135
    iget v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    add-int/2addr v0, p3

    iput v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    .line 136
    iget v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    iget v1, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mLength:I

    if-gt v0, v1, :cond_1

    .line 139
    iget-object v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/DataInputStream;->read([BII)I

    move-result v0

    if-ne v0, p3, :cond_0

    .line 142
    return-void

    .line 140
    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Couldn\'t read up to the length of buffer"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 137
    :cond_1
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0
.end method

.method public readInt()I
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 189
    iget v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    add-int/lit8 v0, v0, 0x4

    iput v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    .line 190
    iget v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    iget v1, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mLength:I

    if-gt v0, v1, :cond_3

    .line 193
    iget-object v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v0}, Ljava/io/DataInputStream;->read()I

    move-result v0

    .line 194
    .local v0, "ch1":I
    iget-object v1, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v1}, Ljava/io/DataInputStream;->read()I

    move-result v1

    .line 195
    .local v1, "ch2":I
    iget-object v2, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v2}, Ljava/io/DataInputStream;->read()I

    move-result v2

    .line 196
    .local v2, "ch3":I
    iget-object v3, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v3}, Ljava/io/DataInputStream;->read()I

    move-result v3

    .line 197
    .local v3, "ch4":I
    or-int v4, v0, v1

    or-int/2addr v4, v2

    or-int/2addr v4, v3

    if-ltz v4, :cond_2

    .line 200
    iget-object v4, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mByteOrder:Ljava/nio/ByteOrder;

    sget-object v5, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v4, v5, :cond_0

    .line 201
    shl-int/lit8 v4, v3, 0x18

    shl-int/lit8 v5, v2, 0x10

    add-int/2addr v4, v5

    shl-int/lit8 v5, v1, 0x8

    add-int/2addr v4, v5

    add-int/2addr v4, v0

    return v4

    .line 202
    :cond_0
    iget-object v4, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mByteOrder:Ljava/nio/ByteOrder;

    sget-object v5, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v4, v5, :cond_1

    .line 203
    shl-int/lit8 v4, v0, 0x18

    shl-int/lit8 v5, v1, 0x10

    add-int/2addr v4, v5

    shl-int/lit8 v5, v2, 0x8

    add-int/2addr v4, v5

    add-int/2addr v4, v3

    return v4

    .line 205
    :cond_1
    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Invalid byte order: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mByteOrder:Ljava/nio/ByteOrder;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 198
    :cond_2
    new-instance v4, Ljava/io/EOFException;

    invoke-direct {v4}, Ljava/io/EOFException;-><init>()V

    throw v4

    .line 191
    .end local v0    # "ch1":I
    .end local v1    # "ch2":I
    .end local v2    # "ch3":I
    .end local v3    # "ch4":I
    :cond_3
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0
.end method

.method public readLine()Ljava/lang/String;
    .locals 2

    .line 112
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "readLine() not implemented."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public readLong()J
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 244
    move-object/from16 v0, p0

    iget v1, v0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    const/16 v2, 0x8

    add-int/2addr v1, v2

    iput v1, v0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    .line 245
    iget v1, v0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    iget v3, v0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mLength:I

    if-gt v1, v3, :cond_3

    .line 248
    iget-object v1, v0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v1}, Ljava/io/DataInputStream;->read()I

    move-result v1

    .line 249
    .local v1, "ch1":I
    iget-object v3, v0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v3}, Ljava/io/DataInputStream;->read()I

    move-result v3

    .line 250
    .local v3, "ch2":I
    iget-object v4, v0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v4}, Ljava/io/DataInputStream;->read()I

    move-result v4

    .line 251
    .local v4, "ch3":I
    iget-object v5, v0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v5}, Ljava/io/DataInputStream;->read()I

    move-result v5

    .line 252
    .local v5, "ch4":I
    iget-object v6, v0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v6}, Ljava/io/DataInputStream;->read()I

    move-result v6

    .line 253
    .local v6, "ch5":I
    iget-object v7, v0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v7}, Ljava/io/DataInputStream;->read()I

    move-result v7

    .line 254
    .local v7, "ch6":I
    iget-object v8, v0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v8}, Ljava/io/DataInputStream;->read()I

    move-result v8

    .line 255
    .local v8, "ch7":I
    iget-object v9, v0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v9}, Ljava/io/DataInputStream;->read()I

    move-result v9

    .line 256
    .local v9, "ch8":I
    or-int v10, v1, v3

    or-int/2addr v10, v4

    or-int/2addr v10, v5

    or-int/2addr v10, v6

    or-int/2addr v10, v7

    or-int/2addr v10, v8

    or-int/2addr v10, v9

    if-ltz v10, :cond_2

    .line 259
    iget-object v10, v0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mByteOrder:Ljava/nio/ByteOrder;

    sget-object v11, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    const/16 v14, 0x20

    const/16 v15, 0x28

    const/16 v16, 0x30

    const/16 v17, 0x38

    if-ne v10, v11, :cond_0

    .line 260
    int-to-long v10, v9

    shl-long v10, v10, v17

    const/16 v18, 0x10

    const/16 v19, 0x18

    int-to-long v12, v8

    shl-long v12, v12, v16

    add-long/2addr v10, v12

    int-to-long v12, v7

    shl-long/2addr v12, v15

    add-long/2addr v10, v12

    int-to-long v12, v6

    shl-long/2addr v12, v14

    add-long/2addr v10, v12

    int-to-long v12, v5

    shl-long v12, v12, v19

    add-long/2addr v10, v12

    int-to-long v12, v4

    shl-long v12, v12, v18

    add-long/2addr v10, v12

    int-to-long v12, v3

    shl-long/2addr v12, v2

    add-long/2addr v10, v12

    int-to-long v12, v1

    add-long/2addr v10, v12

    return-wide v10

    .line 263
    :cond_0
    const/16 v18, 0x10

    const/16 v19, 0x18

    iget-object v10, v0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mByteOrder:Ljava/nio/ByteOrder;

    sget-object v11, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v10, v11, :cond_1

    .line 264
    int-to-long v10, v1

    shl-long v10, v10, v17

    int-to-long v12, v3

    shl-long v12, v12, v16

    add-long/2addr v10, v12

    int-to-long v12, v4

    shl-long/2addr v12, v15

    add-long/2addr v10, v12

    int-to-long v12, v5

    shl-long/2addr v12, v14

    add-long/2addr v10, v12

    int-to-long v12, v6

    shl-long v12, v12, v19

    add-long/2addr v10, v12

    int-to-long v12, v7

    shl-long v12, v12, v18

    add-long/2addr v10, v12

    int-to-long v12, v8

    shl-long/2addr v12, v2

    add-long/2addr v10, v12

    int-to-long v12, v9

    add-long/2addr v10, v12

    return-wide v10

    .line 268
    :cond_1
    new-instance v2, Ljava/io/IOException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Invalid byte order: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, v0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mByteOrder:Ljava/nio/ByteOrder;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v2, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 257
    :cond_2
    new-instance v2, Ljava/io/EOFException;

    invoke-direct {v2}, Ljava/io/EOFException;-><init>()V

    throw v2

    .line 246
    .end local v1    # "ch1":I
    .end local v3    # "ch2":I
    .end local v4    # "ch3":I
    .end local v5    # "ch4":I
    .end local v6    # "ch5":I
    .end local v7    # "ch6":I
    .end local v8    # "ch7":I
    .end local v9    # "ch8":I
    :cond_3
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1
.end method

.method public readShort()S
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 170
    iget v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    add-int/lit8 v0, v0, 0x2

    iput v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    .line 171
    iget v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    iget v1, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mLength:I

    if-gt v0, v1, :cond_3

    .line 174
    iget-object v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v0}, Ljava/io/DataInputStream;->read()I

    move-result v0

    .line 175
    .local v0, "ch1":I
    iget-object v1, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v1}, Ljava/io/DataInputStream;->read()I

    move-result v1

    .line 176
    .local v1, "ch2":I
    or-int v2, v0, v1

    if-ltz v2, :cond_2

    .line 179
    iget-object v2, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mByteOrder:Ljava/nio/ByteOrder;

    sget-object v3, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v2, v3, :cond_0

    .line 180
    shl-int/lit8 v2, v1, 0x8

    add-int/2addr v2, v0

    int-to-short v2, v2

    return v2

    .line 181
    :cond_0
    iget-object v2, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mByteOrder:Ljava/nio/ByteOrder;

    sget-object v3, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v2, v3, :cond_1

    .line 182
    shl-int/lit8 v2, v0, 0x8

    add-int/2addr v2, v1

    int-to-short v2, v2

    return v2

    .line 184
    :cond_1
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid byte order: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mByteOrder:Ljava/nio/ByteOrder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 177
    :cond_2
    new-instance v2, Ljava/io/EOFException;

    invoke-direct {v2}, Ljava/io/EOFException;-><init>()V

    throw v2

    .line 172
    .end local v0    # "ch1":I
    .end local v1    # "ch2":I
    :cond_3
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0
.end method

.method public readUTF()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 129
    iget v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    add-int/lit8 v0, v0, 0x2

    iput v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    .line 130
    iget-object v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public readUnsignedByte()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 106
    iget v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    .line 107
    iget-object v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v0

    return v0
.end method

.method public readUnsignedInt()J
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 239
    invoke-virtual {p0}, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->readInt()I

    move-result v0

    int-to-long v0, v0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    return-wide v0
.end method

.method public readUnsignedShort()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 221
    iget v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    add-int/lit8 v0, v0, 0x2

    iput v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    .line 222
    iget v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    iget v1, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mLength:I

    if-gt v0, v1, :cond_3

    .line 225
    iget-object v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v0}, Ljava/io/DataInputStream;->read()I

    move-result v0

    .line 226
    .local v0, "ch1":I
    iget-object v1, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v1}, Ljava/io/DataInputStream;->read()I

    move-result v1

    .line 227
    .local v1, "ch2":I
    or-int v2, v0, v1

    if-ltz v2, :cond_2

    .line 230
    iget-object v2, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mByteOrder:Ljava/nio/ByteOrder;

    sget-object v3, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v2, v3, :cond_0

    .line 231
    shl-int/lit8 v2, v1, 0x8

    add-int/2addr v2, v0

    return v2

    .line 232
    :cond_0
    iget-object v2, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mByteOrder:Ljava/nio/ByteOrder;

    sget-object v3, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v2, v3, :cond_1

    .line 233
    shl-int/lit8 v2, v0, 0x8

    add-int/2addr v2, v1

    return v2

    .line 235
    :cond_1
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid byte order: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mByteOrder:Ljava/nio/ByteOrder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 228
    :cond_2
    new-instance v2, Ljava/io/EOFException;

    invoke-direct {v2}, Ljava/io/EOFException;-><init>()V

    throw v2

    .line 223
    .end local v0    # "ch1":I
    .end local v1    # "ch2":I
    :cond_3
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0
.end method

.method public seek(J)V
    .locals 2
    .param p1, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 68
    iget v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    int-to-long v0, v0

    cmp-long v0, v0, p1

    if-lez v0, :cond_0

    .line 69
    const/4 v0, 0x0

    iput v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    .line 70
    iget-object v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v0}, Ljava/io/DataInputStream;->reset()V

    .line 72
    iget-object v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    iget v1, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mLength:I

    invoke-virtual {v0, v1}, Ljava/io/DataInputStream;->mark(I)V

    goto :goto_0

    .line 74
    :cond_0
    iget v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    int-to-long v0, v0

    sub-long/2addr p1, v0

    .line 77
    :goto_0
    long-to-int v0, p1

    invoke-virtual {p0, v0}, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->skipBytes(I)I

    move-result v0

    long-to-int v1, p1

    if-ne v0, v1, :cond_1

    .line 80
    return-void

    .line 78
    :cond_1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Couldn\'t seek up to the byteCount"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setByteOrder(Ljava/nio/ByteOrder;)V
    .locals 0
    .param p1, "byteOrder"    # Ljava/nio/ByteOrder;

    .line 64
    iput-object p1, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mByteOrder:Ljava/nio/ByteOrder;

    .line 65
    return-void
.end method

.method public skipBytes(I)I
    .locals 4
    .param p1, "byteCount"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 210
    iget v0, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mLength:I

    iget v1, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    sub-int/2addr v0, v1

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 211
    .local v0, "totalSkip":I
    const/4 v1, 0x0

    .line 212
    .local v1, "skipped":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 213
    iget-object v2, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mDataInputStream:Ljava/io/DataInputStream;

    sub-int v3, v0, v1

    invoke-virtual {v2, v3}, Ljava/io/DataInputStream;->skipBytes(I)I

    move-result v2

    add-int/2addr v1, v2

    goto :goto_0

    .line 215
    :cond_0
    iget v2, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    add-int/2addr v2, v1

    iput v2, p0, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->mPosition:I

    .line 216
    return v1
.end method
