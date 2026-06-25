.class public final synthetic Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;"
    method = "invokeSuspend$lambda$0"
    proto = "(Landroid/graphics/Bitmap;Landroid/graphics/pdf/PdfRenderer$Page;)Lkotlin/Unit;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/graphics/Bitmap;


# direct methods
.method public synthetic constructor <init>(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1$$ExternalSyntheticLambda0;->f$0:Landroid/graphics/Bitmap;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1$$ExternalSyntheticLambda0;->f$0:Landroid/graphics/Bitmap;

    check-cast p1, Landroid/graphics/pdf/PdfRenderer$Page;

    invoke-static {v0, p1}, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->invokeSuspend$lambda$0(Landroid/graphics/Bitmap;Landroid/graphics/pdf/PdfRenderer$Page;)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
