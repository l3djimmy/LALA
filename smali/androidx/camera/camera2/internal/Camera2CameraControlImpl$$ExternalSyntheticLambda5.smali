.class public final synthetic Landroidx/camera/camera2/internal/Camera2CameraControlImpl$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CaptureResultListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/camera/camera2/internal/Camera2CameraControlImpl;"
    method = "lambda$waitForSessionUpdateId$3"
    proto = "(JLandroidx/concurrent/futures/CallbackToFutureAdapter$Completer;Landroid/hardware/camera2/TotalCaptureResult;)Z"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:J

.field public final synthetic f$1:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;


# direct methods
.method public synthetic constructor <init>(JLandroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$$ExternalSyntheticLambda5;->f$0:J

    iput-object p3, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$$ExternalSyntheticLambda5;->f$1:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    return-void
.end method


# virtual methods
.method public final onCaptureResult(Landroid/hardware/camera2/TotalCaptureResult;)Z
    .locals 3

    .line 0
    iget-wide v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$$ExternalSyntheticLambda5;->f$0:J

    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$$ExternalSyntheticLambda5;->f$1:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    invoke-static {v0, v1, v2, p1}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->lambda$waitForSessionUpdateId$3(JLandroidx/concurrent/futures/CallbackToFutureAdapter$Completer;Landroid/hardware/camera2/TotalCaptureResult;)Z

    move-result p1

    return p1
.end method
