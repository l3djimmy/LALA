.class public final Lcom/itextpdf/io/font/CFFFont$MarkerItem;
.super Lcom/itextpdf/io/font/CFFFont$Item;
.source "CFFFont.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/font/CFFFont;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1c
    name = "MarkerItem"
.end annotation


# instance fields
.field p:Lcom/itextpdf/io/font/CFFFont$OffsetItem;


# direct methods
.method public constructor <init>(Lcom/itextpdf/io/font/CFFFont$OffsetItem;)V
    .locals 0
    .param p1, "pointerToMarker"    # Lcom/itextpdf/io/font/CFFFont$OffsetItem;

    .line 610
    invoke-direct {p0}, Lcom/itextpdf/io/font/CFFFont$Item;-><init>()V

    iput-object p1, p0, Lcom/itextpdf/io/font/CFFFont$MarkerItem;->p:Lcom/itextpdf/io/font/CFFFont$OffsetItem;

    return-void
.end method


# virtual methods
.method public xref()V
    .locals 2

    .line 613
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFont$MarkerItem;->p:Lcom/itextpdf/io/font/CFFFont$OffsetItem;

    iget v1, p0, Lcom/itextpdf/io/font/CFFFont$MarkerItem;->myOffset:I

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/font/CFFFont$OffsetItem;->set(I)V

    .line 614
    return-void
.end method
