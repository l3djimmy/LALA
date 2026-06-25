.class Landroidx/camera/view/RotationProvider$ListenerWrapper;
.super Ljava/lang/Object;
.source "RotationProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/view/RotationProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ListenerWrapper"
.end annotation


# instance fields
.field private final mEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final mExecutor:Ljava/util/concurrent/Executor;

.field private final mListener:Landroidx/camera/view/RotationProvider$Listener;


# direct methods
.method constructor <init>(Landroidx/camera/view/RotationProvider$Listener;Ljava/util/concurrent/Executor;)V
    .locals 2
    .param p1, "listener"    # Landroidx/camera/view/RotationProvider$Listener;
    .param p2, "executor"    # Ljava/util/concurrent/Executor;

    .line 179
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 180
    iput-object p1, p0, Landroidx/camera/view/RotationProvider$ListenerWrapper;->mListener:Landroidx/camera/view/RotationProvider$Listener;

    .line 181
    iput-object p2, p0, Landroidx/camera/view/RotationProvider$ListenerWrapper;->mExecutor:Ljava/util/concurrent/Executor;

    .line 182
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Landroidx/camera/view/RotationProvider$ListenerWrapper;->mEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 183
    return-void
.end method


# virtual methods
.method disable()V
    .locals 2

    .line 198
    iget-object v0, p0, Landroidx/camera/view/RotationProvider$ListenerWrapper;->mEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 199
    return-void
.end method

.method synthetic lambda$onRotationChanged$0$androidx-camera-view-RotationProvider$ListenerWrapper(I)V
    .locals 1
    .param p1, "rotation"    # I

    .line 187
    iget-object v0, p0, Landroidx/camera/view/RotationProvider$ListenerWrapper;->mEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 188
    iget-object v0, p0, Landroidx/camera/view/RotationProvider$ListenerWrapper;->mListener:Landroidx/camera/view/RotationProvider$Listener;

    invoke-interface {v0, p1}, Landroidx/camera/view/RotationProvider$Listener;->onRotationChanged(I)V

    .line 190
    :cond_0
    return-void
.end method

.method onRotationChanged(I)V
    .locals 2
    .param p1, "rotation"    # I

    .line 186
    iget-object v0, p0, Landroidx/camera/view/RotationProvider$ListenerWrapper;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/view/RotationProvider$ListenerWrapper$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Landroidx/camera/view/RotationProvider$ListenerWrapper$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/view/RotationProvider$ListenerWrapper;I)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 191
    return-void
.end method
