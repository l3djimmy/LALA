.class final Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "LalaViewModel.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;->loadAllMedia()V
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
    c = "com.hardlineforge.lala.ui.viewmodel.LalaViewModel$loadAllMedia$1"
    f = "LalaViewModel.kt"
    i = {
        0x1,
        0x1,
        0x1,
        0x2,
        0x2,
        0x2
    }
    l = {
        0x98,
        0x9b,
        0x9c
    }
    m = "invokeSuspend"
    n = {
        "entries",
        "media",
        "e",
        "entries",
        "media",
        "e"
    }
    s = {
        "L$0",
        "L$1",
        "L$3",
        "L$0",
        "L$1",
        "L$3"
    }
.end annotation


# instance fields
.field L$0:Ljava/lang/Object;

.field L$1:Ljava/lang/Object;

.field L$2:Ljava/lang/Object;

.field L$3:Ljava/lang/Object;

.field L$4:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;


# direct methods
.method constructor <init>(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;->this$0:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    const/4 v0, 0x2

    invoke-direct {p0, v0, p2}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 2
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

    new-instance v0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;

    iget-object v1, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;->this$0:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    invoke-direct {v0, v1, p2}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;-><init>(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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

    invoke-virtual {p0, p1, p2}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10
    .param p1, "$result"    # Ljava/lang/Object;

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    .line 151
    iget v1, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;->label:I

    packed-switch v1, :pswitch_data_0

    .end local p0    # "this":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .restart local p0    # "this":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;
    :pswitch_0
    iget-object v1, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;->L$4:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    iget-object v2, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;->L$3:Ljava/lang/Object;

    check-cast v2, Lcom/hardlineforge/lala/data/LogEntry;

    .local v2, "e":Lcom/hardlineforge/lala/data/LogEntry;
    iget-object v3, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;->L$2:Ljava/lang/Object;

    check-cast v3, Ljava/util/Iterator;

    iget-object v4, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;->L$1:Ljava/lang/Object;

    check-cast v4, Ljava/util/List;

    .local v4, "media":Ljava/util/List;
    iget-object v5, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;->L$0:Ljava/lang/Object;

    check-cast v5, Ljava/util/List;

    .local v5, "entries":Ljava/util/List;
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v6, p0

    move-object v7, v5

    move-object v5, v2

    move-object v2, v4

    move-object v4, v1

    move-object v1, v0

    move-object v0, p1

    goto/16 :goto_3

    .end local v2    # "e":Lcom/hardlineforge/lala/data/LogEntry;
    .end local v4    # "media":Ljava/util/List;
    .end local v5    # "entries":Ljava/util/List;
    :pswitch_1
    iget-object v1, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;->L$4:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    iget-object v2, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;->L$3:Ljava/lang/Object;

    check-cast v2, Lcom/hardlineforge/lala/data/LogEntry;

    .restart local v2    # "e":Lcom/hardlineforge/lala/data/LogEntry;
    iget-object v3, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;->L$2:Ljava/lang/Object;

    check-cast v3, Ljava/util/Iterator;

    iget-object v4, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;->L$1:Ljava/lang/Object;

    check-cast v4, Ljava/util/List;

    .restart local v4    # "media":Ljava/util/List;
    iget-object v5, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;->L$0:Ljava/lang/Object;

    check-cast v5, Ljava/util/List;

    .restart local v5    # "entries":Ljava/util/List;
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v6, p0

    move-object v7, v5

    move-object v5, v2

    move-object v2, v1

    move-object v1, v0

    move-object v0, p1

    goto/16 :goto_2

    .end local v2    # "e":Lcom/hardlineforge/lala/data/LogEntry;
    .end local v4    # "media":Ljava/util/List;
    .end local v5    # "entries":Ljava/util/List;
    :pswitch_2
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v1, p1

    goto :goto_0

    :pswitch_3
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 152
    iget-object v1, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;->this$0:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    invoke-static {v1}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;->access$getRepo$p(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;)Lcom/hardlineforge/lala/data/LogRepository;

    move-result-object v1

    invoke-virtual {v1}, Lcom/hardlineforge/lala/data/LogRepository;->getAllEntries()Lkotlinx/coroutines/flow/Flow;

    move-result-object v1

    move-object v2, p0

    check-cast v2, Lkotlin/coroutines/Continuation;

    const/4 v3, 0x1

    iput v3, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;->label:I

    invoke-static {v1, v2}, Lkotlinx/coroutines/flow/FlowKt;->first(Lkotlinx/coroutines/flow/Flow;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_0

    .line 151
    return-object v0

    :cond_0
    :goto_0
    check-cast v1, Ljava/util/List;

    .line 153
    .local v1, "entries":Ljava/util/List;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    check-cast v2, Ljava/util/List;

    .line 154
    .local v2, "media":Ljava/util/List;
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move-object v4, v2

    move-object v2, v1

    move-object v1, v4

    move-object v4, p0

    .end local p0    # "this":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;
    .local v1, "media":Ljava/util/List;
    .local v2, "entries":Ljava/util/List;
    .local v4, "this":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/hardlineforge/lala/data/LogEntry;

    .line 155
    .local v5, "e":Lcom/hardlineforge/lala/data/LogEntry;
    iget-object v6, v4, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;->this$0:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    invoke-static {v6}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;->access$getRepo$p(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;)Lcom/hardlineforge/lala/data/LogRepository;

    move-result-object v6

    invoke-virtual {v5}, Lcom/hardlineforge/lala/data/LogEntry;->getId()Ljava/lang/String;

    move-result-object v7

    move-object v8, v4

    check-cast v8, Lkotlin/coroutines/Continuation;

    invoke-static {v2}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    iput-object v9, v4, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;->L$0:Ljava/lang/Object;

    iput-object v1, v4, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;->L$1:Ljava/lang/Object;

    iput-object v3, v4, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;->L$2:Ljava/lang/Object;

    iput-object v5, v4, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;->L$3:Ljava/lang/Object;

    iput-object v1, v4, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;->L$4:Ljava/lang/Object;

    const/4 v9, 0x2

    iput v9, v4, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;->label:I

    invoke-virtual {v6, v7, v8}, Lcom/hardlineforge/lala/data/LogRepository;->getPhotos(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v6

    if-ne v6, v0, :cond_1

    .line 151
    return-object v0

    .line 155
    :cond_1
    move-object v7, v2

    move-object v2, v1

    move-object v1, v0

    move-object v0, p1

    move-object p1, v6

    move-object v6, v4

    move-object v4, v2

    .end local v1    # "media":Ljava/util/List;
    .end local v2    # "entries":Ljava/util/List;
    .end local p1    # "$result":Ljava/lang/Object;
    .local v0, "$result":Ljava/lang/Object;
    .local v4, "media":Ljava/util/List;
    .local v6, "this":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;
    .local v7, "entries":Ljava/util/List;
    :goto_2
    check-cast p1, Ljava/util/Collection;

    invoke-interface {v2, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 156
    iget-object p1, v6, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;->this$0:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    invoke-static {p1}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;->access$getRepo$p(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;)Lcom/hardlineforge/lala/data/LogRepository;

    move-result-object p1

    invoke-virtual {v5}, Lcom/hardlineforge/lala/data/LogEntry;->getId()Ljava/lang/String;

    move-result-object v2

    move-object v8, v6

    check-cast v8, Lkotlin/coroutines/Continuation;

    invoke-static {v7}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    iput-object v9, v6, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;->L$0:Ljava/lang/Object;

    iput-object v4, v6, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;->L$1:Ljava/lang/Object;

    iput-object v3, v6, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;->L$2:Ljava/lang/Object;

    invoke-static {v5}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    iput-object v9, v6, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;->L$3:Ljava/lang/Object;

    iput-object v4, v6, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;->L$4:Ljava/lang/Object;

    const/4 v9, 0x3

    iput v9, v6, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;->label:I

    invoke-virtual {p1, v2, v8}, Lcom/hardlineforge/lala/data/LogRepository;->getVideos(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_2

    .line 151
    return-object v1

    .line 156
    :cond_2
    move-object v2, v4

    .end local v4    # "media":Ljava/util/List;
    .local v2, "media":Ljava/util/List;
    :goto_3
    check-cast p1, Ljava/util/Collection;

    invoke-interface {v4, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    move-object p1, v0

    move-object v0, v1

    move-object v1, v2

    move-object v4, v6

    move-object v2, v7

    goto :goto_1

    .line 158
    .end local v0    # "$result":Ljava/lang/Object;
    .end local v5    # "e":Lcom/hardlineforge/lala/data/LogEntry;
    .end local v6    # "this":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;
    .end local v7    # "entries":Ljava/util/List;
    .restart local v1    # "media":Ljava/util/List;
    .local v2, "entries":Ljava/util/List;
    .local v4, "this":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;
    .restart local p1    # "$result":Ljava/lang/Object;
    :cond_3
    iget-object v0, v4, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadAllMedia$1;->this$0:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    invoke-static {v0}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;->access$get_allMedia$p(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;)Lkotlinx/coroutines/flow/MutableStateFlow;

    move-result-object v0

    invoke-interface {v0, v1}, Lkotlinx/coroutines/flow/MutableStateFlow;->setValue(Ljava/lang/Object;)V

    .line 159
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
