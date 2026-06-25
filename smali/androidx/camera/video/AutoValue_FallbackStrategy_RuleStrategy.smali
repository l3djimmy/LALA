.class final Landroidx/camera/video/AutoValue_FallbackStrategy_RuleStrategy;
.super Landroidx/camera/video/FallbackStrategy$RuleStrategy;
.source "AutoValue_FallbackStrategy_RuleStrategy.java"


# instance fields
.field private final fallbackQuality:Landroidx/camera/video/Quality;

.field private final fallbackRule:I


# direct methods
.method constructor <init>(Landroidx/camera/video/Quality;I)V
    .locals 2
    .param p1, "fallbackQuality"    # Landroidx/camera/video/Quality;
    .param p2, "fallbackRule"    # I

    .line 16
    invoke-direct {p0}, Landroidx/camera/video/FallbackStrategy$RuleStrategy;-><init>()V

    .line 17
    if-eqz p1, :cond_0

    .line 20
    iput-object p1, p0, Landroidx/camera/video/AutoValue_FallbackStrategy_RuleStrategy;->fallbackQuality:Landroidx/camera/video/Quality;

    .line 21
    iput p2, p0, Landroidx/camera/video/AutoValue_FallbackStrategy_RuleStrategy;->fallbackRule:I

    .line 22
    return-void

    .line 18
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null fallbackQuality"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 46
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    .line 47
    return v0

    .line 49
    :cond_0
    instance-of v1, p1, Landroidx/camera/video/FallbackStrategy$RuleStrategy;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 50
    move-object v1, p1

    check-cast v1, Landroidx/camera/video/FallbackStrategy$RuleStrategy;

    .line 51
    .local v1, "that":Landroidx/camera/video/FallbackStrategy$RuleStrategy;
    iget-object v3, p0, Landroidx/camera/video/AutoValue_FallbackStrategy_RuleStrategy;->fallbackQuality:Landroidx/camera/video/Quality;

    invoke-virtual {v1}, Landroidx/camera/video/FallbackStrategy$RuleStrategy;->getFallbackQuality()Landroidx/camera/video/Quality;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget v3, p0, Landroidx/camera/video/AutoValue_FallbackStrategy_RuleStrategy;->fallbackRule:I

    .line 52
    invoke-virtual {v1}, Landroidx/camera/video/FallbackStrategy$RuleStrategy;->getFallbackRule()I

    move-result v4

    if-ne v3, v4, :cond_1

    goto :goto_0

    :cond_1
    move v0, v2

    .line 51
    :goto_0
    return v0

    .line 54
    .end local v1    # "that":Landroidx/camera/video/FallbackStrategy$RuleStrategy;
    :cond_2
    return v2
.end method

.method getFallbackQuality()Landroidx/camera/video/Quality;
    .locals 1

    .line 27
    iget-object v0, p0, Landroidx/camera/video/AutoValue_FallbackStrategy_RuleStrategy;->fallbackQuality:Landroidx/camera/video/Quality;

    return-object v0
.end method

.method getFallbackRule()I
    .locals 1

    .line 33
    iget v0, p0, Landroidx/camera/video/AutoValue_FallbackStrategy_RuleStrategy;->fallbackRule:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    .line 59
    const/4 v0, 0x1

    .line 60
    .local v0, "h$":I
    const v1, 0xf4243

    mul-int/2addr v0, v1

    .line 61
    iget-object v2, p0, Landroidx/camera/video/AutoValue_FallbackStrategy_RuleStrategy;->fallbackQuality:Landroidx/camera/video/Quality;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    .line 62
    mul-int/2addr v0, v1

    .line 63
    iget v1, p0, Landroidx/camera/video/AutoValue_FallbackStrategy_RuleStrategy;->fallbackRule:I

    xor-int/2addr v0, v1

    .line 64
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "RuleStrategy{fallbackQuality="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/video/AutoValue_FallbackStrategy_RuleStrategy;->fallbackQuality:Landroidx/camera/video/Quality;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", fallbackRule="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/video/AutoValue_FallbackStrategy_RuleStrategy;->fallbackRule:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
