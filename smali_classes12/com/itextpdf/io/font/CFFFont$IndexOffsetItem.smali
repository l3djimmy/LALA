.class public final Lcom/itextpdf/io/font/CFFFont$IndexOffsetItem;
.super Lcom/itextpdf/io/font/CFFFont$OffsetItem;
.source "CFFFont.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/font/CFFFont;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1c
    name = "IndexOffsetItem"
.end annotation


# instance fields
.field public final size:I


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .param p1, "size"    # I

    .line 399
    invoke-direct {p0}, Lcom/itextpdf/io/font/CFFFont$OffsetItem;-><init>()V

    iput p1, p0, Lcom/itextpdf/io/font/CFFFont$IndexOffsetItem;->size:I

    return-void
.end method

.method public constructor <init>(II)V
    .locals 0
    .param p1, "size"    # I
    .param p2, "value"    # I

    .line 398
    invoke-direct {p0}, Lcom/itextpdf/io/font/CFFFont$OffsetItem;-><init>()V

    iput p1, p0, Lcom/itextpdf/io/font/CFFFont$IndexOffsetItem;->size:I

    iput p2, p0, Lcom/itextpdf/io/font/CFFFont$IndexOffsetItem;->value:I

    return-void
.end method


# virtual methods
.method public emit([B)V
    .locals 5
    .param p1, "buffer"    # [B

    .line 408
    iget v0, p0, Lcom/itextpdf/io/font/CFFFont$IndexOffsetItem;->size:I

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    iget v0, p0, Lcom/itextpdf/io/font/CFFFont$IndexOffsetItem;->size:I

    const/4 v2, 0x4

    if-gt v0, v2, :cond_0

    .line 409
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v2, p0, Lcom/itextpdf/io/font/CFFFont$IndexOffsetItem;->size:I

    if-ge v0, v2, :cond_0

    .line 410
    iget v2, p0, Lcom/itextpdf/io/font/CFFFont$IndexOffsetItem;->myOffset:I

    add-int/2addr v2, v0

    iget v3, p0, Lcom/itextpdf/io/font/CFFFont$IndexOffsetItem;->value:I

    iget v4, p0, Lcom/itextpdf/io/font/CFFFont$IndexOffsetItem;->size:I

    sub-int/2addr v4, v1

    sub-int/2addr v4, v0

    shl-int/lit8 v4, v4, 0x3

    ushr-int/2addr v3, v4

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    aput-byte v3, p1, v2

    .line 409
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 413
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method public increment([I)V
    .locals 3
    .param p1, "currentOffset"    # [I

    .line 403
    invoke-super {p0, p1}, Lcom/itextpdf/io/font/CFFFont$OffsetItem;->increment([I)V

    .line 404
    const/4 v0, 0x0

    aget v1, p1, v0

    iget v2, p0, Lcom/itextpdf/io/font/CFFFont$IndexOffsetItem;->size:I

    add-int/2addr v1, v2

    aput v1, p1, v0

    .line 405
    return-void
.end method
