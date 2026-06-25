.class final Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$1;
.super Lkotlin/coroutines/jvm/internal/ContinuationImpl;
.source "CacheManager.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rajat/pdfviewer/util/CacheManager;->writeBitmapToCache-0E7RQCE(ILandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
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

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.rajat.pdfviewer.util.CacheManager"
    f = "CacheManager.kt"
    i = {}
    l = {
        0x5d
    }
    m = "writeBitmapToCache-0E7RQCE"
    n = {}
    s = {}
.end annotation


# instance fields
.field label:I

.field synthetic result:Ljava/lang/Object;

.field final synthetic this$0:Lcom/rajat/pdfviewer/util/CacheManager;


# direct methods
.method constructor <init>(Lcom/rajat/pdfviewer/util/CacheManager;Lkotlin/coroutines/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/rajat/pdfviewer/util/CacheManager;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$1;->this$0:Lcom/rajat/pdfviewer/util/CacheManager;

    invoke-direct {p0, p2}, Lkotlin/coroutines/jvm/internal/ContinuationImpl;-><init>(Lkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    iput-object p1, p0, Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$1;->result:Ljava/lang/Object;

    iget v0, p0, Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$1;->label:I

    const/high16 v1, -0x80000000

    or-int/2addr v0, v1

    iput v0, p0, Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$1;->label:I

    iget-object v0, p0, Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$1;->this$0:Lcom/rajat/pdfviewer/util/CacheManager;

    const/4 v1, 0x0

    move-object v2, p0

    check-cast v2, Lkotlin/coroutines/Continuation;

    const/4 v3, 0x0

    invoke-static {v0, v3, v1, v2}, Lcom/rajat/pdfviewer/util/CacheManager;->access$writeBitmapToCache-0E7RQCE(Lcom/rajat/pdfviewer/util/CacheManager;ILandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_0

    return-object v0

    :cond_0
    invoke-static {v0}, Lkotlin/Result;->box-impl(Ljava/lang/Object;)Lkotlin/Result;

    move-result-object v0

    return-object v0
.end method
