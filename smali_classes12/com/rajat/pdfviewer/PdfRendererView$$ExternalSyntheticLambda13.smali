.class public final synthetic Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda13;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/rajat/pdfviewer/PdfRendererView;"
    method = "jumpToPage$lambda$16"
    proto = "(Lcom/rajat/pdfviewer/PdfRendererView;ZI)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Lcom/rajat/pdfviewer/PdfRendererView;

.field public final synthetic f$1:Z

.field public final synthetic f$2:I


# direct methods
.method public synthetic constructor <init>(Lcom/rajat/pdfviewer/PdfRendererView;ZI)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda13;->f$0:Lcom/rajat/pdfviewer/PdfRendererView;

    iput-boolean p2, p0, Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda13;->f$1:Z

    iput p3, p0, Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda13;->f$2:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 0
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda13;->f$0:Lcom/rajat/pdfviewer/PdfRendererView;

    iget-boolean v1, p0, Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda13;->f$1:Z

    iget v2, p0, Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda13;->f$2:I

    invoke-static {v0, v1, v2}, Lcom/rajat/pdfviewer/PdfRendererView;->jumpToPage$lambda$16(Lcom/rajat/pdfviewer/PdfRendererView;ZI)V

    return-void
.end method
