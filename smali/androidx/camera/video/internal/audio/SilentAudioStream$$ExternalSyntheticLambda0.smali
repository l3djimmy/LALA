.class public final synthetic Landroidx/camera/video/internal/audio/SilentAudioStream$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/camera/video/internal/audio/SilentAudioStream;"
    method = "lambda$notifySilenced$0"
    proto = "(Landroidx/camera/video/internal/audio/AudioStream$AudioStreamCallback;)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroidx/camera/video/internal/audio/AudioStream$AudioStreamCallback;


# direct methods
.method public synthetic constructor <init>(Landroidx/camera/video/internal/audio/AudioStream$AudioStreamCallback;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/video/internal/audio/SilentAudioStream$$ExternalSyntheticLambda0;->f$0:Landroidx/camera/video/internal/audio/AudioStream$AudioStreamCallback;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 0
    iget-object v0, p0, Landroidx/camera/video/internal/audio/SilentAudioStream$$ExternalSyntheticLambda0;->f$0:Landroidx/camera/video/internal/audio/AudioStream$AudioStreamCallback;

    invoke-static {v0}, Landroidx/camera/video/internal/audio/SilentAudioStream;->lambda$notifySilenced$0(Landroidx/camera/video/internal/audio/AudioStream$AudioStreamCallback;)V

    return-void
.end method
