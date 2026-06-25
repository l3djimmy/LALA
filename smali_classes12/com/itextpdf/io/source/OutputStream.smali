.class public Lcom/itextpdf/io/source/OutputStream;
.super Ljava/io/OutputStream;
.source "OutputStream.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/io/OutputStream;",
        ">",
        "Ljava/io/OutputStream;"
    }
.end annotation


# instance fields
.field protected closeStream:Z

.field protected currentPos:J

.field private localHighPrecision:Ljava/lang/Boolean;

.field private final numBuffer:Lcom/itextpdf/io/source/ByteBuffer;

.field protected outputStream:Ljava/io/OutputStream;


# direct methods
.method protected constructor <init>()V
    .locals 2

    .line 93
    .local p0, "this":Lcom/itextpdf/io/source/OutputStream;, "Lcom/itextpdf/io/source/OutputStream<TT;>;"
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 33
    new-instance v0, Lcom/itextpdf/io/source/ByteBuffer;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Lcom/itextpdf/io/source/ByteBuffer;-><init>(I)V

    iput-object v0, p0, Lcom/itextpdf/io/source/OutputStream;->numBuffer:Lcom/itextpdf/io/source/ByteBuffer;

    .line 35
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/io/source/OutputStream;->outputStream:Ljava/io/OutputStream;

    .line 36
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/itextpdf/io/source/OutputStream;->currentPos:J

    .line 37
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/io/source/OutputStream;->closeStream:Z

    .line 94
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 2
    .param p1, "outputStream"    # Ljava/io/OutputStream;

    .line 85
    .local p0, "this":Lcom/itextpdf/io/source/OutputStream;, "Lcom/itextpdf/io/source/OutputStream<TT;>;"
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 33
    new-instance v0, Lcom/itextpdf/io/source/ByteBuffer;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Lcom/itextpdf/io/source/ByteBuffer;-><init>(I)V

    iput-object v0, p0, Lcom/itextpdf/io/source/OutputStream;->numBuffer:Lcom/itextpdf/io/source/ByteBuffer;

    .line 35
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/io/source/OutputStream;->outputStream:Ljava/io/OutputStream;

    .line 36
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/itextpdf/io/source/OutputStream;->currentPos:J

    .line 37
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/io/source/OutputStream;->closeStream:Z

    .line 86
    iput-object p1, p0, Lcom/itextpdf/io/source/OutputStream;->outputStream:Ljava/io/OutputStream;

    .line 87
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;Z)V
    .locals 2
    .param p1, "outputStream"    # Ljava/io/OutputStream;
    .param p2, "localHighPrecision"    # Z

    .line 107
    .local p0, "this":Lcom/itextpdf/io/source/OutputStream;, "Lcom/itextpdf/io/source/OutputStream<TT;>;"
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 33
    new-instance v0, Lcom/itextpdf/io/source/ByteBuffer;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Lcom/itextpdf/io/source/ByteBuffer;-><init>(I)V

    iput-object v0, p0, Lcom/itextpdf/io/source/OutputStream;->numBuffer:Lcom/itextpdf/io/source/ByteBuffer;

    .line 35
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/io/source/OutputStream;->outputStream:Ljava/io/OutputStream;

    .line 36
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/itextpdf/io/source/OutputStream;->currentPos:J

    .line 37
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/io/source/OutputStream;->closeStream:Z

    .line 108
    iput-object p1, p0, Lcom/itextpdf/io/source/OutputStream;->outputStream:Ljava/io/OutputStream;

    .line 109
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/io/source/OutputStream;->localHighPrecision:Ljava/lang/Boolean;

    .line 110
    return-void
.end method

.method public static getHighPrecision()Z
    .locals 1

    .line 45
    sget-boolean v0, Lcom/itextpdf/io/source/ByteUtils;->HighPrecision:Z

    return v0
.end method

.method public static setHighPrecision(Z)V
    .locals 0
    .param p0, "value"    # Z

    .line 55
    sput-boolean p0, Lcom/itextpdf/io/source/ByteUtils;->HighPrecision:Z

    .line 56
    return-void
.end method


# virtual methods
.method public assignBytes([BI)V
    .locals 2
    .param p1, "bytes"    # [B
    .param p2, "count"    # I

    .line 387
    .local p0, "this":Lcom/itextpdf/io/source/OutputStream;, "Lcom/itextpdf/io/source/OutputStream<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/io/source/OutputStream;->outputStream:Ljava/io/OutputStream;

    instance-of v0, v0, Lcom/itextpdf/io/source/ByteArrayOutputStream;

    if-eqz v0, :cond_0

    .line 388
    iget-object v0, p0, Lcom/itextpdf/io/source/OutputStream;->outputStream:Ljava/io/OutputStream;

    check-cast v0, Lcom/itextpdf/io/source/ByteArrayOutputStream;

    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/io/source/ByteArrayOutputStream;->assignBytes([BI)Lcom/itextpdf/io/source/ByteArrayOutputStream;

    .line 389
    int-to-long v0, p2

    iput-wide v0, p0, Lcom/itextpdf/io/source/OutputStream;->currentPos:J

    .line 393
    return-void

    .line 391
    :cond_0
    new-instance v0, Lcom/itextpdf/io/exceptions/IOException;

    const-string v1, "Bytes can be assigned to ByteArrayOutputStream only."

    invoke-direct {v0, v1}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 152
    .local p0, "this":Lcom/itextpdf/io/source/OutputStream;, "Lcom/itextpdf/io/source/OutputStream<TT;>;"
    iget-boolean v0, p0, Lcom/itextpdf/io/source/OutputStream;->closeStream:Z

    if-eqz v0, :cond_0

    .line 153
    iget-object v0, p0, Lcom/itextpdf/io/source/OutputStream;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 155
    :cond_0
    return-void
.end method

.method public flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 147
    .local p0, "this":Lcom/itextpdf/io/source/OutputStream;, "Lcom/itextpdf/io/source/OutputStream<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/io/source/OutputStream;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 148
    return-void
.end method

.method public getCurrentPos()J
    .locals 2

    .line 349
    .local p0, "this":Lcom/itextpdf/io/source/OutputStream;, "Lcom/itextpdf/io/source/OutputStream<TT;>;"
    iget-wide v0, p0, Lcom/itextpdf/io/source/OutputStream;->currentPos:J

    return-wide v0
.end method

.method public getLocalHighPrecision()Z
    .locals 1

    .line 64
    .local p0, "this":Lcom/itextpdf/io/source/OutputStream;, "Lcom/itextpdf/io/source/OutputStream<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/io/source/OutputStream;->localHighPrecision:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 1

    .line 358
    .local p0, "this":Lcom/itextpdf/io/source/OutputStream;, "Lcom/itextpdf/io/source/OutputStream<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/io/source/OutputStream;->outputStream:Ljava/io/OutputStream;

    return-object v0
.end method

.method public isCloseStream()Z
    .locals 1

    .line 368
    .local p0, "this":Lcom/itextpdf/io/source/OutputStream;, "Lcom/itextpdf/io/source/OutputStream<TT;>;"
    iget-boolean v0, p0, Lcom/itextpdf/io/source/OutputStream;->closeStream:Z

    return v0
.end method

.method public reset()V
    .locals 2

    .line 402
    .local p0, "this":Lcom/itextpdf/io/source/OutputStream;, "Lcom/itextpdf/io/source/OutputStream<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/io/source/OutputStream;->outputStream:Ljava/io/OutputStream;

    instance-of v0, v0, Lcom/itextpdf/io/source/ByteArrayOutputStream;

    if-eqz v0, :cond_0

    .line 403
    iget-object v0, p0, Lcom/itextpdf/io/source/OutputStream;->outputStream:Ljava/io/OutputStream;

    check-cast v0, Lcom/itextpdf/io/source/ByteArrayOutputStream;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/ByteArrayOutputStream;->reset()V

    .line 404
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/itextpdf/io/source/OutputStream;->currentPos:J

    .line 408
    return-void

    .line 406
    :cond_0
    new-instance v0, Lcom/itextpdf/io/exceptions/IOException;

    const-string v1, "Bytes can be reset in ByteArrayOutputStream only."

    invoke-direct {v0, v1}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setCloseStream(Z)V
    .locals 0
    .param p1, "closeStream"    # Z

    .line 377
    .local p0, "this":Lcom/itextpdf/io/source/OutputStream;, "Lcom/itextpdf/io/source/OutputStream<TT;>;"
    iput-boolean p1, p0, Lcom/itextpdf/io/source/OutputStream;->closeStream:Z

    .line 378
    return-void
.end method

.method public setLocalHighPrecision(Z)V
    .locals 1
    .param p1, "value"    # Z

    .line 75
    .local p0, "this":Lcom/itextpdf/io/source/OutputStream;, "Lcom/itextpdf/io/source/OutputStream<TT;>;"
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/io/source/OutputStream;->localHighPrecision:Ljava/lang/Boolean;

    .line 76
    return-void
.end method

.method public write(I)V
    .locals 4
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 114
    .local p0, "this":Lcom/itextpdf/io/source/OutputStream;, "Lcom/itextpdf/io/source/OutputStream<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/io/source/OutputStream;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 115
    iget-wide v0, p0, Lcom/itextpdf/io/source/OutputStream;->currentPos:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/itextpdf/io/source/OutputStream;->currentPos:J

    .line 116
    return-void
.end method

.method public write([B)V
    .locals 4
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 120
    .local p0, "this":Lcom/itextpdf/io/source/OutputStream;, "Lcom/itextpdf/io/source/OutputStream<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/io/source/OutputStream;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write([B)V

    .line 121
    iget-wide v0, p0, Lcom/itextpdf/io/source/OutputStream;->currentPos:J

    array-length v2, p1

    int-to-long v2, v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/itextpdf/io/source/OutputStream;->currentPos:J

    .line 122
    return-void
.end method

.method public write([BII)V
    .locals 4
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 126
    .local p0, "this":Lcom/itextpdf/io/source/OutputStream;, "Lcom/itextpdf/io/source/OutputStream<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/io/source/OutputStream;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 127
    iget-wide v0, p0, Lcom/itextpdf/io/source/OutputStream;->currentPos:J

    int-to-long v2, p3

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/itextpdf/io/source/OutputStream;->currentPos:J

    .line 128
    return-void
.end method

.method public writeByte(I)Ljava/io/OutputStream;
    .locals 3
    .param p1, "value"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .line 269
    .local p0, "this":Lcom/itextpdf/io/source/OutputStream;, "Lcom/itextpdf/io/source/OutputStream<TT;>;"
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/itextpdf/io/source/OutputStream;->write(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 270
    return-object p0

    .line 271
    :catch_0
    move-exception v0

    .line 272
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v2, "Cannot write byte."

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public writeByte(B)V
    .locals 3
    .param p1, "value"    # B

    .line 139
    .local p0, "this":Lcom/itextpdf/io/source/OutputStream;, "Lcom/itextpdf/io/source/OutputStream<TT;>;"
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/itextpdf/io/source/OutputStream;->write(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 142
    nop

    .line 143
    return-void

    .line 140
    :catch_0
    move-exception v0

    .line 141
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v2, "Cannot write byte."

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public writeBytes([B)Ljava/io/OutputStream;
    .locals 3
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B)TT;"
        }
    .end annotation

    .line 316
    .local p0, "this":Lcom/itextpdf/io/source/OutputStream;, "Lcom/itextpdf/io/source/OutputStream<TT;>;"
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/itextpdf/io/source/OutputStream;->write([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 317
    return-object p0

    .line 318
    :catch_0
    move-exception v0

    .line 319
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v2, "Cannot write bytes."

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public writeBytes([BII)Ljava/io/OutputStream;
    .locals 3
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([BII)TT;"
        }
    .end annotation

    .line 336
    .local p0, "this":Lcom/itextpdf/io/source/OutputStream;, "Lcom/itextpdf/io/source/OutputStream<TT;>;"
    :try_start_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/itextpdf/io/source/OutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 337
    return-object p0

    .line 338
    :catch_0
    move-exception v0

    .line 339
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v2, "Cannot write bytes."

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public writeDouble(D)Ljava/io/OutputStream;
    .locals 1
    .param p1, "value"    # D
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(D)TT;"
        }
    .end annotation

    .line 239
    .local p0, "this":Lcom/itextpdf/io/source/OutputStream;, "Lcom/itextpdf/io/source/OutputStream<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/io/source/OutputStream;->localHighPrecision:Ljava/lang/Boolean;

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/itextpdf/io/source/ByteUtils;->HighPrecision:Z

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/source/OutputStream;->localHighPrecision:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    :goto_0
    invoke-virtual {p0, p1, p2, v0}, Lcom/itextpdf/io/source/OutputStream;->writeDouble(DZ)Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method

.method public writeDouble(DZ)Ljava/io/OutputStream;
    .locals 3
    .param p1, "value"    # D
    .param p3, "highPrecision"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(DZ)TT;"
        }
    .end annotation

    .line 252
    .local p0, "this":Lcom/itextpdf/io/source/OutputStream;, "Lcom/itextpdf/io/source/OutputStream<TT;>;"
    :try_start_0
    iget-object v0, p0, Lcom/itextpdf/io/source/OutputStream;->numBuffer:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/ByteBuffer;->reset()Lcom/itextpdf/io/source/ByteBuffer;

    move-result-object v0

    invoke-static {p1, p2, v0, p3}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(DLcom/itextpdf/io/source/ByteBuffer;Z)[B

    .line 253
    iget-object v0, p0, Lcom/itextpdf/io/source/OutputStream;->numBuffer:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/ByteBuffer;->getInternalBuffer()[B

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/io/source/OutputStream;->numBuffer:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/ByteBuffer;->capacity()I

    move-result v1

    iget-object v2, p0, Lcom/itextpdf/io/source/OutputStream;->numBuffer:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/ByteBuffer;->size()I

    move-result v2

    sub-int/2addr v1, v2

    iget-object v2, p0, Lcom/itextpdf/io/source/OutputStream;->numBuffer:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/ByteBuffer;->size()I

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/itextpdf/io/source/OutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 254
    return-object p0

    .line 255
    :catch_0
    move-exception v0

    .line 256
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v2, "Cannot write float number."

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public writeFloat(F)Ljava/io/OutputStream;
    .locals 1
    .param p1, "value"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation

    .line 199
    .local p0, "this":Lcom/itextpdf/io/source/OutputStream;, "Lcom/itextpdf/io/source/OutputStream<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/io/source/OutputStream;->localHighPrecision:Ljava/lang/Boolean;

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/itextpdf/io/source/ByteUtils;->HighPrecision:Z

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/source/OutputStream;->localHighPrecision:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    :goto_0
    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/io/source/OutputStream;->writeFloat(FZ)Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method

.method public writeFloat(FZ)Ljava/io/OutputStream;
    .locals 2
    .param p1, "value"    # F
    .param p2, "highPrecision"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FZ)TT;"
        }
    .end annotation

    .line 211
    .local p0, "this":Lcom/itextpdf/io/source/OutputStream;, "Lcom/itextpdf/io/source/OutputStream<TT;>;"
    float-to-double v0, p1

    invoke-virtual {p0, v0, v1, p2}, Lcom/itextpdf/io/source/OutputStream;->writeDouble(DZ)Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method

.method public writeFloats([F)Ljava/io/OutputStream;
    .locals 2
    .param p1, "value"    # [F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([F)TT;"
        }
    .end annotation

    .line 222
    .local p0, "this":Lcom/itextpdf/io/source/OutputStream;, "Lcom/itextpdf/io/source/OutputStream<TT;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_1

    .line 223
    aget v1, p1, v0

    invoke-virtual {p0, v1}, Lcom/itextpdf/io/source/OutputStream;->writeFloat(F)Ljava/io/OutputStream;

    .line 224
    array-length v1, p1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_0

    .line 225
    invoke-virtual {p0}, Lcom/itextpdf/io/source/OutputStream;->writeSpace()Ljava/io/OutputStream;

    .line 222
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 228
    .end local v0    # "i":I
    :cond_1
    return-object p0
.end method

.method public writeInteger(I)Ljava/io/OutputStream;
    .locals 3
    .param p1, "value"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .line 183
    .local p0, "this":Lcom/itextpdf/io/source/OutputStream;, "Lcom/itextpdf/io/source/OutputStream<TT;>;"
    :try_start_0
    iget-object v0, p0, Lcom/itextpdf/io/source/OutputStream;->numBuffer:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/ByteBuffer;->reset()Lcom/itextpdf/io/source/ByteBuffer;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(ILcom/itextpdf/io/source/ByteBuffer;)[B

    .line 184
    iget-object v0, p0, Lcom/itextpdf/io/source/OutputStream;->numBuffer:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/ByteBuffer;->getInternalBuffer()[B

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/io/source/OutputStream;->numBuffer:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/ByteBuffer;->capacity()I

    move-result v1

    iget-object v2, p0, Lcom/itextpdf/io/source/OutputStream;->numBuffer:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/ByteBuffer;->size()I

    move-result v2

    sub-int/2addr v1, v2

    iget-object v2, p0, Lcom/itextpdf/io/source/OutputStream;->numBuffer:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/ByteBuffer;->size()I

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/itextpdf/io/source/OutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 185
    return-object p0

    .line 186
    :catch_0
    move-exception v0

    .line 187
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v2, "Cannot write int number."

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public writeLong(J)Ljava/io/OutputStream;
    .locals 3
    .param p1, "value"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)TT;"
        }
    .end annotation

    .line 166
    .local p0, "this":Lcom/itextpdf/io/source/OutputStream;, "Lcom/itextpdf/io/source/OutputStream<TT;>;"
    long-to-double v0, p1

    :try_start_0
    iget-object v2, p0, Lcom/itextpdf/io/source/OutputStream;->numBuffer:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/ByteBuffer;->reset()Lcom/itextpdf/io/source/ByteBuffer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(DLcom/itextpdf/io/source/ByteBuffer;)[B

    .line 167
    iget-object v0, p0, Lcom/itextpdf/io/source/OutputStream;->numBuffer:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/ByteBuffer;->getInternalBuffer()[B

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/io/source/OutputStream;->numBuffer:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/ByteBuffer;->capacity()I

    move-result v1

    iget-object v2, p0, Lcom/itextpdf/io/source/OutputStream;->numBuffer:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/ByteBuffer;->size()I

    move-result v2

    sub-int/2addr v1, v2

    iget-object v2, p0, Lcom/itextpdf/io/source/OutputStream;->numBuffer:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/ByteBuffer;->size()I

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/itextpdf/io/source/OutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 168
    return-object p0

    .line 169
    :catch_0
    move-exception v0

    .line 170
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v2, "Cannot write int number."

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public writeNewLine()Ljava/io/OutputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 291
    .local p0, "this":Lcom/itextpdf/io/source/OutputStream;, "Lcom/itextpdf/io/source/OutputStream<TT;>;"
    const/16 v0, 0xa

    invoke-virtual {p0, v0}, Lcom/itextpdf/io/source/OutputStream;->writeByte(I)Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method

.method public writeSpace()Ljava/io/OutputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 282
    .local p0, "this":Lcom/itextpdf/io/source/OutputStream;, "Lcom/itextpdf/io/source/OutputStream<TT;>;"
    const/16 v0, 0x20

    invoke-virtual {p0, v0}, Lcom/itextpdf/io/source/OutputStream;->writeByte(I)Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method

.method public writeString(Ljava/lang/String;)Ljava/io/OutputStream;
    .locals 1
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .line 302
    .local p0, "this":Lcom/itextpdf/io/source/OutputStream;, "Lcom/itextpdf/io/source/OutputStream<TT;>;"
    invoke-static {p1}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/io/source/OutputStream;->writeBytes([B)Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method
