.class public final Landroidx/camera/core/impl/ConstantObservable;
.super Ljava/lang/Object;
.source "ConstantObservable.java"

# interfaces
.implements Landroidx/camera/core/impl/Observable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Landroidx/camera/core/impl/Observable<",
        "TT;>;"
    }
.end annotation


# static fields
.field private static final NULL_OBSERVABLE:Landroidx/camera/core/impl/ConstantObservable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/ConstantObservable<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "ConstantObservable"


# instance fields
.field private final mValueFuture:Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 35
    new-instance v0, Landroidx/camera/core/impl/ConstantObservable;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroidx/camera/core/impl/ConstantObservable;-><init>(Ljava/lang/Object;)V

    sput-object v0, Landroidx/camera/core/impl/ConstantObservable;->NULL_OBSERVABLE:Landroidx/camera/core/impl/ConstantObservable;

    return-void
.end method

.method private constructor <init>(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 56
    .local p0, "this":Landroidx/camera/core/impl/ConstantObservable;, "Landroidx/camera/core/impl/ConstantObservable<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    invoke-static {p1}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFuture(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/impl/ConstantObservable;->mValueFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 58
    return-void
.end method

.method public static withValue(Ljava/lang/Object;)Landroidx/camera/core/impl/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">(TU;)",
            "Landroidx/camera/core/impl/Observable<",
            "TU;>;"
        }
    .end annotation

    .line 48
    .local p0, "value":Ljava/lang/Object;, "TU;"
    if-nez p0, :cond_0

    .line 50
    sget-object v0, Landroidx/camera/core/impl/ConstantObservable;->NULL_OBSERVABLE:Landroidx/camera/core/impl/ConstantObservable;

    .line 51
    .local v0, "typedNull":Landroidx/camera/core/impl/Observable;, "Landroidx/camera/core/impl/Observable<TU;>;"
    return-object v0

    .line 53
    .end local v0    # "typedNull":Landroidx/camera/core/impl/Observable;, "Landroidx/camera/core/impl/Observable<TU;>;"
    :cond_0
    new-instance v0, Landroidx/camera/core/impl/ConstantObservable;

    invoke-direct {v0, p0}, Landroidx/camera/core/impl/ConstantObservable;-><init>(Ljava/lang/Object;)V

    return-object v0
.end method


# virtual methods
.method public addObserver(Ljava/util/concurrent/Executor;Landroidx/camera/core/impl/Observable$Observer;)V
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

    .line 72
    .local p0, "this":Landroidx/camera/core/impl/ConstantObservable;, "Landroidx/camera/core/impl/ConstantObservable<TT;>;"
    .local p2, "observer":Landroidx/camera/core/impl/Observable$Observer;, "Landroidx/camera/core/impl/Observable$Observer<-TT;>;"
    iget-object v0, p0, Landroidx/camera/core/impl/ConstantObservable;->mValueFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    new-instance v1, Landroidx/camera/core/impl/ConstantObservable$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p2}, Landroidx/camera/core/impl/ConstantObservable$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/core/impl/ConstantObservable;Landroidx/camera/core/impl/Observable$Observer;)V

    invoke-interface {v0, v1, p1}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 81
    return-void
.end method

.method public fetchData()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "TT;>;"
        }
    .end annotation

    .line 63
    .local p0, "this":Landroidx/camera/core/impl/ConstantObservable;, "Landroidx/camera/core/impl/ConstantObservable<TT;>;"
    iget-object v0, p0, Landroidx/camera/core/impl/ConstantObservable;->mValueFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    return-object v0
.end method

.method synthetic lambda$addObserver$0$androidx-camera-core-impl-ConstantObservable(Landroidx/camera/core/impl/Observable$Observer;)V
    .locals 1
    .param p1, "observer"    # Landroidx/camera/core/impl/Observable$Observer;

    .line 74
    .local p0, "this":Landroidx/camera/core/impl/ConstantObservable;, "Landroidx/camera/core/impl/ConstantObservable<TT;>;"
    :try_start_0
    iget-object v0, p0, Landroidx/camera/core/impl/ConstantObservable;->mValueFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    invoke-interface {v0}, Lcom/google/common/util/concurrent/ListenableFuture;->get()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1, v0}, Landroidx/camera/core/impl/Observable$Observer;->onNewData(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    goto :goto_1

    .line 75
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 78
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    invoke-interface {p1, v0}, Landroidx/camera/core/impl/Observable$Observer;->onError(Ljava/lang/Throwable;)V

    .line 80
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_1
    return-void
.end method

.method public removeObserver(Landroidx/camera/core/impl/Observable$Observer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/Observable$Observer<",
            "-TT;>;)V"
        }
    .end annotation

    .line 86
    .local p0, "this":Landroidx/camera/core/impl/ConstantObservable;, "Landroidx/camera/core/impl/ConstantObservable<TT;>;"
    .local p1, "observer":Landroidx/camera/core/impl/Observable$Observer;, "Landroidx/camera/core/impl/Observable$Observer<-TT;>;"
    return-void
.end method
