.class public Landroidx/camera/core/impl/MutableStateObservable;
.super Landroidx/camera/core/impl/StateObservable;
.source "MutableStateObservable.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Landroidx/camera/core/impl/StateObservable<",
        "TT;>;"
    }
.end annotation


# direct methods
.method private constructor <init>(Ljava/lang/Object;Z)V
    .locals 0
    .param p1, "initialState"    # Ljava/lang/Object;
    .param p2, "isError"    # Z

    .line 32
    .local p0, "this":Landroidx/camera/core/impl/MutableStateObservable;, "Landroidx/camera/core/impl/MutableStateObservable<TT;>;"
    invoke-direct {p0, p1, p2}, Landroidx/camera/core/impl/StateObservable;-><init>(Ljava/lang/Object;Z)V

    .line 33
    return-void
.end method

.method public static withInitialError(Ljava/lang/Throwable;)Landroidx/camera/core/impl/MutableStateObservable;
    .locals 2
    .param p0, "initialError"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Throwable;",
            ")",
            "Landroidx/camera/core/impl/MutableStateObservable<",
            "TT;>;"
        }
    .end annotation

    .line 58
    new-instance v0, Landroidx/camera/core/impl/MutableStateObservable;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Landroidx/camera/core/impl/MutableStateObservable;-><init>(Ljava/lang/Object;Z)V

    return-object v0
.end method

.method public static withInitialState(Ljava/lang/Object;)Landroidx/camera/core/impl/MutableStateObservable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Landroidx/camera/core/impl/MutableStateObservable<",
            "TT;>;"
        }
    .end annotation

    .line 44
    .local p0, "initialState":Ljava/lang/Object;, "TT;"
    new-instance v0, Landroidx/camera/core/impl/MutableStateObservable;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroidx/camera/core/impl/MutableStateObservable;-><init>(Ljava/lang/Object;Z)V

    return-object v0
.end method


# virtual methods
.method public setError(Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "error"    # Ljava/lang/Throwable;

    .line 72
    .local p0, "this":Landroidx/camera/core/impl/MutableStateObservable;, "Landroidx/camera/core/impl/MutableStateObservable<TT;>;"
    invoke-virtual {p0, p1}, Landroidx/camera/core/impl/MutableStateObservable;->updateStateAsError(Ljava/lang/Throwable;)V

    .line 73
    return-void
.end method

.method public setState(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 65
    .local p0, "this":Landroidx/camera/core/impl/MutableStateObservable;, "Landroidx/camera/core/impl/MutableStateObservable<TT;>;"
    .local p1, "state":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, p1}, Landroidx/camera/core/impl/MutableStateObservable;->updateState(Ljava/lang/Object;)V

    .line 66
    return-void
.end method
