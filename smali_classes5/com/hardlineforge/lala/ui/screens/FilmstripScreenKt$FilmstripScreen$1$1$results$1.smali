.class final Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1$results$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "FilmstripScreen.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/SuspendLambda;",
        "Lkotlin/jvm/functions/Function2<",
        "Lkotlinx/coroutines/CoroutineScope;",
        "Lkotlin/coroutines/Continuation<",
        "-",
        "Ljava/util/List<",
        "+",
        "Lcom/hardlineforge/lala/media/VideoFrameExtractor$FrameResult;",
        ">;>;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u0008\u0012\u0004\u0012\u00020\u00020\u0001*\u00020\u0003H\n"
    }
    d2 = {
        "<anonymous>",
        "",
        "Lcom/hardlineforge/lala/media/VideoFrameExtractor$FrameResult;",
        "Lkotlinx/coroutines/CoroutineScope;"
    }
    k = 0x3
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.hardlineforge.lala.ui.screens.FilmstripScreenKt$FilmstripScreen$1$1$results$1"
    f = "FilmstripScreen.kt"
    i = {}
    l = {
        0x33
    }
    m = "invokeSuspend"
    n = {}
    s = {}
.end annotation


# instance fields
.field final synthetic $outDir:Ljava/io/File;

.field final synthetic $video:Lcom/hardlineforge/lala/data/Video;

.field final synthetic $vm:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

.field label:I


# direct methods
.method constructor <init>(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Lcom/hardlineforge/lala/data/Video;Ljava/io/File;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;",
            "Lcom/hardlineforge/lala/data/Video;",
            "Ljava/io/File;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1$results$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1$results$1;->$vm:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    iput-object p2, p0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1$results$1;->$video:Lcom/hardlineforge/lala/data/Video;

    iput-object p3, p0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1$results$1;->$outDir:Ljava/io/File;

    const/4 v0, 0x2

    invoke-direct {p0, v0, p4}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lkotlin/coroutines/Continuation<",
            "*>;)",
            "Lkotlin/coroutines/Continuation<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1$results$1;

    iget-object v1, p0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1$results$1;->$vm:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    iget-object v2, p0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1$results$1;->$video:Lcom/hardlineforge/lala/data/Video;

    iget-object v3, p0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1$results$1;->$outDir:Ljava/io/File;

    invoke-direct {v0, v1, v2, v3, p2}, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1$results$1;-><init>(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Lcom/hardlineforge/lala/data/Video;Ljava/io/File;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1$results$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlinx/coroutines/CoroutineScope;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Ljava/util/List<",
            "Lcom/hardlineforge/lala/media/VideoFrameExtractor$FrameResult;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1$results$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1$results$1;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1$results$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6
    .param p1, "$result"    # Ljava/lang/Object;

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    .line 50
    iget v1, p0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1$results$1;->label:I

    packed-switch v1, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v1, p1

    goto :goto_0

    :pswitch_1
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 51
    iget-object v1, p0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1$results$1;->$vm:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    invoke-virtual {v1}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;->getFrameExtractor()Lcom/hardlineforge/lala/media/VideoFrameExtractor;

    move-result-object v1

    .line 52
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1$results$1;->$video:Lcom/hardlineforge/lala/data/Video;

    invoke-virtual {v3}, Lcom/hardlineforge/lala/data/Video;->getUri()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    const-string v3, "fromFile(...)"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 53
    iget-object v3, p0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1$results$1;->$outDir:Ljava/io/File;

    .line 54
    move-object v4, p0

    check-cast v4, Lkotlin/coroutines/Continuation;

    .line 51
    const/4 v5, 0x1

    iput v5, p0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1$results$1;->label:I

    const/4 v5, 0x2

    invoke-virtual {v1, v2, v3, v5, v4}, Lcom/hardlineforge/lala/media/VideoFrameExtractor;->extractFrames(Landroid/net/Uri;Ljava/io/File;ILkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_0

    .line 50
    return-object v0

    .line 55
    :cond_0
    :goto_0
    return-object v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
