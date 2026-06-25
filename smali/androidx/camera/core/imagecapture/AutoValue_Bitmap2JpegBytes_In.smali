.class final Landroidx/camera/core/imagecapture/AutoValue_Bitmap2JpegBytes_In;
.super Landroidx/camera/core/imagecapture/Bitmap2JpegBytes$In;
.source "AutoValue_Bitmap2JpegBytes_In.java"


# instance fields
.field private final jpegQuality:I

.field private final packet:Landroidx/camera/core/processing/Packet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/processing/Packet<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroidx/camera/core/processing/Packet;I)V
    .locals 2
    .param p2, "jpegQuality"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/processing/Packet<",
            "Landroid/graphics/Bitmap;",
            ">;I)V"
        }
    .end annotation

    .line 17
    .local p1, "packet":Landroidx/camera/core/processing/Packet;, "Landroidx/camera/core/processing/Packet<Landroid/graphics/Bitmap;>;"
    invoke-direct {p0}, Landroidx/camera/core/imagecapture/Bitmap2JpegBytes$In;-><init>()V

    .line 18
    if-eqz p1, :cond_0

    .line 21
    iput-object p1, p0, Landroidx/camera/core/imagecapture/AutoValue_Bitmap2JpegBytes_In;->packet:Landroidx/camera/core/processing/Packet;

    .line 22
    iput p2, p0, Landroidx/camera/core/imagecapture/AutoValue_Bitmap2JpegBytes_In;->jpegQuality:I

    .line 23
    return-void

    .line 19
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null packet"

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
    instance-of v1, p1, Landroidx/camera/core/imagecapture/Bitmap2JpegBytes$In;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 49
    move-object v1, p1

    check-cast v1, Landroidx/camera/core/imagecapture/Bitmap2JpegBytes$In;

    .line 50
    .local v1, "that":Landroidx/camera/core/imagecapture/Bitmap2JpegBytes$In;
    iget-object v3, p0, Landroidx/camera/core/imagecapture/AutoValue_Bitmap2JpegBytes_In;->packet:Landroidx/camera/core/processing/Packet;

    invoke-virtual {v1}, Landroidx/camera/core/imagecapture/Bitmap2JpegBytes$In;->getPacket()Landroidx/camera/core/processing/Packet;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget v3, p0, Landroidx/camera/core/imagecapture/AutoValue_Bitmap2JpegBytes_In;->jpegQuality:I

    .line 51
    invoke-virtual {v1}, Landroidx/camera/core/imagecapture/Bitmap2JpegBytes$In;->getJpegQuality()I

    move-result v4

    if-ne v3, v4, :cond_1

    goto :goto_0

    :cond_1
    move v0, v2

    .line 50
    :goto_0
    return v0

    .line 53
    .end local v1    # "that":Landroidx/camera/core/imagecapture/Bitmap2JpegBytes$In;
    :cond_2
    return v2
.end method

.method getJpegQuality()I
    .locals 1

    .line 32
    iget v0, p0, Landroidx/camera/core/imagecapture/AutoValue_Bitmap2JpegBytes_In;->jpegQuality:I

    return v0
.end method

.method getPacket()Landroidx/camera/core/processing/Packet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/camera/core/processing/Packet<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .line 27
    iget-object v0, p0, Landroidx/camera/core/imagecapture/AutoValue_Bitmap2JpegBytes_In;->packet:Landroidx/camera/core/processing/Packet;

    return-object v0
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
    iget-object v2, p0, Landroidx/camera/core/imagecapture/AutoValue_Bitmap2JpegBytes_In;->packet:Landroidx/camera/core/processing/Packet;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    .line 61
    mul-int/2addr v0, v1

    .line 62
    iget v1, p0, Landroidx/camera/core/imagecapture/AutoValue_Bitmap2JpegBytes_In;->jpegQuality:I

    xor-int/2addr v0, v1

    .line 63
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 37
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "In{packet="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/imagecapture/AutoValue_Bitmap2JpegBytes_In;->packet:Landroidx/camera/core/processing/Packet;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", jpegQuality="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/core/imagecapture/AutoValue_Bitmap2JpegBytes_In;->jpegQuality:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
