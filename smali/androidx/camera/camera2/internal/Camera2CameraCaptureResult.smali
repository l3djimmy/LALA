.class public Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;
.super Ljava/lang/Object;
.source "Camera2CameraCaptureResult.java"

# interfaces
.implements Landroidx/camera/core/impl/CameraCaptureResult;


# static fields
.field private static final TAG:Ljava/lang/String; = "C2CameraCaptureResult"


# instance fields
.field private final mCaptureResult:Landroid/hardware/camera2/CaptureResult;

.field private final mTagBundle:Landroidx/camera/core/impl/TagBundle;


# direct methods
.method public constructor <init>(Landroid/hardware/camera2/CaptureResult;)V
    .locals 1
    .param p1, "captureResult"    # Landroid/hardware/camera2/CaptureResult;

    .line 55
    invoke-static {}, Landroidx/camera/core/impl/TagBundle;->emptyBundle()Landroidx/camera/core/impl/TagBundle;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;-><init>(Landroidx/camera/core/impl/TagBundle;Landroid/hardware/camera2/CaptureResult;)V

    .line 56
    return-void
.end method

.method public constructor <init>(Landroidx/camera/core/impl/TagBundle;Landroid/hardware/camera2/CaptureResult;)V
    .locals 0
    .param p1, "tagBundle"    # Landroidx/camera/core/impl/TagBundle;
    .param p2, "captureResult"    # Landroid/hardware/camera2/CaptureResult;

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput-object p1, p0, Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;->mTagBundle:Landroidx/camera/core/impl/TagBundle;

    .line 51
    iput-object p2, p0, Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;->mCaptureResult:Landroid/hardware/camera2/CaptureResult;

    .line 52
    return-void
.end method


# virtual methods
.method public getAeState()Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;
    .locals 3

    .line 127
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;->mCaptureResult:Landroid/hardware/camera2/CaptureResult;

    sget-object v1, Landroid/hardware/camera2/CaptureResult;->CONTROL_AE_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 128
    .local v0, "state":Ljava/lang/Integer;
    if-nez v0, :cond_0

    .line 129
    sget-object v1, Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;->UNKNOWN:Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;

    return-object v1

    .line 131
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 145
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Undefined ae state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "C2CameraCaptureResult"

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    sget-object v1, Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;->UNKNOWN:Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;

    return-object v1

    .line 138
    :pswitch_0
    sget-object v1, Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;->FLASH_REQUIRED:Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;

    return-object v1

    .line 142
    :pswitch_1
    sget-object v1, Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;->LOCKED:Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;

    return-object v1

    .line 140
    :pswitch_2
    sget-object v1, Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;->CONVERGED:Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;

    return-object v1

    .line 136
    :pswitch_3
    sget-object v1, Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;->SEARCHING:Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;

    return-object v1

    .line 133
    :pswitch_4
    sget-object v1, Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;->INACTIVE:Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;

    return-object v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method public getAfMode()Landroidx/camera/core/impl/CameraCaptureMetaData$AfMode;
    .locals 3

    .line 66
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;->mCaptureResult:Landroid/hardware/camera2/CaptureResult;

    sget-object v1, Landroid/hardware/camera2/CaptureResult;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 67
    .local v0, "mode":Ljava/lang/Integer;
    if-nez v0, :cond_0

    .line 68
    sget-object v1, Landroidx/camera/core/impl/CameraCaptureMetaData$AfMode;->UNKNOWN:Landroidx/camera/core/impl/CameraCaptureMetaData$AfMode;

    return-object v1

    .line 70
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 82
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Undefined af mode: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "C2CameraCaptureResult"

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    sget-object v1, Landroidx/camera/core/impl/CameraCaptureMetaData$AfMode;->UNKNOWN:Landroidx/camera/core/impl/CameraCaptureMetaData$AfMode;

    return-object v1

    .line 79
    :pswitch_0
    sget-object v1, Landroidx/camera/core/impl/CameraCaptureMetaData$AfMode;->ON_CONTINUOUS_AUTO:Landroidx/camera/core/impl/CameraCaptureMetaData$AfMode;

    return-object v1

    .line 76
    :pswitch_1
    sget-object v1, Landroidx/camera/core/impl/CameraCaptureMetaData$AfMode;->ON_MANUAL_AUTO:Landroidx/camera/core/impl/CameraCaptureMetaData$AfMode;

    return-object v1

    .line 73
    :pswitch_2
    sget-object v1, Landroidx/camera/core/impl/CameraCaptureMetaData$AfMode;->OFF:Landroidx/camera/core/impl/CameraCaptureMetaData$AfMode;

    return-object v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public getAfState()Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;
    .locals 3

    .line 94
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;->mCaptureResult:Landroid/hardware/camera2/CaptureResult;

    sget-object v1, Landroid/hardware/camera2/CaptureResult;->CONTROL_AF_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 95
    .local v0, "state":Ljava/lang/Integer;
    if-nez v0, :cond_0

    .line 96
    sget-object v1, Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;->UNKNOWN:Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;

    return-object v1

    .line 98
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 115
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Undefined af state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "C2CameraCaptureResult"

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    sget-object v1, Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;->UNKNOWN:Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;

    return-object v1

    .line 109
    :pswitch_0
    sget-object v1, Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;->PASSIVE_NOT_FOCUSED:Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;

    return-object v1

    .line 107
    :pswitch_1
    sget-object v1, Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;->LOCKED_NOT_FOCUSED:Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;

    return-object v1

    .line 105
    :pswitch_2
    sget-object v1, Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;->LOCKED_FOCUSED:Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;

    return-object v1

    .line 111
    :pswitch_3
    sget-object v1, Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;->PASSIVE_FOCUSED:Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;

    return-object v1

    .line 103
    :pswitch_4
    sget-object v1, Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;->SCANNING:Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;

    return-object v1

    .line 100
    :pswitch_5
    sget-object v1, Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;->INACTIVE:Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;

    return-object v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_4
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getAwbState()Landroidx/camera/core/impl/CameraCaptureMetaData$AwbState;
    .locals 3

    .line 157
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;->mCaptureResult:Landroid/hardware/camera2/CaptureResult;

    sget-object v1, Landroid/hardware/camera2/CaptureResult;->CONTROL_AWB_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 158
    .local v0, "state":Ljava/lang/Integer;
    if-nez v0, :cond_0

    .line 159
    sget-object v1, Landroidx/camera/core/impl/CameraCaptureMetaData$AwbState;->UNKNOWN:Landroidx/camera/core/impl/CameraCaptureMetaData$AwbState;

    return-object v1

    .line 161
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 172
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Undefined awb state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "C2CameraCaptureResult"

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    sget-object v1, Landroidx/camera/core/impl/CameraCaptureMetaData$AwbState;->UNKNOWN:Landroidx/camera/core/impl/CameraCaptureMetaData$AwbState;

    return-object v1

    .line 169
    :pswitch_0
    sget-object v1, Landroidx/camera/core/impl/CameraCaptureMetaData$AwbState;->LOCKED:Landroidx/camera/core/impl/CameraCaptureMetaData$AwbState;

    return-object v1

    .line 167
    :pswitch_1
    sget-object v1, Landroidx/camera/core/impl/CameraCaptureMetaData$AwbState;->CONVERGED:Landroidx/camera/core/impl/CameraCaptureMetaData$AwbState;

    return-object v1

    .line 165
    :pswitch_2
    sget-object v1, Landroidx/camera/core/impl/CameraCaptureMetaData$AwbState;->METERING:Landroidx/camera/core/impl/CameraCaptureMetaData$AwbState;

    return-object v1

    .line 163
    :pswitch_3
    sget-object v1, Landroidx/camera/core/impl/CameraCaptureMetaData$AwbState;->INACTIVE:Landroidx/camera/core/impl/CameraCaptureMetaData$AwbState;

    return-object v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getCaptureResult()Landroid/hardware/camera2/CaptureResult;
    .locals 1

    .line 290
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;->mCaptureResult:Landroid/hardware/camera2/CaptureResult;

    return-object v0
.end method

.method public getFlashState()Landroidx/camera/core/impl/CameraCaptureMetaData$FlashState;
    .locals 3

    .line 184
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;->mCaptureResult:Landroid/hardware/camera2/CaptureResult;

    sget-object v1, Landroid/hardware/camera2/CaptureResult;->FLASH_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 185
    .local v0, "state":Ljava/lang/Integer;
    if-nez v0, :cond_0

    .line 186
    sget-object v1, Landroidx/camera/core/impl/CameraCaptureMetaData$FlashState;->UNKNOWN:Landroidx/camera/core/impl/CameraCaptureMetaData$FlashState;

    return-object v1

    .line 188
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 199
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Undefined flash state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "C2CameraCaptureResult"

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 200
    sget-object v1, Landroidx/camera/core/impl/CameraCaptureMetaData$FlashState;->UNKNOWN:Landroidx/camera/core/impl/CameraCaptureMetaData$FlashState;

    return-object v1

    .line 196
    :pswitch_0
    sget-object v1, Landroidx/camera/core/impl/CameraCaptureMetaData$FlashState;->FIRED:Landroidx/camera/core/impl/CameraCaptureMetaData$FlashState;

    return-object v1

    .line 193
    :pswitch_1
    sget-object v1, Landroidx/camera/core/impl/CameraCaptureMetaData$FlashState;->READY:Landroidx/camera/core/impl/CameraCaptureMetaData$FlashState;

    return-object v1

    .line 191
    :pswitch_2
    sget-object v1, Landroidx/camera/core/impl/CameraCaptureMetaData$FlashState;->NONE:Landroidx/camera/core/impl/CameraCaptureMetaData$FlashState;

    return-object v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public getTagBundle()Landroidx/camera/core/impl/TagBundle;
    .locals 1

    .line 217
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;->mTagBundle:Landroidx/camera/core/impl/TagBundle;

    return-object v0
.end method

.method public getTimestamp()J
    .locals 3

    .line 206
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;->mCaptureResult:Landroid/hardware/camera2/CaptureResult;

    sget-object v1, Landroid/hardware/camera2/CaptureResult;->SENSOR_TIMESTAMP:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    .line 207
    .local v0, "timestamp":Ljava/lang/Long;
    if-nez v0, :cond_0

    .line 208
    const-wide/16 v1, -0x1

    return-wide v1

    .line 211
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    return-wide v1
.end method

.method public populateExifData(Landroidx/camera/core/impl/utils/ExifData$Builder;)V
    .locals 8
    .param p1, "exifData"    # Landroidx/camera/core/impl/utils/ExifData$Builder;

    .line 223
    invoke-super {p0, p1}, Landroidx/camera/core/impl/CameraCaptureResult;->populateExifData(Landroidx/camera/core/impl/utils/ExifData$Builder;)V

    .line 226
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;->mCaptureResult:Landroid/hardware/camera2/CaptureResult;

    sget-object v1, Landroid/hardware/camera2/CaptureResult;->SCALER_CROP_REGION:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Rect;

    .line 227
    .local v0, "cropRegion":Landroid/graphics/Rect;
    if-eqz v0, :cond_0

    .line 228
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {p1, v1}, Landroidx/camera/core/impl/utils/ExifData$Builder;->setImageWidth(I)Landroidx/camera/core/impl/utils/ExifData$Builder;

    move-result-object v1

    .line 229
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v2

    invoke-virtual {v1, v2}, Landroidx/camera/core/impl/utils/ExifData$Builder;->setImageHeight(I)Landroidx/camera/core/impl/utils/ExifData$Builder;

    .line 234
    :cond_0
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;->mCaptureResult:Landroid/hardware/camera2/CaptureResult;

    sget-object v2, Landroid/hardware/camera2/CaptureResult;->JPEG_ORIENTATION:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {v1, v2}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 235
    .local v1, "jpegOrientation":Ljava/lang/Integer;
    if-eqz v1, :cond_1

    .line 236
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {p1, v2}, Landroidx/camera/core/impl/utils/ExifData$Builder;->setOrientationDegrees(I)Landroidx/camera/core/impl/utils/ExifData$Builder;
    :try_end_0
    .catch Ljava/nio/BufferUnderflowException; {:try_start_0 .. :try_end_0} :catch_0

    .line 243
    .end local v1    # "jpegOrientation":Ljava/lang/Integer;
    :cond_1
    goto :goto_0

    .line 238
    :catch_0
    move-exception v1

    .line 242
    .local v1, "exception":Ljava/nio/BufferUnderflowException;
    const-string v2, "C2CameraCaptureResult"

    const-string v3, "Failed to get JPEG orientation."

    invoke-static {v2, v3}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 246
    .end local v1    # "exception":Ljava/nio/BufferUnderflowException;
    :goto_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;->mCaptureResult:Landroid/hardware/camera2/CaptureResult;

    sget-object v2, Landroid/hardware/camera2/CaptureResult;->SENSOR_EXPOSURE_TIME:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {v1, v2}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    .line 247
    .local v1, "exposureTimeNs":Ljava/lang/Long;
    if-eqz v1, :cond_2

    .line 248
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {p1, v2, v3}, Landroidx/camera/core/impl/utils/ExifData$Builder;->setExposureTimeNanos(J)Landroidx/camera/core/impl/utils/ExifData$Builder;

    .line 252
    :cond_2
    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;->mCaptureResult:Landroid/hardware/camera2/CaptureResult;

    sget-object v3, Landroid/hardware/camera2/CaptureResult;->LENS_APERTURE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {v2, v3}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    .line 253
    .local v2, "aperture":Ljava/lang/Float;
    if-eqz v2, :cond_3

    .line 254
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-virtual {p1, v3}, Landroidx/camera/core/impl/utils/ExifData$Builder;->setLensFNumber(F)Landroidx/camera/core/impl/utils/ExifData$Builder;

    .line 258
    :cond_3
    iget-object v3, p0, Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;->mCaptureResult:Landroid/hardware/camera2/CaptureResult;

    sget-object v4, Landroid/hardware/camera2/CaptureResult;->SENSOR_SENSITIVITY:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {v3, v4}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    .line 259
    .local v3, "iso":Ljava/lang/Integer;
    if-eqz v3, :cond_5

    .line 260
    nop

    .line 261
    iget-object v4, p0, Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;->mCaptureResult:Landroid/hardware/camera2/CaptureResult;

    sget-object v5, Landroid/hardware/camera2/CaptureResult;->CONTROL_POST_RAW_SENSITIVITY_BOOST:Landroid/hardware/camera2/CaptureResult$Key;

    .line 262
    invoke-virtual {v4, v5}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    .line 263
    .local v4, "postRawSensitivityBoost":Ljava/lang/Integer;
    if-eqz v4, :cond_4

    .line 264
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v6

    int-to-float v6, v6

    const/high16 v7, 0x42c80000    # 100.0f

    div-float/2addr v6, v7

    float-to-int v6, v6

    mul-int/2addr v5, v6

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 267
    .end local v4    # "postRawSensitivityBoost":Ljava/lang/Integer;
    :cond_4
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {p1, v4}, Landroidx/camera/core/impl/utils/ExifData$Builder;->setIso(I)Landroidx/camera/core/impl/utils/ExifData$Builder;

    .line 271
    :cond_5
    iget-object v4, p0, Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;->mCaptureResult:Landroid/hardware/camera2/CaptureResult;

    sget-object v5, Landroid/hardware/camera2/CaptureResult;->LENS_FOCAL_LENGTH:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {v4, v5}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Float;

    .line 272
    .local v4, "focalLength":Ljava/lang/Float;
    if-eqz v4, :cond_6

    .line 273
    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-virtual {p1, v5}, Landroidx/camera/core/impl/utils/ExifData$Builder;->setFocalLength(F)Landroidx/camera/core/impl/utils/ExifData$Builder;

    .line 277
    :cond_6
    iget-object v5, p0, Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;->mCaptureResult:Landroid/hardware/camera2/CaptureResult;

    sget-object v6, Landroid/hardware/camera2/CaptureResult;->CONTROL_AWB_MODE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {v5, v6}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    .line 278
    .local v5, "whiteBalanceMode":Ljava/lang/Integer;
    if-eqz v5, :cond_8

    .line 279
    sget-object v6, Landroidx/camera/core/impl/utils/ExifData$WhiteBalanceMode;->AUTO:Landroidx/camera/core/impl/utils/ExifData$WhiteBalanceMode;

    .line 280
    .local v6, "wbMode":Landroidx/camera/core/impl/utils/ExifData$WhiteBalanceMode;
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v7

    if-nez v7, :cond_7

    .line 281
    sget-object v6, Landroidx/camera/core/impl/utils/ExifData$WhiteBalanceMode;->MANUAL:Landroidx/camera/core/impl/utils/ExifData$WhiteBalanceMode;

    .line 283
    :cond_7
    invoke-virtual {p1, v6}, Landroidx/camera/core/impl/utils/ExifData$Builder;->setWhiteBalanceMode(Landroidx/camera/core/impl/utils/ExifData$WhiteBalanceMode;)Landroidx/camera/core/impl/utils/ExifData$Builder;

    .line 285
    .end local v6    # "wbMode":Landroidx/camera/core/impl/utils/ExifData$WhiteBalanceMode;
    :cond_8
    return-void
.end method
