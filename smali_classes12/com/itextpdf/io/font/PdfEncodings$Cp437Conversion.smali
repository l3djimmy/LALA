.class Lcom/itextpdf/io/font/PdfEncodings$Cp437Conversion;
.super Ljava/lang/Object;
.source "PdfEncodings.java"

# interfaces
.implements Lcom/itextpdf/io/font/IExtraEncoding;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/font/PdfEncodings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Cp437Conversion"
.end annotation


# static fields
.field private static c2b:Lcom/itextpdf/io/util/IntHashtable;

.field private static final table:[C


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 392
    new-instance v0, Lcom/itextpdf/io/util/IntHashtable;

    invoke-direct {v0}, Lcom/itextpdf/io/util/IntHashtable;-><init>()V

    sput-object v0, Lcom/itextpdf/io/font/PdfEncodings$Cp437Conversion;->c2b:Lcom/itextpdf/io/util/IntHashtable;

    .line 446
    const/16 v0, 0x80

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lcom/itextpdf/io/font/PdfEncodings$Cp437Conversion;->table:[C

    .line 458
    const/4 v0, 0x0

    .local v0, "k":I
    :goto_0
    sget-object v1, Lcom/itextpdf/io/font/PdfEncodings$Cp437Conversion;->table:[C

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 459
    sget-object v1, Lcom/itextpdf/io/font/PdfEncodings$Cp437Conversion;->c2b:Lcom/itextpdf/io/util/IntHashtable;

    sget-object v2, Lcom/itextpdf/io/font/PdfEncodings$Cp437Conversion;->table:[C

    aget-char v2, v2, v0

    add-int/lit16 v3, v0, 0x80

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/io/util/IntHashtable;->put(II)I

    .line 458
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 460
    .end local v0    # "k":I
    :cond_0
    return-void

    nop

    :array_0
    .array-data 2
        0xc7s
        0xfcs
        0xe9s
        0xe2s
        0xe4s
        0xe0s
        0xe5s
        0xe7s
        0xeas
        0xebs
        0xe8s
        0xefs
        0xees
        0xecs
        0xc4s
        0xc5s
        0xc9s
        0xe6s
        0xc6s
        0xf4s
        0xf6s
        0xf2s
        0xfbs
        0xf9s
        0xffs
        0xd6s
        0xdcs
        0xa2s
        0xa3s
        0xa5s
        0x20a7s
        0x192s
        0xe1s
        0xeds
        0xf3s
        0xfas
        0xf1s
        0xd1s
        0xaas
        0xbas
        0xbfs
        0x2310s
        0xacs
        0xbds
        0xbcs
        0xa1s
        0xabs
        0xbbs
        0x2591s
        0x2592s
        0x2593s
        0x2502s
        0x2524s
        0x2561s
        0x2562s
        0x2556s
        0x2555s
        0x2563s
        0x2551s
        0x2557s
        0x255ds
        0x255cs
        0x255bs
        0x2510s
        0x2514s
        0x2534s
        0x252cs
        0x251cs
        0x2500s
        0x253cs
        0x255es
        0x255fs
        0x255as
        0x2554s
        0x2569s
        0x2566s
        0x2560s
        0x2550s
        0x256cs
        0x2567s
        0x2568s
        0x2564s
        0x2565s
        0x2559s
        0x2558s
        0x2552s
        0x2553s
        0x256bs
        0x256as
        0x2518s
        0x250cs
        0x2588s
        0x2584s
        0x258cs
        0x2590s
        0x2580s
        0x3b1s
        0xdfs
        0x393s
        0x3c0s
        0x3a3s
        0x3c3s
        0xb5s
        0x3c4s
        0x3a6s
        0x398s
        0x3a9s
        0x3b4s
        0x221es
        0x3c6s
        0x3b5s
        0x2229s
        0x2261s
        0xb1s
        0x2265s
        0x2264s
        0x2320s
        0x2321s
        0xf7s
        0x2248s
        0xb0s
        0x2219s
        0xb7s
        0x221as
        0x207fs
        0xb2s
        0x25a0s
        0xa0s
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .line 391
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/itextpdf/io/font/PdfEncodings$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/itextpdf/io/font/PdfEncodings$1;

    .line 391
    invoke-direct {p0}, Lcom/itextpdf/io/font/PdfEncodings$Cp437Conversion;-><init>()V

    return-void
.end method


# virtual methods
.method public byteToChar([BLjava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "b"    # [B
    .param p2, "encoding"    # Ljava/lang/String;

    .line 429
    array-length v0, p1

    .line 430
    .local v0, "len":I
    new-array v1, v0, [C

    .line 431
    .local v1, "cc":[C
    const/4 v2, 0x0

    .line 432
    .local v2, "ptr":I
    const/4 v3, 0x0

    .local v3, "k":I
    :goto_0
    if-ge v3, v0, :cond_2

    .line 433
    aget-byte v4, p1, v3

    and-int/lit16 v4, v4, 0xff

    .line 434
    .local v4, "c":I
    const/16 v5, 0x20

    if-ge v4, v5, :cond_0

    .line 435
    goto :goto_1

    .line 436
    :cond_0
    const/16 v5, 0x80

    if-ge v4, v5, :cond_1

    .line 437
    add-int/lit8 v5, v2, 0x1

    .end local v2    # "ptr":I
    .local v5, "ptr":I
    int-to-char v6, v4

    aput-char v6, v1, v2

    move v2, v5

    goto :goto_1

    .line 439
    .end local v5    # "ptr":I
    .restart local v2    # "ptr":I
    :cond_1
    sget-object v5, Lcom/itextpdf/io/font/PdfEncodings$Cp437Conversion;->table:[C

    add-int/lit8 v6, v4, -0x80

    aget-char v5, v5, v6

    .line 440
    .local v5, "v":C
    add-int/lit8 v6, v2, 0x1

    .end local v2    # "ptr":I
    .local v6, "ptr":I
    aput-char v5, v1, v2

    move v2, v6

    .line 432
    .end local v4    # "c":I
    .end local v5    # "v":C
    .end local v6    # "ptr":I
    .restart local v2    # "ptr":I
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 443
    .end local v3    # "k":I
    :cond_2
    new-instance v3, Ljava/lang/String;

    const/4 v4, 0x0

    invoke-direct {v3, v1, v4, v2}, Ljava/lang/String;-><init>([CII)V

    return-object v3
.end method

.method public charToByte(CLjava/lang/String;)[B
    .locals 3
    .param p1, "char1"    # C
    .param p2, "encoding"    # Ljava/lang/String;

    .line 417
    const/16 v0, 0x80

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ge p1, v0, :cond_0

    .line 418
    int-to-byte v0, p1

    new-array v1, v1, [B

    aput-byte v0, v1, v2

    return-object v1

    .line 420
    :cond_0
    sget-object v0, Lcom/itextpdf/io/font/PdfEncodings$Cp437Conversion;->c2b:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/util/IntHashtable;->get(I)I

    move-result v0

    int-to-byte v0, v0

    .line 421
    .local v0, "v":B
    if-eqz v0, :cond_1

    .line 422
    new-array v1, v1, [B

    aput-byte v0, v1, v2

    return-object v1

    .line 424
    :cond_1
    new-array v1, v2, [B

    return-object v1
.end method

.method public charToByte(Ljava/lang/String;Ljava/lang/String;)[B
    .locals 8
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "encoding"    # Ljava/lang/String;

    .line 395
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 396
    .local v0, "cc":[C
    array-length v1, v0

    new-array v1, v1, [B

    .line 397
    .local v1, "b":[B
    const/4 v2, 0x0

    .line 398
    .local v2, "ptr":I
    array-length v3, v0

    .line 399
    .local v3, "len":I
    const/4 v4, 0x0

    .local v4, "k":I
    :goto_0
    if-ge v4, v3, :cond_2

    .line 400
    aget-char v5, v0, v4

    .line 401
    .local v5, "c":C
    const/16 v6, 0x80

    if-ge v5, v6, :cond_0

    .line 402
    add-int/lit8 v6, v2, 0x1

    .end local v2    # "ptr":I
    .local v6, "ptr":I
    int-to-byte v7, v5

    aput-byte v7, v1, v2

    move v2, v6

    goto :goto_1

    .line 404
    .end local v6    # "ptr":I
    .restart local v2    # "ptr":I
    :cond_0
    sget-object v6, Lcom/itextpdf/io/font/PdfEncodings$Cp437Conversion;->c2b:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {v6, v5}, Lcom/itextpdf/io/util/IntHashtable;->get(I)I

    move-result v6

    int-to-byte v6, v6

    .line 405
    .local v6, "v":B
    if-eqz v6, :cond_1

    .line 406
    add-int/lit8 v7, v2, 0x1

    .end local v2    # "ptr":I
    .local v7, "ptr":I
    aput-byte v6, v1, v2

    move v2, v7

    .line 399
    .end local v5    # "c":C
    .end local v6    # "v":B
    .end local v7    # "ptr":I
    .restart local v2    # "ptr":I
    :cond_1
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 409
    .end local v4    # "k":I
    :cond_2
    if-ne v2, v3, :cond_3

    .line 410
    return-object v1

    .line 411
    :cond_3
    new-array v4, v2, [B

    .line 412
    .local v4, "b2":[B
    const/4 v5, 0x0

    invoke-static {v1, v5, v4, v5, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 413
    return-object v4
.end method
