.class public final Landroidx/camera/view/RotationProvider;
.super Ljava/lang/Object;
.source "RotationProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/view/RotationProvider$ListenerWrapper;,
        Landroidx/camera/view/RotationProvider$Listener;
    }
.end annotation


# instance fields
.field mIgnoreCanDetectForTest:Z

.field final mListeners:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroidx/camera/view/RotationProvider$Listener;",
            "Landroidx/camera/view/RotationProvider$ListenerWrapper;",
            ">;"
        }
    .end annotation
.end field

.field final mLock:Ljava/lang/Object;

.field final mOrientationListener:Landroid/view/OrientationEventListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/camera/view/RotationProvider;->mLock:Ljava/lang/Object;

    .line 73
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/camera/view/RotationProvider;->mListeners:Ljava/util/Map;

    .line 79
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/view/RotationProvider;->mIgnoreCanDetectForTest:Z

    .line 86
    new-instance v0, Landroidx/camera/view/RotationProvider$1;

    invoke-direct {v0, p0, p1}, Landroidx/camera/view/RotationProvider$1;-><init>(Landroidx/camera/view/RotationProvider;Landroid/content/Context;)V

    iput-object v0, p0, Landroidx/camera/view/RotationProvider;->mOrientationListener:Landroid/view/OrientationEventListener;

    .line 115
    return-void
.end method

.method static orientationToSurfaceRotation(I)I
    .locals 1
    .param p0, "orientation"    # I

    .line 160
    const/16 v0, 0x13b

    if-ge p0, v0, :cond_3

    const/16 v0, 0x2d

    if-ge p0, v0, :cond_0

    goto :goto_0

    .line 162
    :cond_0
    const/16 v0, 0xe1

    if-lt p0, v0, :cond_1

    .line 163
    const/4 v0, 0x1

    return v0

    .line 164
    :cond_1
    const/16 v0, 0x87

    if-lt p0, v0, :cond_2

    .line 165
    const/4 v0, 0x2

    return v0

    .line 167
    :cond_2
    const/4 v0, 0x3

    return v0

    .line 161
    :cond_3
    :goto_0
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public addListener(Ljava/util/concurrent/Executor;Landroidx/camera/view/RotationProvider$Listener;)Z
    .locals 3
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "listener"    # Landroidx/camera/view/RotationProvider$Listener;

    .line 127
    iget-object v0, p0, Landroidx/camera/view/RotationProvider;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 128
    :try_start_0
    iget-object v1, p0, Landroidx/camera/view/RotationProvider;->mOrientationListener:Landroid/view/OrientationEventListener;

    invoke-virtual {v1}, Landroid/view/OrientationEventListener;->canDetectOrientation()Z

    move-result v1

    if-nez v1, :cond_0

    iget-boolean v1, p0, Landroidx/camera/view/RotationProvider;->mIgnoreCanDetectForTest:Z

    if-nez v1, :cond_0

    .line 129
    monitor-exit v0

    const/4 v0, 0x0

    return v0

    .line 131
    :cond_0
    iget-object v1, p0, Landroidx/camera/view/RotationProvider;->mListeners:Ljava/util/Map;

    new-instance v2, Landroidx/camera/view/RotationProvider$ListenerWrapper;

    invoke-direct {v2, p2, p1}, Landroidx/camera/view/RotationProvider$ListenerWrapper;-><init>(Landroidx/camera/view/RotationProvider$Listener;Ljava/util/concurrent/Executor;)V

    invoke-interface {v1, p2, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    iget-object v1, p0, Landroidx/camera/view/RotationProvider;->mOrientationListener:Landroid/view/OrientationEventListener;

    invoke-virtual {v1}, Landroid/view/OrientationEventListener;->enable()V

    .line 133
    monitor-exit v0

    .line 134
    const/4 v0, 0x1

    return v0

    .line 133
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public removeListener(Landroidx/camera/view/RotationProvider$Listener;)V
    .locals 3
    .param p1, "listener"    # Landroidx/camera/view/RotationProvider$Listener;

    .line 143
    iget-object v0, p0, Landroidx/camera/view/RotationProvider;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 144
    :try_start_0
    iget-object v1, p0, Landroidx/camera/view/RotationProvider;->mListeners:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/view/RotationProvider$ListenerWrapper;

    .line 145
    .local v1, "listenerWrapper":Landroidx/camera/view/RotationProvider$ListenerWrapper;
    if-eqz v1, :cond_0

    .line 146
    invoke-virtual {v1}, Landroidx/camera/view/RotationProvider$ListenerWrapper;->disable()V

    .line 147
    iget-object v2, p0, Landroidx/camera/view/RotationProvider;->mListeners:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    :cond_0
    iget-object v2, p0, Landroidx/camera/view/RotationProvider;->mListeners:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 150
    iget-object v2, p0, Landroidx/camera/view/RotationProvider;->mOrientationListener:Landroid/view/OrientationEventListener;

    invoke-virtual {v2}, Landroid/view/OrientationEventListener;->disable()V

    .line 152
    .end local v1    # "listenerWrapper":Landroidx/camera/view/RotationProvider$ListenerWrapper;
    :cond_1
    monitor-exit v0

    .line 153
    return-void

    .line 152
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
