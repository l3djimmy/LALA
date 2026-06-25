.class public Landroidx/camera/core/streamsharing/VirtualCameraCaptureResult;
.super Ljava/lang/Object;
.source "VirtualCameraCaptureResult.java"

# interfaces
.implements Landroidx/camera/core/impl/CameraCaptureResult;


# static fields
.field private static final INVALID_TIMESTAMP:J = -0x1L


# instance fields
.field private final mBaseCameraCaptureResult:Landroidx/camera/core/impl/CameraCaptureResult;

.field private final mTagBundle:Landroidx/camera/core/impl/TagBundle;

.field private final mTimestamp:J


# direct methods
.method private constructor <init>(Landroidx/camera/core/impl/CameraCaptureResult;Landroidx/camera/core/impl/TagBundle;J)V
    .locals 0
    .param p1, "baseCameraCaptureResult"    # Landroidx/camera/core/impl/CameraCaptureResult;
    .param p2, "tagBundle"    # Landroidx/camera/core/impl/TagBundle;
    .param p3, "timestamp"    # J

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    iput-object p1, p0, Landroidx/camera/core/streamsharing/VirtualCameraCaptureResult;->mBaseCameraCaptureResult:Landroidx/camera/core/impl/CameraCaptureResult;

    .line 72
    iput-object p2, p0, Landroidx/camera/core/streamsharing/VirtualCameraCaptureResult;->mTagBundle:Landroidx/camera/core/impl/TagBundle;

    .line 73
    iput-wide p3, p0, Landroidx/camera/core/streamsharing/VirtualCameraCaptureResult;->mTimestamp:J

    .line 74
    return-void
.end method

.method public constructor <init>(Landroidx/camera/core/impl/TagBundle;J)V
    .locals 1
    .param p1, "tagBundle"    # Landroidx/camera/core/impl/TagBundle;
    .param p2, "timestamp"    # J

    .line 64
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2, p3}, Landroidx/camera/core/streamsharing/VirtualCameraCaptureResult;-><init>(Landroidx/camera/core/impl/CameraCaptureResult;Landroidx/camera/core/impl/TagBundle;J)V

    .line 65
    return-void
.end method

.method public constructor <init>(Landroidx/camera/core/impl/TagBundle;Landroidx/camera/core/impl/CameraCaptureResult;)V
    .locals 2
    .param p1, "tagBundle"    # Landroidx/camera/core/impl/TagBundle;
    .param p2, "baseCameraCaptureResult"    # Landroidx/camera/core/impl/CameraCaptureResult;

    .line 52
    const-wide/16 v0, -0x1

    invoke-direct {p0, p2, p1, v0, v1}, Landroidx/camera/core/streamsharing/VirtualCameraCaptureResult;-><init>(Landroidx/camera/core/impl/CameraCaptureResult;Landroidx/camera/core/impl/TagBundle;J)V

    .line 53
    return-void
.end method


# virtual methods
.method public getAeState()Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;
    .locals 1

    .line 100
    iget-object v0, p0, Landroidx/camera/core/streamsharing/VirtualCameraCaptureResult;->mBaseCameraCaptureResult:Landroidx/camera/core/impl/CameraCaptureResult;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/camera/core/streamsharing/VirtualCameraCaptureResult;->mBaseCameraCaptureResult:Landroidx/camera/core/impl/CameraCaptureResult;

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraCaptureResult;->getAeState()Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;

    move-result-object v0

    goto :goto_0

    .line 101
    :cond_0
    sget-object v0, Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;->UNKNOWN:Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;

    .line 100
    :goto_0
    return-object v0
.end method

.method public getAfMode()Landroidx/camera/core/impl/CameraCaptureMetaData$AfMode;
    .locals 1

    .line 86
    iget-object v0, p0, Landroidx/camera/core/streamsharing/VirtualCameraCaptureResult;->mBaseCameraCaptureResult:Landroidx/camera/core/impl/CameraCaptureResult;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/camera/core/streamsharing/VirtualCameraCaptureResult;->mBaseCameraCaptureResult:Landroidx/camera/core/impl/CameraCaptureResult;

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraCaptureResult;->getAfMode()Landroidx/camera/core/impl/CameraCaptureMetaData$AfMode;

    move-result-object v0

    goto :goto_0

    .line 87
    :cond_0
    sget-object v0, Landroidx/camera/core/impl/CameraCaptureMetaData$AfMode;->UNKNOWN:Landroidx/camera/core/impl/CameraCaptureMetaData$AfMode;

    .line 86
    :goto_0
    return-object v0
.end method

.method public getAfState()Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;
    .locals 1

    .line 93
    iget-object v0, p0, Landroidx/camera/core/streamsharing/VirtualCameraCaptureResult;->mBaseCameraCaptureResult:Landroidx/camera/core/impl/CameraCaptureResult;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/camera/core/streamsharing/VirtualCameraCaptureResult;->mBaseCameraCaptureResult:Landroidx/camera/core/impl/CameraCaptureResult;

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraCaptureResult;->getAfState()Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;

    move-result-object v0

    goto :goto_0

    .line 94
    :cond_0
    sget-object v0, Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;->UNKNOWN:Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;

    .line 93
    :goto_0
    return-object v0
.end method

.method public getAwbState()Landroidx/camera/core/impl/CameraCaptureMetaData$AwbState;
    .locals 1

    .line 107
    iget-object v0, p0, Landroidx/camera/core/streamsharing/VirtualCameraCaptureResult;->mBaseCameraCaptureResult:Landroidx/camera/core/impl/CameraCaptureResult;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/camera/core/streamsharing/VirtualCameraCaptureResult;->mBaseCameraCaptureResult:Landroidx/camera/core/impl/CameraCaptureResult;

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraCaptureResult;->getAwbState()Landroidx/camera/core/impl/CameraCaptureMetaData$AwbState;

    move-result-object v0

    goto :goto_0

    .line 108
    :cond_0
    sget-object v0, Landroidx/camera/core/impl/CameraCaptureMetaData$AwbState;->UNKNOWN:Landroidx/camera/core/impl/CameraCaptureMetaData$AwbState;

    .line 107
    :goto_0
    return-object v0
.end method

.method public getFlashState()Landroidx/camera/core/impl/CameraCaptureMetaData$FlashState;
    .locals 1

    .line 114
    iget-object v0, p0, Landroidx/camera/core/streamsharing/VirtualCameraCaptureResult;->mBaseCameraCaptureResult:Landroidx/camera/core/impl/CameraCaptureResult;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/camera/core/streamsharing/VirtualCameraCaptureResult;->mBaseCameraCaptureResult:Landroidx/camera/core/impl/CameraCaptureResult;

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraCaptureResult;->getFlashState()Landroidx/camera/core/impl/CameraCaptureMetaData$FlashState;

    move-result-object v0

    goto :goto_0

    .line 115
    :cond_0
    sget-object v0, Landroidx/camera/core/impl/CameraCaptureMetaData$FlashState;->UNKNOWN:Landroidx/camera/core/impl/CameraCaptureMetaData$FlashState;

    .line 114
    :goto_0
    return-object v0
.end method

.method public getTagBundle()Landroidx/camera/core/impl/TagBundle;
    .locals 1

    .line 80
    iget-object v0, p0, Landroidx/camera/core/streamsharing/VirtualCameraCaptureResult;->mTagBundle:Landroidx/camera/core/impl/TagBundle;

    return-object v0
.end method

.method public getTimestamp()J
    .locals 4

    .line 120
    iget-object v0, p0, Landroidx/camera/core/streamsharing/VirtualCameraCaptureResult;->mBaseCameraCaptureResult:Landroidx/camera/core/impl/CameraCaptureResult;

    if-eqz v0, :cond_0

    .line 121
    iget-object v0, p0, Landroidx/camera/core/streamsharing/VirtualCameraCaptureResult;->mBaseCameraCaptureResult:Landroidx/camera/core/impl/CameraCaptureResult;

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraCaptureResult;->getTimestamp()J

    move-result-wide v0

    return-wide v0

    .line 122
    :cond_0
    iget-wide v0, p0, Landroidx/camera/core/streamsharing/VirtualCameraCaptureResult;->mTimestamp:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    .line 123
    iget-wide v0, p0, Landroidx/camera/core/streamsharing/VirtualCameraCaptureResult;->mTimestamp:J

    return-wide v0

    .line 125
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No timestamp is available."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
