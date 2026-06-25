.class public Lcom/itextpdf/io/codec/PngWriter;
.super Ljava/lang/Object;
.source "PngWriter.java"


# static fields
.field private static final IDAT:[B

.field private static final IEND:[B

.field private static final IHDR:[B

.field private static final PLTE:[B

.field private static final PNG_SIGNTURE:[B

.field private static crc_table:[I

.field private static final iCCP:[B


# instance fields
.field private outp:Ljava/io/OutputStream;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 37
    const/16 v0, 0x8

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/itextpdf/io/codec/PngWriter;->PNG_SIGNTURE:[B

    .line 39
    const-string v0, "IHDR"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/io/codec/PngWriter;->IHDR:[B

    .line 40
    const-string v0, "PLTE"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/io/codec/PngWriter;->PLTE:[B

    .line 41
    const-string v0, "IDAT"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/io/codec/PngWriter;->IDAT:[B

    .line 42
    const-string v0, "IEND"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/io/codec/PngWriter;->IEND:[B

    .line 43
    const-string v0, "iCCP"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/io/codec/PngWriter;->iCCP:[B

    return-void

    :array_0
    .array-data 1
        -0x77t
        0x50t
        0x4et
        0x47t
        0xdt
        0xat
        0x1at
        0xat
    .end array-data
.end method

.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "outp"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput-object p1, p0, Lcom/itextpdf/io/codec/PngWriter;->outp:Ljava/io/OutputStream;

    .line 51
    sget-object v0, Lcom/itextpdf/io/codec/PngWriter;->PNG_SIGNTURE:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 52
    return-void
.end method

.method private static crc([B)I
    .locals 3
    .param p0, "buf"    # [B

    .line 137
    const/4 v0, 0x0

    array-length v1, p0

    const/4 v2, -0x1

    invoke-static {v2, p0, v0, v1}, Lcom/itextpdf/io/codec/PngWriter;->update_crc(I[BII)I

    move-result v0

    not-int v0, v0

    return v0
.end method

.method private static crc([BII)I
    .locals 1
    .param p0, "buf"    # [B
    .param p1, "offset"    # I
    .param p2, "len"    # I

    .line 133
    const/4 v0, -0x1

    invoke-static {v0, p0, p1, p2}, Lcom/itextpdf/io/codec/PngWriter;->update_crc(I[BII)I

    move-result v0

    not-int v0, v0

    return v0
.end method

.method private static make_crc_table()V
    .locals 7

    .line 105
    sget-object v0, Lcom/itextpdf/io/codec/PngWriter;->crc_table:[I

    if-eqz v0, :cond_0

    .line 106
    return-void

    .line 107
    :cond_0
    const/16 v0, 0x100

    new-array v1, v0, [I

    .line 108
    .local v1, "crc2":[I
    const/4 v2, 0x0

    .local v2, "n":I
    :goto_0
    if-ge v2, v0, :cond_3

    .line 109
    move v3, v2

    .line 110
    .local v3, "c":I
    const/4 v4, 0x0

    .local v4, "k":I
    :goto_1
    const/16 v5, 0x8

    if-ge v4, v5, :cond_2

    .line 111
    and-int/lit8 v5, v3, 0x1

    if-eqz v5, :cond_1

    .line 112
    ushr-int/lit8 v5, v3, 0x1

    const v6, -0x12477ce0

    xor-int v3, v5, v6

    goto :goto_2

    .line 114
    :cond_1
    ushr-int/lit8 v3, v3, 0x1

    .line 110
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 116
    .end local v4    # "k":I
    :cond_2
    aput v3, v1, v2

    .line 108
    .end local v3    # "c":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 118
    .end local v2    # "n":I
    :cond_3
    sput-object v1, Lcom/itextpdf/io/codec/PngWriter;->crc_table:[I

    .line 119
    return-void
.end method

.method public static outputInt(ILjava/io/OutputStream;)V
    .locals 1
    .param p0, "n"    # I
    .param p1, "s"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 145
    shr-int/lit8 v0, p0, 0x18

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 146
    shr-int/lit8 v0, p0, 0x10

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 147
    shr-int/lit8 v0, p0, 0x8

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 148
    int-to-byte v0, p0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 149
    return-void
.end method

.method private static update_crc(I[BII)I
    .locals 4
    .param p0, "crc"    # I
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .param p3, "len"    # I

    .line 122
    move v0, p0

    .line 124
    .local v0, "c":I
    sget-object v1, Lcom/itextpdf/io/codec/PngWriter;->crc_table:[I

    if-nez v1, :cond_0

    .line 125
    invoke-static {}, Lcom/itextpdf/io/codec/PngWriter;->make_crc_table()V

    .line 126
    :cond_0
    const/4 v1, 0x0

    .local v1, "n":I
    :goto_0
    if-ge v1, p3, :cond_1

    .line 127
    sget-object v2, Lcom/itextpdf/io/codec/PngWriter;->crc_table:[I

    add-int v3, v1, p2

    aget-byte v3, p1, v3

    xor-int/2addr v3, v0

    and-int/lit16 v3, v3, 0xff

    aget v2, v2, v3

    ushr-int/lit8 v3, v0, 0x8

    xor-int v0, v2, v3

    .line 126
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 129
    .end local v1    # "n":I
    :cond_1
    return v0
.end method


# virtual methods
.method public outputInt(I)V
    .locals 1
    .param p1, "n"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 141
    iget-object v0, p0, Lcom/itextpdf/io/codec/PngWriter;->outp:Ljava/io/OutputStream;

    invoke-static {p1, v0}, Lcom/itextpdf/io/codec/PngWriter;->outputInt(ILjava/io/OutputStream;)V

    .line 142
    return-void
.end method

.method public writeChunk([B[B)V
    .locals 3
    .param p1, "chunkType"    # [B
    .param p2, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 152
    array-length v0, p2

    invoke-virtual {p0, v0}, Lcom/itextpdf/io/codec/PngWriter;->outputInt(I)V

    .line 153
    iget-object v0, p0, Lcom/itextpdf/io/codec/PngWriter;->outp:Ljava/io/OutputStream;

    const/4 v1, 0x4

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v2, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 154
    iget-object v0, p0, Lcom/itextpdf/io/codec/PngWriter;->outp:Ljava/io/OutputStream;

    invoke-virtual {v0, p2}, Ljava/io/OutputStream;->write([B)V

    .line 155
    const/4 v0, -0x1

    array-length v1, p1

    invoke-static {v0, p1, v2, v1}, Lcom/itextpdf/io/codec/PngWriter;->update_crc(I[BII)I

    move-result v0

    .line 156
    .local v0, "c":I
    array-length v1, p2

    invoke-static {v0, p2, v2, v1}, Lcom/itextpdf/io/codec/PngWriter;->update_crc(I[BII)I

    move-result v1

    not-int v0, v1

    .line 157
    invoke-virtual {p0, v0}, Lcom/itextpdf/io/codec/PngWriter;->outputInt(I)V

    .line 158
    return-void
.end method

.method public writeData([BI)V
    .locals 6
    .param p1, "data"    # [B
    .param p2, "stride"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 71
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 72
    .local v0, "stream":Ljava/io/ByteArrayOutputStream;
    new-instance v1, Lcom/itextpdf/io/source/DeflaterOutputStream;

    invoke-direct {v1, v0}, Lcom/itextpdf/io/source/DeflaterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 74
    .local v1, "zip":Lcom/itextpdf/io/source/DeflaterOutputStream;
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_0
    array-length v3, p1

    sub-int/2addr v3, p2

    const/4 v4, 0x0

    if-ge v2, v3, :cond_0

    .line 75
    invoke-virtual {v1, v4}, Lcom/itextpdf/io/source/DeflaterOutputStream;->write(I)V

    .line 76
    invoke-virtual {v1, p1, v2, p2}, Lcom/itextpdf/io/source/DeflaterOutputStream;->write([BII)V

    .line 74
    add-int/2addr v2, p2

    goto :goto_0

    .line 78
    :cond_0
    array-length v3, p1

    sub-int/2addr v3, v2

    .line 79
    .local v3, "remaining":I
    if-lez v3, :cond_1

    .line 80
    invoke-virtual {v1, v4}, Lcom/itextpdf/io/source/DeflaterOutputStream;->write(I)V

    .line 81
    invoke-virtual {v1, p1, v2, v3}, Lcom/itextpdf/io/source/DeflaterOutputStream;->write([BII)V

    .line 83
    :cond_1
    invoke-virtual {v1}, Lcom/itextpdf/io/source/DeflaterOutputStream;->close()V

    .line 84
    sget-object v4, Lcom/itextpdf/io/codec/PngWriter;->IDAT:[B

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Lcom/itextpdf/io/codec/PngWriter;->writeChunk([B[B)V

    .line 85
    return-void
.end method

.method public writeEnd()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 67
    sget-object v0, Lcom/itextpdf/io/codec/PngWriter;->IEND:[B

    const/4 v1, 0x0

    new-array v1, v1, [B

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/io/codec/PngWriter;->writeChunk([B[B)V

    .line 68
    return-void
.end method

.method public writeHeader(IIII)V
    .locals 3
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "bitDepth"    # I
    .param p4, "colorType"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 55
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 56
    .local v0, "ms":Ljava/io/ByteArrayOutputStream;
    invoke-static {p1, v0}, Lcom/itextpdf/io/codec/PngWriter;->outputInt(ILjava/io/OutputStream;)V

    .line 57
    invoke-static {p2, v0}, Lcom/itextpdf/io/codec/PngWriter;->outputInt(ILjava/io/OutputStream;)V

    .line 58
    invoke-virtual {v0, p3}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 59
    invoke-virtual {v0, p4}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 60
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 61
    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 62
    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 63
    sget-object v1, Lcom/itextpdf/io/codec/PngWriter;->IHDR:[B

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/itextpdf/io/codec/PngWriter;->writeChunk([B[B)V

    .line 64
    return-void
.end method

.method public writeIccProfile([B)V
    .locals 4
    .param p1, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 92
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 93
    .local v0, "stream":Ljava/io/ByteArrayOutputStream;
    const/16 v1, 0x49

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 94
    const/16 v1, 0x43

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 95
    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 96
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 97
    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 98
    new-instance v1, Lcom/itextpdf/io/source/DeflaterOutputStream;

    invoke-direct {v1, v0}, Lcom/itextpdf/io/source/DeflaterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 99
    .local v1, "zip":Lcom/itextpdf/io/source/DeflaterOutputStream;
    invoke-virtual {v1, p1}, Lcom/itextpdf/io/source/DeflaterOutputStream;->write([B)V

    .line 100
    invoke-virtual {v1}, Lcom/itextpdf/io/source/DeflaterOutputStream;->close()V

    .line 101
    sget-object v2, Lcom/itextpdf/io/codec/PngWriter;->iCCP:[B

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lcom/itextpdf/io/codec/PngWriter;->writeChunk([B[B)V

    .line 102
    return-void
.end method

.method public writePalette([B)V
    .locals 1
    .param p1, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 88
    sget-object v0, Lcom/itextpdf/io/codec/PngWriter;->PLTE:[B

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/io/codec/PngWriter;->writeChunk([B[B)V

    .line 89
    return-void
.end method
