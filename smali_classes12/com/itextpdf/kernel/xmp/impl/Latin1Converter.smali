.class public Lcom/itextpdf/kernel/xmp/impl/Latin1Converter;
.super Ljava/lang/Object;
.source "Latin1Converter.java"


# static fields
.field private static final STATE_START:I = 0x0

.field private static final STATE_UTF8CHAR:I = 0xb


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    return-void
.end method

.method public static convert(Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;)Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;
    .locals 11
    .param p0, "buffer"    # Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;

    .line 87
    const-string v0, "UTF-8"

    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->getEncoding()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 90
    const/16 v0, 0x8

    new-array v1, v0, [B

    .line 92
    .local v1, "readAheadBuffer":[B
    const/4 v2, 0x0

    .line 94
    .local v2, "readAhead":I
    const/4 v3, 0x0

    .line 96
    .local v3, "expectedBytes":I
    new-instance v4, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->length()I

    move-result v5

    mul-int/lit8 v5, v5, 0x4

    div-int/lit8 v5, v5, 0x3

    invoke-direct {v4, v5}, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;-><init>(I)V

    .line 98
    .local v4, "out":Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;
    const/4 v5, 0x0

    .line 99
    .local v5, "state":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->length()I

    move-result v7

    if-ge v6, v7, :cond_5

    .line 101
    invoke-virtual {p0, v6}, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->charAt(I)I

    move-result v7

    .line 103
    .local v7, "b":I
    const/16 v8, 0x80

    packed-switch v5, :pswitch_data_0

    .line 107
    const/16 v9, 0x7f

    if-ge v7, v9, :cond_2

    .line 109
    int-to-byte v8, v7

    invoke-virtual {v4, v8}, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->append(B)V

    goto :goto_2

    .line 132
    :pswitch_0
    const/4 v9, 0x0

    if-lez v3, :cond_1

    and-int/lit16 v10, v7, 0xc0

    if-ne v10, v8, :cond_1

    .line 135
    add-int/lit8 v8, v2, 0x1

    .end local v2    # "readAhead":I
    .local v8, "readAhead":I
    int-to-byte v10, v7

    aput-byte v10, v1, v2

    .line 136
    add-int/lit8 v3, v3, -0x1

    .line 138
    if-nez v3, :cond_0

    .line 140
    invoke-virtual {v4, v1, v9, v8}, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->append([BII)V

    .line 141
    const/4 v2, 0x0

    .line 143
    .end local v8    # "readAhead":I
    .restart local v2    # "readAhead":I
    const/4 v5, 0x0

    goto :goto_2

    .line 138
    .end local v2    # "readAhead":I
    .restart local v8    # "readAhead":I
    :cond_0
    move v2, v8

    goto :goto_2

    .line 150
    .end local v8    # "readAhead":I
    .restart local v2    # "readAhead":I
    :cond_1
    aget-byte v8, v1, v9

    invoke-static {v8}, Lcom/itextpdf/kernel/xmp/impl/Latin1Converter;->convertToUTF8(B)[B

    move-result-object v8

    .line 151
    .local v8, "utf8":[B
    invoke-virtual {v4, v8}, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->append([B)V

    .line 154
    sub-int/2addr v6, v2

    .line 155
    const/4 v2, 0x0

    .line 157
    const/4 v5, 0x0

    goto :goto_2

    .line 111
    .end local v8    # "utf8":[B
    :cond_2
    const/16 v9, 0xc0

    if-lt v7, v9, :cond_4

    .line 114
    const/4 v3, -0x1

    .line 115
    move v9, v7

    .line 116
    .local v9, "test":I
    :goto_1
    if-ge v3, v0, :cond_3

    and-int/lit16 v10, v9, 0x80

    if-ne v10, v8, :cond_3

    .line 118
    add-int/lit8 v3, v3, 0x1

    .line 116
    shl-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 120
    :cond_3
    add-int/lit8 v8, v2, 0x1

    .end local v2    # "readAhead":I
    .local v8, "readAhead":I
    int-to-byte v10, v7

    aput-byte v10, v1, v2

    .line 121
    const/16 v2, 0xb

    .line 122
    .end local v5    # "state":I
    .end local v9    # "test":I
    .local v2, "state":I
    move v5, v2

    move v2, v8

    goto :goto_2

    .line 126
    .end local v8    # "readAhead":I
    .local v2, "readAhead":I
    .restart local v5    # "state":I
    :cond_4
    int-to-byte v8, v7

    invoke-static {v8}, Lcom/itextpdf/kernel/xmp/impl/Latin1Converter;->convertToUTF8(B)[B

    move-result-object v8

    .line 127
    .local v8, "utf8":[B
    invoke-virtual {v4, v8}, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->append([B)V

    .line 129
    .end local v8    # "utf8":[B
    nop

    .line 99
    .end local v7    # "b":I
    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 164
    .end local v6    # "i":I
    :cond_5
    const/16 v0, 0xb

    if-ne v5, v0, :cond_6

    .line 166
    const/4 v0, 0x0

    .local v0, "j":I
    :goto_3
    if-ge v0, v2, :cond_6

    .line 168
    aget-byte v6, v1, v0

    .line 169
    .local v6, "b":B
    invoke-static {v6}, Lcom/itextpdf/kernel/xmp/impl/Latin1Converter;->convertToUTF8(B)[B

    move-result-object v7

    .line 170
    .local v7, "utf8":[B
    invoke-virtual {v4, v7}, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->append([B)V

    .line 166
    .end local v6    # "b":B
    .end local v7    # "utf8":[B
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 174
    .end local v0    # "j":I
    :cond_6
    return-object v4

    .line 179
    .end local v1    # "readAheadBuffer":[B
    .end local v2    # "readAhead":I
    .end local v3    # "expectedBytes":I
    .end local v4    # "out":Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;
    .end local v5    # "state":I
    :cond_7
    return-object p0

    :pswitch_data_0
    .packed-switch 0xb
        :pswitch_0
    .end packed-switch
.end method

.method private static convertToUTF8(B)[B
    .locals 6
    .param p0, "ch"    # B

    .line 196
    and-int/lit16 v0, p0, 0xff

    .line 199
    .local v0, "c":I
    const/16 v1, 0x80

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-lt v0, v1, :cond_2

    .line 201
    const/16 v1, 0x81

    if-eq v0, v1, :cond_1

    const/16 v1, 0x8d

    if-eq v0, v1, :cond_1

    const/16 v1, 0x8f

    if-eq v0, v1, :cond_1

    const/16 v1, 0x90

    if-eq v0, v1, :cond_1

    const/16 v1, 0x9d

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 208
    :cond_0
    :try_start_0
    new-instance v1, Ljava/lang/String;

    new-array v4, v3, [B

    aput-byte p0, v4, v2

    const-string v5, "cp1252"

    invoke-direct {v1, v4, v5}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    const-string v4, "UTF-8"

    invoke-virtual {v1, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    return-object v1

    .line 211
    :catch_0
    move-exception v1

    goto :goto_1

    .line 204
    :cond_1
    :goto_0
    new-array v1, v3, [B

    const/16 v4, 0x20

    aput-byte v4, v1, v2
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 214
    :cond_2
    nop

    .line 215
    :goto_1
    new-array v1, v3, [B

    aput-byte p0, v1, v2

    return-object v1
.end method
