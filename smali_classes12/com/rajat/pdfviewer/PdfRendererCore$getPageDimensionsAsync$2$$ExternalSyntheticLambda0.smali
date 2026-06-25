.class public final synthetic Lcom/rajat/pdfviewer/PdfRendererCore$getPageDimensionsAsync$2$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/rajat/pdfviewer/PdfRendererCore$getPageDimensionsAsync$2;"
    method = "invokeSuspend$lambda$1"
    proto = "(Lcom/rajat/pdfviewer/PdfRendererCore;ILandroid/graphics/pdf/PdfRenderer$Page;)Landroid/util/Size;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Lcom/rajat/pdfviewer/PdfRendererCore;

.field public final synthetic f$1:I


# direct methods
.method public synthetic constructor <init>(Lcom/rajat/pdfviewer/PdfRendererCore;I)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$getPageDimensionsAsync$2$$ExternalSyntheticLambda0;->f$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    iput p2, p0, Lcom/rajat/pdfviewer/PdfRendererCore$getPageDimensionsAsync$2$$ExternalSyntheticLambda0;->f$1:I

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore$getPageDimensionsAsync$2$$ExternalSyntheticLambda0;->f$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    iget v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$getPageDimensionsAsync$2$$ExternalSyntheticLambda0;->f$1:I

    check-cast p1, Landroid/graphics/pdf/PdfRenderer$Page;

    invoke-static {v0, v1, p1}, Lcom/rajat/pdfviewer/PdfRendererCore$getPageDimensionsAsync$2;->invokeSuspend$lambda$1(Lcom/rajat/pdfviewer/PdfRendererCore;ILandroid/graphics/pdf/PdfRenderer$Page;)Landroid/util/Size;

    move-result-object p1

    return-object p1
.end method
