.class final Landroidx/camera/video/AutoValue_OutputResults;
.super Landroidx/camera/video/OutputResults;
.source "AutoValue_OutputResults.java"


# instance fields
.field private final outputUri:Landroid/net/Uri;


# direct methods
.method constructor <init>(Landroid/net/Uri;)V
    .locals 2
    .param p1, "outputUri"    # Landroid/net/Uri;

    .line 14
    invoke-direct {p0}, Landroidx/camera/video/OutputResults;-><init>()V

    .line 15
    if-eqz p1, :cond_0

    .line 18
    iput-object p1, p0, Landroidx/camera/video/AutoValue_OutputResults;->outputUri:Landroid/net/Uri;

    .line 19
    return-void

    .line 16
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null outputUri"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "o"    # Ljava/lang/Object;

    .line 36
    if-ne p1, p0, :cond_0

    .line 37
    const/4 v0, 0x1

    return v0

    .line 39
    :cond_0
    instance-of v0, p1, Landroidx/camera/video/OutputResults;

    if-eqz v0, :cond_1

    .line 40
    move-object v0, p1

    check-cast v0, Landroidx/camera/video/OutputResults;

    .line 41
    .local v0, "that":Landroidx/camera/video/OutputResults;
    iget-object v1, p0, Landroidx/camera/video/AutoValue_OutputResults;->outputUri:Landroid/net/Uri;

    invoke-virtual {v0}, Landroidx/camera/video/OutputResults;->getOutputUri()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1

    .line 43
    .end local v0    # "that":Landroidx/camera/video/OutputResults;
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public getOutputUri()Landroid/net/Uri;
    .locals 1

    .line 24
    iget-object v0, p0, Landroidx/camera/video/AutoValue_OutputResults;->outputUri:Landroid/net/Uri;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .line 48
    const/4 v0, 0x1

    .line 49
    .local v0, "h$":I
    const v1, 0xf4243

    mul-int/2addr v0, v1

    .line 50
    iget-object v1, p0, Landroidx/camera/video/AutoValue_OutputResults;->outputUri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    .line 51
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 29
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "OutputResults{outputUri="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/video/AutoValue_OutputResults;->outputUri:Landroid/net/Uri;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
