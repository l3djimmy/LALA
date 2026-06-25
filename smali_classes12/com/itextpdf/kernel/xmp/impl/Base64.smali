.class public Lcom/itextpdf/kernel/xmp/impl/Base64;
.super Ljava/lang/Object;
.source "Base64.java"


# static fields
.field private static final EQUAL:B = -0x3t

.field private static final INVALID:B = -0x1t

.field private static final WHITESPACE:B = -0x2t

.field private static ascii:[B

.field private static base64:[B


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 52
    const/16 v0, 0x40

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/itextpdf/kernel/xmp/impl/Base64;->base64:[B

    .line 71
    const/16 v0, 0xff

    new-array v1, v0, [B

    sput-object v1, Lcom/itextpdf/kernel/xmp/impl/Base64;->ascii:[B

    .line 75
    const/4 v1, 0x0

    .local v1, "idx":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 77
    sget-object v2, Lcom/itextpdf/kernel/xmp/impl/Base64;->ascii:[B

    const/4 v3, -0x1

    aput-byte v3, v2, v1

    .line 75
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 80
    .end local v1    # "idx":I
    :cond_0
    const/4 v0, 0x0

    .local v0, "idx":I
    :goto_1
    sget-object v1, Lcom/itextpdf/kernel/xmp/impl/Base64;->base64:[B

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 82
    sget-object v1, Lcom/itextpdf/kernel/xmp/impl/Base64;->ascii:[B

    sget-object v2, Lcom/itextpdf/kernel/xmp/impl/Base64;->base64:[B

    aget-byte v2, v2, v0

    int-to-byte v3, v0

    aput-byte v3, v1, v2

    .line 80
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 85
    .end local v0    # "idx":I
    :cond_1
    sget-object v0, Lcom/itextpdf/kernel/xmp/impl/Base64;->ascii:[B

    const/16 v1, 0x9

    const/4 v2, -0x2

    aput-byte v2, v0, v1

    .line 86
    sget-object v0, Lcom/itextpdf/kernel/xmp/impl/Base64;->ascii:[B

    const/16 v1, 0xa

    aput-byte v2, v0, v1

    .line 87
    sget-object v0, Lcom/itextpdf/kernel/xmp/impl/Base64;->ascii:[B

    const/16 v1, 0xd

    aput-byte v2, v0, v1

    .line 88
    sget-object v0, Lcom/itextpdf/kernel/xmp/impl/Base64;->ascii:[B

    const/16 v1, 0x20

    aput-byte v2, v0, v1

    .line 91
    sget-object v0, Lcom/itextpdf/kernel/xmp/impl/Base64;->ascii:[B

    const/16 v1, 0x3d

    const/4 v2, -0x3

    aput-byte v2, v0, v1

    .line 92
    return-void

    nop

    :array_0
    .array-data 1
        0x41t
        0x42t
        0x43t
        0x44t
        0x45t
        0x46t
        0x47t
        0x48t
        0x49t
        0x4at
        0x4bt
        0x4ct
        0x4dt
        0x4et
        0x4ft
        0x50t
        0x51t
        0x52t
        0x53t
        0x54t
        0x55t
        0x56t
        0x57t
        0x58t
        0x59t
        0x5at
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
        0x67t
        0x68t
        0x69t
        0x6at
        0x6bt
        0x6ct
        0x6dt
        0x6et
        0x6ft
        0x70t
        0x71t
        0x72t
        0x73t
        0x74t
        0x75t
        0x76t
        0x77t
        0x78t
        0x79t
        0x7at
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
        0x2bt
        0x2ft
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final decode(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "src"    # Ljava/lang/String;

    .line 270
    new-instance v0, Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-static {v1}, Lcom/itextpdf/kernel/xmp/impl/Base64;->decode([B)[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([B)V

    return-object v0
.end method

.method public static final decode([B)[B
    .locals 7
    .param p0, "src"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 212
    const/4 v0, 0x0

    .line 213
    .local v0, "srcLen":I
    const/4 v1, 0x0

    .local v1, "sidx":I
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_2

    .line 215
    sget-object v2, Lcom/itextpdf/kernel/xmp/impl/Base64;->ascii:[B

    aget-byte v3, p0, v1

    aget-byte v2, v2, v3

    .line 216
    .local v2, "val":B
    if-ltz v2, :cond_0

    .line 218
    add-int/lit8 v3, v0, 0x1

    .end local v0    # "srcLen":I
    .local v3, "srcLen":I
    aput-byte v2, p0, v0

    move v0, v3

    goto :goto_1

    .line 220
    .end local v3    # "srcLen":I
    .restart local v0    # "srcLen":I
    :cond_0
    const/4 v3, -0x1

    if-eq v2, v3, :cond_1

    .line 213
    .end local v2    # "val":B
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 222
    .restart local v2    # "val":B
    :cond_1
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Invalid base 64 string"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 229
    .end local v2    # "val":B
    :cond_2
    :goto_2
    if-lez v0, :cond_3

    add-int/lit8 v2, v0, -0x1

    aget-byte v2, p0, v2

    const/4 v3, -0x3

    if-ne v2, v3, :cond_3

    .line 231
    add-int/lit8 v0, v0, -0x1

    goto :goto_2

    .line 233
    :cond_3
    mul-int/lit8 v2, v0, 0x3

    div-int/lit8 v2, v2, 0x4

    new-array v2, v2, [B

    .line 239
    .local v2, "dst":[B
    const/4 v1, 0x0

    const/4 v3, 0x0

    .local v3, "didx":I
    :goto_3
    array-length v4, v2

    add-int/lit8 v4, v4, -0x2

    if-ge v3, v4, :cond_4

    .line 241
    aget-byte v4, p0, v1

    shl-int/lit8 v4, v4, 0x2

    and-int/lit16 v4, v4, 0xff

    add-int/lit8 v5, v1, 0x1

    aget-byte v5, p0, v5

    ushr-int/lit8 v5, v5, 0x4

    and-int/lit8 v5, v5, 0x3

    or-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    .line 243
    add-int/lit8 v4, v3, 0x1

    add-int/lit8 v5, v1, 0x1

    aget-byte v5, p0, v5

    shl-int/lit8 v5, v5, 0x4

    and-int/lit16 v5, v5, 0xff

    add-int/lit8 v6, v1, 0x2

    aget-byte v6, p0, v6

    ushr-int/lit8 v6, v6, 0x2

    and-int/lit8 v6, v6, 0xf

    or-int/2addr v5, v6

    int-to-byte v5, v5

    aput-byte v5, v2, v4

    .line 245
    add-int/lit8 v4, v3, 0x2

    add-int/lit8 v5, v1, 0x2

    aget-byte v5, p0, v5

    shl-int/lit8 v5, v5, 0x6

    and-int/lit16 v5, v5, 0xff

    add-int/lit8 v6, v1, 0x3

    aget-byte v6, p0, v6

    and-int/lit8 v6, v6, 0x3f

    or-int/2addr v5, v6

    int-to-byte v5, v5

    aput-byte v5, v2, v4

    .line 239
    add-int/lit8 v1, v1, 0x4

    add-int/lit8 v3, v3, 0x3

    goto :goto_3

    .line 248
    :cond_4
    array-length v4, v2

    if-ge v3, v4, :cond_5

    .line 250
    aget-byte v4, p0, v1

    shl-int/lit8 v4, v4, 0x2

    and-int/lit16 v4, v4, 0xff

    add-int/lit8 v5, v1, 0x1

    aget-byte v5, p0, v5

    ushr-int/lit8 v5, v5, 0x4

    and-int/lit8 v5, v5, 0x3

    or-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    .line 253
    :cond_5
    add-int/lit8 v3, v3, 0x1

    array-length v4, v2

    if-ge v3, v4, :cond_6

    .line 255
    add-int/lit8 v4, v1, 0x1

    aget-byte v4, p0, v4

    shl-int/lit8 v4, v4, 0x4

    and-int/lit16 v4, v4, 0xff

    add-int/lit8 v5, v1, 0x2

    aget-byte v5, p0, v5

    ushr-int/lit8 v5, v5, 0x2

    and-int/lit8 v5, v5, 0xf

    or-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    .line 258
    :cond_6
    return-object v2
.end method

.method public static final encode(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "src"    # Ljava/lang/String;

    .line 193
    new-instance v0, Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-static {v1}, Lcom/itextpdf/kernel/xmp/impl/Base64;->encode([B)[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([B)V

    return-object v0
.end method

.method public static final encode([B)[B
    .locals 1
    .param p0, "src"    # [B

    .line 103
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/Base64;->encode([BI)[B

    move-result-object v0

    return-object v0
.end method

.method public static final encode([BI)[B
    .locals 11
    .param p0, "src"    # [B
    .param p1, "lineFeed"    # I

    .line 118
    div-int/lit8 v0, p1, 0x4

    mul-int/lit8 v0, v0, 0x4

    .line 119
    .end local p1    # "lineFeed":I
    .local v0, "lineFeed":I
    if-gez v0, :cond_0

    .line 121
    const/4 v0, 0x0

    .line 125
    :cond_0
    array-length p1, p0

    const/4 v1, 0x2

    add-int/2addr p1, v1

    div-int/lit8 p1, p1, 0x3

    mul-int/lit8 p1, p1, 0x4

    .line 126
    .local p1, "codeLength":I
    if-lez v0, :cond_1

    .line 128
    add-int/lit8 v2, p1, -0x1

    div-int/2addr v2, v0

    add-int/2addr p1, v2

    .line 131
    :cond_1
    new-array v2, p1, [B

    .line 137
    .local v2, "dst":[B
    const/4 v3, 0x0

    .line 138
    .local v3, "didx":I
    const/4 v4, 0x0

    .line 139
    .local v4, "sidx":I
    const/4 v5, 0x0

    .line 140
    .local v5, "lf":I
    :goto_0
    add-int/lit8 v6, v4, 0x3

    array-length v7, p0

    const v8, 0x3f000

    const/high16 v9, 0xfc0000

    if-gt v6, v7, :cond_3

    .line 142
    add-int/lit8 v6, v4, 0x1

    .end local v4    # "sidx":I
    .local v6, "sidx":I
    aget-byte v4, p0, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0x10

    .line 143
    .local v4, "bits24":I
    add-int/lit8 v7, v6, 0x1

    .end local v6    # "sidx":I
    .local v7, "sidx":I
    aget-byte v6, p0, v6

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x8

    or-int/2addr v4, v6

    .line 144
    add-int/lit8 v6, v7, 0x1

    .end local v7    # "sidx":I
    .restart local v6    # "sidx":I
    aget-byte v7, p0, v7

    and-int/lit16 v7, v7, 0xff

    shl-int/lit8 v7, v7, 0x0

    or-int/2addr v4, v7

    .line 145
    and-int v7, v4, v9

    shr-int/lit8 v7, v7, 0x12

    .line 146
    .local v7, "bits6":I
    add-int/lit8 v9, v3, 0x1

    .end local v3    # "didx":I
    .local v9, "didx":I
    sget-object v10, Lcom/itextpdf/kernel/xmp/impl/Base64;->base64:[B

    aget-byte v10, v10, v7

    aput-byte v10, v2, v3

    .line 147
    and-int v3, v4, v8

    shr-int/lit8 v3, v3, 0xc

    .line 148
    .end local v7    # "bits6":I
    .local v3, "bits6":I
    add-int/lit8 v7, v9, 0x1

    .end local v9    # "didx":I
    .local v7, "didx":I
    sget-object v8, Lcom/itextpdf/kernel/xmp/impl/Base64;->base64:[B

    aget-byte v8, v8, v3

    aput-byte v8, v2, v9

    .line 149
    and-int/lit16 v8, v4, 0xfc0

    shr-int/lit8 v3, v8, 0x6

    .line 150
    add-int/lit8 v8, v7, 0x1

    .end local v7    # "didx":I
    .local v8, "didx":I
    sget-object v9, Lcom/itextpdf/kernel/xmp/impl/Base64;->base64:[B

    aget-byte v9, v9, v3

    aput-byte v9, v2, v7

    .line 151
    and-int/lit8 v3, v4, 0x3f

    .line 152
    add-int/lit8 v7, v8, 0x1

    .end local v8    # "didx":I
    .restart local v7    # "didx":I
    sget-object v9, Lcom/itextpdf/kernel/xmp/impl/Base64;->base64:[B

    aget-byte v9, v9, v3

    aput-byte v9, v2, v8

    .line 154
    add-int/lit8 v5, v5, 0x4

    .line 155
    if-ge v7, p1, :cond_2

    if-lez v0, :cond_2

    rem-int v8, v5, v0

    if-nez v8, :cond_2

    .line 157
    add-int/lit8 v8, v7, 0x1

    .end local v7    # "didx":I
    .restart local v8    # "didx":I
    const/16 v9, 0xa

    aput-byte v9, v2, v7

    move v4, v6

    move v3, v8

    goto :goto_0

    .line 140
    .end local v3    # "bits6":I
    .end local v4    # "bits24":I
    .end local v8    # "didx":I
    .restart local v7    # "didx":I
    :cond_2
    move v4, v6

    move v3, v7

    goto :goto_0

    .line 160
    .end local v6    # "sidx":I
    .end local v7    # "didx":I
    .local v3, "didx":I
    .local v4, "sidx":I
    :cond_3
    array-length v6, p0

    sub-int/2addr v6, v4

    const/16 v7, 0x3d

    if-ne v6, v1, :cond_4

    .line 162
    aget-byte v1, p0, v4

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    .line 163
    .local v1, "bits24":I
    add-int/lit8 v6, v4, 0x1

    aget-byte v6, p0, v6

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x8

    or-int/2addr v1, v6

    .line 164
    and-int v6, v1, v9

    shr-int/lit8 v6, v6, 0x12

    .line 165
    .local v6, "bits6":I
    add-int/lit8 v9, v3, 0x1

    .end local v3    # "didx":I
    .restart local v9    # "didx":I
    sget-object v10, Lcom/itextpdf/kernel/xmp/impl/Base64;->base64:[B

    aget-byte v10, v10, v6

    aput-byte v10, v2, v3

    .line 166
    and-int v3, v1, v8

    shr-int/lit8 v3, v3, 0xc

    .line 167
    .end local v6    # "bits6":I
    .local v3, "bits6":I
    add-int/lit8 v6, v9, 0x1

    .end local v9    # "didx":I
    .local v6, "didx":I
    sget-object v8, Lcom/itextpdf/kernel/xmp/impl/Base64;->base64:[B

    aget-byte v8, v8, v3

    aput-byte v8, v2, v9

    .line 168
    and-int/lit16 v8, v1, 0xfc0

    shr-int/lit8 v3, v8, 0x6

    .line 169
    add-int/lit8 v8, v6, 0x1

    .end local v6    # "didx":I
    .restart local v8    # "didx":I
    sget-object v9, Lcom/itextpdf/kernel/xmp/impl/Base64;->base64:[B

    aget-byte v9, v9, v3

    aput-byte v9, v2, v6

    .line 170
    add-int/lit8 v6, v8, 0x1

    .end local v8    # "didx":I
    .restart local v6    # "didx":I
    aput-byte v7, v2, v8

    move v3, v6

    goto :goto_1

    .line 172
    .end local v1    # "bits24":I
    .end local v6    # "didx":I
    .local v3, "didx":I
    :cond_4
    array-length v1, p0

    sub-int/2addr v1, v4

    const/4 v6, 0x1

    if-ne v1, v6, :cond_5

    .line 174
    aget-byte v1, p0, v4

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    .line 175
    .restart local v1    # "bits24":I
    and-int v6, v1, v9

    shr-int/lit8 v6, v6, 0x12

    .line 176
    .local v6, "bits6":I
    add-int/lit8 v9, v3, 0x1

    .end local v3    # "didx":I
    .restart local v9    # "didx":I
    sget-object v10, Lcom/itextpdf/kernel/xmp/impl/Base64;->base64:[B

    aget-byte v10, v10, v6

    aput-byte v10, v2, v3

    .line 177
    and-int v3, v1, v8

    shr-int/lit8 v3, v3, 0xc

    .line 178
    .end local v6    # "bits6":I
    .local v3, "bits6":I
    add-int/lit8 v6, v9, 0x1

    .end local v9    # "didx":I
    .local v6, "didx":I
    sget-object v8, Lcom/itextpdf/kernel/xmp/impl/Base64;->base64:[B

    aget-byte v8, v8, v3

    aput-byte v8, v2, v9

    .line 179
    add-int/lit8 v8, v6, 0x1

    .end local v6    # "didx":I
    .restart local v8    # "didx":I
    aput-byte v7, v2, v6

    .line 180
    add-int/lit8 v6, v8, 0x1

    .end local v8    # "didx":I
    .restart local v6    # "didx":I
    aput-byte v7, v2, v8

    move v3, v6

    .line 182
    .end local v1    # "bits24":I
    .end local v6    # "didx":I
    .local v3, "didx":I
    :cond_5
    :goto_1
    return-object v2
.end method
