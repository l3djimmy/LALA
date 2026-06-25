.class public final synthetic Landroidx/camera/core/internal/CameraUseCaseAdapter$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/core/util/Consumer;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/camera/core/internal/CameraUseCaseAdapter;"
    method = "lambda$createExtraPreview$0"
    proto = "(Landroid/view/Surface;Landroid/graphics/SurfaceTexture;Landroidx/camera/core/SurfaceRequest$Result;)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/view/Surface;

.field public final synthetic f$1:Landroid/graphics/SurfaceTexture;


# direct methods
.method public synthetic constructor <init>(Landroid/view/Surface;Landroid/graphics/SurfaceTexture;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter$$ExternalSyntheticLambda0;->f$0:Landroid/view/Surface;

    iput-object p2, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter$$ExternalSyntheticLambda0;->f$1:Landroid/graphics/SurfaceTexture;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 2

    .line 0
    iget-object v0, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter$$ExternalSyntheticLambda0;->f$0:Landroid/view/Surface;

    iget-object v1, p0, Landroidx/camera/core/internal/CameraUseCaseAdapter$$ExternalSyntheticLambda0;->f$1:Landroid/graphics/SurfaceTexture;

    check-cast p1, Landroidx/camera/core/SurfaceRequest$Result;

    invoke-static {v0, v1, p1}, Landroidx/camera/core/internal/CameraUseCaseAdapter;->lambda$createExtraPreview$0(Landroid/view/Surface;Landroid/graphics/SurfaceTexture;Landroidx/camera/core/SurfaceRequest$Result;)V

    return-void
.end method
