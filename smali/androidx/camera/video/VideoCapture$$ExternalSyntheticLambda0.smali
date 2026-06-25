.class public final synthetic Landroidx/camera/video/VideoCapture$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/camera/video/VideoCapture;"
    method = "lambda$setupSurfaceUpdateNotifier$5"
    proto = "(Ljava/util/concurrent/atomic/AtomicBoolean;Landroidx/camera/core/impl/SessionConfig$Builder;Landroidx/camera/core/impl/CameraCaptureCallback;)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final synthetic f$1:Landroidx/camera/core/impl/SessionConfig$Builder;

.field public final synthetic f$2:Landroidx/camera/core/impl/CameraCaptureCallback;


# direct methods
.method public synthetic constructor <init>(Ljava/util/concurrent/atomic/AtomicBoolean;Landroidx/camera/core/impl/SessionConfig$Builder;Landroidx/camera/core/impl/CameraCaptureCallback;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/video/VideoCapture$$ExternalSyntheticLambda0;->f$0:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-object p2, p0, Landroidx/camera/video/VideoCapture$$ExternalSyntheticLambda0;->f$1:Landroidx/camera/core/impl/SessionConfig$Builder;

    iput-object p3, p0, Landroidx/camera/video/VideoCapture$$ExternalSyntheticLambda0;->f$2:Landroidx/camera/core/impl/CameraCaptureCallback;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 0
    iget-object v0, p0, Landroidx/camera/video/VideoCapture$$ExternalSyntheticLambda0;->f$0:Ljava/util/concurrent/atomic/AtomicBoolean;

    iget-object v1, p0, Landroidx/camera/video/VideoCapture$$ExternalSyntheticLambda0;->f$1:Landroidx/camera/core/impl/SessionConfig$Builder;

    iget-object v2, p0, Landroidx/camera/video/VideoCapture$$ExternalSyntheticLambda0;->f$2:Landroidx/camera/core/impl/CameraCaptureCallback;

    invoke-static {v0, v1, v2}, Landroidx/camera/video/VideoCapture;->lambda$setupSurfaceUpdateNotifier$5(Ljava/util/concurrent/atomic/AtomicBoolean;Landroidx/camera/core/impl/SessionConfig$Builder;Landroidx/camera/core/impl/CameraCaptureCallback;)V

    return-void
.end method
