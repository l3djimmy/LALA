.class final Landroidx/camera/core/AutoValue_CameraState;
.super Landroidx/camera/core/CameraState;
.source "AutoValue_CameraState.java"


# instance fields
.field private final error:Landroidx/camera/core/CameraState$StateError;

.field private final type:Landroidx/camera/core/CameraState$Type;


# direct methods
.method constructor <init>(Landroidx/camera/core/CameraState$Type;Landroidx/camera/core/CameraState$StateError;)V
    .locals 2
    .param p1, "type"    # Landroidx/camera/core/CameraState$Type;
    .param p2, "error"    # Landroidx/camera/core/CameraState$StateError;

    .line 17
    invoke-direct {p0}, Landroidx/camera/core/CameraState;-><init>()V

    .line 18
    if-eqz p1, :cond_0

    .line 21
    iput-object p1, p0, Landroidx/camera/core/AutoValue_CameraState;->type:Landroidx/camera/core/CameraState$Type;

    .line 22
    iput-object p2, p0, Landroidx/camera/core/AutoValue_CameraState;->error:Landroidx/camera/core/CameraState$StateError;

    .line 23
    return-void

    .line 19
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null type"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 47
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    .line 48
    return v0

    .line 50
    :cond_0
    instance-of v1, p1, Landroidx/camera/core/CameraState;

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    .line 51
    move-object v1, p1

    check-cast v1, Landroidx/camera/core/CameraState;

    .line 52
    .local v1, "that":Landroidx/camera/core/CameraState;
    iget-object v3, p0, Landroidx/camera/core/AutoValue_CameraState;->type:Landroidx/camera/core/CameraState$Type;

    invoke-virtual {v1}, Landroidx/camera/core/CameraState;->getType()Landroidx/camera/core/CameraState$Type;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroidx/camera/core/CameraState$Type;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Landroidx/camera/core/AutoValue_CameraState;->error:Landroidx/camera/core/CameraState$StateError;

    if-nez v3, :cond_1

    .line 53
    invoke-virtual {v1}, Landroidx/camera/core/CameraState;->getError()Landroidx/camera/core/CameraState$StateError;

    move-result-object v3

    if-nez v3, :cond_2

    goto :goto_0

    :cond_1
    iget-object v3, p0, Landroidx/camera/core/AutoValue_CameraState;->error:Landroidx/camera/core/CameraState$StateError;

    invoke-virtual {v1}, Landroidx/camera/core/CameraState;->getError()Landroidx/camera/core/CameraState$StateError;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    :goto_0
    goto :goto_1

    :cond_2
    move v0, v2

    .line 52
    :goto_1
    return v0

    .line 55
    .end local v1    # "that":Landroidx/camera/core/CameraState;
    :cond_3
    return v2
.end method

.method public getError()Landroidx/camera/core/CameraState$StateError;
    .locals 1

    .line 34
    iget-object v0, p0, Landroidx/camera/core/AutoValue_CameraState;->error:Landroidx/camera/core/CameraState$StateError;

    return-object v0
.end method

.method public getType()Landroidx/camera/core/CameraState$Type;
    .locals 1

    .line 28
    iget-object v0, p0, Landroidx/camera/core/AutoValue_CameraState;->type:Landroidx/camera/core/CameraState$Type;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .line 60
    const/4 v0, 0x1

    .line 61
    .local v0, "h$":I
    const v1, 0xf4243

    mul-int/2addr v0, v1

    .line 62
    iget-object v2, p0, Landroidx/camera/core/AutoValue_CameraState;->type:Landroidx/camera/core/CameraState$Type;

    invoke-virtual {v2}, Landroidx/camera/core/CameraState$Type;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    .line 63
    mul-int/2addr v0, v1

    .line 64
    iget-object v1, p0, Landroidx/camera/core/AutoValue_CameraState;->error:Landroidx/camera/core/CameraState$StateError;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Landroidx/camera/core/AutoValue_CameraState;->error:Landroidx/camera/core/CameraState$StateError;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :goto_0
    xor-int/2addr v0, v1

    .line 65
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 39
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CameraState{type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/AutoValue_CameraState;->type:Landroidx/camera/core/CameraState$Type;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", error="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/AutoValue_CameraState;->error:Landroidx/camera/core/CameraState$StateError;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
