.class public Landroidx/camera/core/impl/LensFacingCameraFilter;
.super Ljava/lang/Object;
.source "LensFacingCameraFilter.java"

# interfaces
.implements Landroidx/camera/core/CameraFilter;


# instance fields
.field private final mLensFacing:I


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .param p1, "lensFacing"    # I

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput p1, p0, Landroidx/camera/core/impl/LensFacingCameraFilter;->mLensFacing:I

    .line 39
    return-void
.end method


# virtual methods
.method public filter(Ljava/util/List;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/CameraInfo;",
            ">;)",
            "Ljava/util/List<",
            "Landroidx/camera/core/CameraInfo;",
            ">;"
        }
    .end annotation

    .line 44
    .local p1, "cameraInfos":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/CameraInfo;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 45
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/CameraInfo;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/CameraInfo;

    .line 46
    .local v2, "cameraInfo":Landroidx/camera/core/CameraInfo;
    instance-of v3, v2, Landroidx/camera/core/impl/CameraInfoInternal;

    const-string/jumbo v4, "The camera info doesn\'t contain internal implementation."

    invoke-static {v3, v4}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 48
    invoke-interface {v2}, Landroidx/camera/core/CameraInfo;->getLensFacing()I

    move-result v3

    .line 49
    .local v3, "lensFacing":I
    iget v4, p0, Landroidx/camera/core/impl/LensFacingCameraFilter;->mLensFacing:I

    if-ne v3, v4, :cond_0

    .line 50
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    .end local v2    # "cameraInfo":Landroidx/camera/core/CameraInfo;
    .end local v3    # "lensFacing":I
    :cond_0
    goto :goto_0

    .line 54
    :cond_1
    return-object v0
.end method

.method public getLensFacing()I
    .locals 1

    .line 60
    iget v0, p0, Landroidx/camera/core/impl/LensFacingCameraFilter;->mLensFacing:I

    return v0
.end method
