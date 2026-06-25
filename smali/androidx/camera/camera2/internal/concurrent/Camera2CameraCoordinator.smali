.class public Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;
.super Ljava/lang/Object;
.source "Camera2CameraCoordinator.java"

# interfaces
.implements Landroidx/camera/core/concurrent/CameraCoordinator;


# static fields
.field private static final TAG:Ljava/lang/String; = "Camera2CameraCoordinator"


# instance fields
.field private mActiveConcurrentCameraInfos:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/CameraInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final mCameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

.field private mCameraOperatingMode:I

.field private final mConcurrentCameraIdMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private mConcurrentCameraIds:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private final mConcurrentCameraModeListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/concurrent/CameraCoordinator$ConcurrentCameraModeListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroidx/camera/camera2/internal/compat/CameraManagerCompat;)V
    .locals 1
    .param p1, "cameraManager"    # Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    const/4 v0, 0x0

    iput v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mCameraOperatingMode:I

    .line 60
    iput-object p1, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mCameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    .line 61
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mConcurrentCameraIdMap:Ljava/util/Map;

    .line 62
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mConcurrentCameraIds:Ljava/util/Set;

    .line 63
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mConcurrentCameraModeListeners:Ljava/util/List;

    .line 64
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mActiveConcurrentCameraInfos:Ljava/util/List;

    .line 65
    invoke-direct {p0}, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->retrieveConcurrentCameraIds()V

    .line 66
    return-void
.end method

.method private static createCameraSelectorById(Landroidx/camera/camera2/internal/compat/CameraManagerCompat;Ljava/lang/String;)Landroidx/camera/core/CameraSelector;
    .locals 4
    .param p0, "cameraManager"    # Landroidx/camera/camera2/internal/compat/CameraManagerCompat;
    .param p1, "cameraId"    # Ljava/lang/String;

    .line 181
    new-instance v0, Landroidx/camera/core/CameraSelector$Builder;

    invoke-direct {v0}, Landroidx/camera/core/CameraSelector$Builder;-><init>()V

    new-instance v1, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator$$ExternalSyntheticLambda0;

    invoke-direct {v1, p1}, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator$$ExternalSyntheticLambda0;-><init>(Ljava/lang/String;)V

    .line 182
    invoke-virtual {v0, v1}, Landroidx/camera/core/CameraSelector$Builder;->addCameraFilter(Landroidx/camera/core/CameraFilter;)Landroidx/camera/core/CameraSelector$Builder;

    move-result-object v0

    .line 193
    .local v0, "builder":Landroidx/camera/core/CameraSelector$Builder;
    nop

    .line 194
    :try_start_0
    invoke-virtual {p0, p1}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->getCameraCharacteristicsCompat(Ljava/lang/String;)Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    move-result-object v1

    .line 195
    .local v1, "cameraCharacteristics":Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    sget-object v2, Landroid/hardware/camera2/CameraCharacteristics;->LENS_FACING:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v1, v2}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 197
    .local v2, "cameraLensFacing":Ljava/lang/Integer;
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v0, v3}, Landroidx/camera/core/CameraSelector$Builder;->requireLensFacing(I)Landroidx/camera/core/CameraSelector$Builder;
    :try_end_0
    .catch Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat; {:try_start_0 .. :try_end_0} :catch_0

    .line 200
    nop

    .line 202
    .end local v1    # "cameraCharacteristics":Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    .end local v2    # "cameraLensFacing":Ljava/lang/Integer;
    invoke-virtual {v0}, Landroidx/camera/core/CameraSelector$Builder;->build()Landroidx/camera/core/CameraSelector;

    move-result-object v1

    return-object v1

    .line 198
    :catch_0
    move-exception v1

    .line 199
    .local v1, "e":Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method static synthetic lambda$createCameraSelectorById$0(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;
    .locals 3
    .param p0, "cameraId"    # Ljava/lang/String;
    .param p1, "cameraInfos"    # Ljava/util/List;

    .line 183
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/CameraInfo;

    .line 184
    .local v1, "cameraInfo":Landroidx/camera/core/CameraInfo;
    invoke-static {v1}, Landroidx/camera/camera2/interop/Camera2CameraInfo;->from(Landroidx/camera/core/CameraInfo;)Landroidx/camera/camera2/interop/Camera2CameraInfo;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/camera/camera2/interop/Camera2CameraInfo;->getCameraId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 185
    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 187
    .end local v1    # "cameraInfo":Landroidx/camera/core/CameraInfo;
    :cond_0
    goto :goto_0

    .line 189
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No camera can be find for id: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private retrieveConcurrentCameraIds()V
    .locals 9

    .line 154
    :try_start_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mCameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->getConcurrentCameraIds()Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mConcurrentCameraIds:Ljava/util/Set;
    :try_end_0
    .catch Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat; {:try_start_0 .. :try_end_0} :catch_0

    .line 157
    goto :goto_0

    .line 155
    :catch_0
    move-exception v0

    .line 156
    .local v0, "e":Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;
    const-string v1, "Camera2CameraCoordinator"

    const-string v2, "Failed to get concurrent camera ids"

    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    .end local v0    # "e":Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;
    :goto_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mConcurrentCameraIds:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Set;

    .line 160
    .local v1, "concurrentCameraIdList":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 162
    .local v2, "cameraIdList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x2

    if-lt v3, v4, :cond_2

    .line 163
    const/4 v3, 0x0

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 164
    .local v4, "cameraId1":Ljava/lang/String;
    const/4 v5, 0x1

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 165
    .local v6, "cameraId2":Ljava/lang/String;
    iget-object v7, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mConcurrentCameraIdMap:Ljava/util/Map;

    invoke-interface {v7, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 166
    iget-object v7, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mConcurrentCameraIdMap:Ljava/util/Map;

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v7, v4, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    :cond_0
    iget-object v7, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mConcurrentCameraIdMap:Ljava/util/Map;

    invoke-interface {v7, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 169
    iget-object v7, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mConcurrentCameraIdMap:Ljava/util/Map;

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v7, v6, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    :cond_1
    iget-object v7, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mConcurrentCameraIdMap:Ljava/util/Map;

    invoke-interface {v7, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-interface {v7, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 172
    iget-object v5, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mConcurrentCameraIdMap:Ljava/util/Map;

    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v5, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 174
    .end local v1    # "concurrentCameraIdList":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v2    # "cameraIdList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v4    # "cameraId1":Ljava/lang/String;
    .end local v6    # "cameraId2":Ljava/lang/String;
    :cond_2
    goto :goto_1

    .line 175
    :cond_3
    return-void
.end method


# virtual methods
.method public addListener(Landroidx/camera/core/concurrent/CameraCoordinator$ConcurrentCameraModeListener;)V
    .locals 1
    .param p1, "listener"    # Landroidx/camera/core/concurrent/CameraCoordinator$ConcurrentCameraModeListener;

    .line 135
    iget-object v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mConcurrentCameraModeListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 136
    return-void
.end method

.method public getActiveConcurrentCameraInfos()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/camera/core/CameraInfo;",
            ">;"
        }
    .end annotation

    .line 85
    iget-object v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mActiveConcurrentCameraInfos:Ljava/util/List;

    return-object v0
.end method

.method public getCameraOperatingMode()I
    .locals 1

    .line 113
    iget v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mCameraOperatingMode:I

    return v0
.end method

.method public getConcurrentCameraSelectors()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Landroidx/camera/core/CameraSelector;",
            ">;>;"
        }
    .end annotation

    .line 71
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 72
    .local v0, "concurrentCameraSelectorLists":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Landroidx/camera/core/CameraSelector;>;>;"
    iget-object v1, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mConcurrentCameraIds:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Set;

    .line 73
    .local v2, "concurrentCameraIdList":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 74
    .local v3, "cameraSelectors":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/CameraSelector;>;"
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 75
    .local v5, "concurrentCameraId":Ljava/lang/String;
    iget-object v6, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mCameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    invoke-static {v6, v5}, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->createCameraSelectorById(Landroidx/camera/camera2/internal/compat/CameraManagerCompat;Ljava/lang/String;)Landroidx/camera/core/CameraSelector;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 76
    .end local v5    # "concurrentCameraId":Ljava/lang/String;
    goto :goto_1

    .line 77
    :cond_0
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 78
    .end local v2    # "concurrentCameraIdList":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v3    # "cameraSelectors":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/CameraSelector;>;"
    goto :goto_0

    .line 79
    :cond_1
    return-object v0
.end method

.method public getPairedConcurrentCameraId(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "cameraId"    # Ljava/lang/String;

    .line 97
    iget-object v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mConcurrentCameraIdMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 98
    return-object v1

    .line 100
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mConcurrentCameraIdMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 101
    .local v2, "pairedCameraId":Ljava/lang/String;
    iget-object v3, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mActiveConcurrentCameraInfos:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/core/CameraInfo;

    .line 102
    .local v4, "cameraInfo":Landroidx/camera/core/CameraInfo;
    invoke-static {v4}, Landroidx/camera/camera2/interop/Camera2CameraInfo;->from(Landroidx/camera/core/CameraInfo;)Landroidx/camera/camera2/interop/Camera2CameraInfo;

    move-result-object v5

    invoke-virtual {v5}, Landroidx/camera/camera2/interop/Camera2CameraInfo;->getCameraId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 103
    return-object v2

    .line 105
    .end local v4    # "cameraInfo":Landroidx/camera/core/CameraInfo;
    :cond_1
    goto :goto_1

    .line 106
    .end local v2    # "pairedCameraId":Ljava/lang/String;
    :cond_2
    goto :goto_0

    .line 107
    :cond_3
    return-object v1
.end method

.method public removeListener(Landroidx/camera/core/concurrent/CameraCoordinator$ConcurrentCameraModeListener;)V
    .locals 1
    .param p1, "listener"    # Landroidx/camera/core/concurrent/CameraCoordinator$ConcurrentCameraModeListener;

    .line 140
    iget-object v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mConcurrentCameraModeListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 141
    return-void
.end method

.method public setActiveConcurrentCameraInfos(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/CameraInfo;",
            ">;)V"
        }
    .end annotation

    .line 90
    .local p1, "cameraInfos":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/CameraInfo;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mActiveConcurrentCameraInfos:Ljava/util/List;

    .line 91
    return-void
.end method

.method public setCameraOperatingMode(I)V
    .locals 3
    .param p1, "cameraOperatingMode"    # I

    .line 118
    iget v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mCameraOperatingMode:I

    if-eq p1, v0, :cond_0

    .line 119
    iget-object v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mConcurrentCameraModeListeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/concurrent/CameraCoordinator$ConcurrentCameraModeListener;

    .line 120
    .local v1, "listener":Landroidx/camera/core/concurrent/CameraCoordinator$ConcurrentCameraModeListener;
    iget v2, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mCameraOperatingMode:I

    invoke-interface {v1, v2, p1}, Landroidx/camera/core/concurrent/CameraCoordinator$ConcurrentCameraModeListener;->onCameraOperatingModeUpdated(II)V

    .line 123
    .end local v1    # "listener":Landroidx/camera/core/concurrent/CameraCoordinator$ConcurrentCameraModeListener;
    goto :goto_0

    .line 126
    :cond_0
    iget v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mCameraOperatingMode:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    if-eq p1, v1, :cond_1

    .line 128
    iget-object v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mActiveConcurrentCameraInfos:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 130
    :cond_1
    iput p1, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mCameraOperatingMode:I

    .line 131
    return-void
.end method

.method public shutdown()V
    .locals 1

    .line 145
    iget-object v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mConcurrentCameraModeListeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 146
    iget-object v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mConcurrentCameraIdMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 147
    iget-object v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mActiveConcurrentCameraInfos:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 148
    iget-object v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mConcurrentCameraIds:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 149
    const/4 v0, 0x0

    iput v0, p0, Landroidx/camera/camera2/internal/concurrent/Camera2CameraCoordinator;->mCameraOperatingMode:I

    .line 150
    return-void
.end method
