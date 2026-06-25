.class public final synthetic Landroidx/camera/view/SurfaceViewImplementation$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/PixelCopy$OnPixelCopyFinishedListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/camera/view/SurfaceViewImplementation;"
    method = "lambda$getPreviewBitmap$1"
    proto = "(Ljava/util/concurrent/Semaphore;I)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Ljava/util/concurrent/Semaphore;


# direct methods
.method public synthetic constructor <init>(Ljava/util/concurrent/Semaphore;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/view/SurfaceViewImplementation$$ExternalSyntheticLambda2;->f$0:Ljava/util/concurrent/Semaphore;

    return-void
.end method


# virtual methods
.method public final onPixelCopyFinished(I)V
    .locals 1

    .line 0
    iget-object v0, p0, Landroidx/camera/view/SurfaceViewImplementation$$ExternalSyntheticLambda2;->f$0:Ljava/util/concurrent/Semaphore;

    invoke-static {v0, p1}, Landroidx/camera/view/SurfaceViewImplementation;->lambda$getPreviewBitmap$1(Ljava/util/concurrent/Semaphore;I)V

    return-void
.end method
