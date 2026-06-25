.class public final synthetic Landroidx/camera/core/impl/CameraRepository$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/camera/core/impl/CameraRepository;"
    method = "lambda$deinit$0"
    proto = "(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroidx/camera/core/impl/CameraRepository;


# direct methods
.method public synthetic constructor <init>(Landroidx/camera/core/impl/CameraRepository;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/core/impl/CameraRepository$$ExternalSyntheticLambda0;->f$0:Landroidx/camera/core/impl/CameraRepository;

    return-void
.end method


# virtual methods
.method public final attachCompleter(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 1

    .line 0
    iget-object v0, p0, Landroidx/camera/core/impl/CameraRepository$$ExternalSyntheticLambda0;->f$0:Landroidx/camera/core/impl/CameraRepository;

    invoke-virtual {v0, p1}, Landroidx/camera/core/impl/CameraRepository;->lambda$deinit$0$androidx-camera-core-impl-CameraRepository(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
