.class public final synthetic Landroidx/camera/video/VideoEncoderSession$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/camera/video/VideoEncoderSession;"
    method = "lambda$configure$2"
    proto = "(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/core/impl/Timebase;Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;Landroidx/camera/video/MediaSpec;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroidx/camera/video/VideoEncoderSession;

.field public final synthetic f$1:Landroidx/camera/core/SurfaceRequest;

.field public final synthetic f$2:Landroidx/camera/core/impl/Timebase;

.field public final synthetic f$3:Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

.field public final synthetic f$4:Landroidx/camera/video/MediaSpec;


# direct methods
.method public synthetic constructor <init>(Landroidx/camera/video/VideoEncoderSession;Landroidx/camera/core/SurfaceRequest;Landroidx/camera/core/impl/Timebase;Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;Landroidx/camera/video/MediaSpec;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/video/VideoEncoderSession$$ExternalSyntheticLambda4;->f$0:Landroidx/camera/video/VideoEncoderSession;

    iput-object p2, p0, Landroidx/camera/video/VideoEncoderSession$$ExternalSyntheticLambda4;->f$1:Landroidx/camera/core/SurfaceRequest;

    iput-object p3, p0, Landroidx/camera/video/VideoEncoderSession$$ExternalSyntheticLambda4;->f$2:Landroidx/camera/core/impl/Timebase;

    iput-object p4, p0, Landroidx/camera/video/VideoEncoderSession$$ExternalSyntheticLambda4;->f$3:Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    iput-object p5, p0, Landroidx/camera/video/VideoEncoderSession$$ExternalSyntheticLambda4;->f$4:Landroidx/camera/video/MediaSpec;

    return-void
.end method


# virtual methods
.method public final attachCompleter(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 6

    .line 0
    iget-object v0, p0, Landroidx/camera/video/VideoEncoderSession$$ExternalSyntheticLambda4;->f$0:Landroidx/camera/video/VideoEncoderSession;

    iget-object v1, p0, Landroidx/camera/video/VideoEncoderSession$$ExternalSyntheticLambda4;->f$1:Landroidx/camera/core/SurfaceRequest;

    iget-object v2, p0, Landroidx/camera/video/VideoEncoderSession$$ExternalSyntheticLambda4;->f$2:Landroidx/camera/core/impl/Timebase;

    iget-object v3, p0, Landroidx/camera/video/VideoEncoderSession$$ExternalSyntheticLambda4;->f$3:Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    iget-object v4, p0, Landroidx/camera/video/VideoEncoderSession$$ExternalSyntheticLambda4;->f$4:Landroidx/camera/video/MediaSpec;

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Landroidx/camera/video/VideoEncoderSession;->lambda$configure$2$androidx-camera-video-VideoEncoderSession(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/core/impl/Timebase;Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;Landroidx/camera/video/MediaSpec;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
