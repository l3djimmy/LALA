.class public final Lcom/itextpdf/io/font/CFFFont$SubrMarkerItem;
.super Lcom/itextpdf/io/font/CFFFont$Item;
.source "CFFFont.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/font/CFFFont;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1c
    name = "SubrMarkerItem"
.end annotation


# instance fields
.field private indexBase:Lcom/itextpdf/io/font/CFFFont$IndexBaseItem;

.field private offItem:Lcom/itextpdf/io/font/CFFFont$OffsetItem;


# direct methods
.method public constructor <init>(Lcom/itextpdf/io/font/CFFFont$OffsetItem;Lcom/itextpdf/io/font/CFFFont$IndexBaseItem;)V
    .locals 0
    .param p1, "offItem"    # Lcom/itextpdf/io/font/CFFFont$OffsetItem;
    .param p2, "indexBase"    # Lcom/itextpdf/io/font/CFFFont$IndexBaseItem;

    .line 437
    invoke-direct {p0}, Lcom/itextpdf/io/font/CFFFont$Item;-><init>()V

    .line 438
    iput-object p1, p0, Lcom/itextpdf/io/font/CFFFont$SubrMarkerItem;->offItem:Lcom/itextpdf/io/font/CFFFont$OffsetItem;

    .line 439
    iput-object p2, p0, Lcom/itextpdf/io/font/CFFFont$SubrMarkerItem;->indexBase:Lcom/itextpdf/io/font/CFFFont$IndexBaseItem;

    .line 440
    return-void
.end method


# virtual methods
.method public xref()V
    .locals 3

    .line 444
    iget-object v0, p0, Lcom/itextpdf/io/font/CFFFont$SubrMarkerItem;->offItem:Lcom/itextpdf/io/font/CFFFont$OffsetItem;

    iget v1, p0, Lcom/itextpdf/io/font/CFFFont$SubrMarkerItem;->myOffset:I

    iget-object v2, p0, Lcom/itextpdf/io/font/CFFFont$SubrMarkerItem;->indexBase:Lcom/itextpdf/io/font/CFFFont$IndexBaseItem;

    iget v2, v2, Lcom/itextpdf/io/font/CFFFont$IndexBaseItem;->myOffset:I

    sub-int/2addr v1, v2

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/font/CFFFont$OffsetItem;->set(I)V

    .line 445
    return-void
.end method
