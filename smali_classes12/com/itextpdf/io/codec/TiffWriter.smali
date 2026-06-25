.class public Lcom/itextpdf/io/codec/TiffWriter;
.super Ljava/lang/Object;
.source "TiffWriter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/io/codec/TiffWriter$FieldAscii;,
        Lcom/itextpdf/io/codec/TiffWriter$FieldImage;,
        Lcom/itextpdf/io/codec/TiffWriter$FieldUndefined;,
        Lcom/itextpdf/io/codec/TiffWriter$FieldByte;,
        Lcom/itextpdf/io/codec/TiffWriter$FieldRational;,
        Lcom/itextpdf/io/codec/TiffWriter$FieldLong;,
        Lcom/itextpdf/io/codec/TiffWriter$FieldShort;,
        Lcom/itextpdf/io/codec/TiffWriter$FieldBase;
    }
.end annotation


# instance fields
.field private ifd:Ljava/util/TreeMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/TreeMap<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/io/codec/TiffWriter$FieldBase;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/codec/TiffWriter;->ifd:Ljava/util/TreeMap;

    return-void
.end method

.method public static compressLZW(Ljava/io/OutputStream;I[BIII)V
    .locals 9
    .param p0, "stream"    # Ljava/io/OutputStream;
    .param p1, "predictor"    # I
    .param p2, "b"    # [B
    .param p3, "height"    # I
    .param p4, "samplesPerPixel"    # I
    .param p5, "stride"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 247
    new-instance v0, Lcom/itextpdf/io/codec/LZWCompressor;

    const/16 v1, 0x8

    const/4 v2, 0x1

    invoke-direct {v0, p0, v1, v2}, Lcom/itextpdf/io/codec/LZWCompressor;-><init>(Ljava/io/OutputStream;IZ)V

    .line 248
    .local v0, "lzwCompressor":Lcom/itextpdf/io/codec/LZWCompressor;
    const/4 v1, 0x2

    const/4 v3, 0x0

    if-ne p1, v1, :cond_0

    goto :goto_0

    :cond_0
    move v2, v3

    .line 250
    .local v2, "usePredictor":Z
    :goto_0
    if-nez v2, :cond_1

    .line 251
    array-length v1, p2

    invoke-virtual {v0, p2, v3, v1}, Lcom/itextpdf/io/codec/LZWCompressor;->compress([BII)V

    goto :goto_3

    .line 253
    :cond_1
    const/4 v1, 0x0

    .line 254
    .local v1, "off":I
    new-array v4, p5, [B

    .line 255
    .local v4, "rowBuf":[B
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1
    if-ge v5, p3, :cond_3

    .line 256
    invoke-static {p2, v1, v4, v3, p5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 257
    add-int/lit8 v6, p5, -0x1

    .local v6, "j":I
    :goto_2
    if-lt v6, p4, :cond_2

    .line 258
    aget-byte v7, v4, v6

    sub-int v8, v6, p4

    aget-byte v8, v4, v8

    sub-int/2addr v7, v8

    int-to-byte v7, v7

    aput-byte v7, v4, v6

    .line 257
    add-int/lit8 v6, v6, -0x1

    goto :goto_2

    .line 260
    .end local v6    # "j":I
    :cond_2
    invoke-virtual {v0, v4, v3, p5}, Lcom/itextpdf/io/codec/LZWCompressor;->compress([BII)V

    .line 261
    add-int/2addr v1, p5

    .line 255
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 265
    .end local v1    # "off":I
    .end local v4    # "rowBuf":[B
    .end local v5    # "i":I
    :cond_3
    :goto_3
    invoke-virtual {v0}, Lcom/itextpdf/io/codec/LZWCompressor;->flush()V

    .line 266
    return-void
.end method

.method public static writeLong(ILjava/io/OutputStream;)V
    .locals 1
    .param p0, "v"    # I
    .param p1, "stream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 239
    shr-int/lit8 v0, p0, 0x18

    and-int/lit16 v0, v0, 0xff

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 240
    shr-int/lit8 v0, p0, 0x10

    and-int/lit16 v0, v0, 0xff

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 241
    shr-int/lit8 v0, p0, 0x8

    and-int/lit16 v0, v0, 0xff

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 242
    and-int/lit16 v0, p0, 0xff

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 243
    return-void
.end method

.method public static writeShort(ILjava/io/OutputStream;)V
    .locals 1
    .param p0, "v"    # I
    .param p1, "stream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 234
    shr-int/lit8 v0, p0, 0x8

    and-int/lit16 v0, v0, 0xff

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 235
    and-int/lit16 v0, p0, 0xff

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 236
    return-void
.end method


# virtual methods
.method public addField(Lcom/itextpdf/io/codec/TiffWriter$FieldBase;)V
    .locals 2
    .param p1, "field"    # Lcom/itextpdf/io/codec/TiffWriter$FieldBase;

    .line 38
    iget-object v0, p0, Lcom/itextpdf/io/codec/TiffWriter;->ifd:Ljava/util/TreeMap;

    invoke-virtual {p1}, Lcom/itextpdf/io/codec/TiffWriter$FieldBase;->getTag()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    return-void
.end method

.method public getIfdSize()I
    .locals 1

    .line 42
    iget-object v0, p0, Lcom/itextpdf/io/codec/TiffWriter;->ifd:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->size()I

    move-result v0

    mul-int/lit8 v0, v0, 0xc

    add-int/lit8 v0, v0, 0x6

    return v0
.end method

.method public writeFile(Ljava/io/OutputStream;)V
    .locals 6
    .param p1, "stream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 46
    const/16 v0, 0x4d

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 47
    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 48
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 49
    const/16 v1, 0x2a

    invoke-virtual {p1, v1}, Ljava/io/OutputStream;->write(I)V

    .line 50
    const/16 v1, 0x8

    invoke-static {v1, p1}, Lcom/itextpdf/io/codec/TiffWriter;->writeLong(ILjava/io/OutputStream;)V

    .line 51
    iget-object v2, p0, Lcom/itextpdf/io/codec/TiffWriter;->ifd:Ljava/util/TreeMap;

    invoke-virtual {v2}, Ljava/util/TreeMap;->size()I

    move-result v2

    invoke-static {v2, p1}, Lcom/itextpdf/io/codec/TiffWriter;->writeShort(ILjava/io/OutputStream;)V

    .line 52
    invoke-virtual {p0}, Lcom/itextpdf/io/codec/TiffWriter;->getIfdSize()I

    move-result v2

    add-int/2addr v2, v1

    .line 53
    .local v2, "offset":I
    iget-object v1, p0, Lcom/itextpdf/io/codec/TiffWriter;->ifd:Ljava/util/TreeMap;

    invoke-virtual {v1}, Ljava/util/TreeMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/io/codec/TiffWriter$FieldBase;

    .line 54
    .local v3, "field":Lcom/itextpdf/io/codec/TiffWriter$FieldBase;
    invoke-virtual {v3}, Lcom/itextpdf/io/codec/TiffWriter$FieldBase;->getValueSize()I

    move-result v4

    .line 55
    .local v4, "size":I
    const/4 v5, 0x4

    if-le v4, v5, :cond_0

    .line 56
    invoke-virtual {v3, v2}, Lcom/itextpdf/io/codec/TiffWriter$FieldBase;->setOffset(I)V

    .line 57
    add-int/2addr v2, v4

    .line 59
    :cond_0
    invoke-virtual {v3, p1}, Lcom/itextpdf/io/codec/TiffWriter$FieldBase;->writeField(Ljava/io/OutputStream;)V

    .line 60
    .end local v3    # "field":Lcom/itextpdf/io/codec/TiffWriter$FieldBase;
    .end local v4    # "size":I
    goto :goto_0

    .line 61
    :cond_1
    invoke-static {v0, p1}, Lcom/itextpdf/io/codec/TiffWriter;->writeLong(ILjava/io/OutputStream;)V

    .line 62
    iget-object v0, p0, Lcom/itextpdf/io/codec/TiffWriter;->ifd:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/io/codec/TiffWriter$FieldBase;

    .line 63
    .local v1, "field":Lcom/itextpdf/io/codec/TiffWriter$FieldBase;
    invoke-virtual {v1, p1}, Lcom/itextpdf/io/codec/TiffWriter$FieldBase;->writeValue(Ljava/io/OutputStream;)V

    .line 64
    .end local v1    # "field":Lcom/itextpdf/io/codec/TiffWriter$FieldBase;
    goto :goto_1

    .line 65
    :cond_2
    return-void
.end method
