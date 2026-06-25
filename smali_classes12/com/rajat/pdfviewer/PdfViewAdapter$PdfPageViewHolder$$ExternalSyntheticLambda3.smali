.class public final synthetic Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function3;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;"
    method = "retryRenderOnce$lambda$4"
    proto = "(Landroid/graphics/Bitmap;ILcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;IZILandroid/graphics/Bitmap;)Lkotlin/Unit;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/graphics/Bitmap;

.field public final synthetic f$1:I

.field public final synthetic f$2:Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

.field public final synthetic f$3:I


# direct methods
.method public synthetic constructor <init>(Landroid/graphics/Bitmap;ILcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;I)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$$ExternalSyntheticLambda3;->f$0:Landroid/graphics/Bitmap;

    iput p2, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$$ExternalSyntheticLambda3;->f$1:I

    iput-object p3, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$$ExternalSyntheticLambda3;->f$2:Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    iput p4, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$$ExternalSyntheticLambda3;->f$3:I

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    .line 0
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$$ExternalSyntheticLambda3;->f$0:Landroid/graphics/Bitmap;

    iget v1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$$ExternalSyntheticLambda3;->f$1:I

    iget-object v2, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$$ExternalSyntheticLambda3;->f$2:Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    iget v3, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$$ExternalSyntheticLambda3;->f$3:I

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v5

    move-object v6, p3

    check-cast v6, Landroid/graphics/Bitmap;

    invoke-static/range {v0 .. v6}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->retryRenderOnce$lambda$4(Landroid/graphics/Bitmap;ILcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;IZILandroid/graphics/Bitmap;)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
