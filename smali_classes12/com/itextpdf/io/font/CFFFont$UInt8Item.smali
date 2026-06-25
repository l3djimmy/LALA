.class public final Lcom/itextpdf/io/font/CFFFont$UInt8Item;
.super Lcom/itextpdf/io/font/CFFFont$Item;
.source "CFFFont.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/font/CFFFont;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1c
    name = "UInt8Item"
.end annotation


# instance fields
.field public value:C


# direct methods
.method public constructor <init>(C)V
    .locals 0
    .param p1, "value"    # C

    .line 545
    invoke-direct {p0}, Lcom/itextpdf/io/font/CFFFont$Item;-><init>()V

    iput-char p1, p0, Lcom/itextpdf/io/font/CFFFont$UInt8Item;->value:C

    return-void
.end method


# virtual methods
.method public emit([B)V
    .locals 2
    .param p1, "buffer"    # [B

    .line 556
    iget v0, p0, Lcom/itextpdf/io/font/CFFFont$UInt8Item;->myOffset:I

    add-int/lit8 v0, v0, 0x0

    iget-char v1, p0, Lcom/itextpdf/io/font/CFFFont$UInt8Item;->value:C

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, p1, v0

    .line 557
    return-void
.end method

.method public increment([I)V
    .locals 2
    .param p1, "currentOffset"    # [I

    .line 549
    invoke-super {p0, p1}, Lcom/itextpdf/io/font/CFFFont$Item;->increment([I)V

    .line 550
    const/4 v0, 0x0

    aget v1, p1, v0

    add-int/lit8 v1, v1, 0x1

    aput v1, p1, v0

    .line 551
    return-void
.end method
