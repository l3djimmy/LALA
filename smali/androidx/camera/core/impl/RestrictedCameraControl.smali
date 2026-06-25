.class public Landroidx/camera/core/impl/RestrictedCameraControl;
.super Landroidx/camera/core/impl/ForwardingCameraControl;
.source "RestrictedCameraControl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/impl/RestrictedCameraControl$CameraOperation;
    }
.end annotation


# static fields
.field public static final AE_REGION:I = 0x3

.field public static final AF_REGION:I = 0x2

.field public static final AUTO_FOCUS:I = 0x1

.field public static final AWB_REGION:I = 0x4

.field public static final EXPOSURE_COMPENSATION:I = 0x7

.field public static final FLASH:I = 0x5

.field public static final TORCH:I = 0x6

.field public static final ZOOM:I


# instance fields
.field private final mCameraControl:Landroidx/camera/core/impl/CameraControlInternal;

.field private volatile mRestrictedCameraOperations:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private volatile mUseRestrictedCameraOperations:Z


# direct methods
.method public constructor <init>(Landroidx/camera/core/impl/CameraControlInternal;)V
    .locals 1
    .param p1, "cameraControl"    # Landroidx/camera/core/impl/CameraControlInternal;

    .line 62
    invoke-direct {p0, p1}, Landroidx/camera/core/impl/ForwardingCameraControl;-><init>(Landroidx/camera/core/impl/CameraControlInternal;)V

    .line 54
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/core/impl/RestrictedCameraControl;->mUseRestrictedCameraOperations:Z

    .line 63
    iput-object p1, p0, Landroidx/camera/core/impl/RestrictedCameraControl;->mCameraControl:Landroidx/camera/core/impl/CameraControlInternal;

    .line 64
    return-void
.end method


# virtual methods
.method public cancelFocusAndMetering()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 126
    iget-object v0, p0, Landroidx/camera/core/impl/RestrictedCameraControl;->mCameraControl:Landroidx/camera/core/impl/CameraControlInternal;

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraControlInternal;->cancelFocusAndMetering()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method public enableRestrictedOperations(ZLjava/util/Set;)V
    .locals 0
    .param p1, "enable"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 72
    .local p2, "restrictedOperations":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    iput-boolean p1, p0, Landroidx/camera/core/impl/RestrictedCameraControl;->mUseRestrictedCameraOperations:Z

    .line 73
    iput-object p2, p0, Landroidx/camera/core/impl/RestrictedCameraControl;->mRestrictedCameraOperations:Ljava/util/Set;

    .line 74
    return-void
.end method

.method public enableTorch(Z)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 2
    .param p1, "torch"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 103
    const/4 v0, 0x6

    filled-new-array {v0}, [I

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/camera/core/impl/RestrictedCameraControl;->isOperationSupported([I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 104
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Torch is not supported"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0

    .line 107
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/impl/RestrictedCameraControl;->mCameraControl:Landroidx/camera/core/impl/CameraControlInternal;

    invoke-interface {v0, p1}, Landroidx/camera/core/impl/CameraControlInternal;->enableTorch(Z)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method public getImplementation()Landroidx/camera/core/impl/CameraControlInternal;
    .locals 1

    .line 82
    iget-object v0, p0, Landroidx/camera/core/impl/RestrictedCameraControl;->mCameraControl:Landroidx/camera/core/impl/CameraControlInternal;

    return-object v0
.end method

.method getModifiedFocusMeteringAction(Landroidx/camera/core/FocusMeteringAction;)Landroidx/camera/core/FocusMeteringAction;
    .locals 5
    .param p1, "action"    # Landroidx/camera/core/FocusMeteringAction;

    .line 165
    const/4 v0, 0x0

    .line 166
    .local v0, "shouldModify":Z
    new-instance v1, Landroidx/camera/core/FocusMeteringAction$Builder;

    invoke-direct {v1, p1}, Landroidx/camera/core/FocusMeteringAction$Builder;-><init>(Landroidx/camera/core/FocusMeteringAction;)V

    .line 167
    .local v1, "builder":Landroidx/camera/core/FocusMeteringAction$Builder;
    invoke-virtual {p1}, Landroidx/camera/core/FocusMeteringAction;->getMeteringPointsAf()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    const/4 v3, 0x2

    if-nez v2, :cond_0

    const/4 v2, 0x1

    filled-new-array {v2, v3}, [I

    move-result-object v4

    .line 168
    invoke-virtual {p0, v4}, Landroidx/camera/core/impl/RestrictedCameraControl;->isOperationSupported([I)Z

    move-result v4

    if-nez v4, :cond_0

    .line 169
    const/4 v0, 0x1

    .line 170
    invoke-virtual {v1, v2}, Landroidx/camera/core/FocusMeteringAction$Builder;->removePoints(I)Landroidx/camera/core/FocusMeteringAction$Builder;

    .line 173
    :cond_0
    invoke-virtual {p1}, Landroidx/camera/core/FocusMeteringAction;->getMeteringPointsAe()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    const/4 v2, 0x3

    filled-new-array {v2}, [I

    move-result-object v2

    .line 174
    invoke-virtual {p0, v2}, Landroidx/camera/core/impl/RestrictedCameraControl;->isOperationSupported([I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 175
    const/4 v0, 0x1

    .line 176
    invoke-virtual {v1, v3}, Landroidx/camera/core/FocusMeteringAction$Builder;->removePoints(I)Landroidx/camera/core/FocusMeteringAction$Builder;

    .line 179
    :cond_1
    invoke-virtual {p1}, Landroidx/camera/core/FocusMeteringAction;->getMeteringPointsAwb()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    const/4 v2, 0x4

    filled-new-array {v2}, [I

    move-result-object v3

    .line 180
    invoke-virtual {p0, v3}, Landroidx/camera/core/impl/RestrictedCameraControl;->isOperationSupported([I)Z

    move-result v3

    if-nez v3, :cond_2

    .line 181
    const/4 v0, 0x1

    .line 182
    invoke-virtual {v1, v2}, Landroidx/camera/core/FocusMeteringAction$Builder;->removePoints(I)Landroidx/camera/core/FocusMeteringAction$Builder;

    .line 186
    :cond_2
    if-nez v0, :cond_3

    .line 187
    return-object p1

    .line 190
    :cond_3
    invoke-virtual {v1}, Landroidx/camera/core/FocusMeteringAction$Builder;->build()Landroidx/camera/core/FocusMeteringAction;

    move-result-object v2

    .line 191
    .local v2, "modifyAction":Landroidx/camera/core/FocusMeteringAction;
    invoke-virtual {v2}, Landroidx/camera/core/FocusMeteringAction;->getMeteringPointsAf()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 192
    invoke-virtual {v2}, Landroidx/camera/core/FocusMeteringAction;->getMeteringPointsAe()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 193
    invoke-virtual {v2}, Landroidx/camera/core/FocusMeteringAction;->getMeteringPointsAwb()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 195
    const/4 v3, 0x0

    return-object v3

    .line 197
    :cond_4
    invoke-virtual {v1}, Landroidx/camera/core/FocusMeteringAction$Builder;->build()Landroidx/camera/core/FocusMeteringAction;

    move-result-object v3

    return-object v3
.end method

.method varargs isOperationSupported([I)Z
    .locals 5
    .param p1, "operations"    # [I

    .line 87
    iget-boolean v0, p0, Landroidx/camera/core/impl/RestrictedCameraControl;->mUseRestrictedCameraOperations:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroidx/camera/core/impl/RestrictedCameraControl;->mRestrictedCameraOperations:Ljava/util/Set;

    if-nez v0, :cond_0

    goto :goto_1

    .line 92
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    array-length v1, p1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 93
    .local v0, "operationList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget v3, p1, v2

    .line 94
    .local v3, "operation":I
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 93
    .end local v3    # "operation":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 97
    :cond_1
    iget-object v1, p0, Landroidx/camera/core/impl/RestrictedCameraControl;->mRestrictedCameraOperations:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->containsAll(Ljava/util/Collection;)Z

    move-result v1

    return v1

    .line 88
    .end local v0    # "operationList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :cond_2
    :goto_1
    const/4 v0, 0x1

    return v0
.end method

.method public setExposureCompensationIndex(I)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 2
    .param p1, "value"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 152
    const/4 v0, 0x7

    filled-new-array {v0}, [I

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/camera/core/impl/RestrictedCameraControl;->isOperationSupported([I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 153
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "ExposureCompensation is not supported"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0

    .line 156
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/impl/RestrictedCameraControl;->mCameraControl:Landroidx/camera/core/impl/CameraControlInternal;

    invoke-interface {v0, p1}, Landroidx/camera/core/impl/CameraControlInternal;->setExposureCompensationIndex(I)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method public setLinearZoom(F)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 2
    .param p1, "linearZoom"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 142
    const/4 v0, 0x0

    filled-new-array {v0}, [I

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/camera/core/impl/RestrictedCameraControl;->isOperationSupported([I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 143
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Zoom is not supported"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0

    .line 146
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/impl/RestrictedCameraControl;->mCameraControl:Landroidx/camera/core/impl/CameraControlInternal;

    invoke-interface {v0, p1}, Landroidx/camera/core/impl/CameraControlInternal;->setLinearZoom(F)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method public setZoomRatio(F)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 2
    .param p1, "ratio"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 132
    const/4 v0, 0x0

    filled-new-array {v0}, [I

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/camera/core/impl/RestrictedCameraControl;->isOperationSupported([I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 133
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Zoom is not supported"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0

    .line 136
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/impl/RestrictedCameraControl;->mCameraControl:Landroidx/camera/core/impl/CameraControlInternal;

    invoke-interface {v0, p1}, Landroidx/camera/core/impl/CameraControlInternal;->setZoomRatio(F)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method public startFocusAndMetering(Landroidx/camera/core/FocusMeteringAction;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 3
    .param p1, "action"    # Landroidx/camera/core/FocusMeteringAction;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/FocusMeteringAction;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Landroidx/camera/core/FocusMeteringResult;",
            ">;"
        }
    .end annotation

    .line 114
    invoke-virtual {p0, p1}, Landroidx/camera/core/impl/RestrictedCameraControl;->getModifiedFocusMeteringAction(Landroidx/camera/core/FocusMeteringAction;)Landroidx/camera/core/FocusMeteringAction;

    move-result-object v0

    .line 115
    .local v0, "modifiedAction":Landroidx/camera/core/FocusMeteringAction;
    if-nez v0, :cond_0

    .line 116
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "FocusMetering is not supported"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    return-object v1

    .line 120
    :cond_0
    iget-object v1, p0, Landroidx/camera/core/impl/RestrictedCameraControl;->mCameraControl:Landroidx/camera/core/impl/CameraControlInternal;

    invoke-interface {v1, v0}, Landroidx/camera/core/impl/CameraControlInternal;->startFocusAndMetering(Landroidx/camera/core/FocusMeteringAction;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    return-object v1
.end method
