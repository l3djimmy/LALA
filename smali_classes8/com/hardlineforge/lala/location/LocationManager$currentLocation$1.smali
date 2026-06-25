.class final Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "LocationManager.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hardlineforge/lala/location/LocationManager;->currentLocation()Lkotlinx/coroutines/flow/Flow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/SuspendLambda;",
        "Lkotlin/jvm/functions/Function2<",
        "Lkotlinx/coroutines/channels/ProducerScope<",
        "-",
        "Landroid/location/Location;",
        ">;",
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
        "\u0000\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u0008\u0012\u0004\u0012\u00020\u00030\u0002H\n"
    }
    d2 = {
        "<anonymous>",
        "",
        "Lkotlinx/coroutines/channels/ProducerScope;",
        "Landroid/location/Location;"
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
    c = "com.hardlineforge.lala.location.LocationManager$currentLocation$1"
    f = "LocationManager.kt"
    i = {
        0x0,
        0x0,
        0x0
    }
    l = {
        0x37
    }
    m = "invokeSuspend"
    n = {
        "$this$callbackFlow",
        "request",
        "callback"
    }
    s = {
        "L$0",
        "L$1",
        "L$2"
    }
.end annotation


# instance fields
.field private synthetic L$0:Ljava/lang/Object;

.field L$1:Ljava/lang/Object;

.field L$2:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lcom/hardlineforge/lala/location/LocationManager;


# direct methods
.method constructor <init>(Lcom/hardlineforge/lala/location/LocationManager;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hardlineforge/lala/location/LocationManager;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1;->this$0:Lcom/hardlineforge/lala/location/LocationManager;

    const/4 v0, 0x2

    invoke-direct {p0, v0, p2}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method

.method static final invokeSuspend$lambda$1(Lcom/hardlineforge/lala/location/LocationManager;Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1$callback$1;)Lkotlin/Unit;
    .locals 2
    .param p0, "this$0"    # Lcom/hardlineforge/lala/location/LocationManager;
    .param p1, "$callback"    # Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1$callback$1;

    .line 55
    invoke-static {p0}, Lcom/hardlineforge/lala/location/LocationManager;->access$getClient$p(Lcom/hardlineforge/lala/location/LocationManager;)Lcom/google/android/gms/location/FusedLocationProviderClient;

    move-result-object v0

    move-object v1, p1

    check-cast v1, Lcom/google/android/gms/location/LocationCallback;

    invoke-interface {v0, v1}, Lcom/google/android/gms/location/FusedLocationProviderClient;->removeLocationUpdates(Lcom/google/android/gms/location/LocationCallback;)Lcom/google/android/gms/tasks/Task;

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
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

    new-instance v0, Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1;

    iget-object v1, p0, Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1;->this$0:Lcom/hardlineforge/lala/location/LocationManager;

    invoke-direct {v0, v1, p2}, Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1;-><init>(Lcom/hardlineforge/lala/location/LocationManager;Lkotlin/coroutines/Continuation;)V

    iput-object p1, v0, Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1;->L$0:Ljava/lang/Object;

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/channels/ProducerScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1;->invoke(Lkotlinx/coroutines/channels/ProducerScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invoke(Lkotlinx/coroutines/channels/ProducerScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlinx/coroutines/channels/ProducerScope<",
            "-",
            "Landroid/location/Location;",
            ">;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8
    .param p1, "$result"    # Ljava/lang/Object;

    iget-object v0, p0, Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1;->L$0:Ljava/lang/Object;

    check-cast v0, Lkotlinx/coroutines/channels/ProducerScope;

    .local v0, "$this$callbackFlow":Lkotlinx/coroutines/channels/ProducerScope;
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    .line 34
    iget v2, p0, Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1;->label:I

    packed-switch v2, :pswitch_data_0

    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :pswitch_0
    iget-object v1, p0, Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1;->L$2:Ljava/lang/Object;

    check-cast v1, Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1$callback$1;

    .local v1, "callback":Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1$callback$1;
    iget-object v2, p0, Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1;->L$1:Ljava/lang/Object;

    check-cast v2, Lcom/google/android/gms/location/LocationRequest;

    .local v2, "request":Lcom/google/android/gms/location/LocationRequest;
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto :goto_0

    .end local v1    # "callback":Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1$callback$1;
    .end local v2    # "request":Lcom/google/android/gms/location/LocationRequest;
    :pswitch_1
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 35
    iget-object v2, p0, Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1;->this$0:Lcom/hardlineforge/lala/location/LocationManager;

    invoke-virtual {v2}, Lcom/hardlineforge/lala/location/LocationManager;->hasPermission()Z

    move-result v2

    if-nez v2, :cond_0

    .line 36
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Location permission not granted"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    check-cast v1, Ljava/lang/Throwable;

    invoke-interface {v0, v1}, Lkotlinx/coroutines/channels/ProducerScope;->close(Ljava/lang/Throwable;)Z

    .line 37
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v1

    .line 40
    :cond_0
    new-instance v2, Lcom/google/android/gms/location/LocationRequest$Builder;

    .line 41
    nop

    .line 40
    const/16 v3, 0x64

    const-wide/16 v4, 0x1388

    invoke-direct {v2, v3, v4, v5}, Lcom/google/android/gms/location/LocationRequest$Builder;-><init>(IJ)V

    .line 42
    move-object v3, v2

    .local v3, "$this$invokeSuspend_u24lambda_u240\\1":Lcom/google/android/gms/location/LocationRequest$Builder;
    const/4 v4, 0x0

    .line 43
    .local v4, "$i$a$-apply-LocationManager$currentLocation$1$request$1\\1\\42\\0":I
    const/4 v5, 0x1

    invoke-virtual {v3, v5}, Lcom/google/android/gms/location/LocationRequest$Builder;->setWaitForAccurateLocation(Z)Lcom/google/android/gms/location/LocationRequest$Builder;

    .line 44
    const-wide/16 v6, 0x7d0

    invoke-virtual {v3, v6, v7}, Lcom/google/android/gms/location/LocationRequest$Builder;->setMinUpdateIntervalMillis(J)Lcom/google/android/gms/location/LocationRequest$Builder;

    .line 45
    nop

    .line 42
    .end local v3    # "$this$invokeSuspend_u24lambda_u240\\1":Lcom/google/android/gms/location/LocationRequest$Builder;
    .end local v4    # "$i$a$-apply-LocationManager$currentLocation$1$request$1\\1\\42\\0":I
    nop

    .line 45
    invoke-virtual {v2}, Lcom/google/android/gms/location/LocationRequest$Builder;->build()Lcom/google/android/gms/location/LocationRequest;

    move-result-object v2

    const-string v3, "build(...)"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 40
    nop

    .line 47
    .restart local v2    # "request":Lcom/google/android/gms/location/LocationRequest;
    new-instance v3, Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1$callback$1;

    invoke-direct {v3, v0}, Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1$callback$1;-><init>(Lkotlinx/coroutines/channels/ProducerScope;)V

    .line 53
    .local v3, "callback":Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1$callback$1;
    iget-object v4, p0, Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1;->this$0:Lcom/hardlineforge/lala/location/LocationManager;

    invoke-static {v4}, Lcom/hardlineforge/lala/location/LocationManager;->access$getClient$p(Lcom/hardlineforge/lala/location/LocationManager;)Lcom/google/android/gms/location/FusedLocationProviderClient;

    move-result-object v4

    move-object v6, v3

    check-cast v6, Lcom/google/android/gms/location/LocationCallback;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v7

    invoke-interface {v4, v2, v6, v7}, Lcom/google/android/gms/location/FusedLocationProviderClient;->requestLocationUpdates(Lcom/google/android/gms/location/LocationRequest;Lcom/google/android/gms/location/LocationCallback;Landroid/os/Looper;)Lcom/google/android/gms/tasks/Task;

    .line 55
    iget-object v4, p0, Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1;->this$0:Lcom/hardlineforge/lala/location/LocationManager;

    new-instance v6, Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1$$ExternalSyntheticLambda0;

    invoke-direct {v6, v4, v3}, Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1$$ExternalSyntheticLambda0;-><init>(Lcom/hardlineforge/lala/location/LocationManager;Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1$callback$1;)V

    move-object v4, p0

    check-cast v4, Lkotlin/coroutines/Continuation;

    invoke-static {v0}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    iput-object v7, p0, Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1;->L$0:Ljava/lang/Object;

    invoke-static {v2}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    iput-object v7, p0, Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1;->L$1:Ljava/lang/Object;

    invoke-static {v3}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    iput-object v7, p0, Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1;->L$2:Ljava/lang/Object;

    iput v5, p0, Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1;->label:I

    invoke-static {v0, v6, v4}, Lkotlinx/coroutines/channels/ProduceKt;->awaitClose(Lkotlinx/coroutines/channels/ProducerScope;Lkotlin/jvm/functions/Function0;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v4

    if-ne v4, v1, :cond_1

    .line 34
    return-object v1

    .line 55
    :cond_1
    move-object v1, v3

    .line 56
    .end local v3    # "callback":Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1$callback$1;
    .restart local v1    # "callback":Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1$callback$1;
    :goto_0
    sget-object v3, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v3

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
