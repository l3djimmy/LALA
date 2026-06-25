.class public final synthetic Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda10;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/camera/core/processing/DefaultSurfaceProcessor;"
    method = "lambda$initGlRenderer$9"
    proto = "(Landroidx/camera/core/DynamicRange;Landroidx/camera/core/processing/ShaderProvider;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroidx/camera/core/processing/DefaultSurfaceProcessor;

.field public final synthetic f$1:Landroidx/camera/core/DynamicRange;

.field public final synthetic f$2:Landroidx/camera/core/processing/ShaderProvider;


# direct methods
.method public synthetic constructor <init>(Landroidx/camera/core/processing/DefaultSurfaceProcessor;Landroidx/camera/core/DynamicRange;Landroidx/camera/core/processing/ShaderProvider;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda10;->f$0:Landroidx/camera/core/processing/DefaultSurfaceProcessor;

    iput-object p2, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda10;->f$1:Landroidx/camera/core/DynamicRange;

    iput-object p3, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda10;->f$2:Landroidx/camera/core/processing/ShaderProvider;

    return-void
.end method


# virtual methods
.method public final attachCompleter(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 3

    .line 0
    iget-object v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda10;->f$0:Landroidx/camera/core/processing/DefaultSurfaceProcessor;

    iget-object v1, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda10;->f$1:Landroidx/camera/core/DynamicRange;

    iget-object v2, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda10;->f$2:Landroidx/camera/core/processing/ShaderProvider;

    invoke-virtual {v0, v1, v2, p1}, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->lambda$initGlRenderer$9$androidx-camera-core-processing-DefaultSurfaceProcessor(Landroidx/camera/core/DynamicRange;Landroidx/camera/core/processing/ShaderProvider;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
