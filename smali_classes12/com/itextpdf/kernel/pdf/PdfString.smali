.class public Lcom/itextpdf/kernel/pdf/PdfString;
.super Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;
.source "PdfString.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private decryptInfoGen:I

.field private decryptInfoNum:I

.field private decryption:Lcom/itextpdf/kernel/pdf/PdfEncryption;

.field protected encoding:Ljava/lang/String;

.field protected hexWriting:Z

.field protected value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 49
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 97
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;-><init>()V

    .line 54
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfString;->hexWriting:Z

    .line 98
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .line 69
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "encoding"    # Ljava/lang/String;

    .line 62
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;-><init>()V

    .line 54
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfString;->hexWriting:Z

    .line 63
    if-eqz p1, :cond_0

    .line 64
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfString;->value:Ljava/lang/String;

    .line 65
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/PdfString;->encoding:Ljava/lang/String;

    .line 66
    return-void

    .line 63
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public constructor <init>([B)V
    .locals 5
    .param p1, "content"    # [B

    .line 73
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;-><init>()V

    .line 54
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfString;->hexWriting:Z

    .line 74
    if-eqz p1, :cond_1

    array-length v1, p1

    if-lez v1, :cond_1

    .line 75
    new-instance v1, Ljava/lang/StringBuilder;

    array-length v2, p1

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 76
    .local v1, "str":Ljava/lang/StringBuilder;
    array-length v2, p1

    :goto_0
    if-ge v0, v2, :cond_0

    aget-byte v3, p1, v0

    .line 77
    .local v3, "b":B
    and-int/lit16 v4, v3, 0xff

    int-to-char v4, v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 76
    .end local v3    # "b":B
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 79
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfString;->value:Ljava/lang/String;

    .line 80
    .end local v1    # "str":Ljava/lang/StringBuilder;
    goto :goto_1

    .line 81
    :cond_1
    const-string v0, ""

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfString;->value:Ljava/lang/String;

    .line 83
    :goto_1
    return-void
.end method

.method protected constructor <init>([BZ)V
    .locals 1
    .param p1, "content"    # [B
    .param p2, "hexWriting"    # Z

    .line 92
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;-><init>([B)V

    .line 54
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfString;->hexWriting:Z

    .line 93
    iput-boolean p2, p0, Lcom/itextpdf/kernel/pdf/PdfString;->hexWriting:Z

    .line 94
    return-void
.end method


# virtual methods
.method protected copyContent(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/utils/ICopyFilter;)V
    .locals 2
    .param p1, "from"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p2, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p3, "copyFilter"    # Lcom/itextpdf/kernel/utils/ICopyFilter;

    .line 300
    invoke-super {p0, p1, p2, p3}, Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;->copyContent(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/utils/ICopyFilter;)V

    .line 301
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfString;

    .line 302
    .local v0, "string":Lcom/itextpdf/kernel/pdf/PdfString;
    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/PdfString;->value:Ljava/lang/String;

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfString;->value:Ljava/lang/String;

    .line 303
    iget-boolean v1, v0, Lcom/itextpdf/kernel/pdf/PdfString;->hexWriting:Z

    iput-boolean v1, p0, Lcom/itextpdf/kernel/pdf/PdfString;->hexWriting:Z

    .line 304
    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/PdfString;->decryption:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfString;->decryption:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    .line 305
    iget v1, v0, Lcom/itextpdf/kernel/pdf/PdfString;->decryptInfoNum:I

    iput v1, p0, Lcom/itextpdf/kernel/pdf/PdfString;->decryptInfoNum:I

    .line 306
    iget v1, v0, Lcom/itextpdf/kernel/pdf/PdfString;->decryptInfoGen:I

    iput v1, p0, Lcom/itextpdf/kernel/pdf/PdfString;->decryptInfoGen:I

    .line 307
    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/PdfString;->encoding:Ljava/lang/String;

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfString;->encoding:Ljava/lang/String;

    .line 308
    return-void
.end method

.method protected decodeContent()[B
    .locals 4

    .line 265
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfString;->content:[B

    iget-boolean v1, p0, Lcom/itextpdf/kernel/pdf/PdfString;->hexWriting:Z

    invoke-static {v0, v1}, Lcom/itextpdf/io/source/PdfTokenizer;->decodeStringContent([BZ)[B

    move-result-object v0

    .line 266
    .local v0, "decodedBytes":[B
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfString;->decryption:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    if-eqz v1, :cond_0

    const/16 v1, 0x200

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfString;->checkState(S)Z

    move-result v1

    if-nez v1, :cond_0

    .line 267
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfString;->decryption:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    iget v2, p0, Lcom/itextpdf/kernel/pdf/PdfString;->decryptInfoNum:I

    iget v3, p0, Lcom/itextpdf/kernel/pdf/PdfString;->decryptInfoGen:I

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->setHashKeyForNextObject(II)V

    .line 268
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfString;->decryption:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->decryptByteArray([B)[B

    move-result-object v0

    .line 270
    :cond_0
    return-object v0
.end method

.method protected encodeBytes([B)[B
    .locals 4
    .param p1, "bytes"    # [B

    .line 281
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfString;->hexWriting:Z

    if-eqz v0, :cond_1

    .line 282
    new-instance v0, Lcom/itextpdf/io/source/ByteBuffer;

    array-length v1, p1

    mul-int/lit8 v1, v1, 0x2

    invoke-direct {v0, v1}, Lcom/itextpdf/io/source/ByteBuffer;-><init>(I)V

    .line 283
    .local v0, "buf":Lcom/itextpdf/io/source/ByteBuffer;
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-byte v3, p1, v2

    .line 284
    .local v3, "b":B
    invoke-virtual {v0, v3}, Lcom/itextpdf/io/source/ByteBuffer;->appendHex(B)Lcom/itextpdf/io/source/ByteBuffer;

    .line 283
    .end local v3    # "b":B
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 286
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/io/source/ByteBuffer;->getInternalBuffer()[B

    move-result-object v1

    return-object v1

    .line 288
    .end local v0    # "buf":Lcom/itextpdf/io/source/ByteBuffer;
    :cond_1
    invoke-static {p1}, Lcom/itextpdf/io/util/StreamUtil;->createBufferedEscapedString([B)Lcom/itextpdf/io/source/ByteBuffer;

    move-result-object v0

    .line 289
    .restart local v0    # "buf":Lcom/itextpdf/io/source/ByteBuffer;
    invoke-virtual {v0}, Lcom/itextpdf/io/source/ByteBuffer;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x2

    const/4 v2, 0x1

    invoke-virtual {v0, v2, v1}, Lcom/itextpdf/io/source/ByteBuffer;->toByteArray(II)[B

    move-result-object v1

    return-object v1
.end method

.method protected encrypt(Lcom/itextpdf/kernel/pdf/PdfEncryption;)Z
    .locals 2
    .param p1, "encrypt"    # Lcom/itextpdf/kernel/pdf/PdfEncryption;

    .line 248
    const/16 v0, 0x200

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfString;->checkState(S)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 249
    return v1

    .line 251
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfString;->decryption:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    if-eq p1, v0, :cond_2

    .line 252
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfString;->decryption:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    if-eqz v0, :cond_1

    .line 253
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfString;->generateValue()V

    .line 255
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->isEmbeddedFilesOnly()Z

    move-result v0

    if-nez v0, :cond_2

    .line 256
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfString;->getValueBytes()[B

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->encryptByteArray([B)[B

    move-result-object v0

    .line 257
    .local v0, "b":[B
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfString;->encodeBytes([B)[B

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfString;->content:[B

    .line 258
    const/4 v1, 0x1

    return v1

    .line 261
    .end local v0    # "b":[B
    :cond_2
    return v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 8
    .param p1, "o"    # Ljava/lang/Object;

    .line 173
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    .line 174
    return v0

    .line 175
    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_0

    .line 177
    :cond_1
    move-object v2, p1

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfString;

    .line 178
    .local v2, "that":Lcom/itextpdf/kernel/pdf/PdfString;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfString;->getValue()Ljava/lang/String;

    move-result-object v3

    .line 179
    .local v3, "v1":Ljava/lang/String;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfString;->getValue()Ljava/lang/String;

    move-result-object v4

    .line 180
    .local v4, "v2":Ljava/lang/String;
    if-eqz v3, :cond_4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 181
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfString;->getEncoding()Ljava/lang/String;

    move-result-object v5

    .line 182
    .local v5, "e1":Ljava/lang/String;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfString;->getEncoding()Ljava/lang/String;

    move-result-object v6

    .line 183
    .local v6, "e2":Ljava/lang/String;
    if-nez v5, :cond_2

    if-eqz v6, :cond_3

    :cond_2
    if-eqz v5, :cond_4

    .line 184
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 185
    :cond_3
    return v0

    .line 188
    .end local v5    # "e1":Ljava/lang/String;
    .end local v6    # "e2":Ljava/lang/String;
    :cond_4
    return v1

    .line 176
    .end local v2    # "that":Lcom/itextpdf/kernel/pdf/PdfString;
    .end local v3    # "v1":Ljava/lang/String;
    .end local v4    # "v2":Ljava/lang/String;
    :cond_5
    :goto_0
    return v1
.end method

.method protected generateContent()V
    .locals 1

    .line 238
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfString;->getValueBytes()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfString;->encodeBytes([B)[B

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfString;->content:[B

    .line 239
    return-void
.end method

.method protected generateValue()V
    .locals 2

    .line 228
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfString;->content:[B

    if-eqz v0, :cond_1

    .line 229
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfString;->decodeContent()[B

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/itextpdf/io/font/PdfEncodings;->convertToString([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfString;->value:Ljava/lang/String;

    .line 230
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfString;->decryption:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    if-eqz v0, :cond_0

    .line 231
    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfString;->decryption:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    .line 232
    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfString;->content:[B

    .line 234
    :cond_0
    return-void

    .line 228
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "No byte[] content to generate value"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method public getEncoding()Ljava/lang/String;
    .locals 1

    .line 130
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfString;->encoding:Ljava/lang/String;

    return-object v0
.end method

.method public getType()B
    .locals 1

    .line 102
    const/16 v0, 0xa

    return v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .line 119
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfString;->value:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 120
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfString;->generateValue()V

    .line 121
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfString;->value:Ljava/lang/String;

    return-object v0
.end method

.method public getValueBytes()[B
    .locals 2

    .line 163
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfString;->value:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 164
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfString;->generateValue()V

    .line 165
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfString;->encoding:Ljava/lang/String;

    if-eqz v0, :cond_1

    const-string v0, "UnicodeBig"

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfString;->encoding:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfString;->value:Ljava/lang/String;

    invoke-static {v0}, Lcom/itextpdf/io/font/PdfEncodings;->isPdfDocEncoding(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 166
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfString;->value:Ljava/lang/String;

    const-string v1, "PDF"

    invoke-static {v0, v1}, Lcom/itextpdf/io/font/PdfEncodings;->convertToBytes(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v0

    return-object v0

    .line 168
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfString;->value:Ljava/lang/String;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfString;->encoding:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/itextpdf/io/font/PdfEncodings;->convertToBytes(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .locals 5

    .line 202
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfString;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 203
    .local v0, "v":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfString;->getEncoding()Ljava/lang/String;

    move-result-object v1

    .line 204
    .local v1, "e":Ljava/lang/String;
    const/4 v2, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v3

    goto :goto_0

    :cond_0
    move v3, v2

    .line 205
    .local v3, "result":I
    :goto_0
    mul-int/lit8 v4, v3, 0x1f

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v2

    :cond_1
    add-int/2addr v4, v2

    return v4
.end method

.method public isHexWriting()Z
    .locals 1

    .line 106
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfString;->hexWriting:Z

    return v0
.end method

.method public markAsUnencryptedObject()V
    .locals 1

    .line 218
    const/16 v0, 0x200

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfString;->setState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 219
    return-void
.end method

.method protected newInstance()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1

    .line 295
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>()V

    return-object v0
.end method

.method setDecryption(IILcom/itextpdf/kernel/pdf/PdfEncryption;)V
    .locals 0
    .param p1, "decryptInfoNum"    # I
    .param p2, "decryptInfoGen"    # I
    .param p3, "decryption"    # Lcom/itextpdf/kernel/pdf/PdfEncryption;

    .line 222
    iput p1, p0, Lcom/itextpdf/kernel/pdf/PdfString;->decryptInfoNum:I

    .line 223
    iput p2, p0, Lcom/itextpdf/kernel/pdf/PdfString;->decryptInfoGen:I

    .line 224
    iput-object p3, p0, Lcom/itextpdf/kernel/pdf/PdfString;->decryption:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    .line 225
    return-void
.end method

.method public setHexWriting(Z)Lcom/itextpdf/kernel/pdf/PdfString;
    .locals 1
    .param p1, "hexWriting"    # Z

    .line 110
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfString;->value:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 111
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfString;->generateValue()V

    .line 113
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfString;->content:[B

    .line 114
    iput-boolean p1, p0, Lcom/itextpdf/kernel/pdf/PdfString;->hexWriting:Z

    .line 115
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 193
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfString;->value:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 194
    new-instance v0, Ljava/lang/String;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfString;->decodeContent()[B

    move-result-object v1

    sget-object v2, Ljava/nio/charset/StandardCharsets;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    return-object v0

    .line 196
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfString;->getValue()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toUnicodeString()Ljava/lang/String;
    .locals 6

    .line 140
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfString;->encoding:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfString;->encoding:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 141
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfString;->getValue()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 143
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfString;->content:[B

    if-nez v0, :cond_1

    .line 144
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfString;->generateContent()V

    .line 146
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfString;->decodeContent()[B

    move-result-object v0

    .line 147
    .local v0, "b":[B
    array-length v1, v0

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x2

    if-lt v1, v4, :cond_2

    aget-byte v1, v0, v3

    const/4 v5, -0x2

    if-ne v1, v5, :cond_2

    aget-byte v1, v0, v2

    const/4 v5, -0x1

    if-ne v1, v5, :cond_2

    .line 148
    const-string v1, "UnicodeBig"

    invoke-static {v0, v1}, Lcom/itextpdf/io/font/PdfEncodings;->convertToString([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 149
    :cond_2
    array-length v1, v0

    const/4 v5, 0x3

    if-lt v1, v5, :cond_3

    aget-byte v1, v0, v3

    const/16 v3, -0x11

    if-ne v1, v3, :cond_3

    aget-byte v1, v0, v2

    const/16 v2, -0x45

    if-ne v1, v2, :cond_3

    aget-byte v1, v0, v4

    const/16 v2, -0x41

    if-ne v1, v2, :cond_3

    .line 150
    const-string v1, "UTF-8"

    invoke-static {v0, v1}, Lcom/itextpdf/io/font/PdfEncodings;->convertToString([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 152
    :cond_3
    const-string v1, "PDF"

    invoke-static {v0, v1}, Lcom/itextpdf/io/font/PdfEncodings;->convertToString([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
