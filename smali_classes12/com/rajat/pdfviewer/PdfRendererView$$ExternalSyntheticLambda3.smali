.class public final synthetic Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/rajat/pdfviewer/PdfRendererView;"
    method = "initializeRenderer$lambda$10"
    proto = "(Lcom/rajat/pdfviewer/PdfRendererView;I)Lkotlin/Unit;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Lcom/rajat/pdfviewer/PdfRendererView;


# direct methods
.method public synthetic constructor <init>(Lcom/rajat/pdfviewer/PdfRendererView;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda3;->f$0:Lcom/rajat/pdfviewer/PdfRendererView;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda3;->f$0:Lcom/rajat/pdfviewer/PdfRendererView;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-static {v0, p1}, Lcom/rajat/pdfviewer/PdfRendererView;->initializeRenderer$lambda$10(Lcom/rajat/pdfviewer/PdfRendererView;I)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
