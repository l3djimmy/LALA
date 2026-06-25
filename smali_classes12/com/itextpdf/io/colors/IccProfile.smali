.class public Lcom/itextpdf/io/colors/IccProfile;
.super Ljava/lang/Object;
.source "IccProfile.java"


# static fields
.field private static cstags:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected data:[B

.field protected numComponents:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 42
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/itextpdf/io/colors/IccProfile;->cstags:Ljava/util/Map;

    .line 230
    sget-object v0, Lcom/itextpdf/io/colors/IccProfile;->cstags:Ljava/util/Map;

    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "XYZ "

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 231
    sget-object v0, Lcom/itextpdf/io/colors/IccProfile;->cstags:Ljava/util/Map;

    const-string v2, "Lab "

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 232
    sget-object v0, Lcom/itextpdf/io/colors/IccProfile;->cstags:Ljava/util/Map;

    const-string v2, "Luv "

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 233
    sget-object v0, Lcom/itextpdf/io/colors/IccProfile;->cstags:Ljava/util/Map;

    const-string v2, "YCbr"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 234
    sget-object v0, Lcom/itextpdf/io/colors/IccProfile;->cstags:Ljava/util/Map;

    const-string v2, "Yxy "

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 235
    sget-object v0, Lcom/itextpdf/io/colors/IccProfile;->cstags:Ljava/util/Map;

    const-string v2, "RGB "

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    sget-object v0, Lcom/itextpdf/io/colors/IccProfile;->cstags:Ljava/util/Map;

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "GRAY"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 237
    sget-object v0, Lcom/itextpdf/io/colors/IccProfile;->cstags:Ljava/util/Map;

    const-string v2, "HSV "

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 238
    sget-object v0, Lcom/itextpdf/io/colors/IccProfile;->cstags:Ljava/util/Map;

    const-string v2, "HLS "

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 239
    sget-object v0, Lcom/itextpdf/io/colors/IccProfile;->cstags:Ljava/util/Map;

    const/4 v2, 0x4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "CMYK"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    sget-object v0, Lcom/itextpdf/io/colors/IccProfile;->cstags:Ljava/util/Map;

    const-string v3, "CMY "

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 241
    sget-object v0, Lcom/itextpdf/io/colors/IccProfile;->cstags:Ljava/util/Map;

    const/4 v3, 0x2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string v4, "2CLR"

    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 242
    sget-object v0, Lcom/itextpdf/io/colors/IccProfile;->cstags:Ljava/util/Map;

    const-string v3, "3CLR"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 243
    sget-object v0, Lcom/itextpdf/io/colors/IccProfile;->cstags:Ljava/util/Map;

    const-string v1, "4CLR"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 244
    sget-object v0, Lcom/itextpdf/io/colors/IccProfile;->cstags:Ljava/util/Map;

    const/4 v1, 0x5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "5CLR"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 245
    sget-object v0, Lcom/itextpdf/io/colors/IccProfile;->cstags:Ljava/util/Map;

    const/4 v1, 0x6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "6CLR"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 246
    sget-object v0, Lcom/itextpdf/io/colors/IccProfile;->cstags:Ljava/util/Map;

    const/4 v1, 0x7

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "7CLR"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 247
    sget-object v0, Lcom/itextpdf/io/colors/IccProfile;->cstags:Ljava/util/Map;

    const/16 v1, 0x8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "8CLR"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 248
    sget-object v0, Lcom/itextpdf/io/colors/IccProfile;->cstags:Ljava/util/Map;

    const/16 v1, 0x9

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "9CLR"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 249
    sget-object v0, Lcom/itextpdf/io/colors/IccProfile;->cstags:Ljava/util/Map;

    const/16 v1, 0xa

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "ACLR"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 250
    sget-object v0, Lcom/itextpdf/io/colors/IccProfile;->cstags:Ljava/util/Map;

    const/16 v1, 0xb

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "BCLR"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 251
    sget-object v0, Lcom/itextpdf/io/colors/IccProfile;->cstags:Ljava/util/Map;

    const/16 v1, 0xc

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "CCLR"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 252
    sget-object v0, Lcom/itextpdf/io/colors/IccProfile;->cstags:Ljava/util/Map;

    const/16 v1, 0xd

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "DCLR"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 253
    sget-object v0, Lcom/itextpdf/io/colors/IccProfile;->cstags:Ljava/util/Map;

    const/16 v1, 0xe

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "ECLR"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 254
    sget-object v0, Lcom/itextpdf/io/colors/IccProfile;->cstags:Ljava/util/Map;

    const/16 v1, 0xf

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "FCLR"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 255
    return-void
.end method

.method protected constructor <init>()V
    .locals 0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    return-void
.end method

.method public static getIccColorSpaceName([B)Ljava/lang/String;
    .locals 4
    .param p0, "data"    # [B

    .line 177
    :try_start_0
    new-instance v0, Ljava/lang/String;

    const-string v1, "US-ASCII"

    const/16 v2, 0x10

    const/4 v3, 0x4

    invoke-direct {v0, p0, v2, v3, v1}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 180
    .local v0, "colorSpace":Ljava/lang/String;
    nop

    .line 181
    return-object v0

    .line 178
    .end local v0    # "colorSpace":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 179
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v2, "Invalid ICC profile."

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static getIccDeviceClass([B)Ljava/lang/String;
    .locals 4
    .param p0, "data"    # [B

    .line 194
    :try_start_0
    new-instance v0, Ljava/lang/String;

    const-string v1, "US-ASCII"

    const/16 v2, 0xc

    const/4 v3, 0x4

    invoke-direct {v0, p0, v2, v3, v1}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 197
    .local v0, "deviceClass":Ljava/lang/String;
    nop

    .line 198
    return-object v0

    .line 195
    .end local v0    # "deviceClass":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 196
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v2, "Invalid ICC profile."

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static getIccNumberOfComponents([B)Ljava/lang/Integer;
    .locals 2
    .param p0, "data"    # [B

    .line 208
    sget-object v0, Lcom/itextpdf/io/colors/IccProfile;->cstags:Ljava/util/Map;

    invoke-static {p0}, Lcom/itextpdf/io/colors/IccProfile;->getIccColorSpaceName([B)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    return-object v0
.end method

.method public static getInstance(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)Lcom/itextpdf/io/colors/IccProfile;
    .locals 7
    .param p0, "file"    # Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    .line 96
    const-string v0, "Invalid ICC profile."

    const/16 v1, 0x80

    :try_start_0
    new-array v1, v1, [B

    .line 97
    .local v1, "head":[B
    array-length v2, v1

    .line 98
    .local v2, "remain":I
    const/4 v3, 0x0

    .line 99
    .local v3, "ptr":I
    :goto_0
    if-lez v2, :cond_1

    .line 100
    invoke-virtual {p0, v1, v3, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read([BII)I

    move-result v4

    .line 101
    .local v4, "n":I
    if-ltz v4, :cond_0

    .line 103
    sub-int/2addr v2, v4

    .line 104
    add-int/2addr v3, v4

    .line 105
    .end local v4    # "n":I
    goto :goto_0

    .line 102
    .restart local v4    # "n":I
    :cond_0
    new-instance v5, Lcom/itextpdf/io/exceptions/IOException;

    invoke-direct {v5, v0}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    .end local p0    # "file":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    throw v5

    .line 106
    .end local v4    # "n":I
    .restart local p0    # "file":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    :cond_1
    const/16 v4, 0x24

    aget-byte v4, v1, v4

    const/16 v5, 0x61

    if-ne v4, v5, :cond_4

    const/16 v4, 0x25

    aget-byte v4, v1, v4

    const/16 v5, 0x63

    if-ne v4, v5, :cond_4

    const/16 v4, 0x26

    aget-byte v4, v1, v4

    const/16 v5, 0x73

    if-ne v4, v5, :cond_4

    const/16 v4, 0x27

    aget-byte v4, v1, v4

    const/16 v5, 0x70

    if-ne v4, v5, :cond_4

    .line 110
    const/4 v4, 0x0

    aget-byte v5, v1, v4

    and-int/lit16 v5, v5, 0xff

    shl-int/lit8 v5, v5, 0x18

    const/4 v6, 0x1

    aget-byte v6, v1, v6

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x10

    or-int/2addr v5, v6

    const/4 v6, 0x2

    aget-byte v6, v1, v6

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x8

    or-int/2addr v5, v6

    const/4 v6, 0x3

    aget-byte v6, v1, v6

    and-int/lit16 v6, v6, 0xff

    or-int v2, v5, v6

    .line 112
    new-array v5, v2, [B

    .line 113
    .local v5, "icc":[B
    array-length v6, v1

    invoke-static {v1, v4, v5, v4, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 114
    array-length v4, v1

    sub-int/2addr v2, v4

    .line 115
    array-length v4, v1

    .line 116
    .end local v3    # "ptr":I
    .local v4, "ptr":I
    :goto_1
    if-lez v2, :cond_3

    .line 117
    invoke-virtual {p0, v5, v4, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read([BII)I

    move-result v3

    .line 118
    .local v3, "n":I
    if-ltz v3, :cond_2

    .line 121
    sub-int/2addr v2, v3

    .line 122
    add-int/2addr v4, v3

    .line 123
    .end local v3    # "n":I
    goto :goto_1

    .line 119
    .restart local v3    # "n":I
    :cond_2
    new-instance v6, Lcom/itextpdf/io/exceptions/IOException;

    invoke-direct {v6, v0}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    .end local p0    # "file":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    throw v6

    .line 124
    .end local v3    # "n":I
    .restart local p0    # "file":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    :cond_3
    invoke-static {v5}, Lcom/itextpdf/io/colors/IccProfile;->getInstance([B)Lcom/itextpdf/io/colors/IccProfile;

    move-result-object v0

    return-object v0

    .line 108
    .end local v4    # "ptr":I
    .end local v5    # "icc":[B
    .local v3, "ptr":I
    :cond_4
    new-instance v4, Lcom/itextpdf/io/exceptions/IOException;

    invoke-direct {v4, v0}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    .end local p0    # "file":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    throw v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 125
    .end local v1    # "head":[B
    .end local v2    # "remain":I
    .end local v3    # "ptr":I
    .restart local p0    # "file":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    :catch_0
    move-exception v1

    .line 126
    .local v1, "ex":Ljava/lang/Exception;
    new-instance v2, Lcom/itextpdf/io/exceptions/IOException;

    invoke-direct {v2, v0, v1}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static getInstance(Ljava/io/InputStream;)Lcom/itextpdf/io/colors/IccProfile;
    .locals 3
    .param p0, "stream"    # Ljava/io/InputStream;

    .line 141
    :try_start_0
    new-instance v0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    new-instance v1, Lcom/itextpdf/io/source/RandomAccessSourceFactory;

    invoke-direct {v1}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;-><init>()V

    .line 142
    invoke-virtual {v1, p0}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->createSource(Ljava/io/InputStream;)Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 145
    .local v0, "raf":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    nop

    .line 146
    invoke-static {v0}, Lcom/itextpdf/io/colors/IccProfile;->getInstance(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)Lcom/itextpdf/io/colors/IccProfile;

    move-result-object v1

    return-object v1

    .line 143
    .end local v0    # "raf":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    :catch_0
    move-exception v0

    .line 144
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v2, "Invalid ICC profile."

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static getInstance(Ljava/lang/String;)Lcom/itextpdf/io/colors/IccProfile;
    .locals 3
    .param p0, "filename"    # Ljava/lang/String;

    .line 159
    :try_start_0
    new-instance v0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    new-instance v1, Lcom/itextpdf/io/source/RandomAccessSourceFactory;

    invoke-direct {v1}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;-><init>()V

    .line 160
    invoke-virtual {v1, p0}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->createBestSource(Ljava/lang/String;)Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 163
    .local v0, "raf":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    nop

    .line 164
    invoke-static {v0}, Lcom/itextpdf/io/colors/IccProfile;->getInstance(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)Lcom/itextpdf/io/colors/IccProfile;

    move-result-object v1

    return-object v1

    .line 161
    .end local v0    # "raf":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    :catch_0
    move-exception v0

    .line 162
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v2, "Invalid ICC profile."

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static getInstance([B)Lcom/itextpdf/io/colors/IccProfile;
    .locals 3
    .param p0, "data"    # [B

    .line 81
    invoke-static {p0}, Lcom/itextpdf/io/colors/IccProfile;->getIccNumberOfComponents([B)Ljava/lang/Integer;

    move-result-object v0

    .line 82
    .local v0, "cs":Ljava/lang/Integer;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 83
    .local v1, "numComponents":I
    :goto_0
    invoke-static {p0, v1}, Lcom/itextpdf/io/colors/IccProfile;->getInstance([BI)Lcom/itextpdf/io/colors/IccProfile;

    move-result-object v2

    return-object v2
.end method

.method public static getInstance([BI)Lcom/itextpdf/io/colors/IccProfile;
    .locals 6
    .param p0, "data"    # [B
    .param p1, "numComponents"    # I

    .line 57
    array-length v0, p0

    const/16 v1, 0x80

    if-lt v0, v1, :cond_2

    const/16 v0, 0x24

    aget-byte v0, p0, v0

    const/16 v1, 0x61

    if-ne v0, v1, :cond_2

    const/16 v0, 0x25

    aget-byte v0, p0, v0

    const/16 v1, 0x63

    if-ne v0, v1, :cond_2

    const/16 v0, 0x26

    aget-byte v0, p0, v0

    const/16 v1, 0x73

    if-ne v0, v1, :cond_2

    const/16 v0, 0x27

    aget-byte v0, p0, v0

    const/16 v1, 0x70

    if-ne v0, v1, :cond_2

    .line 60
    new-instance v0, Lcom/itextpdf/io/colors/IccProfile;

    invoke-direct {v0}, Lcom/itextpdf/io/colors/IccProfile;-><init>()V

    .line 61
    .local v0, "icc":Lcom/itextpdf/io/colors/IccProfile;
    iput-object p0, v0, Lcom/itextpdf/io/colors/IccProfile;->data:[B

    .line 63
    invoke-static {p0}, Lcom/itextpdf/io/colors/IccProfile;->getIccNumberOfComponents([B)Ljava/lang/Integer;

    move-result-object v1

    .line 64
    .local v1, "cs":Ljava/lang/Integer;
    if-nez v1, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 65
    .local v2, "nc":I
    :goto_0
    iput v2, v0, Lcom/itextpdf/io/colors/IccProfile;->numComponents:I

    .line 67
    if-ne v2, p1, :cond_1

    .line 70
    return-object v0

    .line 68
    :cond_1
    new-instance v3, Lcom/itextpdf/io/exceptions/IOException;

    const-string v4, "ICC profile contains {0} components, while the image data contains {1} components."

    invoke-direct {v3, v4}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {v4, v5}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v3

    throw v3

    .line 59
    .end local v0    # "icc":Lcom/itextpdf/io/colors/IccProfile;
    .end local v1    # "cs":Ljava/lang/Integer;
    .end local v2    # "nc":I
    :cond_2
    new-instance v0, Lcom/itextpdf/io/exceptions/IOException;

    const-string v1, "Invalid ICC profile."

    invoke-direct {v0, v1}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public getData()[B
    .locals 1

    .line 217
    iget-object v0, p0, Lcom/itextpdf/io/colors/IccProfile;->data:[B

    return-object v0
.end method

.method public getNumComponents()I
    .locals 1

    .line 226
    iget v0, p0, Lcom/itextpdf/io/colors/IccProfile;->numComponents:I

    return v0
.end method
