.class public Lcom/itextpdf/kernel/numbering/AlphabetNumbering;
.super Ljava/lang/Object;
.source "AlphabetNumbering.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static toAlphabetNumber(I[C)Ljava/lang/String;
    .locals 11
    .param p0, "number"    # I
    .param p1, "alphabet"    # [C

    .line 43
    const/4 v0, 0x1

    if-lt p0, v0, :cond_2

    .line 47
    array-length v0, p1

    .line 49
    .local v0, "cardinality":I
    add-int/lit8 p0, p0, -0x1

    .line 50
    const/4 v1, 0x1

    .line 51
    .local v1, "bytes":I
    const-wide/16 v2, 0x0

    .line 52
    .local v2, "start":J
    int-to-long v4, v0

    .line 54
    .local v4, "symbols":J
    :goto_0
    int-to-long v6, p0

    add-long v8, v4, v2

    cmp-long v6, v6, v8

    if-ltz v6, :cond_0

    .line 55
    add-int/lit8 v1, v1, 0x1

    .line 56
    add-long/2addr v2, v4

    .line 57
    int-to-long v6, v0

    mul-long/2addr v4, v6

    goto :goto_0

    .line 60
    :cond_0
    int-to-long v6, p0

    sub-long/2addr v6, v2

    .line 61
    .local v6, "c":J
    new-array v8, v1, [C

    .line 62
    .local v8, "value":[C
    :goto_1
    if-lez v1, :cond_1

    .line 63
    add-int/lit8 v1, v1, -0x1

    int-to-long v9, v0

    rem-long v9, v6, v9

    long-to-int v9, v9

    aget-char v9, p1, v9

    aput-char v9, v8, v1

    .line 64
    int-to-long v9, v0

    div-long/2addr v6, v9

    goto :goto_1

    .line 67
    :cond_1
    new-instance v9, Ljava/lang/String;

    invoke-direct {v9, v8}, Ljava/lang/String;-><init>([C)V

    return-object v9

    .line 44
    .end local v0    # "cardinality":I
    .end local v1    # "bytes":I
    .end local v2    # "start":J
    .end local v4    # "symbols":J
    .end local v6    # "c":J
    .end local v8    # "value":[C
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The parameter must be a positive integer"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
