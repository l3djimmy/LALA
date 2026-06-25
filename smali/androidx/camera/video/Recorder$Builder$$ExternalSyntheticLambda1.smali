.class public final synthetic Landroidx/camera/video/Recorder$Builder$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/core/util/Consumer;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/camera/video/Recorder$Builder;"
    method = "lambda$setAudioSource$3"
    proto = "(ILandroidx/camera/video/AudioSpec$Builder;)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Landroidx/camera/video/Recorder$Builder$$ExternalSyntheticLambda1;->f$0:I

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    .line 0
    iget v0, p0, Landroidx/camera/video/Recorder$Builder$$ExternalSyntheticLambda1;->f$0:I

    check-cast p1, Landroidx/camera/video/AudioSpec$Builder;

    invoke-static {v0, p1}, Landroidx/camera/video/Recorder$Builder;->lambda$setAudioSource$3(ILandroidx/camera/video/AudioSpec$Builder;)V

    return-void
.end method
