.class Landroidx/camera/view/CameraController$2;
.super Ljava/lang/Object;
.source "CameraController.java"

# interfaces
.implements Landroidx/camera/core/impl/utils/futures/FutureCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/camera/view/CameraController;->onTapToFocus(Landroidx/camera/core/MeteringPointFactory;FF)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/camera/core/impl/utils/futures/FutureCallback<",
        "Landroidx/camera/core/FocusMeteringResult;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/camera/view/CameraController;


# direct methods
.method constructor <init>(Landroidx/camera/view/CameraController;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/camera/view/CameraController;

    .line 1605
    iput-object p1, p0, Landroidx/camera/view/CameraController$2;->this$0:Landroidx/camera/view/CameraController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "t"    # Ljava/lang/Throwable;

    .line 1619
    instance-of v0, p1, Landroidx/camera/core/CameraControl$OperationCanceledException;

    const-string v1, "CameraController"

    if-eqz v0, :cond_0

    .line 1620
    const-string/jumbo v0, "Tap-to-focus is canceled by new action."

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1621
    return-void

    .line 1623
    :cond_0
    const-string/jumbo v0, "Tap to focus failed."

    invoke-static {v1, v0, p1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1624
    iget-object v0, p0, Landroidx/camera/view/CameraController$2;->this$0:Landroidx/camera/view/CameraController;

    iget-object v0, v0, Landroidx/camera/view/CameraController;->mTapToFocusState:Landroidx/lifecycle/MutableLiveData;

    const/4 v1, 0x4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/lifecycle/MutableLiveData;->postValue(Ljava/lang/Object;)V

    .line 1625
    return-void
.end method

.method public onSuccess(Landroidx/camera/core/FocusMeteringResult;)V
    .locals 2
    .param p1, "result"    # Landroidx/camera/core/FocusMeteringResult;

    .line 1609
    if-nez p1, :cond_0

    .line 1610
    return-void

    .line 1612
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Tap to focus onSuccess: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Landroidx/camera/core/FocusMeteringResult;->isFocusSuccessful()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CameraController"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1613
    iget-object v0, p0, Landroidx/camera/view/CameraController$2;->this$0:Landroidx/camera/view/CameraController;

    iget-object v0, v0, Landroidx/camera/view/CameraController;->mTapToFocusState:Landroidx/lifecycle/MutableLiveData;

    invoke-virtual {p1}, Landroidx/camera/core/FocusMeteringResult;->isFocusSuccessful()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1614
    const/4 v1, 0x2

    goto :goto_0

    :cond_1
    const/4 v1, 0x3

    .line 1613
    :goto_0
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/lifecycle/MutableLiveData;->postValue(Ljava/lang/Object;)V

    .line 1615
    return-void
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0

    .line 1605
    check-cast p1, Landroidx/camera/core/FocusMeteringResult;

    invoke-virtual {p0, p1}, Landroidx/camera/view/CameraController$2;->onSuccess(Landroidx/camera/core/FocusMeteringResult;)V

    return-void
.end method
