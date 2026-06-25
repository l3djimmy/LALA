.class public final synthetic Lcom/rajat/pdfviewer/PdfRendererCore$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function3;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/rajat/pdfviewer/PdfRendererCore;"
    method = "prefetchPagesAround$lambda$11$lambda$10"
    proto = "(Landroid/graphics/Bitmap;ZILandroid/graphics/Bitmap;)Lkotlin/Unit;"
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

    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$$ExternalSyntheticLambda1;->f$0:Landroid/graphics/Bitmap;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore$$ExternalSyntheticLambda1;->f$0:Landroid/graphics/Bitmap;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    check-cast p3, Landroid/graphics/Bitmap;

    invoke-static {v0, p1, p2, p3}, Lcom/rajat/pdfviewer/PdfRendererCore;->prefetchPagesAround$lambda$11$lambda$10(Landroid/graphics/Bitmap;ZILandroid/graphics/Bitmap;)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
