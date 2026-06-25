.class public final synthetic Landroidx/camera/view/PreviewView$1$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/camera/core/SurfaceRequest$TransformationInfoListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/camera/view/PreviewView$1;"
    method = "lambda$onSurfaceRequested$1"
    proto = "(Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/core/SurfaceRequest;Landroidx/camera/core/SurfaceRequest$TransformationInfo;)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroidx/camera/view/PreviewView$1;

.field public final synthetic f$1:Landroidx/camera/core/impl/CameraInternal;

.field public final synthetic f$2:Landroidx/camera/core/SurfaceRequest;


# direct methods
.method public synthetic constructor <init>(Landroidx/camera/view/PreviewView$1;Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/core/SurfaceRequest;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/view/PreviewView$1$$ExternalSyntheticLambda2;->f$0:Landroidx/camera/view/PreviewView$1;

    iput-object p2, p0, Landroidx/camera/view/PreviewView$1$$ExternalSyntheticLambda2;->f$1:Landroidx/camera/core/impl/CameraInternal;

    iput-object p3, p0, Landroidx/camera/view/PreviewView$1$$ExternalSyntheticLambda2;->f$2:Landroidx/camera/core/SurfaceRequest;

    return-void
.end method


# virtual methods
.method public final onTransformationInfoUpdate(Landroidx/camera/core/SurfaceRequest$TransformationInfo;)V
    .locals 3

    .line 0
    iget-object v0, p0, Landroidx/camera/view/PreviewView$1$$ExternalSyntheticLambda2;->f$0:Landroidx/camera/view/PreviewView$1;

    iget-object v1, p0, Landroidx/camera/view/PreviewView$1$$ExternalSyntheticLambda2;->f$1:Landroidx/camera/core/impl/CameraInternal;

    iget-object v2, p0, Landroidx/camera/view/PreviewView$1$$ExternalSyntheticLambda2;->f$2:Landroidx/camera/core/SurfaceRequest;

    invoke-virtual {v0, v1, v2, p1}, Landroidx/camera/view/PreviewView$1;->lambda$onSurfaceRequested$1$androidx-camera-view-PreviewView$1(Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/core/SurfaceRequest;Landroidx/camera/core/SurfaceRequest$TransformationInfo;)V

    return-void
.end method
