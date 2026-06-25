.class final Landroidx/camera/core/processing/AutoValue_DefaultSurfaceProcessor_PendingSnapshot;
.super Landroidx/camera/core/processing/DefaultSurfaceProcessor$PendingSnapshot;
.source "AutoValue_DefaultSurfaceProcessor_PendingSnapshot.java"


# instance fields
.field private final completer:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private final jpegQuality:I

.field private final rotationDegrees:I


# direct methods
.method constructor <init>(IILandroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V
    .locals 2
    .param p1, "jpegQuality"    # I
    .param p2, "rotationDegrees"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 21
    .local p3, "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;, "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Ljava/lang/Void;>;"
    invoke-direct {p0}, Landroidx/camera/core/processing/DefaultSurfaceProcessor$PendingSnapshot;-><init>()V

    .line 22
    iput p1, p0, Landroidx/camera/core/processing/AutoValue_DefaultSurfaceProcessor_PendingSnapshot;->jpegQuality:I

    .line 23
    iput p2, p0, Landroidx/camera/core/processing/AutoValue_DefaultSurfaceProcessor_PendingSnapshot;->rotationDegrees:I

    .line 24
    if-eqz p3, :cond_0

    .line 27
    iput-object p3, p0, Landroidx/camera/core/processing/AutoValue_DefaultSurfaceProcessor_PendingSnapshot;->completer:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 28
    return-void

    .line 25
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null completer"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 59
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    .line 60
    return v0

    .line 62
    :cond_0
    instance-of v1, p1, Landroidx/camera/core/processing/DefaultSurfaceProcessor$PendingSnapshot;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 63
    move-object v1, p1

    check-cast v1, Landroidx/camera/core/processing/DefaultSurfaceProcessor$PendingSnapshot;

    .line 64
    .local v1, "that":Landroidx/camera/core/processing/DefaultSurfaceProcessor$PendingSnapshot;
    iget v3, p0, Landroidx/camera/core/processing/AutoValue_DefaultSurfaceProcessor_PendingSnapshot;->jpegQuality:I

    invoke-virtual {v1}, Landroidx/camera/core/processing/DefaultSurfaceProcessor$PendingSnapshot;->getJpegQuality()I

    move-result v4

    if-ne v3, v4, :cond_1

    iget v3, p0, Landroidx/camera/core/processing/AutoValue_DefaultSurfaceProcessor_PendingSnapshot;->rotationDegrees:I

    .line 65
    invoke-virtual {v1}, Landroidx/camera/core/processing/DefaultSurfaceProcessor$PendingSnapshot;->getRotationDegrees()I

    move-result v4

    if-ne v3, v4, :cond_1

    iget-object v3, p0, Landroidx/camera/core/processing/AutoValue_DefaultSurfaceProcessor_PendingSnapshot;->completer:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 66
    invoke-virtual {v1}, Landroidx/camera/core/processing/DefaultSurfaceProcessor$PendingSnapshot;->getCompleter()Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    :cond_1
    move v0, v2

    .line 64
    :goto_0
    return v0

    .line 68
    .end local v1    # "that":Landroidx/camera/core/processing/DefaultSurfaceProcessor$PendingSnapshot;
    :cond_2
    return v2
.end method

.method getCompleter()Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 45
    iget-object v0, p0, Landroidx/camera/core/processing/AutoValue_DefaultSurfaceProcessor_PendingSnapshot;->completer:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    return-object v0
.end method

.method getJpegQuality()I
    .locals 1

    .line 33
    iget v0, p0, Landroidx/camera/core/processing/AutoValue_DefaultSurfaceProcessor_PendingSnapshot;->jpegQuality:I

    return v0
.end method

.method getRotationDegrees()I
    .locals 1

    .line 39
    iget v0, p0, Landroidx/camera/core/processing/AutoValue_DefaultSurfaceProcessor_PendingSnapshot;->rotationDegrees:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    .line 73
    const/4 v0, 0x1

    .line 74
    .local v0, "h$":I
    const v1, 0xf4243

    mul-int/2addr v0, v1

    .line 75
    iget v2, p0, Landroidx/camera/core/processing/AutoValue_DefaultSurfaceProcessor_PendingSnapshot;->jpegQuality:I

    xor-int/2addr v0, v2

    .line 76
    mul-int/2addr v0, v1

    .line 77
    iget v2, p0, Landroidx/camera/core/processing/AutoValue_DefaultSurfaceProcessor_PendingSnapshot;->rotationDegrees:I

    xor-int/2addr v0, v2

    .line 78
    mul-int/2addr v0, v1

    .line 79
    iget-object v1, p0, Landroidx/camera/core/processing/AutoValue_DefaultSurfaceProcessor_PendingSnapshot;->completer:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    .line 80
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 50
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "PendingSnapshot{jpegQuality="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/core/processing/AutoValue_DefaultSurfaceProcessor_PendingSnapshot;->jpegQuality:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", rotationDegrees="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/core/processing/AutoValue_DefaultSurfaceProcessor_PendingSnapshot;->rotationDegrees:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", completer="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/processing/AutoValue_DefaultSurfaceProcessor_PendingSnapshot;->completer:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
