.class final Landroidx/camera/core/impl/LiveDataObservable$LiveDataObserverAdapter;
.super Ljava/lang/Object;
.source "LiveDataObservable.java"

# interfaces
.implements Landroidx/lifecycle/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/core/impl/LiveDataObservable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "LiveDataObserverAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Landroidx/lifecycle/Observer<",
        "Landroidx/camera/core/impl/LiveDataObservable$Result<",
        "TT;>;>;"
    }
.end annotation


# instance fields
.field final mActive:Ljava/util/concurrent/atomic/AtomicBoolean;

.field final mExecutor:Ljava/util/concurrent/Executor;

.field final mObserver:Landroidx/camera/core/impl/Observable$Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/Observable$Observer<",
            "-TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/concurrent/Executor;Landroidx/camera/core/impl/Observable$Observer;)V
    .locals 2
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Executor;",
            "Landroidx/camera/core/impl/Observable$Observer<",
            "-TT;>;)V"
        }
    .end annotation

    .line 219
    .local p0, "this":Landroidx/camera/core/impl/LiveDataObservable$LiveDataObserverAdapter;, "Landroidx/camera/core/impl/LiveDataObservable$LiveDataObserverAdapter<TT;>;"
    .local p2, "observer":Landroidx/camera/core/impl/Observable$Observer;, "Landroidx/camera/core/impl/Observable$Observer<-TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 215
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Landroidx/camera/core/impl/LiveDataObservable$LiveDataObserverAdapter;->mActive:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 220
    iput-object p1, p0, Landroidx/camera/core/impl/LiveDataObservable$LiveDataObserverAdapter;->mExecutor:Ljava/util/concurrent/Executor;

    .line 221
    iput-object p2, p0, Landroidx/camera/core/impl/LiveDataObservable$LiveDataObserverAdapter;->mObserver:Landroidx/camera/core/impl/Observable$Observer;

    .line 222
    return-void
.end method


# virtual methods
.method disable()V
    .locals 2

    .line 225
    .local p0, "this":Landroidx/camera/core/impl/LiveDataObservable$LiveDataObserverAdapter;, "Landroidx/camera/core/impl/LiveDataObservable$LiveDataObserverAdapter<TT;>;"
    iget-object v0, p0, Landroidx/camera/core/impl/LiveDataObservable$LiveDataObserverAdapter;->mActive:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 226
    return-void
.end method

.method synthetic lambda$onChanged$0$androidx-camera-core-impl-LiveDataObservable$LiveDataObserverAdapter(Landroidx/camera/core/impl/LiveDataObservable$Result;)V
    .locals 2
    .param p1, "result"    # Landroidx/camera/core/impl/LiveDataObservable$Result;

    .line 231
    .local p0, "this":Landroidx/camera/core/impl/LiveDataObservable$LiveDataObserverAdapter;, "Landroidx/camera/core/impl/LiveDataObservable$LiveDataObserverAdapter<TT;>;"
    iget-object v0, p0, Landroidx/camera/core/impl/LiveDataObservable$LiveDataObserverAdapter;->mActive:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_0

    .line 233
    return-void

    .line 236
    :cond_0
    invoke-virtual {p1}, Landroidx/camera/core/impl/LiveDataObservable$Result;->completedSuccessfully()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 237
    iget-object v0, p0, Landroidx/camera/core/impl/LiveDataObservable$LiveDataObserverAdapter;->mObserver:Landroidx/camera/core/impl/Observable$Observer;

    invoke-virtual {p1}, Landroidx/camera/core/impl/LiveDataObservable$Result;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Landroidx/camera/core/impl/Observable$Observer;->onNewData(Ljava/lang/Object;)V

    goto :goto_0

    .line 239
    :cond_1
    invoke-virtual {p1}, Landroidx/camera/core/impl/LiveDataObservable$Result;->getError()Ljava/lang/Throwable;

    move-result-object v0

    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    iget-object v0, p0, Landroidx/camera/core/impl/LiveDataObservable$LiveDataObserverAdapter;->mObserver:Landroidx/camera/core/impl/Observable$Observer;

    invoke-virtual {p1}, Landroidx/camera/core/impl/LiveDataObservable$Result;->getError()Ljava/lang/Throwable;

    move-result-object v1

    invoke-interface {v0, v1}, Landroidx/camera/core/impl/Observable$Observer;->onError(Ljava/lang/Throwable;)V

    .line 242
    :goto_0
    return-void
.end method

.method public onChanged(Landroidx/camera/core/impl/LiveDataObservable$Result;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/LiveDataObservable$Result<",
            "TT;>;)V"
        }
    .end annotation

    .line 230
    .local p0, "this":Landroidx/camera/core/impl/LiveDataObservable$LiveDataObserverAdapter;, "Landroidx/camera/core/impl/LiveDataObservable$LiveDataObserverAdapter<TT;>;"
    .local p1, "result":Landroidx/camera/core/impl/LiveDataObservable$Result;, "Landroidx/camera/core/impl/LiveDataObservable$Result<TT;>;"
    iget-object v0, p0, Landroidx/camera/core/impl/LiveDataObservable$LiveDataObserverAdapter;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/core/impl/LiveDataObservable$LiveDataObserverAdapter$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Landroidx/camera/core/impl/LiveDataObservable$LiveDataObserverAdapter$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/core/impl/LiveDataObservable$LiveDataObserverAdapter;Landroidx/camera/core/impl/LiveDataObservable$Result;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 243
    return-void
.end method

.method public bridge synthetic onChanged(Ljava/lang/Object;)V
    .locals 0

    .line 212
    .local p0, "this":Landroidx/camera/core/impl/LiveDataObservable$LiveDataObserverAdapter;, "Landroidx/camera/core/impl/LiveDataObservable$LiveDataObserverAdapter<TT;>;"
    check-cast p1, Landroidx/camera/core/impl/LiveDataObservable$Result;

    invoke-virtual {p0, p1}, Landroidx/camera/core/impl/LiveDataObservable$LiveDataObserverAdapter;->onChanged(Landroidx/camera/core/impl/LiveDataObservable$Result;)V

    return-void
.end method
