.class Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;
.super Ljava/lang/Object;
.source "TextSequenceWordWrapping.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "MinMaxWidthOfTextRendererSequenceHelper"
.end annotation


# instance fields
.field public anythingPlacedBeforeTextRendererSequence:Z

.field public minWidthPreSequence:F

.field public textIndent:F


# direct methods
.method public constructor <init>(FFZ)V
    .locals 0
    .param p1, "minWidthPreSequence"    # F
    .param p2, "textIndent"    # F
    .param p3, "anythingPlacedBeforeTextRendererSequence"    # Z

    .line 718
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 719
    iput p1, p0, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;->minWidthPreSequence:F

    .line 720
    iput p2, p0, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;->textIndent:F

    .line 721
    iput-boolean p3, p0, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;->anythingPlacedBeforeTextRendererSequence:Z

    .line 722
    return-void
.end method
