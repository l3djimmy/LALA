.class Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$LastFittingChildRendererData;
.super Ljava/lang/Object;
.source "TextSequenceWordWrapping.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "LastFittingChildRendererData"
.end annotation


# instance fields
.field public childIndex:I

.field public childLayoutResult:Lcom/itextpdf/layout/layout/LayoutResult;


# direct methods
.method public constructor <init>(ILcom/itextpdf/layout/layout/LayoutResult;)V
    .locals 0
    .param p1, "childIndex"    # I
    .param p2, "childLayoutResult"    # Lcom/itextpdf/layout/layout/LayoutResult;

    .line 730
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 731
    iput p1, p0, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$LastFittingChildRendererData;->childIndex:I

    .line 732
    iput-object p2, p0, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$LastFittingChildRendererData;->childLayoutResult:Lcom/itextpdf/layout/layout/LayoutResult;

    .line 733
    return-void
.end method
