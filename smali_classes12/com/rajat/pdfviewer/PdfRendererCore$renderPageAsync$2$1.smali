.class final Lcom/rajat/pdfviewer/PdfRendererCore$renderPageAsync$2$1;
.super Ljava/lang/Object;
.source "PdfRendererCore.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function3;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rajat/pdfviewer/PdfRendererCore;->renderPageAsync(IIILkotlin/coroutines/Continuation;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lkotlin/jvm/functions/Function3<",
        "Ljava/lang/Boolean;",
        "Ljava/lang/Integer;",
        "Landroid/graphics/Bitmap;",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    k = 0x3
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $bitmap:Landroid/graphics/Bitmap;

.field final synthetic $continuation:Lkotlinx/coroutines/CancellableContinuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlinx/coroutines/CancellableContinuation<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lkotlinx/coroutines/CancellableContinuation;Landroid/graphics/Bitmap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlinx/coroutines/CancellableContinuation<",
            "-",
            "Landroid/graphics/Bitmap;",
            ">;",
            "Landroid/graphics/Bitmap;",
            ")V"
        }
    .end annotation

    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageAsync$2$1;->$continuation:Lkotlinx/coroutines/CancellableContinuation;

    iput-object p2, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageAsync$2$1;->$bitmap:Landroid/graphics/Bitmap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "p1"    # Ljava/lang/Object;
    .param p2, "p2"    # Ljava/lang/Object;
    .param p3, "p3"    # Ljava/lang/Object;

    .line 268
    move-object v0, p1

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    move-object v1, p2

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    move-object v2, p3

    check-cast v2, Landroid/graphics/Bitmap;

    invoke-virtual {p0, v0, v1, v2}, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageAsync$2$1;->invoke(ZILandroid/graphics/Bitmap;)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public final invoke(ZILandroid/graphics/Bitmap;)V
    .locals 2
    .param p1, "success"    # Z
    .param p3, "renderedBitmap"    # Landroid/graphics/Bitmap;

    .line 269
    const/4 p2, 0x0

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageAsync$2$1;->$continuation:Lkotlinx/coroutines/CancellableContinuation;

    if-nez p3, :cond_0

    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageAsync$2$1;->$bitmap:Landroid/graphics/Bitmap;

    goto :goto_0

    :cond_0
    move-object v1, p3

    :goto_0
    invoke-interface {v0, v1, p2}, Lkotlinx/coroutines/CancellableContinuation;->resume(Ljava/lang/Object;Lkotlin/jvm/functions/Function1;)V

    goto :goto_1

    .line 271
    :cond_1
    sget-object v0, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;->INSTANCE:Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;

    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageAsync$2$1;->$bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;->recycleBitmap(Landroid/graphics/Bitmap;)V

    .line 272
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageAsync$2$1;->$continuation:Lkotlinx/coroutines/CancellableContinuation;

    invoke-interface {v0, p2, p2}, Lkotlinx/coroutines/CancellableContinuation;->resume(Ljava/lang/Object;Lkotlin/jvm/functions/Function1;)V

    .line 274
    :goto_1
    return-void
.end method
