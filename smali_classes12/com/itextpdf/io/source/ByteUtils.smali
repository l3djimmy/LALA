.class public final Lcom/itextpdf/io/source/ByteUtils;
.super Ljava/lang/Object;
.source "ByteUtils.java"


# static fields
.field static HighPrecision:Z

.field private static final bytes:[B

.field private static final negOne:[B

.field private static final one:[B

.field private static final zero:[B


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 34
    const/4 v0, 0x0

    sput-boolean v0, Lcom/itextpdf/io/source/ByteUtils;->HighPrecision:Z

    .line 36
    const/16 v1, 0x10

    new-array v1, v1, [B

    fill-array-data v1, :array_0

    sput-object v1, Lcom/itextpdf/io/source/ByteUtils;->bytes:[B

    .line 37
    const/4 v1, 0x1

    new-array v2, v1, [B

    const/16 v3, 0x30

    aput-byte v3, v2, v0

    sput-object v2, Lcom/itextpdf/io/source/ByteUtils;->zero:[B

    .line 38
    new-array v1, v1, [B

    const/16 v2, 0x31

    aput-byte v2, v1, v0

    sput-object v1, Lcom/itextpdf/io/source/ByteUtils;->one:[B

    .line 39
    const/4 v0, 0x2

    new-array v0, v0, [B

    fill-array-data v0, :array_1

    sput-object v0, Lcom/itextpdf/io/source/ByteUtils;->negOne:[B

    return-void

    :array_0
    .array-data 1
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
    .end array-data

    :array_1
    .array-data 1
        0x2dt
        0x31t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getIsoBytes(BLjava/lang/String;)[B
    .locals 1
    .param p0, "pre"    # B
    .param p1, "text"    # Ljava/lang/String;

    .line 52
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(BLjava/lang/String;B)[B

    move-result-object v0

    return-object v0
.end method

.method public static getIsoBytes(BLjava/lang/String;B)[B
    .locals 6
    .param p0, "pre"    # B
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "post"    # B

    .line 56
    if-nez p1, :cond_0

    .line 57
    const/4 v0, 0x0

    return-object v0

    .line 58
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 59
    .local v0, "len":I
    const/4 v1, 0x0

    .line 60
    .local v1, "start":I
    if-eqz p0, :cond_1

    .line 61
    add-int/lit8 v0, v0, 0x1

    .line 62
    const/4 v1, 0x1

    .line 64
    :cond_1
    if-eqz p2, :cond_2

    .line 65
    add-int/lit8 v0, v0, 0x1

    .line 67
    :cond_2
    new-array v2, v0, [B

    .line 68
    .local v2, "b":[B
    if-eqz p0, :cond_3

    .line 69
    const/4 v3, 0x0

    aput-byte p0, v2, v3

    .line 71
    :cond_3
    if-eqz p2, :cond_4

    .line 72
    add-int/lit8 v3, v0, -0x1

    aput-byte p2, v2, v3

    .line 74
    :cond_4
    const/4 v3, 0x0

    .local v3, "k":I
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v3, v4, :cond_5

    .line 75
    add-int v4, v3, v1

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v5

    int-to-byte v5, v5

    aput-byte v5, v2, v4

    .line 74
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 76
    .end local v3    # "k":I
    :cond_5
    return-object v2
.end method

.method public static getIsoBytes(D)[B
    .locals 1
    .param p0, "d"    # D

    .line 84
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(DLcom/itextpdf/io/source/ByteBuffer;)[B

    move-result-object v0

    return-object v0
.end method

.method static getIsoBytes(DLcom/itextpdf/io/source/ByteBuffer;)[B
    .locals 1
    .param p0, "d"    # D
    .param p2, "buffer"    # Lcom/itextpdf/io/source/ByteBuffer;

    .line 106
    sget-boolean v0, Lcom/itextpdf/io/source/ByteUtils;->HighPrecision:Z

    invoke-static {p0, p1, p2, v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(DLcom/itextpdf/io/source/ByteBuffer;Z)[B

    move-result-object v0

    return-object v0
.end method

.method static getIsoBytes(DLcom/itextpdf/io/source/ByteBuffer;Z)[B
    .locals 16
    .param p0, "d"    # D
    .param p2, "buffer"    # Lcom/itextpdf/io/source/ByteBuffer;
    .param p3, "highPrecision"    # Z

    .line 110
    move-wide/from16 v0, p0

    move-object/from16 v2, p2

    const-string v3, "Attempt to process NaN in PdfNumber or when writing to PDF. Zero value will be used as a fallback."

    const-class v4, Lcom/itextpdf/io/source/ByteUtils;

    const/4 v5, 0x0

    if-eqz p3, :cond_4

    .line 111
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v6

    const-wide v8, 0x3eb0c6f7a0b5ed8dL    # 1.0E-6

    cmpg-double v6, v6, v8

    if-gez v6, :cond_1

    .line 112
    if-eqz v2, :cond_0

    .line 113
    sget-object v3, Lcom/itextpdf/io/source/ByteUtils;->zero:[B

    invoke-virtual {v2, v3}, Lcom/itextpdf/io/source/ByteBuffer;->prepend([B)Lcom/itextpdf/io/source/ByteBuffer;

    .line 114
    return-object v5

    .line 116
    :cond_0
    sget-object v3, Lcom/itextpdf/io/source/ByteUtils;->zero:[B

    return-object v3

    .line 119
    :cond_1
    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 120
    invoke-static {v4}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v4

    .line 121
    .local v4, "logger":Lorg/slf4j/Logger;
    invoke-interface {v4, v3}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 122
    const-wide/16 v0, 0x0

    .line 124
    .end local v4    # "logger":Lorg/slf4j/Logger;
    .end local p0    # "d":D
    .local v0, "d":D
    :cond_2
    const-string v3, "0.######"

    invoke-static {v0, v1, v3}, Lcom/itextpdf/io/util/DecimalFormatUtil;->formatNumber(DLjava/lang/String;)Ljava/lang/String;

    move-result-object v3

    sget-object v4, Ljava/nio/charset/StandardCharsets;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-virtual {v3, v4}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v3

    .line 125
    .local v3, "result":[B
    if-eqz v2, :cond_3

    .line 126
    invoke-virtual {v2, v3}, Lcom/itextpdf/io/source/ByteBuffer;->prepend([B)Lcom/itextpdf/io/source/ByteBuffer;

    .line 127
    return-object v5

    .line 129
    :cond_3
    return-object v3

    .line 132
    .end local v0    # "d":D
    .end local v3    # "result":[B
    .restart local p0    # "d":D
    :cond_4
    const/4 v6, 0x0

    .line 133
    .local v6, "negative":Z
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v7

    const-wide v9, 0x3eef75104d551d69L    # 1.5E-5

    cmpg-double v7, v7, v9

    if-gez v7, :cond_6

    .line 134
    if-eqz v2, :cond_5

    .line 135
    sget-object v3, Lcom/itextpdf/io/source/ByteUtils;->zero:[B

    invoke-virtual {v2, v3}, Lcom/itextpdf/io/source/ByteBuffer;->prepend([B)Lcom/itextpdf/io/source/ByteBuffer;

    .line 136
    return-object v5

    .line 138
    :cond_5
    sget-object v3, Lcom/itextpdf/io/source/ByteUtils;->zero:[B

    return-object v3

    .line 142
    :cond_6
    const-wide/16 v7, 0x0

    cmpg-double v7, v0, v7

    if-gez v7, :cond_7

    .line 143
    const/4 v6, 0x1

    .line 144
    neg-double v0, v0

    .line 146
    .end local p0    # "d":D
    .restart local v0    # "d":D
    :cond_7
    const-wide/high16 v7, 0x3ff0000000000000L    # 1.0

    cmpg-double v9, v0, v7

    const/16 v10, 0x2e

    const/16 v11, 0x2d

    if-gez v9, :cond_11

    .line 147
    const-wide v3, 0x3ed4f8b588e368f1L    # 5.0E-6

    add-double/2addr v0, v3

    .line 148
    cmpl-double v3, v0, v7

    if-ltz v3, :cond_a

    .line 150
    if-eqz v6, :cond_8

    .line 151
    sget-object v3, Lcom/itextpdf/io/source/ByteUtils;->negOne:[B

    .restart local v3    # "result":[B
    goto :goto_0

    .line 153
    .end local v3    # "result":[B
    :cond_8
    sget-object v3, Lcom/itextpdf/io/source/ByteUtils;->one:[B

    .line 155
    .restart local v3    # "result":[B
    :goto_0
    if-eqz v2, :cond_9

    .line 156
    invoke-virtual {v2, v3}, Lcom/itextpdf/io/source/ByteBuffer;->prepend([B)Lcom/itextpdf/io/source/ByteBuffer;

    .line 157
    return-object v5

    .line 159
    :cond_9
    return-object v3

    .line 162
    .end local v3    # "result":[B
    :cond_a
    const-wide v3, 0x40f86a0000000000L    # 100000.0

    mul-double/2addr v3, v0

    double-to-int v3, v3

    .line 163
    .local v3, "v":I
    const/4 v4, 0x5

    .line 164
    .local v4, "len":I
    :goto_1
    if-lez v4, :cond_c

    .line 165
    rem-int/lit8 v7, v3, 0xa

    if-eqz v7, :cond_b

    goto :goto_2

    .line 166
    :cond_b
    div-int/lit8 v3, v3, 0xa

    .line 164
    add-int/lit8 v4, v4, -0x1

    goto :goto_1

    .line 168
    :cond_c
    :goto_2
    if-eqz v2, :cond_d

    move-object v7, v2

    goto :goto_4

    :cond_d
    new-instance v7, Lcom/itextpdf/io/source/ByteBuffer;

    if-eqz v6, :cond_e

    add-int/lit8 v8, v4, 0x3

    goto :goto_3

    :cond_e
    add-int/lit8 v8, v4, 0x2

    :goto_3
    invoke-direct {v7, v8}, Lcom/itextpdf/io/source/ByteBuffer;-><init>(I)V

    .line 169
    .local v7, "buf":Lcom/itextpdf/io/source/ByteBuffer;
    :goto_4
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_5
    if-ge v8, v4, :cond_f

    .line 170
    sget-object v9, Lcom/itextpdf/io/source/ByteUtils;->bytes:[B

    rem-int/lit8 v12, v3, 0xa

    aget-byte v9, v9, v12

    invoke-virtual {v7, v9}, Lcom/itextpdf/io/source/ByteBuffer;->prepend(B)Lcom/itextpdf/io/source/ByteBuffer;

    .line 171
    div-int/lit8 v3, v3, 0xa

    .line 169
    add-int/lit8 v8, v8, 0x1

    goto :goto_5

    .line 173
    .end local v8    # "i":I
    :cond_f
    invoke-virtual {v7, v10}, Lcom/itextpdf/io/source/ByteBuffer;->prepend(B)Lcom/itextpdf/io/source/ByteBuffer;

    move-result-object v8

    const/16 v9, 0x30

    invoke-virtual {v8, v9}, Lcom/itextpdf/io/source/ByteBuffer;->prepend(B)Lcom/itextpdf/io/source/ByteBuffer;

    .line 174
    if-eqz v6, :cond_10

    .line 175
    invoke-virtual {v7, v11}, Lcom/itextpdf/io/source/ByteBuffer;->prepend(B)Lcom/itextpdf/io/source/ByteBuffer;

    .line 177
    .end local v3    # "v":I
    .end local v4    # "len":I
    :cond_10
    goto/16 :goto_e

    .end local v7    # "buf":Lcom/itextpdf/io/source/ByteBuffer;
    :cond_11
    const-wide v7, 0x40dfffc000000000L    # 32767.0

    cmpg-double v7, v0, v7

    if-gtz v7, :cond_1d

    .line 178
    const-wide v3, 0x3f747ae147ae147bL    # 0.005

    add-double/2addr v0, v3

    .line 179
    const-wide/high16 v3, 0x4059000000000000L    # 100.0

    mul-double/2addr v3, v0

    double-to-int v3, v3

    .line 181
    .restart local v3    # "v":I
    const v4, 0xf4240

    if-lt v3, v4, :cond_12

    .line 182
    const/4 v4, 0x5

    .local v4, "intLen":I
    goto :goto_6

    .line 183
    .end local v4    # "intLen":I
    :cond_12
    const v4, 0x186a0

    if-lt v3, v4, :cond_13

    .line 184
    const/4 v4, 0x4

    .restart local v4    # "intLen":I
    goto :goto_6

    .line 185
    .end local v4    # "intLen":I
    :cond_13
    const/16 v4, 0x2710

    if-lt v3, v4, :cond_14

    .line 186
    const/4 v4, 0x3

    .restart local v4    # "intLen":I
    goto :goto_6

    .line 187
    .end local v4    # "intLen":I
    :cond_14
    const/16 v4, 0x3e8

    if-lt v3, v4, :cond_15

    .line 188
    const/4 v4, 0x2

    .restart local v4    # "intLen":I
    goto :goto_6

    .line 190
    .end local v4    # "intLen":I
    :cond_15
    const/4 v4, 0x1

    .line 192
    .restart local v4    # "intLen":I
    :goto_6
    const/4 v7, 0x0

    .line 193
    .local v7, "fracLen":I
    rem-int/lit8 v8, v3, 0x64

    if-eqz v8, :cond_17

    .line 195
    const/4 v7, 0x2

    .line 196
    rem-int/lit8 v8, v3, 0xa

    if-eqz v8, :cond_16

    .line 197
    add-int/lit8 v7, v7, 0x1

    goto :goto_7

    .line 199
    :cond_16
    div-int/lit8 v3, v3, 0xa

    goto :goto_7

    .line 202
    :cond_17
    div-int/lit8 v3, v3, 0x64

    .line 204
    :goto_7
    if-eqz v2, :cond_18

    move-object v8, v2

    goto :goto_8

    :cond_18
    new-instance v8, Lcom/itextpdf/io/source/ByteBuffer;

    add-int v9, v4, v7

    add-int/2addr v9, v6

    invoke-direct {v8, v9}, Lcom/itextpdf/io/source/ByteBuffer;-><init>(I)V

    .line 206
    .local v8, "buf":Lcom/itextpdf/io/source/ByteBuffer;
    :goto_8
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_9
    add-int/lit8 v12, v7, -0x1

    if-ge v9, v12, :cond_19

    .line 207
    sget-object v12, Lcom/itextpdf/io/source/ByteUtils;->bytes:[B

    rem-int/lit8 v13, v3, 0xa

    aget-byte v12, v12, v13

    invoke-virtual {v8, v12}, Lcom/itextpdf/io/source/ByteBuffer;->prepend(B)Lcom/itextpdf/io/source/ByteBuffer;

    .line 208
    div-int/lit8 v3, v3, 0xa

    .line 206
    add-int/lit8 v9, v9, 0x1

    goto :goto_9

    .line 210
    .end local v9    # "i":I
    :cond_19
    if-lez v7, :cond_1a

    .line 211
    invoke-virtual {v8, v10}, Lcom/itextpdf/io/source/ByteBuffer;->prepend(B)Lcom/itextpdf/io/source/ByteBuffer;

    .line 213
    :cond_1a
    const/4 v9, 0x0

    .restart local v9    # "i":I
    :goto_a
    if-ge v9, v4, :cond_1b

    .line 214
    sget-object v10, Lcom/itextpdf/io/source/ByteUtils;->bytes:[B

    rem-int/lit8 v12, v3, 0xa

    aget-byte v10, v10, v12

    invoke-virtual {v8, v10}, Lcom/itextpdf/io/source/ByteBuffer;->prepend(B)Lcom/itextpdf/io/source/ByteBuffer;

    .line 215
    div-int/lit8 v3, v3, 0xa

    .line 213
    add-int/lit8 v9, v9, 0x1

    goto :goto_a

    .line 217
    .end local v9    # "i":I
    :cond_1b
    if-eqz v6, :cond_1c

    .line 218
    invoke-virtual {v8, v11}, Lcom/itextpdf/io/source/ByteBuffer;->prepend(B)Lcom/itextpdf/io/source/ByteBuffer;

    .line 220
    .end local v3    # "v":I
    .end local v4    # "intLen":I
    .end local v7    # "fracLen":I
    :cond_1c
    move-object v7, v8

    goto :goto_e

    .line 221
    .end local v8    # "buf":Lcom/itextpdf/io/source/ByteBuffer;
    :cond_1d
    const-wide/high16 v7, 0x3fe0000000000000L    # 0.5

    add-double/2addr v0, v7

    .line 223
    const-wide/high16 v7, 0x43e0000000000000L    # 9.223372036854776E18

    cmpl-double v7, v0, v7

    if-lez v7, :cond_1e

    .line 225
    const-wide v3, 0x7fffffffffffffffL

    .local v3, "v":J
    goto :goto_b

    .line 227
    .end local v3    # "v":J
    :cond_1e
    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v7

    if-eqz v7, :cond_1f

    .line 228
    invoke-static {v4}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v4

    .line 229
    .local v4, "logger":Lorg/slf4j/Logger;
    invoke-interface {v4, v3}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 231
    const-wide/16 v0, 0x0

    .line 233
    .end local v4    # "logger":Lorg/slf4j/Logger;
    :cond_1f
    double-to-long v3, v0

    .line 235
    .restart local v3    # "v":J
    :goto_b
    invoke-static {v3, v4}, Lcom/itextpdf/io/source/ByteUtils;->longSize(J)I

    move-result v7

    .line 236
    .local v7, "intLen":I
    if-nez v2, :cond_20

    new-instance v8, Lcom/itextpdf/io/source/ByteBuffer;

    add-int v9, v7, v6

    invoke-direct {v8, v9}, Lcom/itextpdf/io/source/ByteBuffer;-><init>(I)V

    goto :goto_c

    :cond_20
    move-object v8, v2

    .line 237
    .restart local v8    # "buf":Lcom/itextpdf/io/source/ByteBuffer;
    :goto_c
    const/4 v9, 0x0

    .restart local v9    # "i":I
    :goto_d
    if-ge v9, v7, :cond_21

    .line 238
    sget-object v10, Lcom/itextpdf/io/source/ByteUtils;->bytes:[B

    const-wide/16 v12, 0xa

    rem-long v14, v3, v12

    long-to-int v14, v14

    aget-byte v10, v10, v14

    invoke-virtual {v8, v10}, Lcom/itextpdf/io/source/ByteBuffer;->prepend(B)Lcom/itextpdf/io/source/ByteBuffer;

    .line 239
    div-long/2addr v3, v12

    .line 237
    add-int/lit8 v9, v9, 0x1

    goto :goto_d

    .line 241
    .end local v9    # "i":I
    :cond_21
    if-eqz v6, :cond_22

    .line 242
    invoke-virtual {v8, v11}, Lcom/itextpdf/io/source/ByteBuffer;->prepend(B)Lcom/itextpdf/io/source/ByteBuffer;

    .line 246
    .end local v3    # "v":J
    .end local v7    # "intLen":I
    :cond_22
    move-object v7, v8

    .end local v8    # "buf":Lcom/itextpdf/io/source/ByteBuffer;
    .local v7, "buf":Lcom/itextpdf/io/source/ByteBuffer;
    :goto_e
    if-nez v2, :cond_23

    invoke-virtual {v7}, Lcom/itextpdf/io/source/ByteBuffer;->getInternalBuffer()[B

    move-result-object v5

    :cond_23
    return-object v5
.end method

.method public static getIsoBytes(I)[B
    .locals 1
    .param p0, "n"    # I

    .line 80
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(ILcom/itextpdf/io/source/ByteBuffer;)[B

    move-result-object v0

    return-object v0
.end method

.method static getIsoBytes(ILcom/itextpdf/io/source/ByteBuffer;)[B
    .locals 6
    .param p0, "n"    # I
    .param p1, "buffer"    # Lcom/itextpdf/io/source/ByteBuffer;

    .line 88
    const/4 v0, 0x0

    .line 89
    .local v0, "negative":Z
    if-gez p0, :cond_0

    .line 90
    const/4 v0, 0x1

    .line 91
    neg-int p0, p0

    .line 93
    :cond_0
    invoke-static {p0}, Lcom/itextpdf/io/source/ByteUtils;->intSize(I)I

    move-result v1

    .line 94
    .local v1, "intLen":I
    if-nez p1, :cond_1

    new-instance v2, Lcom/itextpdf/io/source/ByteBuffer;

    add-int v3, v1, v0

    invoke-direct {v2, v3}, Lcom/itextpdf/io/source/ByteBuffer;-><init>(I)V

    goto :goto_0

    :cond_1
    move-object v2, p1

    .line 95
    .local v2, "buf":Lcom/itextpdf/io/source/ByteBuffer;
    :goto_0
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    if-ge v3, v1, :cond_2

    .line 96
    sget-object v4, Lcom/itextpdf/io/source/ByteUtils;->bytes:[B

    rem-int/lit8 v5, p0, 0xa

    aget-byte v4, v4, v5

    invoke-virtual {v2, v4}, Lcom/itextpdf/io/source/ByteBuffer;->prepend(B)Lcom/itextpdf/io/source/ByteBuffer;

    .line 97
    div-int/lit8 p0, p0, 0xa

    .line 95
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 99
    .end local v3    # "i":I
    :cond_2
    if-eqz v0, :cond_3

    .line 100
    const/16 v3, 0x2d

    invoke-virtual {v2, v3}, Lcom/itextpdf/io/source/ByteBuffer;->prepend(B)Lcom/itextpdf/io/source/ByteBuffer;

    .line 102
    :cond_3
    if-nez p1, :cond_4

    invoke-virtual {v2}, Lcom/itextpdf/io/source/ByteBuffer;->getInternalBuffer()[B

    move-result-object v3

    goto :goto_2

    :cond_4
    const/4 v3, 0x0

    :goto_2
    return-object v3
.end method

.method public static getIsoBytes(Ljava/lang/String;)[B
    .locals 4
    .param p0, "text"    # Ljava/lang/String;

    .line 42
    if-nez p0, :cond_0

    .line 43
    const/4 v0, 0x0

    return-object v0

    .line 44
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .line 45
    .local v0, "len":I
    new-array v1, v0, [B

    .line 46
    .local v1, "b":[B
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_0
    if-ge v2, v0, :cond_1

    .line 47
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    .line 46
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 48
    .end local v2    # "k":I
    :cond_1
    return-object v1
.end method

.method private static intSize(I)I
    .locals 5
    .param p0, "l"    # I

    .line 260
    const-wide/16 v0, 0xa

    .line 261
    .local v0, "m":J
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_0
    const/16 v3, 0xa

    if-ge v2, v3, :cond_1

    .line 262
    int-to-long v3, p0

    cmp-long v3, v3, v0

    if-gez v3, :cond_0

    .line 263
    return v2

    .line 264
    :cond_0
    const-wide/16 v3, 0xa

    mul-long/2addr v0, v3

    .line 261
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 266
    .end local v2    # "i":I
    :cond_1
    return v3
.end method

.method private static longSize(J)I
    .locals 5
    .param p0, "l"    # J

    .line 250
    const-wide/16 v0, 0xa

    .line 251
    .local v0, "m":J
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_0
    const/16 v3, 0x13

    if-ge v2, v3, :cond_1

    .line 252
    cmp-long v3, p0, v0

    if-gez v3, :cond_0

    .line 253
    return v2

    .line 254
    :cond_0
    const-wide/16 v3, 0xa

    mul-long/2addr v0, v3

    .line 251
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 256
    .end local v2    # "i":I
    :cond_1
    return v3
.end method
