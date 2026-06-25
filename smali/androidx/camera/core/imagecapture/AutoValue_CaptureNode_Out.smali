.class final Landroidx/camera/core/imagecapture/AutoValue_CaptureNode_Out;
.super Landroidx/camera/core/imagecapture/CaptureNode$Out;
.source "AutoValue_CaptureNode_Out.java"


# instance fields
.field private final imageEdge:Landroidx/camera/core/processing/Edge;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/processing/Edge<",
            "Landroidx/camera/core/ImageProxy;",
            ">;"
        }
    .end annotation
.end field

.field private final inputFormat:I

.field private final outputFormat:I

.field private final requestEdge:Landroidx/camera/core/processing/Edge;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/processing/Edge<",
            "Landroidx/camera/core/imagecapture/ProcessingRequest;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroidx/camera/core/processing/Edge;Landroidx/camera/core/processing/Edge;II)V
    .locals 2
    .param p3, "inputFormat"    # I
    .param p4, "outputFormat"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/processing/Edge<",
            "Landroidx/camera/core/ImageProxy;",
            ">;",
            "Landroidx/camera/core/processing/Edge<",
            "Landroidx/camera/core/imagecapture/ProcessingRequest;",
            ">;II)V"
        }
    .end annotation

    .line 23
    .local p1, "imageEdge":Landroidx/camera/core/processing/Edge;, "Landroidx/camera/core/processing/Edge<Landroidx/camera/core/ImageProxy;>;"
    .local p2, "requestEdge":Landroidx/camera/core/processing/Edge;, "Landroidx/camera/core/processing/Edge<Landroidx/camera/core/imagecapture/ProcessingRequest;>;"
    invoke-direct {p0}, Landroidx/camera/core/imagecapture/CaptureNode$Out;-><init>()V

    .line 24
    if-eqz p1, :cond_1

    .line 27
    iput-object p1, p0, Landroidx/camera/core/imagecapture/AutoValue_CaptureNode_Out;->imageEdge:Landroidx/camera/core/processing/Edge;

    .line 28
    if-eqz p2, :cond_0

    .line 31
    iput-object p2, p0, Landroidx/camera/core/imagecapture/AutoValue_CaptureNode_Out;->requestEdge:Landroidx/camera/core/processing/Edge;

    .line 32
    iput p3, p0, Landroidx/camera/core/imagecapture/AutoValue_CaptureNode_Out;->inputFormat:I

    .line 33
    iput p4, p0, Landroidx/camera/core/imagecapture/AutoValue_CaptureNode_Out;->outputFormat:I

    .line 34
    return-void

    .line 29
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null requestEdge"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 25
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null imageEdge"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 68
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    .line 69
    return v0

    .line 71
    :cond_0
    instance-of v1, p1, Landroidx/camera/core/imagecapture/CaptureNode$Out;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 72
    move-object v1, p1

    check-cast v1, Landroidx/camera/core/imagecapture/CaptureNode$Out;

    .line 73
    .local v1, "that":Landroidx/camera/core/imagecapture/CaptureNode$Out;
    iget-object v3, p0, Landroidx/camera/core/imagecapture/AutoValue_CaptureNode_Out;->imageEdge:Landroidx/camera/core/processing/Edge;

    invoke-virtual {v1}, Landroidx/camera/core/imagecapture/CaptureNode$Out;->getImageEdge()Landroidx/camera/core/processing/Edge;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, p0, Landroidx/camera/core/imagecapture/AutoValue_CaptureNode_Out;->requestEdge:Landroidx/camera/core/processing/Edge;

    .line 74
    invoke-virtual {v1}, Landroidx/camera/core/imagecapture/CaptureNode$Out;->getRequestEdge()Landroidx/camera/core/processing/Edge;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget v3, p0, Landroidx/camera/core/imagecapture/AutoValue_CaptureNode_Out;->inputFormat:I

    .line 75
    invoke-virtual {v1}, Landroidx/camera/core/imagecapture/CaptureNode$Out;->getInputFormat()I

    move-result v4

    if-ne v3, v4, :cond_1

    iget v3, p0, Landroidx/camera/core/imagecapture/AutoValue_CaptureNode_Out;->outputFormat:I

    .line 76
    invoke-virtual {v1}, Landroidx/camera/core/imagecapture/CaptureNode$Out;->getOutputFormat()I

    move-result v4

    if-ne v3, v4, :cond_1

    goto :goto_0

    :cond_1
    move v0, v2

    .line 73
    :goto_0
    return v0

    .line 78
    .end local v1    # "that":Landroidx/camera/core/imagecapture/CaptureNode$Out;
    :cond_2
    return v2
.end method

.method getImageEdge()Landroidx/camera/core/processing/Edge;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/camera/core/processing/Edge<",
            "Landroidx/camera/core/ImageProxy;",
            ">;"
        }
    .end annotation

    .line 38
    iget-object v0, p0, Landroidx/camera/core/imagecapture/AutoValue_CaptureNode_Out;->imageEdge:Landroidx/camera/core/processing/Edge;

    return-object v0
.end method

.method getInputFormat()I
    .locals 1

    .line 48
    iget v0, p0, Landroidx/camera/core/imagecapture/AutoValue_CaptureNode_Out;->inputFormat:I

    return v0
.end method

.method getOutputFormat()I
    .locals 1

    .line 53
    iget v0, p0, Landroidx/camera/core/imagecapture/AutoValue_CaptureNode_Out;->outputFormat:I

    return v0
.end method

.method getRequestEdge()Landroidx/camera/core/processing/Edge;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/camera/core/processing/Edge<",
            "Landroidx/camera/core/imagecapture/ProcessingRequest;",
            ">;"
        }
    .end annotation

    .line 43
    iget-object v0, p0, Landroidx/camera/core/imagecapture/AutoValue_CaptureNode_Out;->requestEdge:Landroidx/camera/core/processing/Edge;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .line 83
    const/4 v0, 0x1

    .line 84
    .local v0, "h$":I
    const v1, 0xf4243

    mul-int/2addr v0, v1

    .line 85
    iget-object v2, p0, Landroidx/camera/core/imagecapture/AutoValue_CaptureNode_Out;->imageEdge:Landroidx/camera/core/processing/Edge;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    .line 86
    mul-int/2addr v0, v1

    .line 87
    iget-object v2, p0, Landroidx/camera/core/imagecapture/AutoValue_CaptureNode_Out;->requestEdge:Landroidx/camera/core/processing/Edge;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    .line 88
    mul-int/2addr v0, v1

    .line 89
    iget v2, p0, Landroidx/camera/core/imagecapture/AutoValue_CaptureNode_Out;->inputFormat:I

    xor-int/2addr v0, v2

    .line 90
    mul-int/2addr v0, v1

    .line 91
    iget v1, p0, Landroidx/camera/core/imagecapture/AutoValue_CaptureNode_Out;->outputFormat:I

    xor-int/2addr v0, v1

    .line 92
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 58
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Out{imageEdge="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/imagecapture/AutoValue_CaptureNode_Out;->imageEdge:Landroidx/camera/core/processing/Edge;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", requestEdge="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/imagecapture/AutoValue_CaptureNode_Out;->requestEdge:Landroidx/camera/core/processing/Edge;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", inputFormat="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/core/imagecapture/AutoValue_CaptureNode_Out;->inputFormat:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", outputFormat="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/core/imagecapture/AutoValue_CaptureNode_Out;->outputFormat:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
