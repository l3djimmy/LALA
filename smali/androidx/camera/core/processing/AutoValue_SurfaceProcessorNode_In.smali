.class final Landroidx/camera/core/processing/AutoValue_SurfaceProcessorNode_In;
.super Landroidx/camera/core/processing/SurfaceProcessorNode$In;
.source "AutoValue_SurfaceProcessorNode_In.java"


# instance fields
.field private final outConfigs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;",
            ">;"
        }
    .end annotation
.end field

.field private final surfaceEdge:Landroidx/camera/core/processing/SurfaceEdge;


# direct methods
.method constructor <init>(Landroidx/camera/core/processing/SurfaceEdge;Ljava/util/List;)V
    .locals 2
    .param p1, "surfaceEdge"    # Landroidx/camera/core/processing/SurfaceEdge;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/processing/SurfaceEdge;",
            "Ljava/util/List<",
            "Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;",
            ">;)V"
        }
    .end annotation

    .line 17
    .local p2, "outConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;>;"
    invoke-direct {p0}, Landroidx/camera/core/processing/SurfaceProcessorNode$In;-><init>()V

    .line 18
    if-eqz p1, :cond_1

    .line 21
    iput-object p1, p0, Landroidx/camera/core/processing/AutoValue_SurfaceProcessorNode_In;->surfaceEdge:Landroidx/camera/core/processing/SurfaceEdge;

    .line 22
    if-eqz p2, :cond_0

    .line 25
    iput-object p2, p0, Landroidx/camera/core/processing/AutoValue_SurfaceProcessorNode_In;->outConfigs:Ljava/util/List;

    .line 26
    return-void

    .line 23
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null outConfigs"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 19
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null surfaceEdge"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 51
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    .line 52
    return v0

    .line 54
    :cond_0
    instance-of v1, p1, Landroidx/camera/core/processing/SurfaceProcessorNode$In;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 55
    move-object v1, p1

    check-cast v1, Landroidx/camera/core/processing/SurfaceProcessorNode$In;

    .line 56
    .local v1, "that":Landroidx/camera/core/processing/SurfaceProcessorNode$In;
    iget-object v3, p0, Landroidx/camera/core/processing/AutoValue_SurfaceProcessorNode_In;->surfaceEdge:Landroidx/camera/core/processing/SurfaceEdge;

    invoke-virtual {v1}, Landroidx/camera/core/processing/SurfaceProcessorNode$In;->getSurfaceEdge()Landroidx/camera/core/processing/SurfaceEdge;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, p0, Landroidx/camera/core/processing/AutoValue_SurfaceProcessorNode_In;->outConfigs:Ljava/util/List;

    .line 57
    invoke-virtual {v1}, Landroidx/camera/core/processing/SurfaceProcessorNode$In;->getOutConfigs()Ljava/util/List;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    :cond_1
    move v0, v2

    .line 56
    :goto_0
    return v0

    .line 59
    .end local v1    # "that":Landroidx/camera/core/processing/SurfaceProcessorNode$In;
    :cond_2
    return v2
.end method

.method public getOutConfigs()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;",
            ">;"
        }
    .end annotation

    .line 38
    iget-object v0, p0, Landroidx/camera/core/processing/AutoValue_SurfaceProcessorNode_In;->outConfigs:Ljava/util/List;

    return-object v0
.end method

.method public getSurfaceEdge()Landroidx/camera/core/processing/SurfaceEdge;
    .locals 1

    .line 31
    iget-object v0, p0, Landroidx/camera/core/processing/AutoValue_SurfaceProcessorNode_In;->surfaceEdge:Landroidx/camera/core/processing/SurfaceEdge;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .line 64
    const/4 v0, 0x1

    .line 65
    .local v0, "h$":I
    const v1, 0xf4243

    mul-int/2addr v0, v1

    .line 66
    iget-object v2, p0, Landroidx/camera/core/processing/AutoValue_SurfaceProcessorNode_In;->surfaceEdge:Landroidx/camera/core/processing/SurfaceEdge;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    .line 67
    mul-int/2addr v0, v1

    .line 68
    iget-object v1, p0, Landroidx/camera/core/processing/AutoValue_SurfaceProcessorNode_In;->outConfigs:Ljava/util/List;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    .line 69
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 43
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "In{surfaceEdge="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/processing/AutoValue_SurfaceProcessorNode_In;->surfaceEdge:Landroidx/camera/core/processing/SurfaceEdge;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", outConfigs="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/processing/AutoValue_SurfaceProcessorNode_In;->outConfigs:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
