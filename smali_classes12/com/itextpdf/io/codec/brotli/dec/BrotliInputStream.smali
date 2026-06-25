.class public Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;
.super Ljava/io/InputStream;
.source "BrotliInputStream.java"


# static fields
.field public static final DEFAULT_INTERNAL_BUFFER_SIZE:I = 0x4000


# instance fields
.field private buffer:[B

.field private bufferOffset:I

.field private remainingBufferBytes:I

.field private final state:Lcom/itextpdf/io/codec/brotli/dec/State;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 2
    .param p1, "source"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 53
    const/16 v0, 0x4000

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;-><init>(Ljava/io/InputStream;I[B)V

    .line 54
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;I)V
    .locals 1
    .param p1, "source"    # Ljava/io/InputStream;
    .param p2, "byteReadBufferSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 70
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;-><init>(Ljava/io/InputStream;I[B)V

    .line 71
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;I[B)V
    .locals 3
    .param p1, "source"    # Ljava/io/InputStream;
    .param p2, "byteReadBufferSize"    # I
    .param p3, "customDictionary"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 88
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 39
    new-instance v0, Lcom/itextpdf/io/codec/brotli/dec/State;

    invoke-direct {v0}, Lcom/itextpdf/io/codec/brotli/dec/State;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;->state:Lcom/itextpdf/io/codec/brotli/dec/State;

    .line 89
    if-lez p2, :cond_2

    .line 91
    if-eqz p1, :cond_1

    .line 94
    new-array v0, p2, [B

    iput-object v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;->buffer:[B

    .line 95
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;->remainingBufferBytes:I

    .line 96
    iput v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;->bufferOffset:I

    .line 98
    :try_start_0
    iget-object v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;->state:Lcom/itextpdf/io/codec/brotli/dec/State;

    invoke-static {v0, p1}, Lcom/itextpdf/io/codec/brotli/dec/State;->setInput(Lcom/itextpdf/io/codec/brotli/dec/State;Ljava/io/InputStream;)V
    :try_end_0
    .catch Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 101
    nop

    .line 102
    if-eqz p3, :cond_0

    .line 103
    iget-object v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;->state:Lcom/itextpdf/io/codec/brotli/dec/State;

    invoke-static {v0, p3}, Lcom/itextpdf/io/codec/brotli/dec/Decode;->setCustomDictionary(Lcom/itextpdf/io/codec/brotli/dec/State;[B)V

    .line 105
    :cond_0
    return-void

    .line 99
    :catch_0
    move-exception v0

    .line 100
    .local v0, "ex":Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Brotli decoder initialization failed"

    invoke-direct {v1, v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 92
    .end local v0    # "ex":Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "source is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 90
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bad buffer size:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 112
    iget-object v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;->state:Lcom/itextpdf/io/codec/brotli/dec/State;

    invoke-static {v0}, Lcom/itextpdf/io/codec/brotli/dec/State;->close(Lcom/itextpdf/io/codec/brotli/dec/State;)V

    .line 113
    return-void
.end method

.method public read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 120
    iget v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;->bufferOffset:I

    iget v1, p0, Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;->remainingBufferBytes:I

    if-lt v0, v1, :cond_0

    .line 121
    iget-object v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;->buffer:[B

    iget-object v1, p0, Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;->buffer:[B

    array-length v1, v1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2, v1}, Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;->read([BII)I

    move-result v0

    iput v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;->remainingBufferBytes:I

    .line 122
    iput v2, p0, Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;->bufferOffset:I

    .line 123
    iget v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;->remainingBufferBytes:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 124
    return v1

    .line 127
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;->buffer:[B

    iget v1, p0, Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;->bufferOffset:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;->bufferOffset:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    return v0
.end method

.method public read([BII)I
    .locals 4
    .param p1, "destBuffer"    # [B
    .param p2, "destOffset"    # I
    .param p3, "destLen"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 135
    if-ltz p2, :cond_5

    .line 137
    if-ltz p3, :cond_4

    .line 139
    add-int v0, p2, p3

    array-length v1, p1

    if-gt v0, v1, :cond_3

    .line 142
    const/4 v0, 0x0

    if-nez p3, :cond_0

    .line 143
    return v0

    .line 145
    :cond_0
    iget v1, p0, Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;->remainingBufferBytes:I

    iget v2, p0, Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;->bufferOffset:I

    sub-int/2addr v1, v2

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 146
    .local v1, "copyLen":I
    if-eqz v1, :cond_1

    .line 147
    invoke-static {v1, p3}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 148
    iget-object v2, p0, Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;->buffer:[B

    iget v3, p0, Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;->bufferOffset:I

    invoke-static {v2, v3, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 149
    iget v2, p0, Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;->bufferOffset:I

    add-int/2addr v2, v1

    iput v2, p0, Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;->bufferOffset:I

    .line 150
    add-int/2addr p2, v1

    .line 151
    sub-int/2addr p3, v1

    .line 152
    if-nez p3, :cond_1

    .line 153
    return v1

    .line 157
    :cond_1
    :try_start_0
    iget-object v2, p0, Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;->state:Lcom/itextpdf/io/codec/brotli/dec/State;

    iput-object p1, v2, Lcom/itextpdf/io/codec/brotli/dec/State;->output:[B

    .line 158
    iget-object v2, p0, Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;->state:Lcom/itextpdf/io/codec/brotli/dec/State;

    iput p2, v2, Lcom/itextpdf/io/codec/brotli/dec/State;->outputOffset:I

    .line 159
    iget-object v2, p0, Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;->state:Lcom/itextpdf/io/codec/brotli/dec/State;

    iput p3, v2, Lcom/itextpdf/io/codec/brotli/dec/State;->outputLength:I

    .line 160
    iget-object v2, p0, Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;->state:Lcom/itextpdf/io/codec/brotli/dec/State;

    iput v0, v2, Lcom/itextpdf/io/codec/brotli/dec/State;->outputUsed:I

    .line 161
    iget-object v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;->state:Lcom/itextpdf/io/codec/brotli/dec/State;

    invoke-static {v0}, Lcom/itextpdf/io/codec/brotli/dec/Decode;->decompress(Lcom/itextpdf/io/codec/brotli/dec/State;)V

    .line 162
    iget-object v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;->state:Lcom/itextpdf/io/codec/brotli/dec/State;

    iget v0, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->outputUsed:I

    if-nez v0, :cond_2

    .line 163
    const/4 v0, -0x1

    return v0

    .line 165
    :cond_2
    iget-object v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BrotliInputStream;->state:Lcom/itextpdf/io/codec/brotli/dec/State;

    iget v0, v0, Lcom/itextpdf/io/codec/brotli/dec/State;->outputUsed:I
    :try_end_0
    .catch Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/2addr v0, v1

    return v0

    .line 166
    :catch_0
    move-exception v0

    .line 167
    .local v0, "ex":Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Brotli stream decoding failed"

    invoke-direct {v2, v3, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 140
    .end local v0    # "ex":Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;
    .end local v1    # "copyLen":I
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Buffer overflow: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    add-int v2, p2, p3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " > "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    array-length v2, p1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 138
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bad length: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 136
    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bad offset: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
