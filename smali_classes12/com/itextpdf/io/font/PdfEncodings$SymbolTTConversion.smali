.class Lcom/itextpdf/io/font/PdfEncodings$SymbolTTConversion;
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
    name = "SymbolTTConversion"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 570
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/itextpdf/io/font/PdfEncodings$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/itextpdf/io/font/PdfEncodings$1;

    .line 570
    invoke-direct {p0}, Lcom/itextpdf/io/font/PdfEncodings$SymbolTTConversion;-><init>()V

    return-void
.end method


# virtual methods
.method public byteToChar([BLjava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "b"    # [B
    .param p2, "encoding"    # Ljava/lang/String;

    .line 597
    const/4 v0, 0x0

    return-object v0
.end method

.method public charToByte(CLjava/lang/String;)[B
    .locals 3
    .param p1, "char1"    # C
    .param p2, "encoding"    # Ljava/lang/String;

    .line 573
    const v0, 0xff00

    and-int v1, p1, v0

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    and-int/2addr v0, p1

    const v1, 0xf000

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 576
    :cond_0
    new-array v0, v2, [B

    return-object v0

    .line 574
    :cond_1
    :goto_0
    int-to-byte v0, p1

    const/4 v1, 0x1

    new-array v1, v1, [B

    aput-byte v0, v1, v2

    return-object v1
.end method

.method public charToByte(Ljava/lang/String;Ljava/lang/String;)[B
    .locals 8
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "encoding"    # Ljava/lang/String;

    .line 580
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 581
    .local v0, "ch":[C
    array-length v1, v0

    new-array v1, v1, [B

    .line 582
    .local v1, "b":[B
    const/4 v2, 0x0

    .line 583
    .local v2, "ptr":I
    array-length v3, v0

    .line 584
    .local v3, "len":I
    const/4 v4, 0x0

    .local v4, "k":I
    :goto_0
    if-ge v4, v3, :cond_2

    .line 585
    aget-char v5, v0, v4

    .line 586
    .local v5, "c":C
    const v6, 0xff00

    and-int v7, v5, v6

    if-eqz v7, :cond_0

    and-int/2addr v6, v5

    const v7, 0xf000

    if-ne v6, v7, :cond_1

    .line 587
    :cond_0
    add-int/lit8 v6, v2, 0x1

    .end local v2    # "ptr":I
    .local v6, "ptr":I
    int-to-byte v7, v5

    aput-byte v7, v1, v2

    move v2, v6

    .line 584
    .end local v5    # "c":C
    .end local v6    # "ptr":I
    .restart local v2    # "ptr":I
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 589
    .end local v4    # "k":I
    :cond_2
    if-ne v2, v3, :cond_3

    .line 590
    return-object v1

    .line 591
    :cond_3
    new-array v4, v2, [B

    .line 592
    .local v4, "b2":[B
    const/4 v5, 0x0

    invoke-static {v1, v5, v4, v5, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 593
    return-object v4
.end method
