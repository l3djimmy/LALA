.class public final synthetic Landroidx/camera/camera2/internal/Camera2CameraControlImpl$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/camera/camera2/internal/Camera2CameraControlImpl;"
    method = "lambda$waitForSessionUpdateId$4"
    proto = "(JLandroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

.field public final synthetic f$1:J


# direct methods
.method public synthetic constructor <init>(Landroidx/camera/camera2/internal/Camera2CameraControlImpl;J)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$$ExternalSyntheticLambda4;->f$0:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    iput-wide p2, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$$ExternalSyntheticLambda4;->f$1:J

    return-void
.end method


# virtual methods
.method public final attachCompleter(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 3

    .line 0
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$$ExternalSyntheticLambda4;->f$0:Landroidx/camera/camera2/internal/Camera2CameraControlImpl;

    iget-wide v1, p0, Landroidx/camera/camera2/internal/Camera2CameraControlImpl$$ExternalSyntheticLambda4;->f$1:J

    invoke-virtual {v0, v1, v2, p1}, Landroidx/camera/camera2/internal/Camera2CameraControlImpl;->lambda$waitForSessionUpdateId$4$androidx-camera-camera2-internal-Camera2CameraControlImpl(JLandroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
