.class public final synthetic Landroidx/camera/camera2/internal/TorchControl$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CaptureResultListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/camera/camera2/internal/TorchControl;"
    method = "lambda$new$0"
    proto = "(Landroid/hardware/camera2/TotalCaptureResult;)Z"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroidx/camera/camera2/internal/TorchControl;


# direct methods
.method public synthetic constructor <init>(Landroidx/camera/camera2/internal/TorchControl;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/camera2/internal/TorchControl$$ExternalSyntheticLambda2;->f$0:Landroidx/camera/camera2/internal/TorchControl;

    return-void
.end method


# virtual methods
.method public final onCaptureResult(Landroid/hardware/camera2/TotalCaptureResult;)Z
    .locals 1

    .line 0
    iget-object v0, p0, Landroidx/camera/camera2/internal/TorchControl$$ExternalSyntheticLambda2;->f$0:Landroidx/camera/camera2/internal/TorchControl;

    invoke-virtual {v0, p1}, Landroidx/camera/camera2/internal/TorchControl;->lambda$new$0$androidx-camera-camera2-internal-TorchControl(Landroid/hardware/camera2/TotalCaptureResult;)Z

    move-result p1

    return p1
.end method
