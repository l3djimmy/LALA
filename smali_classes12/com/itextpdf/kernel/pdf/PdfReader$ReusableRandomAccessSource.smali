.class public Lcom/itextpdf/kernel/pdf/PdfReader$ReusableRandomAccessSource;
.super Ljava/lang/Object;
.source "PdfReader.java"

# interfaces
.implements Lcom/itextpdf/io/source/IRandomAccessSource;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/PdfReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "ReusableRandomAccessSource"
.end annotation


# instance fields
.field private buffer:Lcom/itextpdf/io/source/ByteBuffer;


# direct methods
.method public constructor <init>(Lcom/itextpdf/io/source/ByteBuffer;)V
    .locals 2
    .param p1, "buffer"    # Lcom/itextpdf/io/source/ByteBuffer;

    .line 1600
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1601
    if-eqz p1, :cond_0

    .line 1602
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfReader$ReusableRandomAccessSource;->buffer:Lcom/itextpdf/io/source/ByteBuffer;

    .line 1603
    return-void

    .line 1601
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Passed byte buffer can not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public close()V
    .locals 1

    .line 1633
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader$ReusableRandomAccessSource;->buffer:Lcom/itextpdf/io/source/ByteBuffer;

    .line 1634
    return-void
.end method

.method public get(J)I
    .locals 2
    .param p1, "offset"    # J

    .line 1607
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader$ReusableRandomAccessSource;->buffer:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/ByteBuffer;->size()I

    move-result v0

    int-to-long v0, v0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    const/4 v0, -0x1

    return v0

    .line 1608
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader$ReusableRandomAccessSource;->buffer:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/ByteBuffer;->getInternalBuffer()[B

    move-result-object v0

    long-to-int v1, p1

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    return v0
.end method

.method public get(J[BII)I
    .locals 4
    .param p1, "offset"    # J
    .param p3, "bytes"    # [B
    .param p4, "off"    # I
    .param p5, "len"    # I

    .line 1613
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader$ReusableRandomAccessSource;->buffer:Lcom/itextpdf/io/source/ByteBuffer;

    if-eqz v0, :cond_2

    .line 1615
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader$ReusableRandomAccessSource;->buffer:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/ByteBuffer;->size()I

    move-result v0

    int-to-long v0, v0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    .line 1616
    const/4 v0, -0x1

    return v0

    .line 1618
    :cond_0
    int-to-long v0, p5

    add-long/2addr v0, p1

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfReader$ReusableRandomAccessSource;->buffer:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/ByteBuffer;->size()I

    move-result v2

    int-to-long v2, v2

    cmp-long v0, v0, v2

    if-lez v0, :cond_1

    .line 1619
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader$ReusableRandomAccessSource;->buffer:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/ByteBuffer;->size()I

    move-result v0

    int-to-long v0, v0

    sub-long/2addr v0, p1

    long-to-int p5, v0

    .line 1621
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader$ReusableRandomAccessSource;->buffer:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/ByteBuffer;->getInternalBuffer()[B

    move-result-object v0

    long-to-int v1, p1

    invoke-static {v0, v1, p3, p4, p5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1623
    return p5

    .line 1613
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Already closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public length()J
    .locals 2

    .line 1628
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader$ReusableRandomAccessSource;->buffer:Lcom/itextpdf/io/source/ByteBuffer;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/ByteBuffer;->size()I

    move-result v0

    int-to-long v0, v0

    return-wide v0
.end method
