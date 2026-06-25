.class public final Landroidx/camera/core/CameraSelector;
.super Ljava/lang/Object;
.source "CameraSelector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/CameraSelector$Builder;,
        Landroidx/camera/core/CameraSelector$LensFacing;
    }
.end annotation


# static fields
.field public static final DEFAULT_BACK_CAMERA:Landroidx/camera/core/CameraSelector;

.field public static final DEFAULT_FRONT_CAMERA:Landroidx/camera/core/CameraSelector;

.field public static final LENS_FACING_BACK:I = 0x1

.field public static final LENS_FACING_EXTERNAL:I = 0x2

.field public static final LENS_FACING_FRONT:I = 0x0

.field public static final LENS_FACING_UNKNOWN:I = -0x1


# instance fields
.field private mCameraFilterSet:Ljava/util/LinkedHashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashSet<",
            "Landroidx/camera/core/CameraFilter;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 62
    new-instance v0, Landroidx/camera/core/CameraSelector$Builder;

    invoke-direct {v0}, Landroidx/camera/core/CameraSelector$Builder;-><init>()V

    .line 63
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/camera/core/CameraSelector$Builder;->requireLensFacing(I)Landroidx/camera/core/CameraSelector$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/CameraSelector$Builder;->build()Landroidx/camera/core/CameraSelector;

    move-result-object v0

    sput-object v0, Landroidx/camera/core/CameraSelector;->DEFAULT_FRONT_CAMERA:Landroidx/camera/core/CameraSelector;

    .line 66
    new-instance v0, Landroidx/camera/core/CameraSelector$Builder;

    invoke-direct {v0}, Landroidx/camera/core/CameraSelector$Builder;-><init>()V

    .line 67
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/camera/core/CameraSelector$Builder;->requireLensFacing(I)Landroidx/camera/core/CameraSelector$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/CameraSelector$Builder;->build()Landroidx/camera/core/CameraSelector;

    move-result-object v0

    sput-object v0, Landroidx/camera/core/CameraSelector;->DEFAULT_BACK_CAMERA:Landroidx/camera/core/CameraSelector;

    .line 66
    return-void
.end method

.method constructor <init>(Ljava/util/LinkedHashSet;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/LinkedHashSet<",
            "Landroidx/camera/core/CameraFilter;",
            ">;)V"
        }
    .end annotation

    .line 71
    .local p1, "cameraFilterSet":Ljava/util/LinkedHashSet;, "Ljava/util/LinkedHashSet<Landroidx/camera/core/CameraFilter;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    iput-object p1, p0, Landroidx/camera/core/CameraSelector;->mCameraFilterSet:Ljava/util/LinkedHashSet;

    .line 73
    return-void
.end method


# virtual methods
.method public filter(Ljava/util/LinkedHashSet;)Ljava/util/LinkedHashSet;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/LinkedHashSet<",
            "Landroidx/camera/core/impl/CameraInternal;",
            ">;)",
            "Ljava/util/LinkedHashSet<",
            "Landroidx/camera/core/impl/CameraInternal;",
            ">;"
        }
    .end annotation

    .line 148
    .local p1, "cameras":Ljava/util/LinkedHashSet;, "Ljava/util/LinkedHashSet<Landroidx/camera/core/impl/CameraInternal;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 149
    .local v0, "input":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/CameraInfo;>;"
    invoke-virtual {p1}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/CameraInternal;

    .line 150
    .local v2, "camera":Landroidx/camera/core/impl/CameraInternal;
    invoke-interface {v2}, Landroidx/camera/core/impl/CameraInternal;->getCameraInfo()Landroidx/camera/core/CameraInfo;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 151
    .end local v2    # "camera":Landroidx/camera/core/impl/CameraInternal;
    goto :goto_0

    .line 153
    :cond_0
    invoke-virtual {p0, v0}, Landroidx/camera/core/CameraSelector;->filter(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    .line 155
    .local v1, "result":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/CameraInfo;>;"
    new-instance v2, Ljava/util/LinkedHashSet;

    invoke-direct {v2}, Ljava/util/LinkedHashSet;-><init>()V

    .line 156
    .local v2, "output":Ljava/util/LinkedHashSet;, "Ljava/util/LinkedHashSet<Landroidx/camera/core/impl/CameraInternal;>;"
    invoke-virtual {p1}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/core/impl/CameraInternal;

    .line 157
    .local v4, "camera":Landroidx/camera/core/impl/CameraInternal;
    invoke-interface {v4}, Landroidx/camera/core/impl/CameraInternal;->getCameraInfo()Landroidx/camera/core/CameraInfo;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 158
    invoke-virtual {v2, v4}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    .line 160
    .end local v4    # "camera":Landroidx/camera/core/impl/CameraInternal;
    :cond_1
    goto :goto_1

    .line 162
    :cond_2
    return-object v2
.end method

.method public filter(Ljava/util/List;)Ljava/util/List;
    .locals 4
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

    .line 126
    .local p1, "cameraInfos":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/CameraInfo;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 127
    .local v0, "output":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/CameraInfo;>;"
    iget-object v1, p0, Landroidx/camera/core/CameraSelector;->mCameraFilterSet:Ljava/util/LinkedHashSet;

    invoke-virtual {v1}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/CameraFilter;

    .line 128
    .local v2, "filter":Landroidx/camera/core/CameraFilter;
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v2, v3}, Landroidx/camera/core/CameraFilter;->filter(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 129
    .end local v2    # "filter":Landroidx/camera/core/CameraFilter;
    goto :goto_0

    .line 131
    :cond_0
    invoke-interface {v0, p1}, Ljava/util/List;->retainAll(Ljava/util/Collection;)Z

    .line 132
    return-object v0
.end method

.method public getCameraFilterSet()Ljava/util/LinkedHashSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/LinkedHashSet<",
            "Landroidx/camera/core/CameraFilter;",
            ">;"
        }
    .end annotation

    .line 172
    iget-object v0, p0, Landroidx/camera/core/CameraSelector;->mCameraFilterSet:Ljava/util/LinkedHashSet;

    return-object v0
.end method

.method public getLensFacing()Ljava/lang/Integer;
    .locals 5

    .line 187
    const/4 v0, 0x0

    .line 188
    .local v0, "currentLensFacing":Ljava/lang/Integer;
    iget-object v1, p0, Landroidx/camera/core/CameraSelector;->mCameraFilterSet:Ljava/util/LinkedHashSet;

    invoke-virtual {v1}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/CameraFilter;

    .line 189
    .local v2, "filter":Landroidx/camera/core/CameraFilter;
    instance-of v3, v2, Landroidx/camera/core/impl/LensFacingCameraFilter;

    if-eqz v3, :cond_2

    .line 190
    move-object v3, v2

    check-cast v3, Landroidx/camera/core/impl/LensFacingCameraFilter;

    invoke-virtual {v3}, Landroidx/camera/core/impl/LensFacingCameraFilter;->getLensFacing()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 191
    .local v3, "newLensFacing":Ljava/lang/Integer;
    if-nez v0, :cond_0

    .line 192
    move-object v0, v3

    goto :goto_1

    .line 193
    :cond_0
    invoke-virtual {v0, v3}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    goto :goto_1

    .line 198
    :cond_1
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v4, "Multiple conflicting lens facing requirements exist."

    invoke-direct {v1, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 202
    .end local v2    # "filter":Landroidx/camera/core/CameraFilter;
    .end local v3    # "newLensFacing":Ljava/lang/Integer;
    :cond_2
    :goto_1
    goto :goto_0

    .line 204
    :cond_3
    return-object v0
.end method

.method public select(Ljava/util/LinkedHashSet;)Landroidx/camera/core/impl/CameraInternal;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/LinkedHashSet<",
            "Landroidx/camera/core/impl/CameraInternal;",
            ">;)",
            "Landroidx/camera/core/impl/CameraInternal;"
        }
    .end annotation

    .line 90
    .local p1, "cameras":Ljava/util/LinkedHashSet;, "Ljava/util/LinkedHashSet<Landroidx/camera/core/impl/CameraInternal;>;"
    invoke-virtual {p0, p1}, Landroidx/camera/core/CameraSelector;->filter(Ljava/util/LinkedHashSet;)Ljava/util/LinkedHashSet;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 91
    .local v0, "cameraInternalIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroidx/camera/core/impl/CameraInternal;>;"
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 92
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/CameraInternal;

    return-object v1

    .line 94
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "No available camera can be found"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
