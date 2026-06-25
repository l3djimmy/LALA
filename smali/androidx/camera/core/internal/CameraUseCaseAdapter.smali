.class public final Landroidx/camera/core/internal/CameraUseCaseAdapter;
.super Ljava/lang/Object;
.source "CameraUseCaseAdapter.java"

# interfaces
.implements Landroidx/camera/core/Camera;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/internal/CameraUseCaseAdapter$CameraId;,
        Landroidx/camera/core/internal/CameraUseCaseAdapter$CameraException;,
        Landroidx/camera/core/internal/CameraUseCaseAdapter$ConfigPair;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "CameraUseCaseAdapter"


# instance fields
.field private final mAppUseCases:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/UseCase;",
            ">;"
        }
    .end annotation
.end field

.field private mAttached:Z

.field private mCameraConfig:Landroidx/camera/core/impl/CameraConfig;

.field private final mCameraCoordinator:Landroidx/camera/core/concurrent/CameraCoordinator;

.field private final mCameraDeviceSurfaceManager:Landroidx/camera/core/impl/CameraDeviceSurfaceManager;

.field private final mCameraInternal:Landroidx/camera/core/impl/CameraInternal;

.field private final mCameraInternals:Ljava/util/LinkedHashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashSet<",
            "Landroidx/camera/core/impl/CameraInternal;",
            ">;"
        }
    .end annotation
.end field

.field private final mCameraUseCases:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/UseCase;",
            ">;"
        }
    .end annotation
.end field

.field private mEffects:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/CameraEffect;",
            ">;"
        }
    .end annotation
.end field

.field private final mId:Landroidx/camera/core/internal/CameraUseCaseAdapter$CameraId;

.field private mInteropConfig:Landroidx/camera/core/impl/Config;

.field private final mLock:Ljava/lang/Object;

.field private mPlaceholderForExtensions:Landroidx/camera/core/UseCase;

.field private final mRestrictedCameraControl:Landroidx/camera/core/impl/RestrictedCameraControl;

.field private final mRestrictedCameraInfo:Landroidx/camera/core/impl/RestrictedCameraInfo;

.field private mStreamSharing:Landroidx/camera/core/streamsharing/StreamSharing;

.field private final mUseCaseConfigFactory:Landroidx/camera/core/impl/UseCaseConfigFactory;

.field private mViewPort:Landroidx/camera/core/ViewPort;


# direct methods
.method public constructor <init>(Ljava/util/LinkedHashSet;Landroidx/camera/core/concurrent/CameraCoordinator;Landroidx/camera/core/impl/CameraDeviceSurfaceManager;Landroidx/camera/core/impl/UseCaseConfigFactory;)V
    .locals 3
    .param p2, "cameraCoordinator"    # Landroidx/camera/core/concurrent/CameraCoordinator;
    .param p3, "cameraDeviceSurfaceManager"    # Landroidx/camera/core/impl/CameraDeviceSurfaceManager;
    .param p4, "useCaseConfigFactory"    # Landroidx/camera/core/impl/UseCaseConfigFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/LinkedHashSet<",
            "Landroidx/camera/core/impl/CameraInternal;",
            ">;",
            "Landroidx/camera/core/concurrent/CameraCoordinator;",
            "Landroidx/camera/core/impl/CameraDeviceSurfaceManager;",
            "Landroidx/camera/core/impl/UseCaseConfigFactory;",
            ")V"
        }
    .end annotation

    .line 176
    .local p1, "cameras":Ljava/util/LinkedHashSet;, "Ljava/util/LinkedHashSet<Landroidx/camera/core/impl/CameraInternal;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 109
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mAppUseCases:Ljava/util/List;

    .line 112
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraUseCases:Ljava/util/List;

    .line 122
    nop

    .line 124
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mEffects:Ljava/util/List;

    .line 127
    nop

    .line 129
    invoke-static {}, Landroidx/camera/core/impl/CameraConfigs;->emptyConfig()Landroidx/camera/core/impl/CameraConfig;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraConfig:Landroidx/camera/core/impl/CameraConfig;

    .line 131
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mLock:Ljava/lang/Object;

    .line 135
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mAttached:Z

    .line 139
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mInteropConfig:Landroidx/camera/core/impl/Config;

    .line 177
    invoke-virtual {p1}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/CameraInternal;

    iput-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    .line 178
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0, p1}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraInternals:Ljava/util/LinkedHashSet;

    .line 179
    new-instance v0, Landroidx/camera/core/internal/CameraUseCaseAdapter$CameraId;

    iget-object v1, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraInternals:Ljava/util/LinkedHashSet;

    invoke-direct {v0, v1}, Landroidx/camera/core/internal/CameraUseCaseAdapter$CameraId;-><init>(Ljava/util/LinkedHashSet;)V

    iput-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mId:Landroidx/camera/core/internal/CameraUseCaseAdapter$CameraId;

    .line 180
    iput-object p2, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraCoordinator:Landroidx/camera/core/concurrent/CameraCoordinator;

    .line 181
    iput-object p3, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraDeviceSurfaceManager:Landroidx/camera/core/impl/CameraDeviceSurfaceManager;

    .line 182
    iput-object p4, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mUseCaseConfigFactory:Landroidx/camera/core/impl/UseCaseConfigFactory;

    .line 184
    new-instance v0, Landroidx/camera/core/impl/RestrictedCameraControl;

    iget-object v1, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    .line 185
    invoke-interface {v1}, Landroidx/camera/core/impl/CameraInternal;->getCameraControlInternal()Landroidx/camera/core/impl/CameraControlInternal;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/camera/core/impl/RestrictedCameraControl;-><init>(Landroidx/camera/core/impl/CameraControlInternal;)V

    iput-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mRestrictedCameraControl:Landroidx/camera/core/impl/RestrictedCameraControl;

    .line 186
    new-instance v0, Landroidx/camera/core/impl/RestrictedCameraInfo;

    iget-object v1, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    .line 187
    invoke-interface {v1}, Landroidx/camera/core/impl/CameraInternal;->getCameraInfoInternal()Landroidx/camera/core/impl/CameraInfoInternal;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mRestrictedCameraControl:Landroidx/camera/core/impl/RestrictedCameraControl;

    invoke-direct {v0, v1, v2}, Landroidx/camera/core/impl/RestrictedCameraInfo;-><init>(Landroidx/camera/core/impl/CameraInfoInternal;Landroidx/camera/core/impl/RestrictedCameraControl;)V

    iput-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mRestrictedCameraInfo:Landroidx/camera/core/impl/RestrictedCameraInfo;

    .line 189
    return-void
.end method

.method private cacheInteropConfig()V
    .locals 3

    .line 625
    iget-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 626
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    .line 627
    invoke-interface {v1}, Landroidx/camera/core/impl/CameraInternal;->getCameraControlInternal()Landroidx/camera/core/impl/CameraControlInternal;

    move-result-object v1

    .line 628
    .local v1, "cameraControlInternal":Landroidx/camera/core/impl/CameraControlInternal;
    invoke-interface {v1}, Landroidx/camera/core/impl/CameraControlInternal;->getInteropConfig()Landroidx/camera/core/impl/Config;

    move-result-object v2

    iput-object v2, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mInteropConfig:Landroidx/camera/core/impl/Config;

    .line 629
    invoke-interface {v1}, Landroidx/camera/core/impl/CameraControlInternal;->clearInteropConfig()V

    .line 630
    .end local v1    # "cameraControlInternal":Landroidx/camera/core/impl/CameraControlInternal;
    monitor-exit v0

    .line 631
    return-void

    .line 630
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method static calculateCameraUseCases(Ljava/util/Collection;Landroidx/camera/core/UseCase;Landroidx/camera/core/streamsharing/StreamSharing;)Ljava/util/Collection;
    .locals 2
    .param p1, "placeholderForExtensions"    # Landroidx/camera/core/UseCase;
    .param p2, "streamSharing"    # Landroidx/camera/core/streamsharing/StreamSharing;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/UseCase;",
            ">;",
            "Landroidx/camera/core/UseCase;",
            "Landroidx/camera/core/streamsharing/StreamSharing;",
            ")",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/UseCase;",
            ">;"
        }
    .end annotation

    .line 524
    .local p0, "appUseCases":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/UseCase;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 525
    .local v0, "useCases":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/UseCase;>;"
    if-eqz p1, :cond_0

    .line 526
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 528
    :cond_0
    if-eqz p2, :cond_1

    .line 529
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 530
    invoke-virtual {p2}, Landroidx/camera/core/streamsharing/StreamSharing;->getChildren()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 532
    :cond_1
    return-object v0
.end method

.method private static calculateSensorToBufferTransformMatrix(Landroid/graphics/Rect;Landroid/util/Size;)Landroid/graphics/Matrix;
    .locals 6
    .param p0, "fullSensorRect"    # Landroid/graphics/Rect;
    .param p1, "useCaseSize"    # Landroid/util/Size;

    .line 806
    nop

    .line 807
    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 806
    :goto_0
    const-string v1, "Cannot compute viewport crop rects zero sized sensor rect."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 809
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0, p0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 810
    .local v0, "fullSensorRectF":Landroid/graphics/RectF;
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    .line 811
    .local v1, "sensorToUseCaseTransformation":Landroid/graphics/Matrix;
    new-instance v2, Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v3

    int-to-float v3, v3

    .line 812
    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v4

    int-to-float v4, v4

    const/4 v5, 0x0

    invoke-direct {v2, v5, v5, v3, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 813
    .local v2, "srcRect":Landroid/graphics/RectF;
    sget-object v3, Landroid/graphics/Matrix$ScaleToFit;->CENTER:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v1, v2, v0, v3}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 815
    invoke-virtual {v1, v1}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 816
    return-object v1
.end method

.method private calculateSuggestedStreamSpecs(ILandroidx/camera/core/impl/CameraInfoInternal;Ljava/util/Collection;Ljava/util/Collection;Ljava/util/Map;)Ljava/util/Map;
    .locals 20
    .param p1, "cameraMode"    # I
    .param p2, "cameraInfoInternal"    # Landroidx/camera/core/impl/CameraInfoInternal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroidx/camera/core/impl/CameraInfoInternal;",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/UseCase;",
            ">;",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/UseCase;",
            ">;",
            "Ljava/util/Map<",
            "Landroidx/camera/core/UseCase;",
            "Landroidx/camera/core/internal/CameraUseCaseAdapter$ConfigPair;",
            ">;)",
            "Ljava/util/Map<",
            "Landroidx/camera/core/UseCase;",
            "Landroidx/camera/core/impl/StreamSpec;",
            ">;"
        }
    .end annotation

    .line 639
    .local p3, "newUseCases":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/UseCase;>;"
    .local p4, "currentUseCases":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/UseCase;>;"
    .local p5, "configPairMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/UseCase;Landroidx/camera/core/internal/CameraUseCaseAdapter$ConfigPair;>;"
    move-object/from16 v1, p0

    move/from16 v2, p1

    move-object/from16 v3, p2

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v4, v0

    .line 640
    .local v4, "existingSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    invoke-interface {v3}, Landroidx/camera/core/impl/CameraInfoInternal;->getCameraId()Ljava/lang/String;

    move-result-object v5

    .line 641
    .local v5, "cameraId":Ljava/lang/String;
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    move-object v6, v0

    .line 642
    .local v6, "suggestedStreamSpecs":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/UseCase;Landroidx/camera/core/impl/StreamSpec;>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    move-object v7, v0

    .line 645
    .local v7, "surfaceInfoUseCaseMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/UseCase;>;"
    invoke-interface/range {p4 .. p4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    const/4 v9, 0x0

    if-eqz v8, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroidx/camera/core/UseCase;

    .line 646
    .local v8, "useCase":Landroidx/camera/core/UseCase;
    iget-object v10, v1, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraDeviceSurfaceManager:Landroidx/camera/core/impl/CameraDeviceSurfaceManager;

    .line 650
    invoke-virtual {v8}, Landroidx/camera/core/UseCase;->getImageFormat()I

    move-result v11

    .line 651
    invoke-virtual {v8}, Landroidx/camera/core/UseCase;->getAttachedSurfaceResolution()Landroid/util/Size;

    move-result-object v12

    .line 647
    invoke-interface {v10, v2, v5, v11, v12}, Landroidx/camera/core/impl/CameraDeviceSurfaceManager;->transformSurfaceConfig(ILjava/lang/String;ILandroid/util/Size;)Landroidx/camera/core/impl/SurfaceConfig;

    move-result-object v13

    .line 652
    .local v13, "surfaceConfig":Landroidx/camera/core/impl/SurfaceConfig;
    nop

    .line 653
    invoke-virtual {v8}, Landroidx/camera/core/UseCase;->getImageFormat()I

    move-result v14

    invoke-virtual {v8}, Landroidx/camera/core/UseCase;->getAttachedSurfaceResolution()Landroid/util/Size;

    move-result-object v15

    .line 654
    invoke-virtual {v8}, Landroidx/camera/core/UseCase;->getAttachedStreamSpec()Landroidx/camera/core/impl/StreamSpec;

    move-result-object v10

    invoke-static {v10}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroidx/camera/core/impl/StreamSpec;

    invoke-virtual {v10}, Landroidx/camera/core/impl/StreamSpec;->getDynamicRange()Landroidx/camera/core/DynamicRange;

    move-result-object v16

    .line 655
    invoke-static {v8}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->getCaptureTypes(Landroidx/camera/core/UseCase;)Ljava/util/List;

    move-result-object v17

    .line 656
    invoke-virtual {v8}, Landroidx/camera/core/UseCase;->getAttachedStreamSpec()Landroidx/camera/core/impl/StreamSpec;

    move-result-object v10

    invoke-virtual {v10}, Landroidx/camera/core/impl/StreamSpec;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v18

    .line 657
    invoke-virtual {v8}, Landroidx/camera/core/UseCase;->getCurrentConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v10

    invoke-interface {v10, v9}, Landroidx/camera/core/impl/UseCaseConfig;->getTargetFrameRate(Landroid/util/Range;)Landroid/util/Range;

    move-result-object v19

    .line 652
    invoke-static/range {v13 .. v19}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->create(Landroidx/camera/core/impl/SurfaceConfig;ILandroid/util/Size;Landroidx/camera/core/DynamicRange;Ljava/util/List;Landroidx/camera/core/impl/Config;Landroid/util/Range;)Landroidx/camera/core/impl/AttachedSurfaceInfo;

    move-result-object v9

    .line 658
    .local v9, "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    invoke-interface {v4, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 659
    invoke-interface {v7, v9, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 660
    invoke-virtual {v8}, Landroidx/camera/core/UseCase;->getAttachedStreamSpec()Landroidx/camera/core/impl/StreamSpec;

    move-result-object v10

    invoke-interface {v6, v8, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 661
    .end local v8    # "useCase":Landroidx/camera/core/UseCase;
    .end local v9    # "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    .end local v13    # "surfaceConfig":Landroidx/camera/core/impl/SurfaceConfig;
    goto :goto_0

    .line 664
    :cond_0
    invoke-interface/range {p3 .. p3}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5

    .line 665
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    move-object v8, v0

    .line 666
    .local v8, "configToUseCaseMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/UseCase;>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    move-object v10, v0

    .line 669
    .local v10, "configToSupportedSizesMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Ljava/util/List<Landroid/util/Size;>;>;"
    :try_start_0
    iget-object v0, v1, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraInternal;->getCameraControlInternal()Landroidx/camera/core/impl/CameraControlInternal;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraControlInternal;->getSensorRect()Landroid/graphics/Rect;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 674
    .local v0, "sensorRect":Landroid/graphics/Rect;
    goto :goto_1

    .line 670
    .end local v0    # "sensorRect":Landroid/graphics/Rect;
    :catch_0
    move-exception v0

    .line 673
    .local v0, "e":Ljava/lang/NullPointerException;
    const/4 v11, 0x0

    move-object v0, v11

    .line 675
    .local v0, "sensorRect":Landroid/graphics/Rect;
    :goto_1
    new-instance v11, Landroidx/camera/core/internal/SupportedOutputSizesSorter;

    .line 677
    if-eqz v0, :cond_1

    invoke-static {v0}, Landroidx/camera/core/impl/utils/TransformUtils;->rectToSize(Landroid/graphics/Rect;)Landroid/util/Size;

    move-result-object v9

    :cond_1
    invoke-direct {v11, v3, v9}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;-><init>(Landroidx/camera/core/impl/CameraInfoInternal;Landroid/util/Size;)V

    .line 678
    .local v11, "supportedOutputSizesSorter":Landroidx/camera/core/internal/SupportedOutputSizesSorter;
    invoke-interface/range {p3 .. p3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_2
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_2

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroidx/camera/core/UseCase;

    .line 679
    .local v12, "useCase":Landroidx/camera/core/UseCase;
    move-object/from16 v13, p5

    invoke-interface {v13, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroidx/camera/core/internal/CameraUseCaseAdapter$ConfigPair;

    .line 681
    .local v14, "configPair":Landroidx/camera/core/internal/CameraUseCaseAdapter$ConfigPair;
    iget-object v15, v14, Landroidx/camera/core/internal/CameraUseCaseAdapter$ConfigPair;->mExtendedConfig:Landroidx/camera/core/impl/UseCaseConfig;

    move-object/from16 v16, v0

    .end local v0    # "sensorRect":Landroid/graphics/Rect;
    .local v16, "sensorRect":Landroid/graphics/Rect;
    iget-object v0, v14, Landroidx/camera/core/internal/CameraUseCaseAdapter$ConfigPair;->mCameraConfig:Landroidx/camera/core/impl/UseCaseConfig;

    .line 682
    invoke-virtual {v12, v3, v15, v0}, Landroidx/camera/core/UseCase;->mergeConfigs(Landroidx/camera/core/impl/CameraInfoInternal;Landroidx/camera/core/impl/UseCaseConfig;Landroidx/camera/core/impl/UseCaseConfig;)Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v0

    .line 684
    .local v0, "combinedUseCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    invoke-interface {v8, v0, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 685
    nop

    .line 686
    invoke-virtual {v11, v0}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->getSortedSupportedOutputSizes(Landroidx/camera/core/impl/UseCaseConfig;)Ljava/util/List;

    move-result-object v15

    .line 685
    invoke-interface {v10, v0, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 688
    .end local v0    # "combinedUseCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    .end local v12    # "useCase":Landroidx/camera/core/UseCase;
    .end local v14    # "configPair":Landroidx/camera/core/internal/CameraUseCaseAdapter$ConfigPair;
    move-object/from16 v0, v16

    goto :goto_2

    .line 692
    .end local v16    # "sensorRect":Landroid/graphics/Rect;
    .local v0, "sensorRect":Landroid/graphics/Rect;
    :cond_2
    move-object/from16 v13, p5

    move-object/from16 v16, v0

    .end local v0    # "sensorRect":Landroid/graphics/Rect;
    .restart local v16    # "sensorRect":Landroid/graphics/Rect;
    iget-object v0, v1, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraDeviceSurfaceManager:Landroidx/camera/core/impl/CameraDeviceSurfaceManager;

    .line 693
    invoke-interface {v0, v2, v5, v4, v10}, Landroidx/camera/core/impl/CameraDeviceSurfaceManager;->getSuggestedStreamSpecs(ILjava/lang/String;Ljava/util/List;Ljava/util/Map;)Landroid/util/Pair;

    move-result-object v0

    .line 698
    .local v0, "streamSpecMaps":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/impl/StreamSpec;>;Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;>;"
    invoke-interface {v8}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_3
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_3

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/Map$Entry;

    .line 699
    .local v12, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/UseCase;>;"
    invoke-interface {v12}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroidx/camera/core/UseCase;

    iget-object v15, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v15, Ljava/util/Map;

    .line 700
    invoke-interface {v12}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v15, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/StreamSpec;

    .line 699
    invoke-interface {v6, v14, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 701
    .end local v12    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/UseCase;>;"
    move-object/from16 v1, p0

    goto :goto_3

    .line 703
    :cond_3
    iget-object v1, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v1, Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Map$Entry;

    .line 704
    .local v9, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;"
    invoke-interface {v9}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v12

    invoke-interface {v7, v12}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_4

    .line 705
    invoke-interface {v9}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v12

    invoke-interface {v7, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroidx/camera/core/UseCase;

    .line 706
    invoke-interface {v9}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroidx/camera/core/impl/StreamSpec;

    .line 705
    invoke-interface {v6, v12, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 708
    .end local v9    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;"
    :cond_4
    goto :goto_4

    .line 664
    .end local v0    # "streamSpecMaps":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/impl/StreamSpec;>;Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;>;"
    .end local v8    # "configToUseCaseMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/UseCase;>;"
    .end local v10    # "configToSupportedSizesMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Ljava/util/List<Landroid/util/Size;>;>;"
    .end local v11    # "supportedOutputSizesSorter":Landroidx/camera/core/internal/SupportedOutputSizesSorter;
    .end local v16    # "sensorRect":Landroid/graphics/Rect;
    :cond_5
    move-object/from16 v13, p5

    .line 710
    :cond_6
    return-object v6
.end method

.method private createExtraImageCapture()Landroidx/camera/core/ImageCapture;
    .locals 2

    .line 1073
    new-instance v0, Landroidx/camera/core/ImageCapture$Builder;

    invoke-direct {v0}, Landroidx/camera/core/ImageCapture$Builder;-><init>()V

    const-string v1, "ImageCapture-Extra"

    invoke-virtual {v0, v1}, Landroidx/camera/core/ImageCapture$Builder;->setTargetName(Ljava/lang/String;)Landroidx/camera/core/ImageCapture$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/ImageCapture$Builder;->build()Landroidx/camera/core/ImageCapture;

    move-result-object v0

    return-object v0
.end method

.method private createExtraPreview()Landroidx/camera/core/Preview;
    .locals 2

    .line 1052
    new-instance v0, Landroidx/camera/core/Preview$Builder;

    invoke-direct {v0}, Landroidx/camera/core/Preview$Builder;-><init>()V

    const-string/jumbo v1, "Preview-Extra"

    invoke-virtual {v0, v1}, Landroidx/camera/core/Preview$Builder;->setTargetName(Ljava/lang/String;)Landroidx/camera/core/Preview$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/Preview$Builder;->build()Landroidx/camera/core/Preview;

    move-result-object v0

    .line 1055
    .local v0, "preview":Landroidx/camera/core/Preview;
    new-instance v1, Landroidx/camera/core/internal/CameraUseCaseAdapter$$ExternalSyntheticLambda1;

    invoke-direct {v1}, Landroidx/camera/core/internal/CameraUseCaseAdapter$$ExternalSyntheticLambda1;-><init>()V

    invoke-virtual {v0, v1}, Landroidx/camera/core/Preview;->setSurfaceProvider(Landroidx/camera/core/Preview$SurfaceProvider;)V

    .line 1069
    return-object v0
.end method

.method private createOrReuseStreamSharing(Ljava/util/Collection;Z)Landroidx/camera/core/streamsharing/StreamSharing;
    .locals 5
    .param p2, "forceSharingToPreviewAndVideo"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/UseCase;",
            ">;Z)",
            "Landroidx/camera/core/streamsharing/StreamSharing;"
        }
    .end annotation

    .line 476
    .local p1, "appUseCases":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/UseCase;>;"
    iget-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 477
    :try_start_0
    invoke-direct {p0, p1, p2}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->getStreamSharingChildren(Ljava/util/Collection;Z)Ljava/util/Set;

    move-result-object v1

    .line 479
    .local v1, "newChildren":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/UseCase;>;"
    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v2

    const/4 v3, 0x2

    const/4 v4, 0x0

    if-ge v2, v3, :cond_0

    .line 481
    monitor-exit v0

    return-object v4

    .line 483
    :cond_0
    iget-object v2, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mStreamSharing:Landroidx/camera/core/streamsharing/StreamSharing;

    if-eqz v2, :cond_1

    iget-object v2, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mStreamSharing:Landroidx/camera/core/streamsharing/StreamSharing;

    invoke-virtual {v2}, Landroidx/camera/core/streamsharing/StreamSharing;->getChildren()Ljava/util/Set;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 485
    iget-object v2, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mStreamSharing:Landroidx/camera/core/streamsharing/StreamSharing;

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/streamsharing/StreamSharing;

    monitor-exit v0

    return-object v2

    .line 488
    :cond_1
    invoke-static {v1}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->isStreamSharingChildrenCombinationValid(Ljava/util/Collection;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 489
    monitor-exit v0

    return-object v4

    .line 492
    :cond_2
    new-instance v2, Landroidx/camera/core/streamsharing/StreamSharing;

    iget-object v3, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    iget-object v4, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mUseCaseConfigFactory:Landroidx/camera/core/impl/UseCaseConfigFactory;

    invoke-direct {v2, v3, v1, v4}, Landroidx/camera/core/streamsharing/StreamSharing;-><init>(Landroidx/camera/core/impl/CameraInternal;Ljava/util/Set;Landroidx/camera/core/impl/UseCaseConfigFactory;)V

    monitor-exit v0

    return-object v2

    .line 493
    .end local v1    # "newChildren":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/UseCase;>;"
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static generateCameraId(Ljava/util/LinkedHashSet;)Landroidx/camera/core/internal/CameraUseCaseAdapter$CameraId;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/LinkedHashSet<",
            "Landroidx/camera/core/impl/CameraInternal;",
            ">;)",
            "Landroidx/camera/core/internal/CameraUseCaseAdapter$CameraId;"
        }
    .end annotation

    .line 196
    .local p0, "cameras":Ljava/util/LinkedHashSet;, "Ljava/util/LinkedHashSet<Landroidx/camera/core/impl/CameraInternal;>;"
    new-instance v0, Landroidx/camera/core/internal/CameraUseCaseAdapter$CameraId;

    invoke-direct {v0, p0}, Landroidx/camera/core/internal/CameraUseCaseAdapter$CameraId;-><init>(Ljava/util/LinkedHashSet;)V

    return-object v0
.end method

.method private getCameraMode()I
    .locals 3

    .line 407
    iget-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 408
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraCoordinator:Landroidx/camera/core/concurrent/CameraCoordinator;

    invoke-interface {v1}, Landroidx/camera/core/concurrent/CameraCoordinator;->getCameraOperatingMode()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    .line 410
    monitor-exit v0

    const/4 v0, 0x1

    return v0

    .line 412
    :cond_0
    monitor-exit v0

    .line 417
    const/4 v0, 0x0

    return v0

    .line 412
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private static getCaptureTypes(Landroidx/camera/core/UseCase;)Ljava/util/List;
    .locals 4
    .param p0, "useCase"    # Landroidx/camera/core/UseCase;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/UseCase;",
            ")",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;",
            ">;"
        }
    .end annotation

    .line 732
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 733
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;>;"
    invoke-static {p0}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->isStreamSharing(Landroidx/camera/core/UseCase;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 734
    move-object v1, p0

    check-cast v1, Landroidx/camera/core/streamsharing/StreamSharing;

    invoke-virtual {v1}, Landroidx/camera/core/streamsharing/StreamSharing;->getChildren()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/UseCase;

    .line 735
    .local v2, "child":Landroidx/camera/core/UseCase;
    invoke-virtual {v2}, Landroidx/camera/core/UseCase;->getCurrentConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v3

    invoke-interface {v3}, Landroidx/camera/core/impl/UseCaseConfig;->getCaptureType()Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 736
    .end local v2    # "child":Landroidx/camera/core/UseCase;
    goto :goto_0

    :cond_0
    goto :goto_1

    .line 738
    :cond_1
    invoke-virtual {p0}, Landroidx/camera/core/UseCase;->getCurrentConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v1

    invoke-interface {v1}, Landroidx/camera/core/impl/UseCaseConfig;->getCaptureType()Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 740
    :goto_1
    return-object v0
.end method

.method private getConfigs(Ljava/util/Collection;Landroidx/camera/core/impl/UseCaseConfigFactory;Landroidx/camera/core/impl/UseCaseConfigFactory;)Ljava/util/Map;
    .locals 6
    .param p2, "extendedFactory"    # Landroidx/camera/core/impl/UseCaseConfigFactory;
    .param p3, "cameraFactory"    # Landroidx/camera/core/impl/UseCaseConfigFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/UseCase;",
            ">;",
            "Landroidx/camera/core/impl/UseCaseConfigFactory;",
            "Landroidx/camera/core/impl/UseCaseConfigFactory;",
            ")",
            "Ljava/util/Map<",
            "Landroidx/camera/core/UseCase;",
            "Landroidx/camera/core/internal/CameraUseCaseAdapter$ConfigPair;",
            ">;"
        }
    .end annotation

    .line 834
    .local p1, "useCases":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/UseCase;>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 835
    .local v0, "configs":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/UseCase;Landroidx/camera/core/internal/CameraUseCaseAdapter$ConfigPair;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/UseCase;

    .line 836
    .local v2, "useCase":Landroidx/camera/core/UseCase;
    new-instance v3, Landroidx/camera/core/internal/CameraUseCaseAdapter$ConfigPair;

    const/4 v4, 0x0

    invoke-virtual {v2, v4, p2}, Landroidx/camera/core/UseCase;->getDefaultConfig(ZLandroidx/camera/core/impl/UseCaseConfigFactory;)Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v4

    .line 837
    const/4 v5, 0x1

    invoke-virtual {v2, v5, p3}, Landroidx/camera/core/UseCase;->getDefaultConfig(ZLandroidx/camera/core/impl/UseCaseConfigFactory;)Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Landroidx/camera/core/internal/CameraUseCaseAdapter$ConfigPair;-><init>(Landroidx/camera/core/impl/UseCaseConfig;Landroidx/camera/core/impl/UseCaseConfig;)V

    .line 836
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 838
    .end local v2    # "useCase":Landroidx/camera/core/UseCase;
    goto :goto_0

    .line 839
    :cond_0
    return-object v0
.end method

.method private getSharingTargets(Z)I
    .locals 7
    .param p1, "forceSharingToPreviewAndVideo"    # Z

    .line 445
    iget-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 447
    const/4 v1, 0x0

    .line 448
    .local v1, "sharingEffect":Landroidx/camera/core/CameraEffect;
    :try_start_0
    iget-object v2, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mEffects:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/CameraEffect;

    .line 449
    .local v3, "effect":Landroidx/camera/core/CameraEffect;
    invoke-virtual {v3}, Landroidx/camera/core/CameraEffect;->getTargets()I

    move-result v5

    invoke-static {v5}, Landroidx/camera/core/processing/TargetUtils;->getNumberOfTargets(I)I

    move-result v5

    const/4 v6, 0x1

    if-le v5, v6, :cond_1

    .line 450
    if-nez v1, :cond_0

    move v4, v6

    :cond_0
    const-string v5, "Can only have one sharing effect."

    invoke-static {v4, v5}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 451
    move-object v1, v3

    .line 453
    .end local v3    # "effect":Landroidx/camera/core/CameraEffect;
    :cond_1
    goto :goto_0

    .line 454
    :cond_2
    if-nez v1, :cond_3

    goto :goto_1

    :cond_3
    invoke-virtual {v1}, Landroidx/camera/core/CameraEffect;->getTargets()I

    move-result v4

    .line 457
    .local v4, "sharingTargets":I
    :goto_1
    if-eqz p1, :cond_4

    .line 458
    or-int/lit8 v4, v4, 0x3

    .line 460
    :cond_4
    monitor-exit v0

    return v4

    .line 461
    .end local v1    # "sharingEffect":Landroidx/camera/core/CameraEffect;
    .end local v4    # "sharingTargets":I
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private getStreamSharingChildren(Ljava/util/Collection;Z)Ljava/util/Set;
    .locals 6
    .param p2, "forceSharingToPreviewAndVideo"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/UseCase;",
            ">;Z)",
            "Ljava/util/Set<",
            "Landroidx/camera/core/UseCase;",
            ">;"
        }
    .end annotation

    .line 432
    .local p1, "appUseCases":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/UseCase;>;"
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 433
    .local v0, "children":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/UseCase;>;"
    invoke-direct {p0, p2}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->getSharingTargets(Z)I

    move-result v1

    .line 434
    .local v1, "sharingTargets":I
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/UseCase;

    .line 435
    .local v3, "useCase":Landroidx/camera/core/UseCase;
    invoke-static {v3}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->isStreamSharing(Landroidx/camera/core/UseCase;)Z

    move-result v4

    xor-int/lit8 v4, v4, 0x1

    const-string v5, "Only support one level of sharing for now."

    invoke-static {v4, v5}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 436
    invoke-virtual {v3, v1}, Landroidx/camera/core/UseCase;->isEffectTargetsSupported(I)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 437
    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 439
    .end local v3    # "useCase":Landroidx/camera/core/UseCase;
    :cond_0
    goto :goto_0

    .line 440
    :cond_1
    return-object v0
.end method

.method private static hasImplementationOptionChanged(Landroidx/camera/core/impl/StreamSpec;Landroidx/camera/core/impl/SessionConfig;)Z
    .locals 7
    .param p0, "streamSpec"    # Landroidx/camera/core/impl/StreamSpec;
    .param p1, "sessionConfig"    # Landroidx/camera/core/impl/SessionConfig;

    .line 390
    invoke-virtual {p0}, Landroidx/camera/core/impl/StreamSpec;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v0

    .line 391
    .local v0, "newStreamSpecOptions":Landroidx/camera/core/impl/Config;
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v1

    .line 392
    .local v1, "sessionConfigOptions":Landroidx/camera/core/impl/Config;
    invoke-interface {v0}, Landroidx/camera/core/impl/Config;->listOptions()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->size()I

    move-result v2

    .line 393
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v3

    invoke-interface {v3}, Landroidx/camera/core/impl/Config;->listOptions()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v3

    const/4 v4, 0x1

    if-eq v2, v3, :cond_0

    .line 394
    return v4

    .line 396
    :cond_0
    invoke-interface {v0}, Landroidx/camera/core/impl/Config;->listOptions()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/Config$Option;

    .line 397
    .local v3, "newOption":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<*>;"
    invoke-interface {v1, v3}, Landroidx/camera/core/impl/Config;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 398
    invoke-interface {v1, v3}, Landroidx/camera/core/impl/Config;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v5

    .line 399
    invoke-interface {v0, v3}, Landroidx/camera/core/impl/Config;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v6

    .line 398
    invoke-static {v5, v6}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    goto :goto_1

    .line 402
    .end local v3    # "newOption":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<*>;"
    :cond_1
    goto :goto_0

    .line 400
    .restart local v3    # "newOption":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<*>;"
    :cond_2
    :goto_1
    return v4

    .line 403
    .end local v3    # "newOption":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<*>;"
    :cond_3
    const/4 v2, 0x0

    return v2
.end method

.method private hasNoExtension()Z
    .locals 3

    .line 421
    iget-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 422
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraConfig:Landroidx/camera/core/impl/CameraConfig;

    invoke-static {}, Landroidx/camera/core/impl/CameraConfigs;->emptyConfig()Landroidx/camera/core/impl/CameraConfig;

    move-result-object v2

    if-ne v1, v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    monitor-exit v0

    return v1

    .line 423
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private isCoexistingPreviewImageCaptureRequired()Z
    .locals 3

    .line 995
    iget-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 996
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraConfig:Landroidx/camera/core/impl/CameraConfig;

    invoke-interface {v1}, Landroidx/camera/core/impl/CameraConfig;->getUseCaseCombinationRequiredRule()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    monitor-exit v0

    return v2

    .line 998
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private isExtraImageCaptureRequired(Ljava/util/Collection;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/UseCase;",
            ">;)Z"
        }
    .end annotation

    .line 1025
    .local p1, "useCases":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/UseCase;>;"
    const/4 v0, 0x0

    .line 1026
    .local v0, "hasPreview":Z
    const/4 v1, 0x0

    .line 1028
    .local v1, "hasImageCapture":Z
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/UseCase;

    .line 1029
    .local v3, "useCase":Landroidx/camera/core/UseCase;
    invoke-static {v3}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->isPreview(Landroidx/camera/core/UseCase;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1030
    const/4 v0, 0x1

    goto :goto_1

    .line 1031
    :cond_0
    invoke-static {v3}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->isImageCapture(Landroidx/camera/core/UseCase;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1032
    const/4 v1, 0x1

    .line 1034
    .end local v3    # "useCase":Landroidx/camera/core/UseCase;
    :cond_1
    :goto_1
    goto :goto_0

    .line 1036
    :cond_2
    if-eqz v0, :cond_3

    if-nez v1, :cond_3

    const/4 v2, 0x1

    goto :goto_2

    :cond_3
    const/4 v2, 0x0

    :goto_2
    return v2
.end method

.method private isExtraPreviewRequired(Ljava/util/Collection;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/UseCase;",
            ">;)Z"
        }
    .end annotation

    .line 1006
    .local p1, "useCases":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/UseCase;>;"
    const/4 v0, 0x0

    .line 1007
    .local v0, "hasPreview":Z
    const/4 v1, 0x0

    .line 1009
    .local v1, "hasImageCapture":Z
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/UseCase;

    .line 1010
    .local v3, "useCase":Landroidx/camera/core/UseCase;
    invoke-static {v3}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->isPreview(Landroidx/camera/core/UseCase;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1011
    const/4 v0, 0x1

    goto :goto_1

    .line 1012
    :cond_0
    invoke-static {v3}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->isImageCapture(Landroidx/camera/core/UseCase;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1013
    const/4 v1, 0x1

    .line 1015
    .end local v3    # "useCase":Landroidx/camera/core/UseCase;
    :cond_1
    :goto_1
    goto :goto_0

    .line 1017
    :cond_2
    if-eqz v1, :cond_3

    if-nez v0, :cond_3

    const/4 v2, 0x1

    goto :goto_2

    :cond_3
    const/4 v2, 0x0

    :goto_2
    return v2
.end method

.method private static isImageCapture(Landroidx/camera/core/UseCase;)Z
    .locals 1
    .param p0, "useCase"    # Landroidx/camera/core/UseCase;

    .line 1048
    instance-of v0, p0, Landroidx/camera/core/ImageCapture;

    return v0
.end method

.method private static isPreview(Landroidx/camera/core/UseCase;)Z
    .locals 1
    .param p0, "useCase"    # Landroidx/camera/core/UseCase;

    .line 1044
    instance-of v0, p0, Landroidx/camera/core/Preview;

    return v0
.end method

.method private static isStreamSharing(Landroidx/camera/core/UseCase;)Z
    .locals 1
    .param p0, "useCase"    # Landroidx/camera/core/UseCase;

    .line 1040
    instance-of v0, p0, Landroidx/camera/core/streamsharing/StreamSharing;

    return v0
.end method

.method static isStreamSharingChildrenCombinationValid(Ljava/util/Collection;)Z
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/UseCase;",
            ">;)Z"
        }
    .end annotation

    .line 501
    .local p0, "children":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/UseCase;>;"
    const/4 v0, 0x2

    const/4 v1, 0x4

    const/4 v2, 0x1

    filled-new-array {v2, v0, v1}, [I

    move-result-object v0

    .line 502
    .local v0, "validChildrenTypes":[I
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 504
    .local v1, "childrenTypes":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/core/UseCase;

    .line 505
    .local v4, "child":Landroidx/camera/core/UseCase;
    array-length v5, v0

    const/4 v6, 0x0

    move v7, v6

    :goto_1
    if-ge v7, v5, :cond_2

    aget v8, v0, v7

    .line 506
    .local v8, "type":I
    invoke-virtual {v4, v8}, Landroidx/camera/core/UseCase;->isEffectTargetsSupported(I)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 507
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v1, v9}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 509
    return v6

    .line 511
    :cond_0
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v1, v9}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 505
    .end local v8    # "type":I
    :cond_1
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 514
    .end local v4    # "child":Landroidx/camera/core/UseCase;
    :cond_2
    goto :goto_0

    .line 515
    :cond_3
    return v2
.end method

.method static synthetic lambda$createExtraPreview$0(Landroid/view/Surface;Landroid/graphics/SurfaceTexture;Landroidx/camera/core/SurfaceRequest$Result;)V
    .locals 0
    .param p0, "surface"    # Landroid/view/Surface;
    .param p1, "surfaceTexture"    # Landroid/graphics/SurfaceTexture;
    .param p2, "surfaceResponse"    # Landroidx/camera/core/SurfaceRequest$Result;

    .line 1064
    invoke-virtual {p0}, Landroid/view/Surface;->release()V

    .line 1065
    invoke-virtual {p1}, Landroid/graphics/SurfaceTexture;->release()V

    .line 1066
    return-void
.end method

.method static synthetic lambda$createExtraPreview$1(Landroidx/camera/core/SurfaceRequest;)V
    .locals 4
    .param p0, "surfaceRequest"    # Landroidx/camera/core/SurfaceRequest;

    .line 1056
    new-instance v0, Landroid/graphics/SurfaceTexture;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 1057
    .local v0, "surfaceTexture":Landroid/graphics/SurfaceTexture;
    invoke-virtual {p0}, Landroidx/camera/core/SurfaceRequest;->getResolution()Landroid/util/Size;

    move-result-object v1

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v1

    .line 1058
    invoke-virtual {p0}, Landroidx/camera/core/SurfaceRequest;->getResolution()Landroid/util/Size;

    move-result-object v2

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v2

    .line 1057
    invoke-virtual {v0, v1, v2}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 1059
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->detachFromGLContext()V

    .line 1060
    new-instance v1, Landroid/view/Surface;

    invoke-direct {v1, v0}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 1061
    .local v1, "surface":Landroid/view/Surface;
    nop

    .line 1062
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    new-instance v3, Landroidx/camera/core/internal/CameraUseCaseAdapter$$ExternalSyntheticLambda0;

    invoke-direct {v3, v1, v0}, Landroidx/camera/core/internal/CameraUseCaseAdapter$$ExternalSyntheticLambda0;-><init>(Landroid/view/Surface;Landroid/graphics/SurfaceTexture;)V

    .line 1061
    invoke-virtual {p0, v1, v2, v3}, Landroidx/camera/core/SurfaceRequest;->provideSurface(Landroid/view/Surface;Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;)V

    .line 1067
    return-void
.end method

.method private restoreInteropConfig()V
    .locals 3

    .line 614
    iget-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 615
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mInteropConfig:Landroidx/camera/core/impl/Config;

    if-eqz v1, :cond_0

    .line 616
    iget-object v1, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    invoke-interface {v1}, Landroidx/camera/core/impl/CameraInternal;->getCameraControlInternal()Landroidx/camera/core/impl/CameraControlInternal;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mInteropConfig:Landroidx/camera/core/impl/Config;

    invoke-interface {v1, v2}, Landroidx/camera/core/impl/CameraControlInternal;->addInteropConfig(Landroidx/camera/core/impl/Config;)V

    .line 618
    :cond_0
    monitor-exit v0

    .line 619
    return-void

    .line 618
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private static setEffectsOnUseCases(Ljava/util/List;Ljava/util/Collection;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/CameraEffect;",
            ">;",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/UseCase;",
            ">;)",
            "Ljava/util/List<",
            "Landroidx/camera/core/CameraEffect;",
            ">;"
        }
    .end annotation

    .line 749
    .local p0, "effects":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/CameraEffect;>;"
    .local p1, "useCases":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/UseCase;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 750
    .local v0, "unusedEffects":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/CameraEffect;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/UseCase;

    .line 751
    .local v2, "useCase":Landroidx/camera/core/UseCase;
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroidx/camera/core/UseCase;->setEffect(Landroidx/camera/core/CameraEffect;)V

    .line 752
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/core/CameraEffect;

    .line 753
    .local v4, "effect":Landroidx/camera/core/CameraEffect;
    invoke-virtual {v4}, Landroidx/camera/core/CameraEffect;->getTargets()I

    move-result v5

    invoke-virtual {v2, v5}, Landroidx/camera/core/UseCase;->isEffectTargetsSupported(I)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 754
    invoke-virtual {v2}, Landroidx/camera/core/UseCase;->getEffect()Landroidx/camera/core/CameraEffect;

    move-result-object v5

    if-nez v5, :cond_0

    const/4 v5, 0x1

    goto :goto_2

    :cond_0
    const/4 v5, 0x0

    :goto_2
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " already has effect"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 755
    invoke-virtual {v2}, Landroidx/camera/core/UseCase;->getEffect()Landroidx/camera/core/CameraEffect;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 754
    invoke-static {v5, v6}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 756
    invoke-virtual {v2, v4}, Landroidx/camera/core/UseCase;->setEffect(Landroidx/camera/core/CameraEffect;)V

    .line 757
    invoke-interface {v0, v4}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 759
    .end local v4    # "effect":Landroidx/camera/core/CameraEffect;
    :cond_1
    goto :goto_1

    .line 760
    .end local v2    # "useCase":Landroidx/camera/core/UseCase;
    :cond_2
    goto :goto_0

    .line 761
    :cond_3
    return-object v0
.end method

.method static updateEffects(Ljava/util/List;Ljava/util/Collection;Ljava/util/Collection;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/CameraEffect;",
            ">;",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/UseCase;",
            ">;",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/UseCase;",
            ">;)V"
        }
    .end annotation

    .line 718
    .local p0, "effects":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/CameraEffect;>;"
    .local p1, "cameraUseCases":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/UseCase;>;"
    .local p2, "appUseCases":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/UseCase;>;"
    invoke-static {p0, p1}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->setEffectsOnUseCases(Ljava/util/List;Ljava/util/Collection;)Ljava/util/List;

    move-result-object v0

    .line 721
    .local v0, "unusedEffects":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/CameraEffect;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 722
    .local v1, "appOnlyUseCases":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/UseCase;>;"
    invoke-interface {v1, p1}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 723
    invoke-static {v0, v1}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->setEffectsOnUseCases(Ljava/util/List;Ljava/util/Collection;)Ljava/util/List;

    move-result-object v0

    .line 725
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_0

    .line 726
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Unused effects: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "CameraUseCaseAdapter"

    invoke-static {v3, v2}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 728
    :cond_0
    return-void
.end method

.method private updateViewPort(Ljava/util/Map;Ljava/util/Collection;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Landroidx/camera/core/UseCase;",
            "Landroidx/camera/core/impl/StreamSpec;",
            ">;",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/UseCase;",
            ">;)V"
        }
    .end annotation

    .line 766
    .local p1, "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/UseCase;Landroidx/camera/core/impl/StreamSpec;>;"
    .local p2, "useCases":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/UseCase;>;"
    iget-object v1, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 767
    :try_start_0
    iget-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mViewPort:Landroidx/camera/core/ViewPort;

    if-eqz v0, :cond_2

    .line 768
    iget-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraInternal;->getCameraInfoInternal()Landroidx/camera/core/impl/CameraInfoInternal;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraInfoInternal;->getLensFacing()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 770
    .local v0, "lensFacing":Ljava/lang/Integer;
    if-nez v0, :cond_0

    .line 774
    :try_start_1
    const-string v2, "CameraUseCaseAdapter"

    const-string/jumbo v3, "The lens facing is null, probably an external."

    invoke-static {v2, v3}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 775
    const/4 v2, 0x1

    move v4, v2

    .local v2, "isFrontCamera":Z
    goto :goto_1

    .line 799
    .end local v0    # "lensFacing":Ljava/lang/Integer;
    .end local v2    # "isFrontCamera":Z
    :catchall_0
    move-exception v0

    move-object v9, p1

    goto/16 :goto_3

    .line 777
    .restart local v0    # "lensFacing":Ljava/lang/Integer;
    :cond_0
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-nez v2, :cond_1

    const/4 v2, 0x1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    move v4, v2

    .line 780
    .local v4, "isFrontCamera":Z
    :goto_1
    iget-object v2, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    .line 781
    invoke-interface {v2}, Landroidx/camera/core/impl/CameraInternal;->getCameraControlInternal()Landroidx/camera/core/impl/CameraControlInternal;

    move-result-object v2

    invoke-interface {v2}, Landroidx/camera/core/impl/CameraControlInternal;->getSensorRect()Landroid/graphics/Rect;

    move-result-object v3

    iget-object v2, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mViewPort:Landroidx/camera/core/ViewPort;

    .line 783
    invoke-virtual {v2}, Landroidx/camera/core/ViewPort;->getAspectRatio()Landroid/util/Rational;

    move-result-object v5

    iget-object v2, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    .line 784
    invoke-interface {v2}, Landroidx/camera/core/impl/CameraInternal;->getCameraInfoInternal()Landroidx/camera/core/impl/CameraInfoInternal;

    move-result-object v2

    iget-object v6, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mViewPort:Landroidx/camera/core/ViewPort;

    .line 785
    invoke-virtual {v6}, Landroidx/camera/core/ViewPort;->getRotation()I

    move-result v6

    .line 784
    invoke-interface {v2, v6}, Landroidx/camera/core/impl/CameraInfoInternal;->getSensorRotationDegrees(I)I

    move-result v6

    iget-object v2, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mViewPort:Landroidx/camera/core/ViewPort;

    .line 786
    invoke-virtual {v2}, Landroidx/camera/core/ViewPort;->getScaleType()I

    move-result v7

    iget-object v2, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mViewPort:Landroidx/camera/core/ViewPort;

    .line 787
    invoke-virtual {v2}, Landroidx/camera/core/ViewPort;->getLayoutDirection()I

    move-result v8
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 780
    move-object v9, p1

    .end local p1    # "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/UseCase;Landroidx/camera/core/impl/StreamSpec;>;"
    .local v9, "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/UseCase;Landroidx/camera/core/impl/StreamSpec;>;"
    :try_start_3
    invoke-static/range {v3 .. v9}, Landroidx/camera/core/internal/ViewPorts;->calculateViewPortRects(Landroid/graphics/Rect;ZLandroid/util/Rational;IIILjava/util/Map;)Ljava/util/Map;

    move-result-object p1

    .line 789
    .local p1, "cropRectMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/UseCase;Landroid/graphics/Rect;>;"
    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/UseCase;

    .line 790
    .local v3, "useCase":Landroidx/camera/core/UseCase;
    nop

    .line 791
    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/graphics/Rect;

    invoke-static {v5}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/graphics/Rect;

    .line 790
    invoke-virtual {v3, v5}, Landroidx/camera/core/UseCase;->setViewPortCropRect(Landroid/graphics/Rect;)V

    .line 792
    iget-object v5, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    .line 794
    invoke-interface {v5}, Landroidx/camera/core/impl/CameraInternal;->getCameraControlInternal()Landroidx/camera/core/impl/CameraControlInternal;

    move-result-object v5

    invoke-interface {v5}, Landroidx/camera/core/impl/CameraControlInternal;->getSensorRect()Landroid/graphics/Rect;

    move-result-object v5

    .line 796
    invoke-interface {v9, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/camera/core/impl/StreamSpec;

    .line 795
    invoke-static {v6}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/camera/core/impl/StreamSpec;

    .line 796
    invoke-virtual {v6}, Landroidx/camera/core/impl/StreamSpec;->getResolution()Landroid/util/Size;

    move-result-object v6

    .line 793
    invoke-static {v5, v6}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->calculateSensorToBufferTransformMatrix(Landroid/graphics/Rect;Landroid/util/Size;)Landroid/graphics/Matrix;

    move-result-object v5

    .line 792
    invoke-virtual {v3, v5}, Landroidx/camera/core/UseCase;->setSensorToBufferTransformMatrix(Landroid/graphics/Matrix;)V

    .line 797
    .end local v3    # "useCase":Landroidx/camera/core/UseCase;
    goto :goto_2

    .line 767
    .end local v0    # "lensFacing":Ljava/lang/Integer;
    .end local v4    # "isFrontCamera":Z
    .end local v9    # "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/UseCase;Landroidx/camera/core/impl/StreamSpec;>;"
    .local p1, "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/UseCase;Landroidx/camera/core/impl/StreamSpec;>;"
    :cond_2
    move-object v9, p1

    .line 799
    .end local p1    # "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/UseCase;Landroidx/camera/core/impl/StreamSpec;>;"
    .restart local v9    # "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/UseCase;Landroidx/camera/core/impl/StreamSpec;>;"
    :cond_3
    monitor-exit v1

    .line 800
    return-void

    .line 799
    .end local v9    # "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/UseCase;Landroidx/camera/core/impl/StreamSpec;>;"
    .restart local p1    # "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/UseCase;Landroidx/camera/core/impl/StreamSpec;>;"
    :catchall_1
    move-exception v0

    move-object v9, p1

    .end local p1    # "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/UseCase;Landroidx/camera/core/impl/StreamSpec;>;"
    .restart local v9    # "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/UseCase;Landroidx/camera/core/impl/StreamSpec;>;"
    :goto_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    throw v0

    :catchall_2
    move-exception v0

    goto :goto_3
.end method


# virtual methods
.method public addUseCases(Ljava/util/Collection;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/UseCase;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/internal/CameraUseCaseAdapter$CameraException;
        }
    .end annotation

    .line 239
    .local p1, "appUseCasesToAdd":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/UseCase;>;"
    iget-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 240
    :try_start_0
    new-instance v1, Ljava/util/LinkedHashSet;

    iget-object v2, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mAppUseCases:Ljava/util/List;

    invoke-direct {v1, v2}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    .line 243
    .local v1, "appUseCases":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/UseCase;>;"
    invoke-interface {v1, p1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 245
    :try_start_1
    invoke-virtual {p0, v1}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->updateUseCases(Ljava/util/Collection;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 248
    nop

    .line 249
    .end local v1    # "appUseCases":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/UseCase;>;"
    :try_start_2
    monitor-exit v0

    .line 250
    return-void

    .line 246
    .restart local v1    # "appUseCases":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/UseCase;>;"
    :catch_0
    move-exception v2

    .line 247
    .local v2, "e":Ljava/lang/IllegalArgumentException;
    new-instance v3, Landroidx/camera/core/internal/CameraUseCaseAdapter$CameraException;

    invoke-virtual {v2}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Landroidx/camera/core/internal/CameraUseCaseAdapter$CameraException;-><init>(Ljava/lang/String;)V

    .end local p1    # "appUseCasesToAdd":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/UseCase;>;"
    throw v3

    .line 249
    .end local v1    # "appUseCases":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/UseCase;>;"
    .end local v2    # "e":Ljava/lang/IllegalArgumentException;
    .restart local p1    # "appUseCasesToAdd":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/UseCase;>;"
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method public attachUseCases()V
    .locals 3

    .line 565
    iget-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 566
    :try_start_0
    iget-boolean v1, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mAttached:Z

    if-nez v1, :cond_1

    .line 567
    iget-object v1, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    iget-object v2, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraUseCases:Ljava/util/List;

    invoke-interface {v1, v2}, Landroidx/camera/core/impl/CameraInternal;->attachUseCases(Ljava/util/Collection;)V

    .line 568
    invoke-direct {p0}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->restoreInteropConfig()V

    .line 572
    iget-object v1, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraUseCases:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/UseCase;

    .line 573
    .local v2, "useCase":Landroidx/camera/core/UseCase;
    invoke-virtual {v2}, Landroidx/camera/core/UseCase;->notifyState()V

    .line 574
    .end local v2    # "useCase":Landroidx/camera/core/UseCase;
    goto :goto_0

    .line 576
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mAttached:Z

    .line 578
    :cond_1
    monitor-exit v0

    .line 579
    return-void

    .line 578
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method calculatePlaceholderForExtensions(Ljava/util/Collection;)Landroidx/camera/core/UseCase;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/UseCase;",
            ">;)",
            "Landroidx/camera/core/UseCase;"
        }
    .end annotation

    .line 973
    .local p1, "appUseCases":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/UseCase;>;"
    iget-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 974
    const/4 v1, 0x0

    .line 975
    .local v1, "placeholder":Landroidx/camera/core/UseCase;
    :try_start_0
    invoke-direct {p0}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->isCoexistingPreviewImageCaptureRequired()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 976
    invoke-direct {p0, p1}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->isExtraPreviewRequired(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 977
    iget-object v2, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mPlaceholderForExtensions:Landroidx/camera/core/UseCase;

    invoke-static {v2}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->isPreview(Landroidx/camera/core/UseCase;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 978
    iget-object v2, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mPlaceholderForExtensions:Landroidx/camera/core/UseCase;

    move-object v1, v2

    goto :goto_0

    .line 980
    :cond_0
    invoke-direct {p0}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->createExtraPreview()Landroidx/camera/core/Preview;

    move-result-object v2

    move-object v1, v2

    goto :goto_0

    .line 982
    :cond_1
    invoke-direct {p0, p1}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->isExtraImageCaptureRequired(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 983
    iget-object v2, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mPlaceholderForExtensions:Landroidx/camera/core/UseCase;

    invoke-static {v2}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->isImageCapture(Landroidx/camera/core/UseCase;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 984
    iget-object v2, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mPlaceholderForExtensions:Landroidx/camera/core/UseCase;

    move-object v1, v2

    goto :goto_0

    .line 986
    :cond_2
    invoke-direct {p0}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->createExtraImageCapture()Landroidx/camera/core/ImageCapture;

    move-result-object v2

    move-object v1, v2

    .line 990
    :cond_3
    :goto_0
    monitor-exit v0

    return-object v1

    .line 991
    .end local v1    # "placeholder":Landroidx/camera/core/UseCase;
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public detachUseCases()V
    .locals 4

    .line 601
    iget-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 602
    :try_start_0
    iget-boolean v1, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mAttached:Z

    if-eqz v1, :cond_0

    .line 603
    iget-object v1, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraUseCases:Ljava/util/List;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-interface {v1, v2}, Landroidx/camera/core/impl/CameraInternal;->detachUseCases(Ljava/util/Collection;)V

    .line 604
    invoke-direct {p0}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->cacheInteropConfig()V

    .line 605
    const/4 v1, 0x0

    iput-boolean v1, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mAttached:Z

    .line 607
    :cond_0
    monitor-exit v0

    .line 608
    return-void

    .line 607
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getCameraControl()Landroidx/camera/core/CameraControl;
    .locals 1

    .line 896
    iget-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mRestrictedCameraControl:Landroidx/camera/core/impl/RestrictedCameraControl;

    return-object v0
.end method

.method public getCameraId()Landroidx/camera/core/internal/CameraUseCaseAdapter$CameraId;
    .locals 1

    .line 204
    iget-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mId:Landroidx/camera/core/internal/CameraUseCaseAdapter$CameraId;

    return-object v0
.end method

.method public getCameraInfo()Landroidx/camera/core/CameraInfo;
    .locals 1

    .line 902
    iget-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mRestrictedCameraInfo:Landroidx/camera/core/impl/RestrictedCameraInfo;

    return-object v0
.end method

.method public getCameraInternals()Ljava/util/LinkedHashSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/LinkedHashSet<",
            "Landroidx/camera/core/impl/CameraInternal;",
            ">;"
        }
    .end annotation

    .line 908
    iget-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraInternals:Ljava/util/LinkedHashSet;

    return-object v0
.end method

.method getCameraUseCases()Ljava/util/Collection;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/UseCase;",
            ">;"
        }
    .end annotation

    .line 551
    iget-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 552
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraUseCases:Ljava/util/List;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    monitor-exit v0

    return-object v1

    .line 553
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getExtendedConfig()Landroidx/camera/core/impl/CameraConfig;
    .locals 2

    .line 914
    iget-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 915
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraConfig:Landroidx/camera/core/impl/CameraConfig;

    monitor-exit v0

    return-object v1

    .line 916
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getUseCases()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/camera/core/UseCase;",
            ">;"
        }
    .end annotation

    .line 543
    iget-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 544
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mAppUseCases:Ljava/util/List;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    monitor-exit v0

    return-object v1

    .line 545
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public isEquivalent(Landroidx/camera/core/internal/CameraUseCaseAdapter;)Z
    .locals 2
    .param p1, "cameraUseCaseAdapter"    # Landroidx/camera/core/internal/CameraUseCaseAdapter;

    .line 211
    iget-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mId:Landroidx/camera/core/internal/CameraUseCaseAdapter$CameraId;

    invoke-virtual {p1}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->getCameraId()Landroidx/camera/core/internal/CameraUseCaseAdapter$CameraId;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/core/internal/CameraUseCaseAdapter$CameraId;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public varargs isUseCasesCombinationSupported([Landroidx/camera/core/UseCase;)Z
    .locals 8
    .param p1, "useCases"    # [Landroidx/camera/core/UseCase;

    .line 949
    iget-object v1, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 952
    :try_start_0
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iget-object v2, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraConfig:Landroidx/camera/core/impl/CameraConfig;

    .line 953
    invoke-interface {v2}, Landroidx/camera/core/impl/CameraConfig;->getUseCaseConfigFactory()Landroidx/camera/core/impl/UseCaseConfigFactory;

    move-result-object v2

    iget-object v3, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mUseCaseConfigFactory:Landroidx/camera/core/impl/UseCaseConfigFactory;

    .line 952
    invoke-direct {p0, v0, v2, v3}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->getConfigs(Ljava/util/Collection;Landroidx/camera/core/impl/UseCaseConfigFactory;Landroidx/camera/core/impl/UseCaseConfigFactory;)Ljava/util/Map;

    move-result-object v0

    move-object v7, v0

    .line 954
    .local v7, "configs":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/UseCase;Landroidx/camera/core/internal/CameraUseCaseAdapter$ConfigPair;>;"
    nop

    .line 955
    invoke-direct {p0}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->getCameraMode()I

    move-result v3

    iget-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    .line 956
    invoke-interface {v0}, Landroidx/camera/core/impl/CameraInternal;->getCameraInfoInternal()Landroidx/camera/core/impl/CameraInfoInternal;

    move-result-object v4

    .line 957
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v6

    .line 954
    move-object v2, p0

    invoke-direct/range {v2 .. v7}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->calculateSuggestedStreamSpecs(ILandroidx/camera/core/impl/CameraInfoInternal;Ljava/util/Collection;Ljava/util/Collection;Ljava/util/Map;)Ljava/util/Map;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 960
    .end local v7    # "configs":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/UseCase;Landroidx/camera/core/internal/CameraUseCaseAdapter$ConfigPair;>;"
    nop

    .line 962
    :try_start_1
    monitor-exit v1

    const/4 v0, 0x1

    return v0

    .line 963
    :catchall_0
    move-exception v0

    goto :goto_0

    .line 958
    :catch_0
    move-exception v0

    .line 959
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    monitor-exit v1

    const/4 v1, 0x0

    return v1

    .line 963
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :goto_0
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public removeUseCases(Ljava/util/Collection;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/UseCase;",
            ">;)V"
        }
    .end annotation

    .line 256
    .local p1, "useCasesToRemove":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/UseCase;>;"
    iget-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 257
    :try_start_0
    new-instance v1, Ljava/util/LinkedHashSet;

    iget-object v2, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mAppUseCases:Ljava/util/List;

    invoke-direct {v1, v2}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    .line 258
    .local v1, "appUseCases":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/UseCase;>;"
    invoke-interface {v1, p1}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    .line 259
    invoke-virtual {p0, v1}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->updateUseCases(Ljava/util/Collection;)V

    .line 260
    .end local v1    # "appUseCases":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/UseCase;>;"
    monitor-exit v0

    .line 261
    return-void

    .line 260
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public setActiveResumingMode(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .line 590
    iget-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    invoke-interface {v0, p1}, Landroidx/camera/core/impl/CameraInternal;->setActiveResumingMode(Z)V

    .line 591
    return-void
.end method

.method public setEffects(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/CameraEffect;",
            ">;)V"
        }
    .end annotation

    .line 227
    .local p1, "effects":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/CameraEffect;>;"
    iget-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 228
    :try_start_0
    iput-object p1, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mEffects:Ljava/util/List;

    .line 229
    monitor-exit v0

    .line 230
    return-void

    .line 229
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public setExtendedConfig(Landroidx/camera/core/impl/CameraConfig;)V
    .locals 5
    .param p1, "cameraConfig"    # Landroidx/camera/core/impl/CameraConfig;

    .line 921
    iget-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 922
    if-nez p1, :cond_0

    .line 923
    :try_start_0
    invoke-static {}, Landroidx/camera/core/impl/CameraConfigs;->emptyConfig()Landroidx/camera/core/impl/CameraConfig;

    move-result-object v1

    move-object p1, v1

    .line 926
    :cond_0
    iget-object v1, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mAppUseCases:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraConfig:Landroidx/camera/core/impl/CameraConfig;

    invoke-interface {v1}, Landroidx/camera/core/impl/CameraConfig;->getCompatibilityId()Landroidx/camera/core/impl/Identifier;

    move-result-object v1

    .line 927
    invoke-interface {p1}, Landroidx/camera/core/impl/CameraConfig;->getCompatibilityId()Landroidx/camera/core/impl/Identifier;

    move-result-object v2

    .line 926
    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    .line 928
    :cond_1
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Need to unbind all use cases before binding with extension enabled"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local p1    # "cameraConfig":Landroidx/camera/core/impl/CameraConfig;
    throw v1

    .line 932
    .restart local p1    # "cameraConfig":Landroidx/camera/core/impl/CameraConfig;
    :cond_2
    :goto_0
    iput-object p1, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraConfig:Landroidx/camera/core/impl/CameraConfig;

    .line 933
    iget-object v1, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraConfig:Landroidx/camera/core/impl/CameraConfig;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Landroidx/camera/core/impl/CameraConfig;->getSessionProcessor(Landroidx/camera/core/impl/SessionProcessor;)Landroidx/camera/core/impl/SessionProcessor;

    move-result-object v1

    .line 934
    .local v1, "sessionProcessor":Landroidx/camera/core/impl/SessionProcessor;
    if-eqz v1, :cond_3

    .line 935
    nop

    .line 936
    invoke-interface {v1}, Landroidx/camera/core/impl/SessionProcessor;->getSupportedCameraOperations()Ljava/util/Set;

    move-result-object v2

    .line 937
    .local v2, "supportedOps":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    iget-object v3, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mRestrictedCameraControl:Landroidx/camera/core/impl/RestrictedCameraControl;

    const/4 v4, 0x1

    invoke-virtual {v3, v4, v2}, Landroidx/camera/core/impl/RestrictedCameraControl;->enableRestrictedOperations(ZLjava/util/Set;)V

    .line 938
    .end local v2    # "supportedOps":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    goto :goto_1

    .line 939
    :cond_3
    iget-object v3, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mRestrictedCameraControl:Landroidx/camera/core/impl/RestrictedCameraControl;

    const/4 v4, 0x0

    invoke-virtual {v3, v4, v2}, Landroidx/camera/core/impl/RestrictedCameraControl;->enableRestrictedOperations(ZLjava/util/Set;)V

    .line 943
    :goto_1
    iget-object v2, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    iget-object v3, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraConfig:Landroidx/camera/core/impl/CameraConfig;

    invoke-interface {v2, v3}, Landroidx/camera/core/impl/CameraInternal;->setExtendedConfig(Landroidx/camera/core/impl/CameraConfig;)V

    .line 944
    .end local v1    # "sessionProcessor":Landroidx/camera/core/impl/SessionProcessor;
    monitor-exit v0

    .line 945
    return-void

    .line 944
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public setViewPort(Landroidx/camera/core/ViewPort;)V
    .locals 2
    .param p1, "viewPort"    # Landroidx/camera/core/ViewPort;

    .line 218
    iget-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 219
    :try_start_0
    iput-object p1, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mViewPort:Landroidx/camera/core/ViewPort;

    .line 220
    monitor-exit v0

    .line 221
    return-void

    .line 220
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method updateUseCases(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/UseCase;",
            ">;)V"
        }
    .end annotation

    .line 267
    .local p1, "appUseCases":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/UseCase;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->updateUseCases(Ljava/util/Collection;Z)V

    .line 268
    return-void
.end method

.method updateUseCases(Ljava/util/Collection;Z)V
    .locals 17
    .param p2, "applyStreamSharing"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/UseCase;",
            ">;Z)V"
        }
    .end annotation

    .line 281
    .local p1, "appUseCases":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/UseCase;>;"
    move-object/from16 v1, p0

    move-object/from16 v7, p1

    iget-object v8, v1, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mLock:Ljava/lang/Object;

    monitor-enter v8

    .line 284
    :try_start_0
    invoke-virtual/range {p0 .. p1}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->calculatePlaceholderForExtensions(Ljava/util/Collection;)Landroidx/camera/core/UseCase;

    move-result-object v0

    move-object v9, v0

    .line 285
    .local v9, "placeholderForExtensions":Landroidx/camera/core/UseCase;
    invoke-direct/range {p0 .. p2}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->createOrReuseStreamSharing(Ljava/util/Collection;Z)Landroidx/camera/core/streamsharing/StreamSharing;

    move-result-object v0

    move-object v10, v0

    .line 287
    .local v10, "streamSharing":Landroidx/camera/core/streamsharing/StreamSharing;
    nop

    .line 288
    invoke-static {v7, v9, v10}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->calculateCameraUseCases(Ljava/util/Collection;Landroidx/camera/core/UseCase;Landroidx/camera/core/streamsharing/StreamSharing;)Ljava/util/Collection;

    move-result-object v0

    move-object v11, v0

    .line 291
    .local v11, "cameraUseCases":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/UseCase;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4, v11}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 292
    .local v4, "cameraUseCasesToAttach":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/UseCase;>;"
    iget-object v0, v1, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraUseCases:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 293
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5, v11}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 294
    .local v5, "cameraUseCasesToKeep":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/UseCase;>;"
    iget-object v0, v1, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraUseCases:Ljava/util/List;

    invoke-interface {v5, v0}, Ljava/util/List;->retainAll(Ljava/util/Collection;)Z

    .line 295
    new-instance v0, Ljava/util/ArrayList;

    iget-object v2, v1, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraUseCases:Ljava/util/List;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object v12, v0

    .line 296
    .local v12, "cameraUseCasesToDetach":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/UseCase;>;"
    invoke-interface {v12, v11}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 300
    iget-object v0, v1, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraConfig:Landroidx/camera/core/impl/CameraConfig;

    .line 301
    invoke-interface {v0}, Landroidx/camera/core/impl/CameraConfig;->getUseCaseConfigFactory()Landroidx/camera/core/impl/UseCaseConfigFactory;

    move-result-object v0

    iget-object v2, v1, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mUseCaseConfigFactory:Landroidx/camera/core/impl/UseCaseConfigFactory;

    .line 300
    invoke-direct {v1, v4, v0, v2}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->getConfigs(Ljava/util/Collection;Landroidx/camera/core/impl/UseCaseConfigFactory;Landroidx/camera/core/impl/UseCaseConfigFactory;)Ljava/util/Map;

    move-result-object v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 305
    .local v6, "configs":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/UseCase;Landroidx/camera/core/internal/CameraUseCaseAdapter$ConfigPair;>;"
    nop

    .line 306
    :try_start_1
    invoke-direct {v1}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->getCameraMode()I

    move-result v2

    iget-object v0, v1, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    .line 307
    invoke-interface {v0}, Landroidx/camera/core/impl/CameraInternal;->getCameraInfoInternal()Landroidx/camera/core/impl/CameraInfoInternal;

    move-result-object v3

    .line 305
    invoke-direct/range {v1 .. v6}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->calculateSuggestedStreamSpecs(ILandroidx/camera/core/impl/CameraInfoInternal;Ljava/util/Collection;Ljava/util/Collection;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 328
    .local v0, "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/UseCase;Landroidx/camera/core/impl/StreamSpec;>;"
    nop

    .line 331
    :try_start_2
    invoke-direct {v1, v0, v11}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->updateViewPort(Ljava/util/Map;Ljava/util/Collection;)V

    .line 332
    iget-object v2, v1, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mEffects:Ljava/util/List;

    invoke-static {v2, v11, v7}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->updateEffects(Ljava/util/List;Ljava/util/Collection;Ljava/util/Collection;)V

    .line 335
    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/UseCase;

    .line 336
    .local v3, "useCase":Landroidx/camera/core/UseCase;
    iget-object v13, v1, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    invoke-virtual {v3, v13}, Landroidx/camera/core/UseCase;->unbindFromCamera(Landroidx/camera/core/impl/CameraInternal;)V

    .line 337
    .end local v3    # "useCase":Landroidx/camera/core/UseCase;
    goto :goto_0

    .line 338
    :cond_0
    iget-object v2, v1, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    invoke-interface {v2, v12}, Landroidx/camera/core/impl/CameraInternal;->detachUseCases(Ljava/util/Collection;)V

    .line 341
    invoke-interface {v12}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    .line 344
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/UseCase;

    .line 345
    .restart local v3    # "useCase":Landroidx/camera/core/UseCase;
    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1

    .line 346
    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroidx/camera/core/impl/StreamSpec;

    .line 347
    .local v13, "newStreamSpec":Landroidx/camera/core/impl/StreamSpec;
    invoke-virtual {v13}, Landroidx/camera/core/impl/StreamSpec;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v14

    .line 348
    .local v14, "config":Landroidx/camera/core/impl/Config;
    if-eqz v14, :cond_1

    .line 349
    invoke-virtual {v3}, Landroidx/camera/core/UseCase;->getSessionConfig()Landroidx/camera/core/impl/SessionConfig;

    move-result-object v15

    .line 348
    invoke-static {v13, v15}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->hasImplementationOptionChanged(Landroidx/camera/core/impl/StreamSpec;Landroidx/camera/core/impl/SessionConfig;)Z

    move-result v15

    if-eqz v15, :cond_1

    .line 350
    invoke-virtual {v3, v14}, Landroidx/camera/core/UseCase;->updateSuggestedStreamSpecImplementationOptions(Landroidx/camera/core/impl/Config;)V

    .line 353
    .end local v3    # "useCase":Landroidx/camera/core/UseCase;
    .end local v13    # "newStreamSpec":Landroidx/camera/core/impl/StreamSpec;
    .end local v14    # "config":Landroidx/camera/core/impl/Config;
    :cond_1
    goto :goto_1

    .line 357
    :cond_2
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/UseCase;

    .line 358
    .restart local v3    # "useCase":Landroidx/camera/core/UseCase;
    invoke-interface {v6, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroidx/camera/core/internal/CameraUseCaseAdapter$ConfigPair;

    invoke-static {v13}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroidx/camera/core/internal/CameraUseCaseAdapter$ConfigPair;

    .line 359
    .local v13, "configPair":Landroidx/camera/core/internal/CameraUseCaseAdapter$ConfigPair;
    iget-object v14, v1, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    iget-object v15, v13, Landroidx/camera/core/internal/CameraUseCaseAdapter$ConfigPair;->mExtendedConfig:Landroidx/camera/core/impl/UseCaseConfig;

    move-object/from16 v16, v2

    iget-object v2, v13, Landroidx/camera/core/internal/CameraUseCaseAdapter$ConfigPair;->mCameraConfig:Landroidx/camera/core/impl/UseCaseConfig;

    invoke-virtual {v3, v14, v15, v2}, Landroidx/camera/core/UseCase;->bindToCamera(Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/core/impl/UseCaseConfig;Landroidx/camera/core/impl/UseCaseConfig;)V

    .line 361
    nop

    .line 362
    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/StreamSpec;

    invoke-static {v2}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/StreamSpec;

    .line 361
    invoke-virtual {v3, v2}, Landroidx/camera/core/UseCase;->updateSuggestedStreamSpec(Landroidx/camera/core/impl/StreamSpec;)V

    .line 363
    .end local v3    # "useCase":Landroidx/camera/core/UseCase;
    .end local v13    # "configPair":Landroidx/camera/core/internal/CameraUseCaseAdapter$ConfigPair;
    move-object/from16 v2, v16

    goto :goto_2

    .line 364
    :cond_3
    iget-boolean v2, v1, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mAttached:Z

    if-eqz v2, :cond_4

    .line 365
    iget-object v2, v1, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    invoke-interface {v2, v4}, Landroidx/camera/core/impl/CameraInternal;->attachUseCases(Ljava/util/Collection;)V

    .line 369
    :cond_4
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/UseCase;

    .line 370
    .restart local v3    # "useCase":Landroidx/camera/core/UseCase;
    invoke-virtual {v3}, Landroidx/camera/core/UseCase;->notifyState()V

    .line 371
    .end local v3    # "useCase":Landroidx/camera/core/UseCase;
    goto :goto_3

    .line 374
    :cond_5
    iget-object v2, v1, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mAppUseCases:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 375
    iget-object v2, v1, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mAppUseCases:Ljava/util/List;

    invoke-interface {v2, v7}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 376
    iget-object v2, v1, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraUseCases:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 377
    iget-object v2, v1, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraUseCases:Ljava/util/List;

    invoke-interface {v2, v11}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 378
    iput-object v9, v1, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mPlaceholderForExtensions:Landroidx/camera/core/UseCase;

    .line 379
    iput-object v10, v1, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mStreamSharing:Landroidx/camera/core/streamsharing/StreamSharing;

    .line 380
    .end local v0    # "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/UseCase;Landroidx/camera/core/impl/StreamSpec;>;"
    .end local v4    # "cameraUseCasesToAttach":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/UseCase;>;"
    .end local v5    # "cameraUseCasesToKeep":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/UseCase;>;"
    .end local v6    # "configs":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/UseCase;Landroidx/camera/core/internal/CameraUseCaseAdapter$ConfigPair;>;"
    .end local v9    # "placeholderForExtensions":Landroidx/camera/core/UseCase;
    .end local v10    # "streamSharing":Landroidx/camera/core/streamsharing/StreamSharing;
    .end local v11    # "cameraUseCases":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/UseCase;>;"
    .end local v12    # "cameraUseCasesToDetach":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/UseCase;>;"
    monitor-exit v8

    .line 381
    return-void

    .line 312
    .restart local v4    # "cameraUseCasesToAttach":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/UseCase;>;"
    .restart local v5    # "cameraUseCasesToKeep":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/UseCase;>;"
    .restart local v6    # "configs":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/UseCase;Landroidx/camera/core/internal/CameraUseCaseAdapter$ConfigPair;>;"
    .restart local v9    # "placeholderForExtensions":Landroidx/camera/core/UseCase;
    .restart local v10    # "streamSharing":Landroidx/camera/core/streamsharing/StreamSharing;
    .restart local v11    # "cameraUseCases":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/UseCase;>;"
    .restart local v12    # "cameraUseCasesToDetach":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/UseCase;>;"
    :catch_0
    move-exception v0

    .line 318
    .local v0, "exception":Ljava/lang/IllegalArgumentException;
    if-nez p2, :cond_6

    invoke-direct {v1}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->hasNoExtension()Z

    move-result v2

    if-eqz v2, :cond_6

    iget-object v2, v1, Landroidx/camera/core/internal/CameraUseCaseAdapter;->mCameraCoordinator:Landroidx/camera/core/concurrent/CameraCoordinator;

    .line 319
    invoke-interface {v2}, Landroidx/camera/core/concurrent/CameraCoordinator;->getCameraOperatingMode()I

    move-result v2

    const/4 v3, 0x2

    if-eq v2, v3, :cond_6

    .line 322
    const/4 v2, 0x1

    invoke-virtual {v1, v7, v2}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->updateUseCases(Ljava/util/Collection;Z)V

    .line 323
    monitor-exit v8

    return-void

    .line 326
    :cond_6
    nop

    .end local p1    # "appUseCases":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/UseCase;>;"
    .end local p2    # "applyStreamSharing":Z
    throw v0

    .line 380
    .end local v0    # "exception":Ljava/lang/IllegalArgumentException;
    .end local v4    # "cameraUseCasesToAttach":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/UseCase;>;"
    .end local v5    # "cameraUseCasesToKeep":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/UseCase;>;"
    .end local v6    # "configs":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/UseCase;Landroidx/camera/core/internal/CameraUseCaseAdapter$ConfigPair;>;"
    .end local v9    # "placeholderForExtensions":Landroidx/camera/core/UseCase;
    .end local v10    # "streamSharing":Landroidx/camera/core/streamsharing/StreamSharing;
    .end local v11    # "cameraUseCases":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/UseCase;>;"
    .end local v12    # "cameraUseCasesToDetach":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/UseCase;>;"
    .restart local p1    # "appUseCases":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/UseCase;>;"
    .restart local p2    # "applyStreamSharing":Z
    :catchall_0
    move-exception v0

    monitor-exit v8
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0
.end method
