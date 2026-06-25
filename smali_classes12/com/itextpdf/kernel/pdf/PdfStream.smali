.class public Lcom/itextpdf/kernel/pdf/PdfStream;
.super Lcom/itextpdf/kernel/pdf/PdfDictionary;
.source "PdfStream.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field protected compressionLevel:I

.field private inputStream:Ljava/io/InputStream;

.field private length:I

.field private offset:J

.field protected outputStream:Lcom/itextpdf/kernel/pdf/PdfOutputStream;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 39
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 140
    const/4 v0, 0x0

    move-object v1, v0

    check-cast v1, [B

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfStream;-><init>([B)V

    .line 141
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "compressionLevel"    # I

    .line 133
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/PdfStream;-><init>([BI)V

    .line 134
    return-void
.end method

.method constructor <init>(JLcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 2
    .param p1, "offset"    # J
    .param p3, "keys"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 151
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 47
    const/4 v0, -0x1

    iput v0, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->length:I

    .line 152
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->compressionLevel:I

    .line 153
    iput-wide p1, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->offset:J

    .line 154
    invoke-virtual {p0, p3}, Lcom/itextpdf/kernel/pdf/PdfStream;->putAll(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 155
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Length:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    .line 156
    .local v0, "length":Lcom/itextpdf/kernel/pdf/PdfNumber;
    if-nez v0, :cond_0

    .line 157
    const/4 v1, 0x0

    iput v1, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->length:I

    goto :goto_0

    .line 159
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v1

    iput v1, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->length:I

    .line 161
    :goto_0
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/io/InputStream;)V
    .locals 1
    .param p1, "doc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "inputStream"    # Ljava/io/InputStream;

    .line 124
    const/high16 v0, -0x80000000

    invoke-direct {p0, p1, p2, v0}, Lcom/itextpdf/kernel/pdf/PdfStream;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/io/InputStream;I)V

    .line 125
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/io/InputStream;I)V
    .locals 3
    .param p1, "doc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "inputStream"    # Ljava/io/InputStream;
    .param p3, "compressionLevel"    # I

    .line 94
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 47
    const/4 v0, -0x1

    iput v0, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->length:I

    .line 95
    if-eqz p1, :cond_1

    .line 99
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfStream;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 100
    if-eqz p2, :cond_0

    .line 103
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->inputStream:Ljava/io/InputStream;

    .line 104
    iput p3, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->compressionLevel:I

    .line 105
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Length:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v2, v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfNumber;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 106
    return-void

    .line 101
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The input stream in PdfStream constructor can not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 96
    :cond_1
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Cannot create pdfstream by InputStream without PdfDocument."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected constructor <init>(Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "outputStream"    # Ljava/io/OutputStream;

    .line 143
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 47
    const/4 v0, -0x1

    iput v0, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->length:I

    .line 144
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->outputStream:Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 145
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->compressionLevel:I

    .line 146
    const/16 v0, 0x40

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->setState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 147
    return-void
.end method

.method public constructor <init>([B)V
    .locals 1
    .param p1, "bytes"    # [B

    .line 73
    const/high16 v0, -0x80000000

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfStream;-><init>([BI)V

    .line 74
    return-void
.end method

.method public constructor <init>([BI)V
    .locals 3
    .param p1, "bytes"    # [B
    .param p2, "compressionLevel"    # I

    .line 56
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 47
    const/4 v0, -0x1

    iput v0, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->length:I

    .line 57
    const/16 v0, 0x40

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->setState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 58
    iput p2, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->compressionLevel:I

    .line 59
    if-eqz p1, :cond_0

    array-length v0, p1

    if-lez v0, :cond_0

    .line 60
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    new-instance v1, Lcom/itextpdf/io/source/ByteArrayOutputStream;

    array-length v2, p1

    invoke-direct {v1, v2}, Lcom/itextpdf/io/source/ByteArrayOutputStream;-><init>(I)V

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->outputStream:Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 61
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->outputStream:Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    goto :goto_0

    .line 63
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    new-instance v1, Lcom/itextpdf/io/source/ByteArrayOutputStream;

    invoke-direct {v1}, Lcom/itextpdf/io/source/ByteArrayOutputStream;-><init>()V

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->outputStream:Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 65
    :goto_0
    return-void
.end method


# virtual methods
.method protected copyContent(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 1
    .param p1, "from"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p2, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 348
    invoke-static {}, Lcom/itextpdf/kernel/utils/NullCopyFilter;->getInstance()Lcom/itextpdf/kernel/utils/NullCopyFilter;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->copyContent(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/utils/ICopyFilter;)V

    .line 349
    return-void
.end method

.method protected copyContent(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/utils/ICopyFilter;)V
    .locals 5
    .param p1, "from"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p2, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p3, "copyFilter"    # Lcom/itextpdf/kernel/utils/ICopyFilter;

    .line 353
    invoke-super {p0, p1, p2, p3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->copyContent(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/utils/ICopyFilter;)V

    .line 354
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 355
    .local v0, "stream":Lcom/itextpdf/kernel/pdf/PdfStream;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->inputStream:Ljava/io/InputStream;

    if-nez v1, :cond_0

    .line 356
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getBytes(Z)[B

    move-result-object v1

    .line 358
    .local v1, "bytes":[B
    :try_start_0
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->outputStream:Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 361
    nop

    .line 362
    return-void

    .line 359
    :catch_0
    move-exception v2

    .line 360
    .local v2, "ioe":Ljava/io/IOException;
    new-instance v3, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v4, "Cannot copy object content."

    invoke-direct {v3, v4, v2, v0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/Object;)V

    throw v3

    .line 355
    .end local v1    # "bytes":[B
    .end local v2    # "ioe":Ljava/io/IOException;
    :cond_0
    new-instance v1, Ljava/lang/AssertionError;

    const-string v2, "Try to copy the PdfStream that has been just created."

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public getBytes()[B
    .locals 1

    .line 209
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getBytes(Z)[B

    move-result-object v0

    return-object v0
.end method

.method public getBytes(Z)[B
    .locals 5
    .param p1, "decoded"    # Z

    .line 221
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfStream;->isFlushed()Z

    move-result v0

    if-nez v0, :cond_5

    .line 224
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->inputStream:Ljava/io/InputStream;

    if-eqz v0, :cond_0

    .line 225
    const-class v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    const-string v1, "PdfStream was created by InputStream.getBytes() always returns null in this case"

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 227
    const/4 v0, 0x0

    return-object v0

    .line 229
    :cond_0
    const/4 v0, 0x0

    .line 230
    .local v0, "bytes":[B
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->outputStream:Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    const-string v2, "Cannot get PdfStream bytes."

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->outputStream:Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 231
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->outputStream:Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    instance-of v1, v1, Lcom/itextpdf/io/source/ByteArrayOutputStream;

    if-eqz v1, :cond_2

    .line 234
    :try_start_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->outputStream:Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V

    .line 235
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->outputStream:Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/io/source/ByteArrayOutputStream;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    move-object v0, v1

    .line 236
    if-eqz p1, :cond_1

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Filter:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 237
    invoke-static {v0, p0}, Lcom/itextpdf/kernel/pdf/PdfReader;->decodeBytes([BLcom/itextpdf/kernel/pdf/PdfDictionary;)[B

    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    .line 241
    :cond_1
    goto :goto_0

    .line 239
    :catch_0
    move-exception v1

    .line 240
    .local v1, "ioe":Ljava/io/IOException;
    new-instance v3, Lcom/itextpdf/kernel/exceptions/PdfException;

    invoke-direct {v3, v2, v1, p0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/Object;)V

    throw v3

    .line 231
    .end local v1    # "ioe":Ljava/io/IOException;
    :cond_2
    new-instance v1, Ljava/lang/AssertionError;

    const-string v2, "Invalid OutputStream: ByteArrayByteArrayOutputStream expected"

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 242
    :cond_3
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 245
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getReader()Lcom/itextpdf/kernel/pdf/PdfReader;

    move-result-object v1

    .line 246
    .local v1, "reader":Lcom/itextpdf/kernel/pdf/PdfReader;
    if-eqz v1, :cond_4

    .line 248
    :try_start_1
    invoke-virtual {v1, p0, p1}, Lcom/itextpdf/kernel/pdf/PdfReader;->readStreamBytes(Lcom/itextpdf/kernel/pdf/PdfStream;Z)[B

    move-result-object v2
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-object v0, v2

    .line 251
    goto :goto_0

    .line 249
    :catch_1
    move-exception v3

    .line 250
    .local v3, "ioe":Ljava/io/IOException;
    new-instance v4, Lcom/itextpdf/kernel/exceptions/PdfException;

    invoke-direct {v4, v2, v3, p0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/Object;)V

    throw v4

    .line 254
    .end local v1    # "reader":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v3    # "ioe":Ljava/io/IOException;
    :cond_4
    :goto_0
    return-object v0

    .line 222
    .end local v0    # "bytes":[B
    :cond_5
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Cannot operate with the flushed PdfStream."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getCompressionLevel()I
    .locals 1

    .line 179
    iget v0, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->compressionLevel:I

    return v0
.end method

.method protected getInputStream()Ljava/io/InputStream;
    .locals 1

    .line 385
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->inputStream:Ljava/io/InputStream;

    return-object v0
.end method

.method public getLength()I
    .locals 1

    .line 198
    iget v0, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->length:I

    return v0
.end method

.method protected getOffset()J
    .locals 2

    .line 333
    iget-wide v0, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->offset:J

    return-wide v0
.end method

.method public getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;
    .locals 1

    .line 169
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->outputStream:Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    return-object v0
.end method

.method public getType()B
    .locals 1

    .line 194
    const/16 v0, 0x9

    return v0
.end method

.method protected initOutputStream(Ljava/io/OutputStream;)V
    .locals 2
    .param p1, "stream"    # Ljava/io/OutputStream;

    .line 365
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->inputStream:Ljava/io/InputStream;

    if-nez v0, :cond_1

    .line 366
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    if-eqz p1, :cond_0

    move-object v1, p1

    goto :goto_0

    :cond_0
    new-instance v1, Lcom/itextpdf/io/source/ByteArrayOutputStream;

    invoke-direct {v1}, Lcom/itextpdf/io/source/ByteArrayOutputStream;-><init>()V

    :goto_0
    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->outputStream:Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 367
    :cond_1
    return-void
.end method

.method protected newInstance()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1

    .line 329
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;-><init>()V

    return-object v0
.end method

.method protected releaseContent()V
    .locals 3

    .line 373
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->releaseContent()V

    .line 375
    :try_start_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->outputStream:Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    if-eqz v0, :cond_0

    .line 376
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->outputStream:Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->close()V

    .line 377
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->outputStream:Lcom/itextpdf/kernel/pdf/PdfOutputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 381
    :cond_0
    nop

    .line 382
    return-void

    .line 379
    :catch_0
    move-exception v0

    .line 380
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "I/O exception."

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public setCompressionLevel(I)V
    .locals 0
    .param p1, "compressionLevel"    # I

    .line 189
    iput p1, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->compressionLevel:I

    .line 190
    return-void
.end method

.method public setData([B)V
    .locals 1
    .param p1, "bytes"    # [B

    .line 264
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->setData([BZ)V

    .line 265
    return-void
.end method

.method public setData([BZ)V
    .locals 4
    .param p1, "bytes"    # [B
    .param p2, "append"    # Z

    .line 280
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfStream;->isFlushed()Z

    move-result v0

    if-nez v0, :cond_9

    .line 283
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->inputStream:Ljava/io/InputStream;

    if-nez v0, :cond_8

    .line 288
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->outputStream:Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 289
    .local v0, "outputStreamIsUninitialized":Z
    :goto_0
    if-eqz v0, :cond_1

    .line 290
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    new-instance v2, Lcom/itextpdf/io/source/ByteArrayOutputStream;

    invoke-direct {v2}, Lcom/itextpdf/io/source/ByteArrayOutputStream;-><init>()V

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->outputStream:Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 293
    :cond_1
    if-eqz p2, :cond_5

    .line 294
    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getReader()Lcom/itextpdf/kernel/pdf/PdfReader;

    move-result-object v1

    if-nez v1, :cond_3

    :cond_2
    if-nez v0, :cond_4

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Filter:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 295
    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 301
    :cond_3
    :try_start_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getBytes()[B

    move-result-object v1
    :try_end_0
    .catch Lcom/itextpdf/kernel/exceptions/PdfException; {:try_start_0 .. :try_end_0} :catch_0

    .line 305
    .local v1, "oldBytes":[B
    nop

    .line 306
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->outputStream:Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    array-length v3, v1

    invoke-virtual {v2, v1, v3}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->assignBytes([BI)V

    goto :goto_1

    .line 302
    .end local v1    # "oldBytes":[B
    :catch_0
    move-exception v1

    .line 303
    .local v1, "ex":Lcom/itextpdf/kernel/exceptions/PdfException;
    new-instance v2, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v3, "Cannot read a stream in order to append new bytes."

    invoke-direct {v2, v3, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 309
    .end local v1    # "ex":Lcom/itextpdf/kernel/exceptions/PdfException;
    :cond_4
    :goto_1
    if-eqz p1, :cond_7

    .line 310
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->outputStream:Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    goto :goto_2

    .line 313
    :cond_5
    nop

    .line 316
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->outputStream:Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 313
    if-eqz p1, :cond_6

    .line 314
    array-length v2, p1

    invoke-virtual {v1, p1, v2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->assignBytes([BI)V

    goto :goto_2

    .line 316
    :cond_6
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->reset()V

    .line 320
    :cond_7
    :goto_2
    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->offset:J

    .line 323
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Filter:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 324
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->DecodeParms:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 325
    return-void

    .line 284
    .end local v0    # "outputStreamIsUninitialized":Z
    :cond_8
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Cannot set data to PdfStream which was created by InputStream."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 281
    :cond_9
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Cannot operate with the flushed PdfStream."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected updateLength(I)V
    .locals 0
    .param p1, "length"    # I

    .line 343
    iput p1, p0, Lcom/itextpdf/kernel/pdf/PdfStream;->length:I

    .line 344
    return-void
.end method
