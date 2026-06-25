.class Landroidx/camera/core/streamsharing/StreamSharingBuilder;
.super Ljava/lang/Object;
.source "StreamSharingBuilder.java"

# interfaces
.implements Landroidx/camera/core/impl/UseCaseConfig$Builder;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/camera/core/impl/UseCaseConfig$Builder<",
        "Landroidx/camera/core/streamsharing/StreamSharing;",
        "Landroidx/camera/core/streamsharing/StreamSharingConfig;",
        "Landroidx/camera/core/streamsharing/StreamSharingBuilder;",
        ">;"
    }
.end annotation


# static fields
.field private static final UNSUPPORTED_MESSAGE:Ljava/lang/String; = "Operation not supported by StreamSharingBuilder."


# instance fields
.field private final mMutableConfig:Landroidx/camera/core/impl/MutableOptionsBundle;


# direct methods
.method constructor <init>()V
    .locals 1

    .line 58
    invoke-static {}, Landroidx/camera/core/impl/MutableOptionsBundle;->create()Landroidx/camera/core/impl/MutableOptionsBundle;

    move-result-object v0

    invoke-direct {p0, v0}, Landroidx/camera/core/streamsharing/StreamSharingBuilder;-><init>(Landroidx/camera/core/impl/MutableOptionsBundle;)V

    .line 59
    return-void
.end method

.method constructor <init>(Landroidx/camera/core/impl/MutableOptionsBundle;)V
    .locals 4
    .param p1, "mutableConfig"    # Landroidx/camera/core/impl/MutableOptionsBundle;

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    iput-object p1, p0, Landroidx/camera/core/streamsharing/StreamSharingBuilder;->mMutableConfig:Landroidx/camera/core/impl/MutableOptionsBundle;

    .line 63
    sget-object v0, Landroidx/camera/core/internal/TargetConfig;->OPTION_TARGET_CLASS:Landroidx/camera/core/impl/Config$Option;

    .line 64
    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroidx/camera/core/impl/MutableOptionsBundle;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    .line 65
    .local v0, "oldConfigClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v0, :cond_1

    const-class v1, Landroidx/camera/core/streamsharing/StreamSharing;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 66
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid target class configuration for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 72
    :cond_1
    :goto_0
    const-class v1, Landroidx/camera/core/streamsharing/StreamSharing;

    invoke-virtual {p0, v1}, Landroidx/camera/core/streamsharing/StreamSharingBuilder;->setTargetClass(Ljava/lang/Class;)Landroidx/camera/core/streamsharing/StreamSharingBuilder;

    .line 73
    return-void
.end method


# virtual methods
.method public build()Landroidx/camera/core/streamsharing/StreamSharing;
    .locals 2

    .line 84
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Operation not supported by StreamSharingBuilder."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic build()Ljava/lang/Object;
    .locals 1

    .line 48
    invoke-virtual {p0}, Landroidx/camera/core/streamsharing/StreamSharingBuilder;->build()Landroidx/camera/core/streamsharing/StreamSharing;

    move-result-object v0

    return-object v0
.end method

.method public getMutableConfig()Landroidx/camera/core/impl/MutableConfig;
    .locals 1

    .line 78
    iget-object v0, p0, Landroidx/camera/core/streamsharing/StreamSharingBuilder;->mMutableConfig:Landroidx/camera/core/impl/MutableOptionsBundle;

    return-object v0
.end method

.method public bridge synthetic getUseCaseConfig()Landroidx/camera/core/impl/UseCaseConfig;
    .locals 1

    .line 48
    invoke-virtual {p0}, Landroidx/camera/core/streamsharing/StreamSharingBuilder;->getUseCaseConfig()Landroidx/camera/core/streamsharing/StreamSharingConfig;

    move-result-object v0

    return-object v0
.end method

.method public getUseCaseConfig()Landroidx/camera/core/streamsharing/StreamSharingConfig;
    .locals 2

    .line 140
    new-instance v0, Landroidx/camera/core/streamsharing/StreamSharingConfig;

    iget-object v1, p0, Landroidx/camera/core/streamsharing/StreamSharingBuilder;->mMutableConfig:Landroidx/camera/core/impl/MutableOptionsBundle;

    invoke-static {v1}, Landroidx/camera/core/impl/OptionsBundle;->from(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/OptionsBundle;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/camera/core/streamsharing/StreamSharingConfig;-><init>(Landroidx/camera/core/impl/OptionsBundle;)V

    return-object v0
.end method

.method public setCameraSelector(Landroidx/camera/core/CameraSelector;)Landroidx/camera/core/streamsharing/StreamSharingBuilder;
    .locals 2
    .param p1, "cameraSelector"    # Landroidx/camera/core/CameraSelector;

    .line 122
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Operation not supported by StreamSharingBuilder."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic setCameraSelector(Landroidx/camera/core/CameraSelector;)Ljava/lang/Object;
    .locals 0

    .line 48
    invoke-virtual {p0, p1}, Landroidx/camera/core/streamsharing/StreamSharingBuilder;->setCameraSelector(Landroidx/camera/core/CameraSelector;)Landroidx/camera/core/streamsharing/StreamSharingBuilder;

    move-result-object p1

    return-object p1
.end method

.method public setCaptureOptionUnpacker(Landroidx/camera/core/impl/CaptureConfig$OptionUnpacker;)Landroidx/camera/core/streamsharing/StreamSharingBuilder;
    .locals 2
    .param p1, "optionUnpacker"    # Landroidx/camera/core/impl/CaptureConfig$OptionUnpacker;

    .line 110
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Operation not supported by StreamSharingBuilder."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic setCaptureOptionUnpacker(Landroidx/camera/core/impl/CaptureConfig$OptionUnpacker;)Ljava/lang/Object;
    .locals 0

    .line 48
    invoke-virtual {p0, p1}, Landroidx/camera/core/streamsharing/StreamSharingBuilder;->setCaptureOptionUnpacker(Landroidx/camera/core/impl/CaptureConfig$OptionUnpacker;)Landroidx/camera/core/streamsharing/StreamSharingBuilder;

    move-result-object p1

    return-object p1
.end method

.method public setCaptureType(Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;)Landroidx/camera/core/streamsharing/StreamSharingBuilder;
    .locals 2
    .param p1, "captureType"    # Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    .line 174
    invoke-virtual {p0}, Landroidx/camera/core/streamsharing/StreamSharingBuilder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_CAPTURE_TYPE:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v0, v1, p1}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 175
    return-object p0
.end method

.method public bridge synthetic setCaptureType(Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;)Ljava/lang/Object;
    .locals 0

    .line 48
    invoke-virtual {p0, p1}, Landroidx/camera/core/streamsharing/StreamSharingBuilder;->setCaptureType(Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;)Landroidx/camera/core/streamsharing/StreamSharingBuilder;

    move-result-object p1

    return-object p1
.end method

.method public setDefaultCaptureConfig(Landroidx/camera/core/impl/CaptureConfig;)Landroidx/camera/core/streamsharing/StreamSharingBuilder;
    .locals 2
    .param p1, "captureConfig"    # Landroidx/camera/core/impl/CaptureConfig;

    .line 96
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Operation not supported by StreamSharingBuilder."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic setDefaultCaptureConfig(Landroidx/camera/core/impl/CaptureConfig;)Ljava/lang/Object;
    .locals 0

    .line 48
    invoke-virtual {p0, p1}, Landroidx/camera/core/streamsharing/StreamSharingBuilder;->setDefaultCaptureConfig(Landroidx/camera/core/impl/CaptureConfig;)Landroidx/camera/core/streamsharing/StreamSharingBuilder;

    move-result-object p1

    return-object p1
.end method

.method public setDefaultSessionConfig(Landroidx/camera/core/impl/SessionConfig;)Landroidx/camera/core/streamsharing/StreamSharingBuilder;
    .locals 2
    .param p1, "sessionConfig"    # Landroidx/camera/core/impl/SessionConfig;

    .line 90
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Operation not supported by StreamSharingBuilder."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic setDefaultSessionConfig(Landroidx/camera/core/impl/SessionConfig;)Ljava/lang/Object;
    .locals 0

    .line 48
    invoke-virtual {p0, p1}, Landroidx/camera/core/streamsharing/StreamSharingBuilder;->setDefaultSessionConfig(Landroidx/camera/core/impl/SessionConfig;)Landroidx/camera/core/streamsharing/StreamSharingBuilder;

    move-result-object p1

    return-object p1
.end method

.method public setHighResolutionDisabled(Z)Landroidx/camera/core/streamsharing/StreamSharingBuilder;
    .locals 2
    .param p1, "disabled"    # Z

    .line 134
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Operation not supported by StreamSharingBuilder."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic setHighResolutionDisabled(Z)Ljava/lang/Object;
    .locals 0

    .line 48
    invoke-virtual {p0, p1}, Landroidx/camera/core/streamsharing/StreamSharingBuilder;->setHighResolutionDisabled(Z)Landroidx/camera/core/streamsharing/StreamSharingBuilder;

    move-result-object p1

    return-object p1
.end method

.method public setSessionOptionUnpacker(Landroidx/camera/core/impl/SessionConfig$OptionUnpacker;)Landroidx/camera/core/streamsharing/StreamSharingBuilder;
    .locals 2
    .param p1, "optionUnpacker"    # Landroidx/camera/core/impl/SessionConfig$OptionUnpacker;

    .line 103
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Operation not supported by StreamSharingBuilder."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic setSessionOptionUnpacker(Landroidx/camera/core/impl/SessionConfig$OptionUnpacker;)Ljava/lang/Object;
    .locals 0

    .line 48
    invoke-virtual {p0, p1}, Landroidx/camera/core/streamsharing/StreamSharingBuilder;->setSessionOptionUnpacker(Landroidx/camera/core/impl/SessionConfig$OptionUnpacker;)Landroidx/camera/core/streamsharing/StreamSharingBuilder;

    move-result-object p1

    return-object p1
.end method

.method public setSurfaceOccupancyPriority(I)Landroidx/camera/core/streamsharing/StreamSharingBuilder;
    .locals 2
    .param p1, "priority"    # I

    .line 116
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Operation not supported by StreamSharingBuilder."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic setSurfaceOccupancyPriority(I)Ljava/lang/Object;
    .locals 0

    .line 48
    invoke-virtual {p0, p1}, Landroidx/camera/core/streamsharing/StreamSharingBuilder;->setSurfaceOccupancyPriority(I)Landroidx/camera/core/streamsharing/StreamSharingBuilder;

    move-result-object p1

    return-object p1
.end method

.method public setTargetClass(Ljava/lang/Class;)Landroidx/camera/core/streamsharing/StreamSharingBuilder;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "Landroidx/camera/core/streamsharing/StreamSharing;",
            ">;)",
            "Landroidx/camera/core/streamsharing/StreamSharingBuilder;"
        }
    .end annotation

    .line 146
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<Landroidx/camera/core/streamsharing/StreamSharing;>;"
    invoke-virtual {p0}, Landroidx/camera/core/streamsharing/StreamSharingBuilder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/internal/TargetConfig;->OPTION_TARGET_CLASS:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v0, v1, p1}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 148
    invoke-virtual {p0}, Landroidx/camera/core/streamsharing/StreamSharingBuilder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/internal/TargetConfig;->OPTION_TARGET_NAME:Landroidx/camera/core/impl/Config$Option;

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroidx/camera/core/impl/MutableConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    .line 149
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 150
    .local v0, "targetName":Ljava/lang/String;
    invoke-virtual {p0, v0}, Landroidx/camera/core/streamsharing/StreamSharingBuilder;->setTargetName(Ljava/lang/String;)Landroidx/camera/core/streamsharing/StreamSharingBuilder;

    .line 152
    .end local v0    # "targetName":Ljava/lang/String;
    :cond_0
    return-object p0
.end method

.method public bridge synthetic setTargetClass(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 0

    .line 48
    invoke-virtual {p0, p1}, Landroidx/camera/core/streamsharing/StreamSharingBuilder;->setTargetClass(Ljava/lang/Class;)Landroidx/camera/core/streamsharing/StreamSharingBuilder;

    move-result-object p1

    return-object p1
.end method

.method public setTargetName(Ljava/lang/String;)Landroidx/camera/core/streamsharing/StreamSharingBuilder;
    .locals 2
    .param p1, "targetName"    # Ljava/lang/String;

    .line 158
    invoke-virtual {p0}, Landroidx/camera/core/streamsharing/StreamSharingBuilder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/internal/TargetConfig;->OPTION_TARGET_NAME:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v0, v1, p1}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 159
    return-object p0
.end method

.method public bridge synthetic setTargetName(Ljava/lang/String;)Ljava/lang/Object;
    .locals 0

    .line 48
    invoke-virtual {p0, p1}, Landroidx/camera/core/streamsharing/StreamSharingBuilder;->setTargetName(Ljava/lang/String;)Landroidx/camera/core/streamsharing/StreamSharingBuilder;

    move-result-object p1

    return-object p1
.end method

.method public setUseCaseEventCallback(Landroidx/camera/core/UseCase$EventCallback;)Landroidx/camera/core/streamsharing/StreamSharingBuilder;
    .locals 2
    .param p1, "eventCallback"    # Landroidx/camera/core/UseCase$EventCallback;

    .line 166
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Operation not supported by StreamSharingBuilder."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic setUseCaseEventCallback(Landroidx/camera/core/UseCase$EventCallback;)Ljava/lang/Object;
    .locals 0

    .line 48
    invoke-virtual {p0, p1}, Landroidx/camera/core/streamsharing/StreamSharingBuilder;->setUseCaseEventCallback(Landroidx/camera/core/UseCase$EventCallback;)Landroidx/camera/core/streamsharing/StreamSharingBuilder;

    move-result-object p1

    return-object p1
.end method

.method public setZslDisabled(Z)Landroidx/camera/core/streamsharing/StreamSharingBuilder;
    .locals 2
    .param p1, "disabled"    # Z

    .line 128
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Operation not supported by StreamSharingBuilder."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic setZslDisabled(Z)Ljava/lang/Object;
    .locals 0

    .line 48
    invoke-virtual {p0, p1}, Landroidx/camera/core/streamsharing/StreamSharingBuilder;->setZslDisabled(Z)Landroidx/camera/core/streamsharing/StreamSharingBuilder;

    move-result-object p1

    return-object p1
.end method
