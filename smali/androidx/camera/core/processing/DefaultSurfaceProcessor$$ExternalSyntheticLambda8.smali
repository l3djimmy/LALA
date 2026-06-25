.class public final synthetic Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda8;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/core/util/Consumer;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/camera/core/processing/DefaultSurfaceProcessor;"
    method = "lambda$onInputSurface$0"
    proto = "(Landroid/graphics/SurfaceTexture;Landroid/view/Surface;Landroidx/camera/core/SurfaceRequest$Result;)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroidx/camera/core/processing/DefaultSurfaceProcessor;

.field public final synthetic f$1:Landroid/graphics/SurfaceTexture;

.field public final synthetic f$2:Landroid/view/Surface;


# direct methods
.method public synthetic constructor <init>(Landroidx/camera/core/processing/DefaultSurfaceProcessor;Landroid/graphics/SurfaceTexture;Landroid/view/Surface;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda8;->f$0:Landroidx/camera/core/processing/DefaultSurfaceProcessor;

    iput-object p2, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda8;->f$1:Landroid/graphics/SurfaceTexture;

    iput-object p3, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda8;->f$2:Landroid/view/Surface;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 3

    .line 0
    iget-object v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda8;->f$0:Landroidx/camera/core/processing/DefaultSurfaceProcessor;

    iget-object v1, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda8;->f$1:Landroid/graphics/SurfaceTexture;

    iget-object v2, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda8;->f$2:Landroid/view/Surface;

    check-cast p1, Landroidx/camera/core/SurfaceRequest$Result;

    invoke-virtual {v0, v1, v2, p1}, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->lambda$onInputSurface$0$androidx-camera-core-processing-DefaultSurfaceProcessor(Landroid/graphics/SurfaceTexture;Landroid/view/Surface;Landroidx/camera/core/SurfaceRequest$Result;)V

    return-void
.end method
