.class final Landroidx/camera/camera2/internal/SynchronizedCaptureSessionStateCallbacks;
.super Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;
.source "SynchronizedCaptureSessionStateCallbacks.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/camera2/internal/SynchronizedCaptureSessionStateCallbacks$Adapter;
    }
.end annotation


# instance fields
.field private final mCallbacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;",
            ">;)V"
        }
    .end annotation

    .line 47
    .local p1, "callbacks":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;>;"
    invoke-direct {p0}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;-><init>()V

    .line 35
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionStateCallbacks;->mCallbacks:Ljava/util/List;

    .line 48
    iget-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionStateCallbacks;->mCallbacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 49
    return-void
.end method

.method static varargs createComboCallback([Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;)Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;
    .locals 2
    .param p0, "callbacks"    # [Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;

    .line 43
    new-instance v0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionStateCallbacks;

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionStateCallbacks;-><init>(Ljava/util/List;)V

    return-object v0
.end method


# virtual methods
.method public onActive(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V
    .locals 2
    .param p1, "session"    # Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 69
    iget-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionStateCallbacks;->mCallbacks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;

    .line 70
    .local v1, "callback":Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;
    invoke-virtual {v1, p1}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;->onActive(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V

    .line 71
    .end local v1    # "callback":Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;
    goto :goto_0

    .line 72
    :cond_0
    return-void
.end method

.method public onCaptureQueueEmpty(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V
    .locals 2
    .param p1, "session"    # Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 77
    iget-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionStateCallbacks;->mCallbacks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;

    .line 78
    .local v1, "callback":Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;
    invoke-virtual {v1, p1}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;->onCaptureQueueEmpty(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V

    .line 79
    .end local v1    # "callback":Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;
    goto :goto_0

    .line 80
    :cond_0
    return-void
.end method

.method public onClosed(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V
    .locals 2
    .param p1, "session"    # Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 98
    iget-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionStateCallbacks;->mCallbacks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;

    .line 99
    .local v1, "callback":Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;
    invoke-virtual {v1, p1}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;->onClosed(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V

    .line 100
    .end local v1    # "callback":Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;
    goto :goto_0

    .line 101
    :cond_0
    return-void
.end method

.method public onConfigureFailed(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V
    .locals 2
    .param p1, "session"    # Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 91
    iget-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionStateCallbacks;->mCallbacks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;

    .line 92
    .local v1, "callback":Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;
    invoke-virtual {v1, p1}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;->onConfigureFailed(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V

    .line 93
    .end local v1    # "callback":Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;
    goto :goto_0

    .line 94
    :cond_0
    return-void
.end method

.method public onConfigured(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V
    .locals 2
    .param p1, "session"    # Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 84
    iget-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionStateCallbacks;->mCallbacks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;

    .line 85
    .local v1, "callback":Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;
    invoke-virtual {v1, p1}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;->onConfigured(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V

    .line 86
    .end local v1    # "callback":Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;
    goto :goto_0

    .line 87
    :cond_0
    return-void
.end method

.method public onReady(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V
    .locals 2
    .param p1, "session"    # Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 62
    iget-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionStateCallbacks;->mCallbacks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;

    .line 63
    .local v1, "callback":Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;
    invoke-virtual {v1, p1}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;->onReady(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V

    .line 64
    .end local v1    # "callback":Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;
    goto :goto_0

    .line 65
    :cond_0
    return-void
.end method

.method onSessionFinished(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V
    .locals 2
    .param p1, "session"    # Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 105
    iget-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionStateCallbacks;->mCallbacks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;

    .line 106
    .local v1, "callback":Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;
    invoke-virtual {v1, p1}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;->onSessionFinished(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V

    .line 107
    .end local v1    # "callback":Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;
    goto :goto_0

    .line 108
    :cond_0
    return-void
.end method

.method public onSurfacePrepared(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;Landroid/view/Surface;)V
    .locals 2
    .param p1, "session"    # Landroidx/camera/camera2/internal/SynchronizedCaptureSession;
    .param p2, "surface"    # Landroid/view/Surface;

    .line 55
    iget-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionStateCallbacks;->mCallbacks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;

    .line 56
    .local v1, "callback":Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;
    invoke-virtual {v1, p1, p2}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;->onSurfacePrepared(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;Landroid/view/Surface;)V

    .line 57
    .end local v1    # "callback":Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;
    goto :goto_0

    .line 58
    :cond_0
    return-void
.end method
