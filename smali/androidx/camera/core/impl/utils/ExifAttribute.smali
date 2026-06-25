.class final Landroidx/camera/core/impl/utils/ExifAttribute;
.super Ljava/lang/Object;
.source "ExifAttribute.java"


# static fields
.field static final ASCII:Ljava/nio/charset/Charset;

.field public static final BYTES_OFFSET_UNKNOWN:J = -0x1L

.field static final EXIF_ASCII_PREFIX:[B

.field static final IFD_FORMAT_BYTE:I = 0x1

.field static final IFD_FORMAT_BYTES_PER_FORMAT:[I

.field static final IFD_FORMAT_DOUBLE:I = 0xc

.field static final IFD_FORMAT_NAMES:[Ljava/lang/String;

.field static final IFD_FORMAT_SBYTE:I = 0x6

.field static final IFD_FORMAT_SINGLE:I = 0xb

.field static final IFD_FORMAT_SLONG:I = 0x9

.field static final IFD_FORMAT_SRATIONAL:I = 0xa

.field static final IFD_FORMAT_SSHORT:I = 0x8

.field static final IFD_FORMAT_STRING:I = 0x2

.field static final IFD_FORMAT_ULONG:I = 0x4

.field static final IFD_FORMAT_UNDEFINED:I = 0x7

.field static final IFD_FORMAT_URATIONAL:I = 0x5

.field static final IFD_FORMAT_USHORT:I = 0x3

.field private static final TAG:Ljava/lang/String; = "ExifAttribute"


# instance fields
.field public final bytes:[B

.field public final bytesOffset:J

.field public final format:I

.field public final numberOfComponents:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 45
    sget-object v0, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    sput-object v0, Landroidx/camera/core/impl/utils/ExifAttribute;->ASCII:Ljava/nio/charset/Charset;

    .line 61
    const/16 v0, 0xe

    new-array v1, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, ""

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "BYTE"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string/jumbo v3, "STRING"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string/jumbo v3, "USHORT"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string/jumbo v3, "ULONG"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string/jumbo v3, "URATIONAL"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string/jumbo v3, "SBYTE"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string/jumbo v3, "UNDEFINED"

    aput-object v3, v1, v2

    const-string/jumbo v2, "SSHORT"

    const/16 v3, 0x8

    aput-object v2, v1, v3

    const/16 v2, 0x9

    const-string/jumbo v4, "SLONG"

    aput-object v4, v1, v2

    const/16 v2, 0xa

    const-string/jumbo v4, "SRATIONAL"

    aput-object v4, v1, v2

    const/16 v2, 0xb

    const-string/jumbo v4, "SINGLE"

    aput-object v4, v1, v2

    const/16 v2, 0xc

    const-string v4, "DOUBLE"

    aput-object v4, v1, v2

    const/16 v2, 0xd

    const-string v4, "IFD"

    aput-object v4, v1, v2

    sput-object v1, Landroidx/camera/core/impl/utils/ExifAttribute;->IFD_FORMAT_NAMES:[Ljava/lang/String;

    .line 66
    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Landroidx/camera/core/impl/utils/ExifAttribute;->IFD_FORMAT_BYTES_PER_FORMAT:[I

    .line 71
    new-array v0, v3, [B

    fill-array-data v0, :array_1

    sput-object v0, Landroidx/camera/core/impl/utils/ExifAttribute;->EXIF_ASCII_PREFIX:[B

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x1
        0x1
        0x2
        0x4
        0x8
        0x1
        0x1
        0x2
        0x4
        0x8
        0x4
        0x8
        0x1
    .end array-data

    :array_1
    .array-data 1
        0x41t
        0x53t
        0x43t
        0x49t
        0x49t
        0x0t
        0x0t
        0x0t
    .end array-data
.end method

.method constructor <init>(IIJ[B)V
    .locals 0
    .param p1, "format"    # I
    .param p2, "numberOfComponents"    # I
    .param p3, "bytesOffset"    # J
    .param p5, "bytes"    # [B

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    iput p1, p0, Landroidx/camera/core/impl/utils/ExifAttribute;->format:I

    .line 88
    iput p2, p0, Landroidx/camera/core/impl/utils/ExifAttribute;->numberOfComponents:I

    .line 89
    iput-wide p3, p0, Landroidx/camera/core/impl/utils/ExifAttribute;->bytesOffset:J

    .line 90
    iput-object p5, p0, Landroidx/camera/core/impl/utils/ExifAttribute;->bytes:[B

    .line 91
    return-void
.end method

.method constructor <init>(II[B)V
    .locals 6
    .param p1, "format"    # I
    .param p2, "numberOfComponents"    # I
    .param p3, "bytes"    # [B

    .line 82
    const-wide/16 v3, -0x1

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v5, p3

    .end local p1    # "format":I
    .end local p2    # "numberOfComponents":I
    .end local p3    # "bytes":[B
    .local v1, "format":I
    .local v2, "numberOfComponents":I
    .local v5, "bytes":[B
    invoke-direct/range {v0 .. v5}, Landroidx/camera/core/impl/utils/ExifAttribute;-><init>(IIJ[B)V

    .line 83
    return-void
.end method

.method public static createByte(Ljava/lang/String;)Landroidx/camera/core/impl/utils/ExifAttribute;
    .locals 5
    .param p0, "value"    # Ljava/lang/String;

    .line 144
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x30

    if-lt v2, v3, :cond_0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v4, 0x31

    if-gt v2, v4, :cond_0

    .line 145
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    sub-int/2addr v2, v3

    int-to-byte v2, v2

    new-array v3, v1, [B

    aput-byte v2, v3, v0

    .line 146
    .local v3, "bytes":[B
    new-instance v0, Landroidx/camera/core/impl/utils/ExifAttribute;

    array-length v2, v3

    invoke-direct {v0, v1, v2, v3}, Landroidx/camera/core/impl/utils/ExifAttribute;-><init>(II[B)V

    return-object v0

    .line 148
    .end local v3    # "bytes":[B
    :cond_0
    sget-object v0, Landroidx/camera/core/impl/utils/ExifAttribute;->ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    .line 149
    .local v0, "ascii":[B
    new-instance v2, Landroidx/camera/core/impl/utils/ExifAttribute;

    array-length v3, v0

    invoke-direct {v2, v1, v3, v0}, Landroidx/camera/core/impl/utils/ExifAttribute;-><init>(II[B)V

    return-object v2
.end method

.method public static createDouble(DLjava/nio/ByteOrder;)Landroidx/camera/core/impl/utils/ExifAttribute;
    .locals 2
    .param p0, "value"    # D
    .param p2, "byteOrder"    # Ljava/nio/ByteOrder;

    .line 210
    const/4 v0, 0x1

    new-array v0, v0, [D

    const/4 v1, 0x0

    aput-wide p0, v0, v1

    invoke-static {v0, p2}, Landroidx/camera/core/impl/utils/ExifAttribute;->createDouble([DLjava/nio/ByteOrder;)Landroidx/camera/core/impl/utils/ExifAttribute;

    move-result-object v0

    return-object v0
.end method

.method public static createDouble([DLjava/nio/ByteOrder;)Landroidx/camera/core/impl/utils/ExifAttribute;
    .locals 6
    .param p0, "values"    # [D
    .param p1, "byteOrder"    # Ljava/nio/ByteOrder;

    .line 199
    sget-object v0, Landroidx/camera/core/impl/utils/ExifAttribute;->IFD_FORMAT_BYTES_PER_FORMAT:[I

    const/16 v1, 0xc

    aget v0, v0, v1

    array-length v2, p0

    mul-int/2addr v0, v2

    new-array v0, v0, [B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 201
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 202
    array-length v2, p0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget-wide v4, p0, v3

    .line 203
    .local v4, "value":D
    invoke-virtual {v0, v4, v5}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    .line 202
    .end local v4    # "value":D
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 205
    :cond_0
    new-instance v2, Landroidx/camera/core/impl/utils/ExifAttribute;

    array-length v3, p0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v4

    invoke-direct {v2, v1, v3, v4}, Landroidx/camera/core/impl/utils/ExifAttribute;-><init>(II[B)V

    return-object v2
.end method

.method public static createSLong(ILjava/nio/ByteOrder;)Landroidx/camera/core/impl/utils/ExifAttribute;
    .locals 1
    .param p0, "value"    # I
    .param p1, "byteOrder"    # Ljava/nio/ByteOrder;

    .line 138
    filled-new-array {p0}, [I

    move-result-object v0

    invoke-static {v0, p1}, Landroidx/camera/core/impl/utils/ExifAttribute;->createSLong([ILjava/nio/ByteOrder;)Landroidx/camera/core/impl/utils/ExifAttribute;

    move-result-object v0

    return-object v0
.end method

.method public static createSLong([ILjava/nio/ByteOrder;)Landroidx/camera/core/impl/utils/ExifAttribute;
    .locals 5
    .param p0, "values"    # [I
    .param p1, "byteOrder"    # Ljava/nio/ByteOrder;

    .line 127
    sget-object v0, Landroidx/camera/core/impl/utils/ExifAttribute;->IFD_FORMAT_BYTES_PER_FORMAT:[I

    const/16 v1, 0x9

    aget v0, v0, v1

    array-length v2, p0

    mul-int/2addr v0, v2

    new-array v0, v0, [B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 129
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 130
    array-length v2, p0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget v4, p0, v3

    .line 131
    .local v4, "value":I
    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 130
    .end local v4    # "value":I
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 133
    :cond_0
    new-instance v2, Landroidx/camera/core/impl/utils/ExifAttribute;

    array-length v3, p0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v4

    invoke-direct {v2, v1, v3, v4}, Landroidx/camera/core/impl/utils/ExifAttribute;-><init>(II[B)V

    return-object v2
.end method

.method public static createSRational(Landroidx/camera/core/impl/utils/LongRational;Ljava/nio/ByteOrder;)Landroidx/camera/core/impl/utils/ExifAttribute;
    .locals 2
    .param p0, "value"    # Landroidx/camera/core/impl/utils/LongRational;
    .param p1, "byteOrder"    # Ljava/nio/ByteOrder;

    .line 193
    const/4 v0, 0x1

    new-array v0, v0, [Landroidx/camera/core/impl/utils/LongRational;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    invoke-static {v0, p1}, Landroidx/camera/core/impl/utils/ExifAttribute;->createSRational([Landroidx/camera/core/impl/utils/LongRational;Ljava/nio/ByteOrder;)Landroidx/camera/core/impl/utils/ExifAttribute;

    move-result-object v0

    return-object v0
.end method

.method public static createSRational([Landroidx/camera/core/impl/utils/LongRational;Ljava/nio/ByteOrder;)Landroidx/camera/core/impl/utils/ExifAttribute;
    .locals 7
    .param p0, "values"    # [Landroidx/camera/core/impl/utils/LongRational;
    .param p1, "byteOrder"    # Ljava/nio/ByteOrder;

    .line 180
    sget-object v0, Landroidx/camera/core/impl/utils/ExifAttribute;->IFD_FORMAT_BYTES_PER_FORMAT:[I

    const/16 v1, 0xa

    aget v0, v0, v1

    array-length v2, p0

    mul-int/2addr v0, v2

    new-array v0, v0, [B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 182
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 183
    array-length v2, p0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget-object v4, p0, v3

    .line 184
    .local v4, "value":Landroidx/camera/core/impl/utils/LongRational;
    invoke-virtual {v4}, Landroidx/camera/core/impl/utils/LongRational;->getNumerator()J

    move-result-wide v5

    long-to-int v5, v5

    invoke-virtual {v0, v5}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 185
    invoke-virtual {v4}, Landroidx/camera/core/impl/utils/LongRational;->getDenominator()J

    move-result-wide v5

    long-to-int v5, v5

    invoke-virtual {v0, v5}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 183
    .end local v4    # "value":Landroidx/camera/core/impl/utils/LongRational;
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 187
    :cond_0
    new-instance v2, Landroidx/camera/core/impl/utils/ExifAttribute;

    array-length v3, p0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v4

    invoke-direct {v2, v1, v3, v4}, Landroidx/camera/core/impl/utils/ExifAttribute;-><init>(II[B)V

    return-object v2
.end method

.method public static createString(Ljava/lang/String;)Landroidx/camera/core/impl/utils/ExifAttribute;
    .locals 4
    .param p0, "value"    # Ljava/lang/String;

    .line 154
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/impl/utils/ExifAttribute;->ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    .line 155
    .local v0, "ascii":[B
    new-instance v1, Landroidx/camera/core/impl/utils/ExifAttribute;

    const/4 v2, 0x2

    array-length v3, v0

    invoke-direct {v1, v2, v3, v0}, Landroidx/camera/core/impl/utils/ExifAttribute;-><init>(II[B)V

    return-object v1
.end method

.method public static createULong(JLjava/nio/ByteOrder;)Landroidx/camera/core/impl/utils/ExifAttribute;
    .locals 2
    .param p0, "value"    # J
    .param p2, "byteOrder"    # Ljava/nio/ByteOrder;

    .line 122
    const/4 v0, 0x1

    new-array v0, v0, [J

    const/4 v1, 0x0

    aput-wide p0, v0, v1

    invoke-static {v0, p2}, Landroidx/camera/core/impl/utils/ExifAttribute;->createULong([JLjava/nio/ByteOrder;)Landroidx/camera/core/impl/utils/ExifAttribute;

    move-result-object v0

    return-object v0
.end method

.method public static createULong([JLjava/nio/ByteOrder;)Landroidx/camera/core/impl/utils/ExifAttribute;
    .locals 7
    .param p0, "values"    # [J
    .param p1, "byteOrder"    # Ljava/nio/ByteOrder;

    .line 111
    sget-object v0, Landroidx/camera/core/impl/utils/ExifAttribute;->IFD_FORMAT_BYTES_PER_FORMAT:[I

    const/4 v1, 0x4

    aget v0, v0, v1

    array-length v2, p0

    mul-int/2addr v0, v2

    new-array v0, v0, [B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 113
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 114
    array-length v2, p0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget-wide v4, p0, v3

    .line 115
    .local v4, "value":J
    long-to-int v6, v4

    invoke-virtual {v0, v6}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 114
    .end local v4    # "value":J
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 117
    :cond_0
    new-instance v2, Landroidx/camera/core/impl/utils/ExifAttribute;

    array-length v3, p0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v4

    invoke-direct {v2, v1, v3, v4}, Landroidx/camera/core/impl/utils/ExifAttribute;-><init>(II[B)V

    return-object v2
.end method

.method public static createURational(Landroidx/camera/core/impl/utils/LongRational;Ljava/nio/ByteOrder;)Landroidx/camera/core/impl/utils/ExifAttribute;
    .locals 2
    .param p0, "value"    # Landroidx/camera/core/impl/utils/LongRational;
    .param p1, "byteOrder"    # Ljava/nio/ByteOrder;

    .line 174
    const/4 v0, 0x1

    new-array v0, v0, [Landroidx/camera/core/impl/utils/LongRational;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    invoke-static {v0, p1}, Landroidx/camera/core/impl/utils/ExifAttribute;->createURational([Landroidx/camera/core/impl/utils/LongRational;Ljava/nio/ByteOrder;)Landroidx/camera/core/impl/utils/ExifAttribute;

    move-result-object v0

    return-object v0
.end method

.method public static createURational([Landroidx/camera/core/impl/utils/LongRational;Ljava/nio/ByteOrder;)Landroidx/camera/core/impl/utils/ExifAttribute;
    .locals 7
    .param p0, "values"    # [Landroidx/camera/core/impl/utils/LongRational;
    .param p1, "byteOrder"    # Ljava/nio/ByteOrder;

    .line 161
    sget-object v0, Landroidx/camera/core/impl/utils/ExifAttribute;->IFD_FORMAT_BYTES_PER_FORMAT:[I

    const/4 v1, 0x5

    aget v0, v0, v1

    array-length v2, p0

    mul-int/2addr v0, v2

    new-array v0, v0, [B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 163
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 164
    array-length v2, p0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget-object v4, p0, v3

    .line 165
    .local v4, "value":Landroidx/camera/core/impl/utils/LongRational;
    invoke-virtual {v4}, Landroidx/camera/core/impl/utils/LongRational;->getNumerator()J

    move-result-wide v5

    long-to-int v5, v5

    invoke-virtual {v0, v5}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 166
    invoke-virtual {v4}, Landroidx/camera/core/impl/utils/LongRational;->getDenominator()J

    move-result-wide v5

    long-to-int v5, v5

    invoke-virtual {v0, v5}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 164
    .end local v4    # "value":Landroidx/camera/core/impl/utils/LongRational;
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 168
    :cond_0
    new-instance v2, Landroidx/camera/core/impl/utils/ExifAttribute;

    array-length v3, p0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v4

    invoke-direct {v2, v1, v3, v4}, Landroidx/camera/core/impl/utils/ExifAttribute;-><init>(II[B)V

    return-object v2
.end method

.method public static createUShort(ILjava/nio/ByteOrder;)Landroidx/camera/core/impl/utils/ExifAttribute;
    .locals 1
    .param p0, "value"    # I
    .param p1, "byteOrder"    # Ljava/nio/ByteOrder;

    .line 106
    filled-new-array {p0}, [I

    move-result-object v0

    invoke-static {v0, p1}, Landroidx/camera/core/impl/utils/ExifAttribute;->createUShort([ILjava/nio/ByteOrder;)Landroidx/camera/core/impl/utils/ExifAttribute;

    move-result-object v0

    return-object v0
.end method

.method public static createUShort([ILjava/nio/ByteOrder;)Landroidx/camera/core/impl/utils/ExifAttribute;
    .locals 6
    .param p0, "values"    # [I
    .param p1, "byteOrder"    # Ljava/nio/ByteOrder;

    .line 95
    sget-object v0, Landroidx/camera/core/impl/utils/ExifAttribute;->IFD_FORMAT_BYTES_PER_FORMAT:[I

    const/4 v1, 0x3

    aget v0, v0, v1

    array-length v2, p0

    mul-int/2addr v0, v2

    new-array v0, v0, [B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 97
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 98
    array-length v2, p0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget v4, p0, v3

    .line 99
    .local v4, "value":I
    int-to-short v5, v4

    invoke-virtual {v0, v5}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 98
    .end local v4    # "value":I
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 101
    :cond_0
    new-instance v2, Landroidx/camera/core/impl/utils/ExifAttribute;

    array-length v3, p0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v4

    invoke-direct {v2, v1, v3, v4}, Landroidx/camera/core/impl/utils/ExifAttribute;-><init>(II[B)V

    return-object v2
.end method


# virtual methods
.method public getDoubleValue(Ljava/nio/ByteOrder;)D
    .locals 6
    .param p1, "byteOrder"    # Ljava/nio/ByteOrder;

    .line 342
    invoke-virtual {p0, p1}, Landroidx/camera/core/impl/utils/ExifAttribute;->getValue(Ljava/nio/ByteOrder;)Ljava/lang/Object;

    move-result-object v0

    .line 343
    .local v0, "value":Ljava/lang/Object;
    if-eqz v0, :cond_9

    .line 346
    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 347
    move-object v1, v0

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v1

    return-wide v1

    .line 349
    :cond_0
    instance-of v1, v0, [J

    const/4 v2, 0x0

    const-string/jumbo v3, "There are more than one component"

    const/4 v4, 0x1

    if-eqz v1, :cond_2

    .line 350
    move-object v1, v0

    check-cast v1, [J

    .line 351
    .local v1, "array":[J
    array-length v5, v1

    if-ne v5, v4, :cond_1

    .line 352
    aget-wide v2, v1, v2

    long-to-double v2, v2

    return-wide v2

    .line 354
    :cond_1
    new-instance v2, Ljava/lang/NumberFormatException;

    invoke-direct {v2, v3}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 356
    .end local v1    # "array":[J
    :cond_2
    instance-of v1, v0, [I

    if-eqz v1, :cond_4

    .line 357
    move-object v1, v0

    check-cast v1, [I

    .line 358
    .local v1, "array":[I
    array-length v5, v1

    if-ne v5, v4, :cond_3

    .line 359
    aget v2, v1, v2

    int-to-double v2, v2

    return-wide v2

    .line 361
    :cond_3
    new-instance v2, Ljava/lang/NumberFormatException;

    invoke-direct {v2, v3}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 363
    .end local v1    # "array":[I
    :cond_4
    instance-of v1, v0, [D

    if-eqz v1, :cond_6

    .line 364
    move-object v1, v0

    check-cast v1, [D

    .line 365
    .local v1, "array":[D
    array-length v5, v1

    if-ne v5, v4, :cond_5

    .line 366
    aget-wide v2, v1, v2

    return-wide v2

    .line 368
    :cond_5
    new-instance v2, Ljava/lang/NumberFormatException;

    invoke-direct {v2, v3}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 370
    .end local v1    # "array":[D
    :cond_6
    instance-of v1, v0, [Landroidx/camera/core/impl/utils/LongRational;

    if-eqz v1, :cond_8

    .line 371
    move-object v1, v0

    check-cast v1, [Landroidx/camera/core/impl/utils/LongRational;

    .line 372
    .local v1, "array":[Landroidx/camera/core/impl/utils/LongRational;
    array-length v5, v1

    if-ne v5, v4, :cond_7

    .line 373
    aget-object v2, v1, v2

    invoke-virtual {v2}, Landroidx/camera/core/impl/utils/LongRational;->toDouble()D

    move-result-wide v2

    return-wide v2

    .line 375
    :cond_7
    new-instance v2, Ljava/lang/NumberFormatException;

    invoke-direct {v2, v3}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 377
    .end local v1    # "array":[Landroidx/camera/core/impl/utils/LongRational;
    :cond_8
    new-instance v1, Ljava/lang/NumberFormatException;

    const-string v2, "Couldn\'t find a double value"

    invoke-direct {v1, v2}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 344
    :cond_9
    new-instance v1, Ljava/lang/NumberFormatException;

    const-string v2, "NULL can\'t be converted to a double value"

    invoke-direct {v1, v2}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getIntValue(Ljava/nio/ByteOrder;)I
    .locals 6
    .param p1, "byteOrder"    # Ljava/nio/ByteOrder;

    .line 381
    invoke-virtual {p0, p1}, Landroidx/camera/core/impl/utils/ExifAttribute;->getValue(Ljava/nio/ByteOrder;)Ljava/lang/Object;

    move-result-object v0

    .line 382
    .local v0, "value":Ljava/lang/Object;
    if-eqz v0, :cond_5

    .line 385
    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 386
    move-object v1, v0

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    return v1

    .line 388
    :cond_0
    instance-of v1, v0, [J

    const/4 v2, 0x0

    const-string/jumbo v3, "There are more than one component"

    const/4 v4, 0x1

    if-eqz v1, :cond_2

    .line 389
    move-object v1, v0

    check-cast v1, [J

    .line 390
    .local v1, "array":[J
    array-length v5, v1

    if-ne v5, v4, :cond_1

    .line 391
    aget-wide v2, v1, v2

    long-to-int v2, v2

    return v2

    .line 393
    :cond_1
    new-instance v2, Ljava/lang/NumberFormatException;

    invoke-direct {v2, v3}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 395
    .end local v1    # "array":[J
    :cond_2
    instance-of v1, v0, [I

    if-eqz v1, :cond_4

    .line 396
    move-object v1, v0

    check-cast v1, [I

    .line 397
    .local v1, "array":[I
    array-length v5, v1

    if-ne v5, v4, :cond_3

    .line 398
    aget v2, v1, v2

    return v2

    .line 400
    :cond_3
    new-instance v2, Ljava/lang/NumberFormatException;

    invoke-direct {v2, v3}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 402
    .end local v1    # "array":[I
    :cond_4
    new-instance v1, Ljava/lang/NumberFormatException;

    const-string v2, "Couldn\'t find a integer value"

    invoke-direct {v1, v2}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 383
    :cond_5
    new-instance v1, Ljava/lang/NumberFormatException;

    const-string v2, "NULL can\'t be converted to a integer value"

    invoke-direct {v1, v2}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getStringValue(Ljava/nio/ByteOrder;)Ljava/lang/String;
    .locals 7
    .param p1, "byteOrder"    # Ljava/nio/ByteOrder;

    .line 407
    invoke-virtual {p0, p1}, Landroidx/camera/core/impl/utils/ExifAttribute;->getValue(Ljava/nio/ByteOrder;)Ljava/lang/Object;

    move-result-object v0

    .line 408
    .local v0, "value":Ljava/lang/Object;
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 409
    return-object v1

    .line 411
    :cond_0
    instance-of v2, v0, Ljava/lang/String;

    if-eqz v2, :cond_1

    .line 412
    move-object v1, v0

    check-cast v1, Ljava/lang/String;

    return-object v1

    .line 415
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 416
    .local v2, "stringBuilder":Ljava/lang/StringBuilder;
    instance-of v3, v0, [J

    const-string v4, ","

    if-eqz v3, :cond_4

    .line 417
    move-object v1, v0

    check-cast v1, [J

    .line 418
    .local v1, "array":[J
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v5, v1

    if-ge v3, v5, :cond_3

    .line 419
    aget-wide v5, v1, v3

    invoke-virtual {v2, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 420
    add-int/lit8 v5, v3, 0x1

    array-length v6, v1

    if-eq v5, v6, :cond_2

    .line 421
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 418
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 424
    .end local v3    # "i":I
    :cond_3
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 426
    .end local v1    # "array":[J
    :cond_4
    instance-of v3, v0, [I

    if-eqz v3, :cond_7

    .line 427
    move-object v1, v0

    check-cast v1, [I

    .line 428
    .local v1, "array":[I
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_1
    array-length v5, v1

    if-ge v3, v5, :cond_6

    .line 429
    aget v5, v1, v3

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 430
    add-int/lit8 v5, v3, 0x1

    array-length v6, v1

    if-eq v5, v6, :cond_5

    .line 431
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 428
    :cond_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 434
    .end local v3    # "i":I
    :cond_6
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 436
    .end local v1    # "array":[I
    :cond_7
    instance-of v3, v0, [D

    if-eqz v3, :cond_a

    .line 437
    move-object v1, v0

    check-cast v1, [D

    .line 438
    .local v1, "array":[D
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_2
    array-length v5, v1

    if-ge v3, v5, :cond_9

    .line 439
    aget-wide v5, v1, v3

    invoke-virtual {v2, v5, v6}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 440
    add-int/lit8 v5, v3, 0x1

    array-length v6, v1

    if-eq v5, v6, :cond_8

    .line 441
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 438
    :cond_8
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 444
    .end local v3    # "i":I
    :cond_9
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 446
    .end local v1    # "array":[D
    :cond_a
    instance-of v3, v0, [Landroidx/camera/core/impl/utils/LongRational;

    if-eqz v3, :cond_d

    .line 447
    move-object v1, v0

    check-cast v1, [Landroidx/camera/core/impl/utils/LongRational;

    .line 448
    .local v1, "array":[Landroidx/camera/core/impl/utils/LongRational;
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_3
    array-length v5, v1

    if-ge v3, v5, :cond_c

    .line 449
    aget-object v5, v1, v3

    invoke-virtual {v5}, Landroidx/camera/core/impl/utils/LongRational;->getNumerator()J

    move-result-wide v5

    invoke-virtual {v2, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 450
    const/16 v5, 0x2f

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 451
    aget-object v5, v1, v3

    invoke-virtual {v5}, Landroidx/camera/core/impl/utils/LongRational;->getDenominator()J

    move-result-wide v5

    invoke-virtual {v2, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 452
    add-int/lit8 v5, v3, 0x1

    array-length v6, v1

    if-eq v5, v6, :cond_b

    .line 453
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 448
    :cond_b
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 456
    .end local v3    # "i":I
    :cond_c
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 458
    .end local v1    # "array":[Landroidx/camera/core/impl/utils/LongRational;
    :cond_d
    return-object v1
.end method

.method getValue(Ljava/nio/ByteOrder;)Ljava/lang/Object;
    .locals 11
    .param p1, "byteOrder"    # Ljava/nio/ByteOrder;

    .line 220
    const-string v0, "IOException occurred while closing InputStream"

    const-string v1, "ExifAttribute"

    const/4 v2, 0x0

    .line 222
    .local v2, "inputStream":Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;
    const/4 v3, 0x0

    :try_start_0
    new-instance v4, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;

    iget-object v5, p0, Landroidx/camera/core/impl/utils/ExifAttribute;->bytes:[B

    invoke-direct {v4, v5}, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;-><init>([B)V

    move-object v2, v4

    .line 223
    invoke-virtual {v2, p1}, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->setByteOrder(Ljava/nio/ByteOrder;)V

    .line 224
    iget v4, p0, Landroidx/camera/core/impl/utils/ExifAttribute;->format:I

    packed-switch v4, :pswitch_data_0

    .line 325
    nop

    .line 331
    goto/16 :goto_18

    .line 318
    :pswitch_0
    iget v4, p0, Landroidx/camera/core/impl/utils/ExifAttribute;->numberOfComponents:I

    new-array v4, v4, [D

    .line 319
    .local v4, "values":[D
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    iget v6, p0, Landroidx/camera/core/impl/utils/ExifAttribute;->numberOfComponents:I

    if-ge v5, v6, :cond_0

    .line 320
    invoke-virtual {v2}, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->readDouble()D

    move-result-wide v6

    aput-wide v6, v4, v5
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_c
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 319
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 322
    .end local v5    # "i":I
    :cond_0
    nop

    .line 331
    nop

    .line 333
    :try_start_1
    invoke-virtual {v2}, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 336
    goto :goto_1

    .line 334
    :catch_0
    move-exception v3

    .line 335
    .local v3, "e":Ljava/io/IOException;
    invoke-static {v1, v0, v3}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 322
    .end local v3    # "e":Ljava/io/IOException;
    :goto_1
    return-object v4

    .line 311
    .end local v4    # "values":[D
    :pswitch_1
    :try_start_2
    iget v4, p0, Landroidx/camera/core/impl/utils/ExifAttribute;->numberOfComponents:I

    new-array v4, v4, [D

    .line 312
    .restart local v4    # "values":[D
    const/4 v5, 0x0

    .restart local v5    # "i":I
    :goto_2
    iget v6, p0, Landroidx/camera/core/impl/utils/ExifAttribute;->numberOfComponents:I

    if-ge v5, v6, :cond_1

    .line 313
    invoke-virtual {v2}, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->readFloat()F

    move-result v6

    float-to-double v6, v6

    aput-wide v6, v4, v5
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_c
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 312
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 315
    .end local v5    # "i":I
    :cond_1
    nop

    .line 331
    nop

    .line 333
    :try_start_3
    invoke-virtual {v2}, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 336
    goto :goto_3

    .line 334
    :catch_1
    move-exception v3

    .line 335
    .restart local v3    # "e":Ljava/io/IOException;
    invoke-static {v1, v0, v3}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 315
    .end local v3    # "e":Ljava/io/IOException;
    :goto_3
    return-object v4

    .line 302
    .end local v4    # "values":[D
    :pswitch_2
    :try_start_4
    iget v4, p0, Landroidx/camera/core/impl/utils/ExifAttribute;->numberOfComponents:I

    new-array v4, v4, [Landroidx/camera/core/impl/utils/LongRational;

    .line 303
    .local v4, "values":[Landroidx/camera/core/impl/utils/LongRational;
    const/4 v5, 0x0

    .restart local v5    # "i":I
    :goto_4
    iget v6, p0, Landroidx/camera/core/impl/utils/ExifAttribute;->numberOfComponents:I

    if-ge v5, v6, :cond_2

    .line 304
    invoke-virtual {v2}, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->readInt()I

    move-result v6

    int-to-long v6, v6

    .line 305
    .local v6, "numerator":J
    invoke-virtual {v2}, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->readInt()I

    move-result v8

    int-to-long v8, v8

    .line 306
    .local v8, "denominator":J
    new-instance v10, Landroidx/camera/core/impl/utils/LongRational;

    invoke-direct {v10, v6, v7, v8, v9}, Landroidx/camera/core/impl/utils/LongRational;-><init>(JJ)V

    aput-object v10, v4, v5
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_c
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 303
    .end local v6    # "numerator":J
    .end local v8    # "denominator":J
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    .line 308
    .end local v5    # "i":I
    :cond_2
    nop

    .line 331
    nop

    .line 333
    :try_start_5
    invoke-virtual {v2}, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    .line 336
    goto :goto_5

    .line 334
    :catch_2
    move-exception v3

    .line 335
    .restart local v3    # "e":Ljava/io/IOException;
    invoke-static {v1, v0, v3}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 308
    .end local v3    # "e":Ljava/io/IOException;
    :goto_5
    return-object v4

    .line 295
    .end local v4    # "values":[Landroidx/camera/core/impl/utils/LongRational;
    :pswitch_3
    :try_start_6
    iget v4, p0, Landroidx/camera/core/impl/utils/ExifAttribute;->numberOfComponents:I

    new-array v4, v4, [I

    .line 296
    .local v4, "values":[I
    const/4 v5, 0x0

    .restart local v5    # "i":I
    :goto_6
    iget v6, p0, Landroidx/camera/core/impl/utils/ExifAttribute;->numberOfComponents:I

    if-ge v5, v6, :cond_3

    .line 297
    invoke-virtual {v2}, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->readInt()I

    move-result v6

    aput v6, v4, v5
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_c
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 296
    add-int/lit8 v5, v5, 0x1

    goto :goto_6

    .line 299
    .end local v5    # "i":I
    :cond_3
    nop

    .line 331
    nop

    .line 333
    :try_start_7
    invoke-virtual {v2}, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_3

    .line 336
    goto :goto_7

    .line 334
    :catch_3
    move-exception v3

    .line 335
    .restart local v3    # "e":Ljava/io/IOException;
    invoke-static {v1, v0, v3}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 299
    .end local v3    # "e":Ljava/io/IOException;
    :goto_7
    return-object v4

    .line 288
    .end local v4    # "values":[I
    :pswitch_4
    :try_start_8
    iget v4, p0, Landroidx/camera/core/impl/utils/ExifAttribute;->numberOfComponents:I

    new-array v4, v4, [I

    .line 289
    .restart local v4    # "values":[I
    const/4 v5, 0x0

    .restart local v5    # "i":I
    :goto_8
    iget v6, p0, Landroidx/camera/core/impl/utils/ExifAttribute;->numberOfComponents:I

    if-ge v5, v6, :cond_4

    .line 290
    invoke-virtual {v2}, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->readShort()S

    move-result v6

    aput v6, v4, v5
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_c
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 289
    add-int/lit8 v5, v5, 0x1

    goto :goto_8

    .line 292
    .end local v5    # "i":I
    :cond_4
    nop

    .line 331
    nop

    .line 333
    :try_start_9
    invoke-virtual {v2}, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_4

    .line 336
    goto :goto_9

    .line 334
    :catch_4
    move-exception v3

    .line 335
    .restart local v3    # "e":Ljava/io/IOException;
    invoke-static {v1, v0, v3}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 292
    .end local v3    # "e":Ljava/io/IOException;
    :goto_9
    return-object v4

    .line 279
    .end local v4    # "values":[I
    :pswitch_5
    :try_start_a
    iget v4, p0, Landroidx/camera/core/impl/utils/ExifAttribute;->numberOfComponents:I

    new-array v4, v4, [Landroidx/camera/core/impl/utils/LongRational;

    .line 280
    .local v4, "values":[Landroidx/camera/core/impl/utils/LongRational;
    const/4 v5, 0x0

    .restart local v5    # "i":I
    :goto_a
    iget v6, p0, Landroidx/camera/core/impl/utils/ExifAttribute;->numberOfComponents:I

    if-ge v5, v6, :cond_5

    .line 281
    invoke-virtual {v2}, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->readUnsignedInt()J

    move-result-wide v6

    .line 282
    .restart local v6    # "numerator":J
    invoke-virtual {v2}, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->readUnsignedInt()J

    move-result-wide v8

    .line 283
    .restart local v8    # "denominator":J
    new-instance v10, Landroidx/camera/core/impl/utils/LongRational;

    invoke-direct {v10, v6, v7, v8, v9}, Landroidx/camera/core/impl/utils/LongRational;-><init>(JJ)V

    aput-object v10, v4, v5
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_c
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 280
    .end local v6    # "numerator":J
    .end local v8    # "denominator":J
    add-int/lit8 v5, v5, 0x1

    goto :goto_a

    .line 285
    .end local v5    # "i":I
    :cond_5
    nop

    .line 331
    nop

    .line 333
    :try_start_b
    invoke-virtual {v2}, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_5

    .line 336
    goto :goto_b

    .line 334
    :catch_5
    move-exception v3

    .line 335
    .restart local v3    # "e":Ljava/io/IOException;
    invoke-static {v1, v0, v3}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 285
    .end local v3    # "e":Ljava/io/IOException;
    :goto_b
    return-object v4

    .line 272
    .end local v4    # "values":[Landroidx/camera/core/impl/utils/LongRational;
    :pswitch_6
    :try_start_c
    iget v4, p0, Landroidx/camera/core/impl/utils/ExifAttribute;->numberOfComponents:I

    new-array v4, v4, [J

    .line 273
    .local v4, "values":[J
    const/4 v5, 0x0

    .restart local v5    # "i":I
    :goto_c
    iget v6, p0, Landroidx/camera/core/impl/utils/ExifAttribute;->numberOfComponents:I

    if-ge v5, v6, :cond_6

    .line 274
    invoke-virtual {v2}, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->readUnsignedInt()J

    move-result-wide v6

    aput-wide v6, v4, v5
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 273
    add-int/lit8 v5, v5, 0x1

    goto :goto_c

    .line 276
    .end local v5    # "i":I
    :cond_6
    nop

    .line 331
    nop

    .line 333
    :try_start_d
    invoke-virtual {v2}, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->close()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_6

    .line 336
    goto :goto_d

    .line 334
    :catch_6
    move-exception v3

    .line 335
    .restart local v3    # "e":Ljava/io/IOException;
    invoke-static {v1, v0, v3}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 276
    .end local v3    # "e":Ljava/io/IOException;
    :goto_d
    return-object v4

    .line 265
    .end local v4    # "values":[J
    :pswitch_7
    :try_start_e
    iget v4, p0, Landroidx/camera/core/impl/utils/ExifAttribute;->numberOfComponents:I

    new-array v4, v4, [I

    .line 266
    .local v4, "values":[I
    const/4 v5, 0x0

    .restart local v5    # "i":I
    :goto_e
    iget v6, p0, Landroidx/camera/core/impl/utils/ExifAttribute;->numberOfComponents:I

    if-ge v5, v6, :cond_7

    .line 267
    invoke-virtual {v2}, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->readUnsignedShort()I

    move-result v6

    aput v6, v4, v5
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_c
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    .line 266
    add-int/lit8 v5, v5, 0x1

    goto :goto_e

    .line 269
    .end local v5    # "i":I
    :cond_7
    nop

    .line 331
    nop

    .line 333
    :try_start_f
    invoke-virtual {v2}, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->close()V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_7

    .line 336
    goto :goto_f

    .line 334
    :catch_7
    move-exception v3

    .line 335
    .restart local v3    # "e":Ljava/io/IOException;
    invoke-static {v1, v0, v3}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 269
    .end local v3    # "e":Ljava/io/IOException;
    :goto_f
    return-object v4

    .line 235
    .end local v4    # "values":[I
    :pswitch_8
    const/4 v4, 0x0

    .line 236
    .local v4, "index":I
    :try_start_10
    iget v5, p0, Landroidx/camera/core/impl/utils/ExifAttribute;->numberOfComponents:I

    sget-object v6, Landroidx/camera/core/impl/utils/ExifAttribute;->EXIF_ASCII_PREFIX:[B

    array-length v6, v6

    if-lt v5, v6, :cond_a

    .line 237
    const/4 v5, 0x1

    .line 238
    .local v5, "same":Z
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_10
    sget-object v7, Landroidx/camera/core/impl/utils/ExifAttribute;->EXIF_ASCII_PREFIX:[B

    array-length v7, v7

    if-ge v6, v7, :cond_9

    .line 239
    iget-object v7, p0, Landroidx/camera/core/impl/utils/ExifAttribute;->bytes:[B

    aget-byte v7, v7, v6

    sget-object v8, Landroidx/camera/core/impl/utils/ExifAttribute;->EXIF_ASCII_PREFIX:[B

    aget-byte v8, v8, v6

    if-eq v7, v8, :cond_8

    .line 240
    const/4 v5, 0x0

    .line 241
    goto :goto_11

    .line 238
    :cond_8
    add-int/lit8 v6, v6, 0x1

    goto :goto_10

    .line 244
    .end local v6    # "i":I
    :cond_9
    :goto_11
    if-eqz v5, :cond_a

    .line 245
    sget-object v6, Landroidx/camera/core/impl/utils/ExifAttribute;->EXIF_ASCII_PREFIX:[B

    array-length v6, v6

    move v4, v6

    .line 249
    .end local v5    # "same":Z
    :cond_a
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 250
    .local v5, "stringBuilder":Ljava/lang/StringBuilder;
    :goto_12
    iget v6, p0, Landroidx/camera/core/impl/utils/ExifAttribute;->numberOfComponents:I

    if-ge v4, v6, :cond_d

    .line 251
    iget-object v6, p0, Landroidx/camera/core/impl/utils/ExifAttribute;->bytes:[B

    aget-byte v6, v6, v4

    .line 252
    .local v6, "ch":I
    if-nez v6, :cond_b

    .line 253
    goto :goto_14

    .line 255
    :cond_b
    const/16 v7, 0x20

    if-lt v6, v7, :cond_c

    .line 256
    int-to-char v7, v6

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_13

    .line 258
    :cond_c
    const/16 v7, 0x3f

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 260
    :goto_13
    nop

    .end local v6    # "ch":I
    add-int/lit8 v4, v4, 0x1

    .line 261
    goto :goto_12

    .line 262
    :cond_d
    :goto_14
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_10} :catch_c
    .catchall {:try_start_10 .. :try_end_10} :catchall_0

    .line 331
    nop

    .line 333
    :try_start_11
    invoke-virtual {v2}, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->close()V
    :try_end_11
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_11} :catch_8

    .line 336
    goto :goto_15

    .line 334
    :catch_8
    move-exception v6

    .line 335
    .local v6, "e":Ljava/io/IOException;
    invoke-static {v1, v0, v6}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 262
    .end local v6    # "e":Ljava/io/IOException;
    :goto_15
    return-object v3

    .line 228
    .end local v4    # "index":I
    .end local v5    # "stringBuilder":Ljava/lang/StringBuilder;
    :pswitch_9
    :try_start_12
    iget-object v4, p0, Landroidx/camera/core/impl/utils/ExifAttribute;->bytes:[B

    array-length v4, v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_e

    iget-object v4, p0, Landroidx/camera/core/impl/utils/ExifAttribute;->bytes:[B

    const/4 v6, 0x0

    aget-byte v4, v4, v6

    if-ltz v4, :cond_e

    iget-object v4, p0, Landroidx/camera/core/impl/utils/ExifAttribute;->bytes:[B

    aget-byte v4, v4, v6

    if-gt v4, v5, :cond_e

    .line 229
    new-instance v4, Ljava/lang/String;

    iget-object v7, p0, Landroidx/camera/core/impl/utils/ExifAttribute;->bytes:[B

    aget-byte v7, v7, v6

    add-int/lit8 v7, v7, 0x30

    int-to-char v7, v7

    new-array v5, v5, [C

    aput-char v7, v5, v6

    invoke-direct {v4, v5}, Ljava/lang/String;-><init>([C)V
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_12} :catch_c
    .catchall {:try_start_12 .. :try_end_12} :catchall_0

    .line 331
    nop

    .line 333
    :try_start_13
    invoke-virtual {v2}, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->close()V
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_13} :catch_9

    .line 336
    goto :goto_16

    .line 334
    :catch_9
    move-exception v3

    .line 335
    .restart local v3    # "e":Ljava/io/IOException;
    invoke-static {v1, v0, v3}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 229
    .end local v3    # "e":Ljava/io/IOException;
    :goto_16
    return-object v4

    .line 231
    :cond_e
    :try_start_14
    new-instance v4, Ljava/lang/String;

    iget-object v5, p0, Landroidx/camera/core/impl/utils/ExifAttribute;->bytes:[B

    sget-object v6, Landroidx/camera/core/impl/utils/ExifAttribute;->ASCII:Ljava/nio/charset/Charset;

    invoke-direct {v4, v5, v6}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V
    :try_end_14
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_14} :catch_c
    .catchall {:try_start_14 .. :try_end_14} :catchall_0

    .line 331
    nop

    .line 333
    :try_start_15
    invoke-virtual {v2}, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->close()V
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_15} :catch_a

    .line 336
    goto :goto_17

    .line 334
    :catch_a
    move-exception v3

    .line 335
    .restart local v3    # "e":Ljava/io/IOException;
    invoke-static {v1, v0, v3}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 231
    .end local v3    # "e":Ljava/io/IOException;
    :goto_17
    return-object v4

    .line 333
    :goto_18
    :try_start_16
    invoke-virtual {v2}, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->close()V
    :try_end_16
    .catch Ljava/io/IOException; {:try_start_16 .. :try_end_16} :catch_b

    .line 336
    goto :goto_19

    .line 334
    :catch_b
    move-exception v4

    .line 335
    .local v4, "e":Ljava/io/IOException;
    invoke-static {v1, v0, v4}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 325
    .end local v4    # "e":Ljava/io/IOException;
    :goto_19
    return-object v3

    .line 331
    :catchall_0
    move-exception v3

    goto :goto_1b

    .line 327
    :catch_c
    move-exception v4

    .line 328
    .restart local v4    # "e":Ljava/io/IOException;
    :try_start_17
    const-string v5, "IOException occurred during reading a value"

    invoke-static {v1, v5, v4}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_0

    .line 329
    nop

    .line 331
    if-eqz v2, :cond_f

    .line 333
    :try_start_18
    invoke-virtual {v2}, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->close()V
    :try_end_18
    .catch Ljava/io/IOException; {:try_start_18 .. :try_end_18} :catch_d

    .line 336
    goto :goto_1a

    .line 334
    :catch_d
    move-exception v5

    .line 335
    .local v5, "e":Ljava/io/IOException;
    invoke-static {v1, v0, v5}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 329
    .end local v5    # "e":Ljava/io/IOException;
    :cond_f
    :goto_1a
    return-object v3

    .line 331
    .end local v4    # "e":Ljava/io/IOException;
    :goto_1b
    if-eqz v2, :cond_10

    .line 333
    :try_start_19
    invoke-virtual {v2}, Landroidx/camera/core/impl/utils/ByteOrderedDataInputStream;->close()V
    :try_end_19
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_19} :catch_e

    .line 336
    goto :goto_1c

    .line 334
    :catch_e
    move-exception v4

    .line 335
    .restart local v4    # "e":Ljava/io/IOException;
    invoke-static {v1, v0, v4}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 338
    .end local v4    # "e":Ljava/io/IOException;
    :cond_10
    :goto_1c
    throw v3

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_9
        :pswitch_8
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public size()I
    .locals 2

    .line 462
    sget-object v0, Landroidx/camera/core/impl/utils/ExifAttribute;->IFD_FORMAT_BYTES_PER_FORMAT:[I

    iget v1, p0, Landroidx/camera/core/impl/utils/ExifAttribute;->format:I

    aget v0, v0, v1

    iget v1, p0, Landroidx/camera/core/impl/utils/ExifAttribute;->numberOfComponents:I

    mul-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 215
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/impl/utils/ExifAttribute;->IFD_FORMAT_NAMES:[Ljava/lang/String;

    iget v2, p0, Landroidx/camera/core/impl/utils/ExifAttribute;->format:I

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", data length:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/impl/utils/ExifAttribute;->bytes:[B

    array-length v1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
