.class public final synthetic Lcom/rajat/pdfviewer/PdfViewerActivity$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/rajat/pdfviewer/PdfViewerActivity;"
    method = "showErrorDialog$lambda$3"
    proto = "(Lcom/rajat/pdfviewer/PdfViewerActivity;Landroid/content/DialogInterface;I)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Lcom/rajat/pdfviewer/PdfViewerActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/rajat/pdfviewer/PdfViewerActivity;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$$ExternalSyntheticLambda2;->f$0:Lcom/rajat/pdfviewer/PdfViewerActivity;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$$ExternalSyntheticLambda2;->f$0:Lcom/rajat/pdfviewer/PdfViewerActivity;

    invoke-static {v0, p1, p2}, Lcom/rajat/pdfviewer/PdfViewerActivity;->showErrorDialog$lambda$3(Lcom/rajat/pdfviewer/PdfViewerActivity;Landroid/content/DialogInterface;I)V

    return-void
.end method
