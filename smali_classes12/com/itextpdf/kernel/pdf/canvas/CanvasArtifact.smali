.class public Lcom/itextpdf/kernel/pdf/canvas/CanvasArtifact;
.super Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;
.source "CanvasArtifact.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 42
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Artifact:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;-><init>(Lcom/itextpdf/kernel/pdf/PdfName;)V

    .line 43
    return-void
.end method
