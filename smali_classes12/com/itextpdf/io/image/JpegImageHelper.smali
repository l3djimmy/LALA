.class Lcom/itextpdf/io/image/JpegImageHelper;
.super Ljava/lang/Object;
.source "JpegImageHelper.java"


# static fields
.field private static final JFIF_ID:[B

.field private static final LOGGER:Lorg/slf4j/Logger;

.field private static final M_APP0:I = 0xe0

.field private static final M_APP2:I = 0xe2

.field private static final M_APPD:I = 0xed

.field private static final M_APPE:I = 0xee

.field private static final NOPARAM_MARKER:I = 0x2

.field private static final NOPARAM_MARKERS:[I

.field private static final NOT_A_MARKER:I = -0x1

.field private static final PS_8BIM_RESO:[B

.field private static final UNSUPPORTED_MARKER:I = 0x1

.field private static final UNSUPPORTED_MARKERS:[I

.field private static final VALID_MARKER:I

.field private static final VALID_MARKERS:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 40
    const-class v0, Lcom/itextpdf/io/image/JpegImageHelper;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/io/image/JpegImageHelper;->LOGGER:Lorg/slf4j/Logger;

    .line 55
    const/16 v0, 0xc1

    const/16 v1, 0xc2

    const/16 v2, 0xc0

    filled-new-array {v2, v0, v1}, [I

    move-result-object v0

    sput-object v0, Lcom/itextpdf/io/image/JpegImageHelper;->VALID_MARKERS:[I

    .line 65
    const/16 v0, 0xb

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/itextpdf/io/image/JpegImageHelper;->UNSUPPORTED_MARKERS:[I

    .line 75
    const/16 v0, 0xa

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/itextpdf/io/image/JpegImageHelper;->NOPARAM_MARKERS:[I

    .line 97
    const/4 v0, 0x5

    new-array v0, v0, [B

    fill-array-data v0, :array_2

    sput-object v0, Lcom/itextpdf/io/image/JpegImageHelper;->JFIF_ID:[B

    .line 102
    const/4 v0, 0x6

    new-array v0, v0, [B

    fill-array-data v0, :array_3

    sput-object v0, Lcom/itextpdf/io/image/JpegImageHelper;->PS_8BIM_RESO:[B

    return-void

    nop

    :array_0
    .array-data 4
        0xc3
        0xc5
        0xc6
        0xc7
        0xc8
        0xc9
        0xca
        0xcb
        0xcd
        0xce
        0xcf
    .end array-data

    :array_1
    .array-data 4
        0xd0
        0xd1
        0xd2
        0xd3
        0xd4
        0xd5
        0xd6
        0xd7
        0xd8
        0x1
    .end array-data

    :array_2
    .array-data 1
        0x4at
        0x46t
        0x49t
        0x46t
        0x0t
    .end array-data

    nop

    :array_3
    .array-data 1
        0x38t
        0x42t
        0x49t
        0x4dt
        0x3t
        -0x13t
    .end array-data
.end method

.method constructor <init>()V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static attemptToSetIccProfileToImage([[BLcom/itextpdf/io/image/ImageData;)V
    .locals 7
    .param p0, "icc"    # [[B
    .param p1, "image"    # Lcom/itextpdf/io/image/ImageData;

    .line 138
    if-eqz p0, :cond_3

    .line 139
    const/4 v0, 0x0

    .line 140
    .local v0, "total":I
    array-length v1, p0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    const/16 v4, 0xe

    if-ge v3, v1, :cond_1

    aget-object v5, p0, v3

    .line 141
    .local v5, "value":[B
    if-nez v5, :cond_0

    .line 142
    return-void

    .line 144
    :cond_0
    array-length v6, v5

    sub-int/2addr v6, v4

    add-int/2addr v0, v6

    .line 140
    .end local v5    # "value":[B
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 146
    :cond_1
    new-array v1, v0, [B

    .line 147
    .local v1, "ficc":[B
    const/4 v0, 0x0

    .line 148
    array-length v3, p0

    :goto_1
    if-ge v2, v3, :cond_2

    aget-object v5, p0, v2

    .line 149
    .local v5, "bytes":[B
    array-length v6, v5

    sub-int/2addr v6, v4

    invoke-static {v5, v4, v1, v0, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 150
    array-length v6, v5

    sub-int/2addr v6, v4

    add-int/2addr v0, v6

    .line 148
    .end local v5    # "bytes":[B
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 153
    :cond_2
    :try_start_0
    invoke-virtual {p1}, Lcom/itextpdf/io/image/ImageData;->getColorEncodingComponentsNumber()I

    move-result v2

    invoke-static {v1, v2}, Lcom/itextpdf/io/colors/IccProfile;->getInstance([BI)Lcom/itextpdf/io/colors/IccProfile;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/itextpdf/io/image/ImageData;->setProfile(Lcom/itextpdf/io/colors/IccProfile;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 158
    goto :goto_2

    .line 154
    :catch_0
    move-exception v2

    .line 155
    .local v2, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/itextpdf/io/image/JpegImageHelper;->LOGGER:Lorg/slf4j/Logger;

    .line 157
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    filled-new-array {v4, v5}, [Ljava/lang/Object;

    move-result-object v4

    .line 155
    const-string v5, "During the construction of the ICC profile, the {0} error with message \"{1}\" occurred, the ICC profile will not be installed in the image."

    invoke-static {v5, v4}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 160
    .end local v0    # "total":I
    .end local v1    # "ficc":[B
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_3
    :goto_2
    return-void
.end method

.method private static getShort(Ljava/io/InputStream;)I
    .locals 2
    .param p0, "jpegStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 372
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v0

    shl-int/lit8 v0, v0, 0x8

    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method private static marker(I)I
    .locals 2
    .param p0, "marker"    # I

    .line 382
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v1, Lcom/itextpdf/io/image/JpegImageHelper;->VALID_MARKERS:[I

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 383
    sget-object v1, Lcom/itextpdf/io/image/JpegImageHelper;->VALID_MARKERS:[I

    aget v1, v1, v0

    if-ne p0, v1, :cond_0

    .line 384
    const/4 v1, 0x0

    return v1

    .line 382
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 387
    .end local v0    # "i":I
    :cond_1
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_1
    sget-object v1, Lcom/itextpdf/io/image/JpegImageHelper;->NOPARAM_MARKERS:[I

    array-length v1, v1

    if-ge v0, v1, :cond_3

    .line 388
    sget-object v1, Lcom/itextpdf/io/image/JpegImageHelper;->NOPARAM_MARKERS:[I

    aget v1, v1, v0

    if-ne p0, v1, :cond_2

    .line 389
    const/4 v1, 0x2

    return v1

    .line 387
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 392
    .end local v0    # "i":I
    :cond_3
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_2
    sget-object v1, Lcom/itextpdf/io/image/JpegImageHelper;->UNSUPPORTED_MARKERS:[I

    array-length v1, v1

    if-ge v0, v1, :cond_5

    .line 393
    sget-object v1, Lcom/itextpdf/io/image/JpegImageHelper;->UNSUPPORTED_MARKERS:[I

    aget v1, v1, v0

    if-ne p0, v1, :cond_4

    .line 394
    const/4 v1, 0x1

    return v1

    .line 392
    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 397
    .end local v0    # "i":I
    :cond_5
    const/4 v0, -0x1

    return v0
.end method

.method public static processImage(Lcom/itextpdf/io/image/ImageData;)V
    .locals 4
    .param p0, "image"    # Lcom/itextpdf/io/image/ImageData;

    .line 111
    invoke-virtual {p0}, Lcom/itextpdf/io/image/ImageData;->getOriginalType()Lcom/itextpdf/io/image/ImageType;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/io/image/ImageType;->JPEG:Lcom/itextpdf/io/image/ImageType;

    if-ne v0, v1, :cond_2

    .line 113
    const/4 v0, 0x0

    .line 116
    .local v0, "jpegStream":Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {p0}, Lcom/itextpdf/io/image/ImageData;->getData()[B

    move-result-object v1

    if-nez v1, :cond_0

    .line 117
    invoke-virtual {p0}, Lcom/itextpdf/io/image/ImageData;->loadData()V

    .line 118
    invoke-virtual {p0}, Lcom/itextpdf/io/image/ImageData;->getUrl()Ljava/net/URL;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v1

    .local v1, "errorID":Ljava/lang/String;
    goto :goto_0

    .line 120
    .end local v1    # "errorID":Ljava/lang/String;
    :cond_0
    const-string v1, "Byte array"

    .line 122
    .restart local v1    # "errorID":Ljava/lang/String;
    :goto_0
    new-instance v2, Ljava/io/ByteArrayInputStream;

    invoke-virtual {p0}, Lcom/itextpdf/io/image/ImageData;->getData()[B

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    move-object v0, v2

    .line 123
    invoke-virtual {p0}, Lcom/itextpdf/io/image/ImageData;->getData()[B

    move-result-object v2

    array-length v2, v2

    iput v2, p0, Lcom/itextpdf/io/image/ImageData;->imageSize:I

    .line 124
    invoke-static {v0, v1, p0}, Lcom/itextpdf/io/image/JpegImageHelper;->processParameters(Ljava/io/InputStream;Ljava/lang/String;Lcom/itextpdf/io/image/ImageData;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 128
    .end local v1    # "errorID":Ljava/lang/String;
    nop

    .line 130
    :try_start_1
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 131
    :goto_1
    goto :goto_2

    :catch_0
    move-exception v1

    goto :goto_1

    .line 134
    :goto_2
    invoke-static {p0}, Lcom/itextpdf/io/image/JpegImageHelper;->updateAttributes(Lcom/itextpdf/io/image/ImageData;)V

    .line 135
    return-void

    .line 128
    :catchall_0
    move-exception v1

    goto :goto_3

    .line 125
    :catch_1
    move-exception v1

    .line 126
    .local v1, "e":Ljava/io/IOException;
    :try_start_2
    new-instance v2, Lcom/itextpdf/io/exceptions/IOException;

    const-string v3, "JPEG image exception."

    invoke-direct {v2, v3, v1}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .end local v0    # "jpegStream":Ljava/io/InputStream;
    .end local p0    # "image":Lcom/itextpdf/io/image/ImageData;
    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 128
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v0    # "jpegStream":Ljava/io/InputStream;
    .restart local p0    # "image":Lcom/itextpdf/io/image/ImageData;
    :goto_3
    if-eqz v0, :cond_1

    .line 130
    :try_start_3
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 131
    :goto_4
    goto :goto_5

    :catch_2
    move-exception v2

    goto :goto_4

    .line 133
    :cond_1
    :goto_5
    throw v1

    .line 112
    .end local v0    # "jpegStream":Ljava/io/InputStream;
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "JPEG image expected"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static processParameters(Ljava/io/InputStream;Ljava/lang/String;Lcom/itextpdf/io/image/ImageData;)V
    .locals 22
    .param p0, "jpegStream"    # Ljava/io/InputStream;
    .param p1, "errorID"    # Ljava/lang/String;
    .param p2, "image"    # Lcom/itextpdf/io/image/ImageData;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 182
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    const/4 v2, 0x0

    check-cast v2, [[B

    .line 183
    .local v2, "icc":[[B
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v3

    const/16 v4, 0xff

    if-ne v3, v4, :cond_2a

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v3

    const/16 v5, 0xd8

    if-ne v3, v5, :cond_2a

    .line 186
    const/4 v3, 0x1

    .line 189
    .local v3, "firstPass":Z
    :goto_0
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v5

    .line 190
    .local v5, "v":I
    if-ltz v5, :cond_29

    .line 192
    if-ne v5, v4, :cond_28

    .line 193
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v6

    .line 194
    .local v6, "marker":I
    const-wide/16 v7, 0x2

    const/16 v9, 0x10

    const/4 v13, 0x1

    if-eqz v3, :cond_7

    const/16 v14, 0xe0

    if-ne v6, v14, :cond_7

    .line 195
    const/4 v3, 0x0

    .line 196
    invoke-static {v0}, Lcom/itextpdf/io/image/JpegImageHelper;->getShort(Ljava/io/InputStream;)I

    move-result v14

    .line 197
    .local v14, "len":I
    if-ge v14, v9, :cond_0

    .line 198
    add-int/lit8 v7, v14, -0x2

    int-to-long v7, v7

    invoke-static {v0, v7, v8}, Lcom/itextpdf/io/util/StreamUtil;->skip(Ljava/io/InputStream;J)V

    .line 199
    goto :goto_4

    .line 201
    :cond_0
    sget-object v9, Lcom/itextpdf/io/image/JpegImageHelper;->JFIF_ID:[B

    array-length v9, v9

    new-array v9, v9, [B

    .line 202
    .local v9, "bcomp":[B
    invoke-virtual {v0, v9}, Ljava/io/InputStream;->read([B)I

    move-result v15

    .line 203
    .local v15, "r":I
    const/high16 v16, 0x3f000000    # 0.5f

    array-length v10, v9

    if-ne v15, v10, :cond_6

    .line 205
    const/4 v10, 0x1

    .line 206
    .local v10, "found":Z
    const/16 v17, 0x0

    move/from16 v11, v17

    const v18, 0x40228f5c    # 2.54f

    .local v11, "k":I
    :goto_1
    array-length v4, v9

    if-ge v11, v4, :cond_2

    .line 207
    aget-byte v4, v9, v11

    sget-object v19, Lcom/itextpdf/io/image/JpegImageHelper;->JFIF_ID:[B

    aget-byte v12, v19, v11

    if-eq v4, v12, :cond_1

    .line 208
    const/4 v10, 0x0

    .line 209
    goto :goto_2

    .line 206
    :cond_1
    add-int/lit8 v11, v11, 0x1

    const/16 v4, 0xff

    goto :goto_1

    .line 212
    .end local v11    # "k":I
    :cond_2
    :goto_2
    if-nez v10, :cond_3

    .line 213
    add-int/lit8 v4, v14, -0x2

    array-length v7, v9

    sub-int/2addr v4, v7

    int-to-long v7, v4

    invoke-static {v0, v7, v8}, Lcom/itextpdf/io/util/StreamUtil;->skip(Ljava/io/InputStream;J)V

    .line 214
    goto :goto_4

    .line 216
    :cond_3
    invoke-static {v0, v7, v8}, Lcom/itextpdf/io/util/StreamUtil;->skip(Ljava/io/InputStream;J)V

    .line 217
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v4

    .line 218
    .local v4, "units":I
    invoke-static {v0}, Lcom/itextpdf/io/image/JpegImageHelper;->getShort(Ljava/io/InputStream;)I

    move-result v7

    .line 219
    .local v7, "dx":I
    invoke-static {v0}, Lcom/itextpdf/io/image/JpegImageHelper;->getShort(Ljava/io/InputStream;)I

    move-result v8

    .line 220
    .local v8, "dy":I
    if-ne v4, v13, :cond_4

    .line 221
    invoke-virtual {v1, v7, v8}, Lcom/itextpdf/io/image/ImageData;->setDpi(II)V

    goto :goto_3

    .line 222
    :cond_4
    const/4 v11, 0x2

    if-ne v4, v11, :cond_5

    .line 223
    int-to-float v11, v7

    mul-float v11, v11, v18

    add-float v11, v11, v16

    float-to-int v11, v11

    int-to-float v12, v8

    mul-float v12, v12, v18

    add-float v12, v12, v16

    float-to-int v12, v12

    invoke-virtual {v1, v11, v12}, Lcom/itextpdf/io/image/ImageData;->setDpi(II)V

    .line 225
    :cond_5
    :goto_3
    add-int/lit8 v11, v14, -0x2

    array-length v12, v9

    sub-int/2addr v11, v12

    add-int/lit8 v11, v11, -0x7

    int-to-long v11, v11

    invoke-static {v0, v11, v12}, Lcom/itextpdf/io/util/StreamUtil;->skip(Ljava/io/InputStream;J)V

    .line 226
    nop

    .line 189
    .end local v4    # "units":I
    .end local v5    # "v":I
    .end local v6    # "marker":I
    .end local v7    # "dx":I
    .end local v8    # "dy":I
    .end local v9    # "bcomp":[B
    .end local v10    # "found":Z
    .end local v14    # "len":I
    .end local v15    # "r":I
    :goto_4
    const/16 v4, 0xff

    goto/16 :goto_0

    .line 204
    .restart local v5    # "v":I
    .restart local v6    # "marker":I
    .restart local v9    # "bcomp":[B
    .restart local v14    # "len":I
    .restart local v15    # "r":I
    :cond_6
    new-instance v4, Lcom/itextpdf/io/exceptions/IOException;

    const-string/jumbo v7, "{0} corrupted jfif marker."

    invoke-direct {v4, v7}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    filled-new-array/range {p1 .. p1}, [Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v4, v7}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v4

    throw v4

    .line 194
    .end local v9    # "bcomp":[B
    .end local v14    # "len":I
    .end local v15    # "r":I
    :cond_7
    const/high16 v16, 0x3f000000    # 0.5f

    const v18, 0x40228f5c    # 2.54f

    .line 228
    const/16 v4, 0xee

    const-string v10, "ISO-8859-1"

    const/4 v11, 0x0

    const/16 v12, 0xc

    if-ne v6, v4, :cond_b

    .line 229
    invoke-static {v0}, Lcom/itextpdf/io/image/JpegImageHelper;->getShort(Ljava/io/InputStream;)I

    move-result v4

    const/16 v20, 0x2

    add-int/lit8 v4, v4, -0x2

    .line 230
    .local v4, "len":I
    new-array v7, v4, [B

    .line 231
    .local v7, "byteappe":[B
    const/4 v8, 0x0

    .local v8, "k":I
    :goto_5
    if-ge v8, v4, :cond_8

    .line 232
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v9

    int-to-byte v9, v9

    aput-byte v9, v7, v8

    .line 231
    add-int/lit8 v8, v8, 0x1

    goto :goto_5

    .line 234
    .end local v8    # "k":I
    :cond_8
    array-length v8, v7

    if-lt v8, v12, :cond_a

    .line 235
    new-instance v8, Ljava/lang/String;

    const/4 v9, 0x5

    invoke-direct {v8, v7, v11, v9, v10}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 236
    .local v8, "appe":Ljava/lang/String;
    const-string v9, "Adobe"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_9

    .line 237
    invoke-virtual {v1, v13}, Lcom/itextpdf/io/image/ImageData;->setInverted(Z)V

    .line 239
    .end local v8    # "appe":Ljava/lang/String;
    :cond_9
    move/from16 v17, v3

    goto/16 :goto_12

    .line 234
    :cond_a
    move/from16 v17, v3

    goto/16 :goto_12

    .line 242
    .end local v4    # "len":I
    .end local v7    # "byteappe":[B
    :cond_b
    const/16 v4, 0xe2

    if-ne v6, v4, :cond_12

    .line 243
    invoke-static {v0}, Lcom/itextpdf/io/image/JpegImageHelper;->getShort(Ljava/io/InputStream;)I

    move-result v4

    const/16 v20, 0x2

    add-int/lit8 v4, v4, -0x2

    .line 244
    .restart local v4    # "len":I
    new-array v7, v4, [B

    .line 245
    .local v7, "byteapp2":[B
    const/4 v8, 0x0

    .local v8, "k":I
    :goto_6
    if-ge v8, v4, :cond_c

    .line 246
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v9

    int-to-byte v9, v9

    aput-byte v9, v7, v8

    .line 245
    add-int/lit8 v8, v8, 0x1

    goto :goto_6

    .line 248
    .end local v8    # "k":I
    :cond_c
    array-length v8, v7

    const/16 v9, 0xe

    if-lt v8, v9, :cond_11

    .line 249
    new-instance v8, Ljava/lang/String;

    const/16 v9, 0xb

    invoke-direct {v8, v7, v11, v9, v10}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 250
    .local v8, "app2":Ljava/lang/String;
    const-string v9, "ICC_PROFILE"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_10

    .line 251
    aget-byte v9, v7, v12

    const/16 v10, 0xff

    and-int/2addr v9, v10

    .line 252
    .local v9, "order":I
    const/16 v11, 0xd

    aget-byte v11, v7, v11

    and-int/2addr v11, v10

    .line 254
    .local v11, "count":I
    if-ge v9, v13, :cond_d

    .line 255
    const/4 v9, 0x1

    .line 256
    :cond_d
    if-ge v11, v13, :cond_e

    .line 257
    const/4 v11, 0x1

    .line 258
    :cond_e
    if-nez v2, :cond_f

    .line 259
    new-array v2, v11, [[B

    .line 260
    :cond_f
    add-int/lit8 v10, v9, -0x1

    aput-object v7, v2, v10

    .line 262
    .end local v8    # "app2":Ljava/lang/String;
    .end local v9    # "order":I
    .end local v11    # "count":I
    :cond_10
    const/16 v4, 0xff

    goto/16 :goto_0

    .line 248
    :cond_11
    move/from16 v17, v3

    goto/16 :goto_12

    .line 265
    .end local v4    # "len":I
    .end local v7    # "byteapp2":[B
    :cond_12
    const/16 v4, 0xed

    const/16 v10, 0x8

    if-ne v6, v4, :cond_23

    .line 266
    invoke-static {v0}, Lcom/itextpdf/io/image/JpegImageHelper;->getShort(Ljava/io/InputStream;)I

    move-result v4

    const/16 v20, 0x2

    add-int/lit8 v4, v4, -0x2

    .line 267
    .restart local v4    # "len":I
    new-array v7, v4, [B

    .line 268
    .local v7, "byteappd":[B
    const/4 v8, 0x0

    .local v8, "k":I
    :goto_7
    if-ge v8, v4, :cond_13

    .line 269
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v11

    int-to-byte v11, v11

    aput-byte v11, v7, v8

    .line 268
    add-int/lit8 v8, v8, 0x1

    goto :goto_7

    .line 273
    .end local v8    # "k":I
    :cond_13
    const/4 v8, 0x0

    .restart local v8    # "k":I
    :goto_8
    sget-object v11, Lcom/itextpdf/io/image/JpegImageHelper;->PS_8BIM_RESO:[B

    array-length v11, v11

    sub-int v11, v4, v11

    if-ge v8, v11, :cond_17

    .line 274
    const/4 v11, 0x1

    .line 275
    .local v11, "found":Z
    const/4 v12, 0x0

    .local v12, "j":I
    :goto_9
    sget-object v14, Lcom/itextpdf/io/image/JpegImageHelper;->PS_8BIM_RESO:[B

    array-length v14, v14

    if-ge v12, v14, :cond_15

    .line 276
    add-int v14, v8, v12

    aget-byte v14, v7, v14

    sget-object v15, Lcom/itextpdf/io/image/JpegImageHelper;->PS_8BIM_RESO:[B

    aget-byte v15, v15, v12

    if-eq v14, v15, :cond_14

    .line 277
    const/4 v11, 0x0

    .line 278
    goto :goto_a

    .line 275
    :cond_14
    add-int/lit8 v12, v12, 0x1

    goto :goto_9

    .line 281
    .end local v12    # "j":I
    :cond_15
    :goto_a
    if-eqz v11, :cond_16

    .line 282
    goto :goto_b

    .line 273
    .end local v11    # "found":Z
    :cond_16
    add-int/lit8 v8, v8, 0x1

    goto :goto_8

    .line 285
    :cond_17
    :goto_b
    sget-object v11, Lcom/itextpdf/io/image/JpegImageHelper;->PS_8BIM_RESO:[B

    array-length v11, v11

    add-int/2addr v8, v11

    .line 286
    sget-object v11, Lcom/itextpdf/io/image/JpegImageHelper;->PS_8BIM_RESO:[B

    array-length v11, v11

    sub-int v11, v4, v11

    if-ge v8, v11, :cond_22

    .line 289
    aget-byte v11, v7, v8

    .line 291
    .local v11, "namelength":B
    add-int/lit8 v12, v11, 0x1

    int-to-byte v11, v12

    .line 293
    rem-int/lit8 v12, v11, 0x2

    if-ne v12, v13, :cond_18

    .line 294
    add-int/lit8 v12, v11, 0x1

    int-to-byte v11, v12

    .line 296
    :cond_18
    add-int/2addr v8, v11

    .line 298
    aget-byte v12, v7, v8

    shl-int/lit8 v12, v12, 0x18

    add-int/lit8 v14, v8, 0x1

    aget-byte v14, v7, v14

    shl-int/2addr v14, v9

    add-int/2addr v12, v14

    add-int/lit8 v14, v8, 0x2

    aget-byte v14, v7, v14

    shl-int/2addr v14, v10

    add-int/2addr v12, v14

    add-int/lit8 v14, v8, 0x3

    aget-byte v14, v7, v14

    add-int/2addr v12, v14

    .line 300
    .local v12, "resosize":I
    if-eq v12, v9, :cond_19

    .line 303
    move/from16 v17, v3

    goto/16 :goto_12

    .line 305
    :cond_19
    add-int/lit8 v8, v8, 0x4

    .line 306
    aget-byte v9, v7, v8

    shl-int/2addr v9, v10

    add-int/lit8 v14, v8, 0x1

    aget-byte v14, v7, v14

    const/16 v15, 0xff

    and-int/2addr v14, v15

    add-int/2addr v9, v14

    .line 307
    .local v9, "dx":I
    const/16 v20, 0x2

    add-int/lit8 v8, v8, 0x2

    .line 309
    add-int/lit8 v8, v8, 0x2

    .line 310
    aget-byte v14, v7, v8

    shl-int/2addr v14, v10

    add-int/lit8 v15, v8, 0x1

    aget-byte v15, v7, v15

    move/from16 v19, v10

    const/16 v10, 0xff

    and-int/2addr v15, v10

    add-int/2addr v14, v15

    .line 311
    .local v14, "unitsx":I
    add-int/lit8 v8, v8, 0x2

    .line 313
    add-int/lit8 v8, v8, 0x2

    .line 314
    aget-byte v10, v7, v8

    shl-int/lit8 v10, v10, 0x8

    add-int/lit8 v15, v8, 0x1

    aget-byte v15, v7, v15

    const/16 v13, 0xff

    and-int/2addr v15, v13

    add-int/2addr v10, v15

    .line 315
    .local v10, "dy":I
    add-int/lit8 v8, v8, 0x2

    .line 317
    add-int/lit8 v8, v8, 0x2

    .line 318
    aget-byte v13, v7, v8

    shl-int/lit8 v13, v13, 0x8

    add-int/lit8 v15, v8, 0x1

    aget-byte v15, v7, v15

    move-object/from16 v21, v7

    const/16 v7, 0xff

    .end local v7    # "byteappd":[B
    .local v21, "byteappd":[B
    and-int/2addr v15, v7

    add-int/2addr v13, v15

    .line 320
    .local v13, "unitsy":I
    const/4 v15, 0x1

    if-eq v14, v15, :cond_1b

    const/4 v15, 0x2

    if-ne v14, v15, :cond_1a

    goto :goto_c

    :cond_1a
    move/from16 v17, v3

    goto :goto_e

    :cond_1b
    const/4 v15, 0x2

    .line 321
    :goto_c
    if-ne v14, v15, :cond_1c

    int-to-float v15, v9

    mul-float v15, v15, v18

    add-float v15, v15, v16

    float-to-int v15, v15

    goto :goto_d

    :cond_1c
    move v15, v9

    :goto_d
    move v9, v15

    .line 323
    invoke-virtual {v1}, Lcom/itextpdf/io/image/ImageData;->getDpiX()I

    move-result v15

    if-eqz v15, :cond_1d

    invoke-virtual {v1}, Lcom/itextpdf/io/image/ImageData;->getDpiX()I

    move-result v15

    if-eq v15, v9, :cond_1d

    .line 324
    sget-object v15, Lcom/itextpdf/io/image/JpegImageHelper;->LOGGER:Lorg/slf4j/Logger;

    invoke-virtual {v1}, Lcom/itextpdf/io/image/ImageData;->getDpiX()I

    move-result v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    move/from16 v17, v3

    .end local v3    # "firstPass":Z
    .local v17, "firstPass":Z
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v7, v3}, [Ljava/lang/Object;

    move-result-object v3

    const-string v7, "Inconsistent metadata (dpiX: {0} vs {1})"

    invoke-static {v7, v3}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v15, v3}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    goto :goto_e

    .line 323
    .end local v17    # "firstPass":Z
    .restart local v3    # "firstPass":Z
    :cond_1d
    move/from16 v17, v3

    .line 326
    .end local v3    # "firstPass":Z
    .restart local v17    # "firstPass":Z
    invoke-virtual {v1}, Lcom/itextpdf/io/image/ImageData;->getDpiY()I

    move-result v3

    invoke-virtual {v1, v9, v3}, Lcom/itextpdf/io/image/ImageData;->setDpi(II)V

    .line 329
    :goto_e
    const/4 v15, 0x1

    if-eq v13, v15, :cond_1e

    const/4 v15, 0x2

    if-ne v13, v15, :cond_21

    goto :goto_f

    :cond_1e
    const/4 v15, 0x2

    .line 330
    :goto_f
    if-ne v13, v15, :cond_1f

    int-to-float v3, v10

    mul-float v3, v3, v18

    add-float v3, v3, v16

    float-to-int v3, v3

    goto :goto_10

    :cond_1f
    move v3, v10

    .line 332
    .end local v10    # "dy":I
    .local v3, "dy":I
    :goto_10
    invoke-virtual {v1}, Lcom/itextpdf/io/image/ImageData;->getDpiY()I

    move-result v7

    if-eqz v7, :cond_20

    invoke-virtual {v1}, Lcom/itextpdf/io/image/ImageData;->getDpiY()I

    move-result v7

    if-eq v7, v3, :cond_20

    .line 333
    sget-object v7, Lcom/itextpdf/io/image/JpegImageHelper;->LOGGER:Lorg/slf4j/Logger;

    invoke-virtual {v1}, Lcom/itextpdf/io/image/ImageData;->getDpiY()I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    filled-new-array {v10, v15}, [Ljava/lang/Object;

    move-result-object v10

    const-string v15, "Inconsistent metadata (dpiY: {0} vs {1})"

    invoke-static {v15, v10}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v7, v10}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    goto :goto_11

    .line 335
    :cond_20
    invoke-virtual {v1}, Lcom/itextpdf/io/image/ImageData;->getDpiX()I

    move-result v7

    invoke-virtual {v1, v7, v9}, Lcom/itextpdf/io/image/ImageData;->setDpi(II)V

    .line 338
    .end local v3    # "dy":I
    .end local v9    # "dx":I
    .end local v11    # "namelength":B
    .end local v12    # "resosize":I
    .end local v13    # "unitsy":I
    .end local v14    # "unitsx":I
    :cond_21
    :goto_11
    goto :goto_12

    .line 286
    .end local v17    # "firstPass":Z
    .end local v21    # "byteappd":[B
    .local v3, "firstPass":Z
    .restart local v7    # "byteappd":[B
    :cond_22
    move/from16 v17, v3

    move-object/from16 v21, v7

    .line 189
    .end local v4    # "len":I
    .end local v5    # "v":I
    .end local v6    # "marker":I
    .end local v7    # "byteappd":[B
    .end local v8    # "k":I
    :goto_12
    move/from16 v3, v17

    const/16 v4, 0xff

    .end local v3    # "firstPass":Z
    .restart local v17    # "firstPass":Z
    goto/16 :goto_0

    .line 341
    .end local v17    # "firstPass":Z
    .restart local v3    # "firstPass":Z
    .restart local v5    # "v":I
    .restart local v6    # "marker":I
    :cond_23
    move/from16 v17, v3

    move-wide v3, v7

    move/from16 v19, v10

    .end local v3    # "firstPass":Z
    .restart local v17    # "firstPass":Z
    const/4 v7, 0x0

    .line 342
    .end local v17    # "firstPass":Z
    .local v7, "firstPass":Z
    invoke-static {v6}, Lcom/itextpdf/io/image/JpegImageHelper;->marker(I)I

    move-result v8

    .line 343
    .local v8, "markertype":I
    if-nez v8, :cond_25

    .line 344
    invoke-static {v0, v3, v4}, Lcom/itextpdf/io/util/StreamUtil;->skip(Ljava/io/InputStream;J)V

    .line 345
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v3

    move/from16 v4, v19

    if-ne v3, v4, :cond_24

    .line 348
    invoke-static {v0}, Lcom/itextpdf/io/image/JpegImageHelper;->getShort(Ljava/io/InputStream;)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v1, v3}, Lcom/itextpdf/io/image/ImageData;->setHeight(F)V

    .line 349
    invoke-static {v0}, Lcom/itextpdf/io/image/JpegImageHelper;->getShort(Ljava/io/InputStream;)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v1, v3}, Lcom/itextpdf/io/image/ImageData;->setWidth(F)V

    .line 350
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v3

    invoke-virtual {v1, v3}, Lcom/itextpdf/io/image/ImageData;->setColorEncodingComponentsNumber(I)V

    .line 351
    const/16 v4, 0x8

    invoke-virtual {v1, v4}, Lcom/itextpdf/io/image/ImageData;->setBpc(I)V

    .line 352
    nop

    .line 361
    .end local v5    # "v":I
    .end local v6    # "marker":I
    .end local v8    # "markertype":I
    invoke-static {v2, v1}, Lcom/itextpdf/io/image/JpegImageHelper;->attemptToSetIccProfileToImage([[BLcom/itextpdf/io/image/ImageData;)V

    .line 362
    return-void

    .line 346
    .restart local v5    # "v":I
    .restart local v6    # "marker":I
    .restart local v8    # "markertype":I
    :cond_24
    new-instance v3, Lcom/itextpdf/io/exceptions/IOException;

    const-string/jumbo v4, "{0} must have 8 bits per component."

    invoke-direct {v3, v4}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    filled-new-array/range {p1 .. p1}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v3

    throw v3

    .line 353
    :cond_25
    const/4 v15, 0x1

    if-eq v8, v15, :cond_27

    .line 355
    const/4 v15, 0x2

    if-eq v8, v15, :cond_26

    .line 356
    invoke-static {v0}, Lcom/itextpdf/io/image/JpegImageHelper;->getShort(Ljava/io/InputStream;)I

    move-result v3

    sub-int/2addr v3, v15

    int-to-long v3, v3

    invoke-static {v0, v3, v4}, Lcom/itextpdf/io/util/StreamUtil;->skip(Ljava/io/InputStream;J)V

    .line 359
    .end local v5    # "v":I
    .end local v6    # "marker":I
    .end local v8    # "markertype":I
    :cond_26
    move-object/from16 v9, p1

    move v3, v7

    goto :goto_13

    .line 354
    .restart local v5    # "v":I
    .restart local v6    # "marker":I
    .restart local v8    # "markertype":I
    :cond_27
    new-instance v3, Lcom/itextpdf/io/exceptions/IOException;

    const-string/jumbo v4, "{0} unsupported jpeg marker {1}."

    invoke-direct {v3, v4}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    invoke-static {v6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v9, p1

    filled-new-array {v9, v4}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v3

    throw v3

    .line 192
    .end local v6    # "marker":I
    .end local v7    # "firstPass":Z
    .end local v8    # "markertype":I
    .restart local v3    # "firstPass":Z
    :cond_28
    move-object/from16 v9, p1

    move/from16 v17, v3

    .line 359
    .end local v5    # "v":I
    :goto_13
    const/16 v4, 0xff

    goto/16 :goto_0

    .line 191
    .restart local v5    # "v":I
    :cond_29
    move/from16 v17, v3

    .end local v3    # "firstPass":Z
    .restart local v17    # "firstPass":Z
    new-instance v3, Lcom/itextpdf/io/exceptions/IOException;

    const-string v4, "Premature EOF while reading JPEG."

    invoke-direct {v3, v4}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 183
    .end local v5    # "v":I
    .end local v17    # "firstPass":Z
    :cond_2a
    move-object/from16 v9, p1

    .line 184
    new-instance v3, Lcom/itextpdf/io/exceptions/IOException;

    const-string/jumbo v4, "{0} is not a valid jpeg file."

    invoke-direct {v3, v4}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    filled-new-array {v9}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v3

    throw v3
.end method

.method private static updateAttributes(Lcom/itextpdf/io/image/ImageData;)V
    .locals 3
    .param p0, "image"    # Lcom/itextpdf/io/image/ImageData;

    .line 163
    const-string v0, "DCTDecode"

    iput-object v0, p0, Lcom/itextpdf/io/image/ImageData;->filter:Ljava/lang/String;

    .line 164
    invoke-virtual {p0}, Lcom/itextpdf/io/image/ImageData;->getColorTransform()I

    move-result v0

    if-nez v0, :cond_0

    .line 165
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 166
    .local v0, "decodeParms":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "ColorTransform"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    iput-object v0, p0, Lcom/itextpdf/io/image/ImageData;->decodeParms:Ljava/util/Map;

    .line 169
    .end local v0    # "decodeParms":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/io/image/ImageData;->getColorEncodingComponentsNumber()I

    move-result v0

    .line 170
    .local v0, "colorComponents":I
    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    invoke-virtual {p0}, Lcom/itextpdf/io/image/ImageData;->isInverted()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 171
    const/16 v1, 0x8

    new-array v1, v1, [F

    fill-array-data v1, :array_0

    iput-object v1, p0, Lcom/itextpdf/io/image/ImageData;->decode:[F

    .line 173
    :cond_1
    return-void

    nop

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method
