.class public final synthetic Landroidx/camera/camera2/internal/FocusMeteringControl$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/camera/camera2/internal/Camera2CameraControlImpl$CaptureResultListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/camera/camera2/internal/FocusMeteringControl;"
    method = "lambda$cancelFocusAndMeteringInternal$9"
    proto = "(IJLandroid/hardware/camera2/TotalCaptureResult;)Z"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroidx/camera/camera2/internal/FocusMeteringControl;

.field public final synthetic f$1:I

.field public final synthetic f$2:J


# direct methods
.method public synthetic constructor <init>(Landroidx/camera/camera2/internal/FocusMeteringControl;IJ)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/camera2/internal/FocusMeteringControl$$ExternalSyntheticLambda3;->f$0:Landroidx/camera/camera2/internal/FocusMeteringControl;

    iput p2, p0, Landroidx/camera/camera2/internal/FocusMeteringControl$$ExternalSyntheticLambda3;->f$1:I

    iput-wide p3, p0, Landroidx/camera/camera2/internal/FocusMeteringControl$$ExternalSyntheticLambda3;->f$2:J

    return-void
.end method


# virtual methods
.method public final onCaptureResult(Landroid/hardware/camera2/TotalCaptureResult;)Z
    .locals 4

    .line 0
    iget-object v0, p0, Landroidx/camera/camera2/internal/FocusMeteringControl$$ExternalSyntheticLambda3;->f$0:Landroidx/camera/camera2/internal/FocusMeteringControl;

    iget v1, p0, Landroidx/camera/camera2/internal/FocusMeteringControl$$ExternalSyntheticLambda3;->f$1:I

    iget-wide v2, p0, Landroidx/camera/camera2/internal/FocusMeteringControl$$ExternalSyntheticLambda3;->f$2:J

    invoke-virtual {v0, v1, v2, v3, p1}, Landroidx/camera/camera2/internal/FocusMeteringControl;->lambda$cancelFocusAndMeteringInternal$9$androidx-camera-camera2-internal-FocusMeteringControl(IJLandroid/hardware/camera2/TotalCaptureResult;)Z

    move-result p1

    return p1
.end method
