.class public final Landroidx/camera/camera2/impl/CameraEventCallbacks$ComboCameraEventCallback;
.super Ljava/lang/Object;
.source "CameraEventCallbacks.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/camera2/impl/CameraEventCallbacks;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ComboCameraEventCallback"
.end annotation


# instance fields
.field private final mCallbacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/camera2/impl/CameraEventCallback;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/camera2/impl/CameraEventCallback;",
            ">;)V"
        }
    .end annotation

    .line 66
    .local p1, "callbacks":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/camera2/impl/CameraEventCallback;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/impl/CameraEventCallbacks$ComboCameraEventCallback;->mCallbacks:Ljava/util/List;

    .line 67
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/camera2/impl/CameraEventCallback;

    .line 68
    .local v1, "callback":Landroidx/camera/camera2/impl/CameraEventCallback;
    iget-object v2, p0, Landroidx/camera/camera2/impl/CameraEventCallbacks$ComboCameraEventCallback;->mCallbacks:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    .end local v1    # "callback":Landroidx/camera/camera2/impl/CameraEventCallback;
    goto :goto_0

    .line 70
    :cond_0
    return-void
.end method


# virtual methods
.method public getCallbacks()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/camera/camera2/impl/CameraEventCallback;",
            ">;"
        }
    .end annotation

    .line 168
    iget-object v0, p0, Landroidx/camera/camera2/impl/CameraEventCallbacks$ComboCameraEventCallback;->mCallbacks:Ljava/util/List;

    return-object v0
.end method

.method public onDeInitSession()V
    .locals 2

    .line 161
    iget-object v0, p0, Landroidx/camera/camera2/impl/CameraEventCallbacks$ComboCameraEventCallback;->mCallbacks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/camera2/impl/CameraEventCallback;

    .line 162
    .local v1, "callback":Landroidx/camera/camera2/impl/CameraEventCallback;
    invoke-virtual {v1}, Landroidx/camera/camera2/impl/CameraEventCallback;->onDeInitSession()V

    .line 163
    .end local v1    # "callback":Landroidx/camera/camera2/impl/CameraEventCallback;
    goto :goto_0

    .line 164
    :cond_0
    return-void
.end method

.method public onDisableSession()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/CaptureConfig;",
            ">;"
        }
    .end annotation

    .line 147
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 148
    .local v0, "ret":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/CaptureConfig;>;"
    iget-object v1, p0, Landroidx/camera/camera2/impl/CameraEventCallbacks$ComboCameraEventCallback;->mCallbacks:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/camera2/impl/CameraEventCallback;

    .line 149
    .local v2, "callback":Landroidx/camera/camera2/impl/CameraEventCallback;
    invoke-virtual {v2}, Landroidx/camera/camera2/impl/CameraEventCallback;->onDisableSession()Landroidx/camera/core/impl/CaptureConfig;

    move-result-object v3

    .line 150
    .local v3, "disableCaptureStage":Landroidx/camera/core/impl/CaptureConfig;
    if-eqz v3, :cond_0

    .line 151
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 153
    .end local v2    # "callback":Landroidx/camera/camera2/impl/CameraEventCallback;
    .end local v3    # "disableCaptureStage":Landroidx/camera/core/impl/CaptureConfig;
    :cond_0
    goto :goto_0

    .line 154
    :cond_1
    return-object v0
.end method

.method public onEnableSession()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/CaptureConfig;",
            ">;"
        }
    .end annotation

    .line 105
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 106
    .local v0, "ret":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/CaptureConfig;>;"
    iget-object v1, p0, Landroidx/camera/camera2/impl/CameraEventCallbacks$ComboCameraEventCallback;->mCallbacks:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/camera2/impl/CameraEventCallback;

    .line 107
    .local v2, "callback":Landroidx/camera/camera2/impl/CameraEventCallback;
    invoke-virtual {v2}, Landroidx/camera/camera2/impl/CameraEventCallback;->onEnableSession()Landroidx/camera/core/impl/CaptureConfig;

    move-result-object v3

    .line 108
    .local v3, "enableCaptureStage":Landroidx/camera/core/impl/CaptureConfig;
    if-eqz v3, :cond_0

    .line 109
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 111
    .end local v2    # "callback":Landroidx/camera/camera2/impl/CameraEventCallback;
    .end local v3    # "enableCaptureStage":Landroidx/camera/core/impl/CaptureConfig;
    :cond_0
    goto :goto_0

    .line 112
    :cond_1
    return-object v0
.end method

.method public onInitSession()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/CaptureConfig;",
            ">;"
        }
    .end annotation

    .line 82
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 83
    .local v0, "ret":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/CaptureConfig;>;"
    iget-object v1, p0, Landroidx/camera/camera2/impl/CameraEventCallbacks$ComboCameraEventCallback;->mCallbacks:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/camera2/impl/CameraEventCallback;

    .line 84
    .local v2, "callback":Landroidx/camera/camera2/impl/CameraEventCallback;
    invoke-virtual {v2}, Landroidx/camera/camera2/impl/CameraEventCallback;->onInitSession()Landroidx/camera/core/impl/CaptureConfig;

    move-result-object v3

    .line 85
    .local v3, "presetCaptureStage":Landroidx/camera/core/impl/CaptureConfig;
    if-eqz v3, :cond_0

    .line 86
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 88
    .end local v2    # "callback":Landroidx/camera/camera2/impl/CameraEventCallback;
    .end local v3    # "presetCaptureStage":Landroidx/camera/core/impl/CaptureConfig;
    :cond_0
    goto :goto_0

    .line 89
    :cond_1
    return-object v0
.end method

.method public onRepeating()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/CaptureConfig;",
            ">;"
        }
    .end annotation

    .line 125
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 126
    .local v0, "ret":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/CaptureConfig;>;"
    iget-object v1, p0, Landroidx/camera/camera2/impl/CameraEventCallbacks$ComboCameraEventCallback;->mCallbacks:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/camera2/impl/CameraEventCallback;

    .line 127
    .local v2, "callback":Landroidx/camera/camera2/impl/CameraEventCallback;
    invoke-virtual {v2}, Landroidx/camera/camera2/impl/CameraEventCallback;->onRepeating()Landroidx/camera/core/impl/CaptureConfig;

    move-result-object v3

    .line 128
    .local v3, "repeatingCaptureStage":Landroidx/camera/core/impl/CaptureConfig;
    if-eqz v3, :cond_0

    .line 129
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 131
    .end local v2    # "callback":Landroidx/camera/camera2/impl/CameraEventCallback;
    .end local v3    # "repeatingCaptureStage":Landroidx/camera/core/impl/CaptureConfig;
    :cond_0
    goto :goto_0

    .line 132
    :cond_1
    return-object v0
.end method
