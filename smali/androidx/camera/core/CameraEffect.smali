.class public abstract Landroidx/camera/core/CameraEffect;
.super Ljava/lang/Object;
.source "CameraEffect.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/CameraEffect$Formats;,
        Landroidx/camera/core/CameraEffect$Targets;
    }
.end annotation


# static fields
.field public static final IMAGE_CAPTURE:I = 0x4

.field public static final PREVIEW:I = 0x1

.field private static final SURFACE_PROCESSOR_TARGETS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final VIDEO_CAPTURE:I = 0x2


# instance fields
.field private final mErrorListener:Landroidx/core/util/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/core/util/Consumer<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field private final mExecutor:Ljava/util/concurrent/Executor;

.field private final mImageProcessor:Landroidx/camera/core/ImageProcessor;

.field private final mSurfaceProcessor:Landroidx/camera/core/SurfaceProcessor;

.field private final mTargets:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 120
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Integer;

    .line 121
    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v0, v3

    .line 122
    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v0, v1

    .line 123
    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v0, v2

    .line 124
    const/4 v2, 0x7

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    .line 120
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Landroidx/camera/core/CameraEffect;->SURFACE_PROCESSOR_TARGETS:Ljava/util/List;

    return-void
.end method

.method protected constructor <init>(ILjava/util/concurrent/Executor;Landroidx/camera/core/ImageProcessor;Landroidx/core/util/Consumer;)V
    .locals 2
    .param p1, "targets"    # I
    .param p2, "executor"    # Ljava/util/concurrent/Executor;
    .param p3, "imageProcessor"    # Landroidx/camera/core/ImageProcessor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/concurrent/Executor;",
            "Landroidx/camera/core/ImageProcessor;",
            "Landroidx/core/util/Consumer<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .line 154
    .local p4, "errorListener":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Ljava/lang/Throwable;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 155
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "Currently ImageProcessor can only target IMAGE_CAPTURE."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 157
    iput p1, p0, Landroidx/camera/core/CameraEffect;->mTargets:I

    .line 158
    iput-object p2, p0, Landroidx/camera/core/CameraEffect;->mExecutor:Ljava/util/concurrent/Executor;

    .line 159
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/core/CameraEffect;->mSurfaceProcessor:Landroidx/camera/core/SurfaceProcessor;

    .line 160
    iput-object p3, p0, Landroidx/camera/core/CameraEffect;->mImageProcessor:Landroidx/camera/core/ImageProcessor;

    .line 161
    iput-object p4, p0, Landroidx/camera/core/CameraEffect;->mErrorListener:Landroidx/core/util/Consumer;

    .line 162
    return-void
.end method

.method protected constructor <init>(ILjava/util/concurrent/Executor;Landroidx/camera/core/SurfaceProcessor;Landroidx/core/util/Consumer;)V
    .locals 1
    .param p1, "targets"    # I
    .param p2, "executor"    # Ljava/util/concurrent/Executor;
    .param p3, "surfaceProcessor"    # Landroidx/camera/core/SurfaceProcessor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/concurrent/Executor;",
            "Landroidx/camera/core/SurfaceProcessor;",
            "Landroidx/core/util/Consumer<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .line 191
    .local p4, "errorListener":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Ljava/lang/Throwable;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 192
    sget-object v0, Landroidx/camera/core/CameraEffect;->SURFACE_PROCESSOR_TARGETS:Ljava/util/List;

    invoke-static {v0, p1}, Landroidx/camera/core/processing/TargetUtils;->checkSupportedTargets(Ljava/util/Collection;I)V

    .line 193
    iput p1, p0, Landroidx/camera/core/CameraEffect;->mTargets:I

    .line 194
    iput-object p2, p0, Landroidx/camera/core/CameraEffect;->mExecutor:Ljava/util/concurrent/Executor;

    .line 195
    iput-object p3, p0, Landroidx/camera/core/CameraEffect;->mSurfaceProcessor:Landroidx/camera/core/SurfaceProcessor;

    .line 196
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/core/CameraEffect;->mImageProcessor:Landroidx/camera/core/ImageProcessor;

    .line 197
    iput-object p4, p0, Landroidx/camera/core/CameraEffect;->mErrorListener:Landroidx/core/util/Consumer;

    .line 198
    return-void
.end method


# virtual methods
.method public createSurfaceProcessorInternal()Landroidx/camera/core/processing/SurfaceProcessorInternal;
    .locals 1

    .line 257
    new-instance v0, Landroidx/camera/core/processing/SurfaceProcessorWithExecutor;

    invoke-direct {v0, p0}, Landroidx/camera/core/processing/SurfaceProcessorWithExecutor;-><init>(Landroidx/camera/core/CameraEffect;)V

    return-object v0
.end method

.method public getErrorListener()Landroidx/core/util/Consumer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/core/util/Consumer<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation

    .line 226
    iget-object v0, p0, Landroidx/camera/core/CameraEffect;->mErrorListener:Landroidx/core/util/Consumer;

    return-object v0
.end method

.method public getExecutor()Ljava/util/concurrent/Executor;
    .locals 1

    .line 215
    iget-object v0, p0, Landroidx/camera/core/CameraEffect;->mExecutor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method public getImageProcessor()Landroidx/camera/core/ImageProcessor;
    .locals 1

    .line 243
    iget-object v0, p0, Landroidx/camera/core/CameraEffect;->mImageProcessor:Landroidx/camera/core/ImageProcessor;

    return-object v0
.end method

.method public getSurfaceProcessor()Landroidx/camera/core/SurfaceProcessor;
    .locals 1

    .line 234
    iget-object v0, p0, Landroidx/camera/core/CameraEffect;->mSurfaceProcessor:Landroidx/camera/core/SurfaceProcessor;

    return-object v0
.end method

.method public getTargets()I
    .locals 1

    .line 205
    iget v0, p0, Landroidx/camera/core/CameraEffect;->mTargets:I

    return v0
.end method
