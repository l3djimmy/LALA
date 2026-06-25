.class public final Landroidx/camera/core/CameraSelector$Builder;
.super Ljava/lang/Object;
.source "CameraSelector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/core/CameraSelector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private final mCameraFilterSet:Ljava/util/LinkedHashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashSet<",
            "Landroidx/camera/core/CameraFilter;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 211
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 212
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/CameraSelector$Builder;->mCameraFilterSet:Ljava/util/LinkedHashSet;

    .line 213
    return-void
.end method

.method private constructor <init>(Ljava/util/LinkedHashSet;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/LinkedHashSet<",
            "Landroidx/camera/core/CameraFilter;",
            ">;)V"
        }
    .end annotation

    .line 215
    .local p1, "cameraFilterSet":Ljava/util/LinkedHashSet;, "Ljava/util/LinkedHashSet<Landroidx/camera/core/CameraFilter;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 216
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0, p1}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Landroidx/camera/core/CameraSelector$Builder;->mCameraFilterSet:Ljava/util/LinkedHashSet;

    .line 217
    return-void
.end method

.method public static fromSelector(Landroidx/camera/core/CameraSelector;)Landroidx/camera/core/CameraSelector$Builder;
    .locals 2
    .param p0, "cameraSelector"    # Landroidx/camera/core/CameraSelector;

    .line 268
    new-instance v0, Landroidx/camera/core/CameraSelector$Builder;

    .line 269
    invoke-virtual {p0}, Landroidx/camera/core/CameraSelector;->getCameraFilterSet()Ljava/util/LinkedHashSet;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/camera/core/CameraSelector$Builder;-><init>(Ljava/util/LinkedHashSet;)V

    .line 270
    .local v0, "builder":Landroidx/camera/core/CameraSelector$Builder;
    return-object v0
.end method


# virtual methods
.method public addCameraFilter(Landroidx/camera/core/CameraFilter;)Landroidx/camera/core/CameraSelector$Builder;
    .locals 1
    .param p1, "cameraFilter"    # Landroidx/camera/core/CameraFilter;

    .line 255
    iget-object v0, p0, Landroidx/camera/core/CameraSelector$Builder;->mCameraFilterSet:Ljava/util/LinkedHashSet;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    .line 256
    return-object p0
.end method

.method public build()Landroidx/camera/core/CameraSelector;
    .locals 2

    .line 276
    new-instance v0, Landroidx/camera/core/CameraSelector;

    iget-object v1, p0, Landroidx/camera/core/CameraSelector$Builder;->mCameraFilterSet:Ljava/util/LinkedHashSet;

    invoke-direct {v0, v1}, Landroidx/camera/core/CameraSelector;-><init>(Ljava/util/LinkedHashSet;)V

    return-object v0
.end method

.method public requireLensFacing(I)Landroidx/camera/core/CameraSelector$Builder;
    .locals 2
    .param p1, "lensFacing"    # I

    .line 236
    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string/jumbo v1, "The specified lens facing is invalid."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 238
    iget-object v0, p0, Landroidx/camera/core/CameraSelector$Builder;->mCameraFilterSet:Ljava/util/LinkedHashSet;

    new-instance v1, Landroidx/camera/core/impl/LensFacingCameraFilter;

    invoke-direct {v1, p1}, Landroidx/camera/core/impl/LensFacingCameraFilter;-><init>(I)V

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    .line 239
    return-object p0
.end method
