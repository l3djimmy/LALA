.class final Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "FilmstripScreen.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt;->FilmstripScreen(Landroidx/navigation/NavHostController;Ljava/lang/String;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V
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
        "Lkotlin/Unit;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nFilmstripScreen.kt\nKotlin\n*S Kotlin\n*F\n+ 1 FilmstripScreen.kt\ncom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 3 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,183:1\n1#2:184\n1869#3,2:185\n*S KotlinDebug\n*F\n+ 1 FilmstripScreen.kt\ncom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1\n*L\n57#1:185,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"
    }
    d2 = {
        "<anonymous>",
        "",
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
    c = "com.hardlineforge.lala.ui.screens.FilmstripScreenKt$FilmstripScreen$1$1"
    f = "FilmstripScreen.kt"
    i = {
        0x1,
        0x2,
        0x2,
        0x2,
        0x3,
        0x3,
        0x3,
        0x3
    }
    l = {
        0x2a,
        0x2e,
        0x32,
        0x43
    }
    m = "invokeSuspend"
    n = {
        "existing",
        "existing",
        "video",
        "outDir",
        "existing",
        "video",
        "outDir",
        "results"
    }
    s = {
        "L$0",
        "L$0",
        "L$1",
        "L$2",
        "L$0",
        "L$1",
        "L$2",
        "L$3"
    }
.end annotation


# instance fields
.field final synthetic $context:Landroid/content/Context;

.field final synthetic $frames$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/util/List<",
            "Lcom/hardlineforge/lala/data/VideoFrame;",
            ">;>;"
        }
    .end annotation
.end field

.field final synthetic $isExtracting$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $videoId:Ljava/lang/String;

.field final synthetic $vm:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

.field L$0:Ljava/lang/Object;

.field L$1:Ljava/lang/Object;

.field L$2:Ljava/lang/Object;

.field L$3:Ljava/lang/Object;

.field L$4:Ljava/lang/Object;

.field label:I


# direct methods
.method constructor <init>(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Ljava/lang/String;Landroid/content/Context;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;",
            "Ljava/lang/String;",
            "Landroid/content/Context;",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/util/List<",
            "Lcom/hardlineforge/lala/data/VideoFrame;",
            ">;>;",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/Boolean;",
            ">;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->$vm:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    iput-object p2, p0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->$videoId:Ljava/lang/String;

    iput-object p3, p0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->$context:Landroid/content/Context;

    iput-object p4, p0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->$frames$delegate:Landroidx/compose/runtime/MutableState;

    iput-object p5, p0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->$isExtracting$delegate:Landroidx/compose/runtime/MutableState;

    const/4 v0, 0x2

    invoke-direct {p0, v0, p6}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 7
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

    new-instance v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;

    iget-object v1, p0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->$vm:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    iget-object v2, p0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->$videoId:Ljava/lang/String;

    iget-object v3, p0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->$context:Landroid/content/Context;

    iget-object v4, p0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->$frames$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v5, p0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->$isExtracting$delegate:Landroidx/compose/runtime/MutableState;

    move-object v6, p2

    invoke-direct/range {v0 .. v6}, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;-><init>(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Ljava/lang/String;Landroid/content/Context;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 22
    .param p1, "$result"    # Ljava/lang/Object;

    move-object/from16 v0, p0

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    .line 41
    iget v2, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->label:I

    const/4 v3, 0x1

    packed-switch v2, :pswitch_data_0

    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :pswitch_0
    iget-object v1, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->L$4:Ljava/lang/Object;

    check-cast v1, Landroidx/compose/runtime/MutableState;

    iget-object v2, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->L$3:Ljava/lang/Object;

    check-cast v2, Ljava/util/List;

    .local v2, "results":Ljava/util/List;
    iget-object v3, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->L$2:Ljava/lang/Object;

    check-cast v3, Ljava/io/File;

    .local v3, "outDir":Ljava/io/File;
    iget-object v4, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->L$1:Ljava/lang/Object;

    check-cast v4, Lcom/hardlineforge/lala/data/Video;

    .local v4, "video":Lcom/hardlineforge/lala/data/Video;
    iget-object v5, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->L$0:Ljava/lang/Object;

    check-cast v5, Ljava/util/List;

    .local v5, "existing":Ljava/util/List;
    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object/from16 v7, p1

    goto/16 :goto_4

    .end local v2    # "results":Ljava/util/List;
    .end local v3    # "outDir":Ljava/io/File;
    .end local v4    # "video":Lcom/hardlineforge/lala/data/Video;
    .end local v5    # "existing":Ljava/util/List;
    :pswitch_1
    iget-object v2, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->L$2:Ljava/lang/Object;

    check-cast v2, Ljava/io/File;

    .local v2, "outDir":Ljava/io/File;
    iget-object v3, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->L$1:Ljava/lang/Object;

    check-cast v3, Lcom/hardlineforge/lala/data/Video;

    .local v3, "video":Lcom/hardlineforge/lala/data/Video;
    iget-object v4, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->L$0:Ljava/lang/Object;

    check-cast v4, Ljava/util/List;

    .local v4, "existing":Ljava/util/List;
    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v5, v3

    move-object v3, v2

    move-object v2, v4

    move-object v4, v5

    move-object/from16 v5, p1

    goto/16 :goto_2

    .end local v2    # "outDir":Ljava/io/File;
    .end local v3    # "video":Lcom/hardlineforge/lala/data/Video;
    .end local v4    # "existing":Ljava/util/List;
    :pswitch_2
    iget-object v2, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->L$0:Ljava/lang/Object;

    check-cast v2, Ljava/util/List;

    .local v2, "existing":Ljava/util/List;
    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object/from16 v4, p1

    goto :goto_1

    .end local v2    # "existing":Ljava/util/List;
    :pswitch_3
    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object/from16 v2, p1

    goto :goto_0

    :pswitch_4
    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 42
    iget-object v2, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->$vm:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    iget-object v4, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->$videoId:Ljava/lang/String;

    move-object v5, v0

    check-cast v5, Lkotlin/coroutines/Continuation;

    iput v3, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->label:I

    invoke-virtual {v2, v4, v5}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;->getVideoFrames(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v1, :cond_0

    .line 41
    return-object v1

    :cond_0
    :goto_0
    check-cast v2, Ljava/util/List;

    .line 43
    .restart local v2    # "existing":Ljava/util/List;
    move-object v4, v2

    check-cast v4, Ljava/util/Collection;

    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1

    .line 44
    iget-object v1, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->$frames$delegate:Landroidx/compose/runtime/MutableState;

    invoke-static {v1, v2}, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt;->access$FilmstripScreen$lambda$2(Landroidx/compose/runtime/MutableState;Ljava/util/List;)V

    goto/16 :goto_5

    .line 46
    :cond_1
    iget-object v4, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->$vm:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    iget-object v5, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->$videoId:Ljava/lang/String;

    move-object v6, v0

    check-cast v6, Lkotlin/coroutines/Continuation;

    invoke-static {v2}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    iput-object v7, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->L$0:Ljava/lang/Object;

    const/4 v7, 0x2

    iput v7, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->label:I

    invoke-virtual {v4, v5, v6}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;->getVideoById(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v4

    if-ne v4, v1, :cond_2

    .line 41
    return-object v1

    :cond_2
    :goto_1
    check-cast v4, Lcom/hardlineforge/lala/data/Video;

    .line 47
    .local v4, "video":Lcom/hardlineforge/lala/data/Video;
    if-eqz v4, :cond_6

    .line 48
    iget-object v5, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->$isExtracting$delegate:Landroidx/compose/runtime/MutableState;

    invoke-static {v5, v3}, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt;->access$FilmstripScreen$lambda$5(Landroidx/compose/runtime/MutableState;Z)V

    .line 49
    new-instance v3, Ljava/io/File;

    iget-object v5, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->$context:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v5

    iget-object v6, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->$videoId:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "frames/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v5, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object v5, v3

    .line 184
    .local v5, "$this$invokeSuspend_u24lambda_u240\\1":Ljava/io/File;
    const/4 v6, 0x0

    .line 49
    .local v6, "$i$a$-apply-FilmstripScreenKt$FilmstripScreen$1$1$outDir$1\\1\\49\\0":I
    invoke-virtual {v5}, Ljava/io/File;->mkdirs()Z

    .line 50
    .end local v5    # "$this$invokeSuspend_u24lambda_u240\\1":Ljava/io/File;
    .end local v6    # "$i$a$-apply-FilmstripScreenKt$FilmstripScreen$1$1$outDir$1\\1\\49\\0":I
    .local v3, "outDir":Ljava/io/File;
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getIO()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v5

    check-cast v5, Lkotlin/coroutines/CoroutineContext;

    new-instance v6, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1$results$1;

    iget-object v7, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->$vm:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    const/4 v8, 0x0

    invoke-direct {v6, v7, v4, v3, v8}, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1$results$1;-><init>(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Lcom/hardlineforge/lala/data/Video;Ljava/io/File;Lkotlin/coroutines/Continuation;)V

    check-cast v6, Lkotlin/jvm/functions/Function2;

    move-object v7, v0

    check-cast v7, Lkotlin/coroutines/Continuation;

    invoke-static {v2}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    iput-object v8, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->L$0:Ljava/lang/Object;

    invoke-static {v4}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    iput-object v8, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->L$1:Ljava/lang/Object;

    invoke-static {v3}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    iput-object v8, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->L$2:Ljava/lang/Object;

    const/4 v8, 0x3

    iput v8, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->label:I

    invoke-static {v5, v6, v7}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v5

    if-ne v5, v1, :cond_3

    .line 41
    return-object v1

    :cond_3
    :goto_2
    check-cast v5, Ljava/util/List;

    .line 57
    .local v5, "results":Ljava/util/List;
    move-object v6, v5

    check-cast v6, Ljava/lang/Iterable;

    .local v6, "$this$forEach\\2":Ljava/lang/Iterable;
    iget-object v7, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->$vm:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    iget-object v10, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->$videoId:Ljava/lang/String;

    const/16 v17, 0x0

    .line 185
    .local v17, "$i$f$forEach\\2\\57":I
    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :goto_3
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    .local v19, "element\\2":Ljava/lang/Object;
    move-object/from16 v20, v19

    check-cast v20, Lcom/hardlineforge/lala/media/VideoFrameExtractor$FrameResult;

    .local v20, "r\\3":Lcom/hardlineforge/lala/media/VideoFrameExtractor$FrameResult;
    const/16 v21, 0x0

    .line 58
    .local v21, "$i$a$-forEach-FilmstripScreenKt$FilmstripScreen$1$1$1\\3\\185\\0":I
    nop

    .line 59
    new-instance v8, Lcom/hardlineforge/lala/data/VideoFrame;

    .line 60
    nop

    .line 61
    invoke-virtual/range {v20 .. v20}, Lcom/hardlineforge/lala/media/VideoFrameExtractor$FrameResult;->getFrameNumber()I

    move-result v11

    .line 62
    invoke-virtual/range {v20 .. v20}, Lcom/hardlineforge/lala/media/VideoFrameExtractor$FrameResult;->getTimeOffsetMs()I

    move-result v12

    .line 63
    invoke-virtual/range {v20 .. v20}, Lcom/hardlineforge/lala/media/VideoFrameExtractor$FrameResult;->getFilePath()Ljava/lang/String;

    move-result-object v13

    .line 59
    const/16 v15, 0x21

    const/16 v16, 0x0

    const/4 v9, 0x0

    const/4 v14, 0x0

    invoke-direct/range {v8 .. v16}, Lcom/hardlineforge/lala/data/VideoFrame;-><init>(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/time/Instant;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 58
    invoke-virtual {v7, v8}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;->addVideoFrame(Lcom/hardlineforge/lala/data/VideoFrame;)V

    .line 66
    nop

    .line 185
    .end local v19    # "element\\2":Ljava/lang/Object;
    .end local v20    # "r\\3":Lcom/hardlineforge/lala/media/VideoFrameExtractor$FrameResult;
    .end local v21    # "$i$a$-forEach-FilmstripScreenKt$FilmstripScreen$1$1$1\\3\\185\\0":I
    goto :goto_3

    .line 186
    :cond_4
    nop

    .line 67
    .end local v6    # "$this$forEach\\2":Ljava/lang/Iterable;
    .end local v17    # "$i$f$forEach\\2\\57":I
    iget-object v6, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->$frames$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v7, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->$vm:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    iget-object v8, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->$videoId:Ljava/lang/String;

    move-object v9, v0

    check-cast v9, Lkotlin/coroutines/Continuation;

    invoke-static {v2}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    iput-object v10, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->L$0:Ljava/lang/Object;

    invoke-static {v4}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    iput-object v10, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->L$1:Ljava/lang/Object;

    invoke-static {v3}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    iput-object v10, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->L$2:Ljava/lang/Object;

    invoke-static {v5}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    iput-object v10, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->L$3:Ljava/lang/Object;

    iput-object v6, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->L$4:Ljava/lang/Object;

    const/4 v10, 0x4

    iput v10, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->label:I

    invoke-virtual {v7, v8, v9}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;->getVideoFrames(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v7

    if-ne v7, v1, :cond_5

    .line 41
    return-object v1

    .line 67
    :cond_5
    move-object v1, v5

    move-object v5, v2

    move-object v2, v1

    move-object v1, v6

    .local v2, "results":Ljava/util/List;
    .local v5, "existing":Ljava/util/List;
    :goto_4
    check-cast v7, Ljava/util/List;

    invoke-static {v1, v7}, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt;->access$FilmstripScreen$lambda$2(Landroidx/compose/runtime/MutableState;Ljava/util/List;)V

    .line 68
    iget-object v1, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$1$1;->$isExtracting$delegate:Landroidx/compose/runtime/MutableState;

    const/4 v6, 0x0

    invoke-static {v1, v6}, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt;->access$FilmstripScreen$lambda$5(Landroidx/compose/runtime/MutableState;Z)V

    move-object v2, v5

    .line 71
    .end local v3    # "outDir":Ljava/io/File;
    .end local v4    # "video":Lcom/hardlineforge/lala/data/Video;
    .end local v5    # "existing":Ljava/util/List;
    .local v2, "existing":Ljava/util/List;
    :cond_6
    :goto_5
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
