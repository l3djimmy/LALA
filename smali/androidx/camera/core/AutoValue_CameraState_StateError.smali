.class final Landroidx/camera/core/AutoValue_CameraState_StateError;
.super Landroidx/camera/core/CameraState$StateError;
.source "AutoValue_CameraState_StateError.java"


# instance fields
.field private final cause:Ljava/lang/Throwable;

.field private final code:I


# direct methods
.method constructor <init>(ILjava/lang/Throwable;)V
    .locals 0
    .param p1, "code"    # I
    .param p2, "cause"    # Ljava/lang/Throwable;

    .line 16
    invoke-direct {p0}, Landroidx/camera/core/CameraState$StateError;-><init>()V

    .line 17
    iput p1, p0, Landroidx/camera/core/AutoValue_CameraState_StateError;->code:I

    .line 18
    iput-object p2, p0, Landroidx/camera/core/AutoValue_CameraState_StateError;->cause:Ljava/lang/Throwable;

    .line 19
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 43
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    .line 44
    return v0

    .line 46
    :cond_0
    instance-of v1, p1, Landroidx/camera/core/CameraState$StateError;

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    .line 47
    move-object v1, p1

    check-cast v1, Landroidx/camera/core/CameraState$StateError;

    .line 48
    .local v1, "that":Landroidx/camera/core/CameraState$StateError;
    iget v3, p0, Landroidx/camera/core/AutoValue_CameraState_StateError;->code:I

    invoke-virtual {v1}, Landroidx/camera/core/CameraState$StateError;->getCode()I

    move-result v4

    if-ne v3, v4, :cond_2

    iget-object v3, p0, Landroidx/camera/core/AutoValue_CameraState_StateError;->cause:Ljava/lang/Throwable;

    if-nez v3, :cond_1

    .line 49
    invoke-virtual {v1}, Landroidx/camera/core/CameraState$StateError;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-nez v3, :cond_2

    goto :goto_0

    :cond_1
    iget-object v3, p0, Landroidx/camera/core/AutoValue_CameraState_StateError;->cause:Ljava/lang/Throwable;

    invoke-virtual {v1}, Landroidx/camera/core/CameraState$StateError;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    :goto_0
    goto :goto_1

    :cond_2
    move v0, v2

    .line 48
    :goto_1
    return v0

    .line 51
    .end local v1    # "that":Landroidx/camera/core/CameraState$StateError;
    :cond_3
    return v2
.end method

.method public getCause()Ljava/lang/Throwable;
    .locals 1

    .line 30
    iget-object v0, p0, Landroidx/camera/core/AutoValue_CameraState_StateError;->cause:Ljava/lang/Throwable;

    return-object v0
.end method

.method public getCode()I
    .locals 1

    .line 24
    iget v0, p0, Landroidx/camera/core/AutoValue_CameraState_StateError;->code:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    .line 56
    const/4 v0, 0x1

    .line 57
    .local v0, "h$":I
    const v1, 0xf4243

    mul-int/2addr v0, v1

    .line 58
    iget v2, p0, Landroidx/camera/core/AutoValue_CameraState_StateError;->code:I

    xor-int/2addr v0, v2

    .line 59
    mul-int/2addr v0, v1

    .line 60
    iget-object v1, p0, Landroidx/camera/core/AutoValue_CameraState_StateError;->cause:Ljava/lang/Throwable;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Landroidx/camera/core/AutoValue_CameraState_StateError;->cause:Ljava/lang/Throwable;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :goto_0
    xor-int/2addr v0, v1

    .line 61
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 35
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "StateError{code="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/core/AutoValue_CameraState_StateError;->code:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", cause="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/AutoValue_CameraState_StateError;->cause:Ljava/lang/Throwable;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
