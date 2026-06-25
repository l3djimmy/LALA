.class public final Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1$callback$1;
.super Lcom/google/android/gms/location/LocationCallback;
.source "LocationManager.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nLocationManager.kt\nKotlin\n*S Kotlin\n*F\n+ 1 LocationManager.kt\ncom/hardlineforge/lala/location/LocationManager$currentLocation$1$callback$1\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,64:1\n1#2:65\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0016\u00a8\u0006\u0006"
    }
    d2 = {
        "com/hardlineforge/lala/location/LocationManager$currentLocation$1$callback$1",
        "Lcom/google/android/gms/location/LocationCallback;",
        "onLocationResult",
        "",
        "result",
        "Lcom/google/android/gms/location/LocationResult;",
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


# instance fields
.field final synthetic $$this$callbackFlow:Lkotlinx/coroutines/channels/ProducerScope;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlinx/coroutines/channels/ProducerScope<",
            "Landroid/location/Location;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lkotlinx/coroutines/channels/ProducerScope;)V
    .locals 0
    .param p1, "$$this$callbackFlow"    # Lkotlinx/coroutines/channels/ProducerScope;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlinx/coroutines/channels/ProducerScope<",
            "-",
            "Landroid/location/Location;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1$callback$1;->$$this$callbackFlow:Lkotlinx/coroutines/channels/ProducerScope;

    .line 47
    invoke-direct {p0}, Lcom/google/android/gms/location/LocationCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onLocationResult(Lcom/google/android/gms/location/LocationResult;)V
    .locals 3
    .param p1, "result"    # Lcom/google/android/gms/location/LocationResult;

    const-string v0, "result"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 49
    invoke-virtual {p1}, Lcom/google/android/gms/location/LocationResult;->getLastLocation()Landroid/location/Location;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/hardlineforge/lala/location/LocationManager$currentLocation$1$callback$1;->$$this$callbackFlow:Lkotlinx/coroutines/channels/ProducerScope;

    .line 65
    .local v0, "it\\1":Landroid/location/Location;
    const/4 v2, 0x0

    .line 49
    .local v2, "$i$a$-let-LocationManager$currentLocation$1$callback$1$onLocationResult$1\\1\\49\\0":I
    invoke-interface {v1, v0}, Lkotlinx/coroutines/channels/ProducerScope;->trySend-JP2dKIU(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "it\\1":Landroid/location/Location;
    .end local v2    # "$i$a$-let-LocationManager$currentLocation$1$callback$1$onLocationResult$1\\1\\49\\0":I
    invoke-static {v0}, Lkotlinx/coroutines/channels/ChannelResult;->box-impl(Ljava/lang/Object;)Lkotlinx/coroutines/channels/ChannelResult;

    .line 50
    :cond_0
    return-void
.end method
