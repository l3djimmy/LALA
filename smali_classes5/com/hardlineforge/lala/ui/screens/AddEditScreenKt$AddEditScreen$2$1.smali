.class final Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$2$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "AddEditScreen.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt;->AddEditScreen(Landroidx/navigation/NavHostController;Ljava/lang/String;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V
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
    c = "com.hardlineforge.lala.ui.screens.AddEditScreenKt$AddEditScreen$2$1"
    f = "AddEditScreen.kt"
    i = {}
    l = {}
    m = "invokeSuspend"
    n = {}
    s = {}
.end annotation


# instance fields
.field final synthetic $category$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $comment$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $existing$delegate:Landroidx/compose/runtime/State;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/State<",
            "Lcom/hardlineforge/lala/data/LogEntry;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $gpsLat$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $gpsLon$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $locationName$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $tags$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $timestamp$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/time/LocalDateTime;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $timezone$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field label:I


# direct methods
.method constructor <init>(Landroidx/compose/runtime/State;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/State<",
            "Lcom/hardlineforge/lala/data/LogEntry;",
            ">;",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/time/LocalDateTime;",
            ">;",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/Double;",
            ">;",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/Double;",
            ">;",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$2$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$2$1;->$existing$delegate:Landroidx/compose/runtime/State;

    iput-object p2, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$2$1;->$timestamp$delegate:Landroidx/compose/runtime/MutableState;

    iput-object p3, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$2$1;->$timezone$delegate:Landroidx/compose/runtime/MutableState;

    iput-object p4, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$2$1;->$gpsLat$delegate:Landroidx/compose/runtime/MutableState;

    iput-object p5, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$2$1;->$gpsLon$delegate:Landroidx/compose/runtime/MutableState;

    iput-object p6, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$2$1;->$category$delegate:Landroidx/compose/runtime/MutableState;

    iput-object p7, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$2$1;->$locationName$delegate:Landroidx/compose/runtime/MutableState;

    iput-object p8, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$2$1;->$comment$delegate:Landroidx/compose/runtime/MutableState;

    iput-object p9, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$2$1;->$tags$delegate:Landroidx/compose/runtime/MutableState;

    const/4 v0, 0x2

    invoke-direct {p0, v0, p10}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 11
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

    new-instance v0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$2$1;

    iget-object v1, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$2$1;->$existing$delegate:Landroidx/compose/runtime/State;

    iget-object v2, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$2$1;->$timestamp$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v3, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$2$1;->$timezone$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v4, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$2$1;->$gpsLat$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v5, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$2$1;->$gpsLon$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v6, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$2$1;->$category$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v7, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$2$1;->$locationName$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v8, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$2$1;->$comment$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v9, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$2$1;->$tags$delegate:Landroidx/compose/runtime/MutableState;

    move-object v10, p2

    invoke-direct/range {v0 .. v10}, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$2$1;-><init>(Landroidx/compose/runtime/State;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$2$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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

    invoke-virtual {p0, p1, p2}, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$2$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$2$1;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$2$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 12
    .param p1, "$result"    # Ljava/lang/Object;

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    .line 81
    iget v0, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$2$1;->label:I

    packed-switch v0, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 82
    iget-object v0, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$2$1;->$existing$delegate:Landroidx/compose/runtime/State;

    invoke-static {v0}, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt;->access$AddEditScreen$lambda$0(Landroidx/compose/runtime/State;)Lcom/hardlineforge/lala/data/LogEntry;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$2$1;->$timestamp$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v2, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$2$1;->$timezone$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v3, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$2$1;->$gpsLat$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v4, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$2$1;->$gpsLon$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v5, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$2$1;->$category$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v6, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$2$1;->$locationName$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v7, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$2$1;->$comment$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v8, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$2$1;->$tags$delegate:Landroidx/compose/runtime/MutableState;

    .local v0, "e\\1":Lcom/hardlineforge/lala/data/LogEntry;
    const/4 v9, 0x0

    .line 83
    .local v9, "$i$a$-let-AddEditScreenKt$AddEditScreen$2$1$1\\1\\82\\0":I
    invoke-virtual {v0}, Lcom/hardlineforge/lala/data/LogEntry;->getTimestamp()Ljava/time/Instant;

    move-result-object v10

    invoke-virtual {v0}, Lcom/hardlineforge/lala/data/LogEntry;->getTimezone()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/time/ZoneId;->of(Ljava/lang/String;)Ljava/time/ZoneId;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/time/Instant;->atZone(Ljava/time/ZoneId;)Ljava/time/ZonedDateTime;

    move-result-object v10

    invoke-virtual {v10}, Ljava/time/ZonedDateTime;->toLocalDateTime()Ljava/time/LocalDateTime;

    move-result-object v10

    invoke-static {v1, v10}, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt;->access$AddEditScreen$lambda$5(Landroidx/compose/runtime/MutableState;Ljava/time/LocalDateTime;)V

    .line 84
    invoke-virtual {v0}, Lcom/hardlineforge/lala/data/LogEntry;->getTimezone()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt;->access$AddEditScreen$lambda$8(Landroidx/compose/runtime/MutableState;Ljava/lang/String;)V

    .line 85
    invoke-virtual {v0}, Lcom/hardlineforge/lala/data/LogEntry;->getGpsLat()Ljava/lang/Double;

    move-result-object v1

    invoke-static {v3, v1}, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt;->access$AddEditScreen$lambda$11(Landroidx/compose/runtime/MutableState;Ljava/lang/Double;)V

    .line 86
    invoke-virtual {v0}, Lcom/hardlineforge/lala/data/LogEntry;->getGpsLon()Ljava/lang/Double;

    move-result-object v1

    invoke-static {v4, v1}, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt;->access$AddEditScreen$lambda$14(Landroidx/compose/runtime/MutableState;Ljava/lang/Double;)V

    .line 87
    invoke-virtual {v0}, Lcom/hardlineforge/lala/data/LogEntry;->getCategory()Ljava/lang/String;

    move-result-object v1

    invoke-static {v5, v1}, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt;->access$AddEditScreen$lambda$17(Landroidx/compose/runtime/MutableState;Ljava/lang/String;)V

    .line 88
    invoke-virtual {v0}, Lcom/hardlineforge/lala/data/LogEntry;->getLocationName()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    const-string v1, ""

    :cond_0
    invoke-static {v6, v1}, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt;->access$AddEditScreen$lambda$20(Landroidx/compose/runtime/MutableState;Ljava/lang/String;)V

    .line 89
    invoke-virtual {v0}, Lcom/hardlineforge/lala/data/LogEntry;->getComment()Ljava/lang/String;

    move-result-object v1

    invoke-static {v7, v1}, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt;->access$AddEditScreen$lambda$23(Landroidx/compose/runtime/MutableState;Ljava/lang/String;)V

    .line 90
    invoke-virtual {v0}, Lcom/hardlineforge/lala/data/LogEntry;->getTags()Ljava/lang/String;

    move-result-object v1

    invoke-static {v8, v1}, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt;->access$AddEditScreen$lambda$26(Landroidx/compose/runtime/MutableState;Ljava/lang/String;)V

    .line 91
    nop

    .line 82
    .end local v0    # "e\\1":Lcom/hardlineforge/lala/data/LogEntry;
    .end local v9    # "$i$a$-let-AddEditScreenKt$AddEditScreen$2$1$1\\1\\82\\0":I
    nop

    .line 92
    :cond_1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
