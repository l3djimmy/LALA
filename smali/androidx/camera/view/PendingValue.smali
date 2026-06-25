.class Landroidx/camera/view/PendingValue;
.super Ljava/lang/Object;
.source "PendingValue.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private mCompleterAndValue:Landroidx/core/util/Pair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/core/util/Pair<",
            "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<",
            "Ljava/lang/Void;",
            ">;TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 0

    .line 46
    .local p0, "this":Landroidx/camera/view/PendingValue;, "Landroidx/camera/view/PendingValue<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$setValue$0$androidx-camera-view-PendingValue(Ljava/lang/Object;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 2
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 61
    .local p0, "this":Landroidx/camera/view/PendingValue;, "Landroidx/camera/view/PendingValue<TT;>;"
    iget-object v0, p0, Landroidx/camera/view/PendingValue;->mCompleterAndValue:Landroidx/core/util/Pair;

    if-eqz v0, :cond_0

    .line 62
    iget-object v0, p0, Landroidx/camera/view/PendingValue;->mCompleterAndValue:Landroidx/core/util/Pair;

    iget-object v0, v0, Landroidx/core/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    invoke-virtual {v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setCancelled()Z

    .line 64
    :cond_0
    new-instance v0, Landroidx/core/util/Pair;

    invoke-direct {v0, p2, p1}, Landroidx/core/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v0, p0, Landroidx/camera/view/PendingValue;->mCompleterAndValue:Landroidx/core/util/Pair;

    .line 65
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "PendingValue "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method propagateIfHasValue(Landroidx/arch/core/util/Function;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/arch/core/util/Function<",
            "TT;",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;>;)V"
        }
    .end annotation

    .line 76
    .local p0, "this":Landroidx/camera/view/PendingValue;, "Landroidx/camera/view/PendingValue<TT;>;"
    .local p1, "setValueFunction":Landroidx/arch/core/util/Function;, "Landroidx/arch/core/util/Function<TT;Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;>;"
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 77
    iget-object v0, p0, Landroidx/camera/view/PendingValue;->mCompleterAndValue:Landroidx/core/util/Pair;

    if-eqz v0, :cond_0

    .line 78
    iget-object v0, p0, Landroidx/camera/view/PendingValue;->mCompleterAndValue:Landroidx/core/util/Pair;

    iget-object v0, v0, Landroidx/core/util/Pair;->second:Ljava/lang/Object;

    invoke-interface {p1, v0}, Landroidx/arch/core/util/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/util/concurrent/ListenableFuture;

    iget-object v1, p0, Landroidx/camera/view/PendingValue;->mCompleterAndValue:Landroidx/core/util/Pair;

    iget-object v1, v1, Landroidx/core/util/Pair;->first:Ljava/lang/Object;

    check-cast v1, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 79
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 78
    invoke-static {v0, v1}, Landroidx/camera/core/impl/utils/futures/Futures;->propagate(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V

    .line 80
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/view/PendingValue;->mCompleterAndValue:Landroidx/core/util/Pair;

    .line 82
    :cond_0
    return-void
.end method

.method setValue(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 58
    .local p0, "this":Landroidx/camera/view/PendingValue;, "Landroidx/camera/view/PendingValue<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 59
    new-instance v0, Landroidx/camera/view/PendingValue$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p1}, Landroidx/camera/view/PendingValue$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/view/PendingValue;Ljava/lang/Object;)V

    invoke-static {v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method
