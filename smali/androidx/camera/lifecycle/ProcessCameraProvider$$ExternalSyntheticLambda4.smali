.class public final synthetic Landroidx/camera/lifecycle/ProcessCameraProvider$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/camera/core/impl/utils/futures/AsyncFunction;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/camera/lifecycle/ProcessCameraProvider;"
    method = "lambda$getOrCreateCameraXInstance$1"
    proto = "(Landroidx/camera/core/CameraX;Ljava/lang/Void;)Lcom/google/common/util/concurrent/ListenableFuture;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroidx/camera/core/CameraX;


# direct methods
.method public synthetic constructor <init>(Landroidx/camera/core/CameraX;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/lifecycle/ProcessCameraProvider$$ExternalSyntheticLambda4;->f$0:Landroidx/camera/core/CameraX;

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1

    .line 0
    iget-object v0, p0, Landroidx/camera/lifecycle/ProcessCameraProvider$$ExternalSyntheticLambda4;->f$0:Landroidx/camera/core/CameraX;

    check-cast p1, Ljava/lang/Void;

    invoke-static {v0, p1}, Landroidx/camera/lifecycle/ProcessCameraProvider;->lambda$getOrCreateCameraXInstance$1(Landroidx/camera/core/CameraX;Ljava/lang/Void;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object p1

    return-object p1
.end method
