.class public final Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$special$$inlined$flatMapLatest$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "Merge.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function3;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;-><init>(Lcom/hardlineforge/lala/data/LogRepository;Lcom/hardlineforge/lala/location/LocationManager;Lcom/hardlineforge/lala/media/VideoFrameExtractor;Lcom/hardlineforge/lala/pdf/PdfGenerator;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/SuspendLambda;",
        "Lkotlin/jvm/functions/Function3<",
        "Lkotlinx/coroutines/flow/FlowCollector<",
        "-",
        "Ljava/util/List<",
        "+",
        "Lcom/hardlineforge/lala/data/LogEntry;",
        ">;>;",
        "Ljava/lang/String;",
        "Lkotlin/coroutines/Continuation<",
        "-",
        "Lkotlin/Unit;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nMerge.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Merge.kt\nkotlinx/coroutines/flow/FlowKt__MergeKt$flatMapLatest$1\n+ 2 LalaViewModel.kt\ncom/hardlineforge/lala/ui/viewmodel/LalaViewModel\n*L\n1#1,189:1\n43#2:190\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0010\u0000\u001a\u00020\u0001\"\u0004\u0008\u0000\u0010\u0002\"\u0004\u0008\u0001\u0010\u0003*\u0008\u0012\u0004\u0012\u0002H\u00020\u00042\u0006\u0010\u0005\u001a\u0002H\u0003H\n\u00a8\u0006\u0006"
    }
    d2 = {
        "<anonymous>",
        "",
        "R",
        "T",
        "Lkotlinx/coroutines/flow/FlowCollector;",
        "it",
        "kotlinx/coroutines/flow/FlowKt__MergeKt$flatMapLatest$1"
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
    c = "com.hardlineforge.lala.ui.viewmodel.LalaViewModel$special$$inlined$flatMapLatest$1"
    f = "LalaViewModel.kt"
    i = {
        0x0,
        0x0
    }
    l = {
        0xbd
    }
    m = "invokeSuspend"
    n = {
        "$this$transformLatest",
        "it"
    }
    s = {
        "L$0",
        "L$1"
    }
.end annotation


# instance fields
.field private synthetic L$0:Ljava/lang/Object;

.field synthetic L$1:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;


# direct methods
.method public constructor <init>(Lkotlin/coroutines/Continuation;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;)V
    .locals 0

    iput-object p2, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$special$$inlined$flatMapLatest$1;->this$0:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    const/4 p2, 0x3

    invoke-direct {p0, p2, p1}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/flow/FlowCollector;

    check-cast p3, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2, p3}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$special$$inlined$flatMapLatest$1;->invoke(Lkotlinx/coroutines/flow/FlowCollector;Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invoke(Lkotlinx/coroutines/flow/FlowCollector;Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlinx/coroutines/flow/FlowCollector<",
            "-",
            "Ljava/util/List<",
            "+",
            "Lcom/hardlineforge/lala/data/LogEntry;",
            ">;>;",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    new-instance v0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$special$$inlined$flatMapLatest$1;

    iget-object v1, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$special$$inlined$flatMapLatest$1;->this$0:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    invoke-direct {v0, p3, v1}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$special$$inlined$flatMapLatest$1;-><init>(Lkotlin/coroutines/Continuation;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;)V

    iput-object p1, v0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$special$$inlined$flatMapLatest$1;->L$0:Ljava/lang/Object;

    iput-object p2, v0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$special$$inlined$flatMapLatest$1;->L$1:Ljava/lang/Object;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$special$$inlined$flatMapLatest$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7
    .param p1, "$result"    # Ljava/lang/Object;

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    .line 41
    iget v1, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$special$$inlined$flatMapLatest$1;->label:I

    packed-switch v1, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    iget-object v0, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$special$$inlined$flatMapLatest$1;->L$1:Ljava/lang/Object;

    .local v0, "it":Ljava/lang/Object;
    iget-object v1, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$special$$inlined$flatMapLatest$1;->L$0:Ljava/lang/Object;

    check-cast v1, Lkotlinx/coroutines/flow/FlowCollector;

    .local v1, "$this$transformLatest":Lkotlinx/coroutines/flow/FlowCollector;
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto :goto_1

    .end local v0    # "it":Ljava/lang/Object;
    .end local v1    # "$this$transformLatest":Lkotlinx/coroutines/flow/FlowCollector;
    :pswitch_1
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$special$$inlined$flatMapLatest$1;->L$0:Ljava/lang/Object;

    check-cast v1, Lkotlinx/coroutines/flow/FlowCollector;

    .restart local v1    # "$this$transformLatest":Lkotlinx/coroutines/flow/FlowCollector;
    iget-object v2, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$special$$inlined$flatMapLatest$1;->L$1:Ljava/lang/Object;

    .line 189
    .local v2, "it":Ljava/lang/Object;
    move-object v3, p0

    check-cast v3, Lkotlin/coroutines/Continuation;

    .local v3, "$completion\\1":Lkotlin/coroutines/Continuation;
    move-object v4, v2

    check-cast v4, Ljava/lang/String;

    .local v4, "q\\1":Ljava/lang/String;
    const/4 v5, 0x0

    .line 190
    .local v5, "$i$a$-flatMapLatest-LalaViewModel$searchResults$1\\1\\189\\0":I
    move-object v6, v4

    check-cast v6, Ljava/lang/CharSequence;

    invoke-static {v6}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v6

    invoke-static {v6}, Lkotlinx/coroutines/flow/FlowKt;->flowOf(Ljava/lang/Object;)Lkotlinx/coroutines/flow/Flow;

    move-result-object v6

    goto :goto_0

    :cond_0
    iget-object v6, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$special$$inlined$flatMapLatest$1;->this$0:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    invoke-static {v6}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;->access$getRepo$p(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;)Lcom/hardlineforge/lala/data/LogRepository;

    move-result-object v6

    invoke-virtual {v6, v4}, Lcom/hardlineforge/lala/data/LogRepository;->searchEntries(Ljava/lang/String;)Lkotlinx/coroutines/flow/Flow;

    move-result-object v6

    .line 189
    .end local v3    # "$completion\\1":Lkotlin/coroutines/Continuation;
    .end local v4    # "q\\1":Ljava/lang/String;
    .end local v5    # "$i$a$-flatMapLatest-LalaViewModel$searchResults$1\\1\\189\\0":I
    :goto_0
    move-object v3, p0

    check-cast v3, Lkotlin/coroutines/Continuation;

    invoke-static {v1}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    iput-object v4, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$special$$inlined$flatMapLatest$1;->L$0:Ljava/lang/Object;

    invoke-static {v2}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    iput-object v4, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$special$$inlined$flatMapLatest$1;->L$1:Ljava/lang/Object;

    const/4 v4, 0x1

    iput v4, p0, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel$special$$inlined$flatMapLatest$1;->label:I

    invoke-static {v1, v6, v3}, Lkotlinx/coroutines/flow/FlowKt;->emitAll(Lkotlinx/coroutines/flow/FlowCollector;Lkotlinx/coroutines/flow/Flow;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v3

    if-ne v3, v0, :cond_1

    .line 41
    return-object v0

    .line 189
    :cond_1
    move-object v0, v2

    .end local v2    # "it":Ljava/lang/Object;
    .restart local v0    # "it":Ljava/lang/Object;
    :goto_1
    sget-object v2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v2

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
