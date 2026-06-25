.class public final Lcom/itextpdf/io/font/CFFFont$RangeItem;
.super Lcom/itextpdf/io/font/CFFFont$Item;
.source "CFFFont.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/font/CFFFont;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1c
    name = "RangeItem"
.end annotation


# instance fields
.field private buf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

.field public length:I

.field public offset:I


# direct methods
.method public constructor <init>(Lcom/itextpdf/io/source/RandomAccessFileOrArray;II)V
    .locals 0
    .param p1, "buf"    # Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .line 366
    invoke-direct {p0}, Lcom/itextpdf/io/font/CFFFont$Item;-><init>()V

    .line 367
    iput p2, p0, Lcom/itextpdf/io/font/CFFFont$RangeItem;->offset:I

    .line 368
    iput p3, p0, Lcom/itextpdf/io/font/CFFFont$RangeItem;->length:I

    .line 369
    iput-object p1, p0, Lcom/itextpdf/io/font/CFFFont$RangeItem;->buf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    .line 370
    return-void
.end method


# virtual methods
.method public emit([B)V
    .locals 3
    .param p1, "buffer"    # [B

    .line 380
    :try_start_0
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFont$RangeItem;->buf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget v1, p0, Lcom/itextpdf/io/font/CFFFont$RangeItem;->offset:I

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 381
    iget v0, p0, Lcom/itextpdf/io/font/CFFFont$RangeItem;->myOffset:I

    .local v0, "i":I
    :goto_0
    iget v1, p0, Lcom/itextpdf/io/font/CFFFont$RangeItem;->myOffset:I

    iget v2, p0, Lcom/itextpdf/io/font/CFFFont$RangeItem;->length:I

    add-int/2addr v1, v2

    if-ge v0, v1, :cond_0

    .line 382
    iget-object v1, p0, Lcom/itextpdf/io/font/CFFFont$RangeItem;->buf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readByte()B

    move-result v1

    aput-byte v1, p1, v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 381
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 385
    .end local v0    # "i":I
    :cond_0
    nop

    .line 387
    return-void

    .line 383
    :catch_0
    move-exception v0

    .line 384
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v2, "I/O exception."

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public increment([I)V
    .locals 3
    .param p1, "currentOffset"    # [I

    .line 373
    invoke-super {p0, p1}, Lcom/itextpdf/io/font/CFFFont$Item;->increment([I)V

    .line 374
    const/4 v0, 0x0

    aget v1, p1, v0

    iget v2, p0, Lcom/itextpdf/io/font/CFFFont$RangeItem;->length:I

    add-int/2addr v1, v2

    aput v1, p1, v0

    .line 375
    return-void
.end method
