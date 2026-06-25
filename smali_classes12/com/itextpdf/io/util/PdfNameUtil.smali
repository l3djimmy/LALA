.class public final Lcom/itextpdf/io/util/PdfNameUtil;
.super Ljava/lang/Object;
.source "PdfNameUtil.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    return-void
.end method

.method public static decodeName([B)Ljava/lang/String;
    .locals 7
    .param p0, "content"    # [B

    .line 37
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 39
    .local v0, "buf":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "k":I
    :goto_0
    :try_start_0
    array-length v2, p0

    if-ge v1, v2, :cond_1

    .line 40
    aget-byte v2, p0, v1

    int-to-char v2, v2

    .line 41
    .local v2, "c":C
    const/16 v3, 0x23

    if-ne v2, v3, :cond_0

    .line 42
    add-int/lit8 v3, v1, 0x1

    aget-byte v3, p0, v3

    .line 43
    .local v3, "c1":B
    add-int/lit8 v4, v1, 0x2

    aget-byte v4, p0, v4

    .line 44
    .local v4, "c2":B
    invoke-static {v3}, Lcom/itextpdf/io/source/ByteBuffer;->getHex(I)I

    move-result v5

    shl-int/lit8 v5, v5, 0x4

    invoke-static {v4}, Lcom/itextpdf/io/source/ByteBuffer;->getHex(I)I

    move-result v6

    add-int/2addr v5, v6

    int-to-char v2, v5

    .line 45
    add-int/lit8 v1, v1, 0x2

    .line 47
    .end local v3    # "c1":B
    .end local v4    # "c2":B
    :cond_0
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    nop

    .end local v2    # "c":C
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 51
    .end local v1    # "k":I
    :cond_1
    goto :goto_1

    .line 49
    :catch_0
    move-exception v1

    .line 52
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
