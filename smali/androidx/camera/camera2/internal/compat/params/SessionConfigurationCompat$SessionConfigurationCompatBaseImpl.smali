.class final Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat$SessionConfigurationCompatBaseImpl;
.super Ljava/lang/Object;
.source "SessionConfigurationCompat.java"

# interfaces
.implements Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat$SessionConfigurationCompatImpl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "SessionConfigurationCompatBaseImpl"
.end annotation


# instance fields
.field private final mExecutor:Ljava/util/concurrent/Executor;

.field private mInputConfig:Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat;

.field private final mOutputConfigurations:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;",
            ">;"
        }
    .end annotation
.end field

.field private mSessionParameters:Landroid/hardware/camera2/CaptureRequest;

.field private final mSessionType:I

.field private final mStateCallback:Landroid/hardware/camera2/CameraCaptureSession$StateCallback;


# direct methods
.method constructor <init>(ILjava/util/List;Ljava/util/concurrent/Executor;Landroid/hardware/camera2/CameraCaptureSession$StateCallback;)V
    .locals 1
    .param p1, "sessionType"    # I
    .param p3, "executor"    # Ljava/util/concurrent/Executor;
    .param p4, "cb"    # Landroid/hardware/camera2/CameraCaptureSession$StateCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;",
            ">;",
            "Ljava/util/concurrent/Executor;",
            "Landroid/hardware/camera2/CameraCaptureSession$StateCallback;",
            ")V"
        }
    .end annotation

    .line 319
    .local p2, "outputs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 313
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat$SessionConfigurationCompatBaseImpl;->mInputConfig:Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat;

    .line 314
    iput-object v0, p0, Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat$SessionConfigurationCompatBaseImpl;->mSessionParameters:Landroid/hardware/camera2/CaptureRequest;

    .line 320
    iput p1, p0, Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat$SessionConfigurationCompatBaseImpl;->mSessionType:I

    .line 321
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat$SessionConfigurationCompatBaseImpl;->mOutputConfigurations:Ljava/util/List;

    .line 322
    iput-object p4, p0, Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat$SessionConfigurationCompatBaseImpl;->mStateCallback:Landroid/hardware/camera2/CameraCaptureSession$StateCallback;

    .line 323
    iput-object p3, p0, Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat$SessionConfigurationCompatBaseImpl;->mExecutor:Ljava/util/concurrent/Executor;

    .line 324
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 6
    .param p1, "obj"    # Ljava/lang/Object;

    .line 383
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    .line 384
    return v0

    .line 385
    :cond_0
    instance-of v1, p1, Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat$SessionConfigurationCompatBaseImpl;

    const/4 v2, 0x0

    if-eqz v1, :cond_5

    .line 386
    move-object v1, p1

    check-cast v1, Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat$SessionConfigurationCompatBaseImpl;

    .line 387
    .local v1, "other":Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat$SessionConfigurationCompatBaseImpl;
    iget-object v3, p0, Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat$SessionConfigurationCompatBaseImpl;->mInputConfig:Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat;

    iget-object v4, v1, Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat$SessionConfigurationCompatBaseImpl;->mInputConfig:Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat;

    invoke-static {v3, v4}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    iget v3, p0, Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat$SessionConfigurationCompatBaseImpl;->mSessionType:I

    iget v4, v1, Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat$SessionConfigurationCompatBaseImpl;->mSessionType:I

    if-ne v3, v4, :cond_4

    iget-object v3, p0, Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat$SessionConfigurationCompatBaseImpl;->mOutputConfigurations:Ljava/util/List;

    .line 389
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    iget-object v4, v1, Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat$SessionConfigurationCompatBaseImpl;->mOutputConfigurations:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-eq v3, v4, :cond_1

    goto :goto_1

    .line 393
    :cond_1
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    iget-object v4, p0, Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat$SessionConfigurationCompatBaseImpl;->mOutputConfigurations:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_3

    .line 394
    iget-object v4, p0, Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat$SessionConfigurationCompatBaseImpl;->mOutputConfigurations:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;

    iget-object v5, v1, Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat$SessionConfigurationCompatBaseImpl;->mOutputConfigurations:Ljava/util/List;

    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 395
    return v2

    .line 393
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 399
    .end local v3    # "i":I
    :cond_3
    return v0

    .line 390
    :cond_4
    :goto_1
    return v2

    .line 402
    .end local v1    # "other":Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat$SessionConfigurationCompatBaseImpl;
    :cond_5
    return v2
.end method

.method public getExecutor()Ljava/util/concurrent/Executor;
    .locals 1

    .line 346
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat$SessionConfigurationCompatBaseImpl;->mExecutor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method public getInputConfiguration()Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat;
    .locals 1

    .line 352
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat$SessionConfigurationCompatBaseImpl;->mInputConfig:Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat;

    return-object v0
.end method

.method public getOutputConfigurations()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;",
            ">;"
        }
    .end annotation

    .line 334
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat$SessionConfigurationCompatBaseImpl;->mOutputConfigurations:Ljava/util/List;

    return-object v0
.end method

.method public getSessionConfiguration()Ljava/lang/Object;
    .locals 1

    .line 378
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSessionParameters()Landroid/hardware/camera2/CaptureRequest;
    .locals 1

    .line 367
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat$SessionConfigurationCompatBaseImpl;->mSessionParameters:Landroid/hardware/camera2/CaptureRequest;

    return-object v0
.end method

.method public getSessionType()I
    .locals 1

    .line 328
    iget v0, p0, Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat$SessionConfigurationCompatBaseImpl;->mSessionType:I

    return v0
.end method

.method public getStateCallback()Landroid/hardware/camera2/CameraCaptureSession$StateCallback;
    .locals 1

    .line 340
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat$SessionConfigurationCompatBaseImpl;->mStateCallback:Landroid/hardware/camera2/CameraCaptureSession$StateCallback;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .line 407
    const/4 v0, 0x1

    .line 409
    .local v0, "h":I
    shl-int/lit8 v1, v0, 0x5

    sub-int/2addr v1, v0

    iget-object v2, p0, Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat$SessionConfigurationCompatBaseImpl;->mOutputConfigurations:Ljava/util/List;

    .line 410
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    xor-int v0, v1, v2

    .line 412
    shl-int/lit8 v1, v0, 0x5

    sub-int/2addr v1, v0

    iget-object v2, p0, Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat$SessionConfigurationCompatBaseImpl;->mInputConfig:Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat;

    if-nez v2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    .line 413
    :cond_0
    iget-object v2, p0, Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat$SessionConfigurationCompatBaseImpl;->mInputConfig:Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat;

    invoke-virtual {v2}, Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat;->hashCode()I

    move-result v2

    :goto_0
    xor-int v0, v1, v2

    .line 414
    shl-int/lit8 v1, v0, 0x5

    sub-int/2addr v1, v0

    iget v2, p0, Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat$SessionConfigurationCompatBaseImpl;->mSessionType:I

    xor-int v0, v1, v2

    .line 416
    return v0
.end method

.method public setInputConfiguration(Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat;)V
    .locals 2
    .param p1, "input"    # Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat;

    .line 357
    iget v0, p0, Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat$SessionConfigurationCompatBaseImpl;->mSessionType:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    .line 358
    iput-object p1, p0, Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat$SessionConfigurationCompatBaseImpl;->mInputConfig:Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat;

    .line 363
    return-void

    .line 360
    :cond_0
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Method not supported for high speed session types"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setSessionParameters(Landroid/hardware/camera2/CaptureRequest;)V
    .locals 0
    .param p1, "params"    # Landroid/hardware/camera2/CaptureRequest;

    .line 372
    iput-object p1, p0, Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat$SessionConfigurationCompatBaseImpl;->mSessionParameters:Landroid/hardware/camera2/CaptureRequest;

    .line 373
    return-void
.end method
