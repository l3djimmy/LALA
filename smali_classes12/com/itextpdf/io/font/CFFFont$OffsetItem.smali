.class public abstract Lcom/itextpdf/io/font/CFFFont$OffsetItem;
.super Lcom/itextpdf/io/font/CFFFont$Item;
.source "CFFFont.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/font/CFFFont;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40c
    name = "OffsetItem"
.end annotation


# instance fields
.field public value:I


# direct methods
.method protected constructor <init>()V
    .locals 0

    .line 347
    invoke-direct {p0}, Lcom/itextpdf/io/font/CFFFont$Item;-><init>()V

    return-void
.end method


# virtual methods
.method public set(I)V
    .locals 0
    .param p1, "offset"    # I

    .line 356
    iput p1, p0, Lcom/itextpdf/io/font/CFFFont$OffsetItem;->value:I

    return-void
.end method
