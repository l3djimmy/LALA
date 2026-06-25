.class Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingTextRendererSequenceInfo;
.super Ljava/lang/Object;
.source "TextSequenceWordWrapping.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SpecialScriptsContainingTextRendererSequenceInfo"
.end annotation


# instance fields
.field indicesOfFloating:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public numberOfSequentialTextRenderers:I

.field public sequentialTextContent:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/util/List;)V
    .locals 0
    .param p1, "numberOfSequentialTextRenderers"    # I
    .param p2, "sequentialTextContent"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 746
    .local p3, "indicesOfFloating":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 747
    iput p1, p0, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingTextRendererSequenceInfo;->numberOfSequentialTextRenderers:I

    .line 748
    iput-object p2, p0, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingTextRendererSequenceInfo;->sequentialTextContent:Ljava/lang/String;

    .line 749
    iput-object p3, p0, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingTextRendererSequenceInfo;->indicesOfFloating:Ljava/util/List;

    .line 750
    return-void
.end method
