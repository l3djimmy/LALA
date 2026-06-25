.class Landroidx/camera/camera2/internal/CameraStateMachine;
.super Ljava/lang/Object;
.source "CameraStateMachine.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "CameraStateMachine"


# instance fields
.field private final mCameraStateRegistry:Landroidx/camera/core/impl/CameraStateRegistry;

.field private final mCameraStates:Landroidx/lifecycle/MutableLiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/MutableLiveData<",
            "Landroidx/camera/core/CameraState;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroidx/camera/core/impl/CameraStateRegistry;)V
    .locals 2
    .param p1, "cameraStateRegistry"    # Landroidx/camera/core/impl/CameraStateRegistry;

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object p1, p0, Landroidx/camera/camera2/internal/CameraStateMachine;->mCameraStateRegistry:Landroidx/camera/core/impl/CameraStateRegistry;

    .line 45
    new-instance v0, Landroidx/lifecycle/MutableLiveData;

    invoke-direct {v0}, Landroidx/lifecycle/MutableLiveData;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/CameraStateMachine;->mCameraStates:Landroidx/lifecycle/MutableLiveData;

    .line 46
    iget-object v0, p0, Landroidx/camera/camera2/internal/CameraStateMachine;->mCameraStates:Landroidx/lifecycle/MutableLiveData;

    sget-object v1, Landroidx/camera/core/CameraState$Type;->CLOSED:Landroidx/camera/core/CameraState$Type;

    invoke-static {v1}, Landroidx/camera/core/CameraState;->create(Landroidx/camera/core/CameraState$Type;)Landroidx/camera/core/CameraState;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/lifecycle/MutableLiveData;->postValue(Ljava/lang/Object;)V

    .line 47
    return-void
.end method

.method private onCameraPendingOpen()Landroidx/camera/core/CameraState;
    .locals 1

    .line 103
    iget-object v0, p0, Landroidx/camera/camera2/internal/CameraStateMachine;->mCameraStateRegistry:Landroidx/camera/core/impl/CameraStateRegistry;

    invoke-virtual {v0}, Landroidx/camera/core/impl/CameraStateRegistry;->isCameraClosing()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Landroidx/camera/core/CameraState$Type;->OPENING:Landroidx/camera/core/CameraState$Type;

    invoke-static {v0}, Landroidx/camera/core/CameraState;->create(Landroidx/camera/core/CameraState$Type;)Landroidx/camera/core/CameraState;

    move-result-object v0

    goto :goto_0

    .line 104
    :cond_0
    sget-object v0, Landroidx/camera/core/CameraState$Type;->PENDING_OPEN:Landroidx/camera/core/CameraState$Type;

    invoke-static {v0}, Landroidx/camera/core/CameraState;->create(Landroidx/camera/core/CameraState$Type;)Landroidx/camera/core/CameraState;

    move-result-object v0

    .line 103
    :goto_0
    return-object v0
.end method


# virtual methods
.method public getStateLiveData()Landroidx/lifecycle/LiveData;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Landroidx/camera/core/CameraState;",
            ">;"
        }
    .end annotation

    .line 110
    iget-object v0, p0, Landroidx/camera/camera2/internal/CameraStateMachine;->mCameraStates:Landroidx/lifecycle/MutableLiveData;

    return-object v0
.end method

.method public updateState(Landroidx/camera/core/impl/CameraInternal$State;Landroidx/camera/core/CameraState$StateError;)V
    .locals 5
    .param p1, "newInternalState"    # Landroidx/camera/core/impl/CameraInternal$State;
    .param p2, "stateError"    # Landroidx/camera/core/CameraState$StateError;

    .line 57
    sget-object v0, Landroidx/camera/camera2/internal/CameraStateMachine$1;->$SwitchMap$androidx$camera$core$impl$CameraInternal$State:[I

    invoke-virtual {p1}, Landroidx/camera/core/impl/CameraInternal$State;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 77
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Unknown internal camera state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 74
    :pswitch_0
    sget-object v0, Landroidx/camera/core/CameraState$Type;->CLOSED:Landroidx/camera/core/CameraState$Type;

    invoke-static {v0, p2}, Landroidx/camera/core/CameraState;->create(Landroidx/camera/core/CameraState$Type;Landroidx/camera/core/CameraState$StateError;)Landroidx/camera/core/CameraState;

    move-result-object v0

    .line 75
    .local v0, "newPublicState":Landroidx/camera/core/CameraState;
    goto :goto_0

    .line 70
    .end local v0    # "newPublicState":Landroidx/camera/core/CameraState;
    :pswitch_1
    sget-object v0, Landroidx/camera/core/CameraState$Type;->CLOSING:Landroidx/camera/core/CameraState$Type;

    invoke-static {v0, p2}, Landroidx/camera/core/CameraState;->create(Landroidx/camera/core/CameraState$Type;Landroidx/camera/core/CameraState$StateError;)Landroidx/camera/core/CameraState;

    move-result-object v0

    .line 71
    .restart local v0    # "newPublicState":Landroidx/camera/core/CameraState;
    goto :goto_0

    .line 66
    .end local v0    # "newPublicState":Landroidx/camera/core/CameraState;
    :pswitch_2
    sget-object v0, Landroidx/camera/core/CameraState$Type;->OPEN:Landroidx/camera/core/CameraState$Type;

    invoke-static {v0, p2}, Landroidx/camera/core/CameraState;->create(Landroidx/camera/core/CameraState$Type;Landroidx/camera/core/CameraState$StateError;)Landroidx/camera/core/CameraState;

    move-result-object v0

    .line 67
    .restart local v0    # "newPublicState":Landroidx/camera/core/CameraState;
    goto :goto_0

    .line 62
    .end local v0    # "newPublicState":Landroidx/camera/core/CameraState;
    :pswitch_3
    sget-object v0, Landroidx/camera/core/CameraState$Type;->OPENING:Landroidx/camera/core/CameraState$Type;

    invoke-static {v0, p2}, Landroidx/camera/core/CameraState;->create(Landroidx/camera/core/CameraState$Type;Landroidx/camera/core/CameraState$StateError;)Landroidx/camera/core/CameraState;

    move-result-object v0

    .line 63
    .restart local v0    # "newPublicState":Landroidx/camera/core/CameraState;
    goto :goto_0

    .line 59
    .end local v0    # "newPublicState":Landroidx/camera/core/CameraState;
    :pswitch_4
    invoke-direct {p0}, Landroidx/camera/camera2/internal/CameraStateMachine;->onCameraPendingOpen()Landroidx/camera/core/CameraState;

    move-result-object v0

    .line 60
    .restart local v0    # "newPublicState":Landroidx/camera/core/CameraState;
    nop

    .line 81
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "New public camera state "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " from "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " and "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "CameraStateMachine"

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    iget-object v1, p0, Landroidx/camera/camera2/internal/CameraStateMachine;->mCameraStates:Landroidx/lifecycle/MutableLiveData;

    invoke-virtual {v1}, Landroidx/lifecycle/MutableLiveData;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/CameraState;

    .line 86
    .local v1, "currentPublicState":Landroidx/camera/core/CameraState;
    invoke-static {v1, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 87
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Publishing new public camera state "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    iget-object v2, p0, Landroidx/camera/camera2/internal/CameraStateMachine;->mCameraStates:Landroidx/lifecycle/MutableLiveData;

    invoke-virtual {v2, v0}, Landroidx/lifecycle/MutableLiveData;->postValue(Ljava/lang/Object;)V

    .line 90
    :cond_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
