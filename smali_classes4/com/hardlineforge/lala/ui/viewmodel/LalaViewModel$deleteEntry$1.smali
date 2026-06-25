.class final Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$deleteEntry$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "LalaViewModel.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;->deleteEntry(Lcom/hardlineforge/lala/data/LogEntry;)V
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
    c = "com.hardlineforge.lala.ui.viewmodel.LalaViewModel$deleteEntry$1"
    f = "LalaViewModel.kt"
    i = {}
    l = {
        0x5d
    }
    m = "invokeSuspend"
    n = {}
    s = {}
.end annotation


# instance fields
.field final synthetic $entry:Lcom/hardlineforge/lala/data/LogEntry;

.field label:I

.field final synthetic this$0:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;


# direct methods
.method constructor <init>(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Lcom/hardlineforge/lala/data/LogEntry;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;",
            "Lcom/hardlineforge/lala/data/LogEntry;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$deleteEntry$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$deleteEntry$1;->this$0:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    iput-object p2, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$deleteEntry$1;->$entry:Lcom/hardlineforge/lala/data/LogEntry;

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

    new-instance v0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$deleteEntry$1;

    iget-object v1, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$deleteEntry$1;->this$0:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    iget-object v2, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$deleteEntry$1;->$entry:Lcom/hardlineforge/lala/data/LogEntry;

    invoke-direct {v0, v1, v2, p2}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$deleteEntry$1;-><init>(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Lcom/hardlineforge/lala/data/LogEntry;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$deleteEntry$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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

    invoke-virtual {p0, p1, p2}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$deleteEntry$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$deleteEntry$1;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$deleteEntry$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p1, "$result"    # Ljava/lang/Object;

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    .line 92
    iget v1, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$deleteEntry$1;->label:I

    packed-switch v1, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto :goto_0

    :pswitch_1
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 93
    iget-object v1, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$deleteEntry$1;->this$0:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    invoke-static {v1}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;->access$getRepo$p(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;)Lcom/hardlineforge/lala/data/LogRepository;

    move-result-object v1

    iget-object v2, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$deleteEntry$1;->$entry:Lcom/hardlineforge/lala/data/LogEntry;

    move-object v3, p0

    check-cast v3, Lkotlin/coroutines/Continuation;

    const/4 v4, 0x1

    iput v4, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$deleteEntry$1;->label:I

    invoke-virtual {v1, v2, v3}, Lcom/hardlineforge/lala/data/LogRepository;->deleteEntry(Lcom/hardlineforge/lala/data/LogEntry;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_0

    .line 92
    return-object v0

    .line 94
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$deleteEntry$1;->this$0:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    invoke-static {v0}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;->access$get_selectedEntry$p(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;)Lkotlinx/coroutines/flow/MutableStateFlow;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lkotlinx/coroutines/flow/MutableStateFlow;->setValue(Ljava/lang/Object;)V

    .line 95
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
