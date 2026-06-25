.class public final synthetic Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt;"
    method = "PdfRendererViewCompose$lambda$11$lambda$10"
    proto = "(Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;FLandroidx/compose/runtime/MutableState;Landroid/content/Context;)Lcom/rajat/pdfviewer/PdfRendererView;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;

.field public final synthetic f$1:Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;

.field public final synthetic f$2:F

.field public final synthetic f$3:Landroidx/compose/runtime/MutableState;


# direct methods
.method public synthetic constructor <init>(Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;FLandroidx/compose/runtime/MutableState;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda0;->f$0:Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;

    iput-object p2, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda0;->f$1:Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;

    iput p3, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda0;->f$2:F

    iput-object p4, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda0;->f$3:Landroidx/compose/runtime/MutableState;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 0
    iget-object v0, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda0;->f$0:Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;

    iget-object v1, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda0;->f$1:Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;

    iget v2, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda0;->f$2:F

    iget-object v3, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda0;->f$3:Landroidx/compose/runtime/MutableState;

    check-cast p1, Landroid/content/Context;

    invoke-static {v0, v1, v2, v3, p1}, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt;->PdfRendererViewCompose$lambda$11$lambda$10(Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;FLandroidx/compose/runtime/MutableState;Landroid/content/Context;)Lcom/rajat/pdfviewer/PdfRendererView;

    move-result-object p1

    return-object p1
.end method
