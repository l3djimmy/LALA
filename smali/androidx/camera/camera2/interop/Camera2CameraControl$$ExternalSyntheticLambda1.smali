.class public final synthetic Landroidx/camera/camera2/interop/Camera2CameraControl$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/camera/camera2/interop/Camera2CameraControl;"
    method = "lambda$addCaptureRequestOptions$3"
    proto = "(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroidx/camera/camera2/interop/Camera2CameraControl;

.field public final synthetic f$1:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;


# direct methods
.method public synthetic constructor <init>(Landroidx/camera/camera2/interop/Camera2CameraControl;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/camera2/interop/Camera2CameraControl$$ExternalSyntheticLambda1;->f$0:Landroidx/camera/camera2/interop/Camera2CameraControl;

    iput-object p2, p0, Landroidx/camera/camera2/interop/Camera2CameraControl$$ExternalSyntheticLambda1;->f$1:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 0
    iget-object v0, p0, Landroidx/camera/camera2/interop/Camera2CameraControl$$ExternalSyntheticLambda1;->f$0:Landroidx/camera/camera2/interop/Camera2CameraControl;

    iget-object v1, p0, Landroidx/camera/camera2/interop/Camera2CameraControl$$ExternalSyntheticLambda1;->f$1:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    invoke-virtual {v0, v1}, Landroidx/camera/camera2/interop/Camera2CameraControl;->lambda$addCaptureRequestOptions$3$androidx-camera-camera2-interop-Camera2CameraControl(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V

    return-void
.end method
