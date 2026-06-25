.class public final synthetic Landroidx/camera/core/impl/DeferrableSurfaces$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/camera/core/impl/DeferrableSurfaces;"
    method = "lambda$surfaceListWithTimeout$0"
    proto = "(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;J)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Lcom/google/common/util/concurrent/ListenableFuture;

.field public final synthetic f$1:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

.field public final synthetic f$2:J


# direct methods
.method public synthetic constructor <init>(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;J)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/core/impl/DeferrableSurfaces$$ExternalSyntheticLambda1;->f$0:Lcom/google/common/util/concurrent/ListenableFuture;

    iput-object p2, p0, Landroidx/camera/core/impl/DeferrableSurfaces$$ExternalSyntheticLambda1;->f$1:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    iput-wide p3, p0, Landroidx/camera/core/impl/DeferrableSurfaces$$ExternalSyntheticLambda1;->f$2:J

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 0
    iget-object v0, p0, Landroidx/camera/core/impl/DeferrableSurfaces$$ExternalSyntheticLambda1;->f$0:Lcom/google/common/util/concurrent/ListenableFuture;

    iget-object v1, p0, Landroidx/camera/core/impl/DeferrableSurfaces$$ExternalSyntheticLambda1;->f$1:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    iget-wide v2, p0, Landroidx/camera/core/impl/DeferrableSurfaces$$ExternalSyntheticLambda1;->f$2:J

    invoke-static {v0, v1, v2, v3}, Landroidx/camera/core/impl/DeferrableSurfaces;->lambda$surfaceListWithTimeout$0(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;J)V

    return-void
.end method
