.class Landroidx/camera/view/RotationProvider$1;
.super Landroid/view/OrientationEventListener;
.source "RotationProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/camera/view/RotationProvider;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# static fields
.field private static final INVALID_SURFACE_ROTATION:I = -0x1


# instance fields
.field private mRotation:I

.field final synthetic this$0:Landroidx/camera/view/RotationProvider;


# direct methods
.method constructor <init>(Landroidx/camera/view/RotationProvider;Landroid/content/Context;)V
    .locals 1
    .param p1, "this$0"    # Landroidx/camera/view/RotationProvider;
    .param p2, "context"    # Landroid/content/Context;

    .line 86
    iput-object p1, p0, Landroidx/camera/view/RotationProvider$1;->this$0:Landroidx/camera/view/RotationProvider;

    invoke-direct {p0, p2}, Landroid/view/OrientationEventListener;-><init>(Landroid/content/Context;)V

    .line 89
    const/4 v0, -0x1

    iput v0, p0, Landroidx/camera/view/RotationProvider$1;->mRotation:I

    return-void
.end method


# virtual methods
.method public onOrientationChanged(I)V
    .locals 4
    .param p1, "orientation"    # I

    .line 93
    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    .line 96
    return-void

    .line 99
    :cond_0
    invoke-static {p1}, Landroidx/camera/view/RotationProvider;->orientationToSurfaceRotation(I)I

    move-result v0

    .line 100
    .local v0, "newRotation":I
    iget v1, p0, Landroidx/camera/view/RotationProvider$1;->mRotation:I

    if-eq v1, v0, :cond_1

    .line 101
    iput v0, p0, Landroidx/camera/view/RotationProvider$1;->mRotation:I

    .line 104
    iget-object v1, p0, Landroidx/camera/view/RotationProvider$1;->this$0:Landroidx/camera/view/RotationProvider;

    iget-object v1, v1, Landroidx/camera/view/RotationProvider;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 105
    :try_start_0
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Landroidx/camera/view/RotationProvider$1;->this$0:Landroidx/camera/view/RotationProvider;

    iget-object v3, v3, Landroidx/camera/view/RotationProvider;->mListeners:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 106
    .local v2, "listeners":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/view/RotationProvider$ListenerWrapper;>;"
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 107
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 108
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/view/RotationProvider$ListenerWrapper;

    .line 109
    .local v3, "listenerWrapper":Landroidx/camera/view/RotationProvider$ListenerWrapper;
    invoke-virtual {v3, v0}, Landroidx/camera/view/RotationProvider$ListenerWrapper;->onRotationChanged(I)V

    .line 110
    .end local v3    # "listenerWrapper":Landroidx/camera/view/RotationProvider$ListenerWrapper;
    goto :goto_0

    .line 106
    .end local v2    # "listeners":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/view/RotationProvider$ListenerWrapper;>;"
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 113
    :cond_1
    return-void
.end method
