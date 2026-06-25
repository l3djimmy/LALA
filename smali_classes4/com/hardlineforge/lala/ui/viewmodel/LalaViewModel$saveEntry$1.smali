.class final Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$saveEntry$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "LalaViewModel.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;->saveEntry(Lcom/hardlineforge/lala/data/LogEntry;ZLjava/lang/String;)V
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
    c = "com.hardlineforge.lala.ui.viewmodel.LalaViewModel$saveEntry$1"
    f = "LalaViewModel.kt"
    i = {}
    l = {
        0x4f,
        0x51,
        0x53
    }
    m = "invokeSuspend"
    n = {}
    s = {}
.end annotation


# instance fields
.field final synthetic $editNote:Ljava/lang/String;

.field final synthetic $entry:Lcom/hardlineforge/lala/data/LogEntry;

.field final synthetic $isNew:Z

.field label:I

.field final synthetic this$0:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;


# direct methods
.method constructor <init>(ZLcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Lcom/hardlineforge/lala/data/LogEntry;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;",
            "Lcom/hardlineforge/lala/data/LogEntry;",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$saveEntry$1;",
            ">;)V"
        }
    .end annotation

    iput-boolean p1, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$saveEntry$1;->$isNew:Z

    iput-object p2, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$saveEntry$1;->this$0:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    iput-object p3, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$saveEntry$1;->$entry:Lcom/hardlineforge/lala/data/LogEntry;

    iput-object p4, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$saveEntry$1;->$editNote:Ljava/lang/String;

    const/4 v0, 0x2

    invoke-direct {p0, v0, p5}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 6
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

    new-instance v0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$saveEntry$1;

    iget-boolean v1, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$saveEntry$1;->$isNew:Z

    iget-object v2, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$saveEntry$1;->this$0:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    iget-object v3, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$saveEntry$1;->$entry:Lcom/hardlineforge/lala/data/LogEntry;

    iget-object v4, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$saveEntry$1;->$editNote:Ljava/lang/String;

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$saveEntry$1;-><init>(ZLcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Lcom/hardlineforge/lala/data/LogEntry;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$saveEntry$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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

    invoke-virtual {p0, p1, p2}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$saveEntry$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$saveEntry$1;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$saveEntry$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 9
    .param p1, "$result"    # Ljava/lang/Object;

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    .line 77
    iget v1, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$saveEntry$1;->label:I

    const/4 v2, 0x1

    packed-switch v1, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto :goto_3

    :pswitch_1
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto :goto_1

    :pswitch_2
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto :goto_0

    :pswitch_3
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 78
    iget-boolean v1, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$saveEntry$1;->$isNew:Z

    .line 81
    iget-object v3, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$saveEntry$1;->this$0:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    .line 78
    if-eqz v1, :cond_1

    .line 79
    invoke-static {v3}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;->access$getRepo$p(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;)Lcom/hardlineforge/lala/data/LogRepository;

    move-result-object v1

    iget-object v3, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$saveEntry$1;->$entry:Lcom/hardlineforge/lala/data/LogEntry;

    move-object v4, p0

    check-cast v4, Lkotlin/coroutines/Continuation;

    iput v2, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$saveEntry$1;->label:I

    invoke-virtual {v1, v3, v4}, Lcom/hardlineforge/lala/data/LogRepository;->insertEntry(Lcom/hardlineforge/lala/data/LogEntry;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_0

    .line 77
    return-object v0

    .line 79
    :cond_0
    :goto_0
    goto :goto_4

    .line 81
    :cond_1
    invoke-static {v3}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;->access$getRepo$p(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;)Lcom/hardlineforge/lala/data/LogRepository;

    move-result-object v1

    iget-object v3, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$saveEntry$1;->$entry:Lcom/hardlineforge/lala/data/LogEntry;

    move-object v4, p0

    check-cast v4, Lkotlin/coroutines/Continuation;

    const/4 v5, 0x2

    iput v5, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$saveEntry$1;->label:I

    invoke-virtual {v1, v3, v4}, Lcom/hardlineforge/lala/data/LogRepository;->updateEntry(Lcom/hardlineforge/lala/data/LogEntry;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_2

    .line 77
    return-object v0

    .line 82
    :cond_2
    :goto_1
    iget-object v1, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$saveEntry$1;->$editNote:Ljava/lang/String;

    check-cast v1, Ljava/lang/CharSequence;

    if-eqz v1, :cond_4

    invoke-static {v1}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3

    goto :goto_2

    :cond_3
    const/4 v2, 0x0

    :cond_4
    :goto_2
    if-nez v2, :cond_6

    .line 83
    iget-object v1, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$saveEntry$1;->this$0:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    invoke-static {v1}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;->access$getRepo$p(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;)Lcom/hardlineforge/lala/data/LogRepository;

    move-result-object v1

    .line 84
    new-instance v2, Lcom/hardlineforge/lala/data/EditHistory;

    iget-object v3, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$saveEntry$1;->$entry:Lcom/hardlineforge/lala/data/LogEntry;

    invoke-virtual {v3}, Lcom/hardlineforge/lala/data/LogEntry;->getId()Ljava/lang/String;

    move-result-object v4

    iget-object v6, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$saveEntry$1;->$editNote:Ljava/lang/String;

    const/4 v7, 0x5

    const/4 v8, 0x0

    const/4 v3, 0x0

    const/4 v5, 0x0

    invoke-direct/range {v2 .. v8}, Lcom/hardlineforge/lala/data/EditHistory;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/lang/String;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    move-object v3, p0

    check-cast v3, Lkotlin/coroutines/Continuation;

    .line 83
    const/4 v4, 0x3

    iput v4, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$saveEntry$1;->label:I

    invoke-virtual {v1, v2, v3}, Lcom/hardlineforge/lala/data/LogRepository;->insertEditHistory(Lcom/hardlineforge/lala/data/EditHistory;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_5

    .line 77
    return-object v0

    .line 88
    :cond_5
    :goto_3
    nop

    :cond_6
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    :goto_4
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
