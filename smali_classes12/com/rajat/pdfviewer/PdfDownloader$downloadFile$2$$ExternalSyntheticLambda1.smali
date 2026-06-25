.class public final synthetic Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2;"
    method = "invokeSuspend$lambda$3$lambda$2$lambda$1"
    proto = "(Lcom/rajat/pdfviewer/PdfDownloader;Lokhttp3/ResponseBody;J)Lkotlin/Unit;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Lcom/rajat/pdfviewer/PdfDownloader;

.field public final synthetic f$1:Lokhttp3/ResponseBody;


# direct methods
.method public synthetic constructor <init>(Lcom/rajat/pdfviewer/PdfDownloader;Lokhttp3/ResponseBody;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2$$ExternalSyntheticLambda1;->f$0:Lcom/rajat/pdfviewer/PdfDownloader;

    iput-object p2, p0, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2$$ExternalSyntheticLambda1;->f$1:Lokhttp3/ResponseBody;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 0
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2$$ExternalSyntheticLambda1;->f$0:Lcom/rajat/pdfviewer/PdfDownloader;

    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2$$ExternalSyntheticLambda1;->f$1:Lokhttp3/ResponseBody;

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2;->invokeSuspend$lambda$3$lambda$2$lambda$1(Lcom/rajat/pdfviewer/PdfDownloader;Lokhttp3/ResponseBody;J)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
