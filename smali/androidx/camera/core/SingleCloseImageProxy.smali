.class final Landroidx/camera/core/SingleCloseImageProxy;
.super Landroidx/camera/core/ForwardingImageProxy;
.source "SingleCloseImageProxy.java"


# instance fields
.field private final mClosed:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method constructor <init>(Landroidx/camera/core/ImageProxy;)V
    .locals 2
    .param p1, "image"    # Landroidx/camera/core/ImageProxy;

    .line 34
    invoke-direct {p0, p1}, Landroidx/camera/core/ForwardingImageProxy;-><init>(Landroidx/camera/core/ImageProxy;)V

    .line 26
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Landroidx/camera/core/SingleCloseImageProxy;->mClosed:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 35
    return-void
.end method


# virtual methods
.method public close()V
    .locals 2

    .line 39
    iget-object v0, p0, Landroidx/camera/core/SingleCloseImageProxy;->mClosed:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 40
    invoke-super {p0}, Landroidx/camera/core/ForwardingImageProxy;->close()V

    .line 42
    :cond_0
    return-void
.end method
