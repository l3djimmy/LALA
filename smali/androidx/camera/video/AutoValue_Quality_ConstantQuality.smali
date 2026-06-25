.class final Landroidx/camera/video/AutoValue_Quality_ConstantQuality;
.super Landroidx/camera/video/Quality$ConstantQuality;
.source "AutoValue_Quality_ConstantQuality.java"


# instance fields
.field private final name:Ljava/lang/String;

.field private final value:I


# direct methods
.method constructor <init>(ILjava/lang/String;)V
    .locals 2
    .param p1, "value"    # I
    .param p2, "name"    # Ljava/lang/String;

    .line 16
    invoke-direct {p0}, Landroidx/camera/video/Quality$ConstantQuality;-><init>()V

    .line 17
    iput p1, p0, Landroidx/camera/video/AutoValue_Quality_ConstantQuality;->value:I

    .line 18
    if-eqz p2, :cond_0

    .line 21
    iput-object p2, p0, Landroidx/camera/video/AutoValue_Quality_ConstantQuality;->name:Ljava/lang/String;

    .line 22
    return-void

    .line 19
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null name"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 45
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    .line 46
    return v0

    .line 48
    :cond_0
    instance-of v1, p1, Landroidx/camera/video/Quality$ConstantQuality;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 49
    move-object v1, p1

    check-cast v1, Landroidx/camera/video/Quality$ConstantQuality;

    .line 50
    .local v1, "that":Landroidx/camera/video/Quality$ConstantQuality;
    iget v3, p0, Landroidx/camera/video/AutoValue_Quality_ConstantQuality;->value:I

    invoke-virtual {v1}, Landroidx/camera/video/Quality$ConstantQuality;->getValue()I

    move-result v4

    if-ne v3, v4, :cond_1

    iget-object v3, p0, Landroidx/camera/video/AutoValue_Quality_ConstantQuality;->name:Ljava/lang/String;

    .line 51
    invoke-virtual {v1}, Landroidx/camera/video/Quality$ConstantQuality;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    :cond_1
    move v0, v2

    .line 50
    :goto_0
    return v0

    .line 53
    .end local v1    # "that":Landroidx/camera/video/Quality$ConstantQuality;
    :cond_2
    return v2
.end method

.method getName()Ljava/lang/String;
    .locals 1

    .line 32
    iget-object v0, p0, Landroidx/camera/video/AutoValue_Quality_ConstantQuality;->name:Ljava/lang/String;

    return-object v0
.end method

.method getValue()I
    .locals 1

    .line 26
    iget v0, p0, Landroidx/camera/video/AutoValue_Quality_ConstantQuality;->value:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    .line 58
    const/4 v0, 0x1

    .line 59
    .local v0, "h$":I
    const v1, 0xf4243

    mul-int/2addr v0, v1

    .line 60
    iget v2, p0, Landroidx/camera/video/AutoValue_Quality_ConstantQuality;->value:I

    xor-int/2addr v0, v2

    .line 61
    mul-int/2addr v0, v1

    .line 62
    iget-object v1, p0, Landroidx/camera/video/AutoValue_Quality_ConstantQuality;->name:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    .line 63
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 37
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ConstantQuality{value="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/video/AutoValue_Quality_ConstantQuality;->value:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", name="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/video/AutoValue_Quality_ConstantQuality;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
