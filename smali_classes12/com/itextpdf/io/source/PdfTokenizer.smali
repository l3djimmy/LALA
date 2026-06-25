.class public Lcom/itextpdf/io/source/PdfTokenizer;
.super Ljava/lang/Object;
.source "PdfTokenizer.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/io/source/PdfTokenizer$TokenType;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final F:[B

.field public static final False:[B

.field public static final N:[B

.field public static final Null:[B

.field public static final Obj:[B

.field public static final R:[B

.field public static final Startxref:[B

.field public static final Stream:[B

.field public static final Trailer:[B

.field public static final True:[B

.field public static final Xref:[B

.field public static final delims:[Z


# instance fields
.field private closeStream:Z

.field private final file:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

.field protected generation:I

.field protected hexString:Z

.field protected outBuf:Lcom/itextpdf/io/source/ByteBuffer;

.field protected reference:I

.field protected type:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 35
    nop

    .line 54
    const/16 v0, 0x101

    new-array v0, v0, [Z

    fill-array-data v0, :array_0

    sput-object v0, Lcom/itextpdf/io/source/PdfTokenizer;->delims:[Z

    .line 83
    const-string/jumbo v0, "obj"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/io/source/PdfTokenizer;->Obj:[B

    .line 84
    const-string v0, "R"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/io/source/PdfTokenizer;->R:[B

    .line 85
    const-string/jumbo v0, "xref"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/io/source/PdfTokenizer;->Xref:[B

    .line 86
    const-string/jumbo v0, "startxref"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/io/source/PdfTokenizer;->Startxref:[B

    .line 87
    const-string/jumbo v0, "stream"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/io/source/PdfTokenizer;->Stream:[B

    .line 88
    const-string/jumbo v0, "trailer"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/io/source/PdfTokenizer;->Trailer:[B

    .line 89
    const-string v0, "n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/io/source/PdfTokenizer;->N:[B

    .line 90
    const-string v0, "f"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/io/source/PdfTokenizer;->F:[B

    .line 91
    const-string/jumbo v0, "null"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/io/source/PdfTokenizer;->Null:[B

    .line 92
    const-string/jumbo v0, "true"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/io/source/PdfTokenizer;->True:[B

    .line 93
    const-string v0, "false"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/io/source/PdfTokenizer;->False:[B

    return-void

    :array_0
    .array-data 1
        0x1t
        0x1t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x1t
        0x0t
        0x0t
        0x0t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x1t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data
.end method

.method public constructor <init>(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)V
    .locals 1
    .param p1, "file"    # Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    .line 114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 105
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/io/source/PdfTokenizer;->closeStream:Z

    .line 115
    iput-object p1, p0, Lcom/itextpdf/io/source/PdfTokenizer;->file:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    .line 116
    new-instance v0, Lcom/itextpdf/io/source/ByteBuffer;

    invoke-direct {v0}, Lcom/itextpdf/io/source/ByteBuffer;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/source/PdfTokenizer;->outBuf:Lcom/itextpdf/io/source/ByteBuffer;

    .line 117
    return-void
.end method

.method public static checkObjectStart(Lcom/itextpdf/io/source/PdfTokenizer;)[I
    .locals 5
    .param p0, "lineTokenizer"    # Lcom/itextpdf/io/source/PdfTokenizer;

    .line 815
    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    :try_start_0
    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/io/source/PdfTokenizer;->seek(J)V

    .line 816
    invoke-virtual {p0}, Lcom/itextpdf/io/source/PdfTokenizer;->nextToken()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-virtual {p0}, Lcom/itextpdf/io/source/PdfTokenizer;->getTokenType()Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Number:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    if-eq v0, v1, :cond_0

    goto :goto_1

    .line 818
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/io/source/PdfTokenizer;->getIntValue()I

    move-result v0

    .line 819
    .local v0, "num":I
    invoke-virtual {p0}, Lcom/itextpdf/io/source/PdfTokenizer;->nextToken()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-virtual {p0}, Lcom/itextpdf/io/source/PdfTokenizer;->getTokenType()Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    move-result-object v1

    sget-object v3, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Number:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    if-eq v1, v3, :cond_1

    goto :goto_0

    .line 821
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/io/source/PdfTokenizer;->getIntValue()I

    move-result v1

    .line 822
    .local v1, "gen":I
    invoke-virtual {p0}, Lcom/itextpdf/io/source/PdfTokenizer;->nextToken()Z

    move-result v3

    if-nez v3, :cond_2

    .line 823
    return-object v2

    .line 824
    :cond_2
    sget-object v3, Lcom/itextpdf/io/source/PdfTokenizer;->Obj:[B

    invoke-virtual {p0}, Lcom/itextpdf/io/source/PdfTokenizer;->getByteContent()[B

    move-result-object v4

    invoke-static {v3, v4}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v3

    if-nez v3, :cond_3

    .line 825
    return-object v2

    .line 826
    :cond_3
    filled-new-array {v0, v1}, [I

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    .line 820
    .end local v1    # "gen":I
    :cond_4
    :goto_0
    return-object v2

    .line 817
    .end local v0    # "num":I
    :cond_5
    :goto_1
    return-object v2

    .line 827
    :catch_0
    move-exception v0

    .line 830
    return-object v2
.end method

.method public static checkTrailer(Lcom/itextpdf/io/source/ByteBuffer;)Z
    .locals 4
    .param p0, "line"    # Lcom/itextpdf/io/source/ByteBuffer;

    .line 710
    sget-object v0, Lcom/itextpdf/io/source/PdfTokenizer;->Trailer:[B

    array-length v0, v0

    invoke-virtual {p0}, Lcom/itextpdf/io/source/ByteBuffer;->size()I

    move-result v1

    const/4 v2, 0x0

    if-le v0, v1, :cond_0

    .line 711
    return v2

    .line 712
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v1, Lcom/itextpdf/io/source/PdfTokenizer;->Trailer:[B

    array-length v1, v1

    if-ge v0, v1, :cond_2

    .line 713
    sget-object v1, Lcom/itextpdf/io/source/PdfTokenizer;->Trailer:[B

    aget-byte v1, v1, v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/io/source/ByteBuffer;->get(I)B

    move-result v3

    if-eq v1, v3, :cond_1

    .line 714
    return v2

    .line 712
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 716
    .end local v0    # "i":I
    :cond_2
    const/4 v0, 0x1

    return v0
.end method

.method protected static decodeStringContent([BIIZ)[B
    .locals 8
    .param p0, "content"    # [B
    .param p1, "from"    # I
    .param p2, "to"    # I
    .param p3, "hexWriting"    # Z

    .line 546
    new-instance v0, Lcom/itextpdf/io/source/ByteBuffer;

    sub-int v1, p2, p1

    add-int/lit8 v1, v1, 0x1

    invoke-direct {v0, v1}, Lcom/itextpdf/io/source/ByteBuffer;-><init>(I)V

    .line 549
    .local v0, "buffer":Lcom/itextpdf/io/source/ByteBuffer;
    if-eqz p3, :cond_2

    .line 550
    move v1, p1

    .line 551
    .local v1, "i":I
    :goto_0
    if-gt v1, p2, :cond_1

    .line 552
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .local v2, "i":I
    aget-byte v1, p0, v1

    invoke-static {v1}, Lcom/itextpdf/io/source/ByteBuffer;->getHex(I)I

    move-result v1

    .line 553
    .local v1, "v1":I
    if-le v2, p2, :cond_0

    .line 554
    shl-int/lit8 v3, v1, 0x4

    invoke-virtual {v0, v3}, Lcom/itextpdf/io/source/ByteBuffer;->append(I)Lcom/itextpdf/io/source/ByteBuffer;

    .line 555
    goto :goto_1

    .line 557
    :cond_0
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "i":I
    .local v3, "i":I
    aget-byte v2, p0, v2

    .line 558
    .local v2, "v2":I
    invoke-static {v2}, Lcom/itextpdf/io/source/ByteBuffer;->getHex(I)I

    move-result v2

    .line 559
    shl-int/lit8 v4, v1, 0x4

    add-int/2addr v4, v2

    invoke-virtual {v0, v4}, Lcom/itextpdf/io/source/ByteBuffer;->append(I)Lcom/itextpdf/io/source/ByteBuffer;

    .line 560
    .end local v1    # "v1":I
    .end local v2    # "v2":I
    move v1, v3

    goto :goto_0

    .line 561
    .end local v3    # "i":I
    :cond_1
    :goto_1
    goto/16 :goto_7

    .line 563
    :cond_2
    move v1, p1

    .line 564
    .local v1, "i":I
    :goto_2
    if-gt v1, p2, :cond_10

    .line 565
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .local v2, "i":I
    aget-byte v1, p0, v1

    .line 566
    .local v1, "ch":I
    const/16 v3, 0x5c

    const/16 v4, 0xa

    if-ne v1, v3, :cond_d

    .line 567
    const/4 v3, 0x0

    .line 568
    .local v3, "lineBreak":Z
    add-int/lit8 v5, v2, 0x1

    .end local v2    # "i":I
    .local v5, "i":I
    aget-byte v1, p0, v2

    .line 569
    sparse-switch v1, :sswitch_data_0

    .line 599
    const/16 v2, 0x30

    if-lt v1, v2, :cond_b

    const/16 v4, 0x37

    if-le v1, v4, :cond_4

    .line 600
    goto/16 :goto_5

    .line 577
    :sswitch_0
    const/16 v1, 0x9

    .line 578
    goto/16 :goto_5

    .line 574
    :sswitch_1
    const/16 v1, 0xd

    .line 575
    goto/16 :goto_5

    .line 571
    :sswitch_2
    const/16 v1, 0xa

    .line 572
    goto/16 :goto_5

    .line 583
    :sswitch_3
    const/16 v1, 0xc

    .line 584
    goto :goto_5

    .line 580
    :sswitch_4
    const/16 v1, 0x8

    .line 581
    goto :goto_5

    .line 588
    :sswitch_5
    goto :goto_5

    .line 590
    :sswitch_6
    const/4 v3, 0x1

    .line 591
    if-gt v5, p2, :cond_b

    add-int/lit8 v2, v5, 0x1

    .end local v5    # "i":I
    .restart local v2    # "i":I
    aget-byte v5, p0, v5

    if-eq v5, v4, :cond_3

    .line 592
    add-int/lit8 v2, v2, -0x1

    move v5, v2

    goto :goto_5

    .line 591
    :cond_3
    move v5, v2

    goto :goto_5

    .line 596
    .end local v2    # "i":I
    .restart local v5    # "i":I
    :sswitch_7
    const/4 v3, 0x1

    .line 597
    goto :goto_5

    .line 602
    :cond_4
    add-int/lit8 v6, v1, -0x30

    .line 603
    .local v6, "octal":I
    if-le v5, p2, :cond_5

    .line 604
    move v1, v6

    .line 605
    goto :goto_5

    .line 607
    :cond_5
    add-int/lit8 v7, v5, 0x1

    .end local v5    # "i":I
    .local v7, "i":I
    aget-byte v1, p0, v5

    .line 608
    if-lt v1, v2, :cond_a

    if-le v1, v4, :cond_6

    goto :goto_4

    .line 613
    :cond_6
    shl-int/lit8 v5, v6, 0x3

    add-int/2addr v5, v1

    sub-int/2addr v5, v2

    .line 615
    .end local v6    # "octal":I
    .local v5, "octal":I
    if-le v7, p2, :cond_7

    .line 616
    move v1, v5

    .line 617
    move v5, v7

    goto :goto_5

    .line 619
    :cond_7
    add-int/lit8 v6, v7, 0x1

    .end local v7    # "i":I
    .local v6, "i":I
    aget-byte v1, p0, v7

    .line 620
    if-lt v1, v2, :cond_9

    if-le v1, v4, :cond_8

    goto :goto_3

    .line 625
    :cond_8
    shl-int/lit8 v4, v5, 0x3

    add-int/2addr v4, v1

    sub-int/2addr v4, v2

    .line 626
    .end local v5    # "octal":I
    .local v4, "octal":I
    and-int/lit16 v1, v4, 0xff

    .line 627
    move v5, v6

    goto :goto_5

    .line 621
    .end local v4    # "octal":I
    .restart local v5    # "octal":I
    :cond_9
    :goto_3
    add-int/lit8 v6, v6, -0x1

    .line 622
    move v1, v5

    .line 623
    move v5, v6

    goto :goto_5

    .line 609
    .end local v5    # "octal":I
    .local v6, "octal":I
    .restart local v7    # "i":I
    :cond_a
    :goto_4
    add-int/lit8 v7, v7, -0x1

    .line 610
    move v1, v6

    .line 611
    move v5, v7

    .line 630
    .end local v6    # "octal":I
    .end local v7    # "i":I
    .local v5, "i":I
    :cond_b
    :goto_5
    if-eqz v3, :cond_c

    .line 631
    move v1, v5

    goto :goto_2

    .line 632
    .end local v3    # "lineBreak":Z
    :cond_c
    move v2, v5

    goto :goto_6

    .end local v5    # "i":I
    .restart local v2    # "i":I
    :cond_d
    const/16 v3, 0xd

    if-ne v1, v3, :cond_f

    .line 634
    const/16 v1, 0xa

    .line 635
    if-gt v2, p2, :cond_f

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "i":I
    .local v3, "i":I
    aget-byte v2, p0, v2

    if-eq v2, v4, :cond_e

    .line 636
    add-int/lit8 v3, v3, -0x1

    move v2, v3

    goto :goto_6

    .line 635
    :cond_e
    move v2, v3

    .line 639
    .end local v3    # "i":I
    .restart local v2    # "i":I
    :cond_f
    :goto_6
    invoke-virtual {v0, v1}, Lcom/itextpdf/io/source/ByteBuffer;->append(I)Lcom/itextpdf/io/source/ByteBuffer;

    .line 640
    .end local v1    # "ch":I
    move v1, v2

    goto/16 :goto_2

    .line 642
    .end local v2    # "i":I
    :cond_10
    :goto_7
    invoke-virtual {v0}, Lcom/itextpdf/io/source/ByteBuffer;->toByteArray()[B

    move-result-object v1

    return-object v1

    nop

    :sswitch_data_0
    .sparse-switch
        0xa -> :sswitch_7
        0xd -> :sswitch_6
        0x28 -> :sswitch_5
        0x29 -> :sswitch_5
        0x5c -> :sswitch_5
        0x62 -> :sswitch_4
        0x66 -> :sswitch_3
        0x6e -> :sswitch_2
        0x72 -> :sswitch_1
        0x74 -> :sswitch_0
    .end sparse-switch
.end method

.method public static decodeStringContent([BZ)[B
    .locals 2
    .param p0, "content"    # [B
    .param p1, "hexWriting"    # Z

    .line 657
    array-length v0, p0

    add-int/lit8 v0, v0, -0x1

    const/4 v1, 0x0

    invoke-static {p0, v1, v0, p1}, Lcom/itextpdf/io/source/PdfTokenizer;->decodeStringContent([BIIZ)[B

    move-result-object v0

    return-object v0
.end method

.method protected static isDelimiter(I)Z
    .locals 1
    .param p0, "ch"    # I

    .line 684
    const/16 v0, 0x28

    if-eq p0, v0, :cond_1

    const/16 v0, 0x29

    if-eq p0, v0, :cond_1

    const/16 v0, 0x3c

    if-eq p0, v0, :cond_1

    const/16 v0, 0x3e

    if-eq p0, v0, :cond_1

    const/16 v0, 0x5b

    if-eq p0, v0, :cond_1

    const/16 v0, 0x5d

    if-eq p0, v0, :cond_1

    const/16 v0, 0x2f

    if-eq p0, v0, :cond_1

    const/16 v0, 0x25

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method protected static isDelimiterWhitespace(I)Z
    .locals 2
    .param p0, "ch"    # I

    .line 688
    sget-object v0, Lcom/itextpdf/io/source/PdfTokenizer;->delims:[Z

    add-int/lit8 v1, p0, 0x1

    aget-boolean v0, v0, v1

    return v0
.end method

.method public static isWhitespace(I)Z
    .locals 1
    .param p0, "ch"    # I

    .line 669
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/itextpdf/io/source/PdfTokenizer;->isWhitespace(IZ)Z

    move-result v0

    return v0
.end method

.method protected static isWhitespace(IZ)Z
    .locals 1
    .param p0, "ch"    # I
    .param p1, "isWhitespace"    # Z

    .line 680
    if-eqz p1, :cond_0

    if-eqz p0, :cond_2

    :cond_0
    const/16 v0, 0x9

    if-eq p0, v0, :cond_2

    const/16 v0, 0xa

    if-eq p0, v0, :cond_2

    const/16 v0, 0xc

    if-eq p0, v0, :cond_2

    const/16 v0, 0xd

    if-eq p0, v0, :cond_2

    const/16 v0, 0x20

    if-ne p0, v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method


# virtual methods
.method public backOnePosition(I)V
    .locals 2
    .param p1, "ch"    # I

    .line 195
    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    .line 196
    iget-object v0, p0, Lcom/itextpdf/io/source/PdfTokenizer;->file:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    int-to-byte v1, p1

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->pushBack(B)V

    .line 197
    :cond_0
    return-void
.end method

.method public checkFdfHeader()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 221
    iget-object v0, p0, Lcom/itextpdf/io/source/PdfTokenizer;->file:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 222
    const/16 v0, 0x400

    invoke-virtual {p0, v0}, Lcom/itextpdf/io/source/PdfTokenizer;->readString(I)Ljava/lang/String;

    move-result-object v0

    .line 223
    .local v0, "str":Ljava/lang/String;
    const-string v1, "%FDF-"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 224
    .local v1, "idx":I
    if-nez v1, :cond_0

    .line 226
    return-void

    .line 225
    :cond_0
    new-instance v2, Lcom/itextpdf/io/exceptions/IOException;

    const-string v3, "FDF startxref not found."

    invoke-direct {v2, v3, p0}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v2
.end method

.method public checkPdfHeader()Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 212
    iget-object v0, p0, Lcom/itextpdf/io/source/PdfTokenizer;->file:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 213
    const/16 v0, 0x400

    invoke-virtual {p0, v0}, Lcom/itextpdf/io/source/PdfTokenizer;->readString(I)Ljava/lang/String;

    move-result-object v0

    .line 214
    .local v0, "str":Ljava/lang/String;
    const-string v1, "%PDF-"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 215
    .local v1, "idx":I
    if-nez v1, :cond_0

    .line 217
    add-int/lit8 v2, v1, 0x1

    add-int/lit8 v3, v1, 0x8

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 216
    :cond_0
    new-instance v2, Lcom/itextpdf/io/exceptions/IOException;

    const-string v3, "PDF header not found."

    invoke-direct {v2, v3, p0}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v2
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 132
    iget-boolean v0, p0, Lcom/itextpdf/io/source/PdfTokenizer;->closeStream:Z

    if-eqz v0, :cond_0

    .line 133
    iget-object v0, p0, Lcom/itextpdf/io/source/PdfTokenizer;->file:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->close()V

    .line 134
    :cond_0
    return-void
.end method

.method public getByteContent()[B
    .locals 1

    .line 161
    iget-object v0, p0, Lcom/itextpdf/io/source/PdfTokenizer;->outBuf:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/ByteBuffer;->toByteArray()[B

    move-result-object v0

    return-object v0
.end method

.method public getDecodedStringContent()[B
    .locals 4

    .line 169
    iget-object v0, p0, Lcom/itextpdf/io/source/PdfTokenizer;->outBuf:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/ByteBuffer;->getInternalBuffer()[B

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/io/source/PdfTokenizer;->outBuf:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/ByteBuffer;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0}, Lcom/itextpdf/io/source/PdfTokenizer;->isHexString()Z

    move-result v2

    const/4 v3, 0x0

    invoke-static {v0, v3, v1, v2}, Lcom/itextpdf/io/source/PdfTokenizer;->decodeStringContent([BIIZ)[B

    move-result-object v0

    return-object v0
.end method

.method public getGenNr()I
    .locals 1

    .line 191
    iget v0, p0, Lcom/itextpdf/io/source/PdfTokenizer;->generation:I

    return v0
.end method

.method public getHeaderOffset()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 200
    const/16 v0, 0x400

    invoke-virtual {p0, v0}, Lcom/itextpdf/io/source/PdfTokenizer;->readString(I)Ljava/lang/String;

    move-result-object v0

    .line 201
    .local v0, "str":Ljava/lang/String;
    const-string v1, "%PDF-"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 202
    .local v1, "idx":I
    if-gez v1, :cond_1

    .line 203
    const-string v2, "%FDF-"

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 204
    if-ltz v1, :cond_0

    goto :goto_0

    .line 205
    :cond_0
    new-instance v2, Lcom/itextpdf/io/exceptions/IOException;

    const-string v3, "PDF header not found."

    invoke-direct {v2, v3, p0}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v2

    .line 208
    :cond_1
    :goto_0
    return v1
.end method

.method public getIntValue()I
    .locals 1

    .line 513
    invoke-virtual {p0}, Lcom/itextpdf/io/source/PdfTokenizer;->getStringValue()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getLongValue()J
    .locals 2

    .line 509
    invoke-virtual {p0}, Lcom/itextpdf/io/source/PdfTokenizer;->getStringValue()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getNextEof()J
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 252
    const/16 v0, 0x80

    .line 255
    .local v0, "arrLength":I
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/io/source/PdfTokenizer;->file:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->getPosition()J

    move-result-wide v1

    .line 256
    .local v1, "currentPosition":J
    invoke-virtual {p0, v0}, Lcom/itextpdf/io/source/PdfTokenizer;->readString(I)Ljava/lang/String;

    move-result-object v3

    .line 257
    .local v3, "str":Ljava/lang/String;
    const-string v4, "%%EOF"

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    int-to-long v4, v4

    .line 258
    .local v4, "eofPosition":J
    const-wide/16 v6, 0x0

    cmp-long v6, v4, v6

    if-ltz v6, :cond_0

    .line 260
    add-long v6, v1, v4

    const-wide/16 v8, 0x6

    add-long/2addr v6, v8

    return-wide v6

    .line 262
    .end local v1    # "currentPosition":J
    .end local v4    # "eofPosition":J
    :cond_0
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    .line 263
    :cond_1
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v2, "PDF \"%%EOF\" marker is not found."

    invoke-direct {v1, v2, p0}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v1
.end method

.method public getObjNr()I
    .locals 1

    .line 187
    iget v0, p0, Lcom/itextpdf/io/source/PdfTokenizer;->reference:I

    return v0
.end method

.method public getPosition()J
    .locals 2

    .line 128
    iget-object v0, p0, Lcom/itextpdf/io/source/PdfTokenizer;->file:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->getPosition()J

    move-result-wide v0

    return-wide v0
.end method

.method public getSafeFile()Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .locals 1

    .line 529
    iget-object v0, p0, Lcom/itextpdf/io/source/PdfTokenizer;->file:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->createView()Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    move-result-object v0

    return-object v0
.end method

.method public getStartxref()J
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 229
    const/16 v0, 0x400

    .line 230
    .local v0, "arrLength":I
    iget-object v1, p0, Lcom/itextpdf/io/source/PdfTokenizer;->file:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->length()J

    move-result-wide v1

    .line 231
    .local v1, "fileLength":J
    int-to-long v3, v0

    sub-long v3, v1, v3

    .line 232
    .local v3, "pos":J
    const-wide/16 v5, 0x1

    cmp-long v5, v3, v5

    if-gez v5, :cond_0

    const-wide/16 v3, 0x1

    .line 233
    :cond_0
    :goto_0
    const-wide/16 v5, 0x0

    cmp-long v5, v3, v5

    if-lez v5, :cond_2

    .line 234
    iget-object v5, p0, Lcom/itextpdf/io/source/PdfTokenizer;->file:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v5, v3, v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 235
    invoke-virtual {p0, v0}, Lcom/itextpdf/io/source/PdfTokenizer;->readString(I)Ljava/lang/String;

    move-result-object v5

    .line 236
    .local v5, "str":Ljava/lang/String;
    const-string/jumbo v6, "startxref"

    invoke-virtual {v5, v6}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v6

    .line 237
    .local v6, "idx":I
    if-ltz v6, :cond_1

    int-to-long v7, v6

    add-long/2addr v7, v3

    return-wide v7

    .line 239
    :cond_1
    int-to-long v7, v0

    sub-long v7, v3, v7

    const-wide/16 v9, 0x9

    add-long v3, v7, v9

    .line 240
    .end local v5    # "str":Ljava/lang/String;
    .end local v6    # "idx":I
    goto :goto_0

    .line 241
    :cond_2
    new-instance v5, Lcom/itextpdf/io/exceptions/IOException;

    const-string v6, "PDF startxref not found."

    invoke-direct {v5, v6, p0}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v5
.end method

.method public getStringValue()Ljava/lang/String;
    .locals 4

    .line 165
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/itextpdf/io/source/PdfTokenizer;->outBuf:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/ByteBuffer;->getInternalBuffer()[B

    move-result-object v1

    iget-object v2, p0, Lcom/itextpdf/io/source/PdfTokenizer;->outBuf:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/ByteBuffer;->size()I

    move-result v2

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2}, Ljava/lang/String;-><init>([BII)V

    return-object v0
.end method

.method public getTokenType()Lcom/itextpdf/io/source/PdfTokenizer$TokenType;
    .locals 1

    .line 157
    iget-object v0, p0, Lcom/itextpdf/io/source/PdfTokenizer;->type:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    return-object v0
.end method

.method public isCloseStream()Z
    .locals 1

    .line 521
    iget-boolean v0, p0, Lcom/itextpdf/io/source/PdfTokenizer;->closeStream:Z

    return v0
.end method

.method public isHexString()Z
    .locals 1

    .line 517
    iget-boolean v0, p0, Lcom/itextpdf/io/source/PdfTokenizer;->hexString:Z

    return v0
.end method

.method public length()J
    .locals 2

    .line 137
    iget-object v0, p0, Lcom/itextpdf/io/source/PdfTokenizer;->file:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->length()J

    move-result-wide v0

    return-wide v0
.end method

.method public nextToken()Z
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 342
    iget-object v0, p0, Lcom/itextpdf/io/source/PdfTokenizer;->outBuf:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/ByteBuffer;->reset()Lcom/itextpdf/io/source/ByteBuffer;

    .line 344
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/source/PdfTokenizer;->file:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v0

    .line 345
    .local v0, "ch":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    invoke-static {v0}, Lcom/itextpdf/io/source/PdfTokenizer;->isWhitespace(I)Z

    move-result v2

    if-nez v2, :cond_0

    .line 346
    :cond_1
    const/4 v2, 0x0

    if-ne v0, v1, :cond_2

    .line 347
    sget-object v1, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->EndOfFile:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    iput-object v1, p0, Lcom/itextpdf/io/source/PdfTokenizer;->type:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    .line 348
    return v2

    .line 350
    :cond_2
    const-string v3, "Error reading string."

    const/16 v4, 0x3e

    const/4 v5, 0x1

    sparse-switch v0, :sswitch_data_0

    .line 445
    const/16 v2, 0x2e

    const/16 v3, 0x39

    const/16 v4, 0x30

    const/16 v6, 0x2d

    if-eq v0, v6, :cond_14

    const/16 v7, 0x2b

    if-eq v0, v7, :cond_14

    if-eq v0, v2, :cond_14

    if-lt v0, v4, :cond_12

    if-gt v0, v3, :cond_12

    goto/16 :goto_7

    .line 356
    :sswitch_0
    sget-object v1, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->EndArray:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    iput-object v1, p0, Lcom/itextpdf/io/source/PdfTokenizer;->type:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    .line 357
    goto/16 :goto_b

    .line 352
    :sswitch_1
    sget-object v1, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->StartArray:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    iput-object v1, p0, Lcom/itextpdf/io/source/PdfTokenizer;->type:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    .line 353
    goto/16 :goto_b

    .line 371
    :sswitch_2
    iget-object v1, p0, Lcom/itextpdf/io/source/PdfTokenizer;->file:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v0

    .line 372
    if-eq v0, v4, :cond_3

    .line 373
    const-string v1, "\'>\' not expected."

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p0, v1, v2}, Lcom/itextpdf/io/source/PdfTokenizer;->throwError(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 374
    :cond_3
    sget-object v1, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->EndDic:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    iput-object v1, p0, Lcom/itextpdf/io/source/PdfTokenizer;->type:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    .line 375
    goto/16 :goto_b

    .line 378
    :sswitch_3
    iget-object v1, p0, Lcom/itextpdf/io/source/PdfTokenizer;->file:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v1

    .line 379
    .local v1, "v1":I
    const/16 v6, 0x3c

    if-ne v1, v6, :cond_4

    .line 380
    sget-object v2, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->StartDic:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    iput-object v2, p0, Lcom/itextpdf/io/source/PdfTokenizer;->type:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    .line 381
    goto/16 :goto_b

    .line 383
    :cond_4
    sget-object v6, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->String:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    iput-object v6, p0, Lcom/itextpdf/io/source/PdfTokenizer;->type:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    .line 384
    iput-boolean v5, p0, Lcom/itextpdf/io/source/PdfTokenizer;->hexString:Z

    .line 385
    const/4 v6, 0x0

    .line 387
    .local v6, "v2":I
    :goto_0
    invoke-static {v1}, Lcom/itextpdf/io/source/PdfTokenizer;->isWhitespace(I)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 388
    iget-object v7, p0, Lcom/itextpdf/io/source/PdfTokenizer;->file:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v7}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v1

    goto :goto_0

    .line 389
    :cond_5
    if-ne v1, v4, :cond_6

    .line 390
    goto :goto_2

    .line 391
    :cond_6
    iget-object v7, p0, Lcom/itextpdf/io/source/PdfTokenizer;->outBuf:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v7, v1}, Lcom/itextpdf/io/source/ByteBuffer;->append(I)Lcom/itextpdf/io/source/ByteBuffer;

    .line 392
    invoke-static {v1}, Lcom/itextpdf/io/source/ByteBuffer;->getHex(I)I

    move-result v1

    .line 393
    if-gez v1, :cond_7

    .line 394
    goto :goto_2

    .line 395
    :cond_7
    iget-object v7, p0, Lcom/itextpdf/io/source/PdfTokenizer;->file:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v7}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v6

    .line 396
    :goto_1
    invoke-static {v6}, Lcom/itextpdf/io/source/PdfTokenizer;->isWhitespace(I)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 397
    iget-object v7, p0, Lcom/itextpdf/io/source/PdfTokenizer;->file:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v7}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v6

    goto :goto_1

    .line 398
    :cond_8
    if-ne v6, v4, :cond_9

    .line 399
    goto :goto_2

    .line 401
    :cond_9
    iget-object v7, p0, Lcom/itextpdf/io/source/PdfTokenizer;->outBuf:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v7, v6}, Lcom/itextpdf/io/source/ByteBuffer;->append(I)Lcom/itextpdf/io/source/ByteBuffer;

    .line 402
    invoke-static {v6}, Lcom/itextpdf/io/source/ByteBuffer;->getHex(I)I

    move-result v6

    .line 403
    if-gez v6, :cond_b

    .line 404
    nop

    .line 407
    :goto_2
    if-ltz v1, :cond_a

    if-gez v6, :cond_1c

    .line 408
    :cond_a
    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p0, v3, v2}, Lcom/itextpdf/io/source/PdfTokenizer;->throwError(Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_b

    .line 405
    :cond_b
    iget-object v7, p0, Lcom/itextpdf/io/source/PdfTokenizer;->file:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v7}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v1

    goto :goto_0

    .line 360
    .end local v1    # "v1":I
    .end local v6    # "v2":I
    :sswitch_4
    sget-object v1, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Name:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    iput-object v1, p0, Lcom/itextpdf/io/source/PdfTokenizer;->type:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    .line 362
    :goto_3
    iget-object v1, p0, Lcom/itextpdf/io/source/PdfTokenizer;->file:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v0

    .line 363
    sget-object v1, Lcom/itextpdf/io/source/PdfTokenizer;->delims:[Z

    add-int/lit8 v2, v0, 0x1

    aget-boolean v1, v1, v2

    if-eqz v1, :cond_c

    .line 364
    nop

    .line 367
    invoke-virtual {p0, v0}, Lcom/itextpdf/io/source/PdfTokenizer;->backOnePosition(I)V

    .line 368
    goto/16 :goto_b

    .line 365
    :cond_c
    iget-object v1, p0, Lcom/itextpdf/io/source/PdfTokenizer;->outBuf:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v1, v0}, Lcom/itextpdf/io/source/ByteBuffer;->append(I)Lcom/itextpdf/io/source/ByteBuffer;

    goto :goto_3

    .line 419
    :sswitch_5
    sget-object v4, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->String:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    iput-object v4, p0, Lcom/itextpdf/io/source/PdfTokenizer;->type:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    .line 420
    iput-boolean v2, p0, Lcom/itextpdf/io/source/PdfTokenizer;->hexString:Z

    .line 421
    const/4 v4, 0x0

    .line 423
    .local v4, "nesting":I
    :goto_4
    iget-object v6, p0, Lcom/itextpdf/io/source/PdfTokenizer;->file:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v6}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v0

    .line 424
    if-ne v0, v1, :cond_d

    .line 425
    goto :goto_5

    .line 426
    :cond_d
    const/16 v6, 0x28

    if-ne v0, v6, :cond_e

    .line 427
    add-int/lit8 v4, v4, 0x1

    goto :goto_6

    .line 428
    :cond_e
    const/16 v6, 0x29

    if-ne v0, v6, :cond_f

    .line 429
    add-int/lit8 v4, v4, -0x1

    .line 430
    if-ne v4, v1, :cond_10

    .line 431
    goto :goto_5

    .line 432
    :cond_f
    const/16 v6, 0x5c

    if-ne v0, v6, :cond_10

    .line 433
    iget-object v7, p0, Lcom/itextpdf/io/source/PdfTokenizer;->outBuf:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v7, v6}, Lcom/itextpdf/io/source/ByteBuffer;->append(I)Lcom/itextpdf/io/source/ByteBuffer;

    .line 434
    iget-object v6, p0, Lcom/itextpdf/io/source/PdfTokenizer;->file:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v6}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v0

    .line 435
    if-gez v0, :cond_10

    .line 436
    nop

    .line 440
    :goto_5
    if-ne v0, v1, :cond_1c

    .line 441
    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {p0, v3, v1}, Lcom/itextpdf/io/source/PdfTokenizer;->throwError(Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_b

    .line 438
    :cond_10
    :goto_6
    iget-object v6, p0, Lcom/itextpdf/io/source/PdfTokenizer;->outBuf:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v6, v0}, Lcom/itextpdf/io/source/ByteBuffer;->append(I)Lcom/itextpdf/io/source/ByteBuffer;

    goto :goto_4

    .line 412
    .end local v4    # "nesting":I
    :sswitch_6
    sget-object v2, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Comment:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    iput-object v2, p0, Lcom/itextpdf/io/source/PdfTokenizer;->type:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    .line 414
    :cond_11
    iget-object v2, p0, Lcom/itextpdf/io/source/PdfTokenizer;->file:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v0

    .line 415
    if-eq v0, v1, :cond_1c

    const/16 v2, 0xd

    if-eq v0, v2, :cond_1c

    const/16 v2, 0xa

    if-ne v0, v2, :cond_11

    .line 416
    goto/16 :goto_b

    .line 494
    :cond_12
    sget-object v2, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Other:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    iput-object v2, p0, Lcom/itextpdf/io/source/PdfTokenizer;->type:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    .line 496
    :cond_13
    iget-object v2, p0, Lcom/itextpdf/io/source/PdfTokenizer;->outBuf:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v2, v0}, Lcom/itextpdf/io/source/ByteBuffer;->append(I)Lcom/itextpdf/io/source/ByteBuffer;

    .line 497
    iget-object v2, p0, Lcom/itextpdf/io/source/PdfTokenizer;->file:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v0

    .line 498
    sget-object v2, Lcom/itextpdf/io/source/PdfTokenizer;->delims:[Z

    add-int/lit8 v3, v0, 0x1

    aget-boolean v2, v2, v3

    if-eqz v2, :cond_13

    goto/16 :goto_a

    .line 446
    :cond_14
    :goto_7
    sget-object v7, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Number:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    iput-object v7, p0, Lcom/itextpdf/io/source/PdfTokenizer;->type:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    .line 447
    const/4 v7, 0x0

    .line 448
    .local v7, "isReal":Z
    const/4 v8, 0x0

    .line 449
    .local v8, "numberOfMinuses":I
    if-ne v0, v6, :cond_16

    .line 452
    :cond_15
    add-int/2addr v8, v5

    .line 453
    iget-object v9, p0, Lcom/itextpdf/io/source/PdfTokenizer;->file:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v9}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v0

    .line 454
    if-eq v0, v6, :cond_15

    .line 455
    iget-object v9, p0, Lcom/itextpdf/io/source/PdfTokenizer;->outBuf:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v9, v6}, Lcom/itextpdf/io/source/ByteBuffer;->append(I)Lcom/itextpdf/io/source/ByteBuffer;

    goto :goto_8

    .line 457
    :cond_16
    iget-object v9, p0, Lcom/itextpdf/io/source/PdfTokenizer;->outBuf:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v9, v0}, Lcom/itextpdf/io/source/ByteBuffer;->append(I)Lcom/itextpdf/io/source/ByteBuffer;

    .line 460
    iget-object v9, p0, Lcom/itextpdf/io/source/PdfTokenizer;->file:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v9}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v0

    .line 462
    :goto_8
    if-lt v0, v4, :cond_17

    if-gt v0, v3, :cond_17

    .line 463
    iget-object v9, p0, Lcom/itextpdf/io/source/PdfTokenizer;->outBuf:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v9, v0}, Lcom/itextpdf/io/source/ByteBuffer;->append(I)Lcom/itextpdf/io/source/ByteBuffer;

    .line 464
    iget-object v9, p0, Lcom/itextpdf/io/source/PdfTokenizer;->file:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v9}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v0

    goto :goto_8

    .line 467
    :cond_17
    if-ne v0, v2, :cond_1a

    .line 468
    const/4 v7, 0x1

    .line 469
    iget-object v2, p0, Lcom/itextpdf/io/source/PdfTokenizer;->outBuf:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v2, v0}, Lcom/itextpdf/io/source/ByteBuffer;->append(I)Lcom/itextpdf/io/source/ByteBuffer;

    .line 470
    iget-object v2, p0, Lcom/itextpdf/io/source/PdfTokenizer;->file:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v0

    .line 474
    const/4 v2, 0x0

    .line 475
    .local v2, "numberOfMinusesAfterDot":I
    if-ne v0, v6, :cond_18

    .line 476
    add-int/lit8 v2, v2, 0x1

    .line 477
    iget-object v6, p0, Lcom/itextpdf/io/source/PdfTokenizer;->file:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v6}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v0

    .line 479
    :cond_18
    :goto_9
    if-lt v0, v4, :cond_1a

    if-gt v0, v3, :cond_1a

    .line 480
    if-nez v2, :cond_19

    .line 481
    iget-object v6, p0, Lcom/itextpdf/io/source/PdfTokenizer;->outBuf:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v6, v0}, Lcom/itextpdf/io/source/ByteBuffer;->append(I)Lcom/itextpdf/io/source/ByteBuffer;

    .line 483
    :cond_19
    iget-object v6, p0, Lcom/itextpdf/io/source/PdfTokenizer;->file:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v6}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v0

    goto :goto_9

    .line 487
    .end local v2    # "numberOfMinusesAfterDot":I
    :cond_1a
    if-le v8, v5, :cond_1b

    if-nez v7, :cond_1b

    .line 490
    iget-object v2, p0, Lcom/itextpdf/io/source/PdfTokenizer;->outBuf:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/ByteBuffer;->reset()Lcom/itextpdf/io/source/ByteBuffer;

    .line 491
    iget-object v2, p0, Lcom/itextpdf/io/source/PdfTokenizer;->outBuf:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v2, v4}, Lcom/itextpdf/io/source/ByteBuffer;->append(I)Lcom/itextpdf/io/source/ByteBuffer;

    .line 493
    .end local v7    # "isReal":Z
    .end local v8    # "numberOfMinuses":I
    :cond_1b
    nop

    .line 500
    :goto_a
    if-eq v0, v1, :cond_1c

    .line 501
    invoke-virtual {p0, v0}, Lcom/itextpdf/io/source/PdfTokenizer;->backOnePosition(I)V

    .line 505
    :cond_1c
    :goto_b
    return v5

    :sswitch_data_0
    .sparse-switch
        0x25 -> :sswitch_6
        0x28 -> :sswitch_5
        0x2f -> :sswitch_4
        0x3c -> :sswitch_3
        0x3e -> :sswitch_2
        0x5b -> :sswitch_1
        0x5d -> :sswitch_0
    .end sparse-switch
.end method

.method public nextValidToken()V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 267
    const/4 v0, 0x0

    .line 268
    .local v0, "level":I
    const/4 v1, 0x0

    .line 269
    .local v1, "n1":[B
    const/4 v2, 0x0

    .line 270
    .local v2, "n2":[B
    const-wide/16 v3, 0x0

    .line 271
    .local v3, "ptr":J
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/io/source/PdfTokenizer;->nextToken()Z

    move-result v5

    if-eqz v5, :cond_7

    .line 272
    iget-object v5, p0, Lcom/itextpdf/io/source/PdfTokenizer;->type:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    sget-object v6, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Comment:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    if-ne v5, v6, :cond_0

    .line 273
    goto :goto_0

    .line 274
    :cond_0
    packed-switch v0, :pswitch_data_0

    goto/16 :goto_2

    .line 295
    :pswitch_0
    iget-object v5, p0, Lcom/itextpdf/io/source/PdfTokenizer;->type:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    sget-object v6, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Other:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    if-ne v5, v6, :cond_4

    .line 296
    sget-object v5, Lcom/itextpdf/io/source/PdfTokenizer;->R:[B

    invoke-virtual {p0, v5}, Lcom/itextpdf/io/source/PdfTokenizer;->tokenValueEqualsTo([B)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 297
    if-eqz v2, :cond_1

    .line 298
    sget-object v5, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Ref:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    iput-object v5, p0, Lcom/itextpdf/io/source/PdfTokenizer;->type:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    .line 300
    :try_start_0
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v1}, Ljava/lang/String;-><init>([B)V

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lcom/itextpdf/io/source/PdfTokenizer;->reference:I

    .line 301
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v2}, Ljava/lang/String;-><init>([B)V

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lcom/itextpdf/io/source/PdfTokenizer;->generation:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 310
    goto :goto_1

    .line 302
    :catch_0
    move-exception v5

    .line 305
    .local v5, "ex":Ljava/lang/Exception;
    const-class v6, Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-static {v6}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v6

    .line 306
    .local v6, "logger":Lorg/slf4j/Logger;
    new-instance v7, Ljava/lang/String;

    invoke-direct {v7, v1}, Ljava/lang/String;-><init>([B)V

    new-instance v8, Ljava/lang/String;

    invoke-direct {v8, v2}, Ljava/lang/String;-><init>([B)V

    filled-new-array {v7, v8}, [Ljava/lang/Object;

    move-result-object v7

    const-string v8, "Invalid indirect reference {0} {1} R"

    invoke-static {v8, v7}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 308
    const/4 v7, -0x1

    iput v7, p0, Lcom/itextpdf/io/source/PdfTokenizer;->reference:I

    .line 309
    const/4 v7, 0x0

    iput v7, p0, Lcom/itextpdf/io/source/PdfTokenizer;->generation:I

    .line 311
    .end local v5    # "ex":Ljava/lang/Exception;
    .end local v6    # "logger":Lorg/slf4j/Logger;
    :goto_1
    return-void

    .line 297
    :cond_1
    new-instance v5, Ljava/lang/AssertionError;

    invoke-direct {v5}, Ljava/lang/AssertionError;-><init>()V

    throw v5

    .line 312
    :cond_2
    sget-object v5, Lcom/itextpdf/io/source/PdfTokenizer;->Obj:[B

    invoke-virtual {p0, v5}, Lcom/itextpdf/io/source/PdfTokenizer;->tokenValueEqualsTo([B)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 313
    if-eqz v2, :cond_3

    .line 314
    sget-object v5, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Obj:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    iput-object v5, p0, Lcom/itextpdf/io/source/PdfTokenizer;->type:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    .line 315
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v1}, Ljava/lang/String;-><init>([B)V

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lcom/itextpdf/io/source/PdfTokenizer;->reference:I

    .line 316
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v2}, Ljava/lang/String;-><init>([B)V

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lcom/itextpdf/io/source/PdfTokenizer;->generation:I

    .line 317
    return-void

    .line 313
    :cond_3
    new-instance v5, Ljava/lang/AssertionError;

    invoke-direct {v5}, Ljava/lang/AssertionError;-><init>()V

    throw v5

    .line 320
    :cond_4
    iget-object v5, p0, Lcom/itextpdf/io/source/PdfTokenizer;->file:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v5, v3, v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 321
    sget-object v5, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Number:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    iput-object v5, p0, Lcom/itextpdf/io/source/PdfTokenizer;->type:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    .line 322
    iget-object v5, p0, Lcom/itextpdf/io/source/PdfTokenizer;->outBuf:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v5}, Lcom/itextpdf/io/source/ByteBuffer;->reset()Lcom/itextpdf/io/source/ByteBuffer;

    move-result-object v5

    invoke-virtual {v5, v1}, Lcom/itextpdf/io/source/ByteBuffer;->append([B)Lcom/itextpdf/io/source/ByteBuffer;

    .line 323
    return-void

    .line 284
    :pswitch_1
    iget-object v5, p0, Lcom/itextpdf/io/source/PdfTokenizer;->type:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    sget-object v6, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Number:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    if-eq v5, v6, :cond_5

    .line 285
    iget-object v5, p0, Lcom/itextpdf/io/source/PdfTokenizer;->file:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v5, v3, v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 286
    sget-object v5, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Number:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    iput-object v5, p0, Lcom/itextpdf/io/source/PdfTokenizer;->type:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    .line 287
    iget-object v5, p0, Lcom/itextpdf/io/source/PdfTokenizer;->outBuf:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v5}, Lcom/itextpdf/io/source/ByteBuffer;->reset()Lcom/itextpdf/io/source/ByteBuffer;

    move-result-object v5

    invoke-virtual {v5, v1}, Lcom/itextpdf/io/source/ByteBuffer;->append([B)Lcom/itextpdf/io/source/ByteBuffer;

    .line 288
    return-void

    .line 290
    :cond_5
    invoke-virtual {p0}, Lcom/itextpdf/io/source/PdfTokenizer;->getByteContent()[B

    move-result-object v2

    .line 291
    add-int/lit8 v0, v0, 0x1

    .line 292
    goto :goto_2

    .line 276
    :pswitch_2
    iget-object v5, p0, Lcom/itextpdf/io/source/PdfTokenizer;->type:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    sget-object v6, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Number:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    if-eq v5, v6, :cond_6

    .line 277
    return-void

    .line 278
    :cond_6
    iget-object v5, p0, Lcom/itextpdf/io/source/PdfTokenizer;->file:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v5}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->getPosition()J

    move-result-wide v3

    .line 279
    invoke-virtual {p0}, Lcom/itextpdf/io/source/PdfTokenizer;->getByteContent()[B

    move-result-object v1

    .line 280
    add-int/lit8 v0, v0, 0x1

    .line 281
    nop

    .line 323
    :goto_2
    goto/16 :goto_0

    .line 330
    :cond_7
    const/4 v5, 0x1

    if-ne v0, v5, :cond_8

    .line 331
    sget-object v5, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Number:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    iput-object v5, p0, Lcom/itextpdf/io/source/PdfTokenizer;->type:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    .line 332
    iget-object v5, p0, Lcom/itextpdf/io/source/PdfTokenizer;->outBuf:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v5}, Lcom/itextpdf/io/source/ByteBuffer;->reset()Lcom/itextpdf/io/source/ByteBuffer;

    move-result-object v5

    invoke-virtual {v5, v1}, Lcom/itextpdf/io/source/ByteBuffer;->append([B)Lcom/itextpdf/io/source/ByteBuffer;

    .line 338
    :cond_8
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public read()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 141
    iget-object v0, p0, Lcom/itextpdf/io/source/PdfTokenizer;->file:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v0

    return v0
.end method

.method public readFully([B)V
    .locals 1
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 124
    iget-object v0, p0, Lcom/itextpdf/io/source/PdfTokenizer;->file:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readFully([B)V

    .line 125
    return-void
.end method

.method public readLineSegment(Lcom/itextpdf/io/source/ByteBuffer;)Z
    .locals 1
    .param p1, "buffer"    # Lcom/itextpdf/io/source/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 731
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/io/source/PdfTokenizer;->readLineSegment(Lcom/itextpdf/io/source/ByteBuffer;Z)Z

    move-result v0

    return v0
.end method

.method public readLineSegment(Lcom/itextpdf/io/source/ByteBuffer;Z)Z
    .locals 7
    .param p1, "buffer"    # Lcom/itextpdf/io/source/ByteBuffer;
    .param p2, "isNullWhitespace"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 747
    const/4 v0, 0x0

    .line 751
    .local v0, "eol":Z
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/io/source/PdfTokenizer;->read()I

    move-result v1

    move v2, v1

    .local v2, "c":I
    invoke-static {v1, p2}, Lcom/itextpdf/io/source/PdfTokenizer;->isWhitespace(IZ)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 753
    :cond_0
    const/4 v1, 0x0

    .line 754
    .local v1, "prevWasWhitespace":Z
    :goto_1
    const/16 v3, 0xa

    if-nez v0, :cond_5

    .line 755
    sparse-switch v2, :sswitch_data_0

    .line 776
    const/4 v1, 0x0

    .line 777
    int-to-byte v3, v2

    invoke-virtual {p1, v3}, Lcom/itextpdf/io/source/ByteBuffer;->append(B)Lcom/itextpdf/io/source/ByteBuffer;

    goto :goto_2

    .line 761
    :sswitch_0
    const/4 v0, 0x1

    .line 762
    invoke-virtual {p0}, Lcom/itextpdf/io/source/PdfTokenizer;->getPosition()J

    move-result-wide v4

    .line 763
    .local v4, "cur":J
    invoke-virtual {p0}, Lcom/itextpdf/io/source/PdfTokenizer;->read()I

    move-result v6

    if-eq v6, v3, :cond_2

    .line 764
    invoke-virtual {p0, v4, v5}, Lcom/itextpdf/io/source/PdfTokenizer;->seek(J)V

    goto :goto_2

    .line 770
    .end local v4    # "cur":J
    :sswitch_1
    if-eqz v1, :cond_1

    .line 771
    goto :goto_2

    .line 772
    :cond_1
    const/4 v1, 0x1

    .line 773
    int-to-byte v3, v2

    invoke-virtual {p1, v3}, Lcom/itextpdf/io/source/ByteBuffer;->append(B)Lcom/itextpdf/io/source/ByteBuffer;

    .line 774
    goto :goto_2

    .line 758
    :sswitch_2
    const/4 v0, 0x1

    .line 759
    nop

    .line 781
    :cond_2
    :goto_2
    if-nez v0, :cond_4

    invoke-virtual {p1}, Lcom/itextpdf/io/source/ByteBuffer;->size()I

    move-result v3

    invoke-virtual {p1}, Lcom/itextpdf/io/source/ByteBuffer;->capacity()I

    move-result v4

    if-ne v3, v4, :cond_3

    goto :goto_3

    .line 784
    :cond_3
    invoke-virtual {p0}, Lcom/itextpdf/io/source/PdfTokenizer;->read()I

    move-result v2

    goto :goto_1

    .line 782
    :cond_4
    :goto_3
    const/4 v0, 0x1

    goto :goto_1

    .line 787
    :cond_5
    invoke-virtual {p1}, Lcom/itextpdf/io/source/ByteBuffer;->size()I

    move-result v4

    invoke-virtual {p1}, Lcom/itextpdf/io/source/ByteBuffer;->capacity()I

    move-result v5

    if-ne v4, v5, :cond_7

    .line 788
    const/4 v0, 0x0

    .line 789
    :goto_4
    if-nez v0, :cond_7

    .line 790
    invoke-virtual {p0}, Lcom/itextpdf/io/source/PdfTokenizer;->read()I

    move-result v4

    move v2, v4

    sparse-switch v4, :sswitch_data_1

    goto :goto_5

    .line 796
    :sswitch_3
    const/4 v0, 0x1

    .line 797
    invoke-virtual {p0}, Lcom/itextpdf/io/source/PdfTokenizer;->getPosition()J

    move-result-wide v4

    .line 798
    .restart local v4    # "cur":J
    invoke-virtual {p0}, Lcom/itextpdf/io/source/PdfTokenizer;->read()I

    move-result v6

    if-eq v6, v3, :cond_6

    .line 799
    invoke-virtual {p0, v4, v5}, Lcom/itextpdf/io/source/PdfTokenizer;->seek(J)V

    goto :goto_5

    .line 793
    .end local v4    # "cur":J
    :sswitch_4
    const/4 v0, 0x1

    .line 794
    nop

    .line 801
    :cond_6
    :goto_5
    goto :goto_4

    .line 805
    :cond_7
    const/4 v3, -0x1

    if-ne v2, v3, :cond_9

    invoke-virtual {p1}, Lcom/itextpdf/io/source/ByteBuffer;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_8

    goto :goto_6

    :cond_8
    const/4 v3, 0x0

    goto :goto_7

    :cond_9
    :goto_6
    const/4 v3, 0x1

    :goto_7
    return v3

    nop

    :sswitch_data_0
    .sparse-switch
        -0x1 -> :sswitch_2
        0x9 -> :sswitch_1
        0xa -> :sswitch_2
        0xc -> :sswitch_1
        0xd -> :sswitch_0
        0x20 -> :sswitch_1
    .end sparse-switch

    :sswitch_data_1
    .sparse-switch
        -0x1 -> :sswitch_4
        0xa -> :sswitch_4
        0xd -> :sswitch_3
    .end sparse-switch
.end method

.method public readString(I)Ljava/lang/String;
    .locals 3
    .param p1, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 145
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 147
    .local v0, "buf":Ljava/lang/StringBuilder;
    :goto_0
    add-int/lit8 v1, p1, -0x1

    .end local p1    # "size":I
    .local v1, "size":I
    if-lez p1, :cond_1

    .line 148
    invoke-virtual {p0}, Lcom/itextpdf/io/source/PdfTokenizer;->read()I

    move-result p1

    .line 149
    .local p1, "ch":I
    const/4 v2, -0x1

    if-ne p1, v2, :cond_0

    .line 150
    goto :goto_1

    .line 151
    :cond_0
    int-to-char v2, p1

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move p1, v1

    goto :goto_0

    .line 153
    .end local p1    # "ch":I
    :cond_1
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public seek(J)V
    .locals 1
    .param p1, "pos"    # J

    .line 120
    iget-object v0, p0, Lcom/itextpdf/io/source/PdfTokenizer;->file:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 121
    return-void
.end method

.method public setCloseStream(Z)V
    .locals 0
    .param p1, "closeStream"    # Z

    .line 525
    iput-boolean p1, p0, Lcom/itextpdf/io/source/PdfTokenizer;->closeStream:Z

    .line 526
    return-void
.end method

.method public varargs throwError(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 3
    .param p1, "error"    # Ljava/lang/String;
    .param p2, "messageParams"    # [Ljava/lang/Object;

    .line 698
    new-instance v0, Lcom/itextpdf/io/exceptions/IOException;

    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    invoke-direct {v1, p1}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v1

    const-string v2, "Error at file pointer {0}."

    invoke-direct {v0, v2, v1}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    iget-object v1, p0, Lcom/itextpdf/io/source/PdfTokenizer;->file:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    .line 699
    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->getPosition()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v0

    throw v0
.end method

.method public tokenValueEqualsTo([B)Z
    .locals 5
    .param p1, "cmp"    # [B

    .line 173
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 174
    return v0

    .line 176
    :cond_0
    array-length v1, p1

    .line 177
    .local v1, "size":I
    iget-object v2, p0, Lcom/itextpdf/io/source/PdfTokenizer;->outBuf:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/ByteBuffer;->size()I

    move-result v2

    if-eq v2, v1, :cond_1

    .line 178
    return v0

    .line 180
    :cond_1
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_3

    .line 181
    aget-byte v3, p1, v2

    iget-object v4, p0, Lcom/itextpdf/io/source/PdfTokenizer;->outBuf:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/ByteBuffer;->getInternalBuffer()[B

    move-result-object v4

    aget-byte v4, v4, v2

    if-eq v3, v4, :cond_2

    .line 182
    return v0

    .line 180
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 183
    .end local v2    # "i":I
    :cond_3
    const/4 v0, 0x1

    return v0
.end method
