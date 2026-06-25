.class final Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$4$1$6$1$1$1;
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
    c = "com.hardlineforge.lala.ui.screens.AddEditScreenKt$AddEditScreen$4$1$6$1$1$1"
    f = "AddEditScreen.kt"
    i = {}
    l = {
        0xb9
    }
    m = "invokeSuspend"
    n = {}
    s = {}
.end annotation


# instance fields
.field final synthetic $gpsLat$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $gpsLoading$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/Boolean;",
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

.field final synthetic $vm:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

.field label:I


# direct methods
.method constructor <init>(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;",
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
            "Ljava/lang/Boolean;",
            ">;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$4$1$6$1$1$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$4$1$6$1$1$1;->$vm:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    iput-object p2, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$4$1$6$1$1$1;->$gpsLat$delegate:Landroidx/compose/runtime/MutableState;

    iput-object p3, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$4$1$6$1$1$1;->$gpsLon$delegate:Landroidx/compose/runtime/MutableState;

    iput-object p4, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$4$1$6$1$1$1;->$locationName$delegate:Landroidx/compose/runtime/MutableState;

    iput-object p5, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$4$1$6$1$1$1;->$gpsLoading$delegate:Landroidx/compose/runtime/MutableState;

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

    new-instance v0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$4$1$6$1$1$1;

    iget-object v1, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$4$1$6$1$1$1;->$vm:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    iget-object v2, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$4$1$6$1$1$1;->$gpsLat$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v3, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$4$1$6$1$1$1;->$gpsLon$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v4, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$4$1$6$1$1$1;->$locationName$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v5, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$4$1$6$1$1$1;->$gpsLoading$delegate:Landroidx/compose/runtime/MutableState;

    move-object v6, p2

    invoke-direct/range {v0 .. v6}, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$4$1$6$1$1$1;-><init>(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$4$1$6$1$1$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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

    invoke-virtual {p0, p1, p2}, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$4$1$6$1$1$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$4$1$6$1$1$1;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$4$1$6$1$1$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8
    .param p1, "$result"    # Ljava/lang/Object;

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    .line 184
    iget v1, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$4$1$6$1$1$1;->label:I

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

    .line 185
    iget-object v1, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$4$1$6$1$1$1;->$vm:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    move-object v2, p0

    check-cast v2, Lkotlin/coroutines/Continuation;

    const/4 v3, 0x1

    iput v3, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$4$1$6$1$1$1;->label:I

    invoke-virtual {v1, v2}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;->captureLocation(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_0

    .line 184
    return-object v0

    :cond_0
    :goto_0
    move-object v0, v1

    check-cast v0, Landroid/location/Location;

    .line 186
    .local v0, "loc":Landroid/location/Location;
    if-eqz v0, :cond_2

    iget-object v1, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$4$1$6$1$1$1;->$gpsLat$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v2, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$4$1$6$1$1$1;->$gpsLon$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v3, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$4$1$6$1$1$1;->$locationName$delegate:Landroidx/compose/runtime/MutableState;

    move-object v4, v0

    .local v4, "it\\1":Landroid/location/Location;
    const/4 v5, 0x0

    .line 187
    .local v5, "$i$a$-let-AddEditScreenKt$AddEditScreen$4$1$6$1$1$1$1\\1\\186\\0":I
    invoke-virtual {v4}, Landroid/location/Location;->getLatitude()D

    move-result-wide v6

    invoke-static {v6, v7}, Lkotlin/coroutines/jvm/internal/Boxing;->boxDouble(D)Ljava/lang/Double;

    move-result-object v6

    invoke-static {v1, v6}, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt;->access$AddEditScreen$lambda$11(Landroidx/compose/runtime/MutableState;Ljava/lang/Double;)V

    .line 188
    invoke-virtual {v4}, Landroid/location/Location;->getLongitude()D

    move-result-wide v6

    invoke-static {v6, v7}, Lkotlin/coroutines/jvm/internal/Boxing;->boxDouble(D)Ljava/lang/Double;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt;->access$AddEditScreen$lambda$14(Landroidx/compose/runtime/MutableState;Ljava/lang/Double;)V

    .line 189
    invoke-static {v3}, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt;->access$AddEditScreen$lambda$19(Landroidx/compose/runtime/MutableState;)Ljava/lang/String;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-static {v1}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 190
    invoke-virtual {v4}, Landroid/location/Location;->getLatitude()D

    move-result-wide v1

    invoke-static {v1, v2}, Lkotlin/coroutines/jvm/internal/Boxing;->boxDouble(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v4}, Landroid/location/Location;->getLongitude()D

    move-result-wide v6

    invoke-static {v6, v7}, Lkotlin/coroutines/jvm/internal/Boxing;->boxDouble(D)Ljava/lang/Double;

    move-result-object v2

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x2

    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v1

    const-string v2, "%.5f, %.5f"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "format(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v3, v1}, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt;->access$AddEditScreen$lambda$20(Landroidx/compose/runtime/MutableState;Ljava/lang/String;)V

    .line 192
    :cond_1
    nop

    .line 186
    .end local v4    # "it\\1":Landroid/location/Location;
    .end local v5    # "$i$a$-let-AddEditScreenKt$AddEditScreen$4$1$6$1$1$1$1\\1\\186\\0":I
    nop

    .line 193
    :cond_2
    iget-object v1, p0, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt$AddEditScreen$4$1$6$1$1$1;->$gpsLoading$delegate:Landroidx/compose/runtime/MutableState;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt;->access$AddEditScreen$lambda$44(Landroidx/compose/runtime/MutableState;Z)V

    .line 194
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
