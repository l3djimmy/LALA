.class public final synthetic Landroidx/camera/video/internal/audio/AudioSource$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/camera/video/internal/audio/AudioSource;"
    method = "lambda$mute$7"
    proto = "(Z)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroidx/camera/video/internal/audio/AudioSource;

.field public final synthetic f$1:Z


# direct methods
.method public synthetic constructor <init>(Landroidx/camera/video/internal/audio/AudioSource;Z)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/video/internal/audio/AudioSource$$ExternalSyntheticLambda0;->f$0:Landroidx/camera/video/internal/audio/AudioSource;

    iput-boolean p2, p0, Landroidx/camera/video/internal/audio/AudioSource$$ExternalSyntheticLambda0;->f$1:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 0
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource$$ExternalSyntheticLambda0;->f$0:Landroidx/camera/video/internal/audio/AudioSource;

    iget-boolean v1, p0, Landroidx/camera/video/internal/audio/AudioSource$$ExternalSyntheticLambda0;->f$1:Z

    invoke-virtual {v0, v1}, Landroidx/camera/video/internal/audio/AudioSource;->lambda$mute$7$androidx-camera-video-internal-audio-AudioSource(Z)V

    return-void
.end method
