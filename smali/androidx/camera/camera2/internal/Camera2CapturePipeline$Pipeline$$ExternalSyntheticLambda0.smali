.class public final synthetic Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/camera/camera2/internal/Camera2CapturePipeline$ResultListener$Checker;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;"
    method = "lambda$executeCapture$1"
    proto = "(Landroid/hardware/camera2/TotalCaptureResult;)Z"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final check(Landroid/hardware/camera2/TotalCaptureResult;)Z
    .locals 0

    .line 0
    invoke-static {p1}, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->lambda$executeCapture$1(Landroid/hardware/camera2/TotalCaptureResult;)Z

    move-result p1

    return p1
.end method
