.class final Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "LalaViewModel.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;->loadEntry(Ljava/lang/String;)V
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
    c = "com.hardlineforge.lala.ui.viewmodel.LalaViewModel$loadEntry$1"
    f = "LalaViewModel.kt"
    i = {
        0x1,
        0x2,
        0x3
    }
    l = {
        0x3e,
        0x41,
        0x42,
        0x43
    }
    m = "invokeSuspend"
    n = {
        "entry",
        "entry",
        "entry"
    }
    s = {
        "L$0",
        "L$0",
        "L$0"
    }
.end annotation


# instance fields
.field final synthetic $entryId:Ljava/lang/String;

.field L$0:Ljava/lang/Object;

.field L$1:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;


# direct methods
.method constructor <init>(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;->this$0:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    iput-object p2, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;->$entryId:Ljava/lang/String;

    const/4 v0, 0x2

    invoke-direct {p0, v0, p3}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 3
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

    new-instance v0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;

    iget-object v1, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;->this$0:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    iget-object v2, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;->$entryId:Ljava/lang/String;

    invoke-direct {v0, v1, v2, p2}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;-><init>(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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

    invoke-virtual {p0, p1, p2}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7
    .param p1, "$result"    # Ljava/lang/Object;

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    .line 61
    iget v1, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;->label:I

    packed-switch v1, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    iget-object v0, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;->L$1:Ljava/lang/Object;

    check-cast v0, Lkotlinx/coroutines/flow/MutableStateFlow;

    iget-object v1, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;->L$0:Ljava/lang/Object;

    check-cast v1, Lcom/hardlineforge/lala/data/LogEntry;

    .local v1, "entry":Lcom/hardlineforge/lala/data/LogEntry;
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v3, p1

    goto/16 :goto_3

    .end local v1    # "entry":Lcom/hardlineforge/lala/data/LogEntry;
    :pswitch_1
    iget-object v1, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;->L$1:Ljava/lang/Object;

    check-cast v1, Lkotlinx/coroutines/flow/MutableStateFlow;

    iget-object v2, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;->L$0:Ljava/lang/Object;

    check-cast v2, Lcom/hardlineforge/lala/data/LogEntry;

    .local v2, "entry":Lcom/hardlineforge/lala/data/LogEntry;
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v3, p1

    goto/16 :goto_2

    .end local v2    # "entry":Lcom/hardlineforge/lala/data/LogEntry;
    :pswitch_2
    iget-object v1, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;->L$1:Ljava/lang/Object;

    check-cast v1, Lkotlinx/coroutines/flow/MutableStateFlow;

    iget-object v2, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;->L$0:Ljava/lang/Object;

    check-cast v2, Lcom/hardlineforge/lala/data/LogEntry;

    .restart local v2    # "entry":Lcom/hardlineforge/lala/data/LogEntry;
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v3, p1

    goto :goto_1

    .end local v2    # "entry":Lcom/hardlineforge/lala/data/LogEntry;
    :pswitch_3
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v1, p1

    goto :goto_0

    :pswitch_4
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 62
    iget-object v1, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;->this$0:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    invoke-static {v1}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;->access$getRepo$p(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;)Lcom/hardlineforge/lala/data/LogRepository;

    move-result-object v1

    iget-object v2, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;->$entryId:Ljava/lang/String;

    move-object v3, p0

    check-cast v3, Lkotlin/coroutines/Continuation;

    const/4 v4, 0x1

    iput v4, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;->label:I

    invoke-virtual {v1, v2, v3}, Lcom/hardlineforge/lala/data/LogRepository;->getEntryById(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_0

    .line 61
    return-object v0

    :cond_0
    :goto_0
    move-object v2, v1

    check-cast v2, Lcom/hardlineforge/lala/data/LogEntry;

    .line 63
    .restart local v2    # "entry":Lcom/hardlineforge/lala/data/LogEntry;
    iget-object v1, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;->this$0:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    invoke-static {v1}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;->access$get_selectedEntry$p(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;)Lkotlinx/coroutines/flow/MutableStateFlow;

    move-result-object v1

    invoke-interface {v1, v2}, Lkotlinx/coroutines/flow/MutableStateFlow;->setValue(Ljava/lang/Object;)V

    .line 64
    if-eqz v2, :cond_4

    .line 65
    iget-object v1, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;->this$0:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    invoke-static {v1}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;->access$get_photos$p(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;)Lkotlinx/coroutines/flow/MutableStateFlow;

    move-result-object v1

    iget-object v3, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;->this$0:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    invoke-static {v3}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;->access$getRepo$p(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;)Lcom/hardlineforge/lala/data/LogRepository;

    move-result-object v3

    iget-object v4, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;->$entryId:Ljava/lang/String;

    move-object v5, p0

    check-cast v5, Lkotlin/coroutines/Continuation;

    invoke-static {v2}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    iput-object v6, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;->L$0:Ljava/lang/Object;

    iput-object v1, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;->L$1:Ljava/lang/Object;

    const/4 v6, 0x2

    iput v6, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;->label:I

    invoke-virtual {v3, v4, v5}, Lcom/hardlineforge/lala/data/LogRepository;->getPhotos(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v3

    if-ne v3, v0, :cond_1

    .line 61
    return-object v0

    .line 65
    :cond_1
    :goto_1
    invoke-interface {v1, v3}, Lkotlinx/coroutines/flow/MutableStateFlow;->setValue(Ljava/lang/Object;)V

    .line 66
    iget-object v1, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;->this$0:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    invoke-static {v1}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;->access$get_videos$p(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;)Lkotlinx/coroutines/flow/MutableStateFlow;

    move-result-object v1

    iget-object v3, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;->this$0:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    invoke-static {v3}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;->access$getRepo$p(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;)Lcom/hardlineforge/lala/data/LogRepository;

    move-result-object v3

    iget-object v4, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;->$entryId:Ljava/lang/String;

    move-object v5, p0

    check-cast v5, Lkotlin/coroutines/Continuation;

    invoke-static {v2}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    iput-object v6, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;->L$0:Ljava/lang/Object;

    iput-object v1, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;->L$1:Ljava/lang/Object;

    const/4 v6, 0x3

    iput v6, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;->label:I

    invoke-virtual {v3, v4, v5}, Lcom/hardlineforge/lala/data/LogRepository;->getVideos(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v3

    if-ne v3, v0, :cond_2

    .line 61
    return-object v0

    .line 66
    :cond_2
    :goto_2
    invoke-interface {v1, v3}, Lkotlinx/coroutines/flow/MutableStateFlow;->setValue(Ljava/lang/Object;)V

    .line 67
    iget-object v1, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;->this$0:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    invoke-static {v1}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;->access$get_editHistory$p(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;)Lkotlinx/coroutines/flow/MutableStateFlow;

    move-result-object v1

    iget-object v3, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;->this$0:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    invoke-static {v3}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;->access$getRepo$p(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;)Lcom/hardlineforge/lala/data/LogRepository;

    move-result-object v3

    iget-object v4, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;->$entryId:Ljava/lang/String;

    move-object v5, p0

    check-cast v5, Lkotlin/coroutines/Continuation;

    invoke-static {v2}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    iput-object v6, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;->L$0:Ljava/lang/Object;

    iput-object v1, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;->L$1:Ljava/lang/Object;

    const/4 v6, 0x4

    iput v6, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$loadEntry$1;->label:I

    invoke-virtual {v3, v4, v5}, Lcom/hardlineforge/lala/data/LogRepository;->getEditHistory(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v3

    if-ne v3, v0, :cond_3

    .line 61
    return-object v0

    .line 67
    :cond_3
    move-object v0, v1

    move-object v1, v2

    .end local v2    # "entry":Lcom/hardlineforge/lala/data/LogEntry;
    .restart local v1    # "entry":Lcom/hardlineforge/lala/data/LogEntry;
    :goto_3
    invoke-interface {v0, v3}, Lkotlinx/coroutines/flow/MutableStateFlow;->setValue(Ljava/lang/Object;)V

    move-object v2, v1

    .line 69
    .end local v1    # "entry":Lcom/hardlineforge/lala/data/LogEntry;
    .restart local v2    # "entry":Lcom/hardlineforge/lala/data/LogEntry;
    :cond_4
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

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
