.class public final Lcom/hardlineforge/lala/location/LocationManager;
.super Ljava/lang/Object;
.source "LocationManager.kt"


# annotations
.annotation runtime Ljavax/inject/Singleton;
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0007\u0018\u00002\u00020\u0001B\u0013\u0008\u0007\u0012\u0008\u0008\u0001\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0006\u0010\u0008\u001a\u00020\tJ\u000e\u0010\n\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\u000bH\u0007J\u001e\u0010\r\u001a\u00020\u000e2\u0014\u0010\u000f\u001a\u0010\u0012\u0006\u0012\u0004\u0018\u00010\u000c\u0012\u0004\u0012\u00020\u000e0\u0010H\u0007R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0011"
    }
    d2 = {
        "Lcom/hardlineforge/lala/location/LocationManager;",
        "",
        "context",
        "Landroid/content/Context;",
        "<init>",
        "(Landroid/content/Context;)V",
        "client",
        "Lcom/google/android/gms/location/FusedLocationProviderClient;",
        "hasPermission",
        "",
        "currentLocation",
        "Lkotlinx/coroutines/flow/Flow;",
        "Landroid/location/Location;",
        "lastKnownLocation",
        "",
        "onResult",
        "Lkotlin/Function1;",
        "app_debug"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final $stable:I


# instance fields
.field private final client:Lcom/google/android/gms/location/FusedLocationProviderClient;

.field private final context:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    sput v0, Lcom/hardlineforge/lala/location/LocationManager;->$stable:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
        .annotation runtime Ldagger/hilt/android/qualifiers/ApplicationContext;
        .end annotation
    .end param
    .annotation runtime Ljavax/inject/Inject;
    .end annotation

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/hardlineforge/lala/location/LocationManager;->context:Landroid/content/Context;

    .line 22
    iget-object v0, p0, Lcom/hardlineforge/lala/location/LocationManager;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/android/gms/location/LocationServices;->getFusedLocationProviderClient(Landroid/content/Context;)Lcom/google/android/gms/location/FusedLocationProviderClient;

    move-result-object v0

    const-string v1, "getFusedLocationProviderClient(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/hardlineforge/lala/location/LocationManager;->client:Lcom/google/android/gms/location/FusedLocationProviderClient;

    .line 19
    return-void
.end method

.method public static final synthetic access$getClient$p(Lcom/hardlineforge/lala/location/LocationManager;)Lcom/google/android/gms/location/FusedLocationProviderClient;
    .locals 1
    .param p0, "$this"    # Lcom/hardlineforge/lala/location/LocationManager;

    .line 18
    iget-object v0, p0, Lcom/hardlineforge/lala/location/LocationManager;->client:Lcom/google/android/gms/location/FusedLocationProviderClient;

    return-object v0
.end method

.method static final lastKnownLocation$lambda$0(Lkotlin/jvm/functions/Function1;Landroid/location/Location;)Lkotlin/Unit;
    .locals 1
    .param p0, "$onResult"    # Lkotlin/jvm/functions/Function1;
    .param p1, "it"    # Landroid/location/Location;

    .line 61
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final lastKnownLocation$lambda$1(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)V
    .locals 0
    .param p0, "$tmp0"    # Lkotlin/jvm/functions/Function1;
    .param p1, "p0"    # Ljava/lang/Object;

    .line 61
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final currentLocation()Lkotlinx/coroutines/flow/Flow;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlinx/coroutines/flow/Flow<",
            "Landroid/location/Location;",
            ">;"
        }
    .end annotation

    .line 34
    new-instance v0, Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1;-><init>(Lcom/hardlineforge/lala/location/LocationManager;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/jvm/functions/Function2;

    invoke-static {v0}, Lkotlinx/coroutines/flow/FlowKt;->callbackFlow(Lkotlin/jvm/functions/Function2;)Lkotlinx/coroutines/flow/Flow;

    move-result-object v0

    .line 56
    return-object v0
.end method

.method public final hasPermission()Z
    .locals 2

    .line 25
    nop

    .line 26
    iget-object v0, p0, Lcom/hardlineforge/lala/location/LocationManager;->context:Landroid/content/Context;

    .line 25
    const-string v1, "android.permission.ACCESS_FINE_LOCATION"

    invoke-static {v0, v1}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_1

    .line 28
    nop

    .line 29
    iget-object v0, p0, Lcom/hardlineforge/lala/location/LocationManager;->context:Landroid/content/Context;

    .line 28
    const-string v1, "android.permission.ACCESS_COARSE_LOCATION"

    invoke-static {v0, v1}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 25
    :goto_1
    return v0
.end method

.method public final lastKnownLocation(Lkotlin/jvm/functions/Function1;)V
    .locals 3
    .param p1, "onResult"    # Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroid/location/Location;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    const-string v0, "onResult"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 60
    invoke-virtual {p0}, Lcom/hardlineforge/lala/location/LocationManager;->hasPermission()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    .line 61
    :cond_0
    iget-object v0, p0, Lcom/hardlineforge/lala/location/LocationManager;->client:Lcom/google/android/gms/location/FusedLocationProviderClient;

    invoke-interface {v0}, Lcom/google/android/gms/location/FusedLocationProviderClient;->getLastLocation()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    new-instance v1, Lcom/hardlineforge/lala/location/LocationManager$$ExternalSyntheticLambda0;

    invoke-direct {v1, p1}, Lcom/hardlineforge/lala/location/LocationManager$$ExternalSyntheticLambda0;-><init>(Lkotlin/jvm/functions/Function1;)V

    new-instance v2, Lcom/hardlineforge/lala/location/LocationManager$$ExternalSyntheticLambda1;

    invoke-direct {v2, v1}, Lcom/hardlineforge/lala/location/LocationManager$$ExternalSyntheticLambda1;-><init>(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v0, v2}, Lcom/google/android/gms/tasks/Task;->addOnSuccessListener(Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;

    .line 62
    return-void
.end method
