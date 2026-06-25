.class Lcom/itextpdf/io/font/PdfEncodings$SymbolConversion;
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
    name = "SymbolConversion"
.end annotation


# static fields
.field private static final t1:Lcom/itextpdf/io/util/IntHashtable;

.field private static final t2:Lcom/itextpdf/io/util/IntHashtable;

.field private static final table1:[C

.field private static final table2:[C


# instance fields
.field private final byteToChar:[C

.field private translation:Lcom/itextpdf/io/util/IntHashtable;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 465
    new-instance v0, Lcom/itextpdf/io/util/IntHashtable;

    invoke-direct {v0}, Lcom/itextpdf/io/util/IntHashtable;-><init>()V

    sput-object v0, Lcom/itextpdf/io/font/PdfEncodings$SymbolConversion;->t1:Lcom/itextpdf/io/util/IntHashtable;

    .line 466
    new-instance v0, Lcom/itextpdf/io/util/IntHashtable;

    invoke-direct {v0}, Lcom/itextpdf/io/util/IntHashtable;-><init>()V

    sput-object v0, Lcom/itextpdf/io/font/PdfEncodings$SymbolConversion;->t2:Lcom/itextpdf/io/util/IntHashtable;

    .line 518
    const/16 v0, 0x100

    new-array v1, v0, [C

    fill-array-data v1, :array_0

    sput-object v1, Lcom/itextpdf/io/font/PdfEncodings$SymbolConversion;->table1:[C

    .line 537
    new-array v1, v0, [C

    fill-array-data v1, :array_1

    sput-object v1, Lcom/itextpdf/io/font/PdfEncodings$SymbolConversion;->table2:[C

    .line 557
    const/4 v1, 0x0

    .local v1, "k":I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 558
    sget-object v2, Lcom/itextpdf/io/font/PdfEncodings$SymbolConversion;->table1:[C

    aget-char v2, v2, v1

    .line 559
    .local v2, "v":I
    if-eqz v2, :cond_0

    .line 560
    sget-object v3, Lcom/itextpdf/io/font/PdfEncodings$SymbolConversion;->t1:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {v3, v2, v1}, Lcom/itextpdf/io/util/IntHashtable;->put(II)I

    .line 557
    .end local v2    # "v":I
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 562
    .end local v1    # "k":I
    :cond_1
    const/4 v1, 0x0

    .restart local v1    # "k":I
    :goto_1
    if-ge v1, v0, :cond_3

    .line 563
    sget-object v2, Lcom/itextpdf/io/font/PdfEncodings$SymbolConversion;->table2:[C

    aget-char v2, v2, v1

    .line 564
    .restart local v2    # "v":I
    if-eqz v2, :cond_2

    .line 565
    sget-object v3, Lcom/itextpdf/io/font/PdfEncodings$SymbolConversion;->t2:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {v3, v2, v1}, Lcom/itextpdf/io/util/IntHashtable;->put(II)I

    .line 562
    .end local v2    # "v":I
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 567
    .end local v1    # "k":I
    :cond_3
    return-void

    nop

    :array_0
    .array-data 2
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x20s
        0x21s
        0x2200s
        0x23s
        0x2203s
        0x25s
        0x26s
        0x220bs
        0x28s
        0x29s
        0x2as
        0x2bs
        0x2cs
        0x2ds
        0x2es
        0x2fs
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x3as
        0x3bs
        0x3cs
        0x3ds
        0x3es
        0x3fs
        0x2245s
        0x391s
        0x392s
        0x3a7s
        0x394s
        0x395s
        0x3a6s
        0x393s
        0x397s
        0x399s
        0x3d1s
        0x39as
        0x39bs
        0x39cs
        0x39ds
        0x39fs
        0x3a0s
        0x398s
        0x3a1s
        0x3a3s
        0x3a4s
        0x3a5s
        0x3c2s
        0x3a9s
        0x39es
        0x3a8s
        0x396s
        0x5bs
        0x2234s
        0x5ds
        0x22a5s
        0x5fs
        0x305s
        0x3b1s
        0x3b2s
        0x3c7s
        0x3b4s
        0x3b5s
        0x3d5s
        0x3b3s
        0x3b7s
        0x3b9s
        0x3c6s
        0x3bas
        0x3bbs
        0x3bcs
        0x3bds
        0x3bfs
        0x3c0s
        0x3b8s
        0x3c1s
        0x3c3s
        0x3c4s
        0x3c5s
        0x3d6s
        0x3c9s
        0x3bes
        0x3c8s
        0x3b6s
        0x7bs
        0x7cs
        0x7ds
        0x7es
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x20acs
        0x3d2s
        0x2032s
        0x2264s
        0x2044s
        0x221es
        0x192s
        0x2663s
        0x2666s
        0x2665s
        0x2660s
        0x2194s
        0x2190s
        0x2191s
        0x2192s
        0x2193s
        0xb0s
        0xb1s
        0x2033s
        0x2265s
        0xd7s
        0x221ds
        0x2202s
        0x2022s
        0xf7s
        0x2260s
        0x2261s
        0x2248s
        0x2026s
        0x2502s
        0x2500s
        0x21b5s
        0x2135s
        0x2111s
        0x211cs
        0x2118s
        0x2297s
        0x2295s
        0x2205s
        0x2229s
        0x222as
        0x2283s
        0x2287s
        0x2284s
        0x2282s
        0x2286s
        0x2208s
        0x2209s
        0x2220s
        0x2207s
        0xaes
        0xa9s
        0x2122s
        0x220fs
        0x221as
        0x22c5s
        0xacs
        0x2227s
        0x2228s
        0x21d4s
        0x21d0s
        0x21d1s
        0x21d2s
        0x21d3s
        0x25cas
        0x2329s
        0x0s
        0x0s
        0x0s
        0x2211s
        0x239bs
        0x239cs
        0x239ds
        0x23a1s
        0x23a2s
        0x23a3s
        0x23a7s
        0x23a8s
        0x23a9s
        0x23aas
        0x0s
        0x232as
        0x222bs
        0x2320s
        0x23aes
        0x2321s
        0x239es
        0x239fs
        0x23a0s
        0x23a4s
        0x23a5s
        0x23a6s
        0x23abs
        0x23acs
        0x23ads
        0x0s
    .end array-data

    :array_1
    .array-data 2
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x20s
        0x2701s
        0x2702s
        0x2703s
        0x2704s
        0x260es
        0x2706s
        0x2707s
        0x2708s
        0x2709s
        0x261bs
        0x261es
        0x270cs
        0x270ds
        0x270es
        0x270fs
        0x2710s
        0x2711s
        0x2712s
        0x2713s
        0x2714s
        0x2715s
        0x2716s
        0x2717s
        0x2718s
        0x2719s
        0x271as
        0x271bs
        0x271cs
        0x271ds
        0x271es
        0x271fs
        0x2720s
        0x2721s
        0x2722s
        0x2723s
        0x2724s
        0x2725s
        0x2726s
        0x2727s
        0x2605s
        0x2729s
        0x272as
        0x272bs
        0x272cs
        0x272ds
        0x272es
        0x272fs
        0x2730s
        0x2731s
        0x2732s
        0x2733s
        0x2734s
        0x2735s
        0x2736s
        0x2737s
        0x2738s
        0x2739s
        0x273as
        0x273bs
        0x273cs
        0x273ds
        0x273es
        0x273fs
        0x2740s
        0x2741s
        0x2742s
        0x2743s
        0x2744s
        0x2745s
        0x2746s
        0x2747s
        0x2748s
        0x2749s
        0x274as
        0x274bs
        0x25cfs
        0x274ds
        0x25a0s
        0x274fs
        0x2750s
        0x2751s
        0x2752s
        0x25b2s
        0x25bcs
        0x25c6s
        0x2756s
        0x25d7s
        0x2758s
        0x2759s
        0x275as
        0x275bs
        0x275cs
        0x275ds
        0x275es
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x0s
        0x2761s
        0x2762s
        0x2763s
        0x2764s
        0x2765s
        0x2766s
        0x2767s
        0x2663s
        0x2666s
        0x2665s
        0x2660s
        0x2460s
        0x2461s
        0x2462s
        0x2463s
        0x2464s
        0x2465s
        0x2466s
        0x2467s
        0x2468s
        0x2469s
        0x2776s
        0x2777s
        0x2778s
        0x2779s
        0x277as
        0x277bs
        0x277cs
        0x277ds
        0x277es
        0x277fs
        0x2780s
        0x2781s
        0x2782s
        0x2783s
        0x2784s
        0x2785s
        0x2786s
        0x2787s
        0x2788s
        0x2789s
        0x278as
        0x278bs
        0x278cs
        0x278ds
        0x278es
        0x278fs
        0x2790s
        0x2791s
        0x2792s
        0x2793s
        0x2794s
        0x2192s
        0x2194s
        0x2195s
        0x2798s
        0x2799s
        0x279as
        0x279bs
        0x279cs
        0x279ds
        0x279es
        0x279fs
        0x27a0s
        0x27a1s
        0x27a2s
        0x27a3s
        0x27a4s
        0x27a5s
        0x27a6s
        0x27a7s
        0x27a8s
        0x27a9s
        0x27aas
        0x27abs
        0x27acs
        0x27ads
        0x27aes
        0x27afs
        0x0s
        0x27b1s
        0x27b2s
        0x27b3s
        0x27b4s
        0x27b5s
        0x27b6s
        0x27b7s
        0x27b8s
        0x27b9s
        0x27bas
        0x27bbs
        0x27bcs
        0x27bds
        0x27bes
        0x0s
    .end array-data
.end method

.method constructor <init>(Z)V
    .locals 1
    .param p1, "symbol"    # Z

    .line 470
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 471
    if-eqz p1, :cond_0

    .line 472
    sget-object v0, Lcom/itextpdf/io/font/PdfEncodings$SymbolConversion;->t1:Lcom/itextpdf/io/util/IntHashtable;

    iput-object v0, p0, Lcom/itextpdf/io/font/PdfEncodings$SymbolConversion;->translation:Lcom/itextpdf/io/util/IntHashtable;

    .line 473
    sget-object v0, Lcom/itextpdf/io/font/PdfEncodings$SymbolConversion;->table1:[C

    iput-object v0, p0, Lcom/itextpdf/io/font/PdfEncodings$SymbolConversion;->byteToChar:[C

    goto :goto_0

    .line 475
    :cond_0
    sget-object v0, Lcom/itextpdf/io/font/PdfEncodings$SymbolConversion;->t2:Lcom/itextpdf/io/util/IntHashtable;

    iput-object v0, p0, Lcom/itextpdf/io/font/PdfEncodings$SymbolConversion;->translation:Lcom/itextpdf/io/util/IntHashtable;

    .line 476
    sget-object v0, Lcom/itextpdf/io/font/PdfEncodings$SymbolConversion;->table2:[C

    iput-object v0, p0, Lcom/itextpdf/io/font/PdfEncodings$SymbolConversion;->byteToChar:[C

    .line 478
    :goto_0
    return-void
.end method


# virtual methods
.method public byteToChar([BLjava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "b"    # [B
    .param p2, "encoding"    # Ljava/lang/String;

    .line 507
    array-length v0, p1

    .line 508
    .local v0, "len":I
    new-array v1, v0, [C

    .line 509
    .local v1, "cc":[C
    const/4 v2, 0x0

    .line 510
    .local v2, "ptr":I
    const/4 v3, 0x0

    .local v3, "k":I
    :goto_0
    if-ge v3, v0, :cond_0

    .line 511
    aget-byte v4, p1, v3

    and-int/lit16 v4, v4, 0xff

    .line 512
    .local v4, "c":I
    iget-object v5, p0, Lcom/itextpdf/io/font/PdfEncodings$SymbolConversion;->byteToChar:[C

    aget-char v5, v5, v4

    .line 513
    .local v5, "v":C
    add-int/lit8 v6, v2, 0x1

    .end local v2    # "ptr":I
    .local v6, "ptr":I
    aput-char v5, v1, v2

    .line 510
    .end local v4    # "c":I
    .end local v5    # "v":C
    add-int/lit8 v3, v3, 0x1

    move v2, v6

    goto :goto_0

    .line 515
    .end local v3    # "k":I
    .end local v6    # "ptr":I
    .restart local v2    # "ptr":I
    :cond_0
    new-instance v3, Ljava/lang/String;

    const/4 v4, 0x0

    invoke-direct {v3, v1, v4, v2}, Ljava/lang/String;-><init>([CII)V

    return-object v3
.end method

.method public charToByte(CLjava/lang/String;)[B
    .locals 3
    .param p1, "char1"    # C
    .param p2, "encoding"    # Ljava/lang/String;

    .line 499
    iget-object v0, p0, Lcom/itextpdf/io/font/PdfEncodings$SymbolConversion;->translation:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/util/IntHashtable;->get(I)I

    move-result v0

    int-to-byte v0, v0

    .line 500
    .local v0, "v":B
    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 501
    const/4 v2, 0x1

    new-array v2, v2, [B

    aput-byte v0, v2, v1

    return-object v2

    .line 503
    :cond_0
    new-array v1, v1, [B

    return-object v1
.end method

.method public charToByte(Ljava/lang/String;Ljava/lang/String;)[B
    .locals 8
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "encoding"    # Ljava/lang/String;

    .line 481
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 482
    .local v0, "cc":[C
    array-length v1, v0

    new-array v1, v1, [B

    .line 483
    .local v1, "b":[B
    const/4 v2, 0x0

    .line 484
    .local v2, "ptr":I
    array-length v3, v0

    .line 485
    .local v3, "len":I
    const/4 v4, 0x0

    .local v4, "k":I
    :goto_0
    if-ge v4, v3, :cond_1

    .line 486
    aget-char v5, v0, v4

    .line 487
    .local v5, "c":C
    iget-object v6, p0, Lcom/itextpdf/io/font/PdfEncodings$SymbolConversion;->translation:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {v6, v5}, Lcom/itextpdf/io/util/IntHashtable;->get(I)I

    move-result v6

    int-to-byte v6, v6

    .line 488
    .local v6, "v":B
    if-eqz v6, :cond_0

    .line 489
    add-int/lit8 v7, v2, 0x1

    .end local v2    # "ptr":I
    .local v7, "ptr":I
    aput-byte v6, v1, v2

    move v2, v7

    .line 485
    .end local v5    # "c":C
    .end local v6    # "v":B
    .end local v7    # "ptr":I
    .restart local v2    # "ptr":I
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 491
    .end local v4    # "k":I
    :cond_1
    if-ne v2, v3, :cond_2

    .line 492
    return-object v1

    .line 493
    :cond_2
    new-array v4, v2, [B

    .line 494
    .local v4, "b2":[B
    const/4 v5, 0x0

    invoke-static {v1, v5, v4, v5, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 495
    return-object v4
.end method
