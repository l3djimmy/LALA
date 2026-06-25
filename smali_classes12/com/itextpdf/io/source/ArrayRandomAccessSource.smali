.class Lcom/itextpdf/io/source/ArrayRandomAccessSource;
.super Ljava/lang/Object;
.source "ArrayRandomAccessSource.java"

# interfaces
.implements Lcom/itextpdf/io/source/IRandomAccessSource;


# instance fields
.field private array:[B


# direct methods
.method public constructor <init>([B)V
    .locals 2
    .param p1, "array"    # [B

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    if-eqz p1, :cond_0

    .line 40
    iput-object p1, p0, Lcom/itextpdf/io/source/ArrayRandomAccessSource;->array:[B

    .line 41
    return-void

    .line 38
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Passed byte array can not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 76
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/io/source/ArrayRandomAccessSource;->array:[B

    .line 77
    return-void
.end method

.method public get(J)I
    .locals 2
    .param p1, "offset"    # J

    .line 44
    iget-object v0, p0, Lcom/itextpdf/io/source/ArrayRandomAccessSource;->array:[B

    if-eqz v0, :cond_1

    .line 47
    iget-object v0, p0, Lcom/itextpdf/io/source/ArrayRandomAccessSource;->array:[B

    array-length v0, v0

    int-to-long v0, v0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    .line 48
    const/4 v0, -0x1

    return v0

    .line 50
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/source/ArrayRandomAccessSource;->array:[B

    long-to-int v1, p1

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    return v0

    .line 45
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Already closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public get(J[BII)I
    .locals 4
    .param p1, "offset"    # J
    .param p3, "bytes"    # [B
    .param p4, "off"    # I
    .param p5, "len"    # I

    .line 54
    iget-object v0, p0, Lcom/itextpdf/io/source/ArrayRandomAccessSource;->array:[B

    if-eqz v0, :cond_2

    .line 57
    iget-object v0, p0, Lcom/itextpdf/io/source/ArrayRandomAccessSource;->array:[B

    array-length v0, v0

    int-to-long v0, v0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    .line 58
    const/4 v0, -0x1

    return v0

    .line 60
    :cond_0
    int-to-long v0, p5

    add-long/2addr v0, p1

    iget-object v2, p0, Lcom/itextpdf/io/source/ArrayRandomAccessSource;->array:[B

    array-length v2, v2

    int-to-long v2, v2

    cmp-long v0, v0, v2

    if-lez v0, :cond_1

    .line 61
    iget-object v0, p0, Lcom/itextpdf/io/source/ArrayRandomAccessSource;->array:[B

    array-length v0, v0

    int-to-long v0, v0

    sub-long/2addr v0, p1

    long-to-int p5, v0

    .line 63
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/io/source/ArrayRandomAccessSource;->array:[B

    long-to-int v1, p1

    invoke-static {v0, v1, p3, p4, p5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 65
    return p5

    .line 55
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Already closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public length()J
    .locals 2

    .line 69
    iget-object v0, p0, Lcom/itextpdf/io/source/ArrayRandomAccessSource;->array:[B

    if-eqz v0, :cond_0

    .line 72
    iget-object v0, p0, Lcom/itextpdf/io/source/ArrayRandomAccessSource;->array:[B

    array-length v0, v0

    int-to-long v0, v0

    return-wide v0

    .line 70
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Already closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
