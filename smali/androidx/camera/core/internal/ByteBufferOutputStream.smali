.class public final Landroidx/camera/core/internal/ByteBufferOutputStream;
.super Ljava/io/OutputStream;
.source "ByteBufferOutputStream.java"


# instance fields
.field private final mByteBuffer:Ljava/nio/ByteBuffer;


# direct methods
.method public constructor <init>(Ljava/nio/ByteBuffer;)V
    .locals 0
    .param p1, "buf"    # Ljava/nio/ByteBuffer;

    .line 35
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 36
    iput-object p1, p0, Landroidx/camera/core/internal/ByteBufferOutputStream;->mByteBuffer:Ljava/nio/ByteBuffer;

    .line 37
    return-void
.end method


# virtual methods
.method public write(I)V
    .locals 2
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 41
    iget-object v0, p0, Landroidx/camera/core/internal/ByteBufferOutputStream;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 45
    iget-object v0, p0, Landroidx/camera/core/internal/ByteBufferOutputStream;->mByteBuffer:Ljava/nio/ByteBuffer;

    int-to-byte v1, p1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 46
    return-void

    .line 42
    :cond_0
    new-instance v0, Ljava/io/EOFException;

    const-string/jumbo v1, "Output ByteBuffer has no bytes remaining."

    invoke-direct {v0, v1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public write([BII)V
    .locals 2
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 50
    if-eqz p1, :cond_3

    .line 52
    if-ltz p2, :cond_2

    array-length v0, p1

    if-gt p2, v0, :cond_2

    if-ltz p3, :cond_2

    add-int v0, p2, p3

    array-length v1, p1

    if-gt v0, v1, :cond_2

    add-int v0, p2, p3

    if-ltz v0, :cond_2

    .line 55
    if-nez p3, :cond_0

    .line 56
    return-void

    .line 57
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/internal/ByteBufferOutputStream;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    if-lt v0, p3, :cond_1

    .line 61
    iget-object v0, p0, Landroidx/camera/core/internal/ByteBufferOutputStream;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1, p2, p3}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 62
    return-void

    .line 58
    :cond_1
    new-instance v0, Ljava/io/EOFException;

    const-string/jumbo v1, "Output ByteBuffer has insufficient bytes remaining."

    invoke-direct {v0, v1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 54
    :cond_2
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 51
    :cond_3
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0
.end method
