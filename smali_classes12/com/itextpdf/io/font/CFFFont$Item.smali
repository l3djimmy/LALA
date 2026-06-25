.class public abstract Lcom/itextpdf/io/font/CFFFont$Item;
.super Ljava/lang/Object;
.source "CFFFont.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/font/CFFFont;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40c
    name = "Item"
.end annotation


# instance fields
.field protected myOffset:I


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 322
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 323
    const/4 v0, -0x1

    iput v0, p0, Lcom/itextpdf/io/font/CFFFont$Item;->myOffset:I

    return-void
.end method


# virtual methods
.method public emit([B)V
    .locals 0
    .param p1, "buffer"    # [B

    .line 339
    return-void
.end method

.method public increment([I)V
    .locals 1
    .param p1, "currentOffset"    # [I

    .line 331
    const/4 v0, 0x0

    aget v0, p1, v0

    iput v0, p0, Lcom/itextpdf/io/font/CFFFont$Item;->myOffset:I

    .line 332
    return-void
.end method

.method public xref()V
    .locals 0

    .line 344
    return-void
.end method
