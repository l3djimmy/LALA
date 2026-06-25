.class public final synthetic Landroidx/camera/camera2/internal/compat/CameraDeviceCompat$StateCallbackExecutorWrapper$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/camera/camera2/internal/compat/CameraDeviceCompat$StateCallbackExecutorWrapper;"
    method = "lambda$onError$2"
    proto = "(Landroid/hardware/camera2/CameraDevice;I)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroidx/camera/camera2/internal/compat/CameraDeviceCompat$StateCallbackExecutorWrapper;

.field public final synthetic f$1:Landroid/hardware/camera2/CameraDevice;

.field public final synthetic f$2:I


# direct methods
.method public synthetic constructor <init>(Landroidx/camera/camera2/internal/compat/CameraDeviceCompat$StateCallbackExecutorWrapper;Landroid/hardware/camera2/CameraDevice;I)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/camera2/internal/compat/CameraDeviceCompat$StateCallbackExecutorWrapper$$ExternalSyntheticLambda1;->f$0:Landroidx/camera/camera2/internal/compat/CameraDeviceCompat$StateCallbackExecutorWrapper;

    iput-object p2, p0, Landroidx/camera/camera2/internal/compat/CameraDeviceCompat$StateCallbackExecutorWrapper$$ExternalSyntheticLambda1;->f$1:Landroid/hardware/camera2/CameraDevice;

    iput p3, p0, Landroidx/camera/camera2/internal/compat/CameraDeviceCompat$StateCallbackExecutorWrapper$$ExternalSyntheticLambda1;->f$2:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 0
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/CameraDeviceCompat$StateCallbackExecutorWrapper$$ExternalSyntheticLambda1;->f$0:Landroidx/camera/camera2/internal/compat/CameraDeviceCompat$StateCallbackExecutorWrapper;

    iget-object v1, p0, Landroidx/camera/camera2/internal/compat/CameraDeviceCompat$StateCallbackExecutorWrapper$$ExternalSyntheticLambda1;->f$1:Landroid/hardware/camera2/CameraDevice;

    iget v2, p0, Landroidx/camera/camera2/internal/compat/CameraDeviceCompat$StateCallbackExecutorWrapper$$ExternalSyntheticLambda1;->f$2:I

    invoke-virtual {v0, v1, v2}, Landroidx/camera/camera2/internal/compat/CameraDeviceCompat$StateCallbackExecutorWrapper;->lambda$onError$2$androidx-camera-camera2-internal-compat-CameraDeviceCompat$StateCallbackExecutorWrapper(Landroid/hardware/camera2/CameraDevice;I)V

    return-void
.end method
