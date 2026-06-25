.class public final synthetic Landroidx/camera/core/imagecapture/TakePictureRequest$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/camera/core/imagecapture/TakePictureRequest;"
    method = "lambda$onResult$2"
    proto = "(Landroidx/camera/core/ImageProxy;)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroidx/camera/core/imagecapture/TakePictureRequest;

.field public final synthetic f$1:Landroidx/camera/core/ImageProxy;


# direct methods
.method public synthetic constructor <init>(Landroidx/camera/core/imagecapture/TakePictureRequest;Landroidx/camera/core/ImageProxy;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/core/imagecapture/TakePictureRequest$$ExternalSyntheticLambda0;->f$0:Landroidx/camera/core/imagecapture/TakePictureRequest;

    iput-object p2, p0, Landroidx/camera/core/imagecapture/TakePictureRequest$$ExternalSyntheticLambda0;->f$1:Landroidx/camera/core/ImageProxy;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 0
    iget-object v0, p0, Landroidx/camera/core/imagecapture/TakePictureRequest$$ExternalSyntheticLambda0;->f$0:Landroidx/camera/core/imagecapture/TakePictureRequest;

    iget-object v1, p0, Landroidx/camera/core/imagecapture/TakePictureRequest$$ExternalSyntheticLambda0;->f$1:Landroidx/camera/core/ImageProxy;

    invoke-virtual {v0, v1}, Landroidx/camera/core/imagecapture/TakePictureRequest;->lambda$onResult$2$androidx-camera-core-imagecapture-TakePictureRequest(Landroidx/camera/core/ImageProxy;)V

    return-void
.end method
